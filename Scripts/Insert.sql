-- Insertar 30 puestos
INSERT INTO Puesto (Puesto) VALUES
('Vendedor'),
('Gerente'),
('Analista'),
('Desarrollador'),
('Diseñador'),
('Administrador'),
('Técnico'),
('Consultor'),
('Especialista'),
('Coordinador'),
('Supervisor'),
('Director'),
('Contador'),
('Auditor'),
('Jefe de Proyectos'),
('Ingeniero'),
('Arquitecto'),
('Asesor'),
('Secretario'),
('Abogado'),
('Médico'),
('Enfermero'),
('Químico'),
('Bioquímico'),
('Farmacéutico'),
('Nutricionista'),
('Fisioterapeuta'),
('Psicólogo'),
('Sociólogo'),
('Asistente'),
('Conserje');

-- Insertar 30 departamentos
INSERT INTO Departamento (Departamento) VALUES
('Recursos Humanos'),
('Finanzas'),
('Ventas'),
('Marketing'),
('Operaciones'),
('Tecnología'),
('Desarrollo'),
('Soporte Técnico'),
('Consultoría'),
('Administración'),
('Auditoría'),
('Proyectos'),
('Ingeniería'),
('Arquitectura'),
('Legal'),
('Salud'),
('Científico'),
('Investigación'),
('Atención al Cliente'),
('Logística'),
('Compras'),
('Control de Calidad'),
('Producción'),
('Planificación'),
('Diseño'),
('Innovación'),
('Regulaciones'),
('Comunicación'),
('Publicidad'),
('Mantenimiento');

-- Insertar 30 familias
INSERT INTO Familia (Codigo_Familia, Nombre_Familia, Activo, Descripcion) VALUES
('F001', 'Electrónica', 'SI', 'Artículos electrónicos'),
('F002', 'Muebles', 'SI', 'Mobiliario de oficina'),
('F003', 'Papelería', 'SI', 'Artículos de papelería'),
('F004', 'Ropa', 'SI', 'Prendas de vestir'),
('F005', 'Electrodomésticos', 'SI', 'Aparatos para el hogar'),
('F006', 'Juguetes', 'SI', 'Juguetes para niños'),
('F007', 'Deportes', 'SI', 'Artículos deportivos'),
('F008', 'Alimentos', 'SI', 'Productos alimenticios'),
('F009', 'Bebidas', 'SI', 'Bebidas varias'),
('F010', 'Automotriz', 'SI', 'Repuestos automotrices'),
('F011', 'Tecnología', 'SI', 'Dispositivos tecnológicos'),
('F012', 'Medicinas', 'SI', 'Productos farmacéuticos'),
('F013', 'Belleza', 'SI', 'Productos de belleza'),
('F014', 'Limpieza', 'SI', 'Productos de limpieza'),
('F015', 'Construcción', 'SI', 'Materiales de construcción'),
('F016', 'Jardinería', 'SI', 'Herramientas de jardinería'),
('F017', 'Ferretería', 'SI', 'Productos de ferretería'),
('F018', 'Textiles', 'SI', 'Materiales textiles'),
('F019', 'Accesorios', 'SI', 'Accesorios y complementos'),
('F020', 'Hogar', 'SI', 'Artículos para el hogar'),
('F021', 'Mascotas', 'SI', 'Productos para mascotas'),
('F022', 'Cuidado Personal', 'SI', 'Artículos de cuidado personal'),
('F023', 'Iluminación', 'SI', 'Artículos de iluminación'),
('F024', 'Electrónica', 'SI', 'Dispositivos electrónicos'),  -- Nombre ajustado
('F025', 'Calzado', 'SI', 'Calzado de todo tipo'),
('F026', 'Joyería', 'SI', 'Accesorios de joyería'),
('F027', 'Instrumentos', 'SI', 'Instrumentos para músicos'),
('F028', 'Videojuegos', 'SI', 'Consolas y juegos de video'),
('F029', 'Cocina', 'SI', 'Utensilios y electrodomésticos de cocina'),
('F030', 'Fotografía', 'SI', 'Cámaras y accesorios fotográficos');


