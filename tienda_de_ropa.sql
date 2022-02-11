-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.6.4-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para tienda_ropa
CREATE DATABASE IF NOT EXISTS `tienda_ropa` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `tienda_ropa`;

-- Volcando estructura para tabla tienda_ropa.articulo
CREATE TABLE IF NOT EXISTS `articulo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tienda_ropa.articulo: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
REPLACE INTO `articulo` (`id`, `descripcion`) VALUES
	(1, 'Camiseta básica blanca'),
	(2, 'Camisa de cuadros azules'),
	(3, 'Chaquetón unisex azul marino'),
	(4, 'Sudadera Marvel IronMan'),
	(5, 'Sudadera con capucha Amarilla y Negra'),
	(6, 'Camiseta infantil Bob Sponja'),
	(7, 'Chaleco de cuello vuelto Rojo'),
	(8, 'Cahaqueta Vaquera'),
	(9, 'Pantalón vaquero '),
	(10, 'Calzonas negras');
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;

-- Volcando estructura para tabla tienda_ropa.articulo_ropa
CREATE TABLE IF NOT EXISTS `articulo_ropa` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_articulo` int(10) NOT NULL,
  `precio_base` float NOT NULL,
  `id_tipo` int(10) NOT NULL,
  `id_talla` int(10) NOT NULL,
  `id_marca` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_articuloropa` (`id_tipo`),
  KEY `fk2_articuloropa` (`id_talla`),
  KEY `fk3_articuloropa` (`id_marca`),
  KEY `articulo_ropa_FK` (`id_articulo`),
  CONSTRAINT `articulo_ropa_FK` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id`),
  CONSTRAINT `fk2_articuloropa` FOREIGN KEY (`id_talla`) REFERENCES `talla` (`id`),
  CONSTRAINT `fk3_articuloropa` FOREIGN KEY (`id_marca`) REFERENCES `marca_ropa` (`id`),
  CONSTRAINT `fk_articuloropa` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=343646 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tienda_ropa.articulo_ropa: ~112 rows (aproximadamente)
