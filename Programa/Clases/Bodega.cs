using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Proyecto_01_BD.Clases
{
    public class Bodega
    {
        public string CodigoBodega { get; set; }
        public string Nombre { get; set; }
        public string Ubicacion { get; set; }
        public int CapacidadEnToneladas { get; set; }
        public int EspacioCubico { get; set; }
        public string Estado { get; set; }

        // Constructor vacío
        public Bodega() { }

        // Constructor con parámetros
        public Bodega(string codigoBodega, string nombre, string ubicacion, int capacidadEnToneladas, int espacioCubico, string estado)
        {
            CodigoBodega = codigoBodega;
            Nombre = nombre;
            Ubicacion = ubicacion;
            CapacidadEnToneladas = capacidadEnToneladas;
            EspacioCubico = espacioCubico;
            Estado = estado;
        }

        // Método para obtener una lista de bodegas desde la base de datos
        public static List<Bodega> ObtenerBodegas()
        {
            List<Bodega> bodegas = new List<Bodega>();
            ConexionBD conexion = new ConexionBD();

            try
            {
                conexion.Abrir();
                string query = "SELECT * FROM Bodega";

                using (SqlCommand comando = new SqlCommand(query, conexion.conectarbd))
                {
                    using (SqlDataReader lector = comando.ExecuteReader())
                    {
                        while (lector.Read())
                        {
                            Bodega bodega = new Bodega
                            {
                                CodigoBodega = lector["Codigo_Bodega"].ToString(),
                                Nombre = lector["Nombre"].ToString(),
                                Ubicacion = lector["Ubicacion"].ToString(),
                                CapacidadEnToneladas = Convert.ToInt32(lector["Capacidad_En_Toneladas"]),
                                EspacioCubico = Convert.ToInt32(lector["Espacio_Cubico"]),
                                Estado = lector["Estado"].ToString()
                            };
                            bodegas.Add(bodega);
                        }
                    }
                }
            }
            finally
            {
                conexion.Cerrar();
            }
            return bodegas;
        }
        // Método para ver artículos por bodega utilizando la vista
        public static List<Articulo> VerArticulosPorBodega(string codigoBodega)
        {
            List<Articulo> articulos = new List<Articulo>();
            ConexionBD conexion = new ConexionBD();

            try
            {
                conexion.Abrir();
                // Usamos la vista para hacer la consulta
                string query = @"SELECT Codigo_Articulo, Nombre_Articulo, Cantidad 
                         FROM Vista_ArticulosPorBodega 
                         WHERE Codigo_Bodega = @CodigoBodega";

                using (SqlCommand comando = new SqlCommand(query, conexion.conectarbd))
                {
                    comando.Parameters.AddWithValue("@CodigoBodega", codigoBodega);

                    using (SqlDataReader lector = comando.ExecuteReader())
                    {
                        while (lector.Read())
                        {
                            Articulo articulo = new Articulo
                            {
                                CodigoArticulo = lector["Codigo_Articulo"].ToString(),
                                NombreArticulo = lector["Nombre_Articulo"].ToString(),
                                Cantidad = Convert.ToInt32(lector["Cantidad"])
                            };
                            articulos.Add(articulo);
                        }
                    }
                }
            }
            finally
            {
                conexion.Cerrar();
            }

            return articulos;
        }


    }
}
