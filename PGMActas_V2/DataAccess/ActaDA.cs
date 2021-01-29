using PGMActas_V2.Models;
using PGMActas_V2.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PGMActas_V2.DataAccess
{
    public class ActaDA
    {

        public static bool obtenerNumeroActa(int numero_acta)
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

        public static List<InfraccionesPersonaParticular> obtenerListaActasPersonaParticular(int id_persona)
        {
            List<InfraccionesPersonaParticular> listaActasPersonaParticular = new List<InfraccionesPersonaParticular>();
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                SqlCommand command = new SqlCommand();
                string selectInfraccionesPersonaParticular = @"SELECT distinct a.numero_acta, a.fecha_acta, a.direccion_infraccion, ia.codigo_infraccion, a.observaciones, p.nombre, p.apellido, rl.responsabilidad_legal
                    FROM Actas a
                     JOIN InfraccionesxActas ia
                   ON a.numero_acta = ia.numero_acta
                   JOIN PersonaInfraccionxActa pia
                    ON a.numero_acta = pia.numero_acta

                    JOIN Automotores aut
                    ON a.id_automotor = aut.id_automotor

                    JOIN AutomotoresxPersonas ap
                    ON ap.id_automotor = aut.id_automotor
                   JOIN Personas p
                    ON(p.id_persona = pia.id_persona or ap.id_automotor = p.id_persona)

                    JOIN Responsabilidades_Legales rl

                    ON(pia.id_responsabilidad_legal = rl.id_responsabilidad_legal

                    or rl.id_responsabilidad_legal = ap.id_responsabilidad_legal)
                    WHERE p.id_persona = @id_persona";
                command.Parameters.Clear();
                command.Parameters.AddWithValue("@id_persona", id_persona);
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = selectInfraccionesPersonaParticular;
                conexion.Open();
                command.Connection = conexion;
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader != null)
                {
                    while (dataReader.Read())
                    {
                        InfraccionesPersonaParticular ipp = new InfraccionesPersonaParticular();
                        ipp.codigo_infraccion = int.Parse(dataReader["codigo_infraccion"].ToString());
                        ipp.numero_acta = int.Parse(dataReader["numero_acta"].ToString());
                        ipp.fecha_acta = dataReader["fecha_acta"].ToString();
                        ipp.direccion = dataReader["direccion_infraccion"].ToString();
                        ipp.observaciones = dataReader["observaciones"].ToString();
                        ipp.nombre = dataReader["nombre"].ToString();
                        ipp.apellido = dataReader["apellido"].ToString();
                        ipp.responsabilidad_legal = dataReader["responsabilidad_legal"].ToString();
                        listaActasPersonaParticular.Add(ipp);
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

            return listaActasPersonaParticular;
        }



    }
}