/*!40000 ALTER TABLE `articulo_ropa` DISABLE KEYS */;
REPLACE INTO `articulo_ropa` (`id`, `id_articulo`, `precio_base`, `id_tipo`, `id_talla`, `id_marca`) VALUES
	(1, 1, 3, 1, 16, 9),
	(2, 1, 3.5, 1, 17, 9),
	(3, 1, 4, 2, 12, 9),
	(4, 1, 4, 2, 13, 9),
	(5, 1, 4, 3, 14, 9),
	(6, 1, 5, 4, 15, 9),
	(7, 1, 6, 5, 1, 9),
	(8, 1, 6, 5, 2, 9),
	(9, 1, 6, 5, 3, 9),
	(10, 1, 6, 5, 4, 9),
	(11, 1, 6, 5, 5, 9),
	(12, 1, 6, 5, 6, 9),
	(13, 1, 6, 5, 7, 9),
	(14, 1, 6, 5, 8, 9),
	(15, 1, 6, 5, 9, 9),
	(16, 1, 6, 5, 10, 9),
	(17, 1, 6, 6, 1, 9),
	(18, 1, 6, 6, 2, 9),
	(19, 1, 6, 6, 3, 9),
	(20, 1, 6, 6, 4, 9),
	(21, 1, 6, 6, 5, 9),
	(22, 1, 6, 6, 6, 9),
	(23, 1, 6, 6, 7, 9),
	(24, 1, 6, 6, 8, 9),
	(25, 1, 6, 6, 9, 9),
	(26, 1, 6, 6, 10, 9),
	(27, 2, 6, 5, 1, 10),
	(28, 2, 6, 5, 2, 10),
	(29, 2, 6, 5, 3, 10),
	(30, 2, 6, 5, 4, 10),
	(31, 2, 6, 5, 5, 10),
	(32, 2, 6, 5, 6, 10),
	(33, 2, 6, 5, 7, 10),
	(34, 2, 6, 5, 8, 10),
	(35, 2, 6, 5, 9, 10),
	(36, 2, 6, 5, 10, 10),
	(37, 3, 30, 5, 1, 1),
	(38, 3, 30, 5, 2, 1),
	(40, 3, 30, 5, 3, 1),
	(41, 3, 30, 5, 4, 1),
	(42, 3, 30, 5, 5, 1),
	(43, 3, 30, 5, 6, 1),
	(44, 3, 30, 5, 7, 1),
	(45, 3, 30, 5, 8, 1),
	(46, 3, 30, 5, 9, 1),
	(47, 3, 30, 5, 10, 1),
	(48, 3, 30, 5, 10, 1),
	(49, 3, 30, 6, 1, 1),
	(50, 3, 30, 6, 2, 1),
	(51, 3, 30, 6, 3, 1),
	(52, 3, 30, 6, 4, 1),
	(53, 3, 30, 6, 5, 1),
	(54, 3, 30, 6, 6, 1),
	(55, 3, 30, 6, 7, 1),
	(56, 3, 30, 6, 8, 1),
	(57, 3, 30, 6, 9, 1),
	(58, 3, 30, 6, 10, 1),
	(59, 3, 30, 6, 10, 1),
	(60, 4, 15, 6, 4, 9),
	(61, 4, 15, 6, 5, 9),
	(62, 4, 15, 6, 6, 9),
	(63, 4, 15, 6, 7, 9),
	(64, 4, 15, 6, 8, 9),
	(65, 4, 15, 5, 4, 9),
	(66, 4, 15, 5, 5, 9),
	(67, 4, 15, 5, 6, 9),
	(68, 4, 15, 5, 7, 9),
	(69, 4, 15, 5, 8, 9),
	(70, 6, 3, 1, 16, 9),
	(71, 6, 3.5, 1, 17, 9),
	(72, 6, 4, 2, 12, 9),
	(73, 6, 4, 2, 13, 9),
	(74, 7, 16, 5, 1, 9),
	(75, 7, 16, 5, 2, 9),
	(76, 7, 16, 5, 3, 9),
	(77, 7, 16, 5, 4, 9),
	(78, 7, 16, 5, 5, 9),
	(79, 7, 16, 5, 6, 9),
	(80, 7, 16, 5, 7, 9),
	(81, 7, 16, 5, 8, 9),
	(82, 7, 16, 5, 9, 9),
	(83, 7, 16, 5, 10, 9),
	(84, 8, 24, 5, 3, 9),
	(85, 8, 24, 5, 4, 9),
	(86, 8, 24, 5, 5, 9),
	(87, 8, 24, 5, 6, 9),
	(88, 8, 24, 5, 7, 9),
	(89, 8, 24, 6, 3, 9),
	(90, 8, 24, 6, 4, 9),
	(91, 8, 24, 6, 5, 9),
	(92, 8, 24, 6, 6, 9),
	(93, 8, 24, 6, 7, 9),
	(94, 3, 30, 5, 1, 6),
	(95, 3, 30, 5, 2, 6),
	(96, 3, 30, 5, 3, 6),
	(97, 3, 30, 5, 4, 6),
	(98, 3, 30, 5, 5, 6),
	(99, 3, 30, 5, 6, 6),
	(100, 3, 30, 5, 7, 6),
	(101, 3, 30, 5, 8, 6),
	(102, 3, 30, 5, 9, 6),
	(103, 3, 30, 5, 10, 6),
	(104, 3, 30, 5, 10, 6),
	(105, 3, 30, 6, 1, 6),
	(106, 3, 30, 6, 2, 6),
	(107, 3, 30, 6, 3, 6),
	(108, 3, 30, 6, 4, 6),
	(109, 3, 30, 6, 5, 6),
	(110, 3, 30, 6, 6, 6),
	(111, 3, 30, 6, 7, 6),
	(112, 3, 30, 6, 8, 6),
	(113, 3, 30, 6, 9, 6);
/*!40000 ALTER TABLE `articulo_ropa` ENABLE KEYS */;

