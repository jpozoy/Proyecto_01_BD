
--Funcion par obtener cotizacion por codigo.
CREATE OR ALTER FUNCTION ObtenerCotizacionPorCodigo (@CodigoCotizacion VARCHAR(12))
RETURNS TABLE
AS
RETURN (
    SELECT Codigo_Cotizacion, Cliente, Vendedor, Mes_Proyectado_Cierre, Monto_Total, Fecha, Fecha_Cierre, Estado, Tipo, Zona, Sector, Probabilidad, Descripcion
    FROM Cotizacion
    WHERE Codigo_Cotizacion = @CodigoCotizacion
);
go

--Funcion pra retornar articulos por codigo de cotizacion

CREATE OR ALTER FUNCTION Obtener_Articulos_Cotizacion (@CodigoCotizacion VARCHAR(12))
RETURNS TABLE
AS
Return (
		SELECT 
		ca.Codigo_Cotizacion,
		a.Codigo_Articulo,
		a.Nombre_Articulo,
		ca.Cantidad,
		a.Precio_Estandar
	FROM 
		Cotizacion_Articulos ca
	JOIN 
		Articulo a ON ca.Articulo = a.Codigo_Articulo
	WHERE 
		ca.Codigo_Cotizacion = @CodigoCotizacion
);
go

create or alter function obtener (@CodigoCotizacion varchar(12))
returns @cotiza table (
	Vendedor varchar(12),
	Codigo varchar(12)
)
as
begin
	insert into @cotiza
	select Vendedor, Codigo_Cotizacion from Cotizacion where Codigo_Cotizacion = @CodigoCotizacion;	
end;
