-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: enrollFun
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('b93b37ebfe49');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(45) NOT NULL,
  `dni` int NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `celular` varchar(11) NOT NULL,
  `celular_alt` varchar(11) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (2,'LILIANA EDITH BARGI',21400671,'1970-04-06','lebargi@hotmail.com','3547665611','3515108772','edad: 53, terminos aceptados: true',NULL),(3,'SERGIO RICARDO BONI',22078453,'1971-03-25','boniser@yahoo.com.ar','3515108772','3547665611','edad: 52, terminos aceptados: true',NULL),(4,'Camila Martinez Bargi',42441808,'2000-02-04','camila.bargi@mi.unc.edu.ar','3517360868','3517360868','edad: 23, terminos aceptados: true',NULL),(5,'Luciano Adrián Rodríguez ',46228447,'2005-02-03','lucianoliendo2005@gmail.com','3547540437','3512136967','edad: 18, terminos aceptados: true',NULL),(6,'Cecilia Inés Bargi',23536599,'1973-07-26','Cecibargi@gmail.com','3547504922','3547504922','edad: 49, terminos aceptados: true',NULL),(7,'Mauricio Alejandro Vélez ',23062069,'1973-05-16','mauryosolosoy@gmail.com','3547525276','3547502663','edad: 50, terminos aceptados: true',NULL),(8,'Elías Santiago Ramirez ',43203267,'2000-12-09','santiramirez22r@gmail.com','3547318250','3547532018','edad: 22, terminos aceptados: true',NULL),(9,'Gabriela Bonciolini ',23536510,'1973-06-22','aot1966@yahoo.com.ar','3547578502','3547430824','edad: 50, terminos aceptados: true',NULL),(10,'Isabella domjan',45081970,'2003-11-18','isadomjan@gmail.com','3547508156','3517507004','edad: 19, terminos aceptados: true',NULL),(11,'Rosana Graciela Romero',24290877,'1975-04-22','roromero534@gmail.com','3547540381','3547667263','edad: 48, terminos aceptados: true',NULL),(12,'Altamirano valentina ',45936537,'2004-09-09','altamiranovalentina35@gmail.com','3547570220','3547456117','edad: 18, terminos aceptados: true',NULL),(13,'Carla Antonella Miranda',36351876,'1991-07-11','miranda11791@gmail.com','3547448177','3547448177','edad: 32, terminos aceptados: true',NULL),(15,'Lourdes Herrera ',45404179,'2004-02-11','lulyherrera1665@gmail.com','3547677921','3547666968','edad: 19, terminos aceptados: true',NULL),(16,'Milena salgado',43604367,'2001-09-21','milenasalgado523@gmail.com','3547582801','3547624224','edad: 21, terminos aceptados: true',NULL),(17,'PATRICIA NARDO',17490512,'1966-01-21','patricianardo80@gmail.com','3547632955','3547632955','edad: 57, terminos aceptados: true',NULL),(18,'Nahir meyer',42183536,'1999-09-30','Nahyr99.meyer@gmail.com','3547593052','3547573024','edad: 23, terminos aceptados: true',NULL),(19,'Tobias salgado',45483348,'2004-03-09','tobiasgaspar14@gmail.com','3547666561','3547666561','edad: 19, terminos aceptados: true',NULL),(20,'Milagros Maldonado',44473007,'2002-09-25','mm620238@gmail.com','3547668091','3547477463','edad: 20, terminos aceptados: true',NULL),(21,'Ana Carolina Frissolo',23536611,'2023-09-04','carolinafrissolo@hotmail.com','3547609759','3547406055','edad: 49, terminos aceptados: true',NULL),(22,'alfredo martin gonzalez',29711003,'1982-08-17','martin.gonzalez.cba@gmail.com','3516706811','3516706811','edad: 40, terminos aceptados: true',NULL),(23,'Marcos Sanchez ',42184476,'1999-10-19','marcos.19sanchez@hotmail.com','3547670112','3547579657','edad: 23, terminos aceptados: true',NULL),(24,'Celeste Ceballos ',45095400,'2003-11-28','celesteceballos007@gmail.com','3547314973','3547641404','edad: 19, terminos aceptados: true',NULL),(25,'Belén Villarreal ',43132578,'2000-12-22','belenvillarreal320@gmail.com','3547652238','3547506399','edad: 22, terminos aceptados: true',NULL),(26,'Julián Agustín Villarreal Heredia ',45936528,'2004-09-06','julianagustinvillarrealheredia@gmail.com','3547531115','3547531094','edad: 18, terminos aceptados: true',NULL),(27,'Santiago Pereyra',43808655,'2002-02-08','Santipereyra110@gmail.com','3547663957','3547529040','edad: 21, terminos aceptados: true',NULL),(28,'Julian ignacio Castillo',45934356,'2004-08-25','julignacio25@gmail.com','3547663945','3516626354','edad: 18, terminos aceptados: true',NULL),(30,'Mirtha Noemí Flores ',18303624,'1966-07-03','asistenteterapeutico3@gmail.com','3512535849','3512535849','edad: 56, terminos aceptados: true',NULL),(31,'Ana Yazmín Rocha',43673340,'2002-01-25','ana_rocha@live.com.ar','3547530060','3547521431','edad: 21, terminos aceptados: true',NULL),(32,'Piñero Martin ',46240382,'2004-01-08','pineromartiin@gmail.com','3547546064','3547546064','edad: 19, terminos aceptados: true',NULL),(33,'godoy carla',38419309,'1994-12-14','carlagogodoy@gmail.com','3547627676','3547531270','edad: 28, terminos aceptados: true',NULL),(34,'Urias Daniel ROSALES',45697817,'2003-11-28','urias.rosa.2016@gmail.com','3513706046','3513043136','edad: 19, terminos aceptados: true',NULL),(35,'Gabriela Alejandra BONANNATA ',23871100,'1974-04-26','gabybonannata@yahoo.com.ar','3547635258','3547656149','edad: 49, terminos aceptados: true',NULL),(36,'Camila Diller',43410800,'2001-06-14','camiladiller@gmail.com','3547609719','3547525657','edad: 22, terminos aceptados: true',NULL);
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos_cursos`
--

DROP TABLE IF EXISTS `alumnos_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos_cursos` (
  `alumno_id` int NOT NULL,
  `curso_id` int NOT NULL,
  PRIMARY KEY (`alumno_id`,`curso_id`),
  KEY `curso_id` (`curso_id`),
  CONSTRAINT `alumnos_cursos_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  CONSTRAINT `alumnos_cursos_ibfk_2` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos_cursos`
--

LOCK TABLES `alumnos_cursos` WRITE;
/*!40000 ALTER TABLE `alumnos_cursos` DISABLE KEYS */;
INSERT INTO `alumnos_cursos` VALUES (2,1),(7,1),(8,1),(12,1),(15,1),(18,1),(19,1),(20,1),(21,1),(24,1),(25,1),(27,1),(28,1),(33,1),(34,1),(35,1),(3,2),(4,2),(5,2),(6,2),(9,2),(10,2),(11,2),(13,2),(16,2),(17,2),(22,2),(23,2),(26,2),(30,2),(31,2),(32,2),(36,2);
/*!40000 ALTER TABLE `alumnos_cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aulas`
--

DROP TABLE IF EXISTS `aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aulas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cant_ideal` int DEFAULT NULL,
  `cant_max` int DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `representacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aulas`
--

LOCK TABLES `aulas` WRITE;
/*!40000 ALTER TABLE `aulas` DISABLE KEYS */;
INSERT INTO `aulas` VALUES (1,18,21,'Green','#94d375'),(2,20,30,'Big room','#9f9ccc');
/*!40000 ALTER TABLE `aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_horario`
--

DROP TABLE IF EXISTS `curso_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso_horario` (
  `curso_id` int NOT NULL,
  `horario_id` int NOT NULL,
  PRIMARY KEY (`curso_id`,`horario_id`),
  KEY `horario_id` (`horario_id`),
  CONSTRAINT `curso_horario_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`),
  CONSTRAINT `curso_horario_ibfk_2` FOREIGN KEY (`horario_id`) REFERENCES `horarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_horario`
--

LOCK TABLES `curso_horario` WRITE;
/*!40000 ALTER TABLE `curso_horario` DISABLE KEYS */;
INSERT INTO `curso_horario` VALUES (1,1),(1,2),(2,3),(2,4);
/*!40000 ALTER TABLE `curso_horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_profesor`
--

DROP TABLE IF EXISTS `curso_profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso_profesor` (
  `curso_id` int NOT NULL,
  `usuario_profesor_id` int NOT NULL,
  PRIMARY KEY (`curso_id`,`usuario_profesor_id`),
  KEY `usuario_profesor_id` (`usuario_profesor_id`),
  CONSTRAINT `curso_profesor_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`),
  CONSTRAINT `curso_profesor_ibfk_2` FOREIGN KEY (`usuario_profesor_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_profesor`
--

LOCK TABLES `curso_profesor` WRITE;
/*!40000 ALTER TABLE `curso_profesor` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso_profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nivel_id` int DEFAULT NULL,
  `aula_id` int DEFAULT NULL,
  `inscripcion_id` int DEFAULT NULL,
  `creador_id` int DEFAULT NULL,
  `max_alumnos` int DEFAULT NULL,
  `representacion` varchar(255) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `estado_inscripcion_id` int DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aula_id` (`aula_id`),
  KEY `creador_id` (`creador_id`),
  KEY `estado_inscripcion_id` (`estado_inscripcion_id`),
  KEY `inscripcion_id` (`inscripcion_id`),
  KEY `nivel_id` (`nivel_id`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`aula_id`) REFERENCES `aulas` (`id`),
  CONSTRAINT `cursos_ibfk_2` FOREIGN KEY (`creador_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `cursos_ibfk_3` FOREIGN KEY (`estado_inscripcion_id`) REFERENCES `estados_inscripcion` (`id`),
  CONSTRAINT `cursos_ibfk_4` FOREIGN KEY (`inscripcion_id`) REFERENCES `inscripciones` (`id`),
  CONSTRAINT `cursos_ibfk_5` FOREIGN KEY (`nivel_id`) REFERENCES `niveles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,1,1,NULL,NULL,18,'#DFEEEF',' ADULTOS PRINCIPIANTES',NULL,'INGLÉS PARA ADULTOS PRINCIPIANTES A PARTIR DE LOS 18 AÑOS','2023-07-10 00:28:58'),(2,1,2,NULL,NULL,20,'#DFEEEF',' ADULTOS PRINCIPIANTES',NULL,'INGLÉS PARA ADULTOS PRINCIPIANTES A PARTIR DE LOS 18 AÑOS ','2023-07-10 09:18:01');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_inscripcion`
