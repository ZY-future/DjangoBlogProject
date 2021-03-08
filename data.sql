-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: BlogProject
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add blog type',7,'add_blogtype'),(26,'Can change blog type',7,'change_blogtype'),(27,'Can delete blog type',7,'delete_blogtype'),(28,'Can view blog type',7,'view_blogtype'),(29,'Can add blog',8,'add_blog'),(30,'Can change blog',8,'change_blog'),(31,'Can delete blog',8,'delete_blog'),(32,'Can view blog',8,'view_blog'),(33,'Can add read num',9,'add_readnum'),(34,'Can change read num',9,'change_readnum'),(35,'Can delete read num',9,'delete_readnum'),(36,'Can view read num',9,'view_readnum'),(37,'Can add read num',10,'add_readnum'),(38,'Can change read num',10,'change_readnum'),(39,'Can delete read num',10,'delete_readnum'),(40,'Can view read num',10,'view_readnum'),(41,'Can add read detail',11,'add_readdetail'),(42,'Can change read detail',11,'change_readdetail'),(43,'Can delete read detail',11,'delete_readdetail'),(44,'Can view read detail',11,'view_readdetail'),(45,'Can add comment',12,'add_comment'),(46,'Can change comment',12,'change_comment'),(47,'Can delete comment',12,'delete_comment'),(48,'Can view comment',12,'view_comment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$4xKJlAn1FYRZ$D2UvVsmkIIJGrJ3VNCdWRWkO1q59IIepfsstVAm9Jgc=','2021-03-01 15:44:18.032024',1,'fzy','','','123@qq.com',1,1,'2021-02-07 13:27:18.478817'),(2,'pbkdf2_sha256$150000$GemfvPkMnHqM$7FrpaMLw2LGu9tXXbeiZ5FXdUe4gkfH8EP48YpQYjBU=','2021-02-28 13:48:28.957831',1,'root','','','',1,1,'2021-02-26 23:58:42.469279'),(3,'pbkdf2_sha256$150000$yHsgfEH3XxMU$wQCCHlm15807WJWl9WfWlBDQi1YesZX+qOpNdQjykfI=','2021-02-28 21:09:01.588820',0,'zy399','','','zy133909345@outlook.com',0,1,'2021-02-28 21:09:01.069420'),(4,'pbkdf2_sha256$150000$MBPxXopKbasl$Zc1a5OxZZVoqnwV+cGHjFwJeh2gysLzxApTMKO1X1TM=','2021-02-28 21:14:16.989800',0,'zy34','','','46fg1@173.com',0,1,'2021-02-28 21:14:16.783929');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blog`
--

DROP TABLE IF EXISTS `blog_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `last_updated_time` datetime(6) NOT NULL,
  `author_id` int NOT NULL,
  `blog_type_id` int NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_blog_author_id_8791af69_fk_auth_user_id` (`author_id`),
  KEY `blog_blog_blog_type_id_de11bd65_fk_blog_blogtype_id` (`blog_type_id`),
  CONSTRAINT `blog_blog_author_id_8791af69_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_blog_blog_type_id_de11bd65_fk_blog_blogtype_id` FOREIGN KEY (`blog_type_id`) REFERENCES `blog_blogtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blog`
--

