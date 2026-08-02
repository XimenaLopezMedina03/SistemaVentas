-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: SistemaVentas
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Lácteos','Productos derivados de la leche'),(2,'Bebidas','Bebidas frías y calientes'),(3,'Abarrotes','Productos de primera necesidad'),(4,'Limpieza','Productos para el hogar'),(5,'Panadería','Panes y pasteles'),(6,'Carnes','Carnes frescas'),(7,'Frutas','Frutas nacionales'),(8,'Verduras','Verduras frescas'),(9,'Snacks','Golosinas y bocadillos'),(10,'Útiles','Artículos de oficina');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `dni` char(8) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'71234567','Juan','Pérez Gómez','987654321','juan@gmail.com','Lima'),(2,'72345678','María','López Díaz','987654322','maria@gmail.com','Callao'),(3,'73456789','Carlos','Ramírez Soto','987654323','carlos@gmail.com','Arequipa'),(4,'74567890','Ana','Torres Silva','987654324','ana@gmail.com','Trujillo'),(5,'75678901','Luis','Fernández Ruiz','987654325','luis@gmail.com','Chiclayo'),(6,'76789012','Rosa','García Flores','987654326','rosa@gmail.com','Piura'),(7,'77890123','Pedro','Castillo Vega','987654327','pedro@gmail.com','Cusco'),(8,'78901234','Lucía','Morales León','987654328','lucia@gmail.com','Tacna'),(9,'79012345','José','Navarro Cruz','987654329','jose@gmail.com','Ica'),(10,'70123456','Elena','Rojas Mendoza','987654330','elena@gmail.com','Huancayo');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleventa`
--

DROP TABLE IF EXISTS `detalleventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleventa` (
  `idDetalle` int(11) NOT NULL AUTO_INCREMENT,
  `idVenta` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioUnitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idDetalle`),
  KEY `fk_detalle_venta` (`idVenta`),
  KEY `fk_detalle_producto` (`idProducto`),
  CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `fk_detalle_venta` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleventa`
--

LOCK TABLES `detalleventa` WRITE;
/*!40000 ALTER TABLE `detalleventa` DISABLE KEYS */;
INSERT INTO `detalleventa` VALUES (1,1,1,2,4.50,9.00),(2,2,2,2,12.00,24.00),(3,3,6,1,18.90,18.90),(4,4,5,30,0.50,15.00),(5,5,3,1,28.90,28.90),(6,6,9,5,3.50,17.50),(7,7,10,2,8.00,16.00),(8,8,1,4,4.50,18.00),(9,9,8,2,4.00,8.00),(10,10,7,8,5.00,40.00);
/*!40000 ALTER TABLE `detalleventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `dni` char(8) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `cargo` varchar(80) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'80123456','Miguel','Vargas Soto','Administrador','999111001','miguel@empresa.com'),(2,'81234567','Patricia','Ruiz Díaz','Vendedor','999111002','patricia@empresa.com'),(3,'82345678','Diego','Castro León','Cajero','999111003','diego@empresa.com'),(4,'83456789','Andrea','Mendoza Silva','Vendedor','999111004','andrea@empresa.com'),(5,'84567890','Jorge','Salas Torres','Almacenero','999111005','jorge@empresa.com'),(6,'85678901','Karla','Paredes Flores','Supervisor','999111006','karla@empresa.com'),(7,'86789012','Kevin','Gómez Ruiz','Cajero','999111007','kevin@empresa.com'),(8,'87890123','Sandra','Herrera Vega','Vendedor','999111008','sandra@empresa.com'),(9,'88901234','Ricardo','Flores Díaz','Administrador','999111009','ricardo@empresa.com'),(10,'89012345','Daniela','Campos Soto','Vendedor','999111010','daniela@empresa.com');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `fk_producto_categoria` (`idCategoria`),
  CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Leche Gloria 1L','Leche evaporada',4.50,80,1),(2,'Coca Cola 3L','Gaseosa',12.00,50,2),(3,'Arroz Costeño 5Kg','Arroz superior',28.90,40,3),(4,'Lejía Sapolio','Desinfectante',6.50,35,4),(5,'Pan Francés','Pan fresco',0.50,300,5),(6,'Pollo Entero','Carne fresca',18.90,20,6),(7,'Manzana Roja','Fruta fresca',5.00,60,7),(8,'Tomate','Verdura fresca',4.00,70,8),(9,'Papas Lays','Snack clásico',3.50,100,9),(10,'Cuaderno A4','100 hojas',8.00,120,10);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta` (
  `idVenta` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `fk_venta_cliente` (`idCliente`),
  KEY `fk_venta_empleado` (`idEmpleado`),
  CONSTRAINT `fk_venta_cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `fk_venta_empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2026-08-01',1,2,21.00),(2,'2026-08-02',2,3,36.50),(3,'2026-08-03',3,4,18.90),(4,'2026-08-04',4,5,15.00),(5,'2026-08-05',5,6,42.40),(6,'2026-08-06',6,7,25.50),(7,'2026-08-07',7,8,30.00),(8,'2026-08-08',8,9,60.00),(9,'2026-08-09',9,10,12.50),(10,'2026-08-10',10,1,40.00);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-01 23:21:29