-- Volcando estructura para tabla tienda_ropa.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `codigo_cliente` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `dni` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tienda_ropa.cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla tienda_ropa.empleado
CREATE TABLE IF NOT EXISTS `empleado` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `dni` varchar(9) NOT NULL,
  `movil` varchar(10) NOT NULL,
  `es_encargado` tinyint(1) NOT NULL,
  `id_tienda` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_empleado` (`id_tienda`),
  CONSTRAINT `fk_empleado` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tienda_ropa.empleado: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
REPLACE INTO `empleado` (`id`, `nombre`, `apellidos`, `dni`, `movil`, `es_encargado`, `id_tienda`) VALUES
	(1, 'Juan ', 'López Gárcia', '45333245A', '666582784', 1, NULL),
	(2, 'Natalia', 'Ramos Castro', '11233424F', '638857421', 0, NULL),
	(3, 'Elena ', 'Ramirez Sanz', '43264214K', '622554879', 1, NULL),
	(4, 'Francisco ', 'Guisado Sánchez', '12412456M', '655287412', 0, NULL),
	(5, 'Sara', 'Conejero Martín', '32424119P', '633258487', 0, NULL);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;

-- Volcando estructura para tabla tienda_ropa.marca_ropa
CREATE TABLE IF NOT EXISTS `marca_ropa` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(150) NOT NULL,
  `url_logo` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tienda_ropa.marca_ropa: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `marca_ropa` DISABLE KEYS */;
REPLACE INTO `marca_ropa` (`id`, `descripcion`, `url_logo`) VALUES
	(1, 'ZARA', 'https://www.zara.com/es/'),
	(2, 'TEZENIS', 'https://www.tezenis.com/es/'),
	(3, 'MAYORAL', 'https://www.mayoral.com/es/espana'),
	(4, 'GOCCO', 'https://www.gocco.es/'),
	(5, 'DECATHLON', 'https://www.decathlon.es/es/'),
	(6, 'PULL&BEAR', 'https://www.pull&bear.es/es/'),
	(7, 'ALVARO MORENO', 'https://www.alvaromoreno.com/es/'),
	(8, 'MASSIMO DUTTI', 'https://www.massimodutti.com/es'),
	(9, 'LEFTIES', 'https://www.lefties.com/'),
	(10, 'BABYPLANET', 'https://www.babyplanet.com/es/');
/*!40000 ALTER TABLE `marca_ropa` ENABLE KEYS */;

-- Volcando estructura para tabla tienda_ropa.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `identificador` varchar(20) NOT NULL,
  `id_cliente` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_cliente_fk` (`id_cliente`),
  CONSTRAINT `pedido_cliente_fk` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tienda_ropa.pedido: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Volcando estructura para tabla tienda_ropa.pedido_detalle
CREATE TABLE IF NOT EXISTS `pedido_detalle` (
  `id_pedido` int(10) NOT NULL,
  `id_stock_articulo` int(10) NOT NULL,
  KEY `pedido_detalle_fk1` (`id_pedido`),
  KEY `pedido_detalle_fk2` (`id_stock_articulo`),
  CONSTRAINT `pedido_detalle_fk1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`),
  CONSTRAINT `pedido_detalle_fk2` FOREIGN KEY (`id_stock_articulo`) REFERENCES `stock_articulo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tienda_ropa.pedido_detalle: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_detalle` ENABLE KEYS */;

