-- mysqldump-php https://github.com/ifsnop/mysqldump-php
--
-- Host: localhost	Database: stoy_craft
-- ------------------------------------------------------
-- Server version 	5.6.23
-- Date: Tue, 29 Mar 2016 14:49:54 +0100

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
-- Table structure for table `craft_amnav_navs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_amnav_navs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_amnav_navs_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_amnav_navs`
--

LOCK TABLES `craft_amnav_navs` WRITE;
/*!40000 ALTER TABLE `craft_amnav_navs` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_amnav_navs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_amnav_nodes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_amnav_nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `navId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `listClass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `elementId` int(11) DEFAULT NULL,
  `elementType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_amnav_nodes_elementId_elementType_locale_idx` (`elementId`,`elementType`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_amnav_nodes`
--

LOCK TABLES `craft_amnav_nodes` WRITE;
/*!40000 ALTER TABLE `craft_amnav_nodes` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_amnav_nodes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_assetfiles`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetfiles` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfiles_filename_folderId_unq_idx` (`filename`,`folderId`),
  KEY `craft_assetfiles_sourceId_fk` (`sourceId`),
  KEY `craft_assetfiles_folderId_fk` (`folderId`),
  CONSTRAINT `craft_assetfiles_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetfiles`
--

LOCK TABLES `craft_assetfiles` WRITE;
/*!40000 ALTER TABLE `craft_assetfiles` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_assetfiles` VALUES (40,1,1,'pexels-photo.jpg','image',2048,1368,919776,'2016-02-17 12:30:47','2016-02-17 12:30:44','2016-02-17 12:30:47','a6e22a1a-a155-467b-95ce-515c3cf5774f'),(41,1,1,'bg.jpg','image',1040,612,578347,'2016-02-17 12:31:14','2016-02-17 12:31:14','2016-02-17 12:31:14','085dc8c4-652d-4ae4-9017-f7eccb76233a'),(43,1,1,'logo_ekkofilm.png','image',112,52,23440,'2016-02-22 07:15:48','2016-02-22 07:15:49','2016-02-22 07:15:49','493314d8-96ec-45dd-bf1e-60df24f09690'),(44,1,1,'logo_helmet.png','image',134,154,13329,'2016-02-22 07:15:49','2016-02-22 07:15:50','2016-02-22 07:15:50','36fd4c9c-5ace-406f-8ed2-5c5157ce59e3'),(45,1,1,'logo_news.png','image',152,52,5442,'2016-02-22 07:15:50','2016-02-22 07:15:50','2016-02-22 07:15:50','8df77c21-0377-4af7-acd2-0f7f3a5a7641'),(46,1,1,'logo_nrk.png','image',116,48,22412,'2016-02-22 07:15:51','2016-02-22 07:15:51','2016-02-22 07:15:51','2cb4cefa-1c56-4bf3-bec2-017f9df13ebc'),(47,1,1,'logo_spaett.png','image',170,69,4071,'2016-02-22 07:15:52','2016-02-22 07:15:52','2016-02-22 07:15:52','6c810e1a-0203-4724-9362-ab246e4f826b'),(51,1,1,'icon-kassert.svg','image',441,440,2549,'2016-03-27 23:18:16','2016-03-27 23:18:16','2016-03-27 23:18:16','8427b168-a025-4944-ac9e-0dae8a24b4ff');
/*!40000 ALTER TABLE `craft_assetfiles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_assetfolders`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetfolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfolders_name_parentId_sourceId_unq_idx` (`name`,`parentId`,`sourceId`),
  KEY `craft_assetfolders_parentId_fk` (`parentId`),
  KEY `craft_assetfolders_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetfolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfolders_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetfolders`
--

LOCK TABLES `craft_assetfolders` WRITE;
/*!40000 ALTER TABLE `craft_assetfolders` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_assetfolders` VALUES (1,NULL,1,'Bilder','','2015-02-18 22:14:33','2015-02-18 22:14:33','2b82d5b1-5d73-4476-b53a-27bf446cf925'),(3,NULL,3,'Ansatte','','2015-02-22 15:43:14','2015-02-22 15:43:14','f680d244-9458-467f-80ea-e0712a988e3f');
/*!40000 ALTER TABLE `craft_assetfolders` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_assetindexdata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sourceId` int(10) NOT NULL,
  `offset` int(10) NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(10) DEFAULT NULL,
  `recordId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetindexdata_sessionId_sourceId_offset_unq_idx` (`sessionId`,`sourceId`,`offset`),
  KEY `craft_assetindexdata_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetindexdata_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetindexdata`
--

LOCK TABLES `craft_assetindexdata` WRITE;
/*!40000 ALTER TABLE `craft_assetindexdata` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_assetsources`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetsources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetsources_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assetsources_handle_unq_idx` (`handle`),
  KEY `craft_assetsources_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_assetsources_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetsources`
--

LOCK TABLES `craft_assetsources` WRITE;
/*!40000 ALTER TABLE `craft_assetsources` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_assetsources` VALUES (1,'Bilder','bilder','Local','{\"path\":\"dynamic\\/upload\\/bilder\\/\",\"url\":\"\\/dynamic\\/upload\\/bilder\\/\"}',1,21,'2015-02-18 22:14:33','2015-02-22 15:18:18','9c1d15bb-5d93-4148-b036-557522c47788'),(3,'Ansatte','ansatte','Local','{\"path\":\"dynamic\\/upload\\/ansatte\\/\",\"url\":\"\\/dynamic\\/upload\\/ansatte\\/\"}',3,30,'2015-02-22 15:43:14','2015-02-22 15:43:14','174c3565-e653-4a36-aef2-14220b6c7f9f');
/*!40000 ALTER TABLE `craft_assetsources` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_assettransformindex`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT NULL,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assettransformindex_sourceId_fileId_location_idx` (`sourceId`,`fileId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assettransformindex`
--

LOCK TABLES `craft_assettransformindex` WRITE;
/*!40000 ALTER TABLE `craft_assettransformindex` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_assettransforms`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `height` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(10) DEFAULT NULL,
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assettransforms`
--

LOCK TABLES `craft_assettransforms` WRITE;
/*!40000 ALTER TABLE `craft_assettransforms` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_assettransforms` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_categories`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_categories_groupId_fk` (`groupId`),
  CONSTRAINT `craft_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categories`
--

LOCK TABLES `craft_categories` WRITE;
/*!40000 ALTER TABLE `craft_categories` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_categorygroups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_categorygroups_handle_unq_idx` (`handle`),
  KEY `craft_categorygroups_structureId_fk` (`structureId`),
  KEY `craft_categorygroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categorygroups`
--

LOCK TABLES `craft_categorygroups` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_categorygroups_i18n`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categorygroups_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `urlFormat` text COLLATE utf8_unicode_ci,
  `nestedUrlFormat` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_i18n_groupId_locale_unq_idx` (`groupId`,`locale`),
  KEY `craft_categorygroups_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_categorygroups_i18n_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categorygroups_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categorygroups_i18n`
--

LOCK TABLES `craft_categorygroups_i18n` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups_i18n` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_categorygroups_i18n` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_content`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_googleAnalyticsKode` text COLLATE utf8_unicode_ci,
  `field_tittel` text COLLATE utf8_unicode_ci,
  `field_undertittel` text COLLATE utf8_unicode_ci,
  `field_video` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_tekstRen` text COLLATE utf8_unicode_ci,
  `field_ingress` text COLLATE utf8_unicode_ci,
  `field_tekstRik` text COLLATE utf8_unicode_ci,
  `field_adresse` text COLLATE utf8_unicode_ci,
  `field_kontakt` text COLLATE utf8_unicode_ci,
  `field_facebook` text COLLATE utf8_unicode_ci,
  `field_vimeo` text COLLATE utf8_unicode_ci,
  `field_json` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_content_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_content_title_idx` (`title`),
  KEY `craft_content_locale_fk` (`locale`),
  CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_content_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_content`
--

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_content` VALUES (1,1,'nb_no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-08 10:49:48','2015-02-23 22:10:19','22bdfcbe-634e-4e2b-aa58-5153c4ae4ef9'),(4,4,'nb_no',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-08 11:01:50','2014-10-08 12:08:47','5675a116-04ff-4fe6-9424-e96ccbef190c'),(5,5,'nb_no','Forside',NULL,'Lyden av den gode historie','<p><a href=\"http://stoy.local/\">Musikk <strong>·</strong></a> <a href=\"http://stoy.local/\">lyddesign <strong>·</strong></a> <a href=\"http://stoy.local/\">voiceover <strong>·</strong></a> <a href=\"http://stoy.local/\">foley</a></p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-18 21:56:40','2016-02-22 07:24:47','3f707582-0cd5-4795-a00a-e4d264d31471'),(6,6,'nb_no','Kontakt',NULL,'Mer enn bare Støy','<h2>Støy er et kreativt lydbyrå med glimt i øyet. Vårt hovedvirke er produksjon av lyd og medier med spesiell vekt på postproduksjon.</h2>',NULL,'','Støy er et kreativt lydbyrå med glimt i øyet. Vårt hovedvirke er produksjon av lyd og medier med spesiell vekt på postproduksjon.','<p>Med bred erfaring fra tv-reklamer, kino-reklamer, fulle tv-produksjoner, kortfilm og informasjonsfilm kan du være trygg på at du får den ekspertisen du trenger til din produksjon.  Vår store lekeplass åpner for overlegen allsidighet og ubegrensede muligheter for å blåse liv i din historie.Med to romslige produksjonsuiter, et stort innspillingsrom og dedikert foleystudio utstyrt med foleypit, er vi rustet for alle type utfordringer.<br><br><strong>MUSIKKPRODUKSJON</strong><br>Ingenting fremkaller mer følelser enn musikk, og vi skreddersyr musikken til din historie. Vi gjør alt fra store orkesterproduksjoner til akustiske inspillinger i en rekke stilarter.<br><br><strong>LYDDESIGN & LYD-ETTERARBEID</strong><br>Vår kreative lyddesigner gir liv til bildene og skaper det riktige universet til din historie. Lyd er halve opplevelsen blablablablabla<br><br><strong>VOICEOVER</strong><br>Vi har tilgang til et stort utvalg av forskjellige stemmer og dialekter, gammel som ung. Ta kontakt så finner vi noen som passer til din produksjon.<br><br><strong>FOLEY</strong><br>Med Midt-norges eneste dedikerte foley-rom utstyrt med egen pit, kan vi levere foley og lyddesign til alle type produksjoner.<br><br><strong>FELTOPPTAK</strong></p>',NULL,NULL,NULL,NULL,NULL,'2015-02-20 23:33:16','2016-02-19 22:47:38','3b2123ac-3b35-4fc0-acbb-d47d42c5d6af'),(9,9,'nb_no','Artsdatabanken',NULL,NULL,NULL,'http://vimeo.com/132723874','Artbanken kapittel 4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-22 15:36:53','2016-02-22 07:24:13','03c9f1a7-4cf0-466d-9cb4-accaf313b52d'),(10,10,'nb_no','Artsdatabanken',NULL,NULL,NULL,'http://vimeo.com/132723875','Artsdatabanken kapittel 5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-22 15:37:24','2016-02-22 07:23:45','120dd6e9-0739-4766-922b-a7c4bf14bbd3'),(20,22,'nb_no','Minimalen kortfilm',NULL,NULL,NULL,'http://vimeo.com/151304098','MInimalen 2016 introvignett',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-22 20:21:58','2016-02-22 07:22:55','003f5e76-c4fd-4dc0-bc15-6806c6699694'),(21,23,'nb_no','Lyddesign',NULL,'Lyddesign gir liv til øyeblikket',NULL,NULL,NULL,'Her står det bare masse tekst om lyddesign og hva man mener med det','<p><strong>Far far away</strong></p><p>Behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar. </p><p><strong>The Big Oxmox </strong></p><p>advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn\'t listen. She packed her seven versalia, put her initial into the belt and made herself on the way. When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then</p>',NULL,NULL,NULL,NULL,NULL,'2015-02-22 22:07:09','2015-02-23 20:35:34','d61e41ff-e591-4273-9585-597b36377cdb'),(22,24,'nb_no','Musikkproduksjon',NULL,'Skap sterkere inntrykk med komponert musikk',NULL,NULL,NULL,'Musikkproduksjon ass','<p><strong>Far far away</strong></p><p>Behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p><p><strong>The Big Oxmox</strong></p><p>advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn\'t listen. She packed her seven versalia, put her initial into the belt and made herself on the way. When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then</p>',NULL,NULL,NULL,NULL,NULL,'2015-02-22 22:07:22','2015-02-23 20:42:44','5a60681d-50ba-465a-a056-691f7ce38382'),(32,34,'nb_no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Båtmannsgata 4 7044 Trondheim','<p><a href=\"mailto:post@stoey.no\">post@stoey.no</a><br>Thomas: 948 48 494<br>Kjell Thomas: 987 45 121</p>','https://www.facebook.com/stoystudio','Ingenting',NULL,'2015-02-23 19:23:13','2015-02-23 19:25:48','b6572e41-807a-447f-86b7-0a16ff3848ea'),(33,40,'nb_no','Pexels Photo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-02-17 12:30:44','2016-02-17 12:30:44','57d8ce2a-0b57-4e00-8b90-9aea8599a179'),(34,41,'nb_no','Bg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-02-17 12:31:14','2016-02-17 12:31:14','a3cc75a1-4fd2-441e-9766-ecbb4fd5b126'),(35,42,'nb_no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-02-19 22:37:46','2016-02-19 22:38:15','865be849-a9c5-4126-9856-ddb8f78c0f56'),(36,43,'nb_no','Logo Ekkofilm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-02-22 07:15:49','2016-02-22 07:15:49','a37be6ac-361b-4e46-9e77-a0f715a29b6e'),(37,44,'nb_no','Logo Helmet',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-02-22 07:15:49','2016-02-22 07:15:49','be542c18-e03b-44e7-ad3d-6dd768ec8785'),(38,45,'nb_no','Logo News',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-02-22 07:15:50','2016-02-22 07:15:50','0570ed21-d854-45a5-8822-8a41bf2f2888'),(39,46,'nb_no','Logo Nrk',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-02-22 07:15:51','2016-02-22 07:15:51','dcbc196e-2ce3-49d4-ada4-13b557b5eca8'),(40,47,'nb_no','Logo Spaett',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-02-22 07:15:52','2016-02-22 07:15:52','60f28edc-8f15-44c9-8ea9-ac05106d9624'),(41,48,'nb_no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-27 23:03:47','2016-03-27 23:18:28','800d0909-b705-4cec-95dc-054b0ad49dac'),(43,51,'nb_no','Icon Kassert',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-27 23:18:16','2016-03-27 23:18:16','1f8945bc-8cd2-40f2-8909-733f7f9d2a9e'),(48,56,'nb_no','Penny Lane',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[{\"instruments\":[{\"id\":0,\"type\":\"Akustisk gitar\",\"role\":\"\",\"desc\":\"..\",\"height\":100,\"width\":300,\"top\":130,\"left\":0},{\"id\":1,\"type\":\"Akustisk gitar\",\"role\":\"\",\"desc\":\"..\",\"height\":114,\"width\":300,\"top\":312,\"left\":0}],\"id\":0,\"name\":\"Intro\",\"rhytm\":8},{\"instruments\":[],\"id\":1,\"name\":\"ny kolonne\",\"rhytm\":3}]','2016-03-28 21:21:04','2016-03-29 13:48:34','e895230b-af83-4502-a41b-e575d66ec87f'),(49,57,'nb_no','Test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[{\"instruments\":[],\"id\":0,\"name\":\"ny kolonne\",\"rhytm\":4}]','2016-03-29 13:42:45','2016-03-29 13:44:06','82c4c547-9e21-4080-b642-f08dd98cb185');
/*!40000 ALTER TABLE `craft_content` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_cpnav_layouts`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_cpnav_layouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isDefault` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_cpnav_layouts`
--

LOCK TABLES `craft_cpnav_layouts` WRITE;
/*!40000 ALTER TABLE `craft_cpnav_layouts` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_cpnav_layouts` VALUES (1,'Default',1,NULL,'2016-02-16 01:32:25','2016-02-16 01:32:25','b5593e16-6845-491a-ab4c-03eaed9cf4c6');
/*!40000 ALTER TABLE `craft_cpnav_layouts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_cpnav_navs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_cpnav_navs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) DEFAULT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prevLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `order` int(11) DEFAULT '0',
  `prevUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manualNav` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `newWindow` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_cpnav_navs_layoutId_fk` (`layoutId`),
  CONSTRAINT `craft_cpnav_navs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_cpnav_layouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_cpnav_navs`
--

LOCK TABLES `craft_cpnav_navs` WRITE;
/*!40000 ALTER TABLE `craft_cpnav_navs` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_cpnav_navs` VALUES (1,1,'dashboard','Kontrollpanel','Kontrollpanel',1,0,'dashboard','dashboard','gauge',0,0,'2016-02-16 01:32:25','2016-02-16 01:32:25','6276885c-1b6a-4c87-9875-13f5b35b999b'),(2,1,'entries','Artikler','Artikler',1,1,'entries','entries','section',0,0,'2016-02-16 01:32:25','2016-02-16 01:32:25','377b02bd-6599-4e97-ae42-79f89e338f50'),(3,1,'globals','Globaler','Globaler',1,2,'globals/footer','globals/footer','globe',0,0,'2016-02-16 01:32:25','2016-02-16 01:32:25','d2901f62-f9df-41e4-80ab-65a9d6b33317'),(4,1,'assets','Filer','Filer',1,3,'assets','assets','assets',0,0,'2016-02-16 01:32:25','2016-02-16 01:32:25','c3c229f1-ea79-4332-9357-3453de01a2de'),(5,1,'amnav','a&m nav','a&m nav',1,4,'amnav','amnav','iconSvg-amnav',0,0,'2016-02-16 01:32:25','2016-02-16 01:32:25','dcb2243d-679a-4b03-9ea6-955e27a4734f'),(6,1,'settings','Innstillinger','Innstillinger',1,5,'settings','settings','settings',0,0,'2016-02-16 01:32:25','2016-02-16 01:32:25','facd9c4b-0146-499f-b5f2-fcf89131c80e'),(7,1,'seomatic','SEOmatic','SEOmatic',1,5,'seomatic','seomatic','iconSvg-seomatic',0,0,'2016-02-16 01:33:43','2016-02-16 01:33:43','d7daecfb-e132-455f-b4a9-949cad090782'),(8,1,'fieldmanager','Field Manager','Field Manager',1,5,'fieldmanager','fieldmanager','iconSvg-fieldmanager',0,0,'2016-03-28 22:26:24','2016-03-28 22:26:24','5f0f4d7f-24a5-4c57-b965-b67c0533993c');
/*!40000 ALTER TABLE `craft_cpnav_navs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_deprecationerrors`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `templateLine` smallint(6) unsigned DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_deprecationerrors`
--

LOCK TABLES `craft_deprecationerrors` WRITE;
/*!40000 ALTER TABLE `craft_deprecationerrors` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_elementindexsettings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elementindexsettings`
--

LOCK TABLES `craft_elementindexsettings` WRITE;
/*!40000 ALTER TABLE `craft_elementindexsettings` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_elements`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_elements_type_idx` (`type`),
  KEY `craft_elements_enabled_idx` (`enabled`),
  KEY `craft_elements_archived_dateCreated_idx` (`archived`,`dateCreated`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elements`
--

LOCK TABLES `craft_elements` WRITE;
/*!40000 ALTER TABLE `craft_elements` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_elements` VALUES (1,'User',1,0,'2014-10-08 10:49:48','2015-02-23 22:10:19','ffb29a05-dcce-4b95-85c8-cba0b3353fca'),(4,'GlobalSet',1,0,'2014-10-08 11:01:50','2014-10-08 12:08:47','e6f306b0-d137-4efa-9a3d-491a8c20ddb3'),(5,'Entry',1,0,'2015-02-18 21:56:40','2016-02-22 07:24:47','6c9fb42d-5bbb-43cd-815d-9d9ecefbf13f'),(6,'Entry',1,0,'2015-02-20 23:33:16','2016-02-19 22:47:38','4017f67a-47b0-4a74-a7b3-85b3e2361543'),(9,'Entry',1,0,'2015-02-22 15:36:53','2016-02-22 07:24:13','41d50980-2e1c-45de-93fb-335bade39ebc'),(10,'Entry',1,0,'2015-02-22 15:37:24','2016-02-22 07:23:45','0384634b-da93-4002-870e-cd269fd01491'),(20,'MatrixBlock',1,0,'2015-02-22 15:51:58','2016-02-22 07:24:47','d417b563-da0b-42fa-9a27-e711a34a5612'),(21,'MatrixBlock',1,0,'2015-02-22 15:51:58','2016-02-22 07:24:47','aa4b0a47-0992-44d5-93d2-ed543073d443'),(22,'Entry',1,0,'2015-02-22 20:21:58','2016-02-22 07:22:55','d8bc5d95-75f9-4e5e-ad91-ac5216a6fe24'),(23,'Entry',0,0,'2015-02-22 22:07:09','2016-02-16 01:21:02','2ea20e80-c6f4-46e2-96f6-433f4ed84d08'),(24,'Entry',0,0,'2015-02-22 22:07:22','2016-02-16 01:21:02','a2628110-b4bd-461b-b3e4-8d8e25a2c389'),(30,'MatrixBlock',1,0,'2015-02-23 18:38:31','2016-02-19 22:47:38','004791a1-b81e-40ba-9eff-47581e706fa6'),(31,'MatrixBlock',1,0,'2015-02-23 18:38:31','2016-02-19 22:47:38','a036370b-87ad-4040-a7c7-16a911c81c5b'),(32,'MatrixBlock',1,0,'2015-02-23 18:38:31','2016-02-19 22:47:38','0eb6f036-c0c9-4e08-9939-7a8ae6220f8c'),(33,'MatrixBlock',1,0,'2015-02-23 18:46:33','2016-02-19 22:47:38','c7deacd2-430c-416a-b8de-b586f26011e7'),(34,'GlobalSet',1,0,'2015-02-23 19:23:13','2015-02-23 19:25:48','70f5eb4d-6557-43c4-aeca-8f89a29c8daf'),(35,'MatrixBlock',1,0,'2015-02-23 20:15:15','2015-02-23 20:35:34','55e2f5af-afbb-4619-8fcb-e0a2e861bf82'),(36,'MatrixBlock',1,0,'2015-02-23 20:39:11','2015-02-23 20:42:44','8e9815f0-a7ee-49b5-ab3c-8efdc83106dd'),(37,'MatrixBlock',1,0,'2015-02-23 20:42:44','2015-02-23 20:42:44','a35254e6-36f2-43c9-921c-654617bdff1f'),(38,'MatrixBlock',1,0,'2015-02-23 20:42:44','2015-02-23 20:42:44','ec28f261-84f4-4103-82a1-e016b2e92594'),(39,'MatrixBlock',1,0,'2015-02-23 20:42:44','2015-02-23 20:42:44','89a454a1-e61b-4e6c-a1cc-8b1d6fa64716'),(40,'Asset',1,0,'2016-02-17 12:30:44','2016-02-17 12:30:44','ddf19009-6a0e-45cb-87b5-da320f0e3d24'),(41,'Asset',1,0,'2016-02-17 12:31:14','2016-02-17 12:31:14','198f0202-1a51-4a9e-a3c7-f1137f1982a4'),(42,'GlobalSet',1,0,'2016-02-19 22:37:46','2016-02-19 22:38:15','c64adb6d-cf36-4f37-a0e3-084d8d609191'),(43,'Asset',1,0,'2016-02-22 07:15:49','2016-02-22 07:15:49','8ffaa258-7222-4628-89d3-6606f6fd5f72'),(44,'Asset',1,0,'2016-02-22 07:15:49','2016-02-22 07:15:49','f058cd07-c77e-4d26-b2c0-c1385271755b'),(45,'Asset',1,0,'2016-02-22 07:15:50','2016-02-22 07:15:50','9fae66b0-52a9-4561-8ef1-21ce4a5b05d2'),(46,'Asset',1,0,'2016-02-22 07:15:51','2016-02-22 07:15:51','b72420d7-beb9-4094-afdb-d43416d82af5'),(47,'Asset',1,0,'2016-02-22 07:15:52','2016-02-22 07:15:52','4b176aa0-05cb-4c0c-9e7b-cc4de35ded27'),(48,'GlobalSet',1,0,'2016-03-27 23:03:47','2016-03-27 23:18:28','594af158-900a-4c0a-bc1f-8350a3400da2'),(49,'MatrixBlock',1,0,'2016-03-27 23:04:06','2016-03-27 23:18:28','2f5be180-8563-46a9-a1fd-55dea9f7c33f'),(51,'Asset',1,0,'2016-03-27 23:18:16','2016-03-27 23:18:16','e5570d8b-7c92-46ba-8106-f7a9286e978f'),(56,'Entry',1,0,'2016-03-28 21:21:04','2016-03-29 13:48:34','b599e052-634f-42b5-b825-b725b70faab6'),(57,'Entry',1,0,'2016-03-29 13:42:45','2016-03-29 13:44:06','2e18192c-6dd0-472d-b927-4ccb929372cc');
/*!40000 ALTER TABLE `craft_elements` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_elements_i18n`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elements_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elements_i18n_elementId_locale_unq_idx` (`elementId`,`locale`),
  UNIQUE KEY `craft_elements_i18n_uri_locale_unq_idx` (`uri`,`locale`),
  KEY `craft_elements_i18n_slug_locale_idx` (`slug`,`locale`),
  KEY `craft_elements_i18n_enabled_idx` (`enabled`),
  KEY `craft_elements_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_elements_i18n_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_elements_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elements_i18n`
--

LOCK TABLES `craft_elements_i18n` WRITE;
/*!40000 ALTER TABLE `craft_elements_i18n` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_elements_i18n` VALUES (1,1,'nb_no','',NULL,1,'2014-10-08 10:49:48','2015-02-23 22:10:20','43ed65e2-12cd-4f2c-bf52-00955b97ea18'),(4,4,'nb_no','',NULL,1,'2014-10-08 11:01:50','2014-10-08 12:08:47','7aa419d8-daed-4559-b704-32bc0a213d9e'),(5,5,'nb_no','forside','__home__',1,'2015-02-18 21:56:40','2016-02-22 07:24:47','a833ef94-997a-4c32-a553-4775fa1f5ac4'),(6,6,'nb_no','kontakt','kontakt',1,'2015-02-20 23:33:16','2016-02-19 22:47:38','94da08e8-3d68-4a86-85a5-5ea229162e1b'),(9,9,'nb_no','artsdatabanken','jobber/artsdatabanken',1,'2015-02-22 15:36:53','2016-02-22 07:24:13','3c02b118-8df8-41c5-b353-4e5a74623e8f'),(10,10,'nb_no','jobb2','jobber/jobb2',1,'2015-02-22 15:37:24','2016-02-22 07:23:45','84e921ee-e374-4637-bd82-f77474575e1c'),(20,20,'nb_no','',NULL,1,'2015-02-22 15:51:58','2016-02-22 07:24:47','4d0dc630-8ca2-4010-9af6-0c36c064a0ed'),(21,21,'nb_no','',NULL,1,'2015-02-22 15:51:58','2016-02-22 07:24:47','ab6a7f5b-f387-4932-af91-1d266149d9b5'),(22,22,'nb_no','undringstårnet','jobber/undringstårnet',1,'2015-02-22 20:21:58','2016-02-22 07:22:56','7ab70286-cc45-4215-ad9f-7afff3535267'),(23,23,'nb_no','lyddesign','lyddesign',1,'2015-02-22 22:07:09','2015-02-23 20:35:34','459f02fb-86a9-4ce9-bcaa-079ecefc0384'),(24,24,'nb_no','musikkproduksjon','musikkproduksjon',1,'2015-02-22 22:07:22','2015-02-23 20:42:44','82c36a43-3e88-4a01-b589-4f3bcbc3433a'),(34,30,'nb_no','',NULL,1,'2015-02-23 18:38:31','2016-02-19 22:47:38','3b7b5d21-7118-4f93-afa8-b2129d7ed4ab'),(35,31,'nb_no','',NULL,1,'2015-02-23 18:38:31','2016-02-19 22:47:38','8c6b306e-5a75-49a7-940a-957a3eced30c'),(36,32,'nb_no','',NULL,1,'2015-02-23 18:38:31','2016-02-19 22:47:38','adaa7d47-ff91-412c-9f49-c18dae30a60d'),(37,33,'nb_no','',NULL,1,'2015-02-23 18:46:33','2016-02-19 22:47:38','d58b5a37-a0e7-4b12-a1b3-8e0f15630e26'),(38,34,'nb_no','',NULL,1,'2015-02-23 19:23:13','2015-02-23 19:25:48','32275891-39bb-42b7-aeb6-4aef730e12ea'),(39,35,'nb_no','',NULL,1,'2015-02-23 20:15:15','2015-02-23 20:35:34','af06a626-ecac-4070-9063-15f3f79c8117'),(40,36,'nb_no','',NULL,1,'2015-02-23 20:39:11','2015-02-23 20:42:44','80a62e9b-9577-43a3-afc4-d4f10d011451'),(41,37,'nb_no','',NULL,1,'2015-02-23 20:42:44','2015-02-23 20:42:44','71375597-2a76-408e-b3da-addc9929d2fe'),(42,38,'nb_no','',NULL,1,'2015-02-23 20:42:44','2015-02-23 20:42:44','8e3d1116-e5a0-4e6b-9da5-a42bd03fb79b'),(43,39,'nb_no','',NULL,1,'2015-02-23 20:42:44','2015-02-23 20:42:44','9b9d72fd-9fac-4bb4-82bc-5afe219c822e'),(44,40,'nb_no','pexels-photo',NULL,1,'2016-02-17 12:30:44','2016-02-17 12:30:44','c253b637-a07e-4c72-8a59-756179724abf'),(45,41,'nb_no','bg',NULL,1,'2016-02-17 12:31:14','2016-02-17 12:31:14','06bff660-4b92-4dd5-af61-4108cec5b385'),(46,42,'nb_no','',NULL,1,'2016-02-19 22:37:46','2016-02-19 22:38:15','c9c5690f-4373-40f8-aee7-35ab0ca4072b'),(47,43,'nb_no','logo-ekkofilm',NULL,1,'2016-02-22 07:15:49','2016-02-22 07:15:49','117d29a8-ff71-4078-bb2b-9b5c6511638b'),(48,44,'nb_no','logo-helmet',NULL,1,'2016-02-22 07:15:50','2016-02-22 07:15:50','191af451-791a-44a8-a480-9fa55c164218'),(49,45,'nb_no','logo-news',NULL,1,'2016-02-22 07:15:50','2016-02-22 07:15:50','7399fd30-4d27-4e6e-9657-a06e1c0553d6'),(50,46,'nb_no','logo-nrk',NULL,1,'2016-02-22 07:15:51','2016-02-22 07:15:51','5793e3d1-32a3-405f-b620-67cbb05d46cb'),(51,47,'nb_no','logo-spaett',NULL,1,'2016-02-22 07:15:52','2016-02-22 07:15:52','3e2c96fa-0415-4847-be07-7b9ed1057284'),(52,48,'nb_no','',NULL,1,'2016-03-27 23:03:47','2016-03-27 23:18:28','1b59a7ad-746e-4ebf-9bc9-de019c02a810'),(53,49,'nb_no','',NULL,1,'2016-03-27 23:04:06','2016-03-27 23:18:28','5c8e0ca0-6a05-4f7d-94b3-8c9e2d47f990'),(55,51,'nb_no','icon-kassert',NULL,1,'2016-03-27 23:18:16','2016-03-27 23:18:16','06363879-3e14-477c-8955-a8b97eb8cc8b'),(58,56,'nb_no','penny-lane','arranger/penny-lane',1,'2016-03-28 21:21:04','2016-03-29 13:48:34','bb5d94bf-3aab-41e2-b490-32e999810002'),(59,57,'nb_no','test','arranger/test',1,'2016-03-29 13:42:45','2016-03-29 13:44:06','4dbe34ea-424e-45ed-bd5b-847bc6f67243');
/*!40000 ALTER TABLE `craft_elements_i18n` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_emailmessages`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_emailmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_emailmessages_key_locale_unq_idx` (`key`,`locale`),
  KEY `craft_emailmessages_locale_fk` (`locale`),
  CONSTRAINT `craft_emailmessages_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_emailmessages`
--

LOCK TABLES `craft_emailmessages` WRITE;
/*!40000 ALTER TABLE `craft_emailmessages` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_emailmessages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_entries`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entries_sectionId_idx` (`sectionId`),
  KEY `craft_entries_typeId_idx` (`typeId`),
  KEY `craft_entries_postDate_idx` (`postDate`),
  KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  KEY `craft_entries_authorId_fk` (`authorId`),
  CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entries`
--

LOCK TABLES `craft_entries` WRITE;
/*!40000 ALTER TABLE `craft_entries` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_entries` VALUES (5,1,1,NULL,'2016-02-17 11:40:10',NULL,'2015-02-18 21:56:40','2016-02-22 07:24:47','d0c7f387-f8c0-4e83-888a-2220dcdac88e'),(6,2,2,NULL,'2015-02-20 23:33:16',NULL,'2015-02-20 23:33:16','2016-02-19 22:47:38','167cd814-8807-4653-9e4a-661f77fe30fb'),(9,3,3,1,'2015-02-22 15:36:00',NULL,'2015-02-22 15:36:53','2016-02-22 07:24:13','3765b759-5187-4003-bf61-003136db5aed'),(10,3,3,1,'2015-02-22 15:37:00',NULL,'2015-02-22 15:37:24','2016-02-22 07:23:45','011c88e2-8edb-4b4d-a4de-9ddd1d12e01a'),(22,3,3,1,'2015-02-22 20:21:00',NULL,'2015-02-22 20:21:58','2016-02-22 07:22:56','de4b295c-595c-496e-a1d2-f01d356af4bd'),(23,4,4,NULL,'2015-02-22 22:07:34',NULL,'2015-02-22 22:07:09','2015-02-23 20:35:34','2e3e5e4f-3f94-4d79-bfab-3003b95c7a0e'),(24,5,5,NULL,'2015-02-22 22:07:40',NULL,'2015-02-22 22:07:22','2015-02-23 20:42:44','de9d0c07-115b-46e5-a65d-5ac40af28de5'),(56,6,6,1,'2016-03-28 21:21:04',NULL,'2016-03-28 21:21:04','2016-03-29 13:48:34','c7360f03-649a-4fcb-8d19-349273bcf7df'),(57,6,6,1,'2016-03-29 13:42:45',NULL,'2016-03-29 13:42:45','2016-03-29 13:44:06','df90753b-5f41-44cf-b5ba-4fc1781282ce');
/*!40000 ALTER TABLE `craft_entries` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_entrydrafts`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entrydrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entrydrafts_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entrydrafts_sectionId_fk` (`sectionId`),
  KEY `craft_entrydrafts_creatorId_fk` (`creatorId`),
  KEY `craft_entrydrafts_locale_fk` (`locale`),
  CONSTRAINT `craft_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entrydrafts`
--

LOCK TABLES `craft_entrydrafts` WRITE;
/*!40000 ALTER TABLE `craft_entrydrafts` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_entrydrafts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_entrytypes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Title',
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  UNIQUE KEY `craft_entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  KEY `craft_entrytypes_sectionId_fk` (`sectionId`),
  KEY `craft_entrytypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entrytypes`
--

LOCK TABLES `craft_entrytypes` WRITE;
/*!40000 ALTER TABLE `craft_entrytypes` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_entrytypes` VALUES (1,1,53,'Forside','forside',0,NULL,'{section.name|raw}',NULL,'2015-02-18 21:56:40','2015-02-22 22:51:17','e1b51159-2557-4813-918e-934f851e61df'),(2,2,63,'Kontakt','kontakt',0,NULL,'{section.name|raw}',NULL,'2015-02-20 23:33:16','2015-02-23 20:35:58','2f2f13d4-a4dd-4122-b1e9-f3a7c9764cfc'),(3,3,69,'Jobber','jobber',1,'Tittel',NULL,NULL,'2015-02-22 15:29:37','2015-02-23 20:45:52','be84c187-a5da-4252-a562-da18b6512377'),(4,4,67,'Lyddesign','lyddesign',0,NULL,'{section.name|raw}',NULL,'2015-02-22 22:07:09','2015-02-23 20:41:04','013b1dc9-b3f3-4741-94c8-50644cea9c03'),(5,5,68,'Musikkproduksjon','musikkproduksjon',0,NULL,'{section.name|raw}',NULL,'2015-02-22 22:07:22','2015-02-23 20:41:14','a9a3726f-d70d-4c84-acca-d69e926f7b89'),(6,6,75,'Arranger','arranger',1,'Tittel',NULL,NULL,'2016-03-27 22:55:34','2016-03-27 23:03:13','142fbc27-1939-4cda-a655-1855c5417c09');
/*!40000 ALTER TABLE `craft_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_entryversions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entryversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `num` smallint(6) unsigned NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entryversions_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entryversions_sectionId_fk` (`sectionId`),
  KEY `craft_entryversions_creatorId_fk` (`creatorId`),
  KEY `craft_entryversions_locale_fk` (`locale`),
  CONSTRAINT `craft_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entryversions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entryversions`
--

LOCK TABLES `craft_entryversions` WRITE;
/*!40000 ALTER TABLE `craft_entryversions` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_entryversions` VALUES (1,5,1,1,'nb_no',1,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Forside\",\"slug\":\"forside\",\"postDate\":1455709210,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"24\":{\"20\":{\"type\":\"blokk\",\"enabled\":\"1\",\"fields\":{\"bilde\":[\"41\"],\"tittel\":\"<p>Postproduksjon og <strong>Lyddesign<\\/strong><\\/p>\",\"tekst\":\"<p>Kreativt lyddesign som gir liv til bildene.<br>Med midt-norges eneste dedikerte foley-rom utstyrt med egen pit, kan vi levere foley og lyddesign til alle typer produksjoner.<\\/p>\",\"sidelink\":\"\"}},\"21\":{\"type\":\"blokk\",\"enabled\":\"1\",\"fields\":{\"bilde\":[\"40\"],\"tittel\":\"<p>Studio og <strong>musikkproduksjon<\\/strong><\\/p>\",\"tekst\":\"<p>Ingenting fremkaller mer f\\u00f8lelser enn musikk. Derfor bruker vi musikken for det den er verdt, s\\u00f8ml\\u00f8st med en god historie og god produksjon. Sluttproduktet er musikk som virkelig fremhever \\u00f8yeblikket. <\\/p>\",\"sidelink\":\"\"}}},\"36\":\"\",\"11\":\"Lyden av den gode historie\",\"10\":[\"40\"],\"12\":\"<p><a href=\\\"http:\\/\\/stoy.local\\/\\\">Musikk <strong>\\u00b7<\\/strong><\\/a> <a href=\\\"http:\\/\\/stoy.local\\/\\\">lyddesign <strong>\\u00b7<\\/strong><\\/a> <a href=\\\"http:\\/\\/stoy.local\\/\\\">voiceover <strong>\\u00b7<\\/strong><\\/a> <a href=\\\"http:\\/\\/stoy.local\\/\\\">foley<\\/a><\\/p>\",\"21\":[\"9\",\"22\",\"10\"]}}','2016-02-17 12:31:38','2016-02-17 12:31:38','598700a3-6ac1-415f-b360-b37a908b37af'),(2,6,2,1,'nb_no',1,'','{\"typeId\":\"2\",\"authorId\":null,\"title\":\"Kontakt\",\"slug\":\"kontakt\",\"postDate\":1424475196,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"30\":{\"30\":{\"type\":\"person\",\"enabled\":\"1\",\"fields\":{\"navn\":\"David Thyge Nielsen\",\"stilling\":\"Daglig leder\",\"telefonnummer\":\"985 45 553\",\"mailadresse\":\"david@stoey.no\"}},\"31\":{\"type\":\"person\",\"enabled\":\"1\",\"fields\":{\"navn\":\"Thomas Gregussen\",\"stilling\":\"Musikkprodusent og komponist\",\"telefonnummer\":\"985 45 553\",\"mailadresse\":\"thomas@stoey.no\"}},\"32\":{\"type\":\"person\",\"enabled\":\"1\",\"fields\":{\"navn\":\"Kjell Thomas Mathisen\",\"stilling\":\"Lyddesigner og foleyartist\",\"telefonnummer\":\"985 45 553\",\"mailadresse\":\"kjellthomas@stoey.no\"}}},\"38\":{\"33\":{\"type\":\"blokk\",\"enabled\":\"1\",\"fields\":{\"bilde\":[\"41\"],\"bildetekst\":\"Her er tekst\"}}},\"28\":\"St\\u00f8y er et kreativt lydbyr\\u00e5 med glimt i \\u00f8yet. V\\u00e5rt hovedvirke er produksjon av lyd og medier med spesiell vekt p\\u00e5 postproduksjon.\",\"41\":\"<p>Med bred erfaring fra tv-reklamer, kino-reklamer, fulle tv-produksjoner, kortfilm og informasjonsfilm kan du v\\u00e6re trygg p\\u00e5 at du f\\u00e5r den ekspertisen du trenger til din produksjon.  V\\u00e5r store lekeplass \\u00e5pner for overlegen allsidighet og ubegrensede muligheter for \\u00e5 bl\\u00e5se liv i din historie.Med to romslige produksjonsuiter, et stort innspillingsrom og dedikert foleystudio utstyrt med foleypit, er vi rustet for alle type utfordringer.<br><br><strong>MUSIKKPRODUKSJON<\\/strong><br>Ingenting fremkaller mer f\\u00f8lelser enn musikk, og vi skreddersyr musikken til din historie. Vi gj\\u00f8r alt fra store orkesterproduksjoner til akustiske inspillinger i en rekke stilarter.<br><br><strong>LYDDESIGN & LYD-ETTERARBEID<\\/strong><br>V\\u00e5r kreative lyddesigner gir liv til bildene og skaper det riktige universet til din historie. Lyd er halve opplevelsen blablablablabla<br><br><strong>VOICEOVER<\\/strong><br>Vi har tilgang til et stort utvalg av forskjellige stemmer og dialekter, gammel som ung. Ta kontakt s\\u00e5 finner vi noen som passer til din produksjon.<br><br><strong>FOLEY<\\/strong><br>Med Midt-norges eneste dedikerte foley-rom utstyrt med egen pit, kan vi levere foley og lyddesign til alle type produksjoner.<br><br><strong>FELTOPPTAK<\\/strong><\\/p>\",\"11\":\"Mer enn bare St\\u00f8y\",\"10\":[\"40\"]}}','2016-02-19 22:47:38','2016-02-19 22:47:38','9913e93a-2ded-4e0b-88dc-592142b9e676'),(3,5,1,1,'nb_no',2,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Forside\",\"slug\":\"forside\",\"postDate\":1455709210,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"24\":{\"20\":{\"type\":\"blokk\",\"enabled\":\"1\",\"fields\":{\"bilde\":[\"41\"],\"tittel\":\"<p>Postproduksjon og <strong>Lyddesign<\\/strong><\\/p>\",\"tekst\":\"<p>Kreativt lyddesign som gir liv til bildene.<br>Med midt-norges eneste dedikerte foley-rom utstyrt med egen pit, kan vi levere foley og lyddesign til alle typer produksjoner.<\\/p>\",\"sidelink\":\"\"}},\"21\":{\"type\":\"blokk\",\"enabled\":\"1\",\"fields\":{\"bilde\":[\"40\"],\"tittel\":\"<p>Studio og <strong>musikkproduksjon<\\/strong><\\/p>\",\"tekst\":\"<p>Ingenting fremkaller mer f\\u00f8lelser enn musikk. Derfor bruker vi musikken for det den er verdt, s\\u00f8ml\\u00f8st med en god historie og god produksjon. Sluttproduktet er musikk som virkelig fremhever \\u00f8yeblikket. <\\/p>\",\"sidelink\":\"\"}}},\"36\":[\"43\",\"44\",\"45\",\"46\",\"47\"],\"11\":\"Lyden av den gode historie\",\"10\":[\"40\"],\"12\":\"<p><a href=\\\"http:\\/\\/stoy.local\\/\\\">Musikk <strong>\\u00b7<\\/strong><\\/a> <a href=\\\"http:\\/\\/stoy.local\\/\\\">lyddesign <strong>\\u00b7<\\/strong><\\/a> <a href=\\\"http:\\/\\/stoy.local\\/\\\">voiceover <strong>\\u00b7<\\/strong><\\/a> <a href=\\\"http:\\/\\/stoy.local\\/\\\">foley<\\/a><\\/p>\",\"21\":[\"9\",\"22\",\"10\"]}}','2016-02-22 07:16:01','2016-02-22 07:16:01','42c717af-18f1-4dd7-aee5-e11389db1b34'),(4,5,1,1,'nb_no',3,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Forside\",\"slug\":\"forside\",\"postDate\":1455709210,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"24\":{\"20\":{\"type\":\"blokk\",\"enabled\":\"1\",\"fields\":{\"bilde\":[\"41\"],\"tittel\":\"<p>Postproduksjon og <strong>Lyddesign<\\/strong><\\/p>\",\"tekst\":\"<p>Kreativt lyddesign som gir liv til bildene.<br>Med midt-norges eneste dedikerte foley-rom utstyrt med egen pit, kan vi levere foley og lyddesign til alle typer produksjoner.<\\/p>\",\"sidelink\":\"\"}},\"21\":{\"type\":\"blokk\",\"enabled\":\"1\",\"fields\":{\"bilde\":[\"40\"],\"tittel\":\"<p>Studio og <strong>musikkproduksjon<\\/strong><\\/p>\",\"tekst\":\"<p>Ingenting fremkaller mer f\\u00f8lelser enn musikk. Derfor bruker vi musikken for det den er verdt, s\\u00f8ml\\u00f8st med en god historie og god produksjon. Sluttproduktet er musikk som virkelig fremhever \\u00f8yeblikket. <\\/p>\",\"sidelink\":\"\"}}},\"36\":[\"44\",\"46\",\"43\",\"45\",\"47\"],\"11\":\"Lyden av den gode historie\",\"10\":[\"40\"],\"12\":\"<p><a href=\\\"http:\\/\\/stoy.local\\/\\\">Musikk <strong>\\u00b7<\\/strong><\\/a> <a href=\\\"http:\\/\\/stoy.local\\/\\\">lyddesign <strong>\\u00b7<\\/strong><\\/a> <a href=\\\"http:\\/\\/stoy.local\\/\\\">voiceover <strong>\\u00b7<\\/strong><\\/a> <a href=\\\"http:\\/\\/stoy.local\\/\\\">foley<\\/a><\\/p>\",\"21\":[\"9\",\"22\",\"10\"]}}','2016-02-22 07:16:15','2016-02-22 07:16:15','d4adc11c-7495-4be9-a06a-484f1c3bbbcb'),(5,22,3,1,'nb_no',1,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Minimalen kortfilm\",\"slug\":\"undringst\\u00e5rnet\",\"postDate\":1424636460,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"22\":\"MInimalen 2016 introvignett\",\"20\":\"https:\\/\\/vimeo.com\\/151304098\"}}','2016-02-22 07:22:12','2016-02-22 07:22:12','0c49ea72-be51-444d-89cf-4c83727ff6d6'),(6,22,3,1,'nb_no',2,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Minimalen kortfilm\",\"slug\":\"undringst\\u00e5rnet\",\"postDate\":1424636460,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"22\":\"MInimalen 2016 introvignett\",\"20\":\"http:\\/\\/vimeo.com\\/151304098\"}}','2016-02-22 07:22:56','2016-02-22 07:22:56','64abbf68-8110-4959-84f2-7cd8c1a177ae'),(7,10,3,1,'nb_no',1,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Artsdatabanken\",\"slug\":\"jobb2\",\"postDate\":1424619420,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"22\":\"Artsdatabanken kapittel 5\",\"20\":\"http:\\/\\/vimeo.com\\/132723875\"}}','2016-02-22 07:23:45','2016-02-22 07:23:45','09925c00-4397-43b1-9871-e8a97e40b70e'),(8,9,3,1,'nb_no',1,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Artsdatabanken\",\"slug\":\"artsdatabanken\",\"postDate\":1424619360,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"22\":\"Artbanken kapittel 4\",\"20\":\"http:\\/\\/vimeo.com\\/132723874\"}}','2016-02-22 07:24:13','2016-02-22 07:24:13','e90841fd-77ef-448f-84ca-4771e5b9f3ec'),(9,5,1,1,'nb_no',4,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Forside\",\"slug\":\"forside\",\"postDate\":1455709210,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"24\":{\"20\":{\"type\":\"blokk\",\"enabled\":\"1\",\"fields\":{\"bilde\":[\"41\"],\"tittel\":\"<p>Postproduksjon og <strong>Lyddesign<\\/strong><\\/p>\",\"tekst\":\"<p>Kreativt lyddesign som gir liv til bildene.<br>Med midt-norges eneste dedikerte foley-rom utstyrt med egen pit, kan vi levere foley og lyddesign til alle typer produksjoner.<\\/p>\",\"sidelink\":\"\"}},\"21\":{\"type\":\"blokk\",\"enabled\":\"1\",\"fields\":{\"bilde\":[\"40\"],\"tittel\":\"<p>Studio og <strong>musikkproduksjon<\\/strong><\\/p>\",\"tekst\":\"<p>Ingenting fremkaller mer f\\u00f8lelser enn musikk. Derfor bruker vi musikken for det den er verdt, s\\u00f8ml\\u00f8st med en god historie og god produksjon. Sluttproduktet er musikk som virkelig fremhever \\u00f8yeblikket. <\\/p>\",\"sidelink\":\"\"}}},\"36\":[\"44\",\"46\",\"43\",\"45\",\"47\"],\"11\":\"Lyden av den gode historie\",\"10\":[\"40\"],\"12\":\"<p><a href=\\\"http:\\/\\/stoy.local\\/\\\">Musikk <strong>\\u00b7<\\/strong><\\/a> <a href=\\\"http:\\/\\/stoy.local\\/\\\">lyddesign <strong>\\u00b7<\\/strong><\\/a> <a href=\\\"http:\\/\\/stoy.local\\/\\\">voiceover <strong>\\u00b7<\\/strong><\\/a> <a href=\\\"http:\\/\\/stoy.local\\/\\\">foley<\\/a><\\/p>\",\"21\":[\"22\",\"9\",\"10\"]}}','2016-02-22 07:24:47','2016-02-22 07:24:47','10fbed31-ddab-4220-ae8c-894db16e8ea0'),(20,56,6,1,'nb_no',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Penny lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 21:21:04','2016-03-28 21:21:04','02d1d975-a70e-46b9-80e8-a9ce78d0b29f'),(21,56,6,1,'nb_no',2,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2016-03-28 21:21:08','2016-03-28 21:21:08','af76b637-c301-4137-8de4-7dc618599813'),(22,56,6,1,'nb_no',3,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny srlane\",\"slug\":\"penny-srlane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 21:21:12','2016-03-28 21:21:12','357d190c-88bc-41e4-aea7-8c685283c502'),(23,56,6,1,'nb_no',4,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny srlane\",\"slug\":\"penny-srlane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 21:21:12','2016-03-28 21:21:12','c65704bb-d403-45a0-b076-852644eaff92'),(24,56,6,1,'nb_no',5,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny srlane\",\"slug\":\"penny-srlane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2016-03-28 21:21:14','2016-03-28 21:21:14','2567e680-6135-4579-a894-9b8acbb010b8'),(25,56,6,1,'nb_no',6,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny srlane\",\"slug\":\"penny-srlane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2016-03-28 21:22:32','2016-03-28 21:22:32','c98f7095-dbd7-4e60-9b6d-808c819b079e'),(26,56,6,1,'nb_no',7,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny srlane\",\"slug\":\"penny-srlane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2016-03-28 21:22:46','2016-03-28 21:22:46','a252f739-c02f-4457-8634-85cdf009c736'),(27,56,6,1,'nb_no',8,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny srlane\",\"slug\":\"penny-srlane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2016-03-28 21:22:52','2016-03-28 21:22:52','4c647988-883a-4607-b53c-94a3405fe16f'),(28,56,6,1,'nb_no',9,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny srsdfgane\",\"slug\":\"penny-srsdfgane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 21:24:24','2016-03-28 21:24:24','bab9ab27-fa63-45e1-b749-a659b3437c30'),(29,56,6,1,'nb_no',10,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny srsdfgsdfgsdfgane\",\"slug\":\"penny-srsdfgsdfgsdfgane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 21:24:51','2016-03-28 21:24:51','5c33e54a-10b4-4065-a208-0ceca1f7c180'),(30,56,6,1,'nb_no',11,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 21:25:32','2016-03-28 21:25:32','eb5482ed-8052-40f2-8dcc-c6512120a3f4'),(31,56,6,1,'nb_no',12,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny adg\",\"slug\":\"penny-adg\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 21:26:07','2016-03-28 21:26:07','e2edf0e7-d357-4bc7-bedb-6919059f3036'),(32,56,6,1,'nb_no',13,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny d4\",\"slug\":\"penny-d4\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 21:26:49','2016-03-28 21:26:49','c4cdaa6e-e3af-4d4c-920d-4c54e7b7d612'),(33,56,6,1,'nb_no',14,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny d4\",\"slug\":\"penny-d4\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2016-03-28 21:26:50','2016-03-28 21:26:50','e7b7253f-80fc-41f3-b580-4854339fa0a3'),(34,56,6,1,'nb_no',15,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny d4\",\"slug\":\"penny-d4\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2016-03-28 21:27:09','2016-03-28 21:27:09','48c88541-dddd-4551-8f9e-4d78d5e6d95e'),(35,56,6,1,'nb_no',16,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny d4\",\"slug\":\"penny-d4\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2016-03-28 21:27:19','2016-03-28 21:27:19','c0bd906a-d5bd-43d2-896e-0bce25ca876e'),(36,56,6,1,'nb_no',17,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny d4\",\"slug\":\"penny-d4\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2016-03-28 21:27:38','2016-03-28 21:27:38','52de717f-ce19-48f8-9ec0-e54177626c66'),(37,56,6,1,'nb_no',18,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny d4\",\"slug\":\"penny-d4\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2016-03-28 21:28:10','2016-03-28 21:28:10','f2ab00f1-3388-4fa4-ad6c-004390fc3cae'),(38,56,6,1,'nb_no',19,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny d4\",\"slug\":\"penny-d4\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2016-03-28 21:28:31','2016-03-28 21:28:31','f6c961fb-c669-4d7e-a2fb-4d5a2b60c374'),(39,56,6,1,'nb_no',20,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny dt44\",\"slug\":\"penny-d4\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2016-03-28 21:31:27','2016-03-28 21:31:27','2e0487a0-8f08-4304-9e75-6d4513e8b14c'),(40,56,6,1,'nb_no',21,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny dtsrthsrth\",\"slug\":\"penny-dtsrthsrth\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2016-03-28 21:33:29','2016-03-28 21:33:29','8f4dfe83-1530-4973-9ee8-a9339c09b576'),(41,56,6,1,'nb_no',22,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2016-03-28 21:33:50','2016-03-28 21:33:50','36d2363c-c009-4ec2-8d82-1cc999ccc0cf'),(42,56,6,1,'nb_no',23,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lafne\",\"slug\":\"penny-lafne\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2016-03-28 21:34:48','2016-03-28 21:34:48','9f23aa53-af3f-4c60-8230-2546823ed13b'),(43,56,6,1,'nb_no',24,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lafne\",\"slug\":\"penny-lafne\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2016-03-28 21:37:22','2016-03-28 21:37:22','9a379c61-4677-49ae-be4c-513546334473'),(44,56,6,1,'nb_no',25,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lafne\",\"slug\":\"penny-lafne\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2016-03-28 21:37:27','2016-03-28 21:37:27','2b97a1e6-82c0-4a7c-8329-1ad63191cd9b'),(45,56,6,1,'nb_no',26,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lafne\",\"slug\":\"penny-lafnde\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2016-03-28 21:38:12','2016-03-28 21:38:12','14f3ec16-8673-42d1-b716-1e8ed7bfb9eb'),(46,56,6,1,'nb_no',27,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lafne\",\"slug\":\"penny-lafne\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 21:39:45','2016-03-28 21:39:45','07a7b5da-e5f5-4de7-8ad9-5f14b213cd9a'),(47,56,6,1,'nb_no',28,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lafne\",\"slug\":\"penny-lafne\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":200,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 21:39:49','2016-03-28 21:39:49','1ef7e6fc-1841-46f4-9e90-5c2d158fd6ec'),(48,56,6,1,'nb_no',29,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lafne\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":200,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 21:40:01','2016-03-28 21:40:01','0129d946-5b15-4006-be45-ee2b390fce3a'),(49,56,6,1,'nb_no',30,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lafne\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":200,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":410,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 21:40:10','2016-03-28 21:40:10','84200d0a-2086-464a-8d9c-a106ff82fe66'),(50,56,6,1,'nb_no',31,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lafne\",\"slug\":\"penny-lafne\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":200,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":410,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 21:50:14','2016-03-28 21:50:14','8409d481-235b-4c78-a320-b6827334fa92'),(51,56,6,1,'nb_no',32,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lafne\",\"slug\":\"penny-lafne\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":200,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":410,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 21:50:23','2016-03-28 21:50:23','32286784-3bd5-43ab-96fd-35e76a4c75a9'),(52,56,6,1,'nb_no',33,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lafne\",\"slug\":\"penny-lafne\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":200,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":410,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 21:50:55','2016-03-28 21:50:55','59cc78a1-db1c-456f-847a-7dd07466dcf5'),(53,56,6,1,'nb_no',34,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lafne\",\"slug\":\"penny-lafne\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":200,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":410,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 21:51:31','2016-03-28 21:51:31','8f1ade40-37c1-4d77-902d-daa2f879f151'),(54,56,6,1,'nb_no',35,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lafne\",\"slug\":\"penny-lafne\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":200,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":410,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 21:54:43','2016-03-28 21:54:43','5e22fa51-8623-42cc-a5ad-a8d44595285a'),(55,56,6,1,'nb_no',36,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lafne\",\"slug\":\"penny-lafne\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":200,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":410,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 21:54:52','2016-03-28 21:54:52','54aa73fc-4a41-44be-aaee-868ce45d98e6'),(56,56,6,1,'nb_no',37,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lafne\",\"slug\":\"penny-lafne\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":200,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":410,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 21:54:57','2016-03-28 21:54:57','4327d7e0-6a0f-4cd1-850b-1b007d631ad4'),(57,56,6,1,'nb_no',38,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lafne\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":200,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":410,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 22:03:14','2016-03-28 22:03:14','1140f27b-1e7c-4b0d-aba3-274ac90056e8'),(58,56,6,1,'nb_no',39,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lafne\",\"slug\":\"penny-lafne\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":200,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":410,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 22:06:46','2016-03-28 22:06:46','c5208e58-dca0-412a-8ae9-dad2713a5242'),(59,56,6,1,'nb_no',40,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lafne\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":200,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":410,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 22:06:56','2016-03-28 22:06:56','5905e118-32e4-4139-ba27-af9d11044a7e'),(60,56,6,1,'nb_no',41,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lafne\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":200,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0},{\\\"id\\\":2,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":620,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 22:07:11','2016-03-28 22:07:11','22695a8d-f8ef-42da-83e0-78f952e23838'),(61,56,6,1,'nb_no',42,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lafne\",\"slug\":\"penny-lafgerne\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":200,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0},{\\\"id\\\":2,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":620,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 22:08:58','2016-03-28 22:08:58','908ecc98-94fa-4c27-a8b0-4df0c9422afa'),(62,56,6,1,'nb_no',43,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lerferferferf44444afne\",\"slug\":\"penny-lerferferferf44444afne\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":200,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0},{\\\"id\\\":2,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":620,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 22:09:50','2016-03-28 22:09:50','acfb4d5a-f360-4ac3-98ce-e2c696099d02'),(63,56,6,1,'nb_no',44,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lerferferferf44444afne\",\"slug\":\"penny-lein\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":200,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0},{\\\"id\\\":2,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":620,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 22:10:26','2016-03-28 22:10:26','e75a2bc2-9027-49ae-b9b2-fbf812339939'),(64,56,6,1,'nb_no',45,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny lerferferferf44444afne\",\"slug\":\"354t\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":200,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0},{\\\"id\\\":2,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":620,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 22:10:38','2016-03-28 22:10:38','b72e5ffb-b007-4778-be46-86e8eb62add2'),(65,56,6,1,'nb_no',46,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":200,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0},{\\\"id\\\":2,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":620,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 22:14:20','2016-03-28 22:14:20','694c7d7f-9eee-4df2-908f-1341245754fa'),(66,56,6,1,'nb_no',47,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 22:14:36','2016-03-28 22:14:36','edd4a221-1329-4884-bbf2-7ec65e44bf3b'),(67,56,6,1,'nb_no',48,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:30:24','2016-03-28 23:30:24','63cb8852-a625-47a5-beb9-91fd36c40d42'),(68,56,6,1,'nb_no',49,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:30:25','2016-03-28 23:30:25','3247a562-e7aa-4824-b3e2-05059b94720a'),(69,56,6,1,'nb_no',50,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:30:26','2016-03-28 23:30:26','874ada2c-3154-4c0e-810b-d2c0847eba02'),(70,56,6,1,'nb_no',51,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:30:27','2016-03-28 23:30:27','2faaf52b-fea9-4bc1-b0dc-339e07f18e93'),(71,56,6,1,'nb_no',52,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:30:28','2016-03-28 23:30:28','d12743bf-4fa3-4a7b-9a2a-da11cb419aff'),(72,56,6,1,'nb_no',53,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:30:29','2016-03-28 23:30:29','9d6e81e4-f9e0-46e4-8b96-f83748900be8'),(73,56,6,1,'nb_no',54,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:30:30','2016-03-28 23:30:30','565c415d-9c56-4f7d-abd5-a44fdb6896cf'),(74,56,6,1,'nb_no',55,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:30:31','2016-03-28 23:30:31','227c08db-58e7-4ff3-a45f-c8039ab86d4c'),(75,56,6,1,'nb_no',56,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:30:32','2016-03-28 23:30:32','4ea58bb6-6e65-46e0-a335-47970f3a7e75'),(76,56,6,1,'nb_no',57,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:30:33','2016-03-28 23:30:33','9343437f-6d6f-4718-b36f-96fe95192a25'),(77,56,6,1,'nb_no',58,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:30:34','2016-03-28 23:30:34','f90faece-5767-4ed0-ba1e-83f0afd7a7cb'),(78,56,6,1,'nb_no',59,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:30:35','2016-03-28 23:30:35','447b0c6b-4039-4dec-a966-f0bea448e916'),(79,56,6,1,'nb_no',60,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:30:36','2016-03-28 23:30:36','48c8fd29-68ce-41df-9610-4ff287334944'),(80,56,6,1,'nb_no',61,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:30:37','2016-03-28 23:30:37','ed62aac4-3368-4017-a00c-4e400278863e'),(81,56,6,1,'nb_no',62,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:30:38','2016-03-28 23:30:38','7ffc0d8f-1c08-48d0-bd89-5a37fad168fb'),(82,56,6,1,'nb_no',63,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:30:44','2016-03-28 23:30:44','f1654e26-b70b-4b15-b5c9-498c59cf2f5e'),(83,56,6,1,'nb_no',64,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:30:49','2016-03-28 23:30:49','e8a46ea0-95d0-464f-8586-6ffd064fecf5'),(84,56,6,1,'nb_no',65,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:30:54','2016-03-28 23:30:54','982170ae-5067-4f05-b577-a799d31f05cf'),(85,56,6,1,'nb_no',66,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:30:59','2016-03-28 23:30:59','73ee2804-9279-4f58-a97c-f28d1d0c84e7'),(86,56,6,1,'nb_no',67,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:31:04','2016-03-28 23:31:04','02f2f79f-09c7-455a-8929-1acf56548d05'),(87,56,6,1,'nb_no',68,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:31:09','2016-03-28 23:31:09','7a487f5a-d66e-4acd-acf2-b8a33a2e42cf'),(88,56,6,1,'nb_no',69,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:31:14','2016-03-28 23:31:14','02c7cf9a-2a2a-451c-ae2f-05c64ae234ed'),(89,56,6,1,'nb_no',70,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:31:19','2016-03-28 23:31:19','bc3734c0-1d35-4d14-93b0-1382d7072f1d'),(90,56,6,1,'nb_no',71,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:31:24','2016-03-28 23:31:24','a659f9b1-8670-4537-abb0-2aec421fdfdb'),(91,56,6,1,'nb_no',72,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:32:26','2016-03-28 23:32:26','8166da7a-098a-4e08-8a6d-e3f9890150bb'),(92,56,6,1,'nb_no',73,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:37:56','2016-03-28 23:37:56','c2b464de-0df7-479c-881e-ecadb373a183'),(93,56,6,1,'nb_no',74,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:43:47','2016-03-28 23:43:47','0cd747d3-b078-423f-8160-a3ad38891dd9'),(94,56,6,1,'nb_no',75,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:44:47','2016-03-28 23:44:47','ec15db1c-7629-4a90-8108-f9427332b442'),(95,56,6,1,'nb_no',76,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:45:47','2016-03-28 23:45:47','09206750-4b44-4775-9798-55291269550f'),(96,56,6,1,'nb_no',77,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:46:47','2016-03-28 23:46:47','33bbe102-4c48-4f91-9682-3fd4301c2a2a'),(97,56,6,1,'nb_no',78,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:47:47','2016-03-28 23:47:47','28c21e0a-b501-4801-8cfd-32dcaac6e148'),(98,56,6,1,'nb_no',79,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:48:47','2016-03-28 23:48:47','3cba7118-81b8-44d4-9c7c-a1caaa98f7e4'),(99,56,6,1,'nb_no',80,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:49:47','2016-03-28 23:49:47','63397a16-1fd9-4701-8dd0-cf2cf3738e15'),(100,56,6,1,'nb_no',81,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:50:47','2016-03-28 23:50:47','3a129eac-fbad-488a-812d-a78482bb2eeb'),(101,56,6,1,'nb_no',82,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:51:47','2016-03-28 23:51:47','c0ab633e-d07d-4839-9ddd-15f243bf6b68'),(102,56,6,1,'nb_no',83,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:52:47','2016-03-28 23:52:47','314a7fd0-efee-41d2-a959-637c1c1d48d9'),(103,56,6,1,'nb_no',84,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:53:47','2016-03-28 23:53:47','d4e4ebb7-4faf-4ed2-9cd2-971d56966d53'),(104,56,6,1,'nb_no',85,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:54:47','2016-03-28 23:54:47','87826e68-9379-463f-819b-5503b81bf3ae'),(105,56,6,1,'nb_no',86,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:55:47','2016-03-28 23:55:47','83d60c91-76e1-4473-b455-79614b1f1228'),(106,56,6,1,'nb_no',87,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:56:47','2016-03-28 23:56:47','15b43ee5-3749-4227-a1ef-98d6962febb6'),(107,56,6,1,'nb_no',88,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:57:47','2016-03-28 23:57:47','e0b036fc-673c-4be5-be04-6f1b43a10ed8'),(108,56,6,1,'nb_no',89,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:58:47','2016-03-28 23:58:47','d3fb189c-8e4a-45e4-8315-01958aa54c03'),(109,56,6,1,'nb_no',90,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-28 23:59:47','2016-03-28 23:59:47','3601bcba-51b8-498e-b7dd-549758cd1c4f'),(110,56,6,1,'nb_no',91,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:00:47','2016-03-29 00:00:47','7036ea80-704d-4db2-b5f3-175e294a6537'),(111,56,6,1,'nb_no',92,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:01:47','2016-03-29 00:01:47','76e24b18-a230-4a11-a4b7-1737b13f0b46'),(112,56,6,1,'nb_no',93,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:02:47','2016-03-29 00:02:47','f5e69538-45e2-4594-9dab-de6c58d64d8b'),(113,56,6,1,'nb_no',94,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:03:47','2016-03-29 00:03:47','1e564ce4-bb3b-45bc-b998-f078deca8f6f'),(114,56,6,1,'nb_no',95,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:04:47','2016-03-29 00:04:47','be702544-eb5c-49ea-84e5-9c5e892bf0c2'),(115,56,6,1,'nb_no',96,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:05:47','2016-03-29 00:05:47','2aa97eff-4df9-46c4-aea1-2caa7aacd6bf'),(116,56,6,1,'nb_no',97,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:06:47','2016-03-29 00:06:47','791ac62e-5b42-4a54-9eb9-37abc18b7526'),(117,56,6,1,'nb_no',98,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:07:47','2016-03-29 00:07:47','0e06941b-4f7e-4558-a57d-2a27371bf6f7'),(118,56,6,1,'nb_no',99,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:08:47','2016-03-29 00:08:47','85dad828-ef99-46b1-ba98-db073bb3b2a9'),(119,56,6,1,'nb_no',100,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:09:47','2016-03-29 00:09:47','92280387-2ab3-4c7e-bf7e-efc1f00a619c'),(120,56,6,1,'nb_no',101,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:10:47','2016-03-29 00:10:47','8d440746-19e0-4348-b609-71df39ce6429'),(121,56,6,1,'nb_no',102,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:11:47','2016-03-29 00:11:47','c06374e4-9744-4400-8be3-b6a3f8b60970'),(122,56,6,1,'nb_no',103,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:12:47','2016-03-29 00:12:47','d0934bce-428f-4502-a43b-2030674e9904'),(123,56,6,1,'nb_no',104,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:13:47','2016-03-29 00:13:47','35819b56-e64b-49aa-b9fd-36f5256e72e3'),(124,56,6,1,'nb_no',105,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:14:47','2016-03-29 00:14:47','203d1397-82fd-439a-ad78-c3edd101c233'),(125,56,6,1,'nb_no',106,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:15:47','2016-03-29 00:15:47','030ac667-6b1e-40c4-898f-2c915597bb82'),(126,56,6,1,'nb_no',107,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:16:47','2016-03-29 00:16:47','7febb094-6894-4069-9553-d88d108b5689'),(127,56,6,1,'nb_no',108,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:17:47','2016-03-29 00:17:47','13cb26d1-67de-435e-96ba-d41bb5e9e27b'),(128,56,6,1,'nb_no',109,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:18:47','2016-03-29 00:18:47','6492f3cc-0272-45fa-8f60-c0e0069aa89f'),(129,56,6,1,'nb_no',110,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:19:47','2016-03-29 00:19:47','b3a173a4-2d1c-4364-a60f-43a1af6c65cd'),(130,56,6,1,'nb_no',111,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:20:47','2016-03-29 00:20:47','9ea22a71-12f1-4a0e-bfac-0b5655dbc682'),(131,56,6,1,'nb_no',112,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:21:47','2016-03-29 00:21:47','0a69176d-6031-456f-83c6-b80e1be58c76'),(132,56,6,1,'nb_no',113,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:22:47','2016-03-29 00:22:47','60f72c28-0d4b-4dac-bf8e-85c5e0aeab07'),(133,56,6,1,'nb_no',114,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:23:47','2016-03-29 00:23:47','f3a432ae-cc7d-4443-ba2d-f1b95637d328'),(134,56,6,1,'nb_no',115,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:24:47','2016-03-29 00:24:47','4840bb1c-e3ca-40a6-bdd2-cd9ba9780b52'),(135,56,6,1,'nb_no',116,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:25:47','2016-03-29 00:25:47','12069b96-5afb-48b8-bac1-de70cc8d8631'),(136,56,6,1,'nb_no',117,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:26:47','2016-03-29 00:26:47','a0c49888-a759-4748-8a51-d2cf205454ce'),(137,56,6,1,'nb_no',118,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:27:47','2016-03-29 00:27:47','a4d2306b-7105-4900-87b3-1c7ac62bb744'),(138,56,6,1,'nb_no',119,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:28:47','2016-03-29 00:28:47','01e967aa-a181-4dac-a1ef-860adc23be52'),(139,56,6,1,'nb_no',120,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:29:47','2016-03-29 00:29:47','2380d0d0-1a13-41d5-8d31-309e413d1b75'),(140,56,6,1,'nb_no',121,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:30:47','2016-03-29 00:30:47','59827af7-baed-4833-b25d-978d01742bf7'),(141,56,6,1,'nb_no',122,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:31:47','2016-03-29 00:31:47','b837fda1-1318-4540-b3e1-03922c82e260'),(142,56,6,1,'nb_no',123,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:32:47','2016-03-29 00:32:47','c849157f-9f24-4882-8e78-679e5ff2652d'),(143,56,6,1,'nb_no',124,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:33:47','2016-03-29 00:33:47','f71ba7e1-d27a-4c7d-8b93-6011a9bdefee'),(144,56,6,1,'nb_no',125,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:34:47','2016-03-29 00:34:47','3ba9378d-be3a-49aa-8608-626fb09f8f98'),(145,56,6,1,'nb_no',126,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:35:47','2016-03-29 00:35:47','1b8e068e-f767-4d25-8926-5fb68d4a42fe'),(146,56,6,1,'nb_no',127,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:36:47','2016-03-29 00:36:47','64ed3856-c2b1-4939-8c8d-66bed73519c2'),(147,56,6,1,'nb_no',128,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:37:47','2016-03-29 00:37:47','17942ed6-6646-48d7-a811-3cb8cc183f47'),(148,56,6,1,'nb_no',129,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:38:47','2016-03-29 00:38:47','950114bd-4abc-4da8-a270-57406e4dd273'),(149,56,6,1,'nb_no',130,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:39:47','2016-03-29 00:39:47','94f6bb1f-24d0-40a2-9ea4-183d13abc521'),(150,56,6,1,'nb_no',131,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:40:47','2016-03-29 00:40:47','0bb9c9a8-130c-4a8b-b5ab-346396286747'),(151,56,6,1,'nb_no',132,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:41:47','2016-03-29 00:41:47','78ce5b6d-693c-4fb5-916b-acd6d4ae6db4'),(152,56,6,1,'nb_no',133,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 00:42:47','2016-03-29 00:42:47','5ac96c2b-aa09-46b6-83cc-4defcc15e99d'),(153,56,6,1,'nb_no',134,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:12:37','2016-03-29 11:12:37','4f4ba60c-39a6-4ae6-8b70-c05b15589d05'),(154,56,6,1,'nb_no',135,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:13:36','2016-03-29 11:13:36','707e8f77-0199-4131-83b0-1e78a7b37316'),(155,56,6,1,'nb_no',136,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:14:36','2016-03-29 11:14:36','24ec825b-a844-4a70-8f72-d8414a4bc952'),(156,56,6,1,'nb_no',137,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:15:36','2016-03-29 11:15:36','c85f80e0-daa8-402c-a790-4f81cc98df52'),(157,56,6,1,'nb_no',138,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:16:36','2016-03-29 11:16:36','67658ce1-9565-463d-8d1b-d0c9616ea60a'),(158,56,6,1,'nb_no',139,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:17:36','2016-03-29 11:17:36','b0072192-2251-495a-9359-0ceaf8285de9'),(159,56,6,1,'nb_no',140,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:18:36','2016-03-29 11:18:36','ee4ce317-83da-4f81-811c-b7daca8daa2f'),(160,56,6,1,'nb_no',141,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:19:36','2016-03-29 11:19:36','289e0f6c-4bdb-4678-ae2b-55f5e0c749c8'),(161,56,6,1,'nb_no',142,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:20:36','2016-03-29 11:20:36','06002ac2-362e-4f4e-a7be-393da29c632a'),(162,56,6,1,'nb_no',143,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:21:36','2016-03-29 11:21:36','f32e2d9e-9349-467a-86d2-717c50665e52'),(163,56,6,1,'nb_no',144,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:22:36','2016-03-29 11:22:36','24062a3e-8dc6-4daf-bdb0-ce61bad8482a'),(164,56,6,1,'nb_no',145,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:23:36','2016-03-29 11:23:36','b49d5799-2c4e-4291-a35b-83dba342fd14'),(165,56,6,1,'nb_no',146,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:24:36','2016-03-29 11:24:36','e859d03e-bda4-4065-a67d-c51fedb2c5bd'),(166,56,6,1,'nb_no',147,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:25:36','2016-03-29 11:25:36','14ce757c-fafd-4b6e-8261-f7ff3df56bc3'),(167,56,6,1,'nb_no',148,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:26:36','2016-03-29 11:26:36','9301f784-fddd-41db-bd39-9d98c6f6904a'),(168,56,6,1,'nb_no',149,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:27:36','2016-03-29 11:27:36','8aa464eb-2d95-440b-98dd-27ddfe5c473c'),(169,56,6,1,'nb_no',150,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:28:36','2016-03-29 11:28:36','258d8a85-8985-4d27-b558-6e3ed38a74f2'),(170,56,6,1,'nb_no',151,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:29:36','2016-03-29 11:29:36','521e169b-2eb5-49d0-b2c2-65a814a520c0'),(171,56,6,1,'nb_no',152,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:30:36','2016-03-29 11:30:36','a5c0ae13-5c4d-43dd-82c2-7f758c3754ef'),(172,56,6,1,'nb_no',153,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:31:36','2016-03-29 11:31:36','b255d402-7995-4a42-8c73-f98baff43e1c'),(173,56,6,1,'nb_no',154,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:32:36','2016-03-29 11:32:36','cc1e9ca0-e1e1-466f-ba08-27896019023e'),(174,56,6,1,'nb_no',155,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:33:36','2016-03-29 11:33:36','5daedb7a-7761-4ccd-b756-a3fa66239af4'),(175,56,6,1,'nb_no',156,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:34:36','2016-03-29 11:34:36','99bc25f0-040c-4e75-bf51-1fcda95caa10'),(176,56,6,1,'nb_no',157,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:35:36','2016-03-29 11:35:36','063b49ad-f14c-41aa-9d01-991669b2c08b'),(177,56,6,1,'nb_no',158,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:36:36','2016-03-29 11:36:36','edd1b3c1-a40a-46bd-a966-d897c91c06d6'),(178,56,6,1,'nb_no',159,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:37:36','2016-03-29 11:37:36','34e53fdb-2618-4308-a1f2-27f59c05e265'),(179,56,6,1,'nb_no',160,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:38:36','2016-03-29 11:38:36','c7f387cf-6890-457a-8b57-9fee45ea7c0c'),(180,56,6,1,'nb_no',161,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:39:36','2016-03-29 11:39:36','d966503f-4997-4c88-b726-e1a82ce1464f'),(181,56,6,1,'nb_no',162,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:40:36','2016-03-29 11:40:36','e1dd0bc1-f4f7-49f4-a3f6-ec20f2659ca4'),(182,56,6,1,'nb_no',163,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:41:36','2016-03-29 11:41:36','a9ac749d-8a48-4c71-8c63-74256df9f849'),(183,56,6,1,'nb_no',164,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:42:36','2016-03-29 11:42:36','bf57463c-fbdd-413c-8655-d03aebed2b7f'),(184,56,6,1,'nb_no',165,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:43:36','2016-03-29 11:43:36','31310757-8378-4008-93a6-f13b5c36ca47'),(185,56,6,1,'nb_no',166,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:44:36','2016-03-29 11:44:36','d562f5fa-0ac0-47b3-be8a-282c217bbbc7'),(186,56,6,1,'nb_no',167,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:45:36','2016-03-29 11:45:36','8ac83af8-43fa-4a69-bf69-edee8ceba0fd'),(187,56,6,1,'nb_no',168,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:46:36','2016-03-29 11:46:36','a1565959-91e9-49e0-b427-ee31f253f801'),(188,56,6,1,'nb_no',169,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:47:36','2016-03-29 11:47:36','e5d9740f-34a5-46f0-b820-f4887e6194a5'),(189,56,6,1,'nb_no',170,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:48:36','2016-03-29 11:48:36','32f8ade5-6bda-43f2-8a3c-0052f83014ef'),(190,56,6,1,'nb_no',171,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:49:36','2016-03-29 11:49:36','3fedc063-3d82-46ac-942d-e078a206045d'),(191,56,6,1,'nb_no',172,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:50:36','2016-03-29 11:50:36','7f92e637-d343-44e7-8345-7ad310645398'),(192,56,6,1,'nb_no',173,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:51:36','2016-03-29 11:51:36','8ce3cca9-2b56-4a10-9ac3-38609d8c12e2'),(193,56,6,1,'nb_no',174,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:52:36','2016-03-29 11:52:36','c3fbb334-665c-4940-80fd-07fe3ff076da'),(194,56,6,1,'nb_no',175,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:53:36','2016-03-29 11:53:36','30d29072-0221-4916-a3e8-fee4f1fb28f4'),(195,56,6,1,'nb_no',176,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:54:36','2016-03-29 11:54:36','b870ac7f-ea99-4941-9bd2-c24e6eba6b41'),(196,56,6,1,'nb_no',177,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:55:36','2016-03-29 11:55:36','a5f2e626-a156-4b72-9940-3e69459f2bfa'),(197,56,6,1,'nb_no',178,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:56:36','2016-03-29 11:56:36','fcc9ce9a-a095-4ddd-b515-49ea97510fc7'),(198,56,6,1,'nb_no',179,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:57:36','2016-03-29 11:57:36','b0deb0e8-50e4-4b81-8b91-d66e82480f16'),(199,56,6,1,'nb_no',180,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:58:36','2016-03-29 11:58:36','760835a4-fdd2-4213-a06e-ae4f3269035e'),(200,56,6,1,'nb_no',181,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 11:59:36','2016-03-29 11:59:36','cb3299ad-8df1-4004-b053-8ca09c9d243e'),(201,56,6,1,'nb_no',182,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 12:00:36','2016-03-29 12:00:36','e4541e4c-3dda-4a25-9dff-f4cd5bc124e6'),(202,56,6,1,'nb_no',183,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 12:01:36','2016-03-29 12:01:36','fd43ce30-8f97-4d3c-84b5-f289e85f5343'),(203,56,6,1,'nb_no',184,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 12:02:36','2016-03-29 12:02:36','e418fa97-b17f-4559-bac7-b14e2a82961a'),(204,56,6,1,'nb_no',185,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 12:03:36','2016-03-29 12:03:36','3f488932-0343-461a-955d-1b52e198dfc7'),(205,56,6,1,'nb_no',186,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 12:04:36','2016-03-29 12:04:36','600d52c9-080e-48ee-901c-0b655ffa70f8'),(206,56,6,1,'nb_no',187,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 12:05:36','2016-03-29 12:05:36','077ae3c7-1664-4bea-9b8e-b8c4c43f8e6b'),(207,56,6,1,'nb_no',188,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 12:06:36','2016-03-29 12:06:36','9793948a-5a38-4881-a3dc-6f24f2d5d5b2'),(208,56,6,1,'nb_no',189,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 12:07:36','2016-03-29 12:07:36','c9667fbd-abd0-41d6-b2f0-03bc39cf4c84'),(209,56,6,1,'nb_no',190,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 12:08:36','2016-03-29 12:08:36','aad6ec08-dd20-421f-ab66-e70552b1f5a7'),(210,56,6,1,'nb_no',191,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 12:09:36','2016-03-29 12:09:36','a0954809-ab8f-4639-a48e-fafa79117e0f'),(211,56,6,1,'nb_no',192,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 12:10:36','2016-03-29 12:10:36','de6b294d-2388-4348-b186-58ce1fbc1e13'),(212,56,6,1,'nb_no',193,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 12:11:36','2016-03-29 12:11:36','c3375904-4ccf-4efe-98bb-fdbbd570eee1'),(213,56,6,1,'nb_no',194,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 12:35:05','2016-03-29 12:35:05','1088e345-bff0-4c95-9999-1f1a878f5cee'),(214,56,6,1,'nb_no',195,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 12:36:07','2016-03-29 12:36:07','78605f0d-5b8f-4d0e-8ea5-d9bf0fe1e773'),(215,56,6,1,'nb_no',196,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 12:37:07','2016-03-29 12:37:07','7b6d083b-0e5f-4b74-8f6e-94f1c624db7e'),(216,56,6,1,'nb_no',197,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 12:38:08','2016-03-29 12:38:08','65a074b8-1a11-4e0b-8a06-12ac1f1c16d0'),(217,56,6,1,'nb_no',198,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":2}]\"}}','2016-03-29 12:39:30','2016-03-29 12:39:30','718a29bf-bc0e-4b7a-8b13-2e8ea51a2abb'),(218,56,6,1,'nb_no',199,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 12:41:30','2016-03-29 12:41:30','6b71fd83-efc5-4b53-8031-82d5ba41acfd'),(219,56,6,1,'nb_no',200,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 12:42:30','2016-03-29 12:42:30','182ed823-781d-4edd-b91b-9a438b1d2dcf'),(220,56,6,1,'nb_no',201,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 12:43:30','2016-03-29 12:43:30','a45f9081-009c-4ded-8c03-ab4a11082fc7'),(221,56,6,1,'nb_no',202,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 12:45:32','2016-03-29 12:45:32','047f55da-fa6b-4801-8efb-a97558d669bb'),(222,56,6,1,'nb_no',203,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 12:46:32','2016-03-29 12:46:32','f13952ab-aedf-4f28-b09b-0136583000ca'),(223,56,6,1,'nb_no',204,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 12:49:20','2016-03-29 12:49:20','daa80bc7-56cc-42d9-81b3-3765a8f8435f'),(224,56,6,1,'nb_no',205,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 12:50:50','2016-03-29 12:50:50','7f647bce-83c9-4d2b-ac01-cbf579a88c7d'),(225,56,6,1,'nb_no',206,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 12:51:50','2016-03-29 12:51:50','7047e529-bd1b-4f43-9b67-49948048fef4'),(226,56,6,1,'nb_no',207,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 12:53:23','2016-03-29 12:53:23','0833a29c-adc0-45e3-a290-06492c351b90'),(227,56,6,1,'nb_no',208,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 12:58:53','2016-03-29 12:58:53','58442d5e-ca39-4e2f-9165-a89b9b8587fa'),(228,56,6,1,'nb_no',209,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":6}]\"}}','2016-03-29 13:00:52','2016-03-29 13:00:52','4beff5ef-6e32-40ed-badf-12cf8ba130b7'),(229,56,6,1,'nb_no',210,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8}]\"}}','2016-03-29 13:01:56','2016-03-29 13:01:56','f3718712-68a8-48ec-a771-1d8692af247f'),(230,56,6,1,'nb_no',211,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8}]\"}}','2016-03-29 13:03:22','2016-03-29 13:03:22','160321af-3305-40b2-a197-5368791c1322'),(231,56,6,1,'nb_no',212,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":6}]\"}}','2016-03-29 13:05:08','2016-03-29 13:05:08','d101796f-5622-42b3-bdb9-cf60a74e18b1'),(232,56,6,1,'nb_no',213,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":6}]\"}}','2016-03-29 13:06:40','2016-03-29 13:06:40','4ef62b60-55e9-4adc-adf0-81c38aad9ce1'),(233,56,6,1,'nb_no',214,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":6}]\"}}','2016-03-29 13:07:40','2016-03-29 13:07:40','4ad36811-7962-46e7-b1f6-c52ca5308f96'),(234,56,6,1,'nb_no',215,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":6}]\"}}','2016-03-29 13:09:26','2016-03-29 13:09:26','c4bbc965-635b-41bf-bd42-c0854bc804c9'),(235,56,6,1,'nb_no',216,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":6}]\"}}','2016-03-29 13:11:51','2016-03-29 13:11:51','96303c05-5129-4f25-aa9d-b4d0f6db7438'),(236,56,6,1,'nb_no',217,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":6},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3},{\\\"instruments\\\":[],\\\"id\\\":2,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":2}]\"}}','2016-03-29 13:12:04','2016-03-29 13:12:04','ba1a1061-fa07-4816-a1c0-e13227c4cad8'),(237,56,6,1,'nb_no',218,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":6},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3},{\\\"instruments\\\":[],\\\"id\\\":2,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":2}]\"}}','2016-03-29 13:13:08','2016-03-29 13:13:08','93c16125-7e01-48e2-ae69-74bf100aded6'),(238,56,6,1,'nb_no',219,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":6},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3},{\\\"instruments\\\":[],\\\"id\\\":2,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":2}]\"}}','2016-03-29 13:14:45','2016-03-29 13:14:45','c865479f-85ce-4b26-a700-0877fb57a867'),(239,56,6,1,'nb_no',220,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8}]\"}}','2016-03-29 13:17:03','2016-03-29 13:17:03','6c91fcac-641c-4728-8d39-adb769de9014'),(240,56,6,1,'nb_no',221,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":116,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":284,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 13:19:04','2016-03-29 13:19:04','640024ea-503d-4cd9-b021-4fd97292a4ae'),(241,56,6,1,'nb_no',222,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":564,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 13:23:03','2016-03-29 13:23:03','b0bbc4fc-85ea-4ea5-a460-76e2e647b69f'),(242,56,6,1,'nb_no',223,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":382,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 13:24:58','2016-03-29 13:24:58','29c9abf7-2b9e-47a4-abfb-6fde325da556'),(243,56,6,1,'nb_no',224,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":4},{\\\"instruments\\\":[],\\\"id\\\":2,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":8}]\"}}','2016-03-29 13:26:56','2016-03-29 13:26:56','b7f70004-4533-4393-8726-4a6a15ef125d'),(244,56,6,1,'nb_no',225,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 13:27:59','2016-03-29 13:27:59','d8092fc8-2d1d-4934-9eeb-3ad54229c1cf'),(245,56,6,1,'nb_no',226,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 13:28:59','2016-03-29 13:28:59','f6a3bf92-9d00-45c7-838e-27c7b0c6a567'),(246,56,6,1,'nb_no',227,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 13:30:00','2016-03-29 13:30:00','357ef467-0593-4b63-aec7-1e5ef00e2e1e'),(247,56,6,1,'nb_no',228,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 13:30:59','2016-03-29 13:30:59','026688af-b817-4085-98ce-32a9e14475de'),(248,56,6,1,'nb_no',229,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 13:31:59','2016-03-29 13:31:59','d8cd29f3-1e4f-42e7-9ec3-0aadcd41ffe8'),(249,56,6,1,'nb_no',230,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 13:32:59','2016-03-29 13:32:59','a6e2056e-cf46-479f-8aba-762d173c08f9'),(250,56,6,1,'nb_no',231,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 13:33:59','2016-03-29 13:33:59','fcc35fc0-8eb2-452c-aaf0-d8e487bf9f42'),(251,56,6,1,'nb_no',232,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 13:34:59','2016-03-29 13:34:59','02b1dba1-1704-4368-9a6d-256586656fcc'),(252,56,6,1,'nb_no',233,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 13:35:59','2016-03-29 13:35:59','919f5a76-c835-411c-9a86-ce8d6b9e73ac'),(253,56,6,1,'nb_no',234,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 13:36:59','2016-03-29 13:36:59','89b065da-77b3-4a06-b92c-33327dbd2d64'),(254,56,6,1,'nb_no',235,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 13:37:59','2016-03-29 13:37:59','d30f25e2-6a84-48d0-b910-bd9ada674638'),(255,56,6,1,'nb_no',236,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 13:38:59','2016-03-29 13:38:59','1caff78f-ab41-4f08-a8f1-e5c8ccbeb43c'),(256,56,6,1,'nb_no',237,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 13:39:59','2016-03-29 13:39:59','95c8b04f-56a7-4079-a4af-0d72d8822a44'),(257,56,6,1,'nb_no',238,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 13:40:59','2016-03-29 13:40:59','f305caff-07e4-4171-b69b-ce82dc6e292e'),(258,56,6,1,'nb_no',239,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 13:41:59','2016-03-29 13:41:59','f1424fec-2f3b-4f17-a648-9556d6a7f69e'),(259,57,6,1,'nb_no',1,NULL,'{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Test\",\"slug\":\"test\",\"postDate\":1459258965,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2016-03-29 13:42:45','2016-03-29 13:42:45','7c539361-8d1c-4004-9a92-0aa0b77f3ab1'),(260,57,6,1,'nb_no',2,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Test\",\"slug\":\"test\",\"postDate\":1459258965,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[],\\\"id\\\":0,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 13:42:59','2016-03-29 13:42:59','d43fe12d-84ed-4075-85f1-0b02991ab9a6'),(261,57,6,1,'nb_no',3,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Test\",\"slug\":\"test\",\"postDate\":1459258965,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[],\\\"id\\\":0,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":4}]\"}}','2016-03-29 13:44:06','2016-03-29 13:44:06','e611ae00-36cb-46e1-9414-f968669be2ed'),(262,56,6,1,'nb_no',240,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 13:45:34','2016-03-29 13:45:34','0d8ae219-11a0-49dc-b60a-f4a3b8e476c5'),(263,56,6,1,'nb_no',241,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 13:46:34','2016-03-29 13:46:34','b1bbd37e-8e9a-41f9-85b4-1bd0b710c530'),(264,56,6,1,'nb_no',242,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 13:47:34','2016-03-29 13:47:34','15efc5c4-2d70-49fd-a323-b4ab12d6c43a'),(265,56,6,1,'nb_no',243,NULL,'{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Penny Lane\",\"slug\":\"penny-lane\",\"postDate\":1459200064,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"[{\\\"instruments\\\":[{\\\"id\\\":0,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":100,\\\"width\\\":300,\\\"top\\\":130,\\\"left\\\":0},{\\\"id\\\":1,\\\"type\\\":\\\"Akustisk gitar\\\",\\\"role\\\":\\\"\\\",\\\"desc\\\":\\\"..\\\",\\\"height\\\":114,\\\"width\\\":300,\\\"top\\\":312,\\\"left\\\":0}],\\\"id\\\":0,\\\"name\\\":\\\"Intro\\\",\\\"rhytm\\\":8},{\\\"instruments\\\":[],\\\"id\\\":1,\\\"name\\\":\\\"ny kolonne\\\",\\\"rhytm\\\":3}]\"}}','2016-03-29 13:48:34','2016-03-29 13:48:34','7aa0620f-b561-4f0b-bb89-099481487981');
/*!40000 ALTER TABLE `craft_entryversions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_fieldgroups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldgroups`
--

LOCK TABLES `craft_fieldgroups` WRITE;
/*!40000 ALTER TABLE `craft_fieldgroups` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_fieldgroups` VALUES (1,'Standard','2014-10-08 10:49:50','2014-10-08 10:49:50','420d3eaa-0708-4cce-8c20-93409caf3560'),(2,'Globals','2014-10-08 11:02:18','2014-10-08 11:02:18','3a55b7a9-f16a-4605-9503-f358d9e3d278'),(3,'Forside','2015-02-18 21:58:20','2015-02-18 21:58:20','cbd7399a-0363-4acc-a01e-4e31a0993f16'),(4,'Jobber','2015-02-18 22:15:47','2015-02-22 15:40:55','d3233036-afe7-4d4a-b024-bc8fe5282bcc'),(5,'Undersider','2015-02-18 22:15:58','2015-02-22 22:12:24','5b4fc8fa-00ca-482e-a464-c1679b691064'),(6,'Kontakt','2015-02-22 22:18:48','2015-02-22 22:18:48','a8ab9151-74a3-4833-a654-37a59c63d4e6'),(7,'Footer','2015-02-23 18:43:43','2015-02-23 18:43:43','0c44060e-364d-4e76-a146-2f8417cfcd52'),(8,'Arranger','2016-03-27 22:56:06','2016-03-27 22:56:06','5b87c9ab-503e-4cef-86c8-5d2d36583158');
/*!40000 ALTER TABLE `craft_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_fieldlayoutfields`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayoutfields_tabId_fk` (`tabId`),
  KEY `craft_fieldlayoutfields_fieldId_fk` (`fieldId`),
  CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayoutfields`
--

LOCK TABLES `craft_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayoutfields` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_fieldlayoutfields` VALUES (8,10,3,4,0,1,'2014-10-08 11:04:52','2014-12-12 08:34:38','166259d8-47b4-4d36-b89f-3e1616e3e73c'),(13,16,8,17,1,1,'2015-02-18 22:21:33','2015-02-18 22:21:33','1a1cd437-9bd3-4cec-b661-6da3b5f800ef'),(77,44,30,31,1,1,'2015-02-22 22:21:40','2015-02-22 22:21:40','f47240ca-b061-471e-b40c-0a7333133e8f'),(78,44,30,32,0,2,'2015-02-22 22:21:40','2015-02-22 22:21:40','d14e24d0-7ab4-4126-b9ed-78162b178cd4'),(79,44,30,33,0,3,'2015-02-22 22:21:40','2015-02-22 22:21:40','6e05f6ba-32be-4f12-8486-295ce24c3f1d'),(80,44,30,34,0,4,'2015-02-22 22:21:40','2015-02-22 22:21:40','32fa393c-b0f5-4b3b-8fd4-cac56e53ea6e'),(110,52,40,37,1,1,'2015-02-22 22:50:59','2015-02-22 22:50:59','2582d572-6172-4a4f-b40d-50a795d8e43c'),(111,53,41,10,0,1,'2015-02-22 22:51:17','2015-02-22 22:51:17','2fe2f39f-a411-489f-8422-f2d1c3d90fdc'),(112,53,41,11,0,2,'2015-02-22 22:51:17','2015-02-22 22:51:17','f474707e-fbac-4cbc-8ed0-072aee1599c9'),(113,53,41,12,0,3,'2015-02-22 22:51:17','2015-02-22 22:51:17','e06c0618-3f59-4f34-b157-884ce52b32e1'),(114,53,41,21,0,4,'2015-02-22 22:51:17','2015-02-22 22:51:17','84c8ac49-aa16-4ef9-b183-05f31ecbd7c4'),(115,53,41,24,0,5,'2015-02-22 22:51:17','2015-02-22 22:51:17','ccf01864-e2e6-469c-a0e2-d6a0267910e2'),(116,53,41,36,0,6,'2015-02-22 22:51:17','2015-02-22 22:51:17','8feed832-df95-4012-9c8e-eb56d8497809'),(117,54,42,39,1,1,'2015-02-23 18:43:25','2015-02-23 18:43:25','7b18d454-5c85-49fe-9ee3-ee8eed04f1c2'),(118,54,42,40,0,2,'2015-02-23 18:43:25','2015-02-23 18:43:25','b195ff4b-ab62-476f-83b2-6a953e72380b'),(125,56,46,27,0,1,'2015-02-23 18:50:41','2015-02-23 18:50:41','796c64bb-9f7c-4f26-b98f-788e973c1e6f'),(126,56,46,25,0,2,'2015-02-23 18:50:41','2015-02-23 18:50:41','bf240fb6-92f1-416c-bfd3-16d5153eef6e'),(127,56,46,26,0,3,'2015-02-23 18:50:41','2015-02-23 18:50:41','665b01f0-f58d-4223-a8e8-ee19b7aee4fe'),(128,56,46,35,0,4,'2015-02-23 18:50:41','2015-02-23 18:50:41','7148f41f-e8be-4825-991c-4c27777e5280'),(140,59,50,42,0,1,'2015-02-23 19:25:48','2015-02-23 19:25:48','04b80e8e-a854-4dbd-9df5-8ac252e0ab34'),(141,59,50,43,0,2,'2015-02-23 19:25:48','2015-02-23 19:25:48','f1b27d3a-489a-4c6e-a9e8-66c6ba460bcb'),(142,59,50,44,0,3,'2015-02-23 19:25:48','2015-02-23 19:25:48','00c64977-bb44-4d90-921b-1fa393f5c643'),(143,59,50,45,0,4,'2015-02-23 19:25:48','2015-02-23 19:25:48','360a8527-87db-4b45-83f1-d63d326d0417'),(162,63,57,10,0,1,'2015-02-23 20:35:58','2015-02-23 20:35:58','b8901339-84bf-4825-9d5b-3f01ef76d431'),(163,63,57,11,0,2,'2015-02-23 20:35:58','2015-02-23 20:35:58','963767b4-588a-45b3-be0a-40f622f53e92'),(164,63,57,28,0,3,'2015-02-23 20:35:58','2015-02-23 20:35:58','e56aefec-73a4-4b84-b7a3-6a8d9c7535de'),(165,63,57,41,0,4,'2015-02-23 20:35:58','2015-02-23 20:35:58','f6065653-e371-49fa-94f5-901f86aa21ff'),(166,63,58,30,0,1,'2015-02-23 20:35:58','2015-02-23 20:35:58','c160b760-6444-4afd-9cf3-3a2423800a5e'),(167,63,58,38,0,2,'2015-02-23 20:35:58','2015-02-23 20:35:58','1839aa59-e970-45c8-8fab-c1ab68198dfa'),(179,66,63,47,1,1,'2015-02-23 20:40:46','2015-02-23 20:40:46','1ecacb22-c408-4948-81c0-e517571df852'),(180,67,64,10,0,1,'2015-02-23 20:41:04','2015-02-23 20:41:04','3cbd1c6f-b8cb-494d-884f-69d29f2fc6ba'),(181,67,64,11,0,2,'2015-02-23 20:41:04','2015-02-23 20:41:04','3d3c8112-d4b0-4638-8a0c-c3a1711c24a7'),(182,67,64,28,0,3,'2015-02-23 20:41:04','2015-02-23 20:41:04','b433c53a-589d-440c-83a6-ccd990c6e107'),(183,67,64,41,0,4,'2015-02-23 20:41:04','2015-02-23 20:41:04','ff94e590-a71d-410e-9d3b-b88adac20246'),(184,67,65,46,0,1,'2015-02-23 20:41:04','2015-02-23 20:41:04','43146d21-9464-41f3-8bc2-d4099c1fe3bd'),(185,67,65,38,0,2,'2015-02-23 20:41:04','2015-02-23 20:41:04','bc676327-69c9-4240-994e-5dcd673ffb1c'),(186,68,66,10,0,1,'2015-02-23 20:41:14','2015-02-23 20:41:14','77e5d70b-c806-4974-8026-4ab23951c63c'),(187,68,66,11,0,2,'2015-02-23 20:41:14','2015-02-23 20:41:14','3f73bc2e-a389-4678-b70b-fb3d6abe353a'),(188,68,66,28,0,3,'2015-02-23 20:41:14','2015-02-23 20:41:14','0fb512d7-28fc-49de-bd53-660a77d4322c'),(189,68,66,41,0,4,'2015-02-23 20:41:14','2015-02-23 20:41:14','fabe0bae-e9a7-448d-a066-628a9929b1a5'),(190,68,67,46,0,1,'2015-02-23 20:41:14','2015-02-23 20:41:14','b284f27b-5e85-459a-a431-f0745bcd737c'),(191,68,67,38,0,2,'2015-02-23 20:41:14','2015-02-23 20:41:14','ba24dba0-d7e6-4e05-bfa8-6d3e1364ea81'),(192,69,68,20,0,1,'2015-02-23 20:45:52','2015-02-23 20:45:52','a6cab6a2-2038-44c1-933f-578cce45f64a'),(193,69,68,22,0,2,'2015-02-23 20:45:52','2015-02-23 20:45:52','710de933-e86e-4c4b-bb71-0fc056dff66e'),(194,71,69,22,0,1,'2015-02-23 20:51:51','2015-02-23 20:51:51','4f5bcb30-fd70-45db-997e-37c0e99e675a'),(195,72,70,10,0,1,'2016-02-19 22:37:46','2016-02-19 22:37:46','7bea3779-7c99-4293-8cd3-2ce813dcd377'),(199,75,72,52,0,1,'2016-03-27 23:03:13','2016-03-27 23:03:13','fb28731a-93f2-441d-9b69-72f972342c1c'),(200,76,73,48,0,1,'2016-03-27 23:03:48','2016-03-27 23:03:48','36d22a6d-ffe3-4d35-a7de-92e8962a22fa'),(201,77,74,49,0,1,'2016-03-27 23:08:02','2016-03-27 23:08:02','1bc10606-e51d-4a77-b082-26b75e6f9ed3'),(202,77,74,50,0,2,'2016-03-27 23:08:02','2016-03-27 23:08:02','774ab111-2bad-48da-9190-3dc7e06a9ba7'),(203,77,74,51,0,3,'2016-03-27 23:08:02','2016-03-27 23:08:02','7f63335a-7fc8-412f-b5d8-b2c5d9a57995');
/*!40000 ALTER TABLE `craft_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_fieldlayouts`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayouts`
--

LOCK TABLES `craft_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouts` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_fieldlayouts` VALUES (1,'Tag','2014-10-08 10:49:50','2014-10-08 10:49:50','735aea8d-1467-42fe-a635-fe07456aef93'),(3,'Entry','2014-10-08 10:49:51','2014-10-08 10:49:51','34c943ee-38b2-46f1-977d-5a69371e7b36'),(5,'Entry','2014-10-08 10:49:51','2014-10-08 10:49:51','abf58a12-09f1-4aa1-a709-7f4b5c553eab'),(10,'GlobalSet','2014-10-08 11:04:52','2014-10-08 11:04:52','8ac14b25-948b-4501-8523-cc671991d12a'),(16,'MatrixBlock','2015-02-18 22:21:33','2015-02-18 22:21:33','72644797-b134-4704-849c-2184265239ac'),(21,'Asset','2015-02-22 15:18:18','2015-02-22 15:18:18','1d0f4096-371f-4650-b41f-7f69bf6d7b8b'),(29,'Asset','2015-02-22 15:42:52','2015-02-22 15:42:52','a154b2e4-36de-4b30-a0b5-9afdae149be6'),(30,'Asset','2015-02-22 15:43:14','2015-02-22 15:43:14','0fc98348-abb4-4056-bfe6-72ad5432d532'),(44,'MatrixBlock','2015-02-22 22:21:40','2015-02-22 22:21:40','02af7956-3f4d-421f-8006-1a9dcb53bd92'),(52,'MatrixBlock','2015-02-22 22:50:59','2015-02-22 22:50:59','f368ff46-c114-4c96-af94-0ffdcbfef5dd'),(53,'Entry','2015-02-22 22:51:17','2015-02-22 22:51:17','23bd9f78-e6a8-49a9-9627-da539779cb75'),(54,'MatrixBlock','2015-02-23 18:43:25','2015-02-23 18:43:25','96a6e4dc-9bf1-43f2-b8fc-d98a9131e02f'),(56,'MatrixBlock','2015-02-23 18:50:41','2015-02-23 18:50:41','54f2288b-f65b-4fc6-80f1-973fe266a161'),(59,'GlobalSet','2015-02-23 19:25:48','2015-02-23 19:25:48','2f94be1c-5cf6-4214-bcaf-a62a22a83ac2'),(63,'Entry','2015-02-23 20:35:58','2015-02-23 20:35:58','fec7ccab-7ae8-47a9-a9a5-71730fcca833'),(66,'MatrixBlock','2015-02-23 20:40:46','2015-02-23 20:40:46','d94a4c46-4de9-42de-bdd1-cee92737bb57'),(67,'Entry','2015-02-23 20:41:04','2015-02-23 20:41:04','2b55102f-d9a9-4e99-abbc-bbf5b742a65f'),(68,'Entry','2015-02-23 20:41:14','2015-02-23 20:41:14','305632b8-7135-48ea-baa0-1f211733c4da'),(69,'Entry','2015-02-23 20:45:52','2015-02-23 20:45:52','aa9cfcb1-fe8e-4ae7-8d1c-c2fa5d22a4e1'),(71,'Entry','2015-02-23 20:51:51','2015-02-23 20:51:51','552f2f36-0bb2-4282-86db-8ba7e91b8535'),(72,'GlobalSet','2016-02-19 22:37:46','2016-02-19 22:37:46','e566d988-eac3-4b46-9fcc-321755ef7ff5'),(75,'Entry','2016-03-27 23:03:13','2016-03-27 23:03:13','a47a0fc1-6dcf-41f5-843c-ecef98ca507d'),(76,'GlobalSet','2016-03-27 23:03:48','2016-03-27 23:03:48','63be6ac0-eed2-4a6c-958e-4c25c25d46ea'),(77,'MatrixBlock','2016-03-27 23:08:02','2016-03-27 23:08:02','801e9f76-2e9a-4c67-ae7e-589b183b8035');
/*!40000 ALTER TABLE `craft_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_fieldlayouttabs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayouttabs_layoutId_fk` (`layoutId`),
  CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayouttabs`
--

LOCK TABLES `craft_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouttabs` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_fieldlayouttabs` VALUES (1,3,'Innhold',1,'2014-10-08 10:49:51','2014-10-08 10:49:51','d35bab09-a914-4602-91df-0a3c3baa2cfc'),(2,5,'Innhold',1,'2014-10-08 10:49:51','2014-10-08 10:49:51','c39b036d-dd74-43ad-b5f0-cc0dfbd18b00'),(3,10,'Content',1,'2014-12-12 08:34:38','2014-12-12 08:34:38','a4b128b1-179a-4d4a-bad1-951114ec7fec'),(4,1,'Content',1,'2014-12-12 08:34:38','2014-12-12 08:34:38','075c4aae-210e-47b1-b49d-741e200c9155'),(8,16,'Content',1,'2015-02-18 22:21:33','2015-02-18 22:21:33','783c683a-872f-4f02-bd14-3d7968ef5783'),(30,44,'Content',1,'2015-02-22 22:21:40','2015-02-22 22:21:40','9444f0c7-13af-4085-8ae3-5033758b49c8'),(40,52,'Content',1,'2015-02-22 22:50:59','2015-02-22 22:50:59','1d20ec32-db85-4bbe-992d-de851990c58b'),(41,53,'Forside',1,'2015-02-22 22:51:17','2015-02-22 22:51:17','a7be87dc-6917-457d-87c6-5c8b8394bbba'),(42,54,'Content',1,'2015-02-23 18:43:25','2015-02-23 18:43:25','dd0a2e18-629d-416e-8705-73bf60d8c335'),(46,56,'Content',1,'2015-02-23 18:50:41','2015-02-23 18:50:41','5e3540ae-4c73-4259-8dd7-62d92b594237'),(50,59,'Innhold',1,'2015-02-23 19:25:48','2015-02-23 19:25:48','e4fe4116-25ef-4991-844f-f072048bc2fd'),(57,63,'Hovedlayout',1,'2015-02-23 20:35:58','2015-02-23 20:35:58','9ea5c8e4-615d-44ce-8b24-81a069589104'),(58,63,'Høyre side',2,'2015-02-23 20:35:58','2015-02-23 20:35:58','ade2f16f-6972-494c-b25d-c867668dd28d'),(63,66,'Content',1,'2015-02-23 20:40:46','2015-02-23 20:40:46','9acf8f30-4631-4872-974f-82b9f333ad1c'),(64,67,'Hovedlayout',1,'2015-02-23 20:41:04','2015-02-23 20:41:04','da50d601-2b6f-46c4-a8b7-2759a72881bb'),(65,67,'Høyre side',2,'2015-02-23 20:41:04','2015-02-23 20:41:04','376753d7-b8c0-49f7-a248-afa0f75d413c'),(66,68,'Hovedlayout',1,'2015-02-23 20:41:14','2015-02-23 20:41:14','f7e8f709-a19b-48e1-94a1-408e3d434f2d'),(67,68,'Høyre side',2,'2015-02-23 20:41:14','2015-02-23 20:41:14','f220d31c-0fb6-4b6c-80dc-a0e25bd99e8b'),(68,69,'Arbeid',1,'2015-02-23 20:45:52','2015-02-23 20:45:52','1978f952-427c-4017-a118-8915e9484701'),(69,71,'Tab 1',1,'2015-02-23 20:51:51','2015-02-23 20:51:51','45920cfb-3ad3-41b0-9a81-0efc7e45acd2'),(70,72,'Innhold',1,'2016-02-19 22:37:46','2016-02-19 22:37:46','a66b0d98-726e-4251-b48e-2d4876c4914b'),(72,75,'Sang',1,'2016-03-27 23:03:13','2016-03-27 23:03:13','6cf187ce-94f4-4c43-98db-17d5ed9ba54f'),(73,76,'Innhold',1,'2016-03-27 23:03:48','2016-03-27 23:03:48','1f161d71-65df-4542-8f19-ccd2cc51b6ad'),(74,77,'Content',1,'2016-03-27 23:08:02','2016-03-27 23:08:02','58c4673f-9225-4e6e-93c6-5ccee6490430');
/*!40000 ALTER TABLE `craft_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_fields`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(58) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci,
  `translatable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `craft_fields_context_idx` (`context`),
  KEY `craft_fields_groupId_fk` (`groupId`),
  CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fields`
--

LOCK TABLES `craft_fields` WRITE;
/*!40000 ALTER TABLE `craft_fields` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_fields` VALUES (4,2,'Google Analytics-kode','googleAnalyticsKode','global','Fyll inn bare tallrekken (UA-<b>XXXXX-X</b>)',0,'PlainText','{\"placeholder\":\"123456-1\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2014-10-08 11:03:18','2014-10-08 11:03:18','1c2307c6-d836-4aca-9fa1-283dc797f5cd'),(10,3,'Toppbilde','toppbilde','global','Bildet øverst på toppen',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"limit\":\"1\"}','2015-02-18 22:12:03','2015-02-18 22:15:15','e80929cf-d5ac-4ffe-8370-30fd5e873103'),(11,3,'Tittel','tittel','global','Payoff',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-02-18 22:12:50','2015-02-18 22:12:50','79026409-7aba-47a6-bec1-96e6eeb5bddb'),(12,3,'Undertittel','undertittel','global','Undertittel',0,'RichText','{\"configFile\":\"Simple.json\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"\",\"columnType\":\"text\"}','2015-02-18 22:13:44','2015-02-22 21:13:32','d068d238-d260-46ec-b7bf-985e10870f30'),(17,NULL,'Logo','logo','matrixBlockType:4','Logoen',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"limit\":\"1\"}','2015-02-18 22:21:33','2015-02-18 22:21:33','b13624fd-5576-49ba-8a7a-27b2eb705c38'),(20,4,'Video','video','global','Video-link (vimeo, youtube etc)',0,'Embedder',NULL,'2015-02-22 15:33:20','2015-02-22 15:40:14','d3ade87f-d2e1-4933-83ac-86cc2da374ba'),(21,3,'Utvalgte jobber','utvalgteJobber','global','',0,'Entries','{\"sources\":[\"section:3\"],\"limit\":\"\"}','2015-02-22 15:38:23','2015-02-22 15:38:23','27ddb2a4-9f68-4d1b-b20a-4163af9d7687'),(22,4,'Tekst','tekstRen','global','Enkel tekst som beskrivelse',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-02-22 15:40:05','2015-02-23 19:01:20','ce670e83-3b2c-4893-864a-b19cce8d2a20'),(24,3,'Hva vi er gode på','tjenester','global','',0,'Matrix','{\"maxBlocks\":\"2\"}','2015-02-22 15:48:32','2015-02-23 18:50:41','2d38036d-0fe2-458b-a375-bebd58c8917b'),(25,NULL,'Tittel','tittel','matrixBlockType:1','Tittel på venstre blokk',0,'RichText','{\"configFile\":\"Simple.json\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"\",\"columnType\":\"text\"}','2015-02-22 15:48:32','2015-02-23 18:50:41','67fdb86f-7e75-4e02-add2-435d7fd115b3'),(26,NULL,'Tekst','tekst','matrixBlockType:1','',0,'RichText','{\"configFile\":\"Simple.json\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"\",\"columnType\":\"text\"}','2015-02-22 15:48:32','2015-02-23 18:50:41','86e497ba-c110-4e1f-aa0a-11edc50b2c67'),(27,NULL,'Bilde','bilde','matrixBlockType:1','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"limit\":\"1\"}','2015-02-22 15:48:32','2015-02-23 18:50:41','e7f80d4a-0e92-418e-b962-af929a9928b5'),(28,5,'Ingress','ingress','global','Ingress',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-02-22 22:12:40','2015-02-23 19:05:00','79a25b1e-28a9-4d2c-afff-b7a69db41624'),(30,6,'Ansatte','ansatte','global','Hver ansatt',0,'Matrix','{\"maxBlocks\":null}','2015-02-22 22:19:53','2015-02-22 22:21:40','f404d2fb-f5ac-4738-90a8-966a73b61710'),(31,NULL,'Navn','navn','matrixBlockType:2','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-02-22 22:19:53','2015-02-22 22:21:40','a0081450-10e7-4067-8ed7-c9b2b99c3a7d'),(32,NULL,'Stilling','stilling','matrixBlockType:2','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-02-22 22:19:53','2015-02-22 22:21:40','b2214d6d-d8e9-4205-a5c7-b92314bc4468'),(33,NULL,'Telefonnummer','telefonnummer','matrixBlockType:2','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-02-22 22:19:53','2015-02-22 22:21:40','a3b36374-01d6-48b7-937f-f1ca077a1937'),(34,NULL,'Mailadresse','mailadresse','matrixBlockType:2','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-02-22 22:19:53','2015-02-22 22:21:40','53204a97-3332-46ca-96a9-ccd5e33ba9f7'),(35,NULL,'Link','sidelink','matrixBlockType:1','Link til siden',0,'Entries','{\"sources\":[\"singles\"],\"limit\":\"1\"}','2015-02-22 22:45:51','2015-02-23 18:50:41','cffe81b7-781e-417d-99c7-9896188f7eee'),(36,3,'Samarbeidspartnere','samarbeidspartnere','global','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":[\"folder:1\"],\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"limit\":\"\"}','2015-02-22 22:50:59','2015-02-22 22:52:00','cd0cdbf1-8363-42e9-92af-20426369260b'),(37,NULL,'Logo','logo','matrixBlockType:3','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":[\"folder:1\"],\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"limit\":\"1\"}','2015-02-22 22:50:59','2015-02-22 22:50:59','282e9899-f27f-4feb-b8d6-ee0d46a063d7'),(38,6,'Bilder','bilder','global','Bilder og bildetekst',0,'Matrix','{\"maxBlocks\":null}','2015-02-23 18:43:25','2015-02-23 18:43:25','1c88a031-0d56-4470-a5ab-e3d12d9fbf5e'),(39,NULL,'Bilde','bilde','matrixBlockType:4','Bilde med bildetekst',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":[\"folder:1\"],\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"limit\":\"1\"}','2015-02-23 18:43:25','2015-02-23 18:43:25','cd5f731d-1015-40f7-9dd4-36dd4fd0a108'),(40,NULL,'Bildetekst','bildetekst','matrixBlockType:4','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-02-23 18:43:25','2015-02-23 18:43:25','1b512460-0454-4568-8231-946535fb57d2'),(41,5,'Tekstinnhold','tekstRik','global','Tekstinnhold',0,'RichText','{\"configFile\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"\",\"columnType\":\"text\"}','2015-02-23 19:06:02','2015-02-23 19:06:02','d025c945-f04d-4681-8d0c-84ef6520477f'),(42,2,'Adresse','adresse','global','Adresse',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-02-23 19:20:47','2015-02-23 19:20:47','81529827-21cd-4103-94cc-c1ebda8f165a'),(43,2,'Kontakt','kontakt','global','Kontaktinfoen',0,'RichText','{\"configFile\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"\",\"columnType\":\"text\"}','2015-02-23 19:21:35','2015-02-23 19:21:35','52e4be7e-f984-4165-aadb-6207f833fda9'),(44,2,'Facebook','facebook','global','Link til Facebook-side',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-02-23 19:21:51','2015-02-23 19:21:51','9ed4a7e2-4f7c-4393-bce4-7841c526ef75'),(45,2,'Vimeo','vimeo','global','Link til Vimeo-side',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-02-23 19:22:02','2015-02-23 19:22:02','ee66e139-7add-4a46-b94b-06407f95b24d'),(46,5,'Liste','liste','global','Liste i høyre blokk',0,'Matrix','{\"maxBlocks\":null}','2015-02-23 20:40:46','2015-02-23 20:40:46','1b3b33b9-507c-48fb-b592-7a9950dd3ceb'),(47,NULL,'Tittel','tittel','matrixBlockType:5','Hva som står',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-02-23 20:40:46','2015-02-23 20:40:46','8181ee56-d7a9-4536-9cea-1035476a364b'),(48,8,'Instrumenter','instrumenter','global','',0,'Matrix','{\"maxBlocks\":null}','2016-03-27 22:58:18','2016-03-27 23:08:02','d8bc6aa6-1cc6-4369-b053-ddecd2c32915'),(49,NULL,'Navn','navn','matrixBlockType:6','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2016-03-27 22:58:18','2016-03-27 23:08:02','8ba9e99d-0b07-43e2-9371-b47c5f53fae9'),(50,NULL,'Farge','farge','matrixBlockType:6','',0,'Spectrum_ColorPicker','{\"allowEmpty\":\"\",\"showInput\":\"\",\"showAlpha\":\"\",\"showPalette\":\"1\",\"showPaletteOnly\":\"\",\"preferredFormat\":\"\",\"palette\":[{\"color\":\"#e45f56\"},{\"color\":\"#a3d39c\"},{\"color\":\"#7accc8\"},{\"color\":\"#4a79aa\"},{\"color\":\"#eadb79\"},{\"color\":\"#e1e3a5\"},{\"color\":\"#cabaa5\"}]}','2016-03-27 22:58:18','2016-03-27 23:08:02','ac35bc4b-e6a8-4555-98e1-c925c4db0208'),(51,NULL,'Svg','svg','matrixBlockType:6','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":[\"folder:1\"],\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"limit\":\"1\",\"viewMode\":\"list\",\"selectionLabel\":\"\"}','2016-03-27 22:58:18','2016-03-27 23:08:02','49511bce-452d-4826-a3e4-35b7df96c4d6'),(52,8,'JSON','json','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2016-03-27 22:59:28','2016-03-27 22:59:28','28361ed5-3fb1-46ac-95c5-0026e36de892');
/*!40000 ALTER TABLE `craft_fields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_globalsets`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_globalsets_name_unq_idx` (`name`),
  UNIQUE KEY `craft_globalsets_handle_unq_idx` (`handle`),
  KEY `craft_globalsets_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_globalsets`
--

LOCK TABLES `craft_globalsets` WRITE;
/*!40000 ALTER TABLE `craft_globalsets` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_globalsets` VALUES (4,'Nøkkelverdier','globals',10,'2014-10-08 11:01:50','2014-10-08 11:04:52','aeec171a-082c-40f2-ae5a-5276b6fbdabb'),(34,'Footer','footer',59,'2015-02-23 19:23:13','2015-02-23 19:25:48','4da3e3fb-b10d-4c13-b32d-06513ceb5aa6'),(42,'header','header',72,'2016-02-19 22:37:46','2016-02-19 22:37:46','535c5b5b-4fa7-4ae8-abcf-25fc55f27678'),(48,'Arranger','arranger',76,'2016-03-27 23:03:48','2016-03-27 23:03:48','8af7517c-80ea-43c5-9b56-f15b601eec51');
/*!40000 ALTER TABLE `craft_globalsets` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `build` int(11) unsigned NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `releaseDate` datetime NOT NULL,
  `edition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `siteUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `track` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_info`
--

LOCK TABLES `craft_info` WRITE;
/*!40000 ALTER TABLE `craft_info` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_info` VALUES (1,'2.5',2762,'2.5.11','2016-02-10 00:31:50',0,'Støy Lydstudio','{siteUrl}','Europe/Oslo',1,0,'stable','2014-10-08 10:49:45','2016-02-16 01:20:25','ce6e6378-3719-45f4-88b1-640f0e5e22c4');
/*!40000 ALTER TABLE `craft_info` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_locales`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_locales` (
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`locale`),
  KEY `craft_locales_sortOrder_idx` (`sortOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_locales`
--

LOCK TABLES `craft_locales` WRITE;
/*!40000 ALTER TABLE `craft_locales` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_locales` VALUES ('nb_no',1,'2014-10-08 10:49:46','2014-10-08 10:49:46','60083433-3d9f-4116-8d2d-1c91c6e178bc');
/*!40000 ALTER TABLE `craft_locales` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_matrixblocks`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_matrixblocks_ownerId_idx` (`ownerId`),
  KEY `craft_matrixblocks_fieldId_idx` (`fieldId`),
  KEY `craft_matrixblocks_typeId_idx` (`typeId`),
  KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`),
  KEY `craft_matrixblocks_ownerLocale_fk` (`ownerLocale`),
  CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixblocks`
--

LOCK TABLES `craft_matrixblocks` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocks` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_matrixblocks` VALUES (20,5,24,1,1,NULL,'2015-02-22 15:51:58','2016-02-22 07:24:47','b5fba5a2-4780-4cde-90f8-44d5b9a64ad8'),(21,5,24,1,2,NULL,'2015-02-22 15:51:58','2016-02-22 07:24:47','221d8cb4-a907-44bd-9d90-8b3267bf4ec4'),(30,6,30,2,1,NULL,'2015-02-23 18:38:31','2016-02-19 22:47:38','c4c74d21-2206-475e-a59e-7248723208b5'),(31,6,30,2,2,NULL,'2015-02-23 18:38:31','2016-02-19 22:47:38','72738e22-1269-4b8e-ac9c-733322b62825'),(32,6,30,2,3,NULL,'2015-02-23 18:38:31','2016-02-19 22:47:38','4c76b343-92ea-4e57-855c-bc646358c4a3'),(33,6,38,4,1,NULL,'2015-02-23 18:46:33','2016-02-19 22:47:38','08fe8148-8094-4156-8d6c-0254cdf4d73f'),(35,23,38,4,1,NULL,'2015-02-23 20:15:15','2015-02-23 20:35:34','ac2a749f-4e08-4d15-97c9-6c9595800204'),(36,24,38,4,1,NULL,'2015-02-23 20:39:11','2015-02-23 20:42:44','e83e42d2-4dbb-4103-a966-90b08c036532'),(37,24,46,5,1,NULL,'2015-02-23 20:42:44','2015-02-23 20:42:44','9725ee74-f4e6-4ba6-b839-d576d4484641'),(38,24,46,5,2,NULL,'2015-02-23 20:42:44','2015-02-23 20:42:44','07ee979c-6073-4af6-b2e8-59dbf256f051'),(39,24,46,5,3,NULL,'2015-02-23 20:42:44','2015-02-23 20:42:44','4253d139-2f5c-4175-bb43-49f82841ef00'),(49,48,48,6,1,NULL,'2016-03-27 23:04:06','2016-03-27 23:18:28','ac12789e-7619-4c9d-8be7-a6600beb55d7');
/*!40000 ALTER TABLE `craft_matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_matrixblocktypes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `craft_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `craft_matrixblocktypes_fieldId_fk` (`fieldId`),
  KEY `craft_matrixblocktypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixblocktypes`
--

LOCK TABLES `craft_matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocktypes` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_matrixblocktypes` VALUES (1,24,56,'Blokk','blokk',1,'2015-02-22 15:48:32','2015-02-23 18:50:41','987d69cb-904a-42d9-a43c-c5eb195d7c50'),(2,30,44,'person','person',1,'2015-02-22 22:19:53','2015-02-22 22:21:40','c65a8dc9-22ee-4e44-81c2-dd731ccef300'),(3,36,52,'Blokk','blokk',1,'2015-02-22 22:50:59','2015-02-22 22:50:59','be701080-54b6-4b25-99c6-edcbea911202'),(4,38,54,'Blokk','blokk',1,'2015-02-23 18:43:25','2015-02-23 18:43:25','116ab69c-6b08-4c2e-ad98-b90357051108'),(5,46,66,'Element','blokk',1,'2015-02-23 20:40:46','2015-02-23 20:40:46','928eeb51-6718-4a13-9b09-10a19d2b71ab'),(6,48,77,'Instrument','instrument',1,'2016-03-27 22:58:18','2016-03-27 23:08:02','4f912a34-ec68-43c1-a809-d72e93e76101');
/*!40000 ALTER TABLE `craft_matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_matrixcontent_ansatte`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixcontent_ansatte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_person_navn` text COLLATE utf8_unicode_ci,
  `field_person_stilling` text COLLATE utf8_unicode_ci,
  `field_person_telefonnummer` text COLLATE utf8_unicode_ci,
  `field_person_mailadresse` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_ansatte_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_ansatte_locale_idx` (`locale`),
  CONSTRAINT `craft_matrixcontent_ansatte_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_ansatte_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixcontent_ansatte`
--

LOCK TABLES `craft_matrixcontent_ansatte` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_ansatte` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_matrixcontent_ansatte` VALUES (1,30,'nb_no','David Thyge Nielsen','Daglig leder','985 45 553','david@stoey.no','2015-02-23 18:38:31','2016-02-19 22:47:38','c03fb5fb-b77b-4d1e-a811-b2a341d8c454'),(2,31,'nb_no','Thomas Gregussen','Musikkprodusent og komponist','985 45 553','thomas@stoey.no','2015-02-23 18:38:31','2016-02-19 22:47:38','3e0ec325-2503-430c-8b4d-33d120002a94'),(3,32,'nb_no','Kjell Thomas Mathisen','Lyddesigner og foleyartist','985 45 553','kjellthomas@stoey.no','2015-02-23 18:38:31','2016-02-19 22:47:38','819ca340-3b78-4aea-9a56-c6ccac2f7310');
/*!40000 ALTER TABLE `craft_matrixcontent_ansatte` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_matrixcontent_bilder`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixcontent_bilder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_blokk_bildetekst` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_bilder_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_bilder_locale_fk` (`locale`),
  CONSTRAINT `craft_matrixcontent_bilder_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_bilder_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixcontent_bilder`
--

LOCK TABLES `craft_matrixcontent_bilder` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_bilder` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_matrixcontent_bilder` VALUES (1,33,'nb_no','Her er tekst','2015-02-23 18:46:33','2016-02-19 22:47:38','c215a2c3-10ec-4e6b-a46f-b6bca01c214f'),(2,35,'nb_no','Fint bilde ja?','2015-02-23 20:15:15','2015-02-23 20:35:34','a57d9d4b-ec1c-4406-be07-f8922026410f'),(3,36,'nb_no','Blablabla','2015-02-23 20:39:11','2015-02-23 20:42:44','98ededa8-22ef-41a6-956c-0adfa321df32');
/*!40000 ALTER TABLE `craft_matrixcontent_bilder` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_matrixcontent_instrumenter`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixcontent_instrumenter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_instrument_navn` text COLLATE utf8_unicode_ci,
  `field_instrument_farge` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_instrumenter_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_instrumenter_locale_fk` (`locale`),
  CONSTRAINT `craft_matrixcontent_instrumenter_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_instrumenter_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixcontent_instrumenter`
--

LOCK TABLES `craft_matrixcontent_instrumenter` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_instrumenter` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_matrixcontent_instrumenter` VALUES (1,49,'nb_no','Akustisk gitar','rgb(228, 95, 86)','2016-03-27 23:04:06','2016-03-27 23:18:28','f072a0be-89e9-49e0-b556-db2a9b171446');
/*!40000 ALTER TABLE `craft_matrixcontent_instrumenter` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_matrixcontent_liste`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixcontent_liste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_blokk_tittel` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_liste_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_liste_locale_fk` (`locale`),
  CONSTRAINT `craft_matrixcontent_liste_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_liste_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixcontent_liste`
--

LOCK TABLES `craft_matrixcontent_liste` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_liste` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_matrixcontent_liste` VALUES (1,37,'nb_no','Mikrofon','2015-02-23 20:42:44','2015-02-23 20:42:44','bf3cfdd5-73e7-4b2b-ae93-22995df33341'),(2,38,'nb_no','Annen ting','2015-02-23 20:42:44','2015-02-23 20:42:44','453f2c85-8670-431d-97ed-82f4748819e0'),(3,39,'nb_no','Blabla','2015-02-23 20:42:44','2015-02-23 20:42:44','1ee8bb4e-beb7-4660-b0ea-5105f3544d3e');
/*!40000 ALTER TABLE `craft_matrixcontent_liste` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_matrixcontent_samarbeidspartnere`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixcontent_samarbeidspartnere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_samarbeidspartnere_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_samarbeidspartnere_locale_fk` (`locale`),
  CONSTRAINT `craft_matrixcontent_samarbeidspartnere_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_samarbeidspartnere_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixcontent_samarbeidspartnere`
--

LOCK TABLES `craft_matrixcontent_samarbeidspartnere` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_samarbeidspartnere` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_matrixcontent_samarbeidspartnere` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_matrixcontent_tjenester`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixcontent_tjenester` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_blokk_tittel` text COLLATE utf8_unicode_ci,
  `field_blokk_tekst` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_tjenester_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_tjenester_locale_fk` (`locale`),
  CONSTRAINT `craft_matrixcontent_tjenester_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_tjenester_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixcontent_tjenester`
--

LOCK TABLES `craft_matrixcontent_tjenester` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_tjenester` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_matrixcontent_tjenester` VALUES (1,20,'nb_no','<p>Postproduksjon og <strong>Lyddesign</strong></p>','<p>Kreativt lyddesign som gir liv til bildene.<br>Med midt-norges eneste dedikerte foley-rom utstyrt med egen pit, kan vi levere foley og lyddesign til alle typer produksjoner.</p>','2015-02-22 15:51:58','2016-02-22 07:24:47','e84d1fac-73d2-4832-bcb2-338ba502e86d'),(2,21,'nb_no','<p>Studio og <strong>musikkproduksjon</strong></p>','<p>Ingenting fremkaller mer følelser enn musikk. Derfor bruker vi musikken for det den er verdt, sømløst med en god historie og god produksjon. Sluttproduktet er musikk som virkelig fremhever øyeblikket. </p>','2015-02-22 15:51:58','2016-02-22 07:24:47','7ebc2e35-674e-47c3-b0c1-523bf522220d');
/*!40000 ALTER TABLE `craft_matrixcontent_tjenester` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_migrations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_migrations_version_unq_idx` (`version`),
  KEY `craft_migrations_pluginId_fk` (`pluginId`),
  CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_migrations`
--

LOCK TABLES `craft_migrations` WRITE;
/*!40000 ALTER TABLE `craft_migrations` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_migrations` VALUES (1,NULL,'m000000_000000_base','2014-10-08 10:49:46','2014-10-08 10:49:46','2014-10-08 10:49:46','42d71bf0-6913-4eaa-9e38-d36bea1be5a8'),(2,NULL,'m140730_000001_add_filename_and_format_to_transformindex','2014-10-08 10:49:46','2014-10-08 10:49:46','2014-10-08 10:49:46','b3815782-326e-42bd-aab2-b7df98a331cc'),(3,NULL,'m140815_000001_add_format_to_transforms','2014-10-08 10:49:46','2014-10-08 10:49:46','2014-10-08 10:49:46','d16c46c4-1e70-4db1-a35b-369052650590'),(4,NULL,'m140822_000001_allow_more_than_128_items_per_field','2014-10-08 10:49:46','2014-10-08 10:49:46','2014-10-08 10:49:46','cfc81698-5ad6-4774-b348-8b83b7cb8f1e'),(5,NULL,'m140829_000001_single_title_formats','2014-10-08 10:49:46','2014-10-08 10:49:46','2014-10-08 10:49:46','198b1671-c688-4a74-9897-0211fddd2566'),(6,NULL,'m140831_000001_extended_cache_keys','2014-10-08 10:49:46','2014-10-08 10:49:46','2014-10-08 10:49:46','2d510d43-bb61-470e-a8ab-55672d6738ab'),(7,NULL,'m140922_000001_delete_orphaned_matrix_blocks','2014-10-08 10:49:46','2014-10-08 10:49:46','2014-10-08 10:49:46','399632eb-8668-43a1-a28d-2e933310cb4f'),(8,2,'m140713_000000_minimee_ChangeTagToReturnSettingsFieldNames','2014-10-08 10:53:02','2014-10-08 10:53:02','2014-10-08 10:53:02','820367ec-f841-4fda-9c02-6fc1f42afbf3'),(9,NULL,'m141008_000001_elements_index_tune','2014-12-12 08:34:38','2014-12-12 08:34:38','2014-12-12 08:34:38','1c96e5aa-cb60-4c43-bd6a-c0bd38773675'),(10,NULL,'m141009_000001_assets_source_handle','2014-12-12 08:34:38','2014-12-12 08:34:38','2014-12-12 08:34:38','ee995679-dce6-4bb5-814a-ef4eb48d9e5c'),(11,NULL,'m141024_000001_field_layout_tabs','2014-12-12 08:34:39','2014-12-12 08:34:39','2014-12-12 08:34:39','22887b9a-b1dc-456a-b5e3-14b8f6724926'),(12,NULL,'m141030_000001_drop_structure_move_permission','2014-12-12 08:34:39','2014-12-12 08:34:39','2014-12-12 08:34:39','10e7e46a-612f-43a8-b243-170934f67e38'),(13,NULL,'m141103_000001_tag_titles','2014-12-12 08:34:39','2014-12-12 08:34:39','2014-12-12 08:34:39','0ddd1195-7ac4-4f43-a185-e2a45012e324'),(14,NULL,'m141109_000001_user_status_shuffle','2014-12-12 08:34:40','2014-12-12 08:34:40','2014-12-12 08:34:40','8f737b06-2ba4-42bf-81d4-e06786ff9fa6'),(15,NULL,'m141126_000001_user_week_start_day','2014-12-12 08:34:40','2014-12-12 08:34:40','2014-12-12 08:34:40','f08d4d0a-045b-422f-b5ce-6a5976363598'),(16,NULL,'m150210_000001_adjust_user_photo_size','2015-02-18 21:53:05','2015-02-18 21:53:05','2015-02-18 21:53:05','8b58d7b4-eca2-41f8-ad2f-97321f6ebb46'),(17,4,'m140516_000000_cpCss_changeSettingsFieldName','2015-02-23 18:49:50','2015-02-23 18:49:50','2015-02-23 18:49:50','18bd58d6-0a1e-4245-b209-d04775413157'),(18,NULL,'m141030_000000_plugin_schema_versions','2016-02-16 01:20:24','2016-02-16 01:20:24','2016-02-16 01:20:24','345a81bf-1e74-475d-8735-1af648d1f1b6'),(19,NULL,'m150724_000001_adjust_quality_settings','2016-02-16 01:20:24','2016-02-16 01:20:24','2016-02-16 01:20:24','7ac642a8-0b09-4437-b0df-3eb7b88eeddd'),(20,NULL,'m150827_000000_element_index_settings','2016-02-16 01:20:24','2016-02-16 01:20:24','2016-02-16 01:20:24','e9e15be8-067c-4ce9-8eec-7e52257a40ab'),(21,NULL,'m150918_000001_add_colspan_to_widgets','2016-02-16 01:20:24','2016-02-16 01:20:24','2016-02-16 01:20:24','6fa1938c-9191-4e2c-8b20-24b7190d5a62'),(22,NULL,'m151007_000000_clear_asset_caches','2016-02-16 01:20:24','2016-02-16 01:20:24','2016-02-16 01:20:24','2b993f29-c282-4f95-8fe4-9c78066231a7'),(23,NULL,'m151109_000000_text_url_formats','2016-02-16 01:20:24','2016-02-16 01:20:24','2016-02-16 01:20:24','20116e9a-1e42-45ac-a96a-2a2a0d31be4d'),(24,NULL,'m151110_000000_move_logo','2016-02-16 01:20:24','2016-02-16 01:20:24','2016-02-16 01:20:24','356ebcc4-aee7-49fa-912e-40d492314fe9'),(25,NULL,'m151117_000000_adjust_image_widthheight','2016-02-16 01:20:24','2016-02-16 01:20:24','2016-02-16 01:20:24','5ead40da-9ed5-4ecc-8501-bc6a0cc0fad4'),(26,NULL,'m151127_000000_clear_license_key_status','2016-02-16 01:20:24','2016-02-16 01:20:24','2016-02-16 01:20:24','95f07780-a893-46be-9fcb-65b473a56f72'),(27,NULL,'m151127_000000_plugin_license_keys','2016-02-16 01:20:25','2016-02-16 01:20:25','2016-02-16 01:20:25','5a48e25e-4ed1-41a2-8a39-5d472c6e5aed'),(28,NULL,'m151130_000000_update_pt_widget_feeds','2016-02-16 01:20:25','2016-02-16 01:20:25','2016-02-16 01:20:25','c056c147-7ee0-4219-bd59-7e3c069116c3'),(29,7,'m150212_145000_AmNav_renamePagesToNodes','2016-02-16 01:25:06','2016-02-16 01:25:06','2016-02-16 01:25:06','2195b7d0-e3a0-41b2-8b76-8fba7689a445'),(30,7,'m150217_112800_AmNav_expandPageData','2016-02-16 01:25:06','2016-02-16 01:25:06','2016-02-16 01:25:06','9323dc31-080f-4e23-a88b-d70c2f32a5bd'),(31,7,'m150403_093000_AmNav_nodesWithElements','2016-02-16 01:25:06','2016-02-16 01:25:06','2016-02-16 01:25:06','f9da607c-4c9e-43c8-9712-fd53d334a2e8'),(32,7,'m150512_105600_AmNav_addOptionalClass','2016-02-16 01:25:06','2016-02-16 01:25:06','2016-02-16 01:25:06','0d862153-bfd1-4897-8823-58b9f5e61345'),(33,13,'m150314_144609_cpNav_addUrlSupport','2016-02-16 01:32:25','2016-02-16 01:32:25','2016-02-16 01:32:25','ab1decbb-a51a-4e49-8dde-f4e1b6b62288'),(34,13,'m150314_144610_cpNav_addPrevUrlSupport','2016-02-16 01:32:25','2016-02-16 01:32:25','2016-02-16 01:32:25','80a6eb93-2e85-4b16-b910-de95fd587888'),(35,13,'m150314_144611_cpNav_addManualNavItemSupport','2016-02-16 01:32:25','2016-02-16 01:32:25','2016-02-16 01:32:25','5cbda4c7-4db9-402d-9fa8-f700a5e7baea'),(36,13,'m150314_144615_cpNav_layouts','2016-02-16 01:32:25','2016-02-16 01:32:25','2016-02-16 01:32:25','6fd1e85b-9109-46db-8fcf-0191e40d5992'),(37,13,'m150321_144616_cpNav_newWindow','2016-02-16 01:32:25','2016-02-16 01:32:25','2016-02-16 01:32:25','b64116d3-d4c1-433f-90e8-4d73537ec216'),(38,13,'m151126_144611_cpNav_addIconSupport','2016-02-16 01:32:25','2016-02-16 01:32:25','2016-02-16 01:32:25','40bf4d87-39d9-4236-9253-55ac9abe89ce'),(39,13,'m151224_144611_cpNav_populateIcons','2016-02-16 01:32:25','2016-02-16 01:32:25','2016-02-16 01:32:25','ea4f131b-4cb7-4882-8f97-71098228726d'),(40,20,'m160117_000000_reasons_addFieldLayoutIdColumn','2016-02-16 01:33:27','2016-02-16 01:33:27','2016-02-16 01:33:27','c8f762f3-f145-4d3c-8869-af655441d933'),(41,21,'m151225_000000_seomatic_addHumansField','2016-02-16 01:33:42','2016-02-16 01:33:42','2016-02-16 01:33:42','07648b18-d1f1-4848-a0d8-d73c025f95b0'),(42,21,'m151226_000000_seomatic_addTwitterFacebookFields','2016-02-16 01:33:42','2016-02-16 01:33:42','2016-02-16 01:33:42','4eae9323-059b-4a4d-8880-da95e6eea889'),(43,21,'m160101_000000_seomatic_addRobotsFields','2016-02-16 01:33:42','2016-02-16 01:33:42','2016-02-16 01:33:42','7e40291a-8240-476b-aabf-d96d7a23df93'),(44,21,'m160111_000000_seomatic_addTitleFields','2016-02-16 01:33:42','2016-02-16 01:33:42','2016-02-16 01:33:42','f69269c6-16b2-4f0b-bc6b-a4a2f9721180'),(45,21,'m160122_000000_seomatic_addTypeFields','2016-02-16 01:33:42','2016-02-16 01:33:42','2016-02-16 01:33:42','e2f3bd5d-ff91-4ff1-b21f-4f8d7105c988'),(46,21,'m160123_000000_seomatic_addOpeningHours','2016-02-16 01:33:42','2016-02-16 01:33:42','2016-02-16 01:33:42','e00e03e8-942b-4da3-9e5d-d285d1cef239'),(47,21,'m160202_000000_seomatic_addSocialHandles','2016-02-16 01:33:42','2016-02-16 01:33:42','2016-02-16 01:33:42','287b6c76-41e2-4742-a0f4-6914cc166908'),(48,21,'m160204_000000_seomatic_addGoogleAnalytics','2016-02-16 01:33:42','2016-02-16 01:33:42','2016-02-16 01:33:42','a13c04dc-3c72-4724-8017-082ee04ddeed'),(49,21,'m160205_000000_seomatic_addResturantMenu','2016-02-16 01:33:42','2016-02-16 01:33:42','2016-02-16 01:33:42','15313239-f72f-41a6-b792-71b595e03c3d'),(50,21,'m160206_000000_seomatic_addGoogleAnalyticsPlugins','2016-02-16 01:33:42','2016-02-16 01:33:42','2016-02-16 01:33:42','502381fa-17ed-493a-ac32-f85551d53691'),(51,21,'m160206_000000_seomatic_addGoogleAnalyticsSendPageView','2016-02-16 01:33:42','2016-02-16 01:33:42','2016-02-16 01:33:42','0820be4a-7fd3-4463-9180-66a332d2b56b'),(52,21,'m160209_000000_seomatic_alterDescriptionsColumns','2016-02-16 01:33:42','2016-02-16 01:33:42','2016-02-16 01:33:42','be160b5f-a257-418b-b005-b6243f15c275'),(53,21,'m160209_000001_seomatic_addRobotsTxt','2016-02-16 01:33:42','2016-02-16 01:33:42','2016-02-16 01:33:42','fae03fbc-bf68-4202-b726-3e4ba396a085'),(54,22,'m150901_144609_superTable_fixForContentTables','2016-02-16 01:33:55','2016-02-16 01:33:55','2016-02-16 01:33:55','efbeed07-9e11-44f0-bcae-4369767a9dea');
/*!40000 ALTER TABLE `craft_migrations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_plugins`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `licenseKey` char(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8_unicode_ci,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_plugins`
--

LOCK TABLES `craft_plugins` WRITE;
/*!40000 ALTER TABLE `craft_plugins` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_plugins` VALUES (1,'Directory','1.0.12',NULL,NULL,'unknown',1,NULL,'2014-10-08 10:52:21','2014-10-08 10:52:21','2014-10-08 10:52:21','aba3661c-99d2-4d34-9788-30e05197134f'),(2,'Minimee','0.9.3',NULL,NULL,'unknown',1,'{\"cachePath\":\"\",\"cacheUrl\":\"\",\"enabled\":true,\"filesystemPath\":\"\",\"baseUrl\":\"\",\"combineCssEnabled\":true,\"combineJsEnabled\":true,\"minifyCssEnabled\":true,\"minifyJsEnabled\":true,\"cssReturnTemplate\":\"<link rel=\\\"stylesheet\\\" href=\\\"%s\\\">\",\"jsReturnTemplate\":\"<script src=\\\"%s\\\"><\\/script>\",\"returnType\":\"url\"}','2014-10-08 10:53:02','2014-10-08 10:53:02','2014-10-08 10:55:47','4a2e1dfc-f906-4d5a-bcc3-7376b34d1921'),(3,'Embedder','0.9.2',NULL,NULL,'unknown',1,NULL,'2015-02-18 22:17:53','2015-02-18 22:17:53','2016-03-28 22:55:28','7cfd7555-9fc2-4e13-b801-b86e67f04916'),(4,'CpCss','1.0.6',NULL,NULL,'unknown',1,'{\"cssFile\":\"\",\"additionalCss\":\".field .heading label {\\r\\n    font-weight: bold;\\r\\n    font-size: 14px;\\r\\n}\"}','2015-02-23 18:49:50','2015-02-23 18:49:50','2015-02-23 18:53:09','6a72d0cb-b1a4-4b11-89b0-2c9853018b5d'),(5,'Dbug','2.0',NULL,NULL,'unknown',1,NULL,'2015-02-23 19:34:56','2015-02-23 19:34:56','2015-02-23 19:34:56','74b3e328-b587-44a8-8132-6e887e7acc66'),(6,'AssetRev','2.0.1',NULL,NULL,'unknown',1,'{\"manifestPath\":\"..\\/cachebust.json\"}','2016-02-16 01:24:58','2016-02-16 01:24:58','2016-03-28 22:55:28','83e5c0f2-c33d-496f-b627-41a8159c70a8'),(7,'AmNav','1.7.1',NULL,NULL,'unknown',1,NULL,'2016-02-16 01:25:06','2016-02-16 01:25:06','2016-03-28 22:55:28','0ea43e38-1d4e-487e-ab70-5b1ba341268a'),(8,'Imager','1.0.4',NULL,NULL,'unknown',1,NULL,'2016-02-16 01:25:14','2016-02-16 01:25:14','2016-03-28 22:55:28','cf9549c5-8e46-49da-94ca-5cf03fac4ae7'),(9,'Inlin','1.1',NULL,NULL,'unknown',1,NULL,'2016-02-16 01:25:50','2016-02-16 01:25:50','2016-03-28 22:55:28','50cc9d79-3ade-408d-b18d-78fa49663bc9'),(10,'ObsoleteRedirect','0.1.0',NULL,NULL,'unknown',1,NULL,'2016-02-16 01:27:37','2016-02-16 01:27:37','2016-03-28 22:55:28','53d52518-9218-4547-989d-cababcda9625'),(11,'AssetPreview','0.3.2',NULL,NULL,'unknown',1,NULL,'2016-02-16 01:32:20','2016-02-16 01:32:20','2016-03-28 22:55:28','624020e4-f73e-476d-9185-76f7d30bf273'),(12,'CodeBlock','1.1.0','1.1.0',NULL,'unknown',1,NULL,'2016-02-16 01:32:23','2016-02-16 01:32:23','2016-03-28 22:55:28','ab14ea3d-b714-4af3-8727-73824504bbc7'),(13,'CpNav','1.7.1','1.0.0',NULL,'unknown',1,NULL,'2016-02-16 01:32:25','2016-02-16 01:32:25','2016-03-28 22:55:28','064def7a-8cf1-4e8d-ab8f-528fa045ae23'),(14,'CpFieldLinks','1.0.1',NULL,NULL,'unknown',1,NULL,'2016-02-16 01:32:28','2016-02-16 01:32:28','2016-03-28 22:55:28','58e860f3-5553-4af6-95c0-03faefaf2226'),(15,'FocalPointField','1.0.0',NULL,NULL,'unknown',1,NULL,'2016-02-16 01:32:34','2016-02-16 01:32:34','2016-03-28 22:55:28','349c0750-4ffa-4f39-885c-a5e277443b42'),(16,'Guano','0.1',NULL,NULL,'unknown',1,NULL,'2016-02-16 01:32:40','2016-02-16 01:32:40','2016-03-28 22:55:28','96e4e98f-37cb-45e6-bccd-20394c99ffb9'),(17,'ImageResizer','0.1.1','1.0.0',NULL,'unknown',1,NULL,'2016-02-16 01:32:59','2016-02-16 01:32:59','2016-03-28 22:55:28','ae4f7bf0-cdcf-47bd-892a-346122293318'),(18,'QuickField','0.3.1','1.0.0',NULL,'unknown',1,NULL,'2016-02-16 01:33:16','2016-02-16 01:33:16','2016-03-28 22:55:28','941e7e65-c244-4aad-b725-109ab6ab53b3'),(19,'Relabel','0.1.1','1.0.0',NULL,'unknown',1,NULL,'2016-02-16 01:33:25','2016-02-16 01:33:25','2016-03-28 22:55:28','e6907fb7-48ac-4686-8741-d1985729d7dc'),(20,'Reasons','1.0.2','1.1',NULL,'unknown',1,NULL,'2016-02-16 01:33:27','2016-02-16 01:33:27','2016-03-28 22:55:28','ee1d0bf7-2c19-4cf5-a0d5-30a6db3a4e51'),(21,'Seomatic','1.1.1','1.1.4',NULL,'unknown',1,NULL,'2016-02-16 01:33:42','2016-02-16 01:33:42','2016-03-28 22:55:28','f9022cf4-5050-40cc-8fed-a6a01e448415'),(22,'SuperTable','0.4.2','1.0.0',NULL,'unknown',1,NULL,'2016-02-16 01:33:55','2016-02-16 01:33:55','2016-03-28 22:55:29','1f8e6e92-6f0e-40c0-9df5-770cd70885e5'),(23,'Spectrum','0.8.2',NULL,NULL,'unknown',1,NULL,'2016-03-27 23:05:49','2016-03-27 23:05:49','2016-03-28 22:55:29','247dd6b4-69c2-4d8b-ad46-2d0e6215601a'),(24,'FieldManager','1.4.5','1.0.0',NULL,'unknown',1,NULL,'2016-03-28 22:26:23','2016-03-28 22:26:23','2016-03-28 22:55:28','3445f235-aa83-4a81-955c-4fbaddc56968');
/*!40000 ALTER TABLE `craft_plugins` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_rackspaceaccess`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_rackspaceaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `connectionKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `storageUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cdnUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_rackspaceaccess_connectionKey_unq_idx` (`connectionKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_rackspaceaccess`
--

LOCK TABLES `craft_rackspaceaccess` WRITE;
/*!40000 ALTER TABLE `craft_rackspaceaccess` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_rackspaceaccess` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_reasons`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `conditionals` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_reasons_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_reasons_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_reasons`
--

LOCK TABLES `craft_reasons` WRITE;
/*!40000 ALTER TABLE `craft_reasons` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_reasons` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_relabel`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_relabel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_relabel_fieldId_fk` (`fieldId`),
  KEY `craft_relabel_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_relabel_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relabel_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_relabel`
--

LOCK TABLES `craft_relabel` WRITE;
/*!40000 ALTER TABLE `craft_relabel` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_relabel` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_relations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_relations_fieldId_sourceId_sourceLocale_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceLocale`,`targetId`),
  KEY `craft_relations_sourceId_fk` (`sourceId`),
  KEY `craft_relations_sourceLocale_fk` (`sourceLocale`),
  KEY `craft_relations_targetId_fk` (`targetId`),
  CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceLocale_fk` FOREIGN KEY (`sourceLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_relations`
--

LOCK TABLES `craft_relations` WRITE;
/*!40000 ALTER TABLE `craft_relations` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_relations` VALUES (164,10,42,NULL,41,1,'2016-02-19 22:38:15','2016-02-19 22:38:15','ae89b89c-0ea7-4fc6-beb5-abcfcf177423'),(165,10,6,NULL,40,1,'2016-02-19 22:47:38','2016-02-19 22:47:38','2dba649f-31fe-4c95-86d2-2718ded1e49e'),(166,39,33,NULL,41,1,'2016-02-19 22:47:38','2016-02-19 22:47:38','8757501c-9fd5-4b96-ac1d-cf8af389863e'),(189,10,5,NULL,40,1,'2016-02-22 07:24:47','2016-02-22 07:24:47','03e27b61-317f-41f9-881e-c00937171ea5'),(190,21,5,NULL,22,1,'2016-02-22 07:24:47','2016-02-22 07:24:47','fc616122-f8e2-434a-a060-ca58e450f9a4'),(191,21,5,NULL,9,2,'2016-02-22 07:24:47','2016-02-22 07:24:47','9340561a-b406-4309-93d5-85efebf73652'),(192,21,5,NULL,10,3,'2016-02-22 07:24:47','2016-02-22 07:24:47','67733ad8-0a5b-49a9-bf8f-915e921d2511'),(193,27,20,NULL,41,1,'2016-02-22 07:24:47','2016-02-22 07:24:47','d3cbac63-8bb3-49ce-b5d8-5889dd8b7251'),(194,27,21,NULL,40,1,'2016-02-22 07:24:47','2016-02-22 07:24:47','80ec3a22-18d1-4b6a-887b-4e2d53dcac04'),(195,36,5,NULL,44,1,'2016-02-22 07:24:47','2016-02-22 07:24:47','93bf78c5-4b58-42ab-85f5-2ac7bffd1f38'),(196,36,5,NULL,46,2,'2016-02-22 07:24:47','2016-02-22 07:24:47','863183b9-3ea0-40d8-840b-f3a9189ff6b7'),(197,36,5,NULL,43,3,'2016-02-22 07:24:47','2016-02-22 07:24:47','fe740e13-c46c-4092-b29a-348994f4aae1'),(198,36,5,NULL,45,4,'2016-02-22 07:24:47','2016-02-22 07:24:47','5877707f-761d-4a34-b09b-0c1482022785'),(199,36,5,NULL,47,5,'2016-02-22 07:24:47','2016-02-22 07:24:47','2e3f3db6-956b-4cd8-8b72-36cdd0de0319'),(200,51,49,NULL,51,1,'2016-03-27 23:18:28','2016-03-27 23:18:28','65e6d316-c051-42ce-8c2f-b7683e9c6758');
/*!40000 ALTER TABLE `craft_relations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_routes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urlParts` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urlPattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_routes_urlPattern_unq_idx` (`urlPattern`),
  KEY `craft_routes_locale_idx` (`locale`),
  CONSTRAINT `craft_routes_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_routes`
--

LOCK TABLES `craft_routes` WRITE;
/*!40000 ALTER TABLE `craft_routes` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_routes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_searchindex`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`locale`),
  FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_searchindex`
--

LOCK TABLES `craft_searchindex` WRITE;
/*!40000 ALTER TABLE `craft_searchindex` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_searchindex` VALUES (1,'username',0,'nb_no',' admin '),(1,'firstname',0,'nb_no',''),(1,'lastname',0,'nb_no',''),(1,'fullname',0,'nb_no',''),(1,'email',0,'nb_no',' raziel014 gmail com '),(1,'slug',0,'nb_no',''),(2,'field',1,'nb_no',' velkommen til standardcraft dev '),(2,'field',2,'nb_no',' det stemmer denne nettsiden har ikke mye innhold riktig enda men ikke vaer lei deg vare utviklere har nettopp installert cms en og de holder pa a sette opp losningen for vare brukere i dette oyeblikk snart vil standardcraft dev vaere en oase av friske perspektiver skarpe analyser og kloke meninger som vil fa deg til a vende tilbake igjen og igjen '),(2,'slug',0,'nb_no',' homepage '),(2,'title',0,'nb_no',' hjemmeside '),(3,'field',2,'nb_no',' standardcraft dev kjorer pa cms systemet craft det er vakkert funksjonsrikt fleksibelt og lett a bruke losningen er utviklet av pixel tonic vi gleder oss til a finne ut av hva systemet er i stand til dette er enda mer fengslende innhold som ikke er synlig pa nyhetsforsiden fordi det star skrevet etter et sideskift nyhetsforsiden liker kun a vise innholdet pa den forste siden craft et godt alternativ til word hvis du utvikler nettsider '),(3,'field',3,'nb_no',''),(3,'slug',0,'nb_no',''),(3,'title',0,'nb_no',' vi installerte nettopp craft '),(4,'slug',0,'nb_no',''),(4,'field',4,'nb_no',''),(4,'field',5,'nb_no',''),(5,'field',11,'nb_no',' lyden av den gode historie '),(5,'field',16,'nb_no',''),(5,'field',10,'nb_no',' pexels photo '),(5,'field',15,'nb_no',''),(5,'field',12,'nb_no',' musikk lyddesign voiceover foley '),(5,'field',14,'nb_no',''),(5,'slug',0,'nb_no',' forside '),(5,'title',0,'nb_no',' forside '),(6,'field',11,'nb_no',' mer enn bare stoy '),(6,'field',10,'nb_no',' pexels photo '),(6,'field',12,'nb_no',' stoy er et kreativt lydbyra med glimt i oyet vart hovedvirke er produksjon av lyd og medier med spesiell vekt pa postproduksjon '),(6,'slug',0,'nb_no',' kontakt '),(6,'title',0,'nb_no',' kontakt '),(47,'title',0,'nb_no',' logo spaett '),(47,'slug',0,'nb_no',''),(9,'field',20,'nb_no',' http vimeo com 132723874 '),(9,'slug',0,'nb_no',' artsdatabanken '),(9,'title',0,'nb_no',' artsdatabanken '),(10,'field',20,'nb_no',' http vimeo com 132723875 '),(10,'slug',0,'nb_no',' jobb2 '),(10,'title',0,'nb_no',' artsdatabanken '),(5,'field',21,'nb_no',' minimalen kortfilm artsdatabanken artsdatabanken '),(43,'kind',0,'nb_no',' image '),(43,'slug',0,'nb_no',''),(43,'extension',0,'nb_no',' png '),(43,'filename',0,'nb_no',' logo_ekkofilm png '),(42,'slug',0,'nb_no',''),(42,'field',10,'nb_no',' bg '),(41,'slug',0,'nb_no',''),(41,'title',0,'nb_no',' bg '),(41,'kind',0,'nb_no',' image '),(41,'extension',0,'nb_no',' jpg '),(41,'filename',0,'nb_no',' bg jpg '),(40,'title',0,'nb_no',' pexels photo '),(40,'slug',0,'nb_no',''),(40,'filename',0,'nb_no',' pexels photo jpg '),(40,'extension',0,'nb_no',' jpg '),(40,'kind',0,'nb_no',' image '),(47,'kind',0,'nb_no',' image '),(47,'extension',0,'nb_no',' png '),(47,'filename',0,'nb_no',' logo_spaett png '),(5,'field',24,'nb_no',' bg kreativt lyddesign som gir liv til bildene med midt norges eneste dedikerte foley rom utstyrt med egen pit kan vi levere foley og lyddesign til alle typer produksjoner postproduksjon og lyddesign pexels photo ingenting fremkaller mer folelser enn musikk derfor bruker vi musikken for det den er verdt somlost med en god historie og god produksjon sluttproduktet er musikk som virkelig fremhever oyeblikket studio og musikkproduksjon '),(20,'field',25,'nb_no',' postproduksjon og lyddesign '),(20,'field',26,'nb_no',' kreativt lyddesign som gir liv til bildene med midt norges eneste dedikerte foley rom utstyrt med egen pit kan vi levere foley og lyddesign til alle typer produksjoner '),(20,'field',27,'nb_no',' bg '),(20,'slug',0,'nb_no',''),(21,'field',25,'nb_no',' studio og musikkproduksjon '),(21,'field',26,'nb_no',' ingenting fremkaller mer folelser enn musikk derfor bruker vi musikken for det den er verdt somlost med en god historie og god produksjon sluttproduktet er musikk som virkelig fremhever oyeblikket '),(21,'field',27,'nb_no',' pexels photo '),(21,'slug',0,'nb_no',''),(10,'field',23,'nb_no',' bg6 '),(10,'field',22,'nb_no',' artsdatabanken kapittel 5 '),(9,'field',23,'nb_no',' bg8 '),(9,'field',22,'nb_no',' artbanken kapittel 4 '),(22,'field',23,'nb_no',' bg7 '),(22,'field',20,'nb_no',' http vimeo com 151304098 '),(22,'field',22,'nb_no',' minimalen 2016 introvignett '),(22,'slug',0,'nb_no',' undringstarnet '),(22,'title',0,'nb_no',' minimalen kortfilm '),(23,'slug',0,'nb_no',' lyddesign '),(23,'title',0,'nb_no',' lyddesign '),(24,'slug',0,'nb_no',' musikkproduksjon '),(24,'title',0,'nb_no',' musikkproduksjon '),(20,'field',35,'nb_no',''),(21,'field',35,'nb_no',''),(46,'slug',0,'nb_no',''),(46,'title',0,'nb_no',' logo nrk '),(46,'kind',0,'nb_no',' image '),(46,'extension',0,'nb_no',' png '),(46,'filename',0,'nb_no',' logo_nrk png '),(45,'title',0,'nb_no',' logo news '),(45,'slug',0,'nb_no',''),(45,'kind',0,'nb_no',' image '),(45,'extension',0,'nb_no',' png '),(45,'filename',0,'nb_no',' logo_news png '),(44,'title',0,'nb_no',' logo helmet '),(44,'slug',0,'nb_no',''),(44,'kind',0,'nb_no',' image '),(44,'extension',0,'nb_no',' png '),(44,'filename',0,'nb_no',' logo_helmet png '),(43,'title',0,'nb_no',' logo ekkofilm '),(5,'field',36,'nb_no',' logo helmet logo nrk logo ekkofilm logo news logo spaett '),(6,'field',30,'nb_no',' david stoey no david thyge nielsen daglig leder 985 45 553 thomas stoey no thomas gregussen musikkprodusent og komponist 985 45 553 kjellthomas stoey no kjell thomas mathisen lyddesigner og foleyartist 985 45 553 '),(6,'field',28,'nb_no',' stoy er et kreativt lydbyra med glimt i oyet vart hovedvirke er produksjon av lyd og medier med spesiell vekt pa postproduksjon '),(6,'field',22,'nb_no',''),(30,'field',31,'nb_no',' david thyge nielsen '),(30,'field',32,'nb_no',' daglig leder '),(30,'field',33,'nb_no',' 985 45 553 '),(30,'field',34,'nb_no',' david stoey no '),(30,'slug',0,'nb_no',''),(31,'field',31,'nb_no',' thomas gregussen '),(31,'field',32,'nb_no',' musikkprodusent og komponist '),(31,'field',33,'nb_no',' 985 45 553 '),(31,'field',34,'nb_no',' thomas stoey no '),(31,'slug',0,'nb_no',''),(32,'field',31,'nb_no',' kjell thomas mathisen '),(32,'field',32,'nb_no',' lyddesigner og foleyartist '),(32,'field',33,'nb_no',' 985 45 553 '),(32,'field',34,'nb_no',' kjellthomas stoey no '),(32,'slug',0,'nb_no',''),(6,'field',38,'nb_no',' bg her er tekst '),(33,'field',39,'nb_no',' bg '),(33,'field',40,'nb_no',' her er tekst '),(33,'slug',0,'nb_no',''),(6,'field',41,'nb_no',' med bred erfaring fra tv reklamer kino reklamer fulle tv produksjoner kortfilm og informasjonsfilm kan du vaere trygg pa at du far den ekspertisen du trenger til din produksjon var store lekeplass apner for overlegen allsidighet og ubegrensede muligheter for a blase liv i din historie med to romslige produksjonsuiter et stort innspillingsrom og dedikert foleystudio utstyrt med foleypit er vi rustet for alle type utfordringer musikkproduksjoningenting fremkaller mer folelser enn musikk og vi skreddersyr musikken til din historie vi gjor alt fra store orkesterproduksjoner til akustiske inspillinger i en rekke stilarter lyddesign lyd etterarbeidvar kreative lyddesigner gir liv til bildene og skaper det riktige universet til din historie lyd er halve opplevelsen blablablablablavoiceovervi har tilgang til et stort utvalg av forskjellige stemmer og dialekter gammel som ung ta kontakt sa finner vi noen som passer til din produksjon foleymed midt norges eneste dedikerte foley rom utstyrt med egen pit kan vi levere foley og lyddesign til alle type produksjoner feltopptak '),(34,'field',42,'nb_no',' batmannsgata 4 7044 trondheim '),(34,'field',43,'nb_no',' post stoey nothomas 948 48 494kjell thomas 987 45 121 '),(34,'field',5,'nb_no',''),(34,'field',44,'nb_no',' https www facebook com stoystudio '),(34,'field',45,'nb_no',' ingenting '),(34,'slug',0,'nb_no',''),(23,'field',11,'nb_no',' lyddesign gir liv til oyeblikket '),(23,'field',30,'nb_no',''),(23,'field',10,'nb_no',' stock13 '),(23,'field',38,'nb_no',' toppbg fint bilde ja '),(23,'field',28,'nb_no',' her star det bare masse tekst om lyddesign og hva man mener med det '),(23,'field',41,'nb_no',' far far awaybehind the word mountains far from the countries vokalia and consonantia there live the blind texts separated they live in bookmarksgrove right at the coast of the semantics a large language ocean a small river named duden flows by their place and supplies it with the necessary regelialia it is a paradisematic country in which roasted parts of sentences fly into your mouth even the all powerful pointing has no control about the blind texts it is an almost unorthographic life one day however a small line of blind text by the name of lorem ipsum decided to leave for the far world of grammar the big oxmox advised her not to do so because there were thousands of bad commas wild question marks and devious semikoli but the little blind text didn t listen she packed her seven versalia put her initial into the belt and made herself on the way when she reached the first hills of the italic mountains she had a last view back on the skyline of her hometown bookmarksgrove the headline of alphabet village and the subline of her own road the line lane pityful a rethoric question ran over her cheek then '),(35,'field',39,'nb_no',' toppbg '),(35,'field',40,'nb_no',' fint bilde ja '),(35,'slug',0,'nb_no',''),(24,'field',10,'nb_no',' stock1 '),(24,'field',30,'nb_no',''),(24,'field',11,'nb_no',' skap sterkere inntrykk med komponert musikk '),(24,'field',38,'nb_no',' stock1 blablabla '),(24,'field',28,'nb_no',' musikkproduksjon ass '),(24,'field',41,'nb_no',' far far awaybehind the word mountains far from the countries vokalia and consonantia there live the blind texts separated they live in bookmarksgrove right at the coast of the semantics a large language ocean a small river named duden flows by their place and supplies it with the necessary regelialia it is a paradisematic country in which roasted parts of sentences fly into your mouth even the all powerful pointing has no control about the blind texts it is an almost unorthographic life one day however a small line of blind text by the name of lorem ipsum decided to leave for the far world of grammar the big oxmoxadvised her not to do so because there were thousands of bad commas wild question marks and devious semikoli but the little blind text didn t listen she packed her seven versalia put her initial into the belt and made herself on the way when she reached the first hills of the italic mountains she had a last view back on the skyline of her hometown bookmarksgrove the headline of alphabet village and the subline of her own road the line lane pityful a rethoric question ran over her cheek then '),(36,'field',39,'nb_no',' stock1 '),(36,'field',40,'nb_no',' blablabla '),(36,'slug',0,'nb_no',''),(24,'field',46,'nb_no',' mikrofon annen ting blabla '),(37,'field',47,'nb_no',' mikrofon '),(37,'slug',0,'nb_no',''),(38,'field',47,'nb_no',' annen ting '),(38,'slug',0,'nb_no',''),(39,'field',47,'nb_no',' blabla '),(39,'slug',0,'nb_no',''),(48,'field',48,'nb_no',' rgb 228 95 86 akustisk gitar icon kassert '),(48,'slug',0,'nb_no',''),(49,'field',49,'nb_no',' akustisk gitar '),(49,'field',50,'nb_no',' rgb 228 95 86 '),(49,'field',51,'nb_no',' icon kassert '),(49,'slug',0,'nb_no',''),(56,'field',52,'nb_no',' instruments id 0 type akustisk gitar role desc height 100 width 300 top 130 left 0 id 1 type akustisk gitar role desc height 114 width 300 top 312 left 0 id 0 name intro rhytm 8 instruments id 1 name ny kolonne rhytm 3 '),(56,'slug',0,'nb_no',' penny lane '),(51,'filename',0,'nb_no',' icon kassert svg '),(51,'extension',0,'nb_no',' svg '),(51,'kind',0,'nb_no',' image '),(51,'slug',0,'nb_no',''),(51,'title',0,'nb_no',' icon kassert '),(56,'title',0,'nb_no',' penny lane '),(52,'field',10,'nb_no',''),(52,'field',11,'nb_no',''),(52,'field',12,'nb_no',''),(52,'field',21,'nb_no',''),(52,'field',24,'nb_no',''),(52,'field',36,'nb_no',''),(52,'slug',0,'nb_no',''),(52,'title',0,'nb_no',' forside '),(53,'field',10,'nb_no',''),(53,'field',11,'nb_no',''),(53,'field',12,'nb_no',''),(53,'field',21,'nb_no',''),(53,'field',24,'nb_no',''),(53,'field',36,'nb_no',''),(53,'slug',0,'nb_no',''),(53,'title',0,'nb_no',' forside '),(57,'field',52,'nb_no',' instruments id 0 name ny kolonne rhytm 4 '),(57,'slug',0,'nb_no',' test '),(57,'title',0,'nb_no',' test ');
/*!40000 ALTER TABLE `craft_searchindex` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_sections`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enableVersioning` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_name_unq_idx` (`name`),
  UNIQUE KEY `craft_sections_handle_unq_idx` (`handle`),
  KEY `craft_sections_structureId_fk` (`structureId`),
  CONSTRAINT `craft_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sections`
--

LOCK TABLES `craft_sections` WRITE;
/*!40000 ALTER TABLE `craft_sections` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_sections` VALUES (1,NULL,'Forside','forside','single',1,'index',1,'2015-02-18 21:56:40','2016-02-17 11:40:10','3b657df2-851c-429d-88f0-744ed3a3e903'),(2,NULL,'Kontakt','kontakt','single',1,'underside',1,'2015-02-20 23:33:16','2015-02-20 23:33:16','de1826a6-4d94-4834-b8a8-5fe4da7fcf45'),(3,NULL,'Jobber','jobber','channel',1,'jobber/',1,'2015-02-22 15:29:37','2015-02-23 21:08:42','6e0aefde-5dfe-4105-bad8-2a9a0d1bb0ec'),(4,NULL,'Lyddesign','lyddesign','single',1,'underside',1,'2015-02-22 22:07:09','2015-02-22 22:07:34','ef27f365-5e88-4dd0-9045-90348e82b1c6'),(5,NULL,'Musikkproduksjon','musikkproduksjon','single',1,'underside',1,'2015-02-22 22:07:22','2015-02-22 22:07:40','84c73dba-541e-4741-b370-22fbe46937ce'),(6,NULL,'Arranger','arranger','channel',1,'arranger/index',1,'2016-03-27 22:55:34','2016-03-27 22:55:34','bf9e6fa5-78d9-4cd6-a4f0-67be38b52f39');
/*!40000 ALTER TABLE `craft_sections` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_sections_i18n`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sections_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `enabledByDefault` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `urlFormat` text COLLATE utf8_unicode_ci,
  `nestedUrlFormat` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_i18n_sectionId_locale_unq_idx` (`sectionId`,`locale`),
  KEY `craft_sections_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_sections_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_sections_i18n_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sections_i18n`
--

LOCK TABLES `craft_sections_i18n` WRITE;
/*!40000 ALTER TABLE `craft_sections_i18n` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_sections_i18n` VALUES (1,1,'nb_no',0,'__home__',NULL,'2015-02-18 21:56:40','2015-02-22 22:16:22','17c53119-b673-40ba-8356-993707166b47'),(2,2,'nb_no',0,'kontakt',NULL,'2015-02-20 23:33:16','2015-02-20 23:33:16','c7b7ec98-df0c-411e-a08d-dfd3fa32a7b1'),(3,3,'nb_no',0,'jobber/{slug}',NULL,'2015-02-22 15:29:37','2015-02-23 21:05:45','26fc952c-863c-4d88-aeaf-11147f9159c2'),(4,4,'nb_no',0,'lyddesign',NULL,'2015-02-22 22:07:09','2015-02-22 22:07:09','b9ecd84a-7c65-42e0-8f7d-ad51319b61b4'),(5,5,'nb_no',0,'musikkproduksjon',NULL,'2015-02-22 22:07:22','2015-02-22 22:07:22','fe2e1450-8964-4e31-a2f8-8fc44e7f1ac3'),(6,6,'nb_no',0,'arranger/{slug}',NULL,'2016-03-27 22:55:34','2016-03-27 22:55:34','55549c5a-2362-46a4-9531-75341095f4b3');
/*!40000 ALTER TABLE `craft_sections_i18n` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_seomatic_meta`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_seomatic_meta` (
  `id` int(11) NOT NULL,
  `seoImageId` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'nb_no',
  `elementId` int(11) DEFAULT '0',
  `metaType` enum('default','template') COLLATE utf8_unicode_ci DEFAULT 'template',
  `metaPath` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoKeywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `twitterCardType` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'summary',
  `openGraphType` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'website',
  `robots` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_seomatic_meta_seoImageId_fk` (`seoImageId`),
  CONSTRAINT `craft_seomatic_meta_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_seomatic_meta_seoImageId_fk` FOREIGN KEY (`seoImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_seomatic_meta`
--

LOCK TABLES `craft_seomatic_meta` WRITE;
/*!40000 ALTER TABLE `craft_seomatic_meta` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_seomatic_meta` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_seomatic_settings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_seomatic_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteSeoImageId` int(11) DEFAULT NULL,
  `genericOwnerImageId` int(11) DEFAULT NULL,
  `genericCreatorImageId` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoTitleSeparator` varchar(255) COLLATE utf8_unicode_ci DEFAULT '|',
  `siteSeoTitlePlacement` enum('before','after','none') COLLATE utf8_unicode_ci DEFAULT 'after',
  `siteSeoDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoKeywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteTwitterCardType` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteOpenGraphType` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteRobots` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteRobotsTxt` text COLLATE utf8_unicode_ci,
  `googleSiteVerification` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `googleAnalyticsUID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `googleAnalyticsSendPageview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `googleAnalyticsAdvertising` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `googleAnalyticsEcommerce` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `googleAnalyticsEEcommerce` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `googleAnalyticsLinkAttribution` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `googleAnalyticsLinker` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteOwnerType` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteOwnerSubType` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteOwnerSpecificType` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerAlternateName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerDescription` varchar(1024) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerTelephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerStreetAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerAddressLocality` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerAddressRegion` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerPostalCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerAddressCountry` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerGeoLatitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerGeoLongitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationOwnerDuns` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationOwnerFounder` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationOwnerFoundingDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationOwnerFoundingLocation` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `localBusinessOwnerOpeningHours` text COLLATE utf8_unicode_ci,
  `corporationOwnerTickerSymbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantOwnerServesCuisine` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantOwnerMenuUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantOwnerReservationsUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `personOwnerGender` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `personOwnerBirthPlace` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `twitterHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `facebookHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `facebookProfileId` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `linkedInHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `googlePlusHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `youtubeHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `youtubeChannelHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `instagramHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `pinterestHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `githubHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteCreatorType` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteCreatorSubType` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteCreatorSpecificType` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorAlternateName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorDescription` varchar(1024) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorTelephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorStreetAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorAddressLocality` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorAddressRegion` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorPostalCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorAddressCountry` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorGeoLatitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorGeoLongitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationCreatorDuns` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationCreatorFounder` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationCreatorFoundingDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationCreatorFoundingLocation` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `localBusinessCreatorOpeningHours` text COLLATE utf8_unicode_ci,
  `corporationCreatorTickerSymbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantCreatorServesCuisine` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantCreatorMenuUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantCreatorReservationsUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `personCreatorGender` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `personCreatorBirthPlace` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorHumansTxt` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_seomatic_settings_siteSeoImageId_fk` (`siteSeoImageId`),
  KEY `craft_seomatic_settings_genericOwnerImageId_fk` (`genericOwnerImageId`),
  KEY `craft_seomatic_settings_genericCreatorImageId_fk` (`genericCreatorImageId`),
  CONSTRAINT `craft_seomatic_settings_genericCreatorImageId_fk` FOREIGN KEY (`genericCreatorImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_seomatic_settings_genericOwnerImageId_fk` FOREIGN KEY (`genericOwnerImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_seomatic_settings_siteSeoImageId_fk` FOREIGN KEY (`siteSeoImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_seomatic_settings`
--

LOCK TABLES `craft_seomatic_settings` WRITE;
/*!40000 ALTER TABLE `craft_seomatic_settings` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_seomatic_settings` VALUES (1,NULL,NULL,NULL,'nb_no','Støy Lydstudio','This is the default global title of the site pages.','|','after','This is the default global natural language description of the content on the site pages.','default,global,comma-separated,keywords','summary','website','','# robots.txt for {{ siteUrl }}\r\n\r\nSitemap: {{ siteUrl }}/sitemap.xml\r\n\r\n# Don\'t allow web crawlers to index Craft\r\n\r\nUser-agent: *\r\nDisallow: /craft/\r\n','','',1,0,0,0,0,0,'Organization','Corporation','','Støy Lydstudio','','','http://stoy.local/','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','Organization','Corporation','','','','','','','','','','','','','','','','','','','','','','','','','','/* TEAM */\r\n\r\n{% if seomaticCreator.name is defined and seomaticCreator.name %}\r\nCreator: {{ seomaticCreator.name }}\r\n{% endif %}\r\n{% if seomaticCreator.url is defined and seomaticCreator.url %}\r\nURL: {{ seomaticCreator.url }}\r\n{% endif %}\r\n{% if seomaticCreator.description is defined and seomaticCreator.description %}\r\nDescription: {{ seomaticCreator.description }}\r\n{% endif %}\r\n\r\n/* THANKS */\r\n\r\nPixel & Tonic - https://pixelandtonic.com\r\n\r\n/* SITE */\r\n\r\nStandards: HTML5, CSS3\r\nComponents: Craft CMS, Yii, PHP, Javascript, SEOmatic','2016-02-16 01:34:02','2016-02-16 01:34:02','06c772b6-5028-476b-b8e1-3de81215d6a1');
/*!40000 ALTER TABLE `craft_seomatic_settings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_sessions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sessions_uid_idx` (`uid`),
  KEY `craft_sessions_token_idx` (`token`),
  KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `craft_sessions_userId_fk` (`userId`),
  CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sessions`
--

LOCK TABLES `craft_sessions` WRITE;
/*!40000 ALTER TABLE `craft_sessions` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_sessions` VALUES (8,1,'d005d1a97b691e0ab7009e6679390b334d5139d6czozNjoiZGNmMzk0MDgtOGFiZS00ZWRmLTg0MmEtMGRjZjVmY2U5MDUzIjs=','2015-02-23 23:44:32','2015-02-23 23:44:32','11ac78a6-27fe-4c53-8ab7-cae0614ab413'),(9,1,'cf0e98e35b3bab3452f3438203357dcde3cc757bczozNjoiNGM3ZWY1M2MtY2JjYy00OTk3LTlhNTYtMjY0YzUyYzhkMGVmIjs=','2015-02-24 04:36:17','2015-02-24 04:36:17','abbafd6b-3019-4633-a566-90a8bafd50c2'),(10,1,'43bb0a4fe601441a940d3a09009558d6470249efczozNjoiNzU2YjcxOTctZGQ2Yi00ZTNlLWFhMjMtNDA2NzgxNTIyZGZkIjs=','2015-02-24 05:06:32','2015-02-24 05:06:32','4283d3b0-627e-42b0-822a-cfd47f21ec9b'),(11,1,'bdf473e7348b155a2097d0c34c6bf33d44d2a2d1czozNjoiMjA0Y2E4OWYtMzY5MS00MGI4LWJlNzQtMmE4NTI3MjdiN2YxIjs=','2015-02-24 10:33:14','2015-02-24 10:33:14','d9e34c29-c88d-41f2-8498-f714e19e48f2'),(12,1,'75d9a9e56466e3f672039a6518a4d13cc69efbdaczozNjoiZjJkMjAyZGUtY2IwNy00YzNmLTlkNTktYTEwMjU1YWUxZWQ3Ijs=','2015-02-24 19:32:56','2015-02-24 19:32:56','e002a265-7e2b-46f0-a900-5471ebabfe53'),(13,1,'aee897be446f5a02f255b4dc4bdafc7d439d7d58czozNjoiNjMxZjY3MTEtNTA5Mi00Y2U4LWI4MGMtNzgxMWU0OGQ4ZTgzIjs=','2015-03-08 22:20:54','2015-03-08 22:20:54','a318abb2-633b-4441-bb6c-182b38bd0f37'),(14,1,'a9d7b9a8e26bfc42a2e2783f2b06d77aa3834da8czozNjoiYzU3MzFlM2EtZjk3ZS00YmQwLTkxZDItODllMTBiNDY3NTQyIjs=','2015-03-08 22:22:04','2015-03-09 17:36:44','5b72bd8d-7680-4cbb-a965-3f6721b880e7'),(15,1,'c37ef492971225781d3d1f9ce6a06f5a7eeeb007czozNjoiMzk4NzA4ZjktN2UyMy00MDZlLWE1NjctYjMwMmE1ZjFkZDc5Ijs=','2015-03-15 13:08:01','2015-03-15 13:08:01','30d0227b-631f-49a2-9d5b-df402a3bcdc4'),(16,1,'2cf0f7c3f489bd292e4bfe98121a5c9ec171e1fcczozNjoiOGI0MjdjN2QtZGJkOS00MTU4LTg0OGEtNmRlNTY1OGNhYmRlIjs=','2015-03-24 11:05:48','2015-03-24 11:05:48','2d976494-857b-4e00-99b3-94f857b6a55a'),(17,1,'91c16d8a48fa6c6bd116ca18a6dc1030a19b90deczozNjoiYTQxMGJkODEtMDBmNC00OTU3LWIxNGQtMGRjMzQyODdhOGE4Ijs=','2015-03-24 14:30:00','2015-03-24 14:30:00','30a38f42-8a26-4641-946c-79a3365b36e3'),(18,1,'b0569b7627c84ca041e533e901eb0d8a1ed8a4cdczozMjoieXlBQWc4bVdnR35JejRvYjdyc3lKTFZnMWJtQnNFNjMiOw==','2016-02-16 01:20:29','2016-02-16 01:20:29','f8e04eeb-1e9f-48e4-867f-c647c1e15305'),(19,1,'564be6d63b715a135ebd74a3b290a3e83f6ae796czozMjoicGdwTlhCb0xaQm94TGdPNTZiWDRTOWFGYWNqUTBZN2UiOw==','2016-03-27 22:54:41','2016-03-27 22:54:41','bbc02fb1-3bfa-40df-a0b9-380ec7c6fcd8'),(20,1,'e0003ddd1b026b958afd98e97b18bffb88673b21czozMjoiM3lBSWt5eEZleEtCT35obWdxQk9KeFJpeHNiYWVuS08iOw==','2016-03-28 23:36:32','2016-03-28 23:36:32','5af735d4-a623-495e-b25e-7515b124b25b'),(21,1,'af06d0dec159f5265dbdd5f613f0c117d1b73656czozMjoiWjU0aXlfNndaVTZUV1RBSXJDekd1dmtyYWg1WlAzNjIiOw==','2016-03-28 23:41:20','2016-03-28 23:41:20','80e9947f-d3fd-40bc-a561-4d4f6cf26dfe'),(22,1,'de6212e290550333e38b61b8f4c3b34359933b86czozMjoiMjhkbG1RbGZKdnVmMmlwelJNWXJpfmhsa3VORUdpT1UiOw==','2016-03-28 23:42:45','2016-03-28 23:42:45','58f46f88-7b3b-4524-94a2-372c38cb433f');
/*!40000 ALTER TABLE `craft_sessions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_shunnedmessages`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_shunnedmessages`
--

LOCK TABLES `craft_shunnedmessages` WRITE;
/*!40000 ALTER TABLE `craft_shunnedmessages` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_structureelements`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `craft_structureelements_root_idx` (`root`),
  KEY `craft_structureelements_lft_idx` (`lft`),
  KEY `craft_structureelements_rgt_idx` (`rgt`),
  KEY `craft_structureelements_level_idx` (`level`),
  KEY `craft_structureelements_elementId_fk` (`elementId`),
  CONSTRAINT `craft_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_structureelements`
--

LOCK TABLES `craft_structureelements` WRITE;
/*!40000 ALTER TABLE `craft_structureelements` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_structureelements` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_structures`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_structures`
--

LOCK TABLES `craft_structures` WRITE;
/*!40000 ALTER TABLE `craft_structures` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_structures` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_supertableblocks`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_supertableblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_supertableblocks_ownerId_idx` (`ownerId`),
  KEY `craft_supertableblocks_fieldId_idx` (`fieldId`),
  KEY `craft_supertableblocks_typeId_idx` (`typeId`),
  KEY `craft_supertableblocks_sortOrder_idx` (`sortOrder`),
  KEY `craft_supertableblocks_ownerLocale_fk` (`ownerLocale`),
  CONSTRAINT `craft_supertableblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_supertableblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_supertableblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_supertableblocks`
--

LOCK TABLES `craft_supertableblocks` WRITE;
/*!40000 ALTER TABLE `craft_supertableblocks` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_supertableblocks` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_supertableblocktypes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_supertableblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_supertableblocktypes_fieldId_fk` (`fieldId`),
  KEY `craft_supertableblocktypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_supertableblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_supertableblocktypes`
--

LOCK TABLES `craft_supertableblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_supertableblocktypes` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_supertableblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_systemsettings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_systemsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_systemsettings_category_unq_idx` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_systemsettings`
--

LOCK TABLES `craft_systemsettings` WRITE;
/*!40000 ALTER TABLE `craft_systemsettings` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_systemsettings` VALUES (1,'email','{\"protocol\":\"php\",\"emailAddress\":\"dev@mustasj.no\",\"senderName\":\"Standardcraft\"}','2014-10-08 10:49:50','2014-10-08 10:49:50','13f059b8-2b49-44e6-bb6e-28bad17289af');
/*!40000 ALTER TABLE `craft_systemsettings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_taggroups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_taggroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_taggroups_handle_unq_idx` (`handle`),
  KEY `craft_taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_taggroups`
--

LOCK TABLES `craft_taggroups` WRITE;
/*!40000 ALTER TABLE `craft_taggroups` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_taggroups` VALUES (1,'Standard','default',1,'2014-10-08 10:49:50','2014-10-08 10:49:50','b798f6f4-4b51-4b2a-a1e8-fe03d7e54640');
/*!40000 ALTER TABLE `craft_taggroups` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_tags`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tags_groupId_fk` (`groupId`),
  KEY `craft_tags_groupId_idx` (`groupId`),
  CONSTRAINT `craft_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tags`
--

LOCK TABLES `craft_tags` WRITE;
/*!40000 ALTER TABLE `craft_tags` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_tags` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_tasks`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `currentStep` int(11) unsigned DEFAULT NULL,
  `totalSteps` int(11) unsigned DEFAULT NULL,
  `status` enum('pending','error','running') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tasks_root_idx` (`root`),
  KEY `craft_tasks_lft_idx` (`lft`),
  KEY `craft_tasks_rgt_idx` (`rgt`),
  KEY `craft_tasks_level_idx` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tasks`
--

LOCK TABLES `craft_tasks` WRITE;
/*!40000 ALTER TABLE `craft_tasks` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_tasks` VALUES (18,18,1,2,0,NULL,NULL,'pending','DeleteStaleTemplateCaches',NULL,'{\"elementId\":[\"56\",\"57\"]}','2016-03-29 12:35:05','2016-03-29 13:48:34','39ef88c8-8a31-413b-bc11-caa51186907a');
/*!40000 ALTER TABLE `craft_tasks` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_templatecachecriteria`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecachecriteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `criteria` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecachecriteria_cacheId_fk` (`cacheId`),
  KEY `craft_templatecachecriteria_type_idx` (`type`),
  CONSTRAINT `craft_templatecachecriteria_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecachecriteria`
--

LOCK TABLES `craft_templatecachecriteria` WRITE;
/*!40000 ALTER TABLE `craft_templatecachecriteria` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_templatecachecriteria` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_templatecacheelements`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `craft_templatecacheelements_cacheId_fk` (`cacheId`),
  KEY `craft_templatecacheelements_elementId_fk` (`elementId`),
  CONSTRAINT `craft_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecacheelements`
--

LOCK TABLES `craft_templatecacheelements` WRITE;
/*!40000 ALTER TABLE `craft_templatecacheelements` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_templatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_templatecaches`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecaches_expiryDate_cacheKey_locale_path_idx` (`expiryDate`,`cacheKey`,`locale`,`path`),
  KEY `craft_templatecaches_locale_fk` (`locale`),
  CONSTRAINT `craft_templatecaches_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecaches`
--

LOCK TABLES `craft_templatecaches` WRITE;
/*!40000 ALTER TABLE `craft_templatecaches` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_templatecaches` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_tokens`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_tokens_token_unq_idx` (`token`),
  KEY `craft_tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tokens`
--

LOCK TABLES `craft_tokens` WRITE;
/*!40000 ALTER TABLE `craft_tokens` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_tokens` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_usergroups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_usergroups`
--

LOCK TABLES `craft_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_usergroups` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_usergroups_users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `craft_usergroups_users_userId_fk` (`userId`),
  CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_usergroups_users`
--

LOCK TABLES `craft_usergroups_users` WRITE;
/*!40000 ALTER TABLE `craft_usergroups_users` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_userpermissions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions`
--

LOCK TABLES `craft_userpermissions` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_userpermissions_usergroups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `craft_userpermissions_usergroups_groupId_fk` (`groupId`),
  CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions_usergroups`
--

LOCK TABLES `craft_userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions_usergroups` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_userpermissions_users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `craft_userpermissions_users_userId_fk` (`userId`),
  CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions_users`
--

LOCK TABLES `craft_userpermissions_users` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions_users` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `craft_userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferredLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weekStartDay` tinyint(4) NOT NULL DEFAULT '0',
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `client` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL,
  `suspended` tinyint(1) NOT NULL,
  `pending` tinyint(1) NOT NULL,
  `archived` tinyint(1) NOT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIPAddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(4) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `verificationCode` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_users_username_unq_idx` (`username`),
  UNIQUE KEY `craft_users_email_unq_idx` (`email`),
  KEY `craft_users_verificationCode_idx` (`verificationCode`),
  KEY `craft_users_uid_idx` (`uid`),
  KEY `craft_users_preferredLocale_fk` (`preferredLocale`),
  CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_users_preferredLocale_fk` FOREIGN KEY (`preferredLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_users`
--

LOCK TABLES `craft_users` WRITE;
/*!40000 ALTER TABLE `craft_users` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_users` VALUES (1,'Admin',NULL,'','','raziel014@gmail.com','$2a$13$09TOp00bXuD./nRcJYlnOeTvGgE19LjXHB0VLn8C8dc0LA5UuA8Ii',NULL,0,1,0,0,0,0,0,'2016-03-28 23:42:45','127.0.0.1',NULL,NULL,'2015-02-23 23:44:26',NULL,NULL,NULL,NULL,0,'2015-02-23 22:10:19','2014-10-08 10:49:48','2016-03-28 23:42:45','1381d236-993f-4cd9-81bf-e97ced9e7789');
/*!40000 ALTER TABLE `craft_users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `craft_widgets`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `colspan` tinyint(4) unsigned DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_widgets_userId_fk` (`userId`),
  CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_widgets`
--

LOCK TABLES `craft_widgets` WRITE;
/*!40000 ALTER TABLE `craft_widgets` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `craft_widgets` VALUES (1,1,'QuickPost',1,NULL,'{\"section\":\"2\"}',0,'2014-10-08 10:52:10','2015-02-22 16:00:12','262b9070-0bab-4f6d-b428-4eae106b5cd8'),(2,1,'RecentEntries',2,NULL,NULL,1,'2014-10-08 10:52:10','2014-10-08 10:52:10','a60fa7d3-9e67-413e-87ed-e32498493920'),(3,1,'GetHelp',3,NULL,NULL,0,'2014-10-08 10:52:10','2015-02-22 16:00:17','95bf3c4f-3127-4561-ac45-a6c63fb67036'),(4,1,'Updates',4,NULL,NULL,1,'2014-10-08 10:52:10','2014-10-08 10:52:10','e2d736fe-350e-4db5-b1fc-f8abde34e266'),(5,1,'Feed',5,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\"}',0,'2014-10-08 10:52:10','2016-02-16 01:20:25','f9d6ff3f-5305-48c7-9f64-734b67436d7b');
/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on: Tue, 29 Mar 2016 14:49:55 +0100
