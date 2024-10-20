-- Procedimiento para guardar usuarios
create procedure Registrar_Usuario
@Cedula varchar(12), @Nombre varchar(20), @Apellido1 varchar(20), @Apellido2 varchar(20), @Telefono varchar(8), @Correo varchar(50), @Fecha_Nacimiento Date,
@Lugar_Residencia varchar(20), @Fecha_Ingreso Date, @Salario decimal(18,2), @Puesto varchar(20), @Departamento varchar(20), @Nombre_Rol varchar(12)
as
begin
	--Insertar datos de Usuario
	insert into Usuario (Cedula, Nombre, Apellido1, Apellido2, Telefono, Correo, Fecha_Nacimiento, Lugar_Residencia, Fecha_Ingreso, Salario, Puesto, Departamento, Nombre_Rol)
    values (@Cedula, @Nombre, @Apellido1, @Apellido2, @Telefono, @Correo, @Fecha_Nacimiento, @Lugar_Residencia, @Fecha_Ingreso, @Salario, @Puesto, @Departamento, @Nombre_Rol);
	--Insertar en historico puesto
	insert into Historico_Puesto (Cedula_Usuario, Fecha_Inicio, Puesto, Departamento)
	values (@Cedula, GETDATE() , @Puesto, @Departamento);
	--Insertar en historico salario
	insert into Historico_Salario (Cedula_Usuario, Fecha_Inicio, Puesto, Monto, Departamento)
	values (@Cedula, GETDATE(), @Puesto, @Salario, @Departamento);
end;
go




exec Registrar_Usuario '703040641', 'Jefferson', 'Pozo', 'Vallejos', '64819943', 'pozo@gmail.cr', '2003-11-30', 'Limon', '2024-10-19', 46500,'Gerente', 'Finanzas', 'CR001';
go

-- Procedimiento para editar usuarios (Gestionar salario)
create procedure Editar_Salario
@Cedula varchar(12), @Salario decimal(18,2)
as
begin
	--Actualizar el salario
	update Usuario
	set Salario = @Salario
	where Cedula = @Cedula

	--Actualizar el historico salario
	update Historico_Salario
	set Fecha_Fin = CAST(GETDATE() AS DATE)
	where Cedula_Usuario = @Cedula
	and Fecha_Fin is null;

	--Obtener el departamento y puesto del usuario actual
	declare @Departamento varchar(20), @Puesto varchar(20);
    select @Departamento = Departamento, @Puesto = Puesto
    from Usuario
    where Cedula = @Cedula;

	--Insertar el nuevo registro en Historico_Salario
	insert into Historico_Salario (Cedula_Usuario, Fecha_Inicio, Puesto, Monto, Departamento) 
	values (@Cedula, GETDATE(), @Puesto, @Salario, @Departamento)
end;
go

--Procedimiento para editar puesto
create procedure Editar_Puesto
@Cedula varchar(12), @Puesto varchar (20)
as
begin
	--Actualizar el salario
	update Usuario
	set Puesto = @Puesto
	where Cedula = @Cedula

	--Actualizar el historico salario
	update Historico_Puesto
	set Fecha_Fin = CAST(GETDATE() AS DATE)
	where Cedula_Usuario = @Cedula
	and Fecha_Fin is null;

	--Obtener el departamento actual
	declare @Departamento varchar(20)
    select @Departamento = Departamento
    from Usuario
    where Cedula = @Cedula;

	--Insertar el nuevo registro en Historico_Puesto
	insert into Historico_Puesto (Cedula_Usuario, Fecha_Inicio, Puesto, Departamento)
	values (@Cedula, GETDATE(), @Puesto, @Departamento);

end;
go

exec Editar_Salario '70304641', 645000;

select * from Historico_Puesto


