using System.Data;
using System.Data.SqlClient;

namespace Proyecto_01_BD.Clases
{
    public class Reportes
    {
        //Crear una instancia de la conexion
        ConexionBD conexion = new ConexionBD();

        //Metodo para obtener reportes de Top productos más cotizados
        public List<Dictionary<string, object>> ProductosCotizados()
        {
            List<Dictionary<string, object>> resultados = new List<Dictionary<string, object>>();
            //Conectarse a la base de datos
            conexion.Abrir();
            //Llamar al procedimiento almacenado
            string query = "select Nombre_Articulo, Descripcion, Total_Cotizado from Top10_ProductosCotizados";

            using (SqlCommand command = new SqlCommand(query, conexion.conectarbd))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Dictionary<string, object> resultado = new Dictionary<string, object>();
                        resultado["Nombre_Articulo"] = reader["Nombre_Articulo"];
                        resultado["Descripcion"] = reader["Descripcion"];
                        resultado["Total_Cotizado"] = reader["Total_Cotizado"];
                        resultados.Add(resultado);
                    }
                }
            }
            return resultados;

        }
        public List<Dictionary<string, object>> FiltrarVentasPorFamilia(int? mes = null, int? anio = null, DateTime? fechaInicio = null, DateTime? fechaFin = null)
        {
            List<Dictionary<string, object>> resultados = new List<Dictionary<string, object>>();

            // Abrir conexión
            conexion.Abrir();

            // Consulta para llamar a la función
            string query = @" SELECT * FROM dbo.FiltrarVentasPorFamilia(@Mes, @Anio, @FechaInicio, @FechaFin)";

            using (SqlCommand command = new SqlCommand(query, conexion.conectarbd))
            {
                // Agregar parámetros a la consulta
                command.Parameters.AddWithValue("@Mes", (object)mes ?? DBNull.Value);
                command.Parameters.AddWithValue("@Anio", (object)anio ?? DBNull.Value);
                command.Parameters.AddWithValue("@FechaInicio", (object)fechaInicio ?? DBNull.Value);
                command.Parameters.AddWithValue("@FechaFin", (object)fechaFin ?? DBNull.Value);

                // Ejecutar el lector de datos
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Dictionary<string, object> resultado = new Dictionary<string, object>
                        {
                            ["CodigoFamilia"] = reader["CodigoFamilia"],
                            ["NombreFamilia"] = reader["NombreFamilia"],
                            ["TotalVentas"] = reader["TotalVentas"]
                        };
                        resultados.Add(resultado);
                    }
                }
            }

            // Cerrar conexión
            conexion.Cerrar();

            return resultados;
        }

    }


}
