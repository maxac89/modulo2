CREATE DATABASE  IF NOT EXISTS `sistema_academico` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sistema_academico`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema_academico
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES 
(1, 'Alejandro', 'García Pérez', 'Calle Mayor 12, Madrid'),
(2, 'María', 'López Fernández', 'Avenida de la Constitución 45, Sevilla'),
(3, 'Carlos', 'Martínez Gómez', 'Calle Gran Vía 8, Barcelona'),
(4, 'Ana', 'Rodríguez Sánchez', 'Paseo de la Castellana 100, Madrid'),
(5, 'David', 'Fernández Ruiz', 'Calle San Fernando 22, Valencia'),
(6, 'Laura', 'Gómez Díaz', 'Calle Larios 15, Málaga'),
(7, 'Javier', 'Pérez Moreno', 'Calle Zaragoza 5, Bilbao'),
(8, 'Carmen', 'Jiménez Alonso', 'Calle Real 33, Granada'),
(9, 'Francisco', 'Ruiz Navarro', 'Avenida América 78, Zaragoza'),
(10, 'Elena', 'Moreno Gil', 'Calle Mayor 4, Salamanca'),
(11, 'Miguel', 'Álvarez Romero', 'Calle Sierpes 19, Sevilla'),
(12, 'Isabel', 'Romero Torres', 'Calle Alcalá 55, Madrid'),
(13, 'José', 'Navarro Domínguez', 'Plaza Nueva 3, Valencia'),
(14, 'Sofía', 'Torres Vázquez', 'Calle Betis 12, Sevilla'),
(15, 'Manuel', 'Domínguez Ramos', 'Calle Colón 40, Valencia'),
(16, 'Lucía', 'Vázquez Gil', 'Calle Mayor 88, Murcia'),
(17, 'Pablo', 'Ramos Castro', 'Avenida Libertad 14, Alicante'),
(18, 'Marta', 'Castro Ortiz', 'Calle San Antón 7, Granada'),
(19, 'Jorge', 'Ortiz Rubio', 'Paseo Independencia 20, Zaragoza'),
(20, 'Beatriz', 'Serrano Molina', 'Calle Toledo 9, Madrid');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credits` int NOT NULL,
  `lecture_hours` int NOT NULL,
  `teacher_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_subject_teacher` (`teacher_id`),
  CONSTRAINT `fk_subject_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES 
(1, 'Matemáticas I', 6, 90, 1),
(2, 'Física General', 6, 90, 2),
(3, 'Programación Básica', 8, 120, 3),
(4, 'Bases de Datos', 6, 90, 3),
(5, 'Literatura Española', 4, 60, 4),
(6, 'Historia Universal', 4, 60, 5),
(7, 'Química Orgánica', 6, 90, 6),
(8, 'Inglés Técnico', 3, 45, 7),
(9, 'Economía y Empresa', 5, 75, 8),
(10, 'Álgebra Lineal', 6, 90, 1),
(11, 'Estructura de Datos', 8, 120, 3),
(12, 'Filosofía Contemporánea', 4, 60, 9),
(13, 'Derecho Constitucional', 6, 90, 10),
(14, 'Estadística Aplicada', 6, 90, 11),
(15, 'Redes de Computadoras', 6, 90, 12),
(16, 'Inteligencia Artificial', 8, 120, 12),
(17, 'Biología Celular', 6, 90, 13),
(18, 'Psicología General', 5, 75, 14),
(19, 'Sistemas Operativos', 6, 90, 15),
(20, 'Arquitectura de Software', 8, 120, 15);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sistema_academico'
--

--
-- Dumping routines for database 'sistema_academico'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-15  9:06:06