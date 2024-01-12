-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 09, 2024 at 06:37 PM
-- Server version: 8.0.35-0ubuntu0.20.04.1
-- PHP Version: 7.4.3-4ubuntu2.19

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
CREATE DATABASE IF NOT EXISTS `enrollFun` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `enrollFun`;

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('b93b37ebfe49');

-- --------------------------------------------------------

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
CREATE TABLE `alumnos` (
  `id` int NOT NULL,
  `nombre_completo` varchar(45) NOT NULL,
  `dni` int NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `celular` varchar(11) NOT NULL,
  `celular_alt` varchar(11) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `usuario_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `alumnos`
--

INSERT INTO `alumnos` (`id`, `nombre_completo`, `dni`, `fecha_nacimiento`, `email`, `celular`, `celular_alt`, `observaciones`, `usuario_id`) VALUES
(2, 'LILIANA EDITH BARGI', 21400671, '1970-04-06', 'lebargi@hotmail.com', '3547665611', '3515108772', 'edad: 53, terminos aceptados: true', NULL),
(3, 'SERGIO RICARDO BONI', 22078453, '1971-03-25', 'boniser@yahoo.com.ar', '3515108772', '3547665611', 'edad: 52, terminos aceptados: true', NULL),
(4, 'Camila Martinez Bargi', 42441808, '2000-02-04', 'camila.bargi@mi.unc.edu.ar', '3517360868', '3517360868', 'edad: 23, terminos aceptados: true', NULL),
(5, 'Luciano Adrián Rodríguez ', 46228447, '2005-02-03', 'lucianoliendo2005@gmail.com', '3547540437', '3512136967', 'edad: 18, terminos aceptados: true', NULL),
(6, 'Cecilia Inés Bargi', 23536599, '1973-07-26', 'Cecibargi@gmail.com', '3547504922', '3547504922', 'edad: 49, terminos aceptados: true', NULL),
(7, 'Mauricio Alejandro Vélez ', 23062069, '1973-05-16', 'mauryosolosoy@gmail.com', '3547525276', '3547502663', 'edad: 50, terminos aceptados: true', NULL),
(8, 'Elías Santiago Ramirez ', 43203267, '2000-12-09', 'santiramirez22r@gmail.com', '3547318250', '3547532018', 'edad: 22, terminos aceptados: true', NULL),
(9, 'Gabriela Bonciolini ', 23536510, '1973-06-22', 'aot1966@yahoo.com.ar', '3547578502', '3547430824', 'edad: 50, terminos aceptados: true', NULL),
(10, 'Isabella domjan', 45081970, '2003-11-18', 'isadomjan@gmail.com', '3547508156', '3517507004', 'edad: 19, terminos aceptados: true', NULL),
(11, 'Rosana Graciela Romero', 24290877, '1975-04-22', 'roromero534@gmail.com', '3547540381', '3547667263', 'edad: 48, terminos aceptados: true', NULL),
(12, 'Altamirano valentina ', 45936537, '2004-09-09', 'altamiranovalentina35@gmail.com', '3547570220', '3547456117', 'edad: 18, terminos aceptados: true', NULL),
(13, 'Carla Antonella Miranda', 36351876, '1991-07-11', 'miranda11791@gmail.com', '3547448177', '3547448177', 'edad: 32, terminos aceptados: true', NULL),
(15, 'Lourdes Herrera ', 45404179, '2004-02-11', 'lulyherrera1665@gmail.com', '3547677921', '3547666968', 'edad: 19, terminos aceptados: true', NULL),
(16, 'Milena salgado', 43604367, '2001-09-21', 'milenasalgado523@gmail.com', '3547582801', '3547624224', 'edad: 21, terminos aceptados: true', NULL),
(17, 'PATRICIA NARDO', 17490512, '1966-01-21', 'patricianardo80@gmail.com', '3547632955', '3547632955', 'edad: 57, terminos aceptados: true', NULL),
(18, 'Nahir meyer', 42183536, '1999-09-30', 'Nahyr99.meyer@gmail.com', '3547593052', '3547573024', 'edad: 23, terminos aceptados: true', NULL),
(19, 'Tobias salgado', 45483348, '2004-03-09', 'tobiasgaspar14@gmail.com', '3547666561', '3547666561', 'edad: 19, terminos aceptados: true', NULL),
(20, 'Milagros Maldonado', 44473007, '2002-09-25', 'mm620238@gmail.com', '3547668091', '3547477463', 'edad: 20, terminos aceptados: true', NULL),
(21, 'Ana Carolina Frissolo', 23536611, '2023-09-04', 'carolinafrissolo@hotmail.com', '3547609759', '3547406055', 'edad: 49, terminos aceptados: true', NULL),
(22, 'alfredo martin gonzalez', 29711003, '1982-08-17', 'martin.gonzalez.cba@gmail.com', '3516706811', '3516706811', 'edad: 40, terminos aceptados: true', NULL),
(23, 'Marcos Sanchez ', 42184476, '1999-10-19', 'marcos.19sanchez@hotmail.com', '3547670112', '3547579657', 'edad: 23, terminos aceptados: true', NULL),
(24, 'Celeste Ceballos ', 45095400, '2003-11-28', 'celesteceballos007@gmail.com', '3547314973', '3547641404', 'edad: 19, terminos aceptados: true', NULL),
(25, 'Belén Villarreal ', 43132578, '2000-12-22', 'belenvillarreal320@gmail.com', '3547652238', '3547506399', 'edad: 22, terminos aceptados: true', NULL),
(26, 'Julián Agustín Villarreal Heredia ', 45936528, '2004-09-06', 'julianagustinvillarrealheredia@gmail.com', '3547531115', '3547531094', 'edad: 18, terminos aceptados: true', NULL),
(27, 'Santiago Pereyra', 43808655, '2002-02-08', 'Santipereyra110@gmail.com', '3547663957', '3547529040', 'edad: 21, terminos aceptados: true', NULL),
(28, 'Julian ignacio Castillo', 45934356, '2004-08-25', 'julignacio25@gmail.com', '3547663945', '3516626354', 'edad: 18, terminos aceptados: true', NULL),
(30, 'Mirtha Noemí Flores ', 18303624, '1966-07-03', 'asistenteterapeutico3@gmail.com', '3512535849', '3512535849', 'edad: 56, terminos aceptados: true', NULL),
(31, 'Ana Yazmín Rocha', 43673340, '2002-01-25', 'ana_rocha@live.com.ar', '3547530060', '3547521431', 'edad: 21, terminos aceptados: true', NULL),
(32, 'Piñero Martin ', 46240382, '2004-01-08', 'pineromartiin@gmail.com', '3547546064', '3547546064', 'edad: 19, terminos aceptados: true', NULL),
(33, 'godoy carla', 38419309, '1994-12-14', 'carlagogodoy@gmail.com', '3547627676', '3547531270', 'edad: 28, terminos aceptados: true', NULL),
(34, 'Urias Daniel ROSALES', 45697817, '2003-11-28', 'urias.rosa.2016@gmail.com', '3513706046', '3513043136', 'edad: 19, terminos aceptados: true', NULL),
(35, 'Gabriela Alejandra BONANNATA ', 23871100, '1974-04-26', 'gabybonannata@yahoo.com.ar', '3547635258', '3547656149', 'edad: 49, terminos aceptados: true', NULL),
(36, 'Camila Diller', 43410800, '2001-06-14', 'camiladiller@gmail.com', '3547609719', '3547525657', 'edad: 22, terminos aceptados: true', NULL),
(37, 'Camila Diller ', 43410800, '2001-06-14', 'camiladiller@gmail.com', '3547609719', '3547525657', 'edad: 22, terminos aceptados: true', NULL),
(38, 'Romina mansilla', 37165837, '1992-09-19', 'romimansilla92@icloud.com', '3547609600', '3547462953', 'edad: 30, terminos aceptados: true', NULL),
(39, 'Iris Mariana Domínguez ', 22876893, '1972-11-15', 'dominguezmarianacba3@yahoo.com.ar', '3547468907', '3547677080', 'edad: 50, terminos aceptados: true', NULL),
(40, 'Nancy sanchez', 40027463, '1997-06-23', 'nancyemiliesanchezz@gmail.com', '3547621875', '3547306041', 'edad: 26, terminos aceptados: true', NULL),
(41, 'Camila Veliz', 44242483, '2001-05-04', 'cveliz026@gmail.com', '3547306041', '3547621875', 'edad: 22, terminos aceptados: true', NULL),
(42, 'Bruno Lauricella', 43475800, '2001-08-23', 'brunomlauricella@gmail.com', '3547522513', '3547522510', 'edad: 22, terminos aceptados: true', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `alumnos_cursos`
--

DROP TABLE IF EXISTS `alumnos_cursos`;
CREATE TABLE `alumnos_cursos` (
  `alumno_id` int NOT NULL,
  `curso_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `alumnos_cursos`
--

INSERT INTO `alumnos_cursos` (`alumno_id`, `curso_id`) VALUES
(2, 1),
(7, 1),
(8, 1),
(12, 1),
(15, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(24, 1),
(25, 1),
(27, 1),
(28, 1),
(33, 1),
(34, 1),
(35, 1),
(40, 1),
(41, 1),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(9, 2),
(10, 2),
(11, 2),
(13, 2),
(16, 2),
(17, 2),
(22, 2),
(23, 2),
(26, 2),
(30, 2),
(31, 2),
(32, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(42, 2);

-- --------------------------------------------------------

--
-- Table structure for table `aulas`
--

DROP TABLE IF EXISTS `aulas`;
CREATE TABLE `aulas` (
  `id` int NOT NULL,
  `cant_ideal` int DEFAULT NULL,
  `cant_max` int DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `representacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

DROP TABLE IF EXISTS `cursos`;
CREATE TABLE `cursos` (
  `id` int NOT NULL,
  `nivel_id` int DEFAULT NULL,
  `aula_id` int DEFAULT NULL,
  `inscripcion_id` int DEFAULT NULL,
  `creador_id` int DEFAULT NULL,
  `max_alumnos` int DEFAULT NULL,
  `representacion` varchar(255) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `estado_inscripcion_id` int DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

DROP TABLE IF EXISTS `curso_horario`;
CREATE TABLE `curso_horario` (
  `curso_id` int NOT NULL,
  `horario_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

DROP TABLE IF EXISTS `curso_profesor`;
CREATE TABLE `curso_profesor` (
  `curso_id` int NOT NULL,
  `usuario_profesor_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estados_inscripcion`
--

DROP TABLE IF EXISTS `estados_inscripcion`;
CREATE TABLE `estados_inscripcion` (
  `id` int NOT NULL,
  `titulo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
CREATE TABLE `horarios` (
  `id` int NOT NULL,
  `diaSemana` varchar(45) DEFAULT NULL,
  `horaInicio` varchar(50) DEFAULT NULL,
  `horaFin` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

DROP TABLE IF EXISTS `inscripciones`;
CREATE TABLE `inscripciones` (
  `id` int NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `estado_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lenguajes`
--

DROP TABLE IF EXISTS `lenguajes`;
CREATE TABLE `lenguajes` (
  `id` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lenguajes`
--

INSERT INTO `lenguajes` (`id`, `nombre`) VALUES
(1, 'Ingles');

-- --------------------------------------------------------

--
-- Table structure for table `niveles`
--

DROP TABLE IF EXISTS `niveles`;
CREATE TABLE `niveles` (
  `id` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `programa` varchar(255) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `representacion` varchar(255) DEFAULT NULL,
  `lenguaje_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `niveles`
--

INSERT INTO `niveles` (`id`, `nombre`, `programa`, `material`, `representacion`, `lenguaje_id`) VALUES
(1, 'ADULTOS 1 (PRICIPIANTES )', 'C:\\fakepath\\1- PROGRAMA AD 1 2022.pdf', NULL, '#DFEEEF', 1),
(2, 'ADULTOS 2', NULL, NULL, '#DFEEEF', 1),
(3, 'ADLTOS 3', NULL, NULL, '#DFEEEF', 1),
(4, 'ADULTOS 4 ', NULL, NULL, '#DFEEEF', 1),
(5, 'CONVERSACIÓN ', NULL, NULL, '#DFEEEF', 1),
(6, 'KINDER 1', NULL, NULL, '#da8f54', 1),
(7, 'KINDER 2', NULL, NULL, '#da8f54', 1),
(8, 'CHILDREN 1', NULL, NULL, '#9f9ccc', NULL),
(9, 'CHILDREN 2', NULL, NULL, '#9f9ccc', 1),
(10, 'CHILDREN 3', NULL, NULL, '#9f9ccc', NULL),
(11, 'TEENS 1', NULL, NULL, '#94d375', 1),
(12, 'TEENS 2', NULL, NULL, '#94d375', 1),
(13, 'TEENS 3', NULL, NULL, '#94d375', NULL),
(14, 'TEENS 4', NULL, NULL, '#94d375', 1),
(15, 'TEENS 5', NULL, NULL, '#94d375', 1),
(16, 'TEENS 6', NULL, NULL, '#94d375', 1),
(17, 'FIRST CERTIFICATE IN ENGLISH ', NULL, NULL, '#dfeeef', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles_usuarios`
--

DROP TABLE IF EXISTS `roles_usuarios`;
CREATE TABLE `roles_usuarios` (
  `usuario_id` int NOT NULL,
  `rol_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `external_id` varchar(255) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `_password` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `celular` int DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_token` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `aulas`
--
ALTER TABLE `aulas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `estados_inscripcion`
--
ALTER TABLE `estados_inscripcion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lenguajes`
--
ALTER TABLE `lenguajes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `niveles`
--
ALTER TABLE `niveles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

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