-- Insertar 30 artículos
INSERT INTO Articulo (Codigo_Articulo, Nombre_Articulo, Activo, Precio_Estandar, Peso, Costo, Descripcion, Codigo_Familia) VALUES
('A001', 'Laptop', 'SI', 750.00, 2000, 500, 'Laptop portátil', 'F011'),
('A002', 'Escritorio', 'SI', 150.00, 15000, 90, 'Escritorio de oficina', 'F002'),
('A003', 'Cuaderno', 'SI', 2.50, 200, 1, 'Cuaderno de 100 hojas', 'F003'),
('A004', 'Camiseta', 'SI', 25.00, 300, 15, 'Camiseta de algodón', 'F004'),
('A005', 'Microondas', 'SI', 120.00, 10000, 70, 'Microondas de 1000W', 'F005'),
('A006', 'Bicicleta', 'SI', 200.00, 12000, 150, 'Bicicleta de montaña', 'F007'),
('A007', 'Balón de fútbol', 'SI', 25.00, 500, 10, 'Balón oficial', 'F007'),
('A008', 'Silla de oficina', 'SI', 80.00, 7000, 60, 'Silla ergonómica', 'F002'),
('A009', 'Monitor', 'SI', 150.00, 3000, 90, 'Monitor de 24 pulgadas', 'F011'),
('A010', 'Zapatos deportivos', 'SI', 50.00, 1000, 35, 'Zapatos para correr', 'F025'),
('A011', 'Lavadora', 'SI', 300.00, 35000, 200, 'Lavadora de 20kg', 'F005'),
('A012', 'Tornillos', 'SI', 0.05, 50, 0.02, 'Tornillo de acero', 'F017'),
('A013', 'Manguera de jardín', 'SI', 20.00, 1500, 10, 'Manguera de 10 metros', 'F016'),
('A014', 'Brocha de pintura', 'SI', 5.00, 300, 3, 'Brocha de 5 pulgadas', 'F015'),
('A015', 'Lámpara LED', 'SI', 15.00, 500, 7, 'Lámpara de escritorio', 'F023'),
('A016', 'Tablet', 'SI', 200.00, 800, 150, 'Tablet Android', 'F011'),
('A017', 'Smartphone', 'SI', 600.00, 180, 400, 'Smartphone 5G', 'F011'),
('A018', 'Perfume', 'SI', 40.00, 250, 15, 'Perfume de mujer', 'F013'),
('A019', 'Gafas de sol', 'SI', 25.00, 150, 20, 'Gafas de sol polarizadas', 'F019'),
('A020', 'Supl. vitamínico', 'SI', 15.00, 500, 8, 'Vitaminas A, C, D', 'F022'),
('A021', 'Champú', 'SI', 10.00, 600, 4, 'Champú anticaspa', 'F022'),
('A022', 'Juguete de madera', 'SI', 30.00, 1000, 25, 'Juguete educativo', 'F006'),
('A023', 'Cargador portátil', 'SI', 20.00, 300, 12, 'Cargador de 10000mAh', 'F024'),
('A024', 'Audífonos', 'SI', 35.00, 100, 25, 'Audífonos Bluetooth', 'F024'),
('A025', 'Batidora', 'SI', 80.00, 2000, 60, 'Batidora de 800W', 'F005'),
('A026', 'Cámara DSLR', 'SI', 400.00, 1200, 300, 'Cámara DSLR', 'F030'),
('A027', 'Videojuego', 'SI', 60.00, 300, 45, 'Videojuego para consola', 'F028'),
('A028', 'Reloj inteligente', 'SI', 150.00, 200, 90, 'Reloj con GPS', 'F024'),
('A029', 'Lentes VR', 'SI', 300.00, 600, 150, 'Lentes de realidad virtual', 'F028'),
('A030', 'Guitarra eléct.', 'SI', 500.00, 3500, 200, 'Guitarra eléctrica de 6 cuerdas', 'F027'); 

-- Insertar 5 productos de Electrónica (F001)
INSERT INTO Articulo (Codigo_Articulo, Nombre_Articulo, Activo, Precio_Estandar, Peso, Costo, Descripcion, Codigo_Familia) VALUES
('A031', 'Televisor 50"', 'SI', 600.00, 15000, 450, 'Televisor UHD de 50 pulgadas', 'F001'),
('A032', 'Consola de video', 'SI', 300.00, 1200, 250, 'Consola de videojuegos de última generación', 'F001'),
('A033', 'Bocina Bluetooth', 'SI', 45.00, 600, 30, 'Bocina portátil Bluetooth', 'F001'),
('A034', 'Cámara de seguridad', 'SI', 100.00, 500, 70, 'Cámara de seguridad para interiores', 'F001'),
('A035', 'Router Wi-Fi', 'SI', 70.00, 300, 50, 'Router de alta velocidad', 'F001');

-- Insertar 5 productos de Hogar (F020)
INSERT INTO Articulo (Codigo_Articulo, Nombre_Articulo, Activo, Precio_Estandar, Peso, Costo, Descripcion, Codigo_Familia) VALUES
('A036', 'Ventilador de pie', 'SI', 50.00, 6000, 35, 'Ventilador ajustable de pie', 'F020'),
('A037', 'Aspiradora', 'SI', 120.00, 4500, 80, 'Aspiradora de mano potente', 'F020'),
('A038', 'Plancha de ropa', 'SI', 30.00, 1500, 20, 'Plancha de vapor', 'F020'),
('A039', 'Tostadora', 'SI', 25.00, 1200, 15, 'Tostadora de pan de 2 ranuras', 'F020'),
('A040', 'Licuadora', 'SI', 60.00, 2500, 40, 'Licuadora de 500W', 'F020');

-- Insertar 5 productos de Alimentos (F008)
INSERT INTO Articulo (Codigo_Articulo, Nombre_Articulo, Activo, Precio_Estandar, Peso, Costo, Descripcion, Codigo_Familia) VALUES
('A041', 'Paquete de arroz', 'SI', 2.00, 1000, 1, 'Paquete de arroz de 1kg', 'F008'),
('A042', 'Cereal de avena', 'SI', 4.00, 500, 2, 'Cereal de avena integral', 'F008'),
('A043', 'Botella de agua', 'SI', 1.00, 500, 0.5, 'Botella de agua de 500ml', 'F008'),
('A044', 'Leche en polvo', 'SI', 8.00, 1000, 5, 'Leche en polvo entera', 'F008'),
('A045', 'Caja de té', 'SI', 3.00, 300, 2, 'Caja con 20 bolsitas de té', 'F008');

-- Insertar 5 productos de Ropa (F004)
INSERT INTO Articulo (Codigo_Articulo, Nombre_Articulo, Activo, Precio_Estandar, Peso, Costo, Descripcion, Codigo_Familia) VALUES
('A046', 'Pantalón', 'SI', 40.00, 500, 25, 'Pantalón de mezclilla para hombre', 'F004'),
('A047', 'Falda de algodón', 'SI', 30.00, 200, 18, 'Falda casual de algodón', 'F004'),
('A048', 'Suéter con capucha', 'SI', 35.00, 700, 22, 'Suéter de algodón con capucha', 'F004'),
('A049', 'Gorra deportiva', 'SI', 15.00, 150, 10, 'Gorra ajustable', 'F004'),
('A050', 'Bufanda de lana', 'SI', 20.00, 100, 12, 'Bufanda de lana para invierno', 'F004');

