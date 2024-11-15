--Inserts de Facturas


select * from Factura
select * from Cliente

-- Inserts para la tabla Factura
INSERT INTO Factura (Numero_Factura, Cliente, Vendedor, Cedula_Local, Monto, Fecha) VALUES
('F001', '101230123', '00112233441', '132465798', 0.00, '2023-10-01');

-- Agregar artículos a la factura F001
EXEC AgregarArticuloAFactura 'F001', 'A001', 10, 'B001';
EXEC AgregarArticuloAFactura 'F001', 'A002', 5, 'B002';
EXEC AgregarArticuloAFactura 'F001', 'A003', 5, 'B002';
EXEC AgregarArticuloAFactura 'F001', 'A004', 5, 'B002';


-- Inserts para la tabla Factura
INSERT INTO Factura (Numero_Factura, Cliente, Vendedor, Cedula_Local, Monto, Fecha) VALUES
('F002', '707890789', '00112233441', '132465798', 0.00, '2023-10-02');

-- Agregar artículos a la factura F002
EXEC AgregarArticuloAFactura 'F002', 'A003', 1, 'B003';
EXEC AgregarArticuloAFactura 'F002', 'A007', 1, 'B004';
EXEC AgregarArticuloAFactura 'F002', 'A006', 1, 'B004';

-- Inserts para la tabla Factura
INSERT INTO Factura (Numero_Factura, Cliente, Vendedor, Cedula_Local, Monto, Fecha) VALUES
('F003', '303450345', '00112233441', '132465798', 0.00, '2023-10-03');

-- Agregar artículos a la factura F003
EXEC AgregarArticuloAFactura 'F003', 'A041', 25, 'B005';
EXEC AgregarArticuloAFactura 'F003', 'A042', 30, 'B006';
EXEC AgregarArticuloAFactura 'F003', 'A043', 30, 'B006';
EXEC AgregarArticuloAFactura 'F003', 'A044', 30, 'B006';
EXEC AgregarArticuloAFactura 'F003', 'A045', 30, 'B006';

-- Inserts para la tabla Factura
INSERT INTO Factura (Numero_Factura, Cliente, Vendedor, Cedula_Local, Monto, Fecha) VALUES
('F004', '404560456', '00112233441', '132465798', 0.00, '2023-10-04');

-- Agregar artículos a la factura F004
EXEC AgregarArticuloAFactura 'F004', 'A046', 3, 'B007';
EXEC AgregarArticuloAFactura 'F004', 'A004', 4, 'B008';

-- Inserts para la tabla Factura
INSERT INTO Factura (Numero_Factura, Cliente, Vendedor, Cedula_Local, Monto, Fecha) VALUES
('F005', '505670567', '00112233441', '132465798', 0.00, '2023-10-05');

-- Agregar artículos a la factura F005
EXEC AgregarArticuloAFactura 'F005', 'A031', 2, 'B009';
EXEC AgregarArticuloAFactura 'F005', 'A032', 5, 'B010';
EXEC AgregarArticuloAFactura 'F005', 'A033', 10, 'B010';
EXEC AgregarArticuloAFactura 'F005', 'A034', 5, 'B010';
EXEC AgregarArticuloAFactura 'F005', 'A035', 3, 'B010';
EXEC AgregarArticuloAFactura 'F005', 'A028', 6, 'B010';

--

-- Inserts para la tabla Factura
INSERT INTO Factura (Numero_Factura, Cliente, Vendedor, Cedula_Local, Monto, Fecha) VALUES
('F006', '303450345', '00112233466', '132465798', 0.00, '2024-01-01');

-- Agregar artículos a la factura F006
EXEC AgregarArticuloAFactura 'F006', 'A046', 10, 'B001';
EXEC AgregarArticuloAFactura 'F006', 'A047', 5, 'B002';
EXEC AgregarArticuloAFactura 'F006', 'A048', 5, 'B002';
EXEC AgregarArticuloAFactura 'F006', 'A050', 5, 'B002';


-- Inserts para la tabla Factura
INSERT INTO Factura (Numero_Factura, Cliente, Vendedor, Cedula_Local, Monto, Fecha) VALUES
('F007', '303450345', '00112233466', '132465798', 0.00, '2024-02-02');

-- Agregar artículos a la factura F007
EXEC AgregarArticuloAFactura 'F007', 'A036', 1, 'B003';
EXEC AgregarArticuloAFactura 'F007', 'A037', 1, 'B004';
EXEC AgregarArticuloAFactura 'F007', 'A038', 1, 'B004';

-- Inserts para la tabla Factura
INSERT INTO Factura (Numero_Factura, Cliente, Vendedor, Cedula_Local, Monto, Fecha) VALUES
('F008', '303450345', '00112233466', '132465798', 0.00, '2024-03-03');

-- Agregar artículos a la factura F008
EXEC AgregarArticuloAFactura 'F008', 'A015', 25, 'B005';
EXEC AgregarArticuloAFactura 'F008', 'A014', 30, 'B006';
EXEC AgregarArticuloAFactura 'F008', 'A013', 30, 'B006';
EXEC AgregarArticuloAFactura 'F008', 'A012', 30, 'B006';
EXEC AgregarArticuloAFactura 'F008', 'A034', 30, 'B006';

-- Inserts para la tabla Factura
INSERT INTO Factura (Numero_Factura, Cliente, Vendedor, Cedula_Local, Monto, Fecha) VALUES
('F009', '303450345', '00112233442', '132465798', 0.00, '2024-04-04');

-- Agregar artículos a la factura F009
EXEC AgregarArticuloAFactura 'F009', 'A033', 3, 'B007';
EXEC AgregarArticuloAFactura 'F009', 'A027', 4, 'B008';

-- Inserts para la tabla Factura
INSERT INTO Factura (Numero_Factura, Cliente, Vendedor, Cedula_Local, Monto, Fecha) VALUES
('F010', '303450345', '00112233442', '132465798', 0.00, '2024-05-05');

-- Agregar artículos a la factura F010
EXEC AgregarArticuloAFactura 'F010', 'A036', 2, 'B009';
EXEC AgregarArticuloAFactura 'F010', 'A037', 5, 'B010';
EXEC AgregarArticuloAFactura 'F010', 'A038', 10, 'B010';
EXEC AgregarArticuloAFactura 'F010', 'A039', 5, 'B010';
EXEC AgregarArticuloAFactura 'F010', 'A040', 3, 'B010';
EXEC AgregarArticuloAFactura 'F010', 'A031', 6, 'B010';
