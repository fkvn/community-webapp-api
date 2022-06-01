CREATE DATABASE  IF NOT EXISTS `thainow-mono` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `thainow-mono`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: thainow-mono
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` bigint NOT NULL,
  `administrator_role` varchar(255) DEFAULT NULL,
  `company_created_on` datetime(6) DEFAULT NULL,
  `company_description` longtext,
  `company_email` varchar(255) DEFAULT NULL,
  `company_fixed_postion` int DEFAULT NULL,
  `company_founded` varchar(255) DEFAULT NULL,
  `company_industry` varchar(255) DEFAULT NULL,
  `is_company_email_verified` bit(1) DEFAULT NULL,
  `is_company_phone_verified` bit(1) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_phone` varchar(255) DEFAULT NULL,
  `company_revenue` varchar(255) DEFAULT NULL,
  `company_size` varchar(255) DEFAULT NULL,
  `company_status` varchar(255) NOT NULL,
  `company_updated_on` datetime(6) DEFAULT NULL,
  `company_website` varchar(255) DEFAULT NULL,
  `company_weight` int DEFAULT NULL,
  `administrator_id` bigint DEFAULT NULL,
  `location_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_name_UNIQUE` (`company_name`),
  KEY `FKr8fmuy0noae9gmtdbucvcdf3w` (`administrator_id`),
  KEY `FK2fb6ricytdnmf83vedni0gqy4` (`location_id`),
  CONSTRAINT `FK2fb6ricytdnmf83vedni0gqy4` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `FKr8fmuy0noae9gmtdbucvcdf3w` FOREIGN KEY (`administrator_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (54,NULL,'2022-05-29 00:29:14.624000',NULL,NULL,NULL,NULL,'Printing',_binary '\0',_binary '\0','InPrint_2',NULL,NULL,NULL,'UNREGISTERED','2022-05-29 00:29:14.624000',NULL,0,NULL,12),(55,NULL,'2022-05-29 00:36:11.322000',NULL,NULL,NULL,NULL,'Printing',_binary '\0',_binary '\0','In Print LA',NULL,NULL,NULL,'UNREGISTERED','2022-05-29 00:36:11.322000',NULL,0,NULL,12);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_info`
--

DROP TABLE IF EXISTS `contact_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_info` (
  `contact_id` bigint NOT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_message` longtext,
  `contact_phone` varchar(255) DEFAULT NULL,
  `contact_website` varchar(255) DEFAULT NULL,
  `location_id` bigint NOT NULL,
  PRIMARY KEY (`contact_id`),
  KEY `FKc41kalnqbhbxq0auqw051bu5c` (`location_id`),
  CONSTRAINT `FKc41kalnqbhbxq0auqw051bu5c` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_info`
--

LOCK TABLES `contact_info` WRITE;
/*!40000 ALTER TABLE `contact_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (56);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` bigint NOT NULL,
  `location_address1` varchar(255) DEFAULT NULL,
  `location_address2` varchar(255) DEFAULT NULL,
  `location_country` varchar(255) DEFAULT NULL,
  `location_county` varchar(255) DEFAULT NULL,
  `location_created_on` datetime(6) DEFAULT NULL,
  `location_formatted_address` varchar(255) DEFAULT NULL,
  `location_full_address` varchar(255) DEFAULT NULL,
  `location_lat` varchar(255) DEFAULT NULL,
  `location_lng` varchar(255) DEFAULT NULL,
  `location_city` varchar(255) DEFAULT NULL,
  `location_neighberhood` varchar(255) DEFAULT NULL,
  `location_placeid` varchar(255) DEFAULT NULL,
  `location_state` varchar(255) DEFAULT NULL,
  `location_type` varchar(255) DEFAULT NULL,
  `location_updated_on` datetime(6) DEFAULT NULL,
  `location_zipcode` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location_placeid_UNIQUE` (`location_placeid`),
  UNIQUE KEY `location_formattedAddress_UNIQUE` (`location_formatted_address`),
  UNIQUE KEY `location_fullAddress_UNIQUE` (`location_full_address`),
  UNIQUE KEY `location_lat_UNIQUE` (`location_lat`),
  UNIQUE KEY `location_lng_UNIQUE` (`location_lng`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'11976 Ventura Boulevard','','US','Los Angeles County','2022-05-15 00:54:37.812000','11976 Ventura Blvd, Studio City, CA 91604, USA','11976 Ventura Boulevard Studio City, Los Angeles County, CA 91604, US','-118.393033',NULL,'Los Angeles','Studio City','ChIJKZhyquK9woARaBL8nJT7DrI','CA','ROOFTOP','2022-05-15 00:54:37.812000','91604'),(4,'5112 Hollywood Boulevard','# 203','US','Los Angeles County','2022-05-15 01:10:06.191000','5112 Hollywood Blvd # 203, Los Angeles, CA 90027, USA','5112 Hollywood Boulevard # 203, East Hollywood, Los Angeles County, CA 90027, US','34.1013404','-118.3014496','Los Angeles','East Hollywood','ChIJ-2r4RFa_woARp32JhyYeuxg','CA','ROOFTOP','2022-05-15 01:10:06.191000','90027'),(12,'North Highland Avenue','','US','Los Angeles County','2022-05-17 22:49:23.155000','N Highland Ave, Los Angeles, CA, USA','North Highland Avenue Central LA, Los Angeles County, CA , US','34.0929786','-118.3386318','Los Angeles','Central LA','ChIJ99s_VS6_woARN5vTx3PCrHk','CA','GEOMETRIC_CENTER','2022-05-17 22:49:23.155000',''),(22,'2801 Sunset Place','','US','Los Angeles County','2022-05-18 00:47:28.481000','2801 Sunset Pl, Los Angeles, CA 90005, USA','2801 Sunset Place Mid City, Los Angeles County, CA 90005, US','34.0608914','-118.2849629','Los Angeles','Mid City','ChIJX_myydXHwoARaXWJF7ZUNWY','CA','ROOFTOP','2022-05-18 00:47:28.481000','90005'),(24,'123 South Figueroa Street','','US','Los Angeles County','2022-05-21 23:00:19.335000','123 S Figueroa St, Los Angeles, CA 90012, USA','123 South Figueroa Street Downtown Los Angeles, Los Angeles County, CA 90012, US','34.0572772','-118.2526665','Los Angeles','Downtown Los Angeles','ChIJXxAfzVLGwoARJebi04BrBJY','CA','ROOFTOP','2022-05-21 23:00:19.335000','90012');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_type` varchar(31) NOT NULL,
  `post_id` bigint NOT NULL,
  `post_avg_rating` bigint DEFAULT NULL,
  `post_created_on` datetime(6) DEFAULT NULL,
  `post_description` longtext,
  `is_company_post` bit(1) DEFAULT NULL,
  `post_status` varchar(255) NOT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_updated_on` datetime(6) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `deal_discount_type` varchar(255) DEFAULT NULL,
  `discount_value` varchar(255) DEFAULT NULL,
  `is_online_deal` bit(1) DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `post_contact_info` bigint DEFAULT NULL,
  `location_id` bigint NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `FK12njtf8e0jmyb45lqfpt6ad89` (`author_id`),
  KEY `FKskdgb1bsxsiyl4yn7vgbiqvny` (`company_id`),
  KEY `FK259ktrrbfsmxfurylts31gsgf` (`post_contact_info`),
  KEY `FKi1psqwjnonr2lmbvxow5walgf` (`location_id`),
  CONSTRAINT `FK12njtf8e0jmyb45lqfpt6ad89` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK259ktrrbfsmxfurylts31gsgf` FOREIGN KEY (`post_contact_info`) REFERENCES `contact_info` (`contact_id`),
  CONSTRAINT `FKi1psqwjnonr2lmbvxow5walgf` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `FKskdgb1bsxsiyl4yn7vgbiqvny` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage` (
  `id` bigint NOT NULL,
  `storage_created_on` datetime(6) DEFAULT NULL,
  `storage_name` varchar(255) DEFAULT NULL,
  `storage_size` bigint NOT NULL,
  `storage_type` varchar(255) DEFAULT NULL,
  `storage_updated_on` datetime(6) DEFAULT NULL,
  `storage_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
INSERT INTO `storage` VALUES (35,'2022-05-22 00:58:34.646000','f01a55de-c66e-4937-9050-6a2e34152c1d.png',47990,'image/png','2022-05-22 00:58:34.646000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff01a55de-c66e-4937-9050-6a2e34152c1d.png?alt=media');
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_role` varchar(31) NOT NULL,
  `id` bigint NOT NULL,
  `user_created_on` datetime(6) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_firstname` varchar(255) DEFAULT NULL,
  `user_fullname` varchar(255) DEFAULT NULL,
  `is_user_email_verified` bit(1) DEFAULT NULL,
  `is_user_phone_verified` bit(1) DEFAULT NULL,
  `user_lastname` varchar(255) DEFAULT NULL,
  `user_password` longtext NOT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `user_status` varchar(255) NOT NULL,
  `user_sub` varchar(255) NOT NULL,
  `user_updated_on` datetime(6) DEFAULT NULL,
  `user_username` varchar(255) DEFAULT NULL,
  `location_id` bigint NOT NULL,
  `profile_url_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_sub_UNIQUE` (`user_sub`),
  KEY `FKneyhvoj17hax43m8dq3u7gbic` (`location_id`),
  KEY `FKl6rn81aesfdasg5gi367u4hry` (`profile_url_id`),
  CONSTRAINT `FKl6rn81aesfdasg5gi367u4hry` FOREIGN KEY (`profile_url_id`) REFERENCES `storage` (`id`),
  CONSTRAINT `FKneyhvoj17hax43m8dq3u7gbic` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('CLASSIC',2,'2022-05-15 00:54:37.833000','testclassic@gmail.com','testclassic_firstname','testclassic_firstname testclassic_lastname',_binary '\0',_binary '\0','testclassic_lastname','$2a$10$xHMzJLxiJKwM5ezrftluCOWF.UBjNjOnQef1eUShi4gYNRq5M3yw6','6268773040','DELETED','cee91a2f-371b-45d0-b841-f628716cc580','2022-05-15 00:54:37.833000','',1,NULL),('CLASSIC',5,'2022-05-15 01:10:06.206000','testclassic1@gmail.com','testclassic_firstname','testclassic_firstname testclassic_lastname',_binary '\0',_binary '\0','testclassic_lastname','$2a$10$Rnox3gbDUcsdMeg3xdlAZ.dkyWDWwXn4j/101ZVQTa3TUh5WPk58W','(626) 877-3040','DELETED','0be57406-0146-4847-9c67-d066683600e9','2022-05-15 01:10:06.206000','',4,NULL),('CLASSIC',6,'2022-05-15 01:12:55.668000','testclassic12@gmail.com','testclassic_firstname','testclassic_firstname testclassic_lastname',_binary '\0',_binary '\0','testclassic_lastname','$2a$10$dgg.aenBh3UKoGTzEohgruICFj5zAMUJWnh46V4RDXWhTOHZs9p7q','(626) 877-3042','DELETED','4572dc52-f888-413e-b70b-59caf472bece','2022-05-15 01:12:55.668000','',4,NULL),('CLASSIC',7,'2022-05-15 01:14:11.838000','testclassic12@gmail.com','testclassic_firstname','testclassic_firstname testclassic_lastname',_binary '\0',_binary '\0','testclassic_lastname','$2a$10$2qb8EBVS5Bhj5ecv8p7AJOfLnEfxDOuuzurYlfrv2GExB9L3afDa.','(626) 877-3042','DELETED','5f299513-0806-4fea-bfdb-1adb9ddd7b3b','2022-05-15 01:14:11.838000','',4,NULL),('CLASSIC',8,'2022-05-17 22:23:47.298000','testclassic12@gmail.com','testclassic_firstname','testclassic_firstname testclassic_lastname',_binary '\0',_binary '\0','testclassic_lastname','$2a$10$TAhA3piOG60m5WvxkAOMh..Zt1r7FSroul6oKX/VBMRfQB7ReKD2W','(626) 877-3042','DELETED','c8eb6361-1b4a-4880-9594-c038187ce14b','2022-05-17 22:23:47.298000','',1,NULL),('CLASSIC',13,'2022-05-17 22:49:23.163000','testclassic12@gmail.com','testclassic_firstname','testclassic_firstname testclassic_lastname',_binary '\0',_binary '\0','testclassic_lastname','$2a$10$JXzRFZzB.aov8au2Fmpdve2O4./kmnXRFiFY9SdA1SYVUZUP6N/gm','(626) 877-3042','DELETED','6748ed1a-3124-48f5-b604-32b864319887','2022-05-17 22:49:23.163000','',12,NULL),('CLASSIC',17,'2022-05-17 23:00:08.408000','testclassic12@gmail.com','testclassic_firstname','testclassic_firstname testclassic_lastname',_binary '\0',_binary '\0','testclassic_lastname','$2a$10$SqzRSw.lamP/rvNWQ3cWLejBvlzX7aHVerr65T2xv18gZ08eR/iF6','(626) 877-3042','DELETED','eb8c1c3b-754c-4a3f-a8e2-1f367413b968','2022-05-17 23:00:08.408000','',12,NULL),('CLASSIC',18,'2022-05-17 23:01:57.484000','','123','123 asdasd',_binary '\0',_binary '\0','asdasd','$2a$10$rEbEb.zbW6gn6nKjJhBesOmS/xmLxMM6vMq/5QPu5/v9lM3AGkWVG','(626) 877-3058','DELETED','f5f98282-4fb8-49c2-9e80-25c4961c6953','2022-05-17 23:01:57.484000','',12,NULL),('CLASSIC',19,'2022-05-17 23:26:31.857000','','123','123 asdasd',_binary '\0',_binary '\0','asdasd','$2a$10$gCI5OdYPFx1KPv7Q2oa1IuvgPne7oGh6Aaeb9Iy/Lzg71Ahg7ol3q','(626) 877-3058','DELETED','52441803-1b79-458e-a5ba-26771709cc16','2022-05-17 23:26:31.857000','',12,NULL),('CLASSIC',20,'2022-05-17 23:28:06.712000','','123','123 asdasd',_binary '\0',_binary '\0','asdasd','$2a$10$KeyAumqxze9zA.gd55mhzOPKbf1XNdL5m3.2eipShOMEIai0gZ8jK','(626) 877-3058','DELETED','935899ae-ae86-4772-a1ea-ec055ae2b893','2022-05-17 23:28:06.712000','',12,NULL),('CLASSIC',21,'2022-05-17 23:58:24.434000','','123','123 asdasd',_binary '\0',_binary '\0','asdasd','$2a$10$YE1sNJc6odqZJiA8lJ9xwO8YQ8kZmXweYp3IJAOeEc012Iekmk5bS','(626) 877-3058','DELETED','3145e052-42da-41e5-8f52-9ffcaaff4f5b','2022-05-17 23:58:24.434000','',12,NULL),('CLASSIC',23,'2022-05-18 00:47:28.498000','testclassic12@gmail.com','123','123 12312',_binary '\0',_binary '\0','12312','$2a$10$e7svF7VeebANcL/EACFK8.1p5FsXmSthRz/f9nUA92dsnf2DTbiC6','(626) 877-3058','DELETED','fe89b6d6-2feb-49b7-8554-d16087442c37','2022-05-18 00:47:28.498000','',22,NULL),('CLASSIC',25,'2022-05-21 23:00:19.382000','','Kevin','Kevin Ngo',_binary '\0',_binary '\0','Ngo','$2a$10$qGadI8FflVl0sY95JfgxpelLlZjtfIQKqyZdyatvIQMVqvsbrU9kO','(626) 877-3058','DELETED','34a3c698-85bb-4363-ab00-81b0d125e1e2','2022-05-21 23:00:19.382000','',24,NULL),('CLASSIC',26,'2022-05-21 23:06:36.934000','','Kevin','Kevin Ngo',_binary '\0',_binary '\0','Ngo','$2a$10$sS93tHGdgz/hEGO7.QZpAexmW8U1XKF0ntJ7ysDzHf7I8LRhjQOIi','(626) 877-3058','DELETED','5c76d52f-37da-41f4-8871-5e6379010051','2022-05-21 23:06:36.934000','',24,NULL),('CLASSIC',27,'2022-05-21 23:10:02.069000','','Kevin','Kevin Ngo',_binary '\0',_binary '\0','Ngo','$2a$10$d4wX/KY6c9uzPeVw8uo.xOUopp3b6z/hIQsEQNbFDmU7ADGgimWOq','(626) 877-3058','DELETED','28a55cc9-230c-425a-8553-b4738965343d','2022-05-21 23:10:02.069000','',24,NULL),('CLASSIC',28,'2022-05-21 23:22:49.938000','','Kevin','Kevin Ngo',_binary '\0',_binary '\0','Ngo','$2a$10$7XvrRzV2Mz1l9SqE2Pkdsu3qyox7oNgMsfDsuze26/vS7ta5otZRe','(626) 877-3058','DELETED','5c00167a-9043-4b55-8ac8-a781bc27ae80','2022-05-21 23:22:49.938000','',24,NULL),('CLASSIC',30,'2022-05-22 00:53:41.587000','','Kevin','Kevin Ngo',_binary '\0',_binary '\0','Ngo','$2a$10$dQd37hUjpJ6Ia.shT8yRCeg9wG0nAaH/mGcBgGhrgi1wX8wAm5Z4e','(626) 877-3058','DELETED','86e255cf-b1ff-4932-9b18-b60584774c19','2022-05-22 00:53:41.587000','',24,NULL),('CLASSIC',32,'2022-05-22 00:56:13.426000','','Kevin','Kevin Ngo',_binary '\0',_binary '\0','Ngo','$2a$10$0tqj1iD4llZsUlWA6EIG/ejW38C/tVrs1/r9A3NhhE9PSwCvbxxxu','(626) 877-3058','DELETED','fa0f4d66-b86e-446c-88e8-31c3bcc82de0','2022-05-22 00:56:13.426000','',24,NULL),('CLASSIC',34,'2022-05-22 00:58:34.636000','','Kevin','Kevin Ngo',_binary '\0',_binary '\0','Ngo','$2a$10$st4J3cRLfK5NFRH6DZQne.RkAX7JmhJTbQx//4LzS3N2OmK3w.Gla','(626) 877-3058','DELETED','2fb0e782-ac34-423f-ab27-73fea7ddd747','2022-05-22 00:58:34.649000','',24,35),('CLASSIC',36,'2022-05-22 01:06:04.894000','','Kevin','Kevin Ngo',_binary '\0',_binary '\0','Ngo','$2a$10$.VKubwf4mm16obgYaVhRmuWqUXsdv.dqRTqMgZoIDG1hTcgYK5xKK','(626) 877-3058','DELETED','c57609e3-f0c3-4b19-b709-3431bcfdbb51','2022-05-22 01:06:04.901000','',24,35),('CLASSIC',37,'2022-05-22 02:33:31.390000','testclassic12@gmail.com','Kevin','Kevin Ngo',_binary '\0',_binary '\0','Ngo','$2a$10$f/CvhsMafYsq0vdJ3Mu4kuKxkJ/NpWDaatSPnh3ra42gSsrD9Npvu','(626) 877-3058','DELETED','5796cb32-3f74-4777-8072-0303c6c100e6','2022-05-22 02:33:31.397000','',24,35),('CLASSIC',38,'2022-05-23 21:11:14.414000','','Kevin','Kevin Ngo',_binary '\0',_binary '\0','Ngo','$2a$10$o.QI1EAXaV5AFBBopjUWJO0qeqp3Sty2njqS1Sbhr8fM/Oa38S9My','(626) 877-3058','DELETED','b89deb14-ae9d-4c87-b2ec-830ffa4c71c0','2022-05-23 21:11:14.442000','',24,35),('CLASSIC',39,'2022-05-23 21:18:16.423000','testclassic12@gmail.com','Kevin','Kevin Ngo',_binary '\0',_binary '\0','Ngo','$2a$10$3ARdlYvDYwCnAHIuBTv2cObVQ2MUHRT1HTfKbOba4OlTq8GRKGeOa','(626) 877-3058','DELETED','4b831ef3-ff02-430f-b01f-9b98645e8a7f','2022-05-23 21:18:16.429000','',24,35),('CLASSIC',47,'2022-05-23 23:13:00.913000','','Kevin','Kevin Ngo',_binary '\0',_binary '\0','Ngo','$2a$10$C4bzOfaEFsddqvLVMgauZOPzINJH8PlM89muRRBdOdeb1AXsymQIi','(626) 255-5888','ACTIVATED','507c0c3f-1098-498d-88e9-687f75214785','2022-05-23 23:13:00.917000','',24,35);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_privileges`
--

DROP TABLE IF EXISTS `user_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_privileges` (
  `user_id` bigint NOT NULL,
  `user_privileges` int NOT NULL,
  PRIMARY KEY (`user_id`,`user_privileges`),
  CONSTRAINT `FKhkt8ag37wvaq72wjkg453otlk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_privileges`
--

LOCK TABLES `user_privileges` WRITE;
/*!40000 ALTER TABLE `user_privileges` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_privileges` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-30 21:10:02
