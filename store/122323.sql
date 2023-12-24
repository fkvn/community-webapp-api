CREATE DATABASE  IF NOT EXISTS `thainow-mono-dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `thainow-mono-dev`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: thainow-mono-dev
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
  PRIMARY KEY (`id`),
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
  `location_id` bigint DEFAULT NULL,
  `location_mod` bit(1) DEFAULT NULL,
  `logo_id` bigint DEFAULT NULL,
  `logo_mod` bit(1) DEFAULT NULL,
  `pictures_mod` bit(1) DEFAULT NULL,
  `profile_mod` bit(1) DEFAULT NULL,
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
/*!40000 ALTER TABLE `company_aud` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `company_pictures_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_details`
--

DROP TABLE IF EXISTS `email_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_details` (
  `id` bigint NOT NULL,
  `email_created_on` datetime(6) DEFAULT NULL,
  `msg_body` longtext,
  `recipient` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `email_updated_on` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_details`
--

LOCK TABLES `email_details` WRITE;
/*!40000 ALTER TABLE `email_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guide_book`
--

DROP TABLE IF EXISTS `guide_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guide_book` (
  `id` bigint NOT NULL,
  `guidebook_category` varchar(255) DEFAULT NULL,
  `guidebook_content` longtext,
  `guidebook_created_on` datetime(6) DEFAULT NULL,
  `guidebook_description` longtext,
  `guidebook_title` varchar(255) DEFAULT NULL,
  `guidebook_updated_on` datetime(6) DEFAULT NULL,
  `banner_picture_id` bigint DEFAULT NULL,
  `guidebook_banner_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlh9c4v3cysxtonq4aqq6svsup` (`banner_picture_id`),
  CONSTRAINT `FKlh9c4v3cysxtonq4aqq6svsup` FOREIGN KEY (`banner_picture_id`) REFERENCES `storage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guide_book`
--

LOCK TABLES `guide_book` WRITE;
/*!40000 ALTER TABLE `guide_book` DISABLE KEYS */;
INSERT INTO `guide_book` VALUES (35,'LIVING_PERMANENTLY',NULL,'2023-12-23 23:13:45.825001',NULL,'222สวัสดี สบายดีไหม','2023-12-24 01:43:05.688970',NULL,NULL);
/*!40000 ALTER TABLE `guide_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guide_book_aud`
--

DROP TABLE IF EXISTS `guide_book_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guide_book_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `guidebook_category` varchar(255) DEFAULT NULL,
  `category_mod` bit(1) DEFAULT NULL,
  `guidebook_content` longtext,
  `content_mod` bit(1) DEFAULT NULL,
  `guidebook_created_on` datetime(6) DEFAULT NULL,
  `created_on_mod` bit(1) DEFAULT NULL,
  `guidebook_description` longtext,
  `description_mod` bit(1) DEFAULT NULL,
  `guidebook_title` varchar(255) DEFAULT NULL,
  `title_mod` bit(1) DEFAULT NULL,
  `guidebook_updated_on` datetime(6) DEFAULT NULL,
  `updated_on_mod` bit(1) DEFAULT NULL,
  `guide_book_post_mod` bit(1) DEFAULT NULL,
  `banner_picture_id` bigint DEFAULT NULL,
  `banner_picture_mod` bit(1) DEFAULT NULL,
  `guidebook_banner_url` varchar(255) DEFAULT NULL,
  `banner_url_mod` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`rev`),
  KEY `FKrfsxdkvhvkpew7l0yj9v9g16i` (`rev`),
  CONSTRAINT `FKrfsxdkvhvkpew7l0yj9v9g16i` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guide_book_aud`
--

LOCK TABLES `guide_book_aud` WRITE;
/*!40000 ALTER TABLE `guide_book_aud` DISABLE KEYS */;
INSERT INTO `guide_book_aud` VALUES (5,6,0,'BASIC_LIVING',_binary '',NULL,_binary '\0','2023-12-23 02:13:54.716618',_binary '',NULL,_binary '\0','b2222',_binary '','2023-12-23 02:13:54.717012',_binary '',NULL,NULL,_binary '\0',NULL,NULL),(5,8,1,'BASIC_LIVING',_binary '\0',NULL,_binary '\0','2023-12-23 02:13:54.716618',_binary '\0',NULL,_binary '\0','b2222',_binary '\0','2023-12-23 02:13:54.717012',_binary '\0',_binary '',NULL,_binary '\0',NULL,NULL),(5,46,2,NULL,_binary '',NULL,_binary '\0',NULL,_binary '',NULL,_binary '\0',NULL,_binary '',NULL,_binary '',NULL,NULL,NULL,NULL,_binary '\0'),(9,10,0,'BASIC_LIVING',_binary '',NULL,_binary '\0','2023-12-23 02:39:37.997367',_binary '',NULL,_binary '\0','fffffffffff22222',_binary '','2023-12-23 02:39:37.997659',_binary '',NULL,NULL,_binary '\0',NULL,NULL),(9,12,1,'BASIC_LIVING',_binary '\0',NULL,_binary '\0','2023-12-23 02:39:37.997367',_binary '\0',NULL,_binary '\0','fffffffffff22222',_binary '\0','2023-12-23 02:39:37.997659',_binary '\0',_binary '',NULL,_binary '\0',NULL,NULL),(9,47,2,NULL,_binary '',NULL,_binary '\0',NULL,_binary '',NULL,_binary '\0',NULL,_binary '',NULL,_binary '',NULL,NULL,NULL,NULL,_binary '\0'),(15,16,0,'BASIC_LIVING',_binary '',NULL,_binary '\0','2023-12-23 02:40:26.244116',_binary '',NULL,_binary '\0','g123123123',_binary '','2023-12-23 02:40:26.244131',_binary '',NULL,13,_binary '',NULL,NULL),(15,18,1,'BASIC_LIVING',_binary '\0',NULL,_binary '\0','2023-12-23 02:40:26.244116',_binary '\0',NULL,_binary '\0','g123123123',_binary '\0','2023-12-23 02:40:26.244131',_binary '\0',_binary '',13,_binary '\0',NULL,NULL),(15,48,2,'BASIC_LIVING',_binary '\0',NULL,_binary '\0','2023-12-23 02:40:26.244116',_binary '\0',NULL,_binary '\0','g123123123',_binary '\0','2023-12-23 02:40:26.244131',_binary '\0',NULL,NULL,NULL,NULL,_binary '\0'),(35,36,0,'LIVING_PERMANENTLY',_binary '',NULL,_binary '\0','2023-12-23 23:13:45.825001',_binary '',NULL,_binary '\0','g123123123',_binary '','2023-12-23 23:13:45.825318',_binary '',NULL,NULL,NULL,NULL,_binary '\0'),(35,38,1,'LIVING_PERMANENTLY',_binary '\0',NULL,_binary '\0','2023-12-23 23:13:45.825001',_binary '\0',NULL,_binary '\0','g123123123',_binary '\0','2023-12-23 23:13:45.825318',_binary '\0',_binary '',NULL,NULL,NULL,_binary '\0'),(35,39,1,'LIVING_PERMANENTLY',_binary '\0',NULL,_binary '\0','2023-12-23 23:13:45.825001',_binary '\0',NULL,_binary '\0','basd',_binary '','2023-12-24 00:21:01.573296',_binary '',NULL,NULL,NULL,NULL,_binary '\0'),(35,40,1,'LIVING_PERMANENTLY',_binary '\0',NULL,_binary '\0','2023-12-23 23:13:45.825001',_binary '\0',NULL,_binary '\0','สวัสดี สบายดีไหม',_binary '','2023-12-24 01:15:23.198440',_binary '',NULL,NULL,NULL,NULL,_binary '\0'),(35,41,1,'LIVING_PERMANENTLY',_binary '\0',NULL,_binary '\0','2023-12-23 23:13:45.825001',_binary '\0',NULL,_binary '\0','222 สวัสดี สบายดีไหม',_binary '','2023-12-24 01:40:44.987935',_binary '',NULL,NULL,NULL,NULL,_binary '\0'),(35,42,1,'LIVING_PERMANENTLY',_binary '\0',NULL,_binary '\0','2023-12-23 23:13:45.825001',_binary '\0',NULL,_binary '\0','222สวัสดี สบายดีไหม',_binary '','2023-12-24 01:43:05.688970',_binary '',NULL,NULL,NULL,NULL,_binary '\0'),(49,50,0,'LIVING_PERMANENTLY',_binary '',NULL,_binary '\0','2023-12-24 01:55:12.441448',_binary '',NULL,_binary '\0','g123123123',_binary '','2023-12-24 01:55:12.441724',_binary '',NULL,NULL,NULL,NULL,_binary '\0'),(49,52,1,'LIVING_PERMANENTLY',_binary '\0',NULL,_binary '\0','2023-12-24 01:55:12.441448',_binary '\0',NULL,_binary '\0','g123123123',_binary '\0','2023-12-24 01:55:12.441724',_binary '\0',_binary '',NULL,NULL,NULL,_binary '\0'),(49,53,2,'LIVING_PERMANENTLY',_binary '\0',NULL,_binary '\0','2023-12-24 01:55:12.441448',_binary '\0',NULL,_binary '\0','g123123123',_binary '\0','2023-12-24 01:55:12.441724',_binary '\0',NULL,NULL,NULL,NULL,_binary '\0'),(54,55,0,'LIVING_PERMANENTLY',_binary '',NULL,_binary '\0','2023-12-24 01:56:21.335759',_binary '',NULL,_binary '\0','g123123123',_binary '','2023-12-24 01:56:21.336033',_binary '',NULL,NULL,NULL,NULL,_binary '\0'),(54,57,1,'LIVING_PERMANENTLY',_binary '\0',NULL,_binary '\0','2023-12-24 01:56:21.335759',_binary '\0',NULL,_binary '\0','g123123123',_binary '\0','2023-12-24 01:56:21.336033',_binary '\0',_binary '',NULL,NULL,NULL,_binary '\0'),(54,58,2,NULL,_binary '',NULL,_binary '\0',NULL,_binary '',NULL,_binary '\0',NULL,_binary '',NULL,_binary '',NULL,NULL,NULL,NULL,_binary '\0');
/*!40000 ALTER TABLE `guide_book_aud` ENABLE KEYS */;
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
INSERT INTO `hibernate_sequence` VALUES (59);
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
  `location_formatted_address` varchar(255) DEFAULT NULL,
  `location_address1` varchar(255) DEFAULT NULL,
  `location_address2` varchar(255) DEFAULT NULL,
  `location_country` varchar(255) DEFAULT NULL,
  `location_county` varchar(255) DEFAULT NULL,
  `location_created_on` datetime(6) DEFAULT NULL,
  `location_full_address` varchar(255) DEFAULT NULL,
  `location_lat` double DEFAULT NULL,
  `location_lng` double DEFAULT NULL,
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
  `location_formatted_address` varchar(255) DEFAULT NULL,
  `address_mod` bit(1) DEFAULT NULL,
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
  `location_full_address` varchar(255) DEFAULT NULL,
  `full_address_mod` bit(1) DEFAULT NULL,
  `location_lat` double DEFAULT NULL,
  `lat_mod` bit(1) DEFAULT NULL,
  `location_lng` double DEFAULT NULL,
  `lng_mod` bit(1) DEFAULT NULL,
  `location_city` varchar(255) DEFAULT NULL,
  `locality_mod` bit(1) DEFAULT NULL,
  `location_neighberhood` varchar(255) DEFAULT NULL,
  `neighbourhood_mod` bit(1) DEFAULT NULL,
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
/*!40000 ALTER TABLE `location_aud` ENABLE KEYS */;
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
  `client_ip_address` varchar(255) DEFAULT NULL,
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
INSERT INTO `my_revision_entity` VALUES (2,1703204677128,'0:0:0:0:0:0:0:1',NULL,NULL,'anonymousUser'),(4,1703204677173,'0:0:0:0:0:0:0:1',NULL,NULL,'anonymousUser'),(6,1703297634739,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(8,1703297634919,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(10,1703299178014,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(12,1703299178174,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(14,1703299226234,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(16,1703299226245,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(18,1703299226287,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(20,1703304849255,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(21,1703304857870,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(23,1703305304809,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(24,1703305487410,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(26,1703305508547,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(27,1703305523169,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(29,1703305551789,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(30,1703305551833,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(31,1703306265022,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(33,1703306297135,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(34,1703306297173,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(36,1703373225838,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(38,1703373225889,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(39,1703377261588,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(40,1703380523220,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(41,1703382045003,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(42,1703382185703,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(43,1703382298052,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(44,1703382438572,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(45,1703382631160,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',3,'phuc3aone@gmail.com'),(46,1703382687725,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',1,'phuc3aone@gmail.com'),(47,1703382716696,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',1,'phuc3aone@gmail.com'),(48,1703382759718,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',1,'phuc3aone@gmail.com'),(50,1703382912451,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',1,'phuc3aone@gmail.com'),(52,1703382912512,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',1,'phuc3aone@gmail.com'),(53,1703382920933,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',1,'phuc3aone@gmail.com'),(55,1703382981345,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',1,'phuc3aone@gmail.com'),(57,1703382981396,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',1,'phuc3aone@gmail.com'),(58,1703382990404,'0:0:0:0:0:0:0:1','phuc3aone@gmail.com',1,'phuc3aone@gmail.com');
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
  `post_created_on` datetime(6) DEFAULT NULL,
  `is_post_as_anonymous` bit(1) DEFAULT NULL,
  `is_receive_notification` bit(1) DEFAULT NULL,
  `post_notification_via` varchar(255) DEFAULT NULL,
  `post_status` varchar(255) DEFAULT NULL,
  `post_updated_on` datetime(6) DEFAULT NULL,
  `owner_id` bigint DEFAULT NULL,
  `guide_book_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqyyhq50chw7pvtswbb2apqdx2` (`owner_id`),
  KEY `FKg1bb02mycjmrv5ms2n76u17g5` (`guide_book_id`),
  CONSTRAINT `FKg1bb02mycjmrv5ms2n76u17g5` FOREIGN KEY (`guide_book_id`) REFERENCES `guide_book` (`id`),
  CONSTRAINT `FKqyyhq50chw7pvtswbb2apqdx2` FOREIGN KEY (`owner_id`) REFERENCES `profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES ('GUIDEBOOK_POST',37,'2023-12-23 23:13:45.879581',_binary '\0',_binary '\0',NULL,'PUBLIC','2023-12-23 23:13:45.879601',3,35);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_aud`
--

DROP TABLE IF EXISTS `post_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `post_type` varchar(31) NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `post_created_on` datetime(6) DEFAULT NULL,
  `created_on_mod` bit(1) DEFAULT NULL,
  `is_post_as_anonymous` bit(1) DEFAULT NULL,
  `is_post_as_anonymous_mod` bit(1) DEFAULT NULL,
  `is_receive_notification` bit(1) DEFAULT NULL,
  `is_receive_notification_mod` bit(1) DEFAULT NULL,
  `post_notification_via` varchar(255) DEFAULT NULL,
  `notification_via_mod` bit(1) DEFAULT NULL,
  `post_status` varchar(255) DEFAULT NULL,
  `status_mod` bit(1) DEFAULT NULL,
  `post_updated_on` datetime(6) DEFAULT NULL,
  `updated_on_mod` bit(1) DEFAULT NULL,
  `blockers_mod` bit(1) DEFAULT NULL,
  `owner_id` bigint DEFAULT NULL,
  `owner_mod` bit(1) DEFAULT NULL,
  `reviews_mod` bit(1) DEFAULT NULL,
  `guide_book_id` bigint DEFAULT NULL,
  `guide_book_mod` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`rev`),
  KEY `FKsb13veixpaiycejifbaq94ijm` (`rev`),
  CONSTRAINT `FKsb13veixpaiycejifbaq94ijm` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_aud`
--

LOCK TABLES `post_aud` WRITE;
/*!40000 ALTER TABLE `post_aud` DISABLE KEYS */;
INSERT INTO `post_aud` VALUES (7,8,'GUIDEBOOK_POST',0,'2023-12-23 02:13:54.904795',_binary '',_binary '\0',_binary '',_binary '\0',_binary '',NULL,_binary '\0','PUBLIC',_binary '','2023-12-23 02:13:54.904823',_binary '',_binary '\0',3,_binary '',_binary '\0',5,_binary ''),(7,43,'GUIDEBOOK_POST',1,'2023-12-23 02:13:54.904795',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','REMOVED',_binary '','2023-12-24 01:44:58.036219',_binary '',_binary '\0',3,_binary '\0',_binary '\0',5,_binary '\0'),(7,44,'GUIDEBOOK_POST',1,'2023-12-23 02:13:54.904795',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','REMOVED',_binary '','2023-12-24 01:47:18.567596',_binary '',_binary '\0',3,_binary '\0',_binary '\0',5,_binary '\0'),(7,45,'GUIDEBOOK_POST',1,'2023-12-23 02:13:54.904795',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','REMOVED',_binary '','2023-12-24 01:50:30.885234',_binary '',_binary '\0',3,_binary '\0',_binary '\0',5,_binary '\0'),(7,46,'GUIDEBOOK_POST',2,NULL,_binary '',NULL,_binary '',NULL,_binary '',NULL,_binary '\0',NULL,_binary '',NULL,_binary '',_binary '',NULL,_binary '',_binary '',NULL,_binary ''),(11,12,'GUIDEBOOK_POST',0,'2023-12-23 02:39:38.161881',_binary '',_binary '\0',_binary '',_binary '\0',_binary '',NULL,_binary '\0','PUBLIC',_binary '','2023-12-23 02:39:38.161910',_binary '',_binary '\0',3,_binary '',_binary '\0',9,_binary ''),(11,47,'GUIDEBOOK_POST',2,NULL,_binary '',NULL,_binary '',NULL,_binary '',NULL,_binary '\0',NULL,_binary '',NULL,_binary '',_binary '',NULL,_binary '',_binary '',NULL,_binary ''),(17,18,'GUIDEBOOK_POST',0,'2023-12-23 02:40:26.277212',_binary '',_binary '\0',_binary '',_binary '\0',_binary '',NULL,_binary '\0','PUBLIC',_binary '','2023-12-23 02:40:26.277227',_binary '',_binary '\0',3,_binary '',_binary '\0',15,_binary ''),(17,48,'GUIDEBOOK_POST',2,'2023-12-23 02:40:26.277212',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','PUBLIC',_binary '\0','2023-12-23 02:40:26.277227',_binary '\0',_binary '\0',3,_binary '\0',_binary '\0',15,_binary '\0'),(37,38,'GUIDEBOOK_POST',0,'2023-12-23 23:13:45.879581',_binary '',_binary '\0',_binary '',_binary '\0',_binary '',NULL,_binary '\0','PUBLIC',_binary '','2023-12-23 23:13:45.879601',_binary '',_binary '\0',3,_binary '',_binary '\0',35,_binary ''),(51,52,'GUIDEBOOK_POST',0,'2023-12-24 01:55:12.500677',_binary '',_binary '\0',_binary '',_binary '\0',_binary '',NULL,_binary '\0','PUBLIC',_binary '','2023-12-24 01:55:12.500703',_binary '',_binary '\0',3,_binary '',_binary '\0',49,_binary ''),(51,53,'GUIDEBOOK_POST',2,'2023-12-24 01:55:12.500677',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','PUBLIC',_binary '\0','2023-12-24 01:55:12.500703',_binary '\0',_binary '\0',3,_binary '\0',_binary '\0',49,_binary '\0'),(56,57,'GUIDEBOOK_POST',0,'2023-12-24 01:56:21.386737',_binary '',_binary '\0',_binary '',_binary '\0',_binary '',NULL,_binary '\0','PUBLIC',_binary '','2023-12-24 01:56:21.386764',_binary '',_binary '\0',3,_binary '',_binary '\0',54,_binary ''),(56,58,'GUIDEBOOK_POST',2,NULL,_binary '',NULL,_binary '',NULL,_binary '',NULL,_binary '\0',NULL,_binary '',NULL,_binary '',_binary '',NULL,_binary '',_binary '',NULL,_binary '');
/*!40000 ALTER TABLE `post_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_blockers`
--

DROP TABLE IF EXISTS `post_blockers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_blockers` (
  `blocked_posts_id` bigint NOT NULL,
  `blockers_id` bigint NOT NULL,
  KEY `FKq2elc6wxl5tpj1v8bvd0jdjqf` (`blockers_id`),
  KEY `FK9o10igmy2myygh9ts0xr95o33` (`blocked_posts_id`),
  CONSTRAINT `FK9o10igmy2myygh9ts0xr95o33` FOREIGN KEY (`blocked_posts_id`) REFERENCES `post` (`id`),
  CONSTRAINT `FKq2elc6wxl5tpj1v8bvd0jdjqf` FOREIGN KEY (`blockers_id`) REFERENCES `profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_blockers`
--

LOCK TABLES `post_blockers` WRITE;
/*!40000 ALTER TABLE `post_blockers` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_blockers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_blockers_aud`
--

DROP TABLE IF EXISTS `post_blockers_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_blockers_aud` (
  `rev` int NOT NULL,
  `blocked_posts_id` bigint NOT NULL,
  `blockers_id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`blocked_posts_id`,`blockers_id`),
  CONSTRAINT `FKgfuet0usu248s107ye881gfx7` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_blockers_aud`
--

LOCK TABLES `post_blockers_aud` WRITE;
/*!40000 ALTER TABLE `post_blockers_aud` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_blockers_aud` ENABLE KEYS */;
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
INSERT INTO `profile` VALUES ('USER_PROFILE',3,1,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_aud`
--

DROP TABLE IF EXISTS `profile_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `profile_type` varchar(31) NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `account_id` bigint DEFAULT NULL,
  `account_mod` bit(1) DEFAULT NULL,
  `blocked_posts_mod` bit(1) DEFAULT NULL,
  `posts_mod` bit(1) DEFAULT NULL,
  `reviewed_list_mod` bit(1) DEFAULT NULL,
  `reviews_mod` bit(1) DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `company_mod` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`rev`),
  KEY `FKlupvru8286yv06m0lngqqbpt2` (`rev`),
  CONSTRAINT `FKlupvru8286yv06m0lngqqbpt2` FOREIGN KEY (`rev`) REFERENCES `my_revision_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_aud`
--

LOCK TABLES `profile_aud` WRITE;
/*!40000 ALTER TABLE `profile_aud` DISABLE KEYS */;
INSERT INTO `profile_aud` VALUES (3,4,'USER_PROFILE',0,1,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,NULL),(3,8,'USER_PROFILE',1,1,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',NULL,NULL),(3,12,'USER_PROFILE',1,1,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',NULL,NULL),(3,18,'USER_PROFILE',1,1,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',NULL,NULL),(3,38,'USER_PROFILE',1,1,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',NULL,NULL),(3,46,'USER_PROFILE',1,1,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',NULL,NULL),(3,47,'USER_PROFILE',1,1,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',NULL,NULL),(3,48,'USER_PROFILE',1,1,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',NULL,NULL),(3,52,'USER_PROFILE',1,1,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',NULL,NULL),(3,53,'USER_PROFILE',1,1,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',NULL,NULL),(3,57,'USER_PROFILE',1,1,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',NULL,NULL),(3,58,'USER_PROFILE',1,1,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `profile_aud` ENABLE KEYS */;
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
  `reviewed_id` bigint DEFAULT NULL,
  `reviewed_profile_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbtfm70ln2w2kdcjb5cq2pygf8` (`reviewer_id`),
  KEY `FKlepd79fxvq9vipi89esj2txi3` (`reviewed_id`),
  KEY `FKd2311tnyob1tv32wr8o6ey0sv` (`reviewed_profile_id`),
  CONSTRAINT `FKbtfm70ln2w2kdcjb5cq2pygf8` FOREIGN KEY (`reviewer_id`) REFERENCES `profile` (`id`),
  CONSTRAINT `FKd2311tnyob1tv32wr8o6ey0sv` FOREIGN KEY (`reviewed_profile_id`) REFERENCES `profile` (`id`),
  CONSTRAINT `FKlepd79fxvq9vipi89esj2txi3` FOREIGN KEY (`reviewed_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
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
  `review_comment` varchar(255) DEFAULT NULL,
  `comment_mod` bit(1) DEFAULT NULL,
  `review_created_on` datetime(6) DEFAULT NULL,
  `created_on_mod` bit(1) DEFAULT NULL,
  `review_helpful_count` int DEFAULT NULL,
  `helpful_count_mod` bit(1) DEFAULT NULL,
  `review_rate` int DEFAULT NULL,
  `rate_mod` bit(1) DEFAULT NULL,
  `review_status` varchar(255) DEFAULT NULL,
  `status_mod` bit(1) DEFAULT NULL,
  `review_updated_on` datetime(6) DEFAULT NULL,
  `updated_on_mod` bit(1) DEFAULT NULL,
  `reviewer_id` bigint DEFAULT NULL,
  `reviewed_profile_id` bigint DEFAULT NULL,
  `reviewed_id` bigint DEFAULT NULL,
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
INSERT INTO `storage` VALUES (13,'2023-12-23 02:40:26.233380','fd1e7aba-fdbd-44f9-8ab8-7ca12c5ab346.png',0,'','2023-12-23 02:40:26.233395','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ffd1e7aba-fdbd-44f9-8ab8-7ca12c5ab346.png?alt=media'),(19,'2023-12-23 04:14:09.242467','f391b866-3afc-4034-8b1b-e7201c1a9ae5.jpg',98462,'image/jpeg','2023-12-23 04:14:09.242805','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff391b866-3afc-4034-8b1b-e7201c1a9ae5.jpg?alt=media'),(22,'2023-12-23 04:21:44.808200','57f7bf0b-8173-499e-98d7-a2731fe55cc5.jpg',100683,'image/jpeg','2023-12-23 04:21:44.808221','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F57f7bf0b-8173-499e-98d7-a2731fe55cc5.jpg?alt=media'),(25,'2023-12-23 04:25:08.527711','eb2252f7-e6f8-46a0-9734-a7f24508e4b9.jpg',100683,'image/jpeg','2023-12-23 04:25:08.528161','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Feb2252f7-e6f8-46a0-9734-a7f24508e4b9.jpg?alt=media'),(28,'2023-12-23 04:25:51.775206','a5ceaad9-5ca6-4b94-8121-631f8520ceef.jpg',100683,'image/jpeg','2023-12-23 04:25:51.775873','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa5ceaad9-5ca6-4b94-8121-631f8520ceef.jpg?alt=media'),(32,'2023-12-23 04:38:17.132824','c91f532d-44cb-428d-ad3f-5bb213e3a509.png',500002,'image/png','2023-12-23 04:38:17.132860','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc91f532d-44cb-428d-ad3f-5bb213e3a509.png?alt=media');
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
INSERT INTO `storage_aud` VALUES (13,14,0,'2023-12-23 02:40:26.233380',_binary '','fd1e7aba-fdbd-44f9-8ab8-7ca12c5ab346.png',_binary '',0,_binary '','',_binary '','2023-12-23 02:40:26.233395',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ffd1e7aba-fdbd-44f9-8ab8-7ca12c5ab346.png?alt=media',_binary ''),(19,20,0,'2023-12-23 04:14:09.242467',_binary '','f391b866-3afc-4034-8b1b-e7201c1a9ae5.jpg',_binary '',98462,_binary '','image/jpeg',_binary '','2023-12-23 04:14:09.242805',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff391b866-3afc-4034-8b1b-e7201c1a9ae5.jpg?alt=media',_binary ''),(22,23,0,'2023-12-23 04:21:44.808200',_binary '','57f7bf0b-8173-499e-98d7-a2731fe55cc5.jpg',_binary '',100683,_binary '','image/jpeg',_binary '','2023-12-23 04:21:44.808221',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F57f7bf0b-8173-499e-98d7-a2731fe55cc5.jpg?alt=media',_binary ''),(25,26,0,'2023-12-23 04:25:08.527711',_binary '','eb2252f7-e6f8-46a0-9734-a7f24508e4b9.jpg',_binary '',100683,_binary '','image/jpeg',_binary '','2023-12-23 04:25:08.528161',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Feb2252f7-e6f8-46a0-9734-a7f24508e4b9.jpg?alt=media',_binary ''),(28,29,0,'2023-12-23 04:25:51.775206',_binary '','a5ceaad9-5ca6-4b94-8121-631f8520ceef.jpg',_binary '',100683,_binary '','image/jpeg',_binary '','2023-12-23 04:25:51.775873',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa5ceaad9-5ca6-4b94-8121-631f8520ceef.jpg?alt=media',_binary ''),(32,33,0,'2023-12-23 04:38:17.132824',_binary '','c91f532d-44cb-428d-ad3f-5bb213e3a509.png',_binary '',500002,_binary '','image/png',_binary '','2023-12-23 04:38:17.132860',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc91f532d-44cb-428d-ad3f-5bb213e3a509.png?alt=media',_binary '');
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
  `is_user_firstname_public` bit(1) DEFAULT NULL,
  `user_fullname` varchar(255) DEFAULT NULL,
  `is_user_email_verified` bit(1) DEFAULT NULL,
  `is_user_phone_verified` bit(1) DEFAULT NULL,
  `user_lastname` varchar(255) DEFAULT NULL,
  `is_user_lastname_public` bit(1) DEFAULT NULL,
  `is_user_location_public` bit(1) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `is_user_phone_public` bit(1) DEFAULT NULL,
  `user_phone_region` varchar(255) DEFAULT NULL,
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
  `user_avatar_url` varchar(255) DEFAULT NULL,
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
INSERT INTO `user` VALUES (1,'2023-12-22 00:24:37.115362',NULL,_binary '\0','phuc3aone@gmail.com',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0','$2a$10$e3dEjBarkBbKNS7OQcw2L.Sx4r4SLk4/ka/L5a/vJ4ob6D6hQg4fi',NULL,_binary '\0',NULL,'THAINOW','ADMIN','ACTIVATED','e622d491-4e72-443b-a881-53f48a20d127','2023-12-23 04:38:17.171115','phuc3aone@gmail.com',NULL,_binary '\0',NULL,NULL,'https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc91f532d-44cb-428d-ad3f-5bb213e3a509.png?alt=media');
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
  `is_user_firstname_public` bit(1) DEFAULT NULL,
  `first_name_public_mod` bit(1) DEFAULT NULL,
  `user_fullname` varchar(255) DEFAULT NULL,
  `full_name_mod` bit(1) DEFAULT NULL,
  `is_user_email_verified` bit(1) DEFAULT NULL,
  `is_email_verified_mod` bit(1) DEFAULT NULL,
  `is_user_phone_verified` bit(1) DEFAULT NULL,
  `is_phone_verified_mod` bit(1) DEFAULT NULL,
  `user_lastname` varchar(255) DEFAULT NULL,
  `last_name_mod` bit(1) DEFAULT NULL,
  `is_user_lastname_public` bit(1) DEFAULT NULL,
  `last_name_public_mod` bit(1) DEFAULT NULL,
  `is_user_location_public` bit(1) DEFAULT NULL,
  `location_public_mod` bit(1) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `password_mod` bit(1) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `phone_mod` bit(1) DEFAULT NULL,
  `is_user_phone_public` bit(1) DEFAULT NULL,
  `phone_public_mod` bit(1) DEFAULT NULL,
  `user_phone_region` varchar(255) DEFAULT NULL,
  `phone_region_mod` bit(1) DEFAULT NULL,
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
  `location_id` bigint DEFAULT NULL,
  `location_mod` bit(1) DEFAULT NULL,
  `picture_id` bigint DEFAULT NULL,
  `picture_mod` bit(1) DEFAULT NULL,
  `pictures_mod` bit(1) DEFAULT NULL,
  `privileges_mod` bit(1) DEFAULT NULL,
  `user_avatar_url` varchar(255) DEFAULT NULL,
  `avatar_url_mod` bit(1) DEFAULT NULL,
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
INSERT INTO `user_aud` VALUES (1,2,0,'2023-12-22 00:24:37.115362',_binary '',NULL,_binary '\0',_binary '\0',_binary '','phuc3aone@gmail.com',_binary '',_binary '\0',_binary '',NULL,_binary '\0',_binary '\0',_binary '','null null',_binary '',_binary '\0',_binary '',_binary '\0',_binary '',NULL,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '','$2a$10$e3dEjBarkBbKNS7OQcw2L.Sx4r4SLk4/ka/L5a/vJ4ob6D6hQg4fi',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0','THAINOW',_binary '','CLASSIC',_binary '','ACTIVATED',_binary '','e622d491-4e72-443b-a881-53f48a20d127',_binary '','2023-12-22 00:24:37.115662',_binary '','phuc3aone@gmail.com',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '',NULL,NULL),(1,21,1,'2023-12-22 00:24:37.115362',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc3aone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','$2a$10$e3dEjBarkBbKNS7OQcw2L.Sx4r4SLk4/ka/L5a/vJ4ob6D6hQg4fi',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','e622d491-4e72-443b-a881-53f48a20d127',_binary '\0','2023-12-23 04:14:17.867461',_binary '','phuc3aone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,_binary '\0',_binary '\0','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker/f391b866-3afc-4034-8b1b-e7201c1a9ae5.jpg?alt=media',_binary ''),(1,24,1,'2023-12-22 00:24:37.115362',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc3aone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','$2a$10$e3dEjBarkBbKNS7OQcw2L.Sx4r4SLk4/ka/L5a/vJ4ob6D6hQg4fi',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','e622d491-4e72-443b-a881-53f48a20d127',_binary '\0','2023-12-23 04:24:47.409415',_binary '','phuc3aone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,_binary '\0',_binary '\0','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker/57f7bf0b-8173-499e-98d7-a2731fe55cc5.jpg?alt=media',_binary ''),(1,27,1,'2023-12-22 00:24:37.115362',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc3aone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','$2a$10$e3dEjBarkBbKNS7OQcw2L.Sx4r4SLk4/ka/L5a/vJ4ob6D6hQg4fi',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','e622d491-4e72-443b-a881-53f48a20d127',_binary '\0','2023-12-23 04:25:23.166545',_binary '','phuc3aone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,_binary '\0',_binary '\0','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker/eb2252f7-e6f8-46a0-9734-a7f24508e4b9.jpg?alt=media',_binary ''),(1,30,1,'2023-12-22 00:24:37.115362',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc3aone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','$2a$10$e3dEjBarkBbKNS7OQcw2L.Sx4r4SLk4/ka/L5a/vJ4ob6D6hQg4fi',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','e622d491-4e72-443b-a881-53f48a20d127',_binary '\0','2023-12-23 04:25:51.830575',_binary '','phuc3aone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,_binary '\0',_binary '\0','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker/a5ceaad9-5ca6-4b94-8121-631f8520ceef.jpg?alt=media',_binary ''),(1,31,1,'2023-12-22 00:24:37.115362',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc3aone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','$2a$10$e3dEjBarkBbKNS7OQcw2L.Sx4r4SLk4/ka/L5a/vJ4ob6D6hQg4fi',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','e622d491-4e72-443b-a881-53f48a20d127',_binary '\0','2023-12-23 04:37:45.013613',_binary '','phuc3aone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,_binary '\0',_binary '\0','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa5ceaad9-5ca6-4b94-8121-631f8520ceef.jpg?alt=media',_binary ''),(1,34,1,'2023-12-22 00:24:37.115362',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc3aone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','$2a$10$e3dEjBarkBbKNS7OQcw2L.Sx4r4SLk4/ka/L5a/vJ4ob6D6hQg4fi',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','e622d491-4e72-443b-a881-53f48a20d127',_binary '\0','2023-12-23 04:38:17.171115',_binary '','phuc3aone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,_binary '\0',_binary '\0','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc91f532d-44cb-428d-ad3f-5bb213e3a509.png?alt=media',_binary '');
/*!40000 ALTER TABLE `user_aud` ENABLE KEYS */;
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
  `user_privileges` varchar(255) NOT NULL,
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
  `user_privileges` varchar(255) NOT NULL,
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

-- Dump completed on 2023-12-23 17:58:46
