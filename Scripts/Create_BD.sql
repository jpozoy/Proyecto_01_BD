-- Creación de la base de dados
IF NOT EXISTS (
    SELECT name 
    FROM sys.databases 
    WHERE name = 'SistemaERP'
)
BEGIN
    CREATE DATABASE SistemaERP;
END
go

Use SistemaERP
Go

--Tabla de Local
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'T_Local' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
    CREATE TABLE T_Local  (
		Cedula_Local  varchar(12) primary key not null,
		Nombre_Local varchar(20) not null,
    );
END

--Tabla de atributo multivalorado telefonos
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Telefono_Local' AND TABLE_SCHEMA = 'dbo' 
)
BEGIN
    CREATE TABLE Telefono_Local  (
		Cedula_Local  varchar(12) not null,
		Telefono varchar(8) not null,
		primary key (Cedula_Local, Telefono),
		foreign key (Cedula_Local) references T_Local(Cedula_Local),

    );
END

-- Tabla catalogo de zona
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Zona' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
    CREATE TABLE Zona (
		Nombre_Zona varchar(30) not null primary key,
		Descripcion_zona varchar(100) not null
    );
END

--Tabla catalogo de sector
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Sector' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
    CREATE TABLE Sector (
		Nombre_Sector varchar(30) not null primary key,
		Descripcion_Sector varchar(100) not null
    );
END

--Tabla de catalogo Puesto
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Puesto' AND TABLE_SCHEMA = 'dbo'
)

BEGIN
    CREATE TABLE Puesto (
		Puesto varchar(20) primary key not null
    );
END

--Tabla de catalogo Departamento
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Departamento' AND TABLE_SCHEMA = 'dbo'
)

BEGIN
    CREATE TABLE Departamento (
		Departamento varchar(20) primary key not null
    );
END

-- Tabla Cliente 
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Cliente' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
    CREATE TABLE Cliente (
		Cedula varchar(12) not null primary key,
		Nombre varchar(20) not null,
		Apellido1 varchar(20) not null,
		Apellido2 varchar(20) not null,
		Celular varchar(8),
		Correo varchar(50),
		Fax varchar(20),
		Zona varchar(30),
		Sector varchar(30)
		foreign key (Zona) references Zona(Nombre_Zona),
		foreign key (Sector) references Sector(Nombre_Sector)
		-- Relacion a tablas catalago


    );
END

-- Tabla de rol
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Rol' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
    CREATE TABLE Rol (
        Nombre_Rol varchar(20) primary key not null,
        Descripcion varchar(100)
    );
END



-- Tabla Usuario
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Usuario' AND TABLE_SCHEMA = 'dbo'
)

BEGIN
    CREATE TABLE Usuario  (
		Cedula varchar(12) not null primary key,
		Nombre varchar(20) not null,
		Apellido1 varchar(20) not null,
		Apellido2 varchar(20) not null,
		Telefono varchar(8),
		Correo varchar(50),
		Fecha_Nacimiento Date,
		Lugar_Residencia varchar(20),
		Fecha_Ingreso Date,
		Salario decimal(18,2),
		Puesto varchar(20),
		Departamento varchar(20),
		Contrasena varchar(60) not null,
		foreign key (Departamento) references Departamento(Departamento),
		foreign key (Puesto) references Puesto(Puesto)
    );
END

-- Tabla intermedia Rol y Usuarios
-- Tabla de rol
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Rol_Usuarios' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
    CREATE TABLE Rol_Usuarios (
        Nombre_Rol varchar(20) not null,
        Cedula_Usuario varchar(12) not null,
		primary key (Nombre_Rol, Cedula_Usuario),
		foreign key (Nombre_Rol) references Rol(Nombre_Rol),
		foreign key (Cedula_Usuario) references Usuario(Cedula)
    );
END

-- Tabla Historio_Puesto

IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Historico_Puesto' AND TABLE_SCHEMA = 'dbo'
)

BEGIN
    CREATE TABLE Historico_Puesto  (
		Cedula_Usuario varchar(12) not null,
		Fecha_Inicio Datetime not null,
		Fecha_Fin Date,
		Puesto varchar(20),
		Departamento varchar(20),
		primary key(Cedula_Usuario, Fecha_Inicio),
		foreign key(Cedula_Usuario) references Usuario(Cedula)

    );
END


-- Tabla de Historico_Salario
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Historico_Salario' AND TABLE_SCHEMA = 'dbo'
)

BEGIN
    CREATE TABLE Historico_Salario  (
		Cedula_Usuario varchar(12) not null,
		Fecha_Inicio Datetime not null,
		Fecha_Fin Date,
		Puesto varchar(20),
		Monto decimal(18,2) not null,
		Departamento varchar(20),
		primary key (Cedula_Usuario, Fecha_Inicio),
		foreign key (Cedula_Usuario) references Usuario(Cedula)
    );
