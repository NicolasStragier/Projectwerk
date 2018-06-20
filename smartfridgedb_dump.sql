-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: smartfridgedb
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `acties`
--

DROP TABLE IF EXISTS `acties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acties` (
  `Actieid` int(11) NOT NULL,
  `Actie` varchar(45) DEFAULT NULL,
  `Beschrijving` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Actieid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acties`
--

LOCK TABLES `acties` WRITE;
/*!40000 ALTER TABLE `acties` DISABLE KEYS */;
INSERT INTO `acties` VALUES (0,'test','test'),(1,'Aankoop_voorraad','Het aankopen van de voorraad, kan in de kelder of opslagruimte staan'),(2,'Frigo_in','Het vulllen van de frigo'),(3,'Frigo_uit','Het consumeren van een drankje door iemand.');
/*!40000 ALTER TABLE `acties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dranken`
--

DROP TABLE IF EXISTS `dranken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dranken` (
  `Drankid` int(11) NOT NULL,
  `Dranknaam` varchar(45) DEFAULT NULL,
  `Aankoopprijs` varchar(45) DEFAULT NULL,
  `Verkoopprijs` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Drankid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dranken`
--

LOCK TABLES `dranken` WRITE;
/*!40000 ALTER TABLE `dranken` DISABLE KEYS */;
INSERT INTO `dranken` VALUES (1,'Coca Cola','0.50','1'),(2,'Stella Artois','0.50','2');
/*!40000 ALTER TABLE `dranken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logging`
--

DROP TABLE IF EXISTS `logging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logging` (
  `Loggingid` int(11) NOT NULL,
  `Actieid` int(11) NOT NULL,
  `Userid` int(11) NOT NULL,
  `Drankid` int(11) NOT NULL,
  `Aantal` varchar(45) DEFAULT NULL,
  `Tijd` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Loggingid`,`Actieid`,`Userid`,`Drankid`),
  KEY `fk_Logging_users_idx` (`Userid`),
  KEY `fk_Logging_dranken1_idx` (`Drankid`),
  KEY `fk_Logging_Acties1_idx` (`Actieid`),
  CONSTRAINT `fk_Logging_Acties1` FOREIGN KEY (`Actieid`) REFERENCES `acties` (`Actieid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Logging_dranken1` FOREIGN KEY (`Drankid`) REFERENCES `dranken` (`Drankid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Logging_users` FOREIGN KEY (`Userid`) REFERENCES `users` (`Userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logging`
--

LOCK TABLES `logging` WRITE;
/*!40000 ALTER TABLE `logging` DISABLE KEYS */;
INSERT INTO `logging` VALUES (1,1,2,2,'5','2018-06-05 16:22:12'),(2,2,2,2,'5','2018-06-05 16:25:16'),(3,3,3,2,'-1','2018-06-07 09:13:18'),(4,1,2,1,'5','2018-06-07 09:10:20'),(5,2,2,1,'2','2018-06-07 09:11:25'),(6,3,3,1,'-2','2018-06-07 10:07:17');
/*!40000 ALTER TABLE `logging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `Userid` int(11) NOT NULL AUTO_INCREMENT,
  `Naam` varchar(45) DEFAULT NULL,
  `Voornaam` varchar(45) DEFAULT NULL,
  `Rol` varchar(45) DEFAULT NULL,
  `RFID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Stragier','Nicolas','Barman','644758420395'),(2,'Admin','Admin','Admin','705861867776'),(3,'Debouwer','Bob','Klant','923327707913'),(4,'Donald','Duck','Klant','123456789'),(5,'test','test','Klant','0549862455');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-20 19:18:23