select * from Articulo;

-- Insertar 5 bodegas
INSERT INTO Bodega (Codigo_Bodega, Nombre, Ubicacion, Capacidad_En_Toneladas, Espacio_Cubico, Estado) VALUES
('B001', 'Bodega Central', 'San José', 100, 500, 'SI'),
('B002', 'Bodega Norte', 'Alajuela', 80, 400, 'SI'),
('B003', 'Bodega Sur', 'Cartago', 60, 300, 'SI'),
('B004', 'Bodega Este', 'Heredia', 90, 450, 'SI'),
('B005', 'Bodega Oeste', 'Puntarenas', 70, 350, 'SI'),
('B006', 'Bodega Pacífico', 'Limón', 65, 325, 'SI'),
('B007', 'Bodega Atlántico', 'Guanacaste', 85, 425, 'SI'),
('B008', 'Bodega Central 2', 'San José', 75, 375, 'SI'),
('B009', 'Bodega Norte 2', 'Alajuela', 95, 475, 'SI'),
('B010', 'Bodega Sur 2', 'Cartago', 55, 275, 'SI');

select * from Inventario
--Agregar Entradas de Inventario
insert into Entrada_Inventario(Codigo_Movimiento,Usuario, Bodega_Destino, Fecha_Hora) values ('M001', '00112233466', 'B001', GETDATE());


select * from Entrada_Inventario;
insert into Inventario(Codigo_Bodega, Codigo_Articulo, Cantidad) values ('B001', 'A030', 5), ('B005', 'A024', 10);

-- Relación entre bodegas y familias (N:M)
INSERT INTO Bodega_Familia (Codigo_Bodega, Codigo_Familia) VALUES
('B001', 'F001'),
('B001', 'F002'),
('B001', 'F003'),
('B002', 'F004'),
('B002', 'F005'),
('B003', 'F006'),
('B003', 'F007'),
('B004', 'F008'),
('B004', 'F009'),
('B005', 'F010'),
('B001', 'F011'),
('B001', 'F012'),
('B002', 'F013'),
('B002', 'F014'),
('B003', 'F015'),
('B003', 'F016'),
('B004', 'F017'),
('B004', 'F018'),
('B005', 'F019'),
('B005', 'F020'),
('B001', 'F021'),
('B001', 'F022'),
('B002', 'F023'),
('B002', 'F024'),
('B003', 'F025'),
('B003', 'F026'),
('B004', 'F027'),
('B004', 'F028'),
('B005', 'F029'),
('B005', 'F030');

-- Insertar 30 zonas
INSERT INTO Zona (Nombre_Zona, Descripcion_zona) VALUES
('Zona Central', 'Centro de la ciudad'),
('Zona Norte', 'Región norte'),
('Zona Sur', 'Región sur'),
('Zona Este', 'Región este'),
('Zona Oeste', 'Región oeste'),
('Zona Industrial', 'Zonas industriales'),
('Zona Comercial', 'Zonas comerciales'),
('Zona Educativa', 'Zonas con instituciones educativas'),
('Zona Residencial', 'Zonas residenciales'),
('Zona Urbana', 'Zonas urbanas'),
('Zona Rural', 'Zonas rurales'),
('Zona Mixta', 'Zonas mixtas'),
('Zona Portuaria', 'Zonas cercanas a puertos'),
('Zona Metropolitana', 'Zonas metropolitanas'),
('Zona Empresarial', 'Zonas de negocios'),
('Zona Agrícola', 'Zonas agrícolas'),
('Zona Turística', 'Zonas de interés turístico'),
('Zona Tecnológica', 'Zonas con desarrollo tecnológico'),
('Zona Comercial Pequeña', 'Pequeños centros comerciales'),
('Zona Boscosa', 'Áreas cercanas a bosques'),
('Zona Histórica', 'Áreas con valor histórico'),
('Zona Montañosa', 'Zonas de montaña'),
('Zona Costera', 'Zonas cercanas a la costa'),
('Zona Desértica', 'Zonas áridas o desérticas'),
('Zona Internacional', 'Áreas con presencia internacional'),
('Zona Cultural', 'Áreas con importancia cultural'),
('Zona Financiera', 'Centros financieros'),
('Zona Alta', 'Zonas de altitud elevada'),
('Zona Baja', 'Zonas de baja altitud'),
('Zona Fronteriza', 'Áreas cercanas a las fronteras');


