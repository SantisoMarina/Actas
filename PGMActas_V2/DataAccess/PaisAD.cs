using PGMActas_V2.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PGMActas_V2.DataAccess
{
    public class PaisAD
    {
        public static List<Pais> obtenerListaPaises()
        {
            List<Pais> listaPaises = new List<Pais>();
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                SqlCommand command = new SqlCommand();
                string selectProvincias = "SELECT *" +
                    " FROM Paises;";
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
                        Pais p = new Pais();
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
    }
}