END



-- Tabla de modulo 
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Modulo' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
    CREATE TABLE Modulo (
        Nombre_Modulo varchar(20) not null primary key,
        Descripcion varchar(100)
    );
END

-- Tabla intermedia de acciones
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Accion' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
    CREATE TABLE Accion (
        Nombre_Accion varchar(20) not null primary key,
        Descripcion varchar(100)
    );
END

--Tabla intermedia de Rol modulo y acciones
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Rol_Modulo_Accion' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
    CREATE TABLE Rol_Modulo_Accion (
        Nombre_Rol varchar(20) not null,
        Modulo varchar(20) not null,
        Accion varchar(20) not null,
        primary key (Nombre_Rol, Modulo, Accion),
        foreign key (Nombre_Rol) references Rol(Nombre_Rol),
        foreign key (Modulo) references Modulo(Nombre_Modulo),
        foreign key (Accion) references Accion(Nombre_Accion)
    );
END


-- Tabla de Planilla
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Planilla' AND TABLE_SCHEMA = 'dbo'
)

BEGIN
    CREATE TABLE Planilla  (
		Codigo_Planilla varchar(12) primary key not null,
		Fecha Date not null,
		Monto decimal(18,2)
    );
END

-- Tabla intermedia Planilla_Usuario

IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Planilla_Usuario' AND TABLE_SCHEMA = 'dbo'
)

BEGIN
    CREATE TABLE Planilla_Usuario  (
		Codigo_Planilla varchar(12) not null,
		Cedula_Usuario varchar(12) not null,
		Horas_Trabajadas int,
		Horas_Extras int,
		Salario_Pagado decimal(18,2),
		Departamento varchar(20),
		primary key (Codigo_Planilla, Cedula_Usuario),
		foreign key (Codigo_Planilla) references Planilla(Codigo_Planilla),
		foreign key (Cedula_Usuario) references Usuario(Cedula)


    );
END

--Tabla de Familia
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Familia' AND TABLE_SCHEMA = 'dbo'
)

BEGIN
    CREATE TABLE Familia  (
		Codigo_Familia varchar(12) not null primary key,
		Nombre_Familia varchar(20) not null,
		Activo varchar(2),
		Descripcion varchar(50),
    );
END

--Tabla de Articulo
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Articulo' AND TABLE_SCHEMA = 'dbo'
)

BEGIN
    CREATE TABLE Articulo  (
		Codigo_Articulo varchar(12) primary key not null,
		Nombre_Articulo varchar(20) not null,
		Activo varchar(2),
		Precio_Estandar decimal(18,2),
		Peso int,
		Costo int,
		Descripcion varchar(50),
		Codigo_Familia varchar(12),
		foreign key (Codigo_Familia) references Familia(Codigo_Familia)
    );
END

--Tabla de catalogo Estado_Cotizacion
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Estado_Cotizacion' AND TABLE_SCHEMA = 'dbo'
)

BEGIN
    CREATE TABLE Estado_Cotizacion  (
		Estado varchar(20) primary key not null
    );
END

--Tabla de catalogo Tipo_Cotizacion
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Tipo_Cotizacion' AND TABLE_SCHEMA = 'dbo'
)

BEGIN
    CREATE TABLE Tipo_Cotizacion (
		Tipo varchar(20) primary key not null
    );
END

--Tabla de catalogo Probabilidad
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Probabilidad_Cotizacion' AND TABLE_SCHEMA = 'dbo'
)

BEGIN
    CREATE TABLE Probabilidad_Cotizacion (
		Probabilidad varchar(4) primary key not null
    );
END

--Tabla de Cotizacion
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Cotizacion' AND TABLE_SCHEMA = 'dbo'
)
-- Hacer correción de cedula local, cedula local, telefonos local
BEGIN
    CREATE TABLE Cotizacion  (
		Codigo_Cotizacion  varchar(12) primary key not null,
		-- Select
		Cliente varchar(12) not null,
		-- Gestionar mediante el usuario logueado
		Vendedor varchar(12) not null,
		Mes_Proyectado_Cierre date,
		Monto_Total decimal(18,2),
		Descripcion varchar(50),
		Fecha date,
		Fecha_Cierre date,
		-- Nullable, se agrega al denegar
		Motivo_Denegacion varchar(50),
		-- ?????
		Contra_Quien_Denego varchar(50),
		-- Catalogo
		Estado varchar(20),
		Tipo varchar(20),
		Zona varchar(30),
		Sector varchar(30),
		Probabilidad varchar(4),
		foreign key (Cliente) references Cliente(Cedula),
		foreign key (Vendedor) references Usuario(Cedula),
		--Conexion a tablas catalogo
		foreign key (Zona) references Zona(Nombre_Zona),
		foreign key (Sector) references Sector(Nombre_Sector),
		foreign key (Estado) references Estado_Cotizacion(Estado),
		foreign key (Tipo) references Tipo_Cotizacion(Tipo),
		foreign key (Probabilidad) references Probabilidad_Cotizacion(Probabilidad)
    );
