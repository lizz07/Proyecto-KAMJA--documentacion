-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2023 at 06:52 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kamjac`
--

-- --------------------------------------------------------

--
-- Table structure for table `accesorio`
--

CREATE TABLE `accesorio` (
  `Id_accesorio` int(11) NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `tipo_de_accesorio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accesorio`
--

INSERT INTO `accesorio` (`Id_accesorio`, `nombre`, `precio`, `tipo_de_accesorio`) VALUES
(2, 'cilindros', 80000, 'cilindros y telescopio'),
(3, 'platos', 100000, 'platos y platinas'),
(4, 'platos', 9000, 'ruedas');

-- --------------------------------------------------------

--
-- Table structure for table `accesorio_mueble`
--

CREATE TABLE `accesorio_mueble` (
  `Id_accesorio_mueble` int(11) NOT NULL,
  `idaccesorio` int(11) DEFAULT NULL,
  `idmueble` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accesorio_mueble`
--

INSERT INTO `accesorio_mueble` (`Id_accesorio_mueble`, `idaccesorio`, `idmueble`) VALUES
(3, 3, 1),
(4, 3, 2),
(5, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `Id_categoria` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`Id_categoria`, `nombre`) VALUES
(1, 'oficina'),
(2, 'hogar'),
(3, 'escolar');

-- --------------------------------------------------------

--
-- Table structure for table `cotizacion`
--

