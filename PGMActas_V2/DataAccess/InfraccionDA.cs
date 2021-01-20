using PGMActas_V2.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PGMActas_V2.DataAccess
{
    public class InfraccionDA
    {
        public static List<Infraccion> obtenerListaInfracciones()
        {
            List<Infraccion> listaInfracciones = new List<Infraccion>();
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                SqlCommand command = new SqlCommand();
                string selectInfraccion = "SELECT * "+
                    " FROM Infracciones i " +
                    " JOIN Normativas n " +
                    " ON i.codigo_normativa = n.codigo_normativa " +
                    " JOIN Articulos a " +
                    " ON i.codigo_articulo = a.codigo_articulo " +
                    " JOIN Grupos_Infracciones gi " +
                    " ON i.codigo_grupo = gi.codigo_grupo;";
                command.Parameters.Clear();
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = selectInfraccion;
                conexion.Open();
                command.Connection = conexion;
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader != null)
                {
                    while (dataReader.Read())
                    {
                        Infraccion inf = new Infraccion();
                        Normativa n = new Normativa();
                        Articulo articulo = new Articulo();
                        GrupoInfraccion grupoInf = new GrupoInfraccion();
                        inf.codigo_infraccion = int.Parse(dataReader["codigo_infraccion"].ToString());
                        inf.nomenclatura = dataReader["nomenclatura"].ToString();
                        inf.descripcion = dataReader["descripcion"].ToString();
                        inf.estado = bool.Parse(dataReader["estado"].ToString());
                        inf.calificacion = dataReader["calificacion"].ToString();
                        n.codigo_normativa = int.Parse(dataReader["codigo_normativa"].ToString());
                        n.normativa = dataReader["normativa"].ToString();
                        articulo.codigo_articulo = int.Parse(dataReader["codigo_articulo"].ToString());
                        articulo.articulo = int.Parse(dataReader["articulo"].ToString());
                        grupoInf.codigo_grupo = int.Parse(dataReader["codigo_grupo"].ToString());
                        grupoInf.grupo = dataReader["grupo"].ToString();
                        inf.normativa = n;
                        inf.articulo = articulo;
                        inf.grupoInfracciones = grupoInf;
                        listaInfracciones.Add(inf);
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

            return listaInfracciones;
        }

    }
}