-- Reportes --

-- Top 10 productos más cotizados
CREATE OR ALTER VIEW Top10_ProductosCotizados AS
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
FROM dbo.FiltrarVentasPorSector(NULL, NULL, NULL, NULL);
GO

SELECT * 
FROM dbo.FiltrarVentasPorSector('10', '2023', NULL, NULL);
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


-- Consulta sin filtro de año.
SELECT * 
FROM dbo.FiltrarVentasPorFamilia(NULL, NULL, NULL, NULL);
-- Consulta con rangos de fechas. 
SELECT * 
FROM dbo.FiltrarVentasPorFamilia(NULL, NULL, '2024-01-01', '2024-03-30');
-- Consulta con filtro de mes-año.
SELECT * 
FROM dbo.FiltrarVentasPorFamilia(1, 2024, NULL, NULL);
GO

-- Consulta para reportes de ventas y cotizaciones por departamento
CREATE OR ALTER FUNCTION FiltrarVentasYCotizacionesPorDepartamento(
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
        u.Departamento,
        COUNT(DISTINCT f.Numero_Factura) AS TotalVentas,
        COUNT(DISTINCT c.Codigo_Cotizacion) AS TotalCotizaciones
    FROM 
        Usuario u
    LEFT JOIN 
        Factura f ON u.Cedula = f.Vendedor
    LEFT JOIN 
        Cotizacion c ON u.Cedula = c.Vendedor
    WHERE 
        (@Mes IS NULL OR (MONTH(f.Fecha) = @Mes OR MONTH(c.Fecha) = @Mes))
        AND (@Anio IS NULL OR (YEAR(f.Fecha) = @Anio OR YEAR(c.Fecha) = @Anio))
        AND (@FechaInicio IS NULL OR (f.Fecha >= @FechaInicio OR c.Fecha >= @FechaInicio))
        AND (@FechaFin IS NULL OR (f.Fecha <= @FechaFin OR c.Fecha <= @FechaFin))
    GROUP BY 
        u.Departamento
    HAVING 
        COUNT(DISTINCT f.Numero_Factura) > 0 OR COUNT(DISTINCT c.Codigo_Cotizacion) > 0
);
GO


SELECT * 
FROM FiltrarVentasYCotizacionesPorDepartamento(NULL, NULL, NULL, NULL);


select * from Movimiento_Inventario
select * from Inventario