-- Volcando estructura para tabla tienda_ropa.stock_articulo
CREATE TABLE IF NOT EXISTS `stock_articulo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cantidad` int(10) NOT NULL,
  `precio` float NOT NULL,
  `id_tienda` int(10) NOT NULL,
  `id_articulo_ropa` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stockarticulo` (`id_tienda`),
  KEY `stock_articulo_fk` (`id_articulo_ropa`),
  CONSTRAINT `fk_stockarticulo` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id`),
  CONSTRAINT `stock_articulo_fk` FOREIGN KEY (`id_articulo_ropa`) REFERENCES `articulo_ropa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tienda_ropa.stock_articulo: ~65 rows (aproximadamente)
/*!40000 ALTER TABLE `stock_articulo` DISABLE KEYS */;
REPLACE INTO `stock_articulo` (`id`, `cantidad`, `precio`, `id_tienda`, `id_articulo_ropa`) VALUES
	(1, 1, 4.5, 1, 3),
	(2, 1, 4.5, 1, 4),
	(3, 1, 4.5, 1, 5),
	(4, 1, 7, 1, 13),
	(5, 1, 7, 1, 14),
	(6, 1, 7, 1, 31),
	(7, 1, 7, 1, 32),
	(8, 1, 30, 1, 89),
	(9, 1, 30, 1, 92),
	(10, 1, 38, 1, 104),
	(11, 1, 38, 1, 109),
	(12, 1, 38, 1, 113),
	(13, 1, 4.25, 2, 4),
	(14, 1, 6.75, 2, 31),
	(15, 1, 36, 2, 104),
	(16, 1, 7, 3, 21),
	(17, 1, 7, 3, 22),
	(18, 1, 7, 3, 23),
	(19, 1, 32, 3, 38),
	(20, 1, 32, 3, 40),
	(21, 1, 32, 3, 41),
	(22, 1, 32, 3, 42),
	(23, 1, 12, 7, 27),
	(24, 1, 12, 7, 28),
	(25, 1, 12, 7, 29),
	(26, 1, 12, 7, 30),
	(27, 1, 12, 7, 31),
	(28, 1, 12, 7, 32),
	(29, 1, 12, 7, 33),
	(30, 1, 12, 7, 34),
	(31, 1, 12, 7, 35),
	(32, 1, 4.5, 20, 4),
	(33, 1, 4.5, 20, 5),
	(34, 1, 28, 20, 87),
	(35, 1, 28, 20, 88),
	(36, 1, 28, 20, 89),
	(37, 1, 28, 20, 90),
	(38, 1, 35, 20, 101),
	(39, 1, 35, 20, 103),
	(40, 1, 35, 20, 105),
	(41, 1, 35, 20, 106),
	(42, 1, 35, 20, 109),
	(43, 1, 35, 20, 110),
	(44, 1, 35, 20, 112),
	(45, 1, 12, 32, 28),
	(46, 1, 12, 32, 29),
	(47, 1, 12, 32, 30),
	(48, 1, 12, 32, 31),
	(49, 1, 20, 26, 61),
	(50, 1, 20, 26, 62),
	(51, 1, 20, 26, 63),
	(52, 1, 20, 26, 64),
	(53, 1, 20, 26, 65),
	(54, 1, 3.5, 10, 1),
	(55, 1, 4, 10, 2),
	(56, 1, 20, 6, 75),
	(57, 1, 20, 6, 76),
	(58, 1, 20, 6, 77),
	(59, 1, 20, 6, 79),
	(60, 1, 20, 6, 80),
	(61, 1, 20, 28, 78),
	(62, 1, 3.5, 10, 70),
	(63, 1, 4, 10, 71),
	(64, 1, 4, 10, 72),
	(65, 1, 4, 10, 73);
/*!40000 ALTER TABLE `stock_articulo` ENABLE KEYS */;

-- Volcando estructura para tabla tienda_ropa.talla
CREATE TABLE IF NOT EXISTS `talla` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(150) NOT NULL,
  `ancho_cuello` double NOT NULL,
  `ancho_torso` double NOT NULL,
  `ancho_cintura` double NOT NULL,
  `largo_manga` double NOT NULL,
  `largo_cuello_cintura` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123454 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tienda_ropa.talla: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `talla` DISABLE KEYS */;
REPLACE INTO `talla` (`id`, `descripcion`, `ancho_cuello`, `ancho_torso`, `ancho_cintura`, `largo_manga`, `largo_cuello_cintura`) VALUES
	(1, 'XXS', 4, 5, 6, 7, 8),
	(2, 'XS', 4.4, 5.4, 6.4, 7.4, 8.4),
	(3, 'XXS', 3.5, 4.5, 5.5, 6.5, 7.5),
	(4, 'S', 7, 6, 7, 8, 9),
	(5, 'M', 8, 6, 7, 8, 9),
	(6, 'L', 9, 7, 8, 9, 10),
	(7, 'XL', 10.5, 8, 9, 10.8, 6.7),
	(8, 'XXL', 11, 8.5, 7.8, 8.9, 9.7),
	(9, 'XXXL', 12, 14.5, 6, 7, 8),
	(10, 'XXXXL', 13, 3.8, 6, 5.6, 11),
	(11, 'A medida', 0, 0, 0, 0, 0),
	(12, '5-6', 2, 2, 2, 2, 2),
	(13, '7-8', 2.2, 2.2, 2.2, 2.2, 2.2),
	(14, '9-10', 2.5, 2.5, 2.5, 2.5, 2.5),
	(15, '11-12', 3, 3, 3, 3, 3),
	(16, '0-2', 1.2, 1.2, 1.2, 1.2, 1.2),
	(17, '3-4', 1.5, 1.5, 1.5, 1.5, 1.5);
/*!40000 ALTER TABLE `talla` ENABLE KEYS */;

-- Volcando estructura para tabla tienda_ropa.tienda
CREATE TABLE IF NOT EXISTS `tienda` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(150) NOT NULL,
  `codigo_postal` int(10) NOT NULL,
  `ciudad` varchar(150) NOT NULL,
  `id_marca` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tienda` (`id_marca`),
  CONSTRAINT `fk_tienda` FOREIGN KEY (`id_marca`) REFERENCES `marca_ropa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tienda_ropa.tienda: ~20 rows (aproximadamente)
/*!40000 ALTER TABLE `tienda` DISABLE KEYS */;
REPLACE INTO `tienda` (`id`, `direccion`, `codigo_postal`, `ciudad`, `id_marca`) VALUES
	(1, 'Avenida Reina Mercedes 3', 41012, 'Sevilla', 1),
	(2, 'Avenida Ramón y Cajal 15', 41003, 'Sevilla', 2),
	(3, 'Avenida Ramón y Cajal 7', 41003, 'Sevilla', 3),
	(4, 'Avenida Reina Mercedes 36', 41012, 'Sevilla', 4),
	(5, 'Avenida Cruz del Campo S/N', 41014, 'Sevilla', 5),
	(6, 'Avenida Cruz del Campo S/N', 41014, 'Sevilla', 6),
	(7, 'Avenida Sol 4', 42068, 'Córdoba', 7),
	(8, 'Avenida San Jacinto 6', 43870, 'Jaén', 8),
	(9, 'Avenida Solares S/N', 40090, 'Granada', 9),
	(10, 'Avenida Crestería 15', 40988, 'Huelva', 10),
	(20, 'calle maria auxiliadora', 41003, 'sevilla', 1),
	(22, 'calle juan pablo', 14002, 'cordoba', 2),
	(24, 'calle juana', 41003, 'sevilla', 5),
	(26, 'calle lola', 55203, 'huelva', 9),
	(28, 'calle fresas', 58263, 'sevilla', 6),
	(30, 'calle hamburguesa', 45843, 'Granada', 4),
	(32, 'calle papas', 2576, 'Malaga', 7),
	(34, 'calle pizza', 287469, 'almeria', 10),
	(36, 'calle silla', 24595, 'sevilla', 9),
	(38, 'calle sillon', 2284, 'cordoba', 8);
/*!40000 ALTER TABLE `tienda` ENABLE KEYS */;

-- Volcando estructura para tabla tienda_ropa.tipo
CREATE TABLE IF NOT EXISTS `tipo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tienda_ropa.tipo: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
REPLACE INTO `tipo` (`id`, `descripcion`) VALUES
	(1, 'Infantil'),
	(2, 'Juvenil'),
	(3, 'Adolescente'),
	(4, 'Moda Joven'),
	(5, 'Hombre'),
	(6, 'Mujer'),
	(7, 'Embarazo'),
	(8, 'Trajes'),
	(9, 'Trajes a Medida'),
	(10, 'Vestidos de Novia');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;

-- Volcando estructura para tabla tienda_ropa.tipo_talla
CREATE TABLE IF NOT EXISTS `tipo_talla` (
  `id_tipo` int(10) NOT NULL,
  `id_talla` int(10) NOT NULL,
  KEY `fk_tipotalla` (`id_tipo`),
  KEY `fk2_tipotalla` (`id_talla`),
  CONSTRAINT `fk2_tipotalla` FOREIGN KEY (`id_talla`) REFERENCES `talla` (`id`),
  CONSTRAINT `fk_tipotalla` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tienda_ropa.tipo_talla: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_talla` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_talla` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;