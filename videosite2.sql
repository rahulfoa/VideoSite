-- MySQL dump 10.13  Distrib 8.0.15, for osx10.13 (x86_64)
--
-- Host: localhost    Database: videosite2
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `api_categories`
--

DROP TABLE IF EXISTS `api_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `api_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_categories`
--

LOCK TABLES `api_categories` WRITE;
/*!40000 ALTER TABLE `api_categories` DISABLE KEYS */;
INSERT INTO `api_categories` VALUES (1,'Adventure'),(2,'cartoons'),(3,'Comedy'),(4,'Informative'),(5,'News'),(6,'Songs'),(7,'Sports');
/*!40000 ALTER TABLE `api_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_comments`
--

DROP TABLE IF EXISTS `api_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `api_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `userId_id` int(11) NOT NULL,
  `videoId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_comments_userId_id_02d90d70_fk_api_user_id` (`userId_id`),
  KEY `api_comments_videoId_id_b5309143_fk_api_video_id` (`videoId_id`),
  CONSTRAINT `api_comments_userId_id_02d90d70_fk_api_user_id` FOREIGN KEY (`userId_id`) REFERENCES `api_user` (`id`),
  CONSTRAINT `api_comments_videoId_id_b5309143_fk_api_video_id` FOREIGN KEY (`videoId_id`) REFERENCES `api_video` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_comments`
--

