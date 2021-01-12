using PGMActas_V2.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PGMActas_V2.DataAccess
{
    public class OrdenanzaAD
    {
        public static List<Ordenanza> obtenerListaOrdenanzas()
        {
            List<Ordenanza> listaOrdenanzas = new List<Ordenanza>();
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                SqlCommand command = new SqlCommand();
                string selectOrdenanza = "SELECT * " +
                    " FROM Ordenanzas;";
                command.Parameters.Clear();
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = selectOrdenanza;
                conexion.Open();
                command.Connection = conexion;
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader != null)
                {
                    while (dataReader.Read())
                    {
                        Ordenanza ord = new Ordenanza();
                        ord.codigo_ordenanza = int.Parse(dataReader["codigo_ordenanza"].ToString());
                        ord.nomenclatura = dataReader["nomenclatura"].ToString();
                        ord.descripcion = dataReader["descripcion"].ToString();
                        ord.estado = bool.Parse(dataReader["estado"].ToString());
                        ord.calificacion = dataReader["calificacion"].ToString();
                        listaOrdenanzas.Add(ord);
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

            return listaOrdenanzas;
        }

    }
}