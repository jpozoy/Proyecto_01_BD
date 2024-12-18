﻿using System.Data;
using System.Data.SqlClient;

namespace Proyecto_01_BD.Clases
{
    public class GestorCotizacion
    {
        //Crear una instancia de la conexion
        ConexionBD conexion = new ConexionBD();
        //Metodo para crear una cotizacion
        // Método para crear una cotización y obtener el código generado
        public string CrearCotizacion(Cotizacion cotizacion)
        {
            string codigoGenerado = string.Empty; // Variable para almacenar el código generado

            // Conectarse a la base de datos
            conexion.Abrir();

            // Llamar al procedimiento almacenado
            string storedProcedure = "Registrar_Cotizacion";

            using (SqlCommand comando = new SqlCommand(storedProcedure, conexion.conectarbd))
            {
                // Indicar que se está llamando al procedimiento almacenado
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                // Agregar los parámetros al procedimiento almacenado
                comando.Parameters.AddWithValue("@Cliente", cotizacion.Cliente);
                comando.Parameters.AddWithValue("@Vendedor", cotizacion.Vendedor);
                comando.Parameters.AddWithValue("@Mes_Proyectado_Cierre", cotizacion.Mes_Proyectado_Cierre);
                comando.Parameters.AddWithValue("@Descripcion", cotizacion.Descripcion);
                comando.Parameters.AddWithValue("@Estado", cotizacion.Estado);
                comando.Parameters.AddWithValue("@Tipo", cotizacion.Tipo);
                comando.Parameters.AddWithValue("@Zona", cotizacion.Zona);
                comando.Parameters.AddWithValue("@Sector", cotizacion.Sector);
                comando.Parameters.AddWithValue("@Probabilidad", cotizacion.Probabilidad);

                // Configurar el parámetro de salida para obtener el código generado
                SqlParameter codigoSalida = new SqlParameter("@CodigoCotizacionSalida", SqlDbType.VarChar, 12);
                codigoSalida.Direction = ParameterDirection.Output;
                comando.Parameters.Add(codigoSalida);

                // Ejecutar el procedimiento almacenado
                comando.ExecuteNonQuery();

                // Obtener el código generado
                codigoGenerado = codigoSalida.Value.ToString();
            }

            conexion.Cerrar();

            // Retornar el código de la cotización generado
            return codigoGenerado;
        }

        //Agregar nuevas cotizaciones
        public void AgregarArticulos (string cotizacion, string articulo, int cantidad)
        {

            // Conectarse a la base de datos
            conexion.Abrir();

            // Llamar al procedimiento almacenado
            string storedProcedure = "Agregar_Articulos_Cotizacion";

            using (SqlCommand comando = new SqlCommand(storedProcedure, conexion.conectarbd))
            {
                //indicar que se esta llamando al procedimiento
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                //Agregar los parametros al procedimiento almacenado
                comando.Parameters.AddWithValue("@Cotizacion", cotizacion);
                comando.Parameters.AddWithValue("@Articulo", articulo);
                comando.Parameters.AddWithValue("@Cantidad", cantidad);

                //Ejecutar el procedimienot almacenado
                comando.ExecuteNonQuery();
            }
            conexion.Cerrar();

        }

