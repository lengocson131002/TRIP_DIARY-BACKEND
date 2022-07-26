-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 20.70.17.171    Database: trip_diary
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `comment_root_id` bigint DEFAULT NULL,
  `trip_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhml0pkjjiqp0kp7l2gfsst08u` (`comment_root_id`),
  KEY `FK9jail3uo4vf5uie24uyic5ud9` (`trip_id`),
  KEY `FK8kcum44fvpupyw6f5baccx25c` (`user_id`),
  CONSTRAINT `FK8kcum44fvpupyw6f5baccx25c` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK9jail3uo4vf5uie24uyic5ud9` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKhml0pkjjiqp0kp7l2gfsst08u` FOREIGN KEY (`comment_root_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (32,'chán lámư','2022-07-06 04:41:02',NULL,41,10),(33,'này dùng đuọc chưa','2022-07-06 04:45:37',NULL,22,2),(37,'Allo','2022-07-06 06:40:46',NULL,18,8),(39,'allo ngon','2022-07-06 06:54:03',37,18,8),(42,'allo','2022-07-06 07:07:31',37,18,8),(45,'ngon lieefn','2022-07-06 07:15:56',37,18,8),(46,'ngon lieefn','2022-07-06 07:16:58',37,18,8),(47,'Alltess','2022-07-06 07:18:05',37,18,15),(48,'allo','2022-07-06 07:18:21',NULL,18,15),(50,'gfdsgg','2022-07-06 07:20:47',37,18,15),(55,'Vũng Tàu vui quá ạ','2022-07-07 13:25:04',NULL,34,3),(57,'Hà Nội đẹp tuyệt ạ','2022-07-07 13:26:35',NULL,27,3),(58,'Hạ Long xinh đẹp','2022-07-07 13:26:57',NULL,37,3),(59,'saaaaa','2022-07-09 10:51:09',NULL,34,12),(60,'mai gà','2022-07-09 10:51:14',NULL,34,12),(61,'sssssss','2022-07-09 10:51:27',NULL,34,12),(62,'ồ thế à','2022-07-12 16:44:10',58,37,8),(63,'Trip hay quá ạ :))))','2022-07-12 17:09:00',NULL,34,8),(64,'123jbh','2022-07-13 07:41:50',NULL,50,20),(65,'guyb','2022-07-13 07:42:05',64,50,20),(67,'dfdsf','2022-07-14 01:21:51',64,50,8),(68,'dsff','2022-07-14 01:21:58',64,50,8),(69,'đi chưa mà biết','2022-07-14 07:32:41',32,41,2),(70,'đi sớm về sớm','2022-07-14 07:40:26',32,41,10),(71,'nhắn cái này mà được thông báo thì ngon nhở','2022-07-14 07:41:28',58,37,2),(72,'Dẫn về thăm nhà với đê, hấp dẫn quá','2022-07-14 07:42:50',NULL,16,2),(73,'hello update','2022-07-15 07:26:31',NULL,50,8),(74,'sao đẹp bằng Mai','2022-07-15 08:07:52',57,27,8),(76,'fsdfs','2022-07-26 15:46:01',NULL,57,8),(77,'fdsf','2022-07-26 15:46:06',76,57,8),(78,'fdsfs','2022-07-26 15:46:09',NULL,57,8),(79,'fdsfds','2022-07-26 15:46:18',NULL,57,8),(80,'fdsfdsf','2022-07-26 15:46:35',79,57,8),(81,'fdsfds','2022-07-26 15:46:41',NULL,57,8),(89,'dsdsd','2022-07-26 16:11:02',NULL,33,8),(91,'adas','2022-07-26 16:12:07',NULL,33,8),(92,'adas','2022-07-26 16:12:11',89,33,8),(93,'dasd','2022-07-26 16:12:14',89,33,8);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destination`
--

DROP TABLE IF EXISTS `destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `destination` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destination`
--

LOCK TABLES `destination` WRITE;
/*!40000 ALTER TABLE `destination` DISABLE KEYS */;
INSERT INTO `destination` VALUES (4,'Hà Nội, Hoàn Kiếm, Hanoi, Vietnam',21.027964,105.8510132),(9,'Hà Nội, Hoàn Kiếm, Hanoi, Vietnam',21.027964,105.8510132),(19,'Hanoi, Hoàn Kiếm, Hanoi, Vietnam',21.027964,105.8510132),(23,'Da Lat, Lam Dong, Vietnam',11.9404192,108.4583132),(26,'Da Lat, Lam Dong, Vietnam',11.9404192,108.4583132),(51,'Paris, France',48.856614,2.3522219),(65,'Vũng Tàu, Tỉnh Bà Rịa-Vũng Tàu, 797979, Việt Nam',10.3486485,107.0765028),(71,'Hanoi, Vietnam',21.0294498,105.8544441),(97,'Hạ Long Bay, Ha Long, Hạ Long City, Vietnam',20.9084384,107.0682782),(98,'Da Lat, Lam Dong, Vietnam',11.9404192,108.4583132),(106,'Istanbul, Marmara Region, Türkiye',41.0766019,29.052495),(107,'Hanoi, Vietnam',21.0294498,105.8544441),(133,'Thành phố Hội An, Tỉnh Quảng Nam, Việt Nam',15.8880397,108.33674224633728),(145,'Hanoi, Vietnam',21.0294498,105.8544441),(146,'Buon Ma Thuot, Dak Lak, Vietnam',12.6661944,108.0382475),(154,'Đà Nẵng, Phường Vĩnh Trung, Thanh Khê District, Da Nang, 236, Vietnam',16.068,108.212),(157,'Da Nang, Vietnam',16.12599015,108.21878891804153),(158,'Mộc Châu District, Son La province, Vietnam',20.87105085,104.62917893497627),(169,'Nha Trang, Khánh Hòa, Việt Nam',12.20821415,109.28847655585815),(170,'Vũng Tàu, Tỉnh Bà Rịa-Vũng Tàu, 797979, Việt Nam',10.3486485,107.0765028),(173,'Đà Nẵng, Phường Vĩnh Trung, Thanh Khê District, Da Nang, 236, Vietnam',16.068,108.212),(178,'Đà Nẵng, Phường Vĩnh Trung, Thanh Khê District, Da Nang, 236, Vietnam',16.068,108.212),(179,'Vung Tau, Vung Tau City, Ba Ria-Vung Tau Province, 797979, Vietnam',10.3486485,107.0765028),(180,'Quảng trường Lâm Viên, Trần Quốc Toản, Dalat, Lâm Đồng Province, 02633, Vietnam',11.9388409,108.4450134),(185,'Ho Chi Minh City',10,20),(187,'HCM city',0,0),(188,'Ho Chi Minh City, Vietnam',10.7758439,106.7017555),(189,'Hạ Long City, Quang Ninh Province, 36000, Vietnam',20.9528365,107.0800003),(190,'HCM city',0,0),(191,'HCM city',0,0);
/*!40000 ALTER TABLE `destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (16),(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `visit_place_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKai0u0sirs8v77g386tmyv1axl` (`visit_place_id`),
  CONSTRAINT `FKai0u0sirs8v77g386tmyv1axl` FOREIGN KEY (`visit_place_id`) REFERENCES `visit_place` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (2,'','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2F960x0.jpg4cde8685-edec-4333-9b81-9802deb2e5ac?alt=media&token=bfdbfa40-bc88-4d0c-9519-03e2f8355699',2),(3,'','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Fwallpaperflare.com_wallpaper%20(2).jpg41acbee9-c07d-4cb4-b43e-69b7f4854f26?alt=media&token=5600b6e9-b9a7-4bda-97fb-7bf26b2e03cc',2),(78,'','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Fmaxresdefault.jpeg6be37c38-47f2-43ad-a464-1a82d050e0f9?alt=media&token=d3a6ce1f-bb25-4004-babe-1ecbfcf9b648',186),(94,'','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Fve-may-bay-buon-me-thuot.jpgb7ee8b83-8666-44d0-ac67-b6034d8911ae?alt=media&token=c2ce9699-16f6-4750-8e21-42130f08082b',210),(95,'','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Fhoa-ban-moc-chau-5.jpg32805a5b-52be-4cc3-80a8-5b512722fffc?alt=media&token=0548125f-0abd-457c-b3b2-cc16ef1ffc6d',218),(96,'','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Fdownload.jpgb9d94acf-220b-4b97-b484-cfb58a93a3f1?alt=media&token=e1eb319f-1c57-48c5-9012-8f6180410377',218),(115,'','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2F49828B9F-C3A5-4DD0-BD14-0A87BDE39E17.heicec9b5b82-d566-47ce-bc18-eeb134a6f26d?alt=media&token=7eaf37fe-a081-4aa8-ade9-a975ef79ed8c',243),(116,'','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2F4AF9D576-0633-4B35-86B3-483075395192.heic90b705ec-9560-4dc1-8c67-82012acb617b?alt=media&token=f5da26e5-eb99-4ddc-bb98-6577c18bb77b',243),(117,'','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2F4FA95E31-BC5A-43BA-94B0-41720273E769.heic74606c3c-5a18-4ef9-85ff-2b40e457dce9?alt=media&token=06ac13ea-a7e6-4dfa-8464-d0d9a0719294',243),(118,'','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2F49828B9F-C3A5-4DD0-BD14-0A87BDE39E17.heicf18efbea-8912-49b7-868a-6197bd1bc47a?alt=media&token=3863687d-07aa-44e8-bd37-3ca6e85986d1',243),(119,'','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2F69E461F5-3651-4793-92F3-8FE494C68A63.heic3a53151d-bf03-4d41-b6ae-0d33ebf885bd?alt=media&token=d5208775-3661-4011-a43f-9ed942a400f9',243),(120,'','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Ft%E1%BA%A3i%20xu%E1%BB%91ng.jpgecbb0ad7-06ca-4011-af87-b67230f1c0f6?alt=media&token=5635e1d6-49c7-432a-999f-8cff43ee5537',246),(121,'','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Ft%E1%BA%A3i%20xu%E1%BB%91ng.jpgc982a85d-d3d3-4068-9389-c2c1e0fe0c3c?alt=media&token=a4894591-cada-48a7-adbc-d94f44d0fd72',246),(130,'','strinhttp://t3.gstatic.com/licensed-image?q=tbn:ANd9GcStlRiRt8kZMjCnjU8V0pMnjyJEzKsdjtDnvJI6xBPGG4oDNp7ufMiGYgmQ8PHpbcYgbmPqJ5MITD8dZ0hP5J8',256),(131,'','strinhttp://t3.gstatic.com/licensed-image?q=tbn:ANd9GcStlRiRt8kZMjCnjU8V0pMnjyJEzKsdjtDnvJI6xBPGG4oDNp7ufMiGYgmQ8PHpbcYgbmPqJ5MITD8dZ0hP5J8',257),(134,'Place 1 description','./image/place1.png',260),(135,'Place 1 description','./image/place1.png',261),(136,'','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Ferik-mclean-ZRns2R5azu0-unsplash%20(1).jpg1069a69c-46dc-4939-b433-250da6ed415b?alt=media&token=91f1a98c-3d0c-4d34-9b73-44b6d36a01ff',266),(137,'','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Ferik-mclean-ZRns2R5azu0-unsplash.jpg4debee3a-17d8-4953-8d7a-07b436f31736?alt=media&token=81578e57-a282-4c5b-b9a1-44d1f05d0056',266),(138,'Place 1 description','./image/place1.png',268),(139,'Place 1 description','./image/place1.png',269),(140,'Place 1 description','./image/place1.png',270),(141,'Place 1 description','./image/place1.png',271);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_table`
--

DROP TABLE IF EXISTS `like_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `like_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `trip_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKghhnmvc97bs13jp7euknfx2a6` (`trip_id`),
  KEY `FK3swf0acdv6s7vn900ufg7oj2p` (`user_id`),
  CONSTRAINT `FK3swf0acdv6s7vn900ufg7oj2p` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKghhnmvc97bs13jp7euknfx2a6` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_table`
--

LOCK TABLES `like_table` WRITE;
/*!40000 ALTER TABLE `like_table` DISABLE KEYS */;
INSERT INTO `like_table` VALUES (4,18,15),(5,18,3),(6,37,3),(7,15,3),(9,47,16),(10,34,12),(22,16,8),(28,34,8),(30,41,2),(31,41,10),(33,37,2),(34,16,2),(36,50,8),(38,16,4);
/*!40000 ALTER TABLE `like_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `is_read` bit(1) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `trip_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5qb7kdu7bql8f6v75rrvi1i67` (`trip_id`),
  KEY `FKb0yvoep4h4k92ipon31wmdf7e` (`user_id`),
  CONSTRAINT `FK5qb7kdu7bql8f6v75rrvi1i67` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKb0yvoep4h4k92ipon31wmdf7e` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'2022-06-26 11:27:08.990000',_binary '','INVITATION',27,4),(2,'2022-06-26 11:27:45.221000',_binary '','INVITATION',28,4),(7,'2022-06-28 01:12:09.778000',_binary '','INVITATION',34,10),(9,'2022-06-28 05:56:59.826000',_binary '','INVITATION',36,12),(10,'2022-06-28 06:22:18.251000',_binary '','INVITATION',39,4),(12,'2022-07-06 04:28:42.792000',_binary '','INVITATION',41,10),(14,'2022-07-13 07:40:55.589000',_binary '','INVITATION',50,8),(15,'2022-07-14 00:01:05.131000',_binary '','COMING_TRIP',41,2),(16,'2022-07-14 00:01:10.154000',_binary '','COMING_TRIP',41,10),(17,'2022-07-16 00:01:06.808000',_binary '','COMING_TRIP',51,28),(19,'2022-07-18 19:02:52.241000',_binary '','INVITATION',50,15),(20,'2022-07-20 21:22:16.351000',_binary '\0','COMING_TRIP',56,8),(21,'2022-07-20 21:24:15.501000',_binary '','COMING_TRIP',56,8),(22,'2022-07-20 21:24:20.469000',_binary '','COMING_TRIP',57,8),(23,'2022-07-26 00:01:05.204000',_binary '\0','COMING_TRIP',48,12);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_token`
--

DROP TABLE IF EXISTS `password_reset_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_token` (
  `id` bigint NOT NULL,
  `expiry_date` datetime(6) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5lwtbncug84d4ero33v3cfxvl` (`user_id`),
  CONSTRAINT `FK5lwtbncug84d4ero33v3cfxvl` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_token`
--

LOCK TABLES `password_reset_token` WRITE;
/*!40000 ALTER TABLE `password_reset_token` DISABLE KEYS */;
INSERT INTO `password_reset_token` VALUES (6,'2022-07-17 11:06:29.111000','23824a0d-2a1d-4198-a8a7-e97fe4c59db1',20),(10,'2022-07-19 03:07:47.682000','1cde9bb7-6913-4135-88b6-45bbfd6f31e8',20),(11,'2022-07-19 17:40:09.608000','7ad40c24-4f96-42c7-946f-aa0a67a3bfe8',2),(12,'2022-07-20 08:33:31.359000','dcf97588-49e0-4284-858f-446155c7b534',20),(13,'2022-07-20 12:58:45.384000','e4116bdd-931f-40e4-8c26-2e8f8a26900c',35),(14,'2022-07-21 05:39:42.961000','56b1158b-bdc2-4bb0-8098-f27e1c7bfe0b',35);
/*!40000 ALTER TABLE `password_reset_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_item`
--

DROP TABLE IF EXISTS `price_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `price_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `item` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `trip_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjgnna7iiempba346tr4dquc9s` (`trip_id`),
  CONSTRAINT `FKjgnna7iiempba346tr4dquc9s` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_item`
--

LOCK TABLES `price_item` WRITE;
/*!40000 ALTER TABLE `price_item` DISABLE KEYS */;
INSERT INTO `price_item` VALUES (10,'Clothes',50,15),(13,'Ma tau',50000,18),(19,'taxi',10,22),(28,'Camera',250000,37),(29,'Clothes',1000000,37),(30,'Rau',5,14),(37,'bbb',11111,38),(38,'Item',23,39),(39,'item2',23,39),(65,'Ngày 1',300,33),(66,'Ngày 2',500,33),(71,'Camera',10,36),(72,'ticket',1000,41),(73,'hotel',2000,41),(74,'food',3000,41),(76,'Ticket',500000,54),(87,'Buy tent',10,56),(88,'Buy food',20,56),(89,'Buy swimming suit',25,56),(92,'Item 1 ',10,58),(93,'Item 2 ',10,58),(94,'Item 1 ',10,55),(95,'Item 2 ',10,55),(96,'Item 1 ',10,57),(97,'Item 2 ',10,57);
/*!40000 ALTER TABLE `price_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'USER'),(2,'ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `trip` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `begin_date` date DEFAULT NULL,
  `concurrency_unit` varchar(255) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `note` longtext,
  `notify_before` int DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `prepared_list` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `transportation` varchar(255) DEFAULT NULL,
  `destination_id` bigint DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbi8kx7b2oumil3iksafnbyp5o` (`destination_id`),
  CONSTRAINT `FKbi8kx7b2oumil3iksafnbyp5o` FOREIGN KEY (`destination_id`) REFERENCES `destination` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (14,'2022-06-20','$',NULL,'Dalat chilling trip','<p>&lt;3</p>\n',1,'vungocmai322','Backpack,Nguoiiu (?),Camera,Money','PRIVATE','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Fkinh-nghiem-di-da-lat-thang-12-1.jpgdf878998-f896-4c7b-ad83-743448c7c6d9?alt=media&token=d2167ea0-39f9-4822-986c-7023f599bdb5','CAR',98,''),(15,'2022-06-24','$',NULL,'LostinHanoi ','<p style=\"text-align:center;\"><span style=\"font-family: Verdana;\"><strong><em>iu Ha Noi</em></strong></span></p>\n',1,'vungocmai322','Suitcase,Camera,Money,Phone,Suncream,Hat,Clothes','PRIVATE','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Fvietnam-travel-5.jpg7205bc6e-fdbc-45fd-8361-09817e07b8ae?alt=media&token=019ad946-74c6-4388-85f8-f4711198c0db','PLANE',19,NULL),(16,'2022-06-20','$',NULL,'buon ma thuoc','<p></p>\n',2,'longpc','','PUBLIC','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Fve-may-bay-buon-me-thuot.jpg0ff8dc8a-58a3-4e94-9f2e-d0004fccff14?alt=media&token=26296c1e-21fa-412c-8968-e035c5000bf9','ON_WALK',146,''),(17,'2022-06-20','$',NULL,'Dalat Deep Trip',NULL,1,'vungocmai322','','PRIVATE','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Fvuon-hoa-cam-tu-cau-da-lat-1.jpeg430326d0-31b2-405f-b124-d6bc6c1fa5e7?alt=media&token=f4771cd1-4392-49ba-aea1-f71a7702f8b3','CAR',23,NULL),(18,'2022-06-20','VND',NULL,'Da Lat',NULL,3,'quannm','Xa beng,','PUBLIC','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Flonghuw.jpg10d5fed4-1460-43ab-85bd-77f1078f0b21?alt=media&token=32b9c5f8-bebc-4263-9447-89e8856a9817','ON_WALK',26,NULL),(22,'2022-09-22','$',NULL,'ngocmaiinparis','<p>What a nice trip!</p>\n',1,'vungocmai322','Camera,Pink suitcase ','PUBLIC','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Feiffel-tower-view-from-the-street-france-f9te_l.jpg1f506d92-8cd3-409a-b463-3bd9f3d9a9b8?alt=media&token=a736ad0c-16e7-468c-89c5-9c8c89a86d7e','PLANE',51,NULL),(26,'2022-06-25','$',NULL,'Di Vung Tau',NULL,4,'quannm','','PRIVATE',NULL,'SHIP',65,''),(27,'2022-06-25','$',NULL,'hanoi',NULL,1,'vungocmai322','','PUBLIC','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Fc46434fb9b4f683e5ea29d0e3f79d7ef.gif99ce28c7-8d9d-4088-ae08-907fe89ca4d4?alt=media&token=244c2db8-4ccc-4575-998a-76758ddd2996','PLANE',145,''),(28,'2022-06-25','$',NULL,'hanoi2',NULL,4,'vungocmai322','','PRIVATE',NULL,'TRAIN',71,NULL),(33,'2022-06-29','$',NULL,'Hội An chơi đê','<p>Nhớ đi cùng người yêu nhá ›?</p>\n',2,'thanhviennguyen01','Tiền và Tiền,Nhớ lại điều 1','PUBLIC','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Fmaxresdefault.jpegc49428c3-0cf9-48ba-8e46-383a244c6a02?alt=media&token=9b0a71ab-c0c1-4a12-82a2-7028741a5cb2','BIKE',133,'mai đi chơi nhá'),(34,'2022-06-29','$',NULL,'Vũng Tàu',NULL,3,'thanhviennguyen01','','PUBLIC','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Fhinh-anh-vung-tau-ve-dem-02.pngc28b6d52-8f5d-4a69-92af-49ccd3638ef7?alt=media&token=9af15ecc-63cf-4cc8-a7bb-f303fcae7c97','BUS',170,''),(36,'2022-06-30','$',NULL,'Blooming Days','<p>Wonderful</p>\n',3,'vungocmai322','Backpack,Camera,Food,Books,Clothes','PUBLIC','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Fhoa-ban-moc-chau-5.jpg32deea2e-045b-408a-9228-4a4186078ed3?alt=media&token=2ab8497c-23b8-4243-bd2a-c8d367b83014','MOTORBIKE',158,'Love the nature'),(37,'2022-07-05','VND',NULL,'Ha Long Trip','<p>Have fun</p>\n',7,'vungocmai322','Bikini,Camera,Drug,Suitcase','PUBLIC','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2FVinh-Ha-Long-Thong-tin-tong-hop-can-biet-930x540.jpg5250b33e-0275-4aee-8c6b-203c41d747eb?alt=media&token=c2819841-0da4-4abf-8ee6-6e7efd48d44a','SHIP',97,''),(38,'2022-06-28','$','2022-06-30','Turkey','<p>Quan xin chao Tho Nhi Ky</p>\n',7,'quannmse161529','aaa','PRIVATE','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Fistanbul.jpg13a1a535-d27f-466a-b58b-c0f229871740?alt=media&token=cdec2a15-ecd0-4c9d-b09b-1da713629aaf','BIKE',106,''),(39,'2022-07-01','$','2022-07-08','Trip with my friends','<ul>\n<li>Some note</li>\n</ul>\n',2,'vungocmai322','Backpack,Money,Girlfriend','PRIVATE',NULL,'SHIP',107,''),(41,'2022-07-16','$','2022-07-19','Nha Trang ','<p>Cái này là ok nhất ?&nbsp;</p>\n<p>alo</p>\n',2,'thanhviennguyen01','sunscreen,camera,sleeping bag,Clothes,Toiletries,Footwear,Electric devices,Snacks,Sunglasses, swimming goggles,Bag for dirty clothes,Universal power socket,Travel map,Sightseeing schedule handbook,Money and identity papers,Sports shoes and doll shoes','PUBLIC','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Ffa4e69e89fe0e6594c0f2463f2b49c64.gif08103154-5619-4184-81ed-2391ab5f00b3?alt=media&token=e54850a6-6077-458b-a96b-a3f91d2cbce3','SHIP',169,''),(47,'2022-10-01','$','2022-10-30','DA NANG TRIP',NULL,1,'ngothiep2412','','PRIVATE',NULL,'CAR',154,''),(48,'2022-07-29','$','2022-07-31','Đi đà nẵng','<p><sup><code><del><strong><em><ins>ágsagsgdsgdsg</ins></em></strong></del></code></sup></p>\n',3,'quannmse161529','dsgdsgsdg','PUBLIC',NULL,'ON_WALK',157,''),(50,'2022-07-14','$','2022-07-22','Trip to vũng tàu',NULL,6,'hungvu','','PRIVATE',NULL,'TRAIN',179,''),(51,'2022-07-18','$',NULL,'Đi Đà Lạt',NULL,2,'huonghtt','','PRIVATE',NULL,'PLANE',180,''),(53,'2022-07-16','$',NULL,'Da Nang Trip',NULL,1,'ngoclong2904','','PRIVATE',NULL,'PLANE',173,NULL),(54,'2022-07-16','VND',NULL,'Da Nang','<p>Join Trip</p>\n',1,'thiepnxse151074','','PRIVATE',NULL,'PLANE',178,''),(55,'2022-07-20','VND','2022-07-22','Trip to Ho Chi Minh City of lnson','Some description',2,'leson131002','Backpage,Cloth,Money','PUBLIC','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Fhakon-sataoen-qyfco1nfMtg-unsplash%20(1)%20(1).jpgf3e4baee-fa6c-4094-a3d8-4f60e9aa8fee?alt=media&token=67805a13-f573-488d-b9b1-0a258e029a18','PLANE',190,'TRIP IS SO FUNNY'),(56,'2022-07-22','VND','2022-07-22','Trip with family','This is a trip to ha noi, viet nam',2,'leson131002','Backpage,Food,Money,Drink','PUBLIC','http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcStlRiRt8kZMjCnjU8V0pMnjyJEzKsdjtDnvJI6xBPGG4oDNp7ufMiGYgmQ8PHpbcYgbmPqJ5MITD8dZ0hP5J8','CAR',185,NULL),(57,'2022-07-22','VND','2022-07-22','Trip to Ho Chi Minh City of lnson','Some description',2,'leson131002','Backpage,Cloth,Money','PUBLIC','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Ferik-mclean-ZRns2R5azu0-unsplash%20(1).jpg50d13acb-8950-4cf7-9d5c-cdf211c9233c?alt=media&token=b2b5bb4a-0f7a-4197-97ef-f30f9acbe2bb','PLANE',191,'TRIP IS SO FUNNY'),(58,'2022-07-22','VND','2022-07-22','Trip to Ho Chi Minh City of lnson','Some description',2,'leson131002','Backpage,Cloth,Money','PUBLIC','./image/image.png','PLANE',187,'TRIP IS SO FUNNY'),(59,'2022-07-30','$','2022-07-31','Week-end in Sai Gon','<p><em>Sai Gon has changed my mind every day, every moment. But the unchangeable thing is its love for all the people who live, work, and fall in love in Sai Gon.</em></p>\n',1,'vungocmai322','','PUBLIC','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2F1-16511131460381057426391-1652172704.jpge924c4a7-d789-4027-b2ac-446e35f00c09?alt=media&token=598ee89e-8309-4c91-97c6-fe57f490ac10','BIKE',188,'A Sai Gon you have neva known before'),(60,'2022-07-26','$','2022-07-29','Trip to Ha Long with my family',NULL,2,'leson131002','ITem 1,tỵy,jfgj,fjfg,fgjf,fj,fgjgfj,fgjgfj,fgj,fgj,fgjgf,fgjgf,fgj,jgf,j','PRIVATE',NULL,'BUS',189,'');
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `verify_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKsb8bbouer5wak8vyiiy4pf2bx` (`username`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'thanhviennguyen01@gmail.com','$2a$10$3CG6V0NNgphdt109Z8RH1uTN3krTRs4v2/fPHNLFqT0JoP84F8siu','ACTIVE','thanhviennguyen01',NULL),(3,'vungocmai322@gmail.com','$2a$10$csKnvcVB4EED6IuobEe4mODS7yDSywUE3j9ypFu2uBAzD8TTFr6NG','ACTIVE','vungocmai322',NULL),(4,'longnlp14@gmail.com','$2a$10$JXprhr2m0m5plwAgwo4EBe.dPbs4wsWq/1Rw5a0gWg2Kz6GfGWjAK','ACTIVE','longpc','ffa1f06a-650a-41f4-a2cf-7273b159ceff'),(8,'leson131002@gmail.com','$2a$10$G3pwX1/Q4NlB2uBXl.7wseYnD0HM.Z1skH4F8T1FfbJtDC/gpXN6G','ACTIVE','leson131002',NULL),(9,'nmquanvip2@gmail.com','$2a$10$9ILNiCLrxovB8lh8Taqp6eNEaGLWfdEsMZ94Yp3KI77bkjzvuN9L.','ACTIVE','quannm',NULL),(10,'thanhtungnguyen010202@gmail.com',NULL,'ACTIVE','thanhtungnguyen010202',NULL),(11,'vienntse150468@fpt.edu.vn',NULL,'BLOCKED','vienntse150468',NULL),(12,'quannmse161529@fpt.edu.vn',NULL,'ACTIVE','quannmse161529',NULL),(14,'ngocmaivu0302@gmail.com','$2a$10$JSIPFbVWIJF/l0fFaQQDQ.go8HBn/kB/bJjgyBar.AVkrgZbaU5Mm','ACTIVE','anothernmai',NULL),(15,'sonlnse160171@fpt.edu.vn','$2a$10$aCE0Q3WYj7.R.VIjwbOYHOlh9icRDvoKYpRhaOsIC.PbIEmebB6ii','ACTIVE','sonlnse160171',NULL),(16,'ngothiep2412@gmail.com','$2a$10$uLXKWwkkRTx72vH6EcmYtOYnYuS5XZ4Vdbsw4zrsemkwBEmq3cCvC','ACTIVE','ngothiep2412',NULL),(17,'123@gmail.com','$2a$10$Bg9fiakDucdEVAec4Yf4Au2n8RSYV5KW18wuqgN9uOu0SYkyK14DG','INACTIVE','test123','08bccba8-59cf-4828-a37a-49012c7642bf'),(18,'1234@gmail.com','$2a$10$GpcMKhwSa0p8ZlYLTgWGM.afd188ux7cuyEgriP8ytG9CdoqC5Y.W','INACTIVE','test1234','1b3f2c41-3d51-48f7-b8d8-2a81fc25602a'),(19,'123576@gmail.com','$2a$10$AaasEdiTLfCmykYIsmpOgu9OqMYmidiDdoDzgd.XBCY.d3N/pobCq','INACTIVE','test12345','2ca083ca-fd28-419f-809c-7c2883d16f77'),(20,'vonglaucac2@gmail.com','$2a$10$LxZO9EVtBlqBiKw0KAQ3g.83SRqRfh4DRXJiBRwZuoTuP6jwjgD1u','ACTIVE','hungvu',NULL),(21,'thiepnxse151074@fpt.edu.vn',NULL,'ACTIVE','thiepnxse151074',NULL),(23,'hungvmse161402@fpt.edu.vn',NULL,'ACTIVE','hungvmse161402',NULL),(28,'huonghttse160194@fpt.edu.vn','$2a$10$qHlEUbjIge4zQbpcZbPateGXZmnvGBIAwzdqOpzNbY2WdR1QxNS8W','ACTIVE','huonghtt',NULL),(29,'capngoclong@gmail.com','$2a$10$fb//Pzye0siwenXZu8xZ0.pBZ9xUwPRKqK/.qnlXmKPrB2u7oW9dW','ACTIVE','ngoclong2904',NULL),(30,'lengocson01667537978@gmail.com',NULL,'ACTIVE','lengocson01667537978',NULL),(31,'kaitosonada@gmail.com',NULL,'ACTIVE','kaitosonada',NULL),(32,'longlcnse150508@fpt.edu.vn','$2a$10$tHUOd1e3vd61eZpc9OCQW.8t6Zp.qrP/GSUvBEOAfXwiFGVa2ycmW','ACTIVE','ngoclong2001',NULL),(33,'test4@gmail.com','$2a$10$p7HTUz6icPaTazezpFEiP.9bk4cclrNd8D/wnUep9WPPIs.2tWsN6','INACTIVE','nobita1234567','7611acc0-06e1-4027-a4eb-355547a6cd4a'),(34,'test@gmail.com','$2a$10$RjGrHDQV6Ms5eS.08hDUduJqkHMuam/T4lYjYDnPP7i29TLm/ySx2','BLOCKED','nobitaa','23d9ddb6-b281-4b4b-b6fe-090a63557e20'),(35,'thanhvien0201@gmail.com','$2a$10$jC15edzz8Ktm3SpHGYGEou.vXfOy.pm4Feiv.1t7vJmwkdIqALe/S','ACTIVE','thanhvien0201@gmail.com',NULL),(36,'test1@fpt.edu.vn','$2a$10$e.NuOrsLwNKNy9FYZIkgRe02otfQrbSPj4OE2oHb1z59jhCUlbg.W','INACTIVE','user1','b4c92f41-fbc5-4f2d-a036-6a537476e1cb'),(37,'leson13102002@gmail.com','$2a$10$cjMjzfSdT91epBM6x28UZObpbXA1QDYgC6TWcS6CqoytmDJm7b70G','ACTIVE','testuser',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `about_me` longtext,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `cover_image_url` varchar(255) DEFAULT NULL,
  `date_of_birth` datetime(6) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `profile_image_url` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn8pl63y4abe7n0ls6topbqjh2` (`user_id`),
  CONSTRAINT `FKn8pl63y4abe7n0ls6topbqjh2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (2,'<p>&nbsp;Ai đi chơi cùng không ?</p>\n','TP Hồ Chí Minh','Viet Nam','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Fmaxresdefault.jpeg46ecf8db-71bb-4565-a441-5b1a9e11d3a3?alt=media&token=c558aab0-6349-423d-b10e-6874aea155f7',NULL,'Nguyễn','UNDEFINED','Viên','0914730992','https://lh3.googleusercontent.com/a-/AOh14GgcabNjaIFdmS9wkRwRTMD-Q4bDHkmYo88orvCXtg=s96-c',2),(3,'<p><em>hi ?</em></p>\n','Quận 9','Viet Nam','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Fpexels-jv-buenconcejo-2719301.jpg4d0f4a13-426b-4ef1-92c9-324515badb3e?alt=media&token=b7db7dbd-cea1-408c-b7ce-0e3c2a899552','2002-03-18 00:00:00.000000','Ngoc Mai','UNDEFINED','Vu','0772850248','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2F63af987a2cf528462ae90e36c72f6e96.jpegb6f690f9-f9a4-40d6-89d0-4675d783cf50?alt=media&token=125db2da-aafe-478b-9fac-5549eb7ee10e',3),(4,'<p>long ddep trai hoc gioit ?</p>\n','Hồ Chí Minh','Vietnam','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Fanh-phi-hanh-gia-tuyet-dep.jpg27439c9c-f454-40da-8928-1fe78b1661c3?alt=media&token=6c9785b3-f689-4f65-b652-5e4c2e937197','2001-10-13 00:00:00.000000','trần','UNDEFINED','Long','0918889034','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Fpando.gif10a02080-1980-4863-944f-3db38b775a5c?alt=media&token=d477d60f-4dfc-4b5f-98f8-35de8d12f120',4),(8,'Some thing about me','HCM city','Laos','https://source.unsplash.com/random','2003-01-03 07:00:00.000000','Sơn','UNDEFINED','Le','03675379**','https://source.unsplash.com/random',8),(9,'***__~~`<span style=\"font-size: 18px;\">Hi vong Quan co ny</span>`~~__***__<span style=\"font-size: 18px;\"> ?</span>__?\n','Quan 3, TPHCM','Viet Nam','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2FScreenshot%202022-03-11%20131841.png13d42273-7887-43a8-92cf-b0e9c1499f3e?alt=media&token=be243621-700f-4195-a4ba-d32c124d7d2b',NULL,'Quan','UNDEFINED','Nguyen','0934630516','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2FScreenshot%202022-03-11%20131841.png42e8fa17-a11e-4856-867d-24e99b43f2d3?alt=media&token=e9c6e4d3-9265-4e40-9f60-09b0efe86d61',9),(10,'<p>Ai mời mình đi chơi đê ?</p>\n',NULL,NULL,'https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Fo%CC%9B%CC%80.gifc527c5b0-11aa-4f1a-b4cf-c784058d78f5?alt=media&token=6aa4b468-a124-422e-9cab-237a5d3f43c1',NULL,'Thanh ','UNDEFINED','Tung',NULL,'https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Ffa4e69e89fe0e6594c0f2463f2b49c64.gif550da3ee-b12b-4b24-8ab6-4e6946edc2f4?alt=media&token=a86c3266-646b-45d1-bf2a-67137b8f8de7',10),(11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://lh3.googleusercontent.com/a/AATXAJxKbTUGiVwtkg-PT2-ik-o_Vl2Tg1ckRwhbdaXPEw=s96-c',11),(12,'<p><code><del><strong><em><ins>Quân xìn chào mn</ins></em></strong></del></code> ????</p>\n',NULL,NULL,'https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2FScreenshot%202022-01-17%20124553.pngf1886982-60e6-4989-995a-947373a8edce?alt=media&token=cd2c663d-216b-43d4-9593-b754538cf91d',NULL,NULL,'UNDEFINED',NULL,NULL,'https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2FScreenshot%202022-01-17%20124553.png2deebb0a-a467-4888-92fa-c8325f740984?alt=media&token=443fa90c-bb4b-4f57-8988-42c7f197145b',12),(14,NULL,NULL,NULL,NULL,NULL,NULL,'UNDEFINED',NULL,NULL,NULL,14),(15,NULL,NULL,NULL,NULL,NULL,'Le Ngoc Son','UNDEFINED','(K16_HCM)',NULL,'https://lh3.googleusercontent.com/a/AATXAJzhOn6SHYwymC8RvUSioMCvipBO0wxIRuqmX_S8=s96-c',15),(16,'<p></p>\n','',NULL,NULL,NULL,'','UNDEFINED','',NULL,'https://lh3.googleusercontent.com/a/AItbvmm68_YVPsppevBiUalg3AsQ8kl1Ch9lIvKJDi6c=s96-c',16),(17,NULL,NULL,NULL,NULL,NULL,NULL,'UNDEFINED',NULL,NULL,NULL,17),(18,NULL,NULL,NULL,NULL,NULL,NULL,'UNDEFINED',NULL,NULL,NULL,18),(19,NULL,NULL,NULL,NULL,NULL,NULL,'UNDEFINED',NULL,NULL,NULL,19),(20,'<p><code><del><strong><em><ins>hello everyone??</ins></em></strong></del></code></p>\n',NULL,'','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Ft%E1%BA%A3i%20xu%E1%BB%91ng.jpg9e33e3b0-7fdd-40db-8971-6bc7a876d23c?alt=media&token=3a24d5b8-ce2e-4055-83a2-b8b8fd03d419',NULL,'123','UNDEFINED','123','asd12354@!#','https://firebasestorage.googleapis.com/v0/b/trip-diary-storage.appspot.com/o/images%2Ft%E1%BA%A3i%20xu%E1%BB%91ng.jpgf5752b26-2c7d-46af-b33f-1ad3918895be?alt=media&token=863f0cd4-583d-4f1c-9a13-dd99f7a4e66c',20),(21,NULL,NULL,NULL,NULL,NULL,'','UNDEFINED',NULL,NULL,'https://lh3.googleusercontent.com/a-/AFdZucodDIzY23nXWreMRN1GJwkomsg2XkeZbYRWUsRd=s96-c',21),(23,NULL,NULL,NULL,NULL,NULL,'Vu Manh Hung','UNDEFINED','(K16_HCM)',NULL,'https://lh3.googleusercontent.com/a/AItbvmkc8JNcGQbqH-TmTdG1Bc-2P2ursGW-hOJUqmf7=s96-c',23),(28,NULL,NULL,NULL,NULL,NULL,NULL,'UNDEFINED',NULL,NULL,NULL,28),(29,NULL,NULL,NULL,NULL,NULL,NULL,'UNDEFINED',NULL,NULL,NULL,29),(30,NULL,NULL,NULL,NULL,NULL,'Sơn','UNDEFINED','Lê',NULL,'https://lh3.googleusercontent.com/a-/AFdZucoZDWyBPrQtE--1ucFmNA6AtR_9fwPVuVNpbysKAw=s96-c',30),(31,NULL,NULL,NULL,NULL,NULL,'Anh','UNDEFINED','Trần đức',NULL,'https://lh3.googleusercontent.com/a/AItbvmnA1b0aWGAYu2GEJUf9lNr_I5kbuJFuV0pMWXED=s96-c',31),(32,NULL,'Ho Chi Minh',NULL,NULL,'2022-07-20 00:00:00.000000','','UNDEFINED',NULL,'ádasdasd',NULL,32),(33,NULL,NULL,NULL,NULL,NULL,NULL,'UNDEFINED',NULL,NULL,NULL,33),(34,'Some thing about me','HCM city','Vietnam','https://source.unsplash.com/random','2003-01-03 07:00:00.000000','Sơn','MALE','Le','03675379**','https://source.unsplash.com/random',34),(35,NULL,NULL,NULL,NULL,NULL,NULL,'UNDEFINED',NULL,NULL,NULL,35),(36,NULL,NULL,NULL,NULL,NULL,NULL,'UNDEFINED',NULL,NULL,NULL,36),(37,NULL,NULL,NULL,NULL,NULL,NULL,'UNDEFINED',NULL,NULL,NULL,37);
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (2,1),(3,1),(4,1),(8,1),(9,1),(10,1),(11,1),(12,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(23,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(2,2),(3,2),(4,2),(8,2),(9,2),(18,2),(23,2),(28,2),(29,2),(30,2),(31,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_trip`
--

DROP TABLE IF EXISTS `user_trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `user_trip` (
  `user_id` bigint NOT NULL,
  `trip_id` bigint NOT NULL,
  KEY `FKh2rnctmi0t9t8clnbi64x68yo` (`trip_id`),
  KEY `FK97hmjkqd2hgg1lmd4vctnsxob` (`user_id`),
  CONSTRAINT `FK97hmjkqd2hgg1lmd4vctnsxob` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKh2rnctmi0t9t8clnbi64x68yo` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_trip`
--

LOCK TABLES `user_trip` WRITE;
/*!40000 ALTER TABLE `user_trip` DISABLE KEYS */;
INSERT INTO `user_trip` VALUES (3,14),(3,15),(3,17),(9,18),(3,22),(4,16),(9,26),(3,27),(4,27),(3,28),(4,28),(2,33),(2,34),(10,34),(3,37),(3,36),(12,36),(12,38),(3,39),(4,39),(2,41),(10,41),(16,47),(12,48),(28,51),(29,53),(21,54),(20,50),(8,50),(15,50),(8,55),(8,56),(8,57),(8,58),(3,59),(8,60);
/*!40000 ALTER TABLE `user_trip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_place`
--

DROP TABLE IF EXISTS `visit_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `visit_place` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `visitday_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4sjul7gpa0qykdy1qj0a404sk` (`visitday_id`),
  CONSTRAINT `FK4sjul7gpa0qykdy1qj0a404sk` FOREIGN KEY (`visitday_id`) REFERENCES `visitday` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_place`
--

LOCK TABLES `visit_place` WRITE;
/*!40000 ALTER TABLE `visit_place` DISABLE KEYS */;
INSERT INTO `visit_place` VALUES (2,'Hà Giang, Ha Giang, Vietnam','Allo ',22.8025588,104.9784494,2),(3,'Hạ Long, Quảng Ninh, Vietnam','',20.9711977,107.0448069,2),(16,'Lăng Chủ tịch Hồ Chí Minh, Hùng Vương, Điện Biên, Ba Đình, Hanoi, Vietnam','',21.0368973,105.8346667,13),(17,'Phố đi bộ Hồ Gươm - Hồ Hoàn Kiếm | Hà Nội, Phố Lê Thái Tổ, Hang Trong, Hoàn Kiếm, Hanoi, Vietnam','',21.0313755,105.8510179,13),(18,'Cafe Cộng, Đường Nguyễn Văn Huyên, Quan Hoa, Cầu Giấy, Hanoi, Vietnam','',21.0381483,105.7974641,14),(19,'Bảo tàng Lịch sử Quốc gia, Đường Trần Quang Khải, French Quarter, Trang Tien, Hoàn Kiếm, Hà Nội, Vietnam','',21.0252973,105.8582472,14),(20,'Phố Cổ Hà Nội, Phố Hàng Ngang, Hàng Đào, Hoàn Kiếm, Hanoi, Vietnam','',21.0337567,105.8508515,15),(21,'Chùa Hương, Hương Sơn, Mỹ Đức, Hanoi, Vietnam','',20.6185437,105.7472071,15),(29,'Hồ Xuân Hương, Dalat, Lam Dong, Vietnam','warm',11.9584315,108.4750143,22),(30,'Đỉnh Langbiang, tt. Lạc Dương, Lạc Dương District, Lam Dong, Vietnam','cold',12.0467251,108.4402108,22),(31,'Chợ Đà Lạt, Nguyễn Thị Minh Khai, Phường 1, Thành phố Đà Lạt, Lam Dong, Vietnam','cool',11.9433812,108.4372021,22),(32,'Vườn Hoa Cẩm Tú Cầu, Cam Ly, Xuân Thọ, Thành phố Đà Lạt, Lam Dong, Vietnam','beautiful',11.9466593,108.5130063,23),(33,'Bao Dai Summer Palace 3, Đường Triệu Việt Vương, Phường 4, Thành phố Đà Lạt, Lam Dong, Vietnam','peaceful',11.930145,108.4295879,23),(38,'Hồ Xuân Hương, Dalat, Lam Dong, Vietnam','Di dao quanh ho va goi rua Hoan Kiem',11.9584315,108.4750143,26),(39,'Quán net, Đường Đào Duy Từ, Phường 4, Thành phố Đà Lạt, Lam Dong, Vietnam','vo net tam su cung voi Long ca',11.935823,108.4338562,26),(56,'Louvre Museum, Rue de Rivoli, Paris, France','',48.8606111,2.337644,57),(57,'Eiffel Tower, Paris, France','',48.85837009999999,2.2944813,57),(58,'Picasso museum, Rue de Thorigny, Paris, France','',48.8598775,2.362285,58),(59,'Benoit, Rue Saint-Martin, Paris, France','',48.858397,2.3501027,58),(70,'Vũng Tàu, Tỉnh Bà Rịa-Vũng Tàu, 797979, Việt Nam','',10.3486485,107.0765028,81),(90,'Ha Long, Hạ Long City, Quang Ninh Province, 36000, Vietnam','',20.9528365,107.0800003,102),(91,'Cát Bà, Cát Hải District, Haiphong, Vietnam','',20.7238375,107.0497924,103),(92,'Hồ Tuyền Lâm, Phường 4, Dalat, Lam Dong, Vietnam','Chup hinh',11.8998298,108.4298302,104),(93,'Chợ Đà Lạt, Nguyễn Thị Minh Khai, Phường 1, Thành phố Đà Lạt, Lam Dong, Vietnam','Mua rau',11.9433812,108.4372021,104),(94,'Ga Đà Lạt, Nguyễn Trãi, Phường 10, Thành phố Đà Lạt, Lam Dong, Vietnam','Chup hinh',11.9413936,108.454213,105),(95,'Thác Datanla, Đèo Prenn, Phường 3, Thành phố Đà Lạt, Lam Dong, Vietnam','Di xe truot xuong thac',11.9006175,108.44899,105),(120,'Istanbul, Marmara Region, Türkiye','',41.0766019,29.052495,127),(121,'Istanbul, Fatih, Istanbul, Marmara Region, 34126, Türkiye','',41.0091982,28.9662187,127),(122,'Ankara, Central Anatolia Region, 06420, Türkiye','',39.9207886,32.8540482,128),(123,'Ankara, Hipodrom Caddesi, Hacı Bayram Mahallesi, Altındağ, Ankara, Central Anatolia Region, 06630, Türkiye','',39.9360124,32.8424903,128),(124,'Duy Tân, Trảng Bàng, Trang Bang, Trảng Bàng Town, Tay Ninh province, Vietnam','',11.0280734,106.359871,130),(125,'Ha Long, Hạ Long City, Quang Ninh Province, 36000, Vietnam','',20.9528365,107.0800003,130),(185,'Thành phố Đà Nẵng, Việt Nam','check in cầu Rồng',16.12599015,108.21878891804153,192),(186,'Thành phố Hội An, Tỉnh Quảng Nam, Việt Nam','đu đưa phố cổ HA',15.8880397,108.33674224633728,193),(210,'Bon Dơng, tt. Lạc Dương, Lạc Dương District, Lam Dong, Vietnam','no',12.0140341,108.4256463,214),(211,'Bệnh Viện Lao Phổi Thành Phố Buôn Ma Thuộc, Nguyễn Thị Định, Buon Ma Thuot, Đắk Lắk province, 63000000, Vietnam','',12.67887645,108.00536535,215),(216,'Đà Nẵng, Phường Máy Tơ, Ngô Quyền District, Haiphong, 04000-05000, Vietnam','',20.8601643,106.6928159,223),(217,'Đà Nẵng, Phường Cầu Tre, Ngô Quyền District, Haiphong, 04000-05000, Vietnam','',20.8612253,106.7099573,223),(218,'Mộc Châu District, Son La province, Vietnam','',20.87105085,104.62917893497627,224),(219,'Điện Biên District, Điện Biên Province, Vietnam','',21.255160850000003,102.99158304282933,225),(220,'Sa Pa, Sa Pa ward, Sa Pa, Lao Cai province, 190000, Vietnam','',22.3359668,103.8426575,226),(239,'Khánh Hòa, Việt Nam','',12.1960803,108.9950386,236),(240,'Nha Trang, Trần Phú, Tân Lập, Nha Trang, Khánh Hòa, 48058, Việt Nam','',12.237752799999999,109.19766887133886,237),(241,'Hòn Tằm, Nha Trang, Khánh Hòa, Việt Nam','',12.17472365,109.2447380317011,238),(242,'Diamond Bay Resort, Nguyễn Tất Thành, Nha Trang, Khánh Hòa, 652510, Việt Nam','',12.1703859,109.1956411,239),(243,'Đảo Xanh, Phường Rạch Dừa, Vũng Tàu, Tỉnh Bà Rịa-Vũng Tàu, Việt Nam','',10.4053374,107.09901611968486,240),(244,'Phước Hải, Huyện Đất Đỏ, Tỉnh Bà Rịa-Vũng Tàu, Việt Nam','',10.427956,107.2953204,241),(245,'Bà Rịa, Thành phố Bà Rịa, Long Điền, Tỉnh Bà Rịa-Vũng Tàu, 78106, Việt Nam','',10.4962696,107.1688433,242),(246,'Dalat, Lâm Đồng Province, Vietnam','',11.9402416,108.4375758,249),(247,'Sapa, Çorum Merkez, Çorum, Black Sea Region, Türkiye','',40.3891015,34.7243017,249),(256,NULL,'Ho Hoan Kiem notes',20,30,256),(257,NULL,'Tran Duy Hung street notes',50,50,256),(260,NULL,'Place 1',0,0,258),(261,NULL,'Place 1',0,0,258),(262,'Museum of Fine Arts, 97A, Pho Duc Chinh Street, Nguyen Thai Binh Ward, District 1, Ho Chi Minh City, 71010, Vietnam','Art the morning',10.769648,106.69920942563007,259),(263,'Opera House, 7, Lam Son Square, Ben Nghe Ward, District 1, Ho Chi Minh City, 71006, Vietnam','Sound the afternoon',10.7767426,106.70324823258863,259),(264,'Saigon Bridge, Cầu Sài Gòn, Ward 25, Binh Thanh District, Ho Chi Minh City, 71108, Vietnam','Follow the night',10.7985469,106.7230763551083,259),(265,'Làng Trẻ em SOS Gò Vấp, Tân Sơn, Ward 12, Go Vap District, Ho Chi Minh City, 71509, Vietnam','Hope is always found in a child\'s eyes ',10.83903585,106.64596938034614,260),(266,'Hạ Long City, Quang Ninh Province, 36000, Vietnam','Hạ Long nhé',20.9528365,107.0800003,261),(267,'Hanoi, Vietnam','Allo Hà nội',21.0294498,105.8544441,261),(268,NULL,'Place 1',0,0,263),(269,NULL,'Place 1',0,0,263),(270,NULL,'Place 1',0,0,264),(271,NULL,'Place 1',0,0,264);
/*!40000 ALTER TABLE `visit_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitday`
--

DROP TABLE IF EXISTS `visitday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `visitday` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `day_number` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `trip_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKg5vbxqidfiex3ffloo0w3naov` (`trip_id`),
  CONSTRAINT `FKg5vbxqidfiex3ffloo0w3naov` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitday`
--

LOCK TABLES `visitday` WRITE;
/*!40000 ALTER TABLE `visitday` DISABLE KEYS */;
INSERT INTO `visitday` VALUES (2,0,'',5),(13,0,'',15),(14,0,'',15),(15,0,'',15),(21,0,'',17),(22,0,'',17),(23,0,'',17),(26,0,'Di dao quanh ho va goi rua Hoan Kiem',18),(57,0,'',22),(58,0,'',22),(81,0,'',26),(82,0,'',26),(102,0,'',37),(103,0,'',37),(104,0,'Day that som',14),(105,0,'',14),(127,0,'Qua nhà Thổ kiếm ny',38),(128,0,'Đi hết nhà Thổ nhưng mà chưa có ny',38),(129,0,'',38),(130,0,'',39),(131,0,'',39),(192,0,'Bay vào tp ĐN rồi đi xe vào Hội An',33),(193,0,'ngày tiếp theo dạo phố cổ',33),(212,0,'no',27),(213,0,'',27),(214,0,'no',16),(215,0,'no',16),(220,0,'',47),(223,0,'',48),(224,0,'Wake up early and enjoy the nature',36),(225,0,'',36),(226,0,'',36),(236,0,'Nhận khách sạn(checkin) ??‍?️',41),(237,0,'',41),(238,0,'',41),(239,0,'',41),(240,0,'',34),(241,0,'',34),(242,0,'',34),(248,0,'Tham quan BaNa Hill',54),(249,0,'',50),(250,0,'',51),(251,0,'',51),(256,1,'This is the first day to hanoi',56),(258,1,'Some description',58),(259,0,'To your soul',59),(260,0,'To your heart',59),(261,0,'Day 1 with my family',60),(262,0,'',60),(263,1,'Some description',55),(264,1,'Some description',57);
/*!40000 ALTER TABLE `visitday` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-27  0:13:20
