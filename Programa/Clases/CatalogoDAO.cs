using System.Data.SqlClient;

namespace Proyecto_01_BD.Clases
{
    public class CatalogoDAO
    {
        // Crear un objeto nuevo de la conexión
        ConexionBD conexion = new ConexionBD();

        // Modulo de Usuarios

        // Método para obtener los puestos
        public List<string> ObtenerPuestos()
        {
            List<string> puestos = new List<string>();
            conexion.Abrir();

            string query = @"SELECT Puesto FROM Puesto";

            using (SqlCommand comando = new SqlCommand(query, conexion.conectarbd))
            {
                using (SqlDataReader lector = comando.ExecuteReader())
                {
                    while (lector.Read())
                    {
                        puestos.Add(lector["Puesto"].ToString());
                    }
                }
            }

            conexion.Cerrar();
            return puestos;
        }

        // Metodo para obtener los roles
        public List<string> ObtenerRoles()
        {
            List<string> roles = new List<string>();
            conexion.Abrir();

            string query = @"SELECT Nombre_Rol FROM Rol";

            using (SqlCommand comando = new SqlCommand(query, conexion.conectarbd))
            {
                using (SqlDataReader lector = comando.ExecuteReader())
                {
                    while (lector.Read())
                    {
                        roles.Add(lector["Nombre_Rol"].ToString());
                    }
                }
            }

            conexion.Cerrar();
            return roles;
        }

        public List<string> ObtenerDepartamentos()
        {
            List<string> departamentos = new List<string>();
            conexion.Abrir();

            string query = @"SELECT Departamento FROM Departamento";

            using (SqlCommand comando = new SqlCommand(query, conexion.conectarbd))
            {
                using (SqlDataReader lector = comando.ExecuteReader())
                {
                    while (lector.Read())
                    {
                        departamentos.Add(lector["Departamento"].ToString());
                    }
                }
            }

            conexion.Cerrar();
            return departamentos;
        }

        //Metodo para obtener los modulos
        public List<string> ObtenerModulos()
        {
            List<string> modulos = new List<string>();
            conexion.Abrir();

            string query = @"SELECT Nombre_Modulo FROM Modulo";

            using (SqlCommand comando = new SqlCommand (query, conexion.conectarbd))
            {
                using (SqlDataReader lector = comando.ExecuteReader())
                {
                    while (lector.Read())
                    {
                        modulos.Add(lector["Nombre_Modulo"].ToString());
                    }
                }
            }

            conexion.Cerrar();
            return modulos;
        }

        // Metodo para obtener las acciones
        public List<string> ObtenerAcciones()
        {
            List<string> acciones = new List<string>();
            conexion.Abrir();

            string query = @"SELECT Nombre_Accion FROM Accion";

            using (SqlCommand comando = new SqlCommand(query, conexion.conectarbd))
            {
                using (SqlDataReader lector = comando.ExecuteReader())
                {
                    while (lector.Read())
                    {
                        acciones.Add(lector["Nombre_Accion"].ToString());
                    }
                }
            }

            conexion.Cerrar();
            return acciones;
        }
    }
}
