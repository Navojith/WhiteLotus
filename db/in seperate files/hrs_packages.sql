-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: hrs
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `accomadation_type` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `no_of_guests` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `imageName` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES ('0001','Lotus Bronze','Standard','Spend a night in a charming room Trendy Suite Balcony and start the day with a breakfast served at the restaurant. Lunch or dinner for 02 people at Marvel Restaurant',7,78.00,'bronze.jpg','C:/Users/DELL/eclipse-workspace-enterprise/WhiteLotus/src/main/webapp/img/bronze.jpg'),('0002','Lotus Silver','Standard','Spend two night in a charming Deluxe City View Room and start the day with a breakfast served at the restaurant. 01 voucher off 20% for Lunch or Dinner at Lotus Grand Restaurant.',2,30000.00,'bronze.jpg',NULL),('0003','Lotus Gold','VIP','Spend 2 days in a Delux Ocean view room.02 vouchers 20% off each for Lunch or Dinner at LGrand Restaurant. Spa Service: Three coupons 30 minute-massage back, neck, shoulder for 03 people at our Trendy Spa ',3,50000.00,'gold.jpg',NULL),('0004','Lotus Premium','VVIP','High floor 4 rooms relaxing with 4Suites Balcony Rooms. 01 voucher 40% off for Lunch or Dinner at LGrandl Restaurant. Early check-in and late check-out for free of charge, subject to availability.',4,90000.00,'premium.jpg',NULL),('12qfw','sdn','gold','qwg',123,12.00,'silver.jpg','C:/Users/DELL/eclipse-workspace-enterprise/WhiteLotus/src/main/webapp/img/silver.jpg');
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-22 19:33:11