LOCK TABLES `api_comments` WRITE;
/*!40000 ALTER TABLE `api_comments` DISABLE KEYS */;
INSERT INTO `api_comments` VALUES (1,'Great Video','2019-02-24',4,2),(2,'good Song','2019-02-24',4,2);
/*!40000 ALTER TABLE `api_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_likes`
--

DROP TABLE IF EXISTS `api_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `api_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `positive` tinyint(1) NOT NULL,
  `userId_id` int(11) NOT NULL,
  `videoId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_likes_userId_id_d497e63b_fk_api_user_id` (`userId_id`),
  KEY `api_likes_videoId_id_770927b2_fk_api_video_id` (`videoId_id`),
  CONSTRAINT `api_likes_userId_id_d497e63b_fk_api_user_id` FOREIGN KEY (`userId_id`) REFERENCES `api_user` (`id`),
  CONSTRAINT `api_likes_videoId_id_770927b2_fk_api_video_id` FOREIGN KEY (`videoId_id`) REFERENCES `api_video` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_likes`
--

LOCK TABLES `api_likes` WRITE;
/*!40000 ALTER TABLE `api_likes` DISABLE KEYS */;
INSERT INTO `api_likes` VALUES (1,1,3,1),(2,1,3,2),(3,0,1,1);
/*!40000 ALTER TABLE `api_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_publisher`
--

DROP TABLE IF EXISTS `api_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `api_publisher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_publisher_user_id_4560aa54_fk_api_user_id` (`user_id`),
  CONSTRAINT `api_publisher_user_id_4560aa54_fk_api_user_id` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_publisher`
--

LOCK TABLES `api_publisher` WRITE;
/*!40000 ALTER TABLE `api_publisher` DISABLE KEYS */;
INSERT INTO `api_publisher` VALUES (1,1),(2,4);
/*!40000 ALTER TABLE `api_publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_user`
--

DROP TABLE IF EXISTS `api_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `api_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `publisherId` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `publisheriD` (`publisherId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_user`
--

LOCK TABLES `api_user` WRITE;
/*!40000 ALTER TABLE `api_user` DISABLE KEYS */;
INSERT INTO `api_user` VALUES (1,'pbkdf2_sha256$120000$8AyCHWpR7H8a$HyD+/u1prGVcVnSkLk4x0/sH/y/Pxr+NdF3sYCfHWLI=','2019-02-24 19:50:54.505032',1,'Rahul','Sharma',1,1,'2019-02-24 14:43:19.431875','rahul.foa@gmail.com','rahul.foa@gmail.com',NULL),(2,'pbkdf2_sha256$120000$4mummiDE88Sj$TzStXvj8dkPWAox8c7fnsmv6vscQH+B6rBw9Ft/p+XQ=',NULL,0,'ab','cd',0,1,'2019-02-24 19:52:21.400683',NULL,'abcd@gmail.com',NULL),(3,'pbkdf2_sha256$120000$6MAoSoky1G4e$BJLxsi5uiQAvKrWuMHNAxCoY45z1pSB7MwxJBEqMRDE=',NULL,1,'de','fg',0,1,'2019-02-24 19:53:55.573837',NULL,'defg@gmail.com',NULL),(4,'pbkdf2_sha256$120000$SzYsY0ZRGG6M$D0ExMku9yGH5QIjivnBESkjz2Mo/5IB9Be6IarLSLHs=',NULL,0,'publisher','publisher',0,1,'2019-02-24 19:54:41.897572',NULL,'publisher1@gmail.com',NULL),(5,'pbkdf2_sha256$120000$UizDMe5XS4kT$DCwGk3o9JR6daKjzbrNNsX/sQNCb25K1ndIxxC4qyUY=','2019-02-24 20:01:46.716189',0,'gh','vb',0,1,'2019-02-24 20:01:14.611451',NULL,'ghvb@gmail.com',NULL);
/*!40000 ALTER TABLE `api_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_user_groups`
--

DROP TABLE IF EXISTS `api_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `api_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_user_groups_user_id_group_id_9c7ddfb5_uniq` (`user_id`,`group_id`),
  KEY `api_user_groups_group_id_3af85785_fk_auth_group_id` (`group_id`),
  CONSTRAINT `api_user_groups_group_id_3af85785_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `api_user_groups_user_id_a5ff39fa_fk_api_user_id` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_user_groups`
--

LOCK TABLES `api_user_groups` WRITE;
/*!40000 ALTER TABLE `api_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_user_user_permissions`
--

DROP TABLE IF EXISTS `api_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `api_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_user_user_permissions_user_id_permission_id_a06dd704_uniq` (`user_id`,`permission_id`),
  KEY `api_user_user_permis_permission_id_305b7fea_fk_auth_perm` (`permission_id`),
  CONSTRAINT `api_user_user_permis_permission_id_305b7fea_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `api_user_user_permissions_user_id_f3945d65_fk_api_user_id` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_user_user_permissions`
--

LOCK TABLES `api_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `api_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_video`
--

DROP TABLE IF EXISTS `api_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `api_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `userId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_video_userId_id_1a2226d5_fk_api_publisher_id` (`userId_id`),
  CONSTRAINT `api_video_userId_id_1a2226d5_fk_api_publisher_id` FOREIGN KEY (`userId_id`) REFERENCES `api_publisher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_video`
--

LOCK TABLES `api_video` WRITE;
/*!40000 ALTER TABLE `api_video` DISABLE KEYS */;
INSERT INTO `api_video` VALUES (1,'Video1','pathtovideo1',2),(2,'Videos2','pathtovideo2',1);
/*!40000 ALTER TABLE `api_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_videocategory`
--

DROP TABLE IF EXISTS `api_videocategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `api_videocategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category1_id` int(11) NOT NULL,
  `category2_id` int(11) DEFAULT NULL,
  `category3_id` int(11) DEFAULT NULL,
  `category4_id` int(11) DEFAULT NULL,
  `category5_id` int(11) DEFAULT NULL,
  `videoId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `videoId_id` (`videoId_id`),
  KEY `api_videocategory_category2_id_320ac0bd_fk_api_categories_id` (`category2_id`),
  KEY `api_videocategory_category3_id_2dff5d4e_fk_api_categories_id` (`category3_id`),
  KEY `api_videocategory_category4_id_81580e9a_fk_api_categories_id` (`category4_id`),
  KEY `api_videocategory_category5_id_c008c8df_fk_api_categories_id` (`category5_id`),
  KEY `api_videocategory_category1_id_503201df_fk_api_categories_id` (`category1_id`),
  CONSTRAINT `api_videocategory_category1_id_503201df_fk_api_categories_id` FOREIGN KEY (`category1_id`) REFERENCES `api_categories` (`id`),
  CONSTRAINT `api_videocategory_category2_id_320ac0bd_fk_api_categories_id` FOREIGN KEY (`category2_id`) REFERENCES `api_categories` (`id`),
  CONSTRAINT `api_videocategory_category3_id_2dff5d4e_fk_api_categories_id` FOREIGN KEY (`category3_id`) REFERENCES `api_categories` (`id`),
  CONSTRAINT `api_videocategory_category4_id_81580e9a_fk_api_categories_id` FOREIGN KEY (`category4_id`) REFERENCES `api_categories` (`id`),
  CONSTRAINT `api_videocategory_category5_id_c008c8df_fk_api_categories_id` FOREIGN KEY (`category5_id`) REFERENCES `api_categories` (`id`),
  CONSTRAINT `api_videocategory_videoId_id_ba4525b1_fk_api_video_id` FOREIGN KEY (`videoId_id`) REFERENCES `api_video` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_videocategory`
--

LOCK TABLES `api_videocategory` WRITE;
/*!40000 ALTER TABLE `api_videocategory` DISABLE KEYS */;
INSERT INTO `api_videocategory` VALUES (1,2,3,NULL,NULL,NULL,1),(2,6,NULL,NULL,NULL,NULL,2);
/*!40000 ALTER TABLE `api_videocategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add user profile',7,'add_userprofile'),(26,'Can change user profile',7,'change_userprofile'),(27,'Can delete user profile',7,'delete_userprofile'),(28,'Can view user profile',7,'view_userprofile'),(29,'Can add categories',8,'add_categories'),(30,'Can change categories',8,'change_categories'),(31,'Can delete categories',8,'delete_categories'),(32,'Can view categories',8,'view_categories'),(33,'Can add comments',9,'add_comments'),(34,'Can change comments',9,'change_comments'),(35,'Can delete comments',9,'delete_comments'),(36,'Can view comments',9,'view_comments'),(37,'Can add likes',10,'add_likes'),(38,'Can change likes',10,'change_likes'),(39,'Can delete likes',10,'delete_likes'),(40,'Can view likes',10,'view_likes'),(41,'Can add video',11,'add_video'),(42,'Can change video',11,'change_video'),(43,'Can delete video',11,'delete_video'),(44,'Can view video',11,'view_video'),(45,'Can add video category',12,'add_videocategory'),(46,'Can change video category',12,'change_videocategory'),(47,'Can delete video category',12,'delete_videocategory'),(48,'Can view video category',12,'view_videocategory'),(49,'Can add publisher',13,'add_publisher'),(50,'Can change publisher',13,'change_publisher'),(51,'Can delete publisher',13,'delete_publisher'),(52,'Can view publisher',13,'view_publisher'),(53,'Can add Token',14,'add_token'),(54,'Can change Token',14,'change_token'),(55,'Can delete Token',14,'delete_token'),(56,'Can view Token',14,'view_token');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_api_user_id` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_api_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_api_user_id` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-02-24 14:44:07.044937','1','Publisher object (1)',1,'[{\"added\": {}}]',13,1),(2,'2019-02-24 19:51:05.279634','1','Adventure',1,'[{\"added\": {}}]',8,1),(3,'2019-02-24 19:51:08.984199','2','cartoons',1,'[{\"added\": {}}]',8,1),(4,'2019-02-24 19:51:12.324364','3','Comedy',1,'[{\"added\": {}}]',8,1),(5,'2019-02-24 19:51:15.797366','4','Informative',1,'[{\"added\": {}}]',8,1),(6,'2019-02-24 19:51:18.986598','5','News',1,'[{\"added\": {}}]',8,1),(7,'2019-02-24 19:51:22.023419','6','Songs',1,'[{\"added\": {}}]',8,1),(8,'2019-02-24 19:51:26.687404','7','Sports',1,'[{\"added\": {}}]',8,1),(9,'2019-02-24 19:52:21.540640','2','abcd@gmail.com',1,'[{\"added\": {}}]',6,1),(10,'2019-02-24 19:52:40.133169','2','abcd@gmail.com',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(11,'2019-02-24 19:53:55.706070','3','defg@gmail.com',1,'[{\"added\": {}}]',6,1),(12,'2019-02-24 19:54:03.771097','3','defg@gmail.com',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"is_superuser\"]}}]',6,1),(13,'2019-02-24 19:54:42.031945','4','publisher1@gmail.com',1,'[{\"added\": {}}]',6,1),(14,'2019-02-24 19:55:02.807141','4','publisher1@gmail.com',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(15,'2019-02-24 19:55:48.495739','2','publisher1@gmail.com',1,'[{\"added\": {}}]',13,1),(16,'2019-02-24 19:56:36.742467','1','Video1',1,'[{\"added\": {}}, {\"added\": {\"name\": \"video category\", \"object\": \"VideoCategory object (1)\"}}]',11,1),(17,'2019-02-24 19:57:04.251709','2','Videos2',1,'[{\"added\": {}}, {\"added\": {\"name\": \"video category\", \"object\": \"VideoCategory object (2)\"}}]',11,1),(18,'2019-02-24 19:57:27.590978','1','defg@gmail.com liked Video1',1,'[{\"added\": {}}]',10,1),(19,'2019-02-24 19:57:33.884875','2','defg@gmail.com liked Videos2',1,'[{\"added\": {}}]',10,1),(20,'2019-02-24 19:57:52.341993','3','rahul.foa@gmail.com Disliked Video1',1,'[{\"added\": {}}]',10,1),(21,'2019-02-24 19:58:17.247315','1','publisher1@gmail.com Commented on Video Videos2. Comment:\"Great Video\"',1,'[{\"added\": {}}]',9,1),(22,'2019-02-24 19:58:22.747810','1','publisher1@gmail.com Commented on Video Videos2. Comment:\"Great Video\"',2,'[]',9,1),(23,'2019-02-24 19:58:45.400779','2','publisher1@gmail.com Commented on Video Videos2. Comment:\"good Song\"',1,'[{\"added\": {}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(8,'api','categories'),(9,'api','comments'),(10,'api','likes'),(13,'api','publisher'),(6,'api','user'),(7,'api','userprofile'),(11,'api','video'),(12,'api','videocategory'),(3,'auth','group'),(2,'auth','permission'),(14,'authtoken','token'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-02-24 14:42:19.992445'),(2,'contenttypes','0002_remove_content_type_name','2019-02-24 14:42:20.042498'),(3,'auth','0001_initial','2019-02-24 14:42:20.198739'),(4,'auth','0002_alter_permission_name_max_length','2019-02-24 14:42:20.230775'),(5,'auth','0003_alter_user_email_max_length','2019-02-24 14:42:20.239920'),(6,'auth','0004_alter_user_username_opts','2019-02-24 14:42:20.247894'),(7,'auth','0005_alter_user_last_login_null','2019-02-24 14:42:20.256722'),(8,'auth','0006_require_contenttypes_0002','2019-02-24 14:42:20.263816'),(9,'auth','0007_alter_validators_add_error_messages','2019-02-24 14:42:20.271891'),(10,'auth','0008_alter_user_username_max_length','2019-02-24 14:42:20.280730'),(11,'auth','0009_alter_user_last_name_max_length','2019-02-24 14:42:20.289640'),(12,'api','0001_initial','2019-02-24 14:42:20.545679'),(13,'admin','0001_initial','2019-02-24 14:42:20.629667'),(14,'admin','0002_logentry_remove_auto_add','2019-02-24 14:42:20.640334'),(15,'admin','0003_logentry_add_action_flag_choices','2019-02-24 14:42:20.652061'),(16,'api','0002_auto_20190224_1045','2019-02-24 14:42:21.150487'),(17,'api','0003_auto_20190224_1407','2019-02-24 14:42:21.465537'),(18,'api','0004_auto_20190224_1416','2019-02-24 14:42:21.586990'),(19,'api','0005_auto_20190224_1417','2019-02-24 14:42:21.713249'),(20,'api','0006_auto_20190224_1421','2019-02-24 14:42:21.833314'),(21,'api','0007_auto_20190224_1428','2019-02-24 14:42:21.986212'),(22,'authtoken','0001_initial','2019-02-24 14:42:22.045212'),(23,'authtoken','0002_auto_20160226_1747','2019-02-24 14:42:22.147244'),(24,'sessions','0001_initial','2019-02-24 14:42:22.168332'),(25,'api','0008_auto_20190224_1945','2019-02-24 19:45:24.161053');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('16eu6ef42636eo2a4qvxu59apcr24g8c','ZDFkM2JlOWQ5NTAyODA3ZTRhZjUyOGU3OGZkZTU3MjI2NDIwM2M1NTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNDRmZThhNzYyNGM5YmM0MWEwMmZhMmViMGM0NmFmOWZjNDI0ZTM4In0=','2019-03-10 20:01:46.757133'),('7dc0vfzhbdeuu64s3zbybpwd8xo1bbcj','ZjVmZTdhYjA3MGRjMTVjY2EzYjU5MWYwZjI4Y2RjNDRkMzc1MTJkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZGZmOTJlNjVhNTZhY2FjZWMxN2YxNTJlOTRjNmFiN2MwYjk0NjlmIn0=','2019-03-10 19:39:54.069678');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-25  1:42:36
