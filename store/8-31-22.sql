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
INSERT INTO `company` VALUES (1149,'2022-08-23 00:44:30.818000',NULL,_binary '','aassfff@gmail.com',_binary '',_binary '\0',NULL,'Service',_binary '\0','Swap Restaurant666777','',_binary '',_binary '\0',NULL,NULL,_binary '','REGISTERED','2022-08-23 00:50:28.295000',NULL,_binary '',12,180,34.0929786,-118.3386318,NULL,NULL),(1201,'2022-08-25 22:39:04.470000',NULL,_binary '','aassfff@gmail.com',_binary '',_binary '\0',NULL,'Thai Restaurant',_binary '\0','THai Restaurant','',_binary '',_binary '\0',NULL,NULL,_binary '','REGISTERED','2022-08-25 22:40:47.455000',NULL,_binary '',1199,180,34.0904399,-118.2987956,NULL,NULL),(1207,'2022-08-25 22:40:07.825000',NULL,_binary '','aassfff@gmail.com',_binary '',_binary '\0',NULL,'Thai Massage',_binary '\0','Massage Thai','',_binary '',_binary '\0',NULL,NULL,_binary '','REGISTERED','2022-08-25 22:40:13.837000',NULL,_binary '',1205,174,34.0508252,-118.3192132,NULL,NULL),(1214,'2022-08-25 22:41:42.780000',NULL,_binary '','aassfff@gmail.com',_binary '',_binary '\0',NULL,'Drinks & Deserts',_binary '\0','Boba Tea','',_binary '',_binary '\0',NULL,NULL,_binary '','REGISTERED','2022-08-25 22:41:48.239000',NULL,_binary '',1212,180,34.1395597,-118.3870991,NULL,NULL),(1220,'2022-08-25 22:42:20.405000',NULL,_binary '','aassfff@gmail.com',_binary '',_binary '\0',NULL,'Drinks & Deserts',_binary '\0','Tom Yum Beer','',_binary '',_binary '\0',NULL,NULL,_binary '','REGISTERED','2022-08-25 22:42:32.096000',NULL,_binary '',1218,180,33.9625905,-118.3987842,NULL,NULL),(1226,'2022-08-25 22:43:05.846000',NULL,_binary '','aassfff@gmail.com',_binary '',_binary '\0',NULL,'Printing',_binary '\0','Inprint','',_binary '',_binary '\0',NULL,NULL,_binary '','PENDING','2022-08-25 22:43:05.846000',NULL,_binary '',1224,165,34.1477849,-118.1445155,NULL,NULL),(1228,'2022-08-25 22:43:54.136000',NULL,_binary '','aassfff@gmail.com',_binary '',_binary '\0',NULL,'Printing',_binary '\0','Inprint','',_binary '',_binary '\0',NULL,NULL,_binary '','REGISTERED','2022-08-25 22:44:29.541000',NULL,_binary '',1224,165,34.1477849,-118.1445155,NULL,NULL),(1235,'2022-08-25 22:45:18.371000',NULL,_binary '','aassfff@gmail.com',_binary '',_binary '\0',NULL,'Education',_binary '\0','USC University','',_binary '',_binary '\0',NULL,NULL,_binary '','REGISTERED','2022-08-25 22:45:24.611000',NULL,_binary '',1233,143,34.095287,-118.1270146,NULL,NULL),(1241,'2022-08-25 22:45:58.566000',NULL,_binary '','aassfff@gmail.com',_binary '',_binary '\0',NULL,'Japanese Restaurant',_binary '\0','Sushi Near Me','',_binary '',_binary '\0',NULL,NULL,_binary '','REGISTERED','2022-08-25 22:46:04.161000',NULL,_binary '',1239,154,34.1617745,-118.4685012,NULL,NULL),(1247,'2022-08-25 22:46:35.698000',NULL,_binary '','aassfff@gmail.com',_binary '',_binary '\0',NULL,'Information Technology',_binary '\0','Google','',_binary '',_binary '\0',NULL,NULL,_binary '','REGISTERED','2022-08-25 22:46:41.588000',NULL,_binary '',1245,153,34.0905792,-118.3644276,NULL,NULL);
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
INSERT INTO `company_aud` VALUES (1149,1150,0,'2022-08-23 00:44:30.818000',_binary '',NULL,_binary '\0',_binary '',_binary '','aassfff@gmail.com',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Service',_binary '',_binary '\0',_binary '','Swap Restaurant',_binary '','',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-08-23 00:44:30.818000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',12,_binary '',180,_binary '',NULL,NULL,NULL,NULL,NULL,NULL),(1149,1153,1,'2022-08-23 00:44:30.818000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Service',_binary '\0',_binary '\0',_binary '\0','Swap Restaurant666777',_binary '','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-08-23 00:50:28.295000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',12,_binary '\0',180,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(1201,1202,0,'2022-08-25 22:39:04.470000',_binary '',NULL,_binary '\0',_binary '',_binary '','aassfff@gmail.com',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Service',_binary '',_binary '\0',_binary '','THai Restaurant',_binary '','',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-08-25 22:39:04.470000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1199,_binary '',180,_binary '',NULL,NULL,NULL,NULL,NULL,NULL),(1201,1204,1,'2022-08-25 22:39:04.470000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Service',_binary '\0',_binary '\0',_binary '\0','THai Restaurant',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-08-25 22:39:21.253000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1199,_binary '\0',180,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(1201,1211,1,'2022-08-25 22:39:04.470000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Thai Restaurant',_binary '',_binary '\0',_binary '\0','THai Restaurant',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '\0','2022-08-25 22:40:47.455000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1199,_binary '\0',180,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(1207,1208,0,'2022-08-25 22:40:07.825000',_binary '',NULL,_binary '\0',_binary '',_binary '','aassfff@gmail.com',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Thai Massage',_binary '',_binary '\0',_binary '','Massage Thai',_binary '','',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-08-25 22:40:07.825000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1205,_binary '',174,_binary '',NULL,NULL,NULL,NULL,NULL,NULL),(1207,1210,1,'2022-08-25 22:40:07.825000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Thai Massage',_binary '\0',_binary '\0',_binary '\0','Massage Thai',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-08-25 22:40:13.837000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1205,_binary '\0',174,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(1214,1215,0,'2022-08-25 22:41:42.780000',_binary '',NULL,_binary '\0',_binary '',_binary '','aassfff@gmail.com',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Drinks & Deserts',_binary '',_binary '\0',_binary '','Boba Tea',_binary '','',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-08-25 22:41:42.780000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1212,_binary '',180,_binary '',NULL,NULL,NULL,NULL,NULL,NULL),(1214,1217,1,'2022-08-25 22:41:42.780000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Drinks & Deserts',_binary '\0',_binary '\0',_binary '\0','Boba Tea',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-08-25 22:41:48.239000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1212,_binary '\0',180,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(1220,1221,0,'2022-08-25 22:42:20.405000',_binary '',NULL,_binary '\0',_binary '',_binary '','aassfff@gmail.com',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Drinks & Deserts',_binary '',_binary '\0',_binary '','Tom Yum Beer',_binary '','',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-08-25 22:42:20.405000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1218,_binary '',180,_binary '',NULL,NULL,NULL,NULL,NULL,NULL),(1220,1223,1,'2022-08-25 22:42:20.405000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Drinks & Deserts',_binary '\0',_binary '\0',_binary '\0','Tom Yum Beer',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-08-25 22:42:32.096000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1218,_binary '\0',180,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(1226,1227,0,'2022-08-25 22:43:05.846000',_binary '',NULL,_binary '\0',_binary '',_binary '','aassfff@gmail.com',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Printing',_binary '',_binary '\0',_binary '','Inprint',_binary '','',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-08-25 22:43:05.846000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1224,_binary '',165,_binary '',NULL,NULL,NULL,NULL,NULL,NULL),(1228,1229,0,'2022-08-25 22:43:54.136000',_binary '',NULL,_binary '\0',_binary '',_binary '','aassfff@gmail.com',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Printing',_binary '',_binary '\0',_binary '','Inprint',_binary '','',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-08-25 22:43:54.136000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1224,_binary '',165,_binary '',NULL,NULL,NULL,NULL,NULL,NULL),(1228,1232,1,'2022-08-25 22:43:54.136000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Printing',_binary '\0',_binary '\0',_binary '\0','Inprint',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-08-25 22:44:29.541000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1224,_binary '\0',165,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(1235,1236,0,'2022-08-25 22:45:18.371000',_binary '',NULL,_binary '\0',_binary '',_binary '','aassfff@gmail.com',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Education',_binary '',_binary '\0',_binary '','USC University',_binary '','',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-08-25 22:45:18.371000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1233,_binary '',143,_binary '',NULL,NULL,NULL,NULL,NULL,NULL),(1235,1238,1,'2022-08-25 22:45:18.371000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Education',_binary '\0',_binary '\0',_binary '\0','USC University',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-08-25 22:45:24.611000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1233,_binary '\0',143,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(1241,1242,0,'2022-08-25 22:45:58.566000',_binary '',NULL,_binary '\0',_binary '',_binary '','aassfff@gmail.com',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Japanese Restaurant',_binary '',_binary '\0',_binary '','Sushi Near Me',_binary '','',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-08-25 22:45:58.566000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1239,_binary '',154,_binary '',NULL,NULL,NULL,NULL,NULL,NULL),(1241,1244,1,'2022-08-25 22:45:58.566000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Japanese Restaurant',_binary '\0',_binary '\0',_binary '\0','Sushi Near Me',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-08-25 22:46:04.161000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1239,_binary '\0',154,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(1247,1248,0,'2022-08-25 22:46:35.698000',_binary '',NULL,_binary '\0',_binary '',_binary '','aassfff@gmail.com',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0','Information Technology',_binary '',_binary '\0',_binary '','Google',_binary '','',_binary '',_binary '',_binary '',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '','PENDING',_binary '','2022-08-25 22:46:35.698000',_binary '',NULL,_binary '\0',_binary '',_binary '',_binary '',1245,_binary '',153,_binary '',NULL,NULL,NULL,NULL,NULL,NULL),(1247,1250,1,'2022-08-25 22:46:35.698000',_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','aassfff@gmail.com',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','Information Technology',_binary '\0',_binary '\0',_binary '\0','Google',_binary '\0','',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '\0','REGISTERED',_binary '','2022-08-25 22:46:41.588000',_binary '',NULL,_binary '\0',_binary '',_binary '\0',_binary '\0',1245,_binary '\0',153,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `deal` VALUES (1147,'Restaurant','2022-08-22 22:34:59.591000',NULL,NULL,'DELETED','test Deal','2022-08-25 06:23:20.443000',12),(1174,'Massage / Spa','2022-08-25 06:43:24.649000',NULL,NULL,'DELETED','test Deal ssáđa','2022-08-25 21:13:42.490000',12),(1179,'Beauty','2022-08-25 07:53:45.369000',NULL,NULL,'PRIVATE','New deal','2022-08-25 21:28:00.040000',12),(1184,'Beauty','2022-08-25 07:56:50.244000',NULL,NULL,'AVAILABLE','test Deal ssáđa','2022-08-31 03:10:13.524000',12),(1189,'Travel','2022-08-25 08:20:09.244000',NULL,NULL,'AVAILABLE','New deal ssss','2022-08-25 08:20:09.244000',12);
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
INSERT INTO `deal_aud` VALUES (1147,1172,1,NULL,_binary '\0','2022-08-22 22:34:59.591000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','DELETED',_binary '','test Deal',_binary '\0','2022-08-25 06:23:20.443000',_binary '',_binary '\0',12,_binary '\0',_binary '\0'),(1174,1175,0,NULL,_binary '\0','2022-08-25 06:43:24.649000',_binary '',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '','New deal',_binary '','2022-08-25 06:43:24.649000',_binary '',_binary '',12,_binary '',_binary ''),(1174,1177,1,NULL,_binary '\0','2022-08-25 06:43:24.649000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '\0','test Deal',_binary '','2022-08-25 06:58:27.928000',_binary '',_binary '\0',12,_binary '\0',_binary '\0'),(1174,1178,1,NULL,_binary '\0','2022-08-25 06:43:24.649000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','DISABLED',_binary '','test Deal',_binary '\0','2022-08-25 07:07:48.612000',_binary '',_binary '\0',12,_binary '\0',_binary '\0'),(1174,1192,1,NULL,_binary '\0','2022-08-25 06:43:24.649000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','PRIVATE',_binary '\0','test Deal ssáđa',_binary '','2022-08-25 20:56:32.112000',_binary '',_binary '\0',12,_binary '\0',_binary '\0'),(1174,1193,1,NULL,_binary '\0','2022-08-25 06:43:24.649000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','DISABLED',_binary '','test Deal ssáđa',_binary '\0','2022-08-25 21:02:35.623000',_binary '',_binary '\0',12,_binary '\0',_binary '\0'),(1174,1194,1,NULL,_binary '\0','2022-08-25 06:43:24.649000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','PRIVATE',_binary '','test Deal ssáđa',_binary '\0','2022-08-25 21:09:29.309000',_binary '',_binary '\0',12,_binary '\0',_binary '\0'),(1174,1195,1,NULL,_binary '\0','2022-08-25 06:43:24.649000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','DISABLED',_binary '','test Deal ssáđa',_binary '\0','2022-08-25 21:09:37.346000',_binary '',_binary '\0',12,_binary '\0',_binary '\0'),(1174,1196,1,NULL,_binary '\0','2022-08-25 06:43:24.649000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','PRIVATE',_binary '','test Deal ssáđa',_binary '\0','2022-08-25 21:09:51.543000',_binary '',_binary '\0',12,_binary '\0',_binary '\0'),(1174,1197,1,NULL,_binary '\0','2022-08-25 06:43:24.649000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','DELETED',_binary '','test Deal ssáđa',_binary '\0','2022-08-25 21:13:42.490000',_binary '',_binary '\0',12,_binary '\0',_binary '\0'),(1179,1180,0,NULL,_binary '\0','2022-08-25 07:53:45.369000',_binary '',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '','New deal',_binary '','2022-08-25 07:53:45.369000',_binary '',_binary '',12,_binary '',_binary ''),(1179,1198,1,NULL,_binary '\0','2022-08-25 07:53:45.369000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','DISABLED',_binary '','New deal',_binary '\0','2022-08-25 21:28:00.040000',_binary '',_binary '\0',12,_binary '\0',_binary '\0'),(1184,1185,0,NULL,_binary '\0','2022-08-25 07:56:50.244000',_binary '',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '','New deal ssss',_binary '','2022-08-25 07:56:50.244000',_binary '',_binary '',12,_binary '',_binary ''),(1184,1252,1,'Beauty',_binary '\0','2022-08-25 07:56:50.244000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '\0','test Deal ssáđa',_binary '','2022-08-31 03:10:13.312000',_binary '',_binary '\0',12,_binary '\0',_binary '\0'),(1184,1253,1,'Beauty',_binary '\0','2022-08-25 07:56:50.244000',_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '\0','test Deal ssáđa',_binary '\0','2022-08-31 03:10:13.524000',_binary '',_binary '\0',12,_binary '\0',_binary ''),(1189,1190,0,NULL,_binary '\0','2022-08-25 08:20:09.244000',_binary '',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '','New deal ssss',_binary '','2022-08-25 08:20:09.244000',_binary '',_binary '',12,_binary '',_binary '');
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
INSERT INTO `deal_contact_info` VALUES (1174,'kvngo@tedkvn.com','email'),(1179,'kvngo@tedkvn.com','email'),(1184,'kvngo@tedkvn.com','phone'),(1189,'kvngo@tedkvn.com','phone');
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
INSERT INTO `deal_contact_info_aud` VALUES (1175,1174,'kvngo@tedkvn.com','email',0),(1180,1179,'kvngo@tedkvn.com','email',0),(1185,1184,'kvngo@tedkvn.com','phone',0),(1190,1189,'kvngo@tedkvn.com','phone',0);
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
INSERT INTO `deal_pictures` VALUES (1174,1141),(1179,181),(1184,1251),(1189,1187);
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
INSERT INTO `deal_pictures_aud` VALUES (1175,1174,1141,0),(1180,1179,181,0),(1185,1184,1182,0),(1190,1189,1187,0),(1253,1184,1251,0);
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
INSERT INTO `hibernate_sequence` VALUES (1270);
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
  `housing_category` varchar(255) DEFAULT NULL,
  `housing_created_on` datetime(6) DEFAULT NULL,
  `housing_description` longtext,
  `housing_expired_on` datetime(6) DEFAULT NULL,
  `housing_status` varchar(255) DEFAULT NULL,
  `housing_title` varchar(255) DEFAULT NULL,
  `housing_type` varchar(255) DEFAULT NULL,
  `housing_updated_on` datetime(6) DEFAULT NULL,
  `housing_location_id` bigint DEFAULT NULL,
  `housing_annual_cost` double DEFAULT NULL,
  `housing_daily_cost` double DEFAULT NULL,
  `housing_deposit_cost` double DEFAULT NULL,
  `housing_monthly_cost` double DEFAULT NULL,
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
  `housing_category` varchar(255) DEFAULT NULL,
  `category_mod` bit(1) DEFAULT NULL,
  `housing_cost` varchar(255) DEFAULT NULL,
  `cost_mod` bit(1) DEFAULT NULL,
  `housing_created_on` datetime(6) DEFAULT NULL,
  `created_on_mod` bit(1) DEFAULT NULL,
  `housing_description` longtext,
  `description_mod` bit(1) DEFAULT NULL,
  `housing_expired_on` datetime(6) DEFAULT NULL,
  `expired_on_mod` bit(1) DEFAULT NULL,
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
  `housing_annual_cost` bigint DEFAULT NULL,
  `annual_cost_mod` bit(1) DEFAULT NULL,
  `housing_daily_cost` bigint DEFAULT NULL,
  `daily_cost_mod` bit(1) DEFAULT NULL,
  `housing_deposit_cost` bigint DEFAULT NULL,
  `deposit_cost_mod` bit(1) DEFAULT NULL,
  `housing_monthly_cost` bigint DEFAULT NULL,
  `monthly_cost_mod` bit(1) DEFAULT NULL,
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
  `job_salary` varchar(255) DEFAULT NULL,
  `job_skills` varchar(255) DEFAULT NULL,
  `job_status` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `job_updated_on` datetime(6) DEFAULT NULL,
  `job_location_id` bigint DEFAULT NULL,
  `is_job_remote` bit(1) DEFAULT NULL,
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
INSERT INTO `job` VALUES (1169,'2022-08-25 06:12:42.056000',NULL,'3-5 years',NULL,NULL,NULL,'AVAILABLE','New Job','2022-08-25 06:12:42.057000',12,_binary '\0'),(1255,'2022-08-31 18:00:36.905000',NULL,'No experience',NULL,NULL,NULL,'AVAILABLE','New Job','2022-08-31 18:00:36.950000',12,_binary '\0'),(1258,'2022-08-31 18:03:35.554000',NULL,'1-2 years',NULL,NULL,NULL,'AVAILABLE','Chef Full-time','2022-08-31 18:03:35.571000',1199,_binary ''),(1261,'2022-08-31 18:04:17.442000',NULL,'+5 years',NULL,NULL,NULL,'AVAILABLE','Designer Full-time','2022-08-31 18:04:17.454000',1212,_binary '\0'),(1264,'2022-08-31 18:05:48.796000',NULL,'3-5 years',NULL,NULL,NULL,'AVAILABLE','Designer Part-time','2022-08-31 18:05:48.807000',1233,_binary '\0'),(1267,'2022-08-31 18:09:25.153000',NULL,'No experience',NULL,NULL,NULL,'AVAILABLE','Volunteer work','2022-08-31 18:09:25.196000',1245,_binary '');
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
  `is_job_remote` bit(1) DEFAULT NULL,
  `remote_mod` bit(1) DEFAULT NULL,
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
INSERT INTO `job_aud` VALUES (1169,1170,0,'2022-08-25 06:12:42.056000',_binary '',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '','New Job',_binary '','2022-08-25 06:12:42.057000',_binary '',_binary '',12,_binary '',_binary '',_binary '\0',NULL,NULL),(1255,1256,0,'2022-08-31 18:00:36.617000',_binary '',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '','New Job',_binary '','2022-08-31 18:00:36.908000',_binary '',_binary '',12,_binary '',_binary '',_binary '',_binary '\0',_binary ''),(1258,1259,0,'2022-08-31 18:03:35.545000',_binary '',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '','Chef Full-time',_binary '','2022-08-31 18:03:35.556000',_binary '',_binary '',1199,_binary '',_binary '',_binary '',_binary '\0',_binary ''),(1261,1262,0,'2022-08-31 18:04:17.425000',_binary '',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '','Designer Full-time',_binary '','2022-08-31 18:04:17.444000',_binary '',_binary '',1212,_binary '',_binary '',_binary '',_binary '\0',_binary ''),(1264,1265,0,'2022-08-31 18:05:48.779000',_binary '',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '','Designer Part-time',_binary '','2022-08-31 18:05:48.797000',_binary '',_binary '',1233,_binary '',_binary '',_binary '',_binary '\0',_binary ''),(1267,1268,0,'2022-08-31 18:09:25.108000',_binary '',NULL,_binary '\0','No experience',_binary '',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0','AVAILABLE',_binary '','Volunteer work',_binary '','2022-08-31 18:09:25.166000',_binary '',_binary '',1245,_binary '',_binary '',_binary '',_binary '\0',_binary '');
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
INSERT INTO `job_contact_info` VALUES (1169,'kvngo@tedkvn.com','email'),(1255,'kvngo@tedkvn.com','email'),(1258,'kvngo@tedkvn.com','email'),(1261,'kvngo@tedkvn.com','email'),(1264,'kvngo@tedkvn.com','email'),(1267,'kvngo@tedkvn.com','email');
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
INSERT INTO `job_contact_info_aud` VALUES (1170,1169,'kvngo@tedkvn.com','email',0),(1256,1255,'kvngo@tedkvn.com','email',0),(1259,1258,'kvngo@tedkvn.com','email',0),(1262,1261,'kvngo@tedkvn.com','email',0),(1265,1264,'kvngo@tedkvn.com','email',0),(1268,1267,'kvngo@tedkvn.com','email',0);
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
INSERT INTO `job_pictures` VALUES (1169,1141),(1255,181),(1258,125),(1261,131),(1264,121),(1267,115);
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
INSERT INTO `job_pictures_aud` VALUES (1170,1169,1141,0),(1256,1255,181,0),(1259,1258,125,0),(1262,1261,131,0),(1265,1264,121,0),(1268,1267,115,0);
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
INSERT INTO `job_positions` VALUES (1255,'Full-time'),(1255,'Part-time'),(1258,'Full-time'),(1258,'Seasonal'),(1261,'Volunteer'),(1261,'Seasonal'),(1264,'Volunteer'),(1264,'Seasonal'),(1267,'Volunteer'),(1267,'full-time');
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
INSERT INTO `job_positions_aud` VALUES (1256,1255,'Full-time',0),(1256,1255,'Part-time',0),(1259,1258,'Full-time',0),(1259,1258,'Seasonal',0),(1262,1261,'Seasonal',0),(1262,1261,'Volunteer',0),(1265,1264,'Seasonal',0),(1265,1264,'Volunteer',0),(1268,1267,'full-time',0),(1268,1267,'Volunteer',0);
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
INSERT INTO `location` VALUES (4,'5112 Hollywood Boulevard','# 203','US','Los Angeles County','2022-05-15 01:10:06.191000','5112 Hollywood Blvd # 203, Los Angeles, CA 90027, USA','5112 Hollywood Boulevard # 203, East Hollywood, Los Angeles County, CA 90027, US','34.1013404','-118.3014496','Los Angeles','East Hollywood','ChIJ-2r4RFa_woARp32JhyYeuxg','CA','ROOFTOP','2022-05-15 01:10:06.191000','90027'),(12,'North Highland Avenue','','US','Los Angeles County','2022-05-17 22:49:23.155000','N Highland Ave, Los Angeles, CA, USA','North Highland Avenue Central LA, Los Angeles County, CA , US','34.0929786','-118.3386318','Los Angeles','Central LA','ChIJ99s_VS6_woARN5vTx3PCrHk','CA','GEOMETRIC_CENTER','2022-05-17 22:49:23.155000',''),(22,'2801 Sunset Place','','US','Los Angeles County','2022-05-18 00:47:28.481000','2801 Sunset Pl, Los Angeles, CA 90005, USA','2801 Sunset Place Mid City, Los Angeles County, CA 90005, US','34.0608914','-118.2849629','Los Angeles','Mid City','ChIJX_myydXHwoARaXWJF7ZUNWY','CA','ROOFTOP','2022-05-18 00:47:28.481000','90005'),(24,'123 South Figueroa Street','','US','Los Angeles County','2022-05-21 23:00:19.335000','123 S Figueroa St, Los Angeles, CA 90012, USA','123 South Figueroa Street Downtown Los Angeles, Los Angeles County, CA 90012, US','34.0572772','-118.2526665','Los Angeles','Downtown Los Angeles','ChIJXxAfzVLGwoARJebi04BrBJY','CA','ROOFTOP','2022-05-21 23:00:19.335000','90012'),(56,'1331 North Cahuenga Boulevard','','US','Los Angeles County','2022-06-06 18:34:19.482000','1331 N Cahuenga Blvd, Los Angeles, CA 90028, USA','1331 North Cahuenga Boulevard Central LA, Los Angeles County, CA 90028, US','34.095235','-118.3289749','Los Angeles','Central LA','ChIJQZt6KjG_woARaXUWV2fhi2Q','CA','ROOFTOP','2022-06-06 18:34:19.482000','90028'),(111,'123 South Lincoln Avenue','','US','Los Angeles County','2022-07-16 00:58:49.236000','123 S Lincoln Ave, Monterey Park, CA 91755, USA','123 South Lincoln Avenue Monterey Park, Los Angeles County, CA 91755, US','34.0618461','-118.1216859','Monterey Park','','ChIJWaKEL1fFwoARxDuHWvIJWZ4','CA','ROOFTOP','2022-07-16 00:58:49.236000','91755'),(1020,'2226 East 7th Street','','US','Los Angeles County','2022-07-22 00:27:32.003000','2226 E 7th St, Long Beach, CA 90804, USA','2226 East 7th Street Rose Park South, Los Angeles County, CA 90804, US','33.774946','-118.1651005','Long Beach','Rose Park South','ChIJP72yBwwx3YARhyhCO4fy--U','CA','ROOFTOP','2022-07-22 00:27:32.003000','90804'),(1199,'5020 Santa Monica Boulevard','','US','Los Angeles County','2022-08-25 22:39:04.419000','5020 Santa Monica Blvd, Los Angeles, CA 90029, USA','5020 Santa Monica Boulevard East Hollywood, Los Angeles County, CA 90029, US','34.0904399','-118.2987956','Los Angeles','East Hollywood','ChIJPZo2-1XHwoAR3xOlnvejGXg','CA','ROOFTOP','2022-08-25 22:39:04.419000','90029'),(1205,'3612 Country Club Drive','','US','Los Angeles County','2022-08-25 22:40:07.803000','3612 Country Club Dr, Los Angeles, CA 90019, USA','3612 Country Club Drive Mid City, Los Angeles County, CA 90019, US','34.0508252','-118.3192132','Los Angeles','Mid City','ChIJabwtW4q4woARexhfOFZiSRw','CA','ROOFTOP','2022-08-25 22:40:07.803000','90019'),(1212,'','','US','Los Angeles County','2022-08-25 22:41:42.763000','Studio City, Los Angeles, CA, USA','Studio City, Los Angeles County, CA , US','34.1395597','-118.3870991','Los Angeles','Studio City','ChIJ9QK_aQm-woARDtBe_FLmNZA','CA','APPROXIMATE','2022-08-25 22:41:42.763000',''),(1218,'','','US','Los Angeles County','2022-08-25 22:42:20.394000','Westchester, Los Angeles, CA, USA','Westchester, Los Angeles County, CA , US','33.9625905','-118.3987842','Los Angeles','Westchester','ChIJkdSA9s6wwoARCzVuPfS7KSo','CA','APPROXIMATE','2022-08-25 22:42:20.394000',''),(1224,'','','US','Los Angeles County','2022-08-25 22:43:05.835000','Pasadena, CA, USA','Pasadena, Los Angeles County, CA , US','34.1477849','-118.1445155','Pasadena','','ChIJUQszONzCwoARSo_RGhZBKwU','CA','APPROXIMATE','2022-08-25 22:43:05.835000',''),(1233,'','','US','Los Angeles County','2022-08-25 22:45:18.355000','Alhambra, CA, USA','Alhambra, Los Angeles County, CA , US','34.095287','-118.1270146','Alhambra','','ChIJIbZmgz3FwoARZkZyerE4-Ns','CA','APPROXIMATE','2022-08-25 22:45:18.355000',''),(1239,'4989 Sepulveda Boulevard','','US','Los Angeles County','2022-08-25 22:45:58.556000','4989 Sepulveda Blvd, Sherman Oaks, CA 91403, USA','4989 Sepulveda Boulevard Sherman Oaks, Los Angeles County, CA 91403, US','34.1617745','-118.4685012','Los Angeles','Sherman Oaks','ChIJ4Up6zpaXwoARJKYGK6SYyBo','CA','ROOFTOP','2022-08-25 22:45:58.556000','91403'),(1245,'7984 Santa Monica Boulevard','','US','Los Angeles County','2022-08-25 22:46:35.677000','7984 Santa Monica Blvd, West Hollywood, CA 90046, USA','7984 Santa Monica Boulevard Central LA, Los Angeles County, CA 90046, US','34.0905792','-118.3644276','West Hollywood','Central LA','ChIJoxUocMa-woARt0E5apWPlus','CA','ROOFTOP','2022-08-25 22:46:35.677000','90046');
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
INSERT INTO `location_aud` VALUES (12,1154,1,'North Highland Avenue',_binary '\0','',_binary '\0','US',_binary '\0','Los Angeles County',_binary '\0','2022-05-17 22:49:23.155000',_binary '\0','N Highland Ave, Los Angeles, CA, USA',_binary '\0','North Highland Avenue Central LA, Los Angeles County, CA , US',_binary '\0',34.0929786,_binary '\0',-118.3386318,_binary '\0','Los Angeles',_binary '\0','Central LA',_binary '\0','ChIJ99s_VS6_woARN5vTx3PCrHk',_binary '\0','CA',_binary '\0','GEOMETRIC_CENTER',_binary '\0','2022-05-17 22:49:23.155000',_binary '\0','',_binary '\0',_binary ''),(1199,1200,0,'5020 Santa Monica Boulevard',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-08-25 22:39:04.419000',_binary '','5020 Santa Monica Blvd, Los Angeles, CA 90029, USA',_binary '','5020 Santa Monica Boulevard East Hollywood, Los Angeles County, CA 90029, US',_binary '',34.0904399,_binary '',-118.2987956,_binary '','Los Angeles',_binary '','East Hollywood',_binary '','ChIJPZo2-1XHwoAR3xOlnvejGXg',_binary '','CA',_binary '','ROOFTOP',_binary '','2022-08-25 22:39:04.419000',_binary '','90029',_binary '',_binary ''),(1205,1206,0,'3612 Country Club Drive',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-08-25 22:40:07.803000',_binary '','3612 Country Club Dr, Los Angeles, CA 90019, USA',_binary '','3612 Country Club Drive Mid City, Los Angeles County, CA 90019, US',_binary '',34.0508252,_binary '',-118.3192132,_binary '','Los Angeles',_binary '','Mid City',_binary '','ChIJabwtW4q4woARexhfOFZiSRw',_binary '','CA',_binary '','ROOFTOP',_binary '','2022-08-25 22:40:07.803000',_binary '','90019',_binary '',_binary ''),(1212,1213,0,'',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-08-25 22:41:42.763000',_binary '','Studio City, Los Angeles, CA, USA',_binary '','Studio City, Los Angeles County, CA , US',_binary '',34.1395597,_binary '',-118.3870991,_binary '','Los Angeles',_binary '','Studio City',_binary '','ChIJ9QK_aQm-woARDtBe_FLmNZA',_binary '','CA',_binary '','APPROXIMATE',_binary '','2022-08-25 22:41:42.763000',_binary '','',_binary '',_binary ''),(1218,1219,0,'',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-08-25 22:42:20.394000',_binary '','Westchester, Los Angeles, CA, USA',_binary '','Westchester, Los Angeles County, CA , US',_binary '',33.9625905,_binary '',-118.3987842,_binary '','Los Angeles',_binary '','Westchester',_binary '','ChIJkdSA9s6wwoARCzVuPfS7KSo',_binary '','CA',_binary '','APPROXIMATE',_binary '','2022-08-25 22:42:20.394000',_binary '','',_binary '',_binary ''),(1224,1225,0,'',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-08-25 22:43:05.835000',_binary '','Pasadena, CA, USA',_binary '','Pasadena, Los Angeles County, CA , US',_binary '',34.1477849,_binary '',-118.1445155,_binary '','Pasadena',_binary '','',_binary '','ChIJUQszONzCwoARSo_RGhZBKwU',_binary '','CA',_binary '','APPROXIMATE',_binary '','2022-08-25 22:43:05.835000',_binary '','',_binary '',_binary ''),(1233,1234,0,'',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-08-25 22:45:18.355000',_binary '','Alhambra, CA, USA',_binary '','Alhambra, Los Angeles County, CA , US',_binary '',34.095287,_binary '',-118.1270146,_binary '','Alhambra',_binary '','',_binary '','ChIJIbZmgz3FwoARZkZyerE4-Ns',_binary '','CA',_binary '','APPROXIMATE',_binary '','2022-08-25 22:45:18.355000',_binary '','',_binary '',_binary ''),(1239,1240,0,'4989 Sepulveda Boulevard',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-08-25 22:45:58.556000',_binary '','4989 Sepulveda Blvd, Sherman Oaks, CA 91403, USA',_binary '','4989 Sepulveda Boulevard Sherman Oaks, Los Angeles County, CA 91403, US',_binary '',34.1617745,_binary '',-118.4685012,_binary '','Los Angeles',_binary '','Sherman Oaks',_binary '','ChIJ4Up6zpaXwoARJKYGK6SYyBo',_binary '','CA',_binary '','ROOFTOP',_binary '','2022-08-25 22:45:58.556000',_binary '','91403',_binary '',_binary ''),(1245,1246,0,'7984 Santa Monica Boulevard',_binary '','',_binary '','US',_binary '','Los Angeles County',_binary '','2022-08-25 22:46:35.677000',_binary '','7984 Santa Monica Blvd, West Hollywood, CA 90046, USA',_binary '','7984 Santa Monica Boulevard Central LA, Los Angeles County, CA 90046, US',_binary '',34.0905792,_binary '',-118.3644276,_binary '','West Hollywood',_binary '','Central LA',_binary '','ChIJoxUocMa-woARt0E5apWPlus',_binary '','CA',_binary '','ROOFTOP',_binary '','2022-08-25 22:46:35.677000',_binary '','90046',_binary '',_binary '');
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
  `marketplace_cost` varchar(255) DEFAULT NULL,
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
  `marketplace_cost` varchar(255) DEFAULT NULL,
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
INSERT INTO `my_revision_entity` VALUES (1138,1661205837600,NULL,NULL,'anonymousUser'),(1142,1661206137147,'admin@gmail.com',3,'kevin ngo'),(1150,1661215470853,'admin@gmail.com',3,'kevin ngo'),(1151,1661215471307,'admin@gmail.com',3,'kevin ngo'),(1153,1661215828321,'admin@gmail.com',4,'kevin ngo'),(1154,1661216659134,'admin@gmail.com',4,'kevin ngo'),(1155,1661217022084,'admin@gmail.com',4,'kevin ngo'),(1157,1661217805207,NULL,NULL,'anonymousUser'),(1160,1661218476781,NULL,NULL,'anonymousUser'),(1162,1661218476822,NULL,NULL,'anonymousUser'),(1165,1661218841952,NULL,NULL,'anonymousUser'),(1167,1661218841993,NULL,NULL,'anonymousUser'),(1170,1661407962089,'admin@gmail.com',4,'Kevin ssgggg55555'),(1172,1661408600468,'admin@gmail.com',4,'Kevin ssgggg55555'),(1175,1661409804662,'admin@gmail.com',4,'Kevin ssgggg55555'),(1177,1661410707949,'admin@gmail.com',4,'Kevin ssgggg55555'),(1178,1661411268637,'admin@gmail.com',1,'Kevin ssgggg55555'),(1180,1661414025398,'admin@gmail.com',1,'Kevin ssgggg55555'),(1183,1661414210217,'admin@gmail.com',1,'Kevin ssgggg55555'),(1185,1661414210249,'admin@gmail.com',1,'Kevin ssgggg55555'),(1188,1661415609213,'admin@gmail.com',1,'Kevin ssgggg55555'),(1190,1661415609255,'admin@gmail.com',1,'Kevin ssgggg55555'),(1192,1661460992144,'admin@gmail.com',1,'Kevin ssgggg55555'),(1193,1661461355635,'admin@gmail.com',1,'Kevin ssgggg55555'),(1194,1661461769325,'admin@gmail.com',1,'Kevin ssgggg55555'),(1195,1661461777348,'admin@gmail.com',1,'Kevin ssgggg55555'),(1196,1661461791546,'admin@gmail.com',1,'Kevin ssgggg55555'),(1197,1661462022502,'admin@gmail.com',1,'Kevin ssgggg55555'),(1198,1661462880055,'admin@gmail.com',1,'Kevin ssgggg55555'),(1200,1661467144442,'admin@gmail.com',1,'Kevin ssgggg55555'),(1202,1661467144488,'admin@gmail.com',1,'Kevin ssgggg55555'),(1204,1661467161266,'admin@gmail.com',1,'Kevin ssgggg55555'),(1206,1661467207805,'admin@gmail.com',1,'Kevin ssgggg55555'),(1208,1661467207826,'admin@gmail.com',1,'Kevin ssgggg55555'),(1210,1661467213849,'admin@gmail.com',1,'Kevin ssgggg55555'),(1211,1661467247466,'admin@gmail.com',1,'Kevin ssgggg55555'),(1213,1661467302767,'admin@gmail.com',1,'Kevin ssgggg55555'),(1215,1661467302782,'admin@gmail.com',1,'Kevin ssgggg55555'),(1217,1661467308250,'admin@gmail.com',1,'Kevin ssgggg55555'),(1219,1661467340395,'admin@gmail.com',1,'Kevin ssgggg55555'),(1221,1661467340407,'admin@gmail.com',1,'Kevin ssgggg55555'),(1223,1661467352097,'admin@gmail.com',1,'Kevin ssgggg55555'),(1225,1661467385836,'admin@gmail.com',1,'Kevin ssgggg55555'),(1227,1661467385849,'admin@gmail.com',1,'Kevin ssgggg55555'),(1229,1661467434138,'phucaone@gmail.com',3,''),(1230,1661467434290,'phucaone@gmail.com',3,''),(1232,1661467469542,'phucaone@gmail.com',1,''),(1234,1661467518357,'phucaone@gmail.com',1,''),(1236,1661467518373,'phucaone@gmail.com',1,''),(1238,1661467524622,'phucaone@gmail.com',1,''),(1240,1661467558557,'phucaone@gmail.com',1,''),(1242,1661467558568,'phucaone@gmail.com',1,''),(1244,1661467564172,'phucaone@gmail.com',1,''),(1246,1661467595680,'phucaone@gmail.com',1,''),(1248,1661467595701,'phucaone@gmail.com',1,''),(1250,1661467601600,'phucaone@gmail.com',1,''),(1252,1661915413317,'admin@gmail.com',1,'Kevin ssgggg55555'),(1253,1661915413538,'admin@gmail.com',1,'Kevin ssgggg55555'),(1256,1661968836922,'admin@gmail.com',1,'Kevin ssgggg55555'),(1259,1661969015561,'admin@gmail.com',1,'Kevin ssgggg55555'),(1262,1661969057446,'admin@gmail.com',1,'Kevin ssgggg55555'),(1265,1661969148800,'admin@gmail.com',1,'Kevin ssgggg55555'),(1268,1661969365184,'admin@gmail.com',1,'Kevin ssgggg55555');
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
INSERT INTO `post` VALUES ('JOB_POST',1171,1139,NULL,NULL,1169,NULL),('DEAL_POST',1181,1139,1179,NULL,NULL,NULL),('DEAL_POST',1186,1139,1184,NULL,NULL,NULL),('DEAL_POST',1191,1139,1189,NULL,NULL,NULL),('JOB_POST',1257,1139,NULL,NULL,1255,NULL),('JOB_POST',1260,1139,NULL,NULL,1258,NULL),('JOB_POST',1263,1139,NULL,NULL,1261,NULL),('JOB_POST',1266,1139,NULL,NULL,1264,NULL),('JOB_POST',1269,1139,NULL,NULL,1267,NULL);
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
INSERT INTO `profile` VALUES ('USER_PROFILE',1139,1137,NULL),('COMPANY_PROFILE',1152,1137,1149),('USER_PROFILE',1158,1156,NULL),('USER_PROFILE',1163,1161,NULL),('USER_PROFILE',1168,1166,NULL),('COMPANY_PROFILE',1203,1137,1201),('COMPANY_PROFILE',1209,1137,1207),('COMPANY_PROFILE',1216,1137,1214),('COMPANY_PROFILE',1222,1137,1220),('COMPANY_PROFILE',1231,1156,1228),('COMPANY_PROFILE',1237,1156,1235),('COMPANY_PROFILE',1243,1156,1241),('COMPANY_PROFILE',1249,1156,1247);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
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
INSERT INTO `storage` VALUES (35,'2022-05-22 00:58:34.646000','f01a55de-c66e-4937-9050-6a2e34152c1d.png',47990,'image/png','2022-05-22 00:58:34.646000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff01a55de-c66e-4937-9050-6a2e34152c1d.png?alt=media'),(66,'2022-06-15 22:35:44.787000','79433c58-7b7e-4789-b497-7566989ed02b.png',91555,'image/png','2022-06-15 22:35:44.787000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F79433c58-7b7e-4789-b497-7566989ed02b.png?alt=media'),(115,'2022-07-16 23:48:58.580000','ab4e499e-52c3-4c5b-ad7b-71ed9083df1c.png',62895,'image/png','2022-07-16 23:48:58.580000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fab4e499e-52c3-4c5b-ad7b-71ed9083df1c.png?alt=media'),(118,'2022-07-17 00:39:31.090000','d60cc73a-2a54-4882-bf03-1efcb9498517.png',89748,'image/png','2022-07-17 00:39:31.090000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd60cc73a-2a54-4882-bf03-1efcb9498517.png?alt=media'),(119,'2022-07-17 00:39:31.098000','f9ef2c94-3801-4261-82ba-9456ebb14c4a.png',62895,'image/png','2022-07-17 00:39:31.098000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff9ef2c94-3801-4261-82ba-9456ebb14c4a.png?alt=media'),(120,'2022-07-17 00:39:31.105000','9d715108-74ed-4bf9-9760-647b45e1b13f.png',129359,'image/png','2022-07-17 00:39:31.105000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9d715108-74ed-4bf9-9760-647b45e1b13f.png?alt=media'),(121,'2022-07-17 00:39:31.109000','9a2978ab-1dcb-4124-9089-3b364060bc8c.png',143980,'image/png','2022-07-17 00:39:31.109000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9a2978ab-1dcb-4124-9089-3b364060bc8c.png?alt=media'),(122,'2022-07-17 00:39:31.114000','d34262c9-fc83-443d-a0db-b41ce91e80b9.png',74938,'image/png','2022-07-17 00:39:31.114000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd34262c9-fc83-443d-a0db-b41ce91e80b9.png?alt=media'),(123,'2022-07-17 00:39:31.119000','1a35a7e4-55de-4096-b607-2f90b6bbdf22.png',62291,'image/png','2022-07-17 00:39:31.119000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F1a35a7e4-55de-4096-b607-2f90b6bbdf22.png?alt=media'),(124,'2022-07-17 00:39:31.124000','60ddf136-79d3-4c85-9121-41ef66ab0340.png',76634,'image/png','2022-07-17 00:39:31.124000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F60ddf136-79d3-4c85-9121-41ef66ab0340.png?alt=media'),(125,'2022-07-17 00:39:31.128000','671093ab-f907-437b-8354-5dace210d0d2.png',109517,'image/png','2022-07-17 00:39:31.128000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F671093ab-f907-437b-8354-5dace210d0d2.png?alt=media'),(126,'2022-07-17 00:39:31.131000','45fc3176-4950-42b2-87d0-306308c29aa7.png',67126,'image/png','2022-07-17 00:39:31.131000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F45fc3176-4950-42b2-87d0-306308c29aa7.png?alt=media'),(127,'2022-07-17 00:39:31.137000','74ab22b5-89ef-4db4-9f64-bac56784b6f6.png',111233,'image/png','2022-07-17 00:39:31.137000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F74ab22b5-89ef-4db4-9f64-bac56784b6f6.png?alt=media'),(128,'2022-07-17 00:39:31.142000','c1159a90-d107-4902-b0ff-18debfd702f0.png',91133,'image/png','2022-07-17 00:39:31.142000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc1159a90-d107-4902-b0ff-18debfd702f0.png?alt=media'),(129,'2022-07-17 00:39:31.146000','e6de3d71-6ea3-4586-9c4d-f8a27ea50234.png',128911,'image/png','2022-07-17 00:39:31.146000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe6de3d71-6ea3-4586-9c4d-f8a27ea50234.png?alt=media'),(130,'2022-07-17 00:39:31.151000','e182b882-a546-48a2-99b1-9a49993e51da.png',81416,'image/png','2022-07-17 00:39:31.151000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe182b882-a546-48a2-99b1-9a49993e51da.png?alt=media'),(131,'2022-07-17 00:39:31.156000','d3120b1b-5cb2-4fb6-a128-5df68599b3b3.png',70971,'image/png','2022-07-17 00:39:31.156000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd3120b1b-5cb2-4fb6-a128-5df68599b3b3.png?alt=media'),(132,'2022-07-17 00:39:31.161000','254d64b0-2df7-420b-98ca-170332798ca6.png',56096,'image/png','2022-07-17 00:39:31.161000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F254d64b0-2df7-420b-98ca-170332798ca6.png?alt=media'),(133,'2022-07-17 00:39:31.165000','be3a4b30-0901-4139-9619-67b24d07a808.png',93380,'image/png','2022-07-17 00:39:31.165000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fbe3a4b30-0901-4139-9619-67b24d07a808.png?alt=media'),(134,'2022-07-17 00:39:31.170000','0ced9196-d49c-4961-87bc-b3611cbff538.png',109439,'image/png','2022-07-17 00:39:31.170000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F0ced9196-d49c-4961-87bc-b3611cbff538.png?alt=media'),(135,'2022-07-17 00:39:31.174000','de8fe37a-39a3-4766-9535-d57f8070464d.png',31809,'image/png','2022-07-17 00:39:31.174000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fde8fe37a-39a3-4766-9535-d57f8070464d.png?alt=media'),(136,'2022-07-17 00:39:31.179000','736b21b3-dc0a-4ece-b6e5-8094b5c65852.png',62291,'image/png','2022-07-17 00:39:31.179000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F736b21b3-dc0a-4ece-b6e5-8094b5c65852.png?alt=media'),(137,'2022-07-17 00:39:31.185000','9fc91fda-a5fd-42ac-821f-1e047d0c6a8b.png',36283,'image/png','2022-07-17 00:39:31.185000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9fc91fda-a5fd-42ac-821f-1e047d0c6a8b.png?alt=media'),(138,'2022-07-17 00:39:31.190000','74353b6d-bf38-4028-aae0-15afe1823e64.png',120439,'image/png','2022-07-17 00:39:31.190000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F74353b6d-bf38-4028-aae0-15afe1823e64.png?alt=media'),(139,'2022-07-17 00:39:31.194000','c8cbeef8-ee7b-46dc-b21f-eeb70b8294b1.png',36301,'image/png','2022-07-17 00:39:31.194000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc8cbeef8-ee7b-46dc-b21f-eeb70b8294b1.png?alt=media'),(140,'2022-07-17 00:39:31.199000','5488eaf3-84f5-45db-987a-71d3f11f929e.png',72654,'image/png','2022-07-17 00:39:31.199000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F5488eaf3-84f5-45db-987a-71d3f11f929e.png?alt=media'),(141,'2022-07-17 00:39:31.204000','d12c7177-a12a-4f6a-9e0b-aecee5d35d06.png',48843,'image/png','2022-07-17 00:39:31.204000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd12c7177-a12a-4f6a-9e0b-aecee5d35d06.png?alt=media'),(142,'2022-07-17 00:39:31.208000','413d21c2-2788-4d9c-b3d1-0a69b1ad4a57.png',48911,'image/png','2022-07-17 00:39:31.208000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F413d21c2-2788-4d9c-b3d1-0a69b1ad4a57.png?alt=media'),(143,'2022-07-17 00:39:31.212000','97270b94-bf51-4c10-8718-626dddfffe02.png',70515,'image/png','2022-07-17 00:39:31.212000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F97270b94-bf51-4c10-8718-626dddfffe02.png?alt=media'),(144,'2022-07-17 00:39:31.217000','9881bca6-00fc-4b62-97f1-ac2b01569116.png',76028,'image/png','2022-07-17 00:39:31.217000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9881bca6-00fc-4b62-97f1-ac2b01569116.png?alt=media'),(145,'2022-07-17 00:39:31.224000','098281b8-bdd2-4c49-8468-e13fd7329c0b.png',93380,'image/png','2022-07-17 00:39:31.224000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F098281b8-bdd2-4c49-8468-e13fd7329c0b.png?alt=media'),(146,'2022-07-17 00:39:31.227000','62fbe55f-ddbe-4897-8d4d-4b28b97b0f47.png',50419,'image/png','2022-07-17 00:39:31.227000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F62fbe55f-ddbe-4897-8d4d-4b28b97b0f47.png?alt=media'),(147,'2022-07-17 00:39:31.231000','8c0310e0-66ed-451a-b3d0-186c617d8a84.png',111089,'image/png','2022-07-17 00:39:31.231000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F8c0310e0-66ed-451a-b3d0-186c617d8a84.png?alt=media'),(148,'2022-07-17 00:39:31.237000','95797be0-e831-4d96-860b-1815108b0422.png',44314,'image/png','2022-07-17 00:39:31.237000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F95797be0-e831-4d96-860b-1815108b0422.png?alt=media'),(149,'2022-07-17 00:39:31.242000','d600ef3a-ba88-495b-8139-02c34399cd53.png',95381,'image/png','2022-07-17 00:39:31.242000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd600ef3a-ba88-495b-8139-02c34399cd53.png?alt=media'),(150,'2022-07-17 00:39:31.246000','b9a318cb-f032-4083-ab4e-eae2f275633c.png',64528,'image/png','2022-07-17 00:39:31.246000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fb9a318cb-f032-4083-ab4e-eae2f275633c.png?alt=media'),(151,'2022-07-17 00:39:31.252000','8913e262-82ee-49bb-ad40-aed1bfd828a4.png',84184,'image/png','2022-07-17 00:39:31.252000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F8913e262-82ee-49bb-ad40-aed1bfd828a4.png?alt=media'),(152,'2022-07-17 00:39:31.257000','b1cda82f-05e4-4a9a-b98d-f45ddd0d6f4c.png',45676,'image/png','2022-07-17 00:39:31.257000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fb1cda82f-05e4-4a9a-b98d-f45ddd0d6f4c.png?alt=media'),(153,'2022-07-17 00:39:31.262000','e4c0aab2-79ae-4301-bc8b-d3a6a643970b.png',90514,'image/png','2022-07-17 00:39:31.262000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe4c0aab2-79ae-4301-bc8b-d3a6a643970b.png?alt=media'),(154,'2022-07-17 00:39:31.266000','52652253-f065-46bd-aa1c-9e188cd6bc1d.png',46874,'image/png','2022-07-17 00:39:31.266000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F52652253-f065-46bd-aa1c-9e188cd6bc1d.png?alt=media'),(155,'2022-07-17 00:39:31.271000','e9266193-741b-4e2b-80a0-138c43a11a0c.png',68943,'image/png','2022-07-17 00:39:31.271000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe9266193-741b-4e2b-80a0-138c43a11a0c.png?alt=media'),(156,'2022-07-17 00:39:31.276000','77465aed-65e1-45ed-b663-1c1ba999f31b.png',53772,'image/png','2022-07-17 00:39:31.276000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F77465aed-65e1-45ed-b663-1c1ba999f31b.png?alt=media'),(157,'2022-07-17 00:39:31.280000','e452a54e-4e66-474b-8449-1f2fd8016322.png',65975,'image/png','2022-07-17 00:39:31.280000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe452a54e-4e66-474b-8449-1f2fd8016322.png?alt=media'),(158,'2022-07-17 00:39:31.285000','e7f28680-b923-43b3-af7f-352a191f05dc.png',145748,'image/png','2022-07-17 00:39:31.285000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe7f28680-b923-43b3-af7f-352a191f05dc.png?alt=media'),(159,'2022-07-17 00:39:31.290000','1337652c-df0e-4516-b0af-9c2ec8f5c1d9.png',55918,'image/png','2022-07-17 00:39:31.290000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F1337652c-df0e-4516-b0af-9c2ec8f5c1d9.png?alt=media'),(160,'2022-07-17 00:39:31.294000','4e061664-896e-4cad-a962-8067175035f2.png',27270,'image/png','2022-07-17 00:39:31.294000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F4e061664-896e-4cad-a962-8067175035f2.png?alt=media'),(161,'2022-07-17 00:39:31.299000','35949338-3102-4883-a1ab-c1d2930d20e7.png',45517,'image/png','2022-07-17 00:39:31.299000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F35949338-3102-4883-a1ab-c1d2930d20e7.png?alt=media'),(162,'2022-07-17 00:39:31.304000','5659ea66-13cd-449e-b133-d1213a49face.png',92540,'image/png','2022-07-17 00:39:31.304000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F5659ea66-13cd-449e-b133-d1213a49face.png?alt=media'),(163,'2022-07-17 00:39:31.307000','f7a16180-5a12-406b-a3df-b7af4f81aa58.png',113673,'image/png','2022-07-17 00:39:31.307000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff7a16180-5a12-406b-a3df-b7af4f81aa58.png?alt=media'),(164,'2022-07-17 00:39:31.311000','6e1187ac-283d-4564-87ee-2812d341e9fa.png',48076,'image/png','2022-07-17 00:39:31.311000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F6e1187ac-283d-4564-87ee-2812d341e9fa.png?alt=media'),(165,'2022-07-17 00:39:31.315000','92627e4f-e784-4b93-bc4e-848b0af3d892.png',50496,'image/png','2022-07-17 00:39:31.315000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F92627e4f-e784-4b93-bc4e-848b0af3d892.png?alt=media'),(166,'2022-07-17 00:39:31.320000','64c0350f-49f5-4db9-9d29-765e44d16ab3.png',26981,'image/png','2022-07-17 00:39:31.320000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F64c0350f-49f5-4db9-9d29-765e44d16ab3.png?alt=media'),(167,'2022-07-17 00:39:31.324000','7a4ae955-bbeb-4e0e-963e-a58b39d9b2e8.png',80205,'image/png','2022-07-17 00:39:31.324000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F7a4ae955-bbeb-4e0e-963e-a58b39d9b2e8.png?alt=media'),(168,'2022-07-17 00:39:31.329000','3be6f411-8443-4f4c-8880-62b973fcb41a.png',37782,'image/png','2022-07-17 00:39:31.329000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F3be6f411-8443-4f4c-8880-62b973fcb41a.png?alt=media'),(169,'2022-07-17 00:39:31.334000','deeeaa80-77df-47be-933f-62e69ce32d2b.png',101294,'image/png','2022-07-17 00:39:31.334000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fdeeeaa80-77df-47be-933f-62e69ce32d2b.png?alt=media'),(170,'2022-07-17 00:39:31.338000','9e36c7a2-e264-4df1-a49d-96afb6e5cc87.png',117942,'image/png','2022-07-17 00:39:31.338000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9e36c7a2-e264-4df1-a49d-96afb6e5cc87.png?alt=media'),(171,'2022-07-17 00:39:31.342000','f9e04a73-d888-45cf-a478-f67351df187b.png',64004,'image/png','2022-07-17 00:39:31.342000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff9e04a73-d888-45cf-a478-f67351df187b.png?alt=media'),(172,'2022-07-17 00:39:31.346000','9f207f5c-06ff-4c9c-b8d2-e9520e328bda.png',35201,'image/png','2022-07-17 00:39:31.346000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9f207f5c-06ff-4c9c-b8d2-e9520e328bda.png?alt=media'),(173,'2022-07-17 00:39:31.351000','7acd0673-c4bb-4ffd-aa1b-a2933e3f816d.png',62291,'image/png','2022-07-17 00:39:31.351000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F7acd0673-c4bb-4ffd-aa1b-a2933e3f816d.png?alt=media'),(174,'2022-07-17 00:39:31.355000','43f48ed2-2638-4a26-b49c-ac546b7ca029.png',47791,'image/png','2022-07-17 00:39:31.355000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F43f48ed2-2638-4a26-b49c-ac546b7ca029.png?alt=media'),(175,'2022-07-17 00:39:31.359000','7615532b-15c8-42ce-af5d-18c1cddcacc7.png',48253,'image/png','2022-07-17 00:39:31.359000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F7615532b-15c8-42ce-af5d-18c1cddcacc7.png?alt=media'),(176,'2022-07-17 00:39:31.365000','a9233608-2958-4aff-aa78-0d327fa99667.png',63393,'image/png','2022-07-17 00:39:31.365000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa9233608-2958-4aff-aa78-0d327fa99667.png?alt=media'),(177,'2022-07-17 00:39:31.370000','5585fb4a-e2fd-4b22-a7c9-49e310b3c9a8.png',67551,'image/png','2022-07-17 00:39:31.370000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F5585fb4a-e2fd-4b22-a7c9-49e310b3c9a8.png?alt=media'),(178,'2022-07-17 00:39:31.374000','482ee9b2-5b1c-4b3c-99e7-198d6d96455f.png',111746,'image/png','2022-07-17 00:39:31.374000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F482ee9b2-5b1c-4b3c-99e7-198d6d96455f.png?alt=media'),(179,'2022-07-17 00:39:31.378000','2ae1b1ff-14cf-4cd8-a5a3-6a30fd2dc0a7.png',39817,'image/png','2022-07-17 00:39:31.378000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F2ae1b1ff-14cf-4cd8-a5a3-6a30fd2dc0a7.png?alt=media'),(180,'2022-07-17 00:45:05.396000','72dfd645-9c24-4990-b1f3-eb72c1188c7a.png',62291,'image/png','2022-07-17 00:45:05.396000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F72dfd645-9c24-4990-b1f3-eb72c1188c7a.png?alt=media'),(181,'2022-07-17 00:47:17.019000','0817531b-7c27-4a11-ae0a-c56b3d99abfd.png',90514,'image/png','2022-07-17 00:47:17.019000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F0817531b-7c27-4a11-ae0a-c56b3d99abfd.png?alt=media'),(183,'2022-07-18 23:32:15.253000','ac900dbe-ca3c-4d99-9130-60dbb6b2fd3a.png',152511,'image/png','2022-07-18 23:32:15.253000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fac900dbe-ca3c-4d99-9130-60dbb6b2fd3a.png?alt=media'),(184,'2022-07-18 23:39:00.447000','c1c587e9-8333-439c-84a9-2b0d881a8bff.jpg',200908,'image/jpeg','2022-07-18 23:39:00.447000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc1c587e9-8333-439c-84a9-2b0d881a8bff.jpg?alt=media'),(185,'2022-07-18 23:49:01.230000','606b7ed6-8f73-44f2-9d64-68ec33e4c75e.jpg',74614,'image/jpeg','2022-07-18 23:49:01.230000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F606b7ed6-8f73-44f2-9d64-68ec33e4c75e.jpg?alt=media'),(186,'2022-07-19 00:07:38.416000','cb16ba13-f169-4fc1-94ee-d46538e18d13.png',1662369,'image/png','2022-07-19 00:07:38.416000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fcb16ba13-f169-4fc1-94ee-d46538e18d13.png?alt=media'),(187,'2022-07-19 01:06:47.053000','d0af8bb0-444a-4849-8a82-aee96c6dea2b.png',152511,'image/png','2022-07-19 01:06:47.053000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd0af8bb0-444a-4849-8a82-aee96c6dea2b.png?alt=media'),(188,'2022-07-19 01:19:41.746000','a0e775d0-f286-4012-9f1d-d8bccbaa448b.exe',4,'application/x-msdownload','2022-07-19 01:19:41.746000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa0e775d0-f286-4012-9f1d-d8bccbaa448b.exe?alt=media'),(189,'2022-07-19 01:19:59.722000','2cce58a1-124f-450c-8cf6-acdd0e6b2fbd.png',152511,'image/png','2022-07-19 01:19:59.722000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F2cce58a1-124f-450c-8cf6-acdd0e6b2fbd.png?alt=media'),(1001,'2022-07-19 19:30:45.161000','91830578-78e8-4040-b662-f87011b3b007.jpg',86962,'image/jpeg','2022-07-19 19:30:45.161000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F91830578-78e8-4040-b662-f87011b3b007.jpg?alt=media'),(1003,'2022-07-19 19:42:42.942000','a349828e-8c9b-4f3a-a946-c802eea8ba30.png',236056,'image/png','2022-07-19 19:42:42.942000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa349828e-8c9b-4f3a-a946-c802eea8ba30.png?alt=media'),(1007,'2022-07-19 22:08:37.834000','a24ede07-1057-4437-8369-ae2d2c7ad991.png',147887,'image/png','2022-07-19 22:08:37.834000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa24ede07-1057-4437-8369-ae2d2c7ad991.png?alt=media'),(1010,'2022-07-21 05:23:40.540000','29863498-2a41-4b02-9b6f-6bd4c63f7408.png',2003047,'image/png','2022-07-21 05:23:40.540000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F29863498-2a41-4b02-9b6f-6bd4c63f7408.png?alt=media'),(1011,'2022-07-21 07:49:47.951000','46902e42-3e6e-48ae-925c-0f649cdaca79.png',2005423,'image/png','2022-07-21 07:49:47.951000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F46902e42-3e6e-48ae-925c-0f649cdaca79.png?alt=media'),(1012,'2022-07-21 07:53:15.498000','1ef8db11-7d59-49da-92e7-c6af5268c8ff.png',2105235,'image/png','2022-07-21 07:53:15.498000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F1ef8db11-7d59-49da-92e7-c6af5268c8ff.png?alt=media'),(1013,'2022-07-21 07:59:25.228000','a8a8a7d7-706c-4562-9e69-75822112f0b6.png',2105235,'image/png','2022-07-21 07:59:25.228000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa8a8a7d7-706c-4562-9e69-75822112f0b6.png?alt=media'),(1014,'2022-07-21 08:02:18.523000','4a0ce3d3-34c1-4318-8099-75428f7cd209.png',2105235,'image/png','2022-07-21 08:02:18.523000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F4a0ce3d3-34c1-4318-8099-75428f7cd209.png?alt=media'),(1015,'2022-07-21 08:06:00.853000','e05af9af-99a5-49be-afda-629a2b113e99.png',2105235,'image/png','2022-07-21 08:06:00.853000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe05af9af-99a5-49be-afda-629a2b113e99.png?alt=media'),(1016,'2022-07-21 08:08:04.358000','4880b0b2-1618-4264-af07-6b522ea8182c.png',2105235,'image/png','2022-07-21 08:08:04.358000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F4880b0b2-1618-4264-af07-6b522ea8182c.png?alt=media'),(1017,'2022-07-21 08:09:36.524000','2b49738d-b68c-478d-8b5c-bc057d92637f.png',2105235,'image/png','2022-07-21 08:09:36.524000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F2b49738d-b68c-478d-8b5c-bc057d92637f.png?alt=media'),(1091,'2022-08-16 20:41:52.997000','',0,'','2022-08-16 20:41:52.997000','https://lh3.googleusercontent.com/a/AItbvmlVJWNkCA2U_j6Q36LHnFvhQhSYuTAjv7qhpano=s96-c'),(1094,'2022-08-16 20:43:38.434000','',0,'','2022-08-16 20:43:38.434000','https://lh3.googleusercontent.com/a/AItbvmlVJWNkCA2U_j6Q36LHnFvhQhSYuTAjv7qhpano=s96-c'),(1097,'2022-08-16 20:45:36.644000','',0,'','2022-08-16 20:45:36.644000','https://lh3.googleusercontent.com/a/AItbvmlVJWNkCA2U_j6Q36LHnFvhQhSYuTAjv7qhpano=s96-c'),(1099,'2022-08-16 20:48:20.426000','',0,'','2022-08-16 20:48:20.426000','https://lh3.googleusercontent.com/a/AItbvmlVJWNkCA2U_j6Q36LHnFvhQhSYuTAjv7qhpano=s96-c'),(1101,'2022-08-16 22:21:59.011000','',0,'','2022-08-16 22:21:59.011000','https://lh3.googleusercontent.com/a/AItbvmlVJWNkCA2U_j6Q36LHnFvhQhSYuTAjv7qhpano=s96-c'),(1129,'2022-08-18 02:07:53.530000','',0,'','2022-08-18 02:07:53.530000','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=7860583697345045&height=720&width=720&ext=1663380318&hash=AeSa1nIfsGKiHkVBtNY'),(1132,'2022-08-18 22:15:46.923000','ecf6e4c3-b015-44f0-9980-da7cf46aab8a.jpg',69921,'image/jpeg','2022-08-18 22:15:46.923000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fecf6e4c3-b015-44f0-9980-da7cf46aab8a.jpg?alt=media'),(1135,'2022-08-19 02:21:33.263000','b3df89a0-495f-45af-b080-939f706fdac4.jpeg',848199,'image/jpeg','2022-08-19 02:21:33.263000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fb3df89a0-495f-45af-b080-939f706fdac4.jpeg?alt=media'),(1141,'2022-08-22 22:08:57.146000',NULL,NULL,NULL,'2022-08-22 22:08:57.146000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F052cbe07-ed08-4785-87fe-2021ba759643.png?alt=media'),(1159,'2022-08-23 01:34:36.766000','',0,'','2022-08-23 01:34:36.766000','https://lh3.googleusercontent.com/a/AItbvmlVJWNkCA2U_j6Q36LHnFvhQhSYuTAjv7qhpano=s96-c'),(1164,'2022-08-23 01:40:41.939000','',0,'','2022-08-23 01:40:41.939000','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=7860583697345045&height=720&width=720&ext=1663380318&hash=AeSa1nIfsGKiHkVBtNY'),(1182,'2022-08-25 07:56:50.212000',NULL,NULL,NULL,'2022-08-25 07:56:50.212000','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=7860583697345045&height=720&width=720&ext=1663380318&hash=AeSa1nIfsGKiHkVBtNY'),(1187,'2022-08-25 08:20:09.194000',NULL,NULL,NULL,'2022-08-25 08:20:09.194000','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=7860583697345045&height=720&width=720&ext=1663380318&hash=AeSa1nIfsGKiHkVBtNY'),(1251,'2022-08-31 03:10:13.310000',NULL,NULL,NULL,'2022-08-31 03:10:13.310000','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=7860583697345045&height=720&width=720&ext=1663380318&hash=AeSa1nIfsGKiHkVBtNY');
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
INSERT INTO `storage_aud` VALUES (1141,1142,0,'2022-08-22 22:08:57.146000',_binary '',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0','2022-08-22 22:08:57.146000',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F052cbe07-ed08-4785-87fe-2021ba759643.png?alt=media',_binary ''),(1159,1160,0,'2022-08-23 01:34:36.766000',_binary '','',_binary '',0,_binary '','',_binary '','2022-08-23 01:34:36.766000',_binary '','https://lh3.googleusercontent.com/a/AItbvmlVJWNkCA2U_j6Q36LHnFvhQhSYuTAjv7qhpano=s96-c',_binary ''),(1164,1165,0,'2022-08-23 01:40:41.939000',_binary '','',_binary '',0,_binary '','',_binary '','2022-08-23 01:40:41.939000',_binary '','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=7860583697345045&height=720&width=720&ext=1663380318&hash=AeSa1nIfsGKiHkVBtNY',_binary ''),(1182,1183,0,'2022-08-25 07:56:50.212000',_binary '',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0','2022-08-25 07:56:50.212000',_binary '','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=7860583697345045&height=720&width=720&ext=1663380318&hash=AeSa1nIfsGKiHkVBtNY',_binary ''),(1187,1188,0,'2022-08-25 08:20:09.194000',_binary '',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0','2022-08-25 08:20:09.194000',_binary '','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=7860583697345045&height=720&width=720&ext=1663380318&hash=AeSa1nIfsGKiHkVBtNY',_binary ''),(1251,1252,0,'2022-08-31 03:10:13.310000',_binary '',NULL,_binary '\0',NULL,_binary '\0',NULL,_binary '\0','2022-08-31 03:10:13.310000',_binary '','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=7860583697345045&height=720&width=720&ext=1663380318&hash=AeSa1nIfsGKiHkVBtNY',_binary '');
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
INSERT INTO `user` VALUES (1137,'2022-08-22 22:03:57.599000','aaaa',_binary '\0','admin@gmail.com',_binary '\0','Kevin ssgggg55555',' ',_binary '\0',_binary '\0','Ngo',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC','(626) 877-3042',_binary '\0','THAINOW','ADMIN','ACTIVATED','183b2dec-e4e6-4312-89ea-0657ca787fa1','2022-08-23 01:10:22.070000','Kevin ssgggg55555',NULL,_binary '\0',12,181),(1156,'2022-08-23 01:23:25.191000',NULL,_binary '\0','phucaone@gmail.com',_binary '\0','',' ',_binary '\0',_binary '\0','',_binary '\0','$2a$10$32AnP4fGQTKiUxl7yEouf.FI4IZqTUnthBFfmq04D4IEvwoODWLE2',NULL,_binary '\0','APPLE','ADMIN','ACTIVATED','32ee2ee8-d2db-4223-a975-8c1165349396','2022-08-25 22:43:54.289000','',NULL,_binary '\0',NULL,181),(1161,'2022-08-23 01:34:36.817000',NULL,_binary '\0','kvngo@tedkvn.com',_binary '\0','Kevin','Kevin Ngo',_binary '',_binary '\0','Ngo',_binary '\0','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',NULL,_binary '\0','GOOGLE','CLASSIC','ACTIVATED','0efffedb-b196-4f06-a6d0-a1dd0a0d1680','2022-08-23 01:34:36.817000','Kevin Ngo',NULL,_binary '\0',NULL,1159),(1166,'2022-08-23 01:40:41.987000',NULL,_binary '\0','phucaone5@gmail.com',_binary '\0','',' ',_binary '\0',_binary '\0','',_binary '\0','$2a$10$nhBdeQRLiADgn3QgOv11PeUKJfbkxYMim6VJNkNpNHaGBax9/DmoC',NULL,_binary '\0','FACEBOOK','CLASSIC','ACTIVATED','36d3028f-eb22-4f03-9a56-0b9223a36861','2022-08-23 01:40:41.987000','Kevin',NULL,_binary '\0',NULL,1164);
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
INSERT INTO `user_aud` VALUES (1137,1138,0,'2022-08-22 22:03:57.599000',_binary '',NULL,_binary '\0',_binary '\0',_binary '','admin@gmail.com',_binary '',_binary '\0',_binary '','',_binary '',' ',_binary '',_binary '\0',_binary '',_binary '\0',_binary '','',_binary '',_binary '\0',_binary '','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '','(626) 877-3042',_binary '',_binary '\0',_binary '','THAINOW',_binary '','CLASSIC',_binary '','ACTIVATED',_binary '','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '','2022-08-22 22:03:57.599000',_binary '','kevin ngo',_binary '',NULL,_binary '\0',_binary '\0',_binary '',_binary '',NULL,_binary '\0',181,_binary '',_binary ''),(1137,1151,1,'2022-08-22 22:03:57.599000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','BUSINESS',_binary '','ACTIVATED',_binary '\0','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-08-23 00:44:31.294000',_binary '','kevin ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',181,_binary '\0',_binary '\0'),(1137,1154,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','BUSINESS',_binary '\0','ACTIVATED',_binary '\0','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-08-23 01:04:19.097000',_binary '','kevin ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '',12,_binary '',181,_binary '\0',_binary '\0'),(1137,1155,1,'2022-08-22 22:03:57.599000',_binary '\0','aaaa',_binary '\0',_binary '\0',_binary '\0','admin@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin ssgggg55555',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$exhMYajyEHf2ledooq1OBeWs9qSVWJsHrMry5WWFoppFoKCAawWNC',_binary '\0','(626) 877-3042',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','BUSINESS',_binary '\0','ACTIVATED',_binary '\0','183b2dec-e4e6-4312-89ea-0657ca787fa1',_binary '\0','2022-08-23 01:10:22.070000',_binary '','Kevin ssgggg55555',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '',12,_binary '\0',181,_binary '\0',_binary '\0'),(1156,1157,0,'2022-08-23 01:23:25.191000',_binary '',NULL,_binary '\0',_binary '\0',_binary '','phucaone@gmail.com',_binary '',_binary '\0',_binary '','',_binary '',' ',_binary '',_binary '\0',_binary '',_binary '\0',_binary '','',_binary '',_binary '\0',_binary '','$2a$10$32AnP4fGQTKiUxl7yEouf.FI4IZqTUnthBFfmq04D4IEvwoODWLE2',_binary '',NULL,_binary '\0',_binary '\0',_binary '','APPLE',_binary '','CLASSIC',_binary '','ACTIVATED',_binary '','32ee2ee8-d2db-4223-a975-8c1165349396',_binary '','2022-08-23 01:23:25.191000',_binary '','',_binary '',NULL,_binary '\0',_binary '\0',_binary '',_binary '',NULL,_binary '\0',181,_binary '',_binary ''),(1156,1230,1,'2022-08-23 01:23:25.191000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$32AnP4fGQTKiUxl7yEouf.FI4IZqTUnthBFfmq04D4IEvwoODWLE2',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','APPLE',_binary '\0','BUSINESS',_binary '','ACTIVATED',_binary '\0','32ee2ee8-d2db-4223-a975-8c1165349396',_binary '\0','2022-08-25 22:43:54.289000',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',181,_binary '\0',_binary '\0'),(1161,1162,0,'2022-08-23 01:34:36.817000',_binary '',NULL,_binary '\0',_binary '\0',_binary '','kvngo@tedkvn.com',_binary '',_binary '\0',_binary '','Kevin',_binary '','Kevin Ngo',_binary '',_binary '',_binary '',_binary '\0',_binary '','Ngo',_binary '',_binary '\0',_binary '','$2a$10$MPop2DecMuA.iJTKRdNg8eavKtQYLooL9Jp4109fNGEB5WEg/f6DG',_binary '',NULL,_binary '\0',_binary '\0',_binary '','GOOGLE',_binary '','CLASSIC',_binary '','ACTIVATED',_binary '','0efffedb-b196-4f06-a6d0-a1dd0a0d1680',_binary '','2022-08-23 01:34:36.817000',_binary '','Kevin Ngo',_binary '',NULL,_binary '\0',_binary '\0',_binary '',_binary '',NULL,_binary '\0',1159,_binary '',_binary ''),(1166,1167,0,'2022-08-23 01:40:41.987000',_binary '',NULL,_binary '\0',_binary '\0',_binary '','phucaone5@gmail.com',_binary '',_binary '\0',_binary '','',_binary '',' ',_binary '',_binary '\0',_binary '',_binary '\0',_binary '','',_binary '',_binary '\0',_binary '','$2a$10$nhBdeQRLiADgn3QgOv11PeUKJfbkxYMim6VJNkNpNHaGBax9/DmoC',_binary '',NULL,_binary '\0',_binary '\0',_binary '','FACEBOOK',_binary '','CLASSIC',_binary '','ACTIVATED',_binary '','36d3028f-eb22-4f03-9a56-0b9223a36861',_binary '','2022-08-23 01:40:41.987000',_binary '','Kevin',_binary '',NULL,_binary '\0',_binary '\0',_binary '',_binary '',NULL,_binary '\0',1164,_binary '',_binary '');
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

-- Dump completed on 2022-08-31 12:57:13
