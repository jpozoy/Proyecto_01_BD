namespace Proyecto_01_BD.Clases
{
    public class Cotizacion
    {
        public string Codigo_Cotizacion { get; set; }
        public string Cliente { get; set; }

        public string Vendedor { get; set; }
        public DateTime Mes_Proyectado_Cierre { get; set; }

        public decimal Monto_Total { get; set; }
        public string Descripcion { get; set; }

        public DateTime Fecha { get; set; }
        public DateTime Fecha_Cierre { get; set; }
        public string ? Motivo_Denegacion { get; set; }

        public string ? Contra_Quien { get; set; }
        public string Estado { get; set; }
        public string Tipo { get; set; }
        public string Zona { get; set; }

        public string Sector { get; set; }

        public string Probabilidad { get; set; }

        //Crear un objeto nuevo de la conexion
        ConexionBD conexion = new ConexionBD();

    }
}
