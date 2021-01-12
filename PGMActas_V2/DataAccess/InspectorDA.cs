using PGMActas_V2.Models;
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
                string selectInspector = "SELECT i.id_inspector, p.nombre +' ' + p.apellido AS 'Nombre', i.habilitado" +
                    " FROM Inspectores i " +
                    " JOIN Personas p " +
                    " ON p.id_persona=i.id_persona;";
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
                        inspector.id_inspector = int.Parse(dataReader["id_inspector"].ToString());
                        inspector.persona.nombre = dataReader["nombre"].ToString();
                        //inspector.persona.apellido = dataReader["apellido"].ToString();
                        inspector.habilitado = bool.Parse(dataReader["habilitado"].ToString());
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

    }
}