-- Insertar 30 sectores
INSERT INTO Sector (Nombre_Sector, Descripcion_Sector) VALUES
('Sector Comercial', 'Comercios y tiendas'),
('Sector Residencial', 'Casas y apartamentos'),
('Sector Industrial', 'Fábricas y bodegas'),
('Sector Rural', 'Zonas rurales'),
('Sector Urbano', 'Zonas urbanas'),
('Sector Agrícola', 'Cultivos y plantaciones'),
('Sector Tecnológico', 'Empresas de tecnología'),
('Sector Educativo', 'Escuelas y universidades'),
('Sector Salud', 'Hospitales y clínicas'),
('Sector Financiero', 'Bancos y financieras'),
('Sector Turístico', 'Hoteles y servicios turísticos'),
('Sector Energético', 'Empresas de energía'),
('Sector Minero', 'Minería y extracción de recursos'),
('Sector Construcción', 'Proyectos de construcción'),
('Sector Transportes', 'Empresas de transporte'),
('Sector Logístico', 'Distribución y logística'),
('Sector Ambiental', 'Empresas de conservación'),
('Sector Público', 'Gobierno y servicios públicos'),
('Sector Privado', 'Empresas privadas'),
('Sector Pesquero', 'Pesca y productos del mar'),
('Sector Comunicaciones', 'Telecomunicaciones'),
('Sector Alimenticio', 'Empresas de alimentos'),
('Sector Textil', 'Fábricas de textiles'),
('Sector Automotriz', 'Repuestos y servicios automotrices'),
('Sector Aeroespacial', 'Empresas aeroespaciales'),
('Sector Defensa', 'Empresas de defensa y seguridad'),
('Sector Químico', 'Industria química'),
('Sector Farmacéutico', 'Empresas de medicamentos'),
('Sector Entretenimiento', 'Cines, teatros, etc.'),
('Sector Deportivo', 'Gimnasios y servicios deportivos');

-- Insertar 30 clientes
INSERT INTO Cliente (Cedula, Nombre, Apellido1, Apellido2, Celular, Correo, Fax, Zona, Sector) VALUES
('101230123', 'Juan', 'Pérez', 'González', '88887777', 'juan.perez@mail.com', '22223333', 'Zona Central', 'Sector Comercial'),
('202340234', 'María', 'Rodríguez', 'Alvarado', '88887778', 'maria.rodriguez@mail.com', '22223334', 'Zona Norte', 'Sector Residencial'),
('303450345', 'Carlos', 'López', 'Martínez', '88887779', 'carlos.lopez@mail.com', '22223335', 'Zona Sur', 'Sector Industrial'),
('404560456', 'Ana', 'Fernández', 'Jiménez', '88887780', 'ana.fernandez@mail.com', '22223336', 'Zona Este', 'Sector Rural'),
('505670567', 'Pedro', 'Vargas', 'Mora', '88887781', 'pedro.vargas@mail.com', '22223337', 'Zona Oeste', 'Sector Urbano'),
('606780678', 'Luis', 'Salazar', 'Zúñiga', '88887782', 'luis.salazar@mail.com', '22223338', 'Zona Industrial', 'Sector Agrícola'),
('707890789', 'Laura', 'Gómez', 'Castro', '88887783', 'laura.gomez@mail.com', '22223339', 'Zona Comercial', 'Sector Tecnológico'),
('808901890', 'Ricardo', 'Navarro', 'Espinoza', '88887784', 'ricardo.navarro@mail.com', '22223340', 'Zona Educativa', 'Sector Educativo'),
('101230234', 'Mónica', 'Cruz', 'Rojas', '88887785', 'monica.cruz@mail.com', '22223341', 'Zona Residencial', 'Sector Salud'),
('202340345', 'José', 'Chaves', 'Leiva', '88887786', 'jose.chaves@mail.com', '22223342', 'Zona Urbana', 'Sector Financiero'),
('303450456', 'Diego', 'Castillo', 'Araya', '88887787', 'diego.castillo@mail.com', '22223343', 'Zona Rural', 'Sector Turístico'),
('404560567', 'Andrea', 'Sánchez', 'Pérez', '88887788', 'andrea.sanchez@mail.com', '22223344', 'Zona Mixta', 'Sector Energético'),
('505670678', 'David', 'Cordero', 'Solano', '88887789', 'david.cordero@mail.com', '22223345', 'Zona Portuaria', 'Sector Minero'),
('606780789', 'Daniela', 'Ortiz', 'Calderón', '88887790', 'daniela.ortiz@mail.com', '22223346', 'Zona Metropolitana', 'Sector Construcción'),
('707890890', 'Adrián', 'Torres', 'Ramos', '88887791', 'adrian.torres@mail.com', '22223347', 'Zona Empresarial', 'Sector Transportes'),
('808901901', 'Verónica', 'Carrillo', 'Ureña', '88887792', 'veronica.carrillo@mail.com', '22223348', 'Zona Agrícola', 'Sector Logístico'),
('101230456', 'Esteban', 'Paniagua', 'Chávez', '88887793', 'esteban.paniagua@mail.com', '22223349', 'Zona Turística', 'Sector Ambiental'),
('202340567', 'Sofía', 'Zamora', 'López', '88887794', 'sofia.zamora@mail.com', '22223350', 'Zona Tecnológica', 'Sector Público'),
('303450678', 'Sebastián', 'Calvo', 'Fernández', '88887795', 'sebastian.calvo@mail.com', '22223351', 'Zona Comercial Pequeña', 'Sector Privado'),
('404560789', 'Alejandra', 'Gutiérrez', 'Ruiz', '88887796', 'alejandra.gutierrez@mail.com', '22223352', 'Zona Boscosa', 'Sector Pesquero'),
('505670890', 'Javier', 'Montero', 'Campos', '88887797', 'javier.montero@mail.com', '22223353', 'Zona Histórica', 'Sector Comunicaciones'),
('606780901', 'Patricia', 'Castro', 'Navarro', '88887798', 'patricia.castro@mail.com', '22223354', 'Zona Montañosa', 'Sector Alimenticio'),
('707890012', 'Santiago', 'Hernández', 'Pacheco', '88887799', 'santiago.hernandez@mail.com', '22223355', 'Zona Costera', 'Sector Textil'),
('808901123', 'Beatriz', 'Zúñiga', 'Vargas', '88887800', 'beatriz.zuniga@mail.com', '22223356', 'Zona Desértica', 'Sector Automotriz'),
('101230567', 'Valeria', 'Vega', 'Ramírez', '88887801', 'valeria.vega@mail.com', '22223357', 'Zona Internacional', 'Sector Aeroespacial'),
('202340678', 'Manuel', 'Esquivel', 'Soto', '88887802', 'manuel.esquivel@mail.com', '22223358', 'Zona Cultural', 'Sector Defensa'),
('303450789', 'Fabiola', 'Alfaro', 'Venegas', '88887803', 'fabiola.alfaro@mail.com', '22223359', 'Zona Financiera', 'Sector Químico'),
('404560890', 'Gerardo', 'Ríos', 'Carranza', '88887804', 'gerardo.rios@mail.com', '22223360', 'Zona Alta', 'Sector Farmacéutico'),
('505670901', 'Karina', 'Barboza', 'Espinoza', '88887805', 'karina.barboza@mail.com', '22223361', 'Zona Baja', 'Sector Entretenimiento'),
('606780012', 'Oscar', 'Díaz', 'García', '88887806', 'oscar.diaz@mail.com', '22223362', 'Zona Fronteriza', 'Sector Deportivo');



