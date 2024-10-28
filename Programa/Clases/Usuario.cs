using System;
using System.Data.SqlClient;
using BCrypt.Net;
using Microsoft.AspNetCore.Components.Web;
namespace Proyecto_01_BD.Clases
{
    public class Usuario
    {
        public string Cedula { get; set; }
        public  string Nombre { get; set; }
        public  string Apellido1 { get; set; }
        public  string Apellido2 { get; set; }
        public string Telefono { get; set; }
        public string Correo { get; set; }
        public string Fax { get; set; }
        public DateTime Fecha_Nacimiento { get; set; }
        public string Lugar_Residencia { get; set; }
        public DateTime Fecha_Ingreso { get; set; }
        public decimal Salario { get; set; }
        public string Puesto { get; set; }
        public string Departamento { get; set; }
        public string Password { get; set; }
        public string NombreCompleto { get; set; }

        //Crear un objeto nuevo de la conexion
        ConexionBD conexion = new ConexionBD();

        //Metodo para crear un registro de usuario
        public void RegistrarUsuario()
        {
            //Conectarse a la bd
            conexion.Abrir();

            //LLama al procedimienot almacenado
            string storedProcedure = "Registrar_Usuario";
            
            using (SqlCommand comando = new SqlCommand(storedProcedure, conexion.conectarbd))
            {
                //indicar que se esta llamando al procedimiento
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                //Agregar los parametros al procedimiento almacenado
                comando.Parameters.AddWithValue("@Cedula", this.Cedula);
                comando.Parameters.AddWithValue("@Nombre", this.Nombre);
                comando.Parameters.AddWithValue("@Apellido1", this.Apellido1);
                comando.Parameters.AddWithValue("@Apellido2", this.Apellido2);
                comando.Parameters.AddWithValue("@Telefono", this.Telefono);
                comando.Parameters.AddWithValue("@Correo", this.Correo);
                comando.Parameters.AddWithValue("@Fecha_Nacimiento", this.Fecha_Nacimiento);
                comando.Parameters.AddWithValue("@Lugar_Residencia", this.Lugar_Residencia);
                comando.Parameters.AddWithValue("@Fecha_Ingreso", this.Fecha_Ingreso);
                comando.Parameters.AddWithValue("@Salario", this.Salario);
                comando.Parameters.AddWithValue("@Puesto", this.Puesto);
                comando.Parameters.AddWithValue("@Departamento", this.Departamento);
                comando.Parameters.AddWithValue("@Contrasena", this.Password);

                //Ejecutar el procedimienot almacenado
                comando.ExecuteNonQuery();
            }
            conexion.Cerrar();
        }
        //Metodo para hashear la contraseña
        public string HashPassword(string password)
        {
            return BCrypt.Net.BCrypt.HashPassword(password);
        }

        //Metodo para obtener la lista de usuarios
        public List<Usuario> ObtenerUsuarios()
        {
            List<Usuario> usuarios = new List<Usuario>();

            // Abrir la conexión
            conexion.Abrir();

            string query = @"SELECT * FROM Usuario";

            // Ejecutar el query
            using (SqlCommand comando = new SqlCommand(query, conexion.conectarbd))
            {
                using (SqlDataReader lector = comando.ExecuteReader())
                {
                    while (lector.Read())
                    {
                        Usuario usuario = new Usuario
                        {
                            Cedula = lector["Cedula"].ToString(),
                            Nombre = lector["Nombre"].ToString(),
                            Apellido1 = lector["Apellido1"].ToString(),
                            Apellido2 = lector["Apellido2"].ToString(),
                            Telefono = lector["Telefono"].ToString(),
                            Correo = lector["Correo"].ToString(),
                            Fecha_Nacimiento = Convert.ToDateTime(lector["Fecha_Nacimiento"]),
                            Lugar_Residencia = lector["Lugar_Residencia"].ToString(),
                            Fecha_Ingreso = Convert.ToDateTime(lector["Fecha_Ingreso"]),
                            Salario = Convert.ToDecimal(lector["Salario"]),
                            Puesto = lector["Puesto"].ToString(),
                            Departamento = lector["Departamento"].ToString(),
                        };

                        usuarios.Add(usuario);
                    }
                }
            }
            conexion.Cerrar();
            return usuarios;
        }
        //Metodo para actualizar puesto
        public void EditarPuesto(string Cedula, string Puesto)
        {
            //Conectarse a la bd
            conexion.Abrir();

            //LLama al procedimienot almacenado
            string storedProcedure = "Editar_Puesto";

            using (SqlCommand comando = new SqlCommand(storedProcedure, conexion.conectarbd))
            {
                //indicar que se esta llamando al procedimiento
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                //Agregar los parametros al procedimiento almacenado
                comando.Parameters.AddWithValue("@Cedula", Cedula);
                comando.Parameters.AddWithValue("@Puesto", Puesto);

                //Ejecutar el procedimienot almacenado
                comando.ExecuteNonQuery();
            }
            conexion.Cerrar();
        }

