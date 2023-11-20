-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lostresmosqueteros
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `genero_poblador`
--

create database if not exists `lostresmosqueteros`;

use `lostresmosqueteros`;

DROP TABLE IF EXISTS `genero_poblador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero_poblador` (
  `idGenero` varchar(1) NOT NULL,
  `genero` varchar(45) NOT NULL,
  PRIMARY KEY (`idGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero_poblador`
--

LOCK TABLES `genero_poblador` WRITE;
/*!40000 ALTER TABLE `genero_poblador` DISABLE KEYS */;
INSERT INTO `genero_poblador` VALUES ('F','Femenino'),('M','Masculino');
/*!40000 ALTER TABLE `genero_poblador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores` (
  `idJugador` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `edad` int NOT NULL,
  `paz` tinyint(1) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password_hashed` varchar(300) NOT NULL,
  `estado_ban` varchar(45) NOT NULL,
  `hora` int DEFAULT NULL,
  PRIMARY KEY (`idJugador`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores`
--

LOCK TABLES `jugadores` WRITE;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
INSERT INTO `jugadores` VALUES (1,'Juan',25,1,'Juan23','juan@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','0',36),(2,'María',30,0,'Maria45','maria@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','0',0),(3,'Carlos',28,0,'Carlos10','carlos@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','0',0),(4,'Ana',22,0,'Ana15','ana@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','0',0),(5,'Pedro',27,1,'Pedro37','pedro@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','0',0),(6,'Piero',21,0,'Piero662','asda@gmail.com','55ffff342ff79a140d3e42196bbd3d22bc70018319d88c4ccba820d5358e627d','0',0),(7,'qwe',10,0,'asdasd','aasdasd@asd.com','4686ea6cd24164f1ef2b4dad9a523d6b2bdd347cfb9e7934c288112d3021e090','1',0);
/*!40000 ALTER TABLE `jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pobladores`
--

DROP TABLE IF EXISTS `pobladores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pobladores` (
  `idPoblador` int NOT NULL AUTO_INCREMENT,
  `idJugador` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `idGenero` varchar(1) NOT NULL,
  `idProfesion` varchar(5) NOT NULL,
  `alimentacionXdia` int NOT NULL,
  `produccion_moral` int NOT NULL,
  `moral` varchar(45) NOT NULL,
  `tiempo_en_colonia` int NOT NULL,
  `fuerza` int NOT NULL,
  `produccion_alimento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPoblador`),
  KEY `fk_pobladores_jugadores_idx` (`idJugador`),
  KEY `fk_pobladores_profesion_poblador1_idx` (`idProfesion`),
  KEY `fk_pobladores_genero_poblador1_idx` (`idGenero`),
  CONSTRAINT `fk_pobladores_genero_poblador1` FOREIGN KEY (`idGenero`) REFERENCES `genero_poblador` (`idGenero`),
  CONSTRAINT `fk_pobladores_jugadores` FOREIGN KEY (`idJugador`) REFERENCES `jugadores` (`idJugador`),
  CONSTRAINT `fk_pobladores_profesion_poblador1` FOREIGN KEY (`idProfesion`) REFERENCES `profesion_poblador` (`idProfesion`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pobladores`
--

LOCK TABLES `pobladores` WRITE;
/*!40000 ALTER TABLE `pobladores` DISABLE KEYS */;
INSERT INTO `pobladores` VALUES (1,1,'poblador1','M','GRA',11,0,'12',2,0,'111'),(2,1,'poblador2','M','GRA',12,0,'13',3,0,'112'),(3,1,'poblador3','F','GRA',18,0,'14',4,0,'113'),(4,1,'poblador4','M','CONS',55,12,'12',3,7,'0'),(5,2,'poblador5','F','CONS',60,14,'13',5,9,'0'),(37,1,'poblador6','M','GRA',21,0,'32',0,0,'179'),(38,1,'poblador11','M','UNSET',39,0,'42',0,0,'0'),(39,1,'poblador7','M','SOL',82,20,'31',0,35,'0'),(40,1,'poblador8','F','UNSET',34,0,'27',0,0,'0'),(41,1,'poblador9','M','CONS',59,14,'34',0,7,'0'),(42,1,'poblador10','M','GRA',21,0,'31',0,0,'103');
/*!40000 ALTER TABLE `pobladores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesion_poblador`
--

DROP TABLE IF EXISTS `profesion_poblador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesion_poblador` (
  `idProfesion` varchar(5) NOT NULL,
  `profesion` varchar(45) NOT NULL,
  PRIMARY KEY (`idProfesion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesion_poblador`
--

LOCK TABLES `profesion_poblador` WRITE;
/*!40000 ALTER TABLE `profesion_poblador` DISABLE KEYS */;
INSERT INTO `profesion_poblador` VALUES ('CONS','Constructor'),('GRA','Granjero'),('SOL','Soldado'),('UNSET','Ninguna');
/*!40000 ALTER TABLE `profesion_poblador` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-19 21:48:48
