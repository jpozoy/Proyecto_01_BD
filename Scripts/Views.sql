-- Vista de listado de Usuarios
create view Listado_Usuarios
as
select Cedula, Concat(Nombre, Apellido1, Apellido2) as Nombre_Completo, Correo, Puesto 
from Usuario
go

select * from Listado_Usuarios