CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.31

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add tbl attraction',1,'add_tblattraction'),(2,'Can change tbl attraction',1,'change_tblattraction'),(3,'Can delete tbl attraction',1,'delete_tblattraction'),(4,'Can view tbl attraction',1,'view_tblattraction'),(5,'Can add tbl city',2,'add_tblcity'),(6,'Can change tbl city',2,'change_tblcity'),(7,'Can delete tbl city',2,'delete_tblcity'),(8,'Can view tbl city',2,'view_tblcity'),(9,'Can add tbl member',3,'add_tblmember'),(10,'Can change tbl member',3,'change_tblmember'),(11,'Can delete tbl member',3,'delete_tblmember'),(12,'Can view tbl member',3,'view_tblmember'),(13,'Can add tbl project',4,'add_tblproject'),(14,'Can change tbl project',4,'change_tblproject'),(15,'Can delete tbl project',4,'delete_tblproject'),(16,'Can view tbl project',4,'view_tblproject'),(17,'Can add tbl member password',5,'add_tblmemberpassword'),(18,'Can change tbl member password',5,'change_tblmemberpassword'),(19,'Can delete tbl member password',5,'delete_tblmemberpassword'),(20,'Can view tbl member password',5,'view_tblmemberpassword'),(21,'Can add tbl administrator',6,'add_tbladministrator'),(22,'Can change tbl administrator',6,'change_tbladministrator'),(23,'Can delete tbl administrator',6,'delete_tbladministrator'),(24,'Can view tbl administrator',6,'view_tbladministrator'),(25,'Can add tbl project attraction',7,'add_tblprojectattraction'),(26,'Can change tbl project attraction',7,'change_tblprojectattraction'),(27,'Can delete tbl project attraction',7,'delete_tblprojectattraction'),(28,'Can view tbl project attraction',7,'view_tblprojectattraction'),(29,'Can add tbl admin password',8,'add_tbladminpassword'),(30,'Can change tbl admin password',8,'change_tbladminpassword'),(31,'Can delete tbl admin password',8,'delete_tbladminpassword'),(32,'Can view tbl admin password',8,'view_tbladminpassword'),(33,'Can add tbl attraction',9,'add_tblattraction'),(34,'Can change tbl attraction',9,'change_tblattraction'),(35,'Can delete tbl attraction',9,'delete_tblattraction'),(36,'Can view tbl attraction',9,'view_tblattraction'),(37,'Can add tbl city',10,'add_tblcity'),(38,'Can change tbl city',10,'change_tblcity'),(39,'Can delete tbl city',10,'delete_tblcity'),(40,'Can view tbl city',10,'view_tblcity'),(41,'Can add tbl member',11,'add_tblmember'),(42,'Can change tbl member',11,'change_tblmember'),(43,'Can delete tbl member',11,'delete_tblmember'),(44,'Can view tbl member',11,'view_tblmember'),(45,'Can add tbl project',12,'add_tblproject'),(46,'Can change tbl project',12,'change_tblproject'),(47,'Can delete tbl project',12,'delete_tblproject'),(48,'Can view tbl project',12,'view_tblproject'),(49,'Can add tbl administrator',13,'add_tbladministrator'),(50,'Can change tbl administrator',13,'change_tbladministrator'),(51,'Can delete tbl administrator',13,'delete_tbladministrator'),(52,'Can view tbl administrator',13,'view_tbladministrator'),(53,'Can add tbl project attraction',14,'add_tblprojectattraction'),(54,'Can change tbl project attraction',14,'change_tblprojectattraction'),(55,'Can delete tbl project attraction',14,'delete_tblprojectattraction'),(56,'Can view tbl project attraction',14,'view_tblprojectattraction'),(57,'Can add tbl administrator',15,'add_tbladministrator'),(58,'Can change tbl administrator',15,'change_tbladministrator'),(59,'Can delete tbl administrator',15,'delete_tbladministrator'),(60,'Can view tbl administrator',15,'view_tbladministrator'),(61,'Can add tbl attraction',16,'add_tblattraction'),(62,'Can change tbl attraction',16,'change_tblattraction'),(63,'Can delete tbl attraction',16,'delete_tblattraction'),(64,'Can view tbl attraction',16,'view_tblattraction'),(65,'Can add tbl city',17,'add_tblcity'),(66,'Can change tbl city',17,'change_tblcity'),(67,'Can delete tbl city',17,'delete_tblcity'),(68,'Can view tbl city',17,'view_tblcity'),(69,'Can add tbl member',18,'add_tblmember'),(70,'Can change tbl member',18,'change_tblmember'),(71,'Can delete tbl member',18,'delete_tblmember'),(72,'Can view tbl member',18,'view_tblmember'),(73,'Can add tbl project',19,'add_tblproject'),(74,'Can change tbl project',19,'change_tblproject'),(75,'Can delete tbl project',19,'delete_tblproject'),(76,'Can view tbl project',19,'view_tblproject'),(77,'Can add tbl admin password',20,'add_tbladminpassword'),(78,'Can change tbl admin password',20,'change_tbladminpassword'),(79,'Can delete tbl admin password',20,'delete_tbladminpassword'),(80,'Can view tbl admin password',20,'view_tbladminpassword'),(81,'Can add tbl member password',21,'add_tblmemberpassword'),(82,'Can change tbl member password',21,'change_tblmemberpassword'),(83,'Can delete tbl member password',21,'delete_tblmemberpassword'),(84,'Can view tbl member password',21,'view_tblmemberpassword'),(85,'Can add tbl project attraction',22,'add_tblprojectattraction'),(86,'Can change tbl project attraction',22,'change_tblprojectattraction'),(87,'Can delete tbl project attraction',22,'delete_tblprojectattraction'),(88,'Can view tbl project attraction',22,'view_tblprojectattraction'),(89,'Can add log entry',23,'add_logentry'),(90,'Can change log entry',23,'change_logentry'),(91,'Can delete log entry',23,'delete_logentry'),(92,'Can view log entry',23,'view_logentry'),(93,'Can add permission',24,'add_permission'),(94,'Can change permission',24,'change_permission'),(95,'Can delete permission',24,'delete_permission'),(96,'Can view permission',24,'view_permission'),(97,'Can add group',25,'add_group'),(98,'Can change group',25,'change_group'),(99,'Can delete group',25,'delete_group'),(100,'Can view group',25,'view_group'),(101,'Can add user',26,'add_user'),(102,'Can change user',26,'change_user'),(103,'Can delete user',26,'delete_user'),(104,'Can view user',26,'view_user'),(105,'Can add content type',27,'add_contenttype'),(106,'Can change content type',27,'change_contenttype'),(107,'Can delete content type',27,'delete_contenttype'),(108,'Can view content type',27,'view_contenttype'),(109,'Can add session',28,'add_session'),(110,'Can change session',28,'change_session'),(111,'Can delete session',28,'delete_session'),(112,'Can view session',28,'view_session');
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
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (23,'admin','logentry'),(25,'auth','group'),(24,'auth','permission'),(26,'auth','user'),(15,'Backstage','tbladministrator'),(20,'Backstage','tbladminpassword'),(16,'Backstage','tblattraction'),(17,'Backstage','tblcity'),(18,'Backstage','tblmember'),(21,'Backstage','tblmemberpassword'),(19,'Backstage','tblproject'),(22,'Backstage','tblprojectattraction'),(27,'contenttypes','contenttype'),(6,'Login','tbladministrator'),(8,'Login','tbladminpassword'),(1,'Login','tblattraction'),(2,'Login','tblcity'),(3,'Login','tblmember'),(5,'Login','tblmemberpassword'),(4,'Login','tblproject'),(7,'Login','tblprojectattraction'),(13,'main','tbladministrator'),(9,'main','tblattraction'),(10,'main','tblcity'),(11,'main','tblmember'),(12,'main','tblproject'),(14,'main','tblprojectattraction'),(28,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'Backstage','0001_initial','2022-12-21 23:31:14.544652'),(2,'Backstage','0002_delete_tblpicture_delete_tblprojectattraction','2022-12-21 23:31:14.550635'),(3,'Backstage','0003_tblprojectattraction','2022-12-21 23:31:14.552631'),(4,'Login','0001_initial','2022-12-21 23:31:14.557618'),(5,'Login','0002_tbladministrator_tblprojectattraction_and_more','2022-12-21 23:31:14.560609'),(6,'contenttypes','0001_initial','2022-12-21 23:31:14.587807'),(7,'auth','0001_initial','2022-12-21 23:31:14.891671'),(8,'admin','0001_initial','2022-12-21 23:31:14.959496'),(9,'admin','0002_logentry_remove_auto_add','2022-12-21 23:31:14.966479'),(10,'admin','0003_logentry_add_action_flag_choices','2022-12-21 23:31:14.972463'),(11,'contenttypes','0002_remove_content_type_name','2022-12-21 23:31:15.033943'),(12,'auth','0002_alter_permission_name_max_length','2022-12-21 23:31:15.067933'),(13,'auth','0003_alter_user_email_max_length','2022-12-21 23:31:15.086883'),(14,'auth','0004_alter_user_username_opts','2022-12-21 23:31:15.092868'),(15,'auth','0005_alter_user_last_login_null','2022-12-21 23:31:15.125680'),(16,'auth','0006_require_contenttypes_0002','2022-12-21 23:31:15.127689'),(17,'auth','0007_alter_validators_add_error_messages','2022-12-21 23:31:15.133673'),(18,'auth','0008_alter_user_username_max_length','2022-12-21 23:31:15.169577'),(19,'auth','0009_alter_user_last_name_max_length','2022-12-21 23:31:15.206524'),(20,'auth','0010_alter_group_name_max_length','2022-12-21 23:31:15.222453'),(21,'auth','0011_update_proxy_permissions','2022-12-21 23:31:15.233424'),(22,'auth','0012_alter_user_first_name_max_length','2022-12-21 23:31:15.266788'),(23,'main','0001_initial','2022-12-21 23:31:15.274768'),(24,'main','0002_tbladministrator_tblprojectattraction_and_more','2022-12-21 23:31:15.279754'),(25,'main','0003_remove_tblmemberpassword_id_member_passward_and_more','2022-12-21 23:31:15.283743'),(26,'sessions','0001_initial','2022-12-21 23:31:15.302706');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1mngkkt1igc7j8c2ome1w2zlhsn2yq8t','.eJyrVspMiS8oys9KTS5RsjLVUSpUslKKKTU1TjMAkYbmSjpKpcWpRfF5ibmpQCmP_PLEohSYYGaKkpWRWS0A984VrQ:1pB9zf:mWBQtPSl_R8ES6-J91qrNYbmkxG8BJLEgLmfaTqr5R4','2023-01-13 15:39:55.362197'),('cs8fhej7ewlhdp6m9cq4t04wvjly8q2j','eyJ1c2VyX2lkIjoyNiwidXNlcl9uYW1lIjoiSG93YXJkIiwiaWRfcHJvamVjdCI6MTAsInEiOiJcdTlhZDhcdTk2YzQifQ:1pB9pm:8fK0LATT3ZtLs_EXrf3yg4hoRgsT4v9NcuYpBUPsQQU','2023-01-13 15:29:42.374114');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_administrator`
--

