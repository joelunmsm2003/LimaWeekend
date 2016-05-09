-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: kanguro
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  `telefono` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2001597 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audience`
--

DROP TABLE IF EXISTS `audience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `costumer` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `process_file` varchar(100) DEFAULT NULL,
  `blacklist` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `costumer__idx` (`costumer`),
  KEY `name` (`name`),
  KEY `process_file` (`process_file`),
  KEY `blacklist` (`blacklist`),
  KEY `costumer` (`costumer`),
  CONSTRAINT `audience_ibfk_1` FOREIGN KEY (`costumer`) REFERENCES `costumers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5714 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audience`
--

LOCK TABLES `audience` WRITE;
/*!40000 ALTER TABLE `audience` DISABLE KEYS */;
/*!40000 ALTER TABLE `audience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audience_main`
--

DROP TABLE IF EXISTS `audience_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audience_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `costumer` int(11) DEFAULT NULL,
  `audience` int(11) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `costumer__idx` (`costumer`),
  KEY `audience__idx` (`audience`),
  KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=585212 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audience_main`
--

LOCK TABLES `audience_main` WRITE;
/*!40000 ALTER TABLE `audience_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `audience_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_event`
--

DROP TABLE IF EXISTS `auth_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_stamp` datetime DEFAULT NULL,
  `client_ip` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `user_id__idx` (`user_id`),
  KEY `time_stamp` (`time_stamp`),
  KEY `client_ip` (`client_ip`),
  KEY `origin` (`origin`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_event`
--

LOCK TABLES `auth_event` WRITE;
/*!40000 ALTER TABLE `auth_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (37,'Clientes'),(38,'Diloo');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_membership`
--

DROP TABLE IF EXISTS `auth_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id__idx` (`user_id`),
  KEY `group_id__idx` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_membership`
--

LOCK TABLES `auth_membership` WRITE;
/*!40000 ALTER TABLE `auth_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  KEY `name` (`name`),
  KEY `codename` (`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(100) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `costumer` int(11) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `registration_key` varchar(255) DEFAULT NULL,
  `registration_id` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `reset_password_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `costumer_id` (`costumer`),
  KEY `auth_user_costumer_5bbf52d2_uniq` (`costumer`),
  KEY `auth_user_costumer_2f58588ba440ad2e_uniq` (`costumer`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (117,'pbkdf2_sha256$15000$IzdCJ0Vr8x24$uPoV9wRRWuP3nRfQHAJvTvR7GnPIgmrXsO5e4iVWkEk=','2016-05-09 05:52:47',1,'root','','','',1,1,'2016-05-09 05:52:27',1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (250,117,38);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=285848 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist`
--

LOCK TABLES `blacklist` WRITE;
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklistcsv`
--

DROP TABLE IF EXISTS `blacklistcsv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklistcsv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_file` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `costumer` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blacklistcsv_4fdf976d` (`costumer`),
  KEY `process_file` (`process_file`),
  KEY `name` (`name`),
  CONSTRAINT `blacklistcsv_costumer_7ca80e7927caf72c_fk_costumers_id` FOREIGN KEY (`costumer`) REFERENCES `costumers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklistcsv`
--

LOCK TABLES `blacklistcsv` WRITE;
/*!40000 ALTER TABLE `blacklistcsv` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklistcsv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_taskmeta`
--

DROP TABLE IF EXISTS `celery_taskmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_taskmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `result` longtext,
  `date_done` datetime NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `celery_taskmeta_2ff6b945` (`hidden`),
  KEY `status` (`status`),
  KEY `date_done` (`date_done`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_taskmeta`
--

LOCK TABLES `celery_taskmeta` WRITE;
/*!40000 ALTER TABLE `celery_taskmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_taskmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_tasksetmeta`
--

DROP TABLE IF EXISTS `celery_tasksetmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_tasksetmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) NOT NULL,
  `result` longtext NOT NULL,
  `date_done` datetime NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskset_id` (`taskset_id`),
  KEY `celery_tasksetmeta_2ff6b945` (`hidden`),
  KEY `date_done` (`date_done`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_tasksetmeta`
--

LOCK TABLES `celery_tasksetmeta` WRITE;
/*!40000 ALTER TABLE `celery_tasksetmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_tasksetmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `costumer` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `costumer__idx` (`costumer`),
  KEY `rate__idx` (`rate`),
  KEY `status` (`status`),
  KEY `reference` (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costumers`
--

DROP TABLE IF EXISTS `costumers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costumers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commercial_name` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `legal_id` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `main` char(1) DEFAULT NULL,
  `auto_delivery` char(1) DEFAULT NULL,
  `proveedor` int(100) DEFAULT NULL,
  `validacion` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commercial_name` (`commercial_name`),
  KEY `short_name` (`short_name`),
  KEY `legal_id` (`legal_id`),
  KEY `address` (`address`),
  KEY `main` (`main`),
  KEY `auto_delivery` (`auto_delivery`),
  KEY `proveedor` (`proveedor`),
  KEY `validacion` (`validacion`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costumers`
--

LOCK TABLES `costumers` WRITE;
/*!40000 ALTER TABLE `costumers` DISABLE KEYS */;
INSERT INTO `costumers` VALUES (1,'DILOO','DILOO','','miraflores','T','F',6,0),(2,'OLO','OLO','20524476828','Av Jorge Basadre 362 San Isidro',NULL,NULL,5,0),(3,'MAPFRE','MAPFRE','20202380621','Av. 28 de Julio 873 Miraflores',NULL,NULL,5,0),(8,'AFP Integra','Integra','20157036794','Av Canaval y Moreyra ','F','F',6,0),(12,'Colegio Internacional','Colegio Inter','204583782717','Ave. Larco 345. Piso 7. Miraflores','F','F',6,0),(14,'Eyes Illusion','Eyes Illusion','20523846729','Calle Conquistadores 123 San Isidro','F','F',6,0),(15,'Seguros SURA','Seguros SURA','20463627488','Av Canaval y Moreyra 522 San Isidro','F','F',6,0),(19,'LG','LG','20375755344','Avenida Republica De Panama 3055 San Isidro ','F','F',8,0),(21,'AFP Integra 2','AFP Integra 2','20100130204','Av Canaval y Moreyra ','F','F',6,0),(22,'isend','isend','20100041953','Diego Ferré 387, Of. B, Miraflores','F','F',5,0),(23,'METAPAGO','METAPAGO','20521115522','CAL. LOS CANARIOS NRO. 114 LIMA - LIMA - SURQUILLO','F','F',6,0),(25,'dataimagenes','dataimagenes','20518240839','Av. Arica Nro. 1263','F','F',5,0),(27,'DP World','DP World','20513462388','Av Manco Capac 110 Callao','F','F',5,0),(29,'Campo Fe','Campo Fe','20101976867','Av. Javier Prado Este Nro. 3580','F','T',6,0),(30,'Cobranzas SB 1 CF','Cobranzas SB 1 CF','20101976867','Av. Javier Prado Este Nro. 3580','F','T',6,0),(31,'Cobranzas SB 2 CF','Cobranzas SB 2 CF','20101976867','Av. Javier Prado Este Nro. 3580','F','T',6,0),(32,'Cobranzas SB 3 CF','Cobranzas SB 3 CF','20101976867','Av. Javier Prado Este Nro. 3580','F','T',6,0),(33,'Cobranzas RET 4 CF','Cobranzas RET 4 CF','20101976867','Av. Javier Prado Este Nro. 3580','F','T',6,0),(34,'Cobranzas PRES 5 CF','Cobranzas PRES 5 CF','20101976867','Av. Javier Prado Este Nro. 3580','F','T',6,0),(35,'Gestion Campo Fe','Gestion Campo Fe','20101976867','Av. Javier Prado Este Nro. 3580','F','T',6,0),(36,'RRHH Campo Fe','RRHH Campo Fe','20101976867','Av. Javier Prado Este Nro. 3580','F','T',6,0),(37,'Campo Norte Fe','Campo Norte Fe','20101976867','Av. Javier Prado Este Nro. 3580','F','T',6,0),(38,'Campo Huachipa Fe','Campo Huachipa Fe','20101976867','av. Javier Prado Este Nro. 3580','F','T',6,0),(39,'Fesalud Campo Fe','Fesalud Campo Fe','20101976867','Av. Javier Prado Este Nro. 3580','F','T',6,0),(40,'Dataimagenes short codes','Data Short Codes','20518240839','Av arica 234','F','F',5,0),(42,'La Positiva','La Positiva','20100210909',' FRANCISCO MASIAS NRO. 37','F','F',5,0),(43,'UTEC','UTEC','20548873968','Jr Medrano Silva Barranco','F','T',6,0),(44,'UTEC Finanzas','UTEC Finanzas','20334994936','Av Grau Barranco','F','T',6,0),(45,'UTEC Ventas','UTEC Ventas','29394949393','Av Grau Barranco','F','T',6,0),(46,'Tecsup','Tecsup','23040003992','Av Grau Barranco','F','T',6,0),(47,'Herba Life','Herba Life','20512759778','Av. del Ejercito Nro. 530','F','T',5,0),(49,'Xiencias','Xiencias','23040003992','Lima','','',8,0),(51,'Tecsup Carmen','Tecsup Carmen','23040003992','Lima','','',6,0),(52,'Tecsup Monica','Tecsup Monica','23040003992','Lima','','',6,0),(53,'Tecsup Eveling','Tecsup Eveling','23040003992','Lima','','',6,0),(54,'Tecsup Isabel','Tecsup Isabel','23040003992','Lima','','',6,0),(55,'Tecsup Maria','Tecsup Maria','23040003992','Lima','','',6,0),(56,'Tecsup Milagros','Tecsup Milagros','23040003992','Lima','','',6,0),(57,'Tecsup Vigo','Tecsup Vigo','23040003992','Lima','','',6,0),(58,'Latin Fintech','Latin Fintech','123','Lima','','',5,0),(59,'BNP Paribas Cardif Perú','CARDIF','20513328819','Av. Canaval y Moreyra 380 Piso 19','','',6,0),(60,'Compendio','Compendio','20543333332','Barranco','','',5,0),(61,'Nanda','Nanda','123','Lima','','',5,0),(62,'FuXion','FuXion','20513081236','AV. JAVIER PRADO OESTE NRO. 1856 LIMA','','',5,0),(63,'CARDIF Clina','CARDIF Clina','123','Lima','','',6,0),(64,'CARDIF Christian','CARDIF Christian','123','Lima','','',6,0),(65,'CARDIF Rogelio','CARDIF Rogelio','123','Lima','','',6,0),(66,'CARDIF Elda','CARDIF Elda','123','Lima','','',6,0),(67,'CARDIF Carina','CARDIF Carina','123','Lima','','',6,0),(68,'Universidad María Auxiliadora','UMA','20550807123','Canto Bello, San Juan de Lurigancho','','',6,0),(69,'LG 2','LG 2','20375755344','AV. REPUBLICA DE COLOMBIA NRO. 791','','',8,0),(70,'Recovery Group','Recovery','20563374749','AV. REPUBLICA DE CHILE NRO. 295 INT. 607 LIMA','','',5,0),(71,'Mi Banco','MiBanco','20382036655','CAL.DOMINGO ORUE NRO. 165 RES. URB. LIMATAMBO','','',5,0),(72,'BELCORP','Belcorp','20100123763','AV. Felipe Pardo y Aliaga Nro. 652 INT. 1201 URB. Chacarilla Santa Cruz - San Isidro','','',6,0);
/*!40000 ALTER TABLE `costumers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `symbol` (`symbol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `d_blaster`
--

DROP TABLE IF EXISTS `d_blaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `d_blaster` (
  `id_d_blaster` int(11) NOT NULL AUTO_INCREMENT,
  `cliente` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `UID` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `FH_inicio` datetime DEFAULT NULL,
  `destino` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `audio` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `derivacion` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `lEstado` int(1) DEFAULT '0',
  `respuesta` int(1) NOT NULL DEFAULT '0',
  `dtmf` int(1) NOT NULL,
  `despedida` int(1) NOT NULL,
  `OC7_1` int(2) DEFAULT NULL,
  `OC7_2` int(2) NOT NULL DEFAULT '0',
  `OC7_3` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `tDuracion_ini` datetime DEFAULT NULL,
  `tDuracion_fin` datetime DEFAULT NULL,
  `tDuracion` int(10) NOT NULL DEFAULT '0',
  `tipo` int(100) DEFAULT '40',
  `evento` int(100) DEFAULT NULL,
  `cid` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`id_d_blaster`),
  KEY `FH_inicio` (`FH_inicio`),
  KEY `lEstado` (`lEstado`),
  KEY `cliente` (`cliente`),
  KEY `UID` (`UID`),
  KEY `OC7_1` (`OC7_1`),
  KEY `OC7_2` (`OC7_2`),
  KEY `OC7_3` (`OC7_3`),
  KEY `tipo` (`tipo`),
  KEY `evento` (`evento`),
  KEY `tDuracion_ini` (`tDuracion_ini`),
  KEY `tDuracion_fin` (`tDuracion_fin`),
  KEY `tDuracion` (`tDuracion`),
  KEY `despedida` (`despedida`),
  KEY `respuesta` (`respuesta`),
  KEY `derivacion` (`derivacion`),
  KEY `audio` (`audio`),
  KEY `destino` (`destino`),
  KEY `dtmf` (`dtmf`),
  CONSTRAINT `d_blaster_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `plataforma_servicios` (`id`),
  CONSTRAINT `d_blaster_ibfk_2` FOREIGN KEY (`evento`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1415657 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `d_blaster`
--

LOCK TABLES `d_blaster` WRITE;
/*!40000 ALTER TABLE `d_blaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `d_blaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `d_llamadas`
--

DROP TABLE IF EXISTS `d_llamadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `d_llamadas` (
  `id_d_llamadas` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_d_blaster` int(11) NOT NULL,
  `cliente` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `UID` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `destino` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `audio` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `derivacion` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `dtmf` int(1) NOT NULL DEFAULT '0',
  `despedida` int(1) NOT NULL DEFAULT '0',
  `llam_flag` int(10) unsigned DEFAULT NULL,
  `llam_uniqueid` varchar(45) DEFAULT NULL,
  `llam_tipo` int(3) DEFAULT '0',
  `llam_canal` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `llam_estado` int(5) DEFAULT NULL,
  `flagFIN` int(2) DEFAULT '0',
  `T_INS` datetime NOT NULL,
  `T_PRO` datetime NOT NULL,
  `T_RES` datetime NOT NULL,
  `T_FIN1` datetime NOT NULL,
  `T_FIN2` datetime NOT NULL,
  `d_timbrado` int(11) NOT NULL,
  `d_ivr` int(11) NOT NULL,
  `d_respuesta` int(11) NOT NULL,
  `d_total` int(11) NOT NULL,
  `Respuesta01` int(5) NOT NULL,
  `Respuesta02` int(5) NOT NULL,
  `CodCorte` int(5) NOT NULL,
  `vuelta` int(1) NOT NULL DEFAULT '0',
  `cid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_d_llamadas`),
  KEY `llam_flag` (`llam_flag`),
  KEY `llam_tipo` (`llam_tipo`),
  KEY `cliente` (`cliente`),
  KEY `flagFIN` (`flagFIN`),
  KEY `llam_estado` (`llam_estado`),
  KEY `vuelta` (`vuelta`),
  KEY `CodCorte` (`CodCorte`),
  KEY `Respuesta02` (`Respuesta02`),
  KEY `Respuesta01` (`Respuesta01`),
  KEY `d_total` (`d_total`),
  KEY `d_respuesta` (`d_respuesta`),
  KEY `d_ivr` (`d_ivr`),
  KEY `d_timbrado` (`d_timbrado`),
  KEY `T_FIN2` (`T_FIN2`),
  KEY `T_FIN1` (`T_FIN1`),
  KEY `T_RES` (`T_RES`),
  KEY `T_PRO` (`T_PRO`),
  KEY `T_INS` (`T_INS`),
  KEY `llam_canal` (`llam_canal`),
  KEY `llam_uniqueid` (`llam_uniqueid`),
  KEY `despedida` (`despedida`),
  KEY `dtmf` (`dtmf`),
  KEY `derivacion` (`derivacion`),
  KEY `audio` (`audio`),
  KEY `destino` (`destino`),
  KEY `UID` (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=1139155 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `d_llamadas`
--

LOCK TABLES `d_llamadas` WRITE;
/*!40000 ALTER TABLE `d_llamadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `d_llamadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  KEY `action_time` (`action_time`),
  KEY `object_repr` (`object_repr`),
  KEY `action_flag` (`action_flag`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (169,'2016-05-09 05:56:20','117','root',2,'Changed groups.',63,117);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`),
  KEY `model` (`model`),
  KEY `app_label` (`app_label`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (63,'auth','user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app` (`app`),
  KEY `name` (`name`),
  KEY `applied` (`applied`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`),
  KEY `expire_date` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('g1cek9g6hd9srr046jknr7av469779b9','OTQyZDA5OTI0MzQ1MWE2MTI4ZjU4NjU2ZTFlMzE3NmM1YzdjZGIxOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU4OWE2MjllZjc3NDY4ZTQwZDkxODEzZDc4YmMzMGM0Yzg1Zjc5OWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjExN30=','2016-05-23 05:52:47');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `domain` (`domain`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_crontabschedule`
--

DROP TABLE IF EXISTS `djcelery_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) NOT NULL,
  `hour` varchar(64) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(64) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `minute` (`minute`),
  KEY `hour` (`hour`),
  KEY `day_of_week` (`day_of_week`),
  KEY `day_of_month` (`day_of_month`),
  KEY `month_of_year` (`month_of_year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_crontabschedule`
--

LOCK TABLES `djcelery_crontabschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_crontabschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_intervalschedule`
--

DROP TABLE IF EXISTS `djcelery_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `every` (`every`),
  KEY `period` (`period`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_intervalschedule`
--

LOCK TABLES `djcelery_intervalschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_intervalschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictask`
--

DROP TABLE IF EXISTS `djcelery_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `interval_id` int(11) DEFAULT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `djcelery_periodictask_8905f60d` (`interval_id`),
  KEY `djcelery_periodictask_7280124f` (`crontab_id`),
  KEY `task` (`task`),
  KEY `date_changed` (`date_changed`),
  KEY `total_run_count` (`total_run_count`),
  KEY `last_run_at` (`last_run_at`),
  KEY `enabled` (`enabled`),
  KEY `expires` (`expires`),
  KEY `routing_key` (`routing_key`),
  KEY `exchange` (`exchange`),
  KEY `queue` (`queue`),
  CONSTRAINT `crontab_id_refs_id_286da0d1` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`),
  CONSTRAINT `interval_id_refs_id_1829f358` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictask`
--

LOCK TABLES `djcelery_periodictask` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictask` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictasks`
--

DROP TABLE IF EXISTS `djcelery_periodictasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`ident`),
  KEY `last_update` (`last_update`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictasks`
--

LOCK TABLES `djcelery_periodictasks` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_taskstate`
--

DROP TABLE IF EXISTS `djcelery_taskstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_taskstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) NOT NULL,
  `task_id` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `tstamp` datetime NOT NULL,
  `args` longtext,
  `kwargs` longtext,
  `eta` datetime DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `result` longtext,
  `traceback` longtext,
  `runtime` double DEFAULT NULL,
  `retries` int(11) NOT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `djcelery_taskstate_5654bf12` (`state`),
  KEY `djcelery_taskstate_4da47e07` (`name`),
  KEY `djcelery_taskstate_abaacd02` (`tstamp`),
  KEY `djcelery_taskstate_cac6a03d` (`worker_id`),
  KEY `djcelery_taskstate_2ff6b945` (`hidden`),
  KEY `eta` (`eta`),
  KEY `expires` (`expires`),
  KEY `runtime` (`runtime`),
  KEY `retries` (`retries`),
  CONSTRAINT `worker_id_refs_id_6fd8ce95` FOREIGN KEY (`worker_id`) REFERENCES `djcelery_workerstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_taskstate`
--

LOCK TABLES `djcelery_taskstate` WRITE;
/*!40000 ALTER TABLE `djcelery_taskstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_taskstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_workerstate`
--

DROP TABLE IF EXISTS `djcelery_workerstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_workerstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `last_heartbeat` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  KEY `djcelery_workerstate_11e400ef` (`last_heartbeat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_workerstate`
--

LOCK TABLES `djcelery_workerstate` WRITE;
/*!40000 ALTER TABLE `djcelery_workerstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_workerstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `register_time` datetime DEFAULT NULL,
  `costumer` int(11) DEFAULT NULL,
  `sms_campaign` int(11) DEFAULT NULL,
  `voip_campaign` int(11) DEFAULT NULL,
  `audience` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `approve` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `flagfin` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `costumer__idx` (`costumer`),
  KEY `sms_campaign__idx` (`sms_campaign`),
  KEY `voip_campaign__idx` (`voip_campaign`),
  KEY `audience__idx` (`audience`),
  KEY `register_time` (`register_time`),
  KEY `start_date` (`start_date`),
  KEY `start_time` (`start_time`),
  KEY `approve` (`approve`),
  KEY `status` (`status`),
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`costumer`) REFERENCES `costumers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `events_ibfk_2` FOREIGN KEY (`sms_campaign`) REFERENCES `sms_campaigns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `events_ibfk_3` FOREIGN KEY (`voip_campaign`) REFERENCES `voip_campaigns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `events_ibfk_4` FOREIGN KEY (`audience`) REFERENCES `audience` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6399 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infobip`
--

DROP TABLE IF EXISTS `infobip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infobip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) CHARACTER SET utf8 NOT NULL,
  `estado` varchar(255) CHARACTER SET utf8 NOT NULL,
  `costumer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `infobip_abe26491` (`costumer_id`),
  KEY `phone` (`phone`),
  KEY `estado` (`estado`),
  CONSTRAINT `infobip_costumer_id_8b98d4474cc270c_fk_costumers_id` FOREIGN KEY (`costumer_id`) REFERENCES `costumers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2494 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infobip`
--

LOCK TABLES `infobip` WRITE;
/*!40000 ALTER TABLE `infobip` DISABLE KEYS */;
/*!40000 ALTER TABLE `infobip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plataforma_servicios`
--

DROP TABLE IF EXISTS `plataforma_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plataforma_servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataforma_servicios`
--

LOCK TABLES `plataforma_servicios` WRITE;
/*!40000 ALTER TABLE `plataforma_servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `plataforma_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plataforma_servicios_clientes`
--

DROP TABLE IF EXISTS `plataforma_servicios_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plataforma_servicios_clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servicios_id` int(11) NOT NULL,
  `costumers_id` int(11) NOT NULL,
  `inicio` longtext NOT NULL,
  `fin` longtext NOT NULL,
  `Dias` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `servicios_id` (`servicios_id`,`costumers_id`),
  KEY `plataforma_servicios_clientes_80e6108c` (`servicios_id`),
  KEY `plataforma_servicios_clientes_78940c85` (`costumers_id`),
  KEY `status` (`status`),
  KEY `Dias` (`Dias`),
  CONSTRAINT `plataforma_servici_costumers_id_31a0f8311fcdcc78_fk_costumers_id` FOREIGN KEY (`costumers_id`) REFERENCES `costumers` (`id`),
  CONSTRAINT `platafo_servicios_id_5de6fee36da31c04_fk_plataforma_servicios_id` FOREIGN KEY (`servicios_id`) REFERENCES `plataforma_servicios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataforma_servicios_clientes`
--

LOCK TABLES `plataforma_servicios_clientes` WRITE;
/*!40000 ALTER TABLE `plataforma_servicios_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `plataforma_servicios_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_plans`
--

DROP TABLE IF EXISTS `rate_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `currency` int(11) DEFAULT NULL,
  `kind` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `currency__idx` (`currency`),
  KEY `name` (`name`),
  KEY `kind` (`kind`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate_plans`
--

LOCK TABLES `rate_plans` WRITE;
/*!40000 ALTER TABLE `rate_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `rate_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rates`
--

DROP TABLE IF EXISTS `rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `kind` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `kind` (`kind`),
  KEY `amount` (`amount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rates`
--

LOCK TABLES `rates` WRITE;
/*!40000 ALTER TABLE `rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_api`
--

DROP TABLE IF EXISTS `sms_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `payload` longtext,
  `status` varchar(255) DEFAULT NULL,
  `networks` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `interval_time` int(11) DEFAULT NULL,
  `minute_sms` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `url` (`url`),
  KEY `username` (`username`),
  KEY `password` (`password`),
  KEY `status` (`status`),
  KEY `networks` (`networks`),
  KEY `priority` (`priority`),
  KEY `interval_time` (`interval_time`),
  KEY `minute_sms` (`minute_sms`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_api`
--

LOCK TABLES `sms_api` WRITE;
/*!40000 ALTER TABLE `sms_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_campaigns`
--

DROP TABLE IF EXISTS `sms_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `costumer` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sms_message` longtext,
  PRIMARY KEY (`id`),
  KEY `costumer__idx` (`costumer`),
  KEY `name` (`name`),
  KEY `description` (`description`),
  CONSTRAINT `sms_campaigns_ibfk_1` FOREIGN KEY (`costumer`) REFERENCES `costumers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3026 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_campaigns`
--

LOCK TABLES `sms_campaigns` WRITE;
/*!40000 ALTER TABLE `sms_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_traffic`
--

DROP TABLE IF EXISTS `sms_traffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_traffic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `register_time` datetime DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `costumer` int(11) DEFAULT NULL,
  `campaign` varchar(255) DEFAULT NULL,
  `audience` int(11) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `text_message` longtext,
  `reference` longtext,
  `reference_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `dlr_reference` longtext,
  `variable_status` varchar(255) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `network` varchar(255) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uuid` (`reference`(32)),
  KEY `register_time` (`register_time`),
  KEY `costumer` (`costumer`),
  KEY `event_id` (`event_id`),
  KEY `campaign` (`campaign`),
  KEY `audience` (`audience`),
  KEY `phone_number` (`phone_number`),
  KEY `reference_time` (`reference_time`),
  KEY `status` (`status`),
  KEY `variable_status` (`variable_status`),
  KEY `error` (`error`),
  KEY `reason` (`reason`),
  KEY `network` (`network`)
) ENGINE=InnoDB AUTO_INCREMENT=5976347 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_traffic`
--

LOCK TABLES `sms_traffic` WRITE;
/*!40000 ALTER TABLE `sms_traffic` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_traffic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_traffic_estructura`
--

DROP TABLE IF EXISTS `sms_traffic_estructura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_traffic_estructura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `register_time` datetime DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `costumer` int(11) DEFAULT NULL,
  `campaign` varchar(255) DEFAULT NULL,
  `audience` int(11) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `text_message` longtext,
  `reference` longtext,
  `reference_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `dlr_reference` longtext,
  `variable_status` varchar(255) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `network` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uuid` (`reference`(32)),
  KEY `register_time` (`register_time`),
  KEY `costumer` (`costumer`),
  KEY `event_id` (`event_id`),
  KEY `campaign` (`campaign`),
  KEY `audience` (`audience`),
  KEY `phone_number` (`phone_number`),
  KEY `reference_time` (`reference_time`),
  KEY `status` (`status`),
  KEY `variable_status` (`variable_status`),
  KEY `error` (`error`),
  KEY `reason` (`reason`),
  KEY `network` (`network`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_traffic_estructura`
--

LOCK TABLES `sms_traffic_estructura` WRITE;
/*!40000 ALTER TABLE `sms_traffic_estructura` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_traffic_estructura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url`
--

DROP TABLE IF EXISTS `url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `costumer_id` int(255) DEFAULT NULL,
  `iphone` varchar(1000) DEFAULT NULL,
  `android` varchar(1000) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`costumer_id`),
  CONSTRAINT `url_ibfk_1` FOREIGN KEY (`costumer_id`) REFERENCES `costumers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url`
--

LOCK TABLES `url` WRITE;
/*!40000 ALTER TABLE `url` DISABLE KEYS */;
/*!40000 ALTER TABLE `url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voip_campaigns`
--

DROP TABLE IF EXISTS `voip_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voip_campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `costumer` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ending` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `costumer__idx` (`costumer`),
  KEY `name` (`name`),
  KEY `description` (`description`),
  KEY `ending` (`ending`),
  CONSTRAINT `voip_campaigns_ibfk_1` FOREIGN KEY (`costumer`) REFERENCES `costumers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voip_campaigns`
--

LOCK TABLES `voip_campaigns` WRITE;
/*!40000 ALTER TABLE `voip_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `voip_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voip_messages`
--

DROP TABLE IF EXISTS `voip_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voip_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `costumer` int(11) DEFAULT NULL,
  `voip_campaign` int(11) DEFAULT NULL,
  `voip_message` varchar(255) DEFAULT NULL,
  `text_voice` longtext,
  `call_action` longtext,
  PRIMARY KEY (`id`),
  KEY `costumer__idx` (`costumer`),
  KEY `voip_campaign__idx` (`voip_campaign`),
  KEY `voip_message` (`voip_message`)
) ENGINE=InnoDB AUTO_INCREMENT=656 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voip_messages`
--

LOCK TABLES `voip_messages` WRITE;
/*!40000 ALTER TABLE `voip_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `voip_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voip_traffic`
--

DROP TABLE IF EXISTS `voip_traffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voip_traffic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `register_time` datetime DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `costumer` int(11) DEFAULT NULL,
  `campaign` varchar(255) DEFAULT NULL,
  `audience` int(11) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `message_parts` longtext,
  `reference` longtext,
  `reference_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `reference_duration` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `register_time` (`register_time`),
  KEY `event_id` (`event_id`),
  KEY `costumer` (`costumer`),
  KEY `campaign` (`campaign`),
  KEY `audience` (`audience`),
  KEY `phone_number` (`phone_number`),
  KEY `reference_duration` (`reference_duration`),
  KEY `status` (`status`),
  KEY `reference_time` (`reference_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1252960 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voip_traffic`
--

LOCK TABLES `voip_traffic` WRITE;
/*!40000 ALTER TABLE `voip_traffic` DISABLE KEYS */;
/*!40000 ALTER TABLE `voip_traffic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-09  1:09:09
