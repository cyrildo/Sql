-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.17.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `mydb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mydb`;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Role` (
  `Id` int(11) NOT NULL,
  `Role` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'teacher'),(2,'student');
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `School`
--

DROP TABLE IF EXISTS `School`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `School` (
  `idSchool` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSchool`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `School`
--

LOCK TABLES `School` WRITE;
/*!40000 ALTER TABLE `School` DISABLE KEYS */;
INSERT INTO `School` VALUES (1,'Orleans'),(2,'Paris'),(3,'La loupe');
/*!40000 ALTER TABLE `School` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookingclassroom`
--

DROP TABLE IF EXISTS `bookingclassroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookingclassroom` (
  `classroom_Id` int(11) NOT NULL,
  `date_debut` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_end` datetime NOT NULL,
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_student_has_classroom1_classroom1_idx` (`classroom_Id`),
  KEY `fk_bookingclassroom_person1_idx` (`person_id`),
  CONSTRAINT `fk_bookingclassroom_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_classroom1_classroom1` FOREIGN KEY (`classroom_Id`) REFERENCES `classroom` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookingclassroom`
--

LOCK TABLES `bookingclassroom` WRITE;
/*!40000 ALTER TABLE `bookingclassroom` DISABLE KEYS */;
INSERT INTO `bookingclassroom` VALUES (1,'2018-03-15 14:00:00','2018-03-15 16:00:00',1,1),(1,'2018-03-15 16:30:00','2018-03-15 17:30:00',2,2),(1,'2018-03-16 10:00:00','2018-03-16 12:00:00',3,3),(5,'2018-03-15 15:00:00','2018-03-15 16:30:00',4,5),(5,'2018-03-16 09:00:00','2018-03-16 11:00:00',5,6),(3,'2018-03-16 14:00:00','2018-03-16 16:00:00',6,4),(6,'2018-03-16 15:00:00','2018-03-15 17:00:00',7,7),(6,'2018-03-15 17:00:00','2018-03-15 18:00:00',8,10),(6,'2018-03-16 09:00:00','2018-03-16 10:00:00',9,8),(6,'2018-03-16 10:30:00','2018-03-16 12:00:00',10,9);
/*!40000 ALTER TABLE `bookingclassroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classroom` (
  `Id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `School_idSchool` int(11) NOT NULL,
  PRIMARY KEY (`Id`,`School_idSchool`),
  KEY `fk_classroom_School1_idx` (`School_idSchool`),
  CONSTRAINT `fk_classroom_School1` FOREIGN KEY (`School_idSchool`) REFERENCES `School` (`idSchool`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
INSERT INTO `classroom` VALUES (1,'Dojo',1),(2,'Salle de réunion',1),(3,'Salle de repos',1),(4,'Cuisine',1),(5,'Bureau',1),(6,'Openspace',1);
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langage`
--

DROP TABLE IF EXISTS `langage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `langage` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langage`
--

LOCK TABLES `langage` WRITE;
/*!40000 ALTER TABLE `langage` DISABLE KEYS */;
INSERT INTO `langage` VALUES (1,'PHP'),(2,'Javascript'),(3,'SQL');
/*!40000 ALTER TABLE `langage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `adress` varchar(45) DEFAULT NULL,
  `langage_id` int(11) NOT NULL,
  `Role_Id` int(11) NOT NULL,
  `School_idSchool` int(11) NOT NULL,
  PRIMARY KEY (`id`,`langage_id`,`Role_Id`,`School_idSchool`),
  KEY `fk_person_langage1_idx` (`langage_id`),
  KEY `fk_person_Role1_idx` (`Role_Id`),
  KEY `fk_person_School1_idx` (`School_idSchool`),
  CONSTRAINT `fk_person_Role1` FOREIGN KEY (`Role_Id`) REFERENCES `Role` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_person_School1` FOREIGN KEY (`School_idSchool`) REFERENCES `School` (`idSchool`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_person_langage1` FOREIGN KEY (`langage_id`) REFERENCES `langage` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Google','Professor','NewYork',1,1,1),(2,'Lorie','TaMeilleureAmie','Paris',1,2,1),(3,'Bruce','Banner','NewYork',1,1,1),(4,'Nico','Cocaline','Orleans',1,1,1),(5,'Sylvain','Rougèbon','Orleans',1,1,1),(6,'Diego','DeLaVega','LosAngeles',2,2,1),(7,'Jeanne','Darc','Orleans',2,2,1),(8,'Goku','San','Sadara',3,2,1),(9,'Nicky','Larson','Tokyo',1,2,1),(10,'Valerian','Doe','Syrte',2,2,1);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-15 15:58:46
