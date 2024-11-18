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
        Probabilidad,
		Monto_Total
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
        @Probabilidad,
		0
    );

    -- Asignar el nuevo código al parámetro de salida
    SET @CodigoCotizacionSalida = @NuevoCodigo;
END;
go



-- Procedimiento para agregar articulos a la cotización
CREATE OR ALTER PROCEDURE Agregar_Articulos_Cotizacion 
    @Cotizacion VARCHAR(12),
    @Articulo VARCHAR(12),
    @Cantidad INT
AS
BEGIN
    -- Declarar variables para los cálculos
    DECLARE @PrecioUnitario DECIMAL(18, 2);
    DECLARE @SubtotalArticulo DECIMAL(18, 2);
    DECLARE @MontoTotalActual DECIMAL(18, 2);

    -- Obtener el precio unitario del artículo
    SELECT @PrecioUnitario = Precio_Estandar
    FROM Articulo
    WHERE Codigo_Articulo = @Articulo;

    -- Calcular el subtotal para el artículo
    SET @SubtotalArticulo = @PrecioUnitario * @Cantidad;

    -- Insertar el artículo en la tabla intermedia Cotizacion_Articulos
    INSERT INTO Cotizacion_Articulos (Codigo_Cotizacion, Articulo, Cantidad)
    VALUES (@Cotizacion, @Articulo, @Cantidad);

    -- Obtener el monto total actual de la cotización
    SELECT @MontoTotalActual = Monto_Total
    FROM Cotizacion
    WHERE Codigo_Cotizacion = @Cotizacion;

    -- Actualizar el monto total de la cotización sumando el nuevo subtotal
    UPDATE Cotizacion
    SET Monto_Total = @MontoTotalActual + @SubtotalArticulo
    WHERE Codigo_Cotizacion = @Cotizacion;
END;
GO


-- Procedimiento para editar cotizaci�n
create or alter procedure Editar_Cotizacion
	@Cotizacion varchar (12),
    @Cliente varchar(12),
    @Vendedor varchar(12),
    @Mes_Proyectado_Cierre date = NULL,
    @Descripcion varchar(50) = NULL,
    @Estado varchar(20) = NULL,
    @Tipo varchar(20) = NULL,
    @Zona varchar(30) = NULL,
    @Sector varchar(30) = NULL,
    @Probabilidad varchar(4) = NULL
as
begin
UPDATE Cotizacion
    set 
        Cliente = @Cliente,
        Vendedor = @Vendedor,
        Mes_Proyectado_Cierre = @Mes_Proyectado_Cierre,
        Descripcion = @Descripcion,
        Estado = @Estado,
        Tipo = @Tipo,
		Fecha = CAST(GETDATE() AS DATE),
        Zona = @Zona,
        Sector = @Sector,
        Probabilidad = @Probabilidad
    where Codigo_Cotizacion = @Cotizacion;
end;
go


---sp para registrar la planilla y calcula el pago
CREATE PROCEDURE sp_RegistrarPlanilla
    @Cedula VARCHAR(12),
    @HorasTrabajadas INT,
    @HorasExtras INT,
    @Salario DECIMAL(18, 2),
    @SalarioTotal DECIMAL(18, 2) OUTPUT
AS
BEGIN
    DECLARE @SalarioPorHora DECIMAL(18, 2);
    DECLARE @PagoHorasExtras DECIMAL(18, 2);

    -- Calcular el salario por hora
    SET @SalarioPorHora = @Salario / 200;

    -- Calcular el pago de las horas extras
    SET @PagoHorasExtras = @HorasExtras * @SalarioPorHora * 1.5;

    -- Salario total incluyendo el pago de horas extras
    SET @SalarioTotal = @Salario + @PagoHorasExtras;

    -- Insertar el registro en la tabla de planilla
    INSERT INTO Planilla_Usuario (Cedula_Usuario, Horas_Trabajadas, Horas_Extras, Salario_Pagado)
    VALUES (@Cedula, @HorasTrabajadas, @HorasExtras, @SalarioTotal);
END
Go;

--Procedimiento para Agregar ArticulosAFactura
CREATE OR ALTER PROCEDURE AgregarArticuloAFactura
    @Numero_Factura varchar(12),
    @Articulo varchar(12),
    @Cantidad int,
    @Codigo_Bodega varchar(12)
