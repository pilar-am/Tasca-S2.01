-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2022 a las 09:32:45
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `optica`
--
CREATE DATABASE optica
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id_client` smallint(6) NOT NULL,
  `carrer` varchar(50) NOT NULL,
  `CP` int(10) NOT NULL,
  `ciutat` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefon` int(10) NOT NULL,
  `id_empleat` smallint(10) NOT NULL,
  `recom_client` varchar(50) NOT NULL,
  `data_registre` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id_client`, `carrer`, `CP`, `ciutat`, `pais`, `email`, `telefon`, `id_empleat`, `recom_client`, `data_registre`, `nom`) VALUES
(1, 'C/Abat Odó, 3', 8030, 'Barcelona', 'Espanya', 'pepito@gmail.com', 404505066, 1, '', '2022-11-09 17:55:17', 'pepito'),
(2, 'c/Monges, 23', 8003, 'Lleida', 'Espanya', 'desi@gmail.com', 66622222, 1, 'Pepito', '2022-11-09 17:55:26', 'Desiré');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleat`
--

CREATE TABLE `empleat` (
  `id_empleat` smallint(10) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleat`
--

INSERT INTO `empleat` (`id_empleat`, `nom`) VALUES
(1, 'Adrià'),
(2, 'Fernando'),
(3, 'Felipe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` smallint(10) NOT NULL,
  `data_factura` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_client` smallint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `data_factura`, `id_client`) VALUES
(1, '2022-11-09 17:46:47', 1),
(2, '2022-11-09 17:47:06', 2),
(3, '2022-11-09 17:47:12', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidors`
--

CREATE TABLE `proveidors` (
  `NIF` varchar(10) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `carrer` varchar(50) NOT NULL,
  `CP` int(10) NOT NULL,
  `ciutat` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `fax` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveidors`
--

INSERT INTO `proveidors` (`NIF`, `nom`, `carrer`, `CP`, `ciutat`, `pais`, `fax`) VALUES
('30440586O', 'Ana Benítez', 'C/ La Jota, 7', 54550, 'Zaragoza', 'Espanya', 0),
('34558690A', 'Fernando Fernández', 'P/Catalunya, 5', 5006, 'Barcelona', 'Espanya', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipus_muntura`
--

CREATE TABLE `tipus_muntura` (
  `id_tipus` smallint(6) NOT NULL,
  `tipus` varchar(50) NOT NULL,
  `id_ulleres` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipus_muntura`
--

INSERT INTO `tipus_muntura` (`id_tipus`, `tipus`, `id_ulleres`) VALUES
(1, 'metalica', 2),
(2, 'pasta', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id_ulleres` smallint(6) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `graduac_vid_izq` decimal(10,0) NOT NULL,
  `graduac_vid_der` decimal(10,0) NOT NULL,
  `color_muntura` varchar(50) NOT NULL,
  `color_vid_izq` varchar(50) NOT NULL,
  `color_vid_der` varchar(50) NOT NULL,
  `NIF_proveidor` varchar(10) NOT NULL,
  `preu` decimal(10,0) NOT NULL,
  `id_empleat` smallint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ulleres`
--

INSERT INTO `ulleres` (`id_ulleres`, `marca`, `graduac_vid_izq`, `graduac_vid_der`, `color_muntura`, `color_vid_izq`, `color_vid_der`, `NIF_proveidor`, `preu`, `id_empleat`) VALUES
(2, 'Rayban', '3', '4', 'Verd', 'Verd', 'Verd', '30440586O', '200', 1),
(4, 'Optica2000', '2', '3', 'Vermella', 'Verd', 'Verd', '34558690A', '120', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `id_ulleres` smallint(10) NOT NULL,
  `id_client` smallint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `id_empleat` (`id_empleat`);

--
-- Indices de la tabla `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`id_empleat`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_client` (`id_client`);

--
-- Indices de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  ADD PRIMARY KEY (`NIF`);

--
-- Indices de la tabla `tipus_muntura`
--
ALTER TABLE `tipus_muntura`
  ADD PRIMARY KEY (`id_tipus`),
  ADD KEY `id_ulleres` (`id_ulleres`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ulleres`),
  ADD KEY `NIF_proveidor` (`NIF_proveidor`),
  ADD KEY `id_empleat` (`id_empleat`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_ulleres` (`id_ulleres`),
  ADD KEY `id_client` (`id_client`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleat`
--
ALTER TABLE `empleat`
  MODIFY `id_empleat` smallint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` smallint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipus_muntura`
--
ALTER TABLE `tipus_muntura`
  MODIFY `id_tipus` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id_ulleres` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`id_empleat`) REFERENCES `empleat` (`id_empleat`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`);

--
-- Filtros para la tabla `tipus_muntura`
--
ALTER TABLE `tipus_muntura`
  ADD CONSTRAINT `tipus_muntura_ibfk_1` FOREIGN KEY (`id_ulleres`) REFERENCES `ulleres` (`id_ulleres`);

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`NIF_proveidor`) REFERENCES `proveidors` (`NIF`),
  ADD CONSTRAINT `ulleres_ibfk_2` FOREIGN KEY (`id_empleat`) REFERENCES `empleat` (`id_empleat`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_ulleres`) REFERENCES `ulleres` (`id_ulleres`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
