-- Vista de listado de Usuarios
create view Listado_Usuarios
as
select Cedula, Concat(Nombre, Apellido1, Apellido2) as Nombre_Completo, Correo, Puesto 
from Usuario
go

select * from Listado_Usuarios

CREATE VIEW Vista_ArticulosPorBodega
AS
SELECT 
    b.Codigo_Bodega, 
    b.Nombre AS Nombre_Bodega, 
    a.Codigo_Articulo, 
    a.Nombre_Articulo, 
    i.Cantidad
FROM 
    Inventario i
JOIN 
    Articulo a ON i.Codigo_Articulo = a.Codigo_Articulo
JOIN 
    Bodega b ON i.Codigo_Bodega = b.Codigo_Bodega;
GO