--

DROP TABLE IF EXISTS `estados_inscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_inscripcion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_inscripcion`
--

LOCK TABLES `estados_inscripcion` WRITE;
/*!40000 ALTER TABLE `estados_inscripcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados_inscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `diaSemana` varchar(45) DEFAULT NULL,
  `horaInicio` varchar(50) DEFAULT NULL,
  `horaFin` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` VALUES (1,'Lunes','21:00','23:00'),(2,'Miercoles','21:00','23:00'),(3,'Martes','21:00','23:00'),(4,'Jueves','21:00','23:00');
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estado_id` (`estado_id`),
  CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estados_inscripcion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones`
--

LOCK TABLES `inscripciones` WRITE;
/*!40000 ALTER TABLE `inscripciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lenguajes`
--

DROP TABLE IF EXISTS `lenguajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lenguajes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lenguajes`
--

LOCK TABLES `lenguajes` WRITE;
/*!40000 ALTER TABLE `lenguajes` DISABLE KEYS */;
INSERT INTO `lenguajes` VALUES (1,'Ingles');
/*!40000 ALTER TABLE `lenguajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveles`
--

DROP TABLE IF EXISTS `niveles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niveles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `programa` varchar(255) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `representacion` varchar(255) DEFAULT NULL,
  `lenguaje_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lenguaje_id` (`lenguaje_id`),
  CONSTRAINT `niveles_ibfk_1` FOREIGN KEY (`lenguaje_id`) REFERENCES `lenguajes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveles`
--

LOCK TABLES `niveles` WRITE;
/*!40000 ALTER TABLE `niveles` DISABLE KEYS */;
INSERT INTO `niveles` VALUES (1,'Adultos Principiante','C:\\fakepath\\1- PROGRAMA AD 1 2022.pdf',NULL,'#dc9696',1);
/*!40000 ALTER TABLE `niveles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_usuarios`
--

DROP TABLE IF EXISTS `roles_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_usuarios` (
  `usuario_id` int NOT NULL,
  `rol_id` int NOT NULL,
  PRIMARY KEY (`usuario_id`,`rol_id`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `roles_usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `roles_usuarios_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_usuarios`
--

LOCK TABLES `roles_usuarios` WRITE;
/*!40000 ALTER TABLE `roles_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `external_id` varchar(255) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `_password` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `celular` int DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_token` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `external_id` (`external_id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'enrollFun'
--

--
-- Dumping routines for database 'enrollFun'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-07 18:22:46
