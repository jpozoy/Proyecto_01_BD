using System.Data.SqlClient;
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
        public string Nombre_Rol { get; set; }

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
                comando.Parameters.AddWithValue("@Nombre_Rol", this.Nombre_Rol);

                //Ejecutar el procedimienot almacenado
                comando.ExecuteNonQuery();
            }
            conexion.Cerrar();
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
                            Nombre_Rol = lector["Nombre_Rol"].ToString()
                        };

                        usuarios.Add(usuario);
                    }
                }
            }
            conexion.Cerrar();
            return usuarios;
        }
    }
}