--Tipos de casos
INSERT INTO Tipo_Caso (Tipo)
VALUES 
('Queja'),
('Cotización'),
('Reclamo'),
('Soporte'),
('Consulta'),
('Devolución');

-- Estados de caso
INSERT INTO Estado_Caso (Estado)
VALUES 
('Abierto'),
('Cerrado');

--Prioridad de caso
INSERT INTO Prioridad_Caso (Prioridad)
VALUES 
('Alta'),
('Media'),
('Baja');

--Añadirle fecha de inicio y fin a las tareas
ALTER TABLE Tareas_Caso
ADD Fecha_Inicio DATE NOT NULL,
    Fecha_Fin DATE NULL;

--Añadirle fecha de inicio y fin a las tareas de cotizacion
ALTER TABLE Tareas_Cotizacion
ADD Fecha_Inicio DATE NOT NULL,
    Fecha_Fin DATE NULL;

ALTER TABLE Tareas_Caso
ALTER COLUMN Nombre_Tarea varchar(100) NOT NULL;

ALTER TABLE Caso
ALTER COLUMN Descripcion varchar(200) NOT NULL;

ALTER TABLE Caso
ALTER COLUMN Asunto varchar(100) NOT NULL;

select * from Tareas_Caso
select * from Caso

-- Insertar 30 casos
INSERT INTO Caso (Codigo_Caso, Cliente, Vendedor, Direccion, Asunto, Tipo, Estado, Prioridad, Descripcion, Fecha) VALUES
('CS001', '101230123', '00112233441', 'San José', 'Problema de producto', 'Queja', 'Abierto', 'Alta', 'El cliente reporta un problema con el producto', '2024-01-01'),
('CS002', '202340234', '00112233442', 'Heredia', 'Solicitud de cotización', 'Cotización', 'Cerrado', 'Media', 'El cliente solicita una cotización de artículos', '2024-01-02'),
('CS003', '303450345', '00112233443', 'Alajuela', 'Problema de facturación', 'Reclamo', 'Abierto', 'Baja', 'El cliente reporta una factura incorrecta', '2024-01-03'),
('CS004', '404560456', '00112233444', 'Cartago', 'Solicitud de soporte técnico', 'Soporte', 'Abierto', 'Alta', 'El cliente necesita soporte para un producto', '2024-01-04'),
('CS005', '505670567', '00112233445', 'Puntarenas', 'Consulta sobre envío', 'Consulta', 'Cerrado', 'Media', 'El cliente consulta el estado de su envío', '2024-01-05'),
('CS006', '606780678', '00112233461', 'Limón', 'Problema con entrega', 'Reclamo', 'Abierto', 'Alta', 'El cliente no recibió el producto a tiempo', '2024-01-06'),
('CS007', '707890789', '00112233462', 'Guanacaste', 'Solicitud de devolución', 'Devolución', 'Abierto', 'Media', 'El cliente solicita la devolución de un artículo', '2024-01-07'),
('CS008', '808901890', '00112233463', 'San José', 'Consulta sobre garantía', 'Consulta', 'Cerrado', 'Baja', 'El cliente consulta la garantía de un producto', '2024-01-08'),
('CS009', '101230234', '00112233464', 'Heredia', 'Reclamación por defecto', 'Reclamo', 'Abierto', 'Alta', 'El cliente reporta un defecto en el producto', '2024-01-09'),
('CS010', '202340345', '00112233441', 'Alajuela', 'Solicitud de cotización', 'Cotización', 'Cerrado', 'Media', 'El cliente solicita una cotización de servicios', '2024-01-10'),
('CS011', '303450456', '00112233442', 'Cartago', 'Problema de pago', 'Reclamo', 'Abierto', 'Baja', 'El cliente reporta un problema con su pago', '2024-01-11'),
('CS012', '404560567', '00112233443', 'Puntarenas', 'Solicitud de soporte', 'Soporte', 'Cerrado', 'Alta', 'El cliente necesita soporte técnico', '2024-01-12'),
('CS013', '505670678', '00112233444', 'Limón', 'Problema de facturación', 'Reclamo', 'Abierto', 'Media', 'El cliente reporta una factura duplicada', '2024-01-13'),
('CS014', '606780789', '00112233445', 'Guanacaste', 'Solicitud de devolución', 'Devolución', 'Cerrado', 'Baja', 'El cliente solicita la devolución de varios productos', '2024-01-14'),
('CS015', '707890890', '00112233461', 'San José', 'Problema de calidad', 'Reclamo', 'Abierto', 'Alta', 'El cliente reporta problemas de calidad en los productos', '2024-01-15'),
('CS016', '808901901', '00112233462', 'Heredia', 'Consulta sobre precio', 'Consulta', 'Cerrado', 'Media', 'El cliente consulta el precio de varios artículos', '2024-01-16'),
('CS017', '101230456', '00112233463', 'Alajuela', 'Solicitud de cotización', 'Cotización', 'Abierto', 'Alta', 'El cliente solicita una cotización urgente', '2024-01-17'),
('CS018', '202340567', '00112233464', 'Cartago', 'Problema con envío', 'Reclamo', 'Abierto', 'Alta', 'El cliente reporta un retraso en el envío', '2024-01-18'),
('CS019', '303450678', '00112233441', 'Puntarenas', 'Solicitud de información', 'Consulta', 'Cerrado', 'Baja', 'El cliente solicita información adicional', '2024-01-19'),
('CS020', '404560789', '00112233442', 'Limón', 'Problema de garantía', 'Reclamo', 'Abierto', 'Media', 'El cliente solicita la activación de la garantía', '2024-01-20'),
('CS021', '505670890', '00112233443', 'Guanacaste', 'Consulta sobre producto', 'Consulta', 'Cerrado', 'Baja', 'El cliente consulta características de un producto', '2024-01-21'),
('CS022', '606780901', '00112233444', 'San José', 'Problema con el pedido', 'Reclamo', 'Abierto', 'Alta', 'El cliente reporta que el pedido no llegó completo', '2024-01-22'),
('CS023', '707890012', '00112233445', 'Heredia', 'Solicitud de actualización', 'Soporte', 'Cerrado', 'Media', 'El cliente solicita una actualización de su producto', '2024-01-23'),
('CS024', '808901123', '00112233461', 'Alajuela', 'Problema con la entrega', 'Reclamo', 'Abierto', 'Baja', 'El cliente no ha recibido su entrega', '2024-01-24'),
('CS025', '101230567', '00112233462', 'Cartago', 'Solicitud de devolución', 'Devolución', 'Cerrado', 'Alta', 'El cliente solicita la devolución de un servicio', '2024-01-25'),
('CS026', '202340678', '00112233463', 'Puntarenas', 'Problema de facturación', 'Reclamo', 'Abierto', 'Media', 'El cliente reporta un error en la factura', '2024-01-26'),
('CS027', '303450789', '00112233464', 'Limón', 'Consulta sobre garantía', 'Consulta', 'Cerrado', 'Baja', 'El cliente consulta la extensión de la garantía', '2024-01-27'),
('CS028', '404560890', '00112233441', 'Guanacaste', 'Problema con el pedido', 'Reclamo', 'Abierto', 'Alta', 'El cliente reporta que el pedido llegó incompleto', '2024-01-28'),
('CS029', '505670901', '00112233442', 'San José', 'Solicitud de soporte técnico', 'Soporte', 'Cerrado', 'Media', 'El cliente solicita soporte técnico especializado', '2024-01-29'),
('CS030', '606780012', '00112233443', 'Heredia', 'Problema con el pago', 'Reclamo', 'Abierto', 'Baja', 'El cliente reporta un problema al procesar el pago', '2024-01-30');



