using System;
using System.Data.SqlClient;

namespace Proyecto_01_BD
{
    public class ConexionBD
    {
        // Cadena de conexión
        string connectionString = "Server=DESKTOP-L1JAUHL\\SQLEXPRESS;Database=SistemaERP;User Id=sa;Password=12345678;";

        public SqlConnection conectarbd = new SqlConnection();

        public ConexionBD()
        {
            conectarbd.ConnectionString = connectionString;
        }

        // Método para abrir la conexión
        public void Abrir()
        {
            try
            {
                conectarbd.Open();
                Console.WriteLine("Conexion abierta");
            } catch (Exception ex)
            {
                Console.WriteLine("Error al abrir la BD" + ex.Message);
            }
        }

        // Método para cerrar la conexión
        public void Cerrar()
        {
            conectarbd.Close();

        }
    }
}
