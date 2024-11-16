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

-- Reporte de ventas por sector.

SELECT *
FROM dbo.Fn_VentasPorSector(@FechaInicio, @FechaFin)
ORDER BY Total_Ventas DESC;

CREATE OR ALTER FUNCTION FiltrarVentasPorSector(
    @Mes INT = NULL,
    @Anio INT = NULL,
    @FechaInicio DATE = NULL,
    @FechaFin DATE = NULL
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        Sector,
        Fecha,
        Total_Ventas
    FROM 
        VentasPorSector
    WHERE 
        (@Mes IS NULL OR MONTH(Fecha) = @Mes)
        AND (@Anio IS NULL OR YEAR(Fecha) = @Anio)
        AND (@FechaInicio IS NULL OR Fecha >= @FechaInicio)
        AND (@FechaFin IS NULL OR Fecha <= @FechaFin)
);
GO

SELECT * 
FROM dbo.FiltrarVentasPorSector('10', '2023', NULL, NULL);\
GO

-- Reporte de familias vendidas
CREATE OR ALTER FUNCTION FiltrarVentasPorFamilia(
    @Mes INT = NULL,
    @Anio INT = NULL,
    @FechaInicio DATE = NULL,
    @FechaFin DATE = NULL
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        a.Codigo_Familia AS CodigoFamilia,
        fa.Nombre_Familia AS NombreFamilia,
        SUM(df.Cantidad * a.Precio_Estandar) AS TotalVentas
    FROM 
        Detalle_Factura df
    JOIN 
        Articulo a ON df.Articulo = a.Codigo_Articulo
    JOIN 
        Familia fa ON a.Codigo_Familia = fa.Codigo_Familia
    JOIN 
        Factura f ON df.Numero_Factura = f.Numero_Factura
    WHERE 
        (@Mes IS NULL OR MONTH(f.Fecha) = @Mes)
        AND (@Anio IS NULL OR YEAR(f.Fecha) = @Anio)
        AND (@FechaInicio IS NULL OR f.Fecha >= @FechaInicio)
        AND (@FechaFin IS NULL OR f.Fecha <= @FechaFin)
    GROUP BY 
        a.Codigo_Familia, fa.Nombre_Familia
);
GO

SELECT * 
FROM dbo.FiltrarVentasPorFamilia(NULL, NULL, NULL, NULL);

select * from Movimiento_Inventario
select * from Inventario



