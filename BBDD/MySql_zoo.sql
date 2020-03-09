CREATE DATABASE  IF NOT EXISTS `bbddzoo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `bbddzoo`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: bbddzoo
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `animales`
--

DROP TABLE IF EXISTS `animales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animales` (
  `animalid` int(11) NOT NULL AUTO_INCREMENT,
  `sexo` char(1) NOT NULL,
  `fnacimiento` date NOT NULL,
  `paisorigen` int(11) DEFAULT NULL,
  `continenteid` int(11) DEFAULT NULL,
  `zooid` int(11) NOT NULL,
  `especieid` int(11) NOT NULL,
  PRIMARY KEY (`animalid`),
  KEY `pk_animales_zoos_idx` (`zooid`),
  KEY `fk_animales_especies_idx` (`especieid`),
  CONSTRAINT `fk_animales_especies` FOREIGN KEY (`especieid`) REFERENCES `especies` (`especieid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_animales_zoos` FOREIGN KEY (`zooid`) REFERENCES `zoos` (`zooid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animales`
--

LOCK TABLES `animales` WRITE;
/*!40000 ALTER TABLE `animales` DISABLE KEYS */;
INSERT INTO `animales` VALUES (1,'M','2007-07-21',1,1,1,1),(2,'F','2000-08-20',1,1,1,1);
/*!40000 ALTER TABLE `animales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ciudades` (
  `ciudadid` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `paisid` int(11) NOT NULL,
  PRIMARY KEY (`ciudadid`),
  KEY `fk_ciudades_paises_idx` (`paisid`),
  CONSTRAINT `fk_ciudades_paises` FOREIGN KEY (`paisid`) REFERENCES `paises` (`paisid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,'Madrid',1),(2,'Montreal',2),(3,'Valencia',1),(4,'Quebec',2);
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `continentes`
--

DROP TABLE IF EXISTS `continentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `continentes` (
  `continenteid` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`continenteid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `continentes`
--

LOCK TABLES `continentes` WRITE;
/*!40000 ALTER TABLE `continentes` DISABLE KEYS */;
INSERT INTO `continentes` VALUES (1,'Europa'),(2,'America'),(3,'Asia'),(4,'Africa');
/*!40000 ALTER TABLE `continentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especies`
--

DROP TABLE IF EXISTS `especies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `especies` (
  `especieid` int(11) NOT NULL AUTO_INCREMENT,
  `nombrevulgar` varchar(45) DEFAULT NULL,
  `nombrecientifico` varchar(45) NOT NULL,
  `peligroextincion` tinyint(4) NOT NULL,
  `familiaid` int(11) NOT NULL,
  PRIMARY KEY (`especieid`),
  KEY `fk_especies_familia_idx` (`familiaid`),
  CONSTRAINT `fk_especies_familia` FOREIGN KEY (`familiaid`) REFERENCES `familias` (`familiaid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especies`
--

LOCK TABLES `especies` WRITE;
/*!40000 ALTER TABLE `especies` DISABLE KEYS */;
INSERT INTO `especies` VALUES (1,NULL,'Diprotodontia',0,1);
/*!40000 ALTER TABLE `especies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familias`
--

DROP TABLE IF EXISTS `familias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `familias` (
  `familiaid` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`familiaid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familias`
--

LOCK TABLES `familias` WRITE;
/*!40000 ALTER TABLE `familias` DISABLE KEYS */;
INSERT INTO `familias` VALUES (1,'mamiferos'),(2,'Aves'),(3,'Reptiles');
/*!40000 ALTER TABLE `familias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `paises` (
  `paisid` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `continenteid` int(11) NOT NULL,
  PRIMARY KEY (`paisid`),
  KEY `fk_paises_continentes_idx` (`continenteid`),
  CONSTRAINT `fk_paises_continentes` FOREIGN KEY (`continenteid`) REFERENCES `continentes` (`continenteid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'España',1),(2,'Canada',2),(3,'Marrueco',4);
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoos`
--

DROP TABLE IF EXISTS `zoos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zoos` (
  `zooid` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `presupuestoa` double NOT NULL,
  `extension` float NOT NULL,
  `ciudadid` int(11) NOT NULL,
  PRIMARY KEY (`zooid`),
  KEY `fk_zoos_ciudades_idx` (`ciudadid`),
  CONSTRAINT `fk_zoos_ciudades` FOREIGN KEY (`ciudadid`) REFERENCES `ciudades` (`ciudadid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Esta tabla contiene la información de los zoo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoos`
--

LOCK TABLES `zoos` WRITE;
/*!40000 ALTER TABLE `zoos` DISABLE KEYS */;
INSERT INTO `zoos` VALUES (1,'Zoo de Madrid',2340000,350000,1),(2,'Zoo Valencia',25000000,25000,3);
/*!40000 ALTER TABLE `zoos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bbddzoo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-04 11:03:32
