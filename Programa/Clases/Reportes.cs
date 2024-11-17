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

        //Reportes de ventas por familia
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

        //Reportes de ventas por sector
        public List<Dictionary<string, object>> FiltrarVentasPorSector(int? mes, int? anio, DateTime? fechaInicio, DateTime? fechaFin)
        {
            List<Dictionary<string, object>> resultados = new List<Dictionary<string, object>>();

            try
            {
                // Abrir conexión a la base de datos
                conexion.Abrir();

                // Construir la consulta SQL con parámetros
                string query = @"SELECT Sector, Fecha, Total_Ventas FROM dbo.FiltrarVentasPorSector(@Mes, @Anio, @FechaInicio, @FechaFin)";

                using (SqlCommand command = new SqlCommand(query, conexion.conectarbd))
                {
                    // Agregar parámetros con valores o DBNull si son nulos
                    command.Parameters.AddWithValue("@Mes", mes.HasValue ? (object)mes.Value : DBNull.Value);
                    command.Parameters.AddWithValue("@Anio", anio.HasValue ? (object)anio.Value : DBNull.Value);
                    command.Parameters.AddWithValue("@FechaInicio", fechaInicio.HasValue ? (object)fechaInicio.Value : DBNull.Value);
                    command.Parameters.AddWithValue("@FechaFin", fechaFin.HasValue ? (object)fechaFin.Value : DBNull.Value);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // Leer resultados y llenar la lista
                        while (reader.Read())
                        {
                            Dictionary<string, object> resultado = new Dictionary<string, object>
                    {
                        { "Sector", reader["Sector"] },
                        { "Fecha", reader["Fecha"] },
                        { "Total_Ventas", reader["Total_Ventas"] }
                    };
                            resultados.Add(resultado);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Manejar errores (puedes registrar el error si es necesario)
                throw new Exception("Error al filtrar ventas por sector: " + ex.Message);
            }
            finally
            {
                // Cerrar conexión a la base de datos
                conexion.Cerrar();
            }

            return resultados;
        }
        // Obtener ventas y cotizaciones por departamentos
        public List<Dictionary<string, object>> FiltrarVentasYCotizacionesPorDepartamento(int? mes, int? anio, DateTime? fechaInicio, DateTime? fechaFin)
        {
            List<Dictionary<string, object>> resultados = new List<Dictionary<string, object>>();

            try
            {
                conexion.Abrir();

                string query = @"
            SELECT Departamento, TotalVentas, TotalCotizaciones
            FROM dbo.FiltrarVentasYCotizacionesPorDepartamento(@Mes, @Anio, @FechaInicio, @FechaFin)";

                using (SqlCommand command = new SqlCommand(query, conexion.conectarbd))
                {
                    command.Parameters.AddWithValue("@Mes", mes.HasValue ? (object)mes.Value : DBNull.Value);
                    command.Parameters.AddWithValue("@Anio", anio.HasValue ? (object)anio.Value : DBNull.Value);
                    command.Parameters.AddWithValue("@FechaInicio", fechaInicio.HasValue ? (object)fechaInicio.Value : DBNull.Value);
                    command.Parameters.AddWithValue("@FechaFin", fechaFin.HasValue ? (object)fechaFin.Value : DBNull.Value);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Dictionary<string, object> resultado = new Dictionary<string, object>
                    {
                        { "Departamento", reader["Departamento"] },
                        { "TotalVentas", reader["TotalVentas"] },
                        { "TotalCotizaciones", reader["TotalCotizaciones"] }
                    };
                            resultados.Add(resultado);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al filtrar ventas y cotizaciones por departamento: " + ex.Message);
            }
            finally
            {
                conexion.Cerrar();
            }

            return resultados;
        }

        //Obtiene las 15 tareas mas antiguas sin cerrar
         public List<Dictionary<string, object>> ObtenerTareasMasAntiguas()
        {
            List<Dictionary<string, object>> resultados = new List<Dictionary<string, object>>();

            try
            {
                conexion.Abrir();

                // Query para obtener datos desde la vista
                string query = "SELECT Codigo_Tarea, Nombre_Tarea, Decripcion_Tarea, Codigo_Referencia, Fecha_Inicio, Fecha_Fin FROM vw_Top15TareasMasAntiguas";

                using (SqlCommand command = new SqlCommand(query, conexion.conectarbd))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Dictionary<string, object> resultado = new Dictionary<string, object>
                            {
                                ["Codigo_Tarea"] = reader["Codigo_Tarea"],
                                ["Nombre_Tarea"] = reader["Nombre_Tarea"],
                                ["Decripcion_Tarea"] = reader["Decripcion_Tarea"],
                                ["Codigo_Referencia"] = reader["Codigo_Referencia"],
                                ["Fecha_Inicio"] = reader["Fecha_Inicio"],
                                ["Fecha_Fin"] = reader["Fecha_Fin"]
                            };
                            resultados.Add(resultado);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener el Top 15 de tareas más antiguas: " + ex.Message);
            }
            finally
            {
                conexion.Cerrar();
            }

            return resultados;
        }

        
        /**
         * Consulta la cantidad de clientes y el monto total de ventas agrupados por zona.
         *
         * Este método se conecta a la base de datos y ejecuta una consulta sobre la vista
         * `vw_ClientesVentasPorZona`. Devuelve una lista de diccionarios, donde cada diccionario
         * contiene los datos agrupados por zona: el nombre de la zona, la cantidad de clientes
         * y el monto total de ventas en esa zona.
         *
         * @return List<Dictionary<String, Object>> Una lista de diccionarios con las siguientes claves:
         *         <ul>
         *           <li><b>Zona:</b> El nombre de la zona geográfica.</li>
         *           <li><b>CantidadClientes:</b> La cantidad de clientes únicos en la zona.</li>
         *           <li><b>MontoTotalVentas:</b> El monto total de las ventas en la zona.</li>
         *         </ul>
         *
         * @throws Exception Si ocurre algún problema al conectar con la base de datos
         *                   o ejecutar la consulta.
         *
         * @see vw_ClientesVentasPorZona Vista en la base de datos que agrupa los datos.
         */
        public List<Dictionary<string, object>> ConsultarClientesVentasPorZona()
        {
            List<Dictionary<string, object>> resultados = new List<Dictionary<string, object>>();
            conexion.Abrir();

            string query = "SELECT Zona, CantidadClientes, MontoTotalVentas FROM vw_ClientesVentasPorZona";

            using (SqlCommand command = new SqlCommand(query, conexion.conectarbd))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Dictionary<string, object> resultado = new Dictionary<string, object>
                {
                    { "Zona", reader["Zona"] },
                    { "CantidadClientes", reader["CantidadClientes"] },
                    { "MontoTotalVentas", reader["MontoTotalVentas"] }
                };
                        resultados.Add(resultado);
                    }
                }
            }

            conexion.Cerrar();
            return resultados;
        }

        
        /// <summary>
        /// Obtiene los datos de ventas y cotizaciones agrupados por mes y año desde la vista `vw_VentasYCotizacionesMensualesAnuales`.
        /// </summary>
        /// <returns>
        /// Una lista de diccionarios, donde cada registro contiene:
        /// - "Anio": El año.
        /// - "Mes": El mes.
        /// - "TotalVentas": El monto total de ventas (puede ser null).
        /// - "TotalCotizaciones": El monto total de cotizaciones (puede ser null).
        /// </returns>
        /// <exception cref="Exception">
        /// Lanza una excepción si ocurre un error al consultar la base de datos.
        /// </exception>
        public List<Dictionary<string, object>> ObtenerVentasYCotizacionesMensualesAnuales()
        {
            List<Dictionary<string, object>> resultados = new List<Dictionary<string, object>>();
        
            try
            {
                // Abre la conexión a la base de datos.
                conexion.Abrir();
        
                // Consulta la vista.
                string query = "SELECT * FROM vw_VentasYCotizacionesMensualesAnuales ORDER BY Anio, Mes";
        
                using (SqlCommand command = new SqlCommand(query, conexion.conectarbd))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // Lee los datos y los agrega a la lista.
                        while (reader.Read())
                        {
                            Dictionary<string, object> resultado = new Dictionary<string, object>
                            {
                                { "Anio", reader["Anio"] },
                                { "Mes", reader["Mes"] },
                                { "TotalVentas", reader["TotalVentas"] != DBNull.Value ? (decimal?)reader["TotalVentas"] : null },
                                { "TotalCotizaciones", reader["TotalCotizaciones"] != DBNull.Value ? (decimal?)reader["TotalCotizaciones"] : null }
                            };
                            resultados.Add(resultado);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener ventas y cotizaciones mensuales y anuales: " + ex.Message);
            }
            finally
            {
                conexion.Cerrar();
            }
        
            return resultados;
        }

        /// <summary>
        /// Obtiene los datos de la vista vw_PlanillaPorDepartamentoMes,
        /// agrupando por departamento y sumando los montos totales.
        /// </summary>
        /// <returns>Lista de diccionarios con el departamento y el monto total de salarios pagados.</returns>
        public List<Dictionary<string, object>> PlanillaPorDepartamentoMes()
        {
            List<Dictionary<string, object>> resultados = new List<Dictionary<string, object>>();

            try
            {
                // Abrir la conexión a la base de datos
                conexion.Abrir();

                // Consulta para obtener los datos de la vista
                string query = @"
                    SELECT 
                        Departamento, 
                        SUM(MontoTotal) AS MontoTotal
                    FROM vw_PlanillaPorDepartamentoMes
                    GROUP BY Departamento";

                // Ejecutar la consulta
                using (SqlCommand command = new SqlCommand(query, conexion.conectarbd))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // Leer los resultados
                        while (reader.Read())
                        {
                            Dictionary<string, object> resultado = new Dictionary<string, object>
                            {
                                { "Departamento", reader["Departamento"] },
                                { "MontoTotal", reader["MontoTotal"] }
                            };
                            resultados.Add(resultado);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Manejar errores y registrar el mensaje de error
                throw new Exception("Error al obtener datos de la planilla por departamento: " + ex.Message);
            }
            finally
            {
                // Cerrar la conexión a la base de datos
                conexion.Cerrar();
            }

            return resultados;
        }

        /**
         * Obtiene el monto total pagado por planilla agrupado por año y mes.
         * Los datos son calculados a partir de la vista `vw_MontoPagadoPorPlanillaMesAnio`.
         *
         * @return Una lista de diccionarios donde cada elemento contiene:
         *         - "Anio" (int): El año en el que se generaron las planillas.
         *         - "Mes" (int): El número del mes (1 para enero, 2 para febrero, etc.).
         *         - "MontoTotal" (decimal): El monto total pagado por planillas en ese mes y año.
         * @throws Exception Si ocurre un error durante la consulta o la conexión con la base de datos.
         */
        public List<Dictionary<string, object>> MontoPagadoPorPlanillaMesAnio()
        {
            List<Dictionary<string, object>> resultados = new List<Dictionary<string, object>>();

            try
            {
                // Abrir la conexión a la base de datos
                conexion.Abrir();

                // Consulta para obtener los datos de la vista
                string query = "SELECT Anio, Mes, MontoTotal FROM vw_MontoPagadoPorPlanillaMesAnio";

                // Ejecutar la consulta
                using (SqlCommand command = new SqlCommand(query, conexion.conectarbd))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // Leer los resultados
                        while (reader.Read())
                        {
                            Dictionary<string, object> resultado = new Dictionary<string, object>
                            {
                                { "Anio", reader["Anio"] },
                                { "Mes", reader["Mes"] },
                                { "MontoTotal", reader["MontoTotal"] }
                            };
                            resultados.Add(resultado);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Manejar errores y registrar el mensaje de error
                throw new Exception("Error al obtener datos del monto pagado por planilla: " + ex.Message);
            }
            finally
            {
                // Cerrar la conexión a la base de datos
                conexion.Cerrar();
            }

            return resultados;
        }

        /**
         * @summary Método para obtener el top de bodegas con más artículos almacenados.
         * @description Consulta la vista `vw_TopBodegasMasArticulos` y permite ordenar los resultados.
         * @param sortOrder Define el orden: ascendente ("asc") o descendente ("desc").
         * @returns List<Dictionary<string, object>> - Lista con el código, nombre de la bodega y cantidad total de artículos.
         */
        public List<Dictionary<string, object>> TopBodegasMasArticulos(string sortOrder = "desc")
        {
            List<Dictionary<string, object>> resultados = new List<Dictionary<string, object>>();
        
            try
            {
                conexion.Abrir();
        
                string query = "SELECT TOP 10 Codigo_Bodega, Nombre, CantidadTotal FROM vw_TopBodegasMasArticulos ";
        
                // Agregar ordenación dinámica
                if (sortOrder == "asc")
                {
                    query += "ORDER BY CantidadTotal ASC";
                }
                else
                {
                    query += "ORDER BY CantidadTotal DESC";
                }
        
                using (SqlCommand command = new SqlCommand(query, conexion.conectarbd))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Dictionary<string, object> resultado = new Dictionary<string, object>
                    {
                        { "Codigo_Bodega", reader["Codigo_Bodega"] },
                        { "Nombre", reader["Nombre"] },
                        { "CantidadTotal", reader["CantidadTotal"] }
                    };
                            resultados.Add(resultado);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener el top de bodegas: " + ex.Message);
            }
            finally
            {
                conexion.Cerrar();
            }
        
            return resultados;
        }

    }

}
