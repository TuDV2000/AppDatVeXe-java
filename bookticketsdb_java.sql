-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: bookticketsdb_java
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `trip_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_feedback_trip_id_54e35c88_fk_app_trip_id` (`trip_id`),
  KEY `app_feedback_user_id_57be9fb8_fk_app_user_id` (`user_id`),
  CONSTRAINT `app_feedback_trip_id_54e35c88_fk_app_trip_id` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`),
  CONSTRAINT `app_feedback_user_id_57be9fb8_fk_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (2,'k co j',6,19),(3,'an toan',8,19);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line`
--

DROP TABLE IF EXISTS `line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `line` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `end_point_id` bigint DEFAULT NULL,
  `start_point_id` bigint DEFAULT NULL,
  `extra_changes` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_line_end_point_id_1fa1352d_fk_app_point_id` (`end_point_id`),
  KEY `app_line_start_point_id_0801ba8f_fk_app_point_id` (`start_point_id`),
  CONSTRAINT `app_line_end_point_id_1fa1352d_fk_app_point_id` FOREIGN KEY (`end_point_id`) REFERENCES `point` (`id`),
  CONSTRAINT `app_line_start_point_id_0801ba8f_fk_app_point_id` FOREIGN KEY (`start_point_id`) REFERENCES `point` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line`
--

