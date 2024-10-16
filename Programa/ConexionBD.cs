using System;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration; 
using System.IO; 
namespace Proyecto_01_BD
{
    public class ConexionBD
    {
        // Cadena de conexión
        private string connectionString;
        public SqlConnection conectarbd;

        public ConexionBD()
        {
            // Crear el objeto Configuration para leer el archivo appsettings.json
            var configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json")
                .Build();

            // Obtener el string de conexión
            connectionString = configuration.GetConnectionString("ERPConnection");

            // Inicializar el objeto SqlConnection con el string de conexión
            conectarbd = new SqlConnection(connectionString);
        }

        // Método para abrir la conexión
        public void Abrir()
        {
            try
            {
                conectarbd.Open();
                Console.WriteLine("Conexión abierta");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al abrir la BD: " + ex.Message);
            }
        }

        // Método para cerrar la conexión
        public void Cerrar()
        {
            try
            {
                conectarbd.Close();
                Console.WriteLine("Conexión cerrada");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al cerrar la BD: " + ex.Message);
            }
        }
    }
}
