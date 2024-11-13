-- Insertar 30 puestos
INSERT INTO Puesto (Puesto) VALUES
('Vendedor'),
('Gerente'),
('Analista'),
('Desarrollador'),
('Dise�ador'),
('Administrador'),
('T�cnico'),
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
('M�dico'),
('Enfermero'),
('Qu�mico'),
('Bioqu�mico'),
('Farmac�utico'),
('Nutricionista'),
('Fisioterapeuta'),
('Psic�logo'),
('Soci�logo'),
('Asistente'),
('Conserje');

-- Insertar 30 departamentos
INSERT INTO Departamento (Departamento) VALUES
('Recursos Humanos'),
('Finanzas'),
('Ventas'),
('Marketing'),
('Operaciones'),
('Tecnolog�a'),
('Desarrollo'),
('Soporte T�cnico'),
('Consultor�a'),
('Administraci�n'),
('Auditor�a'),
('Proyectos'),
('Ingenier�a'),
('Arquitectura'),
('Legal'),
('Salud'),
('Cient�fico'),
('Investigaci�n'),
('Atenci�n al Cliente'),
('Log�stica'),
('Compras'),
('Control de Calidad'),
('Producci�n'),
('Planificaci�n'),
('Dise�o'),
('Innovaci�n'),
('Regulaciones'),
('Comunicaci�n'),
('Publicidad'),
('Mantenimiento');

-- Insertar 30 familias
INSERT INTO Familia (Codigo_Familia, Nombre_Familia, Activo, Descripcion) VALUES
('F001', 'Electr�nica', 'SI', 'Art�culos electr�nicos'),
('F002', 'Muebles', 'SI', 'Mobiliario de oficina'),
('F003', 'Papeler�a', 'SI', 'Art�culos de papeler�a'),
('F004', 'Ropa', 'SI', 'Prendas de vestir'),
('F005', 'Electrodom�sticos', 'SI', 'Aparatos para el hogar'),
('F006', 'Juguetes', 'SI', 'Juguetes para ni�os'),
('F007', 'Deportes', 'SI', 'Art�culos deportivos'),
('F008', 'Alimentos', 'SI', 'Productos alimenticios'),
('F009', 'Bebidas', 'SI', 'Bebidas varias'),
('F010', 'Automotriz', 'SI', 'Repuestos automotrices'),
('F011', 'Tecnolog�a', 'SI', 'Dispositivos tecnol�gicos'),
('F012', 'Medicinas', 'SI', 'Productos farmac�uticos'),
('F013', 'Belleza', 'SI', 'Productos de belleza'),
('F014', 'Limpieza', 'SI', 'Productos de limpieza'),
('F015', 'Construcci�n', 'SI', 'Materiales de construcci�n'),
('F016', 'Jardiner�a', 'SI', 'Herramientas de jardiner�a'),
('F017', 'Ferreter�a', 'SI', 'Productos de ferreter�a'),
('F018', 'Textiles', 'SI', 'Materiales textiles'),
('F019', 'Accesorios', 'SI', 'Accesorios y complementos'),
('F020', 'Hogar', 'SI', 'Art�culos para el hogar'),
('F021', 'Mascotas', 'SI', 'Productos para mascotas'),
('F022', 'Cuidado Personal', 'SI', 'Art�culos de cuidado personal'),
('F023', 'Iluminaci�n', 'SI', 'Art�culos de iluminaci�n'),
('F024', 'Electr�nica', 'SI', 'Dispositivos electr�nicos'),  -- Nombre ajustado
('F025', 'Calzado', 'SI', 'Calzado de todo tipo'),
('F026', 'Joyer�a', 'SI', 'Accesorios de joyer�a'),
('F027', 'Instrumentos', 'SI', 'Instrumentos para m�sicos'),
('F028', 'Videojuegos', 'SI', 'Consolas y juegos de video'),
('F029', 'Cocina', 'SI', 'Utensilios y electrodom�sticos de cocina'),
('F030', 'Fotograf�a', 'SI', 'C�maras y accesorios fotogr�ficos');