DROP TABLE IF EXISTS `tbl_administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_administrator` (
  `id_administrator` int NOT NULL AUTO_INCREMENT,
  `account` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id_administrator`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_administrator`
--

LOCK TABLES `tbl_administrator` WRITE;
/*!40000 ALTER TABLE `tbl_administrator` DISABLE KEYS */;
INSERT INTO `tbl_administrator` VALUES (1,'et.commodo.at@gmail.com','ridiculusmus'),(2,'sit@gmail.com','acttouf'),(3,'nunc@gmail.com','auctorodio'),(4,'elit.sed@gmail.com','mauris125'),(5,'quisque.fringilla.euismod@gmail.com','incondimentumdonec');
/*!40000 ALTER TABLE `tbl_administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_attraction`
--

DROP TABLE IF EXISTS `tbl_attraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_attraction` (
  `id_attraction` int NOT NULL AUTO_INCREMENT,
  `id_city_a` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `detail` varchar(2000) NOT NULL,
  `picture` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id_attraction`),
  KEY `id_city_idx_attraction` (`id_city_a`),
  CONSTRAINT `id_city_attraction` FOREIGN KEY (`id_city_a`) REFERENCES `tbl_city` (`id_city`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_attraction`
--

LOCK TABLES `tbl_attraction` WRITE;
/*!40000 ALTER TABLE `tbl_attraction` DISABLE KEYS */;
INSERT INTO `tbl_attraction` VALUES (1,1,'101','台北有名的地理建築','https://th.bing.com/th/id/OIP.H0A9ErWN9E88NdPTe1ou8wHaE7?w=282&h=187&c=7&r=0&o=5&dpr=1.5&pid=1.7'),(2,1,'小巨蛋','台北有名的地理建築','https://th.bing.com/th/id/R.78643def35fe6ee84d945cb8cd38e142?rik=pI6TjPLGtqOo%2bw&riu=http%3a%2f%2ffarm1.static.flickr.com%2f175%2f389910168_af2ee9a9f2_o.jpg&ehk=h3fg2etK27g5wLdVCcQsbn0Py%2fJ5VW7uTx7LPG4Pbmc%3d&risl=1&pid=ImgRaw&r=0'),(3,1,'艋舺龍山寺','台北有名的歷史建築','https://th.bing.com/th/id/OIP.o9Ehmrxyk9bFZDgRYTdR5QHaE8?w=267&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7'),(4,2,'85大樓','高雄有名的地理建築','https://th.bing.com/th/id/OIP.cJGcNNuGC2U6uUrrvN8z7AHaE7?w=270&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7'),(5,2,'駁二特區','高雄有名的文藝景點','https://img.onl/kFvOEv'),(6,2,'愛河','高雄有名的觀光景點','https://th.bing.com/th/id/R.dbfda32cfbfa79de10a02b62ff70a428?rik=5NMxXCteCkwUEA&riu=http%3a%2f%2fwww.easytravel.com.tw%2fupload%2fAttachments%2fA34339.jpg&ehk=u8FQmGlIurnI1Xj%2bErBYtH%2fe4w33IWJmtAKsRSWTJP0%3d&risl=&pid=ImgRaw&r=0'),(7,3,'鵝鑾鼻燈塔','屏東有名的地理建築','https://th.bing.com/th/id/OIP.L2Vs2abUUB8Ya2-bSkOlhgHaE7?w=260&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7'),(8,3,'墾丁大街','屏東有名的觀光景點','https://img.onl/7vWwql'),(9,3,'國立海洋生物博物館','屏東有名的觀光景點','https://img.onl/bQc7OE'),(10,4,'台中歌劇院','台中有名的文藝景點','https://img.onl/Zw78VZ'),(11,4,'高美濕地','台中有名的觀光景點','https://th.bing.com/th/id/OIP.l5H4CcH_hi9VlLgeZiwuvQHaE8?w=250&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7'),(12,4,'台中三井outlet','台中有名的百貨商城','https://th.bing.com/th/id/OIP.QUsHHuqe8MOU6jWzVS2EEQHaE7?w=265&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7'),(13,5,'藍田書院','南投有名的歷史建築','https://img.onl/XLX8gX'),(14,5,'茶二指','南投有名的文藝景點','https://th.bing.com/th/id/OIP.oP3VEfIaPzfeRH6SigDPXQHaE9?w=242&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7'),(15,5,'受天宮','南投有名的歷史建築','https://th.bing.com/th/id/OIP.yKIQ-wmtHZYfJCRuy7u_KAHaFj?w=227&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7');
/*!40000 ALTER TABLE `tbl_attraction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_city`
--

DROP TABLE IF EXISTS `tbl_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_city` (
  `id_city` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_city`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_city`
--

LOCK TABLES `tbl_city` WRITE;
/*!40000 ALTER TABLE `tbl_city` DISABLE KEYS */;
INSERT INTO `tbl_city` VALUES (1,'Taipei'),(2,'Kaohsiung'),(3,'Pingtung'),(4,'Taichung'),(5,'Nantou');
/*!40000 ALTER TABLE `tbl_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_member`
--

DROP TABLE IF EXISTS `tbl_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_member` (
  `id_member` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `gmail` varchar(45) NOT NULL,
  `create_time` datetime NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id_member`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_member`
--

LOCK TABLES `tbl_member` WRITE;
/*!40000 ALTER TABLE `tbl_member` DISABLE KEYS */;
INSERT INTO `tbl_member` VALUES (1,'Morris','morriskuo0314@gmail.com','2022-12-04 00:00:00','sitamet'),(2,'Roger','eric07241527@gmail.com','2022-12-04 00:00:00','mollis'),(3,'Josh','joshua.hsieh041@gmail.com','2022-12-04 00:00:00','gravidanon'),(4,'Octavius','nulla.semper.tellus@gmail.com','2022-01-05 00:00:00','elita'),(5,'Imani','proin.non@gmail.com','2022-01-25 00:00:00','uttincidunt'),(6,'Quinn','nam@gmail.com','2022-04-06 00:00:00','quisquetincidunt'),(7,'Hadassah','tincidunt.nibh.phasellus@gmaill.com','2023-12-03 00:00:00','aliquelobortis'),(8,'Carly','convallis.erat@gmail.com','2023-04-03 00:00:00','metusinlorem'),(9,'Sacha','consequat.enim@gmail.com','2023-01-20 00:00:00','urna'),(10,'Bell','sapien.gravida@gmail.com','2023-11-24 00:00:00','metusaliquam'),(11,'Yuri','aliquet.lobortis@gmail.com','2022-02-13 00:00:00','mloremvehicula'),(12,'Rae','pellentesque.eget@gmail.com','2022-04-12 00:00:00','massa'),(13,'Amanda','orci.consectetuer@gmail.com','2022-01-07 00:00:00','adipiscingelitetiam'),(14,'Ainsley','dui@gmail.com','2022-08-07 00:00:00','lectusnullamsuscipit'),(15,'Harding','ultricies.ornare@gmail.com','2021-12-12 00:00:00','donecfeugiatmetus'),(16,'Idola','egestas.blandit@gmail.com','2023-04-13 00:00:00','arcuvestibulum'),(17,'Paul','tincidunt@gmail.com','2022-07-09 00:00:00','interdumenim'),(18,'Quintessa','mauris.integer@gmail.com','2023-05-24 00:00:00','velitaliquanisl'),(19,'Amelia','commodo@gmail.com','2023-02-03 00:00:00','dictumauguemalesuada'),(20,'Arthur','dignissim@gmail.com','2023-09-30 00:00:00','iaculisaliquet'),(21,'Hayes','magnis@gmail.com','2023-08-03 00:00:00','necorci'),(22,'Quemby','auctor.velit.eget@gmail.com','2022-10-15 00:00:00','acfermentum'),(23,'Quamar','mattis.integer.eu@gmail.com','2023-02-19 00:00:00','habitant'),(24,'Arden','orci@gmail.com','2023-10-03 00:00:00','tellususpendissesed'),(25,'Ferris','a.feugiat@gmail.com','2023-10-26 00:00:00','loerjeo'),(26,'Howard','howardisbest@gmail.com','2022-12-23 23:08:48','easy159230');
/*!40000 ALTER TABLE `tbl_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_project`
--

DROP TABLE IF EXISTS `tbl_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_project` (
  `id_project` int NOT NULL AUTO_INCREMENT,
  `id_member_project` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `start_time` date DEFAULT NULL,
  PRIMARY KEY (`id_project`),
  KEY `id_member_idx_project` (`id_member_project`),
  CONSTRAINT `id_member_project` FOREIGN KEY (`id_member_project`) REFERENCES `tbl_member` (`id_member`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_project`
--

LOCK TABLES `tbl_project` WRITE;
/*!40000 ALTER TABLE `tbl_project` DISABLE KEYS */;
INSERT INTO `tbl_project` VALUES (2,2,'南投一日遊','2023-01-01 00:00:00','2023-01-01 00:00:00','2023-01-02'),(3,1,'台南一日遊','2022-12-21 23:58:13','2022-12-24 22:57:46','2022-12-31'),(4,1,'高雄一日遊','2022-12-23 21:23:32','2022-12-23 23:59:47',NULL),(5,26,'台南一日遊','2022-12-23 23:09:57','2022-12-30 15:26:36','2022-12-30'),(10,26,'Howard gogo','2022-12-30 15:29:11','2022-12-30 15:29:28','2022-12-21');
/*!40000 ALTER TABLE `tbl_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_project_attraction`
--

DROP TABLE IF EXISTS `tbl_project_attraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_project_attraction` (
  `id_project_pa` int NOT NULL,
  `id_attraction_pa` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbl_project_has_tbl_attraction_tbl_attraction1_idx` (`id_attraction_pa`),
  KEY `fk_tbl_project_has_tbl_attraction_tbl_project1_idx` (`id_project_pa`),
  CONSTRAINT `fk_tbl_project_has_tbl_attraction_tbl_attraction1` FOREIGN KEY (`id_attraction_pa`) REFERENCES `tbl_attraction` (`id_attraction`),
  CONSTRAINT `fk_tbl_project_has_tbl_attraction_tbl_project1` FOREIGN KEY (`id_project_pa`) REFERENCES `tbl_project` (`id_project`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_project_attraction`
--

LOCK TABLES `tbl_project_attraction` WRITE;
/*!40000 ALTER TABLE `tbl_project_attraction` DISABLE KEYS */;
INSERT INTO `tbl_project_attraction` VALUES (2,2,2,NULL),(3,6,4,'12:55:00'),(3,4,6,NULL),(3,15,9,'23:55:00'),(4,2,13,NULL),(4,3,14,NULL),(5,1,18,'19:37:00'),(5,2,30,'07:34:00'),(5,3,31,'12:00:00'),(10,1,32,'00:00:00'),(10,3,33,'17:05:00'),(10,2,34,'00:00:00');
/*!40000 ALTER TABLE `tbl_project_attraction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-01 14:31:39