END


--Tabla intermedia entre Factura y Articulos

IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Cotizacion_Articulos' AND TABLE_SCHEMA = 'dbo'
)
  
BEGIN
    CREATE TABLE Cotizacion_Articulos  (
		Codigo_Cotizacion  varchar(12) not null,
		Articulo varchar(12) not null,
		Cantidad int,
		primary key (Codigo_Cotizacion,Articulo),
		foreign key (Articulo) references Articulo(Codigo_Articulo),
		foreign key (Codigo_Cotizacion) references Cotizacion(Codigo_Cotizacion)
    );
END 

--Tabla de tareas por Cotizacion

IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Tareas_Cotizacion' AND TABLE_SCHEMA = 'dbo'
)
  
BEGIN
    CREATE TABLE Tareas_Cotizacion  (
		Codigo_Tarea varchar(12) not null primary key,
		Nombre_Tarea varchar(20) not null,
		Decripcion_Tarea varchar(100) not null,
		Codigo_Cotizacion varchar(12),
		foreign key (Codigo_Cotizacion) references Cotizacion(Codigo_Cotizacion)
    );
END


-- Tabla bodega

IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Bodega' AND TABLE_SCHEMA = 'dbo'
)
-- Como puedo establecer la asociación de las familias que pueden alamarcenarse en las familias.
BEGIN
    CREATE TABLE Bodega  (
		Codigo_Bodega  varchar(12) primary key not null,
		Nombre varchar(20),
		Ubicacion varchar(40),
		Capacidad_En_Toneladas int,
		Espacio_Cubico int,
		Estado varchar(2),
    );
END

-- Tabla intermedia entre Bodega y Familias para estblecer asociación N:M

IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Bodega_Familia' AND TABLE_SCHEMA = 'dbo'
)

BEGIN
    CREATE TABLE Bodega_Familia  (
		Codigo_Bodega  varchar(12) not null,
		Codigo_Familia varchar(12) not null,
		primary key (Codigo_Bodega, Codigo_Familia),
		foreign key (Codigo_Bodega) references Bodega(Codigo_Bodega),
		foreign key (Codigo_Familia) references Familia(Codigo_Familia)
    );
END

-- Tabla Inventario

IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Inventario' AND TABLE_SCHEMA = 'dbo'
)
-- Tabla intermedia que representa inventario de la bodega.
BEGIN
    CREATE TABLE Inventario  (
		Codigo_Bodega  varchar(12) not null,
		Codigo_Articulo varchar(12) not null,
		Cantidad int
		primary key (Codigo_Bodega, Codigo_Articulo),
		foreign key (Codigo_Bodega) references Bodega(Codigo_Bodega),
		foreign key (Codigo_Articulo) references Articulo(Codigo_Articulo)

    );
END
-- Tabla Entrada de inventarios
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Entrada_Inventario' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
    CREATE TABLE Entrada_Inventario  (
		Codigo_Movimiento varchar(12) not null primary key,
		Usuario varchar(12) not null,
		Bodega_Destino  varchar(12) not null,
		Fecha_Hora datetime,
		foreign key (Bodega_Destino) references Bodega(Codigo_Bodega),
		foreign key (Usuario) references Usuario(Cedula)

    );
END
-- Tabla intermedia entre Entrada_Inventario y Articulo
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Entrada_Articulo' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
    CREATE TABLE Entrada_Articulo  (
		Codigo_Movimiento varchar(12) not null,
		Codigo_Articulo varchar(12) not null,
		Cantidad  int not null,
		primary key (Codigo_Movimiento, Codigo_Articulo),
		foreign key (Codigo_Movimiento) references Entrada_Inventario(Codigo_Movimiento),
		foreign key (Codigo_Articulo) references Articulo(Codigo_Articulo)

    );
END

--Tabla Movimiento entre inventarios
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Movimiento_Inventario' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
    CREATE TABLE Movimiento_Inventario  (
		Codigo_Movimiento varchar(12) not null primary key,
		Bodega_Origen  varchar(12) not null,
		Bodega_Destino  varchar(12) not null,
		Usuario varchar(12) not null,
		Fecha_Hora datetime,
		foreign key (Bodega_Origen) references Bodega(Codigo_Bodega),
		foreign key (Bodega_Destino) references Bodega(Codigo_Bodega),
		foreign key (Usuario) references Usuario(Cedula)

    );