-- Insertar 30 art�culos
INSERT INTO Articulo (Codigo_Articulo, Nombre_Articulo, Activo, Precio_Estandar, Peso, Costo, Descripcion, Codigo_Familia) VALUES
('A001', 'Laptop', 'SI', 750.00, 2000, 500, 'Laptop port�til', 'F011'),
('A002', 'Escritorio', 'SI', 150.00, 15000, 90, 'Escritorio de oficina', 'F002'),
('A003', 'Cuaderno', 'SI', 2.50, 200, 1, 'Cuaderno de 100 hojas', 'F003'),
('A004', 'Camiseta', 'SI', 25.00, 300, 15, 'Camiseta de algod�n', 'F004'),
('A005', 'Microondas', 'SI', 120.00, 10000, 70, 'Microondas de 1000W', 'F005'),
('A006', 'Bicicleta', 'SI', 200.00, 12000, 150, 'Bicicleta de monta�a', 'F007'),
('A007', 'Bal�n de f�tbol', 'SI', 25.00, 500, 10, 'Bal�n oficial', 'F007'),
('A008', 'Silla de oficina', 'SI', 80.00, 7000, 60, 'Silla ergon�mica', 'F002'),
('A009', 'Monitor', 'SI', 150.00, 3000, 90, 'Monitor de 24 pulgadas', 'F011'),
('A010', 'Zapatos deportivos', 'SI', 50.00, 1000, 35, 'Zapatos para correr', 'F025'),
('A011', 'Lavadora', 'SI', 300.00, 35000, 200, 'Lavadora de 20kg', 'F005'),
('A012', 'Tornillos', 'SI', 0.05, 50, 0.02, 'Tornillo de acero', 'F017'),
('A013', 'Manguera de jard�n', 'SI', 20.00, 1500, 10, 'Manguera de 10 metros', 'F016'),
('A014', 'Brocha de pintura', 'SI', 5.00, 300, 3, 'Brocha de 5 pulgadas', 'F015'),
('A015', 'L�mpara LED', 'SI', 15.00, 500, 7, 'L�mpara de escritorio', 'F023'),
('A016', 'Tablet', 'SI', 200.00, 800, 150, 'Tablet Android', 'F011'),
('A017', 'Smartphone', 'SI', 600.00, 180, 400, 'Smartphone 5G', 'F011'),
('A018', 'Perfume', 'SI', 40.00, 250, 15, 'Perfume de mujer', 'F013'),
('A019', 'Gafas de sol', 'SI', 25.00, 150, 20, 'Gafas de sol polarizadas', 'F019'),
('A020', 'Supl. vitam�nico', 'SI', 15.00, 500, 8, 'Vitaminas A, C, D', 'F022'),
('A021', 'Champ�', 'SI', 10.00, 600, 4, 'Champ� anticaspa', 'F022'),
('A022', 'Juguete de madera', 'SI', 30.00, 1000, 25, 'Juguete educativo', 'F006'),
('A023', 'Cargador port�til', 'SI', 20.00, 300, 12, 'Cargador de 10000mAh', 'F024'),
('A024', 'Aud�fonos', 'SI', 35.00, 100, 25, 'Aud�fonos Bluetooth', 'F024'),
('A025', 'Batidora', 'SI', 80.00, 2000, 60, 'Batidora de 800W', 'F005'),
('A026', 'C�mara DSLR', 'SI', 400.00, 1200, 300, 'C�mara DSLR', 'F030'),
('A027', 'Videojuego', 'SI', 60.00, 300, 45, 'Videojuego para consola', 'F028'),
('A028', 'Reloj inteligente', 'SI', 150.00, 200, 90, 'Reloj con GPS', 'F024'),
('A029', 'Lentes VR', 'SI', 300.00, 600, 150, 'Lentes de realidad virtual', 'F028'),
('A030', 'Guitarra el�ct.', 'SI', 500.00, 3500, 200, 'Guitarra el�ctrica de 6 cuerdas', 'F027'); 

-- Insertar 5 productos de Electr�nica (F001)
INSERT INTO Articulo (Codigo_Articulo, Nombre_Articulo, Activo, Precio_Estandar, Peso, Costo, Descripcion, Codigo_Familia) VALUES
('A031', 'Televisor 50"', 'SI', 600.00, 15000, 450, 'Televisor UHD de 50 pulgadas', 'F001'),
('A032', 'Consola de video', 'SI', 300.00, 1200, 250, 'Consola de videojuegos de �ltima generaci�n', 'F001'),
('A033', 'Bocina Bluetooth', 'SI', 45.00, 600, 30, 'Bocina port�til Bluetooth', 'F001'),
('A034', 'C�mara de seguridad', 'SI', 100.00, 500, 70, 'C�mara de seguridad para interiores', 'F001'),
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
('A045', 'Caja de t�', 'SI', 3.00, 300, 2, 'Caja con 20 bolsitas de t�', 'F008');

-- Insertar 5 productos de Ropa (F004)
INSERT INTO Articulo (Codigo_Articulo, Nombre_Articulo, Activo, Precio_Estandar, Peso, Costo, Descripcion, Codigo_Familia) VALUES
('A046', 'Pantal�n', 'SI', 40.00, 500, 25, 'Pantal�n de mezclilla para hombre', 'F004'),
('A047', 'Falda de algod�n', 'SI', 30.00, 200, 18, 'Falda casual de algod�n', 'F004'),
('A048', 'Su�ter con capucha', 'SI', 35.00, 700, 22, 'Su�ter de algod�n con capucha', 'F004'),
('A049', 'Gorra deportiva', 'SI', 15.00, 150, 10, 'Gorra ajustable', 'F004'),
('A050', 'Bufanda de lana', 'SI', 20.00, 100, 12, 'Bufanda de lana para invierno', 'F004');

