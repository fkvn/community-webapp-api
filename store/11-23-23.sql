CREATE DATABASE  IF NOT EXISTS `thainow-db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `thainow-db`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: thainow-db
-- ------------------------------------------------------
-- Server version	8.1.0

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
INSERT INTO `hibernate_sequence` VALUES (57);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_revision_entity`
--

LOCK TABLES `my_revision_entity` WRITE;
/*!40000 ALTER TABLE `my_revision_entity` DISABLE KEYS */;
INSERT INTO `my_revision_entity` VALUES (2,1698534420017,NULL,NULL,'anonymousUser'),(4,1698535216777,NULL,NULL,'anonymousUser'),(6,1698538129074,NULL,NULL,'anonymousUser'),(8,1698538145537,NULL,NULL,'anonymousUser'),(9,1698538224505,NULL,NULL,'anonymousUser'),(10,1698560708485,NULL,NULL,'anonymousUser'),(11,1698561983164,NULL,NULL,'anonymousUser'),(12,1698562420639,NULL,NULL,'anonymousUser'),(13,1698562473764,NULL,NULL,'anonymousUser'),(14,1698562914886,NULL,NULL,'anonymousUser'),(15,1698563142630,NULL,NULL,'anonymousUser'),(16,1698563177013,NULL,NULL,'anonymousUser'),(17,1698563656352,NULL,NULL,'anonymousUser'),(18,1698563882211,NULL,NULL,'anonymousUser'),(20,1698603414534,NULL,NULL,'anonymousUser'),(22,1698603851151,NULL,NULL,'anonymousUser'),(23,1698603958788,NULL,NULL,'anonymousUser'),(24,1698604227722,NULL,NULL,'anonymousUser'),(25,1698606097191,NULL,NULL,'anonymousUser'),(26,1698712680510,NULL,NULL,'anonymousUser'),(27,1698712737544,NULL,NULL,'anonymousUser'),(28,1698963155614,NULL,NULL,'anonymousUser'),(29,1698963409625,NULL,NULL,'anonymousUser'),(30,1700116793243,NULL,NULL,'anonymousUser'),(31,1700116926826,NULL,NULL,'anonymousUser'),(32,1700117025789,NULL,NULL,'anonymousUser'),(33,1700117071035,NULL,NULL,'anonymousUser'),(34,1700117120898,NULL,NULL,'anonymousUser'),(35,1700117148268,NULL,NULL,'anonymousUser'),(36,1700117168448,NULL,NULL,'anonymousUser'),(37,1700117180876,NULL,NULL,'anonymousUser'),(38,1700117261937,NULL,NULL,'anonymousUser'),(39,1700117294947,NULL,NULL,'anonymousUser'),(40,1700117302825,NULL,NULL,'anonymousUser'),(41,1700117326726,NULL,NULL,'anonymousUser'),(42,1700117344627,NULL,NULL,'anonymousUser'),(43,1700117416279,NULL,NULL,'anonymousUser'),(44,1700117428670,NULL,NULL,'anonymousUser'),(45,1700117470791,NULL,NULL,'anonymousUser'),(46,1700117492547,NULL,NULL,'anonymousUser'),(47,1700117522761,NULL,NULL,'anonymousUser'),(48,1700117563215,NULL,NULL,'anonymousUser'),(49,1700117593736,NULL,NULL,'anonymousUser'),(50,1700117616821,NULL,NULL,'anonymousUser'),(51,1700117632171,NULL,NULL,'anonymousUser'),(52,1700117658118,NULL,NULL,'anonymousUser'),(53,1700117669136,NULL,NULL,'anonymousUser'),(54,1700118227319,NULL,NULL,'anonymousUser'),(55,1700118256629,'phucaone@gmail.com',3,'phucaone@gmail.com'),(56,1700176312397,'phucaone@gmail.com',3,'phucaone@gmail.com');
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
INSERT INTO `profile` VALUES ('USER_PROFILE',3,1,NULL),('USER_PROFILE',7,5,NULL),('USER_PROFILE',21,19,NULL);
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
INSERT INTO `user` VALUES (1,'2023-10-28 23:07:00.006000',NULL,_binary '\0','kvngo@tedkvn.com',_binary '\0','Kevin','Kevin Ngo',_binary '',_binary '\0','Ngo',_binary '\0','$2a$10$L7aUdzSi1/QlXpG9orOfhuSOM7hopmIy0z71rhFvpPs1VttAxm8P.',NULL,_binary '\0','GOOGLE','CLASSIC','ACTIVATED','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4','2023-11-16 23:11:52.395000','Kevin Ngo',NULL,_binary '\0',NULL,NULL),(5,'2023-10-29 00:08:49.063000',NULL,_binary '\0','phucaone@gmail.com',_binary '\0','',' ',_binary '',_binary '\0','',_binary '\0','$2a$10$2jeO9e8wpH9p8ZoO2cncfOrOBMMz6wt5AS5283.nhmlxk7OTzPgpq',NULL,_binary '\0','THAINOW','CLASSIC','ACTIVATED','30c9ffde-2dc1-431b-bab2-16aaac17aa95','2023-11-16 07:04:16.627000','phucaone@gmail.com',NULL,_binary '\0',NULL,NULL),(19,'2023-10-29 18:16:54.530000',NULL,_binary '\0','kevinngo4293@gmail.com',_binary '\0','',' ',_binary '\0',_binary '\0','',_binary '\0','$2a$10$l.ZVSEg6Hr7N3nCArtCOu..byeTS/MsXZblQxmunve57AHESW1mly','6268773058',_binary '\0','FACEBOOK','CLASSIC','ACTIVATED','7562f5ba-f43f-42a2-b8e3-f1a00b66314f','2023-10-29 19:01:37.188000','Kevin Ngo',NULL,_binary '\0',NULL,NULL);
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
INSERT INTO `user_aud` VALUES (1,2,0,'2023-10-28 23:07:00.006000',_binary '',NULL,_binary '\0',_binary '\0',_binary '','kvngo@tedkvn.com',_binary '',_binary '\0',_binary '','Kevin',_binary '','Kevin Ngo',_binary '',_binary '',_binary '',_binary '\0',_binary '','Ngo',_binary '',_binary '\0',_binary '','$2a$10$/TopT6a.wmg5q812R3EdVeCuSJS9QZf8evPVHYMJ9uT9FWdldnl32',_binary '',NULL,_binary '\0',_binary '\0',_binary '','GOOGLE',_binary '','CLASSIC',_binary '','ACTIVATED',_binary '','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '','2023-10-28 23:07:00.006000',_binary '','Kevin Ngo',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary ''),(1,4,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$SzwZh1Ij3PeD45hguiyAGe0SnN3gpfiDLkDeckwnwl.pHK45iJI22',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-28 23:20:16.770000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(1,10,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$SVxOhodQXwzC30kSgXOO7.uYdM7aA.PvWYsAM7OotV05Bh915LWMe',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-29 06:25:08.466000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(1,11,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$tlW8QDiSdYGa4wT.RlsF4ew7xNVIM.5YYaseK7RJedj9rdeOCPFFa',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-29 06:46:23.155000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(1,12,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$2Vloptla.qFmK.KOzPEF4.ocqsvZHH1JuVZL1RT.WxYOkHz25wc2m',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-29 06:53:40.637000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(1,13,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$o76fyAh.puS7Azl7WLttMOWQf78DeeljCf4S78heebUunNTwxOErm',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-29 06:54:33.762000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(1,15,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$A1wSOjZvvr.kdHD22.RLieiTm0QQlmitupw/q5Eb6nA0aP/PtYEfC',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-29 07:05:42.628000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(1,16,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$nKgcbpy3SqxcI7ECahOl1.tQtXYt6XBEzZi7jRwC9zf6Exx9nxeKS',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-29 07:06:17.010000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(1,17,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$gisFW5cnOQfSSnhc2X18fORPocJeLVqyYZ/Qnp6N8JjS602NbGwpG',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-29 07:14:16.350000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(1,18,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$m36V994v.qPIaT5mcBl11e/afZJhSo6vbA4o0ppNy4IDhgtJMzGDO',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-29 07:18:02.208000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(1,26,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$4D74m/z1nvWpODS4pjc5AevxgRg3aDbUWse6.ykRCyt.Jx0Lgqow6',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-31 00:38:00.495000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(1,27,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$RceltKTe5Ebi3L2L0DSQm.wPsL3hK4jizclnvobAW1lwltUVb0EL.',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-10-31 00:38:57.542000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(1,56,1,'2023-10-28 23:07:00.006000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kvngo@tedkvn.com',_binary '\0',_binary '\0',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Ngo',_binary '\0',_binary '\0',_binary '\0','$2a$10$L7aUdzSi1/QlXpG9orOfhuSOM7hopmIy0z71rhFvpPs1VttAxm8P.',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','44b9d1d5-1951-4e0a-ba71-3eb0ef692ec4',_binary '\0','2023-11-16 23:11:52.395000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,6,0,'2023-10-29 00:08:49.063000',_binary '',NULL,_binary '\0',_binary '\0',_binary '','phucaone@gmail.com',_binary '',_binary '\0',_binary '','',_binary '',' ',_binary '',_binary '',_binary '',_binary '\0',_binary '','',_binary '',_binary '\0',_binary '','$2a$10$r8XOExWDFtVv99bP7L6z5uihnqCfbVxRA2BFYS5TYBfYcJYZ3wIpC',_binary '',NULL,_binary '\0',_binary '\0',_binary '','APPLE',_binary '','CLASSIC',_binary '','ACTIVATED',_binary '','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '','2023-10-29 00:08:49.063000',_binary '','phucaone@gmail.com',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary ''),(5,8,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$TV7N6tjaUiVuxiY18MZ2dOshVf3g/mh262NNw3Ex6vO5MJ8jFpxXy',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','APPLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-10-29 00:09:05.534000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,9,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$6NLLAIKV1hkjz15wxNCTh.GMtQQLbdqK1aoKdJc/jwjbuuP.5fx6S',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','APPLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-10-29 00:10:24.502000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,14,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$bH6rZtdcaHqfHXli99HIp.v7W8c/K3tZ6Q5FobEVYFpfLSfIhQLCG',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','APPLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-10-29 07:01:54.882000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,28,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$2I1TXdzU3bc68XopwMB14eeHhEllLVygxafMzePxyznG5ui6x3D56',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','LINE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-02 22:12:35.601000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,29,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$8xhU2o/.0YsOE2/Uo6adeOoeW9PadOVfssolqQYthjWaOFQ1NZtD.',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','LINE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-02 22:16:49.622000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,30,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$FDoP65lzRCIDs1rcWmpf/O8499LoFNSlvlS5HHjoAS1ddEr8YjP8y',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:39:53.221000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,31,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$aTv3kxtmn8R6DdUO6VrKCOlUv.G8M5.q9J2PAW.FjVNZUDz10CGBG',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:42:06.825000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,32,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$v99qRobgf7/3TUmoTIceme3NEtRG145n7bjN16D2oq/AoD8JSvrw6',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:43:45.788000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,33,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$3jc2CYtTnTKYEw2WQgZrvO8ECVcRzv8t.HxzwvZOApMtrTHTX79sW',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:44:31.034000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,34,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$naD/C0fgZRwXBDGrXgIvQ.rkaSpebtUkwan1.tsuhXsgq3S050yyG',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:45:20.897000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,35,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$bftfE1lxV.hFGFfoqiVyA.wdHI62hSl7uhihEB4Kt4FC7nQnNHGfG',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:45:48.266000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,36,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$tcxGBDkA15TCLHZU/mH4xuarxkynTW4Nk/tBChj.2aJd0xqtrIJQG',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:46:08.445000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,37,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$J55V.T6VSZqw/lIfgAW/o.CCZtqzIg6FSP6r9KwFJSVVqd1YfWkiG',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:46:20.874000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,38,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$YGli4oyCH0Ei/RhfwRVum.YfdqQCY9UCYKlmMPNfVDFP6rk1nKFKK',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:47:41.935000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,39,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$ko7pKPJVPIEVQ1jQl12Gi.WcIGJDsuBxmhnUp0AqUR8mMuawhMWry',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:48:14.945000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,40,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$zQv.i6poZz6rkEJlU8PANuHgYvzIigvItGU46Ff0xmuLxBs/ZMA4m',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:48:22.824000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,41,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$ZjkuVFZDKa1AvMCI9nfR4uzHLRutmsdureibcG3/1p7cYXbDWYeEK',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:48:46.725000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,42,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$Lc0II8H6VQW7R0gJ5kskz.xv6LIV1NaK9HRnMU4Gs3tFhLQ5aOOs6',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:49:04.625000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,43,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$F0MNAxSgyTWNQoKTkrsHuOfwsBYV.qjy9Jc2NgapXwacSk4XJMcPm',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:50:16.278000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,44,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$0nL76YlC8Jatyvld/wWmNeGTg9/KsVDG56C7wUw95D66vYRy7QeF.',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:50:28.669000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,45,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$/97eWQ6VOaBPDCNh3Y.yU.GgesFLClp/KYYX0Rr0fDO3KK6xc8uX6',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:51:10.788000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,46,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$QhBHXgv.zdqZ36xNbRmzlOKBdEVS.g4Uv7HXVy3l6WnsfClYIvqNq',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:51:32.546000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,47,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$i/AsOASjrqzdLI2iCCAw6u/Yto8QtG26k1vqLGIQqQNZEXfMgw3ru',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:52:02.760000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,48,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$LgixyAHZkV4eeAtzZnZZhOWZHgdtF//UEYb.PbDocYWlkYIrqE00G',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:52:43.213000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,49,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$8dCeYzDOhCAPzvy/JQjP4u7R9FGo0dn4EFVahO3KRPetIl21GfD9C',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:53:13.735000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,50,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$UVC5Tn3rTV0EvnYfaiV3SOMij.x4m9ae0BnuASzldqRrZ7qKKGOgm',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:53:36.820000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,51,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$keQ.1DhxrU9KsaGoglpzSOoxlal0uUSxiL5TQWrqlR3baq1WQLmYO',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:53:52.170000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,52,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$7O24G4wHxujybzc1t1hd3evQT5fev1wgltIP0wfeBADgxjchKdsaW',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:54:18.116000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,53,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$iWICao97pRO5eXyLcc05KukYZW.pPp.QO6.VMf.WlF5Y7EvzPItCS',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 06:54:29.135000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,54,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$Ogbmtx9bxTROl8hs5po3mObVXe7Ef2FNX55hUy/UcGrTJSTnDC.72',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 07:03:47.317000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,55,1,'2023-10-29 00:08:49.063000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','phucaone@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$2jeO9e8wpH9p8ZoO2cncfOrOBMMz6wt5AS5283.nhmlxk7OTzPgpq',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','THAINOW',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','30c9ffde-2dc1-431b-bab2-16aaac17aa95',_binary '\0','2023-11-16 07:04:16.627000',_binary '','phucaone@gmail.com',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(19,20,0,'2023-10-29 18:16:54.530000',_binary '',NULL,_binary '\0',_binary '\0',_binary '','kevinngo4293@gmail.com',_binary '',_binary '\0',_binary '','',_binary '',' ',_binary '',_binary '\0',_binary '',_binary '\0',_binary '','',_binary '',_binary '\0',_binary '','$2a$10$U7X5x2K8uWFpadX7fRW13enUv5EvZssdYnkDRLZezHpORf/OIrqdi',_binary '',NULL,_binary '\0',_binary '\0',_binary '','FACEBOOK',_binary '','CLASSIC',_binary '','ACTIVATED',_binary '','7562f5ba-f43f-42a2-b8e3-f1a00b66314f',_binary '','2023-10-29 18:16:54.530000',_binary '','Kevin Ngo',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0',NULL,_binary '\0',_binary '',_binary ''),(19,22,1,'2023-10-29 18:16:54.530000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kevinngo4293@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$19w6QVMfFk1yf./75v8yGu8LwS/J.n1MX89xSckidJXpsPSc4BGay',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','FACEBOOK',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','7562f5ba-f43f-42a2-b8e3-f1a00b66314f',_binary '\0','2023-10-29 18:24:11.149000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(19,23,1,'2023-10-29 18:16:54.530000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kevinngo4293@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$ou1yYzq4P5i3NTORIjGUX.NxNeA5/f7qAl9nQL21oY.2TwQUBWwj.',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','FACEBOOK',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','7562f5ba-f43f-42a2-b8e3-f1a00b66314f',_binary '\0','2023-10-29 18:25:58.785000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(19,24,1,'2023-10-29 18:16:54.530000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kevinngo4293@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$rFqJuM9qKfnFST16usS6MedpebX27BhuY247pgbDZBTLU6Gls.jZO',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','FACEBOOK',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','7562f5ba-f43f-42a2-b8e3-f1a00b66314f',_binary '\0','2023-10-29 18:30:27.718000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(19,25,1,'2023-10-29 18:16:54.530000',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','kevinngo4293@gmail.com',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','',_binary '\0',_binary '\0',_binary '\0','$2a$10$l.ZVSEg6Hr7N3nCArtCOu..byeTS/MsXZblQxmunve57AHESW1mly',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0','FACEBOOK',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','7562f5ba-f43f-42a2-b8e3-f1a00b66314f',_binary '\0','2023-10-29 19:01:37.188000',_binary '','Kevin Ngo',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0');
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

-- Dump completed on 2023-11-23 14:45:25
