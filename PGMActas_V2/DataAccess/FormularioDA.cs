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
        public bool guardarActa(DatosFormulario datosFormulario)
        {
            bool resultado = true;
            int idAutomotor = Convert.ToInt32(datosFormulario.automotorID_form);
            if (idAutomotor != 0) {
                var tipoVehiculo = Convert.ToInt32(datosFormulario.tipoVehiculo_form);
                Automotor automotor = new Automotor(0,datosFormulario.automotorID_form, tipoVehiculo, datosFormulario.modelo_vehiculo,datosFormulario.colorVehiculo_form);
                idAutomotor = guardarAutomotor(automotor);
            }
            List<int> infracciones = new List<int>();
            datosFormulario.infracciones.ForEach(elem => {
                var infraccionId = Convert.ToInt32(elem.form_codigo_infraccion);
                infracciones.Add(infraccionId);
            });
            
            int numeroActa = Convert.ToInt32(datosFormulario.numeroActa_form);
            guardarInfracciones(infracciones, numeroActa);
            List<Persona> titulares = new List<Persona>();
            datosFormulario.titulares.ForEach(elem => {
                elem.ForEach(elemento =>{
                    var titular = new Persona();
                    var localidad = new LocalidadItemVM();
                    var tipoDoc = new TipoDocumentoItemVM();
                    tipoDoc.id_tipo_documento = Convert.ToInt32(elemento.form_tipo_documento);
                    localidad.id_localidad = Convert.ToInt32(elemento.form_localidad);
                    titular.id_persona = Convert.ToInt32(elemento.form_id_persona);
                    titular.nombre = elemento.form_nombre;
                    titular.apellido = elemento.form_apellido;
                    titular.numero_documento = Convert.ToInt32(elemento.form_numero_documento);
                    titular.direccion = elemento.inputFormDomicilio;
                    titular.codigo_postal = Convert.ToInt32(elemento.inputFormCodigoPostal);
                    titulares.Add(titular);

                });
            });
            guardarTitular(titulares, idAutomotor);
            List<Persona> infractores = new List<Persona>();
            datosFormulario.infractores.ForEach(elem => {
                elem.ForEach(elemento => {
                    var titular = new Persona();
                    var localidad = new LocalidadItemVM();
                    var tipoDoc = new TipoDocumentoItemVM();
                    tipoDoc.id_tipo_documento = Convert.ToInt32(elemento.form_tipo_documento);
                    localidad.id_localidad = Convert.ToInt32(elemento.form_localidad);
                    titular.id_persona = Convert.ToInt32(elemento.form_id_persona);
                    titular.nombre = elemento.form_nombre;
                    titular.apellido = elemento.form_apellido;
                    titular.numero_documento = Convert.ToInt32(elemento.form_numero_documento);
                    titular.direccion = elemento.inputFormDomicilio;
                    titular.codigo_postal = Convert.ToInt32(elemento.inputFormCodigoPostal);
                    titulares.Add(titular);

                });
            });
            guardarInfractor(infractores, numeroActa);
            Acta acta = new Acta();
            var inspector = new Inspector();
            var operador = new Operador();
            var tipoVehiculo = Convert.ToInt32(datosFormulario.tipoVehiculo_form);
            var automotorForm = new Automotor(0, datosFormulario.automotorID_form, tipoVehiculo, datosFormulario.modelo_vehiculo, datosFormulario.colorVehiculo_form);

            operador.id_operador = 1;
            inspector.id_inspector = 1;
            acta.numero_acta = Convert.ToInt32(datosFormulario.numeroActa_form);
            acta.inspector = inspector;
            acta.ip_carga = "192.168.789";
            acta.operador = operador;
            acta.fecha_carga = "";
            acta.hora_carga = "";
            acta.fecha_acta = datosFormulario.fechaInf_form;
            acta.hora_acta = "";
            acta.observaciones = datosFormulario.observacionesInf_form;
            acta.retuvo_licencia = true;
            acta.retuvo_vehiculo = true;
            acta.automotor = automotorForm;

            resultado = registrarActa(acta);

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
                    " (@id_inspector, @ip_carga, @id_operador, @fecha_carga, @hora_carga, @fecha_acta, @hora_acta, @observaciones, @retuvo_licencia, " +
                    " @retuvo_vehiculo, @id_automotor);";
                command.Parameters.Clear();
                command.Parameters.AddWithValue("@id_inspector",acta.inspector.id_inspector);
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

                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = insertAutomotor;
                conexion.Open();
                command.Connection = conexion;
                command.ExecuteNonQuery();
                resultado = true;
            }
            catch (Exception)
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
                command.ExecuteNonQuery();
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = insertAutomotor;
                conexion.Open();
                command.Connection = conexion;
                command.ExecuteNonQuery();
                idAutomotor = Convert.ToInt32(command.Parameters["@ID"].Value);
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                conexion.Close();
            }
            return idAutomotor;
        }

        public static bool guardarTitular(List<Persona> listadoPersonasTitulares, int idAutmotor)
        {
            bool resultado = true;
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);
            try
            {
                foreach (var personaTitular in listadoPersonasTitulares)
                {
                    
                    if (personaTitular.id_persona == 0)
                    {
                        SqlCommand command = new SqlCommand();
                        string insertPersona = "INSERT INTO Personas " +
                            " VALUES " +
                            " (@nombre, @apellido, @id_tipo_documento, @numero_documento, @id_localidad, @direccion, @codigo_postal)SET @ID = SCOPE_IDENTITY();";
                        command.Parameters.Clear();
                        command.Parameters.AddWithValue("@nombre", personaTitular.nombre);
                        command.Parameters.AddWithValue("@apellido", personaTitular.apellido);
                        command.Parameters.AddWithValue("@id_tipo_documento", personaTitular.tipoDocumento.id_tipo_documento);
                        command.Parameters.AddWithValue("@numero_documento", personaTitular.numero_documento);
                        command.Parameters.AddWithValue("@id_localidad", personaTitular.localidad.id_localidad);
                        command.Parameters.AddWithValue("@direccion", personaTitular.direccion);
                        command.Parameters.AddWithValue("@codigo_postal", personaTitular.codigo_postal);
                        command.Parameters.Add("@ID", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
                        command.CommandType = System.Data.CommandType.Text;
                        command.CommandText = insertPersona;
                        conexion.Open();
                        command.Connection = conexion;
                        command.ExecuteNonQuery();
                        personaTitular.id_persona = Convert.ToInt32(command.Parameters["@ID"].Value);

                    }
                    SqlCommand command2 = new SqlCommand();
                    string insertPersonaxAutomotor = "INSERT INTO AutomotoresxPersonas " +
                        " VALUES " +
                        " (@id_automotor, @id_persona, @id_responsabilidad_legal);";
                    command2.Parameters.Clear();
                    command2.Parameters.AddWithValue("@id_automotor", idAutmotor);
                    command2.Parameters.AddWithValue("@id_persona", personaTitular.id_persona);
                    command2.Parameters.AddWithValue("@id_responsabilidad_legal", personaTitular.idResponsabilidadLegal);
                    command2.CommandType = System.Data.CommandType.Text;
                    command2.CommandText = insertPersonaxAutomotor;
                    conexion.Open();
                    command2.Connection = conexion;
                    command2.ExecuteNonQuery();


                }

            }
            catch (Exception)
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
        public static bool guardarInfractor(List<Persona> listadoPersonasInfractores, int numeroActa)
        {
            bool resultado = false;
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);
            try
            {
                foreach (var personaInfractor in listadoPersonasInfractores)
                {
                    if (personaInfractor.id_persona == 0)
                    {
                        SqlCommand command2 = new SqlCommand();
                        string insertPersona = "INSERT INTO Personas " +
                            " VALUES " +
                            " (@nombre, @apellido, @id_tipo_documento, @numero_documento, @id_localidad, @direccion, @codigo_postal)SET @ID = SCOPE_IDENTITY();";
                        command2.Parameters.Clear();
                        command2.Parameters.AddWithValue("@nombre", personaInfractor.nombre);
                        command2.Parameters.AddWithValue("@apellido", personaInfractor.apellido);
                        command2.Parameters.AddWithValue("@id_tipo_documento", personaInfractor.tipoDocumento.id_tipo_documento);
                        command2.Parameters.AddWithValue("@numero_documento", personaInfractor.numero_documento);
                        command2.Parameters.AddWithValue("@id_localidad", personaInfractor.localidad.id_localidad);
                        command2.Parameters.AddWithValue("@direccion", personaInfractor.direccion);
                        command2.Parameters.AddWithValue("@codigo_postal", personaInfractor.codigo_postal);
                        command2.Parameters.Add("@ID", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
                        command2.CommandType = System.Data.CommandType.Text;
                        command2.CommandText = insertPersona;
                        conexion.Open();
                        command2.Connection = conexion;
                        command2.ExecuteNonQuery();
                        personaInfractor.id_persona = Convert.ToInt32(command2.Parameters["@ID"].Value);
                    }

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
                    conexion.Open();
                    command.Connection = conexion;
                    command.ExecuteNonQuery();

                }

            }
            catch (Exception)
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

        public static bool guardarInfracciones(List<int> codigosInfraccion, int numeroActa)
        {
            bool resultado = true;
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);
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
                    conexion.Open();
                    command.Connection = conexion;
                    command.ExecuteNonQuery();
                }

            }
            catch (Exception)
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