select * from Articulo;

-- Insertar 5 bodegas
INSERT INTO Bodega (Codigo_Bodega, Nombre, Ubicacion, Capacidad_En_Toneladas, Espacio_Cubico, Estado) VALUES
('B001', 'Bodega Central', 'San Jos�', 100, 500, 'SI'),
('B002', 'Bodega Norte', 'Alajuela', 80, 400, 'SI'),
('B003', 'Bodega Sur', 'Cartago', 60, 300, 'SI'),
('B004', 'Bodega Este', 'Heredia', 90, 450, 'SI'),
('B005', 'Bodega Oeste', 'Puntarenas', 70, 350, 'SI'),
('B006', 'Bodega Pac�fico', 'Lim�n', 65, 325, 'SI'),
('B007', 'Bodega Atl�ntico', 'Guanacaste', 85, 425, 'SI'),
('B008', 'Bodega Central 2', 'San Jos�', 75, 375, 'SI'),
('B009', 'Bodega Norte 2', 'Alajuela', 95, 475, 'SI'),
('B010', 'Bodega Sur 2', 'Cartago', 55, 275, 'SI');

select * from Inventario
--Agregar Entradas de Inventario
insert into Entrada_Inventario(Codigo_Movimiento,Usuario, Bodega_Destino, Fecha_Hora) values ('M001', '00112233466', 'B001', GETDATE());


select * from Entrada_Inventario;
insert into Inventario(Codigo_Bodega, Codigo_Articulo, Cantidad) values ('B001', 'A030', 5), ('B005', 'A024', 10);

-- Relaci�n entre bodegas y familias (N:M)
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
('Zona Norte', 'Regi�n norte'),
('Zona Sur', 'Regi�n sur'),
('Zona Este', 'Regi�n este'),
('Zona Oeste', 'Regi�n oeste'),
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
('Zona Agr�cola', 'Zonas agr�colas'),
('Zona Tur�stica', 'Zonas de inter�s tur�stico'),
('Zona Tecnol�gica', 'Zonas con desarrollo tecnol�gico'),
('Zona Comercial Peque�a', 'Peque�os centros comerciales'),
('Zona Boscosa', '�reas cercanas a bosques'),
('Zona Hist�rica', '�reas con valor hist�rico'),
('Zona Monta�osa', 'Zonas de monta�a'),
('Zona Costera', 'Zonas cercanas a la costa'),
('Zona Des�rtica', 'Zonas �ridas o des�rticas'),
('Zona Internacional', '�reas con presencia internacional'),
('Zona Cultural', '�reas con importancia cultural'),
('Zona Financiera', 'Centros financieros'),
('Zona Alta', 'Zonas de altitud elevada'),
('Zona Baja', 'Zonas de baja altitud'),
('Zona Fronteriza', '�reas cercanas a las fronteras');


-- Insertar 30 sectores
INSERT INTO Sector (Nombre_Sector, Descripcion_Sector) VALUES
('Sector Comercial', 'Comercios y tiendas'),
('Sector Residencial', 'Casas y apartamentos'),
('Sector Industrial', 'F�bricas y bodegas'),
('Sector Rural', 'Zonas rurales'),
('Sector Urbano', 'Zonas urbanas'),
('Sector Agr�cola', 'Cultivos y plantaciones'),
('Sector Tecnol�gico', 'Empresas de tecnolog�a'),
('Sector Educativo', 'Escuelas y universidades'),
('Sector Salud', 'Hospitales y cl�nicas'),
('Sector Financiero', 'Bancos y financieras'),
('Sector Tur�stico', 'Hoteles y servicios tur�sticos'),
('Sector Energ�tico', 'Empresas de energ�a'),
('Sector Minero', 'Miner�a y extracci�n de recursos'),
('Sector Construcci�n', 'Proyectos de construcci�n'),
('Sector Transportes', 'Empresas de transporte'),
('Sector Log�stico', 'Distribuci�n y log�stica'),
('Sector Ambiental', 'Empresas de conservaci�n'),
('Sector P�blico', 'Gobierno y servicios p�blicos'),
('Sector Privado', 'Empresas privadas'),
('Sector Pesquero', 'Pesca y productos del mar'),
('Sector Comunicaciones', 'Telecomunicaciones'),
('Sector Alimenticio', 'Empresas de alimentos'),
('Sector Textil', 'F�bricas de textiles'),
('Sector Automotriz', 'Repuestos y servicios automotrices'),
('Sector Aeroespacial', 'Empresas aeroespaciales'),
('Sector Defensa', 'Empresas de defensa y seguridad'),
('Sector Qu�mico', 'Industria qu�mica'),
('Sector Farmac�utico', 'Empresas de medicamentos'),
('Sector Entretenimiento', 'Cines, teatros, etc.'),
('Sector Deportivo', 'Gimnasios y servicios deportivos');