INSERT INTO Tareas_Caso (Codigo_Tarea, Nombre_Tarea, Decripcion_Tarea, Codigo_Caso, Fecha_Inicio, Fecha_Fin)
VALUES
-- Tareas Cerradas
('T001', 'Verificar producto', 'Revisión del producto defectuoso', 'CS001', '2024-01-01', '2024-01-05'),
('T002', 'Generar cotización', 'Preparación de cotización solicitada', 'CS002', '2024-01-02', '2024-01-06'),
('T003', 'Revisar factura', 'Revisión de la factura errónea', 'CS003', '2024-01-03', '2024-01-07'),
('T004', 'Proporcionar soporte técnico', 'Ofrecer soporte para el producto', 'CS004', '2024-01-04', '2024-01-08'),
('T005', 'Verificar estado del envío', 'Comprobar el estado del envío del cliente', 'CS005', '2024-01-05', '2024-01-09'),
('T006', 'Gestionar devolución', 'Tramitar la devolución solicitada por el cliente', 'CS006', '2024-01-06', '2024-01-10'),
('T007', 'Revisar garantía', 'Verificar las condiciones de la garantía del producto', 'CS007', '2024-01-07', '2024-01-11'),
('T008', 'Atender consulta', 'Responder a la consulta del cliente sobre el producto', 'CS008', '2024-01-08', '2024-01-12'),
('T009', 'Verificar entrega', 'Confirmar que la entrega del producto fue correcta', 'CS009', '2024-01-09', '2024-01-13'),
('T010', 'Ofrecer soporte', 'Proporcionar soporte técnico al cliente', 'CS010', '2024-01-10', '2024-01-14'),
('T011', 'Verificar pago', 'Comprobar el estado del pago del cliente', 'CS011', '2024-01-11', '2024-01-15'),
('T012', 'Generar cotización', 'Preparación de cotización solicitada por el cliente', 'CS012', '2024-01-12', '2024-01-16'),
('T013', 'Corregir factura', 'Realizar la corrección de la factura duplicada', 'CS013', '2024-01-13', '2024-01-17'),
('T014', 'Procesar devolución', 'Tramitar la devolución solicitada por el cliente', 'CS014', '2024-01-14', '2024-01-18'),
('T015', 'Atender reclamo', 'Resolver el problema de calidad reportado por el cliente', 'CS015', '2024-01-15', '2024-01-19'),

