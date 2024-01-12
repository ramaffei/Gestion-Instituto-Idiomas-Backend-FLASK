-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 03, 2023 at 07:37 PM
-- Server version: 8.0.33-0ubuntu0.20.04.4
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
(29, 'Carla godoy', 38419309, '1994-12-14', 'Carlagogodoy@gmail.com', '3547627513', '3547531270', 'edad: 28, terminos aceptados: true', NULL),
(30, 'Mirtha Noemí Flores ', 18303624, '1966-07-03', 'asistenteterapeutico3@gmail.com', '3512535849', '3512535849', 'edad: 56, terminos aceptados: true', NULL),
(31, 'Ana Yazmín Rocha', 43673340, '2002-01-25', 'ana_rocha@live.com.ar', '3547530060', '3547521431', 'edad: 21, terminos aceptados: true', NULL),
(32, 'Piñero Martin ', 46240382, '2004-01-08', 'pineromartiin@gmail.com', '3547546064', '3547546064', 'edad: 19, terminos aceptados: true', NULL);

-- --------------------------------------------------------

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
(29, 2),
(30, 2),
(31, 2),
(32, 2);

-- --------------------------------------------------------

INSERT INTO `aulas` (`id`, `cant_ideal`, `cant_max`, `nombre`, `representacion`) VALUES
(1, 18, 21, 'Green', '#94d375'),
(2, 20, 30, 'Big room', '#9f9ccc');

-- --------------------------------------------------------

--
-- Dumping data for table `cursos`
--

INSERT INTO `cursos` (`id`, `nivel_id`, `aula_id`, `inscripcion_id`, `creador_id`, `max_alumnos`, `representacion`, `nombre`, `estado_inscripcion_id`, `descripcion`, `created_at`) VALUES
(1, 1, 1, NULL, NULL, 18, '#DFEEEF', 'Jovenes y Adultos Principiantes', NULL, 'Ingles para principiantes a partir de los 18 años', '2023-07-10 00:28:58'),
(2, 1, 2, NULL, NULL, 20, '#DFEEEF', 'Jóvenes y adultos principiantes', NULL, 'Curso para jóvenes y adultos principiantes a partir de los 18 años ', '2023-07-10 09:18:01');

-- --------------------------------------------------------

--
-
-- Dumping data for table `curso_horario`
--

INSERT INTO `curso_horario` (`curso_id`, `horario_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4);

-- --------------------------------------------------------

--

-- --------------------------------------------------------

--


-- --------------------------------------------------------

--
--
-- Dumping data for table `horarios`
--

INSERT INTO `horarios` (`id`, `diaSemana`, `horaInicio`, `horaFin`) VALUES
(1, 'Lunes', '21:00', '23:00'),
(2, 'Miercoles', '21:00', '23:00'),
(3, 'Martes', '21:00', '23:00'),
(4, 'Jueves', '21:00', '23:00');

-- --------------------------------------------------------

--
--
-- Dumping data for table `lenguajes`
--

INSERT INTO `lenguajes` (`id`, `nombre`) VALUES
(1, 'Ingles');

-- --------------------------------------------------------

--
--
-- Dumping data for table `niveles`
--

INSERT INTO `niveles` (`id`, `nombre`, `programa`, `material`, `representacion`, `lenguaje_id`) VALUES
(1, 'Jovenes y Adultos Principiante', NULL, NULL, '#DFEEEF', 1);

-- --------------------------------------------------------

--

--
-- AUTO_INCREMENT for table `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `aulas`
--
ALTER TABLE `aulas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `estados_inscripcion`
--
ALTER TABLE `estados_inscripcion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