-- Insertar 30 clientes
INSERT INTO Cliente (Cedula, Nombre, Apellido1, Apellido2, Celular, Correo, Fax, Zona, Sector) VALUES
('101230123', 'Juan', 'P�rez', 'Gonz�lez', '88887777', 'juan.perez@mail.com', '22223333', 'Zona Central', 'Sector Comercial'),
('202340234', 'Mar�a', 'Rodr�guez', 'Alvarado', '88887778', 'maria.rodriguez@mail.com', '22223334', 'Zona Norte', 'Sector Residencial'),
('303450345', 'Carlos', 'L�pez', 'Mart�nez', '88887779', 'carlos.lopez@mail.com', '22223335', 'Zona Sur', 'Sector Industrial'),
('404560456', 'Ana', 'Fern�ndez', 'Jim�nez', '88887780', 'ana.fernandez@mail.com', '22223336', 'Zona Este', 'Sector Rural'),
('505670567', 'Pedro', 'Vargas', 'Mora', '88887781', 'pedro.vargas@mail.com', '22223337', 'Zona Oeste', 'Sector Urbano'),
('606780678', 'Luis', 'Salazar', 'Z��iga', '88887782', 'luis.salazar@mail.com', '22223338', 'Zona Industrial', 'Sector Agr�cola'),
('707890789', 'Laura', 'G�mez', 'Castro', '88887783', 'laura.gomez@mail.com', '22223339', 'Zona Comercial', 'Sector Tecnol�gico'),
('808901890', 'Ricardo', 'Navarro', 'Espinoza', '88887784', 'ricardo.navarro@mail.com', '22223340', 'Zona Educativa', 'Sector Educativo'),
('101230234', 'M�nica', 'Cruz', 'Rojas', '88887785', 'monica.cruz@mail.com', '22223341', 'Zona Residencial', 'Sector Salud'),
('202340345', 'Jos�', 'Chaves', 'Leiva', '88887786', 'jose.chaves@mail.com', '22223342', 'Zona Urbana', 'Sector Financiero'),
('303450456', 'Diego', 'Castillo', 'Araya', '88887787', 'diego.castillo@mail.com', '22223343', 'Zona Rural', 'Sector Tur�stico'),
('404560567', 'Andrea', 'S�nchez', 'P�rez', '88887788', 'andrea.sanchez@mail.com', '22223344', 'Zona Mixta', 'Sector Energ�tico'),
('505670678', 'David', 'Cordero', 'Solano', '88887789', 'david.cordero@mail.com', '22223345', 'Zona Portuaria', 'Sector Minero'),
('606780789', 'Daniela', 'Ortiz', 'Calder�n', '88887790', 'daniela.ortiz@mail.com', '22223346', 'Zona Metropolitana', 'Sector Construcci�n'),
('707890890', 'Adri�n', 'Torres', 'Ramos', '88887791', 'adrian.torres@mail.com', '22223347', 'Zona Empresarial', 'Sector Transportes'),
('808901901', 'Ver�nica', 'Carrillo', 'Ure�a', '88887792', 'veronica.carrillo@mail.com', '22223348', 'Zona Agr�cola', 'Sector Log�stico'),
('101230456', 'Esteban', 'Paniagua', 'Ch�vez', '88887793', 'esteban.paniagua@mail.com', '22223349', 'Zona Tur�stica', 'Sector Ambiental'),
('202340567', 'Sof�a', 'Zamora', 'L�pez', '88887794', 'sofia.zamora@mail.com', '22223350', 'Zona Tecnol�gica', 'Sector P�blico'),
('303450678', 'Sebasti�n', 'Calvo', 'Fern�ndez', '88887795', 'sebastian.calvo@mail.com', '22223351', 'Zona Comercial Peque�a', 'Sector Privado'),
('404560789', 'Alejandra', 'Guti�rrez', 'Ruiz', '88887796', 'alejandra.gutierrez@mail.com', '22223352', 'Zona Boscosa', 'Sector Pesquero'),
('505670890', 'Javier', 'Montero', 'Campos', '88887797', 'javier.montero@mail.com', '22223353', 'Zona Hist�rica', 'Sector Comunicaciones'),
('606780901', 'Patricia', 'Castro', 'Navarro', '88887798', 'patricia.castro@mail.com', '22223354', 'Zona Monta�osa', 'Sector Alimenticio'),
('707890012', 'Santiago', 'Hern�ndez', 'Pacheco', '88887799', 'santiago.hernandez@mail.com', '22223355', 'Zona Costera', 'Sector Textil'),
('808901123', 'Beatriz', 'Z��iga', 'Vargas', '88887800', 'beatriz.zuniga@mail.com', '22223356', 'Zona Des�rtica', 'Sector Automotriz'),
('101230567', 'Valeria', 'Vega', 'Ram�rez', '88887801', 'valeria.vega@mail.com', '22223357', 'Zona Internacional', 'Sector Aeroespacial'),
('202340678', 'Manuel', 'Esquivel', 'Soto', '88887802', 'manuel.esquivel@mail.com', '22223358', 'Zona Cultural', 'Sector Defensa'),
('303450789', 'Fabiola', 'Alfaro', 'Venegas', '88887803', 'fabiola.alfaro@mail.com', '22223359', 'Zona Financiera', 'Sector Qu�mico'),
('404560890', 'Gerardo', 'R�os', 'Carranza', '88887804', 'gerardo.rios@mail.com', '22223360', 'Zona Alta', 'Sector Farmac�utico'),
('505670901', 'Karina', 'Barboza', 'Espinoza', '88887805', 'karina.barboza@mail.com', '22223361', 'Zona Baja', 'Sector Entretenimiento'),
('606780012', 'Oscar', 'D�az', 'Garc�a', '88887806', 'oscar.diaz@mail.com', '22223362', 'Zona Fronteriza', 'Sector Deportivo');




