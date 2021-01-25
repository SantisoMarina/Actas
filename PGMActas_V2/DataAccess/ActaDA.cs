using PGMActas_V2.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PGMActas_V2.DataAccess
{
    public class ActaDA
    {

        public static bool obtenerNumeroActa (int numero_acta)
        {
            bool resultado = false;
            Acta acta = new Acta();
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                SqlCommand command = new SqlCommand();
                string selectActa = "SELECT a.numero_acta" +
                    " FROM Actas a " +
                    " WHERE a.numero_acta = @numero_acta;";
                command.Parameters.Clear();
                command.Parameters.AddWithValue("@numero_acta", numero_acta);
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = selectActa;
                conexion.Open();
                command.Connection = conexion;
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader != null)
                {
                    while (dataReader.Read())
                    {

                        acta.numero_acta = int.Parse(dataReader["numero_acta"].ToString());
                        resultado = true;

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

            return resultado;
        }

    }
}