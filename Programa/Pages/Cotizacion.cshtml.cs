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
        // Agregar el nuevo art�culo a la lista
        Articulos.Add(new Articulo
        {
            Nombre = NombreArticulo,
            Cantidad = CantidadArticulo
        });
    }

    public void OnPostEliminarArticulo(int index)
    {
        // Eliminar art�culo de la lista por su �ndice
        if (index >= 0 && index < Articulos.Count)
        {
            Articulos.RemoveAt(index);
        }
    }

    public void OnPostGuardarCotizacion()
    {
        // Aqu� procesar�as la lista de art�culos y el resto de la informaci�n
        // Guardar la cotizaci�n en la base de datos, por ejemplo
    }
}

public class Articulo
{
    public string Nombre { get; set; }
    public int Cantidad { get; set; }
}