-- Insertar 30 casos
INSERT INTO Caso (Codigo_Caso, Cliente, Vendedor, Direccion, Asunto, Tipo, Estado, Prioridad, Descripcion, Fecha) VALUES
('CS001', '101230123', 'V001', 'San Jos�', 'Problema de producto', 'Queja', 'Abierto', 'Alta', 'El cliente reporta un problema con el producto', '2024-01-01'),
('CS002', '202340234', 'V002', 'Heredia', 'Solicitud de cotizaci�n', 'Cotizaci�n', 'Cerrado', 'Media', 'El cliente solicita una cotizaci�n de art�culos', '2024-01-02'),
('CS003', '303450345', 'V003', 'Alajuela', 'Problema de facturaci�n', 'Reclamo', 'Abierto', 'Baja', 'El cliente reporta una factura incorrecta', '2024-01-03'),
('CS004', '404560456', 'V004', 'Cartago', 'Solicitud de soporte t�cnico', 'Soporte', 'Abierto', 'Alta', 'El cliente necesita soporte para un producto', '2024-01-04'),
('CS005', '505670567', 'V005', 'Puntarenas', 'Consulta sobre env�o', 'Consulta', 'Cerrado', 'Media', 'El cliente consulta el estado de su env�o', '2024-01-05'),
('CS006', '606780678', 'V006', 'Lim�n', 'Problema con entrega', 'Reclamo', 'Abierto', 'Alta', 'El cliente no recibi� el producto a tiempo', '2024-01-06'),
('CS007', '707890789', 'V007', 'Guanacaste', 'Solicitud de devoluci�n', 'Devoluci�n', 'Abierto', 'Media', 'El cliente solicita la devoluci�n de un art�culo', '2024-01-07'),
('CS008', '808901890', 'V008', 'San Jos�', 'Consulta sobre garant�a', 'Consulta', 'Cerrado', 'Baja', 'El cliente consulta la garant�a de un producto', '2024-01-08'),
('CS009', '101230234', 'V009', 'Heredia', 'Reclamaci�n por defecto', 'Reclamo', 'Abierto', 'Alta', 'El cliente reporta un defecto en el producto', '2024-01-09'),
('CS010', '202340345', 'V010', 'Alajuela', 'Solicitud de cotizaci�n', 'Cotizaci�n', 'Cerrado', 'Media', 'El cliente solicita una cotizaci�n de servicios', '2024-01-10'),
('CS011', '303450456', 'V011', 'Cartago', 'Problema de pago', 'Reclamo', 'Abierto', 'Baja', 'El cliente reporta un problema con su pago', '2024-01-11'),
('CS012', '404560567', 'V012', 'Puntarenas', 'Solicitud de soporte', 'Soporte', 'Cerrado', 'Alta', 'El cliente necesita soporte t�cnico', '2024-01-12'),
('CS013', '505670678', 'V013', 'Lim�n', 'Problema de facturaci�n', 'Reclamo', 'Abierto', 'Media', 'El cliente reporta una factura duplicada', '2024-01-13'),
('CS014', '606780789', 'V014', 'Guanacaste', 'Solicitud de devoluci�n', 'Devoluci�n', 'Cerrado', 'Baja', 'El cliente solicita la devoluci�n de varios productos', '2024-01-14'),
('CS015', '707890890', 'V015', 'San Jos�', 'Problema de calidad', 'Reclamo', 'Abierto', 'Alta', 'El cliente reporta problemas de calidad en los productos', '2024-01-15'),
('CS016', '808901901', 'V016', 'Heredia', 'Consulta sobre precio', 'Consulta', 'Cerrado', 'Media', 'El cliente consulta el precio de varios art�culos', '2024-01-16'),
('CS017', '101230456', 'V017', 'Alajuela', 'Solicitud de cotizaci�n', 'Cotizaci�n', 'Abierto', 'Alta', 'El cliente solicita una cotizaci�n urgente', '2024-01-17'),
('CS018', '202340567', 'V018', 'Cartago', 'Problema con env�o', 'Reclamo', 'Abierto', 'Alta', 'El cliente reporta un retraso en el env�o', '2024-01-18'),
('CS019', '303450678', 'V019', 'Puntarenas', 'Solicitud de informaci�n', 'Consulta', 'Cerrado', 'Baja', 'El cliente solicita informaci�n adicional', '2024-01-19'),
('CS020', '404560789', 'V020', 'Lim�n', 'Problema de garant�a', 'Reclamo', 'Abierto', 'Media', 'El cliente solicita la activaci�n de la garant�a', '2024-01-20'),
('CS021', '505670890', 'V021', 'Guanacaste', 'Consulta sobre producto', 'Consulta', 'Cerrado', 'Baja', 'El cliente consulta caracter�sticas de un producto', '2024-01-21'),
('CS022', '606780901', 'V022', 'San Jos�', 'Problema con el pedido', 'Reclamo', 'Abierto', 'Alta', 'El cliente reporta que el pedido no lleg� completo', '2024-01-22'),
('CS023', '707890012', 'V023', 'Heredia', 'Solicitud de actualizaci�n', 'Soporte', 'Cerrado', 'Media', 'El cliente solicita una actualizaci�n de su producto', '2024-01-23'),
('CS024', '808901123', 'V024', 'Alajuela', 'Problema con la entrega', 'Reclamo', 'Abierto', 'Baja', 'El cliente no ha recibido su entrega', '2024-01-24'),
('CS025', '101230567', 'V025', 'Cartago', 'Solicitud de devoluci�n', 'Devoluci�n', 'Cerrado', 'Alta', 'El cliente solicita la devoluci�n de un servicio', '2024-01-25'),
('CS026', '202340678', 'V026', 'Puntarenas', 'Problema de facturaci�n', 'Reclamo', 'Abierto', 'Media', 'El cliente reporta un error en la factura', '2024-01-26'),
('CS027', '303450789', 'V027', 'Lim�n', 'Consulta sobre garant�a', 'Consulta', 'Cerrado', 'Baja', 'El cliente consulta la extensi�n de la garant�a', '2024-01-27'),
('CS028', '404560890', 'V028', 'Guanacaste', 'Problema con el pedido', 'Reclamo', 'Abierto', 'Alta', 'El cliente reporta que el pedido lleg� incompleto', '2024-01-28'),
('CS029', '505670901', 'V029', 'San Jos�', 'Solicitud de soporte t�cnico', 'Soporte', 'Cerrado', 'Media', 'El cliente solicita soporte t�cnico especializado', '2024-01-29'),
('CS030', '606780012', 'V030', 'Heredia', 'Problema con el pago', 'Reclamo', 'Abierto', 'Baja', 'El cliente reporta un problema al procesar el pago', '2024-01-30');

