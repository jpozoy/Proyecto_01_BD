-- Vista de listado de Usuarios
create or alter view Listado_Usuarios
as
select Cedula, CONCAT(Nombre, ' ', Apellido1, ' ', Apellido2) as Nombre_Completo
from Usuario
go

select * from Listado_Usuarios
go

-- Modulo de crear cotizaciones

-- Vista de listado de clientes
create or alter view Listado_Clientes
as 
select Cedula, CONCAT(Nombre, ' ', Apellido1, ' ', Apellido2)  as Nombre_Completo
from Cliente
go


SELECT Cedula, Nombre_Completo FROM Listado_Usuarios