        //Metodo para actualizar salario
        public void EditarSalario(string Cedula, decimal Salario)
        {
            //Conectarse a la bd
            conexion.Abrir();

            //LLama al procedimienot almacenado
            string storedProcedure = "Editar_Salario";

            using (SqlCommand comando = new SqlCommand(storedProcedure, conexion.conectarbd))
            {
                //indicar que se esta llamando al procedimiento
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                //Agregar los parametros al procedimiento almacenado
                comando.Parameters.AddWithValue("@Cedula", Cedula);
                comando.Parameters.AddWithValue("@Salario", Salario);

                //Ejecutar el procedimienot almacenado
                comando.ExecuteNonQuery();
            }
            conexion.Cerrar();
        }

        //Metodo para registrar un rol
        public void RegistrarRol (string Rol, string Accion, string Modulo)
        {
            //Conectarse a la bd
            conexion.Abrir();

            //LLama al procedimienot almacenado
            string storedProcedure = "Crear_Rol";

            using (SqlCommand comando = new SqlCommand(storedProcedure, conexion.conectarbd))
            {
                //indicar que se esta llamando al procedimiento
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                //Agregar los parametros al procedimiento almacenado
                comando.Parameters.AddWithValue("@Rol_Nombre", Rol);
                comando.Parameters.AddWithValue("@Accion", Accion);
                comando.Parameters.AddWithValue("@Module", Modulo);

                //Ejecutar el procedimienot almacenado
                comando.ExecuteNonQuery();
            }
            conexion.Cerrar();
        }

        //Metodo para asignar roles
        public void AsignarRol(string Cedula, string Rol)
        {
            //Conectarse a la bd
            conexion.Abrir();

            //LLama al procedimienot almacenado
            string storedProcedure = "Asignar_Rol";

            using (SqlCommand comando = new SqlCommand(storedProcedure, conexion.conectarbd))
            {
                //indicar que se esta llamando al procedimiento
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                //Agregar los parametros al procedimiento almacenado
                comando.Parameters.AddWithValue("@Rol", Rol);
                comando.Parameters.AddWithValue("@Cedula", Cedula);

                //Ejecutar el procedimienot almacenado
                comando.ExecuteNonQuery();
            }
            conexion.Cerrar();
        }

        //Metodo para obtener usuarios por rol
        public List<Rol> ObtenerUsuariosPorRol()
        {
            List<Rol> resultados = new List<Rol>();

            // Abrir la conexión
            conexion.Abrir();

            string query = @"
        SELECT 
            r.Nombre_Rol, 
            CONCAT(u.Nombre, ' ', u.Apellido1, ' ', u.Apellido2) AS Nombre_Usuario
        FROM 
            Rol r
        JOIN 
            Rol_Usuarios ru ON r.Nombre_Rol = ru.Nombre_Rol
        JOIN 
            Usuario u ON ru.Cedula_Usuario = u.Cedula
        ORDER BY 
            r.Nombre_Rol;";

            // Ejecutar el query
            using (SqlCommand comando = new SqlCommand(query, conexion.conectarbd))
            {
                using (SqlDataReader lector = comando.ExecuteReader())
                {
                    while (lector.Read())
                    {
                        resultados.Add(new Rol
                        {
                            Nombre_Rol = lector["Nombre_Rol"].ToString(),
                            Nombre_Usuario = lector["Nombre_Usuario"].ToString()
                        });
                    }
                }
            }

            conexion.Cerrar();
            return resultados;
        }

    }
}
