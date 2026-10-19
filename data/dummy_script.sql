CREATE DATABASE IF NOT EXISTS `sistema_academico` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sistema_academico`;

-- Disable checks temporarily to drop/create tables in any order smoothly
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- ------------------------------------------------------
-- 1. DROP EXISTING TABLES
-- ------------------------------------------------------
DROP TABLE IF EXISTS `authorities`;
DROP TABLE IF EXISTS `subject`;
DROP TABLE IF EXISTS `teacher`;
DROP TABLE IF EXISTS `users`;

-- ------------------------------------------------------
-- 2. CREATE TABLES
-- ------------------------------------------------------

-- Table structure for table `teacher`
CREATE TABLE `teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `subject`
CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credits` int NOT NULL,
  `lecture_hours` int NOT NULL,
  `teacher_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_subject_teacher` (`teacher_id`),
  CONSTRAINT `fk_subject_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `users`
CREATE TABLE `users` (
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `authorities`
CREATE TABLE `authorities` (
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authority` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------
-- 3. INSERT DATA
-- ------------------------------------------------------

-- Dumping data for table `teacher`
LOCK TABLES `teacher` WRITE;
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
UNLOCK TABLES;

-- Dumping data for table `subject`
LOCK TABLES `subject` WRITE;
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
UNLOCK TABLES;

-- Dumping data for table `users`
LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES 
('juan', '{noop}123', 1),
('pedro', '{noop}123', 1);
UNLOCK TABLES;

-- Dumping data for table `authorities`
LOCK TABLES `authorities` WRITE;
INSERT INTO `authorities` VALUES 
('juan', 'ROLE_PROFESOR'),
('pedro', 'ROLE_DIRECTOR');
UNLOCK TABLES;

-- ------------------------------------------------------
-- 4. RESTORE SETTINGS
-- ------------------------------------------------------
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;