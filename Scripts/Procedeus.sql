use SistemaERP
go

-- Procedimiento para guardar usuarios
create or alter procedure Registrar_Usuario
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

-- Procedimiento para editar usuarios (Gestionar salario)
create or alter procedure Editar_Salario
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
create or alter procedure Editar_Puesto
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

--Procedimiento almacenda para crear un rol

create or alter procedure Crear_Rol 
@Rol_Nombre varchar(20), 
@Accion varchar(20), 
@Module varchar(20)
as
begin
    -- Comenzar una transacción para mantener la consistencia
    begin tran;
    
    -- Verificar si el rol ya existe
    if not exists (select 1 from Rol where Nombre_Rol = @Rol_Nombre)
    begin
        -- Insertar el nuevo rol en la tabla Rol si no existe
        insert into Rol (Nombre_Rol) values (@Rol_Nombre);
    end

    -- Insertar la relación en la tabla intermedia Rol_Modulo_Accion
    insert into Rol_Modulo_Accion (Nombre_Rol, Accion, Modulo) 
    values (@Rol_Nombre, @Accion, @Module);

    -- Confirmar la transacción
    commit tran;
end;
go

-- Procedimiento almacenado para asignar roles a usuarios, evitando duplicados
create or alter procedure Asignar_Rol 
    @Cedula varchar(12), 
    @Rol varchar(20)
as
begin
    -- Verificar si el rol ya está asignado al usuario
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
go

-- Modulo de cotizacion

-- Procedimiento para registra una cotizacion

CREATE OR ALTER PROCEDURE Registrar_Cotizacion
    @Cliente varchar(12),
    @Vendedor varchar(12),
    @Mes_Proyectado_Cierre date = NULL,
    @Descripcion varchar(50) = NULL,
    @Estado varchar(20) = NULL,
    @Tipo varchar(20) = NULL,
    @Zona varchar(30) = NULL,
    @Sector varchar(30) = NULL,
    @Probabilidad varchar(4) = NULL,
    @CodigoCotizacionSalida varchar(12) OUTPUT -- Parámetro de salida
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NuevoCodigo varchar(12);

    -- Generar el próximo Codigo_Cotizacion consecutivo
    SELECT @NuevoCodigo = 
        RIGHT('000000' + CAST(ISNULL(MAX(CAST(Codigo_Cotizacion AS INT)), 0) + 1 AS VARCHAR), 6)
    FROM Cotizacion;

    -- Insertar el nuevo registro con el Codigo_Cotizacion generado
    INSERT INTO Cotizacion (
        Codigo_Cotizacion,
        Cliente,
        Vendedor,
        Mes_Proyectado_Cierre,
        Descripcion,
		Fecha,
        Estado,
        Tipo,
        Zona,
        Sector,
        Probabilidad
    )
    VALUES (
        @NuevoCodigo,
        @Cliente,
        @Vendedor,
        @Mes_Proyectado_Cierre,
        @Descripcion,
		CAST(GETDATE() AS DATE),
        @Estado,
        @Tipo,
        @Zona,
        @Sector,
        @Probabilidad
    );

    -- Asignar el nuevo código al parámetro de salida
    SET @CodigoCotizacionSalida = @NuevoCodigo;
END;
go

-- Procedimiento para agregar articulos a la cotización
create or alter procedure Agregar_Articulos_Cotizacion 
	@Cotizacion varchar(12),
	@Articulo varchar(12),
	@Cantidad int
as
begin
	-- Agregar articulos a la tabla intermedia
	insert into Cotizacion_Articulos (Codigo_Cotizacion, Articulo, Cantidad)
	values (@Cotizacion, @Articulo, @Cantidad);
	
end;
go


select * from Cotizacion
select * from Cotizacion_Articulos

CREATE OR ALTER PROCEDURE sp_InsertarMovimientoInventario
    @TipoMovimiento VARCHAR(20),
    @CodigoArticulo INT,
    @CodigoBodegaOrigen INT = NULL,
    @CodigoBodegaDestino INT,
    @Cantidad INT,
    @FechaMovimiento DATETIME
AS
BEGIN
    BEGIN TRY
        INSERT INTO Movimiento_Inventario (TipoMovimiento, Codigo_Articulo, Codigo_Bodega_Origen, Codigo_Bodega_Destino, Cantidad, FechaMovimiento)
        VALUES (@TipoMovimiento, @CodigoArticulo, @CodigoBodegaOrigen, @CodigoBodegaDestino, @Cantidad, @FechaMovimiento);
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SELECT ERROR_MESSAGE() AS ErrorMensaje;
    END CATCH
END;
GO
