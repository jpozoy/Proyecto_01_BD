-- Vista de listado de Usuarios
create or alter view Listado_Usuarios
as
select Cedula, CONCAT(Nombre, ' ', Apellido1, ' ', Apellido2) as Nombre_Completo
from Usuario
go

select * from Listado_Usuarios
go


-- Vista de listado de clientes
create or alter view Listado_Clientes
as 
select Cedula, CONCAT(Nombre, ' ', Apellido1, ' ', Apellido2)  as Nombre_Completo
from Cliente
go

-- Modulo de crear cotizaciones

-- Vista para listado de cotizaciones
create or alter view Listado_Cotizaciones
as
select Codigo_Cotizacion, Cliente, Vendedor,Fecha, Monto_Total, Estado
from Cotizacion
go

select * from Listado_Cotizaciones


select * from Cotizacion
go

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


---vw para planilla

CREATE VIEW vw_PlanillaDetalle AS
SELECT
    p.Codigo_Planilla,
    u.Cedula,
    u.Nombre,
    u.Apellido1,
    u.Apellido2,
    pu.Horas_Trabajadas,
    pu.Horas_Extras,
    pu.Salario_Pagado,
    pu.Departamento
FROM
    Planilla p
JOIN
    Planilla_Usuario pu ON p.Codigo_Planilla = pu.Codigo_Planilla
JOIN
    Usuario u ON u.Cedula = pu.Cedula_Usuario;

SELECT 
    r.Nombre_Rol, 
    u.Cedula, 
    CONCAT(u.Nombre, ' ', u.Apellido1, ' ', u.Apellido2) AS NombreCompleto
FROM 
    Rol r
JOIN 
    Rol_Usuarios ru ON r.Nombre_Rol = ru.Nombre_Rol
JOIN 
    Usuario u ON ru.Cedula_Usuario = u.Cedula
ORDER BY 
    r.Nombre_Rol;

--- Top 15 tareas más antiguas sin cerrar
CREATE VIEW vw_Top15TareasMasAntiguas AS
SELECT TOP 15
    Codigo_Tarea,
    Nombre_Tarea,
    Decripcion_Tarea,
    Codigo_Referencia,
    Fecha_Inicio,
    Fecha_Fin
FROM (
    -- Tareas de Cotización
    SELECT 
        Codigo_Tarea,
        Nombre_Tarea,
        Decripcion_Tarea,
        Codigo_Cotizacion AS Codigo_Referencia,
        Fecha_Inicio,
        Fecha_Fin
    FROM Tareas_Cotizacion

    UNION ALL

    -- Tareas de Caso
    SELECT 
        Codigo_Tarea,
        Nombre_Tarea,
        Decripcion_Tarea,
        Codigo_Caso AS Codigo_Referencia,
        Fecha_Inicio,
        Fecha_Fin
    FROM Tareas_Caso

    UNION ALL

    -- Cotizaciones con estados 'aprobada' o 'denegada' con fecha de cierre
    SELECT 
        'COT-' + Codigo_Cotizacion AS Codigo_Tarea,
        'Cotización ' + CAST(Codigo_Cotizacion AS VARCHAR(20)) AS Nombre_Tarea,
        Descripcion AS Decripcion_Tarea,
        Codigo_Cotizacion AS Codigo_Referencia,
        Fecha AS Fecha_Inicio,
        Fecha_Cierre AS Fecha_Fin
    FROM Cotizacion
    WHERE Estado IN ('aprobada', 'denegada') AND Fecha_Cierre IS NOT NULL
) AS TareasCombinadas
ORDER BY Fecha_Inicio ASC;

---Cantidad de clientes por zona y cantidad de ventas por zona
CREATE VIEW vw_ClientesVentasPorZona AS
SELECT 
    c.Zona, ---cliente zona
    COUNT(DISTINCT c.Cedula) AS CantidadClientes, ---Contar la cantidad de clientes
    ISNULL(SUM(f.Monto), 0) AS MontoTotalVentas  --- Sumar el total de ventas
FROM 
    Cliente c
LEFT JOIN 
    Factura f ON c.Cedula = f.Cliente ---Factura
GROUP BY 
    c.Zona; ---Se agrupa por zona
GO
SELECT * FROM vw_ClientesVentasPorZona;

---Ventas y cotizaciones por mes, por año. Gráfico de barras. Sin filtro 
CREATE OR ALTER VIEW vw_VentasYCotizacionesMensualesAnuales AS
SELECT 
    YEAR(Fecha) AS Anio,
    MONTH(Fecha) AS Mes,
    SUM(Monto) AS TotalVentas,
    NULL AS TotalCotizaciones -- Ventas de la tabla Factura