-- Insertar 30 tareas de los casos
INSERT INTO Tareas_Caso (Codigo_Tarea, Nombre_Tarea, Decripcion_Tarea, Codigo_Caso) VALUES
('T001', 'Verificar producto', 'Revisi�n del producto defectuoso', 'CS001'),
('T002', 'Generar cotizaci�n', 'Preparaci�n de cotizaci�n solicitada', 'CS002'),
('T003', 'Revisar factura', 'Revisi�n de la factura err�nea', 'CS003'),
('T004', 'Proporcionar soporte t�cnico', 'Ofrecer soporte para el producto', 'CS004'),
('T005', 'Verificar estado del env�o', 'Comprobar el estado del env�o del cliente', 'CS005'),
('T006', 'Gestionar devoluci�n', 'Tramitar la devoluci�n solicitada por el cliente', 'CS006'),
('T007', 'Revisar garant�a', 'Verificar las condiciones de la garant�a del producto', 'CS007'),
('T008', 'Atender consulta', 'Responder a la consulta del cliente sobre el producto', 'CS008'),
('T009', 'Verificar entrega', 'Confirmar que la entrega del producto fue correcta', 'CS009'),
('T010', 'Ofrecer soporte', 'Proporcionar soporte t�cnico al cliente', 'CS010'),
('T011', 'Verificar pago', 'Comprobar el estado del pago del cliente', 'CS011'),
('T012', 'Generar cotizaci�n', 'Preparaci�n de cotizaci�n solicitada por el cliente', 'CS012'),
('T013', 'Corregir factura', 'Realizar la correcci�n de la factura duplicada', 'CS013'),
('T014', 'Procesar devoluci�n', 'Tramitar la devoluci�n solicitada por el cliente', 'CS014'),
('T015', 'Atender reclamo', 'Resolver el problema de calidad reportado por el cliente', 'CS015'),
('T016', 'Enviar cotizaci�n', 'Proporcionar la cotizaci�n solicitada al cliente', 'CS016'),
('T017', 'Resolver problema de env�o', 'Investigar el retraso en el env�o del cliente', 'CS017'),
('T018', 'Ofrecer informaci�n', 'Responder a la solicitud de informaci�n adicional', 'CS018'),
('T019', 'Activar garant�a', 'Gestionar la activaci�n de la garant�a del producto', 'CS019'),
('T020', 'Responder consulta', 'Atender la consulta del cliente sobre el producto', 'CS020'),
('T021', 'Gestionar pedido', 'Revisar el estado del pedido reportado por el cliente', 'CS021'),
('T022', 'Actualizar producto', 'Realizar la actualizaci�n solicitada en el producto', 'CS022'),
('T023', 'Verificar entrega', 'Confirmar la entrega del producto al cliente', 'CS023'),
('T024', 'Gestionar devoluci�n', 'Tramitar la devoluci�n de los servicios solicitados', 'CS024'),
('T025', 'Corregir error en factura', 'Realizar la correcci�n del error en la factura', 'CS025'),
('T026', 'Revisar garant�a', 'Verificar la extensi�n de la garant�a solicitada', 'CS026'),
('T027', 'Gestionar pedido', 'Revisar el estado del pedido incompleto', 'CS027'),
('T028', 'Ofrecer soporte especializado', 'Proporcionar soporte t�cnico especializado', 'CS028'),
('T029', 'Procesar pago', 'Resolver el problema reportado con el pago del cliente', 'CS029'),
('T030', 'Verificar estado del caso', 'Comprobar el estado del caso abierto por el cliente', 'CS030');

