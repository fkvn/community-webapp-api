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
INSERT INTO `company` VALUES (112,'Owner','2022-07-16 00:59:23.932000','','',NULL,'','Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','Kevin Test Shop','','','','REGISTERED','2022-07-21 08:09:36.527000',NULL,0,110,111,1017),(113,'Owner','2022-07-16 01:01:47.990000','','',NULL,'','Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','Kevin Test Shop','','','','PENDING','2022-07-16 01:01:47.990000',NULL,0,110,111,118),(114,'Owner','2022-07-16 01:02:34.214000','','',NULL,'','Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','Kevin Test Shop','','','','PENDING','2022-07-16 01:02:34.214000',NULL,0,110,111,118),(1004,'Owner','2022-07-19 20:08:19.879000','','',NULL,'','Consulate',_binary '\0',_binary '\0',_binary '\0','Kevin Taaa','','','','PENDING','2022-07-19 20:08:19.879000',NULL,0,1002,24,133),(1005,'Owner','2022-07-19 20:08:20.001000','','',NULL,'','Consulate',_binary '\0',_binary '\0',_binary '\0','Kevin Taaa','','','','PENDING','2022-07-19 20:08:20.001000',NULL,0,1002,24,133),(1006,'Owner','2022-07-19 20:10:08.957000','','',NULL,'','Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','Teast','','','','PENDING','2022-07-19 20:10:08.957000',NULL,0,1002,24,118),(1021,'Owner','2022-07-22 00:27:32.021000',NULL,'',NULL,NULL,'Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','Test aaaa','',NULL,NULL,'PENDING','2022-07-22 00:27:32.021000',NULL,NULL,110,1020,118),(1022,'Owner','2022-07-22 00:27:32.053000',NULL,'',NULL,NULL,'Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','Test aaaa','',NULL,NULL,'PENDING','2022-07-22 00:27:32.053000',NULL,NULL,110,1020,118),(1023,'Owner','2022-07-22 00:33:44.915000',NULL,'',NULL,NULL,'Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','Test aaaa','',NULL,NULL,'PENDING','2022-07-22 00:33:44.915000',NULL,NULL,110,1020,118),(1024,'Owner','2022-07-22 00:33:45.053000',NULL,'',NULL,NULL,'Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','Test aaaa','',NULL,NULL,'PENDING','2022-07-22 00:33:45.053000',NULL,NULL,110,1020,118),(1025,'Owner','2022-07-22 00:46:59.791000',NULL,'',NULL,NULL,'Attorney',_binary '\0',_binary '\0',_binary '\0','asdttesss','',NULL,NULL,'PENDING','2022-07-22 00:46:59.791000',NULL,NULL,110,24,119),(1026,'Owner','2022-07-22 00:46:59.953000',NULL,'',NULL,NULL,'Attorney',_binary '\0',_binary '\0',_binary '\0','asdttesss','',NULL,NULL,'PENDING','2022-07-22 00:46:59.953000',NULL,NULL,110,24,119),(1027,'Owner','2022-07-22 00:47:46.902000',NULL,'',NULL,NULL,'Auto Service',_binary '\0',_binary '\0',_binary '\0','adsada','',NULL,NULL,'PENDING','2022-07-22 00:47:46.902000',NULL,NULL,110,24,120),(1028,'Owner','2022-07-22 00:47:47.054000',NULL,'',NULL,NULL,'Auto Service',_binary '\0',_binary '\0',_binary '\0','adsada','',NULL,NULL,'PENDING','2022-07-22 00:47:47.054000',NULL,NULL,110,24,120),(1029,'Owner','2022-07-22 00:49:29.237000',NULL,'',NULL,NULL,'Bank',_binary '\0',_binary '\0',_binary '\0','vvvvv','',NULL,NULL,'PENDING','2022-07-22 00:49:29.237000',NULL,NULL,110,24,121),(1030,'Owner','2022-07-22 00:49:29.378000',NULL,'',NULL,NULL,'Bank',_binary '\0',_binary '\0',_binary '\0','vvvvv','',NULL,NULL,'PENDING','2022-07-22 00:49:29.378000',NULL,NULL,110,24,121),(1031,'Owner','2022-07-22 00:50:53.071000',NULL,'',NULL,NULL,'Bar',_binary '\0',_binary '\0',_binary '\0','gggg','',NULL,NULL,'PENDING','2022-07-22 00:50:53.071000',NULL,NULL,110,24,122),(1032,'Owner','2022-07-22 00:51:28.238000',NULL,'',NULL,NULL,'Florist',_binary '\0',_binary '\0',_binary '\0','asd','',NULL,NULL,'PENDING','2022-07-22 00:51:28.238000',NULL,NULL,110,24,183),(1033,'Owner','2022-07-22 00:51:28.382000',NULL,'',NULL,NULL,'Florist',_binary '\0',_binary '\0',_binary '\0','asd','',NULL,NULL,'PENDING','2022-07-22 00:51:28.382000',NULL,NULL,110,24,183),(1034,'Owner','2022-07-22 00:52:14.285000',NULL,'',NULL,NULL,'Chiropractic',_binary '\0',_binary '\0',_binary '\0','ggggg','',NULL,NULL,'PENDING','2022-07-22 00:52:14.285000',NULL,NULL,110,24,129),(1035,'Owner','2022-07-22 00:52:14.436000',NULL,'',NULL,NULL,'Chiropractic',_binary '\0',_binary '\0',_binary '\0','ggggg','',NULL,NULL,'PENDING','2022-07-22 00:52:14.436000',NULL,NULL,110,24,129),(1036,'Owner','2022-07-22 00:54:50.413000',NULL,'',NULL,NULL,'Thai Massage',_binary '\0',_binary '\0',_binary '\0','adsa','',NULL,NULL,'PENDING','2022-07-22 00:54:50.413000',NULL,NULL,110,24,174),(1037,'Owner','2022-07-22 00:55:11.025000',NULL,'',NULL,NULL,'Car Dealer',_binary '\0',_binary '\0',_binary '\0','ffff','',NULL,NULL,'PENDING','2022-07-22 00:55:11.025000',NULL,NULL,110,24,127),(1038,'Owner','2022-07-22 00:55:40.699000',NULL,'',NULL,NULL,'Credit Card Services',_binary '\0',_binary '\0',_binary '\0','123123adsada','',NULL,NULL,'PENDING','2022-07-22 00:55:40.699000',NULL,NULL,110,24,137),(1039,'Owner','2022-07-22 00:55:40.862000',NULL,'',NULL,NULL,'Credit Card Services',_binary '\0',_binary '\0',_binary '\0','123123adsada','',NULL,NULL,'PENDING','2022-07-22 00:55:40.862000',NULL,NULL,110,24,137),(1042,'Owner','2022-07-22 01:01:23.767000',NULL,'',NULL,NULL,'Florist',_binary '\0',_binary '\0',_binary '\0','dasda12321','',NULL,NULL,'PENDING','2022-07-22 01:01:23.767000',NULL,NULL,110,24,183),(1043,'Owner','2022-07-22 01:01:23.905000',NULL,'',NULL,NULL,'Florist',_binary '\0',_binary '\0',_binary '\0','dasda12321','',NULL,NULL,'PENDING','2022-07-22 01:01:23.905000',NULL,NULL,110,24,183),(1044,'Owner','2022-07-22 01:11:59.003000',NULL,'',NULL,NULL,'Fusion Restaurant',_binary '\0',_binary '\0',_binary '\0','fffff6666','',NULL,NULL,'PENDING','2022-07-22 01:11:59.003000',NULL,NULL,110,24,148),(1045,'Owner','2022-07-22 01:11:59.164000',NULL,'',NULL,NULL,'Fusion Restaurant',_binary '\0',_binary '\0',_binary '\0','fffff6666','',NULL,NULL,'PENDING','2022-07-22 01:11:59.164000',NULL,NULL,110,24,148),(1046,'Owner','2022-07-22 01:33:34.554000',NULL,'',NULL,NULL,'Customer Service',_binary '\0',_binary '\0',_binary '\0','bbbb','',NULL,NULL,'PENDING','2022-07-22 01:33:34.554000',NULL,NULL,110,24,136),(1047,'Owner','2022-07-22 01:33:34.691000',NULL,'',NULL,NULL,'Customer Service',_binary '\0',_binary '\0',_binary '\0','bbbb','',NULL,NULL,'PENDING','2022-07-22 01:33:34.691000',NULL,NULL,110,24,136),(1048,'Owner','2022-07-22 01:34:19.973000',NULL,'',NULL,NULL,'Bookkeeping',_binary '\0',_binary '\0',_binary '\0','cccc','',NULL,NULL,'PENDING','2022-07-22 01:34:19.973000',NULL,NULL,110,24,125),(1049,'Owner','2022-07-22 01:35:41.557000',NULL,'',NULL,NULL,'Cosmetic',_binary '\0',_binary '\0',_binary '\0','hhhhhh','',NULL,NULL,'PENDING','2022-07-22 01:35:41.557000',NULL,NULL,110,24,135),(1050,'Owner','2022-07-22 01:35:41.697000',NULL,'',NULL,NULL,'Cosmetic',_binary '\0',_binary '\0',_binary '\0','hhhhhh','',NULL,NULL,'PENDING','2022-07-22 01:35:41.697000',NULL,NULL,110,24,135),(1051,'Owner','2022-07-22 01:36:39.122000',NULL,'',NULL,NULL,'Shipping',_binary '\0',_binary '\0',_binary '\0','ggqwe123','',NULL,NULL,'PENDING','2022-07-22 01:36:39.122000',NULL,NULL,110,24,168),(1052,'Owner','2022-07-22 01:36:39.223000',NULL,'',NULL,NULL,'Shipping',_binary '\0',_binary '\0',_binary '\0','ggqwe123','',NULL,NULL,'PENDING','2022-07-22 01:36:39.223000',NULL,NULL,110,24,168),(1053,'Owner','2022-07-22 01:37:38.021000',NULL,'',NULL,NULL,'Factory',_binary '\0',_binary '\0',_binary '\0','fasdsassd','',NULL,NULL,'PENDING','2022-07-22 01:37:38.021000',NULL,NULL,110,24,146),(1054,'Owner','2022-07-22 01:37:38.145000',NULL,'',NULL,NULL,'Factory',_binary '\0',_binary '\0',_binary '\0','fasdsassd','',NULL,NULL,'PENDING','2022-07-22 01:37:38.145000',NULL,NULL,110,24,146),(1055,'Owner','2022-07-22 01:38:22.675000',NULL,'',NULL,NULL,'Japanese Restaurant',_binary '\0',_binary '\0',_binary '\0','f2312','',NULL,NULL,'PENDING','2022-07-22 01:38:22.675000',NULL,NULL,110,24,154),(1056,'Owner','2022-07-22 01:38:22.832000',NULL,'',NULL,NULL,'Japanese Restaurant',_binary '\0',_binary '\0',_binary '\0','f2312','',NULL,NULL,'PENDING','2022-07-22 01:38:22.832000',NULL,NULL,110,24,154),(1057,'Owner','2022-07-22 01:39:19.240000',NULL,'',NULL,NULL,'Bodyshop',_binary '\0',_binary '\0',_binary '\0','g1231','',NULL,NULL,'PENDING','2022-07-22 01:39:19.240000',NULL,NULL,110,24,123),(1058,'Owner','2022-07-22 01:39:19.358000',NULL,'',NULL,NULL,'Bodyshop',_binary '\0',_binary '\0',_binary '\0','g1231','',NULL,NULL,'PENDING','2022-07-22 01:39:19.358000',NULL,NULL,110,24,123),(1059,'Owner','2022-07-22 02:58:04.026000',NULL,'',NULL,NULL,'Boxing',_binary '\0',_binary '\0',_binary '\0','dadasd','',NULL,NULL,'PENDING','2022-07-22 02:58:04.026000',NULL,NULL,110,24,126),(1060,'Owner','2022-07-22 02:58:29.800000',NULL,'',NULL,NULL,'Clothing',_binary '\0',_binary '\0',_binary '\0','gggggg','',NULL,NULL,'PENDING','2022-07-22 02:58:29.800000',NULL,NULL,110,24,130),(1061,'Owner','2022-07-22 02:58:29.909000',NULL,'',NULL,NULL,'Clothing',_binary '\0',_binary '\0',_binary '\0','gggggg','',NULL,NULL,'PENDING','2022-07-22 02:58:29.909000',NULL,NULL,110,24,130),(1062,'Owner','2022-07-22 03:05:01.962000',NULL,'',NULL,NULL,'Printing',_binary '\0',_binary '\0',_binary '\0','dasdad','',NULL,NULL,'PENDING','2022-07-22 03:05:01.962000',NULL,NULL,110,24,165),(1063,'Owner','2022-07-22 03:05:02.088000',NULL,'',NULL,NULL,'Printing',_binary '\0',_binary '\0',_binary '\0','dasdad','',NULL,NULL,'PENDING','2022-07-22 03:05:02.088000',NULL,NULL,110,24,165),(1064,'Owner','2022-07-22 03:08:04.365000',NULL,'',NULL,NULL,'Money Transfer',_binary '\0',_binary '\0',_binary '\0','123123','',NULL,NULL,'PENDING','2022-07-22 03:08:04.365000',NULL,NULL,110,24,158),(1065,'Owner','2022-07-22 03:08:04.501000',NULL,'',NULL,NULL,'Money Transfer',_binary '\0',_binary '\0',_binary '\0','123123','',NULL,NULL,'PENDING','2022-07-22 03:08:04.501000',NULL,NULL,110,24,158),(1066,'Owner','2022-07-22 03:10:28.760000',NULL,'',NULL,NULL,'Bookkeeping',_binary '\0',_binary '\0',_binary '\0','asdad','',NULL,NULL,'PENDING','2022-07-22 03:10:28.760000',NULL,NULL,110,24,125),(1067,'Owner','2022-07-22 03:10:28.904000',NULL,'',NULL,NULL,'Bookkeeping',_binary '\0',_binary '\0',_binary '\0','asdad','',NULL,NULL,'PENDING','2022-07-22 03:10:28.904000',NULL,NULL,110,24,125),(1068,'Owner','2022-07-22 03:11:33.889000',NULL,'',NULL,NULL,'Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','125','',NULL,NULL,'PENDING','2022-07-22 03:11:33.889000',NULL,NULL,110,24,118),(1069,'Owner','2022-07-22 03:11:34.016000',NULL,'',NULL,NULL,'Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','125','',NULL,NULL,'PENDING','2022-07-22 03:11:34.016000',NULL,NULL,110,24,118),(1070,'Owner','2022-07-22 03:11:52.380000',NULL,'',NULL,NULL,'asd',_binary '\0',_binary '\0',_binary '\0','555','',NULL,NULL,'PENDING','2022-07-22 03:11:52.380000',NULL,NULL,110,24,183),(1071,'Owner','2022-07-22 03:12:10.489000',NULL,'',NULL,NULL,'123',_binary '\0',_binary '\0',_binary '\0','5555','',NULL,NULL,'PENDING','2022-07-22 03:12:10.489000',NULL,NULL,110,24,183),(1072,'Owner','2022-07-22 03:12:10.619000',NULL,'',NULL,NULL,'123',_binary '\0',_binary '\0',_binary '\0','5555','',NULL,NULL,'PENDING','2022-07-22 03:12:10.619000',NULL,NULL,110,24,183),(1073,'Owner','2022-07-22 03:13:01.323000',NULL,'',NULL,NULL,'123a',_binary '\0',_binary '\0',_binary '\0','fffffffffff','',NULL,NULL,'PENDING','2022-07-22 03:13:01.323000',NULL,NULL,110,24,183),(1074,'Owner','2022-07-22 03:13:01.453000',NULL,'',NULL,NULL,'123a',_binary '\0',_binary '\0',_binary '\0','fffffffffff','',NULL,NULL,'PENDING','2022-07-22 03:13:01.453000',NULL,NULL,110,24,183),(1075,'Owner','2022-07-22 03:14:28.745000',NULL,'',NULL,NULL,'Trader',_binary '\0',_binary '\0',_binary '\0','4312312adsdad','',NULL,NULL,'PENDING','2022-07-22 03:14:28.745000',NULL,NULL,110,24,177);
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
INSERT INTO `hibernate_sequence` VALUES (1076);
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
INSERT INTO `location` VALUES (1,'11976 Ventura Boulevard','','US','Los Angeles County','2022-05-15 00:54:37.812000','11976 Ventura Blvd, Studio City, CA 91604, USA','11976 Ventura Boulevard Studio City, Los Angeles County, CA 91604, US','-118.393033',NULL,'Los Angeles','Studio City','ChIJKZhyquK9woARaBL8nJT7DrI','CA','ROOFTOP','2022-05-15 00:54:37.812000','91604'),(4,'5112 Hollywood Boulevard','# 203','US','Los Angeles County','2022-05-15 01:10:06.191000','5112 Hollywood Blvd # 203, Los Angeles, CA 90027, USA','5112 Hollywood Boulevard # 203, East Hollywood, Los Angeles County, CA 90027, US','34.1013404','-118.3014496','Los Angeles','East Hollywood','ChIJ-2r4RFa_woARp32JhyYeuxg','CA','ROOFTOP','2022-05-15 01:10:06.191000','90027'),(12,'North Highland Avenue','','US','Los Angeles County','2022-05-17 22:49:23.155000','N Highland Ave, Los Angeles, CA, USA','North Highland Avenue Central LA, Los Angeles County, CA , US','34.0929786','-118.3386318','Los Angeles','Central LA','ChIJ99s_VS6_woARN5vTx3PCrHk','CA','GEOMETRIC_CENTER','2022-05-17 22:49:23.155000',''),(22,'2801 Sunset Place','','US','Los Angeles County','2022-05-18 00:47:28.481000','2801 Sunset Pl, Los Angeles, CA 90005, USA','2801 Sunset Place Mid City, Los Angeles County, CA 90005, US','34.0608914','-118.2849629','Los Angeles','Mid City','ChIJX_myydXHwoARaXWJF7ZUNWY','CA','ROOFTOP','2022-05-18 00:47:28.481000','90005'),(24,'123 South Figueroa Street','','US','Los Angeles County','2022-05-21 23:00:19.335000','123 S Figueroa St, Los Angeles, CA 90012, USA','123 South Figueroa Street Downtown Los Angeles, Los Angeles County, CA 90012, US','34.0572772','-118.2526665','Los Angeles','Downtown Los Angeles','ChIJXxAfzVLGwoARJebi04BrBJY','CA','ROOFTOP','2022-05-21 23:00:19.335000','90012'),(56,'1331 North Cahuenga Boulevard','','US','Los Angeles County','2022-06-06 18:34:19.482000','1331 N Cahuenga Blvd, Los Angeles, CA 90028, USA','1331 North Cahuenga Boulevard Central LA, Los Angeles County, CA 90028, US','34.095235','-118.3289749','Los Angeles','Central LA','ChIJQZt6KjG_woARaXUWV2fhi2Q','CA','ROOFTOP','2022-06-06 18:34:19.482000','90028'),(111,'123 South Lincoln Avenue','','US','Los Angeles County','2022-07-16 00:58:49.236000','123 S Lincoln Ave, Monterey Park, CA 91755, USA','123 South Lincoln Avenue Monterey Park, Los Angeles County, CA 91755, US','34.0618461','-118.1216859','Monterey Park','','ChIJWaKEL1fFwoARxDuHWvIJWZ4','CA','ROOFTOP','2022-07-16 00:58:49.236000','91755'),(1020,'2226 East 7th Street','','US','Los Angeles County','2022-07-22 00:27:32.003000','2226 E 7th St, Long Beach, CA 90804, USA','2226 East 7th Street Rose Park South, Los Angeles County, CA 90804, US','33.774946','-118.1651005','Long Beach','Rose Park South','ChIJP72yBwwx3YARhyhCO4fy--U','CA','ROOFTOP','2022-07-22 00:27:32.003000','90804');
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
INSERT INTO `storage` VALUES (35,'2022-05-22 00:58:34.646000','f01a55de-c66e-4937-9050-6a2e34152c1d.png',47990,'image/png','2022-05-22 00:58:34.646000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff01a55de-c66e-4937-9050-6a2e34152c1d.png?alt=media'),(66,'2022-06-15 22:35:44.787000','79433c58-7b7e-4789-b497-7566989ed02b.png',91555,'image/png','2022-06-15 22:35:44.787000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F79433c58-7b7e-4789-b497-7566989ed02b.png?alt=media'),(115,'2022-07-16 23:48:58.580000','ab4e499e-52c3-4c5b-ad7b-71ed9083df1c.png',62895,'image/png','2022-07-16 23:48:58.580000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fab4e499e-52c3-4c5b-ad7b-71ed9083df1c.png?alt=media'),(118,'2022-07-17 00:39:31.090000','d60cc73a-2a54-4882-bf03-1efcb9498517.png',89748,'image/png','2022-07-17 00:39:31.090000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd60cc73a-2a54-4882-bf03-1efcb9498517.png?alt=media'),(119,'2022-07-17 00:39:31.098000','f9ef2c94-3801-4261-82ba-9456ebb14c4a.png',62895,'image/png','2022-07-17 00:39:31.098000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff9ef2c94-3801-4261-82ba-9456ebb14c4a.png?alt=media'),(120,'2022-07-17 00:39:31.105000','9d715108-74ed-4bf9-9760-647b45e1b13f.png',129359,'image/png','2022-07-17 00:39:31.105000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9d715108-74ed-4bf9-9760-647b45e1b13f.png?alt=media'),(121,'2022-07-17 00:39:31.109000','9a2978ab-1dcb-4124-9089-3b364060bc8c.png',143980,'image/png','2022-07-17 00:39:31.109000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9a2978ab-1dcb-4124-9089-3b364060bc8c.png?alt=media'),(122,'2022-07-17 00:39:31.114000','d34262c9-fc83-443d-a0db-b41ce91e80b9.png',74938,'image/png','2022-07-17 00:39:31.114000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd34262c9-fc83-443d-a0db-b41ce91e80b9.png?alt=media'),(123,'2022-07-17 00:39:31.119000','1a35a7e4-55de-4096-b607-2f90b6bbdf22.png',62291,'image/png','2022-07-17 00:39:31.119000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F1a35a7e4-55de-4096-b607-2f90b6bbdf22.png?alt=media'),(124,'2022-07-17 00:39:31.124000','60ddf136-79d3-4c85-9121-41ef66ab0340.png',76634,'image/png','2022-07-17 00:39:31.124000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F60ddf136-79d3-4c85-9121-41ef66ab0340.png?alt=media'),(125,'2022-07-17 00:39:31.128000','671093ab-f907-437b-8354-5dace210d0d2.png',109517,'image/png','2022-07-17 00:39:31.128000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F671093ab-f907-437b-8354-5dace210d0d2.png?alt=media'),(126,'2022-07-17 00:39:31.131000','45fc3176-4950-42b2-87d0-306308c29aa7.png',67126,'image/png','2022-07-17 00:39:31.131000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F45fc3176-4950-42b2-87d0-306308c29aa7.png?alt=media'),(127,'2022-07-17 00:39:31.137000','74ab22b5-89ef-4db4-9f64-bac56784b6f6.png',111233,'image/png','2022-07-17 00:39:31.137000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F74ab22b5-89ef-4db4-9f64-bac56784b6f6.png?alt=media'),(128,'2022-07-17 00:39:31.142000','c1159a90-d107-4902-b0ff-18debfd702f0.png',91133,'image/png','2022-07-17 00:39:31.142000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc1159a90-d107-4902-b0ff-18debfd702f0.png?alt=media'),(129,'2022-07-17 00:39:31.146000','e6de3d71-6ea3-4586-9c4d-f8a27ea50234.png',128911,'image/png','2022-07-17 00:39:31.146000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe6de3d71-6ea3-4586-9c4d-f8a27ea50234.png?alt=media'),(130,'2022-07-17 00:39:31.151000','e182b882-a546-48a2-99b1-9a49993e51da.png',81416,'image/png','2022-07-17 00:39:31.151000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe182b882-a546-48a2-99b1-9a49993e51da.png?alt=media'),(131,'2022-07-17 00:39:31.156000','d3120b1b-5cb2-4fb6-a128-5df68599b3b3.png',70971,'image/png','2022-07-17 00:39:31.156000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd3120b1b-5cb2-4fb6-a128-5df68599b3b3.png?alt=media'),(132,'2022-07-17 00:39:31.161000','254d64b0-2df7-420b-98ca-170332798ca6.png',56096,'image/png','2022-07-17 00:39:31.161000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F254d64b0-2df7-420b-98ca-170332798ca6.png?alt=media'),(133,'2022-07-17 00:39:31.165000','be3a4b30-0901-4139-9619-67b24d07a808.png',93380,'image/png','2022-07-17 00:39:31.165000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fbe3a4b30-0901-4139-9619-67b24d07a808.png?alt=media'),(134,'2022-07-17 00:39:31.170000','0ced9196-d49c-4961-87bc-b3611cbff538.png',109439,'image/png','2022-07-17 00:39:31.170000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F0ced9196-d49c-4961-87bc-b3611cbff538.png?alt=media'),(135,'2022-07-17 00:39:31.174000','de8fe37a-39a3-4766-9535-d57f8070464d.png',31809,'image/png','2022-07-17 00:39:31.174000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fde8fe37a-39a3-4766-9535-d57f8070464d.png?alt=media'),(136,'2022-07-17 00:39:31.179000','736b21b3-dc0a-4ece-b6e5-8094b5c65852.png',62291,'image/png','2022-07-17 00:39:31.179000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F736b21b3-dc0a-4ece-b6e5-8094b5c65852.png?alt=media'),(137,'2022-07-17 00:39:31.185000','9fc91fda-a5fd-42ac-821f-1e047d0c6a8b.png',36283,'image/png','2022-07-17 00:39:31.185000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9fc91fda-a5fd-42ac-821f-1e047d0c6a8b.png?alt=media'),(138,'2022-07-17 00:39:31.190000','74353b6d-bf38-4028-aae0-15afe1823e64.png',120439,'image/png','2022-07-17 00:39:31.190000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F74353b6d-bf38-4028-aae0-15afe1823e64.png?alt=media'),(139,'2022-07-17 00:39:31.194000','c8cbeef8-ee7b-46dc-b21f-eeb70b8294b1.png',36301,'image/png','2022-07-17 00:39:31.194000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc8cbeef8-ee7b-46dc-b21f-eeb70b8294b1.png?alt=media'),(140,'2022-07-17 00:39:31.199000','5488eaf3-84f5-45db-987a-71d3f11f929e.png',72654,'image/png','2022-07-17 00:39:31.199000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F5488eaf3-84f5-45db-987a-71d3f11f929e.png?alt=media'),(141,'2022-07-17 00:39:31.204000','d12c7177-a12a-4f6a-9e0b-aecee5d35d06.png',48843,'image/png','2022-07-17 00:39:31.204000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd12c7177-a12a-4f6a-9e0b-aecee5d35d06.png?alt=media'),(142,'2022-07-17 00:39:31.208000','413d21c2-2788-4d9c-b3d1-0a69b1ad4a57.png',48911,'image/png','2022-07-17 00:39:31.208000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F413d21c2-2788-4d9c-b3d1-0a69b1ad4a57.png?alt=media'),(143,'2022-07-17 00:39:31.212000','97270b94-bf51-4c10-8718-626dddfffe02.png',70515,'image/png','2022-07-17 00:39:31.212000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F97270b94-bf51-4c10-8718-626dddfffe02.png?alt=media'),(144,'2022-07-17 00:39:31.217000','9881bca6-00fc-4b62-97f1-ac2b01569116.png',76028,'image/png','2022-07-17 00:39:31.217000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9881bca6-00fc-4b62-97f1-ac2b01569116.png?alt=media'),(145,'2022-07-17 00:39:31.224000','098281b8-bdd2-4c49-8468-e13fd7329c0b.png',93380,'image/png','2022-07-17 00:39:31.224000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F098281b8-bdd2-4c49-8468-e13fd7329c0b.png?alt=media'),(146,'2022-07-17 00:39:31.227000','62fbe55f-ddbe-4897-8d4d-4b28b97b0f47.png',50419,'image/png','2022-07-17 00:39:31.227000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F62fbe55f-ddbe-4897-8d4d-4b28b97b0f47.png?alt=media'),(147,'2022-07-17 00:39:31.231000','8c0310e0-66ed-451a-b3d0-186c617d8a84.png',111089,'image/png','2022-07-17 00:39:31.231000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F8c0310e0-66ed-451a-b3d0-186c617d8a84.png?alt=media'),(148,'2022-07-17 00:39:31.237000','95797be0-e831-4d96-860b-1815108b0422.png',44314,'image/png','2022-07-17 00:39:31.237000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F95797be0-e831-4d96-860b-1815108b0422.png?alt=media'),(149,'2022-07-17 00:39:31.242000','d600ef3a-ba88-495b-8139-02c34399cd53.png',95381,'image/png','2022-07-17 00:39:31.242000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd600ef3a-ba88-495b-8139-02c34399cd53.png?alt=media'),(150,'2022-07-17 00:39:31.246000','b9a318cb-f032-4083-ab4e-eae2f275633c.png',64528,'image/png','2022-07-17 00:39:31.246000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fb9a318cb-f032-4083-ab4e-eae2f275633c.png?alt=media'),(151,'2022-07-17 00:39:31.252000','8913e262-82ee-49bb-ad40-aed1bfd828a4.png',84184,'image/png','2022-07-17 00:39:31.252000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F8913e262-82ee-49bb-ad40-aed1bfd828a4.png?alt=media'),(152,'2022-07-17 00:39:31.257000','b1cda82f-05e4-4a9a-b98d-f45ddd0d6f4c.png',45676,'image/png','2022-07-17 00:39:31.257000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fb1cda82f-05e4-4a9a-b98d-f45ddd0d6f4c.png?alt=media'),(153,'2022-07-17 00:39:31.262000','e4c0aab2-79ae-4301-bc8b-d3a6a643970b.png',90514,'image/png','2022-07-17 00:39:31.262000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe4c0aab2-79ae-4301-bc8b-d3a6a643970b.png?alt=media'),(154,'2022-07-17 00:39:31.266000','52652253-f065-46bd-aa1c-9e188cd6bc1d.png',46874,'image/png','2022-07-17 00:39:31.266000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F52652253-f065-46bd-aa1c-9e188cd6bc1d.png?alt=media'),(155,'2022-07-17 00:39:31.271000','e9266193-741b-4e2b-80a0-138c43a11a0c.png',68943,'image/png','2022-07-17 00:39:31.271000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe9266193-741b-4e2b-80a0-138c43a11a0c.png?alt=media'),(156,'2022-07-17 00:39:31.276000','77465aed-65e1-45ed-b663-1c1ba999f31b.png',53772,'image/png','2022-07-17 00:39:31.276000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F77465aed-65e1-45ed-b663-1c1ba999f31b.png?alt=media'),(157,'2022-07-17 00:39:31.280000','e452a54e-4e66-474b-8449-1f2fd8016322.png',65975,'image/png','2022-07-17 00:39:31.280000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe452a54e-4e66-474b-8449-1f2fd8016322.png?alt=media'),(158,'2022-07-17 00:39:31.285000','e7f28680-b923-43b3-af7f-352a191f05dc.png',145748,'image/png','2022-07-17 00:39:31.285000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe7f28680-b923-43b3-af7f-352a191f05dc.png?alt=media'),(159,'2022-07-17 00:39:31.290000','1337652c-df0e-4516-b0af-9c2ec8f5c1d9.png',55918,'image/png','2022-07-17 00:39:31.290000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F1337652c-df0e-4516-b0af-9c2ec8f5c1d9.png?alt=media'),(160,'2022-07-17 00:39:31.294000','4e061664-896e-4cad-a962-8067175035f2.png',27270,'image/png','2022-07-17 00:39:31.294000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F4e061664-896e-4cad-a962-8067175035f2.png?alt=media'),(161,'2022-07-17 00:39:31.299000','35949338-3102-4883-a1ab-c1d2930d20e7.png',45517,'image/png','2022-07-17 00:39:31.299000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F35949338-3102-4883-a1ab-c1d2930d20e7.png?alt=media'),(162,'2022-07-17 00:39:31.304000','5659ea66-13cd-449e-b133-d1213a49face.png',92540,'image/png','2022-07-17 00:39:31.304000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F5659ea66-13cd-449e-b133-d1213a49face.png?alt=media'),(163,'2022-07-17 00:39:31.307000','f7a16180-5a12-406b-a3df-b7af4f81aa58.png',113673,'image/png','2022-07-17 00:39:31.307000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff7a16180-5a12-406b-a3df-b7af4f81aa58.png?alt=media'),(164,'2022-07-17 00:39:31.311000','6e1187ac-283d-4564-87ee-2812d341e9fa.png',48076,'image/png','2022-07-17 00:39:31.311000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F6e1187ac-283d-4564-87ee-2812d341e9fa.png?alt=media'),(165,'2022-07-17 00:39:31.315000','92627e4f-e784-4b93-bc4e-848b0af3d892.png',50496,'image/png','2022-07-17 00:39:31.315000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F92627e4f-e784-4b93-bc4e-848b0af3d892.png?alt=media'),(166,'2022-07-17 00:39:31.320000','64c0350f-49f5-4db9-9d29-765e44d16ab3.png',26981,'image/png','2022-07-17 00:39:31.320000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F64c0350f-49f5-4db9-9d29-765e44d16ab3.png?alt=media'),(167,'2022-07-17 00:39:31.324000','7a4ae955-bbeb-4e0e-963e-a58b39d9b2e8.png',80205,'image/png','2022-07-17 00:39:31.324000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F7a4ae955-bbeb-4e0e-963e-a58b39d9b2e8.png?alt=media'),(168,'2022-07-17 00:39:31.329000','3be6f411-8443-4f4c-8880-62b973fcb41a.png',37782,'image/png','2022-07-17 00:39:31.329000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F3be6f411-8443-4f4c-8880-62b973fcb41a.png?alt=media'),(169,'2022-07-17 00:39:31.334000','deeeaa80-77df-47be-933f-62e69ce32d2b.png',101294,'image/png','2022-07-17 00:39:31.334000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fdeeeaa80-77df-47be-933f-62e69ce32d2b.png?alt=media'),(170,'2022-07-17 00:39:31.338000','9e36c7a2-e264-4df1-a49d-96afb6e5cc87.png',117942,'image/png','2022-07-17 00:39:31.338000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9e36c7a2-e264-4df1-a49d-96afb6e5cc87.png?alt=media'),(171,'2022-07-17 00:39:31.342000','f9e04a73-d888-45cf-a478-f67351df187b.png',64004,'image/png','2022-07-17 00:39:31.342000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff9e04a73-d888-45cf-a478-f67351df187b.png?alt=media'),(172,'2022-07-17 00:39:31.346000','9f207f5c-06ff-4c9c-b8d2-e9520e328bda.png',35201,'image/png','2022-07-17 00:39:31.346000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9f207f5c-06ff-4c9c-b8d2-e9520e328bda.png?alt=media'),(173,'2022-07-17 00:39:31.351000','7acd0673-c4bb-4ffd-aa1b-a2933e3f816d.png',62291,'image/png','2022-07-17 00:39:31.351000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F7acd0673-c4bb-4ffd-aa1b-a2933e3f816d.png?alt=media'),(174,'2022-07-17 00:39:31.355000','43f48ed2-2638-4a26-b49c-ac546b7ca029.png',47791,'image/png','2022-07-17 00:39:31.355000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F43f48ed2-2638-4a26-b49c-ac546b7ca029.png?alt=media'),(175,'2022-07-17 00:39:31.359000','7615532b-15c8-42ce-af5d-18c1cddcacc7.png',48253,'image/png','2022-07-17 00:39:31.359000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F7615532b-15c8-42ce-af5d-18c1cddcacc7.png?alt=media'),(176,'2022-07-17 00:39:31.365000','a9233608-2958-4aff-aa78-0d327fa99667.png',63393,'image/png','2022-07-17 00:39:31.365000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa9233608-2958-4aff-aa78-0d327fa99667.png?alt=media'),(177,'2022-07-17 00:39:31.370000','5585fb4a-e2fd-4b22-a7c9-49e310b3c9a8.png',67551,'image/png','2022-07-17 00:39:31.370000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F5585fb4a-e2fd-4b22-a7c9-49e310b3c9a8.png?alt=media'),(178,'2022-07-17 00:39:31.374000','482ee9b2-5b1c-4b3c-99e7-198d6d96455f.png',111746,'image/png','2022-07-17 00:39:31.374000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F482ee9b2-5b1c-4b3c-99e7-198d6d96455f.png?alt=media'),(179,'2022-07-17 00:39:31.378000','2ae1b1ff-14cf-4cd8-a5a3-6a30fd2dc0a7.png',39817,'image/png','2022-07-17 00:39:31.378000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F2ae1b1ff-14cf-4cd8-a5a3-6a30fd2dc0a7.png?alt=media'),(180,'2022-07-17 00:45:05.396000','72dfd645-9c24-4990-b1f3-eb72c1188c7a.png',62291,'image/png','2022-07-17 00:45:05.396000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F72dfd645-9c24-4990-b1f3-eb72c1188c7a.png?alt=media'),(181,'2022-07-17 00:47:17.019000','0817531b-7c27-4a11-ae0a-c56b3d99abfd.png',90514,'image/png','2022-07-17 00:47:17.019000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F0817531b-7c27-4a11-ae0a-c56b3d99abfd.png?alt=media'),(182,'2022-07-17 00:58:23.559000','0817531b-7c27-4a11-ae0a-c56b3d99abfd.png',90514,'image/png','2022-07-17 00:58:23.559000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F0817531b-7c27-4a11-ae0a-c56b3d99abfd.png?alt=media'),(183,'2022-07-18 23:32:15.253000','ac900dbe-ca3c-4d99-9130-60dbb6b2fd3a.png',152511,'image/png','2022-07-18 23:32:15.253000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fac900dbe-ca3c-4d99-9130-60dbb6b2fd3a.png?alt=media'),(184,'2022-07-18 23:39:00.447000','c1c587e9-8333-439c-84a9-2b0d881a8bff.jpg',200908,'image/jpeg','2022-07-18 23:39:00.447000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc1c587e9-8333-439c-84a9-2b0d881a8bff.jpg?alt=media'),(185,'2022-07-18 23:49:01.230000','606b7ed6-8f73-44f2-9d64-68ec33e4c75e.jpg',74614,'image/jpeg','2022-07-18 23:49:01.230000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F606b7ed6-8f73-44f2-9d64-68ec33e4c75e.jpg?alt=media'),(186,'2022-07-19 00:07:38.416000','cb16ba13-f169-4fc1-94ee-d46538e18d13.png',1662369,'image/png','2022-07-19 00:07:38.416000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fcb16ba13-f169-4fc1-94ee-d46538e18d13.png?alt=media'),(187,'2022-07-19 01:06:47.053000','d0af8bb0-444a-4849-8a82-aee96c6dea2b.png',152511,'image/png','2022-07-19 01:06:47.053000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd0af8bb0-444a-4849-8a82-aee96c6dea2b.png?alt=media'),(188,'2022-07-19 01:19:41.746000','a0e775d0-f286-4012-9f1d-d8bccbaa448b.exe',4,'application/x-msdownload','2022-07-19 01:19:41.746000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa0e775d0-f286-4012-9f1d-d8bccbaa448b.exe?alt=media'),(189,'2022-07-19 01:19:59.722000','2cce58a1-124f-450c-8cf6-acdd0e6b2fbd.png',152511,'image/png','2022-07-19 01:19:59.722000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F2cce58a1-124f-450c-8cf6-acdd0e6b2fbd.png?alt=media'),(1001,'2022-07-19 19:30:45.161000','91830578-78e8-4040-b662-f87011b3b007.jpg',86962,'image/jpeg','2022-07-19 19:30:45.161000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F91830578-78e8-4040-b662-f87011b3b007.jpg?alt=media'),(1003,'2022-07-19 19:42:42.942000','a349828e-8c9b-4f3a-a946-c802eea8ba30.png',236056,'image/png','2022-07-19 19:42:42.942000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa349828e-8c9b-4f3a-a946-c802eea8ba30.png?alt=media'),(1007,'2022-07-19 22:08:37.834000','a24ede07-1057-4437-8369-ae2d2c7ad991.png',147887,'image/png','2022-07-19 22:08:37.834000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa24ede07-1057-4437-8369-ae2d2c7ad991.png?alt=media'),(1010,'2022-07-21 05:23:40.540000','29863498-2a41-4b02-9b6f-6bd4c63f7408.png',2003047,'image/png','2022-07-21 05:23:40.540000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F29863498-2a41-4b02-9b6f-6bd4c63f7408.png?alt=media'),(1011,'2022-07-21 07:49:47.951000','46902e42-3e6e-48ae-925c-0f649cdaca79.png',2005423,'image/png','2022-07-21 07:49:47.951000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F46902e42-3e6e-48ae-925c-0f649cdaca79.png?alt=media'),(1012,'2022-07-21 07:53:15.498000','1ef8db11-7d59-49da-92e7-c6af5268c8ff.png',2105235,'image/png','2022-07-21 07:53:15.498000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F1ef8db11-7d59-49da-92e7-c6af5268c8ff.png?alt=media'),(1013,'2022-07-21 07:59:25.228000','a8a8a7d7-706c-4562-9e69-75822112f0b6.png',2105235,'image/png','2022-07-21 07:59:25.228000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa8a8a7d7-706c-4562-9e69-75822112f0b6.png?alt=media'),(1014,'2022-07-21 08:02:18.523000','4a0ce3d3-34c1-4318-8099-75428f7cd209.png',2105235,'image/png','2022-07-21 08:02:18.523000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F4a0ce3d3-34c1-4318-8099-75428f7cd209.png?alt=media'),(1015,'2022-07-21 08:06:00.853000','e05af9af-99a5-49be-afda-629a2b113e99.png',2105235,'image/png','2022-07-21 08:06:00.853000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe05af9af-99a5-49be-afda-629a2b113e99.png?alt=media'),(1016,'2022-07-21 08:08:04.358000','4880b0b2-1618-4264-af07-6b522ea8182c.png',2105235,'image/png','2022-07-21 08:08:04.358000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F4880b0b2-1618-4264-af07-6b522ea8182c.png?alt=media'),(1017,'2022-07-21 08:09:36.524000','2b49738d-b68c-478d-8b5c-bc057d92637f.png',2105235,'image/png','2022-07-21 08:09:36.524000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F2b49738d-b68c-478d-8b5c-bc057d92637f.png?alt=media');
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
  `is_user_location_public` bit(1) DEFAULT NULL,
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
INSERT INTO `user` VALUES ('User',110,'2022-07-16 00:57:45.334000','','',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0','','$2a$10$8p2dyqcr4LwfHOanaPEE1uiqckrp62NPI.v/btHN2qEYkrCG4E3cC','(626) 877-3222','BUSINESS','ACTIVATED','a9afcbf9-0843-45c2-a9b6-635a25f5d129','2022-07-19 22:08:37.838000','Kevin Ngo',NULL,1007,_binary '\0'),('User',1000,'2022-07-19 19:30:24.450000','','',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0','','$2a$10$KMUiO7CdXb6FKiqqj2h2Me.lOhOVePJeumJSXVJQm8pxY2n98bb3e','(626) 877-3058','CLASSIC','DELETED','9f0112bd-f1b4-40ba-b8c7-7a1140a44de0','2022-07-19 19:30:45.165000','Ngo Chanh',NULL,1001,_binary '\0'),('User',1002,'2022-07-19 19:41:53.911000','','',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0','','$2a$10$WrsWnffK0g8xcWY9/Z3kLu0RvSGKA5JxcG7iQuiOQt/j9yE53DhQS','(626) 877-3058','BUSINESS','DELETED','2e49ec7d-c2be-4524-bbb3-f1cf21ff0436','2022-07-19 20:08:20.256000','ngo Chanh',NULL,1003,_binary '\0'),('User',1008,'2022-07-20 00:14:53.528000','','',' ',_binary '\0',_binary '\0',_binary '\0',_binary '','','$2a$10$tkvPBBmd3zX6ODQGxblQaO3Juby.JM0eeZHc8Rp66UlMjjY4n/Mpi','(626) 877-3058','CLASSIC','DELETED','ae5a6f2f-d17e-4f7e-a0ff-f89bcb771760','2022-07-20 00:14:53.528000','aaaa',NULL,181,_binary '\0'),('User',1009,'2022-07-21 05:11:19.603000','','',' ',_binary '\0',_binary '\0',_binary '\0',_binary '','','$2a$10$AgYZR/W3QfoNvwvrIPkDJ.N4xQKWZfNMUdbIokMzYfc79JG.Y4Uma','(626) 877-3058','CLASSIC','DELETED','97e3c484-8240-4d8a-84f4-1e0b2d01476a','2022-07-21 05:23:40.557000','Kevin N Go',NULL,1010,_binary '\0'),('User',1018,'2022-07-21 23:42:55.788000','','',' ',_binary '\0',_binary '\0',_binary '\0',_binary '','','$2a$10$ocKv1e2kLx1rnvP3ppT2meH6HXPGQUWl5zBwgm7VfvPsadop3T6gK','(626) 877-3058','CLASSIC','DELETED','80306c3a-1560-4978-9593-146def5ef719','2022-07-21 23:42:55.788000','Kevin Ngos',NULL,181,_binary '\0'),('User',1019,'2022-07-21 23:48:06.906000','','',' ',_binary '\0',_binary '\0',_binary '\0',_binary '','','$2a$10$vU/mnRl3hMUqEcREf4yzA.mriw3iR2qVzaS.OoNkRsdTUSPflYdK.','(626) 888-8777','CLASSIC','ACTIVATED','82188bbc-ae55-4349-8002-98c2baa0dd5e','2022-07-21 23:48:06.906000','Kevin N Go',NULL,181,_binary '\0'),('User',1040,'2022-07-22 00:59:53.228000','','',' ',_binary '\0',_binary '\0',_binary '\0',_binary '','','$2a$10$uuF9TYfgKhcXo6Ujp1P4gOcHji8NC8Ouwu5Rq77a2wxvkK5V1.AoS','(626) 887-7555','CLASSIC','ACTIVATED','158cda66-8505-4972-b559-cd1b9c4c54f7','2022-07-22 00:59:53.228000','asdas',NULL,181,_binary '\0'),('User',1041,'2022-07-22 01:00:51.433000','','',' ',_binary '\0',_binary '\0',_binary '\0',_binary '','','$2a$10$.VWKkBHKTyY1WK4qSzdfE.a7ZEfBh648z2My0FETFUa5s9ccSuVs.','(626) 445-4121','CLASSIC','ACTIVATED','d0e20aaf-16bd-4976-bebb-5179fd1bc298','2022-07-22 01:00:51.433000','ngo Chanh',NULL,181,_binary '\0');
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

-- Dump completed on 2022-07-21 21:03:02
