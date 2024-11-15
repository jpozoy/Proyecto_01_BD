-- Reportes --

-- Top 10 productos más cotizados
CREATE VIEW Top10_ProductosCotizados AS
SELECT TOP 10
    a.Nombre_Articulo,
    a.Descripcion,
    SUM(ca.Cantidad) AS Total_Cotizado
FROM 
    Articulo a
JOIN 
    Cotizacion_Articulos ca ON a.Codigo_Articulo = ca.Articulo
GROUP BY 
    a.Nombre_Articulo, a.Descripcion
ORDER BY 
    Total_Cotizado DESC;
Go

select * From Top10_ProductosCotizados;

select * From Factura
Go

CREATE OR ALTER VIEW VentasPorSector AS
SELECT 
    c.Sector AS Sector,
    f.Fecha AS Fecha,              
    SUM(f.Monto) AS Total_Ventas
FROM 
    Factura f
JOIN 
    Cliente c ON f.Cliente = c.Cedula
GROUP BY 
    c.Sector, f.Fecha;   
Go

select Sector, Total_Ventas from VentasPorSector

Go

CREATE FUNCTION dbo.Fn_VentasPorSector (
    @FechaInicio DATE,
    @FechaFin DATE
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        Sector,
        SUM(Total_Ventas) AS Total_Ventas
    FROM 
        VentasPorSector
    WHERE 
        Fecha BETWEEN @FechaInicio AND @FechaFin
    GROUP BY 
        Sector
);

DECLARE @FechaInicio DATE = '2023-01-01';
DECLARE @FechaFin DATE = '2023-12-31';

SELECT *
FROM dbo.Fn_VentasPorSector(@FechaInicio, @FechaFin)
ORDER BY Total_Ventas DESC;