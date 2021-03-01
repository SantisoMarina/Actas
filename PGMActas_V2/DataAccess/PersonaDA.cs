using PGMActas_V2.Models;
using PGMActas_V2.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PGMActas_V2.DataAccess
{
    public class PersonaDA
    {
        public static List<Persona> obtenerListaPersonas()
        {
            List<Persona> listaPersonas = new List<Persona>();
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                SqlCommand command = new SqlCommand();
                string selectPersonas = "SELECT * FROM Personas p " +
                    "JOIN Tipos_documentos td " +
                    "ON p.id_tipo_documento = td.id_tipo_documento " +
                    "JOIN Localidades loc " +
                    "ON loc.id_localidad = p.id_localidad " +
                    "JOIN Provincias pr " +
                    "ON pr.id_provincia = loc.id_provincia " +
                    "JOIN Paises Pa " +
                    "ON pa.id_pais = pr.id_pais;";
                command.Parameters.Clear();
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = selectPersonas;
                conexion.Open();
                command.Connection = conexion;
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader != null)
                {
                    while (dataReader.Read())
                    {
                        Persona persona = new Persona();
                        TipoDocumentoItemVM td = new TipoDocumentoItemVM();
                        LocalidadItemVM localidad = new LocalidadItemVM();
                        ProvinciaItemVM provincia = new ProvinciaItemVM();
                        PaisItemVM pais = new PaisItemVM();
                        persona.id_persona = int.Parse(dataReader["id_persona"].ToString());
                        persona.nombre = dataReader["nombre"].ToString();
                        persona.apellido = dataReader["apellido"].ToString();
                        persona.numero_documento = dataReader["numero_documento"].ToString();
                        persona.direccion = dataReader["direccion"].ToString();
                        persona.codigo_postal = int.Parse(dataReader["codigo_postal"].ToString());
                        td.id_tipo_documento = int.Parse(dataReader["id_tipo_documento"].ToString());
                        td.tipo_documento = dataReader["tipo_documento"].ToString();
                        localidad.id_localidad = int.Parse(dataReader["id_localidad"].ToString());
                        localidad.localidad = dataReader["localidad"].ToString();
                        provincia.id_provincia = int.Parse(dataReader["id_provincia"].ToString());
                        provincia.provincia = dataReader["provincia"].ToString();
                        pais.id_pais = int.Parse(dataReader["id_pais"].ToString());
                        pais.pais = dataReader["pais"].ToString();
                        localidad.provincia = provincia;
                        provincia.pais = pais;
                        persona.tipoDocumento = td;
                        persona.localidad = localidad;
                        listaPersonas.Add(persona);
                    }
                }
            }
            catch (Exception e)
            {

            }
            finally
            {
                conexion.Close();
            }

            return listaPersonas;
        }
        public static String[] obtenerPersonaInfractor(int numero_acta)
        {
            String[] datosInfractor = new String[4];
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                SqlCommand command = new SqlCommand();
                string selectPersonas = "SELECT p.nombre + ' ' + p.apellido AS 'nombreCompleto', p.direccion + ' ' + loc.localidad AS 'direccionCompleta'," +
                    " td.tipo_documento, p.numero_documento" +
                    " FROM Personas p " +
                    "JOIN Tipos_documentos td " +
                    "ON p.id_tipo_documento = td.id_tipo_documento " +
                    "JOIN Localidades loc " +
                    "ON loc.id_localidad = p.id_localidad " +
                    "JOIN PersonaInfraccionxActa pia " +
                    "ON pia.id_persona = p.id_persona " +
                    "WHERE pia.numero_acta = @numero_acta " +
                    "AND pia.id_responsabilidad_legal=2;";
                command.Parameters.Clear();
                command.Parameters.AddWithValue("@numero_acta", numero_acta);
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = selectPersonas;
                conexion.Open();
                command.Connection = conexion;
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader != null)
                {
                    while (dataReader.Read())
                    {
                        datosInfractor[0] = dataReader["nombreCompleto"].ToString();


                        datosInfractor[1] = dataReader["direccionCompleta"].ToString();
                        datosInfractor[2] = dataReader["tipo_documento"].ToString();
                        datosInfractor[3] = dataReader["numero_documento"].ToString();

                    }
                }
            }
            catch (Exception e)
            {

            }
            finally
            {
                conexion.Close();
            }

            return datosInfractor;
        }


        public static List<TipoDocumentoItemVM> obtenerTiposDocumentos()
        {
            List<TipoDocumentoItemVM> listaTiposDocumentos = new List<TipoDocumentoItemVM>();
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                SqlCommand command = new SqlCommand();
                string selectTiposDocumentos = "SELECT *" +
                    " FROM Tipos_Documentos;";
                command.Parameters.Clear();
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = selectTiposDocumentos;
                conexion.Open();
                command.Connection = conexion;
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader != null)
                {
                    while (dataReader.Read())
                    {
                        TipoDocumentoItemVM td = new TipoDocumentoItemVM();
                        td.id_tipo_documento = int.Parse(dataReader["id_tipo_documento"].ToString());
                        td.tipo_documento = dataReader["tipo_documento"].ToString();
                        listaTiposDocumentos.Add(td);
                    }
                }
            }

            catch (Exception)
            {

            }
            finally
            {
                conexion.Close();
            }

            return listaTiposDocumentos;
        }

        public static List<PaisItemVM> obtenerPaises()
        {
            List<PaisItemVM> listaPaises = new List<PaisItemVM>();
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                SqlCommand command = new SqlCommand();
                string selectPaises = "SELECT *" +
                    " FROM Paises;";
                command.Parameters.Clear();
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = selectPaises;
                conexion.Open();
                command.Connection = conexion;
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader != null)
                {
                    while (dataReader.Read())
                    {
                        PaisItemVM p = new PaisItemVM();
                        p.id_pais = int.Parse(dataReader["id_pais"].ToString());
                        p.pais = dataReader["pais"].ToString();
                        listaPaises.Add(p);
                    }
                }
            }

            catch (Exception)
            {

            }
            finally
            {
                conexion.Close();
            }

            return listaPaises;
        }


        public static List<ProvinciaItemVM> obtenerProvincias()
        {
            List<ProvinciaItemVM> listaProvincias = new List<ProvinciaItemVM>();
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                SqlCommand command = new SqlCommand();
                string selectProvincias = "SELECT *" +
                    " FROM Provincias;";
                command.Parameters.Clear();
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = selectProvincias;
                conexion.Open();
                command.Connection = conexion;
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader != null)
                {
                    while (dataReader.Read())
                    {
                        ProvinciaItemVM pr = new ProvinciaItemVM();
                        pr.id_provincia = int.Parse(dataReader["id_provincia"].ToString());
                        pr.provincia = dataReader["provincia"].ToString();
                        listaProvincias.Add(pr);
                    }
                }
            }

            catch (Exception)
            {

            }
            finally
            {
                conexion.Close();
            }

            return listaProvincias;
        }

        public static List<LocalidadItemVM> obtenerLocalidades()
        {
            List<LocalidadItemVM> listaLocalidades = new List<LocalidadItemVM>();
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                SqlCommand command = new SqlCommand();
                string selectLocalidades = "SELECT *" +
                    " FROM Localidades;";
                command.Parameters.Clear();
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = selectLocalidades;
                conexion.Open();
                command.Connection = conexion;
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader != null)
                {
                    while (dataReader.Read())
                    {
                        LocalidadItemVM l = new LocalidadItemVM();
                        l.id_localidad = int.Parse(dataReader["id_localidad"].ToString());
                        l.localidad = dataReader["localidad"].ToString();
                        listaLocalidades.Add(l);
                    }
                }
            }

            catch (Exception)
            {

            }
            finally
            {
                conexion.Close();
            }

            return listaLocalidades;
        }

        public static List<ResponsabilidadLegalItemVM> obtenerResponsabilidadesLegales()
        {
            List<ResponsabilidadLegalItemVM> listaResponsabilidadLegal = new List<ResponsabilidadLegalItemVM>();
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                SqlCommand command = new SqlCommand();
                string selectResponsabilidadesLegales = "SELECT *" +
                    " FROM Responsabilidades_Legales;";
                command.Parameters.Clear();
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = selectResponsabilidadesLegales;
                conexion.Open();
                command.Connection = conexion;
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader != null)
                {
                    while (dataReader.Read())
                    {
                        ResponsabilidadLegalItemVM rl = new ResponsabilidadLegalItemVM();
                        rl.id_responsabilidad_legal = int.Parse(dataReader["id_responsabilidad_legal"].ToString());
                        rl.responsabilidad_legal = dataReader["responsabilidad_legal"].ToString();
                        listaResponsabilidadLegal.Add(rl);
                    }
                }
            }

            catch (Exception)
            {

            }
            finally
            {
                conexion.Close();
            }

            return listaResponsabilidadLegal;
        }

        public static bool obtenerNumeroDocumento(string numero_documento)
        {
            bool resultado = false;
            Persona persona = new Persona();
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                SqlCommand command = new SqlCommand();
                string selectActa = "SELECT p.numero_documento" +
                    " FROM Personas p " +
                    " WHERE p.numero_documento = @numero_documento;";
                command.Parameters.Clear();
                command.Parameters.AddWithValue("@numero_documento", numero_documento);
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = selectActa;
                conexion.Open();
                command.Connection = conexion;
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader != null)
                {
                    while (dataReader.Read())
                    {
                        persona.numero_documento = dataReader["numero_documento"].ToString();
                        resultado = true;

                    }
                }
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



    }

}