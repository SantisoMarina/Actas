using PGMActas_V2.Models;
using PGMActas_V2.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PGMActas_V2.DataAccess
{
    public class AutomotorDA
    {
        public static List<Automotor> obtenerListaAutomotores()
        {
            List<Automotor> listaAutomotores = new List<Automotor>();
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                SqlCommand command = new SqlCommand();
                string selectAutomotor = "SELECT * " +
                    " FROM Automotores a " +
                    " JOIN MarcasxTipos_vehiculos mtv" +
                    " ON a.id_marca_tipo_vehiculo = mtv.id_marca_tipo_vehiculo " +
                    " JOIN Marcas M " +
                    " ON m.id_marca = mtv.id_marca " +
                    " JOIN Tipos_vehiculos tv " +
                    " ON tv.id_tipo_vehiculo = mtv.id_tipo_vehiculo;";
                command.Parameters.Clear();
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = selectAutomotor;
                conexion.Open();
                command.Connection = conexion;
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader != null)
                {
                    while (dataReader.Read())
                    {
                        MarcaItemVM marca = new MarcaItemVM();
                        TipoVehiculoItemVM tv = new TipoVehiculoItemVM();
                        Automotor a = new Automotor();
                        a.id_automotor = int.Parse(dataReader["id_automotor"].ToString());
                        a.numero_dominio = dataReader["numero_dominio"].ToString();
                        a.modelo = dataReader["modelo"].ToString();
                        a.color = dataReader["color"].ToString();
                        a.id_marca_tipo_vehiculo = int.Parse(dataReader["id_marca_tipo_vehiculo"].ToString());
                        marca.id_marca = int.Parse(dataReader["id_marca"].ToString());
                        marca.marca = dataReader["marca"].ToString();
                        tv.id_tipo_vehiculo = int.Parse(dataReader["id_tipo_vehiculo"].ToString());
                        tv.tipo_vehiculo = dataReader["tipo_vehiculo"].ToString();
                        a.marca = marca;
                        a.tipoVehiculo = tv;

                        listaAutomotores.Add(a);
                    }
                }
                dataReader.Close();
                foreach (var item in listaAutomotores)
                {

                    List<Persona> listaTitulares = new List<Persona>();
                    SqlCommand commandP = new SqlCommand();
                    commandP.Parameters.Clear();
                    commandP.CommandType = System.Data.CommandType.Text;
                    commandP.CommandText = "SELECT * " +
                        " FROM Personas p " +
                        " JOIN AutomotoresxPersonas ap " +
                        " ON p.id_persona= ap.id_persona " +
                        " JOIN Tipos_Documentos td " +
                        " ON p.id_tipo_documento = td.id_tipo_documento " +
                        " WHERE id_automotor = " + item.id_automotor.ToString();
                    commandP.Connection = conexion;
                    dataReader = commandP.ExecuteReader();
                    if (dataReader != null)
                    {
                        while (dataReader.Read())
                        {
                            Persona persona = new Persona();
                            TipoDocumentoItemVM tipoDocumento = new TipoDocumentoItemVM();
                            persona.id_persona = int.Parse(dataReader["id_persona"].ToString());
                            persona.nombre = dataReader["nombre"].ToString();
                            persona.apellido = dataReader["apellido"].ToString();
                            persona.numero_documento = dataReader["numero_documento"].ToString();
                            persona.direccion = dataReader["direccion"].ToString();
                            persona.codigo_postal = int.Parse(dataReader["codigo_postal"].ToString());
                            tipoDocumento.id_tipo_documento = int.Parse(dataReader["id_tipo_documento"].ToString());
                            tipoDocumento.tipo_documento = dataReader["tipo_documento"].ToString();
                            persona.tipoDocumento = tipoDocumento;
                            listaTitulares.Add(persona);
                        }
                    }
                    item.listadoTitulares = listaTitulares;
                }
                
            }
            catch (Exception e)
            {

            }
            finally
            {
                conexion.Close();
            }

            return listaAutomotores;
        }

        public static List<MarcaItemVM> obtenerListaMarcas()
        {
            List<MarcaItemVM> listaMarcas = new List<MarcaItemVM>();
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                SqlCommand command = new SqlCommand();
                string selectMarcas = "SELECT *" +
                    " FROM Marcas;";
                command.Parameters.Clear();
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = selectMarcas;
                conexion.Open();
                command.Connection = conexion;
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader != null)
                {
                    while (dataReader.Read())
                    {
                        MarcaItemVM marca = new MarcaItemVM();
                        marca.id_marca = int.Parse(dataReader["id_marca"].ToString());
                        marca.marca = dataReader["marca"].ToString();
                        listaMarcas.Add(marca);
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

            return listaMarcas;
        }

        public static List<TipoVehiculoItemVM> obtenerListaTiposVehiculos()
        {
            List<TipoVehiculoItemVM> listaTiposVehiculos = new List<TipoVehiculoItemVM>();
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                SqlCommand command = new SqlCommand();
                string selectTiposVehiculos = "SELECT *" +
                    " FROM Tipos_Vehiculos;";
                command.Parameters.Clear();
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = selectTiposVehiculos;
                conexion.Open();
                command.Connection = conexion;
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader != null)
                {
                    while (dataReader.Read())
                    {
                        TipoVehiculoItemVM tv = new TipoVehiculoItemVM();
                        tv.id_tipo_vehiculo = int.Parse(dataReader["id_tipo_vehiculo"].ToString());
                        tv.tipo_vehiculo = dataReader["tipo_vehiculo"].ToString();
                        listaTiposVehiculos.Add(tv);
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

            return listaTiposVehiculos;
        }

        public static bool obtenerNumeroDominio(string numero_dominio)
        {
            bool resultado = false;
            Automotor automotor = new Automotor();
            string cadenaConexion = System.Configuration.ConfigurationManager.AppSettings["CadenaBD"].ToString();
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                SqlCommand command = new SqlCommand();
                string selectActa = "SELECT LOWER(REPLACE(numero_dominio, ' ', '')) AS 'numero_dominio'" +
                    " FROM Automotores a " +
                    " WHERE  LOWER(REPLACE(numero_dominio, ' ', '')) = @numero_dominio;";
                command.Parameters.Clear();
                command.Parameters.AddWithValue("@numero_dominio", numero_dominio);
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = selectActa;
                conexion.Open();
                command.Connection = conexion;
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader != null)
                {
                    while (dataReader.Read())
                    {

                        string aux = dataReader["numero_dominio"].ToString();
                        automotor.numero_dominio = aux.ToLower().Replace(" ", "");
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