AS
BEGIN
    DECLARE @PrecioUnitario decimal(18,2);
    DECLARE @MontoTotalArticulo decimal(18,2);

    -- Obtener el precio unitario del artículo
    SELECT @PrecioUnitario = Precio_Estandar
    FROM Articulo
    WHERE Codigo_Articulo = @Articulo;

    -- Calcular el monto total del artículo
    SET @MontoTotalArticulo = @PrecioUnitario * @Cantidad;

    -- Insertar el detalle de la factura
    INSERT INTO Detalle_Factura (Numero_Factura, Articulo, Cantidad, Codigo_Bodega)
    VALUES (@Numero_Factura, @Articulo, @Cantidad, @Codigo_Bodega);

    -- Actualizar el monto total de la factura
    UPDATE Factura
    SET Monto = Monto + @MontoTotalArticulo
    WHERE Numero_Factura = @Numero_Factura;
END;
GO

-- [ Procedimientos de Entradas, Movimientos, Salidas de Inventario ]

CREATE OR ALTER PROCEDURE Entrada_Bodega 
    @Codigo_Movimiento varchar(12),
    @Codigo_Articulo varchar(12),
    @Cantidad int
AS
BEGIN
    BEGIN TRY
        -- Declarar variable para la bodega destino
        DECLARE @Bodega_Destino varchar(12);

        -- Obtener el código de la bodega destino desde Entrada_Inventario
        SELECT @Bodega_Destino = Bodega_Destino
        FROM Entrada_Inventario
        WHERE Codigo_Movimiento = @Codigo_Movimiento;

        -- Validar que la bodega destino exista
        IF @Bodega_Destino IS NULL
        BEGIN
            THROW 50000, 'No se encontró la bodega destino para el código de movimiento proporcionado.', 1;
        END

        -- Intentar actualizar la cantidad del artículo en el inventario
        UPDATE Inventario
        SET Cantidad = Cantidad + @Cantidad
        WHERE Codigo_Bodega = @Bodega_Destino AND Codigo_Articulo = @Codigo_Articulo;

        -- Si no existe el artículo en la bodega destino, agregarlo
        IF @@ROWCOUNT = 0
        BEGIN
            INSERT INTO Inventario (Codigo_Bodega, Codigo_Articulo, Cantidad)
            VALUES (@Bodega_Destino, @Codigo_Articulo, @Cantidad);
        END

        -- Insertar el registro del movimiento en la tabla Movimiento_Articulo
        INSERT INTO Movimiento_Articulo (Codigo_Movimiento, Codigo_Articulo, Cantidad)
        VALUES (@Codigo_Movimiento, @Codigo_Articulo, @Cantidad);

    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SELECT 
            ERROR_NUMBER() AS ErrorNumero,
            ERROR_MESSAGE() AS ErrorMensaje,
            ERROR_SEVERITY() AS Severidad,
            ERROR_STATE() AS Estado,
            ERROR_LINE() AS Linea,
            ERROR_PROCEDURE() AS Procedimiento;
    END CATCH
END;
GO

select * from Entrada_Articulo
go

-- Movimiento entre bodegas
CREATE OR ALTER PROCEDURE Movimiento_Entre_Bodegas
    @Codigo_Movimiento varchar(12),
    @Codigo_Articulo varchar(12),
    @Cantidad int
