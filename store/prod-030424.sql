CREATE DATABASE  IF NOT EXISTS `thainow-mono` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `thainow-mono`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: 34.134.70.39    Database: thainow-mono-dev
-- ------------------------------------------------------
-- Server version	8.0.35

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
  `guidebook_banner_url` varchar(255) DEFAULT NULL,
  `guidebook_category` varchar(255) DEFAULT NULL,
  `guidebook_content` longtext,
  `guidebook_created_on` datetime(6) DEFAULT NULL,
  `guidebook_description` longtext,
  `guidebook_title` varchar(255) DEFAULT NULL,
  `guidebook_updated_on` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guide_book`
--

LOCK TABLES `guide_book` WRITE;
/*!40000 ALTER TABLE `guide_book` DISABLE KEYS */;
INSERT INTO `guide_book` VALUES (69,'https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F80fbea03-b5ac-45bc-b0e3-c878866d523b.jpg?alt=media','BASIC_LIVING',NULL,'2024-02-15 00:01:10.258868','<p>จะปีไหนๆ ก็ยังน่าไปเสมอ <span data-name=\"heart\" data-type=\"emoji\">❤</span> </p><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg xo1l8bm\" href=\"https://www.facebook.com/hashtag/valentine?__eep__=6&amp;__cft__[0]=AZWkrVReKbSixUZ9p5x6yKuJimSSTZLvWgfaK7Sf8VJfnegXZgqQRf1fqdS4oOKTk6lNgd2IL2FceynVcRsEUCjyKrr280fFuwU07C80v9kArQmOz3uWnlZVjdkJ0ru6qxDa68M0EdoKjwkWEeoe0qr9kqkHxqgwk8SXjWgfh-oFZw4x8P9CXOGAhCCfyE4ONmgXWvF1qYnPJMzvwfIQYbcs&amp;__tn__=*NK-R\">#valentine</a> <a target=\"_blank\" rel=\"noopener noreferrer nofollow\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg xo1l8bm\" href=\"https://www.facebook.com/hashtag/%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%A7%E0%B8%B2%E0%B9%80%E0%B8%A5%E0%B8%99%E0%B9%84%E0%B8%97%E0%B8%99%E0%B9%8C?__eep__=6&amp;__cft__[0]=AZWkrVReKbSixUZ9p5x6yKuJimSSTZLvWgfaK7Sf8VJfnegXZgqQRf1fqdS4oOKTk6lNgd2IL2FceynVcRsEUCjyKrr280fFuwU07C80v9kArQmOz3uWnlZVjdkJ0ru6qxDa68M0EdoKjwkWEeoe0qr9kqkHxqgwk8SXjWgfh-oFZw4x8P9CXOGAhCCfyE4ONmgXWvF1qYnPJMzvwfIQYbcs&amp;__tn__=*NK-R\">#วันวาเลนไทน์</a> <a target=\"_blank\" rel=\"noopener noreferrer nofollow\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg xo1l8bm\" href=\"https://www.facebook.com/hashtag/%E0%B8%A7%E0%B8%B2%E0%B9%80%E0%B8%A5%E0%B8%99%E0%B9%84%E0%B8%97%E0%B8%99%E0%B9%8C?__eep__=6&amp;__cft__[0]=AZWkrVReKbSixUZ9p5x6yKuJimSSTZLvWgfaK7Sf8VJfnegXZgqQRf1fqdS4oOKTk6lNgd2IL2FceynVcRsEUCjyKrr280fFuwU07C80v9kArQmOz3uWnlZVjdkJ0ru6qxDa68M0EdoKjwkWEeoe0qr9kqkHxqgwk8SXjWgfh-oFZw4x8P9CXOGAhCCfyE4ONmgXWvF1qYnPJMzvwfIQYbcs&amp;__tn__=*NK-R\">#วาเลนไทน์</a></p><img src=\"https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc6891def-c767-4f19-b36f-85a2f44503a9.jpg?alt=media\"><h2>Dockside Boat &amp; Bed</h2><p>ถ้าเบื่อจะเปิดห้องในโรงแรมแล้วละก็...ลองเปิดห้องในเรือยอร์ชกันหน่อยมั้ยหละ Dockside Boat &amp; Bed จะให้ประสบการณ์นอนบนเรือแบบไม่ต้องออกไปไกลฝั่ง แต่ได้ดื่มด่ำบรรยากาศทะเลแบบไม่แพ้กันเลยทีเดียว รับรองได้ว่าค่ำคืนนั้นจะแปลกใหม่ไม่ซ้ำใครแน่นอน&nbsp;<br>โทร : (562) 436-3111<br><br>ขอบคุณภาพจาก&nbsp;&nbsp;<a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"http://boatandbed.com\">boatandbed.com</a></p><hr><img src=\"https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff5615ffc-5d36-4061-9183-429807582a65.jpg?alt=media\"><h2>Palisades Village&nbsp;</h2><p>สถานที่พาแฟนไป ช็อป ชิว กิน เที่ยว แบบ All in One ไม่ไกลจาก Santa Monica คนโสดก็ไปชิวได้ ไม่แน่...อาจจะปุ๊บปั๊บปิ๊งๆคนแถวนั้นก็ได้น้า<br><br>เวลาทำการ<br>Mon – Sat 11:00 AM – 7:00 PM<br>Sun 11:00 AM – 6:00 PM<br>ขอบคุณภาพจาก&nbsp;&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"http://palisadesvillageca.com/?fbclid=IwAR37UXtm_aGunLTOLQwGRqZVD1YKFGriqYXwSQdUSVO5cqziVJ52v8EgQCI\">palisadesvillageca.com</a></p><hr><img src=\"https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F713d13ab-bcae-45bd-bc35-140dfab45db9.jpg?alt=media\"><h2>Point Dume</h2><p>จุดชมวิวยอดฮิตในตำนาน เหมาะอย่างยิ่งสำหรับชมพระอาทิตย์ตกดินลับขอบฟ้า ที่จะตราตรึงใจคุณและเธอคนนั้นไปอีกแสนนาน (เตรียมเสื้อหนาวไปหน่อยก็ดีนะ ลมแรง และหนาวมาก เดี๋ยวจะไม่สบายเอา)<br><br>ขอบคุณภาพจาก Discover Los Angeles และ&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"http://don-schimmel-photography.com/?fbclid=IwAR13dFIWiyjOCAwyfeugIywU9-4R0vaUzS30S9oE2Uid69CrBsqAUWkLqFo\">don-schimmel-photography.com</a></p><hr><img src=\"https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff90edf77-8194-4664-ba6b-fd068d13bb4e.jpg?alt=media\"><h2>Disneyland</h2><p>ไม่ว่าจะกี่ยุคกี่สมัย ดิสนีย์แลนด์ ก็ยังเป็นสถานที่แห่งความทรงจำและความประทับใจ ไม่เคยเปลี่ยนไป ดั่งได้หลุดไปยังโลกในนิยายกับความฝันที่อะไรก็เกิดขึ้นได้ ด้วยเหตุนี้ หากไม่รู้จะพาคนรักไปไหน หรือไปเที่ยวแก้เหงาที่ไหนดี ดิสนีย์แลนด์ก็ยังคงจะเป็นคำตอบที่จะไม่ทำให้คุณผิดหวังเลย&nbsp;<br><br>ขอบคุณภาพจาก&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"http://www.discoverlosangeles.com/?fbclid=IwAR0-nUl7GZiY4mcKHGcDasXXhr4Kl7N-TTohw7u5Kv_LxI356wTwzxVias0\">www.discoverlosangeles.com</a>&nbsp;และ&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"http://majesticgardenhotel.com/?fbclid=IwAR1K3Js9UVaXmNFEmrAnJzTcgGM0VMv1G1HYWWtnS856qK6LI_vryhn5N4o\">majesticgardenhotel.com/</a></p><hr><img src=\"https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F6511c390-a211-427d-b2a7-02d56560dbdb.jpg?alt=media\"><h2>The Huntington Library, Art Collections and Botanical Gardens</h2><p>นอกจากจะมีห้องสมุด และ แกลอรี่ แล้ว ที่นี่ยังมี สวนพฤกษศาสตร์ที่กว้างขวางตระการตาด้วยหลากพืชพรรณ นานาชนิด พร้อมทั้ง สถาปัตยกรรมงามตา ที่ชวนให้เพลินตาเพลินใจเป็นอย่างมาก ไม่ว่าจะโสดหรือมีคู่ก็แนะนำให้ไปอย่างยิ่ง<br><br>เวลาทำการ<br>Wed – Mon 10:00 AM – 5:00 PM<br>หยุดทุกวันอังคาร<br><br>ขอบคุณภาพจาก&nbsp;&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"http://www.trip.com/?fbclid=IwAR0to9NbtsDdup9-1S3glP-7ut6JZICwMcbeVaxY_7x4h8Y72Vt6TA9iHaI\">www.trip.com</a>&nbsp;และ&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"http://www.huntington.org/gardens?fbclid=IwAR2tsQFMq2Yl04Ab-c_ivcfPnajn88HqUAk4hZC6n1fLcNpEPRt0WwLRNhc\">www.huntington.org/gardens</a></p><hr><img src=\"https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F54a88cc0-44a9-4de3-a0d6-27128bea919b.jpg?alt=media\"><h2>71 Above Restaurant &amp; Skylounge</h2><p>ภัตตาคารสุดหรู บนยอดตึกสูงกว่า 1,000 ที่ให้ประสบการณ์การรับประทานอาหารและเครื่องดื่มสไตล์ Modern American พร้อมๆกับวิวเมืองแอลเอ แบบ 360 องศา&nbsp;<br><br>เวลาทำการ<br>Sun - Th 5:00 PM – 9:30 PM<br>Fri - Sat 5:00 PM – 11:00 PM<br>โทร : (213) 712-2683<br><br>ขอบคุณภาพจาก&nbsp;&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"https://l.facebook.com/l.php?u=http%3A%2F%2Fgirouxglass.com%2F%3Ffbclid%3DIwAR1qwNkVkYu_iKDExORP8hg4fX-HEvHClWoJJu7jpIvI6SZCS95b-EricF4&amp;h=AT07GqYa-Ce9tP-6sGAQKxWfRcDv7Dy-auzhktEChAkMa2CzCnFZjjbKtRRj4GWODTpZBoulLlOOEIziIKt0C7fbLTJ3TgDkhHxcBDc6Upipk_qfRk1bdwTdWuTWEpYlA6-c6jkNbg&amp;__tn__=-UK*F\">girouxglass.com</a>&nbsp;และ&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"https://la.eater.com/?fbclid=IwAR0txhzY5kRkEVNuQBeDeMrqEOFT7wLgqsV0VBwatuyJNLRwruYCdYQeeiM\">la.eater.com</a></p><p></p>','Valentine\'s Day (in LA area)','2024-02-15 00:01:10.259432');
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
  `guidebook_banner_url` varchar(255) DEFAULT NULL,
  `banner_url_mod` bit(1) DEFAULT NULL,
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
INSERT INTO `guide_book_aud` VALUES (69,70,0,'https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F80fbea03-b5ac-45bc-b0e3-c878866d523b.jpg?alt=media',_binary '','BASIC_LIVING',_binary '',NULL,_binary '\0','2024-02-15 00:01:10.258868',_binary '','<p>จะปีไหนๆ ก็ยังน่าไปเสมอ <span data-name=\"heart\" data-type=\"emoji\">❤</span> </p><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg xo1l8bm\" href=\"https://www.facebook.com/hashtag/valentine?__eep__=6&amp;__cft__[0]=AZWkrVReKbSixUZ9p5x6yKuJimSSTZLvWgfaK7Sf8VJfnegXZgqQRf1fqdS4oOKTk6lNgd2IL2FceynVcRsEUCjyKrr280fFuwU07C80v9kArQmOz3uWnlZVjdkJ0ru6qxDa68M0EdoKjwkWEeoe0qr9kqkHxqgwk8SXjWgfh-oFZw4x8P9CXOGAhCCfyE4ONmgXWvF1qYnPJMzvwfIQYbcs&amp;__tn__=*NK-R\">#valentine</a> <a target=\"_blank\" rel=\"noopener noreferrer nofollow\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg xo1l8bm\" href=\"https://www.facebook.com/hashtag/%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%A7%E0%B8%B2%E0%B9%80%E0%B8%A5%E0%B8%99%E0%B9%84%E0%B8%97%E0%B8%99%E0%B9%8C?__eep__=6&amp;__cft__[0]=AZWkrVReKbSixUZ9p5x6yKuJimSSTZLvWgfaK7Sf8VJfnegXZgqQRf1fqdS4oOKTk6lNgd2IL2FceynVcRsEUCjyKrr280fFuwU07C80v9kArQmOz3uWnlZVjdkJ0ru6qxDa68M0EdoKjwkWEeoe0qr9kqkHxqgwk8SXjWgfh-oFZw4x8P9CXOGAhCCfyE4ONmgXWvF1qYnPJMzvwfIQYbcs&amp;__tn__=*NK-R\">#วันวาเลนไทน์</a> <a target=\"_blank\" rel=\"noopener noreferrer nofollow\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg xo1l8bm\" href=\"https://www.facebook.com/hashtag/%E0%B8%A7%E0%B8%B2%E0%B9%80%E0%B8%A5%E0%B8%99%E0%B9%84%E0%B8%97%E0%B8%99%E0%B9%8C?__eep__=6&amp;__cft__[0]=AZWkrVReKbSixUZ9p5x6yKuJimSSTZLvWgfaK7Sf8VJfnegXZgqQRf1fqdS4oOKTk6lNgd2IL2FceynVcRsEUCjyKrr280fFuwU07C80v9kArQmOz3uWnlZVjdkJ0ru6qxDa68M0EdoKjwkWEeoe0qr9kqkHxqgwk8SXjWgfh-oFZw4x8P9CXOGAhCCfyE4ONmgXWvF1qYnPJMzvwfIQYbcs&amp;__tn__=*NK-R\">#วาเลนไทน์</a></p><img src=\"https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc6891def-c767-4f19-b36f-85a2f44503a9.jpg?alt=media\"><h2>Dockside Boat &amp; Bed</h2><p>ถ้าเบื่อจะเปิดห้องในโรงแรมแล้วละก็...ลองเปิดห้องในเรือยอร์ชกันหน่อยมั้ยหละ Dockside Boat &amp; Bed จะให้ประสบการณ์นอนบนเรือแบบไม่ต้องออกไปไกลฝั่ง แต่ได้ดื่มด่ำบรรยากาศทะเลแบบไม่แพ้กันเลยทีเดียว รับรองได้ว่าค่ำคืนนั้นจะแปลกใหม่ไม่ซ้ำใครแน่นอน&nbsp;<br>โทร : (562) 436-3111<br><br>ขอบคุณภาพจาก&nbsp;&nbsp;<a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"http://boatandbed.com\">boatandbed.com</a></p><hr><img src=\"https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff5615ffc-5d36-4061-9183-429807582a65.jpg?alt=media\"><h2>Palisades Village&nbsp;</h2><p>สถานที่พาแฟนไป ช็อป ชิว กิน เที่ยว แบบ All in One ไม่ไกลจาก Santa Monica คนโสดก็ไปชิวได้ ไม่แน่...อาจจะปุ๊บปั๊บปิ๊งๆคนแถวนั้นก็ได้น้า<br><br>เวลาทำการ<br>Mon – Sat 11:00 AM – 7:00 PM<br>Sun 11:00 AM – 6:00 PM<br>ขอบคุณภาพจาก&nbsp;&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"http://palisadesvillageca.com/?fbclid=IwAR37UXtm_aGunLTOLQwGRqZVD1YKFGriqYXwSQdUSVO5cqziVJ52v8EgQCI\">palisadesvillageca.com</a></p><hr><img src=\"https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F713d13ab-bcae-45bd-bc35-140dfab45db9.jpg?alt=media\"><h2>Point Dume</h2><p>จุดชมวิวยอดฮิตในตำนาน เหมาะอย่างยิ่งสำหรับชมพระอาทิตย์ตกดินลับขอบฟ้า ที่จะตราตรึงใจคุณและเธอคนนั้นไปอีกแสนนาน (เตรียมเสื้อหนาวไปหน่อยก็ดีนะ ลมแรง และหนาวมาก เดี๋ยวจะไม่สบายเอา)<br><br>ขอบคุณภาพจาก Discover Los Angeles และ&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"http://don-schimmel-photography.com/?fbclid=IwAR13dFIWiyjOCAwyfeugIywU9-4R0vaUzS30S9oE2Uid69CrBsqAUWkLqFo\">don-schimmel-photography.com</a></p><hr><img src=\"https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff90edf77-8194-4664-ba6b-fd068d13bb4e.jpg?alt=media\"><h2>Disneyland</h2><p>ไม่ว่าจะกี่ยุคกี่สมัย ดิสนีย์แลนด์ ก็ยังเป็นสถานที่แห่งความทรงจำและความประทับใจ ไม่เคยเปลี่ยนไป ดั่งได้หลุดไปยังโลกในนิยายกับความฝันที่อะไรก็เกิดขึ้นได้ ด้วยเหตุนี้ หากไม่รู้จะพาคนรักไปไหน หรือไปเที่ยวแก้เหงาที่ไหนดี ดิสนีย์แลนด์ก็ยังคงจะเป็นคำตอบที่จะไม่ทำให้คุณผิดหวังเลย&nbsp;<br><br>ขอบคุณภาพจาก&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"http://www.discoverlosangeles.com/?fbclid=IwAR0-nUl7GZiY4mcKHGcDasXXhr4Kl7N-TTohw7u5Kv_LxI356wTwzxVias0\">www.discoverlosangeles.com</a>&nbsp;และ&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"http://majesticgardenhotel.com/?fbclid=IwAR1K3Js9UVaXmNFEmrAnJzTcgGM0VMv1G1HYWWtnS856qK6LI_vryhn5N4o\">majesticgardenhotel.com/</a></p><hr><img src=\"https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F6511c390-a211-427d-b2a7-02d56560dbdb.jpg?alt=media\"><h2>The Huntington Library, Art Collections and Botanical Gardens</h2><p>นอกจากจะมีห้องสมุด และ แกลอรี่ แล้ว ที่นี่ยังมี สวนพฤกษศาสตร์ที่กว้างขวางตระการตาด้วยหลากพืชพรรณ นานาชนิด พร้อมทั้ง สถาปัตยกรรมงามตา ที่ชวนให้เพลินตาเพลินใจเป็นอย่างมาก ไม่ว่าจะโสดหรือมีคู่ก็แนะนำให้ไปอย่างยิ่ง<br><br>เวลาทำการ<br>Wed – Mon 10:00 AM – 5:00 PM<br>หยุดทุกวันอังคาร<br><br>ขอบคุณภาพจาก&nbsp;&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"http://www.trip.com/?fbclid=IwAR0to9NbtsDdup9-1S3glP-7ut6JZICwMcbeVaxY_7x4h8Y72Vt6TA9iHaI\">www.trip.com</a>&nbsp;และ&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"http://www.huntington.org/gardens?fbclid=IwAR2tsQFMq2Yl04Ab-c_ivcfPnajn88HqUAk4hZC6n1fLcNpEPRt0WwLRNhc\">www.huntington.org/gardens</a></p><hr><img src=\"https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F54a88cc0-44a9-4de3-a0d6-27128bea919b.jpg?alt=media\"><h2>71 Above Restaurant &amp; Skylounge</h2><p>ภัตตาคารสุดหรู บนยอดตึกสูงกว่า 1,000 ที่ให้ประสบการณ์การรับประทานอาหารและเครื่องดื่มสไตล์ Modern American พร้อมๆกับวิวเมืองแอลเอ แบบ 360 องศา&nbsp;<br><br>เวลาทำการ<br>Sun - Th 5:00 PM – 9:30 PM<br>Fri - Sat 5:00 PM – 11:00 PM<br>โทร : (213) 712-2683<br><br>ขอบคุณภาพจาก&nbsp;&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"https://l.facebook.com/l.php?u=http%3A%2F%2Fgirouxglass.com%2F%3Ffbclid%3DIwAR1qwNkVkYu_iKDExORP8hg4fX-HEvHClWoJJu7jpIvI6SZCS95b-EricF4&amp;h=AT07GqYa-Ce9tP-6sGAQKxWfRcDv7Dy-auzhktEChAkMa2CzCnFZjjbKtRRj4GWODTpZBoulLlOOEIziIKt0C7fbLTJ3TgDkhHxcBDc6Upipk_qfRk1bdwTdWuTWEpYlA6-c6jkNbg&amp;__tn__=-UK*F\">girouxglass.com</a>&nbsp;และ&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"https://la.eater.com/?fbclid=IwAR0txhzY5kRkEVNuQBeDeMrqEOFT7wLgqsV0VBwatuyJNLRwruYCdYQeeiM\">la.eater.com</a></p><p></p>',_binary '','Valentine\'s Day (in LA area)',_binary '','2024-02-15 00:01:10.259432',_binary '',NULL),(69,72,1,'https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F80fbea03-b5ac-45bc-b0e3-c878866d523b.jpg?alt=media',_binary '\0','BASIC_LIVING',_binary '\0',NULL,_binary '\0','2024-02-15 00:01:10.258868',_binary '\0','<p>จะปีไหนๆ ก็ยังน่าไปเสมอ <span data-name=\"heart\" data-type=\"emoji\">❤</span> </p><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg xo1l8bm\" href=\"https://www.facebook.com/hashtag/valentine?__eep__=6&amp;__cft__[0]=AZWkrVReKbSixUZ9p5x6yKuJimSSTZLvWgfaK7Sf8VJfnegXZgqQRf1fqdS4oOKTk6lNgd2IL2FceynVcRsEUCjyKrr280fFuwU07C80v9kArQmOz3uWnlZVjdkJ0ru6qxDa68M0EdoKjwkWEeoe0qr9kqkHxqgwk8SXjWgfh-oFZw4x8P9CXOGAhCCfyE4ONmgXWvF1qYnPJMzvwfIQYbcs&amp;__tn__=*NK-R\">#valentine</a> <a target=\"_blank\" rel=\"noopener noreferrer nofollow\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg xo1l8bm\" href=\"https://www.facebook.com/hashtag/%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%A7%E0%B8%B2%E0%B9%80%E0%B8%A5%E0%B8%99%E0%B9%84%E0%B8%97%E0%B8%99%E0%B9%8C?__eep__=6&amp;__cft__[0]=AZWkrVReKbSixUZ9p5x6yKuJimSSTZLvWgfaK7Sf8VJfnegXZgqQRf1fqdS4oOKTk6lNgd2IL2FceynVcRsEUCjyKrr280fFuwU07C80v9kArQmOz3uWnlZVjdkJ0ru6qxDa68M0EdoKjwkWEeoe0qr9kqkHxqgwk8SXjWgfh-oFZw4x8P9CXOGAhCCfyE4ONmgXWvF1qYnPJMzvwfIQYbcs&amp;__tn__=*NK-R\">#วันวาเลนไทน์</a> <a target=\"_blank\" rel=\"noopener noreferrer nofollow\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg xo1l8bm\" href=\"https://www.facebook.com/hashtag/%E0%B8%A7%E0%B8%B2%E0%B9%80%E0%B8%A5%E0%B8%99%E0%B9%84%E0%B8%97%E0%B8%99%E0%B9%8C?__eep__=6&amp;__cft__[0]=AZWkrVReKbSixUZ9p5x6yKuJimSSTZLvWgfaK7Sf8VJfnegXZgqQRf1fqdS4oOKTk6lNgd2IL2FceynVcRsEUCjyKrr280fFuwU07C80v9kArQmOz3uWnlZVjdkJ0ru6qxDa68M0EdoKjwkWEeoe0qr9kqkHxqgwk8SXjWgfh-oFZw4x8P9CXOGAhCCfyE4ONmgXWvF1qYnPJMzvwfIQYbcs&amp;__tn__=*NK-R\">#วาเลนไทน์</a></p><img src=\"https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc6891def-c767-4f19-b36f-85a2f44503a9.jpg?alt=media\"><h2>Dockside Boat &amp; Bed</h2><p>ถ้าเบื่อจะเปิดห้องในโรงแรมแล้วละก็...ลองเปิดห้องในเรือยอร์ชกันหน่อยมั้ยหละ Dockside Boat &amp; Bed จะให้ประสบการณ์นอนบนเรือแบบไม่ต้องออกไปไกลฝั่ง แต่ได้ดื่มด่ำบรรยากาศทะเลแบบไม่แพ้กันเลยทีเดียว รับรองได้ว่าค่ำคืนนั้นจะแปลกใหม่ไม่ซ้ำใครแน่นอน&nbsp;<br>โทร : (562) 436-3111<br><br>ขอบคุณภาพจาก&nbsp;&nbsp;<a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"http://boatandbed.com\">boatandbed.com</a></p><hr><img src=\"https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff5615ffc-5d36-4061-9183-429807582a65.jpg?alt=media\"><h2>Palisades Village&nbsp;</h2><p>สถานที่พาแฟนไป ช็อป ชิว กิน เที่ยว แบบ All in One ไม่ไกลจาก Santa Monica คนโสดก็ไปชิวได้ ไม่แน่...อาจจะปุ๊บปั๊บปิ๊งๆคนแถวนั้นก็ได้น้า<br><br>เวลาทำการ<br>Mon – Sat 11:00 AM – 7:00 PM<br>Sun 11:00 AM – 6:00 PM<br>ขอบคุณภาพจาก&nbsp;&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"http://palisadesvillageca.com/?fbclid=IwAR37UXtm_aGunLTOLQwGRqZVD1YKFGriqYXwSQdUSVO5cqziVJ52v8EgQCI\">palisadesvillageca.com</a></p><hr><img src=\"https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F713d13ab-bcae-45bd-bc35-140dfab45db9.jpg?alt=media\"><h2>Point Dume</h2><p>จุดชมวิวยอดฮิตในตำนาน เหมาะอย่างยิ่งสำหรับชมพระอาทิตย์ตกดินลับขอบฟ้า ที่จะตราตรึงใจคุณและเธอคนนั้นไปอีกแสนนาน (เตรียมเสื้อหนาวไปหน่อยก็ดีนะ ลมแรง และหนาวมาก เดี๋ยวจะไม่สบายเอา)<br><br>ขอบคุณภาพจาก Discover Los Angeles และ&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"http://don-schimmel-photography.com/?fbclid=IwAR13dFIWiyjOCAwyfeugIywU9-4R0vaUzS30S9oE2Uid69CrBsqAUWkLqFo\">don-schimmel-photography.com</a></p><hr><img src=\"https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff90edf77-8194-4664-ba6b-fd068d13bb4e.jpg?alt=media\"><h2>Disneyland</h2><p>ไม่ว่าจะกี่ยุคกี่สมัย ดิสนีย์แลนด์ ก็ยังเป็นสถานที่แห่งความทรงจำและความประทับใจ ไม่เคยเปลี่ยนไป ดั่งได้หลุดไปยังโลกในนิยายกับความฝันที่อะไรก็เกิดขึ้นได้ ด้วยเหตุนี้ หากไม่รู้จะพาคนรักไปไหน หรือไปเที่ยวแก้เหงาที่ไหนดี ดิสนีย์แลนด์ก็ยังคงจะเป็นคำตอบที่จะไม่ทำให้คุณผิดหวังเลย&nbsp;<br><br>ขอบคุณภาพจาก&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"http://www.discoverlosangeles.com/?fbclid=IwAR0-nUl7GZiY4mcKHGcDasXXhr4Kl7N-TTohw7u5Kv_LxI356wTwzxVias0\">www.discoverlosangeles.com</a>&nbsp;และ&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"http://majesticgardenhotel.com/?fbclid=IwAR1K3Js9UVaXmNFEmrAnJzTcgGM0VMv1G1HYWWtnS856qK6LI_vryhn5N4o\">majesticgardenhotel.com/</a></p><hr><img src=\"https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F6511c390-a211-427d-b2a7-02d56560dbdb.jpg?alt=media\"><h2>The Huntington Library, Art Collections and Botanical Gardens</h2><p>นอกจากจะมีห้องสมุด และ แกลอรี่ แล้ว ที่นี่ยังมี สวนพฤกษศาสตร์ที่กว้างขวางตระการตาด้วยหลากพืชพรรณ นานาชนิด พร้อมทั้ง สถาปัตยกรรมงามตา ที่ชวนให้เพลินตาเพลินใจเป็นอย่างมาก ไม่ว่าจะโสดหรือมีคู่ก็แนะนำให้ไปอย่างยิ่ง<br><br>เวลาทำการ<br>Wed – Mon 10:00 AM – 5:00 PM<br>หยุดทุกวันอังคาร<br><br>ขอบคุณภาพจาก&nbsp;&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"http://www.trip.com/?fbclid=IwAR0to9NbtsDdup9-1S3glP-7ut6JZICwMcbeVaxY_7x4h8Y72Vt6TA9iHaI\">www.trip.com</a>&nbsp;และ&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"http://www.huntington.org/gardens?fbclid=IwAR2tsQFMq2Yl04Ab-c_ivcfPnajn88HqUAk4hZC6n1fLcNpEPRt0WwLRNhc\">www.huntington.org/gardens</a></p><hr><img src=\"https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F54a88cc0-44a9-4de3-a0d6-27128bea919b.jpg?alt=media\"><h2>71 Above Restaurant &amp; Skylounge</h2><p>ภัตตาคารสุดหรู บนยอดตึกสูงกว่า 1,000 ที่ให้ประสบการณ์การรับประทานอาหารและเครื่องดื่มสไตล์ Modern American พร้อมๆกับวิวเมืองแอลเอ แบบ 360 องศา&nbsp;<br><br>เวลาทำการ<br>Sun - Th 5:00 PM – 9:30 PM<br>Fri - Sat 5:00 PM – 11:00 PM<br>โทร : (213) 712-2683<br><br>ขอบคุณภาพจาก&nbsp;&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"https://l.facebook.com/l.php?u=http%3A%2F%2Fgirouxglass.com%2F%3Ffbclid%3DIwAR1qwNkVkYu_iKDExORP8hg4fX-HEvHClWoJJu7jpIvI6SZCS95b-EricF4&amp;h=AT07GqYa-Ce9tP-6sGAQKxWfRcDv7Dy-auzhktEChAkMa2CzCnFZjjbKtRRj4GWODTpZBoulLlOOEIziIKt0C7fbLTJ3TgDkhHxcBDc6Upipk_qfRk1bdwTdWuTWEpYlA6-c6jkNbg&amp;__tn__=-UK*F\">girouxglass.com</a>&nbsp;และ&nbsp;<a target=\"_blank\" rel=\"nofollow noreferrer\" class=\"x1i10hfl xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x972fbf xcfux6l x1qhh985 xm0m39n x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"https://la.eater.com/?fbclid=IwAR0txhzY5kRkEVNuQBeDeMrqEOFT7wLgqsV0VBwatuyJNLRwruYCdYQeeiM\">la.eater.com</a></p><p></p>',_binary '\0','Valentine\'s Day (in LA area)',_binary '\0','2024-02-15 00:01:10.259432',_binary '\0',_binary '');
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
INSERT INTO `hibernate_sequence` VALUES (87);
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
INSERT INTO `my_revision_entity` VALUES (2,1707711928267,'169.254.1.1',NULL,NULL,'anonymousUser'),(4,1707711928969,'169.254.1.1',NULL,NULL,'anonymousUser'),(6,1707776888881,'169.254.1.1',NULL,NULL,'anonymousUser'),(8,1707776889578,'169.254.1.1',NULL,NULL,'anonymousUser'),(10,1707777034887,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(12,1707777255278,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(14,1707777282178,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(16,1707777403578,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(18,1707777729868,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(20,1707779867272,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(21,1707779868672,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(23,1707782039908,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(24,1707782040301,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(26,1707783018533,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(28,1707783053628,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(30,1707783084336,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(32,1707783136562,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(34,1707942789574,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(36,1707942803666,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(38,1707942804168,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(40,1707942804658,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(44,1707942811467,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(45,1707942811467,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(46,1707942811467,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(48,1707942849782,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(50,1707942850189,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(52,1707954886045,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(54,1707954886985,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(56,1707954910778,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(58,1707954953858,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(61,1707954954968,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(62,1707954955064,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(65,1707954955604,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(66,1707954955656,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(68,1707954955969,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(70,1707955270652,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(72,1707955272667,'169.254.1.1','projectthaihub@gmail.com',5,'ThaiNow'),(74,1709345190902,'169.254.1.1',NULL,NULL,'anonymousUser'),(76,1709345191124,'169.254.1.1',NULL,NULL,'anonymousUser'),(77,1709345194985,'169.254.1.1',NULL,NULL,'anonymousUser'),(78,1709345205339,'169.254.1.1',NULL,NULL,'anonymousUser'),(81,1709519098457,'169.254.1.1',NULL,NULL,'anonymousUser'),(82,1709519098457,'169.254.1.1',NULL,NULL,'anonymousUser'),(85,1709519098635,'169.254.1.1',NULL,NULL,'anonymousUser'),(86,1709519098635,'169.254.1.1',NULL,NULL,'anonymousUser');
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
INSERT INTO `post` VALUES ('GUIDEBOOK_POST',71,'2024-02-15 00:01:12.493428',_binary '\0',_binary '\0',NULL,'PUBLIC','2024-02-15 00:01:12.493483',7,69);
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
INSERT INTO `post_aud` VALUES (71,72,'GUIDEBOOK_POST',0,'2024-02-15 00:01:12.493428',_binary '',_binary '\0',_binary '',_binary '\0',_binary '',NULL,_binary '\0','PUBLIC',_binary '','2024-02-15 00:01:12.493483',_binary '',_binary '\0',7,_binary '',_binary '\0',69,_binary '');
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
INSERT INTO `profile` VALUES ('USER_PROFILE',3,1,NULL),('USER_PROFILE',7,5,NULL),('USER_PROFILE',75,73,NULL),('USER_PROFILE',83,80,NULL),('USER_PROFILE',84,79,NULL);
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
INSERT INTO `profile_aud` VALUES (3,4,'USER_PROFILE',0,1,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,NULL),(7,8,'USER_PROFILE',0,5,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,NULL),(7,72,'USER_PROFILE',1,5,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',NULL,NULL),(75,76,'USER_PROFILE',0,73,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,NULL),(83,86,'USER_PROFILE',0,80,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,NULL),(84,85,'USER_PROFILE',0,79,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,NULL);
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
INSERT INTO `storage` VALUES (9,'2024-02-12 22:30:34.881834','fca027ba-7799-4fa1-adb4-1c891a83f312.png',297823,'image/png','2024-02-12 22:30:34.881853',NULL),(11,'2024-02-12 22:34:15.275529','b982d978-f1ab-4409-aa9a-d448273638b8.png',297823,'image/png','2024-02-12 22:34:15.275543',NULL),(13,'2024-02-12 22:34:42.175244','ebed675e-4e20-497e-9cfd-f496580b2a12.png',297823,'image/png','2024-02-12 22:34:42.175297',NULL),(15,'2024-02-12 22:36:43.576440','8d73ac8d-5392-4381-93ce-c06b03bb8cde.png',307843,'image/png','2024-02-12 22:36:43.576455',NULL),(17,'2024-02-12 22:42:09.864342','20c4f595-78ee-4c94-9f3a-5c90350bd655.png',297823,'image/png','2024-02-12 22:42:09.864355',NULL),(19,'2024-02-12 23:17:46.969039','f1ee00b0-e08f-4baf-b6d5-eef4c2e00fc1.png',297823,'image/png','2024-02-12 23:17:46.969069','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff1ee00b0-e08f-4baf-b6d5-eef4c2e00fc1.png?alt=media'),(22,'2024-02-12 23:53:59.879628','3da0e033-5931-49aa-8fc1-b9bdf54f5bb9.png',297823,'image/png','2024-02-12 23:53:59.879651','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F3da0e033-5931-49aa-8fc1-b9bdf54f5bb9.png?alt=media'),(25,'2024-02-13 00:10:18.525819','a7111e12-49d7-41e7-941f-2eb100101d3b.jpg',163354,'image/jpeg','2024-02-13 00:10:18.525830','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa7111e12-49d7-41e7-941f-2eb100101d3b.jpg?alt=media'),(27,'2024-02-13 00:10:53.625752','53a813ba-7039-4f00-9d95-31f5c5ec6d7e.jpg',205368,'image/jpeg','2024-02-13 00:10:53.625762','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F53a813ba-7039-4f00-9d95-31f5c5ec6d7e.jpg?alt=media'),(29,'2024-02-13 00:11:24.333676','1a4c7373-f720-4a74-8570-3023f100cf22.jpg',174357,'image/jpeg','2024-02-13 00:11:24.333686','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F1a4c7373-f720-4a74-8570-3023f100cf22.jpg?alt=media'),(31,'2024-02-13 00:12:16.517600','40cc93a3-c147-4d1c-829f-0dfd32863955.jpg',205368,'image/jpeg','2024-02-13 00:12:16.517612','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F40cc93a3-c147-4d1c-829f-0dfd32863955.jpg?alt=media'),(33,'2024-02-14 20:33:09.392427','3d50234b-6057-4129-9e65-2a3bde946a4f.jpg',430624,'image/jpeg','2024-02-14 20:33:09.392457','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F3d50234b-6057-4129-9e65-2a3bde946a4f.jpg?alt=media'),(35,'2024-02-14 20:33:23.656467','98a6234c-f74b-45dd-8e18-489777bbb791.jpg',326107,'image/jpeg','2024-02-14 20:33:23.656494','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F98a6234c-f74b-45dd-8e18-489777bbb791.jpg?alt=media'),(37,'2024-02-14 20:33:24.162604','ee6ff353-6d3f-43f5-93f1-bd1d6131d2d0.jpg',451137,'image/jpeg','2024-02-14 20:33:24.162634','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fee6ff353-6d3f-43f5-93f1-bd1d6131d2d0.jpg?alt=media'),(39,'2024-02-14 20:33:24.654431','2df7a5c7-0330-49f0-bec9-954475862506.jpg',532943,'image/jpeg','2024-02-14 20:33:24.654451','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F2df7a5c7-0330-49f0-bec9-954475862506.jpg?alt=media'),(41,'2024-02-14 20:33:31.059250','8b4ec577-6d06-44dd-9e59-eeb2d8ecb475.jpg',516730,'image/jpeg','2024-02-14 20:33:31.059337','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F8b4ec577-6d06-44dd-9e59-eeb2d8ecb475.jpg?alt=media'),(42,'2024-02-14 20:33:31.059250','4291d103-5ff4-48d5-a3ec-eebf16bd9ea2.jpg',484349,'image/jpeg','2024-02-14 20:33:31.059337','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F4291d103-5ff4-48d5-a3ec-eebf16bd9ea2.jpg?alt=media'),(43,'2024-02-14 20:33:31.059520','0ede2ec8-c5b2-41e2-bd58-57638fd10d96.jpg',505482,'image/jpeg','2024-02-14 20:33:31.059542','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F0ede2ec8-c5b2-41e2-bd58-57638fd10d96.jpg?alt=media'),(47,'2024-02-14 20:34:09.776902','7c571614-c325-48c1-b4b3-23d61aedc207.jpg',484349,'image/jpeg','2024-02-14 20:34:09.776919','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F7c571614-c325-48c1-b4b3-23d61aedc207.jpg?alt=media'),(49,'2024-02-14 20:34:10.185364','ad25369e-a114-438a-b788-4b3158a07f93.jpg',451137,'image/jpeg','2024-02-14 20:34:10.185381','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fad25369e-a114-438a-b788-4b3158a07f93.jpg?alt=media'),(51,'2024-02-14 23:54:46.012936','92c61ab7-f5fb-4323-b7ec-5e1c569a7ce7.png',393740,'image/png','2024-02-14 23:54:46.012966','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F92c61ab7-f5fb-4323-b7ec-5e1c569a7ce7.png?alt=media'),(53,'2024-02-14 23:54:46.934381','386723fc-d25c-4b03-afdc-c7df6e6f6e88.png',436716,'image/png','2024-02-14 23:54:46.934416','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F386723fc-d25c-4b03-afdc-c7df6e6f6e88.png?alt=media'),(55,'2024-02-14 23:55:10.772083','80fbea03-b5ac-45bc-b0e3-c878866d523b.jpg',430503,'image/jpeg','2024-02-14 23:55:10.772109','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F80fbea03-b5ac-45bc-b0e3-c878866d523b.jpg?alt=media'),(57,'2024-02-14 23:55:53.783427','c6891def-c767-4f19-b36f-85a2f44503a9.jpg',326107,'image/jpeg','2024-02-14 23:55:53.783441','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc6891def-c767-4f19-b36f-85a2f44503a9.jpg?alt=media'),(59,'2024-02-14 23:55:54.959556','713d13ab-bcae-45bd-bc35-140dfab45db9.jpg',484349,'image/jpeg','2024-02-14 23:55:54.959576','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F713d13ab-bcae-45bd-bc35-140dfab45db9.jpg?alt=media'),(60,'2024-02-14 23:55:55.057999','f5615ffc-5d36-4061-9183-429807582a65.jpg',505482,'image/jpeg','2024-02-14 23:55:55.058020','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff5615ffc-5d36-4061-9183-429807582a65.jpg?alt=media'),(63,'2024-02-14 23:55:55.583347','6511c390-a211-427d-b2a7-02d56560dbdb.jpg',516730,'image/jpeg','2024-02-14 23:55:55.583371','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F6511c390-a211-427d-b2a7-02d56560dbdb.jpg?alt=media'),(64,'2024-02-14 23:55:55.600184','f90edf77-8194-4664-ba6b-fd068d13bb4e.jpg',532943,'image/jpeg','2024-02-14 23:55:55.600212','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff90edf77-8194-4664-ba6b-fd068d13bb4e.jpg?alt=media'),(67,'2024-02-14 23:55:55.964598','54a88cc0-44a9-4de3-a0d6-27128bea919b.jpg',451137,'image/jpeg','2024-02-14 23:55:55.964616','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F54a88cc0-44a9-4de3-a0d6-27128bea919b.jpg?alt=media');
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
INSERT INTO `storage_aud` VALUES (9,10,0,'2024-02-12 22:30:34.881834',_binary '','fca027ba-7799-4fa1-adb4-1c891a83f312.png',_binary '',297823,_binary '','image/png',_binary '','2024-02-12 22:30:34.881853',_binary '',NULL,_binary '\0'),(11,12,0,'2024-02-12 22:34:15.275529',_binary '','b982d978-f1ab-4409-aa9a-d448273638b8.png',_binary '',297823,_binary '','image/png',_binary '','2024-02-12 22:34:15.275543',_binary '',NULL,_binary '\0'),(13,14,0,'2024-02-12 22:34:42.175244',_binary '','ebed675e-4e20-497e-9cfd-f496580b2a12.png',_binary '',297823,_binary '','image/png',_binary '','2024-02-12 22:34:42.175297',_binary '',NULL,_binary '\0'),(15,16,0,'2024-02-12 22:36:43.576440',_binary '','8d73ac8d-5392-4381-93ce-c06b03bb8cde.png',_binary '',307843,_binary '','image/png',_binary '','2024-02-12 22:36:43.576455',_binary '',NULL,_binary '\0'),(17,18,0,'2024-02-12 22:42:09.864342',_binary '','20c4f595-78ee-4c94-9f3a-5c90350bd655.png',_binary '',297823,_binary '','image/png',_binary '','2024-02-12 22:42:09.864355',_binary '',NULL,_binary '\0'),(19,20,0,'2024-02-12 23:17:46.969039',_binary '','f1ee00b0-e08f-4baf-b6d5-eef4c2e00fc1.png',_binary '',297823,_binary '','image/png',_binary '','2024-02-12 23:17:46.969069',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff1ee00b0-e08f-4baf-b6d5-eef4c2e00fc1.png?alt=media',_binary ''),(22,23,0,'2024-02-12 23:53:59.879628',_binary '','3da0e033-5931-49aa-8fc1-b9bdf54f5bb9.png',_binary '',297823,_binary '','image/png',_binary '','2024-02-12 23:53:59.879651',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F3da0e033-5931-49aa-8fc1-b9bdf54f5bb9.png?alt=media',_binary ''),(25,26,0,'2024-02-13 00:10:18.525819',_binary '','a7111e12-49d7-41e7-941f-2eb100101d3b.jpg',_binary '',163354,_binary '','image/jpeg',_binary '','2024-02-13 00:10:18.525830',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fa7111e12-49d7-41e7-941f-2eb100101d3b.jpg?alt=media',_binary ''),(27,28,0,'2024-02-13 00:10:53.625752',_binary '','53a813ba-7039-4f00-9d95-31f5c5ec6d7e.jpg',_binary '',205368,_binary '','image/jpeg',_binary '','2024-02-13 00:10:53.625762',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F53a813ba-7039-4f00-9d95-31f5c5ec6d7e.jpg?alt=media',_binary ''),(29,30,0,'2024-02-13 00:11:24.333676',_binary '','1a4c7373-f720-4a74-8570-3023f100cf22.jpg',_binary '',174357,_binary '','image/jpeg',_binary '','2024-02-13 00:11:24.333686',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F1a4c7373-f720-4a74-8570-3023f100cf22.jpg?alt=media',_binary ''),(31,32,0,'2024-02-13 00:12:16.517600',_binary '','40cc93a3-c147-4d1c-829f-0dfd32863955.jpg',_binary '',205368,_binary '','image/jpeg',_binary '','2024-02-13 00:12:16.517612',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F40cc93a3-c147-4d1c-829f-0dfd32863955.jpg?alt=media',_binary ''),(33,34,0,'2024-02-14 20:33:09.392427',_binary '','3d50234b-6057-4129-9e65-2a3bde946a4f.jpg',_binary '',430624,_binary '','image/jpeg',_binary '','2024-02-14 20:33:09.392457',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F3d50234b-6057-4129-9e65-2a3bde946a4f.jpg?alt=media',_binary ''),(35,36,0,'2024-02-14 20:33:23.656467',_binary '','98a6234c-f74b-45dd-8e18-489777bbb791.jpg',_binary '',326107,_binary '','image/jpeg',_binary '','2024-02-14 20:33:23.656494',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F98a6234c-f74b-45dd-8e18-489777bbb791.jpg?alt=media',_binary ''),(37,38,0,'2024-02-14 20:33:24.162604',_binary '','ee6ff353-6d3f-43f5-93f1-bd1d6131d2d0.jpg',_binary '',451137,_binary '','image/jpeg',_binary '','2024-02-14 20:33:24.162634',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fee6ff353-6d3f-43f5-93f1-bd1d6131d2d0.jpg?alt=media',_binary ''),(39,40,0,'2024-02-14 20:33:24.654431',_binary '','2df7a5c7-0330-49f0-bec9-954475862506.jpg',_binary '',532943,_binary '','image/jpeg',_binary '','2024-02-14 20:33:24.654451',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F2df7a5c7-0330-49f0-bec9-954475862506.jpg?alt=media',_binary ''),(41,44,0,'2024-02-14 20:33:31.059250',_binary '','8b4ec577-6d06-44dd-9e59-eeb2d8ecb475.jpg',_binary '',516730,_binary '','image/jpeg',_binary '','2024-02-14 20:33:31.059337',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F8b4ec577-6d06-44dd-9e59-eeb2d8ecb475.jpg?alt=media',_binary ''),(42,45,0,'2024-02-14 20:33:31.059250',_binary '','4291d103-5ff4-48d5-a3ec-eebf16bd9ea2.jpg',_binary '',484349,_binary '','image/jpeg',_binary '','2024-02-14 20:33:31.059337',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F4291d103-5ff4-48d5-a3ec-eebf16bd9ea2.jpg?alt=media',_binary ''),(43,46,0,'2024-02-14 20:33:31.059520',_binary '','0ede2ec8-c5b2-41e2-bd58-57638fd10d96.jpg',_binary '',505482,_binary '','image/jpeg',_binary '','2024-02-14 20:33:31.059542',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F0ede2ec8-c5b2-41e2-bd58-57638fd10d96.jpg?alt=media',_binary ''),(47,48,0,'2024-02-14 20:34:09.776902',_binary '','7c571614-c325-48c1-b4b3-23d61aedc207.jpg',_binary '',484349,_binary '','image/jpeg',_binary '','2024-02-14 20:34:09.776919',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F7c571614-c325-48c1-b4b3-23d61aedc207.jpg?alt=media',_binary ''),(49,50,0,'2024-02-14 20:34:10.185364',_binary '','ad25369e-a114-438a-b788-4b3158a07f93.jpg',_binary '',451137,_binary '','image/jpeg',_binary '','2024-02-14 20:34:10.185381',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fad25369e-a114-438a-b788-4b3158a07f93.jpg?alt=media',_binary ''),(51,52,0,'2024-02-14 23:54:46.012936',_binary '','92c61ab7-f5fb-4323-b7ec-5e1c569a7ce7.png',_binary '',393740,_binary '','image/png',_binary '','2024-02-14 23:54:46.012966',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F92c61ab7-f5fb-4323-b7ec-5e1c569a7ce7.png?alt=media',_binary ''),(53,54,0,'2024-02-14 23:54:46.934381',_binary '','386723fc-d25c-4b03-afdc-c7df6e6f6e88.png',_binary '',436716,_binary '','image/png',_binary '','2024-02-14 23:54:46.934416',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F386723fc-d25c-4b03-afdc-c7df6e6f6e88.png?alt=media',_binary ''),(55,56,0,'2024-02-14 23:55:10.772083',_binary '','80fbea03-b5ac-45bc-b0e3-c878866d523b.jpg',_binary '',430503,_binary '','image/jpeg',_binary '','2024-02-14 23:55:10.772109',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F80fbea03-b5ac-45bc-b0e3-c878866d523b.jpg?alt=media',_binary ''),(57,58,0,'2024-02-14 23:55:53.783427',_binary '','c6891def-c767-4f19-b36f-85a2f44503a9.jpg',_binary '',326107,_binary '','image/jpeg',_binary '','2024-02-14 23:55:53.783441',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Fc6891def-c767-4f19-b36f-85a2f44503a9.jpg?alt=media',_binary ''),(59,61,0,'2024-02-14 23:55:54.959556',_binary '','713d13ab-bcae-45bd-bc35-140dfab45db9.jpg',_binary '',484349,_binary '','image/jpeg',_binary '','2024-02-14 23:55:54.959576',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F713d13ab-bcae-45bd-bc35-140dfab45db9.jpg?alt=media',_binary ''),(60,62,0,'2024-02-14 23:55:55.057999',_binary '','f5615ffc-5d36-4061-9183-429807582a65.jpg',_binary '',505482,_binary '','image/jpeg',_binary '','2024-02-14 23:55:55.058020',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff5615ffc-5d36-4061-9183-429807582a65.jpg?alt=media',_binary ''),(63,66,0,'2024-02-14 23:55:55.583347',_binary '','6511c390-a211-427d-b2a7-02d56560dbdb.jpg',_binary '',516730,_binary '','image/jpeg',_binary '','2024-02-14 23:55:55.583371',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F6511c390-a211-427d-b2a7-02d56560dbdb.jpg?alt=media',_binary ''),(64,65,0,'2024-02-14 23:55:55.600184',_binary '','f90edf77-8194-4664-ba6b-fd068d13bb4e.jpg',_binary '',532943,_binary '','image/jpeg',_binary '','2024-02-14 23:55:55.600212',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff90edf77-8194-4664-ba6b-fd068d13bb4e.jpg?alt=media',_binary ''),(67,68,0,'2024-02-14 23:55:55.964598',_binary '','54a88cc0-44a9-4de3-a0d6-27128bea919b.jpg',_binary '',451137,_binary '','image/jpeg',_binary '','2024-02-14 23:55:55.964616',_binary '','https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F54a88cc0-44a9-4de3-a0d6-27128bea919b.jpg?alt=media',_binary '');
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
  `user_avatar_url` varchar(255) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `FKneyhvoj17hax43m8dq3u7gbic` (`location_id`),
  CONSTRAINT `FKneyhvoj17hax43m8dq3u7gbic` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,'2024-02-12 04:25:27.992334',NULL,_binary '\0','kvngo@tedkvn.com',_binary '\0','Kevin',_binary '\0','Kevin Ngo',_binary '',_binary '\0','Ngo',_binary '\0',_binary '\0','$2a$10$D2CZy.ClVhlXyL4SNRXq0edNnskjNJkoVBpvPqpJV45k/gS58OUZq',NULL,_binary '\0',NULL,'GOOGLE','CLASSIC','ACTIVATED','2a9d8821-f8ae-4149-b7f7-d32ead177b6d','2024-02-12 04:25:27.992358','Kevin Ngo',NULL,_binary '\0',NULL),(5,'https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F3da0e033-5931-49aa-8fc1-b9bdf54f5bb9.png?alt=media','2024-02-12 22:28:08.564991',NULL,_binary '\0','projectthaihub@gmail.com',_binary '\0',NULL,_binary '\0','ThaiNow',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0','$2a$10$WEM5K1xsk3/klspK1pFnieqm2W3xLcf5bsUo/5MqLJlRmifU45vA.',NULL,_binary '\0',NULL,'THAINOW','CONTRIBUTOR','ACTIVATED','31579135-7a2c-4af7-85db-a7de177565c8','2024-02-12 23:54:00.294932','ThaiNow',NULL,_binary '\0',NULL),(73,NULL,'2024-03-02 02:06:30.799318',NULL,_binary '\0','leonuhn@gmail.com',_binary '\0','Polawat',_binary '\0','Polawat Khunthikul',_binary '',_binary '\0','Khunthikul',_binary '\0',_binary '\0','$2a$10$wpLR9/EcRKGw36EXd9Tt2u5O23RMKxSxFZ2tdNMLlcx2y2mDdipPy',NULL,_binary '\0',NULL,'GOOGLE','CLASSIC','ACTIVATED','5211b165-63ea-4b09-b34b-aadf2fb888b8','2024-03-02 02:06:45.335231','Polawat Khunthikul',NULL,_binary '\0',NULL),(79,NULL,'2024-03-04 02:24:58.389550',NULL,_binary '\0','46n9vdp2vn@privaterelay.appleid.com',_binary '\0','',_binary '\0',' ',_binary '',_binary '\0','',_binary '\0',_binary '\0','$2a$10$h5Xs41aukIafSGZFdbatuuhHLnr8GYnttGVVnyiwwHZvBIOCmN3WC',NULL,_binary '\0',NULL,'APPLE','CLASSIC','ACTIVATED','b51f4d94-7a2a-4636-b972-91f9cf7324c8','2024-03-04 02:24:58.389619','46n9vdp2vn@privaterelay.appleid.com',NULL,_binary '\0',NULL),(80,NULL,'2024-03-04 02:24:58.389837',NULL,_binary '\0','46n9vdp2vn@privaterelay.appleid.com',_binary '\0','',_binary '\0',' ',_binary '',_binary '\0','',_binary '\0',_binary '\0','$2a$10$QP9/9TNUMMfdzPKycppu8OpZH58Sf0JMIHJ1UqvhNinYCUegh0snu',NULL,_binary '\0',NULL,'APPLE','CLASSIC','ACTIVATED','1829fba2-db5f-402f-8163-1f2a7b3f4279','2024-03-04 02:24:58.389853','46n9vdp2vn@privaterelay.appleid.com',NULL,_binary '\0',NULL);
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
  `user_avatar_url` varchar(255) DEFAULT NULL,
  `avatar_url_mod` bit(1) DEFAULT NULL,
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
INSERT INTO `user_aud` VALUES (1,2,0,NULL,_binary '\0','2024-02-12 04:25:27.992334',_binary '',NULL,_binary '\0',_binary '\0',_binary '','kvngo@tedkvn.com',_binary '',_binary '\0',_binary '','Kevin',_binary '',_binary '\0',_binary '','Kevin Ngo',_binary '',_binary '',_binary '',_binary '\0',_binary '','Ngo',_binary '',_binary '\0',_binary '',_binary '\0',_binary '','$2a$10$D2CZy.ClVhlXyL4SNRXq0edNnskjNJkoVBpvPqpJV45k/gS58OUZq',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0','GOOGLE',_binary '','CLASSIC',_binary '','ACTIVATED',_binary '','2a9d8821-f8ae-4149-b7f7-d32ead177b6d',_binary '','2024-02-12 04:25:27.992358',_binary '','Kevin Ngo',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0',_binary '',_binary ''),(5,6,0,NULL,_binary '\0','2024-02-12 22:28:08.564991',_binary '',NULL,_binary '\0',_binary '\0',_binary '','projectthaihub@gmail.com',_binary '',_binary '\0',_binary '',NULL,_binary '\0',_binary '\0',_binary '','null null',_binary '',_binary '\0',_binary '',_binary '\0',_binary '',NULL,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '','$2a$10$WEM5K1xsk3/klspK1pFnieqm2W3xLcf5bsUo/5MqLJlRmifU45vA.',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0','THAINOW',_binary '','CLASSIC',_binary '','ACTIVATED',_binary '','31579135-7a2c-4af7-85db-a7de177565c8',_binary '','2024-02-12 22:28:08.565029',_binary '','projectthaihub@gmail.com',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0',_binary '',_binary ''),(5,21,1,'https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2Ff1ee00b0-e08f-4baf-b6d5-eef4c2e00fc1.png?alt=media',_binary '','2024-02-12 22:28:08.564991',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','projectthaihub@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','ThaiNow',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','$2a$10$WEM5K1xsk3/klspK1pFnieqm2W3xLcf5bsUo/5MqLJlRmifU45vA.',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','THAINOW',_binary '\0','CONTRIBUTOR',_binary '\0','ACTIVATED',_binary '\0','31579135-7a2c-4af7-85db-a7de177565c8',_binary '\0','2024-02-12 23:17:48.663080',_binary '','ThaiNow',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(5,24,1,'https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%2F3da0e033-5931-49aa-8fc1-b9bdf54f5bb9.png?alt=media',_binary '','2024-02-12 22:28:08.564991',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','projectthaihub@gmail.com',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','ThaiNow',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','$2a$10$WEM5K1xsk3/klspK1pFnieqm2W3xLcf5bsUo/5MqLJlRmifU45vA.',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','THAINOW',_binary '\0','CONTRIBUTOR',_binary '\0','ACTIVATED',_binary '\0','31579135-7a2c-4af7-85db-a7de177565c8',_binary '\0','2024-02-12 23:54:00.294932',_binary '','ThaiNow',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(73,74,0,NULL,_binary '\0','2024-03-02 02:06:30.799318',_binary '',NULL,_binary '\0',_binary '\0',_binary '','leonuhn@gmail.com',_binary '',_binary '\0',_binary '','Polawat',_binary '',_binary '\0',_binary '','Polawat Khunthikul',_binary '',_binary '',_binary '',_binary '\0',_binary '','Khunthikul',_binary '',_binary '\0',_binary '',_binary '\0',_binary '','$2a$10$o/DDP70vV4X0f/tt6EWw5eaUWi/ZyQWj6FjLKajpXy736Bv7L3nTS',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0','GOOGLE',_binary '','CLASSIC',_binary '','ACTIVATED',_binary '','5211b165-63ea-4b09-b34b-aadf2fb888b8',_binary '','2024-03-02 02:06:30.799363',_binary '','Polawat Khunthikul',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0',_binary '',_binary ''),(73,77,1,NULL,_binary '\0','2024-03-02 02:06:30.799318',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','leonuhn@gmail.com',_binary '\0',_binary '\0',_binary '\0','Polawat',_binary '\0',_binary '\0',_binary '\0','Polawat Khunthikul',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Khunthikul',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','$2a$10$W.p9YxQJLzsCFQyhqP8Zoe2/wYpDIRLG2MQ44Iy9IGX1nauFtqW7K',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','5211b165-63ea-4b09-b34b-aadf2fb888b8',_binary '\0','2024-03-02 02:06:34.976801',_binary '','Polawat Khunthikul',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(73,78,1,NULL,_binary '\0','2024-03-02 02:06:30.799318',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0','leonuhn@gmail.com',_binary '\0',_binary '\0',_binary '\0','Polawat',_binary '\0',_binary '\0',_binary '\0','Polawat Khunthikul',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0','Khunthikul',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','$2a$10$wpLR9/EcRKGw36EXd9Tt2u5O23RMKxSxFZ2tdNMLlcx2y2mDdipPy',_binary '',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0','GOOGLE',_binary '\0','CLASSIC',_binary '\0','ACTIVATED',_binary '\0','5211b165-63ea-4b09-b34b-aadf2fb888b8',_binary '\0','2024-03-02 02:06:45.335231',_binary '','Polawat Khunthikul',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0'),(79,82,0,NULL,_binary '\0','2024-03-04 02:24:58.389550',_binary '',NULL,_binary '\0',_binary '\0',_binary '','46n9vdp2vn@privaterelay.appleid.com',_binary '',_binary '\0',_binary '','',_binary '',_binary '\0',_binary '',' ',_binary '',_binary '',_binary '',_binary '\0',_binary '','',_binary '',_binary '\0',_binary '',_binary '\0',_binary '','$2a$10$h5Xs41aukIafSGZFdbatuuhHLnr8GYnttGVVnyiwwHZvBIOCmN3WC',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0','APPLE',_binary '','CLASSIC',_binary '','ACTIVATED',_binary '','b51f4d94-7a2a-4636-b972-91f9cf7324c8',_binary '','2024-03-04 02:24:58.389619',_binary '','46n9vdp2vn@privaterelay.appleid.com',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0',_binary '',_binary ''),(80,81,0,NULL,_binary '\0','2024-03-04 02:24:58.389837',_binary '',NULL,_binary '\0',_binary '\0',_binary '','46n9vdp2vn@privaterelay.appleid.com',_binary '',_binary '\0',_binary '','',_binary '',_binary '\0',_binary '',' ',_binary '',_binary '',_binary '',_binary '\0',_binary '','',_binary '',_binary '\0',_binary '',_binary '\0',_binary '','$2a$10$QP9/9TNUMMfdzPKycppu8OpZH58Sf0JMIHJ1UqvhNinYCUegh0snu',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0','APPLE',_binary '','CLASSIC',_binary '','ACTIVATED',_binary '','1829fba2-db5f-402f-8163-1f2a7b3f4279',_binary '','2024-03-04 02:24:58.389853',_binary '','46n9vdp2vn@privaterelay.appleid.com',_binary '',NULL,_binary '\0',_binary '\0',_binary '',NULL,_binary '\0',_binary '',_binary '');
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

-- Dump completed on 2024-03-04 19:35:46
