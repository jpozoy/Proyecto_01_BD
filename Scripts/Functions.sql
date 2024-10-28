
CREATE OR ALTER FUNCTION ObtenerCotizacionPorCodigo (@CodigoCotizacion VARCHAR(12))
RETURNS TABLE
AS
RETURN (
    SELECT Codigo_Cotizacion, Cliente, Vendedor, Mes_Proyectado_Cierre, Monto_Total, Fecha, Fecha_Cierre, Estado, Tipo, Zona, Sector, Probabilidad, Descripcion, Mes_Proyectado_Cierre
    FROM Cotizacion
    WHERE Codigo_Cotizacion = @CodigoCotizacion
);
go

select * from Cotizacion

select * from ObtenerCotizacionPorCodigo('000001')

select * from Cliente