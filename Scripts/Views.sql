-- Vista de listado de Usuarios
create view Listado_Usuarios
as
select Cedula, Concat(Nombre, Apellido1, Apellido2) as Nombre_Completo, Correo, Puesto 
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

select * from Listado_Clientes