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
  `company_created_on` datetime(6) DEFAULT NULL,
  `company_description` longtext,
  `is_company_description_public` bit(1) DEFAULT NULL,
  `company_email` varchar(255) DEFAULT NULL,
  `is_company_email_public` bit(1) DEFAULT NULL,
  `is_company_email_verified` bit(1) DEFAULT NULL,
  `company_founded` varchar(255) DEFAULT NULL,
  `company_industry` varchar(255) DEFAULT NULL,
  `is_company_informal` bit(1) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_phone` varchar(255) DEFAULT NULL,
  `is_company_phone_public` bit(1) DEFAULT NULL,
  `is_company_phone_verified` bit(1) DEFAULT NULL,
  `company_revenue` varchar(255) DEFAULT NULL,
  `company_size` varchar(255) DEFAULT NULL,
  `is_company_size_public` bit(1) DEFAULT NULL,
  `company_status` varchar(255) NOT NULL,
  `company_updated_on` datetime(6) DEFAULT NULL,
  `company_website` varchar(255) DEFAULT NULL,
  `is_company_website_public` bit(1) DEFAULT NULL,
  `location_id` bigint DEFAULT NULL,
  `logo_id` bigint DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `company_lat` double DEFAULT NULL,
  `company_lng` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_name_UNIQUE` (`company_name`),
  KEY `FK2fb6ricytdnmf83vedni0gqy4` (`location_id`),
  KEY `FK8rwy1d3nbln68nhj0jdwxsn97` (`logo_id`),
  CONSTRAINT `FK2fb6ricytdnmf83vedni0gqy4` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `FK8rwy1d3nbln68nhj0jdwxsn97` FOREIGN KEY (`logo_id`) REFERENCES `storage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1149,'2022-08-23 00:44:30.818000',NULL,_binary '','aassfff@gmail.com',_binary '',_binary '\0',NULL,'Service',_binary '\0','Swap Restaurant666777','',_binary '',_binary '\0',NULL,NULL,_binary '','REJECTED','2022-10-02 01:05:10.247000',NULL,_binary '',12,180,34.0929786,-118.3386318,NULL,NULL),(1201,'2022-08-25 22:39:04.470000',NULL,_binary '','aassfff@gmail.com',_binary '',_binary '\0',NULL,'Thai Restaurant',_binary '\0','THai Restaurant','',_binary '',_binary '\0',NULL,NULL,_binary '','REJECTED','2022-10-02 01:05:10.247000',NULL,_binary '',1199,180,34.0904399,-118.2987956,NULL,NULL),(1207,'2022-08-25 22:40:07.825000',NULL,_binary '','aassfff@gmail.com',_binary '',_binary '\0',NULL,'Thai Massage',_binary '\0','Massage Thai','',_binary '',_binary '\0',NULL,NULL,_binary '','REJECTED','2022-10-02 01:05:10.247000',NULL,_binary '',1205,174,34.0508252,-118.3192132,NULL,NULL),(1214,'2022-08-25 22:41:42.780000',NULL,_binary '','aassfff@gmail.com',_binary '',_binary '\0',NULL,'Drinks & Deserts',_binary '\0','Boba Tea','',_binary '',_binary '\0',NULL,NULL,_binary '','REJECTED','2022-10-02 01:05:10.247000',NULL,_binary '',1212,180,34.1395597,-118.3870991,NULL,NULL),(1220,'2022-08-25 22:42:20.405000',NULL,_binary '','aassfff@gmail.com',_binary '',_binary '\0',NULL,'Drinks & Deserts',_binary '\0','Tom Yum Beer','',_binary '',_binary '\0',NULL,NULL,_binary '','REJECTED','2022-10-02 01:05:10.247000',NULL,_binary '',1218,180,33.9625905,-118.3987842,NULL,NULL),(1226,'2022-08-25 22:43:05.846000',NULL,_binary '','aassfff@gmail.com',_binary '',_binary '\0',NULL,'Printing',_binary '\0','Inprint','',_binary '',_binary '\0',NULL,NULL,_binary '','PENDING','2022-08-25 22:43:05.846000',NULL,_binary '',1224,165,34.1477849,-118.1445155,NULL,NULL),(1228,'2022-08-25 22:43:54.136000','',_binary '','aassfff@gmail.com',_binary '\0',_binary '\0',NULL,'Attorney',_binary '\0','Thai Inprint LA','(626) 877-3058',_binary '',_binary '\0',NULL,'',_binary '','REGISTERED','2022-10-31 06:37:54.049000','',_binary '',111,1466,34.1477849,-118.1445155,NULL,NULL),(1235,'2022-08-25 22:45:18.371000',NULL,_binary '','aassfff@gmail.com',_binary '',_binary '\0',NULL,'Education',_binary '\0','USC University','',_binary '',_binary '\0',NULL,NULL,_binary '','REGISTERED','2022-10-21 00:30:41.062000',NULL,_binary '',1233,1418,34.095287,-118.1270146,NULL,NULL),(1241,'2022-08-25 22:45:58.566000',NULL,_binary '','aassfff@gmail.com',_binary '',_binary '\0',NULL,'Japanese Restaurant',_binary '\0','Sushi Near Me','',_binary '',_binary '\0',NULL,NULL,_binary '','REGISTERED','2022-08-25 22:46:04.161000',NULL,_binary '',1239,154,34.1617745,-118.4685012,NULL,NULL),(1247,'2022-08-25 22:46:35.698000',NULL,_binary '','aassfff@gmail.com',_binary '',_binary '\0',NULL,'Information Technology',_binary '\0','Google','',_binary '',_binary '\0',NULL,NULL,_binary '','REGISTERED','2022-08-25 22:46:41.588000',NULL,_binary '',1245,153,34.0905792,-118.3644276,NULL,NULL),(1341,'2022-10-04 00:06:53.953000',NULL,_binary '',NULL,_binary '',_binary '\0',NULL,'Thai Restaurant',_binary '\0','Kevin AAAA',NULL,_binary '',_binary '\0',NULL,NULL,_binary '','REJECTED','2022-10-04 00:07:20.616000',NULL,_binary '',1339,175,NULL,NULL,NULL,NULL),(1347,'2022-10-04 00:10:42.191000',NULL,_binary '',NULL,_binary '',_binary '\0',NULL,'Thai Restaurant',_binary '\0','Kevin AAAA',NULL,_binary '',_binary '\0',NULL,NULL,_binary '','REJECTED','2022-10-04 02:27:41.207000',NULL,_binary '',1339,175,NULL,NULL,NULL,NULL),(1353,'2022-10-04 02:28:45.672000',NULL,_binary '',NULL,_binary '',_binary '\0',NULL,'Attorney',_binary '\0','TEST REMOVE',NULL,_binary '',_binary '\0',NULL,NULL,_binary '','REJECTED','2022-10-04 02:28:51.189000',NULL,_binary '',1339,119,NULL,NULL,NULL,NULL),(1359,'2022-10-04 02:31:31.339000',NULL,_binary '',NULL,_binary '',_binary '\0',NULL,'Aquarium & Pet',_binary '\0','TEST',NULL,_binary '',_binary '\0',NULL,NULL,_binary '','REJECTED','2022-10-04 02:41:11.116000',NULL,_binary '',1339,118,NULL,NULL,NULL,NULL),(1364,'2022-10-04 02:39:07.607000',NULL,_binary '',NULL,_binary '',_binary '\0',NULL,'Bank',_binary '\0','TEST 2',NULL,_binary '',_binary '\0',NULL,NULL,_binary '','REJECTED','2022-10-06 20:32:39.726000',NULL,_binary '',1339,121,NULL,NULL,NULL,NULL),(1368,'2022-10-04 02:56:03.958000',NULL,_binary '',NULL,_binary '',_binary '\0',NULL,'Bodyshop',_binary '\0','TEST 3',NULL,_binary '',_binary '\0',NULL,NULL,_binary '','REJECTED','2022-10-04 03:14:26.321000',NULL,_binary '',1339,123,NULL,NULL,NULL,NULL),(1371,'2022-10-04 02:56:15.628000',NULL,_binary '',NULL,_binary '',_binary '\0',NULL,'Bookkeeping',_binary '\0','TEST 3',NULL,_binary '',_binary '\0',NULL,NULL,_binary '','REJECTED','2022-10-04 03:43:58.148000',NULL,_binary '',1339,125,NULL,NULL,NULL,NULL),(1382,'2022-10-06 20:54:33.233000',NULL,_binary '',NULL,_binary '',_binary '\0',NULL,'Aquarium & Pet',_binary '\0','Test',NULL,_binary '',_binary '\0',NULL,NULL,_binary '','REJECTED','2022-10-06 21:15:48.029000',NULL,_binary '',1339,118,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_aud`
--

DROP TABLE IF EXISTS `company_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `company_created_on` datetime(6) DEFAULT NULL,
  `created_on_mod` bit(1) DEFAULT NULL,
  `company_description` longtext,
  `description_mod` bit(1) DEFAULT NULL,
  `is_company_description_public` bit(1) DEFAULT NULL,
  `description_public_mod` bit(1) DEFAULT NULL,
  `company_email` varchar(255) DEFAULT NULL,
  `email_mod` bit(1) DEFAULT NULL,
  `is_company_email_public` bit(1) DEFAULT NULL,
  `email_public_mod` bit(1) DEFAULT NULL,
  `is_company_email_verified` bit(1) DEFAULT NULL,
  `email_verified_mod` bit(1) DEFAULT NULL,
  `company_founded` varchar(255) DEFAULT NULL,
  `founded_mod` bit(1) DEFAULT NULL,
  `company_industry` varchar(255) DEFAULT NULL,
  `industry_mod` bit(1) DEFAULT NULL,
  `is_company_informal` bit(1) DEFAULT NULL,
  `informal_company_mod` bit(1) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `name_mod` bit(1) DEFAULT NULL,
  `company_phone` varchar(255) DEFAULT NULL,
  `phone_mod` bit(1) DEFAULT NULL,
  `is_company_phone_public` bit(1) DEFAULT NULL,
  `phone_public_mod` bit(1) DEFAULT NULL,
  `is_company_phone_verified` bit(1) DEFAULT NULL,
  `phone_verified_mod` bit(1) DEFAULT NULL,
  `company_revenue` varchar(255) DEFAULT NULL,
  `revenue_mod` bit(1) DEFAULT NULL,
  `company_size` varchar(255) DEFAULT NULL,
  `size_mod` bit(1) DEFAULT NULL,
  `is_company_size_public` bit(1) DEFAULT NULL,
  `size_public_mod` bit(1) DEFAULT NULL,
  `company_status` varchar(255) DEFAULT NULL,
  `status_mod` bit(1) DEFAULT NULL,
  `company_updated_on` datetime(6) DEFAULT NULL,
  `updated_on_mod` bit(1) DEFAULT NULL,
  `company_website` varchar(255) DEFAULT NULL,
  `website_mod` bit(1) DEFAULT NULL,
  `is_company_website_public` bit(1) DEFAULT NULL,
  `website_public_mod` bit(1) DEFAULT NULL,
  `cover_pictures_mod` bit(1) DEFAULT NULL,
  `location_id` bigint DEFAULT NULL,
  `location_mod` bit(1) DEFAULT NULL,
  `logo_id` bigint DEFAULT NULL,
  `logo_mod` bit(1) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lat_mod` bit(1) DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `lng_mod` bit(1) DEFAULT NULL,
  `company_lat` double DEFAULT NULL,
  `company_lng` double DEFAULT NULL,
  `profile_mod` bit(1) DEFAULT NULL,
  `pictures_mod` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`rev`),
  KEY `FK5v3dcdwshf7nunol3smlp4w0a` (`rev`),
  CONSTRAINT `FK5v3dcdwshf7nunol3smlp4w0a` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_aud`
--

LOCK TABLES `company_aud` WRITE;
/*!40000 ALTER TABLE `company_aud` DISABLE KEYS */;
INSERT INTO `company_aud` VALUES (1149,1150,0,'2022-08-23 00:44:30.818000',_binary '',NULL,_binary '\0',_binary '',_binary '','aassfff@gmail.com',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Service',_binary '',_binary '\0',_binary '','Swap Restaurant',_binary '','',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-08-23 00:44:30.818000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',12,_binary '',180,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1149,1153,1,'2022-08-23 00:44:30.818000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Service',_binary '\0',_binary '\0',_binary '\0','Swap Restaurant666777',_binary '','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-08-23 00:50:28.295000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',12,_binary '\0',180,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1149,1331,1,'2022-08-23 00:44:30.818000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Service',_binary '\0',_binary '\0',_binary '\0','Swap Restaurant666777',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REJECTED',_binary '','2022-10-02 01:05:10.247000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',12,_binary '\0',180,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1201,1202,0,'2022-08-25 22:39:04.470000',_binary '',NULL,_binary '\0',_binary '',_binary '','aassfff@gmail.com',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Service',_binary '',_binary '\0',_binary '','THai Restaurant',_binary '','',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-08-25 22:39:04.470000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1199,_binary '',180,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1201,1204,1,'2022-08-25 22:39:04.470000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Service',_binary '\0',_binary '\0',_binary '\0','THai Restaurant',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-08-25 22:39:21.253000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1199,_binary '\0',180,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1201,1211,1,'2022-08-25 22:39:04.470000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Thai Restaurant',_binary '',_binary '\0',_binary '\0','THai Restaurant',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-08-25 22:40:47.455000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1199,_binary '\0',180,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1201,1330,1,'2022-08-25 22:39:04.470000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Thai Restaurant',_binary '\0',_binary '\0',_binary '\0','THai Restaurant',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REJECTED',_binary '','2022-10-02 01:05:10.247000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1199,_binary '\0',180,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1207,1208,0,'2022-08-25 22:40:07.825000',_binary '',NULL,_binary '\0',_binary '',_binary '','aassfff@gmail.com',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Thai Massage',_binary '',_binary '\0',_binary '','Massage Thai',_binary '','',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-08-25 22:40:07.825000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1205,_binary '',174,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1207,1210,1,'2022-08-25 22:40:07.825000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Thai Massage',_binary '\0',_binary '\0',_binary '\0','Massage Thai',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-08-25 22:40:13.837000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1205,_binary '\0',174,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1207,1329,1,'2022-08-25 22:40:07.825000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Thai Massage',_binary '\0',_binary '\0',_binary '\0','Massage Thai',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REJECTED',_binary '','2022-10-02 01:05:10.247000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1205,_binary '\0',174,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1214,1215,0,'2022-08-25 22:41:42.780000',_binary '',NULL,_binary '\0',_binary '',_binary '','aassfff@gmail.com',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Drinks & Deserts',_binary '',_binary '\0',_binary '','Boba Tea',_binary '','',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-08-25 22:41:42.780000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1212,_binary '',180,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1214,1217,1,'2022-08-25 22:41:42.780000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Drinks & Deserts',_binary '\0',_binary '\0',_binary '\0','Boba Tea',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-08-25 22:41:48.239000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1212,_binary '\0',180,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1214,1332,1,'2022-08-25 22:41:42.780000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Drinks & Deserts',_binary '\0',_binary '\0',_binary '\0','Boba Tea',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REJECTED',_binary '','2022-10-02 01:05:10.247000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1212,_binary '\0',180,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1220,1221,0,'2022-08-25 22:42:20.405000',_binary '',NULL,_binary '\0',_binary '',_binary '','aassfff@gmail.com',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Drinks & Deserts',_binary '',_binary '\0',_binary '','Tom Yum Beer',_binary '','',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-08-25 22:42:20.405000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1218,_binary '',180,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1220,1223,1,'2022-08-25 22:42:20.405000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Drinks & Deserts',_binary '\0',_binary '\0',_binary '\0','Tom Yum Beer',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-08-25 22:42:32.096000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1218,_binary '\0',180,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1220,1333,1,'2022-08-25 22:42:20.405000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Drinks & Deserts',_binary '\0',_binary '\0',_binary '\0','Tom Yum Beer',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REJECTED',_binary '','2022-10-02 01:05:10.247000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1218,_binary '\0',180,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1226,1227,0,'2022-08-25 22:43:05.846000',_binary '',NULL,_binary '\0',_binary '',_binary '','aassfff@gmail.com',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Printing',_binary '',_binary '\0',_binary '','Inprint',_binary '','',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-08-25 22:43:05.846000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1224,_binary '',165,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1228,1229,0,'2022-08-25 22:43:54.136000',_binary '',NULL,_binary '\0',_binary '',_binary '','aassfff@gmail.com',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Printing',_binary '',_binary '\0',_binary '','Inprint',_binary '','',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-08-25 22:43:54.136000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1224,_binary '',165,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1228,1232,1,'2022-08-25 22:43:54.136000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Printing',_binary '\0',_binary '\0',_binary '\0','Inprint',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-08-25 22:44:29.541000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1224,_binary '\0',165,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1228,1320,1,'2022-08-25 22:43:54.136000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Thai InPrint',_binary '',_binary '\0',_binary '\0','Inprint',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-09-14 00:46:12.287000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1224,_binary '\0',165,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1228,1321,1,'2022-08-25 22:43:54.136000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Printing',_binary '',_binary '\0',_binary '\0','Thai Inprint',_binary '','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-09-14 00:46:33.222000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1224,_binary '\0',165,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1228,1451,1,'2022-08-25 22:43:54.136000',_binary '\0','',_binary '',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Printing',_binary '\0',_binary '\0',_binary '\0','Thai Inprint LA',_binary '','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-10-24 23:03:35.635000',_binary '','',_binary '',_binary '',_binary '\0',NULL,1224,_binary '\0',165,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0'),(1228,1452,1,'2022-08-25 22:43:54.136000',_binary '\0','',_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Printing',_binary '\0',_binary '\0',_binary '\0','Thai Inprint LA',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-10-24 23:04:00.619000',_binary '','',_binary '\0',_binary '',_binary '\0',NULL,24,_binary '',165,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0'),(1228,1453,1,'2022-08-25 22:43:54.136000',_binary '\0','',_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Gift Shop',_binary '',_binary '\0',_binary '\0','Thai Inprint LA',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-10-24 23:10:55.218000',_binary '','',_binary '\0',_binary '',_binary '\0',NULL,24,_binary '\0',165,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0'),(1228,1456,1,'2022-08-25 22:43:54.136000',_binary '\0','',_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Gift Shop',_binary '\0',_binary '\0',_binary '\0','Thai Inprint LA',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-10-24 23:12:31.498000',_binary '','',_binary '\0',_binary '',_binary '\0',NULL,24,_binary '\0',165,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary ''),(1228,1459,1,'2022-08-25 22:43:54.136000',_binary '\0','',_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Gift Shop',_binary '\0',_binary '\0',_binary '\0','Thai Inprint LA',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-10-24 23:30:20.670000',_binary '','',_binary '\0',_binary '',_binary '\0',NULL,24,_binary '\0',1457,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0'),(1228,1462,1,'2022-08-25 22:43:54.136000',_binary '\0','',_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Gift Shop',_binary '\0',_binary '\0',_binary '\0','Thai Inprint LA',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-10-24 23:33:06.589000',_binary '','',_binary '\0',_binary '',_binary '\0',NULL,24,_binary '\0',1460,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0'),(1228,1465,1,'2022-08-25 22:43:54.136000',_binary '\0','',_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Gift Shop',_binary '\0',_binary '\0',_binary '\0','Thai Inprint LA',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-10-24 23:34:23.389000',_binary '','',_binary '\0',_binary '',_binary '\0',NULL,24,_binary '\0',1463,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0'),(1228,1468,1,'2022-08-25 22:43:54.136000',_binary '\0','',_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Gift Shop',_binary '\0',_binary '\0',_binary '\0','Thai Inprint LA',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-10-24 23:35:29.561000',_binary '','',_binary '\0',_binary '',_binary '\0',NULL,24,_binary '\0',1466,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0'),(1228,1469,1,'2022-08-25 22:43:54.136000',_binary '\0','',_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Gift Shop',_binary '\0',_binary '\0',_binary '\0','Thai Inprint LA',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-10-25 22:42:13.610000',_binary '','',_binary '\0',_binary '',_binary '\0',NULL,1233,_binary '',1466,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary ''),(1228,1470,1,'2022-08-25 22:43:54.136000',_binary '\0','',_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',NULL,_binary '\0','Gift Shop',_binary '\0',_binary '\0',_binary '\0','Thai Inprint LA',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-10-25 22:43:37.955000',_binary '','',_binary '\0',_binary '',_binary '\0',NULL,1233,_binary '\0',1466,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary ''),(1228,1471,1,'2022-08-25 22:43:54.136000',_binary '\0','',_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Attorney',_binary '',_binary '\0',_binary '\0','Thai Inprint LA',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-10-25 22:57:51.614000',_binary '','',_binary '\0',_binary '',_binary '\0',NULL,1233,_binary '\0',1466,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary ''),(1228,1472,1,'2022-08-25 22:43:54.136000',_binary '\0','',_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Attorney',_binary '',_binary '\0',_binary '\0','Thai Inprint LA',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-10-25 22:57:51.634000',_binary '','',_binary '\0',_binary '',_binary '\0',NULL,1233,_binary '\0',1466,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary ''),(1228,1473,1,'2022-08-25 22:43:54.136000',_binary '\0','',_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Attorney',_binary '\0',_binary '\0',_binary '\0','Thai Inprint LA',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Small (10-100)',_binary '',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-10-25 23:23:52.052000',_binary '','',_binary '\0',_binary '',_binary '\0',NULL,1233,_binary '\0',1466,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary ''),(1228,1474,1,'2022-08-25 22:43:54.136000',_binary '\0','',_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Attorney',_binary '\0',_binary '\0',_binary '\0','Thai Inprint LA',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','',_binary '',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-10-25 23:24:53.296000',_binary '','',_binary '\0',_binary '',_binary '\0',NULL,1233,_binary '\0',1466,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary ''),(1228,1475,1,'2022-08-25 22:43:54.136000',_binary '\0','',_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Attorney',_binary '\0',_binary '',_binary '','Thai Inprint LA',_binary '\0','(626) 877-3058',_binary '',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','',_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-10-25 23:35:30.603000',_binary '','',_binary '\0',_binary '',_binary '\0',NULL,NULL,_binary '',1466,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary ''),(1228,1573,1,'2022-08-25 22:43:54.136000',_binary '\0','',_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Attorney',_binary '\0',_binary '\0',_binary '','Thai Inprint LA',_binary '\0','(626) 877-3058',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','',_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-10-31 06:37:54.049000',_binary '','',_binary '\0',_binary '',_binary '\0',NULL,111,_binary '',1466,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0'),(1235,1236,0,'2022-08-25 22:45:18.371000',_binary '',NULL,_binary '\0',_binary '',_binary '','aassfff@gmail.com',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Education',_binary '',_binary '\0',_binary '','USC University',_binary '','',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-08-25 22:45:18.371000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1233,_binary '',143,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1235,1238,1,'2022-08-25 22:45:18.371000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Education',_binary '\0',_binary '\0',_binary '\0','USC University',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-08-25 22:45:24.611000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1233,_binary '\0',143,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1235,1420,1,'2022-08-25 22:45:18.371000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Education',_binary '\0',_binary '\0',_binary '\0','USC University',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-10-21 00:30:41.062000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',NULL,1233,_binary '\0',1418,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0'),(1241,1242,0,'2022-08-25 22:45:58.566000',_binary '',NULL,_binary '\0',_binary '',_binary '','aassfff@gmail.com',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Japanese Restaurant',_binary '',_binary '\0',_binary '','Sushi Near Me',_binary '','',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-08-25 22:45:58.566000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1239,_binary '',154,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1241,1244,1,'2022-08-25 22:45:58.566000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Japanese Restaurant',_binary '\0',_binary '\0',_binary '\0','Sushi Near Me',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-08-25 22:46:04.161000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1239,_binary '\0',154,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1247,1248,0,'2022-08-25 22:46:35.698000',_binary '',NULL,_binary '\0',_binary '',_binary '','aassfff@gmail.com',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Information Technology',_binary '',_binary '\0',_binary '','Google',_binary '','',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-08-25 22:46:35.698000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1245,_binary '',153,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1247,1250,1,'2022-08-25 22:46:35.698000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Information Technology',_binary '\0',_binary '\0',_binary '\0','Google',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-08-25 22:46:41.588000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1245,_binary '\0',153,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1341,1342,0,'2022-10-04 00:06:53.953000',_binary '',NULL,_binary '\0',_binary '',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Thai Restaurant',_binary '',_binary '\0',_binary '','Kevin AAAA',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-10-04 00:06:53.953000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1339,_binary '',175,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1341,1345,1,'2022-10-04 00:06:53.953000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Thai Restaurant',_binary '\0',_binary '\0',_binary '\0','Kevin AAAA',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REJECTED',_binary '','2022-10-04 00:07:20.616000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1339,_binary '\0',175,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1347,1348,0,'2022-10-04 00:10:42.191000',_binary '',NULL,_binary '\0',_binary '',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Thai Restaurant',_binary '',_binary '\0',_binary '','Kevin AAAA',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-10-04 00:10:42.191000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1339,_binary '',175,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1347,1351,1,'2022-10-04 00:10:42.191000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Thai Restaurant',_binary '\0',_binary '\0',_binary '\0','Kevin AAAA',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REJECTED',_binary '','2022-10-04 02:27:41.207000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1339,_binary '\0',175,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1353,1354,0,'2022-10-04 02:28:45.672000',_binary '',NULL,_binary '\0',_binary '',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Attorney',_binary '',_binary '\0',_binary '','TEST REMOVE',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-10-04 02:28:45.672000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1339,_binary '',119,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1353,1357,1,'2022-10-04 02:28:45.672000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Attorney',_binary '\0',_binary '\0',_binary '\0','TEST REMOVE',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REJECTED',_binary '','2022-10-04 02:28:51.189000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1339,_binary '\0',119,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1359,1360,0,'2022-10-04 02:31:31.339000',_binary '',NULL,_binary '\0',_binary '',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Aquarium & Pet',_binary '',_binary '\0',_binary '','TEST',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-10-04 02:31:31.339000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1339,_binary '',118,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1359,1363,1,'2022-10-04 02:31:31.339000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','TEST',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-10-04 02:36:15.389000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1339,_binary '\0',118,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1359,1367,1,'2022-10-04 02:31:31.339000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','TEST',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REJECTED',_binary '','2022-10-04 02:41:11.116000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1339,_binary '\0',118,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1364,1365,0,'2022-10-04 02:39:07.607000',_binary '',NULL,_binary '\0',_binary '',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Bank',_binary '',_binary '\0',_binary '','TEST 2',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-10-04 02:39:07.607000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1339,_binary '',121,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1364,1374,1,'2022-10-04 02:39:07.607000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Bank',_binary '\0',_binary '\0',_binary '\0','TEST 2',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-10-04 02:56:30.462000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1339,_binary '\0',121,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1364,1379,1,'2022-10-04 02:39:07.607000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Bank',_binary '\0',_binary '\0',_binary '\0','TEST 2',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REJECTED',_binary '','2022-10-06 20:32:39.726000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1339,_binary '\0',121,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1368,1369,0,'2022-10-04 02:56:03.958000',_binary '',NULL,_binary '\0',_binary '',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Bodyshop',_binary '',_binary '\0',_binary '','TEST 3',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-10-04 02:56:03.958000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1339,_binary '',123,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1368,1375,1,'2022-10-04 02:56:03.958000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Bodyshop',_binary '\0',_binary '\0',_binary '\0','TEST 3',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-10-04 02:56:42.518000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1339,_binary '\0',123,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1368,1376,1,'2022-10-04 02:56:03.958000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Bodyshop',_binary '\0',_binary '\0',_binary '\0','TEST 3',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REJECTED',_binary '','2022-10-04 03:14:26.321000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1339,_binary '\0',123,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1371,1372,0,'2022-10-04 02:56:15.628000',_binary '',NULL,_binary '\0',_binary '',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Bookkeeping',_binary '',_binary '\0',_binary '','TEST 3',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-10-04 02:56:15.628000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1339,_binary '',125,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1371,1377,1,'2022-10-04 02:56:15.628000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Bookkeeping',_binary '\0',_binary '\0',_binary '\0','TEST 3',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REJECTED',_binary '','2022-10-04 03:43:58.148000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1339,_binary '\0',125,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1382,1383,0,'2022-10-06 20:54:33.233000',_binary '',NULL,_binary '\0',_binary '',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Aquarium & Pet',_binary '',_binary '\0',_binary '','Test',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-10-06 20:54:33.233000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1339,_binary '',118,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1382,1385,1,'2022-10-06 20:54:33.233000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','Test',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-10-06 20:55:06.558000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1339,_binary '\0',118,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1382,1387,1,'2022-10-06 20:54:33.233000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','Test',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REJECTED',_binary '','2022-10-06 20:56:41.512000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1339,_binary '\0',118,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1382,1390,1,'2022-10-06 20:54:33.233000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','Test',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-10-06 21:15:27.229000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1339,_binary '\0',118,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1382,1393,1,'2022-10-06 20:54:33.233000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','Test',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REJECTED',_binary '','2022-10-06 21:15:48.029000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1339,_binary '\0',118,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `company_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_cover_pictures`
--

DROP TABLE IF EXISTS `company_cover_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_cover_pictures` (
  `company_id` bigint NOT NULL,
  `cover_pictures_id` bigint NOT NULL,
  UNIQUE KEY `UK_ccrswlfublpabtsioi4p932rd` (`cover_pictures_id`),
  KEY `FKpem72xr8i8um7wlcxgv4sg7mk` (`company_id`),
  CONSTRAINT `FK4x5eurgt8ghxnm79yfq8tskch` FOREIGN KEY (`cover_pictures_id`) REFERENCES `storage` (`id`),
  CONSTRAINT `FKpem72xr8i8um7wlcxgv4sg7mk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_cover_pictures`
--

LOCK TABLES `company_cover_pictures` WRITE;
/*!40000 ALTER TABLE `company_cover_pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_cover_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_cover_pictures_aud`
--

DROP TABLE IF EXISTS `company_cover_pictures_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_cover_pictures_aud` (
  `rev` int NOT NULL,
  `company_id` bigint NOT NULL,
  `cover_pictures_id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`company_id`,`cover_pictures_id`),
  CONSTRAINT `FKr8iiyxg3kqpxd078lec2ak8hd` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_cover_pictures_aud`
--

LOCK TABLES `company_cover_pictures_aud` WRITE;
/*!40000 ALTER TABLE `company_cover_pictures_aud` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_cover_pictures_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_pictures`
--

