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


