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
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `trip_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_feedback_trip_id_54e35c88_fk_app_trip_id` (`trip_id`),
  KEY `app_feedback_user_id_57be9fb8_fk_app_user_id` (`user_id`),
  CONSTRAINT `app_feedback_trip_id_54e35c88_fk_app_trip_id` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`),
  CONSTRAINT `app_feedback_user_id_57be9fb8_fk_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (4,'adasdasdas',10,23);
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `end_point_id` bigint DEFAULT NULL,
  `start_point_id` bigint DEFAULT NULL,
  `price` int NOT NULL,
  `popular_line` int DEFAULT '0',
  `kilometer` int DEFAULT NULL,
  `time` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_line_end_point_id_1fa1352d_fk_app_point_id` (`end_point_id`),
  KEY `app_line_start_point_id_0801ba8f_fk_app_point_id` (`start_point_id`),
  CONSTRAINT `app_line_end_point_id_1fa1352d_fk_app_point_id` FOREIGN KEY (`end_point_id`) REFERENCES `point` (`id`),
  CONSTRAINT `app_line_start_point_id_0801ba8f_fk_app_point_id` FOREIGN KEY (`start_point_id`) REFERENCES `point` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line`
--

LOCK TABLES `line` WRITE;
/*!40000 ALTER TABLE `line` DISABLE KEYS */;
INSERT INTO `line` VALUES (4,'tuyến 1',6,7,100000,1,132,2),(5,'tuyến 2',6,8,9000,0,0,1),(6,'tuyến 3',9,6,120000,1,308,6),(7,'tuyến 4',11,6,120000,1,180,4),(8,'tuyến 5',12,6,500000,1,434,8),(9,'tuyến 6',13,15,1500000,1,838,18);
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
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
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `picture` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point`
--

LOCK TABLES `point` WRITE;
/*!40000 ALTER TABLE `point` DISABLE KEYS */;
INSERT INTO `point` VALUES (6,'TP Hồ Chí Minh','https://res.cloudinary.com/docswnn1e/image/upload/v1637589331/tp-hcm_h06j32.jpg'),(7,'TP Vĩnh Long',NULL),(8,'TP Tây Ninh',NULL),(9,'Đà Lạt','https://res.cloudinary.com/docswnn1e/image/upload/v1637589715/lamdong_z1kpxg.jpg'),(10,'Vũng Tàu',NULL),(11,'Đạ Tẻh','https://res.cloudinary.com/docswnn1e/image/upload/v1637589735/IMG_0922_ygo9mo.jpg'),(12,'Nha Trang','https://res.cloudinary.com/docswnn1e/image/upload/v1637589715/nhatrang_wlmwpy.jpg'),(13,'Hà Nội','https://res.cloudinary.com/docswnn1e/image/upload/v1637588813/hanoi_ldnons.jpg'),(14,'Hải Phòng',NULL),(15,'Đà Nẵng',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (25,26,NULL,11,'2021-12-11 19:22:18.712000'),(26,26,NULL,11,'2021-12-11 19:24:49.439000'),(27,26,NULL,11,'2021-12-12 13:22:35.533000'),(28,26,NULL,11,'2021-12-12 13:36:30.356000'),(29,26,NULL,11,'2021-12-12 13:58:57.009000'),(30,26,NULL,11,'2021-12-12 14:06:21.979000'),(31,26,NULL,11,'2021-12-12 14:10:41.536000'),(32,26,NULL,11,'2021-12-12 14:20:42.685000'),(33,26,NULL,11,'2021-12-12 14:26:52.717000'),(34,26,NULL,11,'2021-12-12 14:33:15.483000'),(35,26,NULL,11,'2021-12-12 14:43:17.713000');
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
  `seat_position` int NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ticket_id` bigint NOT NULL,
  `vehicle_id` bigint NOT NULL,
  `current_price` int NOT NULL,
  `transId` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_ticketdetail_vehicle_id_dd2f3eaf_fk_app_vehicle_id` (`vehicle_id`),
  KEY `app_ticketdetail_ticket_id_86f379dc_fk_app_ticket_id` (`ticket_id`),
  CONSTRAINT `app_ticketdetail_ticket_id_86f379dc_fk_app_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`),
  CONSTRAINT `app_ticketdetail_vehicle_id_dd2f3eaf_fk_app_vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticketdetail`
--

LOCK TABLES `ticketdetail` WRITE;
/*!40000 ALTER TABLE `ticketdetail` DISABLE KEYS */;
INSERT INTO `ticketdetail` VALUES (21,2,'Lưu ý: Vui lòng đến có mặt trước giờ khỏi hành 15\'',25,5,9000,'2621926404'),(22,3,'Lưu ý: Vui lòng đến có mặt trước giờ khỏi hành 15\'',26,5,9000,'2621926406'),(23,10,'Lưu ý: Vui lòng đến có mặt trước giờ khỏi hành 15\'',27,5,9000,'2621929063'),(24,7,'Lưu ý: Vui lòng đến có mặt trước giờ khỏi hành 15\'',28,5,9000,'2621929088'),(25,17,'Lưu ý: Vui lòng đến có mặt trước giờ khỏi hành 15\'',29,5,9000,'2621929161'),(26,15,'Lưu ý: Vui lòng đến có mặt trước giờ khỏi hành 15\'',30,5,9000,'2621929170'),(27,21,'Lưu ý: Vui lòng đến có mặt trước giờ khỏi hành 15\'',31,5,9000,'2621929196'),(28,5,'Lưu ý: Vui lòng đến có mặt trước giờ khỏi hành 15\'',32,5,9000,'2621929212'),(29,16,'Lưu ý: Vui lòng đến có mặt trước giờ khỏi hành 15\'',33,5,9000,'2621929229'),(30,4,'Lưu ý: Vui lòng đến có mặt trước giờ khỏi hành 15\'',34,5,9000,'2621929265'),(31,1,'Lưu ý: Vui lòng đến có mặt trước giờ khỏi hành 15\'',35,5,9000,'2621929297');
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `blank_seat` int NOT NULL,
  `driver_id` bigint DEFAULT NULL,
  `line_id` bigint DEFAULT NULL,
  `extra_changes` decimal(8,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_trip_driver_id_e5b4c114_fk_app_user_id` (`driver_id`),
  KEY `app_trip_line_id_c0545e25_fk_app_line_id` (`line_id`),
  CONSTRAINT `app_trip_driver_id_e5b4c114_fk_app_user_id` FOREIGN KEY (`driver_id`) REFERENCES `user` (`id`),
  CONSTRAINT `app_trip_line_id_c0545e25_fk_app_line_id` FOREIGN KEY (`line_id`) REFERENCES `line` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (10,'Chuyến 1','2021-10-31 15:49:39.000000','2021-10-31 14:49:39.000000',22,24,4,0),(11,'Chuyến 1','2021-10-31 15:49:39.000000','2021-10-31 14:49:39.000000',21,24,5,0),(12,'Chuyến 1','2021-10-31 15:49:39.000000','2021-10-31 14:49:39.000000',23,24,6,0);
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
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `dob` datetime(6) DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `identity_card` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `number_phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `user_permission` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `user_permission_idx` (`user_permission`),
  CONSTRAINT `users_permission` FOREIGN KEY (`user_permission`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (23,'1234567','gianghuynh','giang','huynh','huyniuahsiduh@gmail.com',1,'2000-07-09 00:00:00.000000','male','477',NULL,NULL,NULL,77),(24,'$2a$10$C1S72YhZlrTQJWatqwbrF.gBBj0fNtrIw2uTuEkFq6bVwMVvg92Iq','giang1','huynh','giang','dsfdasd@gmail.com',1,'2000-07-09 00:00:00.000000',NULL,NULL,NULL,NULL,NULL,79),(25,'1234567','giang2','ghhhg','áddss','dsfdawsd@gmail.com',1,'2000-07-09 00:00:00.000000',NULL,NULL,NULL,NULL,NULL,78),(26,'$2a$10$LfTTVXeNFNSDqt10tn5AzOHR66V2c9YcM171oNbZOU59gJ2UExs/2','tduong','tu','duong van','vantu@gmail.com',1,NULL,NULL,'thành phố',NULL,'0713124131','https://res.cloudinary.com/docswnn1e/image/upload/v1639291206/eiwa04offchxrmnorwhg.png',77),(27,'$2a$10$dSpvkxwIW9t5k43sBeNsMejQLDjUIlTcqmWf.gF3QrNRGLUvNrCw2','giangne','giang','giang',NULL,1,NULL,NULL,NULL,NULL,'0913260623',NULL,77),(28,'$2a$10$C1S72YhZlrTQJWatqwbrF.gBBj0fNtrIw2uTuEkFq6bVwMVvg92Iq','giangne1','Guang','Gianggg','juygugyu@gmail.com',1,NULL,NULL,'447 Nguyen Van Cong p 33',NULL,'0913260623','https://res.cloudinary.com/docswnn1e/image/upload/v1637835323/ddudt4jtcuohylcqrgle.jpg',77),(29,'$2a$10$yToqZMneFgB.DrOocwaY5uqbcu4noi2Z3MUqr/SHVoJ1Pt4pI8p1e','tendangnhap','Hương','Đàm',NULL,1,NULL,NULL,NULL,NULL,'0913260666',NULL,77),(30,'$2a$10$HxZLrYJDUPef48jMcTGRM.23mpM9W2ea6SvU0cYGlSF68LGIYPP0S','giangtest','test','Test','test@gmail.com',1,NULL,NULL,'ÃÂ¡ddq212312312',NULL,'0913260666',NULL,77),(34,'$2a$10$XKjQus/AN84mlde0An/30OughYhQWElT1TKPxLoT6BEjHmfek5H2y','zxc','TÆ°','TÆ°',NULL,1,NULL,NULL,NULL,NULL,'0913260666',NULL,77),(35,'$2a$10$lbHoaxSYhhKtb4Y1CMy3hejbS9XkS3ioEZHPLn4F.vP.DaEvKHjGi','tyu','NÃ³','Máº¹',NULL,1,NULL,NULL,NULL,NULL,'0913260623',NULL,77);
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
  `license_plate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (5,'59A1-123456',30,4,0,24);
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
  `name_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
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

-- Dump completed on 2021-12-12 15:31:11