-- Tareas Abiertas
('T016', 'Enviar cotización', 'Proporcionar la cotización solicitada al cliente', 'CS016', '2024-01-16', NULL),
('T017', 'Resolver problema de envío', 'Investigar el retraso en el envío del cliente', 'CS017', '2024-01-17', NULL),
('T018', 'Ofrecer información', 'Responder a la solicitud de información adicional', 'CS018', '2024-01-18', NULL),
('T019', 'Activar garantía', 'Gestionar la activación de la garantía del producto', 'CS019', '2024-01-19', NULL),
('T020', 'Responder consulta', 'Atender la consulta del cliente sobre el producto', 'CS020', '2024-01-20', NULL),
('T021', 'Gestionar pedido', 'Revisar el estado del pedido reportado por el cliente', 'CS021', '2024-01-21', NULL),
('T022', 'Actualizar producto', 'Realizar la actualización solicitada en el producto', 'CS022', '2024-01-22', NULL),
('T023', 'Verificar entrega', 'Confirmar la entrega del producto al cliente', 'CS023', '2024-01-23', NULL),
('T024', 'Gestionar devolución', 'Tramitar la devolución de los servicios solicitados', 'CS024', '2024-01-24', NULL),
('T025', 'Corregir error en factura', 'Realizar la corrección del error en la factura', 'CS025', '2024-01-25', NULL),
('T026', 'Revisar garantía', 'Verificar la extensión de la garantía solicitada', 'CS026', '2024-01-26', NULL),
('T027', 'Gestionar pedido', 'Revisar el estado del pedido incompleto', 'CS027', '2024-01-27', NULL),
('T028', 'Ofrecer soporte especializado', 'Proporcionar soporte técnico especializado', 'CS028', '2024-01-28', NULL),
('T029', 'Procesar pago', 'Resolver el problema reportado con el pago del cliente', 'CS029', '2024-01-29', NULL),
('T030', 'Verificar estado del caso', 'Comprobar el estado del caso abierto por el cliente', 'CS030', '2024-01-30', NULL);