END

-- Tabla intermedia entre Movimiento_Inventario y Articulo, para establecer relación N:M
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Movimiento_Articulo' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
    CREATE TABLE Movimiento_Articulo  (
		Codigo_Movimiento varchar(12) not null,
		Codigo_Articulo varchar(12) not null,
		Cantidad  int not null,
		primary key (Codigo_Movimiento, Codigo_Articulo),
		foreign key (Codigo_Movimiento) references Movimiento_Inventario(Codigo_Movimiento),
		foreign key (Codigo_Articulo) references Articulo(Codigo_Articulo),

    );
END

--Tabla de Factura
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Factura' AND TABLE_SCHEMA = 'dbo'
)
-- Hacer correción de cedula local, cedula local, telefonos local
BEGIN
    CREATE TABLE Factura  (
		Numero_Factura  varchar(12) primary key not null,
		Cliente varchar(12) not null,
		Vendedor varchar(12) not null,
		Cedula_Local varchar(12) not null,
		Monto decimal(18,2),
		Fecha Date,
		foreign key (Cliente) references Cliente(Cedula),
		foreign key (Vendedor) references Usuario(Cedula),
		foreign key (Cedula_Local) references T_Local(Cedula_Local)
    );
END

--Tabla intermedia entre Factura y Articulos

IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Detalle_Factura' AND TABLE_SCHEMA = 'dbo'
)
  
BEGIN
    CREATE TABLE Detalle_Factura  (
		Numero_Factura  varchar(12) not null,
		Articulo varchar(12) not null,
		Cantidad int not null,
		Codigo_Bodega varchar(12) not null,
		primary key (Numero_Factura,Articulo),
		foreign key (Articulo) references Articulo(Codigo_Articulo),
		foreign key (Numero_Factura) references Factura(Numero_Factura),
		foreign key (Codigo_Bodega) references Bodega(Codigo_Bodega)
    );
END


--Tabla de catalogo Estado_Cotizacion
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Estado_Caso' AND TABLE_SCHEMA = 'dbo'
)

BEGIN
    CREATE TABLE Estado_Caso  (
		Estado varchar(20) primary key not null
    );
END

--Tabla de catalogo Tipo_Cotizacion
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Tipo_Caso' AND TABLE_SCHEMA = 'dbo'
)

BEGIN
    CREATE TABLE Tipo_Caso (
		Tipo varchar(20) primary key not null
    );
END

--Tabla de catalogo Prioridad_Caso
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Prioridad_Caso' AND TABLE_SCHEMA = 'dbo'
)

BEGIN
    CREATE TABLE Prioridad_Caso (
		Prioridad varchar(20) primary key not null
    );
END


--Tabla de Caso
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Caso' AND TABLE_SCHEMA = 'dbo'
)
-- A que se refiere nombre de cuenta, propietario, nombre de contacto
BEGIN
    CREATE TABLE Caso  (
		Codigo_Caso  varchar(12) primary key not null,
		Cliente varchar(12) not null,
		Vendedor varchar(12) not null,
		Direccion varchar(40),
		Asunto varchar(20),
		Tipo varchar(20),
		Estado varchar(20),
		Prioridad varchar(20),
		Descripcion varchar(100),
		Fecha date,
		Numero_Factura varchar(12) null, --Valor opcional
		Codigo_Cotizacion varchar(12) null, -- Valor opcional
		foreign key (Cliente) references Cliente(Cedula),
		foreign key (Vendedor) references Usuario(Cedula),
		--La foreign key se establece unicamente con el valor opcional rellenado
		foreign key (Codigo_Cotizacion) references Cotizacion(Codigo_Cotizacion), 
		foreign key (Numero_Factura) references Factura(Numero_Factura),
		--Relacion tablas catalogo
		foreign key (Tipo) references Tipo_Caso(Tipo),
		foreign key (Estado) references Estado_Caso(Estado),
		foreign key (Prioridad) references Prioridad_Caso(Prioridad)

    );
END

--Tabla de tareas por caso

IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Tareas_Caso' AND TABLE_SCHEMA = 'dbo'
)
  
BEGIN
    CREATE TABLE Tareas_Caso  (
		Codigo_Tarea varchar(12) not null primary key,
		Nombre_Tarea varchar(20) not null,
		Decripcion_Tarea varchar(100) not null,
		Codigo_Caso varchar(12),
		foreign key (Codigo_Caso) references Caso(Codigo_Caso)
    );
END
