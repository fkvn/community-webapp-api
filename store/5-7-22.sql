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
  `company_status` int NOT NULL,
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
INSERT INTO `company` VALUES (3,'Owner','2022-04-20 23:07:18.054000',NULL,'testbusiness@gmail.com',NULL,NULL,'Information Technology',_binary '\0',_binary '\0','ThaiNow','6268773049',NULL,NULL,2,'2022-04-20 23:20:26.334000',NULL,0,2,1),(12,'Manager','2022-04-27 01:56:03.858000',NULL,'testbusiness2@gmail.com',NULL,NULL,'Printing',_binary '\0',_binary '\0','Inprint','6268773045',NULL,NULL,1,'2022-04-27 01:56:03.863000',NULL,0,11,1);
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
INSERT INTO `hibernate_sequence` VALUES (29);
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
INSERT INTO `location` VALUES (1,'1834 S Marengo Ave','Apt 31','USA','Los Angeles','2022-04-20 22:58:17.089000','1834 S Marengo Ave Apt 31, Alhambra, CA 91803','1834 S Marengo Ave Apt 31, Alhambra, Los Angeles, CA 91803, USA','34.07277132031383','-118.14163198651201','Alhambra','','ChIJz_9HqmzFwoARV3oKI4I0QN4','CA','2022-04-20 22:58:17.089000','91803');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_id` bigint NOT NULL,
  `post_avg_rating` bigint DEFAULT NULL,
  `post_created_on` datetime(6) DEFAULT NULL,
  `post_description` longtext,
  `is_company_post` bit(1) DEFAULT NULL,
  `post_status` int NOT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_updated_on` datetime(6) DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `post_contact_info` bigint DEFAULT NULL,
  `location_id` bigint NOT NULL,
  `post_type` varchar(31) NOT NULL,
  `deal_discount_type` varchar(255) DEFAULT NULL,
  `discount_value` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `is_online_deal` bit(1) DEFAULT NULL,
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
INSERT INTO `post` VALUES (10,0,'2022-04-26 23:35:40.866000','',_binary '\0',3,'test post','2022-04-27 02:55:49.500000',4,NULL,NULL,1,'DEAL',NULL,NULL,NULL,NULL),(13,0,'2022-04-27 01:57:20.578000','',_binary '',0,'test company post','2022-04-27 01:57:20.578000',2,3,NULL,1,'DEAL',NULL,NULL,NULL,NULL),(14,0,'2022-04-27 02:56:44.390000','',_binary '',0,'test company post','2022-04-27 02:56:44.390000',2,3,NULL,1,'DEAL',NULL,NULL,NULL,NULL),(15,0,'2022-04-27 02:58:56.008000','',_binary '',0,'test company post','2022-04-27 02:58:56.008000',2,3,NULL,1,'DEAL','H',NULL,NULL,NULL),(16,0,'2022-04-27 04:00:31.061000','',_binary '',0,'test company post','2022-04-27 04:00:31.061000',2,3,NULL,1,'DEAL','PERCENT_OFF','50',NULL,NULL),(17,0,'2022-04-27 04:18:35.392000','',_binary '',0,'test company post','2022-04-27 04:18:35.392000',2,3,NULL,1,'DEAL','PERCENT_OFF','50','restaurant',_binary '\0'),(18,0,'2022-04-27 04:20:03.810000','',_binary '',0,'test company post','2022-04-27 04:20:03.810000',2,3,NULL,1,'DEAL','PERCENT_OFF','50','restaurant',_binary '\0');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage` (
  `id` varchar(255) NOT NULL,
  `storage_created_on` datetime(6) DEFAULT NULL,
  `storage_name` varchar(255) DEFAULT NULL,
  `storage_size` bigint DEFAULT NULL,
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
INSERT INTO `storage` VALUES ('27','2022-05-03 23:58:46.738000','1d752d7b-7d56-4ed8-b180-023826400cac.jpg',185643,'image/jpeg','2022-05-03 23:58:46.738000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F1d752d7b-7d56-4ed8-b180-023826400cac.jpg?alt=media'),('28','2022-05-04 00:04:20.254000','1d752d7b-7d56-4ed8-b180-023826400cac.jpg',185643,'image/jpeg','2022-05-04 00:04:20.254000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F4b326f46-9491-45db-a2e1-28aef86ba39c.jpg?alt=media');
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
  `user_status` int NOT NULL,
  `user_sub` varchar(255) NOT NULL,
  `user_updated_on` datetime(6) DEFAULT NULL,
  `user_username` varchar(255) DEFAULT NULL,
  `location_id` bigint NOT NULL,
  `profile_url_id` varchar(255) DEFAULT NULL,
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
INSERT INTO `user` VALUES ('BUSINESS',2,'2022-04-20 23:07:01.112000','testbusiness@gmail.com','testbusiness_firstname','testbusiness_firstname testbusiness_lastname',_binary '\0',_binary '\0','testbusiness_lastname','$2a$10$ZUK5.aD26HS7Q/4irDxpS.i8FowXAwHGjL1OhqzXINpG3amf5//em','6268773049',0,'25cdd625-1ba3-4855-996c-c554c76580f3','2022-04-20 23:20:26.337000','',1,NULL),('CLASSIC',4,'2022-04-20 23:09:32.374000','testclassic@gmail.com','testclassic_firstname','testclassic_firstname testclassic_lastname',_binary '\0',_binary '\0','testclassic_lastname','$2a$10$xFQeBALZWGo.PXk1OIvtb.1fnbcBwTw8A6DFx9fAR.X.oDtrXKmF2','(626) 877-3040',0,'33d12ce6-88ff-4030-9b7f-a5c19e8af034','2022-05-04 00:04:20.258000','',1,'28'),('BUSINESS',11,'2022-04-27 01:56:03.831000','testbusiness2@gmail.com','testbusiness2_firstname','testbusiness2_firstname testbusiness2_lastname',_binary '\0',_binary '\0','testbusiness2_lastname','$2a$10$H4m5KPwvJ.vBUrecw0ZnleT7SdRbRBcUKjCveSOBBsjqJXsddH4dm','6268773045',1,'db5a44ca-910c-40aa-9d9c-309bb6ef7eda','2022-04-27 01:56:03.869000','',1,NULL);
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

-- Dump completed on 2022-05-07 21:26:09
