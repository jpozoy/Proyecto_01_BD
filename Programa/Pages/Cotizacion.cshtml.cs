using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc;

public class CotizacionModel : PageModel
{
    [BindProperty]
    public List<Articulo> Articulos { get; set; } = new List<Articulo>();

    [BindProperty]
    public string NombreArticulo { get; set; }

    [BindProperty]
    public int CantidadArticulo { get; set; }

    public void OnPostAgregarArticulo()
    {
        // Agregar el nuevo artículo a la lista
        Articulos.Add(new Articulo
        {
            Nombre = NombreArticulo,
            Cantidad = CantidadArticulo
        });
    }

    public void OnPostEliminarArticulo(int index)
    {
        // Eliminar artículo de la lista por su índice
        if (index >= 0 && index < Articulos.Count)
        {
            Articulos.RemoveAt(index);
        }
    }

    public void OnPostGuardarCotizacion()
    {
        // Aquí procesarías la lista de artículos y el resto de la información
        // Guardar la cotización en la base de datos, por ejemplo
    }
}

public class Articulo
{
    public string Nombre { get; set; }
    public int Cantidad { get; set; }
}
