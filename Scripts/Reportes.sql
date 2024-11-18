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

CREATE OR ALTER FUNCTION FiltrarMovimientosPorBodega(
    @Mes INT = NULL,
    @Anio INT = NULL,
    @FechaInicio DATE = NULL,
    @FechaFin DATE = NULL,
    @TipoMovimiento NVARCHAR(10) = NULL -- Valores posibles: 'Entrada', 'Salida', NULL para ambos
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        b.Nombre AS NombreBodega,
        CASE 
            WHEN @TipoMovimiento = 'Entrada' OR @TipoMovimiento IS NULL 
            THEN COUNT(DISTINCT ei.Codigo_Movimiento)
            ELSE 0 
        END AS TotalEntradas,
        CASE 
            WHEN @TipoMovimiento = 'Salida' OR @TipoMovimiento IS NULL 
            THEN COUNT(DISTINCT f.Numero_Factura)
            ELSE 0 
        END AS TotalSalidas,
        CASE 
            WHEN @TipoMovimiento IS NULL 
            THEN COUNT(DISTINCT ei.Codigo_Movimiento) + COUNT(DISTINCT f.Numero_Factura)
            ELSE 0
        END AS TotalMovimientos
    FROM 
        Bodega b
    LEFT JOIN 
        Entrada_Inventario ei ON b.Codigo_Bodega = ei.Bodega_Destino
    LEFT JOIN 
        Detalle_Factura df ON b.Codigo_Bodega = df.Codigo_Bodega
    LEFT JOIN 
        Factura f ON df.Numero_Factura = f.Numero_Factura
    WHERE 
        (@Mes IS NULL OR (MONTH(ei.Fecha_Hora) = @Mes OR MONTH(f.Fecha) = @Mes))
        AND (@Anio IS NULL OR (YEAR(ei.Fecha_Hora) = @Anio OR YEAR(f.Fecha) = @Anio))
        AND (@FechaInicio IS NULL OR (ei.Fecha_Hora >= @FechaInicio OR f.Fecha >= @FechaInicio))
        AND (@FechaFin IS NULL OR (ei.Fecha_Hora <= @FechaFin OR f.Fecha <= @FechaFin))
    GROUP BY 
        b.Nombre
    HAVING 
        (COUNT(DISTINCT ei.Codigo_Movimiento) > 0 OR COUNT(DISTINCT f.Numero_Factura) > 0)
);
GO


SELECT * 
FROM dbo.FiltrarMovimientosPorBodega(NULL, NULL, NULL, NULL, NULL);
GO

-- Consulta para top de articulos transados
CREATE OR ALTER VIEW Top_Bodegas_Movimientos AS
WITH Movimientos_Bodega AS (
    -- Contar movimientos donde la bodega es de origen
    SELECT 
        Bodega_Origen AS Codigo_Bodega,
        SUM(MA.Cantidad) AS Total_Articulos
    FROM 
        Movimiento_Inventario MI
    INNER JOIN 
        Movimiento_Articulo MA ON MI.Codigo_Movimiento = MA.Codigo_Movimiento
    GROUP BY 
        Bodega_Origen

    UNION ALL

    -- Contar movimientos donde la bodega es de destino
    SELECT 
        Bodega_Destino AS Codigo_Bodega,
        SUM(MA.Cantidad) AS Total_Articulos
    FROM 
        Movimiento_Inventario MI
    INNER JOIN 
        Movimiento_Articulo MA ON MI.Codigo_Movimiento = MA.Codigo_Movimiento
    GROUP BY 
        Bodega_Destino
)
-- Sumar totales de entrada y salida para cada bodega
SELECT 
    B.Codigo_Bodega,
    B.Nombre AS Nombre_Bodega,
    SUM(Total_Articulos) AS Total_Transacciones
FROM 
    Movimientos_Bodega MB
INNER JOIN 
    Bodega B ON MB.Codigo_Bodega = B.Codigo_Bodega
GROUP BY 
    B.Codigo_Bodega, B.Nombre;
GO

SELECT TOP 10 *
FROM Top_Bodegas_Movimientos
ORDER BY Total_Transacciones DESC;
GO


