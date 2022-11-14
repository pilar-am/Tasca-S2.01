-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2022 a las 15:36:06
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
-- Base de datos: `youtube`
--
CREATE DATABASE youtube
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canal`
--

CREATE TABLE `canal` (
  `id_canal` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `descripcio` varchar(50) NOT NULL,
  `data_creacio` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_usuari` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `canal`
--

INSERT INTO `canal` (`id_canal`, `nom`, `descripcio`, `data_creacio`, `id_usuari`) VALUES
(1, 'canal 1', 'descripcio canal 1', '2022-11-13 12:00:11', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentari`
--

CREATE TABLE `comentari` (
  `id_comentari` int(11) NOT NULL,
  `text` varchar(150) NOT NULL,
  `data_comentari` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_usuari` int(11) NOT NULL,
  `id_video` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentari_agrada`
--

CREATE TABLE `comentari_agrada` (
  `id_agrada` int(11) NOT NULL,
  `id_usuari` int(11) NOT NULL,
  `id_comentari` int(11) NOT NULL,
  `data_creacio` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentari_no_agrada`
--

CREATE TABLE `comentari_no_agrada` (
  `id_no_agrada` int(11) NOT NULL,
  `id_usuari` int(11) NOT NULL,
  `id_comentari` int(11) NOT NULL,
  `data_creacio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenedor_etiquetas`
--

CREATE TABLE `contenedor_etiquetas` (
  `id_contenedor` int(11) NOT NULL,
  `id_video` int(11) NOT NULL,
  `id_etiqueta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contenedor_etiquetas`
--

INSERT INTO `contenedor_etiquetas` (`id_contenedor`, `id_video`, `id_etiqueta`) VALUES
(1, 1, 1),
(2, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiqueta`
--

CREATE TABLE `etiqueta` (
  `id_etiqueta` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `etiqueta`
--

INSERT INTO `etiqueta` (`id_etiqueta`, `nom`) VALUES
(1, 'cocina'),
(2, 'medi ambient'),
(3, 'videojocs');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlist`
--

CREATE TABLE `playlist` (
  `id_playlist` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `data_creacio` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estat` enum('publica','privada') NOT NULL,
  `id_usuari` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `playlist`
--

INSERT INTO `playlist` (`id_playlist`, `nom`, `data_creacio`, `estat`, `id_usuari`) VALUES
(1, 'playlist 1', '2022-11-13 11:59:45', 'privada', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuari`
--

CREATE TABLE `usuari` (
  `id_usuari` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `data_naixement` date NOT NULL,
  `sexe` enum('H','M') NOT NULL,
  `pais` varchar(50) NOT NULL,
  `CP` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuari`
--

INSERT INTO `usuari` (`id_usuari`, `nom`, `email`, `password`, `data_naixement`, `sexe`, `pais`, `CP`) VALUES
(1, 'pilar', 'pilar@gmail.com', '1234', '2002-04-01', 'H', 'Argentina', 45678),
(2, 'Fernando', 'fer@gmail.com', '1234', '1997-10-16', 'H', 'Holanda', 3345678),
(3, 'Anna', 'ana@gmail.com', '1234', '2005-11-19', 'M', 'Espanya', 7060);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuari_canal`
--

CREATE TABLE `usuari_canal` (
  `id_usuari_canal` int(11) NOT NULL,
  `id_usuari` int(11) NOT NULL,
  `id_canal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuari_canal`
--

INSERT INTO `usuari_canal` (`id_usuari_canal`, `id_usuari`, `id_canal`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video`
--

CREATE TABLE `video` (
  `id_video` int(11) NOT NULL,
  `titol` varchar(50) NOT NULL,
  `descripcio` varchar(50) NOT NULL,
  `grandaria` double NOT NULL,
  `nom` varchar(50) NOT NULL,
  `durada` double NOT NULL,
  `reproduccions` int(11) NOT NULL,
  `thumbnail` varchar(50) NOT NULL,
  `id_usuari` int(11) NOT NULL,
  `estat` enum('public','ocult','privat') NOT NULL,
  `data_creacio` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `video`
--

INSERT INTO `video` (`id_video`, `titol`, `descripcio`, `grandaria`, `nom`, `durada`, `reproduccions`, `thumbnail`, `id_usuari`, `estat`, `data_creacio`) VALUES
(1, 'Video 1', 'Primer video de prueba', 345, 'Video_1', 3, 5, 'https://img.freepik.com/vector-premium/video-produ', 1, 'public', '2022-11-13 12:17:45'),
(2, 'Video 2', 'video 2 de prueba', 567, 'Video_2', 2, 10, 'https://previews.123rf.com/images/butenkow/butenko', 1, 'public', '2022-11-13 12:17:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video_usuari_dislikes`
--

CREATE TABLE `video_usuari_dislikes` (
  `id_video_usuari_dislikes` int(11) NOT NULL,
  `id_usuari` int(11) NOT NULL,
  `id_video` int(11) NOT NULL,
  `data_dislike` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `video_usuari_dislikes`
--

INSERT INTO `video_usuari_dislikes` (`id_video_usuari_dislikes`, `id_usuari`, `id_video`, `data_dislike`) VALUES
(1, 1, 1, '2022-11-13 12:49:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video_usuari_likes`
--

CREATE TABLE `video_usuari_likes` (
  `id_video_usuari_likes` int(11) NOT NULL,
  `id_video` int(11) NOT NULL,
  `id_usuari` int(11) NOT NULL,
  `data_like` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `video_usuari_likes`
--

INSERT INTO `video_usuari_likes` (`id_video_usuari_likes`, `id_video`, `id_usuari`, `data_like`) VALUES
(1, 2, 1, '2022-11-13 12:49:28');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `canal`
--
ALTER TABLE `canal`
  ADD PRIMARY KEY (`id_canal`),
  ADD KEY `id_usuari` (`id_usuari`);

--
-- Indices de la tabla `comentari`
--
ALTER TABLE `comentari`
  ADD PRIMARY KEY (`id_comentari`),
  ADD KEY `id_usuari` (`id_usuari`),
  ADD KEY `id_video` (`id_video`);

--
-- Indices de la tabla `comentari_agrada`
--
ALTER TABLE `comentari_agrada`
  ADD PRIMARY KEY (`id_agrada`),
  ADD KEY `id_comentari` (`id_comentari`),
  ADD KEY `id_usuari` (`id_usuari`);

--
-- Indices de la tabla `comentari_no_agrada`
--
ALTER TABLE `comentari_no_agrada`
  ADD KEY `id_comentari` (`id_comentari`),
  ADD KEY `id_usuari` (`id_usuari`);

--
-- Indices de la tabla `contenedor_etiquetas`
--
ALTER TABLE `contenedor_etiquetas`
  ADD PRIMARY KEY (`id_contenedor`),
  ADD KEY `id_video` (`id_video`),
  ADD KEY `id_etiqueta` (`id_etiqueta`);

--
-- Indices de la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  ADD PRIMARY KEY (`id_etiqueta`);

--
-- Indices de la tabla `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id_playlist`),
  ADD KEY `id_usuari` (`id_usuari`);

--
-- Indices de la tabla `usuari`
--
ALTER TABLE `usuari`
  ADD PRIMARY KEY (`id_usuari`);

--
-- Indices de la tabla `usuari_canal`
--
ALTER TABLE `usuari_canal`
  ADD PRIMARY KEY (`id_usuari_canal`),
  ADD KEY `id_usuari` (`id_usuari`),
  ADD KEY `id_canal` (`id_canal`);

--
-- Indices de la tabla `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id_video`),
  ADD KEY `id_usuari` (`id_usuari`);

--
-- Indices de la tabla `video_usuari_dislikes`
--
ALTER TABLE `video_usuari_dislikes`
  ADD PRIMARY KEY (`id_video_usuari_dislikes`),
  ADD KEY `id_usuari` (`id_usuari`),
  ADD KEY `id_video` (`id_video`);

--
-- Indices de la tabla `video_usuari_likes`
--
ALTER TABLE `video_usuari_likes`
  ADD PRIMARY KEY (`id_video_usuari_likes`),
  ADD KEY `id_video` (`id_video`),
  ADD KEY `id_usuari` (`id_usuari`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `canal`
--
ALTER TABLE `canal`
  MODIFY `id_canal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `comentari`
--
ALTER TABLE `comentari`
  MODIFY `id_comentari` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentari_agrada`
--
ALTER TABLE `comentari_agrada`
  MODIFY `id_agrada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contenedor_etiquetas`
--
ALTER TABLE `contenedor_etiquetas`
  MODIFY `id_contenedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  MODIFY `id_etiqueta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id_playlist` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuari`
--
ALTER TABLE `usuari`
  MODIFY `id_usuari` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuari_canal`
--
ALTER TABLE `usuari_canal`
  MODIFY `id_usuari_canal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `video`
--
ALTER TABLE `video`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `video_usuari_dislikes`
--
ALTER TABLE `video_usuari_dislikes`
  MODIFY `id_video_usuari_dislikes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `video_usuari_likes`
--
ALTER TABLE `video_usuari_likes`
  MODIFY `id_video_usuari_likes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `canal`
--
ALTER TABLE `canal`
  ADD CONSTRAINT `canal_ibfk_1` FOREIGN KEY (`id_usuari`) REFERENCES `usuari` (`id_usuari`);

--
-- Filtros para la tabla `comentari`
--
ALTER TABLE `comentari`
  ADD CONSTRAINT `comentari_ibfk_1` FOREIGN KEY (`id_usuari`) REFERENCES `usuari` (`id_usuari`),
  ADD CONSTRAINT `comentari_ibfk_2` FOREIGN KEY (`id_video`) REFERENCES `video` (`id_video`);

--
-- Filtros para la tabla `comentari_agrada`
--
ALTER TABLE `comentari_agrada`
  ADD CONSTRAINT `comentari_agrada_ibfk_1` FOREIGN KEY (`id_comentari`) REFERENCES `comentari` (`id_comentari`),
  ADD CONSTRAINT `comentari_agrada_ibfk_2` FOREIGN KEY (`id_usuari`) REFERENCES `usuari` (`id_usuari`);

--
-- Filtros para la tabla `comentari_no_agrada`
--
ALTER TABLE `comentari_no_agrada`
  ADD CONSTRAINT `comentari_no_agrada_ibfk_1` FOREIGN KEY (`id_comentari`) REFERENCES `comentari` (`id_comentari`),
  ADD CONSTRAINT `comentari_no_agrada_ibfk_2` FOREIGN KEY (`id_usuari`) REFERENCES `usuari` (`id_usuari`);

--
-- Filtros para la tabla `contenedor_etiquetas`
--
ALTER TABLE `contenedor_etiquetas`
  ADD CONSTRAINT `contenedor_etiquetas_ibfk_1` FOREIGN KEY (`id_video`) REFERENCES `video` (`id_video`),
  ADD CONSTRAINT `contenedor_etiquetas_ibfk_2` FOREIGN KEY (`id_etiqueta`) REFERENCES `etiqueta` (`id_etiqueta`);

--
-- Filtros para la tabla `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`id_usuari`) REFERENCES `usuari` (`id_usuari`);

--
-- Filtros para la tabla `usuari_canal`
--
ALTER TABLE `usuari_canal`
  ADD CONSTRAINT `usuari_canal_ibfk_1` FOREIGN KEY (`id_usuari`) REFERENCES `usuari` (`id_usuari`),
  ADD CONSTRAINT `usuari_canal_ibfk_2` FOREIGN KEY (`id_canal`) REFERENCES `canal` (`id_canal`);

--
-- Filtros para la tabla `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `video_ibfk_1` FOREIGN KEY (`id_usuari`) REFERENCES `usuari` (`id_usuari`);

--
-- Filtros para la tabla `video_usuari_dislikes`
--
ALTER TABLE `video_usuari_dislikes`
  ADD CONSTRAINT `video_usuari_dislikes_ibfk_1` FOREIGN KEY (`id_usuari`) REFERENCES `usuari` (`id_usuari`),
  ADD CONSTRAINT `video_usuari_dislikes_ibfk_2` FOREIGN KEY (`id_video`) REFERENCES `video` (`id_video`);

--
-- Filtros para la tabla `video_usuari_likes`
--
ALTER TABLE `video_usuari_likes`
  ADD CONSTRAINT `video_usuari_likes_ibfk_1` FOREIGN KEY (`id_video`) REFERENCES `video` (`id_video`),
  ADD CONSTRAINT `video_usuari_likes_ibfk_2` FOREIGN KEY (`id_usuari`) REFERENCES `usuari` (`id_usuari`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