DROP TABLE IF EXISTS `company_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_pictures` (
  `company_id` bigint NOT NULL,
  `pictures_id` bigint NOT NULL,
  UNIQUE KEY `UK_ixa0nlho8hv6oaygc8gatsvw0` (`pictures_id`),
  KEY `FK6isbdipxds32lkl5dv47lv9kj` (`company_id`),
  CONSTRAINT `FK6isbdipxds32lkl5dv47lv9kj` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FKlb3lipq0u1tga7stxmqykwj74` FOREIGN KEY (`pictures_id`) REFERENCES `storage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_pictures`
--

LOCK TABLES `company_pictures` WRITE;
/*!40000 ALTER TABLE `company_pictures` DISABLE KEYS */;
INSERT INTO `company_pictures` VALUES (1228,1454);
/*!40000 ALTER TABLE `company_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_pictures_aud`
--

DROP TABLE IF EXISTS `company_pictures_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_pictures_aud` (
  `rev` int NOT NULL,
  `company_id` bigint NOT NULL,
  `pictures_id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`company_id`,`pictures_id`),
  CONSTRAINT `FKbhg05tku50xmchc9unlilii4j` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_pictures_aud`
--

LOCK TABLES `company_pictures_aud` WRITE;
/*!40000 ALTER TABLE `company_pictures_aud` DISABLE KEYS */;
INSERT INTO `company_pictures_aud` VALUES (1456,1228,1454,0);
/*!40000 ALTER TABLE `company_pictures_aud` ENABLE KEYS */;
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
-- Table structure for table `deal`
--

DROP TABLE IF EXISTS `deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deal` (
  `id` bigint NOT NULL,
  `deal_category` varchar(255) DEFAULT NULL,
  `deal_created_on` datetime(6) DEFAULT NULL,
  `deal_description` longtext,
  `deal_expired_on` datetime(6) DEFAULT NULL,
  `deal_status` varchar(255) DEFAULT NULL,
  `deal_title` varchar(255) DEFAULT NULL,
  `deal_updated_on` datetime(6) DEFAULT NULL,
  `deal_location_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3svbfnjdm8jlta6c72peyayq5` (`deal_location_id`),
  CONSTRAINT `FK3svbfnjdm8jlta6c72peyayq5` FOREIGN KEY (`deal_location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deal`
--

LOCK TABLES `deal` WRITE;
/*!40000 ALTER TABLE `deal` DISABLE KEYS */;
INSERT INTO `deal` VALUES (1291,'Clothing & Accessories','2022-09-13 21:59:14.222000',NULL,'2022-10-25 07:00:00.000000','REMOVED','FFFFFFFaaaggggg','2022-10-31 00:47:06.979000',12),(1509,NULL,'2022-10-28 06:15:13.937000',NULL,NULL,'REMOVED','New Deal','2022-10-31 02:11:03.135000',24),(1521,NULL,'2022-10-28 23:02:16.014000',NULL,NULL,'REMOVED','Designer','2022-10-31 02:12:58.727000',1517),(1688,'','2022-11-05 02:31:37.529000','',NULL,'AVAILABLE','Test new review','2022-11-05 02:31:37.529000',1524);
/*!40000 ALTER TABLE `deal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deal_aud`
--

DROP TABLE IF EXISTS `deal_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deal_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `deal_category` varchar(255) DEFAULT NULL,
  `category_mod` bit(1) DEFAULT NULL,
  `deal_created_on` datetime(6) DEFAULT NULL,
  `created_on_mod` bit(1) DEFAULT NULL,
  `deal_description` longtext,
  `description_mod` bit(1) DEFAULT NULL,
  `deal_expired_on` datetime(6) DEFAULT NULL,
  `expired_on_mod` bit(1) DEFAULT NULL,
  `deal_status` varchar(255) DEFAULT NULL,
  `status_mod` bit(1) DEFAULT NULL,
  `deal_title` varchar(255) DEFAULT NULL,
  `title_mod` bit(1) DEFAULT NULL,
  `deal_updated_on` datetime(6) DEFAULT NULL,
  `updated_on_mod` bit(1) DEFAULT NULL,
  `contact_info_mod` bit(1) DEFAULT NULL,
  `deal_location_id` bigint DEFAULT NULL,
  `location_mod` bit(1) DEFAULT NULL,
  `pictures_mod` bit(1) DEFAULT NULL,
  `post_mod` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`rev`),
  KEY `FK4s40fn3o9sesj8h3jj7b3vod3` (`rev`),
  CONSTRAINT `FK4s40fn3o9sesj8h3jj7b3vod3` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deal_aud`
--

LOCK TABLES `deal_aud` WRITE;
/*!40000 ALTER TABLE `deal_aud` DISABLE KEYS */;
INSERT INTO `deal_aud` VALUES (1291,1292,0,NULL,_binary '\0','2022-09-13 21:59:14.222000',_binary '',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '','New deal',_binary '','2022-09-13 21:59:14.222000',_binary '',_binary '',12,_binary '',_binary '',NULL),(1291,1295,1,NULL,_binary '\0','2022-09-13 21:59:14.222000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '\0','test Deal ssáđa',_binary '','2022-09-13 22:01:31.277000',_binary '',_binary '\0',12,_binary '\0',_binary '\0',NULL),(1291,1296,1,NULL,_binary '\0','2022-09-13 21:59:14.222000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '\0','test Deal ssáđa',_binary '\0','2022-09-13 22:01:31.561000',_binary '',_binary '\0',12,_binary '\0',_binary '',NULL),(1291,1396,1,NULL,_binary '\0','2022-09-13 21:59:14.222000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '\0','test Deal ssáđa',_binary '\0','2022-10-13 21:56:21.056000',_binary '',_binary '\0',12,_binary '\0',_binary '',NULL),(1291,1401,1,NULL,_binary '\0','2022-09-13 21:59:14.222000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '\0','asdasdasasdasddad dasd asd dasdasd adaa asd sda dsd asdas',_binary '','2022-10-14 01:43:52.166000',_binary '',_binary '\0',12,_binary '\0',_binary '\0',NULL),(1291,1494,1,NULL,_binary '\0','2022-09-13 21:59:14.222000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','PRIVATE',_binary '','asdasdasasdasddad dasd asd dasdasd adaa asd sda dsd asdas',_binary '\0','2022-10-27 02:05:10.953000',_binary '',_binary '\0',12,_binary '\0',_binary '\0',NULL),(1291,1495,1,NULL,_binary '\0','2022-09-13 21:59:14.222000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '','asdasdasasdasddad dasd asd dasdasd adaa asd sda dsd asdas',_binary '\0','2022-10-27 02:17:55.629000',_binary '',_binary '\0',12,_binary '\0',_binary '\0',NULL),(1291,1496,1,NULL,_binary '\0','2022-09-13 21:59:14.222000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '\0','aaa',_binary '','2022-10-28 05:05:57.869000',_binary '',_binary '\0',12,_binary '\0',_binary '\0',NULL),(1291,1497,1,NULL,_binary '\0','2022-09-13 21:59:14.222000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '\0','aaaggggg',_binary '','2022-10-28 05:24:00.251000',_binary '',_binary '',12,_binary '\0',_binary '',NULL),(1291,1498,1,NULL,_binary '\0','2022-09-13 21:59:14.222000',_binary '\0',NULL,_binary '\0','2022-10-25 07:00:00.755000',_binary '','AVAILABLE',_binary '\0','aaaggggg',_binary '\0','2022-10-28 05:24:21.127000',_binary '',_binary '',12,_binary '\0',_binary '',NULL),(1291,1499,1,'Clothing & Accessories',_binary '','2022-09-13 21:59:14.222000',_binary '\0',NULL,_binary '\0','2022-10-25 07:00:00.000000',_binary '','AVAILABLE',_binary '\0','aaaggggg',_binary '\0','2022-10-28 05:26:07.722000',_binary '',_binary '',12,_binary '\0',_binary '',NULL),(1291,1502,1,'Clothing & Accessories',_binary '\0','2022-09-13 21:59:14.222000',_binary '\0',NULL,_binary '\0','2022-10-25 07:00:00.000000',_binary '\0','AVAILABLE',_binary '\0','aaaggggg',_binary '\0','2022-10-28 05:26:22.460000',_binary '',_binary '',12,_binary '\0',_binary '',NULL),(1291,1503,1,'Clothing & Accessories',_binary '\0','2022-09-13 21:59:14.222000',_binary '\0',NULL,_binary '\0','2022-10-25 07:00:00.000000',_binary '\0','AVAILABLE',_binary '\0','aaaggggg',_binary '\0','2022-10-28 05:30:19.915000',_binary '',_binary '',12,_binary '\0',_binary '',NULL),(1291,1504,1,'Clothing & Accessories',_binary '\0','2022-09-13 21:59:14.222000',_binary '\0',NULL,_binary '\0','2022-10-25 07:00:00.000000',_binary '\0','AVAILABLE',_binary '\0','aaaggggg',_binary '\0','2022-10-28 05:31:26.776000',_binary '',_binary '',12,_binary '\0',_binary '',NULL),(1291,1512,1,'Clothing & Accessories',_binary '\0','2022-09-13 21:59:14.222000',_binary '\0',NULL,_binary '\0','2022-10-25 07:00:00.000000',_binary '\0','PRIVATE',_binary '','aaaggggg',_binary '\0','2022-10-28 06:45:44.858000',_binary '',_binary '',12,_binary '\0',_binary '',NULL),(1291,1513,1,'Clothing & Accessories',_binary '\0','2022-09-13 21:59:14.222000',_binary '\0',NULL,_binary '\0','2022-10-25 07:00:00.000000',_binary '\0','AVAILABLE',_binary '','aaaggggg',_binary '\0','2022-10-28 21:23:59.133000',_binary '',_binary '',12,_binary '\0',_binary '',NULL),(1291,1514,1,'Clothing & Accessories',_binary '\0','2022-09-13 21:59:14.222000',_binary '\0',NULL,_binary '\0','2022-10-25 07:00:00.000000',_binary '\0','AVAILABLE',_binary '\0','FFFFFFFaaaggggg',_binary '','2022-10-28 22:40:17.911000',_binary '',_binary '',12,_binary '\0',_binary '',NULL),(1291,1562,1,'Clothing & Accessories',_binary '\0','2022-09-13 21:59:14.222000',_binary '\0',NULL,_binary '\0','2022-10-25 07:00:00.000000',_binary '\0','REMOVED',_binary '','FFFFFFFaaaggggg',_binary '\0','2022-10-31 00:47:06.979000',_binary '',_binary '\0',12,_binary '\0',_binary '\0',NULL),(1509,1510,0,NULL,_binary '\0','2022-10-28 06:15:13.937000',_binary '',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '','New Deal',_binary '','2022-10-28 06:15:13.937000',_binary '',_binary '',24,_binary '',_binary '',NULL),(1509,1571,1,NULL,_binary '\0','2022-10-28 06:15:13.937000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','REMOVED',_binary '','New Deal',_binary '\0','2022-10-31 02:11:03.135000',_binary '',_binary '\0',24,_binary '\0',_binary '\0',NULL),(1521,1522,0,NULL,_binary '\0','2022-10-28 23:02:16.014000',_binary '',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '','Designer',_binary '','2022-10-28 23:02:16.014000',_binary '',_binary '',1517,_binary '',_binary '',NULL),(1521,1572,1,NULL,_binary '\0','2022-10-28 23:02:16.014000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','REMOVED',_binary '','Designer',_binary '\0','2022-10-31 02:12:58.727000',_binary '',_binary '\0',1517,_binary '\0',_binary '\0',NULL),(1688,1689,0,'',_binary '','2022-11-05 02:31:37.529000',_binary '','',_binary '',NULL,_binary '\0','AVAILABLE',_binary '','Test new review',_binary '','2022-11-05 02:31:37.529000',_binary '',_binary '',1524,_binary '',_binary '',NULL);
/*!40000 ALTER TABLE `deal_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deal_contact_info`
--

DROP TABLE IF EXISTS `deal_contact_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deal_contact_info` (
  `deal_id` bigint NOT NULL,
  `contact_value` varchar(255) DEFAULT NULL,
  `contact_field` varchar(255) NOT NULL,
  PRIMARY KEY (`deal_id`,`contact_field`),
  CONSTRAINT `FKun0usoc9ew95xe4eou99s2wi` FOREIGN KEY (`deal_id`) REFERENCES `deal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deal_contact_info`
--

LOCK TABLES `deal_contact_info` WRITE;
/*!40000 ALTER TABLE `deal_contact_info` DISABLE KEYS */;
INSERT INTO `deal_contact_info` VALUES (1291,'kvngo@tmail.com','email'),(1291,'(626) 877-3058','phone'),(1509,'https://tedkvn.com','website'),(1521,'(626) 877-3058','phone'),(1688,'kvngo@tmail.com','email');
/*!40000 ALTER TABLE `deal_contact_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deal_contact_info_aud`
--

DROP TABLE IF EXISTS `deal_contact_info_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deal_contact_info_aud` (
  `rev` int NOT NULL,
  `deal_id` bigint NOT NULL,
  `contact_value` varchar(255) NOT NULL,
  `contact_field` varchar(255) NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`deal_id`,`contact_value`,`contact_field`),
  CONSTRAINT `FK6tcneg3s0pooul031fk1scje4` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deal_contact_info_aud`
--

