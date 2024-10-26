using System.Data;
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
                comando.Parameters.AddWithValue("@Monto_Total", cotizacion.Monto_Total);
                comando.Parameters.AddWithValue("@Descripcion", cotizacion.Descripcion);
                comando.Parameters.AddWithValue("@Fecha", cotizacion.Fecha);
                comando.Parameters.AddWithValue("@Fecha_Cierre", cotizacion.Fecha_Cierre);
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
    }
}
