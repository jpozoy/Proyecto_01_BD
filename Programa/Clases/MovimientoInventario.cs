using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto_01_BD.Clases
{
    public class MovimientoInventario
    {
        public string TipoMovimiento { get; set; } = string.Empty;        // Opción de inicialización predeterminada
        public int CodigoArticulo { get; set; }
        public int? CodigoBodegaOrigen { get; set; }
        public int? CodigoBodegaDestino { get; set; }
        public int Cantidad { get; set; }
        public DateTime FechaMovimiento { get; set; }

        // Método para registrar un movimiento en la base de datos
        public void RegistrarMovimiento(MovimientoInventario movimiento)
        {
            ConexionBD conexion = new ConexionBD();
            conexion.Abrir();

            string query = "sp_InsertarMovimientoInventario";

            using (SqlCommand command = new SqlCommand(query, conexion.conectarbd))
            {
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@TipoMovimiento", movimiento.TipoMovimiento);
                command.Parameters.AddWithValue("@CodigoArticulo", movimiento.CodigoArticulo);
                command.Parameters.AddWithValue("@CodigoBodegaOrigen", (object)movimiento.CodigoBodegaOrigen ?? DBNull.Value);
                command.Parameters.AddWithValue("@CodigoBodegaDestino", movimiento.CodigoBodegaDestino);
                command.Parameters.AddWithValue("@Cantidad", movimiento.Cantidad);
                command.Parameters.AddWithValue("@FechaMovimiento", movimiento.FechaMovimiento);

                try
                {
                    command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error al insertar movimiento: " + ex.Message);
                }
            }

            conexion.Cerrar();
        }


        // Método para obtener todos los movimientos de inventario
        public static List<MovimientoInventario> ObtenerMovimientos()
        {
            List<MovimientoInventario> movimientos = new List<MovimientoInventario>();
            ConexionBD conexion = new ConexionBD();
            conexion.Abrir();

            string query = "SELECT TipoMovimiento, Codigo_Articulo, Codigo_Bodega_Origen, Codigo_Bodega_Destino, Cantidad, FechaMovimiento FROM Movimiento_Inventario";
            using (SqlCommand command = new SqlCommand(query, conexion.conectarbd))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        MovimientoInventario movimiento = new MovimientoInventario
                        {
                            TipoMovimiento = reader["TipoMovimiento"].ToString(),
                            CodigoArticulo = Convert.ToInt32(reader["Codigo_Articulo"]),
                            CodigoBodegaOrigen = reader["Codigo_Bodega_Origen"] != DBNull.Value ? Convert.ToInt32(reader["Codigo_Bodega_Origen"]) : (int?)null,
                            CodigoBodegaDestino = reader["Codigo_Bodega_Destino"] != DBNull.Value ? Convert.ToInt32(reader["Codigo_Bodega_Destino"]) : (int?)null,
                            Cantidad = Convert.ToInt32(reader["Cantidad"]),
                            FechaMovimiento = Convert.ToDateTime(reader["FechaMovimiento"])
                        };
                        movimientos.Add(movimiento);
                    }
                }
            }

            conexion.Cerrar();
            return movimientos;
        }
    }
}
