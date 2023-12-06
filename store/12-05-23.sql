CREATE DATABASE  IF NOT EXISTS `thainow-mono-dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `thainow-mono-dev`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: thainow-db
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
/*!40000 ALTER TABLE `deal_pictures_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_details`
--

DROP TABLE IF EXISTS `email_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_details` (
  `id` bigint NOT NULL,
  `msg_body` longtext,
  `recipient` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `email_created_on` datetime(6) DEFAULT NULL,
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
INSERT INTO `hibernate_sequence` VALUES (172);
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
  `neighbourhood_mod` bit(1) DEFAULT NULL,
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
  `client_ip_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_revision_entity`
--

LOCK TABLES `my_revision_entity` WRITE;
/*!40000 ALTER TABLE `my_revision_entity` DISABLE KEYS */;
INSERT INTO `my_revision_entity` VALUES (2,1698534420017,NULL,NULL,'anonymousUser',NULL),(4,1698535216777,NULL,NULL,'anonymousUser',NULL),(6,1698538129074,NULL,NULL,'anonymousUser',NULL),(8,1698538145537,NULL,NULL,'anonymousUser',NULL),(9,1698538224505,NULL,NULL,'anonymousUser',NULL),(10,1698560708485,NULL,NULL,'anonymousUser',NULL),(11,1698561983164,NULL,NULL,'anonymousUser',NULL),(12,1698562420639,NULL,NULL,'anonymousUser',NULL),(13,1698562473764,NULL,NULL,'anonymousUser',NULL),(14,1698562914886,NULL,NULL,'anonymousUser',NULL),(15,1698563142630,NULL,NULL,'anonymousUser',NULL),(16,1698563177013,NULL,NULL,'anonymousUser',NULL),(17,1698563656352,NULL,NULL,'anonymousUser',NULL),(18,1698563882211,NULL,NULL,'anonymousUser',NULL),(20,1698603414534,NULL,NULL,'anonymousUser',NULL),(22,1698603851151,NULL,NULL,'anonymousUser',NULL),(23,1698603958788,NULL,NULL,'anonymousUser',NULL),(24,1698604227722,NULL,NULL,'anonymousUser',NULL),(25,1698606097191,NULL,NULL,'anonymousUser',NULL),(26,1698712680510,NULL,NULL,'anonymousUser',NULL),(27,1698712737544,NULL,NULL,'anonymousUser',NULL),(28,1698963155614,NULL,NULL,'anonymousUser',NULL),(29,1698963409625,NULL,NULL,'anonymousUser',NULL),(30,1700116793243,NULL,NULL,'anonymousUser',NULL),(31,1700116926826,NULL,NULL,'anonymousUser',NULL),(32,1700117025789,NULL,NULL,'anonymousUser',NULL),(33,1700117071035,NULL,NULL,'anonymousUser',NULL),(34,1700117120898,NULL,NULL,'anonymousUser',NULL),(35,1700117148268,NULL,NULL,'anonymousUser',NULL),(36,1700117168448,NULL,NULL,'anonymousUser',NULL),(37,1700117180876,NULL,NULL,'anonymousUser',NULL),(38,1700117261937,NULL,NULL,'anonymousUser',NULL),(39,1700117294947,NULL,NULL,'anonymousUser',NULL),(40,1700117302825,NULL,NULL,'anonymousUser',NULL),(41,1700117326726,NULL,NULL,'anonymousUser',NULL),(42,1700117344627,NULL,NULL,'anonymousUser',NULL),(43,1700117416279,NULL,NULL,'anonymousUser',NULL),(44,1700117428670,NULL,NULL,'anonymousUser',NULL),(45,1700117470791,NULL,NULL,'anonymousUser',NULL),(46,1700117492547,NULL,NULL,'anonymousUser',NULL),(47,1700117522761,NULL,NULL,'anonymousUser',NULL),(48,1700117563215,NULL,NULL,'anonymousUser',NULL),(49,1700117593736,NULL,NULL,'anonymousUser',NULL),(50,1700117616821,NULL,NULL,'anonymousUser',NULL),(51,1700117632171,NULL,NULL,'anonymousUser',NULL),(52,1700117658118,NULL,NULL,'anonymousUser',NULL),(53,1700117669136,NULL,NULL,'anonymousUser',NULL),(54,1700118227319,NULL,NULL,'anonymousUser',NULL),(55,1700118256629,'phucaone@gmail.com',3,'phucaone@gmail.com',NULL),(56,1700176312397,'phucaone@gmail.com',3,'phucaone@gmail.com',NULL),(57,1700877272847,NULL,NULL,'anonymousUser',NULL),(58,1700877335531,NULL,NULL,'anonymousUser',NULL),(59,1701019110627,NULL,NULL,'anonymousUser',NULL),(60,1701038542324,NULL,NULL,'anonymousUser','0:0:0:0:0:0:0:1'),(62,1701306789173,NULL,NULL,'anonymousUser','0:0:0:0:0:0:0:1'),(65,1701306922710,'phucaone@gmail.com',3,'phucaone@gmail.com','0:0:0:0:0:0:0:1'),(68,1701382702094,NULL,NULL,'anonymousUser','0:0:0:0:0:0:0:1'),(71,1701382873629,NULL,NULL,'anonymousUser','0:0:0:0:0:0:0:1'),(74,1701564775367,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(75,1701564775389,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(77,1701564914878,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(78,1701564914897,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(80,1701565000324,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(81,1701565000334,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(83,1701565048494,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(84,1701565048513,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(86,1701565086796,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(87,1701565086816,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(89,1701565120218,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(90,1701565120227,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(92,1701565160878,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(93,1701565160888,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(95,1701565234092,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(96,1701565234100,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(98,1701565304333,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(99,1701565304345,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(101,1701565409855,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(102,1701565409865,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(104,1701565508600,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(105,1701565508609,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(107,1701565646844,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(108,1701565646851,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(110,1701565770998,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(111,1701565771009,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(113,1701565868138,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(114,1701565868145,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(116,1701565916034,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(117,1701565916048,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(119,1701566032969,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(120,1701566032976,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(122,1701566074619,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(123,1701566074635,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(125,1701566081130,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(126,1701566081143,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(128,1701566087302,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(129,1701566087308,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(131,1701566094243,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(132,1701566094258,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(134,1701566098376,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(135,1701566098400,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(137,1701566102997,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(138,1701566103005,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(140,1701566107682,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(141,1701566107689,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(143,1701566112137,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(144,1701566112152,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(146,1701566138765,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(147,1701566138776,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(149,1701566169285,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(150,1701566169298,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(152,1701566177100,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(153,1701566177121,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(155,1701566264283,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(156,1701566264300,'phu3caone@gmail.com',3,'','0:0:0:0:0:0:0:1'),(157,1701657201621,'phu3caone@gmail.com',3,'Test','0:0:0:0:0:0:0:1'),(158,1701657217206,'phuc222aone@gmail.com',3,'Test','0:0:0:0:0:0:0:1'),(159,1701659324460,'phuc3aone@gmail.com',3,'Test','0:0:0:0:0:0:0:1'),(160,1701667571550,'phuc3aone@gmail.com',3,'Test','0:0:0:0:0:0:0:1'),(161,1701815065111,'phuc3aone@gmail.com',3,'Test2222','0:0:0:0:0:0:0:1'),(162,1701821993931,NULL,NULL,'anonymousUser','0:0:0:0:0:0:0:1'),(163,1701823386083,NULL,NULL,'anonymousUser','0:0:0:0:0:0:0:1'),(164,1701824170951,NULL,NULL,'anonymousUser','0:0:0:0:0:0:0:1'),(165,1701827040227,'phuc3aone@gmail.com',3,'Test22223333','0:0:0:0:0:0:0:1'),(166,1701829939039,'phuc3aone@gmail.com',3,'Test22223333','0:0:0:0:0:0:0:1'),(167,1701829986488,'phuc3aone@gmail.com',3,'Test22223333','0:0:0:0:0:0:0:1'),(168,1701830076344,'phuc3aone@gmail.com',3,'Test22223333','0:0:0:0:0:0:0:1'),(169,1701830462932,'phuc3aone@gmail.com',3,'Test22223333','0:0:0:0:0:0:0:1'),(170,1701830954169,'phuc3aone@gmail.com',3,'Test22223333','0:0:0:0:0:0:0:1'),(171,1701831297784,'phuc3aone@gmail.com',3,'Test22223333','0:0:0:0:0:0:0:1');
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
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
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
INSERT INTO `profile` VALUES ('USER_PROFILE',3,1,NULL),('USER_PROFILE',7,5,NULL),('USER_PROFILE',21,19,NULL),('USER_PROFILE',69,67,NULL),('USER_PROFILE',72,70,NULL);
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
INSERT INTO `storage` VALUES (73,'2023-12-03 00:52:55.355286','fd1e7aba-fdbd-44f9-8ab8-7ca12c5ab346.png',156887,'image/png','2023-12-03 00:52:55.355665','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ffd1e7aba-fdbd-44f9-8ab8-7ca12c5ab346.png?alt=media'),(76,'2023-12-03 00:55:14.876139','1a0b5cc7-6b0f-4813-87c1-e97dbcd1e63e.jpg',74991,'image/jpeg','2023-12-03 00:55:14.876191','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F1a0b5cc7-6b0f-4813-87c1-e97dbcd1e63e.jpg?alt=media'),(79,'2023-12-03 00:56:40.322203','d7aebf90-6b21-46f3-a5f6-6b76027249c4.jpg',15222,'image/jpeg','2023-12-03 00:56:40.322223','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd7aebf90-6b21-46f3-a5f6-6b76027249c4.jpg?alt=media'),(82,'2023-12-03 00:57:28.492998','f80875ee-1386-43c3-82a0-1d3d1359e287.jpg',95226,'image/jpeg','2023-12-03 00:57:28.493034','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff80875ee-1386-43c3-82a0-1d3d1359e287.jpg?alt=media'),(85,'2023-12-03 00:58:06.778216','7a2004dc-5094-4b93-a23a-152259c26ed2.png',217071,'image/png','2023-12-03 00:58:06.778494','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F7a2004dc-5094-4b93-a23a-152259c26ed2.png?alt=media'),(88,'2023-12-03 00:58:40.216653','83c805eb-f7cc-4fe1-b4ef-b17072ead4ef.png',211969,'image/png','2023-12-03 00:58:40.216674','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F83c805eb-f7cc-4fe1-b4ef-b17072ead4ef.png?alt=media'),(91,'2023-12-03 00:59:20.877114','785ebcc2-f1d3-4c03-9bf6-792e6cb5c283.png',7386,'image/png','2023-12-03 00:59:20.877135','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F785ebcc2-f1d3-4c03-9bf6-792e6cb5c283.png?alt=media'),(94,'2023-12-03 01:00:34.091123','df449643-5ecc-4fef-9952-ca7405aa9b6e.png',94387,'image/png','2023-12-03 01:00:34.091147','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fdf449643-5ecc-4fef-9952-ca7405aa9b6e.png?alt=media'),(97,'2023-12-03 01:01:44.332402','fa7578c5-028c-4c4d-bab3-d260a182e278.png',210041,'image/png','2023-12-03 01:01:44.332421','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ffa7578c5-028c-4c4d-bab3-d260a182e278.png?alt=media'),(100,'2023-12-03 01:03:29.855054','b0395460-d1a9-43d5-99a2-905a987e5e49.png',171182,'image/png','2023-12-03 01:03:29.855072','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fb0395460-d1a9-43d5-99a2-905a987e5e49.png?alt=media'),(103,'2023-12-03 01:05:08.599025','f4c1e3df-dfc4-440b-bc56-07c227f7e9b7.png',136031,'image/png','2023-12-03 01:05:08.599045','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff4c1e3df-dfc4-440b-bc56-07c227f7e9b7.png?alt=media'),(106,'2023-12-03 01:07:26.842990','5957c064-88d6-46d3-bcdf-5eb6976f59dd.png',112202,'image/png','2023-12-03 01:07:26.843015','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F5957c064-88d6-46d3-bcdf-5eb6976f59dd.png?alt=media'),(109,'2023-12-03 01:09:30.997101','0f926a1a-1445-4080-8021-00eabab1b583.png',169404,'image/png','2023-12-03 01:09:30.997119','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F0f926a1a-1445-4080-8021-00eabab1b583.png?alt=media'),(112,'2023-12-03 01:11:08.137411','34564afa-1f05-42dd-bf14-0a0a84692600.png',81111,'image/png','2023-12-03 01:11:08.137430','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F34564afa-1f05-42dd-bf14-0a0a84692600.png?alt=media'),(115,'2023-12-03 01:11:56.033680','e0c62a5d-5592-4079-bc94-bede84f15005.png',171182,'image/png','2023-12-03 01:11:56.033698','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe0c62a5d-5592-4079-bc94-bede84f15005.png?alt=media'),(118,'2023-12-03 01:13:52.968333','4a9af0d3-1933-4c0c-a085-2d15ae71039f.png',94387,'image/png','2023-12-03 01:13:52.968351','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F4a9af0d3-1933-4c0c-a085-2d15ae71039f.png?alt=media'),(121,'2023-12-03 01:14:34.613201','61d2e78a-2568-4bf9-8325-93b5f511ccdb.png',81111,'image/png','2023-12-03 01:14:34.613233','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F61d2e78a-2568-4bf9-8325-93b5f511ccdb.png?alt=media'),(124,'2023-12-03 01:14:41.128839','ac992d8c-5986-42f5-8d2e-19b68e65cf59.png',227071,'image/png','2023-12-03 01:14:41.128868','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fac992d8c-5986-42f5-8d2e-19b68e65cf59.png?alt=media'),(127,'2023-12-03 01:14:47.301939','9cbc4fee-068e-4183-84ed-8264f1812576.png',43625,'image/png','2023-12-03 01:14:47.301957','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9cbc4fee-068e-4183-84ed-8264f1812576.png?alt=media'),(130,'2023-12-03 01:14:54.241813','0cc4ddcc-d3c2-47d5-b440-c6df1cfafea5.png',30129,'image/png','2023-12-03 01:14:54.241848','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F0cc4ddcc-d3c2-47d5-b440-c6df1cfafea5.png?alt=media'),(133,'2023-12-03 01:14:58.372513','43518f8a-0128-4cbe-b8d8-357d7b91c183.png',69225,'image/png','2023-12-03 01:14:58.372542','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F43518f8a-0128-4cbe-b8d8-357d7b91c183.png?alt=media'),(136,'2023-12-03 01:15:02.993435','25ab8ead-a8f4-47ed-be9a-1c4bb2e7fae2.png',187621,'image/png','2023-12-03 01:15:02.993456','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F25ab8ead-a8f4-47ed-be9a-1c4bb2e7fae2.png?alt=media'),(139,'2023-12-03 01:15:07.680331','d0404cb6-a64e-44a6-a1b4-41e45b47d216.png',100000,'image/png','2023-12-03 01:15:07.680364','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd0404cb6-a64e-44a6-a1b4-41e45b47d216.png?alt=media'),(142,'2023-12-03 01:15:12.128747','adeafd29-b65c-489e-9340-9738fc8863ef.png',21355,'image/png','2023-12-03 01:15:12.129303','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fadeafd29-b65c-489e-9340-9738fc8863ef.png?alt=media'),(145,'2023-12-03 01:15:38.764006','741fe954-3cb4-4f28-994e-3f81ce84d6c7.png',100000,'image/png','2023-12-03 01:15:38.764039','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F741fe954-3cb4-4f28-994e-3f81ce84d6c7.png?alt=media'),(148,'2023-12-03 01:16:09.284956','0ea53c87-da5c-4b8d-a939-bca88817737f.png',210041,'image/png','2023-12-03 01:16:09.284980','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F0ea53c87-da5c-4b8d-a939-bca88817737f.png?alt=media'),(151,'2023-12-03 01:16:17.099977','ec571f2e-e722-4e53-8eb3-06a8fcfb3376.png',101574,'image/png','2023-12-03 01:16:17.099992','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fec571f2e-e722-4e53-8eb3-06a8fcfb3376.png?alt=media'),(154,'2023-12-03 01:17:44.274425','556f3cb1-7f4d-4da0-9fdb-52cd2c7124f4.png',223521,'image/png','2023-12-03 01:17:44.274446','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F556f3cb1-7f4d-4da0-9fdb-52cd2c7124f4.png?alt=media');
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
INSERT INTO `storage_aud` VALUES (73,74,0,'2023-12-03 00:52:55.355286',_binary '','fd1e7aba-fdbd-44f9-8ab8-7ca12c5ab346.png',_binary '',156887,_binary '','image/png',_binary '','2023-12-03 00:52:55.355665',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ffd1e7aba-fdbd-44f9-8ab8-7ca12c5ab346.png?alt=media',_binary ''),(76,77,0,'2023-12-03 00:55:14.876139',_binary '','1a0b5cc7-6b0f-4813-87c1-e97dbcd1e63e.jpg',_binary '',74991,_binary '','image/jpeg',_binary '','2023-12-03 00:55:14.876191',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F1a0b5cc7-6b0f-4813-87c1-e97dbcd1e63e.jpg?alt=media',_binary ''),(79,80,0,'2023-12-03 00:56:40.322203',_binary '','d7aebf90-6b21-46f3-a5f6-6b76027249c4.jpg',_binary '',15222,_binary '','image/jpeg',_binary '','2023-12-03 00:56:40.322223',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd7aebf90-6b21-46f3-a5f6-6b76027249c4.jpg?alt=media',_binary ''),(82,83,0,'2023-12-03 00:57:28.492998',_binary '','f80875ee-1386-43c3-82a0-1d3d1359e287.jpg',_binary '',95226,_binary '','image/jpeg',_binary '','2023-12-03 00:57:28.493034',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff80875ee-1386-43c3-82a0-1d3d1359e287.jpg?alt=media',_binary ''),(85,86,0,'2023-12-03 00:58:06.778216',_binary '','7a2004dc-5094-4b93-a23a-152259c26ed2.png',_binary '',217071,_binary '','image/png',_binary '','2023-12-03 00:58:06.778494',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F7a2004dc-5094-4b93-a23a-152259c26ed2.png?alt=media',_binary ''),(88,89,0,'2023-12-03 00:58:40.216653',_binary '','83c805eb-f7cc-4fe1-b4ef-b17072ead4ef.png',_binary '',211969,_binary '','image/png',_binary '','2023-12-03 00:58:40.216674',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F83c805eb-f7cc-4fe1-b4ef-b17072ead4ef.png?alt=media',_binary ''),(91,92,0,'2023-12-03 00:59:20.877114',_binary '','785ebcc2-f1d3-4c03-9bf6-792e6cb5c283.png',_binary '',7386,_binary '','image/png',_binary '','2023-12-03 00:59:20.877135',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F785ebcc2-f1d3-4c03-9bf6-792e6cb5c283.png?alt=media',_binary ''),(94,95,0,'2023-12-03 01:00:34.091123',_binary '','df449643-5ecc-4fef-9952-ca7405aa9b6e.png',_binary '',94387,_binary '','image/png',_binary '','2023-12-03 01:00:34.091147',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fdf449643-5ecc-4fef-9952-ca7405aa9b6e.png?alt=media',_binary ''),(97,98,0,'2023-12-03 01:01:44.332402',_binary '','fa7578c5-028c-4c4d-bab3-d260a182e278.png',_binary '',210041,_binary '','image/png',_binary '','2023-12-03 01:01:44.332421',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ffa7578c5-028c-4c4d-bab3-d260a182e278.png?alt=media',_binary ''),(100,101,0,'2023-12-03 01:03:29.855054',_binary '','b0395460-d1a9-43d5-99a2-905a987e5e49.png',_binary '',171182,_binary '','image/png',_binary '','2023-12-03 01:03:29.855072',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fb0395460-d1a9-43d5-99a2-905a987e5e49.png?alt=media',_binary ''),(103,104,0,'2023-12-03 01:05:08.599025',_binary '','f4c1e3df-dfc4-440b-bc56-07c227f7e9b7.png',_binary '',136031,_binary '','image/png',_binary '','2023-12-03 01:05:08.599045',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff4c1e3df-dfc4-440b-bc56-07c227f7e9b7.png?alt=media',_binary ''),(106,107,0,'2023-12-03 01:07:26.842990',_binary '','5957c064-88d6-46d3-bcdf-5eb6976f59dd.png',_binary '',112202,_binary '','image/png',_binary '','2023-12-03 01:07:26.843015',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F5957c064-88d6-46d3-bcdf-5eb6976f59dd.png?alt=media',_binary ''),(109,110,0,'2023-12-03 01:09:30.997101',_binary '','0f926a1a-1445-4080-8021-00eabab1b583.png',_binary '',169404,_binary '','image/png',_binary '','2023-12-03 01:09:30.997119',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F0f926a1a-1445-4080-8021-00eabab1b583.png?alt=media',_binary ''),(112,113,0,'2023-12-03 01:11:08.137411',_binary '','34564afa-1f05-42dd-bf14-0a0a84692600.png',_binary '',81111,_binary '','image/png',_binary '','2023-12-03 01:11:08.137430',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F34564afa-1f05-42dd-bf14-0a0a84692600.png?alt=media',_binary ''),(115,116,0,'2023-12-03 01:11:56.033680',_binary '','e0c62a5d-5592-4079-bc94-bede84f15005.png',_binary '',171182,_binary '','image/png',_binary '','2023-12-03 01:11:56.033698',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe0c62a5d-5592-4079-bc94-bede84f15005.png?alt=media',_binary ''),(118,119,0,'2023-12-03 01:13:52.968333',_binary '','4a9af0d3-1933-4c0c-a085-2d15ae71039f.png',_binary '',94387,_binary '','image/png',_binary '','2023-12-03 01:13:52.968351',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F4a9af0d3-1933-4c0c-a085-2d15ae71039f.png?alt=media',_binary ''),(121,122,0,'2023-12-03 01:14:34.613201',_binary '','61d2e78a-2568-4bf9-8325-93b5f511ccdb.png',_binary '',81111,_binary '','image/png',_binary '','2023-12-03 01:14:34.613233',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F61d2e78a-2568-4bf9-8325-93b5f511ccdb.png?alt=media',_binary ''),(124,125,0,'2023-12-03 01:14:41.128839',_binary '','ac992d8c-5986-42f5-8d2e-19b68e65cf59.png',_binary '',227071,_binary '','image/png',_binary '','2023-12-03 01:14:41.128868',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fac992d8c-5986-42f5-8d2e-19b68e65cf59.png?alt=media',_binary ''),(127,128,0,'2023-12-03 01:14:47.301939',_binary '','9cbc4fee-068e-4183-84ed-8264f1812576.png',_binary '',43625,_binary '','image/png',_binary '','2023-12-03 01:14:47.301957',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9cbc4fee-068e-4183-84ed-8264f1812576.png?alt=media',_binary ''),(130,131,0,'2023-12-03 01:14:54.241813',_binary '','0cc4ddcc-d3c2-47d5-b440-c6df1cfafea5.png',_binary '',30129,_binary '','image/png',_binary '','2023-12-03 01:14:54.241848',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F0cc4ddcc-d3c2-47d5-b440-c6df1cfafea5.png?alt=media',_binary ''),(133,134,0,'2023-12-03 01:14:58.372513',_binary '','43518f8a-0128-4cbe-b8d8-357d7b91c183.png',_binary '',69225,_binary '','image/png',_binary '','2023-12-03 01:14:58.372542',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F43518f8a-0128-4cbe-b8d8-357d7b91c183.png?alt=media',_binary ''),(136,137,0,'2023-12-03 01:15:02.993435',_binary '','25ab8ead-a8f4-47ed-be9a-1c4bb2e7fae2.png',_binary '',187621,_binary '','image/png',_binary '','2023-12-03 01:15:02.993456',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F25ab8ead-a8f4-47ed-be9a-1c4bb2e7fae2.png?alt=media',_binary ''),(139,140,0,'2023-12-03 01:15:07.680331',_binary '','d0404cb6-a64e-44a6-a1b4-41e45b47d216.png',_binary '',100000,_binary '','image/png',_binary '','2023-12-03 01:15:07.680364',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd0404cb6-a64e-44a6-a1b4-41e45b47d216.png?alt=media',_binary ''),(142,143,0,'2023-12-03 01:15:12.128747',_binary '','adeafd29-b65c-489e-9340-9738fc8863ef.png',_binary '',21355,_binary '','image/png',_binary '','2023-12-03 01:15:12.129303',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fadeafd29-b65c-489e-9340-9738fc8863ef.png?alt=media',_binary ''),(145,146,0,'2023-12-03 01:15:38.764006',_binary '','741fe954-3cb4-4f28-994e-3f81ce84d6c7.png',_binary '',100000,_binary '','image/png',_binary '','2023-12-03 01:15:38.764039',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F741fe954-3cb4-4f28-994e-3f81ce84d6c7.png?alt=media',_binary ''),(148,149,0,'2023-12-03 01:16:09.284956',_binary '','0ea53c87-da5c-4b8d-a939-bca88817737f.png',_binary '',210041,_binary '','image/png',_binary '','2023-12-03 01:16:09.284980',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F0ea53c87-da5c-4b8d-a939-bca88817737f.png?alt=media',_binary ''),(151,152,0,'2023-12-03 01:16:17.099977',_binary '','ec571f2e-e722-4e53-8eb3-06a8fcfb3376.png',_binary '',101574,_binary '','image/png',_binary '','2023-12-03 01:16:17.099992',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fec571f2e-e722-4e53-8eb3-06a8fcfb3376.png?alt=media',_binary ''),(154,155,0,'2023-12-03 01:17:44.274425',_binary '','556f3cb1-7f4d-4da0-9fdb-52cd2c7124f4.png',_binary '',223521,_binary '','image/png',_binary '','2023-12-03 01:17:44.274446',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F556f3cb1-7f4d-4da0-9fdb-52cd2c7124f4.png?alt=media',_binary '');
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
  `user_password` varchar(255) DEFAULT NULL,
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
  `user_phone_region` varchar(255) DEFAULT NULL,
  `is_user_firstname_public` bit(1) DEFAULT NULL,
  `is_user_lastname_public` bit(1) DEFAULT NULL,
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
INSERT INTO `user` VALUES (1,'2023-10-28 23:07:00.006000',NULL,_binary '\0','kvngo@tedkvn.com',_binary '\0','Kevin','Kevin Ngo',_binary '',_binary '\0','Ngo',_binary '\0','$2a$10$L7aUdzSi1/QlXpG9orOfhuSOM7hopmIy0z71rhFvpPs1VttAxm8P.',NULL,_binary '\0','GOOGLE','CLASSIC','ACTIVATED','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4','2023-11-16 23:11:52.395000','Kevin Ngo',NULL,_binary '\0',NULL,NULL,'US',_binary '\0',_binary '\0'),(5,'2023-10-29 00:08:49.063000',NULL,_binary '\0','phucaone@gmail.com',_binary '\0','',' ',_binary '',_binary '\0','',_binary '\0','$2a$10$arOUiob9jXK9FxpPE1LlR.P4.opv.ZRWDjpcm5zpxsfGlLIrusUP.',NULL,_binary '\0','THAINOW','CLASSIC','ACTIVATED','30c9ffde-2dc1-431b-bab2-16aaac17aa95','2023-11-26 22:42:22.311695','phucaone@gmail.com',NULL,_binary '\0',NULL,NULL,'US',_binary '\0',_binary '\0'),(19,'2023-10-29 18:16:54.530000',NULL,_binary '\0','kevinngo4293@gmail.com',_binary '\0','',' ',_binary '\0',_binary '\0','',_binary '\0','$2a$10$57DL.ln.ap1pGLUSKxyM/el5PiiNNUAON6lg7Uw4fvLpEQaF5o3Aq','6268773058',_binary '\0','THAINOW','CLASSIC','ACTIVATED','7562f5ba-f43f-42a2-b8e3-f1a00b66314f','2023-11-26 17:18:30.614907','Kevin Ngo',NULL,_binary '\0',NULL,NULL,'US',_binary '\0',_binary '\0'),(67,'2023-11-30 22:18:22.083591',NULL,_binary '\0','phu2caone@gmail.com',_binary '\0',NULL,'',_binary '\0',_binary '\0',NULL,_binary '\0','$2a$10$H6kh3Qo0g7AUdzvrBco0qe8GVODyL9LI09g9TzFguyo58zuQNcAGi',NULL,_binary '\0','THAINOW','CLASSIC','DISABLED','42ab3021-bd5c-4158-b279-9c9cc5989814','2023-11-30 22:18:22.084006','',NULL,_binary '\0',NULL,NULL,NULL,_binary '\0',_binary '\0'),(70,'2023-11-30 22:21:13.503900',NULL,_binary '\0','phuc3aone@gmail.com',_binary '\0','Kevin','',_binary '\0',_binary '\0',NULL,_binary '\0','$2a$10$9iiUeDjuEiYjtts/IYcRpegKRsiIgpcTEOKbyU0NfHDvwhP73dBCi','',_binary '\0','THAINOW','CLASSIC','ACTIVATED','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46','2023-12-06 02:54:57.783509','Test22223333',NULL,_binary '\0',NULL,154,NULL,_binary '\0',_binary '\0');
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
  `location_id` bigint DEFAULT NULL,
  `location_mod` bit(1) DEFAULT NULL,
  `picture_id` bigint DEFAULT NULL,
  `picture_mod` bit(1) DEFAULT NULL,
  `pictures_mod` bit(1) DEFAULT NULL,
  `privileges_mod` bit(1) DEFAULT NULL,
  `user_phone_region` varchar(255) DEFAULT NULL,
  `phone_region_mod` bit(1) DEFAULT NULL,
  `is_user_firstname_public` bit(1) DEFAULT NULL,
  `first_name_public_mod` bit(1) DEFAULT NULL,
  `is_user_lastname_public` bit(1) DEFAULT NULL,
  `last_name_public_mod` bit(1) DEFAULT NULL,
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
INSERT INTO `user_aud` VALUES (1,2,0,'2023-10-28 23:07:00.006000',_binary '',NULL,_binary '\0',_binary '\0',_binary '','kvngo@tedkvn.com',_binary '',_binary '\0',_binary '','Kevin',_binary '','Kevin Ngo',_binary '',_binary '',_binary '',_binary '\0',_binary '','Ngo',_binary '',_binary '\0',_binary '','$2a$10$/TopT6a.wmg5q812R3EdVeCuSJS9QZf8evPVHYMJ9uT9FWdldnl32',_binary '',NULL,_binary '\0',_binary '\0',_binary '','GOOGLE',_binary '','CLASSIC',_binary '','ACTIVATED',_binary '','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '','2023-10-28 23:07:00.006000',_binary '','Kevin Ngo',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '',NULL,NULL,NULL,NULL,NULL,NULL),(1,4,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$SzwZh1Ij3PeD45hguiyAGe0SnN3gpfiDLkDeckwnwl.pHK45iJI22',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-28 23:20:16.770000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(1,10,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$SVxOhodQXwzC30kSgXOO7.uYdM7aA.PvWYsAM7OotV05Bh915LWMe',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-29 06:25:08.466000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(1,11,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$tlW8QDiSdYGa4wT.RlsF4ew7xNVIM.5YYaseK7RJedj9rdeOCPFFa',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-29 06:46:23.155000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(1,12,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$2Vloptla.qFmK.KOzPEF4.ocqsvZHH1JuVZL1RT.WxYOkHz25wc2m',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-29 06:53:40.637000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(1,13,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$o76fyAh.puS7Azl7WLttMOWQf78DeeljCf4S78heebUunNTwxOErm',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-29 06:54:33.762000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(1,15,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$A1wSOjZvvr.kdHD22.RLieiTm0QQlmitupw/q5Eb6nA0aP/PtYEfC',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-29 07:05:42.628000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(1,16,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$nKgcbpy3SqxcI7ECahOl1.tQtXYt6XBEzZi7jRwC9zf6Exx9nxeKS',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-29 07:06:17.010000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(1,17,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$gisFW5cnOQfSSnhc2X18fORPocJeLVqyYZ/Qnp6N8JjS602NbGwpG',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-29 07:14:16.350000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(1,18,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$m36V994v.qPIaT5mcBl11e/afZJhSo6vbA4o0ppNy4IDhgtJMzGDO',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-29 07:18:02.208000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(1,26,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$4D74m/z1nvWpODS4pjc5AevxgRg3aDbUWse6.ykRCyt.Jx0Lgqow6',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-31 00:38:00.495000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(1,27,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$RceltKTe5Ebi3L2L0DSQm.wPsL3hK4jizclnvobAW1lwltUVb0EL.',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-31 00:38:57.542000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(1,56,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$L7aUdzSi1/QlXpG9orOfhuSOM7hopmIy0z71rhFvpPs1VttAxm8P.',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-11-16 23:11:52.395000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,6,0,'2023-10-29 00:08:49.063000',_binary '',NULL,_binary '\0',_binary '\0',_binary '','phucaone@gmail.com',_binary '',_binary '\0',_binary '','',_binary '',' ',_binary '',_binary '',_binary '',_binary '\0',_binary '','',_binary '',_binary '\0',_binary '','$2a$10$r8XOExWDFtVv99bP7L6z5uihnqCfbVxRA2BFYS5TYBfYcJYZ3wIpC',_binary '',NULL,_binary '\0',_binary '\0',_binary '','APPLE',_binary '','CLASSIC',_binary '','ACTIVATED',_binary '','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '','2023-10-29 00:08:49.063000',_binary '','phucaone@gmail.com',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '',NULL,NULL,NULL,NULL,NULL,NULL),(5,8,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$TV7N6tjaUiVuxiY18MZ2dOshVf3g/mh262NNw3Ex6vO5MJ8jFpxXy',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','APPLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-10-29 00:09:05.534000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,9,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$6NLLAIKV1hkjz15wxNCTh.GMtQQLbdqK1aoKdJc/jwjbuuP.5fx6S',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','APPLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-10-29 00:10:24.502000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,14,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$bH6rZtdcaHqfHXli99HIp.v7W8c/K3tZ6Q5FobEVYFpfLSfIhQLCG',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','APPLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-10-29 07:01:54.882000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,28,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$2I1TXdzU3bc68XopwMB14eeHhEllLVygxafMzePxyznG5ui6x3D56',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','LINE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-02 22:12:35.601000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,29,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$8xhU2o/.0YsOE2/Uo6adeOoeW9PadOVfssolqQYthjWaOFQ1NZtD.',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','LINE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-02 22:16:49.622000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,30,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$FDoP65lzRCIDs1rcWmpf/O8499LoFNSlvlS5HHjoAS1ddEr8YjP8y',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:39:53.221000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,31,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$aTv3kxtmn8R6DdUO6VrKCOlUv.G8M5.q9J2PAW.FjVNZUDz10CGBG',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:42:06.825000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,32,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$v99qRobgf7/3TUmoTIceme3NEtRG145n7bjN16D2oq/AoD8JSvrw6',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:43:45.788000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,33,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$3jc2CYtTnTKYEw2WQgZrvO8ECVcRzv8t.HxzwvZOApMtrTHTX79sW',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:44:31.034000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,34,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$naD/C0fgZRwXBDGrXgIvQ.rkaSpebtUkwan1.tsuhXsgq3S050yyG',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:45:20.897000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,35,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$bftfE1lxV.hFGFfoqiVyA.wdHI62hSl7uhihEB4Kt4FC7nQnNHGfG',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:45:48.266000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,36,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$tcxGBDkA15TCLHZU/mH4xuarxkynTW4Nk/tBChj.2aJd0xqtrIJQG',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:46:08.445000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,37,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$J55V.T6VSZqw/lIfgAW/o.CCZtqzIg6FSP6r9KwFJSVVqd1YfWkiG',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:46:20.874000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,38,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$YGli4oyCH0Ei/RhfwRVum.YfdqQCY9UCYKlmMPNfVDFP6rk1nKFKK',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:47:41.935000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,39,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$ko7pKPJVPIEVQ1jQl12Gi.WcIGJDsuBxmhnUp0AqUR8mMuawhMWry',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:48:14.945000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,40,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$zQv.i6poZz6rkEJlU8PANuHgYvzIigvItGU46Ff0xmuLxBs/ZMA4m',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:48:22.824000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,41,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$ZjkuVFZDKa1AvMCI9nfR4uzHLRutmsdureibcG3/1p7cYXbDWYeEK',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:48:46.725000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,42,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$Lc0II8H6VQW7R0gJ5kskz.xv6LIV1NaK9HRnMU4Gs3tFhLQ5aOOs6',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:49:04.625000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,43,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$F0MNAxSgyTWNQoKTkrsHuOfwsBYV.qjy9Jc2NgapXwacSk4XJMcPm',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:50:16.278000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,44,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$0nL76YlC8Jatyvld/wWmNeGTg9/KsVDG56C7wUw95D66vYRy7QeF.',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:50:28.669000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,45,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$/97eWQ6VOaBPDCNh3Y.yU.GgesFLClp/KYYX0Rr0fDO3KK6xc8uX6',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:51:10.788000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,46,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$QhBHXgv.zdqZ36xNbRmzlOKBdEVS.g4Uv7HXVy3l6WnsfClYIvqNq',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:51:32.546000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,47,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$i/AsOASjrqzdLI2iCCAw6u/Yto8QtG26k1vqLGIQqQNZEXfMgw3ru',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:52:02.760000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,48,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$LgixyAHZkV4eeAtzZnZZhOWZHgdtF//UEYb.PbDocYWlkYIrqE00G',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:52:43.213000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,49,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$8dCeYzDOhCAPzvy/JQjP4u7R9FGo0dn4EFVahO3KRPetIl21GfD9C',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:53:13.735000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,50,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$UVC5Tn3rTV0EvnYfaiV3SOMij.x4m9ae0BnuASzldqRrZ7qKKGOgm',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:53:36.820000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,51,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$keQ.1DhxrU9KsaGoglpzSOoxlal0uUSxiL5TQWrqlR3baq1WQLmYO',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:53:52.170000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,52,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$7O24G4wHxujybzc1t1hd3evQT5fev1wgltIP0wfeBADgxjchKdsaW',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:54:18.116000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,53,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$iWICao97pRO5eXyLcc05KukYZW.pPp.QO6.VMf.WlF5Y7EvzPItCS',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:54:29.135000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,54,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$Ogbmtx9bxTROl8hs5po3mObVXe7Ef2FNX55hUy/UcGrTJSTnDC.72',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 07:03:47.317000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,55,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$2jeO9e8wpH9p8ZoO2cncfOrOBMMz6wt5AS5283.nhmlxk7OTzPgpq',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 07:04:16.627000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,57,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','test@gmail.com',_binary '',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$2jeO9e8wpH9p8ZoO2cncfOrOBMMz6wt5AS5283.nhmlxk7OTzPgpq',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-25 01:54:32.835000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,58,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$2jeO9e8wpH9p8ZoO2cncfOrOBMMz6wt5AS5283.nhmlxk7OTzPgpq',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-25 01:55:35.522000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(5,60,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$arOUiob9jXK9FxpPE1LlR.P4.opv.ZRWDjpcm5zpxsfGlLIrusUP.',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-26 22:42:22.311695',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','US',_binary '\0',NULL,NULL,NULL,NULL),(19,20,0,'2023-10-29 18:16:54.530000',_binary '',NULL,_binary '\0',_binary '\0',_binary '','kevinngo4293@gmail.com',_binary '',_binary '\0',_binary '','',_binary '',' ',_binary '',_binary '\0',_binary '',_binary '\0',_binary '','',_binary '',_binary '\0',_binary '','$2a$10$U7X5x2K8uWFpadX7fRW13enUv5EvZssdYnkDRLZezHpORf/OIrqdi',_binary '',NULL,_binary '\0',_binary '\0',_binary '','FACEBOOK',_binary '','CLASSIC',_binary '','ACTIVATED',_binary '','7562f5ba-f43f-42a2-b8e3-f1a00b66314f',_binary '','2023-10-29 18:16:54.530000',_binary '','Kevin Ngo',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '',NULL,NULL,NULL,NULL,NULL,NULL),(19,22,1,'2023-10-29 18:16:54.530000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kevinngo4293@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$19w6QVMfFk1yf./75v8yGu8LwS/J.n1MX89xSckidJXpsPSc4BGay',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','FACEBOOK',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','7562f5ba-f43f-42a2-b8e3-f1a00b66314f',_binary '\0','2023-10-29 18:24:11.149000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(19,23,1,'2023-10-29 18:16:54.530000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kevinngo4293@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$ou1yYzq4P5i3NTORIjGUX.NxNeA5/f7qAl9nQL21oY.2TwQUBWwj.',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','FACEBOOK',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','7562f5ba-f43f-42a2-b8e3-f1a00b66314f',_binary '\0','2023-10-29 18:25:58.785000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(19,24,1,'2023-10-29 18:16:54.530000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kevinngo4293@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$rFqJuM9qKfnFST16usS6MedpebX27BhuY247pgbDZBTLU6Gls.jZO',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','FACEBOOK',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','7562f5ba-f43f-42a2-b8e3-f1a00b66314f',_binary '\0','2023-10-29 18:30:27.718000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(19,25,1,'2023-10-29 18:16:54.530000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kevinngo4293@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$l.ZVSEg6Hr7N3nCArtCOu..byeTS/MsXZblQxmunve57AHESW1mly',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','FACEBOOK',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','7562f5ba-f43f-42a2-b8e3-f1a00b66314f',_binary '\0','2023-10-29 19:01:37.188000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL),(19,59,1,'2023-10-29 18:16:54.530000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kevinngo4293@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$57DL.ln.ap1pGLUSKxyM/el5PiiNNUAON6lg7Uw4fvLpEQaF5o3Aq',_binary '','6268773058',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','7562f5ba-f43f-42a2-b8e3-f1a00b66314f',_binary '\0','2023-11-26 17:18:30.614907',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','US',_binary '\0',NULL,NULL,NULL,NULL),(61,62,0,'2023-11-30 01:13:09.156469',_binary '',NULL,_binary '\0',_binary '\0',_binary '','phucaone@gmail.com',_binary '',_binary '\0',_binary '',NULL,_binary '\0','null null',_binary '',_binary '\0',_binary '',_binary '\0',_binary '',NULL,_binary '\0',_binary '\0',_binary '','$2a$10$BqGoihMeX5/xB2y/gP.Y9ecNIaaggmCb/5O3le7gym4nQ4R0y1IIu',_binary '',NULL,_binary '\0',_binary '\0',_binary '','THAINOW',_binary '','CLASSIC',_binary '','DISABLED',_binary '','c380f029-0631-4cf7-ad39-a58afdc6d764',_binary '','2023-11-30 01:13:09.156902',_binary '','',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '',NULL,_binary '\0',NULL,NULL,NULL,NULL),(64,65,0,'2023-11-30 01:15:22.698761',_binary '',NULL,_binary '\0',_binary '\0',_binary '','phucaone@gmail.com',_binary '',_binary '\0',_binary '',NULL,_binary '\0','null null',_binary '',_binary '\0',_binary '',_binary '\0',_binary '',NULL,_binary '\0',_binary '\0',_binary '','$2a$10$SxETLyjp2CzpZKmEfH9sXOnnUfKaVUIOixTFn3Azaw3xNEJZXXf9y',_binary '',NULL,_binary '\0',_binary '\0',_binary '','THAINOW',_binary '','CLASSIC',_binary '','DISABLED',_binary '','063ca244-9fa9-40df-861a-6ad59a3b8f0a',_binary '','2023-11-30 01:15:22.699116',_binary '','',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '',NULL,_binary '\0',NULL,NULL,NULL,NULL),(67,68,0,'2023-11-30 22:18:22.083591',_binary '',NULL,_binary '\0',_binary '\0',_binary '','phu2caone@gmail.com',_binary '',_binary '\0',_binary '',NULL,_binary '\0','null null',_binary '',_binary '\0',_binary '',_binary '\0',_binary '',NULL,_binary '\0',_binary '\0',_binary '','$2a$10$H6kh3Qo0g7AUdzvrBco0qe8GVODyL9LI09g9TzFguyo58zuQNcAGi',_binary '',NULL,_binary '\0',_binary '\0',_binary '','THAINOW',_binary '','CLASSIC',_binary '','DISABLED',_binary '','42ab3021-bd5c-4158-b279-9c9cc5989814',_binary '','2023-11-30 22:18:22.084006',_binary '','',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,71,0,'2023-11-30 22:21:13.503900',_binary '',NULL,_binary '\0',_binary '\0',_binary '','phu3caone@gmail.com',_binary '',_binary '\0',_binary '',NULL,_binary '\0','null null',_binary '',_binary '\0',_binary '',_binary '\0',_binary '',NULL,_binary '\0',_binary '\0',_binary '','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '',NULL,_binary '\0',_binary '\0',_binary '','THAINOW',_binary '','CLASSIC',_binary '','DISABLED',_binary '','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '','2023-11-30 22:21:13.505217',_binary '','',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary '',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,75,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 00:52:55.387020',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',73,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,78,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 00:55:14.893115',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',76,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,81,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 00:56:40.332704',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',79,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,84,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 00:57:28.510758',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',82,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,87,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 00:58:06.813784',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',85,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,90,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 00:58:40.225672',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',88,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,93,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 00:59:20.886772',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',91,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,96,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:00:34.098293',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',94,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,99,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:01:44.344360',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',97,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,102,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:03:29.864028',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',100,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,105,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:05:08.607632',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',103,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,108,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:07:26.849897',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',106,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,111,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:09:31.008321',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',109,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,114,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:11:08.143998',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',112,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,117,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:11:56.046489',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',115,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,120,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:13:52.975199',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',118,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,123,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:14:34.632328',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',121,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,126,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:14:41.141140',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',124,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,129,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:14:47.307214',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',127,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,132,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:14:54.256571',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',130,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,135,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:14:58.388050',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',133,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,138,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:15:03.004229',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',136,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,141,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:15:07.688116',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',139,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,144,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:15:12.148680',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',142,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,147,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:15:38.774616',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',145,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,150,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:16:09.297409',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',148,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,153,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:16:17.118375',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',151,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,156,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phu3caone@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-03 01:17:44.295999',_binary '','',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',154,_binary '',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,NULL,NULL,NULL),(70,157,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc222aone@gmail.com',_binary '',_binary '\0',_binary '\0','Kevin',_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-04 02:33:21.610003',_binary '','Test',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',154,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(70,158,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc3aone@gmail.com',_binary '',_binary '\0',_binary '\0','Kevin',_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-04 02:33:37.204665',_binary '','Test',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',154,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(70,159,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc3aone@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','null null',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0','',_binary '',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-04 03:08:44.449837',_binary '','Test',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',154,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(70,160,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc3aone@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-04 05:26:11.538237',_binary '','Test2222',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',154,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(70,161,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc3aone@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UKkU40MqfK5/4BnrykeqQu6OC6Bmdwmtv34/HNXazgMWDk.WswnXa',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-05 22:24:25.097951',_binary '','Test22223333',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',154,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(70,162,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc3aone@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$g3XuYsCSxr2MZ2kHDD/Vluk6ppUNhScOmCEh89RQ529rM3iwc7DYK',_binary '','',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-06 00:19:53.921256',_binary '','Test22223333',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',154,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(70,163,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc3aone@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$urrWUfU8Mc1Xs8hEkBe62OXtg6Dtv6VelRum8yXVD84POibB8hG.G',_binary '','',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-06 00:43:05.963919',_binary '','Test22223333',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',154,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(70,164,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc3aone@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$OPWvFwafchkd/2NyKbaF2.SMIMvQTJK7vFZyIQKvcQHLpNMvTR0oe',_binary '','',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-06 00:56:10.941367',_binary '','Test22223333',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',154,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(70,165,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc3aone@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$4loudtsTpkykusljKdC7m.PhKbMkeG6iT8C/IPtDzHOs3Z6ZRHwce',_binary '','',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-06 01:44:00.226031',_binary '','Test22223333',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',154,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(70,166,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc3aone@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$bMnnXT5YTI74GEgF9jBeJO4geI1vv64zOwNxZItPu/zWpRYQ2lkGG',_binary '','',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-06 02:32:19.029281',_binary '','Test22223333',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',154,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(70,167,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc3aone@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$pOMRtY3d/FR5DR5hA1/.nemL2lJy67ONmlymc6C5I.zmCp0IeSjWa',_binary '','',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-06 02:33:06.485883',_binary '','Test22223333',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',154,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(70,168,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc3aone@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$UOZQmUvpVG.uB4J2vjz86.CmFVlZm4Lg2mI41bf3S8No67rKfiwZq',_binary '','',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-06 02:34:36.342670',_binary '','Test22223333',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',154,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(70,169,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc3aone@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$C5GUlj2bsxDXY6X3nUfSoOsVYfD8j3or3bUFLr8HwU98X0JXoC/MO',_binary '','',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-06 02:41:02.928259',_binary '','Test22223333',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',154,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(70,170,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc3aone@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$olSHX1ZS.8QTeOLyXPLgeOOIb1WeeHR1.kpeyq.W8y0ri9hK0JwP2',_binary '','',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-06 02:49:14.167400',_binary '','Test22223333',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',154,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(70,171,1,'2023-11-30 22:21:13.503900',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phuc3aone@gmail.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','$2a$10$9iiUeDjuEiYjtts/IYcRpegKRsiIgpcTEOKbyU0NfHDvwhP73dBCi',_binary '','',_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','c13bfbc3-b3f5-4a14-98ab-b7eb3e4dde46',_binary '\0','2023-12-06 02:54:57.783509',_binary '','Test22223333',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',154,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0');
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
INSERT INTO `user_privileges` VALUES (5,'USER_MANAGE');
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

-- Dump completed on 2023-12-05 19:08:39
