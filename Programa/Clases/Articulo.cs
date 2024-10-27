namespace Proyecto_01_BD.Clases
{
    public class Articulo
    {
        public string CodigoArticulo { get; set; }
        public string NombreArticulo { get; set; }
        public int Cantidad { get; set; }

        // Constructor vac�o
        public Articulo() { }

        // Constructor con par�metros
        public Articulo(string codigoArticulo, string nombreArticulo, int cantidad)
        {
            CodigoArticulo = codigoArticulo;
            NombreArticulo = nombreArticulo;
            Cantidad = cantidad;
        }
    }
}
