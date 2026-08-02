-- CREACIÓN DE LA BASE DE DATOS
CREATE DATABASE SistemaVentas;
USE SistemaVentas;

-- CREACIÓN DE TABLAS
CREATE TABLE Categoria(
    idCategoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE Cliente(
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    dni CHAR(8) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(100),
    direccion VARCHAR(150)
);

CREATE TABLE Empleado(
    idEmpleado INT AUTO_INCREMENT PRIMARY KEY,
    dni CHAR(8) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    cargo VARCHAR(80),
    telefono VARCHAR(20),
    correo VARCHAR(100)
);

CREATE TABLE Producto(
    idProducto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    descripcion VARCHAR(255),
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    idCategoria INT NOT NULL,

    CONSTRAINT fk_producto_categoria
    FOREIGN KEY(idCategoria)
    REFERENCES Categoria(idCategoria)
);

CREATE TABLE Venta(
    idVenta INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    idCliente INT NOT NULL,
    idEmpleado INT NOT NULL,
    total DECIMAL(10,2),

    CONSTRAINT fk_venta_cliente
    FOREIGN KEY(idCliente)
    REFERENCES Cliente(idCliente),

    CONSTRAINT fk_venta_empleado
    FOREIGN KEY(idEmpleado)
    REFERENCES Empleado(idEmpleado)
);

CREATE TABLE DetalleVenta(
    idDetalle INT AUTO_INCREMENT PRIMARY KEY,
    idVenta INT NOT NULL,
    idProducto INT NOT NULL,
    cantidad INT NOT NULL,
    precioUnitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_detalle_venta
    FOREIGN KEY(idVenta)
    REFERENCES Venta(idVenta),

    CONSTRAINT fk_detalle_producto
    FOREIGN KEY(idProducto)
    REFERENCES Producto(idProducto)
);

-- INSERCIÓN DE REGISTROS

-- Categoría
insert into categoria (nombre, descripcion) values ('Lácteos','Productos derivados de la leche');
insert into categoria (nombre, descripcion) values ('Bebidas','Bebidas frías y calientes');
insert into categoria (nombre, descripcion) values ('Abarrotes','Productos de primera necesidad');
insert into categoria (nombre, descripcion) values ('Limpieza','Productos para el hogar');
insert into categoria (nombre, descripcion) values ('Panadería','Panes y pasteles');
insert into categoria (nombre, descripcion) values ('Carnes','Carnes frescas');
insert into categoria (nombre, descripcion) values ('Frutas','Frutas nacionales');
insert into categoria (nombre, descripcion) values ('Verduras','Verduras frescas');
insert into categoria (nombre, descripcion) values ('Snacks','Golosinas y bocadillos');
insert into categoria (nombre, descripcion) values ('Útiles','Artículos de oficina');

-- Cliente
insert into cliente (dni, nombres, apellidos, telefono, correo, direccion) values ('71234567','Juan','Pérez Gómez','987654321','juan@gmail.com','Lima');
insert into cliente (dni, nombres, apellidos, telefono, correo, direccion) values ('72345678','María','López Díaz','987654322','maria@gmail.com','Callao');
insert into cliente (dni, nombres, apellidos, telefono, correo, direccion) values ('73456789','Carlos','Ramírez Soto','987654323','carlos@gmail.com','Arequipa');
insert into cliente (dni, nombres, apellidos, telefono, correo, direccion) values ('74567890','Ana','Torres Silva','987654324','ana@gmail.com','Trujillo');
insert into cliente (dni, nombres, apellidos, telefono, correo, direccion) values ('75678901','Luis','Fernández Ruiz','987654325','luis@gmail.com','Chiclayo');
insert into cliente (dni, nombres, apellidos, telefono, correo, direccion) values ('76789012','Rosa','García Flores','987654326','rosa@gmail.com','Piura');
insert into cliente (dni, nombres, apellidos, telefono, correo, direccion) values ('77890123','Pedro','Castillo Vega','987654327','pedro@gmail.com','Cusco');
insert into cliente (dni, nombres, apellidos, telefono, correo, direccion) values ('78901234','Lucía','Morales León','987654328','lucia@gmail.com','Tacna');
insert into cliente (dni, nombres, apellidos, telefono, correo, direccion) values ('79012345','José','Navarro Cruz','987654329','jose@gmail.com','Ica');
insert into cliente (dni, nombres, apellidos, telefono, correo, direccion) values ('70123456','Elena','Rojas Mendoza','987654330','elena@gmail.com','Huancayo');

-- Empleado
insert into empleado (dni, nombres, apellidos, cargo, telefono, correo) values ('80123456','Miguel','Vargas Soto','Administrador','999111001','miguel@empresa.com');
insert into empleado (dni, nombres, apellidos, cargo, telefono, correo) values ('81234567','Patricia','Ruiz Díaz','Vendedor','999111002','patricia@empresa.com');
insert into empleado (dni, nombres, apellidos, cargo, telefono, correo) values ('82345678','Diego','Castro León','Cajero','999111003','diego@empresa.com');
insert into empleado (dni, nombres, apellidos, cargo, telefono, correo) values ('83456789','Andrea','Mendoza Silva','Vendedor','999111004','andrea@empresa.com');
insert into empleado (dni, nombres, apellidos, cargo, telefono, correo) values ('84567890','Jorge','Salas Torres','Almacenero','999111005','jorge@empresa.com');
insert into empleado (dni, nombres, apellidos, cargo, telefono, correo) values ('85678901','Karla','Paredes Flores','Supervisor','999111006','karla@empresa.com');
insert into empleado (dni, nombres, apellidos, cargo, telefono, correo) values ('86789012','Kevin','Gómez Ruiz','Cajero','999111007','kevin@empresa.com');
insert into empleado (dni, nombres, apellidos, cargo, telefono, correo) values ('87890123','Sandra','Herrera Vega','Vendedor','999111008','sandra@empresa.com');
insert into empleado (dni, nombres, apellidos, cargo, telefono, correo) values ('88901234','Ricardo','Flores Díaz','Administrador','999111009','ricardo@empresa.com');
insert into empleado (dni, nombres, apellidos, cargo, telefono, correo) values ('89012345','Daniela','Campos Soto','Vendedor','999111010','daniela@empresa.com');

-- Producto
insert into producto (nombre, descripcion, precio, stock, idCategoria) values ('Leche Gloria 1L','Leche evaporada',4.50,80,1);
insert into producto (nombre, descripcion, precio, stock, idCategoria) values ('Coca Cola 3L','Gaseosa',12.00,50,2);
insert into producto (nombre, descripcion, precio, stock, idCategoria) values ('Arroz Costeño 5Kg','Arroz superior',28.90,40,3);
insert into producto (nombre, descripcion, precio, stock, idCategoria) values ('Lejía Sapolio','Desinfectante',6.50,35,4);
insert into producto (nombre, descripcion, precio, stock, idCategoria) values ('Pan Francés','Pan fresco',0.50,300,5);
insert into producto (nombre, descripcion, precio, stock, idCategoria) values ('Pollo Entero','Carne fresca',18.90,20,6);
insert into producto (nombre, descripcion, precio, stock, idCategoria) values ('Manzana Roja','Fruta fresca',5.00,60,7);
insert into producto (nombre, descripcion, precio, stock, idCategoria) values ('Tomate','Verdura fresca',4.00,70,8);
insert into producto (nombre, descripcion, precio, stock, idCategoria) values ('Papas Lays','Snack clásico',3.50,100,9);
insert into producto (nombre, descripcion, precio, stock, idCategoria) values ('Cuaderno A4','100 hojas',8.00,120,10);

-- Venta
insert into venta (fecha, idCliente, idEmpleado, total) values ('2026-08-01',1,2,21.00);
insert into venta (fecha, idCliente, idEmpleado, total) values ('2026-08-02',2,3,36.50);
insert into venta (fecha, idCliente, idEmpleado, total) values ('2026-08-03',3,4,18.90);
insert into venta (fecha, idCliente, idEmpleado, total) values ('2026-08-04',4,5,15.00);
insert into venta (fecha, idCliente, idEmpleado, total) values ('2026-08-05',5,6,42.40);
insert into venta (fecha, idCliente, idEmpleado, total) values ('2026-08-06',6,7,25.50);
insert into venta (fecha, idCliente, idEmpleado, total) values ('2026-08-07',7,8,30.00);
insert into venta (fecha, idCliente, idEmpleado, total) values ('2026-08-08',8,9,60.00);
insert into venta (fecha, idCliente, idEmpleado, total) values ('2026-08-09',9,10,12.50);
insert into venta (fecha, idCliente, idEmpleado, total) values ('2026-08-10',10,1,40.00);

-- Detalle de Venta
insert into detalleventa (idVenta, idProducto, cantidad, precioUnitario, subtotal) values (1,1,2,4.50,9.00);
insert into detalleventa (idVenta, idProducto, cantidad, precioUnitario, subtotal) values (2,2,2,12.00,24.00);
insert into detalleventa (idVenta, idProducto, cantidad, precioUnitario, subtotal) values (3,6,1,18.90,18.90);
insert into detalleventa (idVenta, idProducto, cantidad, precioUnitario, subtotal) values (4,5,30,0.50,15.00);
insert into detalleventa (idVenta, idProducto, cantidad, precioUnitario, subtotal) values (5,3,1,28.90,28.90);
insert into detalleventa (idVenta, idProducto, cantidad, precioUnitario, subtotal) values (6,9,5,3.50,17.50);
insert into detalleventa (idVenta, idProducto, cantidad, precioUnitario, subtotal) values (7,10,2,8.00,16.00);
insert into detalleventa (idVenta, idProducto, cantidad, precioUnitario, subtotal) values (8,1,4,4.50,18.00);
insert into detalleventa (idVenta, idProducto, cantidad, precioUnitario, subtotal) values (9,8,2,4.00,8.00);
insert into detalleventa (idVenta, idProducto, cantidad, precioUnitario, subtotal) values (10,7,8,5.00,40.00);

-- CONSULTAS

-- Mostrar todos los productos junto con su categoría.
SELECT
    p.idProducto,
    p.nombre AS Producto,
    p.precio,
    p.stock,
    c.nombre AS Categoria
FROM Producto p
INNER JOIN Categoria c
ON p.idCategoria = c.idCategoria;

-- Mostrar las ventas realizadas con el nombre del cliente y del empleado.
SELECT
    v.idVenta,
    v.fecha,
    CONCAT(c.nombres,' ',c.apellidos) AS Cliente,
    CONCAT(e.nombres,' ',e.apellidos) AS Empleado,
    v.total
FROM Venta v
INNER JOIN Cliente c
ON v.idCliente = c.idCliente
INNER JOIN Empleado e
ON v.idEmpleado = e.idEmpleado;

-- Mostrar el detalle de cada venta con los productos vendidos.
SELECT
    dv.idDetalle,
    v.idVenta,
    p.nombre AS Producto,
    dv.cantidad,
    dv.precioUnitario,
    dv.subtotal
FROM DetalleVenta dv
INNER JOIN Venta v
ON dv.idVenta = v.idVenta
INNER JOIN Producto p
ON dv.idProducto = p.idProducto;

-- Listar los productos ordenados del precio más alto al más bajo.
SELECT
    nombre,
    precio,
    stock
FROM Producto
ORDER BY precio DESC;

-- Calcular el total de compras realizadas por cada cliente.
SELECT
    CONCAT(c.nombres,' ',c.apellidos) AS Cliente,
    SUM(v.total) AS TotalComprado
FROM Cliente c
INNER JOIN Venta v
ON c.idCliente = v.idCliente
GROUP BY c.idCliente;

-- Contar la cantidad de ventas realizadas por cada empleado.
SELECT
    CONCAT(e.nombres,' ',e.apellidos) AS Empleado,
    COUNT(v.idVenta) AS CantidadVentas
FROM Empleado e
INNER JOIN Venta v
ON e.idEmpleado = v.idEmpleado
GROUP BY e.idEmpleado;

-- Mostrar los productos con un stock menor a 10 unidades.
SELECT
    nombre,
    precio,
    stock
FROM Producto
WHERE stock < 10;

-- Mostrar el producto con el precio más alto utilizando una subconsulta.
SELECT
    nombre,
    precio
FROM Producto
WHERE precio = (
    SELECT MAX(precio)
    FROM Producto
);

-- Buscar los clientes cuyo apellido comienza con la letra 'A'.
SELECT
    nombres,
    apellidos,
    telefono
FROM Cliente
WHERE apellidos LIKE 'A%';

-- Mostrar las categorías que tienen más de un producto registrado.
SELECT
    c.nombre AS Categoria,
    COUNT(p.idProducto) AS CantidadProductos
FROM Categoria c
INNER JOIN Producto p
ON c.idCategoria = p.idCategoria
GROUP BY c.idCategoria
HAVING COUNT(p.idProducto) > 1;