LOCK TABLES `deal_contact_info_aud` WRITE;
/*!40000 ALTER TABLE `deal_contact_info_aud` DISABLE KEYS */;
INSERT INTO `deal_contact_info_aud` VALUES (1292,1291,'kvngo@tedkvn.com','email',0),(1503,1291,'(626) 877-3058','email',0),(1503,1291,'kvngo@tedkvn.com','email',2),(1504,1291,'(626) 877-3058','email',2),(1504,1291,'(626) 877-3058','phone',0),(1504,1291,'kvngo@tmail.com','email',0),(1510,1509,'https://tedkvn.com','website',0),(1522,1521,'(626) 877-3058','phone',0),(1689,1688,'kvngo@tmail.com','email',0);
/*!40000 ALTER TABLE `deal_contact_info_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deal_pictures`
--

DROP TABLE IF EXISTS `deal_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deal_pictures` (
  `deal_id` bigint NOT NULL,
  `pictures_id` bigint NOT NULL,
  UNIQUE KEY `UK_n2gjcjpfdy4pvbobp0r9sryk5` (`pictures_id`),
  KEY `FKmldt70dihnah1uss6h78m3t7r` (`deal_id`),
  CONSTRAINT `FK5tvthx8wf0w3hm9la676shrlf` FOREIGN KEY (`pictures_id`) REFERENCES `storage` (`id`),
  CONSTRAINT `FKmldt70dihnah1uss6h78m3t7r` FOREIGN KEY (`deal_id`) REFERENCES `deal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deal_pictures`
--

LOCK TABLES `deal_pictures` WRITE;
/*!40000 ALTER TABLE `deal_pictures` DISABLE KEYS */;
INSERT INTO `deal_pictures` VALUES (1291,159),(1291,164),(1291,1500),(1509,1505),(1509,1507),(1521,1519),(1688,1686);
/*!40000 ALTER TABLE `deal_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deal_pictures_aud`
--

DROP TABLE IF EXISTS `deal_pictures_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deal_pictures_aud` (
  `rev` int NOT NULL,
  `deal_id` bigint NOT NULL,
  `pictures_id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`deal_id`,`pictures_id`),
  CONSTRAINT `FKas46yixfeuom8ygjiebsvhh40` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deal_pictures_aud`
--

LOCK TABLES `deal_pictures_aud` WRITE;
/*!40000 ALTER TABLE `deal_pictures_aud` DISABLE KEYS */;
INSERT INTO `deal_pictures_aud` VALUES (1292,1291,181,0),(1296,1291,181,2),(1296,1291,1294,0),(1396,1291,159,0),(1396,1291,161,0),(1396,1291,164,0),(1396,1291,1294,2),(1502,1291,161,2),(1502,1291,1500,0),(1510,1509,1505,0),(1510,1509,1507,0),(1522,1521,1519,0),(1689,1688,1686,0);
/*!40000 ALTER TABLE `deal_pictures_aud` ENABLE KEYS */;
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
INSERT INTO `hibernate_sequence` VALUES (1713);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housing`
--

DROP TABLE IF EXISTS `housing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `housing` (
  `id` bigint NOT NULL,
  `housing_annual_cost` double DEFAULT NULL,
  `housing_category` varchar(255) DEFAULT NULL,
  `housing_created_on` datetime(6) DEFAULT NULL,
  `housing_daily_cost` double DEFAULT NULL,
  `housing_deposit_cost` double DEFAULT NULL,
  `housing_description` longtext,
  `housing_expired_on` datetime(6) DEFAULT NULL,
  `housing_monthly_cost` double DEFAULT NULL,
  `housing_status` varchar(255) DEFAULT NULL,
  `housing_title` varchar(255) DEFAULT NULL,
  `housing_type` varchar(255) DEFAULT NULL,
  `housing_updated_on` datetime(6) DEFAULT NULL,
  `housing_location_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4h4dvwaalxgkdr5c4ugk6yegj` (`housing_location_id`),
  CONSTRAINT `FK4h4dvwaalxgkdr5c4ugk6yegj` FOREIGN KEY (`housing_location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housing`
--

LOCK TABLES `housing` WRITE;
/*!40000 ALTER TABLE `housing` DISABLE KEYS */;
INSERT INTO `housing` VALUES (1297,NULL,'Apartment','2022-09-13 22:06:07.781000',NULL,8000,'','2022-10-30 23:02:18.320000',4000,'DELETED','Shared Apartment','Entire','2022-10-31 00:18:50.858000',1245),(1546,NULL,'Apartment','2022-10-30 23:13:34.567000',NULL,NULL,'',NULL,NULL,'AVAILABLE','House for sell','Private','2022-10-30 23:21:41.429000',111);
/*!40000 ALTER TABLE `housing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housing_amenities`
--

DROP TABLE IF EXISTS `housing_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `housing_amenities` (
  `housing_id` bigint NOT NULL,
  `amenities` varchar(255) DEFAULT NULL,
  KEY `FKikk7rx1rvdm8fhp491299wxw7` (`housing_id`),
  CONSTRAINT `FKikk7rx1rvdm8fhp491299wxw7` FOREIGN KEY (`housing_id`) REFERENCES `housing` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housing_amenities`
--

LOCK TABLES `housing_amenities` WRITE;
/*!40000 ALTER TABLE `housing_amenities` DISABLE KEYS */;
INSERT INTO `housing_amenities` VALUES (1297,'Air Conditioner'),(1297,'Dryer'),(1297,'Microwave'),(1297,'Pet Allowed'),(1297,'Refrigerator'),(1297,'Washer'),(1297,'Wifi'),(1546,'Pet Allowed'),(1546,'Washer'),(1546,'Wifi');
/*!40000 ALTER TABLE `housing_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housing_amenities_aud`
--

DROP TABLE IF EXISTS `housing_amenities_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `housing_amenities_aud` (
  `rev` int NOT NULL,
  `housing_id` bigint NOT NULL,
  `amenities` varchar(255) NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`housing_id`,`amenities`),
  CONSTRAINT `FKagsdwqx40eoxhdbd8998ixd83` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housing_amenities_aud`
--

LOCK TABLES `housing_amenities_aud` WRITE;
/*!40000 ALTER TABLE `housing_amenities_aud` DISABLE KEYS */;
INSERT INTO `housing_amenities_aud` VALUES (1298,1297,'Air Conditioner',0),(1298,1297,'Pet allowed',0),(1298,1297,'Refrigerator',0),(1298,1297,'Wifi',0),(1537,1297,'Dryer',0),(1537,1297,'Microwave',0),(1537,1297,'Pet allowed',2),(1543,1297,'Pet Allowed',0),(1543,1297,'Washer',0),(1549,1546,'Pet Allowed',0),(1549,1546,'Washer',0),(1549,1546,'Wifi',0);
/*!40000 ALTER TABLE `housing_amenities_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housing_aud`
--

DROP TABLE IF EXISTS `housing_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `housing_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `housing_annual_cost` double DEFAULT NULL,
  `annual_cost_mod` bit(1) DEFAULT NULL,
  `housing_category` varchar(255) DEFAULT NULL,
  `category_mod` bit(1) DEFAULT NULL,
  `housing_created_on` datetime(6) DEFAULT NULL,
  `created_on_mod` bit(1) DEFAULT NULL,
  `housing_daily_cost` double DEFAULT NULL,
  `daily_cost_mod` bit(1) DEFAULT NULL,
  `housing_deposit_cost` double DEFAULT NULL,
  `deposit_cost_mod` bit(1) DEFAULT NULL,
  `housing_description` longtext,
  `description_mod` bit(1) DEFAULT NULL,
  `housing_expired_on` datetime(6) DEFAULT NULL,
  `expired_on_mod` bit(1) DEFAULT NULL,
  `housing_monthly_cost` double DEFAULT NULL,
  `monthly_cost_mod` bit(1) DEFAULT NULL,
  `housing_status` varchar(255) DEFAULT NULL,
  `status_mod` bit(1) DEFAULT NULL,
  `housing_title` varchar(255) DEFAULT NULL,
  `title_mod` bit(1) DEFAULT NULL,
  `housing_type` varchar(255) DEFAULT NULL,
  `type_mod` bit(1) DEFAULT NULL,
  `housing_updated_on` datetime(6) DEFAULT NULL,
  `updated_on_mod` bit(1) DEFAULT NULL,
  `amenities_mod` bit(1) DEFAULT NULL,
  `contact_info_mod` bit(1) DEFAULT NULL,
  `interior_mod` bit(1) DEFAULT NULL,
  `housing_location_id` bigint DEFAULT NULL,
  `location_mod` bit(1) DEFAULT NULL,
  `pictures_mod` bit(1) DEFAULT NULL,
  `post_mod` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`rev`),
  KEY `FKij8dvjdee7p2pa55e7vdd75o9` (`rev`),
  CONSTRAINT `FKij8dvjdee7p2pa55e7vdd75o9` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housing_aud`
--

LOCK TABLES `housing_aud` WRITE;
/*!40000 ALTER TABLE `housing_aud` DISABLE KEYS */;
INSERT INTO `housing_aud` VALUES (1297,1298,0,45000,_binary '','Condo',_binary '','2022-09-13 22:06:07.781000',_binary '',250,_binary '',8000,_binary '',NULL,_binary '\0',NULL,_binary '\0',4000,_binary '','AVAILABLE',_binary '','Shared Studio',_binary '','Shared',_binary '','2022-09-13 22:06:07.781000',_binary '',_binary '',_binary '',_binary '',1245,_binary '',_binary '',NULL),(1297,1300,1,45000,_binary '\0','Studio',_binary '','2022-09-13 22:06:07.781000',_binary '\0',250,_binary '\0',8000,_binary '\0',NULL,_binary '\0',NULL,_binary '\0',4000,_binary '\0','AVAILABLE',_binary '\0','Shared Studio',_binary '\0','Shared',_binary '\0','2022-09-13 22:41:20.636000',_binary '',_binary '\0',_binary '\0',_binary '\0',1245,_binary '\0',_binary '\0',NULL),(1297,1535,1,45000,_binary '\0','Studio',_binary '\0','2022-09-13 22:06:07.781000',_binary '\0',250,_binary '\0',8000,_binary '\0',NULL,_binary '\0',NULL,_binary '\0',4000,_binary '\0','AVAILABLE',_binary '\0','Shared Studio',_binary '\0','Shared',_binary '\0','2022-10-29 04:06:22.566000',_binary '',_binary '',_binary '',_binary '',1245,_binary '\0',_binary '\0',NULL),(1297,1537,1,450000000,_binary '','Studio',_binary '\0','2022-09-13 22:06:07.781000',_binary '\0',NULL,_binary '',8000,_binary '\0',NULL,_binary '\0','2022-10-27 07:00:00.221000',_binary '',4000,_binary '\0','AVAILABLE',_binary '\0','Shared Studio',_binary '\0','Condo',_binary '','2022-10-29 04:28:04.611000',_binary '',_binary '',_binary '',_binary '',1245,_binary '\0',_binary '',NULL),(1297,1538,1,450000000,_binary '\0','Studio',_binary '\0','2022-09-13 22:06:07.781000',_binary '\0',NULL,_binary '\0',8000,_binary '\0',NULL,_binary '\0','2022-10-27 07:00:00.000000',_binary '',4000,_binary '\0','AVAILABLE',_binary '\0','Shared Studio',_binary '\0','Condo',_binary '\0','2022-10-29 04:33:32.459000',_binary '',_binary '',_binary '',_binary '',1245,_binary '\0',_binary '',NULL),(1297,1539,1,450000000,_binary '\0','Studio',_binary '\0','2022-09-13 22:06:07.781000',_binary '\0',NULL,_binary '\0',8000,_binary '\0',NULL,_binary '\0','2022-10-27 07:00:00.000000',_binary '\0',4000,_binary '\0','AVAILABLE',_binary '\0','Shared Studio',_binary '\0','Shared',_binary '','2022-10-29 04:41:17.369000',_binary '',_binary '',_binary '',_binary '',1245,_binary '\0',_binary '',NULL),(1297,1540,1,450000000,_binary '\0','Studio',_binary '\0','2022-09-13 22:06:07.781000',_binary '\0',-1,_binary '',8000,_binary '\0','',_binary '','2022-10-27 07:00:00.000000',_binary '\0',4000,_binary '\0','AVAILABLE',_binary '\0','Shared Studio',_binary '\0','Entire',_binary '','2022-10-29 05:00:50.976000',_binary '',_binary '',_binary '',_binary '',1245,_binary '\0',_binary '',NULL),(1297,1541,1,450000000,_binary '\0','Studio duplex',_binary '','2022-09-13 22:06:07.781000',_binary '\0',-1,_binary '\0',8000,_binary '\0','',_binary '\0','2022-10-27 07:00:00.000000',_binary '\0',4000,_binary '\0','AVAILABLE',_binary '\0','Shared Studio',_binary '\0','Entire',_binary '\0','2022-10-29 05:01:03.675000',_binary '',_binary '',_binary '',_binary '',1245,_binary '\0',_binary '',NULL),(1297,1542,1,450000000,_binary '\0','Studio duplex',_binary '\0','2022-09-13 22:06:07.781000',_binary '\0',NULL,_binary '',8000,_binary '\0','',_binary '\0','2022-10-27 07:00:00.000000',_binary '\0',4000,_binary '\0','AVAILABLE',_binary '\0','Shared Studio',_binary '\0','Entire',_binary '\0','2022-10-29 05:02:45.808000',_binary '',_binary '',_binary '',_binary '',1245,_binary '\0',_binary '',NULL),(1297,1543,1,NULL,_binary '','Apartment',_binary '','2022-09-13 22:06:07.781000',_binary '\0',NULL,_binary '\0',8000,_binary '\0','',_binary '\0','2022-10-30 23:02:18.320000',_binary '',4000,_binary '\0','AVAILABLE',_binary '\0','Shared Apartment',_binary '','Entire',_binary '\0','2022-10-30 23:02:21.059000',_binary '',_binary '',_binary '',_binary '',1245,_binary '\0',_binary '',NULL),(1297,1560,1,NULL,_binary '\0','Apartment',_binary '\0','2022-09-13 22:06:07.781000',_binary '\0',NULL,_binary '\0',8000,_binary '\0','',_binary '\0','2022-10-30 23:02:18.320000',_binary '\0',4000,_binary '\0','DELETED',_binary '','Shared Apartment',_binary '\0','Entire',_binary '\0','2022-10-31 00:18:50.858000',_binary '',_binary '\0',_binary '\0',_binary '\0',1245,_binary '\0',_binary '\0',NULL),(1546,1547,0,NULL,_binary '\0','',_binary '','2022-10-30 23:13:34.567000',_binary '',NULL,_binary '\0',NULL,_binary '\0','',_binary '',NULL,_binary '\0',NULL,_binary '\0','PRIVATE',_binary '','House for sell',_binary '','',_binary '','2022-10-30 23:13:34.567000',_binary '',_binary '',_binary '',_binary '',111,_binary '',_binary '',NULL),(1546,1549,1,NULL,_binary '\0','Apartment',_binary '','2022-10-30 23:13:34.567000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','PRIVATE',_binary '\0','House for sell',_binary '\0','Private',_binary '','2022-10-30 23:16:40.249000',_binary '',_binary '',_binary '',_binary '\0',111,_binary '\0',_binary '',NULL),(1546,1550,1,NULL,_binary '\0','Apartment',_binary '\0','2022-10-30 23:13:34.567000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '','House for sell',_binary '\0','Private',_binary '\0','2022-10-30 23:21:41.429000',_binary '',_binary '',_binary '',_binary '\0',111,_binary '\0',_binary '',NULL);
/*!40000 ALTER TABLE `housing_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housing_contact_info`
--

DROP TABLE IF EXISTS `housing_contact_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `housing_contact_info` (
  `housing_id` bigint NOT NULL,
  `contact_value` varchar(255) DEFAULT NULL,
  `contact_field` varchar(255) NOT NULL,
  PRIMARY KEY (`housing_id`,`contact_field`),
  CONSTRAINT `FKn7hkhu8li2cuy7lix915px52k` FOREIGN KEY (`housing_id`) REFERENCES `housing` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housing_contact_info`
--

LOCK TABLES `housing_contact_info` WRITE;
/*!40000 ALTER TABLE `housing_contact_info` DISABLE KEYS */;
INSERT INTO `housing_contact_info` VALUES (1297,'kvngo@tedkvn.com','email'),(1297,'https://tedkvn.com','website'),(1546,'(626) 877-3058','phone');
/*!40000 ALTER TABLE `housing_contact_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housing_contact_info_aud`
--

DROP TABLE IF EXISTS `housing_contact_info_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `housing_contact_info_aud` (
  `rev` int NOT NULL,
  `housing_id` bigint NOT NULL,
  `contact_value` varchar(255) NOT NULL,
  `contact_field` varchar(255) NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`housing_id`,`contact_value`,`contact_field`),
  CONSTRAINT `FKmndjl7wuvxlcsyohqqwnp777u` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housing_contact_info_aud`
--

LOCK TABLES `housing_contact_info_aud` WRITE;
/*!40000 ALTER TABLE `housing_contact_info_aud` DISABLE KEYS */;
INSERT INTO `housing_contact_info_aud` VALUES (1298,1297,'kvngo@tedkvn.com','email',0),(1542,1297,'https://tedkvn.com','website',0),(1547,1546,'(626) 877-3058','phone',0);
/*!40000 ALTER TABLE `housing_contact_info_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housing_interior`
--

DROP TABLE IF EXISTS `housing_interior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `housing_interior` (
  `housing_id` bigint NOT NULL,
  `interior_value` int DEFAULT NULL,
  `interior_field` varchar(255) NOT NULL,
  PRIMARY KEY (`housing_id`,`interior_field`),
  CONSTRAINT `FK4uuiqr65i3uo5hwg4wa8pcrar` FOREIGN KEY (`housing_id`) REFERENCES `housing` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housing_interior`
--

LOCK TABLES `housing_interior` WRITE;
/*!40000 ALTER TABLE `housing_interior` DISABLE KEYS */;
INSERT INTO `housing_interior` VALUES (1297,2,'bath'),(1297,2,'guest'),(1297,5,'parking');
/*!40000 ALTER TABLE `housing_interior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housing_interior_aud`
--

DROP TABLE IF EXISTS `housing_interior_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `housing_interior_aud` (
  `rev` int NOT NULL,
  `housing_id` bigint NOT NULL,
  `interior_value` int NOT NULL,
  `interior_field` varchar(255) NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`housing_id`,`interior_value`,`interior_field`),
  CONSTRAINT `FKpibwppd87s3tn9taq9o40co49` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housing_interior_aud`
--

LOCK TABLES `housing_interior_aud` WRITE;
/*!40000 ALTER TABLE `housing_interior_aud` DISABLE KEYS */;
INSERT INTO `housing_interior_aud` VALUES (1298,1297,2,'bath',0),(1298,1297,2,'bed',0),(1298,1297,2,'guest',0),(1298,1297,5,'parking',0),(1543,1297,2,'bed',2);
/*!40000 ALTER TABLE `housing_interior_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housing_pictures`
--

DROP TABLE IF EXISTS `housing_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `housing_pictures` (
  `housing_id` bigint NOT NULL,
  `pictures_id` bigint NOT NULL,
  UNIQUE KEY `UK_rhwvgki7jrnhm64cxnb2tcg0y` (`pictures_id`),
  KEY `FKoy4ukfdsylyry2s8hvg6l3h2j` (`housing_id`),
  CONSTRAINT `FK6sgjvyhsu1sim35f36d2elrss` FOREIGN KEY (`pictures_id`) REFERENCES `storage` (`id`),
  CONSTRAINT `FKoy4ukfdsylyry2s8hvg6l3h2j` FOREIGN KEY (`housing_id`) REFERENCES `housing` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housing_pictures`
--

LOCK TABLES `housing_pictures` WRITE;
/*!40000 ALTER TABLE `housing_pictures` DISABLE KEYS */;
INSERT INTO `housing_pictures` VALUES (1297,123),(1546,1544);
/*!40000 ALTER TABLE `housing_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housing_pictures_aud`
--

DROP TABLE IF EXISTS `housing_pictures_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `housing_pictures_aud` (
  `rev` int NOT NULL,
  `housing_id` bigint NOT NULL,
  `pictures_id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`housing_id`,`pictures_id`),
  CONSTRAINT `FKmj87daei9x7tmfb3w0bjh9wsw` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housing_pictures_aud`
--

LOCK TABLES `housing_pictures_aud` WRITE;
/*!40000 ALTER TABLE `housing_pictures_aud` DISABLE KEYS */;
INSERT INTO `housing_pictures_aud` VALUES (1298,1297,123,0),(1547,1546,1544,0);
/*!40000 ALTER TABLE `housing_pictures_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` bigint NOT NULL,
  `job_created_on` datetime(6) DEFAULT NULL,
  `job_description` longtext,
  `job_experience` varchar(255) DEFAULT NULL,
  `job_expired_on` datetime(6) DEFAULT NULL,
  `is_job_remote` bit(1) DEFAULT NULL,
  `job_salary` varchar(255) DEFAULT NULL,
  `job_skills` varchar(255) DEFAULT NULL,
  `job_status` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `job_updated_on` datetime(6) DEFAULT NULL,
  `job_location_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK49ifw677f13497oya5lvxhxuk` (`job_location_id`),
  CONSTRAINT `FK49ifw677f13497oya5lvxhxuk` FOREIGN KEY (`job_location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1301,'2022-09-13 22:44:29.777000',NULL,'3-5 years','2022-10-28 22:43:51.000000',_binary '\0',NULL,NULL,'REMOVED','test Job','2022-10-31 00:50:38.971000',1245),(1305,'2022-09-13 22:54:12.546000',NULL,'No experience',NULL,_binary '\0',NULL,NULL,'REMOVED','Fullll dasdl asdasdas  dlalsd lals dlasl dla sldl','2022-10-31 02:09:37.317000',1199),(1528,'2022-10-28 23:08:35.924000',NULL,'No experience','2022-10-29 23:08:29.193000',_binary '','$16 per hour','Self-learning','AVAILABLE','Developer','2022-10-28 23:08:35.924000',1524);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_aud`
--

DROP TABLE IF EXISTS `job_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `job_created_on` datetime(6) DEFAULT NULL,
  `created_on_mod` bit(1) DEFAULT NULL,
  `job_description` longtext,
  `description_mod` bit(1) DEFAULT NULL,
  `job_experience` varchar(255) DEFAULT NULL,
  `experience_mod` bit(1) DEFAULT NULL,
  `job_expired_on` datetime(6) DEFAULT NULL,
  `expired_on_mod` bit(1) DEFAULT NULL,
  `is_job_remote` bit(1) DEFAULT NULL,
  `remote_mod` bit(1) DEFAULT NULL,
  `job_salary` varchar(255) DEFAULT NULL,
  `salary_mod` bit(1) DEFAULT NULL,
  `job_skills` varchar(255) DEFAULT NULL,
  `skills_mod` bit(1) DEFAULT NULL,
  `job_status` varchar(255) DEFAULT NULL,
  `status_mod` bit(1) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `title_mod` bit(1) DEFAULT NULL,
  `job_updated_on` datetime(6) DEFAULT NULL,
  `updated_on_mod` bit(1) DEFAULT NULL,
  `contact_info_mod` bit(1) DEFAULT NULL,
  `job_location_id` bigint DEFAULT NULL,
  `location_mod` bit(1) DEFAULT NULL,
  `pictures_mod` bit(1) DEFAULT NULL,
  `positions_mod` bit(1) DEFAULT NULL,
  `post_mod` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`rev`),
  KEY `FK9swk7gplg965elsfba63d1wsl` (`rev`),
  CONSTRAINT `FK9swk7gplg965elsfba63d1wsl` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_aud`
--

LOCK TABLES `job_aud` WRITE;
/*!40000 ALTER TABLE `job_aud` DISABLE KEYS */;
INSERT INTO `job_aud` VALUES (1301,1302,0,'2022-09-13 22:44:29.777000',_binary '',NULL,_binary '\0','No experience',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '','Volunteer work',_binary '','2022-09-13 22:44:29.777000',_binary '',_binary '',1245,_binary '',_binary '',_binary '',NULL),(1301,1304,1,'2022-09-13 22:44:29.777000',_binary '\0',NULL,_binary '\0','No experience',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '\0','test Deal',_binary '','2022-09-13 22:45:06.648000',_binary '',_binary '\0',1245,_binary '\0',_binary '\0',_binary '\0',NULL),(1301,1326,1,'2022-09-13 22:44:29.777000',_binary '\0',NULL,_binary '\0','No experience',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','PRIVATE',_binary '','test Deal',_binary '\0','2022-09-16 00:30:26.329000',_binary '',_binary '\0',1245,_binary '\0',_binary '\0',_binary '\0',NULL),(1301,1397,1,'2022-09-13 22:44:29.777000',_binary '\0',NULL,_binary '\0','No experience',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '','test Deal',_binary '\0','2022-10-14 00:29:53.305000',_binary '',_binary '\0',1245,_binary '\0',_binary '\0',_binary '\0',NULL),(1301,1515,1,'2022-09-13 22:44:29.777000',_binary '\0',NULL,_binary '\0','No experience',_binary '\0','2022-10-28 22:43:51.877000',_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '\0','test Job',_binary '','2022-10-28 22:43:53.909000',_binary '',_binary '',1245,_binary '\0',_binary '',_binary '',NULL),(1301,1516,1,'2022-09-13 22:44:29.777000',_binary '\0',NULL,_binary '\0','No experience',_binary '\0','2022-10-28 22:43:51.000000',_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '\0','test Job',_binary '\0','2022-10-28 22:45:03.657000',_binary '',_binary '',1245,_binary '\0',_binary '',_binary '',NULL),(1301,1531,1,'2022-09-13 22:44:29.777000',_binary '\0',NULL,_binary '\0','No experience',_binary '\0','2022-10-28 22:43:51.000000',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '\0','test Job',_binary '\0','2022-10-28 23:23:59.544000',_binary '',_binary '',1245,_binary '\0',_binary '',_binary '',NULL),(1301,1532,1,'2022-09-13 22:44:29.777000',_binary '\0',NULL,_binary '\0','No experience',_binary '\0','2022-10-28 22:43:51.000000',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '\0','test Job',_binary '\0','2022-10-28 23:24:05.962000',_binary '',_binary '',1245,_binary '\0',_binary '',_binary '',NULL),(1301,1533,1,'2022-09-13 22:44:29.777000',_binary '\0',NULL,_binary '\0','3-5 years',_binary '','2022-10-28 22:43:51.000000',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '\0','test Job',_binary '\0','2022-10-28 23:25:03.829000',_binary '',_binary '',1245,_binary '\0',_binary '',_binary '',NULL),(1301,1561,1,'2022-09-13 22:44:29.777000',_binary '\0',NULL,_binary '\0','3-5 years',_binary '\0','2022-10-28 22:43:51.000000',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','DELETED',_binary '','test Job',_binary '\0','2022-10-31 00:19:34.416000',_binary '',_binary '\0',1245,_binary '\0',_binary '\0',_binary '\0',NULL),(1301,1563,1,'2022-09-13 22:44:29.777000',_binary '\0',NULL,_binary '\0','3-5 years',_binary '\0','2022-10-28 22:43:51.000000',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','REMOVED',_binary '','test Job',_binary '\0','2022-10-31 00:50:38.971000',_binary '',_binary '\0',1245,_binary '\0',_binary '\0',_binary '\0',NULL),(1305,1306,0,'2022-09-13 22:54:12.546000',_binary '',NULL,_binary '\0','No experience',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '','Full-time Designer',_binary '','2022-09-13 22:54:12.546000',_binary '',_binary '',1199,_binary '',_binary '',_binary '',NULL),(1305,1402,1,'2022-09-13 22:54:12.546000',_binary '\0',NULL,_binary '\0','No experience',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '\0','Fullll dasdl asdasdas  dlalsd lals dlasl dla sldl',_binary '','2022-10-18 19:59:50.312000',_binary '',_binary '\0',1199,_binary '\0',_binary '\0',_binary '\0',NULL),(1305,1570,1,'2022-09-13 22:54:12.546000',_binary '\0',NULL,_binary '\0','No experience',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','REMOVED',_binary '','Fullll dasdl asdasdas  dlalsd lals dlasl dla sldl',_binary '\0','2022-10-31 02:09:37.317000',_binary '',_binary '\0',1199,_binary '\0',_binary '\0',_binary '\0',NULL),(1528,1529,0,'2022-10-28 23:08:35.924000',_binary '',NULL,_binary '\0','No experience',_binary '','2022-10-29 23:08:29.193000',_binary '',_binary '',_binary '','$16 per hour',_binary '','Self-learning',_binary '','AVAILABLE',_binary '','Developer',_binary '','2022-10-28 23:08:35.924000',_binary '',_binary '',1524,_binary '',_binary '',_binary '',NULL);
/*!40000 ALTER TABLE `job_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_contact_info`
--

DROP TABLE IF EXISTS `job_contact_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_contact_info` (
  `job_id` bigint NOT NULL,
  `contact_value` varchar(255) DEFAULT NULL,
  `contact_field` varchar(255) NOT NULL,
  PRIMARY KEY (`job_id`,`contact_field`),
  CONSTRAINT `FK5bufv1766t6svbgekrwxox673` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_contact_info`
--

LOCK TABLES `job_contact_info` WRITE;
/*!40000 ALTER TABLE `job_contact_info` DISABLE KEYS */;
INSERT INTO `job_contact_info` VALUES (1301,'https://tedkvn.com','website'),(1305,'kvngo@tedkvn.com','email'),(1528,'https://tedkvn.com','website');
/*!40000 ALTER TABLE `job_contact_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_contact_info_aud`
--

DROP TABLE IF EXISTS `job_contact_info_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_contact_info_aud` (
  `rev` int NOT NULL,
  `job_id` bigint NOT NULL,
  `contact_value` varchar(255) NOT NULL,
  `contact_field` varchar(255) NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`job_id`,`contact_value`,`contact_field`),
  CONSTRAINT `FKrmmme3emq24fj4kqn9hoaa1ua` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_contact_info_aud`
--

LOCK TABLES `job_contact_info_aud` WRITE;
/*!40000 ALTER TABLE `job_contact_info_aud` DISABLE KEYS */;
INSERT INTO `job_contact_info_aud` VALUES (1302,1301,'kvngo@tedkvn.com','email',0),(1306,1305,'kvngo@tedkvn.com','email',0),(1516,1301,'https://tedkvn.com','website',0),(1516,1301,'kvngo@tedkvn.com','email',2),(1529,1528,'https://tedkvn.com','website',0);
/*!40000 ALTER TABLE `job_contact_info_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_pictures`
--

DROP TABLE IF EXISTS `job_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_pictures` (
  `job_id` bigint NOT NULL,
  `pictures_id` bigint NOT NULL,
  UNIQUE KEY `UK_b7p8kkpcegcelch8967hrjk3y` (`pictures_id`),
  KEY `FKks8t4ngsg7fq5cvhebwihk9yu` (`job_id`),
  CONSTRAINT `FK6fb6mtd7cupvc58epfeb8umbo` FOREIGN KEY (`pictures_id`) REFERENCES `storage` (`id`),
  CONSTRAINT `FKks8t4ngsg7fq5cvhebwihk9yu` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_pictures`
--

LOCK TABLES `job_pictures` WRITE;
/*!40000 ALTER TABLE `job_pictures` DISABLE KEYS */;
INSERT INTO `job_pictures` VALUES (1301,115),(1305,120),(1528,1526);
/*!40000 ALTER TABLE `job_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_pictures_aud`
--

DROP TABLE IF EXISTS `job_pictures_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_pictures_aud` (
  `rev` int NOT NULL,
  `job_id` bigint NOT NULL,
  `pictures_id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`job_id`,`pictures_id`),
  CONSTRAINT `FKdgdj4eqjtkjjees45gem2tjaq` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_pictures_aud`
--

LOCK TABLES `job_pictures_aud` WRITE;
/*!40000 ALTER TABLE `job_pictures_aud` DISABLE KEYS */;
INSERT INTO `job_pictures_aud` VALUES (1302,1301,115,0),(1306,1305,120,0),(1529,1528,1526,0);
/*!40000 ALTER TABLE `job_pictures_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_positions`
--

DROP TABLE IF EXISTS `job_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_positions` (
  `job_id` bigint NOT NULL,
  `positions` varchar(255) DEFAULT NULL,
  KEY `FKp7igfvpk6cdidcsap2bb1p4y4` (`job_id`),
  CONSTRAINT `FKp7igfvpk6cdidcsap2bb1p4y4` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_positions`
--

LOCK TABLES `job_positions` WRITE;
/*!40000 ALTER TABLE `job_positions` DISABLE KEYS */;
INSERT INTO `job_positions` VALUES (1305,'full-time'),(1528,'Internship'),(1528,'Part-time'),(1528,'Temporary'),(1301,'Aasdbsda'),(1301,'Internship'),(1301,'Part-time'),(1301,'Volunteer');
/*!40000 ALTER TABLE `job_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_positions_aud`
--

DROP TABLE IF EXISTS `job_positions_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_positions_aud` (
  `rev` int NOT NULL,
  `job_id` bigint NOT NULL,
  `positions` varchar(255) NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`job_id`,`positions`),
  CONSTRAINT `FKof2k837617sbmq89siw8m7shr` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_positions_aud`
--

LOCK TABLES `job_positions_aud` WRITE;
/*!40000 ALTER TABLE `job_positions_aud` DISABLE KEYS */;
INSERT INTO `job_positions_aud` VALUES (1302,1301,'full-time',0),(1302,1301,'Volunteer',0),(1306,1305,'full-time',0),(1529,1528,'Internship',0),(1529,1528,'Part-time',0),(1529,1528,'Temporary',0),(1531,1301,'full-time',2),(1531,1301,'Internship',0),(1531,1301,'Part-time',0),(1532,1301,'Aasdbsda',0);
/*!40000 ALTER TABLE `job_positions_aud` ENABLE KEYS */;
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
INSERT INTO `location` VALUES (4,'5112 Hollywood Boulevard','# 203','US','Los Angeles County','2022-05-15 01:10:06.191000','5112 Hollywood Blvd # 203, Los Angeles, CA 90027, USA','5112 Hollywood Boulevard # 203, East Hollywood, Los Angeles County, CA 90027, US','34.1013404','-118.3014496','Los Angeles','East Hollywood','ChIJ-2r4RFa_woARp32JhyYeuxg','CA','ROOFTOP','2022-05-15 01:10:06.191000','90027'),(12,'North Highland Avenue','','US','Los Angeles County','2022-05-17 22:49:23.155000','N Highland Ave, Los Angeles, CA, USA','North Highland Avenue Central LA, Los Angeles County, CA , US','34.0929786','-118.3386318','Los Angeles','Central LA','ChIJ99s_VS6_woARN5vTx3PCrHk','CA','GEOMETRIC_CENTER','2022-05-17 22:49:23.155000',''),(22,'2801 Sunset Place','','US','Los Angeles County','2022-05-18 00:47:28.481000','2801 Sunset Pl, Los Angeles, CA 90005, USA','2801 Sunset Place Mid City, Los Angeles County, CA 90005, US','34.0608914','-118.2849629','Los Angeles','Mid City','ChIJX_myydXHwoARaXWJF7ZUNWY','CA','ROOFTOP','2022-05-18 00:47:28.481000','90005'),(24,'123 South Figueroa Street','','US','Los Angeles County','2022-05-21 23:00:19.335000','123 S Figueroa St, Los Angeles, CA 90012, USA','123 South Figueroa Street Downtown Los Angeles, Los Angeles County, CA 90012, US','34.0572772','-118.2526665','Los Angeles','Downtown Los Angeles','ChIJXxAfzVLGwoARJebi04BrBJY','CA','ROOFTOP','2022-05-21 23:00:19.335000','90012'),(56,'1331 North Cahuenga Boulevard','','US','Los Angeles County','2022-06-06 18:34:19.482000','1331 N Cahuenga Blvd, Los Angeles, CA 90028, USA','1331 North Cahuenga Boulevard Central LA, Los Angeles County, CA 90028, US','34.095235','-118.3289749','Los Angeles','Central LA','ChIJQZt6KjG_woARaXUWV2fhi2Q','CA','ROOFTOP','2022-06-06 18:34:19.482000','90028'),(111,'123 South Lincoln Avenue','','US','Los Angeles County','2022-07-16 00:58:49.236000','123 S Lincoln Ave, Monterey Park, CA 91755, USA','123 South Lincoln Avenue Monterey Park, Los Angeles County, CA 91755, US','34.0618461','-118.1216859','Monterey Park','','ChIJWaKEL1fFwoARxDuHWvIJWZ4','CA','ROOFTOP','2022-07-16 00:58:49.236000','91755'),(1020,'2226 East 7th Street','','US','Los Angeles County','2022-07-22 00:27:32.003000','2226 E 7th St, Long Beach, CA 90804, USA','2226 East 7th Street Rose Park South, Los Angeles County, CA 90804, US','33.774946','-118.1651005','Long Beach','Rose Park South','ChIJP72yBwwx3YARhyhCO4fy--U','CA','ROOFTOP','2022-07-22 00:27:32.003000','90804'),(1199,'5020 Santa Monica Boulevard','','US','Los Angeles County','2022-08-25 22:39:04.419000','5020 Santa Monica Blvd, Los Angeles, CA 90029, USA','5020 Santa Monica Boulevard East Hollywood, Los Angeles County, CA 90029, US','34.0904399','-118.2987956','Los Angeles','East Hollywood','ChIJPZo2-1XHwoAR3xOlnvejGXg','CA','ROOFTOP','2022-08-25 22:39:04.419000','90029'),(1205,'3612 Country Club Drive','','US','Los Angeles County','2022-08-25 22:40:07.803000','3612 Country Club Dr, Los Angeles, CA 90019, USA','3612 Country Club Drive Mid City, Los Angeles County, CA 90019, US','34.0508252','-118.3192132','Los Angeles','Mid City','ChIJabwtW4q4woARexhfOFZiSRw','CA','ROOFTOP','2022-08-25 22:40:07.803000','90019'),(1212,'','','US','Los Angeles County','2022-08-25 22:41:42.763000','Studio City, Los Angeles, CA, USA','Studio City, Los Angeles County, CA , US','34.1395597','-118.3870991','Los Angeles','Studio City','ChIJ9QK_aQm-woARDtBe_FLmNZA','CA','APPROXIMATE','2022-08-25 22:41:42.763000',''),(1218,'','','US','Los Angeles County','2022-08-25 22:42:20.394000','Westchester, Los Angeles, CA, USA','Westchester, Los Angeles County, CA , US','33.9625905','-118.3987842','Los Angeles','Westchester','ChIJkdSA9s6wwoARCzVuPfS7KSo','CA','APPROXIMATE','2022-08-25 22:42:20.394000',''),(1224,'','','US','Los Angeles County','2022-08-25 22:43:05.835000','Pasadena, CA, USA','Pasadena, Los Angeles County, CA , US','34.1477849','-118.1445155','Pasadena','','ChIJUQszONzCwoARSo_RGhZBKwU','CA','APPROXIMATE','2022-08-25 22:43:05.835000',''),(1233,'','','US','Los Angeles County','2022-08-25 22:45:18.355000','Alhambra, CA, USA','Alhambra, Los Angeles County, CA , US','34.095287','-118.1270146','Alhambra','','ChIJIbZmgz3FwoARZkZyerE4-Ns','CA','APPROXIMATE','2022-08-25 22:45:18.355000',''),(1239,'4989 Sepulveda Boulevard','','US','Los Angeles County','2022-08-25 22:45:58.556000','4989 Sepulveda Blvd, Sherman Oaks, CA 91403, USA','4989 Sepulveda Boulevard Sherman Oaks, Los Angeles County, CA 91403, US','34.1617745','-118.4685012','Los Angeles','Sherman Oaks','ChIJ4Up6zpaXwoARJKYGK6SYyBo','CA','ROOFTOP','2022-08-25 22:45:58.556000','91403'),(1245,'7984 Santa Monica Boulevard','','US','Los Angeles County','2022-08-25 22:46:35.677000','7984 Santa Monica Blvd, West Hollywood, CA 90046, USA','7984 Santa Monica Boulevard Central LA, Los Angeles County, CA 90046, US','34.0905792','-118.3644276','West Hollywood','Central LA','ChIJoxUocMa-woARt0E5apWPlus','CA','ROOFTOP','2022-08-25 22:46:35.677000','90046'),(1327,'','','US','Los Angeles County','2022-09-29 23:30:21.040000','Thai Town, Los Angeles, CA 90027, USA','Thai Town, Los Angeles County, CA 90027, US','34.1018097','-118.3035723','Los Angeles','Thai Town','ChIJf2z2Hle_woARaNaIiR198fg','CA','APPROXIMATE','2022-09-29 23:30:21.040000','90027'),(1339,'100 Universal City Plaza','','US','Los Angeles County','2022-10-04 00:06:53.906000','100 Universal City Plaza, Universal City, CA 91608, USA','100 Universal City Plaza Central LA, Los Angeles County, CA 91608, US','34.136193','-118.3552237','Universal City','Central LA','ChIJmTkOrU6-woARV2J_WYKAnps','CA','ROOFTOP','2022-10-04 00:06:53.906000','91608'),(1403,'','','US','San Diego County','2022-10-18 20:09:31.666000','Camp Pendleton North, CA, USA','Camp Pendleton North, San Diego County, CA , US','33.3178416','-117.3205123','Camp Pendleton North','','ChIJd_m66aN73IARH8g1oNkLf8w','CA','APPROXIMATE','2022-10-18 20:09:31.666000',''),(1405,'','','US','Los Angeles County','2022-10-18 20:29:58.722000','Carson, CA, USA','Carson, Los Angeles County, CA , US','33.8316745','-118.281693','Carson','','ChIJfcS6fx7LwoARZYDiqXgXL6E','CA','APPROXIMATE','2022-10-18 20:29:58.722000',''),(1407,'','','US','Los Angeles County','2022-10-18 20:31:06.055000','Castaic, CA 91384, USA','Castaic, Los Angeles County, CA 91384, US','34.4890363','-118.6256552','Castaic','','ChIJL_Cs7iF_woARPg7H6-JPhGQ','CA','APPROXIMATE','2022-10-18 20:31:06.055000','91384'),(1517,'1200 North State Street','','US','Los Angeles County','2022-10-28 23:02:15.976000','1200 N State St, Los Angeles, CA 90033, USA','1200 North State Street Northeast Los Angeles, Los Angeles County, CA 90033, US','34.0579744','-118.2087976','Los Angeles','Northeast Los Angeles','ChIJjQqnP3TGwoARhu_YXsVES5E','CA','ROOFTOP','2022-10-28 23:02:15.976000','90033'),(1524,'120 West Hellman Avenue','','US','Los Angeles County','2022-10-28 23:08:35.879000','120 W Hellman Ave, Monterey Park, CA 91754, USA','120 West Hellman Avenue Monterey Park, Los Angeles County, CA 91754, US','34.069587','-118.1240632','Monterey Park','','ChIJ82xKgEXFwoARqhGcSn4ZXeM','CA','ROOFTOP','2022-10-28 23:08:35.879000','91754'),(1552,'140 West Valley Boulevard','','US','Los Angeles County','2022-10-30 23:42:19.327000','140 W Valley Blvd, San Gabriel, CA 91776, USA','140 West Valley Boulevard San Gabriel, Los Angeles County, CA 91776, US','34.0780505','-118.1016377','San Gabriel','','ChIJnyi4TrfawoARIwUJ_VDyiEs','CA','ROOFTOP','2022-10-30 23:42:19.327000','91776');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_aud`
--

DROP TABLE IF EXISTS `location_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `location_address1` varchar(255) DEFAULT NULL,
  `address1_mod` bit(1) DEFAULT NULL,
  `location_address2` varchar(255) DEFAULT NULL,
  `address2_mod` bit(1) DEFAULT NULL,
  `location_country` varchar(255) DEFAULT NULL,
  `country_mod` bit(1) DEFAULT NULL,
  `location_county` varchar(255) DEFAULT NULL,
  `county_mod` bit(1) DEFAULT NULL,
  `location_created_on` datetime(6) DEFAULT NULL,
  `created_on_mod` bit(1) DEFAULT NULL,
  `location_formatted_address` varchar(255) DEFAULT NULL,
  `description_mod` bit(1) DEFAULT NULL,
  `location_full_address` varchar(255) DEFAULT NULL,
  `full_address_mod` bit(1) DEFAULT NULL,
  `location_lat` double DEFAULT NULL,
  `lat_mod` bit(1) DEFAULT NULL,
  `location_lng` double DEFAULT NULL,
  `lng_mod` bit(1) DEFAULT NULL,
  `location_city` varchar(255) DEFAULT NULL,
  `locality_mod` bit(1) DEFAULT NULL,
  `location_neighberhood` varchar(255) DEFAULT NULL,
  `neighberhood_mod` bit(1) DEFAULT NULL,
  `location_placeid` varchar(255) DEFAULT NULL,
  `placeid_mod` bit(1) DEFAULT NULL,
  `location_state` varchar(255) DEFAULT NULL,
  `state_mod` bit(1) DEFAULT NULL,
  `location_type` varchar(255) DEFAULT NULL,
  `type_mod` bit(1) DEFAULT NULL,
  `location_updated_on` datetime(6) DEFAULT NULL,
  `updated_on_mod` bit(1) DEFAULT NULL,
  `location_zipcode` varchar(255) DEFAULT NULL,
  `zipcode_mod` bit(1) DEFAULT NULL,
  `users_mod` bit(1) DEFAULT NULL,
  `address_mod` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`rev`),
  KEY `FKc9wq75s178nq5dtd6cdunag7h` (`rev`),
  CONSTRAINT `FKc9wq75s178nq5dtd6cdunag7h` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_aud`
--

LOCK TABLES `location_aud` WRITE;
/*!40000 ALTER TABLE `location_aud` DISABLE KEYS */;
INSERT INTO `location_aud` VALUES (12,1154,1,'North Highland Avenue',_binary '\0','',_binary '\0','US',_binary '\0','Los Angeles County',_binary '\0','2022-05-17 22:49:23.155000',_binary '\0','N Highland Ave, Los Angeles, CA, USA',_binary '\0','North Highland Avenue Central LA, Los Angeles County, CA , US',_binary '\0',34.0929786,_binary '\0',-118.3386318,_binary '\0','Los Angeles',_binary '\0','Central LA',_binary '\0','ChIJ99s_VS6_woARN5vTx3PCrHk',_binary '\0','CA',_binary '\0','GEOMETRIC_CENTER',_binary '\0','2022-05-17 22:49:23.155000',_binary '\0','',_binary '\0',_binary '',NULL),(1199,1200,0,'5020 Santa Monica Boulevard',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-08-25 22:39:04.419000',_binary '','5020 Santa Monica Blvd, Los Angeles, CA 90029, USA',_binary '','5020 Santa Monica Boulevard East Hollywood, Los Angeles County, CA 90029, US',_binary '',34.0904399,_binary '',-118.2987956,_binary '','Los Angeles',_binary '','East Hollywood',_binary '','ChIJPZo2-1XHwoAR3xOlnvejGXg',_binary '','CA',_binary '','ROOFTOP',_binary '','2022-08-25 22:39:04.419000',_binary '','90029',_binary '',_binary '',NULL),(1205,1206,0,'3612 Country Club Drive',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-08-25 22:40:07.803000',_binary '','3612 Country Club Dr, Los Angeles, CA 90019, USA',_binary '','3612 Country Club Drive Mid City, Los Angeles County, CA 90019, US',_binary '',34.0508252,_binary '',-118.3192132,_binary '','Los Angeles',_binary '','Mid City',_binary '','ChIJabwtW4q4woARexhfOFZiSRw',_binary '','CA',_binary '','ROOFTOP',_binary '','2022-08-25 22:40:07.803000',_binary '','90019',_binary '',_binary '',NULL),(1212,1213,0,'',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-08-25 22:41:42.763000',_binary '','Studio City, Los Angeles, CA, USA',_binary '','Studio City, Los Angeles County, CA , US',_binary '',34.1395597,_binary '',-118.3870991,_binary '','Los Angeles',_binary '','Studio City',_binary '','ChIJ9QK_aQm-woARDtBe_FLmNZA',_binary '','CA',_binary '','APPROXIMATE',_binary '','2022-08-25 22:41:42.763000',_binary '','',_binary '',_binary '',NULL),(1218,1219,0,'',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-08-25 22:42:20.394000',_binary '','Westchester, Los Angeles, CA, USA',_binary '','Westchester, Los Angeles County, CA , US',_binary '',33.9625905,_binary '',-118.3987842,_binary '','Los Angeles',_binary '','Westchester',_binary '','ChIJkdSA9s6wwoARCzVuPfS7KSo',_binary '','CA',_binary '','APPROXIMATE',_binary '','2022-08-25 22:42:20.394000',_binary '','',_binary '',_binary '',NULL),(1224,1225,0,'',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-08-25 22:43:05.835000',_binary '','Pasadena, CA, USA',_binary '','Pasadena, Los Angeles County, CA , US',_binary '',34.1477849,_binary '',-118.1445155,_binary '','Pasadena',_binary '','',_binary '','ChIJUQszONzCwoARSo_RGhZBKwU',_binary '','CA',_binary '','APPROXIMATE',_binary '','2022-08-25 22:43:05.835000',_binary '','',_binary '',_binary '',NULL),(1233,1234,0,'',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-08-25 22:45:18.355000',_binary '','Alhambra, CA, USA',_binary '','Alhambra, Los Angeles County, CA , US',_binary '',34.095287,_binary '',-118.1270146,_binary '','Alhambra',_binary '','',_binary '','ChIJIbZmgz3FwoARZkZyerE4-Ns',_binary '','CA',_binary '','APPROXIMATE',_binary '','2022-08-25 22:45:18.355000',_binary '','',_binary '',_binary '',NULL),(1239,1240,0,'4989 Sepulveda Boulevard',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-08-25 22:45:58.556000',_binary '','4989 Sepulveda Blvd, Sherman Oaks, CA 91403, USA',_binary '','4989 Sepulveda Boulevard Sherman Oaks, Los Angeles County, CA 91403, US',_binary '',34.1617745,_binary '',-118.4685012,_binary '','Los Angeles',_binary '','Sherman Oaks',_binary '','ChIJ4Up6zpaXwoARJKYGK6SYyBo',_binary '','CA',_binary '','ROOFTOP',_binary '','2022-08-25 22:45:58.556000',_binary '','91403',_binary '',_binary '',NULL),(1245,1246,0,'7984 Santa Monica Boulevard',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-08-25 22:46:35.677000',_binary '','7984 Santa Monica Blvd, West Hollywood, CA 90046, USA',_binary '','7984 Santa Monica Boulevard Central LA, Los Angeles County, CA 90046, US',_binary '',34.0905792,_binary '',-118.3644276,_binary '','West Hollywood',_binary '','Central LA',_binary '','ChIJoxUocMa-woARt0E5apWPlus',_binary '','CA',_binary '','ROOFTOP',_binary '','2022-08-25 22:46:35.677000',_binary '','90046',_binary '',_binary '',NULL),(1327,1328,0,'',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-09-29 23:30:21.040000',_binary '','Thai Town, Los Angeles, CA 90027, USA',NULL,'Thai Town, Los Angeles County, CA 90027, US',_binary '',34.1018097,_binary '',-118.3035723,_binary '','Los Angeles',_binary '','Thai Town',_binary '','ChIJf2z2Hle_woARaNaIiR198fg',_binary '','CA',_binary '','APPROXIMATE',_binary '','2022-09-29 23:30:21.040000',_binary '','90027',_binary '',_binary '',_binary ''),(1339,1340,0,'100 Universal City Plaza',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-10-04 00:06:53.906000',_binary '','100 Universal City Plaza, Universal City, CA 91608, USA',NULL,'100 Universal City Plaza Central LA, Los Angeles County, CA 91608, US',_binary '',34.136193,_binary '',-118.3552237,_binary '','Universal City',_binary '','Central LA',_binary '','ChIJmTkOrU6-woARV2J_WYKAnps',_binary '','CA',_binary '','ROOFTOP',_binary '','2022-10-04 00:06:53.906000',_binary '','91608',_binary '',_binary '',_binary ''),(1403,1404,0,'',_binary '','',_binary '','US',_binary '','San Diego County',_binary '','2022-10-18 20:09:31.666000',_binary '','Camp Pendleton North, CA, USA',NULL,'Camp Pendleton North, San Diego County, CA , US',_binary '',33.3178416,_binary '',-117.3205123,_binary '','Camp Pendleton North',_binary '','',_binary '','ChIJd_m66aN73IARH8g1oNkLf8w',_binary '','CA',_binary '','APPROXIMATE',_binary '','2022-10-18 20:09:31.666000',_binary '','',_binary '',_binary '',_binary ''),(1405,1406,0,'',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-10-18 20:29:58.722000',_binary '','Carson, CA, USA',NULL,'Carson, Los Angeles County, CA , US',_binary '',33.8316745,_binary '',-118.281693,_binary '','Carson',_binary '','',_binary '','ChIJfcS6fx7LwoARZYDiqXgXL6E',_binary '','CA',_binary '','APPROXIMATE',_binary '','2022-10-18 20:29:58.722000',_binary '','',_binary '',_binary '',_binary ''),(1407,1408,0,'',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-10-18 20:31:06.055000',_binary '','Castaic, CA 91384, USA',NULL,'Castaic, Los Angeles County, CA 91384, US',_binary '',34.4890363,_binary '',-118.6256552,_binary '','Castaic',_binary '','',_binary '','ChIJL_Cs7iF_woARPg7H6-JPhGQ',_binary '','CA',_binary '','APPROXIMATE',_binary '','2022-10-18 20:31:06.055000',_binary '','91384',_binary '',_binary '',_binary ''),(1517,1518,0,'1200 North State Street',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-10-28 23:02:15.976000',_binary '','1200 N State St, Los Angeles, CA 90033, USA',NULL,'1200 North State Street Northeast Los Angeles, Los Angeles County, CA 90033, US',_binary '',34.0579744,_binary '',-118.2087976,_binary '','Los Angeles',_binary '','Northeast Los Angeles',_binary '','ChIJjQqnP3TGwoARhu_YXsVES5E',_binary '','CA',_binary '','ROOFTOP',_binary '','2022-10-28 23:02:15.976000',_binary '','90033',_binary '',_binary '',_binary ''),(1524,1525,0,'120 West Hellman Avenue',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-10-28 23:08:35.879000',_binary '','120 W Hellman Ave, Monterey Park, CA 91754, USA',NULL,'120 West Hellman Avenue Monterey Park, Los Angeles County, CA 91754, US',_binary '',34.069587,_binary '',-118.1240632,_binary '','Monterey Park',_binary '','',_binary '','ChIJ82xKgEXFwoARqhGcSn4ZXeM',_binary '','CA',_binary '','ROOFTOP',_binary '','2022-10-28 23:08:35.879000',_binary '','91754',_binary '',_binary '',_binary ''),(1552,1553,0,'140 West Valley Boulevard',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-10-30 23:42:19.327000',_binary '','140 W Valley Blvd, San Gabriel, CA 91776, USA',NULL,'140 West Valley Boulevard San Gabriel, Los Angeles County, CA 91776, US',_binary '',34.0780505,_binary '',-118.1016377,_binary '','San Gabriel',_binary '','',_binary '','ChIJnyi4TrfawoARIwUJ_VDyiEs',_binary '','CA',_binary '','ROOFTOP',_binary '','2022-10-30 23:42:19.327000',_binary '','91776',_binary '',_binary '',_binary '');
/*!40000 ALTER TABLE `location_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketplace`
--

DROP TABLE IF EXISTS `marketplace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketplace` (
  `id` bigint NOT NULL,
  `marketplace_category` varchar(255) DEFAULT NULL,
  `marketplace_condition` varchar(255) DEFAULT NULL,
  `marketplace_cost` double DEFAULT NULL,
  `marketplace_created_on` datetime(6) DEFAULT NULL,
  `marketplace_description` longtext,
  `marketplace_expired_on` datetime(6) DEFAULT NULL,
  `marketplace_status` varchar(255) DEFAULT NULL,
  `marketplace_title` varchar(255) DEFAULT NULL,
  `marketplace_updated_on` datetime(6) DEFAULT NULL,
  `marketplace_location_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK90e4s37yof7v9g0fbplkiokeb` (`marketplace_location_id`),
  CONSTRAINT `FK90e4s37yof7v9g0fbplkiokeb` FOREIGN KEY (`marketplace_location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketplace`
--

LOCK TABLES `marketplace` WRITE;
/*!40000 ALTER TABLE `marketplace` DISABLE KEYS */;
INSERT INTO `marketplace` VALUES (1398,'Phone & Computer','Liked New',NULL,'2022-10-14 01:02:34.880000','',NULL,'DELETED','Used Laptop','2022-10-31 00:17:30.209000',1245),(1556,'','',NULL,'2022-10-30 23:42:19.362000','',NULL,'AVAILABLE','Macbook Pro','2022-10-30 23:42:19.362000',1552);
/*!40000 ALTER TABLE `marketplace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketplace_aud`
--

DROP TABLE IF EXISTS `marketplace_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketplace_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `marketplace_category` varchar(255) DEFAULT NULL,
  `category_mod` bit(1) DEFAULT NULL,
  `marketplace_condition` varchar(255) DEFAULT NULL,
  `condition_mod` bit(1) DEFAULT NULL,
  `marketplace_cost` double DEFAULT NULL,
  `cost_mod` bit(1) DEFAULT NULL,
  `marketplace_created_on` datetime(6) DEFAULT NULL,
  `created_on_mod` bit(1) DEFAULT NULL,
  `marketplace_description` longtext,
  `description_mod` bit(1) DEFAULT NULL,
  `marketplace_expired_on` datetime(6) DEFAULT NULL,
  `expired_on_mod` bit(1) DEFAULT NULL,
  `marketplace_status` varchar(255) DEFAULT NULL,
  `status_mod` bit(1) DEFAULT NULL,
  `marketplace_title` varchar(255) DEFAULT NULL,
  `title_mod` bit(1) DEFAULT NULL,
  `marketplace_updated_on` datetime(6) DEFAULT NULL,
  `updated_on_mod` bit(1) DEFAULT NULL,
  `contact_info_mod` bit(1) DEFAULT NULL,
  `marketplace_location_id` bigint DEFAULT NULL,
  `location_mod` bit(1) DEFAULT NULL,
  `pictures_mod` bit(1) DEFAULT NULL,
  `post_mod` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`rev`),
  KEY `FKgpkudmbejw39d8rnwufndxa4j` (`rev`),
  CONSTRAINT `FKgpkudmbejw39d8rnwufndxa4j` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketplace_aud`
--

LOCK TABLES `marketplace_aud` WRITE;
/*!40000 ALTER TABLE `marketplace_aud` DISABLE KEYS */;
INSERT INTO `marketplace_aud` VALUES (1398,1399,0,NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0','2022-10-14 01:02:34.880000',_binary '',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '','Used Laptop',_binary '','2022-10-14 01:02:34.880000',_binary '',_binary '',1245,_binary '',_binary '',NULL),(1398,1551,1,'Phone & Computer',_binary '','Liked New',_binary '',NULL,_binary '\0','2022-10-14 01:02:34.880000',_binary '\0','',_binary '',NULL,_binary '\0','AVAILABLE',_binary '\0','Used Laptop',_binary '\0','2022-10-30 23:41:09.985000',_binary '',_binary '',1245,_binary '\0',_binary '',NULL),(1398,1559,1,'Phone & Computer',_binary '\0','Liked New',_binary '\0',NULL,_binary '\0','2022-10-14 01:02:34.880000',_binary '\0','',_binary '\0',NULL,_binary '\0','DELETED',_binary '','Used Laptop',_binary '\0','2022-10-31 00:17:30.209000',_binary '',_binary '\0',1245,_binary '\0',_binary '\0',NULL),(1556,1557,0,'',_binary '','',_binary '',NULL,_binary '\0','2022-10-30 23:42:19.362000',_binary '','',_binary '',NULL,_binary '\0','AVAILABLE',_binary '','Macbook Pro',_binary '','2022-10-30 23:42:19.362000',_binary '',_binary '',1552,_binary '',_binary '',NULL);
/*!40000 ALTER TABLE `marketplace_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketplace_contact_info`
--

DROP TABLE IF EXISTS `marketplace_contact_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketplace_contact_info` (
  `marketplace_id` bigint NOT NULL,
  `contact_value` varchar(255) DEFAULT NULL,
  `contact_field` varchar(255) NOT NULL,
  PRIMARY KEY (`marketplace_id`,`contact_field`),
  CONSTRAINT `FK30v2ihx2vwyi4ldwus71m72gd` FOREIGN KEY (`marketplace_id`) REFERENCES `marketplace` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketplace_contact_info`
--

LOCK TABLES `marketplace_contact_info` WRITE;
/*!40000 ALTER TABLE `marketplace_contact_info` DISABLE KEYS */;
INSERT INTO `marketplace_contact_info` VALUES (1398,'kvngo@tedkvn.com','email'),(1556,'kvngo@tmail.com','email');
/*!40000 ALTER TABLE `marketplace_contact_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketplace_contact_info_aud`
--

DROP TABLE IF EXISTS `marketplace_contact_info_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketplace_contact_info_aud` (
  `rev` int NOT NULL,
  `marketplace_id` bigint NOT NULL,
  `contact_value` varchar(255) NOT NULL,
  `contact_field` varchar(255) NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`marketplace_id`,`contact_value`,`contact_field`),
  CONSTRAINT `FKr0u91u0mtng2gay75wjfdvcqa` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketplace_contact_info_aud`
--

LOCK TABLES `marketplace_contact_info_aud` WRITE;
/*!40000 ALTER TABLE `marketplace_contact_info_aud` DISABLE KEYS */;
INSERT INTO `marketplace_contact_info_aud` VALUES (1399,1398,'kvngo@tedkvn.com','email',0),(1557,1556,'kvngo@tmail.com','email',0);
/*!40000 ALTER TABLE `marketplace_contact_info_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketplace_pictures`
--

DROP TABLE IF EXISTS `marketplace_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketplace_pictures` (
  `marketplace_id` bigint NOT NULL,
  `pictures_id` bigint NOT NULL,
  UNIQUE KEY `UK_r7x7twp8f6kn8v2o6xqu3h57a` (`pictures_id`),
  KEY `FKor08s7uoo0r01rb2swlhlp2pc` (`marketplace_id`),
  CONSTRAINT `FKor08s7uoo0r01rb2swlhlp2pc` FOREIGN KEY (`marketplace_id`) REFERENCES `marketplace` (`id`),
  CONSTRAINT `FKq3wk0hwxddhyvjkdns5llmxkm` FOREIGN KEY (`pictures_id`) REFERENCES `storage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketplace_pictures`
--

LOCK TABLES `marketplace_pictures` WRITE;
/*!40000 ALTER TABLE `marketplace_pictures` DISABLE KEYS */;
INSERT INTO `marketplace_pictures` VALUES (1398,123),(1556,1554);
/*!40000 ALTER TABLE `marketplace_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketplace_pictures_aud`
--

DROP TABLE IF EXISTS `marketplace_pictures_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketplace_pictures_aud` (
  `rev` int NOT NULL,
  `marketplace_id` bigint NOT NULL,
  `pictures_id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`marketplace_id`,`pictures_id`),
  CONSTRAINT `FK3fnpa27bauixljbbusthyn00u` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketplace_pictures_aud`
--

LOCK TABLES `marketplace_pictures_aud` WRITE;
/*!40000 ALTER TABLE `marketplace_pictures_aud` DISABLE KEYS */;
INSERT INTO `marketplace_pictures_aud` VALUES (1399,1398,123,0),(1557,1556,1554,0);
/*!40000 ALTER TABLE `marketplace_pictures_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_revision_entity`
--

DROP TABLE IF EXISTS `my_revision_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_revision_entity` (
  `id` int NOT NULL,
  `timestamp` bigint NOT NULL,
  `modifier_email` varchar(255) DEFAULT NULL,
  `modifier_role` int DEFAULT NULL,
  `modifier_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_revision_entity`
--

LOCK TABLES `my_revision_entity` WRITE;
/*!40000 ALTER TABLE `my_revision_entity` DISABLE KEYS */;
INSERT INTO `my_revision_entity` VALUES (1138,1661205837600,NULL,NULL,'anonymousUser'),(1142,1661206137147,'admin@gmail.com',3,'kevin ngo'),(1150,1661215470853,'admin@gmail.com',3,'kevin ngo'),(1151,1661215471307,'admin@gmail.com',3,'kevin ngo'),(1153,1661215828321,'admin@gmail.com',4,'kevin ngo'),(1154,1661216659134,'admin@gmail.com',4,'kevin ngo'),(1155,1661217022084,'admin@gmail.com',4,'kevin ngo'),(1157,1661217805207,NULL,NULL,'anonymousUser'),(1160,1661218476781,NULL,NULL,'anonymousUser'),(1162,1661218476822,NULL,NULL,'anonymousUser'),(1165,1661218841952,NULL,NULL,'anonymousUser'),(1167,1661218841993,NULL,NULL,'anonymousUser'),(1170,1661407962089,'admin@gmail.com',4,'Kevin ssgggg55555'),(1172,1661408600468,'admin@gmail.com',4,'Kevin ssgggg55555'),(1175,1661409804662,'admin@gmail.com',4,'Kevin ssgggg55555'),(1177,1661410707949,'admin@gmail.com',4,'Kevin ssgggg55555'),(1178,1661411268637,'admin@gmail.com',1,'Kevin ssgggg55555'),(1180,1661414025398,'admin@gmail.com',1,'Kevin ssgggg55555'),(1183,1661414210217,'admin@gmail.com',1,'Kevin ssgggg55555'),(1185,1661414210249,'admin@gmail.com',1,'Kevin ssgggg55555'),(1188,1661415609213,'admin@gmail.com',1,'Kevin ssgggg55555'),(1190,1661415609255,'admin@gmail.com',1,'Kevin ssgggg55555'),(1192,1661460992144,'admin@gmail.com',1,'Kevin ssgggg55555'),(1193,1661461355635,'admin@gmail.com',1,'Kevin ssgggg55555'),(1194,1661461769325,'admin@gmail.com',1,'Kevin ssgggg55555'),(1195,1661461777348,'admin@gmail.com',1,'Kevin ssgggg55555'),(1196,1661461791546,'admin@gmail.com',1,'Kevin ssgggg55555'),(1197,1661462022502,'admin@gmail.com',1,'Kevin ssgggg55555'),(1198,1661462880055,'admin@gmail.com',1,'Kevin ssgggg55555'),(1200,1661467144442,'admin@gmail.com',1,'Kevin ssgggg55555'),(1202,1661467144488,'admin@gmail.com',1,'Kevin ssgggg55555'),(1204,1661467161266,'admin@gmail.com',1,'Kevin ssgggg55555'),(1206,1661467207805,'admin@gmail.com',1,'Kevin ssgggg55555'),(1208,1661467207826,'admin@gmail.com',1,'Kevin ssgggg55555'),(1210,1661467213849,'admin@gmail.com',1,'Kevin ssgggg55555'),(1211,1661467247466,'admin@gmail.com',1,'Kevin ssgggg55555'),(1213,1661467302767,'admin@gmail.com',1,'Kevin ssgggg55555'),(1215,1661467302782,'admin@gmail.com',1,'Kevin ssgggg55555'),(1217,1661467308250,'admin@gmail.com',1,'Kevin ssgggg55555'),(1219,1661467340395,'admin@gmail.com',1,'Kevin ssgggg55555'),(1221,1661467340407,'admin@gmail.com',1,'Kevin ssgggg55555'),(1223,1661467352097,'admin@gmail.com',1,'Kevin ssgggg55555'),(1225,1661467385836,'admin@gmail.com',1,'Kevin ssgggg55555'),(1227,1661467385849,'admin@gmail.com',1,'Kevin ssgggg55555'),(1229,1661467434138,'phucaone@gmail.com',3,''),(1230,1661467434290,'phucaone@gmail.com',3,''),(1232,1661467469542,'phucaone@gmail.com',1,''),(1234,1661467518357,'phucaone@gmail.com',1,''),(1236,1661467518373,'phucaone@gmail.com',1,''),(1238,1661467524622,'phucaone@gmail.com',1,''),(1240,1661467558557,'phucaone@gmail.com',1,''),(1242,1661467558568,'phucaone@gmail.com',1,''),(1244,1661467564172,'phucaone@gmail.com',1,''),(1246,1661467595680,'phucaone@gmail.com',1,''),(1248,1661467595701,'phucaone@gmail.com',1,''),(1250,1661467601600,'phucaone@gmail.com',1,''),(1252,1661915413317,'admin@gmail.com',1,'Kevin ssgggg55555'),(1253,1661915413538,'admin@gmail.com',1,'Kevin ssgggg55555'),(1256,1661968836922,'admin@gmail.com',1,'Kevin ssgggg55555'),(1259,1661969015561,'admin@gmail.com',1,'Kevin ssgggg55555'),(1262,1661969057446,'admin@gmail.com',1,'Kevin ssgggg55555'),(1265,1661969148800,'admin@gmail.com',1,'Kevin ssgggg55555'),(1268,1661969365184,'admin@gmail.com',1,'Kevin ssgggg55555'),(1271,1661987841764,'admin@gmail.com',1,'Kevin ssgggg55555'),(1275,1661988636688,'admin@gmail.com',1,'Kevin ssgggg55555'),(1279,1661988767097,'admin@gmail.com',1,'Kevin ssgggg55555'),(1283,1661988844042,'admin@gmail.com',1,'Kevin ssgggg55555'),(1286,1661988987195,'admin@gmail.com',1,'Kevin ssgggg55555'),(1288,1662240564985,'admin@gmail.com',1,'Kevin ssgggg55555'),(1289,1662240633325,'admin@gmail.com',1,'Kevin ssgggg55555'),(1290,1662241100320,'admin@gmail.com',1,'Kevin ssgggg55555'),(1292,1663106354284,'kvngo@tedkvn.com',3,'Kevin Ngo'),(1295,1663106491281,'kvngo@tedkvn.com',3,'Kevin Ngo'),(1296,1663106491574,'kvngo@tedkvn.com',3,'Kevin Ngo'),(1298,1663106767794,'kvngo@tedkvn.com',3,'Kevin Ngo'),(1300,1663108880670,'kvngo@tedkvn.com',3,'Kevin Ngo'),(1302,1663109069833,'kvngo@tedkvn.com',3,'Kevin Ngo'),(1304,1663109106665,'kvngo@tedkvn.com',3,'Kevin Ngo'),(1306,1663109652602,'kvngo@tedkvn.com',3,'Kevin Ngo'),(1309,1663111881457,'phucaone5@gmail.com',3,'Kevin'),(1311,1663113466349,'phucaone5@gmail.com',3,'Kevin'),(1313,1663115379458,'phucaone5@gmail.com',3,'Kevin'),(1315,1663115411957,'phucaone5@gmail.com',3,'Kevin'),(1317,1663115451107,'phucaone5@gmail.com',3,'Kevin'),(1319,1663115715326,'phucaone5@gmail.com',3,'Kevin'),(1320,1663116372308,'phucaone@gmail.com',1,''),(1321,1663116393235,'phucaone@gmail.com',1,''),(1323,1663116505829,'phucaone5@gmail.com',3,'Kevin'),(1325,1663118798799,'phucaone5@gmail.com',3,'Kevin'),(1326,1663288226398,'kvngo@tedkvn.com',3,'Kevin Ngo'),(1328,1664494221064,NULL,NULL,'anonymousUser'),(1329,1664672710346,'admin@gmail.com',1,'Kevin ssgggg55555'),(1330,1664672710346,'admin@gmail.com',1,'Kevin ssgggg55555'),(1331,1664672710346,'admin@gmail.com',1,'Kevin ssgggg55555'),(1332,1664672710346,'admin@gmail.com',1,'Kevin ssgggg55555'),(1333,1664672710346,'admin@gmail.com',1,'Kevin ssgggg55555'),(1334,1664672711394,'admin@gmail.com',1,'Kevin ssgggg55555'),(1335,1664672711414,'admin@gmail.com',1,'Kevin ssgggg55555'),(1336,1664672711425,'admin@gmail.com',1,'Kevin ssgggg55555'),(1337,1664672711439,'admin@gmail.com',1,'Kevin ssgggg55555'),(1338,1664672711448,'admin@gmail.com',1,'Kevin ssgggg55555'),(1340,1664842013928,'admin@gmail.com',3,'Kevin ssgggg55555'),(1342,1664842013987,'admin@gmail.com',3,'Kevin ssgggg55555'),(1344,1664842014843,'admin@gmail.com',3,'Kevin ssgggg55555'),(1345,1664842040621,'admin@gmail.com',4,'Kevin ssgggg55555'),(1346,1664842040943,'admin@gmail.com',4,'Kevin ssgggg55555'),(1348,1664842242191,'admin@gmail.com',3,'Kevin ssgggg55555'),(1350,1664842242523,'admin@gmail.com',3,'Kevin ssgggg55555'),(1351,1664850461223,'admin@gmail.com',4,'Kevin ssgggg55555'),(1352,1664850461490,'admin@gmail.com',4,'Kevin ssgggg55555'),(1354,1664850525672,'admin@gmail.com',3,'Kevin ssgggg55555'),(1356,1664850525955,'admin@gmail.com',3,'Kevin ssgggg55555'),(1357,1664850531205,'admin@gmail.com',4,'Kevin ssgggg55555'),(1358,1664850531506,'admin@gmail.com',4,'Kevin ssgggg55555'),(1360,1664850691339,'admin@gmail.com',3,'Kevin ssgggg55555'),(1362,1664850691722,'admin@gmail.com',3,'Kevin ssgggg55555'),(1363,1664850975394,'admin@gmail.com',1,'Kevin ssgggg55555'),(1365,1664851147623,'admin@gmail.com',1,'Kevin ssgggg55555'),(1367,1664851271119,'admin@gmail.com',1,'Kevin ssgggg55555'),(1369,1664852163958,'admin@gmail.com',1,'Kevin ssgggg55555'),(1372,1664852175643,'admin@gmail.com',1,'Kevin ssgggg55555'),(1374,1664852190474,'admin@gmail.com',1,'Kevin ssgggg55555'),(1375,1664852202520,'admin@gmail.com',1,'Kevin ssgggg55555'),(1376,1664853266327,'admin@gmail.com',1,'Kevin ssgggg55555'),(1377,1664855038165,'admin@gmail.com',1,'Kevin ssgggg55555'),(1378,1665088359678,'admin@gmail.com',1,'Kevin ssgggg55555'),(1379,1665088359761,'admin@gmail.com',1,'Kevin ssgggg55555'),(1380,1665089504451,'phucaone@gmail.com',1,''),(1383,1665089673258,'admin@gmail.com',1,'Kevin ssgggg55555'),(1385,1665089706561,'phucaone@gmail.com',1,''),(1386,1665089801496,'admin@gmail.com',1,'Kevin ssgggg55555'),(1387,1665089801515,'admin@gmail.com',1,'Kevin ssgggg55555'),(1388,1665089934144,'phucaone@gmail.com',1,''),(1390,1665090927231,'phucaone@gmail.com',1,''),(1392,1665090948013,'admin@gmail.com',1,'Kevin ssgggg55555'),(1393,1665090948031,'admin@gmail.com',1,'Kevin ssgggg55555'),(1394,1665090987520,'phucaone@gmail.com',1,''),(1396,1665698181104,'admin@gmail.com',1,'Kevin ssgggg55555'),(1397,1665707393316,'admin@gmail.com',1,'Kevin ssgggg55555'),(1399,1665709354910,'admin@gmail.com',1,'Kevin ssgggg55555'),(1401,1665711832180,'admin@gmail.com',1,'Kevin ssgggg55555'),(1402,1666123190364,'admin@gmail.com',1,'Kevin ssgggg55555'),(1404,1666123771671,NULL,NULL,'anonymousUser'),(1406,1666124998724,NULL,NULL,'anonymousUser'),(1408,1666125066055,NULL,NULL,'anonymousUser'),(1410,1666311062730,'kvngo@tedkvn.com',3,'Kevin Ngo'),(1411,1666311062752,'kvngo@tedkvn.com',3,'Kevin Ngo'),(1413,1666311408146,'kvngo@tedkvn.com',3,'Kevin Ngo'),(1414,1666311408166,'kvngo@tedkvn.com',3,'Kevin Ngo'),(1416,1666311487952,'kvngo@tedkvn.com',3,'Kevin Ngo'),(1417,1666311487960,'kvngo@tedkvn.com',3,'Kevin Ngo'),(1419,1666312241052,'phucaone@gmail.com',1,''),(1420,1666312241064,'phucaone@gmail.com',1,''),(1422,1666312512485,'kvngo@tedkvn.com',3,'Kevin Ngo'),(1423,1666312512504,'kvngo@tedkvn.com',3,'Kevin Ngo'),(1424,1666644106316,'kvngo@tedkvn.com',3,'Kevin Ngo'),(1425,1666644334072,'kvngo@tedkvn.com',3,'Kevin Ngo'),(1426,1666644500130,'kvngo@tedkvn.com',3,'Kevin Ngoxxxx'),(1428,1666644574880,'kvngo@tedkvn.com',3,'Kevin Ngoxxxx123'),(1429,1666644574898,'kvngo@tedkvn.com',3,'Kevin Ngoxxxx123'),(1431,1666645217913,'kvngo@tedkvn.com',3,'Kevin Ngoxxxx123'),(1432,1666645217924,'kvngo@tedkvn.com',3,'Kevin Ngoxxxx123'),(1433,1666645667973,'kvngo@tedkvn.com',3,'Kevin Ngoxxxx123'),(1434,1666645713142,'kvngo@tedkvn.com',3,'Kevin Ngoxxxx123555'),(1435,1666645740001,'kvngo@tedkvn.com',3,'Kevin Ng'),(1436,1666645979799,'kvngo@tedkvn.com',3,'Kevin Ng'),(1437,1666645996519,'kvngo@tedkvn.com',3,'Kevin Ng'),(1438,1666646013578,'kvngo@tedkvn.com',3,'Kevin Ng'),(1439,1666646124581,'kvngo@tedkvn.com',3,'Kevin Ng'),(1440,1666646506024,'kvngo@tedkvn.com',3,'Kevin Ng'),(1441,1666647170292,'kvngo@tedkvn.com',3,'Kevin Ng'),(1442,1666647365575,'kvngo@tedkvn.com',3,'Kevin Ng'),(1443,1666647495752,'kvngo@tedkvn.com',3,'Kevin Ng'),(1444,1666647571566,'kvngo@tedkvn.com',3,'Kevin Ng'),(1445,1666648077315,'kvngo@tedkvn.com',3,'Kevin Ng'),(1446,1666648083642,'kvngo@tedkvn.com',3,'Kevin Ng'),(1447,1666648832346,'kvngo@tedkvn.com',3,'Kevin Ng'),(1448,1666649109958,'kvngo@tedkvn.com',3,'Kevin Ng'),(1449,1666649113262,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1450,1666649497507,'phucaone@gmail.com',1,''),(1451,1666652615664,'phucaone@gmail.com',1,'Apple Kevin'),(1452,1666652640627,'phucaone@gmail.com',1,'Apple Kevin'),(1453,1666653055226,'phucaone@gmail.com',1,'Apple Kevin'),(1455,1666653151485,'phucaone@gmail.com',1,'Apple Kevin'),(1456,1666653151507,'phucaone@gmail.com',1,'Apple Kevin'),(1458,1666654220660,'phucaone@gmail.com',1,'Apple Kevin'),(1459,1666654220673,'phucaone@gmail.com',1,'Apple Kevin'),(1461,1666654386583,'phucaone@gmail.com',1,'Apple Kevin'),(1462,1666654386590,'phucaone@gmail.com',1,'Apple Kevin'),(1464,1666654463377,'phucaone@gmail.com',1,'Apple Kevin'),(1465,1666654463390,'phucaone@gmail.com',1,'Apple Kevin'),(1467,1666654529551,'phucaone@gmail.com',1,'Apple Kevin'),(1468,1666654529563,'phucaone@gmail.com',1,'Apple Kevin'),(1469,1666737733696,'phucaone@gmail.com',1,'Apple Kevin'),(1470,1666737817979,'phucaone@gmail.com',1,'Apple Kevin'),(1471,1666738671634,'phucaone@gmail.com',1,'Apple Kevin'),(1472,1666738671661,'phucaone@gmail.com',1,'Apple Kevin'),(1473,1666740232067,'phucaone@gmail.com',1,'Apple Kevin'),(1474,1666740293308,'phucaone@gmail.com',1,'Apple Kevin'),(1475,1666740930726,'phucaone@gmail.com',1,'Apple Kevin'),(1477,1666742380728,'phucaone@gmail.com',1,'Apple Kevin'),(1478,1666742380762,'phucaone@gmail.com',1,'Apple Kevin'),(1480,1666742575551,'phucaone@gmail.com',1,'Apple Kevin'),(1481,1666742575580,'phucaone@gmail.com',1,'Apple Kevin'),(1483,1666742663346,'phucaone@gmail.com',1,'Apple Kevin'),(1484,1666742663371,'phucaone@gmail.com',1,'Apple Kevin'),(1486,1666742690968,'phucaone@gmail.com',1,'Apple Kevin'),(1487,1666742690987,'phucaone@gmail.com',1,'Apple Kevin'),(1489,1666742749778,'phucaone@gmail.com',1,'Apple Kevin'),(1490,1666742749796,'phucaone@gmail.com',1,'Apple Kevin'),(1492,1666742847312,'phucaone@gmail.com',1,'Apple Kevin'),(1493,1666742847344,'phucaone@gmail.com',1,'Apple Kevin'),(1494,1666836311033,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1495,1666837075634,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1496,1666933557886,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1497,1666934640281,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1498,1666934661140,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1499,1666934767731,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1501,1666934782447,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1502,1666934782473,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1503,1666935019945,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1504,1666935086794,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1506,1666937713904,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1508,1666937713917,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1510,1666937713949,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1512,1666939544874,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1513,1666992239216,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1514,1666996817929,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1515,1666997033943,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1516,1666997103670,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1518,1666998135981,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1520,1666998136003,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1522,1666998136020,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1525,1666998515884,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1527,1666998515913,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1529,1666998515929,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1531,1666999439566,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1532,1666999445982,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1533,1666999503849,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1534,1667011658250,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1535,1667016382601,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1537,1667017684631,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1538,1667018012486,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1539,1667018477389,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1540,1667019651007,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1541,1667019663696,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1542,1667019765852,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1543,1667170941177,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1545,1667171614527,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1547,1667171614588,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1549,1667171800267,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1550,1667172101449,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1551,1667173269996,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1553,1667173339331,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1555,1667173339347,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1557,1667173339365,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1559,1667175450214,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1560,1667175530868,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1561,1667175574434,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1562,1667177227044,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1563,1667177438990,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1564,1667177439080,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1565,1667177439126,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1566,1667177439181,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1567,1667177439237,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1568,1667177439297,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1569,1667177439359,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1570,1667182177336,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1571,1667182263146,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1572,1667182378732,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1573,1667198274073,'phucaone@gmail.com',1,'Apple Kevin'),(1587,1667285804935,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1605,1667517198602,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1607,1667520404127,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1609,1667520470984,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1611,1667520559477,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1613,1667520649836,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1615,1667520778419,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1617,1667520840764,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1619,1667523866164,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1621,1667523926373,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1623,1667523994172,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1625,1667524114465,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1627,1667524416676,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1629,1667524622743,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1631,1667524689717,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1633,1667524745699,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1635,1667524896853,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1637,1667524959163,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1639,1667524978352,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1641,1667529805243,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1643,1667529831211,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1645,1667542628824,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1647,1667608205262,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1649,1667611214230,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1651,1667611218145,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1653,1667611221904,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1655,1667611225977,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1657,1667611232653,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1659,1667611236279,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1661,1667611240425,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1663,1667611250270,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1665,1667611254196,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1667,1667611259099,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1669,1667611321792,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1671,1667611325963,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1673,1667611330507,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1675,1667611359045,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1677,1667611366938,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1679,1667611405662,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1681,1667611439412,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1683,1667611444408,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1685,1667611451339,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1687,1667615497505,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1689,1667615497551,'kvngo@tedkvn.com',3,'Kevin Ngssss'),(1692,1667615798551,'phucaone@gmail.com',1,'Apple Kevin'),(1694,1667615965994,'phucaone@gmail.com',1,'Apple Kevin'),(1696,1667616052190,'phucaone@gmail.com',1,'Apple Kevin'),(1698,1667616130398,'phucaone@gmail.com',1,'Apple Kevin'),(1700,1667616220053,'phucaone@gmail.com',1,'Apple Kevin'),(1702,1667616248843,'phucaone@gmail.com',1,'Apple Kevin'),(1704,1667616288072,'phucaone@gmail.com',1,'Apple Kevin'),(1706,1667616418635,'phucaone@gmail.com',1,'Apple Kevin'),(1708,1667616997075,'phucaone@gmail.com',1,'Apple Kevin'),(1710,1667617360469,'phucaone@gmail.com',1,'Apple Kevin'),(1712,1667617512471,'phucaone@gmail.com',1,'Apple Kevin');
/*!40000 ALTER TABLE `my_revision_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_type` varchar(31) NOT NULL,
  `id` bigint NOT NULL,
  `avg_rate` double DEFAULT NULL,
  `total_review` bigint DEFAULT NULL,
  `owner_id` bigint DEFAULT NULL,
  `deal_id` bigint DEFAULT NULL,
  `housing_id` bigint DEFAULT NULL,
  `job_id` bigint DEFAULT NULL,
  `marketplace_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqyyhq50chw7pvtswbb2apqdx2` (`owner_id`),
  KEY `FKfdofh7e4fci3j4trm7vd6sco3` (`deal_id`),
  KEY `FK62xy4s3rp009gld6ol742on6h` (`housing_id`),
  KEY `FKjhww91oqsxcgunr9rgjjgs8bt` (`job_id`),
  KEY `FKio84y4q93o1r5726bpbm7bhd0` (`marketplace_id`),
  CONSTRAINT `FK62xy4s3rp009gld6ol742on6h` FOREIGN KEY (`housing_id`) REFERENCES `housing` (`id`),
  CONSTRAINT `FKfdofh7e4fci3j4trm7vd6sco3` FOREIGN KEY (`deal_id`) REFERENCES `deal` (`id`),
  CONSTRAINT `FKio84y4q93o1r5726bpbm7bhd0` FOREIGN KEY (`marketplace_id`) REFERENCES `marketplace` (`id`),
  CONSTRAINT `FKjhww91oqsxcgunr9rgjjgs8bt` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  CONSTRAINT `FKqyyhq50chw7pvtswbb2apqdx2` FOREIGN KEY (`owner_id`) REFERENCES `profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES ('JOB_POST',1530,NULL,NULL,1163,NULL,NULL,1528,NULL),('HOUSING_POST',1548,NULL,NULL,1163,NULL,1546,NULL,NULL),('MARKETPLACE_POST',1558,NULL,NULL,1163,NULL,NULL,NULL,1556),('DEAL_POST',1690,NULL,NULL,1163,1688,NULL,NULL,NULL);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `profile_type` varchar(31) NOT NULL,
  `id` bigint NOT NULL,
  `account_id` bigint DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKorsmm7ow2nvslj85y0bs2xii4` (`account_id`),
  KEY `FK208q3oojx6tc35rus5yd8itrm` (`company_id`),
  CONSTRAINT `FK208q3oojx6tc35rus5yd8itrm` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FKorsmm7ow2nvslj85y0bs2xii4` FOREIGN KEY (`account_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES ('USER_PROFILE',1158,1156,NULL),('USER_PROFILE',1163,1161,NULL),('USER_PROFILE',1168,1166,NULL),('BUSINESS_PROFILE',1231,1156,1228),('BUSINESS_PROFILE',1237,1156,1235),('BUSINESS_PROFILE',1243,1156,1241),('BUSINESS_PROFILE',1249,1156,1247),('USER_PROFILE',1395,1137,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_type` varchar(31) NOT NULL,
  `id` bigint NOT NULL,
  `review_comment` varchar(255) DEFAULT NULL,
  `review_created_on` datetime(6) DEFAULT NULL,
  `review_helpful_count` int DEFAULT NULL,
  `review_rate` int DEFAULT NULL,
  `review_status` varchar(255) DEFAULT NULL,
  `review_updated_on` datetime(6) DEFAULT NULL,
  `reviewer_id` bigint DEFAULT NULL,
  `reviewee_id` bigint DEFAULT NULL,
  `reviewee_profile_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbtfm70ln2w2kdcjb5cq2pygf8` (`reviewer_id`),
  KEY `FK89rqawfg7mdw322sf63lyoicp` (`reviewee_id`),
  KEY `FKsml6h016vl1vtqslweo51noi1` (`reviewee_profile_id`),
  CONSTRAINT `FK89rqawfg7mdw322sf63lyoicp` FOREIGN KEY (`reviewee_id`) REFERENCES `post` (`id`),
  CONSTRAINT `FKbtfm70ln2w2kdcjb5cq2pygf8` FOREIGN KEY (`reviewer_id`) REFERENCES `profile` (`id`),
  CONSTRAINT `FKsml6h016vl1vtqslweo51noi1` FOREIGN KEY (`reviewee_profile_id`) REFERENCES `profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES ('PROFILE_REVIEW',1322,'Greate Place Referrence','2022-09-14 00:48:25.822000',0,5,'ACTIVATED','2022-09-14 00:48:25.822000',1168,NULL,1231),('PROFILE_REVIEW',1324,'Greate Place Referrence','2022-09-14 01:26:38.755000',0,2,'ACTIVATED','2022-09-15 21:11:00.059000',1168,NULL,1231),('PROFILE_REVIEW',1586,'','2022-11-01 06:56:44.879000',0,5,'ACTIVATED','2022-11-01 06:56:44.879000',1163,NULL,1231),('PROFILE_REVIEW',1604,'','2022-11-03 23:13:18.575000',0,5,'ACTIVATED','2022-11-03 23:13:18.575000',1163,NULL,1231),('PROFILE_REVIEW',1606,'Test','2022-11-04 00:06:44.022000',0,5,'ACTIVATED','2022-11-04 00:06:44.022000',1163,NULL,1231),('PROFILE_REVIEW',1608,'fsdfdsf23424','2022-11-04 00:07:50.933000',0,2,'ACTIVATED','2022-11-04 00:07:50.933000',1163,NULL,1231),('PROFILE_REVIEW',1610,'rdas11231axzxzcxzc','2022-11-04 00:09:19.435000',0,1,'ACTIVATED','2022-11-04 00:09:19.435000',1163,NULL,1231),('PROFILE_REVIEW',1612,'1213454871231213A12123!#@#@#','2022-11-04 00:10:49.811000',0,5,'ACTIVATED','2022-11-04 00:10:49.811000',1163,NULL,1231),('PROFILE_REVIEW',1614,'new date','2022-11-04 00:12:58.377000',0,4,'ACTIVATED','2022-11-04 00:12:58.377000',1163,NULL,1231),('PROFILE_REVIEW',1616,'Now','2022-11-04 00:14:00.740000',0,4,'ACTIVATED','2022-11-04 00:14:00.740000',1163,NULL,1231),('PROFILE_REVIEW',1618,'13asdasd','2022-11-04 01:04:26.065000',0,2,'ACTIVATED','2022-11-04 01:04:26.065000',1163,NULL,1231),('PROFILE_REVIEW',1620,'aaaaaaaaaaä','2022-11-04 01:05:26.337000',0,1,'ACTIVATED','2022-11-04 01:05:26.337000',1163,NULL,1231),('PROFILE_REVIEW',1622,'123aaaaaaa','2022-11-04 01:06:34.144000',0,4,'ACTIVATED','2022-11-04 01:06:34.144000',1163,NULL,1231),('PROFILE_REVIEW',1624,'123123','2022-11-04 01:08:34.425000',0,2,'ACTIVATED','2022-11-04 01:08:34.425000',1163,NULL,1231),('PROFILE_REVIEW',1626,'3.5','2022-11-04 01:13:36.627000',0,3,'ACTIVATED','2022-11-04 01:13:36.627000',1163,NULL,1231),('PROFILE_REVIEW',1628,'2.5','2022-11-04 01:17:02.712000',0,2,'ACTIVATED','2022-11-04 01:17:02.712000',1163,NULL,1231),('PROFILE_REVIEW',1630,'4.5','2022-11-04 01:18:09.687000',0,3,'ACTIVATED','2022-11-04 01:18:09.687000',1163,NULL,1231),('PROFILE_REVIEW',1632,'0.5','2022-11-04 01:19:05.661000',0,1,'ACTIVATED','2022-11-04 02:41:31.665000',1163,NULL,1231),('PROFILE_REVIEW',1634,'2.5','2022-11-04 01:21:36.823000',0,2,'ACTIVATED','2022-11-04 01:21:36.823000',1163,NULL,1231),('PROFILE_REVIEW',1636,'4333','2022-11-04 01:22:39.127000',0,1,'ACTIVATED','2022-11-04 02:42:00.015000',1163,NULL,1231),('PROFILE_REVIEW',1638,'2.5','2022-11-04 01:22:58.331000',0,1,'ACTIVATED','2022-11-04 02:42:16.457000',1163,NULL,1231),('PROFILE_REVIEW',1640,'12312312312','2022-11-04 02:43:25.168000',0,5,'ACTIVATED','2022-11-04 02:43:25.168000',1163,NULL,1231),('PROFILE_REVIEW',1642,'12aaaaaa','2022-11-04 02:43:51.169000',0,1,'ACTIVATED','2022-11-04 06:16:59.357000',1163,NULL,1231),('PROFILE_REVIEW',1644,'12313','2022-11-04 06:17:08.798000',0,5,'ACTIVATED','2022-11-05 00:29:56.935000',1163,NULL,1231),('PROFILE_REVIEW',1646,'New','2022-11-05 00:30:05.172000',0,3,'ACTIVATED','2022-11-05 00:30:05.172000',1163,NULL,1231),('PROFILE_REVIEW',1648,'','2022-11-05 01:20:14.133000',0,5,'ACTIVATED','2022-11-05 01:20:14.133000',1163,NULL,1231),('PROFILE_REVIEW',1650,'','2022-11-05 01:20:18.089000',0,5,'ACTIVATED','2022-11-05 01:20:18.089000',1163,NULL,1231),('PROFILE_REVIEW',1652,'','2022-11-05 01:20:21.870000',0,5,'ACTIVATED','2022-11-05 01:20:21.870000',1163,NULL,1231),('PROFILE_REVIEW',1654,'','2022-11-05 01:20:25.938000',0,5,'ACTIVATED','2022-11-05 01:20:25.938000',1163,NULL,1231),('PROFILE_REVIEW',1656,'','2022-11-05 01:20:32.626000',0,5,'ACTIVATED','2022-11-05 01:20:32.626000',1163,NULL,1231),('PROFILE_REVIEW',1658,'','2022-11-05 01:20:36.256000',0,5,'ACTIVATED','2022-11-05 01:20:36.256000',1163,NULL,1231),('PROFILE_REVIEW',1660,'','2022-11-05 01:20:40.394000',0,5,'ACTIVATED','2022-11-05 01:20:40.394000',1163,NULL,1231),('PROFILE_REVIEW',1662,'','2022-11-05 01:20:50.248000',0,5,'ACTIVATED','2022-11-05 01:20:50.248000',1163,NULL,1231),('PROFILE_REVIEW',1664,'','2022-11-05 01:20:54.173000',0,5,'ACTIVATED','2022-11-05 01:20:54.173000',1163,NULL,1231),('PROFILE_REVIEW',1666,'','2022-11-05 01:20:59.080000',0,5,'ACTIVATED','2022-11-05 01:20:59.080000',1163,NULL,1231),('PROFILE_REVIEW',1668,'','2022-11-05 01:22:01.764000',0,5,'ACTIVATED','2022-11-05 01:22:01.764000',1163,NULL,1231),('PROFILE_REVIEW',1670,'','2022-11-05 01:22:05.935000',0,5,'ACTIVATED','2022-11-05 01:22:05.935000',1163,NULL,1231),('PROFILE_REVIEW',1672,'','2022-11-05 01:22:10.483000',0,5,'ACTIVATED','2022-11-05 01:22:10.483000',1163,NULL,1231),('PROFILE_REVIEW',1674,'','2022-11-05 01:22:39.026000',0,5,'ACTIVATED','2022-11-05 01:22:39.026000',1163,NULL,1231),('PROFILE_REVIEW',1676,'','2022-11-05 01:22:46.917000',0,5,'ACTIVATED','2022-11-05 01:22:46.917000',1163,NULL,1231),('PROFILE_REVIEW',1678,'','2022-11-05 01:23:25.642000',0,5,'ACTIVATED','2022-11-05 01:23:25.642000',1163,NULL,1231),('PROFILE_REVIEW',1680,'','2022-11-05 01:23:59.388000',0,5,'ACTIVATED','2022-11-05 01:23:59.388000',1163,NULL,1231),('PROFILE_REVIEW',1682,'','2022-11-05 01:24:04.387000',0,5,'ACTIVATED','2022-11-05 01:24:04.387000',1163,NULL,1231),('PROFILE_REVIEW',1684,'','2022-11-05 01:24:11.317000',0,5,'ACTIVATED','2022-11-05 01:24:11.317000',1163,NULL,1231),('POST_REVIEW',1691,'Deal','2022-11-05 02:36:38.446000',0,3,'ACTIVATED','2022-11-05 02:39:14.315000',1158,1690,NULL),('POST_REVIEW',1693,'Deal 2','2022-11-05 02:39:25.974000',0,5,'ACTIVATED','2022-11-05 02:39:25.974000',1158,1690,NULL),('POST_REVIEW',1695,'','2022-11-05 02:40:52.165000',0,1,'ACTIVATED','2022-11-05 02:40:52.165000',1158,1690,NULL),('POST_REVIEW',1697,'','2022-11-05 02:42:10.381000',0,5,'ACTIVATED','2022-11-05 02:42:10.381000',1158,1690,NULL),('POST_REVIEW',1699,'','2022-11-05 02:43:39.982000',0,5,'ACTIVATED','2022-11-05 02:43:39.982000',1158,1690,NULL),('POST_REVIEW',1701,'1231','2022-11-05 02:44:08.819000',0,5,'ACTIVATED','2022-11-05 02:44:08.819000',1158,1690,NULL),('POST_REVIEW',1703,'','2022-11-05 02:44:48.058000',0,1,'ACTIVATED','2022-11-05 02:44:48.058000',1158,1690,NULL),('POST_REVIEW',1705,'','2022-11-05 02:46:58.602000',0,1,'ACTIVATED','2022-11-05 02:46:58.602000',1158,1690,NULL),('POST_REVIEW',1707,'','2022-11-05 02:56:37.053000',0,5,'ACTIVATED','2022-11-05 02:56:43.928000',1158,1530,NULL),('POST_REVIEW',1709,'','2022-11-05 03:02:40.447000',0,1,'ACTIVATED','2022-11-05 03:02:47.144000',1158,1548,NULL),('POST_REVIEW',1711,'','2022-11-05 03:05:12.452000',0,3,'ACTIVATED','2022-11-05 03:05:25.561000',1158,1558,NULL);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_aud`
--

DROP TABLE IF EXISTS `review_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `review_type` varchar(31) NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `reviewer_id` bigint DEFAULT NULL,
  `reviewee_profile_id` bigint DEFAULT NULL,
  `reviewee_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`,`rev`),
  KEY `FKm93ag2eyrpfh2iq9bm9ml7tty` (`rev`),
  CONSTRAINT `FKm93ag2eyrpfh2iq9bm9ml7tty` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_aud`
--

LOCK TABLES `review_aud` WRITE;
/*!40000 ALTER TABLE `review_aud` DISABLE KEYS */;
INSERT INTO `review_aud` VALUES (1308,1309,'POST_REVIEW',0,1168,NULL,1303),(1308,1566,'POST_REVIEW',2,NULL,NULL,NULL),(1310,1311,'POST_REVIEW',0,1168,NULL,1303),(1310,1564,'POST_REVIEW',2,NULL,NULL,NULL),(1312,1313,'POST_REVIEW',0,1168,NULL,1303),(1312,1568,'POST_REVIEW',2,NULL,NULL,NULL),(1314,1315,'POST_REVIEW',0,1168,NULL,1303),(1314,1567,'POST_REVIEW',2,NULL,NULL,NULL),(1316,1317,'POST_REVIEW',0,1168,NULL,1303),(1316,1565,'POST_REVIEW',2,NULL,NULL,NULL),(1318,1319,'POST_REVIEW',0,1168,NULL,1303),(1318,1569,'POST_REVIEW',2,NULL,NULL,NULL),(1322,1323,'PROFILE_REVIEW',0,1168,1231,NULL),(1324,1325,'PROFILE_REVIEW',0,1168,1231,NULL),(1586,1587,'PROFILE_REVIEW',0,1163,1231,NULL),(1604,1605,'PROFILE_REVIEW',0,1163,1231,NULL),(1606,1607,'PROFILE_REVIEW',0,1163,1231,NULL),(1608,1609,'PROFILE_REVIEW',0,1163,1231,NULL),(1610,1611,'PROFILE_REVIEW',0,1163,1231,NULL),(1612,1613,'PROFILE_REVIEW',0,1163,1231,NULL),(1614,1615,'PROFILE_REVIEW',0,1163,1231,NULL),(1616,1617,'PROFILE_REVIEW',0,1163,1231,NULL),(1618,1619,'PROFILE_REVIEW',0,1163,1231,NULL),(1620,1621,'PROFILE_REVIEW',0,1163,1231,NULL),(1622,1623,'PROFILE_REVIEW',0,1163,1231,NULL),(1624,1625,'PROFILE_REVIEW',0,1163,1231,NULL),(1626,1627,'PROFILE_REVIEW',0,1163,1231,NULL),(1628,1629,'PROFILE_REVIEW',0,1163,1231,NULL),(1630,1631,'PROFILE_REVIEW',0,1163,1231,NULL),(1632,1633,'PROFILE_REVIEW',0,1163,1231,NULL),(1634,1635,'PROFILE_REVIEW',0,1163,1231,NULL),(1636,1637,'PROFILE_REVIEW',0,1163,1231,NULL),(1638,1639,'PROFILE_REVIEW',0,1163,1231,NULL),(1640,1641,'PROFILE_REVIEW',0,1163,1231,NULL),(1642,1643,'PROFILE_REVIEW',0,1163,1231,NULL),(1644,1645,'PROFILE_REVIEW',0,1163,1231,NULL),(1646,1647,'PROFILE_REVIEW',0,1163,1231,NULL),(1648,1649,'PROFILE_REVIEW',0,1163,1231,NULL),(1650,1651,'PROFILE_REVIEW',0,1163,1231,NULL),(1652,1653,'PROFILE_REVIEW',0,1163,1231,NULL),(1654,1655,'PROFILE_REVIEW',0,1163,1231,NULL),(1656,1657,'PROFILE_REVIEW',0,1163,1231,NULL),(1658,1659,'PROFILE_REVIEW',0,1163,1231,NULL),(1660,1661,'PROFILE_REVIEW',0,1163,1231,NULL),(1662,1663,'PROFILE_REVIEW',0,1163,1231,NULL),(1664,1665,'PROFILE_REVIEW',0,1163,1231,NULL),(1666,1667,'PROFILE_REVIEW',0,1163,1231,NULL),(1668,1669,'PROFILE_REVIEW',0,1163,1231,NULL),(1670,1671,'PROFILE_REVIEW',0,1163,1231,NULL),(1672,1673,'PROFILE_REVIEW',0,1163,1231,NULL),(1674,1675,'PROFILE_REVIEW',0,1163,1231,NULL),(1676,1677,'PROFILE_REVIEW',0,1163,1231,NULL),(1678,1679,'PROFILE_REVIEW',0,1163,1231,NULL),(1680,1681,'PROFILE_REVIEW',0,1163,1231,NULL),(1682,1683,'PROFILE_REVIEW',0,1163,1231,NULL),(1684,1685,'PROFILE_REVIEW',0,1163,1231,NULL),(1691,1692,'POST_REVIEW',0,1158,NULL,1690),(1693,1694,'POST_REVIEW',0,1158,NULL,1690),(1695,1696,'POST_REVIEW',0,1158,NULL,1690),(1697,1698,'POST_REVIEW',0,1158,NULL,1690),(1699,1700,'POST_REVIEW',0,1158,NULL,1690),(1701,1702,'POST_REVIEW',0,1158,NULL,1690),(1703,1704,'POST_REVIEW',0,1158,NULL,1690),(1705,1706,'POST_REVIEW',0,1158,NULL,1690),(1707,1708,'POST_REVIEW',0,1158,NULL,1530),(1709,1710,'POST_REVIEW',0,1158,NULL,1548),(1711,1712,'POST_REVIEW',0,1158,NULL,1558);
/*!40000 ALTER TABLE `review_aud` ENABLE KEYS */;
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
INSERT INTO `storage` VALUES (35,'2022-05-22 00:58:34.646000','f01a55de-c66e-4937-9050-6a2e34152c1d.png',47990,'image/png','2022-05-22 00:58:34.646000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff01a55de-c66e-4937-9050-6a2e34152c1d.png?alt=media'),(66,'2022-06-15 22:35:44.787000','79433c58-7b7e-4789-b497-7566989ed02b.png',91555,'image/png','2022-06-15 22:35:44.787000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F79433c58-7b7e-4789-b497-7566989ed02b.png?alt=media'),(115,'2022-07-16 23:48:58.580000','ab4e499e-52c3-4c5b-ad7b-71ed9083df1c.png',62895,'image/png','2022-07-16 23:48:58.580000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fab4e499e-52c3-4c5b-ad7b-71ed9083df1c.png?alt=media'),(118,'2022-07-17 00:39:31.090000','d60cc73a-2a54-4882-bf03-1efcb9498517.png',89748,'image/png','2022-07-17 00:39:31.090000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd60cc73a-2a54-4882-bf03-1efcb9498517.png?alt=media'),(119,'2022-07-17 00:39:31.098000','f9ef2c94-3801-4261-82ba-9456ebb14c4a.png',62895,'image/png','2022-07-17 00:39:31.098000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff9ef2c94-3801-4261-82ba-9456ebb14c4a.png?alt=media'),(120,'2022-07-17 00:39:31.105000','9d715108-74ed-4bf9-9760-647b45e1b13f.png',129359,'image/png','2022-07-17 00:39:31.105000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9d715108-74ed-4bf9-9760-647b45e1b13f.png?alt=media'),(121,'2022-07-17 00:39:31.109000','9a2978ab-1dcb-4124-9089-3b364060bc8c.png',143980,'image/png','2022-07-17 00:39:31.109000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9a2978ab-1dcb-4124-9089-3b364060bc8c.png?alt=media'),(122,'2022-07-17 00:39:31.114000','d34262c9-fc83-443d-a0db-b41ce91e80b9.png',74938,'image/png','2022-07-17 00:39:31.114000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd34262c9-fc83-443d-a0db-b41ce91e80b9.png?alt=media'),(123,'2022-07-17 00:39:31.119000','1a35a7e4-55de-4096-b607-2f90b6bbdf22.png',62291,'image/png','2022-07-17 00:39:31.119000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F1a35a7e4-55de-4096-b607-2f90b6bbdf22.png?alt=media'),(124,'2022-07-17 00:39:31.124000','60ddf136-79d3-4c85-9121-41ef66ab0340.png',76634,'image/png','2022-07-17 00:39:31.124000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F60ddf136-79d3-4c85-9121-41ef66ab0340.png?alt=media'),(125,'2022-07-17 00:39:31.128000','671093ab-f907-437b-8354-5dace210d0d2.png',109517,'image/png','2022-07-17 00:39:31.128000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F671093ab-f907-437b-8354-5dace210d0d2.png?alt=media'),(126,'2022-07-17 00:39:31.131000','45fc3176-4950-42b2-87d0-306308c29aa7.png',67126,'image/png','2022-07-17 00:39:31.131000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F45fc3176-4950-42b2-87d0-306308c29aa7.png?alt=media'),(127,'2022-07-17 00:39:31.137000','74ab22b5-89ef-4db4-9f64-bac56784b6f6.png',111233,'image/png','2022-07-17 00:39:31.137000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F74ab22b5-89ef-4db4-9f64-bac56784b6f6.png?alt=media'),(128,'2022-07-17 00:39:31.142000','c1159a90-d107-4902-b0ff-18debfd702f0.png',91133,'image/png','2022-07-17 00:39:31.142000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc1159a90-d107-4902-b0ff-18debfd702f0.png?alt=media'),(129,'2022-07-17 00:39:31.146000','e6de3d71-6ea3-4586-9c4d-f8a27ea50234.png',128911,'image/png','2022-07-17 00:39:31.146000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe6de3d71-6ea3-4586-9c4d-f8a27ea50234.png?alt=media'),(130,'2022-07-17 00:39:31.151000','e182b882-a546-48a2-99b1-9a49993e51da.png',81416,'image/png','2022-07-17 00:39:31.151000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe182b882-a546-48a2-99b1-9a49993e51da.png?alt=media'),(131,'2022-07-17 00:39:31.156000','d3120b1b-5cb2-4fb6-a128-5df68599b3b3.png',70971,'image/png','2022-07-17 00:39:31.156000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd3120b1b-5cb2-4fb6-a128-5df68599b3b3.png?alt=media'),(132,'2022-07-17 00:39:31.161000','254d64b0-2df7-420b-98ca-170332798ca6.png',56096,'image/png','2022-07-17 00:39:31.161000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F254d64b0-2df7-420b-98ca-170332798ca6.png?alt=media'),(133,'2022-07-17 00:39:31.165000','be3a4b30-0901-4139-9619-67b24d07a808.png',93380,'image/png','2022-07-17 00:39:31.165000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fbe3a4b30-0901-4139-9619-67b24d07a808.png?alt=media'),(134,'2022-07-17 00:39:31.170000','0ced9196-d49c-4961-87bc-b3611cbff538.png',109439,'image/png','2022-07-17 00:39:31.170000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F0ced9196-d49c-4961-87bc-b3611cbff538.png?alt=media'),(135,'2022-07-17 00:39:31.174000','de8fe37a-39a3-4766-9535-d57f8070464d.png',31809,'image/png','2022-07-17 00:39:31.174000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fde8fe37a-39a3-4766-9535-d57f8070464d.png?alt=media'),(136,'2022-07-17 00:39:31.179000','736b21b3-dc0a-4ece-b6e5-8094b5c65852.png',62291,'image/png','2022-07-17 00:39:31.179000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F736b21b3-dc0a-4ece-b6e5-8094b5c65852.png?alt=media'),(137,'2022-07-17 00:39:31.185000','9fc91fda-a5fd-42ac-821f-1e047d0c6a8b.png',36283,'image/png','2022-07-17 00:39:31.185000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9fc91fda-a5fd-42ac-821f-1e047d0c6a8b.png?alt=media'),(138,'2022-07-17 00:39:31.190000','74353b6d-bf38-4028-aae0-15afe1823e64.png',120439,'image/png','2022-07-17 00:39:31.190000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F74353b6d-bf38-4028-aae0-15afe1823e64.png?alt=media'),(139,'2022-07-17 00:39:31.194000','c8cbeef8-ee7b-46dc-b21f-eeb70b8294b1.png',36301,'image/png','2022-07-17 00:39:31.194000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc8cbeef8-ee7b-46dc-b21f-eeb70b8294b1.png?alt=media'),(140,'2022-07-17 00:39:31.199000','5488eaf3-84f5-45db-987a-71d3f11f929e.png',72654,'image/png','2022-07-17 00:39:31.199000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F5488eaf3-84f5-45db-987a-71d3f11f929e.png?alt=media'),(141,'2022-07-17 00:39:31.204000','d12c7177-a12a-4f6a-9e0b-aecee5d35d06.png',48843,'image/png','2022-07-17 00:39:31.204000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd12c7177-a12a-4f6a-9e0b-aecee5d35d06.png?alt=media'),(142,'2022-07-17 00:39:31.208000','413d21c2-2788-4d9c-b3d1-0a69b1ad4a57.png',48911,'image/png','2022-07-17 00:39:31.208000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F413d21c2-2788-4d9c-b3d1-0a69b1ad4a57.png?alt=media'),(143,'2022-07-17 00:39:31.212000','97270b94-bf51-4c10-8718-626dddfffe02.png',70515,'image/png','2022-07-17 00:39:31.212000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F97270b94-bf51-4c10-8718-626dddfffe02.png?alt=media'),(144,'2022-07-17 00:39:31.217000','9881bca6-00fc-4b62-97f1-ac2b01569116.png',76028,'image/png','2022-07-17 00:39:31.217000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9881bca6-00fc-4b62-97f1-ac2b01569116.png?alt=media'),(145,'2022-07-17 00:39:31.224000','098281b8-bdd2-4c49-8468-e13fd7329c0b.png',93380,'image/png','2022-07-17 00:39:31.224000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F098281b8-bdd2-4c49-8468-e13fd7329c0b.png?alt=media'),(146,'2022-07-17 00:39:31.227000','62fbe55f-ddbe-4897-8d4d-4b28b97b0f47.png',50419,'image/png','2022-07-17 00:39:31.227000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F62fbe55f-ddbe-4897-8d4d-4b28b97b0f47.png?alt=media'),(147,'2022-07-17 00:39:31.231000','8c0310e0-66ed-451a-b3d0-186c617d8a84.png',111089,'image/png','2022-07-17 00:39:31.231000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F8c0310e0-66ed-451a-b3d0-186c617d8a84.png?alt=media'),(148,'2022-07-17 00:39:31.237000','95797be0-e831-4d96-860b-1815108b0422.png',44314,'image/png','2022-07-17 00:39:31.237000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F95797be0-e831-4d96-860b-1815108b0422.png?alt=media'),(149,'2022-07-17 00:39:31.242000','d600ef3a-ba88-495b-8139-02c34399cd53.png',95381,'image/png','2022-07-17 00:39:31.242000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd600ef3a-ba88-495b-8139-02c34399cd53.png?alt=media'),(150,'2022-07-17 00:39:31.246000','b9a318cb-f032-4083-ab4e-eae2f275633c.png',64528,'image/png','2022-07-17 00:39:31.246000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fb9a318cb-f032-4083-ab4e-eae2f275633c.png?alt=media'),(151,'2022-07-17 00:39:31.252000','8913e262-82ee-49bb-ad40-aed1bfd828a4.png',84184,'image/png','2022-07-17 00:39:31.252000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F8913e262-82ee-49bb-ad40-aed1bfd828a4.png?alt=media'),(152,'2022-07-17 00:39:31.257000','b1cda82f-05e4-4a9a-b98d-f45ddd0d6f4c.png',45676,'image/png','2022-07-17 00:39:31.257000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fb1cda82f-05e4-4a9a-b98d-f45ddd0d6f4c.png?alt=media'),(153,'2022-07-17 00:39:31.262000','e4c0aab2-79ae-4301-bc8b-d3a6a643970b.png',90514,'image/png','2022-07-17 00:39:31.262000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe4c0aab2-79ae-4301-bc8b-d3a6a643970b.png?alt=media'),(154,'2022-07-17 00:39:31.266000','52652253-f065-46bd-aa1c-9e188cd6bc1d.png',46874,'image/png','2022-07-17 00:39:31.266000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F52652253-f065-46bd-aa1c-9e188cd6bc1d.png?alt=media'),(155,'2022-07-17 00:39:31.271000','e9266193-741b-4e2b-80a0-138c43a11a0c.png',68943,'image/png','2022-07-17 00:39:31.271000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe9266193-741b-4e2b-80a0-138c43a11a0c.png?alt=media'),(156,'2022-07-17 00:39:31.276000','77465aed-65e1-45ed-b663-1c1ba999f31b.png',53772,'image/png','2022-07-17 00:39:31.276000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F77465aed-65e1-45ed-b663-1c1ba999f31b.png?alt=media'),(157,'2022-07-17 00:39:31.280000','e452a54e-4e66-474b-8449-1f2fd8016322.png',65975,'image/png','2022-07-17 00:39:31.280000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe452a54e-4e66-474b-8449-1f2fd8016322.png?alt=media'),(158,'2022-07-17 00:39:31.285000','e7f28680-b923-43b3-af7f-352a191f05dc.png',145748,'image/png','2022-07-17 00:39:31.285000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe7f28680-b923-43b3-af7f-352a191f05dc.png?alt=media'),(159,'2022-07-17 00:39:31.290000','1337652c-df0e-4516-b0af-9c2ec8f5c1d9.png',55918,'image/png','2022-07-17 00:39:31.290000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F1337652c-df0e-4516-b0af-9c2ec8f5c1d9.png?alt=media'),(160,'2022-07-17 00:39:31.294000','4e061664-896e-4cad-a962-8067175035f2.png',27270,'image/png','2022-07-17 00:39:31.294000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F4e061664-896e-4cad-a962-8067175035f2.png?alt=media'),(161,'2022-07-17 00:39:31.299000','35949338-3102-4883-a1ab-c1d2930d20e7.png',45517,'image/png','2022-07-17 00:39:31.299000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F35949338-3102-4883-a1ab-c1d2930d20e7.png?alt=media'),(162,'2022-07-17 00:39:31.304000','5659ea66-13cd-449e-b133-d1213a49face.png',92540,'image/png','2022-07-17 00:39:31.304000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F5659ea66-13cd-449e-b133-d1213a49face.png?alt=media'),(163,'2022-07-17 00:39:31.307000','f7a16180-5a12-406b-a3df-b7af4f81aa58.png',113673,'image/png','2022-07-17 00:39:31.307000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff7a16180-5a12-406b-a3df-b7af4f81aa58.png?alt=media'),(164,'2022-07-17 00:39:31.311000','6e1187ac-283d-4564-87ee-2812d341e9fa.png',48076,'image/png','2022-07-17 00:39:31.311000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F6e1187ac-283d-4564-87ee-2812d341e9fa.png?alt=media'),(165,'2022-07-17 00:39:31.315000','92627e4f-e784-4b93-bc4e-848b0af3d892.png',50496,'image/png','2022-07-17 00:39:31.315000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F92627e4f-e784-4b93-bc4e-848b0af3d892.png?alt=media'),(166,'2022-07-17 00:39:31.320000','64c0350f-49f5-4db9-9d29-765e44d16ab3.png',26981,'image/png','2022-07-17 00:39:31.320000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F64c0350f-49f5-4db9-9d29-765e44d16ab3.png?alt=media'),(167,'2022-07-17 00:39:31.324000','7a4ae955-bbeb-4e0e-963e-a58b39d9b2e8.png',80205,'image/png','2022-07-17 00:39:31.324000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F7a4ae955-bbeb-4e0e-963e-a58b39d9b2e8.png?alt=media'),(168,'2022-07-17 00:39:31.329000','3be6f411-8443-4f4c-8880-62b973fcb41a.png',37782,'image/png','2022-07-17 00:39:31.329000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F3be6f411-8443-4f4c-8880-62b973fcb41a.png?alt=media'),(169,'2022-07-17 00:39:31.334000','deeeaa80-77df-47be-933f-62e69ce32d2b.png',101294,'image/png','2022-07-17 00:39:31.334000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fdeeeaa80-77df-47be-933f-62e69ce32d2b.png?alt=media'),(170,'2022-07-17 00:39:31.338000','9e36c7a2-e264-4df1-a49d-96afb6e5cc87.png',117942,'image/png','2022-07-17 00:39:31.338000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9e36c7a2-e264-4df1-a49d-96afb6e5cc87.png?alt=media'),(171,'2022-07-17 00:39:31.342000','f9e04a73-d888-45cf-a478-f67351df187b.png',64004,'image/png','2022-07-17 00:39:31.342000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff9e04a73-d888-45cf-a478-f67351df187b.png?alt=media'),(172,'2022-07-17 00:39:31.346000','9f207f5c-06ff-4c9c-b8d2-e9520e328bda.png',35201,'image/png','2022-07-17 00:39:31.346000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9f207f5c-06ff-4c9c-b8d2-e9520e328bda.png?alt=media'),(173,'2022-07-17 00:39:31.351000','7acd0673-c4bb-4ffd-aa1b-a2933e3f816d.png',62291,'image/png','2022-07-17 00:39:31.351000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F7acd0673-c4bb-4ffd-aa1b-a2933e3f816d.png?alt=media'),(174,'2022-07-17 00:39:31.355000','43f48ed2-2638-4a26-b49c-ac546b7ca029.png',47791,'image/png','2022-07-17 00:39:31.355000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F43f48ed2-2638-4a26-b49c-ac546b7ca029.png?alt=media'),(175,'2022-07-17 00:39:31.359000','7615532b-15c8-42ce-af5d-18c1cddcacc7.png',48253,'image/png','2022-07-17 00:39:31.359000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F7615532b-15c8-42ce-af5d-18c1cddcacc7.png?alt=media'),(176,'2022-07-17 00:39:31.365000','a9233608-2958-4aff-aa78-0d327fa99667.png',63393,'image/png','2022-07-17 00:39:31.365000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa9233608-2958-4aff-aa78-0d327fa99667.png?alt=media'),(177,'2022-07-17 00:39:31.370000','5585fb4a-e2fd-4b22-a7c9-49e310b3c9a8.png',67551,'image/png','2022-07-17 00:39:31.370000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F5585fb4a-e2fd-4b22-a7c9-49e310b3c9a8.png?alt=media'),(178,'2022-07-17 00:39:31.374000','482ee9b2-5b1c-4b3c-99e7-198d6d96455f.png',111746,'image/png','2022-07-17 00:39:31.374000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F482ee9b2-5b1c-4b3c-99e7-198d6d96455f.png?alt=media'),(179,'2022-07-17 00:39:31.378000','2ae1b1ff-14cf-4cd8-a5a3-6a30fd2dc0a7.png',39817,'image/png','2022-07-17 00:39:31.378000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F2ae1b1ff-14cf-4cd8-a5a3-6a30fd2dc0a7.png?alt=media'),(180,'2022-07-17 00:45:05.396000','72dfd645-9c24-4990-b1f3-eb72c1188c7a.png',62291,'image/png','2022-07-17 00:45:05.396000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F72dfd645-9c24-4990-b1f3-eb72c1188c7a.png?alt=media'),(181,'2022-07-17 00:47:17.019000','0817531b-7c27-4a11-ae0a-c56b3d99abfd.png',90514,'image/png','2022-07-17 00:47:17.019000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F0817531b-7c27-4a11-ae0a-c56b3d99abfd.png?alt=media'),(183,'2022-07-18 23:32:15.253000','ac900dbe-ca3c-4d99-9130-60dbb6b2fd3a.png',152511,'image/png','2022-07-18 23:32:15.253000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fac900dbe-ca3c-4d99-9130-60dbb6b2fd3a.png?alt=media'),(184,'2022-07-18 23:39:00.447000','c1c587e9-8333-439c-84a9-2b0d881a8bff.jpg',200908,'image/jpeg','2022-07-18 23:39:00.447000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc1c587e9-8333-439c-84a9-2b0d881a8bff.jpg?alt=media'),(185,'2022-07-18 23:49:01.230000','606b7ed6-8f73-44f2-9d64-68ec33e4c75e.jpg',74614,'image/jpeg','2022-07-18 23:49:01.230000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F606b7ed6-8f73-44f2-9d64-68ec33e4c75e.jpg?alt=media'),(186,'2022-07-19 00:07:38.416000','cb16ba13-f169-4fc1-94ee-d46538e18d13.png',1662369,'image/png','2022-07-19 00:07:38.416000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fcb16ba13-f169-4fc1-94ee-d46538e18d13.png?alt=media'),(187,'2022-07-19 01:06:47.053000','d0af8bb0-444a-4849-8a82-aee96c6dea2b.png',152511,'image/png','2022-07-19 01:06:47.053000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd0af8bb0-444a-4849-8a82-aee96c6dea2b.png?alt=media'),(188,'2022-07-19 01:19:41.746000','a0e775d0-f286-4012-9f1d-d8bccbaa448b.exe',4,'application/x-msdownload','2022-07-19 01:19:41.746000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa0e775d0-f286-4012-9f1d-d8bccbaa448b.exe?alt=media'),(189,'2022-07-19 01:19:59.722000','2cce58a1-124f-450c-8cf6-acdd0e6b2fbd.png',152511,'image/png','2022-07-19 01:19:59.722000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F2cce58a1-124f-450c-8cf6-acdd0e6b2fbd.png?alt=media'),(1001,'2022-07-19 19:30:45.161000','91830578-78e8-4040-b662-f87011b3b007.jpg',86962,'image/jpeg','2022-07-19 19:30:45.161000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F91830578-78e8-4040-b662-f87011b3b007.jpg?alt=media'),(1003,'2022-07-19 19:42:42.942000','a349828e-8c9b-4f3a-a946-c802eea8ba30.png',236056,'image/png','2022-07-19 19:42:42.942000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa349828e-8c9b-4f3a-a946-c802eea8ba30.png?alt=media'),(1007,'2022-07-19 22:08:37.834000','a24ede07-1057-4437-8369-ae2d2c7ad991.png',147887,'image/png','2022-07-19 22:08:37.834000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa24ede07-1057-4437-8369-ae2d2c7ad991.png?alt=media'),(1010,'2022-07-21 05:23:40.540000','29863498-2a41-4b02-9b6f-6bd4c63f7408.png',2003047,'image/png','2022-07-21 05:23:40.540000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F29863498-2a41-4b02-9b6f-6bd4c63f7408.png?alt=media'),(1011,'2022-07-21 07:49:47.951000','46902e42-3e6e-48ae-925c-0f649cdaca79.png',2005423,'image/png','2022-07-21 07:49:47.951000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F46902e42-3e6e-48ae-925c-0f649cdaca79.png?alt=media'),(1012,'2022-07-21 07:53:15.498000','1ef8db11-7d59-49da-92e7-c6af5268c8ff.png',2105235,'image/png','2022-07-21 07:53:15.498000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F1ef8db11-7d59-49da-92e7-c6af5268c8ff.png?alt=media'),(1013,'2022-07-21 07:59:25.228000','a8a8a7d7-706c-4562-9e69-75822112f0b6.png',2105235,'image/png','2022-07-21 07:59:25.228000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa8a8a7d7-706c-4562-9e69-75822112f0b6.png?alt=media'),(1014,'2022-07-21 08:02:18.523000','4a0ce3d3-34c1-4318-8099-75428f7cd209.png',2105235,'image/png','2022-07-21 08:02:18.523000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F4a0ce3d3-34c1-4318-8099-75428f7cd209.png?alt=media'),(1015,'2022-07-21 08:06:00.853000','e05af9af-99a5-49be-afda-629a2b113e99.png',2105235,'image/png','2022-07-21 08:06:00.853000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe05af9af-99a5-49be-afda-629a2b113e99.png?alt=media'),(1016,'2022-07-21 08:08:04.358000','4880b0b2-1618-4264-af07-6b522ea8182c.png',2105235,'image/png','2022-07-21 08:08:04.358000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F4880b0b2-1618-4264-af07-6b522ea8182c.png?alt=media'),(1017,'2022-07-21 08:09:36.524000','2b49738d-b68c-478d-8b5c-bc057d92637f.png',2105235,'image/png','2022-07-21 08:09:36.524000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F2b49738d-b68c-478d-8b5c-bc057d92637f.png?alt=media'),(1091,'2022-08-16 20:41:52.997000','',0,'','2022-08-16 20:41:52.997000','https://lh3.googleusercontent.com/a/AItbvmlVJWNkCA2U_j6Q36LHnFvhQhSYuTAjv7qhpano=s96-c'),(1094,'2022-08-16 20:43:38.434000','',0,'','2022-08-16 20:43:38.434000','https://lh3.googleusercontent.com/a/AItbvmlVJWNkCA2U_j6Q36LHnFvhQhSYuTAjv7qhpano=s96-c'),(1097,'2022-08-16 20:45:36.644000','',0,'','2022-08-16 20:45:36.644000','https://lh3.googleusercontent.com/a/AItbvmlVJWNkCA2U_j6Q36LHnFvhQhSYuTAjv7qhpano=s96-c'),(1099,'2022-08-16 20:48:20.426000','',0,'','2022-08-16 20:48:20.426000','https://lh3.googleusercontent.com/a/AItbvmlVJWNkCA2U_j6Q36LHnFvhQhSYuTAjv7qhpano=s96-c'),(1101,'2022-08-16 22:21:59.011000','',0,'','2022-08-16 22:21:59.011000','https://lh3.googleusercontent.com/a/AItbvmlVJWNkCA2U_j6Q36LHnFvhQhSYuTAjv7qhpano=s96-c'),(1129,'2022-08-18 02:07:53.530000','',0,'','2022-08-18 02:07:53.530000','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=7860583697345045&height=720&width=720&ext=1663380318&hash=AeSa1nIfsGKiHkVBtNY'),(1132,'2022-08-18 22:15:46.923000','ecf6e4c3-b015-44f0-9980-da7cf46aab8a.jpg',69921,'image/jpeg','2022-08-18 22:15:46.923000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fecf6e4c3-b015-44f0-9980-da7cf46aab8a.jpg?alt=media'),(1135,'2022-08-19 02:21:33.263000','b3df89a0-495f-45af-b080-939f706fdac4.jpeg',848199,'image/jpeg','2022-08-19 02:21:33.263000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fb3df89a0-495f-45af-b080-939f706fdac4.jpeg?alt=media'),(1141,'2022-08-22 22:08:57.146000',NULL,NULL,NULL,'2022-08-22 22:08:57.146000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F052cbe07-ed08-4785-87fe-2021ba759643.png?alt=media'),(1159,'2022-08-23 01:34:36.766000','',0,'','2022-08-23 01:34:36.766000','https://lh3.googleusercontent.com/a/AItbvmlVJWNkCA2U_j6Q36LHnFvhQhSYuTAjv7qhpano=s96-c'),(1164,'2022-08-23 01:40:41.939000','',0,'','2022-08-23 01:40:41.939000','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=7860583697345045&height=720&width=720&ext=1663380318&hash=AeSa1nIfsGKiHkVBtNY'),(1182,'2022-08-25 07:56:50.212000',NULL,NULL,NULL,'2022-08-25 07:56:50.212000','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=7860583697345045&height=720&width=720&ext=1663380318&hash=AeSa1nIfsGKiHkVBtNY'),(1187,'2022-08-25 08:20:09.194000',NULL,NULL,NULL,'2022-08-25 08:20:09.194000','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=7860583697345045&height=720&width=720&ext=1663380318&hash=AeSa1nIfsGKiHkVBtNY'),(1251,'2022-08-31 03:10:13.310000',NULL,NULL,NULL,'2022-08-31 03:10:13.310000','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=7860583697345045&height=720&width=720&ext=1663380318&hash=AeSa1nIfsGKiHkVBtNY'),(1294,'2022-09-13 22:01:31.275000',NULL,NULL,NULL,'2022-09-13 22:01:31.275000','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=7860583697345045&height=720&width=720&ext=1663380318&hash=AeSa1nIfsGKiHkVBtNY'),(1409,'2022-10-21 00:11:02.711000','cc150cac-dc50-4358-bce2-7914232e8b1d.png',271752,'image/png','2022-10-21 00:11:02.711000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fcc150cac-dc50-4358-bce2-7914232e8b1d.png?alt=media'),(1412,'2022-10-21 00:16:48.143000','3072223d-419e-46c6-89bf-b4d136ab9cea.png',711921,'image/png','2022-10-21 00:16:48.143000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F3072223d-419e-46c6-89bf-b4d136ab9cea.png?alt=media'),(1415,'2022-10-21 00:18:07.951000','2b39a609-dec2-481f-b179-7215c8bb7c8f.png',377039,'image/png','2022-10-21 00:18:07.951000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F2b39a609-dec2-481f-b179-7215c8bb7c8f.png?alt=media'),(1418,'2022-10-21 00:30:41.051000','499b370b-d760-423a-a76f-90fd4d94082e.png',380272,'image/png','2022-10-21 00:30:41.051000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F499b370b-d760-423a-a76f-90fd4d94082e.png?alt=media'),(1421,'2022-10-21 00:35:12.485000','bee6d875-8fb6-4ebb-96ac-a23d924724df.jpg',200908,'image/jpeg','2022-10-21 00:35:12.485000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fbee6d875-8fb6-4ebb-96ac-a23d924724df.jpg?alt=media'),(1427,'2022-10-24 20:49:34.878000','3aeb8e87-1e7b-4ca0-af13-d913c45e8ff0.png',725595,'image/png','2022-10-24 20:49:34.878000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F3aeb8e87-1e7b-4ca0-af13-d913c45e8ff0.png?alt=media'),(1430,'2022-10-24 21:00:17.912000','67a886cb-8d08-4c0c-b1a0-f944de0e1872.jpeg',124836,'image/jpeg','2022-10-24 21:00:17.912000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F67a886cb-8d08-4c0c-b1a0-f944de0e1872.jpeg?alt=media'),(1454,'2022-10-24 23:12:31.482000','5f0976e6-dc16-469c-9b72-169de0ab24bd.png',430347,'image/png','2022-10-24 23:12:31.482000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F5f0976e6-dc16-469c-9b72-169de0ab24bd.png?alt=media'),(1457,'2022-10-24 23:30:20.657000','7f15c8b2-1682-45ff-92f5-437eb4e3f1cc.png',134685,'image/png','2022-10-24 23:30:20.657000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F7f15c8b2-1682-45ff-92f5-437eb4e3f1cc.png?alt=media'),(1460,'2022-10-24 23:33:06.582000','6a5d71b1-43a3-4e05-999a-4757a201e89f.jpeg',124836,'image/jpeg','2022-10-24 23:33:06.582000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F6a5d71b1-43a3-4e05-999a-4757a201e89f.jpeg?alt=media'),(1463,'2022-10-24 23:34:23.375000','8ed6dd8c-a514-4352-be48-38e317064ebe.png',725595,'image/png','2022-10-24 23:34:23.375000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F8ed6dd8c-a514-4352-be48-38e317064ebe.png?alt=media'),(1466,'2022-10-24 23:35:29.549000','9472e960-ae98-4151-a275-ab97a779af37.jpg',53878,'image/jpeg','2022-10-24 23:35:29.549000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9472e960-ae98-4151-a275-ab97a779af37.jpg?alt=media'),(1476,'2022-10-25 23:59:40.714000','0d0b6b28-e634-4b6d-836d-427f4a741649.png',1526393,'image/png','2022-10-25 23:59:40.714000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F0d0b6b28-e634-4b6d-836d-427f4a741649.png?alt=media'),(1479,'2022-10-26 00:02:55.550000','b5a2f9cd-ac86-4fb9-a885-9f6b3640b741.jpg',59991,'image/jpeg','2022-10-26 00:02:55.550000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fb5a2f9cd-ac86-4fb9-a885-9f6b3640b741.jpg?alt=media'),(1482,'2022-10-26 00:04:23.342000','67c439d8-00b2-4e6e-bada-d74be2bbbdcd.jpg',39829,'image/jpeg','2022-10-26 00:04:23.342000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F67c439d8-00b2-4e6e-bada-d74be2bbbdcd.jpg?alt=media'),(1485,'2022-10-26 00:04:50.966000','092b732d-b08b-4eb7-9497-f27f0dffef73.jpg',108702,'image/jpeg','2022-10-26 00:04:50.966000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F092b732d-b08b-4eb7-9497-f27f0dffef73.jpg?alt=media'),(1488,'2022-10-26 00:05:49.775000','77a25150-84c3-4f00-9f99-61e06efc058b.webp',1562266,'image/webp','2022-10-26 00:05:49.775000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F77a25150-84c3-4f00-9f99-61e06efc058b.webp?alt=media'),(1491,'2022-10-26 00:07:27.310000','75d226b4-f545-4161-9fb0-690c00b96adf.webp',158890,'image/webp','2022-10-26 00:07:27.310000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F75d226b4-f545-4161-9fb0-690c00b96adf.webp?alt=media'),(1500,'2022-10-28 05:26:22.443000','427cd987-5ce9-411f-ab39-05762372df5d.jpg',105442,'image/jpeg','2022-10-28 05:26:22.443000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F427cd987-5ce9-411f-ab39-05762372df5d.jpg?alt=media'),(1505,'2022-10-28 06:15:13.903000','9a1836e4-b210-42ea-9543-902f945d8796.png',594921,'image/png','2022-10-28 06:15:13.903000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9a1836e4-b210-42ea-9543-902f945d8796.png?alt=media'),(1507,'2022-10-28 06:15:13.916000','1adc9b13-8acf-4d78-87a8-7d04a5d3418b.png',276884,'image/png','2022-10-28 06:15:13.916000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F1adc9b13-8acf-4d78-87a8-7d04a5d3418b.png?alt=media'),(1519,'2022-10-28 23:02:16.002000','11adeacc-cf67-4f8c-9579-e47ba666aa50.jpeg',178864,'image/jpeg','2022-10-28 23:02:16.002000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F11adeacc-cf67-4f8c-9579-e47ba666aa50.jpeg?alt=media'),(1526,'2022-10-28 23:08:35.910000','2a0fba98-69ad-45f3-872e-43d4317c6daf.webp',102280,'image/webp','2022-10-28 23:08:35.910000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F2a0fba98-69ad-45f3-872e-43d4317c6daf.webp?alt=media'),(1544,'2022-10-30 23:13:34.517000','516d58b7-2089-4768-b8a2-5694a3fd8752.png',385342,'image/png','2022-10-30 23:13:34.517000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F516d58b7-2089-4768-b8a2-5694a3fd8752.png?alt=media'),(1554,'2022-10-30 23:42:19.346000','c81631c5-3abf-4009-a523-4a4fb158d221.jpg',585019,'image/jpeg','2022-10-30 23:42:19.346000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc81631c5-3abf-4009-a523-4a4fb158d221.jpg?alt=media'),(1686,'2022-11-05 02:31:37.494000','177d7984-300b-436e-bcdc-4303edfbd124.webp',35494,'image/webp','2022-11-05 02:31:37.494000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F177d7984-300b-436e-bcdc-4303edfbd124.webp?alt=media');
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_aud`
--

DROP TABLE IF EXISTS `storage_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `storage_created_on` datetime(6) DEFAULT NULL,
  `created_on_mod` bit(1) DEFAULT NULL,
  `storage_name` varchar(255) DEFAULT NULL,
  `name_mod` bit(1) DEFAULT NULL,
  `storage_size` bigint DEFAULT NULL,
  `size_mod` bit(1) DEFAULT NULL,
  `storage_type` varchar(255) DEFAULT NULL,
  `type_mod` bit(1) DEFAULT NULL,
  `storage_updated_on` datetime(6) DEFAULT NULL,
  `updated_on_mod` bit(1) DEFAULT NULL,
  `storage_url` varchar(255) DEFAULT NULL,
  `url_mod` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`rev`),
  KEY `FK3keekntgs5d9cie1t8q5imfta` (`rev`),
  CONSTRAINT `FK3keekntgs5d9cie1t8q5imfta` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_aud`
--

LOCK TABLES `storage_aud` WRITE;
/*!40000 ALTER TABLE `storage_aud` DISABLE KEYS */;
INSERT INTO `storage_aud` VALUES (1141,1142,0,'2022-08-22 22:08:57.146000',_binary '',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0','2022-08-22 22:08:57.146000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F052cbe07-ed08-4785-87fe-2021ba759643.png?alt=media',_binary ''),(1159,1160,0,'2022-08-23 01:34:36.766000',_binary '','',_binary '',0,_binary '','',_binary '','2022-08-23 01:34:36.766000',_binary '','https://lh3.googleusercontent.com/a/AItbvmlVJWNkCA2U_j6Q36LHnFvhQhSYuTAjv7qhpano=s96-c',_binary ''),(1164,1165,0,'2022-08-23 01:40:41.939000',_binary '','',_binary '',0,_binary '','',_binary '','2022-08-23 01:40:41.939000',_binary '','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=7860583697345045&height=720&width=720&ext=1663380318&hash=AeSa1nIfsGKiHkVBtNY',_binary ''),(1182,1183,0,'2022-08-25 07:56:50.212000',_binary '',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0','2022-08-25 07:56:50.212000',_binary '','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=7860583697345045&height=720&width=720&ext=1663380318&hash=AeSa1nIfsGKiHkVBtNY',_binary ''),(1187,1188,0,'2022-08-25 08:20:09.194000',_binary '',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0','2022-08-25 08:20:09.194000',_binary '','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=7860583697345045&height=720&width=720&ext=1663380318&hash=AeSa1nIfsGKiHkVBtNY',_binary ''),(1251,1252,0,'2022-08-31 03:10:13.310000',_binary '',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0','2022-08-31 03:10:13.310000',_binary '','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=7860583697345045&height=720&width=720&ext=1663380318&hash=AeSa1nIfsGKiHkVBtNY',_binary ''),(1294,1295,0,'2022-09-13 22:01:31.275000',_binary '',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0','2022-09-13 22:01:31.275000',_binary '','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=7860583697345045&height=720&width=720&ext=1663380318&hash=AeSa1nIfsGKiHkVBtNY',_binary ''),(1409,1410,0,'2022-10-21 00:11:02.711000',_binary '','cc150cac-dc50-4358-bce2-7914232e8b1d.png',_binary '',271752,_binary '','image/png',_binary '','2022-10-21 00:11:02.711000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fcc150cac-dc50-4358-bce2-7914232e8b1d.png?alt=media',_binary ''),(1412,1413,0,'2022-10-21 00:16:48.143000',_binary '','3072223d-419e-46c6-89bf-b4d136ab9cea.png',_binary '',711921,_binary '','image/png',_binary '','2022-10-21 00:16:48.143000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F3072223d-419e-46c6-89bf-b4d136ab9cea.png?alt=media',_binary ''),(1415,1416,0,'2022-10-21 00:18:07.951000',_binary '','2b39a609-dec2-481f-b179-7215c8bb7c8f.png',_binary '',377039,_binary '','image/png',_binary '','2022-10-21 00:18:07.951000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F2b39a609-dec2-481f-b179-7215c8bb7c8f.png?alt=media',_binary ''),(1418,1419,0,'2022-10-21 00:30:41.051000',_binary '','499b370b-d760-423a-a76f-90fd4d94082e.png',_binary '',380272,_binary '','image/png',_binary '','2022-10-21 00:30:41.051000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F499b370b-d760-423a-a76f-90fd4d94082e.png?alt=media',_binary ''),(1421,1422,0,'2022-10-21 00:35:12.485000',_binary '','bee6d875-8fb6-4ebb-96ac-a23d924724df.jpg',_binary '',200908,_binary '','image/jpeg',_binary '','2022-10-21 00:35:12.485000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fbee6d875-8fb6-4ebb-96ac-a23d924724df.jpg?alt=media',_binary ''),(1427,1428,0,'2022-10-24 20:49:34.878000',_binary '','3aeb8e87-1e7b-4ca0-af13-d913c45e8ff0.png',_binary '',725595,_binary '','image/png',_binary '','2022-10-24 20:49:34.878000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F3aeb8e87-1e7b-4ca0-af13-d913c45e8ff0.png?alt=media',_binary ''),(1430,1431,0,'2022-10-24 21:00:17.912000',_binary '','67a886cb-8d08-4c0c-b1a0-f944de0e1872.jpeg',_binary '',124836,_binary '','image/jpeg',_binary '','2022-10-24 21:00:17.912000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F67a886cb-8d08-4c0c-b1a0-f944de0e1872.jpeg?alt=media',_binary ''),(1454,1455,0,'2022-10-24 23:12:31.482000',_binary '','5f0976e6-dc16-469c-9b72-169de0ab24bd.png',_binary '',430347,_binary '','image/png',_binary '','2022-10-24 23:12:31.482000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F5f0976e6-dc16-469c-9b72-169de0ab24bd.png?alt=media',_binary ''),(1457,1458,0,'2022-10-24 23:30:20.657000',_binary '','7f15c8b2-1682-45ff-92f5-437eb4e3f1cc.png',_binary '',134685,_binary '','image/png',_binary '','2022-10-24 23:30:20.657000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F7f15c8b2-1682-45ff-92f5-437eb4e3f1cc.png?alt=media',_binary ''),(1460,1461,0,'2022-10-24 23:33:06.582000',_binary '','6a5d71b1-43a3-4e05-999a-4757a201e89f.jpeg',_binary '',124836,_binary '','image/jpeg',_binary '','2022-10-24 23:33:06.582000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F6a5d71b1-43a3-4e05-999a-4757a201e89f.jpeg?alt=media',_binary ''),(1463,1464,0,'2022-10-24 23:34:23.375000',_binary '','8ed6dd8c-a514-4352-be48-38e317064ebe.png',_binary '',725595,_binary '','image/png',_binary '','2022-10-24 23:34:23.375000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F8ed6dd8c-a514-4352-be48-38e317064ebe.png?alt=media',_binary ''),(1466,1467,0,'2022-10-24 23:35:29.549000',_binary '','9472e960-ae98-4151-a275-ab97a779af37.jpg',_binary '',53878,_binary '','image/jpeg',_binary '','2022-10-24 23:35:29.549000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9472e960-ae98-4151-a275-ab97a779af37.jpg?alt=media',_binary ''),(1476,1477,0,'2022-10-25 23:59:40.714000',_binary '','0d0b6b28-e634-4b6d-836d-427f4a741649.png',_binary '',1526393,_binary '','image/png',_binary '','2022-10-25 23:59:40.714000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F0d0b6b28-e634-4b6d-836d-427f4a741649.png?alt=media',_binary ''),(1479,1480,0,'2022-10-26 00:02:55.550000',_binary '','b5a2f9cd-ac86-4fb9-a885-9f6b3640b741.jpg',_binary '',59991,_binary '','image/jpeg',_binary '','2022-10-26 00:02:55.550000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fb5a2f9cd-ac86-4fb9-a885-9f6b3640b741.jpg?alt=media',_binary ''),(1482,1483,0,'2022-10-26 00:04:23.342000',_binary '','67c439d8-00b2-4e6e-bada-d74be2bbbdcd.jpg',_binary '',39829,_binary '','image/jpeg',_binary '','2022-10-26 00:04:23.342000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F67c439d8-00b2-4e6e-bada-d74be2bbbdcd.jpg?alt=media',_binary ''),(1485,1486,0,'2022-10-26 00:04:50.966000',_binary '','092b732d-b08b-4eb7-9497-f27f0dffef73.jpg',_binary '',108702,_binary '','image/jpeg',_binary '','2022-10-26 00:04:50.966000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F092b732d-b08b-4eb7-9497-f27f0dffef73.jpg?alt=media',_binary ''),(1488,1489,0,'2022-10-26 00:05:49.775000',_binary '','77a25150-84c3-4f00-9f99-61e06efc058b.webp',_binary '',1562266,_binary '','image/webp',_binary '','2022-10-26 00:05:49.775000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F77a25150-84c3-4f00-9f99-61e06efc058b.webp?alt=media',_binary ''),(1491,1492,0,'2022-10-26 00:07:27.310000',_binary '','75d226b4-f545-4161-9fb0-690c00b96adf.webp',_binary '',158890,_binary '','image/webp',_binary '','2022-10-26 00:07:27.310000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F75d226b4-f545-4161-9fb0-690c00b96adf.webp?alt=media',_binary ''),(1500,1501,0,'2022-10-28 05:26:22.443000',_binary '','427cd987-5ce9-411f-ab39-05762372df5d.jpg',_binary '',105442,_binary '','image/jpeg',_binary '','2022-10-28 05:26:22.443000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F427cd987-5ce9-411f-ab39-05762372df5d.jpg?alt=media',_binary ''),(1505,1506,0,'2022-10-28 06:15:13.903000',_binary '','9a1836e4-b210-42ea-9543-902f945d8796.png',_binary '',594921,_binary '','image/png',_binary '','2022-10-28 06:15:13.903000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9a1836e4-b210-42ea-9543-902f945d8796.png?alt=media',_binary ''),(1507,1508,0,'2022-10-28 06:15:13.916000',_binary '','1adc9b13-8acf-4d78-87a8-7d04a5d3418b.png',_binary '',276884,_binary '','image/png',_binary '','2022-10-28 06:15:13.916000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F1adc9b13-8acf-4d78-87a8-7d04a5d3418b.png?alt=media',_binary ''),(1519,1520,0,'2022-10-28 23:02:16.002000',_binary '','11adeacc-cf67-4f8c-9579-e47ba666aa50.jpeg',_binary '',178864,_binary '','image/jpeg',_binary '','2022-10-28 23:02:16.002000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F11adeacc-cf67-4f8c-9579-e47ba666aa50.jpeg?alt=media',_binary ''),(1526,1527,0,'2022-10-28 23:08:35.910000',_binary '','2a0fba98-69ad-45f3-872e-43d4317c6daf.webp',_binary '',102280,_binary '','image/webp',_binary '','2022-10-28 23:08:35.910000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F2a0fba98-69ad-45f3-872e-43d4317c6daf.webp?alt=media',_binary ''),(1544,1545,0,'2022-10-30 23:13:34.517000',_binary '','516d58b7-2089-4768-b8a2-5694a3fd8752.png',_binary '',385342,_binary '','image/png',_binary '','2022-10-30 23:13:34.517000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F516d58b7-2089-4768-b8a2-5694a3fd8752.png?alt=media',_binary ''),(1554,1555,0,'2022-10-30 23:42:19.346000',_binary '','c81631c5-3abf-4009-a523-4a4fb158d221.jpg',_binary '',585019,_binary '','image/jpeg',_binary '','2022-10-30 23:42:19.346000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc81631c5-3abf-4009-a523-4a4fb158d221.jpg?alt=media',_binary ''),(1686,1687,0,'2022-11-05 02:31:37.494000',_binary '','177d7984-300b-436e-bcdc-4303edfbd124.webp',_binary '',35494,_binary '','image/webp',_binary '','2022-11-05 02:31:37.494000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F177d7984-300b-436e-bcdc-4303edfbd124.webp?alt=media',_binary '');
/*!40000 ALTER TABLE `storage_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL,
  `user_created_on` datetime(6) DEFAULT NULL,
  `user_description` longtext,
  `is_user_description_public` bit(1) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `is_user_email_public` bit(1) DEFAULT NULL,
  `user_firstname` varchar(255) DEFAULT NULL,
  `user_fullname` varchar(255) DEFAULT NULL,
  `is_user_email_verified` bit(1) DEFAULT NULL,
  `is_user_phone_verified` bit(1) DEFAULT NULL,
  `user_lastname` varchar(255) DEFAULT NULL,
  `is_user_location_public` bit(1) DEFAULT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `is_user_phone_public` bit(1) DEFAULT NULL,
  `user_issuer` varchar(255) NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `user_status` varchar(255) NOT NULL,
  `user_sub` varchar(255) NOT NULL,
  `user_updated_on` datetime(6) DEFAULT NULL,
  `user_username` varchar(255) DEFAULT NULL,
  `user_website` varchar(255) DEFAULT NULL,
  `is_user_website_public` bit(1) DEFAULT NULL,
  `location_id` bigint DEFAULT NULL,
  `picture_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKneyhvoj17hax43m8dq3u7gbic` (`location_id`),
  KEY `FK2avvd8opahqyvchiclpd1xvs9` (`picture_id`),
  CONSTRAINT `FK2avvd8opahqyvchiclpd1xvs9` FOREIGN KEY (`picture_id`) REFERENCES `storage` (`id`),
  CONSTRAINT `FKneyhvoj17hax43m8dq3u7gbic` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1137,'2022-08-22 22:03:57.599000','aaaa',_binary '\0','admin@gmail.com',_binary '\0','Kevin ssgggg55555',' ',_binary '\0',_binary '\0','Ngo',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC','(626) 877-3042',_binary '\0','THAINOW','ADMIN','ACTIVATED','183b2dec-e4e6-4312-89ea-0657ca787fa1','2022-10-06 21:16:27.519000','Kevin ssgggg55555',NULL,_binary '\0',12,181),(1156,'2022-08-23 01:23:25.191000','',_binary '\0','phucaone@gmail.com',_binary '\0','',' ',_binary '\0',_binary '\0','',_binary '\0','$2a$10$32AnP4fGQTKiUxl7yEouf.FI4IZqTUnthBFfmq04D4IEvwoODWLE2','',_binary '\0','APPLE','ADMIN','ACTIVATED','32ee2ee8-d2db-4223-a975-8c1165349396','2022-10-26 00:07:27.330000','Apple Kevin','',_binary '\0',NULL,1476),(1161,'2022-08-23 01:34:36.817000','',_binary '\0','kvngo@tedkvn.com',_binary '','','Kevin Ngo',_binary '',_binary '\0','',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG','',_binary '\0','GOOGLE','CLASSIC','ACTIVATED','0efffedb-b196-4f06-a6d0-a1dd0a0d1680','2022-10-29 02:47:38.235000','Kevin Ngssss','',_binary '',NULL,1421),(1166,'2022-08-23 01:40:41.987000',NULL,_binary '\0','phucaone5@gmail.com',_binary '\0','',' ',_binary '\0',_binary '\0','',_binary '\0','$2a$10$nhBdeQRLiADgn3QgOv11PeUKJfbkxYMim6VJNkNpNHaGBax9/DmoC',NULL,_binary '\0','FACEBOOK','CLASSIC','ACTIVATED','36d3028f-eb22-4f03-9a56-0b9223a36861','2022-08-23 01:40:41.987000','Kevin',NULL,_binary '\0',NULL,1164);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_aud`
--

DROP TABLE IF EXISTS `user_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `user_created_on` datetime(6) DEFAULT NULL,
  `created_on_mod` bit(1) DEFAULT NULL,
  `user_description` longtext,
  `description_mod` bit(1) DEFAULT NULL,
  `is_user_description_public` bit(1) DEFAULT NULL,
  `description_public_mod` bit(1) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `email_mod` bit(1) DEFAULT NULL,
  `is_user_email_public` bit(1) DEFAULT NULL,
  `email_public_mod` bit(1) DEFAULT NULL,
  `user_firstname` varchar(255) DEFAULT NULL,
  `first_name_mod` bit(1) DEFAULT NULL,
  `user_fullname` varchar(255) DEFAULT NULL,
  `full_name_mod` bit(1) DEFAULT NULL,
  `is_user_email_verified` bit(1) DEFAULT NULL,
  `is_email_verified_mod` bit(1) DEFAULT NULL,
  `is_user_phone_verified` bit(1) DEFAULT NULL,
  `is_phone_verified_mod` bit(1) DEFAULT NULL,
  `user_lastname` varchar(255) DEFAULT NULL,
  `last_name_mod` bit(1) DEFAULT NULL,
  `is_user_location_public` bit(1) DEFAULT NULL,
  `location_public_mod` bit(1) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `password_mod` bit(1) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `phone_mod` bit(1) DEFAULT NULL,
  `is_user_phone_public` bit(1) DEFAULT NULL,
  `phone_public_mod` bit(1) DEFAULT NULL,
  `user_issuer` varchar(255) DEFAULT NULL,
  `provider_mod` bit(1) DEFAULT NULL,
  `user_role` varchar(255) DEFAULT NULL,
  `role_mod` bit(1) DEFAULT NULL,
  `user_status` varchar(255) DEFAULT NULL,
  `status_mod` bit(1) DEFAULT NULL,
  `user_sub` varchar(255) DEFAULT NULL,
  `sub_mod` bit(1) DEFAULT NULL,
  `user_updated_on` datetime(6) DEFAULT NULL,
  `updated_on_mod` bit(1) DEFAULT NULL,
  `user_username` varchar(255) DEFAULT NULL,
  `username_mod` bit(1) DEFAULT NULL,
  `user_website` varchar(255) DEFAULT NULL,
  `website_mod` bit(1) DEFAULT NULL,
  `is_user_website_public` bit(1) DEFAULT NULL,
  `website_public_mod` bit(1) DEFAULT NULL,
  `cover_pictures_mod` bit(1) DEFAULT NULL,
  `location_id` bigint DEFAULT NULL,
  `location_mod` bit(1) DEFAULT NULL,
  `picture_id` bigint DEFAULT NULL,
  `picture_mod` bit(1) DEFAULT NULL,
  `privileges_mod` bit(1) DEFAULT NULL,
  `pictures_mod` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`rev`),
  KEY `FKajh6d2q99a8hredhr7grvqlry` (`rev`),
  CONSTRAINT `FKajh6d2q99a8hredhr7grvqlry` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_aud`
--

LOCK TABLES `user_aud` WRITE;
/*!40000 ALTER TABLE `user_aud` DISABLE KEYS */;
INSERT INTO `user_aud` VALUES (1137,1138,0,'2022-08-22 22:03:57.599000',_binary '',NULL,_binary '\0',_binary '\0',_binary '','admin@gmail.com',_binary '',_binary '\0',_binary '','',_binary '',' ',_binary '',_binary '\0',_binary '',_binary '\0',_binary '','',_binary '',_binary '\0',_binary '','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '','(626) 877-3042',_binary '',_binary '\0',_binary '','THAINOW',_binary '','CLASSIC',_binary '','ACTIVATED',_binary '','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '','2022-08-22 22:03:57.599000',_binary '','kevin ngo',_binary '',NULL,_binary '\0',_binary '\0',_binary '',_binary '',NULL,_binary '\0',181,_binary '',_binary '',NULL),(1137,1151,1,'2022-08-22 22:03:57.599000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','BUSINESS',_binary '','ACTIVATED',_binary '\0','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-08-23 00:44:31.294000',_binary '','kevin ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1137,1154,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','BUSINESS',_binary '\0','ACTIVATED',_binary '\0','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-08-23 01:04:19.097000',_binary '','kevin ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '',12,_binary '',181,_binary '\0',_binary '\0',NULL),(1137,1155,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','BUSINESS',_binary '\0','ACTIVATED',_binary '\0','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-08-23 01:10:22.070000',_binary '','Kevin ssgggg55555',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '',12,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1137,1334,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '','ACTIVATED',_binary '\0','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-10-02 01:05:11.390000',_binary '','Kevin ssgggg55555',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',12,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1137,1335,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '','ACTIVATED',_binary '\0','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-10-02 01:05:11.412000',_binary '','Kevin ssgggg55555',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',12,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1137,1336,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '','ACTIVATED',_binary '\0','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-10-02 01:05:11.412000',_binary '','Kevin ssgggg55555',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',12,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1137,1337,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '','ACTIVATED',_binary '\0','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-10-02 01:05:11.412000',_binary '','Kevin ssgggg55555',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',12,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1137,1338,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '','ACTIVATED',_binary '\0','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-10-02 01:05:11.412000',_binary '','Kevin ssgggg55555',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',12,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1137,1344,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','BUSINESS',_binary '','ACTIVATED',_binary '\0','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-10-04 00:06:54.825000',_binary '','Kevin ssgggg55555',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',12,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1137,1346,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '','ACTIVATED',_binary '\0','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-10-04 00:07:20.941000',_binary '','Kevin ssgggg55555',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',12,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1137,1350,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','BUSINESS',_binary '','ACTIVATED',_binary '\0','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-10-04 00:10:42.523000',_binary '','Kevin ssgggg55555',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',12,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1137,1352,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '','ACTIVATED',_binary '\0','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-10-04 02:27:41.490000',_binary '','Kevin ssgggg55555',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',12,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1137,1356,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','BUSINESS',_binary '','ACTIVATED',_binary '\0','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-10-04 02:28:45.955000',_binary '','Kevin ssgggg55555',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',12,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1137,1358,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '','ACTIVATED',_binary '\0','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-10-04 02:28:51.506000',_binary '','Kevin ssgggg55555',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',12,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1137,1362,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','BUSINESS',_binary '','ACTIVATED',_binary '\0','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-10-04 02:31:31.722000',_binary '','Kevin ssgggg55555',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',12,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1137,1378,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','ADMIN',_binary '\0','DELETED',_binary '','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-10-06 20:32:39.658000',_binary '','Kevin ssgggg55555',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',12,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1137,1380,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','ADMIN',_binary '\0','ACTIVATED',_binary '','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-10-06 20:51:44.432000',_binary '','Kevin ssgggg55555',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',12,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1137,1386,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','ADMIN',_binary '\0','DELETED',_binary '','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-10-06 20:56:41.495000',_binary '','Kevin ssgggg55555',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',12,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1137,1388,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','ADMIN',_binary '\0','ACTIVATED',_binary '','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-10-06 20:58:54.143000',_binary '','Kevin ssgggg55555',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',12,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1137,1392,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','ADMIN',_binary '\0','DELETED',_binary '','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-10-06 21:15:48.011000',_binary '','Kevin ssgggg55555',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',12,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1137,1394,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','ADMIN',_binary '\0','ACTIVATED',_binary '','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-10-06 21:16:27.519000',_binary '','Kevin ssgggg55555',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',12,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1156,1157,0,'2022-08-23 01:23:25.191000',_binary '',NULL,_binary '\0',_binary '\0',_binary '','phucaone@gmail.com',_binary '',_binary '\0',_binary '','',_binary '',' ',_binary '',_binary '\0',_binary '',_binary '\0',_binary '','',_binary '',_binary '\0',_binary '','$2a$10$32AnP4fGQTKiUxl7yEouf.FI4IZqTUnthBFfmq04D4IEvwoODWLE2',_binary '',NULL,_binary '\0',_binary '\0',_binary '','APPLE',_binary '','CLASSIC',_binary '','ACTIVATED',_binary '','32ee2ee8-d2db-4223-a975-8c1165349396',_binary '','2022-08-23 01:23:25.191000',_binary '','',_binary '',NULL,_binary '\0',_binary '\0',_binary '',_binary '',NULL,_binary '\0',181,_binary '',_binary '',NULL),(1156,1230,1,'2022-08-23 01:23:25.191000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$32AnP4fGQTKiUxl7yEouf.FI4IZqTUnthBFfmq04D4IEvwoODWLE2',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','APPLE',_binary '\0','BUSINESS',_binary '','ACTIVATED',_binary '\0','32ee2ee8-d2db-4223-a975-8c1165349396',_binary '\0','2022-08-25 22:43:54.289000',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',181,_binary '\0',_binary '\0',NULL),(1156,1450,1,'2022-08-23 01:23:25.191000',_binary '\0','',_binary '',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$32AnP4fGQTKiUxl7yEouf.FI4IZqTUnthBFfmq04D4IEvwoODWLE2',_binary '\0','',_binary '',_binary '\0',_binary '\0','APPLE',_binary '\0','ADMIN',_binary '\0','ACTIVATED',_binary '\0','32ee2ee8-d2db-4223-a975-8c1165349396',_binary '\0','2022-10-24 22:11:37.505000',_binary '','Apple Kevin',_binary '','',_binary '',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',181,_binary '\0',_binary '\0',_binary '\0'),(1156,1478,1,'2022-08-23 01:23:25.191000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$32AnP4fGQTKiUxl7yEouf.FI4IZqTUnthBFfmq04D4IEvwoODWLE2',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','APPLE',_binary '\0','ADMIN',_binary '\0','ACTIVATED',_binary '\0','32ee2ee8-d2db-4223-a975-8c1165349396',_binary '\0','2022-10-25 23:59:40.751000',_binary '','Apple Kevin',_binary '\0','',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1476,_binary '',_binary '\0',_binary '\0'),(1156,1481,1,'2022-08-23 01:23:25.191000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$32AnP4fGQTKiUxl7yEouf.FI4IZqTUnthBFfmq04D4IEvwoODWLE2',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','APPLE',_binary '\0','ADMIN',_binary '\0','ACTIVATED',_binary '\0','32ee2ee8-d2db-4223-a975-8c1165349396',_binary '\0','2022-10-26 00:02:55.561000',_binary '','Apple Kevin',_binary '\0','',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1476,_binary '\0',_binary '\0',_binary ''),(1156,1484,1,'2022-08-23 01:23:25.191000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$32AnP4fGQTKiUxl7yEouf.FI4IZqTUnthBFfmq04D4IEvwoODWLE2',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','APPLE',_binary '\0','ADMIN',_binary '\0','ACTIVATED',_binary '\0','32ee2ee8-d2db-4223-a975-8c1165349396',_binary '\0','2022-10-26 00:04:23.363000',_binary '','Apple Kevin',_binary '\0','',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1476,_binary '\0',_binary '\0',_binary ''),(1156,1487,1,'2022-08-23 01:23:25.191000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$32AnP4fGQTKiUxl7yEouf.FI4IZqTUnthBFfmq04D4IEvwoODWLE2',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','APPLE',_binary '\0','ADMIN',_binary '\0','ACTIVATED',_binary '\0','32ee2ee8-d2db-4223-a975-8c1165349396',_binary '\0','2022-10-26 00:04:50.978000',_binary '','Apple Kevin',_binary '\0','',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1476,_binary '\0',_binary '\0',_binary ''),(1156,1490,1,'2022-08-23 01:23:25.191000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$32AnP4fGQTKiUxl7yEouf.FI4IZqTUnthBFfmq04D4IEvwoODWLE2',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','APPLE',_binary '\0','ADMIN',_binary '\0','ACTIVATED',_binary '\0','32ee2ee8-d2db-4223-a975-8c1165349396',_binary '\0','2022-10-26 00:05:49.787000',_binary '','Apple Kevin',_binary '\0','',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1476,_binary '\0',_binary '\0',_binary ''),(1156,1493,1,'2022-08-23 01:23:25.191000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$32AnP4fGQTKiUxl7yEouf.FI4IZqTUnthBFfmq04D4IEvwoODWLE2',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','APPLE',_binary '\0','ADMIN',_binary '\0','ACTIVATED',_binary '\0','32ee2ee8-d2db-4223-a975-8c1165349396',_binary '\0','2022-10-26 00:07:27.330000',_binary '','Apple Kevin',_binary '\0','',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1476,_binary '\0',_binary '\0',_binary ''),(1161,1162,0,'2022-08-23 01:34:36.817000',_binary '',NULL,_binary '\0',_binary '\0',_binary '','kvngo@tedkvn.com',_binary '',_binary '\0',_binary '','Kevin',_binary '','Kevin Ngo',_binary '',_binary '',_binary '',_binary '\0',_binary '','Ngo',_binary '',_binary '\0',_binary '','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '',NULL,_binary '\0',_binary '\0',_binary '','GOOGLE',_binary '','CLASSIC',_binary '','ACTIVATED',_binary '','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '','2022-08-23 01:34:36.817000',_binary '','Kevin Ngo',_binary '',NULL,_binary '\0',_binary '\0',_binary '',_binary '',NULL,_binary '\0',1159,_binary '',_binary '',NULL),(1161,1411,1,'2022-08-23 01:34:36.817000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-21 00:11:02.752000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1409,_binary '',_binary '\0',_binary '\0'),(1161,1414,1,'2022-08-23 01:34:36.817000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-21 00:16:48.163000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1412,_binary '',_binary '\0',_binary '\0'),(1161,1417,1,'2022-08-23 01:34:36.817000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-21 00:18:07.958000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1415,_binary '',_binary '\0',_binary '\0'),(1161,1423,1,'2022-08-23 01:34:36.817000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-21 00:35:12.504000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '',_binary '\0',_binary '\0'),(1161,1424,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','',_binary '','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 20:41:46.298000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary '\0'),(1161,1425,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 20:45:34.043000',_binary '','Kevin Ngoxxxx',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary '\0'),(1161,1426,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 20:48:20.113000',_binary '','Kevin Ngoxxxx123',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary '\0'),(1161,1429,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 20:49:34.889000',_binary '','Kevin Ngoxxxx123',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary ''),(1161,1432,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 21:00:17.920000',_binary '','Kevin Ngoxxxx123',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary ''),(1161,1433,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 21:07:47.959000',_binary '','Kevin Ngoxxxx123555',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary ''),(1161,1434,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 21:08:33.138000',_binary '','Kevin Ng',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary ''),(1161,1435,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 21:08:59.988000',_binary '','Kevin Ng',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary ''),(1161,1436,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 21:12:59.795000',_binary '','Kevin Ng',_binary '\0','https://tedkvn.com',_binary '',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary ''),(1161,1437,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 21:13:16.507000',_binary '','Kevin Ng',_binary '\0','https://tedkvn.com',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary ''),(1161,1438,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 21:13:33.574000',_binary '','Kevin Ng',_binary '\0','https://tedkvn.com',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary ''),(1161,1439,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 21:15:24.555000',_binary '','Kevin Ng',_binary '\0','https://tedkvn.com',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary ''),(1161,1440,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 21:21:45.989000',_binary '','Kevin Ng',_binary '\0','https://tedkvn.com',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary ''),(1161,1441,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','(626) 877-3058',_binary '',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 21:32:50.286000',_binary '','Kevin Ng',_binary '\0','https://tedkvn.com',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary ''),(1161,1442,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 21:36:05.547000',_binary '','Kevin Ng',_binary '\0','https://tedkvn.com',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary ''),(1161,1443,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 21:38:15.737000',_binary '','Kevin Ng',_binary '\0','https://tedkvn.com',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary ''),(1161,1444,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '',_binary '','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 21:39:31.562000',_binary '','Kevin Ng',_binary '\0','https://tedkvn.com',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary ''),(1161,1445,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 21:47:57.283000',_binary '','Kevin Ng',_binary '\0','https://tedkvn.com',_binary '\0',_binary '',_binary '',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary ''),(1161,1446,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 21:48:03.628000',_binary '','Kevin Ng',_binary '\0','',_binary '',_binary '',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary ''),(1161,1447,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '',_binary '','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 22:00:32.343000',_binary '','Kevin Ng',_binary '\0','',_binary '\0',_binary '',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary ''),(1161,1448,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '',_binary '\0','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 22:05:09.954000',_binary '','Kevin Ngssss',_binary '','',_binary '\0',_binary '',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary ''),(1161,1449,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '',_binary '\0','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-24 22:05:13.249000',_binary '','Kevin Ngssss',_binary '\0','',_binary '\0',_binary '',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary ''),(1161,1534,1,'2022-08-23 01:34:36.817000',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '',_binary '\0','',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '\0','2022-10-29 02:47:38.235000',_binary '','Kevin Ngssss',_binary '\0','',_binary '\0',_binary '',_binary '\0',NULL,NULL,_binary '\0',1421,_binary '\0',_binary '\0',_binary ''),(1166,1167,0,'2022-08-23 01:40:41.987000',_binary '',NULL,_binary '\0',_binary '\0',_binary '','phucaone5@gmail.com',_binary '',_binary '\0',_binary '','',_binary '',' ',_binary '',_binary '\0',_binary '',_binary '\0',_binary '','',_binary '',_binary '\0',_binary '','$2a$10$nhBdeQRLiADgn3QgOv11PeUKJfbkxYMim6VJNkNpNHaGBax9/DmoC',_binary '',NULL,_binary '\0',_binary '\0',_binary '','FACEBOOK',_binary '','CLASSIC',_binary '','ACTIVATED',_binary '','36d3028f-eb22-4f03-9a56-0b9223a36861',_binary '','2022-08-23 01:40:41.987000',_binary '','Kevin',_binary '',NULL,_binary '\0',_binary '\0',_binary '',_binary '',NULL,_binary '\0',1164,_binary '',_binary '',NULL);
/*!40000 ALTER TABLE `user_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cover_pictures`
--

DROP TABLE IF EXISTS `user_cover_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_cover_pictures` (
  `user_id` bigint NOT NULL,
  `cover_pictures_id` bigint NOT NULL,
  UNIQUE KEY `UK_fyvcdmue1816uufaa89ppr8ih` (`cover_pictures_id`),
  KEY `FKo86qn9qp2p6a7i06i3dnyncgo` (`user_id`),
  CONSTRAINT `FK9q0vngrrv572dsmw44g46jpkc` FOREIGN KEY (`cover_pictures_id`) REFERENCES `storage` (`id`),
  CONSTRAINT `FKo86qn9qp2p6a7i06i3dnyncgo` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cover_pictures`