LOCK TABLES `line` WRITE;
/*!40000 ALTER TABLE `line` DISABLE KEYS */;
INSERT INTO `line` VALUES (4,'tuyến 1',6,7,0),(5,'tuyến 2',6,8,0),(6,'tuyến 3',6,9,0);
/*!40000 ALTER TABLE `line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (77,'Customer'),(78,'Employee'),(79,'driver');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point`
--

DROP TABLE IF EXISTS `point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `point` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point`
--

LOCK TABLES `point` WRITE;
/*!40000 ALTER TABLE `point` DISABLE KEYS */;
INSERT INTO `point` VALUES (6,'TP Hồ Chí Minh'),(7,'TP Vĩnh Long'),(8,'TP Tây Ninh'),(9,'Đà Lạt'),(10,'Vũng Tàu');
/*!40000 ALTER TABLE `point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customer_id` bigint DEFAULT NULL,
  `employee_id` bigint DEFAULT NULL,
  `trip_id` bigint DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_ticket_trip_id_e58b726b_fk_app_trip_id` (`trip_id`),
  KEY `app_ticket_customer_id_9f11fd4b_fk_app_user_id` (`customer_id`),
  KEY `app_ticket_employee_id_bb25f7f5_fk_app_user_id` (`employee_id`),
  CONSTRAINT `app_ticket_customer_id_9f11fd4b_fk_app_user_id` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`),
  CONSTRAINT `app_ticket_employee_id_bb25f7f5_fk_app_user_id` FOREIGN KEY (`employee_id`) REFERENCES `user` (`id`),
  CONSTRAINT `app_ticket_trip_id_e58b726b_fk_app_trip_id` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (19,19,18,6,'2021-07-30 14:49:39.000000'),(20,19,18,8,'2021-07-30 14:49:39.000000');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticketdetail`
--

DROP TABLE IF EXISTS `ticketdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticketdetail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `seat_position` varchar(2) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ticket_id` bigint NOT NULL,
  `vehicle_id` bigint NOT NULL,
  `current_price` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_ticketdetail_vehicle_id_dd2f3eaf_fk_app_vehicle_id` (`vehicle_id`),
  KEY `app_ticketdetail_ticket_id_86f379dc_fk_app_ticket_id` (`ticket_id`),
  CONSTRAINT `app_ticketdetail_ticket_id_86f379dc_fk_app_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`),
  CONSTRAINT `app_ticketdetail_vehicle_id_dd2f3eaf_fk_app_vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticketdetail`
--

LOCK TABLES `ticketdetail` WRITE;
/*!40000 ALTER TABLE `ticketdetail` DISABLE KEYS */;
INSERT INTO `ticketdetail` VALUES (14,'1',NULL,19,2,100000),(15,'3',NULL,20,4,100000);
/*!40000 ALTER TABLE `ticketdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `blank_seat` int NOT NULL,
  `driver_id` bigint DEFAULT NULL,
  `line_id` bigint DEFAULT NULL,
  `price` decimal(8,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_trip_driver_id_e5b4c114_fk_app_user_id` (`driver_id`),
  KEY `app_trip_line_id_c0545e25_fk_app_line_id` (`line_id`),
  CONSTRAINT `app_trip_driver_id_e5b4c114_fk_app_user_id` FOREIGN KEY (`driver_id`) REFERENCES `user` (`id`),
  CONSTRAINT `app_trip_line_id_c0545e25_fk_app_line_id` FOREIGN KEY (`line_id`) REFERENCES `line` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (6,'chuyến 1','2021-10-20 14:49:39.000000','2021-10-20 14:49:39.000000',4,16,4,0),(8,'chuyến 2','2021-07-30 14:49:39.000000','2021-07-30 14:49:39.000000',4,16,5,0),(9,'chuyến 3','2021-07-30 14:49:39.000000','2021-07-30 14:49:39.000000',4,17,6,0);
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `dob` datetime(6) DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `identity_card` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `number_phone` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (16,'123','driver1','nguyen','a','nguyena@gmail.com',1,NULL,NULL,NULL,NULL,NULL,NULL),(17,'123','driver2','tran','b','tranb@gmail.com',1,NULL,NULL,NULL,NULL,NULL,NULL),(18,'123','employee1','nguyen','c','rtetge@gmail.com',1,NULL,NULL,NULL,NULL,NULL,NULL),(19,'123','customer1','tran','d','iqjwhei@gmai.com',1,NULL,NULL,NULL,NULL,NULL,NULL),(20,'123','tranvana','tran van','a','tranvana@gmail.com',1,NULL,NULL,NULL,NULL,NULL,NULL),(21,'123','vantu','tu','van','vantu@gmail.com',1,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_user_user_permissions_user_id_permission_id_7c8316ce_uniq` (`user_id`,`permission_id`),
  KEY `app_user_user_permis_permission_id_4ef8e133_fk_auth_perm` (`permission_id`),
  CONSTRAINT `app_user_user_permis_permission_id_4ef8e133_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`),
  CONSTRAINT `app_user_user_permissions_user_id_24780b52_fk_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permissions`
--

LOCK TABLES `user_permissions` WRITE;
/*!40000 ALTER TABLE `user_permissions` DISABLE KEYS */;
INSERT INTO `user_permissions` VALUES (5,16,79),(6,17,79),(7,18,78),(8,19,77);
/*!40000 ALTER TABLE `user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `license_plate` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `seat` int NOT NULL,
  `vehicle_type_id` bigint DEFAULT NULL,
  `extra_changes` int NOT NULL,
  `driver_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_vehicle_license_plate_a26b8962_uniq` (`license_plate`),
  UNIQUE KEY `app_vehicle_driver_id_94d417de_uniq` (`driver_id`),
  KEY `app_vehicle_vehicle_type_id_4b6e48f8_fk_app_vehicletype_id` (`vehicle_type_id`),
  CONSTRAINT `app_vehicle_driver_id_94d417de_fk_app_user_id` FOREIGN KEY (`driver_id`) REFERENCES `user` (`id`),
  CONSTRAINT `app_vehicle_vehicle_type_id_4b6e48f8_fk_app_vehicletype_id` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (2,'59A1-123456',4,4,0,16),(4,'59A2-521322',4,4,0,17);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_type`
--

DROP TABLE IF EXISTS `vehicle_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name_type` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_type`
--

LOCK TABLES `vehicle_type` WRITE;
/*!40000 ALTER TABLE `vehicle_type` DISABLE KEYS */;
INSERT INTO `vehicle_type` VALUES (4,'Xe 4 chổ'),(5,'Xe 7 chổ');
/*!40000 ALTER TABLE `vehicle_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-20 19:28:36
