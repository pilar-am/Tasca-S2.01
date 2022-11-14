-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-11-2022 a las 11:35:31
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
-- Base de datos: `pizzeria`
--
CREATE DATABASE pizzeria
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `begudes`
--

CREATE TABLE `begudes` (
  `id_beguda` smallint(10) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `descripcio` varchar(150) NOT NULL,
  `imatge` varchar(50) NOT NULL,
  `preu` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `botiga`
--

CREATE TABLE `botiga` (
  `id_botiga` smallint(10) NOT NULL,
  `carrer` varchar(50) NOT NULL,
  `CP` smallint(10) NOT NULL,
  `id_localitat` smallint(10) NOT NULL,
  `id_prov` smallint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` smallint(6) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id_client` smallint(6) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `cognoms` varchar(50) NOT NULL,
  `carrer` varchar(50) NOT NULL,
  `CP` smallint(10) NOT NULL,
  `telefon` smallint(10) NOT NULL,
  `id_localitat` smallint(6) NOT NULL,
  `id_prov` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comanda`
--

CREATE TABLE `comanda` (
  `id_comanda` smallint(10) NOT NULL,
  `data_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `preu_total` decimal(10,0) NOT NULL,
  `id_client` smallint(10) NOT NULL,
  `id_botiga` smallint(10) NOT NULL,
  `rec_botiga` tinyint(1) NOT NULL,
  `rec_domicili` tinyint(1) NOT NULL,
  `quant_prod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conte_begudes`
--

CREATE TABLE `conte_begudes` (
  `id_conte` smallint(10) NOT NULL,
  `id_comanda` smallint(10) NOT NULL,
  `id_beguda` smallint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conte_hamburgueses`
--

CREATE TABLE `conte_hamburgueses` (
  `id_conte` smallint(10) NOT NULL,
  `id_comanda` smallint(10) NOT NULL,
  `id_hamburguesa` smallint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conte_pizzes`
--

CREATE TABLE `conte_pizzes` (
  `id_conte` smallint(10) NOT NULL,
  `id_comanda` smallint(10) NOT NULL,
  `id_pizza` smallint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicili`
--

CREATE TABLE `domicili` (
  `id_domicili` smallint(10) NOT NULL,
  `id_comanda` smallint(10) NOT NULL,
  `NIF_empleat` varchar(50) NOT NULL,
  `data_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleat`
--

CREATE TABLE `empleat` (
  `NIF` varchar(50) NOT NULL,
  `nom` int(11) NOT NULL,
  `cognom` int(11) NOT NULL,
  `telefon` int(11) NOT NULL,
  `id_botiga` smallint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hamburgueses`
--

CREATE TABLE `hamburgueses` (
  `id_hamburgueses` smallint(10) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `descripcio` varchar(150) NOT NULL,
  `imatge` varchar(50) NOT NULL,
  `preu` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localitat`
--

CREATE TABLE `localitat` (
  `id_localitat` smallint(6) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `id_prov` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pizzes`
--

CREATE TABLE `pizzes` (
  `id_pizza` smallint(10) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `descripcio` varchar(150) NOT NULL,
  `imatge` varchar(50) NOT NULL,
  `preu` decimal(10,0) NOT NULL,
  `id_categoria` smallint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id_prov` smallint(6) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `begudes`
--
ALTER TABLE `begudes`
  ADD PRIMARY KEY (`id_beguda`);

--
-- Indices de la tabla `botiga`
--
ALTER TABLE `botiga`
  ADD PRIMARY KEY (`id_botiga`),
  ADD KEY `id_localitat` (`id_localitat`),
  ADD KEY `id_prov` (`id_prov`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `id_prov` (`id_prov`),
  ADD KEY `id_localitat` (`id_localitat`);

--
-- Indices de la tabla `comanda`
--
ALTER TABLE `comanda`
  ADD PRIMARY KEY (`id_comanda`),
  ADD KEY `id_botiga` (`id_botiga`),
  ADD KEY `id_client` (`id_client`);

--
-- Indices de la tabla `conte_begudes`
--
ALTER TABLE `conte_begudes`
  ADD KEY `id_comanda` (`id_comanda`),
  ADD KEY `id_beguda` (`id_beguda`);

--
-- Indices de la tabla `conte_hamburgueses`
--
ALTER TABLE `conte_hamburgueses`
  ADD KEY `id_comanda` (`id_comanda`),
  ADD KEY `id_hamburguesa` (`id_hamburguesa`);

--
-- Indices de la tabla `conte_pizzes`
--
ALTER TABLE `conte_pizzes`
  ADD PRIMARY KEY (`id_conte`),
  ADD KEY `id_comanda` (`id_comanda`),
  ADD KEY `id_pizza` (`id_pizza`);

--
-- Indices de la tabla `domicili`
--
ALTER TABLE `domicili`
  ADD PRIMARY KEY (`id_domicili`),
  ADD KEY `id_comanda` (`id_comanda`),
  ADD KEY `NIF_empleat` (`NIF_empleat`);

--
-- Indices de la tabla `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`NIF`),
  ADD KEY `id_botiga` (`id_botiga`);

--
-- Indices de la tabla `hamburgueses`
--
ALTER TABLE `hamburgueses`
  ADD PRIMARY KEY (`id_hamburgueses`);

--
-- Indices de la tabla `localitat`
--
ALTER TABLE `localitat`
  ADD PRIMARY KEY (`id_localitat`),
  ADD KEY `id_prov` (`id_prov`);

--
-- Indices de la tabla `pizzes`
--
ALTER TABLE `pizzes`
  ADD PRIMARY KEY (`id_pizza`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id_prov`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `begudes`
--
ALTER TABLE `begudes`
  MODIFY `id_beguda` smallint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `botiga`
--
ALTER TABLE `botiga`
  MODIFY `id_botiga` smallint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id_client` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comanda`
--
ALTER TABLE `comanda`
  MODIFY `id_comanda` smallint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `conte_pizzes`
--
ALTER TABLE `conte_pizzes`
  MODIFY `id_conte` smallint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `domicili`
--
ALTER TABLE `domicili`
  MODIFY `id_domicili` smallint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hamburgueses`
--
ALTER TABLE `hamburgueses`
  MODIFY `id_hamburgueses` smallint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `localitat`
--
ALTER TABLE `localitat`
  MODIFY `id_localitat` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pizzes`
--
ALTER TABLE `pizzes`
  MODIFY `id_pizza` smallint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id_prov` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `botiga`
--
ALTER TABLE `botiga`
  ADD CONSTRAINT `botiga_ibfk_1` FOREIGN KEY (`id_localitat`) REFERENCES `localitat` (`id_localitat`),
  ADD CONSTRAINT `botiga_ibfk_2` FOREIGN KEY (`id_prov`) REFERENCES `provincia` (`id_prov`);

--
-- Filtros para la tabla `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`id_prov`) REFERENCES `provincia` (`id_prov`),
  ADD CONSTRAINT `client_ibfk_2` FOREIGN KEY (`id_localitat`) REFERENCES `localitat` (`id_localitat`);

--
-- Filtros para la tabla `comanda`
--
ALTER TABLE `comanda`
  ADD CONSTRAINT `comanda_ibfk_1` FOREIGN KEY (`id_botiga`) REFERENCES `botiga` (`id_botiga`),
  ADD CONSTRAINT `comanda_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Filtros para la tabla `conte_begudes`
--
ALTER TABLE `conte_begudes`
  ADD CONSTRAINT `conte_begudes_ibfk_1` FOREIGN KEY (`id_comanda`) REFERENCES `comanda` (`id_comanda`),
  ADD CONSTRAINT `conte_begudes_ibfk_2` FOREIGN KEY (`id_beguda`) REFERENCES `begudes` (`id_beguda`);

--
-- Filtros para la tabla `conte_hamburgueses`
--
ALTER TABLE `conte_hamburgueses`
  ADD CONSTRAINT `conte_hamburgueses_ibfk_1` FOREIGN KEY (`id_comanda`) REFERENCES `comanda` (`id_comanda`),
  ADD CONSTRAINT `conte_hamburgueses_ibfk_2` FOREIGN KEY (`id_hamburguesa`) REFERENCES `hamburgueses` (`id_hamburgueses`);

--
-- Filtros para la tabla `conte_pizzes`
--
ALTER TABLE `conte_pizzes`
  ADD CONSTRAINT `conte_pizzes_ibfk_1` FOREIGN KEY (`id_comanda`) REFERENCES `comanda` (`id_comanda`),
  ADD CONSTRAINT `conte_pizzes_ibfk_2` FOREIGN KEY (`id_pizza`) REFERENCES `pizzes` (`id_pizza`);

--
-- Filtros para la tabla `domicili`
--
ALTER TABLE `domicili`
  ADD CONSTRAINT `domicili_ibfk_1` FOREIGN KEY (`id_comanda`) REFERENCES `comanda` (`id_comanda`),
  ADD CONSTRAINT `domicili_ibfk_2` FOREIGN KEY (`NIF_empleat`) REFERENCES `empleat` (`NIF`);

--
-- Filtros para la tabla `empleat`
--
ALTER TABLE `empleat`
  ADD CONSTRAINT `empleat_ibfk_1` FOREIGN KEY (`id_botiga`) REFERENCES `botiga` (`id_botiga`);

--
-- Filtros para la tabla `localitat`
--
ALTER TABLE `localitat`
  ADD CONSTRAINT `localitat_ibfk_1` FOREIGN KEY (`id_prov`) REFERENCES `provincia` (`id_prov`);

--
-- Filtros para la tabla `pizzes`
--
ALTER TABLE `pizzes`
  ADD CONSTRAINT `pizzes_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