-- Inserts por proc de Usuarios 
EXEC Registrar_Usuario '00112233441', 'Juan', 'Perez', 'Lopez', '88887777', 'juan.perez@example.com', '1985-03-15', 'San José', '2024-01-01', 1200.00, 'Vendedor', 'Ventas', 'password123';
EXEC Registrar_Usuario '00112233442', 'Maria', 'Gomez', 'Rodriguez', '88887778', 'maria.gomez@example.com', '1990-07-20', 'Alajuela', '2023-02-15', 1000.00, 'Vendedor', 'Ventas ', 'password123';
EXEC Registrar_Usuario '00112233443', 'Carlos', 'Ramirez', 'Mendez', '88887779', 'carlos.ramirez@example.com', '1988-10-10', 'Cartago', '2024-03-01', 1500.00, 'Vendedor', 'Ventas', 'password123';
EXEC Registrar_Usuario '00112233444', 'Laura', 'Sanchez', 'Jimenez', '88887780', 'laura.sanchez@example.com', '1995-12-05', 'Heredia', '2023-05-10', 1400.00, 'Vendedor', 'Ventas', 'password123';
EXEC Registrar_Usuario '00112233445', 'Luis', 'Rojas', 'Castro', '88887781', 'luis.rojas@example.com', '1992-04-25', 'Puntarenas', '2024-06-15', 1300.00, 'Vendedor', 'Ventas', 'password123';
EXEC Registrar_Usuario '00112233446', 'Ana', 'Fernandez', 'Vargas', '88887782', 'ana.fernandez@example.com', '1987-08-18', 'Limon', '2023-07-25', 1250.00, 'Diseñador', 'Marketing', 'password123';
EXEC Registrar_Usuario '00112233447', 'Jose', 'Lopez', 'Salazar', '88887783', 'jose.lopez@example.com', '1989-11-22', 'Guanacaste', '2024-08-05', 1350.00, 'Diseñador', 'Marketing', 'password123';
EXEC Registrar_Usuario '00112233448', 'Carmen', 'Vega', 'Monge', '88887784', 'carmen.vega@example.com', '1991-02-28', 'San José', '2023-09-15', 1150.00, 'Diseñador', 'Marketing', 'password123';
EXEC Registrar_Usuario '00112233449', 'Miguel', 'Mora', 'Diaz', '88887785', 'miguel.mora@example.com', '1985-06-12', 'Alajuela', '2024-11-01', 1600.00, 'Analista', 'Marketing', 'password123';
EXEC Registrar_Usuario '00112233450', 'Rosa', 'Rivera', 'Martinez', '88887786', 'rosa.rivera@example.com', '1993-09-25', 'Cartago', '2024-12-01', 1100.00, 'Analista', 'Marketing', 'password123';
EXEC Registrar_Usuario '00112233451', 'Daniel', 'Castillo', 'Hernandez', '88887787', 'daniel.castillo@example.com', '1986-01-30', 'Heredia', '2024-01-20', 1700.00, 'Desarrollador', 'Desarrollo', 'password123';
EXEC Registrar_Usuario '00112233452', 'Patricia', 'Herrera', 'Gutierrez', '88887788', 'patricia.herrera@example.com', '1994-03-11', 'Puntarenas', '2023-03-15', 1450.00, 'Desarrollador', 'Desarrollo', 'password123';
EXEC Registrar_Usuario '00112233453', 'Raul', 'Soto', 'Alfaro', '88887789', 'raul.soto@example.com', '1983-05-16', 'San José', '2023-04-10', 1550.00, 'Desarrollador', 'Desarrollo', 'password123';
EXEC Registrar_Usuario '00112233454', 'Sofia', 'Campos', 'Aguilar', '88887790', 'sofia.campos@example.com', '1997-07-07', 'Limon', '2024-09-05', 1120.00, 'Desarrollador', 'Desarrollo', 'password123';
EXEC Registrar_Usuario '00112233455', 'Ricardo', 'Araya', 'Solano', '88887791', 'ricardo.araya@example.com', '1984-12-17', 'Alajuela', '2023-06-25', 1050.00, 'Desarrollador', 'Desarrollo', 'password123';
EXEC Registrar_Usuario '00112233456', 'Elena', 'Zamora', 'Mora', '88887792', 'elena.zamora@example.com', '1986-10-01', 'Cartago', '2024-02-28', 1320.00, 'Técnico', 'Soporte Técnico', 'password123';
EXEC Registrar_Usuario '00112233457', 'Gabriel', 'Valverde', 'Espinoza', '88887793', 'gabriel.valverde@example.com', '1992-06-22', 'San José', '2023-07-10', 1200.00, 'Técnico', 'Soporte Técnico', 'password123';
EXEC Registrar_Usuario '00112233458', 'Julia', 'Meza', 'Porras', '88887794', 'julia.meza@example.com', '1990-05-18', 'Heredia', '2023-10-05', 1475.00, 'Técnico', 'Soporte Técnico', 'password123';
EXEC Registrar_Usuario '00112233459', 'Andres', 'Quesada', 'Murillo', '88887795', 'andres.quesada@example.com', '1982-08-24', 'Limon', '2024-04-01', 1250.00, 'Técnico', 'Soporte Técnico', 'password123';
EXEC Registrar_Usuario '00112233460', 'Natalia', 'Gonzalez', 'Quirós', '88887796', 'natalia.gonzalez@example.com', '1993-03-19', 'Guanacaste', '2023-11-01', 1350.00, 'Técnico', 'Soporte Técnico', 'password123';
EXEC Registrar_Usuario '00112233461', 'Oscar', 'Villalobos', 'Jiménez', '88887797', 'oscar.villalobos@example.com', '1981-02-02', 'Puntarenas', '2024-06-15', 1600.00, 'Vendedor', 'Ventas', 'password123';
EXEC Registrar_Usuario '00112233462', 'Yolanda', 'Leiva', 'Montero', '88887798', 'yolanda.leiva@example.com', '1994-09-28', 'San José', '2023-01-18', 1425.00, 'Vendedor', 'Ventas', 'password123';
EXEC Registrar_Usuario '00112233463', 'Manuel', 'Diaz', 'Vargas', '88887799', 'manuel.diaz@example.com', '1995-06-29', 'Cartago', '2024-07-22', 1170.00, 'Vendedor', 'Ventas', 'password123';
EXEC Registrar_Usuario '00112233464', 'Claudia', 'Molina', 'Pérez', '88887800', 'claudia.molina@example.com', '1989-10-08', 'San José', '2024-02-10', 1300.00, 'Vendedor', 'Ventas', 'password123';
EXEC Registrar_Usuario '00112233465', 'Francisco', 'Salas', 'Guzmán', '88887801', 'francisco.salas@example.com', '1987-05-04', 'Heredia', '2023-05-20', 1400.00, 'Coordinador', 'Administración', 'password123';
EXEC Registrar_Usuario '00112233466', 'Teresa', 'Quintana', 'Vargas', '88887802', 'teresa.quintana@example.com', '1996-08-15', 'Alajuela', '2024-01-05', 1125.00, 'Administrador', 'Administración', 'password123';
EXEC Registrar_Usuario '00112233467', 'Enrique', 'Alvarez', 'Loaiza', '88887803', 'enrique.alvarez@example.com', '1991-12-09', 'Puntarenas', '2023-03-05', 1540.00, 'Gerente', 'Administración', 'password';


select * from Departamento;
INSERT INTO Departamento (Departamento) VALUES
('Administración')


select * from Usuario;

Insert into Rol (Nombre_Rol, Descripcion) values 
('Admin','Rol administrativo'),
('Editor','Permisos de edicion'),
('Analista','Permisos de visualizacion');
use SistemaERP

insert into Accion (Nombre_Accion, Descripcion) values
('Edición','Permite  editar entidades'),
('Visualización','Permite visualizar la información'),
('Reportes','Permite generar reportes');

insert into Modulo (Nombre_Modulo, Descripcion) values
('Usuarios','Geston de usuarios'),
('Planillas','Gestion de planillas'),
('Inventarios','Gestion de inventarios'),
('Clientes','Gestion de clientes'),
('Ventas','Gestion de vendedores'),
('Cotizacion','Gestion de cotizacines'),
('Facturas','Gestion de facturas'),
('Casos','Gestion de Casos');

insert into Estado_Cotizacion (Estado) values ('abierta'),  ('aprobada'), ('denegada');

insert into Tipo_Cotizacion (Tipo) values ('Detalle') , ('Mayoreo'), ('Preventa'), ('Personalizada') ;

insert into Probabilidad_Cotizacion (Probabilidad) values ('0%'),('25%'), ('50%'), ('75%'), ('100%');

select * from Probabilidad_Cotizacion

--Insert Local(2)
insert into T_Local (Cedula_Local, Nombre_Local) values 
('132465798','La Guacima'),
('312645978','El Rey');

--Inserts de 30 Ventas (Facturas) sin monto
insert into Factura(Numero_Factura, Cliente, Vendedor, Cedula_Local, Fecha) values
('F001','101230123','00112233441','132465798', GETDATE());

select * from Cotizacion;

