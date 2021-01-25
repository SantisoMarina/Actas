using PGMActas_V2.Models;
using PGMActas_V2.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PGMActas_V2.DataAccess
{
    public class InspectorDA
    {

        public static List<Inspector> obtenerListaInspectores()
        {
            List<Inspector> listaInspectores = new List<Inspector>();
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                SqlCommand command = new SqlCommand();
                string selectInspector = "SELECT * " +
                    " FROM Inspectores i " +
                    " JOIN Personas p " +
                    " ON p.id_persona=i.id_persona " +
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
                command.CommandText = selectInspector;
                conexion.Open();
                command.Connection = conexion;
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader != null)
                {
                    while (dataReader.Read())
                    {
                        Inspector inspector = new Inspector();
                        Persona persona = new Persona();
                        TipoDocumentoItemVM td = new TipoDocumentoItemVM();
                        LocalidadItemVM localidad = new LocalidadItemVM();
                        ProvinciaItemVM provincia = new ProvinciaItemVM();
                        PaisItemVM pais = new PaisItemVM();
                        persona.id_persona = int.Parse(dataReader["id_persona"].ToString());
                        persona.nombre = dataReader["nombre"].ToString();
                        persona.apellido = dataReader["apellido"].ToString();
                        persona.numero_documento = int.Parse(dataReader["numero_documento"].ToString());
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
                        inspector.persona = persona;
                        inspector.matricula = dataReader["matricula"].ToString();
                        inspector.rango_comienzo_acta = int.Parse(dataReader["rango_comienzo_acta"].ToString());
                        inspector.rango_fin_acta = int.Parse(dataReader["rango_fin_acta"].ToString());
                        inspector.habilitado = bool.Parse(dataReader["habilitado"].ToString());
                        inspector.id_inspector = int.Parse(dataReader["id_inspector"].ToString());
                        listaInspectores.Add(inspector);
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

            return listaInspectores;
        }


        public static int obtenerRangoComienzoInspector(int id_inspector)
        {
            int rangoC = 0;
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                SqlCommand command = new SqlCommand();
                string selectPersona = "SELECT * " +
                    " FROM Inspectores i " +
                    " WHERE i.id_inspector = @id_inspector;";
                command.Parameters.Clear();
                command.Parameters.AddWithValue("@id_inspector", id_inspector);
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = selectPersona;
                conexion.Open();
                command.Connection = conexion;
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader != null)
                {
                    while (dataReader.Read())
                    {
                        rangoC = int.Parse(dataReader["rango_comienzo_acta"].ToString());
                    }
                }
            }

            catch (Exception)
            {

                throw;
            }
            finally
            {
                conexion.Close();
            }

            return rangoC;
        }

        public static int obtenerRangoFinInspector(int id_inspector)
        {
            int rangoF = 0;
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                SqlCommand command = new SqlCommand();
                string selectPersona = "SELECT * " +
                    " FROM Inspectores i " +
                    " WHERE i.id_inspector = @id_inspector;";
                command.Parameters.Clear();
                command.Parameters.AddWithValue("@id_inspector", id_inspector);
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = selectPersona;
                conexion.Open();
                command.Connection = conexion;
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader != null)
                {
                    while (dataReader.Read())
                    {

                        rangoF = int.Parse(dataReader["rango_fin_acta"].ToString());

                    }
                }
            }

            catch (Exception)
            {

                throw;
            }
            finally
            {
                conexion.Close();
            }

            return rangoF;
        }

    }
}