-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 09, 2024 at 03:40 PM
-- Server version: 10.6.12-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `enrollFun`
--

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('361e1e22cf4b');

-- --------------------------------------------------------

--
-- Table structure for table `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int(11) NOT NULL,
  `nombre_completo` varchar(45) DEFAULT NULL,
  `dni` int(11) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `celular` varchar(11) DEFAULT NULL,
  `celular_alt` varchar(11) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alumnos_cursos`
--

CREATE TABLE `alumnos_cursos` (
  `alumno_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aulas`
--

CREATE TABLE `aulas` (
  `id` int(11) NOT NULL,
  `cant_ideal` int(11) DEFAULT NULL,
  `cant_max` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `representacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aulas`
--

INSERT INTO `aulas` (`id`, `cant_ideal`, `cant_max`, `nombre`, `representacion`) VALUES
(1, 18, 21, 'GREEN', '#94d375'),
(2, 21, 30, 'BIG ROOM', '#9f9ccc'),
(3, 15, 18, 'ORANGE', '#da8f54'),
(4, 18, 21, 'YELLOW', '#f0e858'),
(5, 14, 16, 'OFFICE ROOM', '#DFEEEF'),
(6, 12, 15, 'PINK ', '#dc9696');

-- --------------------------------------------------------

--
-- Table structure for table `cursos`
--

CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
  `nivel_id` int(11) DEFAULT NULL,
  `aula_id` int(11) DEFAULT NULL,
  `inscripcion_id` int(11) DEFAULT NULL,
  `creador_id` int(11) DEFAULT NULL,
  `max_alumnos` int(11) DEFAULT NULL,
  `representacion` varchar(255) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `estado_inscripcion_id` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cursos`
--

INSERT INTO `cursos` (`id`, `nivel_id`, `aula_id`, `inscripcion_id`, `creador_id`, `max_alumnos`, `representacion`, `nombre`, `estado_inscripcion_id`, `descripcion`, `created_at`) VALUES
(1, 1, 2, NULL, NULL, 20, '#DFEEEF', ' ADULTOS  1 A PRINCIPIANTES', NULL, 'INGLÉS PARA ADULTOS PRINCIPIANTES A PARTIR DE LOS 15 AÑOS', '2023-07-10 00:28:58'),
(2, 1, 2, NULL, NULL, 21, '#DFEEEF', ' ADULTOS 1 B PRINCIPIANTES', NULL, 'INGLÉS PARA ADULTOS PRINCIPIANTES A PARTIR DE LOS 15 AÑOS ', '2023-07-10 09:18:01'),
(3, 2, 3, NULL, NULL, 18, '#DFEEEF', 'ADULTOS 2  A', NULL, 'ADULTOS QUE YA HICIERON EL NIVEL 1 O QUE SU TEST DE NIVELACION INDICÓ ESTE NIVEL ', '2023-12-08 21:18:43'),
(4, 2, 2, NULL, NULL, 21, '#DFEEEF', 'ADULTOS 2  B', NULL, 'ALUMNOS QUE YA HICIERON EL NIVEL 1 O QUE SU TEST DE NIVELACIÓN DIO NIVEL 2', '2023-12-08 21:23:14'),
(5, 3, 3, NULL, NULL, 18, '#DFEEEF', 'ADULTOS 3 A', NULL, 'ALUMNOS QUE YA HICIEREON EL NIVEL 2 O QUE SU TEST DE NIVELACIÓN DIO NIVEL 3', '2023-12-08 21:26:12'),
(6, 3, 3, NULL, NULL, 18, '#DFEEEF', 'ADULTOS 3 B', NULL, 'ALUMNOS QUE YA HICIERON EL NIVEL 2 O QUE SU TEST DE NIVELACIÓN DIO NIVEL 3', '2023-12-08 21:28:33'),
(7, 3, 4, NULL, NULL, 21, '#DFEEEF', 'ADULTOS 3 C', NULL, 'ALUMNOS QUE YA HICIERON EL NIVEL 2 O QUE SU TEST DE NIVELACIÓN DIO NIVEL 3', '2023-12-08 21:31:07'),
(8, 4, 1, NULL, NULL, 21, '#DFEEEF', 'ADUTOS 4', NULL, 'ALUMNOS QUE YA HICIERON EL NIVEL 3 O QUE SU TEST DE NIVELACIÓN DIO NIVEL 4', '2023-12-08 21:32:54'),
(9, 6, 3, NULL, NULL, 18, '#DFEEEF', 'KINDER 1', NULL, 'PEQUEÑOS DE 4 Y 5 AÑOS QUE SE ENCUENTRAN EN SALA DE 4 Y/O 5 EN LA ESCUELA', '2023-12-08 21:36:11'),
(10, 7, 3, NULL, NULL, 18, '#DFEEEF', 'KINDER 2', NULL, 'PEQUEÑOS DE 6 AÑOS O POR CUMPLIRLOS QUE SE ENCUENTRAN EN PRIMER GRADO DE LA ESCUELA PRIMARIA', '2023-12-08 21:38:02'),
(11, 8, 2, NULL, NULL, 22, '#DFEEEF', 'CHILDREN 1 A', NULL, 'NINOS/AS PRINCIPIANTES DE 7, 8 O 9 AÑOS ', '2023-12-08 21:40:31'),
(12, 8, 2, NULL, NULL, 22, '#DFEEEF', 'CHILDREN 1 B', NULL, 'NIÑOS/AS PRINCIPIANTES DE 7,8, o  9 AÑOS', '2023-12-08 21:45:05'),
(13, NULL, 2, NULL, NULL, 22, '#DFEEEF', 'CHILDREN 1 C', NULL, 'NIÑOS/AS  PRINCIPIANTES DE 7,8 o 9 AÑOS ', '2023-12-08 21:47:19'),
(14, 1, 2, NULL, NULL, 20, '#DFEEEF', 'ADULTOS PRINCIPIANTES SUPER ACELERADOS', NULL, 'ADULTOS PRINCIPIANTES QUE DESEAN HACER EL NIVEL 1 Y 2 EN UN MISMO AÑO CON  LA MODALIDAD SUPER ACELERADA DE 4 HS SEMANALES ', '2023-12-08 21:50:31'),
(15, 9, 1, NULL, NULL, 21, '#DFEEEF', 'CHILDREN 2 A', NULL, 'NIÑOS/AS   QUE YA CURSARON EL NIVEL 1 O QUE EL TEST DE NIIVELACIÓN DIO NIVEL 1 DE CHILDREN', '2023-12-08 21:55:30'),
(16, 9, 1, NULL, NULL, 21, '#DFEEEF', 'CHILDREN 2 B ', NULL, 'NIÑOS/AS QUE YA CURSARON EL NIVEL 1 O QUE EL TEST DE NIVELACIÓN DIO NIVEL 2 DE CHILDREN', '2023-12-08 21:57:54'),
(17, 9, 4, NULL, NULL, 21, '#DFEEEF', 'CHILDREN 2 C', NULL, 'NIÑOS/AS QUE YA CUERSARON EL NIVEL 1 O QUE EL TEST DE NIVELACIÓN DIO NIVEL 2 DE CHILDREN', '2023-12-08 22:00:53'),
(18, 9, 4, NULL, NULL, 21, '#DFEEEF', 'CHILDREN 2 D', NULL, 'NIÑOS/AS QUE YA CURSARON EL NIVEL 1 O QUE EL TEST DE NIVELACIÓN DIO NIVEL 2 DE CHILDREN', '2023-12-08 22:04:48'),
(19, 10, 3, NULL, NULL, 21, '#DFEEEF', 'CHILDREN 3 A ', NULL, 'NIÑOS/AS QUE YA HICIERON EL NIVEL 2 O QUE EL TEST DE NIVELACIÓN DIO NIVEL 3 DE CHILDREN', '2023-12-08 22:07:33'),
(20, 10, 1, NULL, NULL, 21, '#DFEEEF', 'CHILDREN 3 B ', NULL, 'NIÑOS /AS QUE YA HICIERON EL NIVEL 2 O QUE EL TEST DE NIVELACIÓN DIO NIVEL 3 DE CHILDREN', '2023-12-08 22:10:31'),
(21, 10, 5, NULL, NULL, 16, '#DFEEEF', 'CHILDREN 3 C', NULL, 'NIÑOS/AS QUE YA HICIERON EL NIVEL 2 O QUE EL TEST DE NIVELACIÓN DIO NIVEL 3 DE CHILDREN', '2023-12-08 22:12:52'),
(22, 11, 4, NULL, NULL, 21, '#DFEEEF', 'TEENS 1 A ', NULL, 'ALUMNOS DE 13 Y 14 AÑOS QE SON PRINCIPIANTES ', '2023-12-11 14:16:18'),
(23, 11, 1, NULL, NULL, 21, '#DFEEEF', 'TEENS 1 B', NULL, 'ALUMNOS PRINCIPIANTES DE 10 Y 11 AÑOS', '2023-12-11 14:19:37'),
(24, 11, 2, NULL, NULL, 22, '#DFEEEF', 'TEENS 1 C ', NULL, 'ALUMNOS PRINCIPIATES DE 11 Y 12 AÑOS', '2023-12-11 14:21:44'),
(25, 12, 3, NULL, NULL, 18, '#DFEEEF', 'TEENS 2 A ', NULL, 'ALUMNOS QUE EL AÑO ANTERIOR CURSARON EL TEENS 1/ CHILDREN 3 O QUE RINDIERON EL TEST DE NIVELACIÓN Y DIO NIVEL 2 DE TEENS.', '2023-12-11 14:31:47'),
(26, 12, 4, NULL, NULL, 21, '#DFEEEF', 'TEENS 2 B', NULL, 'ALUMNOS QUE EL AÑO ANTERIOR CURSARON EL TEENS 1 o  CHILDREN 3 o  QUE RINDIERON EL TEST DE NIVELACIÓN Y DIO NIVEL 2 DE TEENS.', '2023-12-11 14:34:06'),
(27, 12, 2, NULL, NULL, 21, '#DFEEEF', 'TEENS 2 C', NULL, 'ALUMNOS QUE EL AÑO ANTERIOR CURSARON EL TEENS 1o CHILDREN 3 o QUE RINDIERON EL TEST DE NIVELACIÓN Y DIO NIVEL 2 DE TEENS.', '2023-12-11 14:36:37'),
(28, 12, 3, NULL, NULL, 18, '#DFEEEF', 'TEENS 2 D', NULL, 'ALUMNOS QUE EL AÑO ANTERIOR CURSARON EL TEENS 1oCHILDREN 3 o QUE RINDIERON EL TEST DE NIVELACIÓN Y DIO NIVEL 2 DE TEENS.', '2023-12-11 14:42:56'),
(29, 13, 4, NULL, NULL, 21, '#DFEEEF', 'TEENS 3 A', NULL, 'ALUMNOS QUE EL AÑO ANTERIOR CURSARON EL TEENS 2 O QUE RINDIERON EL TEST DE NIVELACIÓN Y DIO NIVEL 3 DE TEENS.', '2023-12-11 14:46:00'),
(30, 13, 6, NULL, NULL, 12, '#DFEEEF', 'TEENS 3 B', NULL, 'ALUMNOS QUE EL AÑO ANTERIOR CURSARON EL TEENS 2 O QUE RINDIERON EL TEST DE NIVELACIÓN Y DIO NIVEL 3 DE TEENS.', '2023-12-11 14:46:49'),
(31, 12, 6, NULL, NULL, 12, '#DFEEEF', 'TEEENS 3 C', NULL, 'ALUMNOS QUE EL AÑO ANTERIOR CURSARON EL TEENS 2 O QUE RINDIERON EL TEST DE NIVELACIÓN Y DIO NIVEL 3 DE TEENS.', '2023-12-11 14:48:38'),
(32, 13, 4, NULL, NULL, 21, '#DFEEEF', 'TEENS 3 D', NULL, 'ALUMNOS QUE EL AÑO ANTERIOR CURSARON EL TEENS 2 O QUE RINDIERON EL TEST DE NIVELACIÓN Y DIO NIVEL 3 DE TEENS.', '2023-12-11 14:50:31'),
(33, 14, 6, NULL, NULL, 15, '#DFEEEF', 'TEENS 4 A', NULL, 'ALUMNOS QUE EL AÑO ANTERIOR CURSARON EL TEENS 3 O QUE RINDIERON EL TEST DE NIVELACIÓN Y DIO NIVEL 4 DE TEENS.', '2023-12-11 14:53:01'),
(34, 14, 1, NULL, NULL, 21, '#DFEEEF', 'TEENS 4', NULL, 'ALUMNOS QUE EL AÑO ANTERIOR CURSARON EL TEENS 3 O QUE RINDIERON EL TEST DE NIVELACIÓN Y DIO NIVEL 4 DE TEENS.', '2023-12-11 14:55:26'),
(35, 15, 5, NULL, NULL, 16, '#DFEEEF', 'TEENS 5', NULL, 'ALUMNOS QUE EL AÑO ANTERIOR CURSARON EL TEENS 4 O QUE RINDIERON EL TEST DE NIVELACIÓN Y DIO NIVEL 5 DE TEENS.', '2023-12-11 14:57:14'),
(36, 15, 6, NULL, NULL, 15, '#DFEEEF', 'TEENS 5 B', NULL, 'ALUMNOS QUE EL AÑO ANTERIOR CURSARON EL TEENS 4 O QUE RINDIERON EL TEST DE NIVELACIÓN Y DIO NIVEL 5 DE TEENS.', '2023-12-11 14:58:33'),
(37, 16, 6, NULL, NULL, 15, '#DFEEEF', 'TEENS 6', NULL, 'ALUMNOS QUE EL AÑO ANTERIOR CURSARON EL TEENS 5 O QUE RINDIERON EL TEST DE NIVELACIÓN Y DIO NIVEL 6 DE TEENS.', '2023-12-11 15:00:18'),
(38, 17, 5, NULL, NULL, 16, '#DFEEEF', 'FIRST CERTIFICATE IN ENGLISH', NULL, 'ALUMNOS QUE EL AÑO ANTERIOR CURSARON EL TEENS 6/ ADULTOS 4  O QUE TEIENDO UN NIVEL INTERMEDIO PLUS  SESEAN PREPARARSE PARA EL FCE.', '2023-12-11 15:03:10'),
(39, 5, 5, NULL, NULL, 12, '#DFEEEF', 'CONVERSATION A INTERM/ INTERM +', NULL, 'ALUMNOS QUE YA MANEJAN EL IDIOMA Y DESEAN ADQUIRIR MÁS FLUIDEZ ORAL Y AUDITIVA', '2023-12-11 15:05:43'),
(40, 5, 5, NULL, NULL, 12, '#DFEEEF', 'CONVERSATION B INTERM/+', NULL, 'ALUMNOS QUE YA MANEJAN EL IDIOMA PERO DESEAN ADQUIRIR MÁS FLUIDEZ ORAL Y AUDITIVA', '2023-12-11 15:09:20');

-- --------------------------------------------------------

--
-- Table structure for table `curso_horario`
--

CREATE TABLE `curso_horario` (
  `curso_id` int(11) NOT NULL,
  `horario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `curso_horario`
--

INSERT INTO `curso_horario` (`curso_id`, `horario_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 11),
(6, 12),
(7, 13),
(7, 14),
(8, 15),
(8, 16),
(9, 17),
(9, 18),
(10, 19),
(10, 20),
(11, 21),
(11, 22),
(12, 23),
(12, 24),
(13, 26),
(13, 27),
(14, 28),
(15, 29),
(15, 30),
(16, 31),
(16, 32),
(17, 33),
(17, 34),
(18, 35),
(18, 36),
(19, 37),
(19, 38),
(20, 39),
(20, 40),
(21, 41),
(21, 42),
(22, 43),
(22, 44),
(23, 45),
(23, 46),
(24, 47),
(24, 48),
(25, 49),
(25, 50),
(26, 51),
(26, 52),
(27, 53),
(27, 54),
(28, 55),
(28, 56),
(29, 57),
(30, 58),
(30, 59),
(31, 60),
(31, 61),
(32, 62),
(32, 63),
(33, 64),
(33, 65),
(34, 66),
(34, 67),
(35, 68),
(35, 69),
(36, 70),
(37, 72),
(37, 73),
(38, 74),
(38, 75),
(39, 76),
(39, 77),
(40, 78);

-- --------------------------------------------------------

--
-- Table structure for table `curso_profesor`
--

CREATE TABLE `curso_profesor` (
  `curso_id` int(11) NOT NULL,
  `usuario_profesor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estados_inscripcion`
--

CREATE TABLE `estados_inscripcion` (
  `id` int(11) NOT NULL,
  `titulo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `horarios`
--

CREATE TABLE `horarios` (
  `id` int(11) NOT NULL,
  `diaSemana` varchar(45) DEFAULT NULL,
  `horaInicio` varchar(50) DEFAULT NULL,
  `horaFin` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `horarios`
--

INSERT INTO `horarios` (`id`, `diaSemana`, `horaInicio`, `horaFin`) VALUES
(1, 'Martes', '14:30', '16:00'),
(2, 'Jueves', '14:30', '16:00'),
(3, 'Lunes', '21:00', '22:30'),
(4, 'Miercoles', '21:00', '22:30'),
(5, 'Martes', '14:30', '16:00'),
(6, 'Jueves', '14:30', '16:00'),
(7, 'Martes', '21:00', '22:30'),
(8, 'Jueves', '21:00', '22:30'),
(9, 'Lunes', '14:30', '16:00'),
(10, 'Miercoles', '14:30', '16:00'),
(11, 'Lunes', '21:00', '22:30'),
(12, 'Miercoles', '21:00', '22:30'),
(13, 'Martes', '21:00', '22:30'),
(14, 'Jueves', '21:00', '22:30'),
(15, 'Martes', '21:00', '22:30'),
(16, 'Jueves', '21:00', '22:30'),
(17, 'Martes', '17:30', '18:30'),
(18, 'Jueves', '17:30', '18:30'),
(19, 'Martes', '18:30', '19:30'),
(20, 'Jueves', '19:30', '19:30'),
(21, 'Lunes', '16:00', '17:30'),
(22, 'Miercoles', '16:00', '17:30'),
(23, 'Lunes', '18:00', '19:30'),
(24, 'Miercoles', '18:00', '19:30'),
(25, 'Martes', '18:00', '19:30'),
(26, 'Martes', '18:00', '19:30'),
(27, 'Jueves', '18:00', '19:30'),
(28, 'Sabado', '09:00', '13:00'),
(29, 'Lunes', '16:00', '17:30'),
(30, 'Miercoles', '16:00', '17:30'),
(31, 'Lunes', '18:00', '19:30'),
(32, 'Miercoles', '18:00', '19:30'),
(33, 'Martes', '16:00', '17:30'),
(34, 'Jueves', '16:00', '17:30'),
(35, 'Martes', '18:00', '19:30'),
(36, 'Jueves', '18:00', '19:30'),
(37, 'Lunes', '18:00', '19:30'),
(38, 'Miercoles', '18:00', '19:30'),
(39, 'Martes', '16:00', '17:30'),
(40, 'Jueves', '16:00', '17:30'),
(41, 'Martes', '18:00', '19:30'),
(42, 'Jueves', '18:00', '19:30'),
(43, 'Lunes', '19:30', '21:00'),
(44, 'Miercoles', '19:30', '21:00'),
(45, 'Martes', '18:00', '19:30'),
(46, 'Jueves', '18:00', '19:30'),
(47, 'Martes', '19:30', '21:00'),
(48, 'Jueves', '19:30', '21:00'),
(49, 'Lunes', '16:00', '17:30'),
(50, 'Miercoles', '16:00', '19:30'),
(51, 'Lunes', '18:00', '19:30'),
(52, 'Miercoles', '18:00', '19:30'),
(53, 'Lunes', '19:30', '21:00'),
(54, 'Miercoles', '19:30', '21:00'),
(55, 'Martes', '16:00', '17:30'),
(56, 'Jueves', '16:00', '17:30'),
(57, 'Lunes', '16:00', '17:30'),
(58, 'Lunes', '19:30', '21:00'),
(59, 'Miercoles', '19:30', '21:00'),
(60, 'Martes', '18:00', '19:30'),
(61, 'Jueves', '18:00', '19:30'),
(62, 'Martes', '19:30', '21:00'),
(63, 'Jueves', '19:30', '21:00'),
(64, 'Lunes', '18:00', '19:30'),
(65, 'Miercoles', '18:00', '19:30'),
(66, 'Martes', '19:30', '21:00'),
(67, 'Jueves', '19:30', '21:00'),
(68, 'Lunes', '18:00', '19:30'),
(69, 'Miercoles', '18:00', '19:30'),
(70, 'Lunes', '19:30', '21:00'),
(71, 'Miercoles', '19:30', '21:00'),
(72, 'Martes', '19:30', '21:00'),
(73, 'Jueves', '19:30', '21:00'),
(74, 'Lunes', '19:30', '21:00'),
(75, 'Miercoles', '19:30', '21:00'),
(76, 'Lunes', '14:30', '16:00'),
(77, 'Miercoles', '14:30', '16:00'),
(78, 'Jueves', '19:30', '21:30');

-- --------------------------------------------------------

--
-- Table structure for table `inscripciones`
--

CREATE TABLE `inscripciones` (
  `id` int(11) NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lenguajes`
--

CREATE TABLE `lenguajes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lenguajes`
--

INSERT INTO `lenguajes` (`id`, `nombre`, `color`) VALUES
(1, 'Ingles', '#F7A4A4');

-- --------------------------------------------------------

--
-- Table structure for table `niveles`
--

CREATE TABLE `niveles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `programa` varchar(255) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `representacion` varchar(255) DEFAULT NULL,
  `lenguaje_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `niveles`
--

INSERT INTO `niveles` (`id`, `nombre`, `programa`, `material`, `representacion`, `lenguaje_id`) VALUES
(1, 'ADULTOS 1 (PRICIPIANTES)', '', NULL, '#DFEEEF', 1),
(2, 'ADULTOS 2', NULL, NULL, '#DFEEEF', 1),
(3, 'ADLTOS 3', NULL, NULL, '#DFEEEF', 1),
(4, 'ADULTOS 4 ', NULL, NULL, '#DFEEEF', 1),
(5, 'CONVERSACIÓN ', NULL, NULL, '#DFEEEF', 1),
(6, 'KINDER 1', NULL, NULL, '#da8f54', 1),
(7, 'KINDER 2', NULL, NULL, '#da8f54', 1),
(8, 'CHILDREN 1', NULL, NULL, '#9f9ccc', 1),
(9, 'CHILDREN 2', NULL, NULL, '#9f9ccc', 1),
(10, 'CHILDREN 3', NULL, NULL, '#9f9ccc', 1),
(11, 'TEENS 1', NULL, NULL, '#94d375', 1),
(12, 'TEENS 2', NULL, NULL, '#94d375', 1),
(13, 'TEENS 3', NULL, NULL, '#94d375', 1),
(14, 'TEENS 4', NULL, NULL, '#94d375', 1),
(15, 'TEENS 5', NULL, NULL, '#94d375', 1),
(16, 'TEENS 6', NULL, NULL, '#94d375', 1),
(17, 'FIRST CERTIFICATE IN ENGLISH ', NULL, NULL, '#dfeeef', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles_usuarios`
--

CREATE TABLE `roles_usuarios` (
  `usuario_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `external_id` varchar(255) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `_password` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_token` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `alumnos_cursos`
--
ALTER TABLE `alumnos_cursos`
  ADD PRIMARY KEY (`alumno_id`,`curso_id`),
  ADD KEY `curso_id` (`curso_id`);

--
-- Indexes for table `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aula_id` (`aula_id`),
  ADD KEY `creador_id` (`creador_id`),
  ADD KEY `estado_inscripcion_id` (`estado_inscripcion_id`),
  ADD KEY `inscripcion_id` (`inscripcion_id`),
  ADD KEY `nivel_id` (`nivel_id`);

--
-- Indexes for table `curso_horario`
--
ALTER TABLE `curso_horario`
  ADD PRIMARY KEY (`curso_id`,`horario_id`),
  ADD KEY `horario_id` (`horario_id`);

--
-- Indexes for table `curso_profesor`
--
ALTER TABLE `curso_profesor`
  ADD PRIMARY KEY (`curso_id`,`usuario_profesor_id`),
  ADD KEY `usuario_profesor_id` (`usuario_profesor_id`);

--
-- Indexes for table `estados_inscripcion`
--
ALTER TABLE `estados_inscripcion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estado_id` (`estado_id`);

--
-- Indexes for table `lenguajes`
--
ALTER TABLE `lenguajes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `niveles`
--
ALTER TABLE `niveles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lenguaje_id` (`lenguaje_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD PRIMARY KEY (`usuario_id`,`rol_id`),
  ADD KEY `rol_id` (`rol_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `external_id` (`external_id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aulas`
--
ALTER TABLE `aulas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `estados_inscripcion`
--
ALTER TABLE `estados_inscripcion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lenguajes`
--
ALTER TABLE `lenguajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `niveles`
--
ALTER TABLE `niveles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Constraints for table `alumnos_cursos`
--
ALTER TABLE `alumnos_cursos`
  ADD CONSTRAINT `alumnos_cursos_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `alumnos_cursos_ibfk_2` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`);

--
-- Constraints for table `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`aula_id`) REFERENCES `aulas` (`id`),
  ADD CONSTRAINT `cursos_ibfk_2` FOREIGN KEY (`creador_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `cursos_ibfk_3` FOREIGN KEY (`estado_inscripcion_id`) REFERENCES `estados_inscripcion` (`id`),
  ADD CONSTRAINT `cursos_ibfk_4` FOREIGN KEY (`inscripcion_id`) REFERENCES `inscripciones` (`id`),
  ADD CONSTRAINT `cursos_ibfk_5` FOREIGN KEY (`nivel_id`) REFERENCES `niveles` (`id`);

--
-- Constraints for table `curso_horario`
--
ALTER TABLE `curso_horario`
  ADD CONSTRAINT `curso_horario_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`),
  ADD CONSTRAINT `curso_horario_ibfk_2` FOREIGN KEY (`horario_id`) REFERENCES `horarios` (`id`);

--
-- Constraints for table `curso_profesor`
--
ALTER TABLE `curso_profesor`
  ADD CONSTRAINT `curso_profesor_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`),
  ADD CONSTRAINT `curso_profesor_ibfk_2` FOREIGN KEY (`usuario_profesor_id`) REFERENCES `usuarios` (`id`);

--
-- Constraints for table `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estados_inscripcion` (`id`);

--
-- Constraints for table `niveles`
--
ALTER TABLE `niveles`
  ADD CONSTRAINT `niveles_ibfk_1` FOREIGN KEY (`lenguaje_id`) REFERENCES `lenguajes` (`id`);

--
-- Constraints for table `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD CONSTRAINT `roles_usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `roles_usuarios_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
