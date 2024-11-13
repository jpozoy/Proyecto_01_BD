--Inserts de Cotizaciones Por procedimiento

DECLARE @CodigoCotizacionSalida VARCHAR(12);


-- Cotización 1
EXEC Registrar_Cotizacion 
    @Cliente = '101230123',
    @Vendedor = '00112233442',
    @Mes_Proyectado_Cierre = '2023-12-01',
    @Descripcion = 'Articulos para el hogar',
    @Estado = 'abierta',
    @Tipo = 'Detalle',
    @Zona = 'Zona Central',
    @Sector = 'Sector Comercial',
    @Probabilidad = '50%',
    @CodigoCotizacionSalida = @CodigoCotizacionSalida OUTPUT;

EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A036', @Cantidad = 1;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A037', @Cantidad = 1;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A038', @Cantidad = 2;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A039', @Cantidad = 2;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A040', @Cantidad = 1;


-- Cotización 2
EXEC Registrar_Cotizacion 
    @Cliente = '303450345',
    @Vendedor = '00112233444',
    @Mes_Proyectado_Cierre = '2024-12-01',
    @Descripcion = 'Articulos tecnologicos',
    @Estado = 'aprobada',
    @Tipo = 'Mayoreo',
    @Zona = 'Zona Norte',
    @Sector = 'Sector Comercial',
    @Probabilidad = '75%',
    @CodigoCotizacionSalida = @CodigoCotizacionSalida OUTPUT;

EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A001', @Cantidad = 15;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A016', @Cantidad = 5;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A028', @Cantidad = 13;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A031', @Cantidad = 10;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A034', @Cantidad = 15;


-- Cotización 3
EXEC Registrar_Cotizacion 
    @Cliente = '505670567',
    @Vendedor = '00112233442',
    @Mes_Proyectado_Cierre = '2023-12-03',
    @Descripcion = 'Productos personales',
    @Estado = 'abierta',
    @Tipo = 'Detalle',
    @Zona = 'Zona Este',
    @Sector = 'Sector Comercial',
    @Probabilidad = '25%',
    @CodigoCotizacionSalida = @CodigoCotizacionSalida OUTPUT;

EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A019', @Cantidad = 1;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A024', @Cantidad = 1;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A010', @Cantidad = 1;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A004', @Cantidad = 1;


-- Repite el mismo patrón para las cotizaciones restantes

-- Cotización 4
EXEC Registrar_Cotizacion 
    @Cliente = '101230234',
    @Vendedor = '00112233463',
    @Mes_Proyectado_Cierre = '2024-11-01',
    @Descripcion = 'Productos alimenticios',
    @Estado = 'abierta',
    @Tipo = 'Mayoreo',
    @Zona = 'Zona Oeste',
    @Sector = 'Sector Alimenticio',
    @Probabilidad = '75%',
    @CodigoCotizacionSalida = @CodigoCotizacionSalida OUTPUT;

EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A041', @Cantidad = 10;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A042', @Cantidad = 15;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A044', @Cantidad = 20;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A045', @Cantidad = 25;


-- Cotización 5
EXEC Registrar_Cotizacion 
    @Cliente = '808901890',
    @Vendedor = '00112233447',
    @Mes_Proyectado_Cierre = '2024-06-01',
    @Descripcion = 'Productos varios',
    @Estado = 'abierta',
    @Tipo = 'Detalle',
    @Zona = 'Zona Oeste',
    @Sector = 'Sector Comercial',
    @Probabilidad = '25%',
    @CodigoCotizacionSalida = @CodigoCotizacionSalida OUTPUT;

EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A031', @Cantidad = 1;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A024', @Cantidad = 2;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A029', @Cantidad = 1;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A015', @Cantidad = 1;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A008', @Cantidad = 1;


-- Cotización 6
EXEC Registrar_Cotizacion 
    @Cliente = '808901890',
    @Vendedor = '00112233447',
    @Mes_Proyectado_Cierre = '2024-07-01',
    @Descripcion = 'Productos de videojuegos',
    @Estado = 'abierta',
    @Tipo = 'Mayoreo',
    @Zona = 'Zona Oeste',
    @Sector = 'Sector Tecnológico',
    @Probabilidad = '50%',
    @CodigoCotizacionSalida = @CodigoCotizacionSalida OUTPUT;

EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A027', @Cantidad = 10;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A029', @Cantidad = 5;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A032', @Cantidad = 8;


-- Cotización 7
EXEC Registrar_Cotizacion 
    @Cliente = '505670567',
    @Vendedor = '00112233445',
    @Mes_Proyectado_Cierre = '2024-02-01',
    @Descripcion = 'Articulos de construccion',
    @Estado = 'abierta',
    @Tipo = 'Detalle',
    @Zona = 'Zona Sur',
    @Sector = 'Sector Construcción',
    @Probabilidad = '50%',
    @CodigoCotizacionSalida = @CodigoCotizacionSalida OUTPUT;

EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A012', @Cantidad = 15;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A013', @Cantidad = 1;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A014', @Cantidad = 3;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A015', @Cantidad = 4;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A034', @Cantidad = 2;


-- Cotización 8
EXEC Registrar_Cotizacion 
    @Cliente = '303450456',
    @Vendedor = '00112233449',
    @Mes_Proyectado_Cierre = '2024-04-01',
    @Descripcion = 'Articulos de oficina',
    @Estado = 'abierta',
    @Tipo = 'Detalle',
    @Zona = 'Zona Este',
    @Sector = 'Sector Comercial',
    @Probabilidad = '50%',
    @CodigoCotizacionSalida = @CodigoCotizacionSalida OUTPUT;

EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A002', @Cantidad = 2;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A003', @Cantidad = 5;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A008', @Cantidad = 2;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A009', @Cantidad = 2;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A001', @Cantidad = 2;


-- Cotización 9
EXEC Registrar_Cotizacion 
    @Cliente = '303450456',
    @Vendedor = '00112233449',
    @Mes_Proyectado_Cierre = '2024-09-01',
    @Descripcion = 'Productos electrodomesticos',
    @Estado = 'abierta',
    @Tipo = 'Mayoreo',
    @Zona = 'Zona Central',
    @Sector = 'Sector Comercial',
    @Probabilidad = '50%',
    @CodigoCotizacionSalida = @CodigoCotizacionSalida OUTPUT;

EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A025', @Cantidad = 10;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A011', @Cantidad = 15;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A005', @Cantidad = 20;


-- Cotización 10
EXEC Registrar_Cotizacion 
    @Cliente = '404560890',
    @Vendedor = '00112233441',
    @Mes_Proyectado_Cierre = '2023-07-01',
    @Descripcion = 'Articulos varios',
    @Estado = 'abierta',
    @Tipo = 'Detalle',
    @Zona = 'Zona Sur',
    @Sector = 'Sector Comercial',
    @Probabilidad = '75%',
    @CodigoCotizacionSalida = @CodigoCotizacionSalida OUTPUT;

EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A046', @Cantidad = 5;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A038', @Cantidad = 10;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A033', @Cantidad = 15;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A023', @Cantidad = 20;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A024', @Cantidad = 25;


-- Cotización 11
EXEC Registrar_Cotizacion 
    @Cliente = '101230123',
    @Vendedor = '00112233445',
    @Mes_Proyectado_Cierre = '2023-12-11',
    @Descripcion = 'Cotización para escuela ',
    @Estado = 'abierta',
    @Tipo = 'Detalle',
    @Zona = 'Zona Norte',
    @Sector = 'Sector Educativo',
    @Probabilidad = '50%',
    @CodigoCotizacionSalida = @CodigoCotizacionSalida OUTPUT;

EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A003', @Cantidad = 20;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A001', @Cantidad = 5;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A002', @Cantidad = 5;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A008', @Cantidad = 5;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A009', @Cantidad = 5;


-- Cotización 12
EXEC Registrar_Cotizacion 
    @Cliente = '202340234',
    @Vendedor = '00112233445',
    @Mes_Proyectado_Cierre = '2024-03-01',
    @Descripcion = 'Prodcutos textiles',
    @Estado = 'abierta',
    @Tipo = 'Mayoreo',
    @Zona = 'Zona Oeste',
    @Sector = 'Sector Textil',
    @Probabilidad = '50%',
    @CodigoCotizacionSalida = @CodigoCotizacionSalida OUTPUT;

EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A046', @Cantidad = 15;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A042', @Cantidad = 20;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A043', @Cantidad = 25;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A044', @Cantidad = 30;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A045', @Cantidad = 35;


-- Cotización 13
EXEC Registrar_Cotizacion 
    @Cliente = '303450345',
    @Vendedor = '00112233445',
    @Mes_Proyectado_Cierre = '2024-04-01',
    @Descripcion = 'Articulso de tecnologia',
    @Estado = 'abierta',
    @Tipo = 'Detalle',
    @Zona = 'Zona Este',
    @Sector = 'Sector Tecnológico',
    @Probabilidad = '75%',
    @CodigoCotizacionSalida = @CodigoCotizacionSalida OUTPUT;

EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A016', @Cantidad = 1;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A017', @Cantidad = 1;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A024', @Cantidad = 2;


-- Cotización 14
EXEC Registrar_Cotizacion 
    @Cliente = '505670567',
    @Vendedor = '00112233445',
    @Mes_Proyectado_Cierre = '2024-05-01',
    @Descripcion = 'Productos de alimento',
    @Estado = 'abierta',
    @Tipo = 'Mayoreo',
    @Zona = 'Zona Oeste',
    @Sector = 'Sector Alimenticio',
    @Probabilidad = '50%',
    @CodigoCotizacionSalida = @CodigoCotizacionSalida OUTPUT;

EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A041', @Cantidad = 10;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A042', @Cantidad = 15;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'A044', @Cantidad = 20;


-- Cotización 15
EXEC Registrar_Cotizacion 
    @Cliente = '123456789015',
    @Vendedor = '00112233445',
    @Mes_Proyectado_Cierre = '2024-06-01',
    @Descripcion = 'Articulos para industria',
    @Estado = 'abierta',
    @Tipo = 'Detalle',
    @Zona = 'Zona Sur',
    @Sector = 'Sector Industrial',
    @Probabilidad = '100%',
    @CodigoCotizacionSalida = @CodigoCotizacionSalida OUTPUT;

EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'ART021', @Cantidad = 5;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'ART022', @Cantidad = 10;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'ART023', @Cantidad = 15;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'ART024', @Cantidad = 20;
EXEC Agregar_Articulos_Cotizacion @Cotizacion = @CodigoCotizacionSalida, @Articulo = 'ART025', @Cantidad = 25;