-- Inserts por proc de Usuarios 
EXEC Registrar_Usuario '00112233441', 'Juan', 'Perez', 'Lopez', '88887777', 'juan.perez@example.com', '1985-03-15', 'San Jos�', '2024-01-01', 1200.00, 'Vendedor', 'Ventas', 'password123';
EXEC Registrar_Usuario '00112233442', 'Maria', 'Gomez', 'Rodriguez', '88887778', 'maria.gomez@example.com', '1990-07-20', 'Alajuela', '2023-02-15', 1000.00, 'Vendedor', 'Ventas ', 'password123';
EXEC Registrar_Usuario '00112233443', 'Carlos', 'Ramirez', 'Mendez', '88887779', 'carlos.ramirez@example.com', '1988-10-10', 'Cartago', '2024-03-01', 1500.00, 'Vendedor', 'Ventas', 'password123';
EXEC Registrar_Usuario '00112233444', 'Laura', 'Sanchez', 'Jimenez', '88887780', 'laura.sanchez@example.com', '1995-12-05', 'Heredia', '2023-05-10', 1400.00, 'Vendedor', 'Ventas', 'password123';
EXEC Registrar_Usuario '00112233445', 'Luis', 'Rojas', 'Castro', '88887781', 'luis.rojas@example.com', '1992-04-25', 'Puntarenas', '2024-06-15', 1300.00, 'Vendedor', 'Ventas', 'password123';
EXEC Registrar_Usuario '00112233446', 'Ana', 'Fernandez', 'Vargas', '88887782', 'ana.fernandez@example.com', '1987-08-18', 'Limon', '2023-07-25', 1250.00, 'Dise�ador', 'Marketing', 'password123';
EXEC Registrar_Usuario '00112233447', 'Jose', 'Lopez', 'Salazar', '88887783', 'jose.lopez@example.com', '1989-11-22', 'Guanacaste', '2024-08-05', 1350.00, 'Dise�ador', 'Marketing', 'password123';
EXEC Registrar_Usuario '00112233448', 'Carmen', 'Vega', 'Monge', '88887784', 'carmen.vega@example.com', '1991-02-28', 'San Jos�', '2023-09-15', 1150.00, 'Dise�ador', 'Marketing', 'password123';
EXEC Registrar_Usuario '00112233449', 'Miguel', 'Mora', 'Diaz', '88887785', 'miguel.mora@example.com', '1985-06-12', 'Alajuela', '2024-11-01', 1600.00, 'Analista', 'Marketing', 'password123';
EXEC Registrar_Usuario '00112233450', 'Rosa', 'Rivera', 'Martinez', '88887786', 'rosa.rivera@example.com', '1993-09-25', 'Cartago', '2024-12-01', 1100.00, 'Analista', 'Marketing', 'password123';
EXEC Registrar_Usuario '00112233451', 'Daniel', 'Castillo', 'Hernandez', '88887787', 'daniel.castillo@example.com', '1986-01-30', 'Heredia', '2024-01-20', 1700.00, 'Desarrollador', 'Desarrollo', 'password123';
EXEC Registrar_Usuario '00112233452', 'Patricia', 'Herrera', 'Gutierrez', '88887788', 'patricia.herrera@example.com', '1994-03-11', 'Puntarenas', '2023-03-15', 1450.00, 'Desarrollador', 'Desarrollo', 'password123';
EXEC Registrar_Usuario '00112233453', 'Raul', 'Soto', 'Alfaro', '88887789', 'raul.soto@example.com', '1983-05-16', 'San Jos�', '2023-04-10', 1550.00, 'Desarrollador', 'Desarrollo', 'password123';
EXEC Registrar_Usuario '00112233454', 'Sofia', 'Campos', 'Aguilar', '88887790', 'sofia.campos@example.com', '1997-07-07', 'Limon', '2024-09-05', 1120.00, 'Desarrollador', 'Desarrollo', 'password123';
EXEC Registrar_Usuario '00112233455', 'Ricardo', 'Araya', 'Solano', '88887791', 'ricardo.araya@example.com', '1984-12-17', 'Alajuela', '2023-06-25', 1050.00, 'Desarrollador', 'Desarrollo', 'password123';
EXEC Registrar_Usuario '00112233456', 'Elena', 'Zamora', 'Mora', '88887792', 'elena.zamora@example.com', '1986-10-01', 'Cartago', '2024-02-28', 1320.00, 'T�cnico', 'Soporte T�cnico', 'password123';
EXEC Registrar_Usuario '00112233457', 'Gabriel', 'Valverde', 'Espinoza', '88887793', 'gabriel.valverde@example.com', '1992-06-22', 'San Jos�', '2023-07-10', 1200.00, 'T�cnico', 'Soporte T�cnico', 'password123';
EXEC Registrar_Usuario '00112233458', 'Julia', 'Meza', 'Porras', '88887794', 'julia.meza@example.com', '1990-05-18', 'Heredia', '2023-10-05', 1475.00, 'T�cnico', 'Soporte T�cnico', 'password123';
EXEC Registrar_Usuario '00112233459', 'Andres', 'Quesada', 'Murillo', '88887795', 'andres.quesada@example.com', '1982-08-24', 'Limon', '2024-04-01', 1250.00, 'T�cnico', 'Soporte T�cnico', 'password123';
EXEC Registrar_Usuario '00112233460', 'Natalia', 'Gonzalez', 'Quir�s', '88887796', 'natalia.gonzalez@example.com', '1993-03-19', 'Guanacaste', '2023-11-01', 1350.00, 'T�cnico', 'Soporte T�cnico', 'password123';
EXEC Registrar_Usuario '00112233461', 'Oscar', 'Villalobos', 'Jim�nez', '88887797', 'oscar.villalobos@example.com', '1981-02-02', 'Puntarenas', '2024-06-15', 1600.00, 'Vendedor', 'Ventas', 'password123';
EXEC Registrar_Usuario '00112233462', 'Yolanda', 'Leiva', 'Montero', '88887798', 'yolanda.leiva@example.com', '1994-09-28', 'San Jos�', '2023-01-18', 1425.00, 'Vendedor', 'Ventas', 'password123';
EXEC Registrar_Usuario '00112233463', 'Manuel', 'Diaz', 'Vargas', '88887799', 'manuel.diaz@example.com', '1995-06-29', 'Cartago', '2024-07-22', 1170.00, 'Vendedor', 'Ventas', 'password123';
EXEC Registrar_Usuario '00112233464', 'Claudia', 'Molina', 'P�rez', '88887800', 'claudia.molina@example.com', '1989-10-08', 'San Jos�', '2024-02-10', 1300.00, 'Vendedor', 'Ventas', 'password123';
EXEC Registrar_Usuario '00112233465', 'Francisco', 'Salas', 'Guzm�n', '88887801', 'francisco.salas@example.com', '1987-05-04', 'Heredia', '2023-05-20', 1400.00, 'Coordinador', 'Administraci�n', 'password123';
EXEC Registrar_Usuario '00112233466', 'Teresa', 'Quintana', 'Vargas', '88887802', 'teresa.quintana@example.com', '1996-08-15', 'Alajuela', '2024-01-05', 1125.00, 'Administrador', 'Administraci�n', 'password123';
EXEC Registrar_Usuario '00112233467', 'Enrique', 'Alvarez', 'Loaiza', '88887803', 'enrique.alvarez@example.com', '1991-12-09', 'Puntarenas', '2023-03-05', 1540.00, 'Gerente', 'Administraci�n', 'password';


select * from Departamento;
INSERT INTO Departamento (Departamento) VALUES
('Administraci�n')


select * from Usuario;

Insert into Rol (Nombre_Rol, Descripcion) values 
('Admin','Rol administrativo'),
('Editor','Permisos de edicion'),
('Analista','Permisos de visualizacion');
use SistemaERP

insert into Accion (Nombre_Accion, Descripcion) values
('Edici�n','Permite  editar entidades'),
('Visualizaci�n','Permite visualizar la informaci�n'),
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

