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

        // Metodo para obtener clientes
        public List<Cliente> ObtenerClientes()
        {
            List<Cliente> clientes = new List<Cliente>();
            conexion.Abrir();

            // Consulta para obtener Cedula y Nombre_Completo
            string query = @"SELECT Cedula, Nombre_Completo FROM Listado_Clientes";

            using (SqlCommand comando = new SqlCommand(query, conexion.conectarbd))
            {
                using (SqlDataReader lector = comando.ExecuteReader())
                {
                    while (lector.Read())
                    {
                        // Crear un objeto Cliente con los valores de la consulta
                        Cliente cliente = new Cliente
                        {
                            Cedula = lector["Cedula"].ToString(),
                            NombreCompleto = lector["Nombre_Completo"].ToString()
                        };
                        clientes.Add(cliente);
                    }
                }
            }

            conexion.Cerrar();
            return clientes;
        }

        //Obtener usuarios momentaneamente para la cotizacion
        public List<Usuario> ObtenerUsuarios()
        {
            List<Usuario> usuarios = new List<Usuario>();
            conexion.Abrir();

            string query = @"SELECT Cedula, Nombre_Completo FROM Listado_Usuarios";

            using (SqlCommand comando = new SqlCommand(query, conexion.conectarbd))
            {
                using (SqlDataReader lector = comando.ExecuteReader())
                {
                    while (lector.Read())
                    {
                        // Crear un objeto Cliente con los valores de la consulta
                        Usuario usuario = new Usuario
                        {
                            Cedula = lector["Cedula"].ToString(),
                            NombreCompleto = lector["Nombre_Completo"].ToString()
                        };
                        usuarios.Add(usuario);
                    }
                }
            }

            conexion.Cerrar();
            return usuarios;
        }
        // Metodo para obtener Sector
        public List<string> ObtenerSector()
        {
            List<string> sectores = new List<string>();
            conexion.Abrir();

            string query = @"SELECT Nombre_Sector FROM Sector";

            using (SqlCommand comando = new SqlCommand(query, conexion.conectarbd))
            {
                using (SqlDataReader lector = comando.ExecuteReader())
                {
                    while (lector.Read())
                    {
                        sectores.Add(lector["Nombre_Sector"].ToString());
                    }
                }
            }

            conexion.Cerrar();
            return sectores;
        }
        // Metodo para obtener zona
        public List<string> ObtenerZona()
        {
            List<string> zonas = new List<string>();
            conexion.Abrir();

            string query = @"SELECT Nombre_Zona FROM Zona";

            using (SqlCommand comando = new SqlCommand(query, conexion.conectarbd))
            {
                using (SqlDataReader lector = comando.ExecuteReader())
                {
                    while (lector.Read())
                    {
                        zonas.Add(lector["Nombre_Zona"].ToString());
                    }
                }
            }

            conexion.Cerrar();
            return zonas;
        }
        // Metodo para obtener Tipo_Cotizacion
        public List<string> ObtenerTipoCotizacion()
        {
            List<string> tipos = new List<string>();
            conexion.Abrir();

            string query = @"SELECT Tipo FROM Tipo_Cotizacion";

            using (SqlCommand comando = new SqlCommand(query, conexion.conectarbd))
            {
                using (SqlDataReader lector = comando.ExecuteReader())
                {
                    while (lector.Read())
                    {
                        tipos.Add(lector["Tipo"].ToString());
                    }
                }
            }

            conexion.Cerrar();
            return tipos;
        }
        // Metodo para obtener Probalidad_Cotizacion
        public List<string> ProbabilidadCotizacion()
        {
            List<string> probalidades = new List<string>();
            conexion.Abrir();

            string query = @"SELECT Probabilidad FROM Probabilidad_Cotizacion";

            using (SqlCommand comando = new SqlCommand(query, conexion.conectarbd))
            {
                using (SqlDataReader lector = comando.ExecuteReader())
                {
                    while (lector.Read())
                    {
                        probalidades.Add(lector["Probabilidad"].ToString());
                    }
                }
            }

            conexion.Cerrar();
            return probalidades;
        }

        // Metodo para obtener Estado_Cotizacion
        public List<string> EstadoCotizacion()
        {
            List<string> estados = new List<string>();
            conexion.Abrir();

            string query = @"SELECT Estado FROM Estado_Cotizacion";

            using (SqlCommand comando = new SqlCommand(query, conexion.conectarbd))
            {
                using (SqlDataReader lector = comando.ExecuteReader())
                {
                    while (lector.Read())
                    {
                        estados.Add(lector["Estado"].ToString());
                    }
                }
            }

            conexion.Cerrar();
            return estados;
        }

        // Metodo para obtener Articulos
        public List<Articulo> ObtenerArticulos()
        {
            List<Articulo> articulos = new List<Articulo>();
            conexion.Abrir();

            string query = @"SELECT Codigo_Articulo, Nombre_Articulo, Costo FROM Articulo";

            using (SqlCommand comando = new SqlCommand(query, conexion.conectarbd))
            {
                using (SqlDataReader lector = comando.ExecuteReader())
                {
                    while (lector.Read())
                    {
                        // Crear un objeto Cliente con los valores de la consulta
                        Articulo articulo = new Articulo
                        {
                            codigo_articulo = lector["Codigo_Articulo"].ToString(),
                            nombre_articulo = lector["Nombre_Articulo"].ToString(),
                            costo = Convert.ToDecimal(lector["Costo"])
                        };
                        articulos.Add(articulo);
                    }
                }
            }

            conexion.Cerrar();
            return articulos;
        }
    }
}