FROM Factura
GROUP BY YEAR(Fecha), MONTH(Fecha)

UNION ALL

SELECT 
    YEAR(Fecha_Cierre) AS Anio,
    MONTH(Fecha_Cierre) AS Mes,
    NULL AS TotalVentas,
    SUM(Monto_Total) AS TotalCotizaciones -- Cotizaciones de la tabla Cotizacion con fecha de cierre
FROM Cotizacion
WHERE Estado IN ('aprobada', 'denegada','abierta')
GROUP BY YEAR(Fecha_Cierre), MONTH(Fecha_Cierre);


select * from Cotizacion
SELECT * FROM vw_VentasYCotizacionesMensualesAnuales;

--Planilla por departamento, por mes. Departamento y monto. Gráfico circular. 
CREATE OR ALTER VIEW vw_PlanillaPorDepartamentoMes AS
SELECT 
    p.Codigo_Planilla,
    MONTH(p.Fecha) AS Mes,
    YEAR(p.Fecha) AS Anio,
    pu.Departamento,
    SUM(pu.Salario_Pagado) AS MontoTotal
FROM Planilla p
JOIN Planilla_Usuario pu ON p.Codigo_Planilla = pu.Codigo_Planilla
GROUP BY p.Codigo_Planilla, MONTH(p.Fecha), YEAR(p.Fecha), pu.Departamento;

select * from vw_PlanillaPorDepartamentoMes

--- Monto pagado por planilla por mes y por año
CREATE OR ALTER VIEW vw_MontoPagadoPorPlanillaMesAnio AS
SELECT 
    YEAR(Fecha) AS Anio,
    MONTH(Fecha) AS Mes,
    SUM(Monto) AS MontoTotal
FROM Planilla
GROUP BY YEAR(Fecha), MONTH(Fecha);

select * from vw_MontoPagadoPorPlanillaMesAnio

/**
 * @summary Vista para obtener el top de bodegas con más artículos almacenados.
 * @description Esta vista calcula la cantidad total de artículos almacenados en cada bodega
 *              y ordena las bodegas en orden descendente según la cantidad.
 * @returns Bodega (Código de bodega), Nombre (Nombre de la bodega), CantidadTotal (Total de artículos).
 */
/**
 * @summary Vista para obtener el top de bodegas con más artículos almacenados.
 * @description Esta vista calcula la cantidad total de artículos almacenados en cada bodega.
 * @returns Bodega (Código de bodega), Nombre (Nombre de la bodega), CantidadTotal (Total de artículos).
 */
CREATE OR ALTER VIEW vw_TopBodegasMasArticulos AS
SELECT 
    b.Codigo_Bodega,
    b.Nombre,
    SUM(i.Cantidad) AS CantidadTotal
FROM 
    Inventario i
JOIN 
    Bodega b ON i.Codigo_Bodega = b.Codigo_Bodega
GROUP BY 
    b.Codigo_Bodega, b.Nombre;

SELECT TOP 10 *
FROM vw_TopBodegasMasArticulos
ORDER BY CantidadTotal DESC;


/**
 * @summary Vista para obtener el Top 10 de productos más vendidos.
 * @description Calcula el total de productos vendidos agrupados por artículo.
 * @returns Código de artículo, nombre, descripción y cantidad total vendida.
 */
CREATE OR ALTER VIEW vw_TopProductosMasVendidos AS
SELECT 
    a.Codigo_Articulo,
    a.Nombre_Articulo,
    a.Descripcion,
    SUM(df.Cantidad) AS CantidadVendida
FROM 
    Detalle_Factura df
JOIN 
    Articulo a ON df.Articulo = a.Codigo_Articulo
GROUP BY 
    a.Codigo_Articulo, a.Nombre_Articulo, a.Descripcion

SELECT TOP 10 * 
FROM vw_TopProductosMasVendidos
ORDER BY CantidadVendida DESC;

/**
 * @file vw_TopProductosComprados.sql
 * @description Vista para obtener el Top 10 de productos más comprados, basado en la cantidad total de artículos y el monto total.
 * La vista utiliza datos de las tablas Entrada_Articulo y Articulo.
 */

CREATE OR ALTER VIEW vw_TopProductosComprados AS
SELECT TOP 10
    a.Nombre_Articulo AS Descripcion,
    SUM(ea.Cantidad) AS TotalCantidad,
    SUM(ea.Cantidad * a.Precio_Estandar) AS TotalMonto
FROM Entrada_Articulo ea
JOIN Articulo a ON ea.Codigo_Articulo = a.Codigo_Articulo
GROUP BY a.Nombre_Articulo

SELECT TOP 10 * FROM vw_TopProductosComprados
ORDER BY TotalCantidad DESC;