LOCK TABLES `blog_blog` WRITE;
/*!40000 ALTER TABLE `blog_blog` DISABLE KEYS */;
INSERT INTO `blog_blog` VALUES (4,'python笔记','2021-02-13 16:35:48.987047','2021-02-25 23:50:31.188944',1,2,'2019'),(5,'2020录取通知书查询','2021-02-13 16:36:25.029905','2021-02-13 16:36:25.029905',1,1,'2019'),(6,'第三篇','2021-02-13 16:38:46.023781','2021-02-13 16:38:46.023781',1,1,'2019'),(7,'java多线程笔记','2021-02-15 11:32:25.979154','2021-02-15 11:32:25.979154',1,3,'2019'),(8,'shell','2021-02-16 12:11:13.188568','2021-02-16 12:11:13.188568',1,1,'2019'),(9,'第1篇','2021-02-16 12:17:31.949175','2021-02-16 12:17:31.949175',1,1,'2019'),(10,'第2篇','2021-02-16 12:17:31.954180','2021-02-16 12:17:31.955173',1,1,'2019'),(11,'第3篇','2021-02-16 12:17:31.960160','2021-02-16 12:17:31.960160',1,1,'2019'),(12,'第4篇','2021-02-16 12:17:31.966114','2021-02-16 12:17:31.966114',1,1,'2019'),(13,'第5篇','2021-02-16 12:17:31.970103','2021-02-16 12:17:31.970103',1,1,'2019'),(14,'第6篇','2021-02-16 12:17:31.974093','2021-02-16 12:17:31.974093',1,1,'2019'),(15,'第7篇','2021-02-16 12:17:31.977085','2021-02-16 12:17:31.977085',1,1,'2019'),(16,'第8篇','2021-02-16 12:17:31.980077','2021-02-16 12:17:31.981075',1,1,'2019'),(17,'第9篇','2021-02-16 12:17:31.984066','2021-02-16 12:17:31.984066',1,1,'2019'),(18,'第10篇','2021-02-16 12:17:31.988056','2021-02-23 23:09:43.770737',1,1,'2019'),(19,'第11篇','2021-02-16 12:17:31.991078','2021-02-16 12:17:31.991078',1,1,'2019'),(20,'第12篇','2021-02-16 12:17:31.995037','2021-02-16 12:17:31.995037',1,1,'2019'),(21,'第13篇','2021-02-16 12:17:31.998029','2021-02-16 12:17:31.998029',1,1,'2019'),(22,'第14篇','2021-02-16 12:17:32.002018','2021-02-16 12:17:32.002018',1,1,'2019'),(23,'第15篇','2021-02-16 12:17:32.006008','2021-02-16 12:17:32.006008',1,1,'2019'),(24,'第16篇','2021-02-16 12:17:32.009028','2021-02-16 12:17:32.009028',1,1,'2019'),(25,'第17篇','2021-02-16 12:17:32.013987','2021-02-16 12:17:32.013987',1,1,'2019'),(26,'第18篇','2021-02-16 12:17:32.016978','2021-02-16 12:17:32.016978',1,1,'2019'),(27,'第19篇','2021-02-16 12:17:32.021035','2021-02-16 12:17:32.021035',1,1,'2019'),(28,'第20篇','2021-02-16 12:17:32.025024','2021-02-25 23:50:25.531496',1,1,'2019'),(29,'第21篇','2021-02-16 12:17:32.028946','2021-02-25 23:50:25.191251',1,1,'2019'),(30,'第22篇','2021-02-16 12:17:32.032965','2021-02-25 23:50:25.015721',1,1,'2019'),(31,'第23篇','2021-02-16 12:17:32.036955','2021-02-25 23:50:24.836778',1,1,'2019'),(32,'第24篇','2021-02-16 12:17:32.041912','2021-02-25 23:50:24.645615',1,1,'2019'),(33,'第25篇','2021-02-16 12:17:32.044953','2021-02-25 23:50:24.238424',1,1,'2019'),(34,'第26篇','2021-02-16 12:17:32.048961','2021-02-25 23:49:28.202369',1,1,'2019'),(35,'第27篇','2021-02-16 12:17:32.052882','2021-02-25 23:49:30.947971',1,1,'2019'),(36,'第28篇','2021-02-16 12:17:32.056871','2021-02-25 23:49:32.410115',1,1,'2019'),(37,'第29篇','2021-02-16 12:17:32.059934','2021-02-23 22:56:08.727739',1,1,'<p><img alt=\"\" src=\"/media/upload/2021/02/23/img_20201103_115558.jpg\" style=\"height:2647px; width:2471px\" />2019</p>'),(38,'第30篇','2021-12-16 12:17:32.063921','2021-02-23 23:13:40.930492',1,1,'<p><img alt=\"\" src=\"/media/upload/2021/02/23/mmexport1600786883978.jpg\" style=\"height:400px; width:500px\" />2019</p>'),(39,'元宵节','2021-02-26 22:01:36.628780','2021-02-26 22:01:36.628780',1,4,'<p>活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分活动方案ui书法国画u事发后是客服拉森钢板覅跨v部分</p>'),(40,'root用户的博客','2021-02-26 23:59:58.835116','2021-02-26 23:59:58.835116',2,2,'<p>django</p>');
/*!40000 ALTER TABLE `blog_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogtype`
--

DROP TABLE IF EXISTS `blog_blogtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_blogtype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogtype`
--

LOCK TABLES `blog_blogtype` WRITE;
/*!40000 ALTER TABLE `blog_blogtype` DISABLE KEYS */;
INSERT INTO `blog_blogtype` VALUES (1,'随笔'),(2,'python'),(3,'java'),(4,'其他');
/*!40000 ALTER TABLE `blog_blogtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_comment`
--

DROP TABLE IF EXISTS `comment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` int unsigned NOT NULL,
  `text` longtext NOT NULL,
  `comment_time` datetime(6) NOT NULL,
  `content_type_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_comment_content_type_id_fbfb9793_fk_django_co` (`content_type_id`),
  KEY `comment_comment_user_id_6078e57b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `comment_comment_content_type_id_fbfb9793_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `comment_comment_user_id_6078e57b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_comment`
--

LOCK TABLES `comment_comment` WRITE;
/*!40000 ALTER TABLE `comment_comment` DISABLE KEYS */;
INSERT INTO `comment_comment` VALUES (1,38,'123','2021-02-27 23:57:14.579611',8,1),(2,38,'一条新的评论','2021-02-28 00:04:55.928545',8,1),(3,38,'哇塞 \r\n大家看','2021-02-28 00:21:47.381919',8,1),(4,4,'hahahh','2021-02-28 21:14:43.934583',8,4),(5,38,'1231','2021-02-28 21:54:30.229830',8,1),(6,38,'999','2021-02-28 21:58:16.920429',8,1),(7,40,'rhftgejrk','2021-03-01 16:10:08.855522',8,1);
/*!40000 ALTER TABLE `comment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-02-07 13:49:43.226389','1','BlogType object (1)',1,'[{\"added\": {}}]',7,1),(2,'2021-02-07 13:49:50.760474','2','BlogType object (2)',1,'[{\"added\": {}}]',7,1),(3,'2021-02-07 13:50:07.359482','3','BlogType object (3)',1,'[{\"added\": {}}]',7,1),(4,'2021-02-07 13:53:06.984965','1','Blog object (1)',1,'[{\"added\": {}}]',8,1),(5,'2021-02-07 13:54:36.247160','2','<Blog:技术博客>',1,'[{\"added\": {}}]',8,1),(6,'2021-02-13 12:18:30.069440','3','<Blog:python笔记>',1,'[{\"added\": {}}]',8,1),(7,'2021-02-13 16:35:07.434783','3','<Blog:python笔记>',3,'',8,1),(8,'2021-02-13 16:35:07.442744','2','<Blog:技术博客>',3,'',8,1),(9,'2021-02-13 16:35:07.448738','1','<Blog:日志>',3,'',8,1),(10,'2021-02-13 16:35:48.988043','4','<Blog:python笔记>',1,'[{\"added\": {}}]',8,1),(11,'2021-02-13 16:36:25.031900','5','<Blog:2020录取通知书查询>',1,'[{\"added\": {}}]',8,1),(12,'2021-02-13 16:38:46.024780','6','<Blog:第三篇>',1,'[{\"added\": {}}]',8,1),(13,'2021-02-15 11:32:26.021739','7','<Blog:java多线程笔记>',1,'[{\"added\": {}}]',8,1),(14,'2021-02-16 11:17:20.885827','4','其他',1,'[{\"added\": {}}]',7,1),(15,'2021-02-23 20:37:58.086473','38','<Blog:第30篇>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(16,'2021-02-23 20:46:56.249165','37','<Blog:第29篇>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(17,'2021-02-23 21:08:04.568102','37','<Blog:第29篇>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(18,'2021-02-23 21:09:23.408258','38','<Blog:第30篇>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(19,'2021-02-23 22:54:21.163178','38','<Blog:第30篇>',2,'[{\"changed\": {\"fields\": [\"read_num\"]}}]',8,1),(20,'2021-02-26 09:31:22.275069','1','ReadNum object (1)',1,'[{\"added\": {}}]',9,1),(21,'2021-02-26 10:17:29.572531','1','ReadNum object (1)',1,'[{\"added\": {}}]',10,1),(22,'2021-02-26 10:33:28.549346','1','ReadNum object (1)',2,'[]',10,1),(23,'2021-02-26 16:37:37.735253','1','ReadDetail object (1)',1,'[{\"added\": {}}]',11,1),(24,'2021-02-26 22:01:36.630757','39','<Blog:元宵节>',1,'[{\"added\": {}}]',8,1),(25,'2021-02-26 22:04:49.853802','38','ReadNum object (38)',1,'[{\"added\": {}}]',10,1),(26,'2021-02-26 22:05:46.519401','38','ReadNum object (38)',3,'',10,1),(27,'2021-02-26 22:25:30.718777','37','ReadDetail object (37)',2,'[{\"changed\": {\"fields\": [\"date\"]}}]',11,1),(28,'2021-02-26 22:25:37.921563','36','ReadDetail object (36)',2,'[{\"changed\": {\"fields\": [\"date\"]}}]',11,1),(29,'2021-02-26 23:59:58.837329','40','<Blog:root用户的博客>',1,'[{\"added\": {}}]',8,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'blog','blog'),(7,'blog','blogtype'),(9,'blog','readnum'),(12,'comment','comment'),(5,'contenttypes','contenttype'),(11,'read_statistics','readdetail'),(10,'read_statistics','readnum'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-02-07 13:25:18.780395'),(2,'auth','0001_initial','2021-02-07 13:25:19.340612'),(3,'admin','0001_initial','2021-02-07 13:25:20.027911'),(4,'admin','0002_logentry_remove_auto_add','2021-02-07 13:25:20.185483'),(5,'admin','0003_logentry_add_action_flag_choices','2021-02-07 13:25:20.201102'),(6,'contenttypes','0002_remove_content_type_name','2021-02-07 13:25:20.310415'),(7,'auth','0002_alter_permission_name_max_length','2021-02-07 13:25:20.388521'),(8,'auth','0003_alter_user_email_max_length','2021-02-07 13:25:20.435423'),(9,'auth','0004_alter_user_username_opts','2021-02-07 13:25:20.451035'),(10,'auth','0005_alter_user_last_login_null','2021-02-07 13:25:20.529151'),(11,'auth','0006_require_contenttypes_0002','2021-02-07 13:25:20.529151'),(12,'auth','0007_alter_validators_add_error_messages','2021-02-07 13:25:20.544738'),(13,'auth','0008_alter_user_username_max_length','2021-02-07 13:25:20.700948'),(14,'auth','0009_alter_user_last_name_max_length','2021-02-07 13:25:20.858749'),(15,'auth','0010_alter_group_name_max_length','2021-02-07 13:25:20.890090'),(16,'auth','0011_update_proxy_permissions','2021-02-07 13:25:20.890090'),(17,'sessions','0001_initial','2021-02-07 13:25:20.920987'),(18,'blog','0001_initial','2021-02-07 13:28:32.325404'),(19,'blog','0002_auto_20210216_2025','2021-02-16 12:25:39.834156'),(20,'blog','0003_auto_20210217_0941','2021-02-17 01:41:38.324315'),(21,'blog','0004_auto_20210223_2045','2021-02-23 20:45:24.284619'),(22,'blog','0005_remove_blog_content','2021-02-23 21:00:54.617451'),(23,'blog','0006_blog_content','2021-02-23 21:06:30.677254'),(24,'blog','0007_blog_read_num','2021-02-23 22:53:00.699074'),(25,'blog','0008_auto_20210226_0929','2021-02-26 09:29:38.741443'),(26,'blog','0009_delete_readnum','2021-02-26 10:13:53.269457'),(27,'read_statistics','0001_initial','2021-02-26 10:13:53.310349'),(28,'read_statistics','0002_readdetail','2021-02-26 16:36:22.292315'),(29,'comment','0001_initial','2021-02-27 00:25:31.507760');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4xraufxduqs8m3j1jkbyy48506a2ut61','NmE2Yzg0N2Y0ZWNiOTVlNWY1ZjI5YTI4NTY2NmEyN2EwYjdiNzEwZTp7fQ==','2021-03-14 14:11:48.594387'),('oht8d7d7aiyedlgk6wdapq588zs4l6ez','NmE2Yzg0N2Y0ZWNiOTVlNWY1ZjI5YTI4NTY2NmEyN2EwYjdiNzEwZTp7fQ==','2021-03-14 14:09:15.692807'),('uv6nna7cwy3icz5nhtekd454kygg6ia4','NmE2Yzg0N2Y0ZWNiOTVlNWY1ZjI5YTI4NTY2NmEyN2EwYjdiNzEwZTp7fQ==','2021-03-14 14:08:50.764268'),('wicchk5o5y39io40oe8p3g56xmy5r4vb','YWNjZTIyNTkyMjg5MDBjNDZlN2RmM2RjYWY4NDNhNmM5YWJhOTZkNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNDUyMTYxZWE2MGFmYWI5ZTM5NWUyMDA5YmZlZjRkNmE3YzI2MDNkIn0=','2021-02-21 13:49:15.714028'),('xd6c9r9cx3puxvfbrqz0apz3a9bvd15m','NmE2Yzg0N2Y0ZWNiOTVlNWY1ZjI5YTI4NTY2NmEyN2EwYjdiNzEwZTp7fQ==','2021-03-14 21:09:01.583057'),('yz6nxbasjge9j744n1x873mk5gbmpuuj','YWNjZTIyNTkyMjg5MDBjNDZlN2RmM2RjYWY4NDNhNmM5YWJhOTZkNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNDUyMTYxZWE2MGFmYWI5ZTM5NWUyMDA5YmZlZjRkNmE3YzI2MDNkIn0=','2021-03-15 15:44:18.048057');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_cache_table`
--

DROP TABLE IF EXISTS `my_cache_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_cache_table` (
  `cache_key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `expires` datetime(6) NOT NULL,
  PRIMARY KEY (`cache_key`),
  KEY `my_cache_table_expires` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_cache_table`
--

LOCK TABLES `my_cache_table` WRITE;
/*!40000 ALTER TABLE `my_cache_table` DISABLE KEYS */;
INSERT INTO `my_cache_table` VALUES (':1:hot_blogs_for_7_days','gASVHwsAAAAAAACMFmRqYW5nby5kYi5tb2RlbHMucXVlcnmUjAhRdWVyeVNldJSTlCmBlH2UKIwFbW9kZWyUjAtibG9nLm1vZGVsc5SMBEJsb2eUk5SMA19kYpROjAZfaGludHOUfZSMBXF1ZXJ5lIwaZGphbmdvLmRiLm1vZGVscy5zcWwucXVlcnmUjAVRdWVyeZSTlCmBlH2UKGgFaAiMDmFsaWFzX3JlZmNvdW50lH2UKIwJYmxvZ19ibG9nlEsEjBpyZWFkX3N0YXRpc3RpY3NfcmVhZGRldGFpbJRLA3WMCWFsaWFzX21hcJSMC2NvbGxlY3Rpb25zlIwLT3JkZXJlZERpY3SUk5QpUpQoaBSMI2RqYW5nby5kYi5tb2RlbHMuc3FsLmRhdGFzdHJ1Y3R1cmVzlIwJQmFzZVRhYmxllJOUKYGUfZQojAp0YWJsZV9uYW1llGgUjAt0YWJsZV9hbGlhc5RoFHViaBVoG4wESm9pbpSTlCmBlH2UKGggaBWMDHBhcmVudF9hbGlhc5RoFGghaBWMCWpvaW5fdHlwZZSMCklOTkVSIEpPSU6UjAlqb2luX2NvbHOUjAJpZJSMCW9iamVjdF9pZJSGlIWUjApqb2luX2ZpZWxklIwiZGphbmdvLmNvbnRyaWIuY29udGVudHR5cGVzLmZpZWxkc5SMCkdlbmVyaWNSZWyUk5QpgZR9lCiMBWZpZWxklIwXZGphbmdvLmRiLm1vZGVscy5maWVsZHOUjAtfbG9hZF9maWVsZJSTlIwEYmxvZ5RoB4wMcmVhZF9kZXRhaWxzlIeUUpRoBYwWcmVhZF9zdGF0aXN0aWNzLm1vZGVsc5SMClJlYWREZXRhaWyUk5SMDHJlbGF0ZWRfbmFtZZSMASuUjBJyZWxhdGVkX3F1ZXJ5X25hbWWUTowQbGltaXRfY2hvaWNlc190b5R9lIwLcGFyZW50X2xpbmuUiYwJb25fZGVsZXRllIwZZGphbmdvLmRiLm1vZGVscy5kZWxldGlvbpSMCkRPX05PVEhJTkeUk5SMC3N5bW1ldHJpY2FslImMCG11bHRpcGxllIh1YowIbnVsbGFibGWUiIwRZmlsdGVyZWRfcmVsYXRpb26UTnVidYwQZXh0ZXJuYWxfYWxpYXNlc5SPlIwJdGFibGVfbWFwlH2UKGgUXZRoFGFoFV2UaBVhdYwMZGVmYXVsdF9jb2xzlImMEGRlZmF1bHRfb3JkZXJpbmeUiIwRc3RhbmRhcmRfb3JkZXJpbmeUiIwMdXNlZF9hbGlhc2VzlI+UjBBmaWx0ZXJfaXNfc3RpY2t5lImMCHN1YnF1ZXJ5lImMBnNlbGVjdJSMHGRqYW5nby5kYi5tb2RlbHMuZXhwcmVzc2lvbnOUjANDb2yUk5QpgZR9lCiMEV9jb25zdHJ1Y3Rvcl9hcmdzlGgUaDdoOGgHaCqHlFKUhpR9lIaUjAxvdXRwdXRfZmllbGSUaGKMBWFsaWFzlGgUjAZ0YXJnZXSUaGJ1YmhdKYGUfZQoaGBoFGg3aDhoB4wFdGl0bGWUh5RSlIaUfZSGlGhmaG1oZ2gUaGhobXVihpSMBXdoZXJllIwaZGphbmdvLmRiLm1vZGVscy5zcWwud2hlcmWUjAlXaGVyZU5vZGWUk5QpgZR9lCiMCGNoaWxkcmVulF2UKIwYZGphbmdvLmRiLm1vZGVscy5sb29rdXBzlIwLR3JlYXRlclRoYW6Uk5QpgZR9lCiMA2xoc5RoXSmBlH2UKGhgaBVoN4wPcmVhZF9zdGF0aXN0aWNzlGg9jARkYXRllIeUUpSGlH2UhpRoZmiFaGdoFWhoaIWMEmNvbnRhaW5zX2FnZ3JlZ2F0ZZSJdWKMA3Joc5SMCGRhdGV0aW1llIwEZGF0ZZSTlEMEB+UCF5SFlFKUjBRiaWxhdGVyYWxfdHJhbnNmb3Jtc5RdlGiJiXViaHqMCExlc3NUaGFulJOUKYGUfZQoaH9ogGiKaI1DBAflAwKUhZRSlGiRXZRoiYl1YmWMCWNvbm5lY3RvcpSMA0FORJSMB25lZ2F0ZWSUiWiJiXVijAt3aGVyZV9jbGFzc5RodYwIZ3JvdXBfYnmUaF5oaYaUjAhvcmRlcl9ieZSMDS1yZWFkX251bV9zdW2UhZSMCGxvd19tYXJrlEsAjAloaWdoX21hcmuUSweMCGRpc3RpbmN0lImMD2Rpc3RpbmN0X2ZpZWxkc5QpjBFzZWxlY3RfZm9yX3VwZGF0ZZSJjBhzZWxlY3RfZm9yX3VwZGF0ZV9ub3dhaXSUiYwdc2VsZWN0X2Zvcl91cGRhdGVfc2tpcF9sb2NrZWSUiYwUc2VsZWN0X2Zvcl91cGRhdGVfb2aUKYwOc2VsZWN0X3JlbGF0ZWSUiYwJbWF4X2RlcHRolEsFjA12YWx1ZXNfc2VsZWN0lGgqaGuGlIwMX2Fubm90YXRpb25zlGgZKVKUjAxyZWFkX251bV9zdW2UjBtkamFuZ28uZGIubW9kZWxzLmFnZ3JlZ2F0ZXOUjANTdW2Uk5QpgZR9lChoYIwWcmVhZF9kZXRhaWxzX19yZWFkX251bZSFlH2UhpRopomMBmZpbHRlcpROjBJzb3VyY2VfZXhwcmVzc2lvbnOUXZRoXSmBlH2UKGhgaBVoN2iCaD2MCHJlYWRfbnVtlIeUUpSGlH2UhpRoZmjDaGdoFWhoaMOMFV9vdXRwdXRfZmllbGRfb3Jfbm9uZZRow2iJiXViYYwFZXh0cmGUfZSMCmlzX3N1bW1hcnmUiWhmaMN1YnOMFmFubm90YXRpb25fc2VsZWN0X21hc2uUj5QoaLKQjBhfYW5ub3RhdGlvbl9zZWxlY3RfY2FjaGWUaBkpUpRosmi2c4wKY29tYmluYXRvcpROjA5jb21iaW5hdG9yX2FsbJSJjBBjb21iaW5lZF9xdWVyaWVzlCmMBl9leHRyYZROjBFleHRyYV9zZWxlY3RfbWFza5SPlIwTX2V4dHJhX3NlbGVjdF9jYWNoZZROjAxleHRyYV90YWJsZXOUKYwOZXh0cmFfb3JkZXJfYnmUKYwQZGVmZXJyZWRfbG9hZGluZ5QokZSIhpSME19maWx0ZXJlZF9yZWxhdGlvbnOUfZSMDWV4cGxhaW5fcXVlcnmUiYwOZXhwbGFpbl9mb3JtYXSUTowPZXhwbGFpbl9vcHRpb25zlH2UjA1fbG9va3VwX2pvaW5zlF2UKGgUaBVljApiYXNlX3RhYmxllGgUdWKMDV9yZXN1bHRfY2FjaGWUXZQofZQoaCpLJmhrjAjnrKwzMOevh5Rosks5dX2UKGgqSyhoa4wTcm9vdOeUqOaIt+eahOWNmuWuopRosksVdX2UKGgqSyVoa4wI56ysMjnnr4eUaLJLD3V9lChoKksnaGuMCeWFg+WuteiKgpRosksJdX2UKGgqSyRoa4wI56ysMjjnr4eUaLJLB3V9lChoKksjaGuMCOesrDI356+HlGiySwR1fZQoaCpLBGhrjAxweXRob27nrJTorrCUaLJLBHVljA5fc3RpY2t5X2ZpbHRlcpSJjApfZm9yX3dyaXRllImMGV9wcmVmZXRjaF9yZWxhdGVkX2xvb2t1cHOUKYwOX3ByZWZldGNoX2RvbmWUiYwWX2tub3duX3JlbGF0ZWRfb2JqZWN0c5R9lIwPX2l0ZXJhYmxlX2NsYXNzlGgAjA5WYWx1ZXNJdGVyYWJsZZSTlIwHX2ZpZWxkc5RoKmhrhpSMD19kamFuZ29fdmVyc2lvbpSMAzIuMpR1Yi4=','2021-03-02 02:09:26.000000');
/*!40000 ALTER TABLE `my_cache_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `read_statistics_readdetail`
--

DROP TABLE IF EXISTS `read_statistics_readdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `read_statistics_readdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `read_num` int NOT NULL,
  `object_id` int unsigned NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `read_statistics_read_content_type_id_589c7d92_fk_django_co` (`content_type_id`),
  CONSTRAINT `read_statistics_read_content_type_id_589c7d92_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `read_statistics_readdetail`
--

LOCK TABLES `read_statistics_readdetail` WRITE;
/*!40000 ALTER TABLE `read_statistics_readdetail` DISABLE KEYS */;
INSERT INTO `read_statistics_readdetail` VALUES (1,'2021-02-10',4,1,8),(2,'2021-02-26',7,37,8),(3,'2021-02-26',4,36,8),(4,'2021-02-26',3,35,8),(5,'2021-02-26',2,34,8),(6,'2021-02-26',2,33,8),(7,'2021-02-26',2,32,8),(8,'2021-02-26',3,31,8),(9,'2021-02-26',2,30,8),(10,'2021-02-26',1,29,8),(11,'2021-02-26',1,28,8),(12,'2021-02-26',1,27,8),(13,'2021-02-26',1,26,8),(14,'2021-02-26',1,25,8),(15,'2021-02-26',1,24,8),(16,'2021-02-26',1,23,8),(17,'2021-02-26',1,22,8),(18,'2021-02-26',1,21,8),(19,'2021-02-26',1,20,8),(20,'2021-02-26',1,19,8),(21,'2021-02-26',1,18,8),(22,'2021-02-26',1,17,8),(23,'2021-02-26',1,16,8),(24,'2021-02-26',1,15,8),(25,'2021-02-26',1,14,8),(26,'2021-02-26',1,13,8),(27,'2021-02-26',1,12,8),(28,'2021-02-26',1,11,8),(29,'2021-02-26',1,10,8),(30,'2021-02-26',1,9,8),(31,'2021-02-26',1,8,8),(32,'2021-02-26',1,7,8),(33,'2021-02-26',1,6,8),(34,'2021-02-26',1,5,8),(35,'2021-02-26',1,4,8),(36,'2021-02-23',14,38,8),(37,'2021-02-24',4,39,8),(38,'2021-02-26',1,38,8),(39,'2021-02-27',18,38,8),(40,'2021-02-27',8,40,8),(41,'2021-02-28',31,38,8),(42,'2021-02-28',7,40,8),(43,'2021-02-28',5,39,8),(44,'2021-02-28',1,37,8),(45,'2021-02-28',1,4,8),(46,'2021-03-01',7,38,8),(47,'2021-03-01',6,40,8),(48,'2021-03-01',3,36,8),(49,'2021-03-01',7,37,8),(50,'2021-03-01',2,4,8),(51,'2021-03-01',1,5,8),(52,'2021-03-01',1,35,8);
/*!40000 ALTER TABLE `read_statistics_readdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `read_statistics_readnum`
--

DROP TABLE IF EXISTS `read_statistics_readnum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `read_statistics_readnum` (
  `id` int NOT NULL AUTO_INCREMENT,
  `read_num` int NOT NULL,
  `object_id` int unsigned NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `read_statistics_read_content_type_id_560f0f39_fk_django_co` (`content_type_id`),
  CONSTRAINT `read_statistics_read_content_type_id_560f0f39_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `read_statistics_readnum`
--

LOCK TABLES `read_statistics_readnum` WRITE;
/*!40000 ALTER TABLE `read_statistics_readnum` DISABLE KEYS */;
INSERT INTO `read_statistics_readnum` VALUES (1,1,101,8),(2,2,20,8),(3,2,19,8),(4,2,18,8),(5,2,17,8),(6,73,38,8),(7,22,37,8),(8,5,35,8),(9,9,36,8),(10,4,34,8),(11,2,7,8),(12,2,8,8),(13,2,9,8),(14,2,10,8),(15,3,33,8),(16,2,32,8),(17,3,31,8),(18,2,30,8),(19,1,29,8),(20,1,28,8),(21,1,27,8),(22,1,26,8),(23,1,25,8),(24,1,24,8),(25,1,23,8),(26,1,22,8),(27,1,21,8),(28,1,16,8),(29,1,15,8),(30,1,14,8),(31,1,13,8),(32,1,12,8),(33,1,11,8),(34,1,6,8),(35,2,5,8),(36,6,4,8),(37,9,39,8),(39,21,40,8);
/*!40000 ALTER TABLE `read_statistics_readnum` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-02  1:37:17
