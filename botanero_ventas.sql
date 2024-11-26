-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2024 a las 03:06:09
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `qqbodint_maletas`
--
CREATE DATABASE IF NOT EXISTS `qqbodint_maletas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `qqbodint_maletas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipo` enum('Encomienda','Correo/En Linea') NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES
(8, 'Encomienda', 'SHEIN', NULL),
(9, 'Encomienda', 'TEMU', NULL),
(10, 'Correo/En Linea', 'SHEIN', NULL),
(11, 'Correo/En Linea', 'TEMU', NULL),
(12, 'Encomienda', 'NORMAL', NULL),
(13, 'Correo/En Linea', 'NORMAL', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion_negocio`
--

CREATE TABLE `informacion_negocio` (
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `numeroMesas` tinyint(4) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `informacion_negocio`
--

INSERT INTO `informacion_negocio` (`nombre`, `telefono`, `numeroMesas`, `logo`) VALUES
('Maletas', '5555555', 52, './fotos/6743b068ad502.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE `insumos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  `tipo` enum('Encomienda','Correo/En Linea') NOT NULL,
  `categoria` bigint(20) UNSIGNED DEFAULT NULL,
  `atendio` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `insumos`
--

INSERT INTO `insumos` (`id`, `codigo`, `nombre`, `descripcion`, `precio`, `tipo`, `categoria`, `atendio`) VALUES
(9, '789', 'fhjgfj', 'fghjfgj', '0.00', 'Encomienda', 12, 'Abner'),
(10, '34543', 'asdfasdf', 'asdfasdf', '0.00', 'Correo/En Linea', 13, 'Abner'),
(11, '6565', 'CHepe', 'asdfñlkjasdf\nas\ndf\nasdf\nasdfa\nsdf\nas\ndf\nasdf\nasd\nf\nasdf\nas\ndf\nasdfalksdjfñlajsd f\nasdf\nasd f\nasd\nfa\nsdf', '0.00', 'Encomienda', 12, 'Fran Vielman');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos_venta`
--

CREATE TABLE `insumos_venta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idInsumo` bigint(20) UNSIGNED NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `idVenta` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `insumos_venta`
--

INSERT INTO `insumos_venta` (`id`, `idInsumo`, `precio`, `cantidad`, `idVenta`) VALUES
(1, 5, '0.00', 1, 1),
(2, 5, '0.00', 0, 2),
(3, 5, '0.00', 0, 3),
(4, 5, '0.00', 1, 4),
(5, 5, '0.00', 1, 5),
(6, 5, '0.00', 1, 6),
(7, 5, '0.00', 1, 7),
(8, 5, '0.00', 1, 8),
(9, 5, '1.00', 1, 8),
(10, 5, '1.00', 7, 9),
(11, 5, '1.00', 1, 9),
(12, 5, '1.00', 1, 9),
(13, 5, '0.00', 1, 10),
(14, 5, '0.00', 3, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `correo` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `correo`, `nombre`, `telefono`, `password`) VALUES
(1, 'prueba@gmail.com', 'Abner', '555555', '$2y$10$2.LS7Vxaa8DfAHr.F4J/r.ZGY4VVke.CcoE8AoOM0zg9K3kueyVG6'),
(2, 'edwinvelasquez@gmail.com', 'Edwin Velasquez', '78883251', '$2y$10$tGPCd8ralDyd7xusWPRpa.Sggwvwr9qfn29n9aVyOY6azBlbQOWp2'),
(3, 'jaelvelasquez@gmail.com', 'Jael de Velasquez', '1111111', '$2y$10$tGPCd8ralDyd7xusWPRpa.Sggwvwr9qfn29n9aVyOY6azBlbQOWp2'),
(4, 'montenegro@gmail.com', 'Kevin Montenegro', '111111', '$2y$10$tGPCd8ralDyd7xusWPRpa.Sggwvwr9qfn29n9aVyOY6azBlbQOWp2'),
(5, 'heydi@gmail.com', 'Heydi Navarro', '234234', '$2y$10$tGPCd8ralDyd7xusWPRpa.Sggwvwr9qfn29n9aVyOY6azBlbQOWp2'),
(6, 'carolina@gmail.com', 'Carolina', '454', '$2y$10$tGPCd8ralDyd7xusWPRpa.Sggwvwr9qfn29n9aVyOY6azBlbQOWp2'),
(7, 'diego@gmail.com', 'Diego Campos', '121212', '$2y$10$tGPCd8ralDyd7xusWPRpa.Sggwvwr9qfn29n9aVyOY6azBlbQOWp2'),
(8, 'dani@gmail.com', 'Daniela', '123123', '$2y$10$tGPCd8ralDyd7xusWPRpa.Sggwvwr9qfn29n9aVyOY6azBlbQOWp2'),
(9, 'juan@gmail.com', 'Juan Alvarez', '564645', '$2y$10$tGPCd8ralDyd7xusWPRpa.Sggwvwr9qfn29n9aVyOY6azBlbQOWp2'),
(10, 'carla@gmail.com', 'Carla Alvarez', '54545', '$2y$10$tGPCd8ralDyd7xusWPRpa.Sggwvwr9qfn29n9aVyOY6azBlbQOWp2'),
(11, 'brenda@gmail.com', 'Brenda Morales', '45445', '$2y$10$tGPCd8ralDyd7xusWPRpa.Sggwvwr9qfn29n9aVyOY6azBlbQOWp2'),
(12, 'kevinamaya@gmail.com', 'Kevin Amaya', '545', '$2y$10$tGPCd8ralDyd7xusWPRpa.Sggwvwr9qfn29n9aVyOY6azBlbQOWp2'),
(13, 'francisco@gmail.com', 'Panchy', '234234', '$2y$10$tGPCd8ralDyd7xusWPRpa.Sggwvwr9qfn29n9aVyOY6azBlbQOWp2'),
(14, 'willsmith@gmail.com', 'Will Smith', '2134234', '$2y$10$tGPCd8ralDyd7xusWPRpa.Sggwvwr9qfn29n9aVyOY6azBlbQOWp2'),
(16, 'fran@gmail.com', 'Fran Vielman', '132123', '$2y$10$tGPCd8ralDyd7xusWPRpa.Sggwvwr9qfn29n9aVyOY6azBlbQOWp2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idMesa` tinyint(4) NOT NULL,
  `cliente` varchar(100) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `total` decimal(6,2) NOT NULL,
  `pagado` decimal(6,2) NOT NULL,
  `idUsuario` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `insumos_venta`
--
ALTER TABLE `insumos_venta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `insumos_venta`
--
ALTER TABLE `insumos_venta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