--

LOCK TABLES `user_cover_pictures` WRITE;
/*!40000 ALTER TABLE `user_cover_pictures` DISABLE KEYS */;
INSERT INTO `user_cover_pictures` VALUES (1137,181),(1137,1132);
/*!40000 ALTER TABLE `user_cover_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cover_pictures_aud`
--

DROP TABLE IF EXISTS `user_cover_pictures_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_cover_pictures_aud` (
  `rev` int NOT NULL,
  `user_id` bigint NOT NULL,
  `cover_pictures_id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`user_id`,`cover_pictures_id`),
  CONSTRAINT `FKkoa1o5jocqwjfkclun475v1km` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cover_pictures_aud`
--

LOCK TABLES `user_cover_pictures_aud` WRITE;
/*!40000 ALTER TABLE `user_cover_pictures_aud` DISABLE KEYS */;
INSERT INTO `user_cover_pictures_aud` VALUES (1154,1137,181,0),(1154,1137,1132,0);
/*!40000 ALTER TABLE `user_cover_pictures_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_pictures`
--

DROP TABLE IF EXISTS `user_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_pictures` (
  `user_id` bigint NOT NULL,
  `pictures_id` bigint NOT NULL,
  UNIQUE KEY `UK_r5dyqtog1k1pn41t0eocj725p` (`pictures_id`),
  KEY `FKjf2kxn67n2lfogmm7wnv88mp` (`user_id`),
  CONSTRAINT `FK17gf2pkckfd2a9il3c0e1kbc9` FOREIGN KEY (`pictures_id`) REFERENCES `storage` (`id`),
  CONSTRAINT `FKjf2kxn67n2lfogmm7wnv88mp` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_pictures`
--

LOCK TABLES `user_pictures` WRITE;
/*!40000 ALTER TABLE `user_pictures` DISABLE KEYS */;
INSERT INTO `user_pictures` VALUES (1156,1479),(1156,1482),(1156,1485),(1156,1488),(1156,1491),(1161,1430);
/*!40000 ALTER TABLE `user_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_pictures_aud`
--

DROP TABLE IF EXISTS `user_pictures_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_pictures_aud` (
  `rev` int NOT NULL,
  `user_id` bigint NOT NULL,
  `pictures_id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`user_id`,`pictures_id`),
  CONSTRAINT `FKsjj4kn89h5emcssobhvllmyj3` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_pictures_aud`
--

LOCK TABLES `user_pictures_aud` WRITE;
/*!40000 ALTER TABLE `user_pictures_aud` DISABLE KEYS */;
INSERT INTO `user_pictures_aud` VALUES (1429,1161,1427,0),(1432,1161,1430,0),(1449,1161,1427,2),(1481,1156,1479,0),(1484,1156,1482,0),(1487,1156,1485,0),(1490,1156,1488,0),(1493,1156,1491,0);
/*!40000 ALTER TABLE `user_pictures_aud` ENABLE KEYS */;
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

--
-- Table structure for table `user_privileges_aud`
--

DROP TABLE IF EXISTS `user_privileges_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_privileges_aud` (
  `rev` int NOT NULL,
  `user_id` bigint NOT NULL,
  `user_privileges` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`user_id`,`user_privileges`),
  CONSTRAINT `FKilnkqpgk4b3o4pwnkp1iwitlg` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_privileges_aud`
--

LOCK TABLES `user_privileges_aud` WRITE;
/*!40000 ALTER TABLE `user_privileges_aud` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_privileges_aud` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-04 20:13:31