CREATE TABLE `cotizacion` (
  `id` int(11) NOT NULL,
  `fecha_cotizacion` date DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `total_cotizacion` decimal(10,0) DEFAULT NULL,
  `estado` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cotizacion`
--

INSERT INTO `cotizacion` (`id`, `fecha_cotizacion`, `idusuario`, `total_cotizacion`, `estado`) VALUES
(1, '1998-05-12', 1, 100, 'cancelado'),
(2, '2021-12-26', 2, 200000, 'en proceso'),
(3, '2022-07-30', 3, 500000, 'en proceso'),
(4, '2020-01-07', 4, 100000, 'en proceso'),
(5, '2022-05-19', 4, 100000, 'en proceso'),
(15, '1997-05-11', 1, 25000, 'en proceso');

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `Id_material` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`Id_material`, `nombre`) VALUES
(1, 'madera'),
(2, ',metal'),
(3, 'plastico'),
(4, 'polietileno');

-- --------------------------------------------------------

--
-- Table structure for table `mueble`
--

CREATE TABLE `mueble` (
  `Id_mueble` int(11) NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `idcategoria` int(11) DEFAULT NULL,
  `medidas` decimal(10,0) DEFAULT NULL,
  `color` varchar(15) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mueble`
--

INSERT INTO `mueble` (`Id_mueble`, `nombre`, `idcategoria`, `medidas`, `color`, `precio`) VALUES
(1, 'baru', 1, 2, 'azul', 50000),
(2, 'zeus', 2, 2, 'verde', 20000),
(3, 'niquel', 3, 2, 'naranja', 10000),
(4, 'menta', 2, 75, 'amarillo', 154000),
(5, 'menta', 2, 75, 'amarillo', 154000),
(6, 'Roble', 1, 120, 'Verde', 235000),
(7, 'Ferer', 2, 150, 'Rojo', 237000);

-- --------------------------------------------------------

--
-- Table structure for table `mueble_cotizacion`
--

CREATE TABLE `mueble_cotizacion` (
  `Id_mueble_cotizacion` int(11) NOT NULL,
  `idcotizacion` int(11) DEFAULT NULL,
  `idmueble` int(11) DEFAULT NULL,
  `cantidad` decimal(10,0) DEFAULT NULL,
  `precio_unitario` decimal(10,0) DEFAULT NULL,
  `total_contizacion` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mueble_cotizacion`
--

INSERT INTO `mueble_cotizacion` (`Id_mueble_cotizacion`, `idcotizacion`, `idmueble`, `cantidad`, `precio_unitario`, `total_contizacion`) VALUES
(1, 1, 2, 5, 15000, 50000),
(2, 2, 1, 10, 140000, 150000),
(3, 3, 2, 20, 522000, 1100000),
(4, 4, 3, 4, 10000, 40000),
(5, 5, 2, 1, 50000, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `mueble_material`
--

CREATE TABLE `mueble_material` (
  `Id_mueble_material` int(11) NOT NULL,
  `idmueble` int(11) DEFAULT NULL,
  `idmaterial` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mueble_material`
--

INSERT INTO `mueble_material` (`Id_mueble_material`, `idmueble`, `idmaterial`) VALUES
(1, 1, 3),
(2, 1, 2),
(3, 2, 3),
(4, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `Id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`Id_rol`, `nombre_rol`) VALUES
(1, 'Administrador'),
(2, 'Empleados'),
(3, 'clientes');

-- --------------------------------------------------------

--
-- Table structure for table `rol_usuario`
--

CREATE TABLE `rol_usuario` (
  `Id_rol_usuario` int(11) NOT NULL,
  `idrol` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rol_usuario`
--

INSERT INTO `rol_usuario` (`Id_rol_usuario`, `idrol`, `idusuario`, `estado`) VALUES
(1, 1, 1, 'activo'),
(2, 2, 2, 'activo'),
(3, 2, 3, 'activo'),
(4, 3, 4, 'activo'),
(5, 2, 5, 'activo');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `Id_usuario` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `contraseña` int(11) DEFAULT NULL,
  `correo_e` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`Id_usuario`, `nombre`, `apellido`, `contraseña`, `correo_e`) VALUES
(1, 'anyi', 'mera', 10516932, 'anguiemera@gmail.com'),
(2, 'lizz', 'mera', 10545657, 'lizzmera@hotmail.com'),
(3, 'maria', 'perez', 10547808, 'lizzmera@hotmail.com'),
(4, 'maria', 'mera', 34532270, 'lizzmera@hotmail.com'),
(5, 'lizz', 'perez', 76307332, 'lizzmera@hotmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accesorio`
--
ALTER TABLE `accesorio`
  ADD PRIMARY KEY (`Id_accesorio`);

--
-- Indexes for table `accesorio_mueble`
--
ALTER TABLE `accesorio_mueble`
  ADD PRIMARY KEY (`Id_accesorio_mueble`),
  ADD KEY `idaccesorio` (`idaccesorio`),
  ADD KEY `idmueble` (`idmueble`);

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Id_categoria`);

--
-- Indexes for table `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`Id_material`);

--
-- Indexes for table `mueble`
--
ALTER TABLE `mueble`
  ADD PRIMARY KEY (`Id_mueble`),
  ADD KEY `idcategoria` (`idcategoria`);

--
-- Indexes for table `mueble_cotizacion`
--
ALTER TABLE `mueble_cotizacion`
  ADD PRIMARY KEY (`Id_mueble_cotizacion`),
  ADD KEY `idmueble` (`idmueble`),
  ADD KEY `idcotizacion` (`idcotizacion`);

--
-- Indexes for table `mueble_material`
--
ALTER TABLE `mueble_material`
  ADD PRIMARY KEY (`Id_mueble_material`),
  ADD KEY `idmueble` (`idmueble`),
  ADD KEY `idmaterial` (`idmaterial`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Id_rol`);

--
-- Indexes for table `rol_usuario`
--
ALTER TABLE `rol_usuario`
  ADD PRIMARY KEY (`Id_rol_usuario`),
  ADD KEY `idrol` (`idrol`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accesorio`
--
ALTER TABLE `accesorio`
  MODIFY `Id_accesorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `accesorio_mueble`
--
ALTER TABLE `accesorio_mueble`
  MODIFY `Id_accesorio_mueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cotizacion`
--
ALTER TABLE `cotizacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `mueble`
--
ALTER TABLE `mueble`
  MODIFY `Id_mueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mueble_material`
--
ALTER TABLE `mueble_material`
  MODIFY `Id_mueble_material` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accesorio_mueble`
--
ALTER TABLE `accesorio_mueble`
  ADD CONSTRAINT `accesorio_mueble_ibfk_1` FOREIGN KEY (`idmueble`) REFERENCES `mueble` (`Id_mueble`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `accesorio_mueble_ibfk_2` FOREIGN KEY (`idaccesorio`) REFERENCES `accesorio` (`Id_accesorio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD CONSTRAINT `cotizacion_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`Id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mueble`
--
ALTER TABLE `mueble`
  ADD CONSTRAINT `mueble_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`Id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mueble_cotizacion`
--
ALTER TABLE `mueble_cotizacion`
  ADD CONSTRAINT `mueble_cotizacion_ibfk_5` FOREIGN KEY (`idmueble`) REFERENCES `mueble` (`Id_mueble`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mueble_cotizacion_ibfk_6` FOREIGN KEY (`idcotizacion`) REFERENCES `cotizacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mueble_material`
--
ALTER TABLE `mueble_material`
  ADD CONSTRAINT `mueble_material_ibfk_3` FOREIGN KEY (`idmueble`) REFERENCES `mueble` (`Id_mueble`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mueble_material_ibfk_4` FOREIGN KEY (`idmaterial`) REFERENCES `material` (`Id_material`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rol_usuario`
--
ALTER TABLE `rol_usuario`
  ADD CONSTRAINT `rol_usuario_ibfk_1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`Id_rol`),
  ADD CONSTRAINT `rol_usuario_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`Id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`contraseña`) REFERENCES `tipo_de_documento` (`Id_documento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
