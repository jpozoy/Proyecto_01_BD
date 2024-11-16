using System.Data;
using System.Data.SqlClient;

namespace Proyecto_01_BD.Clases
{
    public class Reportes
    {
        //Crear una instancia de la conexion
        ConexionBD conexion = new ConexionBD();

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
    }


}
