CREATE DATABASE  IF NOT EXISTS `thainow-mono` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `thainow-mono`;
-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
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
  `is_company_informal` bit(1) DEFAULT NULL,
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
  `logo_url_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_name_UNIQUE` (`company_name`),
  KEY `FKr8fmuy0noae9gmtdbucvcdf3w` (`administrator_id`),
  KEY `FK2fb6ricytdnmf83vedni0gqy4` (`location_id`),
  KEY `FKrvkeljo7ftxqkwv3x9vr5f0wr` (`logo_url_id`),
  CONSTRAINT `FK2fb6ricytdnmf83vedni0gqy4` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `FKr8fmuy0noae9gmtdbucvcdf3w` FOREIGN KEY (`administrator_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKrvkeljo7ftxqkwv3x9vr5f0wr` FOREIGN KEY (`logo_url_id`) REFERENCES `storage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (112,'Owner','2022-07-16 00:59:23.932000','','',NULL,'','Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','Kevin Test Shop','','','','PENDING','2022-07-16 00:59:23.932000',NULL,0,110,111,NULL),(113,'Owner','2022-07-16 01:01:47.990000','','',NULL,'','Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','Kevin Test Shop','','','','PENDING','2022-07-16 01:01:47.990000',NULL,0,110,111,NULL),(114,'Owner','2022-07-16 01:02:34.214000','','',NULL,'','Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','Kevin Test Shop','','','','PENDING','2022-07-16 01:02:34.214000',NULL,0,110,111,NULL);
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
INSERT INTO `hibernate_sequence` VALUES (115);
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
INSERT INTO `location` VALUES (1,'11976 Ventura Boulevard','','US','Los Angeles County','2022-05-15 00:54:37.812000','11976 Ventura Blvd, Studio City, CA 91604, USA','11976 Ventura Boulevard Studio City, Los Angeles County, CA 91604, US','-118.393033',NULL,'Los Angeles','Studio City','ChIJKZhyquK9woARaBL8nJT7DrI','CA','ROOFTOP','2022-05-15 00:54:37.812000','91604'),(4,'5112 Hollywood Boulevard','# 203','US','Los Angeles County','2022-05-15 01:10:06.191000','5112 Hollywood Blvd # 203, Los Angeles, CA 90027, USA','5112 Hollywood Boulevard # 203, East Hollywood, Los Angeles County, CA 90027, US','34.1013404','-118.3014496','Los Angeles','East Hollywood','ChIJ-2r4RFa_woARp32JhyYeuxg','CA','ROOFTOP','2022-05-15 01:10:06.191000','90027'),(12,'North Highland Avenue','','US','Los Angeles County','2022-05-17 22:49:23.155000','N Highland Ave, Los Angeles, CA, USA','North Highland Avenue Central LA, Los Angeles County, CA , US','34.0929786','-118.3386318','Los Angeles','Central LA','ChIJ99s_VS6_woARN5vTx3PCrHk','CA','GEOMETRIC_CENTER','2022-05-17 22:49:23.155000',''),(22,'2801 Sunset Place','','US','Los Angeles County','2022-05-18 00:47:28.481000','2801 Sunset Pl, Los Angeles, CA 90005, USA','2801 Sunset Place Mid City, Los Angeles County, CA 90005, US','34.0608914','-118.2849629','Los Angeles','Mid City','ChIJX_myydXHwoARaXWJF7ZUNWY','CA','ROOFTOP','2022-05-18 00:47:28.481000','90005'),(24,'123 South Figueroa Street','','US','Los Angeles County','2022-05-21 23:00:19.335000','123 S Figueroa St, Los Angeles, CA 90012, USA','123 South Figueroa Street Downtown Los Angeles, Los Angeles County, CA 90012, US','34.0572772','-118.2526665','Los Angeles','Downtown Los Angeles','ChIJXxAfzVLGwoARJebi04BrBJY','CA','ROOFTOP','2022-05-21 23:00:19.335000','90012'),(56,'1331 North Cahuenga Boulevard','','US','Los Angeles County','2022-06-06 18:34:19.482000','1331 N Cahuenga Blvd, Los Angeles, CA 90028, USA','1331 North Cahuenga Boulevard Central LA, Los Angeles County, CA 90028, US','34.095235','-118.3289749','Los Angeles','Central LA','ChIJQZt6KjG_woARaXUWV2fhi2Q','CA','ROOFTOP','2022-06-06 18:34:19.482000','90028'),(111,'123 South Lincoln Avenue','','US','Los Angeles County','2022-07-16 00:58:49.236000','123 S Lincoln Ave, Monterey Park, CA 91755, USA','123 South Lincoln Avenue Monterey Park, Los Angeles County, CA 91755, US','34.0618461','-118.1216859','Monterey Park','','ChIJWaKEL1fFwoARxDuHWvIJWZ4','CA','ROOFTOP','2022-07-16 00:58:49.236000','91755');
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
INSERT INTO `storage` VALUES (35,'2022-05-22 00:58:34.646000','f01a55de-c66e-4937-9050-6a2e34152c1d.png',47990,'image/png','2022-05-22 00:58:34.646000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff01a55de-c66e-4937-9050-6a2e34152c1d.png?alt=media'),(66,'2022-06-15 22:35:44.787000','79433c58-7b7e-4789-b497-7566989ed02b.png',91555,'image/png','2022-06-15 22:35:44.787000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F79433c58-7b7e-4789-b497-7566989ed02b.png?alt=media');
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `dtype` varchar(31) NOT NULL,
  `id` bigint NOT NULL,
  `user_created_on` datetime(6) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_firstname` varchar(255) DEFAULT NULL,
  `user_fullname` varchar(255) DEFAULT NULL,
  `is_user_email_public` bit(1) DEFAULT NULL,
  `is_user_email_verified` bit(1) DEFAULT NULL,
  `is_user_phone_public` bit(1) DEFAULT NULL,
  `is_user_phone_verified` bit(1) DEFAULT NULL,
  `user_lastname` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `user_role` varchar(255) NOT NULL,
  `user_status` varchar(255) NOT NULL,
  `user_sub` varchar(255) NOT NULL,
  `user_updated_on` datetime(6) DEFAULT NULL,
  `user_username` varchar(255) DEFAULT NULL,
  `location_id` bigint DEFAULT NULL,
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
INSERT INTO `user` VALUES ('User',110,'2022-07-16 00:57:45.334000','','',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0','','$2a$10$8p2dyqcr4LwfHOanaPEE1uiqckrp62NPI.v/btHN2qEYkrCG4E3cC','(626) 877-3222','BUSINESS','ACTIVATED','a9afcbf9-0843-45c2-a9b6-635a25f5d129','2022-07-16 00:59:24.111000','Kevin Ngo',NULL,35);
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

-- Dump completed on 2022-07-15 23:09:19
