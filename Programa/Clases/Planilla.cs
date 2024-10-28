using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto_01_BD.Clases
{
    public class RegistroPlanilla
    {
        public string Cedula { get; set; }
        public int HorasTrabajadas { get; set; }
        public int HorasExtras { get; set; }
        public decimal Salario { get; set; }
        public decimal SalarioTotal { get; set; }

        // Método para registrar un registro de planilla en la base de datos
        public void RegistrarPlanilla(RegistroPlanilla registro)
        {
            ConexionBD conexion = new ConexionBD();
            conexion.Abrir();

            using (SqlCommand command = new SqlCommand("sp_RegistrarPlanilla", conexion.conectarbd))
            {
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@Cedula", registro.Cedula);
                command.Parameters.AddWithValue("@HorasTrabajadas", registro.HorasTrabajadas);
                command.Parameters.AddWithValue("@HorasExtras", registro.HorasExtras);
                command.Parameters.AddWithValue("@Salario", registro.Salario);

                // Parámetro de salida para el salario total calculado
                var outputParam = new SqlParameter("@SalarioTotal", SqlDbType.Decimal)
                {
                    Direction = ParameterDirection.Output
                };
                command.Parameters.Add(outputParam);

                command.ExecuteNonQuery();

                registro.SalarioTotal = (decimal)outputParam.Value;
            }

            conexion.Cerrar();
        }

        // Método para obtener todos los registros de planilla
         public static List<RegistroPlanilla> ObtenerRegistros()
         {
             List<RegistroPlanilla> registros = new List<RegistroPlanilla>();
        
             ConexionBD conexion = new ConexionBD();
             conexion.Abrir();
        
             // Cambiamos la consulta para que seleccione desde Planilla_Usuario
             using (SqlCommand command = new SqlCommand(
                 "SELECT Cedula_Usuario AS Cedula, Horas_Trabajadas AS HorasTrabajadas, " +
                 "Horas_Extras AS HorasExtras, Salario_Pagado AS SalarioTotal " +
                 "FROM Planilla_Usuario", conexion.conectarbd))
             {
                 using (SqlDataReader reader = command.ExecuteReader())
                 {
                     while (reader.Read())
                     {
                         registros.Add(new RegistroPlanilla
                         {
                             Cedula = reader["Cedula"].ToString(),
                             HorasTrabajadas = Convert.ToInt32(reader["HorasTrabajadas"]),
                             HorasExtras = Convert.ToInt32(reader["HorasExtras"]),
                             SalarioTotal = Convert.ToDecimal(reader["SalarioTotal"])
                         });
                     }
                 }
             }
        
             conexion.Cerrar();
             return registros;
         }
    }
}
