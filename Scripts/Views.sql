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