        //Obtener listado de cotizaciones
        public List<Cotizacion> ObtenerCotizaciones()
        {
            //Crear una lista para almacenar las cotizaciones
            List<Cotizacion> cotizaciones = new List<Cotizacion>();
            // Conectarse a la base de datos
            conexion.Abrir();

            // Llamar al procedimiento almacenado
            string query = "select Codigo_Cotizacion, Cliente, Vendedor,Fecha, Monto_Total, Estado from Listado_Cotizaciones ";

            using (SqlCommand comando = new SqlCommand(query, conexion.conectarbd))
            {
                using (SqlDataReader lector = comando.ExecuteReader())
                {
                    while (lector.Read())
                    {
                        // Crear un objeto Cliente con los valores de la consulta
                        Cotizacion cotizacion = new Cotizacion
                        {
                            Codigo_Cotizacion = lector["Codigo_Cotizacion"].ToString(),
                            Cliente = lector["Cliente"].ToString(),
                            Vendedor = lector["Vendedor"].ToString(),
                            Fecha = Convert.ToDateTime(lector["Fecha"]),
                            Monto_Total = 1200,
                            Estado = lector["Estado"].ToString(),
                        };
                        cotizaciones.Add(cotizacion);
                    }
                }

            }
            conexion.Cerrar();
            return cotizaciones;
        }
        public Cotizacion ObtenerCotizacionCodigo(string codigo)
        {
            // Conectarse a la base de datos
            conexion.Abrir();

            // Crear la consulta con un parámetro
            string query = "SELECT * FROM ObtenerCotizacionPorCodigo(@CodigoCotizacion)";

            using (SqlCommand comando = new SqlCommand(query, conexion.conectarbd))
            {
                // Agregar el parámetro al comando
                comando.Parameters.AddWithValue("@CodigoCotizacion", codigo);

                // Ejecutar el comando y obtener los resultados
                using (SqlDataReader reader = comando.ExecuteReader())
                {
                    // Aquí puedes procesar los resultados y crear la instancia de Cotizacion
                    Cotizacion cotizacion = null;

                    if (reader.Read())
                    {
                        cotizacion = new Cotizacion
                        {
                            // Asignar valores de las columnas a los atributos de Cotizacion
                            Codigo_Cotizacion = reader["Codigo_Cotizacion"].ToString(),
                            Cliente = reader["Cliente"].ToString(),
                            Vendedor = reader["Vendedor"].ToString(),
                            Monto_Total = reader.GetDecimal(reader.GetOrdinal("Monto_Total")),
                            Fecha = reader.GetDateTime(reader.GetOrdinal("Fecha")),
                            Tipo = reader["Tipo"].ToString(),
                            Zona = reader["Zona"].ToString(),
                            Sector = reader["Sector"].ToString(),
                            Probabilidad = reader["Probabilidad"].ToString(),
                            Estado = reader["Estado"].ToString(),
                            Descripcion = reader["Descripcion"].ToString(),
                            Mes_Proyectado_Cierre = reader.GetDateTime(reader.GetOrdinal("Mes_Proyectado_Cierre"))

                            // Agregar otros campos según tu estructura de la tabla
                        };
                    }

                    return cotizacion;
                }
            }
        }
        //Agregar nuevas cotizaciones
        public void ActualizarCotizacion(Cotizacion cotizacion)
        {
            // Conectarse a la base de datos
            conexion.Abrir();

            // Llamar al procedimiento almacenado
            string storedProcedure = "Editar_Cotizacion";

            using (SqlCommand comando = new SqlCommand(storedProcedure, conexion.conectarbd))
            {
                // Indicar que se está llamando al procedimiento
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                // Agregar los parámetros al procedimiento almacenado
                comando.Parameters.AddWithValue("@Cotizacion", cotizacion.Codigo_Cotizacion); // Asumiendo que tienes una propiedad 'Codigo_Cotizacion' en Cotizacion
                comando.Parameters.AddWithValue("@Cliente", cotizacion.Cliente);
                comando.Parameters.AddWithValue("@Vendedor", cotizacion.Vendedor);
                comando.Parameters.AddWithValue("@Mes_Proyectado_Cierre", cotizacion.Mes_Proyectado_Cierre); // Ajusta según la propiedad real
                comando.Parameters.AddWithValue("@Descripcion", cotizacion.Descripcion);
                comando.Parameters.AddWithValue("@Estado", cotizacion.Estado);
                comando.Parameters.AddWithValue("@Tipo", cotizacion.Tipo);
                comando.Parameters.AddWithValue("@Zona", cotizacion.Zona);
                comando.Parameters.AddWithValue("@Sector", cotizacion.Sector);
                comando.Parameters.AddWithValue("@Probabilidad", cotizacion.Probabilidad);

                // Ejecutar el procedimiento almacenado
                comando.ExecuteNonQuery();
            }

            conexion.Cerrar();
        }

        public List<Articulo2> ObtenerArticulosPorCotizacion(string codigoCotizacion)
        {
            List<Articulo2> articulos = new List<Articulo2>();

            // Conectarse a la base de datos
            conexion.Abrir();

            string query = @"SELECT * FROM Obtener_Articulos_Cotizacion(@CodigoCotizacion);";

            using (SqlCommand comando = new SqlCommand(query, conexion.conectarbd))
            {
                comando.Parameters.AddWithValue("@CodigoCotizacion", codigoCotizacion);

                using (SqlDataReader reader = comando.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Articulo2 articulo = new Articulo2
                        {
                            codigo_articulo = reader["Codigo_Articulo"].ToString(),
                            nombre_articulo = reader["Nombre_Articulo"].ToString(),
                            cantidad = Convert.ToInt32(reader["Cantidad"]),
                            costo = Convert.ToDecimal(reader["Precio_Estandar"])
                        };
                        articulos.Add(articulo);
                    }
                }
            }

            conexion.Cerrar();
            return articulos;
        }

    }
}