AS
BEGIN
    BEGIN TRY
        -- Declarar variables para las bodegas de origen y destino
        DECLARE @Bodega_Origen varchar(12);
        DECLARE @Bodega_Destino varchar(12);

        -- Obtener las bodegas de origen y destino a partir de Movimiento_Inventario
        SELECT 
            @Bodega_Origen = Bodega_Origen,
            @Bodega_Destino = Bodega_Destino
        FROM Movimiento_Inventario
        WHERE Codigo_Movimiento = @Codigo_Movimiento;

        -- Verificar que las bodegas se hayan encontrado
        IF @Bodega_Origen IS NULL OR @Bodega_Destino IS NULL
        BEGIN
            THROW 50000, 'No se encontraron las bodegas de origen o destino para el código de movimiento proporcionado.', 1;
        END

        -- Restar la cantidad en la bodega de origen
        UPDATE Inventario
        SET Cantidad = Cantidad - @Cantidad
        WHERE Codigo_Bodega = @Bodega_Origen AND Codigo_Articulo = @Codigo_Articulo;

        -- Validar que la operación de resta no cause cantidades negativas
        IF @@ROWCOUNT = 0 OR EXISTS (
            SELECT 1
            FROM Inventario
            WHERE Codigo_Bodega = @Bodega_Origen AND Codigo_Articulo = @Codigo_Articulo AND Cantidad < 0
        )
        BEGIN
            THROW 50001, 'No hay suficiente inventario en la bodega de origen.', 1;
        END

        -- Sumar la cantidad en la bodega de destino
        UPDATE Inventario
        SET Cantidad = Cantidad + @Cantidad
        WHERE Codigo_Bodega = @Bodega_Destino AND Codigo_Articulo = @Codigo_Articulo;

        -- Si no existe el artículo en la bodega destino, agregarlo
        IF @@ROWCOUNT = 0
        BEGIN
            INSERT INTO Inventario (Codigo_Bodega, Codigo_Articulo, Cantidad)
            VALUES (@Bodega_Destino, @Codigo_Articulo, @Cantidad);
        END

        -- Insertar el registro en la tabla Movimiento_Articulo
        INSERT INTO Movimiento_Articulo (Codigo_Movimiento, Codigo_Articulo, Cantidad)
        VALUES (@Codigo_Movimiento, @Codigo_Articulo, @Cantidad);

    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SELECT 
            ERROR_NUMBER() AS ErrorNumero,
            ERROR_MESSAGE() AS ErrorMensaje,
            ERROR_SEVERITY() AS Severidad,
            ERROR_STATE() AS Estado,
            ERROR_LINE() AS Linea,
            ERROR_PROCEDURE() AS Procedimiento;
    END CATCH
END;
GO

Insert into Movimiento_Inventario(Codigo_Movimiento, Bodega_Origen, Bodega_Destino, Usuario, Fecha_Hora)
VALUES ('Mov01', 'B005', 'B001', '00112233466', GETDATE())

Exec Movimiento_Entre_Bodegas 'Mov01', 'A026', 2

-- Salidas de inventario
CREATE OR ALTER PROCEDURE AgregarArticuloAFactura
    @Numero_Factura varchar(12),
    @Articulo varchar(12),
    @Cantidad int,
    @Codigo_Bodega varchar(12)
AS
BEGIN
    BEGIN TRY
        -- Declaración de variables
        DECLARE @PrecioUnitario decimal(18,2);
        DECLARE @MontoTotalArticulo decimal(18,2);
        DECLARE @CantidadDisponible int;

        -- Verificar que el artículo exista en la bodega con suficiente inventario
        SELECT @CantidadDisponible = Cantidad
        FROM Inventario
        WHERE Codigo_Bodega = @Codigo_Bodega AND Codigo_Articulo = @Articulo;

        IF @CantidadDisponible IS NULL
        BEGIN
            THROW 50000, 'El artículo no existe en la bodega especificada.', 1;
        END

        IF @CantidadDisponible < @Cantidad
        BEGIN
            THROW 50001, 'No hay suficiente inventario del artículo en la bodega.', 1;
        END

        -- Obtener el precio unitario del artículo
        SELECT @PrecioUnitario = Precio_Estandar
        FROM Articulo
        WHERE Codigo_Articulo = @Articulo;

        IF @PrecioUnitario IS NULL
        BEGIN
            THROW 50002, 'El artículo especificado no tiene un precio establecido.', 1;
        END

        -- Calcular el monto total del artículo
        SET @MontoTotalArticulo = @PrecioUnitario * @Cantidad;

        -- Insertar el detalle de la factura
        INSERT INTO Detalle_Factura (Numero_Factura, Articulo, Cantidad, Codigo_Bodega)
        VALUES (@Numero_Factura, @Articulo, @Cantidad, @Codigo_Bodega);

        -- Actualizar el monto total de la factura
        UPDATE Factura
        SET Monto = ISNULL(Monto, 0) + @MontoTotalArticulo
        WHERE Numero_Factura = @Numero_Factura;

        -- Reducir la cantidad del inventario en la bodega correspondiente
        UPDATE Inventario
        SET Cantidad = Cantidad - @Cantidad
        WHERE Codigo_Bodega = @Codigo_Bodega AND Codigo_Articulo = @Articulo;

    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SELECT 
            ERROR_NUMBER() AS ErrorNumero,
            ERROR_MESSAGE() AS ErrorMensaje,
            ERROR_SEVERITY() AS Severidad,
            ERROR_STATE() AS Estado,
            ERROR_LINE() AS Linea,
            ERROR_PROCEDURE() AS Procedimiento;
    END CATCH
END;
GO




select * from Movimiento_Inventario
select * from Movimiento_Articulo
select * from Inventario
select * from Bodega