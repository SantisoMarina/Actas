using PGMActas_V2.Models;
using PGMActas_V2.ViewModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PGMActas_V2.DataAccess
{
    public class FormularioDA
    {
        public static bool guardarActa(DatosFormulario datosFormulario)
        {
            bool resultado = true;
            try
            {


                //Guardado del vehiculo
                int idAutomotor = Convert.ToInt32(datosFormulario.id_automotor_form);
                if (idAutomotor == 0)
                {
                    var tipoVehiculoP = Convert.ToInt32(datosFormulario.tipoVehiculo_form);
                    Automotor automotor = new Automotor(0, datosFormulario.automotorID_form, tipoVehiculoP, datosFormulario.modeloVehiculo_form, datosFormulario.colorVehiculo_form);
                    idAutomotor = guardarAutomotor(automotor);
                }
                //Guardado del acta
                Acta acta = new Acta();
                var inspector = new Inspector();
                var operador = new Operador();
                var tipoVehiculo = Convert.ToInt32(datosFormulario.tipoVehiculo_form);
                var automotorForm = new Automotor(idAutomotor, datosFormulario.automotorID_form, tipoVehiculo, datosFormulario.modeloVehiculo_form, datosFormulario.colorVehiculo_form);

                operador.id_operador = 1;
                inspector.id_inspector = Convert.ToInt32(datosFormulario.inspector_form);
                acta.numero_acta = Convert.ToInt32(datosFormulario.numeroActa_form);
                acta.inspector = inspector;
                acta.ip_carga = "192.168.789";//TODO obtener ip
                acta.operador = operador;
                acta.fecha_carga = datosFormulario.fechaCarga_form;
                acta.hora_carga = datosFormulario.horaCarga_form;
                acta.fecha_acta = datosFormulario.fechaInf_form;
                acta.hora_acta = datosFormulario.horaInf_form;
                acta.observaciones = datosFormulario.observacionesInf_form;
                acta.retuvo_licencia = datosFormulario.retuvoLicencia_form == 1 ? true:false;
                acta.retuvo_vehiculo = datosFormulario.retuvoVehiculo_form == 1 ? true : false;
                acta.id_localidad = 1; //capital
                acta.direccion = datosFormulario.direccionInf_form;
                acta.codigo_postal = Convert.ToInt32(datosFormulario.codigoPostalInf_form); ;
                acta.automotor = automotorForm;


                resultado = registrarActa(acta);

                //Guardado de infracciones
                List<int> infracciones = new List<int>();
                datosFormulario.infracciones.ForEach(elem =>
                {
                    var infraccionId = Convert.ToInt32(elem.form_codigo_infraccion);
                    infracciones.Add(infraccionId);
                });

                int numeroActa = Convert.ToInt32(datosFormulario.numeroActa_form);
                guardarInfracciones(infracciones, numeroActa);

                //Guardar de titulares
                List<Persona> titulares = new List<Persona>();
                datosFormulario.titulares.ForEach(elem =>
                {
                    Console.WriteLine("Entro Tit");
                    Console.WriteLine(elem);
                    elem.ForEach(elemento =>
                    {
                        Console.WriteLine("Entro Tit");
                        Console.WriteLine(elemento);
                        var titular = new Persona();
                        var localidad = new LocalidadItemVM();
                        var tipoDoc = new TipoDocumentoItemVM();
                        var tipoDocumento = Convert.ToInt32(elemento.form_tipo_documento);
                        var domicilio = "";
                        if (elemento.form_domicilio != null)
                        {
                            domicilio = elemento.form_domicilio;
                        }
                        tipoDoc.id_tipo_documento = tipoDocumento; //TODO agregar campo tipo documento
                        localidad.id_localidad = 1;
                        titular.id_persona = Convert.ToInt32(elemento.form_id_persona);
                        titular.nombre = elemento.form_nombre;
                        titular.apellido = elemento.form_apellido;
                        titular.numero_documento = elemento.form_numero_documento;
                        titular.direccion = domicilio;
                        titular.codigo_postal = 0;
                        titular.tipoDocumento = tipoDoc;
                        titular.localidad = localidad;
                        titular.idResponsabilidadLegal = 1;
                        titular.infractor = false;
                        titulares.Add(titular);


                    });
                });

                List<Persona> infractores = new List<Persona>();
                datosFormulario.infractores.ForEach(elem =>
                {
                    Console.WriteLine("Entro Inf");
                    Console.WriteLine(elem);
                    elem.ForEach(elemento =>
                    {
                        Console.WriteLine("Entro Inf");
                        Console.WriteLine(elemento);
                        var infractor = new Persona();
                        var localidad = new LocalidadItemVM();
                        var tipoDoc = new TipoDocumentoItemVM();
                        var domicilio = "";
                        if (elemento.form_domicilio != null)
                        {
                            domicilio = elemento.form_domicilio;
                        }
                        tipoDoc.id_tipo_documento = 1;
                        localidad.id_localidad = Convert.ToInt32(elemento.form_localidad) == 0 ? 1 : Convert.ToInt32(elemento.form_localidad);
                        infractor.id_persona = Convert.ToInt32(elemento.form_id_persona);
                        infractor.nombre = elemento.form_nombre;
                        infractor.apellido = elemento.form_apellido;
                        infractor.numero_documento = elemento.form_numero_documento;
                        infractor.direccion = domicilio;
                        infractor.codigo_postal = elemento.form_codigo_postal != null ? Convert.ToInt32(elemento.form_codigo_postal) : 0;
                        infractor.idResponsabilidadLegal = Convert.ToInt32(elemento.form_responsabilidad);
                        infractor.localidad = localidad;
                        infractor.tipoDocumento = tipoDoc;
                        infractor.infractor = true;
                        infractores.Add(infractor);

                    });
                });
                List<Persona> personas = new List<Persona>();
                personas.AddRange(infractores);
                personas.AddRange(titulares);
                var personasNR = personas.GroupBy(i => i.numero_documento)
                                        .Select(g => {
                                            var personND = g.First();
                                            if (g.Count()>1) {
                                                personND.variasResp = true;
                                                personND.resposabilidadesLegales = g.Where(y => y.idResponsabilidadLegal!=1).Select(x => x.idResponsabilidadLegal).ToList();
                                            }
                                            return personND;
                                        })
                                        .ToList();

                guardarPersona(personasNR, numeroActa,idAutomotor);

            }
            catch (Exception e)
            {
                resultado = false;

            }

            return resultado;
        }

        public static bool registrarActa(Acta acta)
        {
            bool resultado = false;
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);
            try
            {
                SqlCommand command = new SqlCommand();
                string insertAutomotor = "INSERT INTO Actas " +
                    " VALUES " +
                    " (@numero_acta, @id_inspector, @ip_carga, @id_operador, @fecha_carga, @hora_carga, @fecha_acta, @hora_acta, @observaciones, @retuvo_licencia, " +
                    " @retuvo_vehiculo, @id_automotor, @direccion_infraccion, @codigo_postal_infraccion, @id_localidad);";
                command.Parameters.Clear();
                command.Parameters.AddWithValue("@numero_acta", acta.numero_acta);
                command.Parameters.AddWithValue("@id_inspector", acta.inspector.id_inspector);
                command.Parameters.AddWithValue("@ip_carga", acta.ip_carga);
                command.Parameters.AddWithValue("@id_operador", acta.operador.id_operador);
                command.Parameters.AddWithValue("@fecha_carga", acta.fecha_carga);
                command.Parameters.AddWithValue("@hora_carga", acta.hora_carga);
                command.Parameters.AddWithValue("@fecha_acta", acta.fecha_acta);
                command.Parameters.AddWithValue("@hora_acta", acta.hora_acta);
                command.Parameters.AddWithValue("@observaciones", acta.observaciones);
                command.Parameters.AddWithValue("@retuvo_licencia", acta.retuvo_licencia);
                command.Parameters.AddWithValue("@retuvo_vehiculo", acta.retuvo_vehiculo);
                command.Parameters.AddWithValue("@id_automotor", acta.automotor.id_automotor);
                command.Parameters.AddWithValue("@direccion_infraccion", acta.direccion);
                command.Parameters.AddWithValue("@codigo_postal_infraccion", acta.codigo_postal);
                command.Parameters.AddWithValue("@id_localidad", acta.id_localidad);
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = insertAutomotor;
                conexion.Open();
                command.Connection = conexion;
                command.ExecuteNonQuery();
                resultado = true;
            }
            catch (Exception e)
            {

                throw;
            }
            finally
            {
                conexion.Close();
            }
            return resultado;
        }
        public static int guardarAutomotor(Automotor automotor)
        {
            int idAutomotor = 0;
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);
            try
            {
                SqlCommand command = new SqlCommand();
                string insertAutomotor = "INSERT INTO Automotores " +
                    " VALUES " +
                    " (@numero_dominio, @id_marca_tipo_vehiculo, @modelo, @color) SET @ID = SCOPE_IDENTITY();";
                command.Parameters.Clear();
                command.Parameters.AddWithValue("@numero_dominio", automotor.numero_dominio);
                command.Parameters.AddWithValue("@id_marca_tipo_vehiculo", automotor.id_marca_tipo_vehiculo);
                command.Parameters.AddWithValue("@modelo", automotor.modelo);
                command.Parameters.AddWithValue("@color", automotor.color);
                command.Parameters.Add("@ID", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = insertAutomotor;
                conexion.Open();
                command.Connection = conexion;
                command.ExecuteNonQuery();
                idAutomotor = Convert.ToInt32(command.Parameters["@ID"].Value);
            }
            catch (Exception e)
            {
                throw;

            }
            finally
            {
                conexion.Close();
            }
            return idAutomotor;
        }

        
        public static bool guardarPersona(List<Persona> listadoPersonas, int numeroActa, int idAutomotor)
        {
            bool resultado = false;
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);
            conexion.Open();
            try
            {
                foreach (var persona in listadoPersonas)
                {
                    if (persona.id_persona == 0)
                    {
                        SqlCommand command2 = new SqlCommand();
                        string insertPersona = "INSERT INTO Personas " +
                            " VALUES " +
                            " (@nombre, @apellido, @id_tipo_documento, @numero_documento, @id_localidad, @direccion, @codigo_postal)SET @ID = SCOPE_IDENTITY();";
                        command2.Parameters.Clear();
                        command2.Parameters.AddWithValue("@nombre", persona.nombre);
                        command2.Parameters.AddWithValue("@apellido", persona.apellido);
                        command2.Parameters.AddWithValue("@id_tipo_documento", persona.tipoDocumento.id_tipo_documento);
                        command2.Parameters.AddWithValue("@numero_documento", persona.numero_documento);
                        command2.Parameters.AddWithValue("@id_localidad", persona.localidad.id_localidad);
                        command2.Parameters.AddWithValue("@direccion", persona.direccion);
                        command2.Parameters.AddWithValue("@codigo_postal", persona.codigo_postal);
                        command2.Parameters.Add("@ID", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
                        command2.CommandType = System.Data.CommandType.Text;
                        command2.CommandText = insertPersona;
                        command2.Connection = conexion;
                        command2.ExecuteNonQuery();
                        persona.id_persona = Convert.ToInt32(command2.Parameters["@ID"].Value);
                    }
                    if (persona.variasResp) {
                        guardarInfraccionActa(persona, numeroActa);
                        guardarTitularesAutomotor(persona, idAutomotor);
                    }
                    else if (persona.infractor)
                    {
                        guardarInfraccionActa(persona, numeroActa);
                    }
                    else {
                        guardarTitularesAutomotor(persona, idAutomotor);
                    }
                    

                }

            }
            catch (Exception e)
            {
                resultado = false;
                throw;
            }
            finally
            {
                conexion.Close();
            }
            return resultado;
        }

        public static bool guardarInfraccionActa(Persona personaInfractor, int numeroActa)
        {
            bool resultado = false;
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);
            conexion.Open();
            try
            {
                if (personaInfractor.variasResp)
                {
                    foreach (var responsabilidad in personaInfractor.resposabilidadesLegales)
                    {
                        SqlCommand command = new SqlCommand();
                        string insertPersonaxActa = "INSERT INTO PersonaInfraccionxActa " +
                            " VALUES " +
                            " (@id_persona, @numero_acta, @id_responsabilidad_legal);";
                        command.Parameters.Clear();
                        command.Parameters.AddWithValue("@id_persona", personaInfractor.id_persona);
                        command.Parameters.AddWithValue("@numero_acta", numeroActa);
                        command.Parameters.AddWithValue("@id_responsabilidad_legal", responsabilidad);

                        command.CommandType = System.Data.CommandType.Text;
                        command.CommandText = insertPersonaxActa;
                        command.Connection = conexion;
                        command.ExecuteNonQuery();
                    }
                }
                else {
                    SqlCommand command = new SqlCommand();
                    string insertPersonaxActa = "INSERT INTO PersonaInfraccionxActa " +
                        " VALUES " +
                        " (@id_persona, @numero_acta, @id_responsabilidad_legal);";
                    command.Parameters.Clear();
                    command.Parameters.AddWithValue("@id_persona", personaInfractor.id_persona);
                    command.Parameters.AddWithValue("@numero_acta", numeroActa);
                    command.Parameters.AddWithValue("@id_responsabilidad_legal", personaInfractor.idResponsabilidadLegal);

                    command.CommandType = System.Data.CommandType.Text;
                    command.CommandText = insertPersonaxActa;
                    command.Connection = conexion;
                    command.ExecuteNonQuery();
                }
                
                    

            }
            catch (Exception e)
            {
                resultado = false;
            }
            finally
            {
                conexion.Close();
            }
            return resultado;
        }

        public static bool guardarTitularesAutomotor(Persona personaInfractor, int idAutomor)
        {
            bool resultado = false;
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);
            conexion.Open();
            try
            {
                SqlCommand command = new SqlCommand();
                string insertPersonaxActa = "INSERT INTO AutomotoresxPersonas " +
                    " VALUES " +
                    " (@id_automotor, @id_persona, @id_responsabilidad_legal);";
                command.Parameters.Clear();
                command.Parameters.AddWithValue("@id_automotor", idAutomor);
                command.Parameters.AddWithValue("@id_persona", personaInfractor.id_persona);
                command.Parameters.AddWithValue("@id_responsabilidad_legal", 1);

                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = insertPersonaxActa;
                command.Connection = conexion;
                command.ExecuteNonQuery();

            }
            catch (Exception e)
            {
                resultado = false;
            }
            finally
            {
                conexion.Close();
            }
            return resultado;
        }





        public static bool guardarInfracciones(List<int> codigosInfraccion, int numeroActa)
        {
            bool resultado = true;
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);
            conexion.Open();
            try
            {
                foreach (var codigo in codigosInfraccion)
                {
                    SqlCommand command = new SqlCommand();
                    string insertInfraccion = "INSERT INTO InfraccionesxActas " +
                        " VALUES " +
                        " (@numero_acta, @codigo_infraccion);";
                    command.Parameters.Clear();
                    command.Parameters.AddWithValue("@numero_acta", numeroActa);
                    command.Parameters.AddWithValue("@codigo_infraccion", codigo);
                    command.CommandType = System.Data.CommandType.Text;
                    command.CommandText = insertInfraccion;
                    command.Connection = conexion;
                    command.ExecuteNonQuery();
                }

            }
            catch (Exception e)
            {
                resultado = false;
                throw;
            }
            finally
            {
                conexion.Close();
            }
            return resultado;
        }


    }



}