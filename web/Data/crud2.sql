-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-06-2020 a las 19:45:20
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crud2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `department`
--

CREATE TABLE `department` (
  `ID_DEP` int(11) NOT NULL,
  `NAME_DEP` varchar(50) DEFAULT NULL,
  `COMPANY_CODE_DEP` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `department`
--

INSERT INTO `department` (`ID_DEP`, `NAME_DEP`, `COMPANY_CODE_DEP`) VALUES
(1, 'SISTEMAS', 'SIS01'),
(2, 'CONTABILIDAD', 'CONT01'),
(3, 'FINANZAS', 'FIN01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `ID_EM` int(11) NOT NULL,
  `ID_LAN` int(11) DEFAULT NULL,
  `NAME_EM` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `employee`
--

INSERT INTO `employee` (`ID_EM`, `ID_LAN`, `NAME_EM`) VALUES
(1, 2, 'CHARLIE'),
(2, 1, 'PAOLA'),
(3, 2, 'FABIAN'),
(4, 1, 'VERONICA'),
(5, 2, 'JULIO'),
(6, 1, 'MARY'),
(7, 1, 'KARLA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employye_department`
--

CREATE TABLE `employye_department` (
  `ID_EM_DEP` int(11) NOT NULL,
  `ID_EM` int(11) DEFAULT NULL,
  `ID_DEP` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `employye_department`
--

INSERT INTO `employye_department` (`ID_EM_DEP`, `ID_EM`, `ID_DEP`) VALUES
(18, 1, 1),
(19, 2, 1),
(20, 3, 2),
(22, 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `language`
--

CREATE TABLE `language` (
  `ID_LAN` int(11) NOT NULL,
  `NAME_LAN` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `language`
--

INSERT INTO `language` (`ID_LAN`, `NAME_LAN`) VALUES
(1, 'ESPAÑOL'),
(2, 'INGLES');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`ID_DEP`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ID_EM`),
  ADD KEY `fk_3` (`ID_LAN`);

--
-- Indices de la tabla `employye_department`
--
ALTER TABLE `employye_department`
  ADD PRIMARY KEY (`ID_EM_DEP`),
  ADD KEY `fk_1` (`ID_EM`),
  ADD KEY `fk_2` (`ID_DEP`);

--
-- Indices de la tabla `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`ID_LAN`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `department`
--
ALTER TABLE `department`
  MODIFY `ID_DEP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `employee`
--
ALTER TABLE `employee`
  MODIFY `ID_EM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `employye_department`
--
ALTER TABLE `employye_department`
  MODIFY `ID_EM_DEP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `language`
--
ALTER TABLE `language`
  MODIFY `ID_LAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_3` FOREIGN KEY (`ID_LAN`) REFERENCES `language` (`ID_LAN`);

--
-- Filtros para la tabla `employye_department`
--
ALTER TABLE `employye_department`
  ADD CONSTRAINT `fk_1` FOREIGN KEY (`ID_EM`) REFERENCES `employee` (`ID_EM`),
  ADD CONSTRAINT `fk_2` FOREIGN KEY (`ID_DEP`) REFERENCES `department` (`ID_DEP`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
