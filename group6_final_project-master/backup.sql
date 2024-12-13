-- MySQL dump 10.13  Distrib 9.0.1, for macos14.7 (x86_64)
--
-- Host: localhost    Database: group6_meal_planner_project
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `meal_planner`
--

DROP TABLE IF EXISTS `meal_planner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal_planner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `chosen_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ECE2C578A76ED395` (`user_id`),
  CONSTRAINT `FK_ECE2C578A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_planner`
--

LOCK TABLES `meal_planner` WRITE;
/*!40000 ALTER TABLE `meal_planner` DISABLE KEYS */;
/*!40000 ALTER TABLE `meal_planner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal_planner_recipe`
--

DROP TABLE IF EXISTS `meal_planner_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal_planner_recipe` (
  `meal_planner_id` int NOT NULL,
  `recipe_id` int NOT NULL,
  PRIMARY KEY (`meal_planner_id`,`recipe_id`),
  KEY `IDX_73A42DC0C42A5C6B` (`meal_planner_id`),
  KEY `IDX_73A42DC059D8A214` (`recipe_id`),
  CONSTRAINT `FK_73A42DC059D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_73A42DC0C42A5C6B` FOREIGN KEY (`meal_planner_id`) REFERENCES `meal_planner` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_planner_recipe`
--

LOCK TABLES `meal_planner_recipe` WRITE;
/*!40000 ALTER TABLE `meal_planner_recipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `meal_planner_recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messenger_messages`
--

LOCK TABLES `messenger_messages` WRITE;
/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredients` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cooking_time` int NOT NULL,
  `preparation_time` int NOT NULL,
  `calories` int NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `date_updated` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DA88B137F675F31B` (`author_id`),
  CONSTRAINT `FK_DA88B137F675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (3,1,'rrw','frwerew','rwre','rwerew',32,2333,43,'43','Vegan','2024-12-10 10:12:30','2024-12-10 14:26:00',1),(4,2,'grg34','grg3rg34','grgre','gwrgw',23,324,2434,'fwef','Vegan','2024-12-10 14:54:26','2024-12-11 13:27:31',1),(5,2,'ferger','vrev','vervre','vrevre',33,33,33,'few','Vegan','2024-12-11 10:05:06',NULL,1),(6,2,'efe','fefe','fefe','fefe',22,22,22,'fef','Vegan','2024-12-11 10:06:40',NULL,1),(7,2,'fewf','fwfwe','fefw','fwe',2,2,2,'cds','Vegan','2024-12-11 10:08:42',NULL,1),(8,2,'fe','fe','fe','fe',2,2,2,'fe','Vegan','2024-12-11 10:15:47','2024-12-12 17:16:28',1),(9,2,'fsfs','sdfsd','fsdfs','33',33,33,33,'fs','Vegan','2024-12-11 12:14:06',NULL,0),(10,1,'ferffefer','efe','fefe','fefe',22,22,22,'de','Vegan','2024-12-11 12:51:03','2024-12-11 13:40:04',1),(11,1,'dwedw','dwed','edwe','dwedw',11,11,11,'e3','Vegan','2024-12-11 12:51:42',NULL,0),(12,1,'fewewew','dewdew','dewdew','dewdw',11,11,11,'vevr','Vegan','2024-12-11 13:00:15',NULL,1),(13,1,'AdminMeal','fefe','fefe','fefe',1,1,1,'a','Vegan','2024-12-11 13:38:52',NULL,1);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` int DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`),
  CONSTRAINT `user_chk_1` CHECK (json_valid(`roles`))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin@mail.com','[\"ROLE_ADMIN\"]','$2y$13$fmTS7GRAJQWOwWENpN6ssexNcfelsMjC9gznUqKF0GJDRChOKOTlG','Admin','Test',NULL,660123456,0),(2,'test@mail.com','[]','$2y$13$WJ1N4PKluBpbBqX34wXD/.hCSmcvLnBHfPNfL5lkGZXeC/dWAwBL.','Test','Test','fnfe',25468,0),(3,'test1@mail.com','[]','$2y$13$PhXZ.hsDKi1Ah5314zVrteATkx4paMQGiW0BL6o6Bd8rQaYfW90Le','Test','Teste','fe',555,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-12 18:48:36
