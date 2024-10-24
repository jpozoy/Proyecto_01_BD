-- Procedimiento para guardar usuarios
create procedure Registrar_Usuario
@Cedula varchar(12), @Nombre varchar(20), @Apellido1 varchar(20), @Apellido2 varchar(20), @Telefono varchar(8), @Correo varchar(50), @Fecha_Nacimiento Date,
@Lugar_Residencia varchar(20), @Fecha_Ingreso Date, @Salario decimal(18,2), @Puesto varchar(20), @Departamento varchar(20), @Contrasena varchar(60)
as
begin
	--Insertar datos de Usuario
	insert into Usuario (Cedula, Nombre, Apellido1, Apellido2, Telefono, Correo, Fecha_Nacimiento, Lugar_Residencia, Fecha_Ingreso, Salario, Puesto, Departamento, Contrasena)
    values (@Cedula, @Nombre, @Apellido1, @Apellido2, @Telefono, @Correo, @Fecha_Nacimiento, @Lugar_Residencia, @Fecha_Ingreso, @Salario, @Puesto, @Departamento, @Contrasena);
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
select * from Historico_Salario
select * from Usuario
go
--Procedimiento almacenda para crear un rol

create procedure Crear_Rol 
@Rol_Nombre varchar(20), 
@Accion varchar(20), 
@Module varchar(20)
as
begin
    -- Comenzar una transacci�n para mantener la consistencia
    begin tran;
    
    -- Verificar si el rol ya existe
    if not exists (select 1 from Rol where Nombre_Rol = @Rol_Nombre)
    begin
        -- Insertar el nuevo rol en la tabla Rol si no existe
        insert into Rol (Nombre_Rol) values (@Rol_Nombre);
    end

    -- Insertar la relaci�n en la tabla intermedia Rol_Modulo_Accion
    insert into Rol_Modulo_Accion (Nombre_Rol, Accion, Modulo) 
    values (@Rol_Nombre, @Accion, @Module);

    -- Confirmar la transacci�n
    commit tran;
end;
go

exec Crear_Rol 'Admin', 'Edici�n' ,'Casos'
exec Crear_Rol 'Admin', 'Reportes' ,'Casos'

select * from Rol_Modulo_Accion
go

-- Procedimiento almacenado para asignar roles a usuarios, evitando duplicados
create procedure Asignar_Rol 
    @Cedula varchar(12), 
    @Rol varchar(20)
as
begin
    -- Verificar si el rol ya est� asignado al usuario
    if not exists (
        select 1 
        from Rol_Usuarios 
        where Cedula_Usuario = @Cedula 
          and Nombre_Rol = @Rol
    )
    begin
        -- Si no existe, insertar el nuevo registro
        insert into Rol_Usuarios (Cedula_Usuario, Nombre_Rol) 
        values (@Cedula, @Rol)
    end
end;
