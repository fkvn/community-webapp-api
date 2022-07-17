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
INSERT INTO `company` VALUES (112,'Owner','2022-07-16 00:59:23.932000','','',NULL,'','Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','Kevin Test Shop','','','','REGISTERED','2022-07-16 00:59:23.932000',NULL,0,110,111,118),(113,'Owner','2022-07-16 01:01:47.990000','','',NULL,'','Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','Kevin Test Shop','','','','PENDING','2022-07-16 01:01:47.990000',NULL,0,110,111,118),(114,'Owner','2022-07-16 01:02:34.214000','','',NULL,'','Aquarium & Pet',_binary '\0',_binary '\0',_binary '\0','Kevin Test Shop','','','','PENDING','2022-07-16 01:02:34.214000',NULL,0,110,111,118);
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
INSERT INTO `hibernate_sequence` VALUES (183);
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
INSERT INTO `storage` VALUES (35,'2022-05-22 00:58:34.646000','f01a55de-c66e-4937-9050-6a2e34152c1d.png',47990,'image/png','2022-05-22 00:58:34.646000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff01a55de-c66e-4937-9050-6a2e34152c1d.png?alt=media'),(66,'2022-06-15 22:35:44.787000','79433c58-7b7e-4789-b497-7566989ed02b.png',91555,'image/png','2022-06-15 22:35:44.787000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F79433c58-7b7e-4789-b497-7566989ed02b.png?alt=media'),(115,'2022-07-16 23:48:58.580000','ab4e499e-52c3-4c5b-ad7b-71ed9083df1c.png',62895,'image/png','2022-07-16 23:48:58.580000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fab4e499e-52c3-4c5b-ad7b-71ed9083df1c.png?alt=media'),(118,'2022-07-17 00:39:31.090000','d60cc73a-2a54-4882-bf03-1efcb9498517.png',89748,'image/png','2022-07-17 00:39:31.090000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd60cc73a-2a54-4882-bf03-1efcb9498517.png?alt=media'),(119,'2022-07-17 00:39:31.098000','f9ef2c94-3801-4261-82ba-9456ebb14c4a.png',62895,'image/png','2022-07-17 00:39:31.098000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff9ef2c94-3801-4261-82ba-9456ebb14c4a.png?alt=media'),(120,'2022-07-17 00:39:31.105000','9d715108-74ed-4bf9-9760-647b45e1b13f.png',129359,'image/png','2022-07-17 00:39:31.105000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9d715108-74ed-4bf9-9760-647b45e1b13f.png?alt=media'),(121,'2022-07-17 00:39:31.109000','9a2978ab-1dcb-4124-9089-3b364060bc8c.png',143980,'image/png','2022-07-17 00:39:31.109000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9a2978ab-1dcb-4124-9089-3b364060bc8c.png?alt=media'),(122,'2022-07-17 00:39:31.114000','d34262c9-fc83-443d-a0db-b41ce91e80b9.png',74938,'image/png','2022-07-17 00:39:31.114000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd34262c9-fc83-443d-a0db-b41ce91e80b9.png?alt=media'),(123,'2022-07-17 00:39:31.119000','1a35a7e4-55de-4096-b607-2f90b6bbdf22.png',62291,'image/png','2022-07-17 00:39:31.119000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F1a35a7e4-55de-4096-b607-2f90b6bbdf22.png?alt=media'),(124,'2022-07-17 00:39:31.124000','60ddf136-79d3-4c85-9121-41ef66ab0340.png',76634,'image/png','2022-07-17 00:39:31.124000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F60ddf136-79d3-4c85-9121-41ef66ab0340.png?alt=media'),(125,'2022-07-17 00:39:31.128000','671093ab-f907-437b-8354-5dace210d0d2.png',109517,'image/png','2022-07-17 00:39:31.128000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F671093ab-f907-437b-8354-5dace210d0d2.png?alt=media'),(126,'2022-07-17 00:39:31.131000','45fc3176-4950-42b2-87d0-306308c29aa7.png',67126,'image/png','2022-07-17 00:39:31.131000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F45fc3176-4950-42b2-87d0-306308c29aa7.png?alt=media'),(127,'2022-07-17 00:39:31.137000','74ab22b5-89ef-4db4-9f64-bac56784b6f6.png',111233,'image/png','2022-07-17 00:39:31.137000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F74ab22b5-89ef-4db4-9f64-bac56784b6f6.png?alt=media'),(128,'2022-07-17 00:39:31.142000','c1159a90-d107-4902-b0ff-18debfd702f0.png',91133,'image/png','2022-07-17 00:39:31.142000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc1159a90-d107-4902-b0ff-18debfd702f0.png?alt=media'),(129,'2022-07-17 00:39:31.146000','e6de3d71-6ea3-4586-9c4d-f8a27ea50234.png',128911,'image/png','2022-07-17 00:39:31.146000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe6de3d71-6ea3-4586-9c4d-f8a27ea50234.png?alt=media'),(130,'2022-07-17 00:39:31.151000','e182b882-a546-48a2-99b1-9a49993e51da.png',81416,'image/png','2022-07-17 00:39:31.151000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe182b882-a546-48a2-99b1-9a49993e51da.png?alt=media'),(131,'2022-07-17 00:39:31.156000','d3120b1b-5cb2-4fb6-a128-5df68599b3b3.png',70971,'image/png','2022-07-17 00:39:31.156000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd3120b1b-5cb2-4fb6-a128-5df68599b3b3.png?alt=media'),(132,'2022-07-17 00:39:31.161000','254d64b0-2df7-420b-98ca-170332798ca6.png',56096,'image/png','2022-07-17 00:39:31.161000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F254d64b0-2df7-420b-98ca-170332798ca6.png?alt=media'),(133,'2022-07-17 00:39:31.165000','be3a4b30-0901-4139-9619-67b24d07a808.png',93380,'image/png','2022-07-17 00:39:31.165000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fbe3a4b30-0901-4139-9619-67b24d07a808.png?alt=media'),(134,'2022-07-17 00:39:31.170000','0ced9196-d49c-4961-87bc-b3611cbff538.png',109439,'image/png','2022-07-17 00:39:31.170000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F0ced9196-d49c-4961-87bc-b3611cbff538.png?alt=media'),(135,'2022-07-17 00:39:31.174000','de8fe37a-39a3-4766-9535-d57f8070464d.png',31809,'image/png','2022-07-17 00:39:31.174000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fde8fe37a-39a3-4766-9535-d57f8070464d.png?alt=media'),(136,'2022-07-17 00:39:31.179000','736b21b3-dc0a-4ece-b6e5-8094b5c65852.png',62291,'image/png','2022-07-17 00:39:31.179000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F736b21b3-dc0a-4ece-b6e5-8094b5c65852.png?alt=media'),(137,'2022-07-17 00:39:31.185000','9fc91fda-a5fd-42ac-821f-1e047d0c6a8b.png',36283,'image/png','2022-07-17 00:39:31.185000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9fc91fda-a5fd-42ac-821f-1e047d0c6a8b.png?alt=media'),(138,'2022-07-17 00:39:31.190000','74353b6d-bf38-4028-aae0-15afe1823e64.png',120439,'image/png','2022-07-17 00:39:31.190000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F74353b6d-bf38-4028-aae0-15afe1823e64.png?alt=media'),(139,'2022-07-17 00:39:31.194000','c8cbeef8-ee7b-46dc-b21f-eeb70b8294b1.png',36301,'image/png','2022-07-17 00:39:31.194000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc8cbeef8-ee7b-46dc-b21f-eeb70b8294b1.png?alt=media'),(140,'2022-07-17 00:39:31.199000','5488eaf3-84f5-45db-987a-71d3f11f929e.png',72654,'image/png','2022-07-17 00:39:31.199000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F5488eaf3-84f5-45db-987a-71d3f11f929e.png?alt=media'),(141,'2022-07-17 00:39:31.204000','d12c7177-a12a-4f6a-9e0b-aecee5d35d06.png',48843,'image/png','2022-07-17 00:39:31.204000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd12c7177-a12a-4f6a-9e0b-aecee5d35d06.png?alt=media'),(142,'2022-07-17 00:39:31.208000','413d21c2-2788-4d9c-b3d1-0a69b1ad4a57.png',48911,'image/png','2022-07-17 00:39:31.208000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F413d21c2-2788-4d9c-b3d1-0a69b1ad4a57.png?alt=media'),(143,'2022-07-17 00:39:31.212000','97270b94-bf51-4c10-8718-626dddfffe02.png',70515,'image/png','2022-07-17 00:39:31.212000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F97270b94-bf51-4c10-8718-626dddfffe02.png?alt=media'),(144,'2022-07-17 00:39:31.217000','9881bca6-00fc-4b62-97f1-ac2b01569116.png',76028,'image/png','2022-07-17 00:39:31.217000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9881bca6-00fc-4b62-97f1-ac2b01569116.png?alt=media'),(145,'2022-07-17 00:39:31.224000','098281b8-bdd2-4c49-8468-e13fd7329c0b.png',93380,'image/png','2022-07-17 00:39:31.224000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F098281b8-bdd2-4c49-8468-e13fd7329c0b.png?alt=media'),(146,'2022-07-17 00:39:31.227000','62fbe55f-ddbe-4897-8d4d-4b28b97b0f47.png',50419,'image/png','2022-07-17 00:39:31.227000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F62fbe55f-ddbe-4897-8d4d-4b28b97b0f47.png?alt=media'),(147,'2022-07-17 00:39:31.231000','8c0310e0-66ed-451a-b3d0-186c617d8a84.png',111089,'image/png','2022-07-17 00:39:31.231000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F8c0310e0-66ed-451a-b3d0-186c617d8a84.png?alt=media'),(148,'2022-07-17 00:39:31.237000','95797be0-e831-4d96-860b-1815108b0422.png',44314,'image/png','2022-07-17 00:39:31.237000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F95797be0-e831-4d96-860b-1815108b0422.png?alt=media'),(149,'2022-07-17 00:39:31.242000','d600ef3a-ba88-495b-8139-02c34399cd53.png',95381,'image/png','2022-07-17 00:39:31.242000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fd600ef3a-ba88-495b-8139-02c34399cd53.png?alt=media'),(150,'2022-07-17 00:39:31.246000','b9a318cb-f032-4083-ab4e-eae2f275633c.png',64528,'image/png','2022-07-17 00:39:31.246000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fb9a318cb-f032-4083-ab4e-eae2f275633c.png?alt=media'),(151,'2022-07-17 00:39:31.252000','8913e262-82ee-49bb-ad40-aed1bfd828a4.png',84184,'image/png','2022-07-17 00:39:31.252000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F8913e262-82ee-49bb-ad40-aed1bfd828a4.png?alt=media'),(152,'2022-07-17 00:39:31.257000','b1cda82f-05e4-4a9a-b98d-f45ddd0d6f4c.png',45676,'image/png','2022-07-17 00:39:31.257000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fb1cda82f-05e4-4a9a-b98d-f45ddd0d6f4c.png?alt=media'),(153,'2022-07-17 00:39:31.262000','e4c0aab2-79ae-4301-bc8b-d3a6a643970b.png',90514,'image/png','2022-07-17 00:39:31.262000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe4c0aab2-79ae-4301-bc8b-d3a6a643970b.png?alt=media'),(154,'2022-07-17 00:39:31.266000','52652253-f065-46bd-aa1c-9e188cd6bc1d.png',46874,'image/png','2022-07-17 00:39:31.266000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F52652253-f065-46bd-aa1c-9e188cd6bc1d.png?alt=media'),(155,'2022-07-17 00:39:31.271000','e9266193-741b-4e2b-80a0-138c43a11a0c.png',68943,'image/png','2022-07-17 00:39:31.271000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe9266193-741b-4e2b-80a0-138c43a11a0c.png?alt=media'),(156,'2022-07-17 00:39:31.276000','77465aed-65e1-45ed-b663-1c1ba999f31b.png',53772,'image/png','2022-07-17 00:39:31.276000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F77465aed-65e1-45ed-b663-1c1ba999f31b.png?alt=media'),(157,'2022-07-17 00:39:31.280000','e452a54e-4e66-474b-8449-1f2fd8016322.png',65975,'image/png','2022-07-17 00:39:31.280000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe452a54e-4e66-474b-8449-1f2fd8016322.png?alt=media'),(158,'2022-07-17 00:39:31.285000','e7f28680-b923-43b3-af7f-352a191f05dc.png',145748,'image/png','2022-07-17 00:39:31.285000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fe7f28680-b923-43b3-af7f-352a191f05dc.png?alt=media'),(159,'2022-07-17 00:39:31.290000','1337652c-df0e-4516-b0af-9c2ec8f5c1d9.png',55918,'image/png','2022-07-17 00:39:31.290000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F1337652c-df0e-4516-b0af-9c2ec8f5c1d9.png?alt=media'),(160,'2022-07-17 00:39:31.294000','4e061664-896e-4cad-a962-8067175035f2.png',27270,'image/png','2022-07-17 00:39:31.294000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F4e061664-896e-4cad-a962-8067175035f2.png?alt=media'),(161,'2022-07-17 00:39:31.299000','35949338-3102-4883-a1ab-c1d2930d20e7.png',45517,'image/png','2022-07-17 00:39:31.299000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F35949338-3102-4883-a1ab-c1d2930d20e7.png?alt=media'),(162,'2022-07-17 00:39:31.304000','5659ea66-13cd-449e-b133-d1213a49face.png',92540,'image/png','2022-07-17 00:39:31.304000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F5659ea66-13cd-449e-b133-d1213a49face.png?alt=media'),(163,'2022-07-17 00:39:31.307000','f7a16180-5a12-406b-a3df-b7af4f81aa58.png',113673,'image/png','2022-07-17 00:39:31.307000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff7a16180-5a12-406b-a3df-b7af4f81aa58.png?alt=media'),(164,'2022-07-17 00:39:31.311000','6e1187ac-283d-4564-87ee-2812d341e9fa.png',48076,'image/png','2022-07-17 00:39:31.311000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F6e1187ac-283d-4564-87ee-2812d341e9fa.png?alt=media'),(165,'2022-07-17 00:39:31.315000','92627e4f-e784-4b93-bc4e-848b0af3d892.png',50496,'image/png','2022-07-17 00:39:31.315000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F92627e4f-e784-4b93-bc4e-848b0af3d892.png?alt=media'),(166,'2022-07-17 00:39:31.320000','64c0350f-49f5-4db9-9d29-765e44d16ab3.png',26981,'image/png','2022-07-17 00:39:31.320000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F64c0350f-49f5-4db9-9d29-765e44d16ab3.png?alt=media'),(167,'2022-07-17 00:39:31.324000','7a4ae955-bbeb-4e0e-963e-a58b39d9b2e8.png',80205,'image/png','2022-07-17 00:39:31.324000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F7a4ae955-bbeb-4e0e-963e-a58b39d9b2e8.png?alt=media'),(168,'2022-07-17 00:39:31.329000','3be6f411-8443-4f4c-8880-62b973fcb41a.png',37782,'image/png','2022-07-17 00:39:31.329000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F3be6f411-8443-4f4c-8880-62b973fcb41a.png?alt=media'),(169,'2022-07-17 00:39:31.334000','deeeaa80-77df-47be-933f-62e69ce32d2b.png',101294,'image/png','2022-07-17 00:39:31.334000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fdeeeaa80-77df-47be-933f-62e69ce32d2b.png?alt=media'),(170,'2022-07-17 00:39:31.338000','9e36c7a2-e264-4df1-a49d-96afb6e5cc87.png',117942,'image/png','2022-07-17 00:39:31.338000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9e36c7a2-e264-4df1-a49d-96afb6e5cc87.png?alt=media'),(171,'2022-07-17 00:39:31.342000','f9e04a73-d888-45cf-a478-f67351df187b.png',64004,'image/png','2022-07-17 00:39:31.342000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff9e04a73-d888-45cf-a478-f67351df187b.png?alt=media'),(172,'2022-07-17 00:39:31.346000','9f207f5c-06ff-4c9c-b8d2-e9520e328bda.png',35201,'image/png','2022-07-17 00:39:31.346000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F9f207f5c-06ff-4c9c-b8d2-e9520e328bda.png?alt=media'),(173,'2022-07-17 00:39:31.351000','7acd0673-c4bb-4ffd-aa1b-a2933e3f816d.png',62291,'image/png','2022-07-17 00:39:31.351000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F7acd0673-c4bb-4ffd-aa1b-a2933e3f816d.png?alt=media'),(174,'2022-07-17 00:39:31.355000','43f48ed2-2638-4a26-b49c-ac546b7ca029.png',47791,'image/png','2022-07-17 00:39:31.355000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F43f48ed2-2638-4a26-b49c-ac546b7ca029.png?alt=media'),(175,'2022-07-17 00:39:31.359000','7615532b-15c8-42ce-af5d-18c1cddcacc7.png',48253,'image/png','2022-07-17 00:39:31.359000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F7615532b-15c8-42ce-af5d-18c1cddcacc7.png?alt=media'),(176,'2022-07-17 00:39:31.365000','a9233608-2958-4aff-aa78-0d327fa99667.png',63393,'image/png','2022-07-17 00:39:31.365000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa9233608-2958-4aff-aa78-0d327fa99667.png?alt=media'),(177,'2022-07-17 00:39:31.370000','5585fb4a-e2fd-4b22-a7c9-49e310b3c9a8.png',67551,'image/png','2022-07-17 00:39:31.370000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F5585fb4a-e2fd-4b22-a7c9-49e310b3c9a8.png?alt=media'),(178,'2022-07-17 00:39:31.374000','482ee9b2-5b1c-4b3c-99e7-198d6d96455f.png',111746,'image/png','2022-07-17 00:39:31.374000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F482ee9b2-5b1c-4b3c-99e7-198d6d96455f.png?alt=media'),(179,'2022-07-17 00:39:31.378000','2ae1b1ff-14cf-4cd8-a5a3-6a30fd2dc0a7.png',39817,'image/png','2022-07-17 00:39:31.378000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F2ae1b1ff-14cf-4cd8-a5a3-6a30fd2dc0a7.png?alt=media'),(180,'2022-07-17 00:45:05.396000','72dfd645-9c24-4990-b1f3-eb72c1188c7a.png',62291,'image/png','2022-07-17 00:45:05.396000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F72dfd645-9c24-4990-b1f3-eb72c1188c7a.png?alt=media'),(181,'2022-07-17 00:47:17.019000','0817531b-7c27-4a11-ae0a-c56b3d99abfd.png',90514,'image/png','2022-07-17 00:47:17.019000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F0817531b-7c27-4a11-ae0a-c56b3d99abfd.png?alt=media'),(182,'2022-07-17 00:58:23.559000','0817531b-7c27-4a11-ae0a-c56b3d99abfd.png',90514,'image/png','2022-07-17 00:58:23.559000','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F0817531b-7c27-4a11-ae0a-c56b3d99abfd.png?alt=media');
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
INSERT INTO `user` VALUES ('User',110,'2022-07-16 00:57:45.334000','','',' ',_binary '\0',_binary '\0',_binary '\0',_binary '\0','','$2a$10$8p2dyqcr4LwfHOanaPEE1uiqckrp62NPI.v/btHN2qEYkrCG4E3cC','(626) 877-3222','BUSINESS','ACTIVATED','a9afcbf9-0843-45c2-a9b6-635a25f5d129','2022-07-16 00:59:24.111000','Kevin Ngo',NULL,181);
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

-- Dump completed on 2022-07-16 22:08:39
