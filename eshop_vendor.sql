-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: eshop_vendor
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `mobile` varchar(24) DEFAULT NULL,
  `alternate_mobile` varchar(24) DEFAULT NULL,
  `address` mediumtext DEFAULT NULL,
  `landmark` varchar(128) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `city` varchar(256) NOT NULL DEFAULT 'NULL',
  `area` varchar(256) NOT NULL DEFAULT 'NULL',
  `pincode` varchar(256) DEFAULT NULL,
  `system_pincode` tinyint(4) NOT NULL DEFAULT 1,
  `country_code` int(11) DEFAULT NULL,
  `state` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `latitude` varchar(64) DEFAULT NULL,
  `longitude` varchar(64) DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` mediumtext NOT NULL,
  `city_id` int(11) NOT NULL,
  `zipcode_id` int(11) NOT NULL DEFAULT 0,
  `minimum_free_delivery_order_amount` double NOT NULL DEFAULT 100,
  `delivery_charges` double DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_set`
--

DROP TABLE IF EXISTS `attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `status` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_set`
--

LOCK TABLES `attribute_set` WRITE;
/*!40000 ALTER TABLE `attribute_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_values`
--

DROP TABLE IF EXISTS `attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `filterable` int(11) DEFAULT 0,
  `value` varchar(1024) NOT NULL,
  `swatche_type` int(11) DEFAULT 0,
  `swatche_value` varchar(512) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_id` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_values`
--

LOCK TABLES `attribute_values` WRITE;
/*!40000 ALTER TABLE `attribute_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `type` varchar(64) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `attribute_set_id` (`attribute_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `slug` varchar(256) DEFAULT NULL,
  `image` text NOT NULL,
  `banner` text NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_categories`
--

LOCK TABLES `blog_categories` WRITE;
/*!40000 ALTER TABLE `blog_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `image` varchar(256) DEFAULT NULL,
  `slug` varchar(256) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `slug` varchar(256) DEFAULT NULL,
  `image` text NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Test Brand','test-brand-1','uploads/media/2021/eshop-logo-full.png',1);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `is_saved_for_later` int(11) NOT NULL DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_variant_id` (`product_variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(256) NOT NULL,
  `image` text NOT NULL,
  `banner` text DEFAULT NULL,
  `row_order` int(11) DEFAULT 0,
  `status` tinyint(4) DEFAULT NULL,
  `clicks` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'test',0,'test','uploads/media/2021/eshop-logo-full.png',NULL,0,1,0),(2,'hello',1,'hello','uploads/media/2021/eshop-favicon.png',NULL,0,1,0);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Thane');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_api_keys`
--

DROP TABLE IF EXISTS `client_api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` mediumtext DEFAULT NULL,
  `secret` mediumtext NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_api_keys`
--

LOCK TABLES `client_api_keys` WRITE;
/*!40000 ALTER TABLE `client_api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cod_advance_payment`
--

DROP TABLE IF EXISTS `cod_advance_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cod_advance_payment` (
  `id` int(11) NOT NULL,
  `percent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cod_advance_payment`
--

LOCK TABLES `cod_advance_payment` WRITE;
/*!40000 ALTER TABLE `cod_advance_payment` DISABLE KEYS */;
INSERT INTO `cod_advance_payment` VALUES (1,10);
/*!40000 ALTER TABLE `cod_advance_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numeric_code` char(3) DEFAULT NULL,
  `iso2` char(2) DEFAULT NULL,
  `phonecode` varchar(255) DEFAULT NULL,
  `capital` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `currency_name` varchar(255) DEFAULT NULL,
  `currency_symbol` varchar(255) DEFAULT NULL,
  `tld` varchar(255) DEFAULT NULL,
  `native` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `subregion` varchar(255) DEFAULT NULL,
  `timezones` text DEFAULT NULL,
  `translations` text DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `emoji` varchar(191) DEFAULT NULL,
  `emojiU` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `flag` tinyint(1) NOT NULL DEFAULT 1,
  `wikiDataId` varchar(255) DEFAULT NULL COMMENT 'Rapid API GeoDB Cities',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Afghanistan','AFG','004','AF','93','Kabul','AFN','Afghan afghani','؋','.af','افغانستان','Asia','Southern Asia','[{\"zoneName\":\"Asia/Kabul\",\"gmtOffset\":16200,\"gmtOffsetName\":\"UTC+04:30\",\"abbreviation\":\"AFT\",\"tzName\":\"Afghanistan Time\"}]','{\"kr\":\"아프가니스탄\",\"br\":\"Afeganistão\",\"pt\":\"Afeganistão\",\"nl\":\"Afghanistan\",\"hr\":\"Afganistan\",\"fa\":\"افغانستان\",\"de\":\"Afghanistan\",\"es\":\"Afganistán\",\"fr\":\"Afghanistan\",\"ja\":\"アフガニスタン\",\"it\":\"Afghanistan\",\"cn\":\"阿富汗\"}',33.00000000,65.00000000,'??','U+1F1E6 U+1F1EB','2018-07-21 01:41:03','2021-12-11 18:19:42',1,'Q889'),(2,'Aland Islands','ALA','248','AX','+358-18','Mariehamn','EUR','Euro','€','.ax','Åland','Europe','Northern Europe','[{\"zoneName\":\"Europe/Mariehamn\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]','{\"kr\":\"올란드 제도\",\"br\":\"Ilhas de Aland\",\"pt\":\"Ilhas de Aland\",\"nl\":\"Ålandeilanden\",\"hr\":\"Ålandski otoci\",\"fa\":\"جزایر الند\",\"de\":\"Åland\",\"es\":\"Alandia\",\"fr\":\"Åland\",\"ja\":\"オーランド諸島\",\"it\":\"Isole Aland\",\"cn\":\"奥兰群岛\"}',60.11666700,19.90000000,'??','U+1F1E6 U+1F1FD','2018-07-21 01:41:03','2021-12-11 18:26:03',1,NULL),(3,'Albania','ALB','008','AL','355','Tirana','ALL','Albanian lek','Lek','.al','Shqipëria','Europe','Southern Europe','[{\"zoneName\":\"Europe/Tirane\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"알바니아\",\"br\":\"Albânia\",\"pt\":\"Albânia\",\"nl\":\"Albanië\",\"hr\":\"Albanija\",\"fa\":\"آلبانی\",\"de\":\"Albanien\",\"es\":\"Albania\",\"fr\":\"Albanie\",\"ja\":\"アルバニア\",\"it\":\"Albania\",\"cn\":\"阿尔巴尼亚\"}',41.00000000,20.00000000,'??','U+1F1E6 U+1F1F1','2018-07-21 01:41:03','2021-12-11 18:20:01',1,'Q222'),(4,'Algeria','DZA','012','DZ','213','Algiers','DZD','Algerian dinar','دج','.dz','الجزائر','Africa','Northern Africa','[{\"zoneName\":\"Africa/Algiers\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"알제리\",\"br\":\"Argélia\",\"pt\":\"Argélia\",\"nl\":\"Algerije\",\"hr\":\"Alžir\",\"fa\":\"الجزایر\",\"de\":\"Algerien\",\"es\":\"Argelia\",\"fr\":\"Algérie\",\"ja\":\"アルジェリア\",\"it\":\"Algeria\",\"cn\":\"阿尔及利亚\"}',28.00000000,3.00000000,'??','U+1F1E9 U+1F1FF','2018-07-21 01:41:03','2021-12-11 18:20:10',1,'Q262'),(5,'American Samoa','ASM','016','AS','+1-684','Pago Pago','USD','US Dollar','$','.as','American Samoa','Oceania','Polynesia','[{\"zoneName\":\"Pacific/Pago_Pago\",\"gmtOffset\":-39600,\"gmtOffsetName\":\"UTC-11:00\",\"abbreviation\":\"SST\",\"tzName\":\"Samoa Standard Time\"}]','{\"kr\":\"아메리칸사모아\",\"br\":\"Samoa Americana\",\"pt\":\"Samoa Americana\",\"nl\":\"Amerikaans Samoa\",\"hr\":\"Američka Samoa\",\"fa\":\"ساموآی آمریکا\",\"de\":\"Amerikanisch-Samoa\",\"es\":\"Samoa Americana\",\"fr\":\"Samoa américaines\",\"ja\":\"アメリカ領サモア\",\"it\":\"Samoa Americane\",\"cn\":\"美属萨摩亚\"}',-14.33333333,-170.00000000,'??','U+1F1E6 U+1F1F8','2018-07-21 01:41:03','2021-12-11 18:25:50',1,NULL),(6,'Andorra','AND','020','AD','376','Andorra la Vella','EUR','Euro','€','.ad','Andorra','Europe','Southern Europe','[{\"zoneName\":\"Europe/Andorra\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"안도라\",\"br\":\"Andorra\",\"pt\":\"Andorra\",\"nl\":\"Andorra\",\"hr\":\"Andora\",\"fa\":\"آندورا\",\"de\":\"Andorra\",\"es\":\"Andorra\",\"fr\":\"Andorre\",\"ja\":\"アンドラ\",\"it\":\"Andorra\",\"cn\":\"安道尔\"}',42.50000000,1.50000000,'??','U+1F1E6 U+1F1E9','2018-07-21 01:41:03','2021-12-11 18:20:22',1,'Q228'),(7,'Angola','AGO','024','AO','244','Luanda','AOA','Angolan kwanza','Kz','.ao','Angola','Africa','Middle Africa','[{\"zoneName\":\"Africa/Luanda\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]','{\"kr\":\"앙골라\",\"br\":\"Angola\",\"pt\":\"Angola\",\"nl\":\"Angola\",\"hr\":\"Angola\",\"fa\":\"آنگولا\",\"de\":\"Angola\",\"es\":\"Angola\",\"fr\":\"Angola\",\"ja\":\"アンゴラ\",\"it\":\"Angola\",\"cn\":\"安哥拉\"}',-12.50000000,18.50000000,'??','U+1F1E6 U+1F1F4','2018-07-21 01:41:03','2021-12-11 18:20:31',1,'Q916'),(8,'Anguilla','AIA','660','AI','+1-264','The Valley','XCD','East Caribbean dollar','$','.ai','Anguilla','Americas','Caribbean','[{\"zoneName\":\"America/Anguilla\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"앵귈라\",\"br\":\"Anguila\",\"pt\":\"Anguila\",\"nl\":\"Anguilla\",\"hr\":\"Angvila\",\"fa\":\"آنگویلا\",\"de\":\"Anguilla\",\"es\":\"Anguilla\",\"fr\":\"Anguilla\",\"ja\":\"アンギラ\",\"it\":\"Anguilla\",\"cn\":\"安圭拉\"}',18.25000000,-63.16666666,'??','U+1F1E6 U+1F1EE','2018-07-21 01:41:03','2021-12-11 18:20:46',1,NULL),(9,'Antarctica','ATA','010','AQ','672','','AAD','Antarctican dollar','$','.aq','Antarctica','Polar','','[{\"zoneName\":\"Antarctica/Casey\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"AWST\",\"tzName\":\"Australian Western Standard Time\"},{\"zoneName\":\"Antarctica/Davis\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"DAVT\",\"tzName\":\"Davis Time\"},{\"zoneName\":\"Antarctica/DumontDUrville\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"DDUT\",\"tzName\":\"Dumont d\'Urville Time\"},{\"zoneName\":\"Antarctica/Mawson\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"MAWT\",\"tzName\":\"Mawson Station Time\"},{\"zoneName\":\"Antarctica/McMurdo\",\"gmtOffset\":46800,\"gmtOffsetName\":\"UTC+13:00\",\"abbreviation\":\"NZDT\",\"tzName\":\"New Zealand Daylight Time\"},{\"zoneName\":\"Antarctica/Palmer\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"CLST\",\"tzName\":\"Chile Summer Time\"},{\"zoneName\":\"Antarctica/Rothera\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ROTT\",\"tzName\":\"Rothera Research Station Time\"},{\"zoneName\":\"Antarctica/Syowa\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"SYOT\",\"tzName\":\"Showa Station Time\"},{\"zoneName\":\"Antarctica/Troll\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"},{\"zoneName\":\"Antarctica/Vostok\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"VOST\",\"tzName\":\"Vostok Station Time\"}]','{\"kr\":\"남극\",\"br\":\"Antártida\",\"pt\":\"Antárctida\",\"nl\":\"Antarctica\",\"hr\":\"Antarktika\",\"fa\":\"جنوبگان\",\"de\":\"Antarktika\",\"es\":\"Antártida\",\"fr\":\"Antarctique\",\"ja\":\"南極大陸\",\"it\":\"Antartide\",\"cn\":\"南极洲\"}',-74.65000000,4.48000000,'??','U+1F1E6 U+1F1F6','2018-07-21 01:41:03','2021-12-11 19:19:17',1,NULL),(10,'Antigua And Barbuda','ATG','028','AG','+1-268','St. John\'s','XCD','Eastern Caribbean dollar','$','.ag','Antigua and Barbuda','Americas','Caribbean','[{\"zoneName\":\"America/Antigua\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"앤티가 바부다\",\"br\":\"Antígua e Barbuda\",\"pt\":\"Antígua e Barbuda\",\"nl\":\"Antigua en Barbuda\",\"hr\":\"Antigva i Barbuda\",\"fa\":\"آنتیگوا و باربودا\",\"de\":\"Antigua und Barbuda\",\"es\":\"Antigua y Barbuda\",\"fr\":\"Antigua-et-Barbuda\",\"ja\":\"アンティグア・バーブーダ\",\"it\":\"Antigua e Barbuda\",\"cn\":\"安提瓜和巴布达\"}',17.05000000,-61.80000000,'??','U+1F1E6 U+1F1EC','2018-07-21 01:41:03','2021-12-11 18:26:34',1,'Q781'),(11,'Argentina','ARG','032','AR','54','Buenos Aires','ARS','Argentine peso','$','.ar','Argentina','Americas','South America','[{\"zoneName\":\"America/Argentina/Buenos_Aires\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Catamarca\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Cordoba\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Jujuy\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/La_Rioja\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Mendoza\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Rio_Gallegos\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Salta\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/San_Juan\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/San_Luis\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Tucuman\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Ushuaia\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"}]','{\"kr\":\"아르헨티나\",\"br\":\"Argentina\",\"pt\":\"Argentina\",\"nl\":\"Argentinië\",\"hr\":\"Argentina\",\"fa\":\"آرژانتین\",\"de\":\"Argentinien\",\"es\":\"Argentina\",\"fr\":\"Argentine\",\"ja\":\"アルゼンチン\",\"it\":\"Argentina\",\"cn\":\"阿根廷\"}',-34.00000000,-64.00000000,'??','U+1F1E6 U+1F1F7','2018-07-21 01:41:03','2021-12-11 18:21:01',1,'Q414'),(12,'Armenia','ARM','051','AM','374','Yerevan','AMD','Armenian dram','֏','.am','Հայաստան','Asia','Western Asia','[{\"zoneName\":\"Asia/Yerevan\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"AMT\",\"tzName\":\"Armenia Time\"}]','{\"kr\":\"아르메니아\",\"br\":\"Armênia\",\"pt\":\"Arménia\",\"nl\":\"Armenië\",\"hr\":\"Armenija\",\"fa\":\"ارمنستان\",\"de\":\"Armenien\",\"es\":\"Armenia\",\"fr\":\"Arménie\",\"ja\":\"アルメニア\",\"it\":\"Armenia\",\"cn\":\"亚美尼亚\"}',40.00000000,45.00000000,'??','U+1F1E6 U+1F1F2','2018-07-21 01:41:03','2021-12-11 18:21:06',1,'Q399'),(13,'Aruba','ABW','533','AW','297','Oranjestad','AWG','Aruban florin','ƒ','.aw','Aruba','Americas','Caribbean','[{\"zoneName\":\"America/Aruba\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"아루바\",\"br\":\"Aruba\",\"pt\":\"Aruba\",\"nl\":\"Aruba\",\"hr\":\"Aruba\",\"fa\":\"آروبا\",\"de\":\"Aruba\",\"es\":\"Aruba\",\"fr\":\"Aruba\",\"ja\":\"アルバ\",\"it\":\"Aruba\",\"cn\":\"阿鲁巴\"}',12.50000000,-69.96666666,'??','U+1F1E6 U+1F1FC','2018-07-21 01:41:03','2021-12-11 18:26:47',1,NULL),(14,'Australia','AUS','036','AU','61','Canberra','AUD','Australian dollar','$','.au','Australia','Oceania','Australia and New Zealand','[{\"zoneName\":\"Antarctica/Macquarie\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"MIST\",\"tzName\":\"Macquarie Island Station Time\"},{\"zoneName\":\"Australia/Adelaide\",\"gmtOffset\":37800,\"gmtOffsetName\":\"UTC+10:30\",\"abbreviation\":\"ACDT\",\"tzName\":\"Australian Central Daylight Saving Time\"},{\"zoneName\":\"Australia/Brisbane\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"AEST\",\"tzName\":\"Australian Eastern Standard Time\"},{\"zoneName\":\"Australia/Broken_Hill\",\"gmtOffset\":37800,\"gmtOffsetName\":\"UTC+10:30\",\"abbreviation\":\"ACDT\",\"tzName\":\"Australian Central Daylight Saving Time\"},{\"zoneName\":\"Australia/Currie\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"AEDT\",\"tzName\":\"Australian Eastern Daylight Saving Time\"},{\"zoneName\":\"Australia/Darwin\",\"gmtOffset\":34200,\"gmtOffsetName\":\"UTC+09:30\",\"abbreviation\":\"ACST\",\"tzName\":\"Australian Central Standard Time\"},{\"zoneName\":\"Australia/Eucla\",\"gmtOffset\":31500,\"gmtOffsetName\":\"UTC+08:45\",\"abbreviation\":\"ACWST\",\"tzName\":\"Australian Central Western Standard Time (Unofficial)\"},{\"zoneName\":\"Australia/Hobart\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"AEDT\",\"tzName\":\"Australian Eastern Daylight Saving Time\"},{\"zoneName\":\"Australia/Lindeman\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"AEST\",\"tzName\":\"Australian Eastern Standard Time\"},{\"zoneName\":\"Australia/Lord_Howe\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"LHST\",\"tzName\":\"Lord Howe Summer Time\"},{\"zoneName\":\"Australia/Melbourne\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"AEDT\",\"tzName\":\"Australian Eastern Daylight Saving Time\"},{\"zoneName\":\"Australia/Perth\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"AWST\",\"tzName\":\"Australian Western Standard Time\"},{\"zoneName\":\"Australia/Sydney\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"AEDT\",\"tzName\":\"Australian Eastern Daylight Saving Time\"}]','{\"kr\":\"호주\",\"br\":\"Austrália\",\"pt\":\"Austrália\",\"nl\":\"Australië\",\"hr\":\"Australija\",\"fa\":\"استرالیا\",\"de\":\"Australien\",\"es\":\"Australia\",\"fr\":\"Australie\",\"ja\":\"オーストラリア\",\"it\":\"Australia\",\"cn\":\"澳大利亚\"}',-27.00000000,133.00000000,'??','U+1F1E6 U+1F1FA','2018-07-21 01:41:03','2021-12-11 18:21:23',1,'Q408'),(15,'Austria','AUT','040','AT','43','Vienna','EUR','Euro','€','.at','Österreich','Europe','Western Europe','[{\"zoneName\":\"Europe/Vienna\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"오스트리아\",\"br\":\"áustria\",\"pt\":\"áustria\",\"nl\":\"Oostenrijk\",\"hr\":\"Austrija\",\"fa\":\"اتریش\",\"de\":\"Österreich\",\"es\":\"Austria\",\"fr\":\"Autriche\",\"ja\":\"オーストリア\",\"it\":\"Austria\",\"cn\":\"奥地利\"}',47.33333333,13.33333333,'??','U+1F1E6 U+1F1F9','2018-07-21 01:41:03','2021-12-11 18:21:35',1,'Q40'),(16,'Azerbaijan','AZE','031','AZ','994','Baku','AZN','Azerbaijani manat','m','.az','Azərbaycan','Asia','Western Asia','[{\"zoneName\":\"Asia/Baku\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"AZT\",\"tzName\":\"Azerbaijan Time\"}]','{\"kr\":\"아제르바이잔\",\"br\":\"Azerbaijão\",\"pt\":\"Azerbaijão\",\"nl\":\"Azerbeidzjan\",\"hr\":\"Azerbajdžan\",\"fa\":\"آذربایجان\",\"de\":\"Aserbaidschan\",\"es\":\"Azerbaiyán\",\"fr\":\"Azerbaïdjan\",\"ja\":\"アゼルバイジャン\",\"it\":\"Azerbaijan\",\"cn\":\"阿塞拜疆\"}',40.50000000,47.50000000,'??','U+1F1E6 U+1F1FF','2018-07-21 01:41:03','2021-12-11 18:21:43',1,'Q227'),(17,'The Bahamas','BHS','044','BS','+1-242','Nassau','BSD','Bahamian dollar','B$','.bs','Bahamas','Americas','Caribbean','[{\"zoneName\":\"America/Nassau\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America)\"}]','{\"kr\":\"바하마\",\"br\":\"Bahamas\",\"pt\":\"Baamas\",\"nl\":\"Bahama’s\",\"hr\":\"Bahami\",\"fa\":\"باهاما\",\"de\":\"Bahamas\",\"es\":\"Bahamas\",\"fr\":\"Bahamas\",\"ja\":\"バハマ\",\"it\":\"Bahamas\",\"cn\":\"巴哈马\"}',24.25000000,-76.00000000,'??','U+1F1E7 U+1F1F8','2018-07-21 01:41:03','2022-03-13 16:28:29',1,'Q778'),(18,'Bahrain','BHR','048','BH','973','Manama','BHD','Bahraini dinar','.د.ب','.bh','‏البحرين','Asia','Western Asia','[{\"zoneName\":\"Asia/Bahrain\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]','{\"kr\":\"바레인\",\"br\":\"Bahrein\",\"pt\":\"Barém\",\"nl\":\"Bahrein\",\"hr\":\"Bahrein\",\"fa\":\"بحرین\",\"de\":\"Bahrain\",\"es\":\"Bahrein\",\"fr\":\"Bahreïn\",\"ja\":\"バーレーン\",\"it\":\"Bahrein\",\"cn\":\"巴林\"}',26.00000000,50.55000000,'??','U+1F1E7 U+1F1ED','2018-07-21 01:41:03','2021-12-11 18:21:58',1,'Q398'),(19,'Bangladesh','BGD','050','BD','880','Dhaka','BDT','Bangladeshi taka','৳','.bd','Bangladesh','Asia','Southern Asia','[{\"zoneName\":\"Asia/Dhaka\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"BDT\",\"tzName\":\"Bangladesh Standard Time\"}]','{\"kr\":\"방글라데시\",\"br\":\"Bangladesh\",\"pt\":\"Bangladeche\",\"nl\":\"Bangladesh\",\"hr\":\"Bangladeš\",\"fa\":\"بنگلادش\",\"de\":\"Bangladesch\",\"es\":\"Bangladesh\",\"fr\":\"Bangladesh\",\"ja\":\"バングラデシュ\",\"it\":\"Bangladesh\",\"cn\":\"孟加拉\"}',24.00000000,90.00000000,'??','U+1F1E7 U+1F1E9','2018-07-21 01:41:03','2021-12-11 18:22:04',1,'Q902'),(20,'Barbados','BRB','052','BB','+1-246','Bridgetown','BBD','Barbadian dollar','Bds$','.bb','Barbados','Americas','Caribbean','[{\"zoneName\":\"America/Barbados\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"바베이도스\",\"br\":\"Barbados\",\"pt\":\"Barbados\",\"nl\":\"Barbados\",\"hr\":\"Barbados\",\"fa\":\"باربادوس\",\"de\":\"Barbados\",\"es\":\"Barbados\",\"fr\":\"Barbade\",\"ja\":\"バルバドス\",\"it\":\"Barbados\",\"cn\":\"巴巴多斯\"}',13.16666666,-59.53333333,'??','U+1F1E7 U+1F1E7','2018-07-21 01:41:03','2021-12-11 18:27:03',1,'Q244'),(21,'Belarus','BLR','112','BY','375','Minsk','BYN','Belarusian ruble','Br','.by','Белару́сь','Europe','Eastern Europe','[{\"zoneName\":\"Europe/Minsk\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"MSK\",\"tzName\":\"Moscow Time\"}]','{\"kr\":\"벨라루스\",\"br\":\"Bielorrússia\",\"pt\":\"Bielorrússia\",\"nl\":\"Wit-Rusland\",\"hr\":\"Bjelorusija\",\"fa\":\"بلاروس\",\"de\":\"Weißrussland\",\"es\":\"Bielorrusia\",\"fr\":\"Biélorussie\",\"ja\":\"ベラルーシ\",\"it\":\"Bielorussia\",\"cn\":\"白俄罗斯\"}',53.00000000,28.00000000,'??','U+1F1E7 U+1F1FE','2018-07-21 01:41:03','2021-12-11 18:27:09',1,'Q184'),(22,'Belgium','BEL','056','BE','32','Brussels','EUR','Euro','€','.be','België','Europe','Western Europe','[{\"zoneName\":\"Europe/Brussels\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"벨기에\",\"br\":\"Bélgica\",\"pt\":\"Bélgica\",\"nl\":\"België\",\"hr\":\"Belgija\",\"fa\":\"بلژیک\",\"de\":\"Belgien\",\"es\":\"Bélgica\",\"fr\":\"Belgique\",\"ja\":\"ベルギー\",\"it\":\"Belgio\",\"cn\":\"比利时\"}',50.83333333,4.00000000,'??','U+1F1E7 U+1F1EA','2018-07-21 01:41:03','2021-12-11 18:27:15',1,'Q31'),(23,'Belize','BLZ','084','BZ','501','Belmopan','BZD','Belize dollar','$','.bz','Belize','Americas','Central America','[{\"zoneName\":\"America/Belize\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America)\"}]','{\"kr\":\"벨리즈\",\"br\":\"Belize\",\"pt\":\"Belize\",\"nl\":\"Belize\",\"hr\":\"Belize\",\"fa\":\"بلیز\",\"de\":\"Belize\",\"es\":\"Belice\",\"fr\":\"Belize\",\"ja\":\"ベリーズ\",\"it\":\"Belize\",\"cn\":\"伯利兹\"}',17.25000000,-88.75000000,'??','U+1F1E7 U+1F1FF','2018-07-21 01:41:03','2021-12-11 18:27:21',1,'Q242'),(24,'Benin','BEN','204','BJ','229','Porto-Novo','XOF','West African CFA franc','CFA','.bj','Bénin','Africa','Western Africa','[{\"zoneName\":\"Africa/Porto-Novo\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]','{\"kr\":\"베냉\",\"br\":\"Benin\",\"pt\":\"Benim\",\"nl\":\"Benin\",\"hr\":\"Benin\",\"fa\":\"بنین\",\"de\":\"Benin\",\"es\":\"Benín\",\"fr\":\"Bénin\",\"ja\":\"ベナン\",\"it\":\"Benin\",\"cn\":\"贝宁\"}',9.50000000,2.25000000,'??','U+1F1E7 U+1F1EF','2018-07-21 01:41:03','2021-12-11 18:27:27',1,'Q962'),(25,'Bermuda','BMU','060','BM','+1-441','Hamilton','BMD','Bermudian dollar','$','.bm','Bermuda','Americas','Northern America','[{\"zoneName\":\"Atlantic/Bermuda\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"버뮤다\",\"br\":\"Bermudas\",\"pt\":\"Bermudas\",\"nl\":\"Bermuda\",\"hr\":\"Bermudi\",\"fa\":\"برمودا\",\"de\":\"Bermuda\",\"es\":\"Bermudas\",\"fr\":\"Bermudes\",\"ja\":\"バミューダ\",\"it\":\"Bermuda\",\"cn\":\"百慕大\"}',32.33333333,-64.75000000,'??','U+1F1E7 U+1F1F2','2018-07-21 01:41:03','2021-12-11 18:27:32',1,NULL),(26,'Bhutan','BTN','064','BT','975','Thimphu','BTN','Bhutanese ngultrum','Nu.','.bt','ʼbrug-yul','Asia','Southern Asia','[{\"zoneName\":\"Asia/Thimphu\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"BTT\",\"tzName\":\"Bhutan Time\"}]','{\"kr\":\"부탄\",\"br\":\"Butão\",\"pt\":\"Butão\",\"nl\":\"Bhutan\",\"hr\":\"Butan\",\"fa\":\"بوتان\",\"de\":\"Bhutan\",\"es\":\"Bután\",\"fr\":\"Bhoutan\",\"ja\":\"ブータン\",\"it\":\"Bhutan\",\"cn\":\"不丹\"}',27.50000000,90.50000000,'??','U+1F1E7 U+1F1F9','2018-07-21 01:41:03','2021-12-11 18:27:38',1,'Q917'),(27,'Bolivia','BOL','068','BO','591','Sucre','BOB','Bolivian boliviano','Bs.','.bo','Bolivia','Americas','South America','[{\"zoneName\":\"America/La_Paz\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"BOT\",\"tzName\":\"Bolivia Time\"}]','{\"kr\":\"볼리비아\",\"br\":\"Bolívia\",\"pt\":\"Bolívia\",\"nl\":\"Bolivia\",\"hr\":\"Bolivija\",\"fa\":\"بولیوی\",\"de\":\"Bolivien\",\"es\":\"Bolivia\",\"fr\":\"Bolivie\",\"ja\":\"ボリビア多民族国\",\"it\":\"Bolivia\",\"cn\":\"玻利维亚\"}',-17.00000000,-65.00000000,'??','U+1F1E7 U+1F1F4','2018-07-21 01:41:03','2021-12-11 18:27:50',1,'Q750'),(28,'Bosnia and Herzegovina','BIH','070','BA','387','Sarajevo','BAM','Bosnia and Herzegovina convertible mark','KM','.ba','Bosna i Hercegovina','Europe','Southern Europe','[{\"zoneName\":\"Europe/Sarajevo\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"보스니아 헤르체고비나\",\"br\":\"Bósnia e Herzegovina\",\"pt\":\"Bósnia e Herzegovina\",\"nl\":\"Bosnië en Herzegovina\",\"hr\":\"Bosna i Hercegovina\",\"fa\":\"بوسنی و هرزگوین\",\"de\":\"Bosnien und Herzegowina\",\"es\":\"Bosnia y Herzegovina\",\"fr\":\"Bosnie-Herzégovine\",\"ja\":\"ボスニア・ヘルツェゴビナ\",\"it\":\"Bosnia ed Erzegovina\",\"cn\":\"波斯尼亚和黑塞哥维那\"}',44.00000000,18.00000000,'??','U+1F1E7 U+1F1E6','2018-07-21 01:41:03','2021-12-11 18:28:10',1,'Q225'),(29,'Botswana','BWA','072','BW','267','Gaborone','BWP','Botswana pula','P','.bw','Botswana','Africa','Southern Africa','[{\"zoneName\":\"Africa/Gaborone\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]','{\"kr\":\"보츠와나\",\"br\":\"Botsuana\",\"pt\":\"Botsuana\",\"nl\":\"Botswana\",\"hr\":\"Bocvana\",\"fa\":\"بوتسوانا\",\"de\":\"Botswana\",\"es\":\"Botswana\",\"fr\":\"Botswana\",\"ja\":\"ボツワナ\",\"it\":\"Botswana\",\"cn\":\"博茨瓦纳\"}',-22.00000000,24.00000000,'??','U+1F1E7 U+1F1FC','2018-07-21 01:41:03','2021-12-11 18:28:22',1,'Q963'),(30,'Bouvet Island','BVT','074','BV','0055','','NOK','Norwegian Krone','kr','.bv','Bouvetøya','','','[{\"zoneName\":\"Europe/Oslo\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"부벳 섬\",\"br\":\"Ilha Bouvet\",\"pt\":\"Ilha Bouvet\",\"nl\":\"Bouveteiland\",\"hr\":\"Otok Bouvet\",\"fa\":\"جزیره بووه\",\"de\":\"Bouvetinsel\",\"es\":\"Isla Bouvet\",\"fr\":\"Île Bouvet\",\"ja\":\"ブーベ島\",\"it\":\"Isola Bouvet\",\"cn\":\"布维岛\"}',-54.43333333,3.40000000,'??','U+1F1E7 U+1F1FB','2018-07-21 01:41:03','2021-12-11 19:17:50',1,NULL),(31,'Brazil','BRA','076','BR','55','Brasilia','BRL','Brazilian real','R$','.br','Brasil','Americas','South America','[{\"zoneName\":\"America/Araguaina\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Brasília Time\"},{\"zoneName\":\"America/Bahia\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Brasília Time\"},{\"zoneName\":\"America/Belem\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Brasília Time\"},{\"zoneName\":\"America/Boa_Vista\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AMT\",\"tzName\":\"Amazon Time (Brazil)[3\"},{\"zoneName\":\"America/Campo_Grande\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AMT\",\"tzName\":\"Amazon Time (Brazil)[3\"},{\"zoneName\":\"America/Cuiaba\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Brasilia Time\"},{\"zoneName\":\"America/Eirunepe\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"ACT\",\"tzName\":\"Acre Time\"},{\"zoneName\":\"America/Fortaleza\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Brasília Time\"},{\"zoneName\":\"America/Maceio\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Brasília Time\"},{\"zoneName\":\"America/Manaus\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AMT\",\"tzName\":\"Amazon Time (Brazil)\"},{\"zoneName\":\"America/Noronha\",\"gmtOffset\":-7200,\"gmtOffsetName\":\"UTC-02:00\",\"abbreviation\":\"FNT\",\"tzName\":\"Fernando de Noronha Time\"},{\"zoneName\":\"America/Porto_Velho\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AMT\",\"tzName\":\"Amazon Time (Brazil)[3\"},{\"zoneName\":\"America/Recife\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Brasília Time\"},{\"zoneName\":\"America/Rio_Branco\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"ACT\",\"tzName\":\"Acre Time\"},{\"zoneName\":\"America/Santarem\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Brasília Time\"},{\"zoneName\":\"America/Sao_Paulo\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Brasília Time\"}]','{\"kr\":\"브라질\",\"br\":\"Brasil\",\"pt\":\"Brasil\",\"nl\":\"Brazilië\",\"hr\":\"Brazil\",\"fa\":\"برزیل\",\"de\":\"Brasilien\",\"es\":\"Brasil\",\"fr\":\"Brésil\",\"ja\":\"ブラジル\",\"it\":\"Brasile\",\"cn\":\"巴西\"}',-10.00000000,-55.00000000,'??','U+1F1E7 U+1F1F7','2018-07-21 01:41:03','2021-12-11 18:28:56',1,'Q155'),(32,'British Indian Ocean Territory','IOT','086','IO','246','Diego Garcia','USD','United States dollar','$','.io','British Indian Ocean Territory','Africa','Eastern Africa','[{\"zoneName\":\"Indian/Chagos\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"IOT\",\"tzName\":\"Indian Ocean Time\"}]','{\"kr\":\"영국령 인도양 지역\",\"br\":\"Território Britânico do Oceano íÍdico\",\"pt\":\"Território Britânico do Oceano Índico\",\"nl\":\"Britse Gebieden in de Indische Oceaan\",\"hr\":\"Britanski Indijskooceanski teritorij\",\"fa\":\"قلمرو بریتانیا در اقیانوس هند\",\"de\":\"Britisches Territorium im Indischen Ozean\",\"es\":\"Territorio Británico del Océano Índico\",\"fr\":\"Territoire britannique de l\'océan Indien\",\"ja\":\"イギリス領インド洋地域\",\"it\":\"Territorio britannico dell\'oceano indiano\",\"cn\":\"英属印度洋领地\"}',-6.00000000,71.50000000,'??','U+1F1EE U+1F1F4','2018-07-21 01:41:03','2021-12-11 18:29:10',1,NULL),(33,'Brunei','BRN','096','BN','673','Bandar Seri Begawan','BND','Brunei dollar','B$','.bn','Negara Brunei Darussalam','Asia','South-Eastern Asia','[{\"zoneName\":\"Asia/Brunei\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"BNT\",\"tzName\":\"Brunei Darussalam Time\"}]','{\"kr\":\"브루나이\",\"br\":\"Brunei\",\"pt\":\"Brunei\",\"nl\":\"Brunei\",\"hr\":\"Brunej\",\"fa\":\"برونئی\",\"de\":\"Brunei\",\"es\":\"Brunei\",\"fr\":\"Brunei\",\"ja\":\"ブルネイ・ダルサラーム\",\"it\":\"Brunei\",\"cn\":\"文莱\"}',4.50000000,114.66666666,'??','U+1F1E7 U+1F1F3','2018-07-21 01:41:03','2021-12-11 18:29:19',1,'Q921'),(34,'Bulgaria','BGR','100','BG','359','Sofia','BGN','Bulgarian lev','Лв.','.bg','България','Europe','Eastern Europe','[{\"zoneName\":\"Europe/Sofia\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]','{\"kr\":\"불가리아\",\"br\":\"Bulgária\",\"pt\":\"Bulgária\",\"nl\":\"Bulgarije\",\"hr\":\"Bugarska\",\"fa\":\"بلغارستان\",\"de\":\"Bulgarien\",\"es\":\"Bulgaria\",\"fr\":\"Bulgarie\",\"ja\":\"ブルガリア\",\"it\":\"Bulgaria\",\"cn\":\"保加利亚\"}',43.00000000,25.00000000,'??','U+1F1E7 U+1F1EC','2018-07-21 01:41:03','2021-12-11 18:29:26',1,'Q219'),(35,'Burkina Faso','BFA','854','BF','226','Ouagadougou','XOF','West African CFA franc','CFA','.bf','Burkina Faso','Africa','Western Africa','[{\"zoneName\":\"Africa/Ouagadougou\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]','{\"kr\":\"부르키나 파소\",\"br\":\"Burkina Faso\",\"pt\":\"Burquina Faso\",\"nl\":\"Burkina Faso\",\"hr\":\"Burkina Faso\",\"fa\":\"بورکینافاسو\",\"de\":\"Burkina Faso\",\"es\":\"Burkina Faso\",\"fr\":\"Burkina Faso\",\"ja\":\"ブルキナファソ\",\"it\":\"Burkina Faso\",\"cn\":\"布基纳法索\"}',13.00000000,-2.00000000,'??','U+1F1E7 U+1F1EB','2018-07-21 01:41:03','2021-12-11 18:29:35',1,'Q965'),(36,'Burundi','BDI','108','BI','257','Bujumbura','BIF','Burundian franc','FBu','.bi','Burundi','Africa','Eastern Africa','[{\"zoneName\":\"Africa/Bujumbura\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]','{\"kr\":\"부룬디\",\"br\":\"Burundi\",\"pt\":\"Burúndi\",\"nl\":\"Burundi\",\"hr\":\"Burundi\",\"fa\":\"بوروندی\",\"de\":\"Burundi\",\"es\":\"Burundi\",\"fr\":\"Burundi\",\"ja\":\"ブルンジ\",\"it\":\"Burundi\",\"cn\":\"布隆迪\"}',-3.50000000,30.00000000,'??','U+1F1E7 U+1F1EE','2018-07-21 01:41:03','2021-12-11 18:29:42',1,'Q967'),(37,'Cambodia','KHM','116','KH','855','Phnom Penh','KHR','Cambodian riel','KHR','.kh','Kâmpŭchéa','Asia','South-Eastern Asia','[{\"zoneName\":\"Asia/Phnom_Penh\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"ICT\",\"tzName\":\"Indochina Time\"}]','{\"kr\":\"캄보디아\",\"br\":\"Camboja\",\"pt\":\"Camboja\",\"nl\":\"Cambodja\",\"hr\":\"Kambodža\",\"fa\":\"کامبوج\",\"de\":\"Kambodscha\",\"es\":\"Camboya\",\"fr\":\"Cambodge\",\"ja\":\"カンボジア\",\"it\":\"Cambogia\",\"cn\":\"柬埔寨\"}',13.00000000,105.00000000,'??','U+1F1F0 U+1F1ED','2018-07-21 01:41:03','2021-12-11 18:29:47',1,'Q424'),(38,'Cameroon','CMR','120','CM','237','Yaounde','XAF','Central African CFA franc','FCFA','.cm','Cameroon','Africa','Middle Africa','[{\"zoneName\":\"Africa/Douala\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]','{\"kr\":\"카메룬\",\"br\":\"Camarões\",\"pt\":\"Camarões\",\"nl\":\"Kameroen\",\"hr\":\"Kamerun\",\"fa\":\"کامرون\",\"de\":\"Kamerun\",\"es\":\"Camerún\",\"fr\":\"Cameroun\",\"ja\":\"カメルーン\",\"it\":\"Camerun\",\"cn\":\"喀麦隆\"}',6.00000000,12.00000000,'??','U+1F1E8 U+1F1F2','2018-07-21 01:41:03','2021-12-11 18:29:54',1,'Q1009'),(39,'Canada','CAN','124','CA','1','Ottawa','CAD','Canadian dollar','$','.ca','Canada','Americas','Northern America','[{\"zoneName\":\"America/Atikokan\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America)\"},{\"zoneName\":\"America/Blanc-Sablon\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"},{\"zoneName\":\"America/Cambridge_Bay\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Creston\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Dawson\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Dawson_Creek\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Edmonton\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Fort_Nelson\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Glace_Bay\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"},{\"zoneName\":\"America/Goose_Bay\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"},{\"zoneName\":\"America/Halifax\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"},{\"zoneName\":\"America/Inuvik\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Iqaluit\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Moncton\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"},{\"zoneName\":\"America/Nipigon\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Pangnirtung\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Rainy_River\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Rankin_Inlet\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Regina\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Resolute\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/St_Johns\",\"gmtOffset\":-12600,\"gmtOffsetName\":\"UTC-03:30\",\"abbreviation\":\"NST\",\"tzName\":\"Newfoundland Standard Time\"},{\"zoneName\":\"America/Swift_Current\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Thunder_Bay\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Toronto\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Vancouver\",\"gmtOffset\":-28800,\"gmtOffsetName\":\"UTC-08:00\",\"abbreviation\":\"PST\",\"tzName\":\"Pacific Standard Time (North America\"},{\"zoneName\":\"America/Whitehorse\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Winnipeg\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Yellowknife\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"}]','{\"kr\":\"캐나다\",\"br\":\"Canadá\",\"pt\":\"Canadá\",\"nl\":\"Canada\",\"hr\":\"Kanada\",\"fa\":\"کانادا\",\"de\":\"Kanada\",\"es\":\"Canadá\",\"fr\":\"Canada\",\"ja\":\"カナダ\",\"it\":\"Canada\",\"cn\":\"加拿大\"}',60.00000000,-95.00000000,'??','U+1F1E8 U+1F1E6','2018-07-21 01:41:03','2021-12-11 18:29:58',1,'Q16'),(40,'Cape Verde','CPV','132','CV','238','Praia','CVE','Cape Verdean escudo','$','.cv','Cabo Verde','Africa','Western Africa','[{\"zoneName\":\"Atlantic/Cape_Verde\",\"gmtOffset\":-3600,\"gmtOffsetName\":\"UTC-01:00\",\"abbreviation\":\"CVT\",\"tzName\":\"Cape Verde Time\"}]','{\"kr\":\"카보베르데\",\"br\":\"Cabo Verde\",\"pt\":\"Cabo Verde\",\"nl\":\"Kaapverdië\",\"hr\":\"Zelenortska Republika\",\"fa\":\"کیپ ورد\",\"de\":\"Kap Verde\",\"es\":\"Cabo Verde\",\"fr\":\"Cap Vert\",\"ja\":\"カーボベルデ\",\"it\":\"Capo Verde\",\"cn\":\"佛得角\"}',16.00000000,-24.00000000,'??','U+1F1E8 U+1F1FB','2018-07-21 01:41:03','2021-12-11 18:30:03',1,'Q1011'),(41,'Cayman Islands','CYM','136','KY','+1-345','George Town','KYD','Cayman Islands dollar','$','.ky','Cayman Islands','Americas','Caribbean','[{\"zoneName\":\"America/Cayman\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"}]','{\"kr\":\"케이먼 제도\",\"br\":\"Ilhas Cayman\",\"pt\":\"Ilhas Caimão\",\"nl\":\"Caymaneilanden\",\"hr\":\"Kajmanski otoci\",\"fa\":\"جزایر کیمن\",\"de\":\"Kaimaninseln\",\"es\":\"Islas Caimán\",\"fr\":\"Îles Caïmans\",\"ja\":\"ケイマン諸島\",\"it\":\"Isole Cayman\",\"cn\":\"开曼群岛\"}',19.50000000,-80.50000000,'??','U+1F1F0 U+1F1FE','2018-07-21 01:41:03','2021-12-11 18:30:09',1,NULL),(42,'Central African Republic','CAF','140','CF','236','Bangui','XAF','Central African CFA franc','FCFA','.cf','Ködörösêse tî Bêafrîka','Africa','Middle Africa','[{\"zoneName\":\"Africa/Bangui\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]','{\"kr\":\"중앙아프리카 공화국\",\"br\":\"República Centro-Africana\",\"pt\":\"República Centro-Africana\",\"nl\":\"Centraal-Afrikaanse Republiek\",\"hr\":\"Srednjoafrička Republika\",\"fa\":\"جمهوری آفریقای مرکزی\",\"de\":\"Zentralafrikanische Republik\",\"es\":\"República Centroafricana\",\"fr\":\"République centrafricaine\",\"ja\":\"中央アフリカ共和国\",\"it\":\"Repubblica Centrafricana\",\"cn\":\"中非\"}',7.00000000,21.00000000,'??','U+1F1E8 U+1F1EB','2018-07-21 01:41:03','2021-12-11 18:30:14',1,'Q929'),(43,'Chad','TCD','148','TD','235','N\'Djamena','XAF','Central African CFA franc','FCFA','.td','Tchad','Africa','Middle Africa','[{\"zoneName\":\"Africa/Ndjamena\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]','{\"kr\":\"차드\",\"br\":\"Chade\",\"pt\":\"Chade\",\"nl\":\"Tsjaad\",\"hr\":\"Čad\",\"fa\":\"چاد\",\"de\":\"Tschad\",\"es\":\"Chad\",\"fr\":\"Tchad\",\"ja\":\"チャド\",\"it\":\"Ciad\",\"cn\":\"乍得\"}',15.00000000,19.00000000,'??','U+1F1F9 U+1F1E9','2018-07-21 01:41:03','2021-12-11 18:30:21',1,'Q657'),(44,'Chile','CHL','152','CL','56','Santiago','CLP','Chilean peso','$','.cl','Chile','Americas','South America','[{\"zoneName\":\"America/Punta_Arenas\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"CLST\",\"tzName\":\"Chile Summer Time\"},{\"zoneName\":\"America/Santiago\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"CLST\",\"tzName\":\"Chile Summer Time\"},{\"zoneName\":\"Pacific/Easter\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EASST\",\"tzName\":\"Easter Island Summer Time\"}]','{\"kr\":\"칠리\",\"br\":\"Chile\",\"pt\":\"Chile\",\"nl\":\"Chili\",\"hr\":\"Čile\",\"fa\":\"شیلی\",\"de\":\"Chile\",\"es\":\"Chile\",\"fr\":\"Chili\",\"ja\":\"チリ\",\"it\":\"Cile\",\"cn\":\"智利\"}',-30.00000000,-71.00000000,'??','U+1F1E8 U+1F1F1','2018-07-21 01:41:03','2021-12-11 18:30:28',1,'Q298'),(45,'China','CHN','156','CN','86','Beijing','CNY','Chinese yuan','¥','.cn','中国','Asia','Eastern Asia','[{\"zoneName\":\"Asia/Shanghai\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"CST\",\"tzName\":\"China Standard Time\"},{\"zoneName\":\"Asia/Urumqi\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"XJT\",\"tzName\":\"China Standard Time\"}]','{\"kr\":\"중국\",\"br\":\"China\",\"pt\":\"China\",\"nl\":\"China\",\"hr\":\"Kina\",\"fa\":\"چین\",\"de\":\"China\",\"es\":\"China\",\"fr\":\"Chine\",\"ja\":\"中国\",\"it\":\"Cina\",\"cn\":\"中国\"}',35.00000000,105.00000000,'??','U+1F1E8 U+1F1F3','2018-07-21 01:41:03','2021-12-11 18:30:33',1,'Q148'),(46,'Christmas Island','CXR','162','CX','61','Flying Fish Cove','AUD','Australian dollar','$','.cx','Christmas Island','Oceania','Australia and New Zealand','[{\"zoneName\":\"Indian/Christmas\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"CXT\",\"tzName\":\"Christmas Island Time\"}]','{\"kr\":\"크리스마스 섬\",\"br\":\"Ilha Christmas\",\"pt\":\"Ilha do Natal\",\"nl\":\"Christmaseiland\",\"hr\":\"Božićni otok\",\"fa\":\"جزیره کریسمس\",\"de\":\"Weihnachtsinsel\",\"es\":\"Isla de Navidad\",\"fr\":\"Île Christmas\",\"ja\":\"クリスマス島\",\"it\":\"Isola di Natale\",\"cn\":\"圣诞岛\"}',-10.50000000,105.66666666,'??','U+1F1E8 U+1F1FD','2018-07-21 01:41:03','2021-12-11 19:18:01',1,NULL),(47,'Cocos (Keeling) Islands','CCK','166','CC','61','West Island','AUD','Australian dollar','$','.cc','Cocos (Keeling) Islands','Oceania','Australia and New Zealand','[{\"zoneName\":\"Indian/Cocos\",\"gmtOffset\":23400,\"gmtOffsetName\":\"UTC+06:30\",\"abbreviation\":\"CCT\",\"tzName\":\"Cocos Islands Time\"}]','{\"kr\":\"코코스 제도\",\"br\":\"Ilhas Cocos\",\"pt\":\"Ilhas dos Cocos\",\"nl\":\"Cocoseilanden\",\"hr\":\"Kokosovi Otoci\",\"fa\":\"جزایر کوکوس\",\"de\":\"Kokosinseln\",\"es\":\"Islas Cocos o Islas Keeling\",\"fr\":\"Îles Cocos\",\"ja\":\"ココス（キーリング）諸島\",\"it\":\"Isole Cocos e Keeling\",\"cn\":\"科科斯（基林）群岛\"}',-12.50000000,96.83333333,'??','U+1F1E8 U+1F1E8','2018-07-21 01:41:03','2021-12-11 19:18:14',1,NULL),(48,'Colombia','COL','170','CO','57','Bogotá','COP','Colombian peso','$','.co','Colombia','Americas','South America','[{\"zoneName\":\"America/Bogota\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"COT\",\"tzName\":\"Colombia Time\"}]','{\"kr\":\"콜롬비아\",\"br\":\"Colômbia\",\"pt\":\"Colômbia\",\"nl\":\"Colombia\",\"hr\":\"Kolumbija\",\"fa\":\"کلمبیا\",\"de\":\"Kolumbien\",\"es\":\"Colombia\",\"fr\":\"Colombie\",\"ja\":\"コロンビア\",\"it\":\"Colombia\",\"cn\":\"哥伦比亚\"}',4.00000000,-72.00000000,'??','U+1F1E8 U+1F1F4','2018-07-21 01:41:03','2022-01-22 12:56:05',1,'Q739'),(49,'Comoros','COM','174','KM','269','Moroni','KMF','Comorian franc','CF','.km','Komori','Africa','Eastern Africa','[{\"zoneName\":\"Indian/Comoro\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]','{\"kr\":\"코모로\",\"br\":\"Comores\",\"pt\":\"Comores\",\"nl\":\"Comoren\",\"hr\":\"Komori\",\"fa\":\"کومور\",\"de\":\"Union der Komoren\",\"es\":\"Comoras\",\"fr\":\"Comores\",\"ja\":\"コモロ\",\"it\":\"Comore\",\"cn\":\"科摩罗\"}',-12.16666666,44.25000000,'??','U+1F1F0 U+1F1F2','2018-07-21 01:41:03','2021-12-11 18:30:50',1,'Q970'),(50,'Congo','COG','178','CG','242','Brazzaville','XAF','Central African CFA franc','FC','.cg','République du Congo','Africa','Middle Africa','[{\"zoneName\":\"Africa/Brazzaville\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]','{\"kr\":\"콩고\",\"br\":\"Congo\",\"pt\":\"Congo\",\"nl\":\"Congo [Republiek]\",\"hr\":\"Kongo\",\"fa\":\"کنگو\",\"de\":\"Kongo\",\"es\":\"Congo\",\"fr\":\"Congo\",\"ja\":\"コンゴ共和国\",\"it\":\"Congo\",\"cn\":\"刚果\"}',-1.00000000,15.00000000,'??','U+1F1E8 U+1F1EC','2018-07-21 01:41:03','2021-12-11 18:31:09',1,'Q971'),(51,'Democratic Republic of the Congo','COD','180','CD','243','Kinshasa','CDF','Congolese Franc','FC','.cd','République démocratique du Congo','Africa','Middle Africa','[{\"zoneName\":\"Africa/Kinshasa\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"},{\"zoneName\":\"Africa/Lubumbashi\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]','{\"kr\":\"콩고 민주 공화국\",\"br\":\"RD Congo\",\"pt\":\"RD Congo\",\"nl\":\"Congo [DRC]\",\"hr\":\"Kongo, Demokratska Republika\",\"fa\":\"جمهوری کنگو\",\"de\":\"Kongo (Dem. Rep.)\",\"es\":\"Congo (Rep. Dem.)\",\"fr\":\"Congo (Rép. dém.)\",\"ja\":\"コンゴ民主共和国\",\"it\":\"Congo (Rep. Dem.)\",\"cn\":\"刚果（金）\"}',0.00000000,25.00000000,'??','U+1F1E8 U+1F1E9','2018-07-21 01:41:03','2021-12-11 19:18:42',1,'Q974'),(52,'Cook Islands','COK','184','CK','682','Avarua','NZD','Cook Islands dollar','$','.ck','Cook Islands','Oceania','Polynesia','[{\"zoneName\":\"Pacific/Rarotonga\",\"gmtOffset\":-36000,\"gmtOffsetName\":\"UTC-10:00\",\"abbreviation\":\"CKT\",\"tzName\":\"Cook Island Time\"}]','{\"kr\":\"쿡 제도\",\"br\":\"Ilhas Cook\",\"pt\":\"Ilhas Cook\",\"nl\":\"Cookeilanden\",\"hr\":\"Cookovo Otočje\",\"fa\":\"جزایر کوک\",\"de\":\"Cookinseln\",\"es\":\"Islas Cook\",\"fr\":\"Îles Cook\",\"ja\":\"クック諸島\",\"it\":\"Isole Cook\",\"cn\":\"库克群岛\"}',-21.23333333,-159.76666666,'??','U+1F1E8 U+1F1F0','2018-07-21 01:41:03','2021-12-11 18:31:15',1,'Q26988'),(53,'Costa Rica','CRI','188','CR','506','San Jose','CRC','Costa Rican colón','₡','.cr','Costa Rica','Americas','Central America','[{\"zoneName\":\"America/Costa_Rica\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"}]','{\"kr\":\"코스타리카\",\"br\":\"Costa Rica\",\"pt\":\"Costa Rica\",\"nl\":\"Costa Rica\",\"hr\":\"Kostarika\",\"fa\":\"کاستاریکا\",\"de\":\"Costa Rica\",\"es\":\"Costa Rica\",\"fr\":\"Costa Rica\",\"ja\":\"コスタリカ\",\"it\":\"Costa Rica\",\"cn\":\"哥斯达黎加\"}',10.00000000,-84.00000000,'??','U+1F1E8 U+1F1F7','2018-07-21 01:41:03','2021-12-11 18:31:20',1,'Q800'),(54,'Cote D\'Ivoire (Ivory Coast)','CIV','384','CI','225','Yamoussoukro','XOF','West African CFA franc','CFA','.ci',NULL,'Africa','Western Africa','[{\"zoneName\":\"Africa/Abidjan\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]','{\"kr\":\"코트디부아르\",\"br\":\"Costa do Marfim\",\"pt\":\"Costa do Marfim\",\"nl\":\"Ivoorkust\",\"hr\":\"Obala Bjelokosti\",\"fa\":\"ساحل عاج\",\"de\":\"Elfenbeinküste\",\"es\":\"Costa de Marfil\",\"fr\":\"Côte d\'Ivoire\",\"ja\":\"コートジボワール\",\"it\":\"Costa D\'Avorio\",\"cn\":\"科特迪瓦\"}',8.00000000,-5.00000000,'??','U+1F1E8 U+1F1EE','2018-07-21 01:41:03','2021-12-11 18:31:26',1,'Q1008'),(55,'Croatia','HRV','191','HR','385','Zagreb','HRK','Croatian kuna','kn','.hr','Hrvatska','Europe','Southern Europe','[{\"zoneName\":\"Europe/Zagreb\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"크로아티아\",\"br\":\"Croácia\",\"pt\":\"Croácia\",\"nl\":\"Kroatië\",\"hr\":\"Hrvatska\",\"fa\":\"کرواسی\",\"de\":\"Kroatien\",\"es\":\"Croacia\",\"fr\":\"Croatie\",\"ja\":\"クロアチア\",\"it\":\"Croazia\",\"cn\":\"克罗地亚\"}',45.16666666,15.50000000,'??','U+1F1ED U+1F1F7','2018-07-21 01:41:03','2021-12-11 18:31:33',1,'Q224'),(56,'Cuba','CUB','192','CU','53','Havana','CUP','Cuban peso','$','.cu','Cuba','Americas','Caribbean','[{\"zoneName\":\"America/Havana\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"CST\",\"tzName\":\"Cuba Standard Time\"}]','{\"kr\":\"쿠바\",\"br\":\"Cuba\",\"pt\":\"Cuba\",\"nl\":\"Cuba\",\"hr\":\"Kuba\",\"fa\":\"کوبا\",\"de\":\"Kuba\",\"es\":\"Cuba\",\"fr\":\"Cuba\",\"ja\":\"キューバ\",\"it\":\"Cuba\",\"cn\":\"古巴\"}',21.50000000,-80.00000000,'??','U+1F1E8 U+1F1FA','2018-07-21 01:41:03','2021-12-11 18:31:39',1,'Q241'),(57,'Cyprus','CYP','196','CY','357','Nicosia','EUR','Euro','€','.cy','Κύπρος','Europe','Southern Europe','[{\"zoneName\":\"Asia/Famagusta\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"},{\"zoneName\":\"Asia/Nicosia\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]','{\"kr\":\"키프로스\",\"br\":\"Chipre\",\"pt\":\"Chipre\",\"nl\":\"Cyprus\",\"hr\":\"Cipar\",\"fa\":\"قبرس\",\"de\":\"Zypern\",\"es\":\"Chipre\",\"fr\":\"Chypre\",\"ja\":\"キプロス\",\"it\":\"Cipro\",\"cn\":\"塞浦路斯\"}',35.00000000,33.00000000,'??','U+1F1E8 U+1F1FE','2018-07-21 01:41:03','2021-12-11 18:31:50',1,'Q229'),(58,'Czech Republic','CZE','203','CZ','420','Prague','CZK','Czech koruna','Kč','.cz','Česká republika','Europe','Eastern Europe','[{\"zoneName\":\"Europe/Prague\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"체코\",\"br\":\"República Tcheca\",\"pt\":\"República Checa\",\"nl\":\"Tsjechië\",\"hr\":\"Češka\",\"fa\":\"جمهوری چک\",\"de\":\"Tschechische Republik\",\"es\":\"República Checa\",\"fr\":\"République tchèque\",\"ja\":\"チェコ\",\"it\":\"Repubblica Ceca\",\"cn\":\"捷克\"}',49.75000000,15.50000000,'??','U+1F1E8 U+1F1FF','2018-07-21 01:41:03','2021-12-11 18:31:57',1,'Q213'),(59,'Denmark','DNK','208','DK','45','Copenhagen','DKK','Danish krone','Kr.','.dk','Danmark','Europe','Northern Europe','[{\"zoneName\":\"Europe/Copenhagen\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"덴마크\",\"br\":\"Dinamarca\",\"pt\":\"Dinamarca\",\"nl\":\"Denemarken\",\"hr\":\"Danska\",\"fa\":\"دانمارک\",\"de\":\"Dänemark\",\"es\":\"Dinamarca\",\"fr\":\"Danemark\",\"ja\":\"デンマーク\",\"it\":\"Danimarca\",\"cn\":\"丹麦\"}',56.00000000,10.00000000,'??','U+1F1E9 U+1F1F0','2018-07-21 01:41:03','2021-12-11 18:32:05',1,'Q35'),(60,'Djibouti','DJI','262','DJ','253','Djibouti','DJF','Djiboutian franc','Fdj','.dj','Djibouti','Africa','Eastern Africa','[{\"zoneName\":\"Africa/Djibouti\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]','{\"kr\":\"지부티\",\"br\":\"Djibuti\",\"pt\":\"Djibuti\",\"nl\":\"Djibouti\",\"hr\":\"Džibuti\",\"fa\":\"جیبوتی\",\"de\":\"Dschibuti\",\"es\":\"Yibuti\",\"fr\":\"Djibouti\",\"ja\":\"ジブチ\",\"it\":\"Gibuti\",\"cn\":\"吉布提\"}',11.50000000,43.00000000,'??','U+1F1E9 U+1F1EF','2018-07-21 01:41:03','2021-12-11 18:32:11',1,'Q977'),(61,'Dominica','DMA','212','DM','+1-767','Roseau','XCD','Eastern Caribbean dollar','$','.dm','Dominica','Americas','Caribbean','[{\"zoneName\":\"America/Dominica\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"도미니카 연방\",\"br\":\"Dominica\",\"pt\":\"Dominica\",\"nl\":\"Dominica\",\"hr\":\"Dominika\",\"fa\":\"دومینیکا\",\"de\":\"Dominica\",\"es\":\"Dominica\",\"fr\":\"Dominique\",\"ja\":\"ドミニカ国\",\"it\":\"Dominica\",\"cn\":\"多米尼加\"}',15.41666666,-61.33333333,'??','U+1F1E9 U+1F1F2','2018-07-21 01:41:03','2021-12-11 18:32:16',1,'Q784'),(62,'Dominican Republic','DOM','214','DO','+1-809 and 1-829','Santo Domingo','DOP','Dominican peso','$','.do','República Dominicana','Americas','Caribbean','[{\"zoneName\":\"America/Santo_Domingo\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"도미니카 공화국\",\"br\":\"República Dominicana\",\"pt\":\"República Dominicana\",\"nl\":\"Dominicaanse Republiek\",\"hr\":\"Dominikanska Republika\",\"fa\":\"جمهوری دومینیکن\",\"de\":\"Dominikanische Republik\",\"es\":\"República Dominicana\",\"fr\":\"République dominicaine\",\"ja\":\"ドミニカ共和国\",\"it\":\"Repubblica Dominicana\",\"cn\":\"多明尼加共和国\"}',19.00000000,-70.66666666,'??','U+1F1E9 U+1F1F4','2018-07-21 01:41:03','2021-12-11 18:32:22',1,'Q786'),(63,'East Timor','TLS','626','TL','670','Dili','USD','United States dollar','$','.tl','Timor-Leste','Asia','South-Eastern Asia','[{\"zoneName\":\"Asia/Dili\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"TLT\",\"tzName\":\"Timor Leste Time\"}]','{\"kr\":\"동티모르\",\"br\":\"Timor Leste\",\"pt\":\"Timor Leste\",\"nl\":\"Oost-Timor\",\"hr\":\"Istočni Timor\",\"fa\":\"تیمور شرقی\",\"de\":\"Timor-Leste\",\"es\":\"Timor Oriental\",\"fr\":\"Timor oriental\",\"ja\":\"東ティモール\",\"it\":\"Timor Est\",\"cn\":\"东帝汶\"}',-8.83333333,125.91666666,'??','U+1F1F9 U+1F1F1','2018-07-21 01:41:03','2021-12-11 18:32:27',1,'Q574'),(64,'Ecuador','ECU','218','EC','593','Quito','USD','United States dollar','$','.ec','Ecuador','Americas','South America','[{\"zoneName\":\"America/Guayaquil\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"ECT\",\"tzName\":\"Ecuador Time\"},{\"zoneName\":\"Pacific/Galapagos\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"GALT\",\"tzName\":\"Galápagos Time\"}]','{\"kr\":\"에콰도르\",\"br\":\"Equador\",\"pt\":\"Equador\",\"nl\":\"Ecuador\",\"hr\":\"Ekvador\",\"fa\":\"اکوادور\",\"de\":\"Ecuador\",\"es\":\"Ecuador\",\"fr\":\"Équateur\",\"ja\":\"エクアドル\",\"it\":\"Ecuador\",\"cn\":\"厄瓜多尔\"}',-2.00000000,-77.50000000,'??','U+1F1EA U+1F1E8','2018-07-21 01:41:03','2021-12-11 18:32:33',1,'Q736'),(65,'Egypt','EGY','818','EG','20','Cairo','EGP','Egyptian pound','ج.م','.eg','مصر‎','Africa','Northern Africa','[{\"zoneName\":\"Africa/Cairo\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]','{\"kr\":\"이집트\",\"br\":\"Egito\",\"pt\":\"Egipto\",\"nl\":\"Egypte\",\"hr\":\"Egipat\",\"fa\":\"مصر\",\"de\":\"Ägypten\",\"es\":\"Egipto\",\"fr\":\"Égypte\",\"ja\":\"エジプト\",\"it\":\"Egitto\",\"cn\":\"埃及\"}',27.00000000,30.00000000,'??','U+1F1EA U+1F1EC','2018-07-21 01:41:03','2021-12-11 18:32:38',1,'Q79'),(66,'El Salvador','SLV','222','SV','503','San Salvador','USD','United States dollar','$','.sv','El Salvador','Americas','Central America','[{\"zoneName\":\"America/El_Salvador\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"}]','{\"kr\":\"엘살바도르\",\"br\":\"El Salvador\",\"pt\":\"El Salvador\",\"nl\":\"El Salvador\",\"hr\":\"Salvador\",\"fa\":\"السالوادور\",\"de\":\"El Salvador\",\"es\":\"El Salvador\",\"fr\":\"Salvador\",\"ja\":\"エルサルバドル\",\"it\":\"El Salvador\",\"cn\":\"萨尔瓦多\"}',13.83333333,-88.91666666,'??','U+1F1F8 U+1F1FB','2018-07-21 01:41:03','2021-12-11 18:32:45',1,'Q792'),(67,'Equatorial Guinea','GNQ','226','GQ','240','Malabo','XAF','Central African CFA franc','FCFA','.gq','Guinea Ecuatorial','Africa','Middle Africa','[{\"zoneName\":\"Africa/Malabo\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]','{\"kr\":\"적도 기니\",\"br\":\"Guiné Equatorial\",\"pt\":\"Guiné Equatorial\",\"nl\":\"Equatoriaal-Guinea\",\"hr\":\"Ekvatorijalna Gvineja\",\"fa\":\"گینه استوایی\",\"de\":\"Äquatorial-Guinea\",\"es\":\"Guinea Ecuatorial\",\"fr\":\"Guinée-Équatoriale\",\"ja\":\"赤道ギニア\",\"it\":\"Guinea Equatoriale\",\"cn\":\"赤道几内亚\"}',2.00000000,10.00000000,'??','U+1F1EC U+1F1F6','2018-07-21 01:41:03','2021-12-11 18:32:52',1,'Q983'),(68,'Eritrea','ERI','232','ER','291','Asmara','ERN','Eritrean nakfa','Nfk','.er','ኤርትራ','Africa','Eastern Africa','[{\"zoneName\":\"Africa/Asmara\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]','{\"kr\":\"에리트레아\",\"br\":\"Eritreia\",\"pt\":\"Eritreia\",\"nl\":\"Eritrea\",\"hr\":\"Eritreja\",\"fa\":\"اریتره\",\"de\":\"Eritrea\",\"es\":\"Eritrea\",\"fr\":\"Érythrée\",\"ja\":\"エリトリア\",\"it\":\"Eritrea\",\"cn\":\"厄立特里亚\"}',15.00000000,39.00000000,'??','U+1F1EA U+1F1F7','2018-07-21 01:41:03','2021-12-11 18:32:58',1,'Q986'),(69,'Estonia','EST','233','EE','372','Tallinn','EUR','Euro','€','.ee','Eesti','Europe','Northern Europe','[{\"zoneName\":\"Europe/Tallinn\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]','{\"kr\":\"에스토니아\",\"br\":\"Estônia\",\"pt\":\"Estónia\",\"nl\":\"Estland\",\"hr\":\"Estonija\",\"fa\":\"استونی\",\"de\":\"Estland\",\"es\":\"Estonia\",\"fr\":\"Estonie\",\"ja\":\"エストニア\",\"it\":\"Estonia\",\"cn\":\"爱沙尼亚\"}',59.00000000,26.00000000,'??','U+1F1EA U+1F1EA','2018-07-21 01:41:03','2021-12-11 18:33:03',1,'Q191'),(70,'Ethiopia','ETH','231','ET','251','Addis Ababa','ETB','Ethiopian birr','Nkf','.et','ኢትዮጵያ','Africa','Eastern Africa','[{\"zoneName\":\"Africa/Addis_Ababa\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]','{\"kr\":\"에티오피아\",\"br\":\"Etiópia\",\"pt\":\"Etiópia\",\"nl\":\"Ethiopië\",\"hr\":\"Etiopija\",\"fa\":\"اتیوپی\",\"de\":\"Äthiopien\",\"es\":\"Etiopía\",\"fr\":\"Éthiopie\",\"ja\":\"エチオピア\",\"it\":\"Etiopia\",\"cn\":\"埃塞俄比亚\"}',8.00000000,38.00000000,'??','U+1F1EA U+1F1F9','2018-07-21 01:41:03','2021-12-11 18:46:58',1,'Q115'),(71,'Falkland Islands','FLK','238','FK','500','Stanley','FKP','Falkland Islands pound','£','.fk','Falkland Islands','Americas','South America','[{\"zoneName\":\"Atlantic/Stanley\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"FKST\",\"tzName\":\"Falkland Islands Summer Time\"}]','{\"kr\":\"포클랜드 제도\",\"br\":\"Ilhas Malvinas\",\"pt\":\"Ilhas Falkland\",\"nl\":\"Falklandeilanden [Islas Malvinas]\",\"hr\":\"Falklandski Otoci\",\"fa\":\"جزایر فالکلند\",\"de\":\"Falklandinseln\",\"es\":\"Islas Malvinas\",\"fr\":\"Îles Malouines\",\"ja\":\"フォークランド（マルビナス）諸島\",\"it\":\"Isole Falkland o Isole Malvine\",\"cn\":\"福克兰群岛\"}',-51.75000000,-59.00000000,'??','U+1F1EB U+1F1F0','2018-07-21 01:41:03','2021-12-11 18:47:05',1,NULL),(72,'Faroe Islands','FRO','234','FO','298','Torshavn','DKK','Danish krone','Kr.','.fo','Føroyar','Europe','Northern Europe','[{\"zoneName\":\"Atlantic/Faroe\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"WET\",\"tzName\":\"Western European Time\"}]','{\"kr\":\"페로 제도\",\"br\":\"Ilhas Faroé\",\"pt\":\"Ilhas Faroé\",\"nl\":\"Faeröer\",\"hr\":\"Farski Otoci\",\"fa\":\"جزایر فارو\",\"de\":\"Färöer-Inseln\",\"es\":\"Islas Faroe\",\"fr\":\"Îles Féroé\",\"ja\":\"フェロー諸島\",\"it\":\"Isole Far Oer\",\"cn\":\"法罗群岛\"}',62.00000000,-7.00000000,'??','U+1F1EB U+1F1F4','2018-07-21 01:41:03','2021-12-11 18:47:11',1,NULL),(73,'Fiji Islands','FJI','242','FJ','679','Suva','FJD','Fijian dollar','FJ$','.fj','Fiji','Oceania','Melanesia','[{\"zoneName\":\"Pacific/Fiji\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"FJT\",\"tzName\":\"Fiji Time\"}]','{\"kr\":\"피지\",\"br\":\"Fiji\",\"pt\":\"Fiji\",\"nl\":\"Fiji\",\"hr\":\"Fiđi\",\"fa\":\"فیجی\",\"de\":\"Fidschi\",\"es\":\"Fiyi\",\"fr\":\"Fidji\",\"ja\":\"フィジー\",\"it\":\"Figi\",\"cn\":\"斐济\"}',-18.00000000,175.00000000,'??','U+1F1EB U+1F1EF','2018-07-21 01:41:03','2021-12-11 18:47:17',1,'Q712'),(74,'Finland','FIN','246','FI','358','Helsinki','EUR','Euro','€','.fi','Suomi','Europe','Northern Europe','[{\"zoneName\":\"Europe/Helsinki\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]','{\"kr\":\"핀란드\",\"br\":\"Finlândia\",\"pt\":\"Finlândia\",\"nl\":\"Finland\",\"hr\":\"Finska\",\"fa\":\"فنلاند\",\"de\":\"Finnland\",\"es\":\"Finlandia\",\"fr\":\"Finlande\",\"ja\":\"フィンランド\",\"it\":\"Finlandia\",\"cn\":\"芬兰\"}',64.00000000,26.00000000,'??','U+1F1EB U+1F1EE','2018-07-21 01:41:03','2021-12-11 18:47:24',1,'Q33'),(75,'France','FRA','250','FR','33','Paris','EUR','Euro','€','.fr','France','Europe','Western Europe','[{\"zoneName\":\"Europe/Paris\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"프랑스\",\"br\":\"França\",\"pt\":\"França\",\"nl\":\"Frankrijk\",\"hr\":\"Francuska\",\"fa\":\"فرانسه\",\"de\":\"Frankreich\",\"es\":\"Francia\",\"fr\":\"France\",\"ja\":\"フランス\",\"it\":\"Francia\",\"cn\":\"法国\"}',46.00000000,2.00000000,'??','U+1F1EB U+1F1F7','2018-07-21 01:41:03','2021-12-11 18:47:33',1,'Q142'),(76,'French Guiana','GUF','254','GF','594','Cayenne','EUR','Euro','€','.gf','Guyane française','Americas','South America','[{\"zoneName\":\"America/Cayenne\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"GFT\",\"tzName\":\"French Guiana Time\"}]','{\"kr\":\"프랑스령 기아나\",\"br\":\"Guiana Francesa\",\"pt\":\"Guiana Francesa\",\"nl\":\"Frans-Guyana\",\"hr\":\"Francuska Gvajana\",\"fa\":\"گویان فرانسه\",\"de\":\"Französisch Guyana\",\"es\":\"Guayana Francesa\",\"fr\":\"Guayane\",\"ja\":\"フランス領ギアナ\",\"it\":\"Guyana francese\",\"cn\":\"法属圭亚那\"}',4.00000000,-53.00000000,'??','U+1F1EC U+1F1EB','2018-07-21 01:41:03','2021-12-11 18:48:11',1,NULL),(77,'French Polynesia','PYF','258','PF','689','Papeete','XPF','CFP franc','₣','.pf','Polynésie française','Oceania','Polynesia','[{\"zoneName\":\"Pacific/Gambier\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"GAMT\",\"tzName\":\"Gambier Islands Time\"},{\"zoneName\":\"Pacific/Marquesas\",\"gmtOffset\":-34200,\"gmtOffsetName\":\"UTC-09:30\",\"abbreviation\":\"MART\",\"tzName\":\"Marquesas Islands Time\"},{\"zoneName\":\"Pacific/Tahiti\",\"gmtOffset\":-36000,\"gmtOffsetName\":\"UTC-10:00\",\"abbreviation\":\"TAHT\",\"tzName\":\"Tahiti Time\"}]','{\"kr\":\"프랑스령 폴리네시아\",\"br\":\"Polinésia Francesa\",\"pt\":\"Polinésia Francesa\",\"nl\":\"Frans-Polynesië\",\"hr\":\"Francuska Polinezija\",\"fa\":\"پلی‌نزی فرانسه\",\"de\":\"Französisch-Polynesien\",\"es\":\"Polinesia Francesa\",\"fr\":\"Polynésie française\",\"ja\":\"フランス領ポリネシア\",\"it\":\"Polinesia Francese\",\"cn\":\"法属波利尼西亚\"}',-15.00000000,-140.00000000,'??','U+1F1F5 U+1F1EB','2018-07-21 01:41:03','2021-12-11 18:47:54',1,NULL),(78,'French Southern Territories','ATF','260','TF','262','Port-aux-Francais','EUR','Euro','€','.tf','Territoire des Terres australes et antarctiques fr','Africa','Southern Africa','[{\"zoneName\":\"Indian/Kerguelen\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"TFT\",\"tzName\":\"French Southern and Antarctic Time\"}]','{\"kr\":\"프랑스령 남방 및 남극\",\"br\":\"Terras Austrais e Antárticas Francesas\",\"pt\":\"Terras Austrais e Antárticas Francesas\",\"nl\":\"Franse Gebieden in de zuidelijke Indische Oceaan\",\"hr\":\"Francuski južni i antarktički teritoriji\",\"fa\":\"سرزمین‌های جنوبی و جنوبگانی فرانسه\",\"de\":\"Französische Süd- und Antarktisgebiete\",\"es\":\"Tierras Australes y Antárticas Francesas\",\"fr\":\"Terres australes et antarctiques françaises\",\"ja\":\"フランス領南方・南極地域\",\"it\":\"Territori Francesi del Sud\",\"cn\":\"法属南部领地\"}',-49.25000000,69.16700000,'??','U+1F1F9 U+1F1EB','2018-07-21 01:41:03','2021-12-11 18:48:34',1,NULL),(79,'Gabon','GAB','266','GA','241','Libreville','XAF','Central African CFA franc','FCFA','.ga','Gabon','Africa','Middle Africa','[{\"zoneName\":\"Africa/Libreville\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]','{\"kr\":\"가봉\",\"br\":\"Gabão\",\"pt\":\"Gabão\",\"nl\":\"Gabon\",\"hr\":\"Gabon\",\"fa\":\"گابن\",\"de\":\"Gabun\",\"es\":\"Gabón\",\"fr\":\"Gabon\",\"ja\":\"ガボン\",\"it\":\"Gabon\",\"cn\":\"加蓬\"}',-1.00000000,11.75000000,'??','U+1F1EC U+1F1E6','2018-07-21 01:41:03','2021-12-11 18:48:46',1,'Q1000'),(80,'Gambia The','GMB','270','GM','220','Banjul','GMD','Gambian dalasi','D','.gm','Gambia','Africa','Western Africa','[{\"zoneName\":\"Africa/Banjul\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]','{\"kr\":\"감비아\",\"br\":\"Gâmbia\",\"pt\":\"Gâmbia\",\"nl\":\"Gambia\",\"hr\":\"Gambija\",\"fa\":\"گامبیا\",\"de\":\"Gambia\",\"es\":\"Gambia\",\"fr\":\"Gambie\",\"ja\":\"ガンビア\",\"it\":\"Gambia\",\"cn\":\"冈比亚\"}',13.46666666,-16.56666666,'??','U+1F1EC U+1F1F2','2018-07-21 01:41:03','2021-12-11 18:48:53',1,'Q1005'),(81,'Georgia','GEO','268','GE','995','Tbilisi','GEL','Georgian lari','ლ','.ge','საქართველო','Asia','Western Asia','[{\"zoneName\":\"Asia/Tbilisi\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"GET\",\"tzName\":\"Georgia Standard Time\"}]','{\"kr\":\"조지아\",\"br\":\"Geórgia\",\"pt\":\"Geórgia\",\"nl\":\"Georgië\",\"hr\":\"Gruzija\",\"fa\":\"گرجستان\",\"de\":\"Georgien\",\"es\":\"Georgia\",\"fr\":\"Géorgie\",\"ja\":\"グルジア\",\"it\":\"Georgia\",\"cn\":\"格鲁吉亚\"}',42.00000000,43.50000000,'??','U+1F1EC U+1F1EA','2018-07-21 01:41:03','2021-12-11 18:48:59',1,'Q230'),(82,'Germany','DEU','276','DE','49','Berlin','EUR','Euro','€','.de','Deutschland','Europe','Western Europe','[{\"zoneName\":\"Europe/Berlin\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"},{\"zoneName\":\"Europe/Busingen\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"독일\",\"br\":\"Alemanha\",\"pt\":\"Alemanha\",\"nl\":\"Duitsland\",\"hr\":\"Njemačka\",\"fa\":\"آلمان\",\"de\":\"Deutschland\",\"es\":\"Alemania\",\"fr\":\"Allemagne\",\"ja\":\"ドイツ\",\"it\":\"Germania\",\"cn\":\"德国\"}',51.00000000,9.00000000,'??','U+1F1E9 U+1F1EA','2018-07-21 01:41:03','2021-12-11 18:49:06',1,'Q183'),(83,'Ghana','GHA','288','GH','233','Accra','GHS','Ghanaian cedi','GH₵','.gh','Ghana','Africa','Western Africa','[{\"zoneName\":\"Africa/Accra\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]','{\"kr\":\"가나\",\"br\":\"Gana\",\"pt\":\"Gana\",\"nl\":\"Ghana\",\"hr\":\"Gana\",\"fa\":\"غنا\",\"de\":\"Ghana\",\"es\":\"Ghana\",\"fr\":\"Ghana\",\"ja\":\"ガーナ\",\"it\":\"Ghana\",\"cn\":\"加纳\"}',8.00000000,-2.00000000,'??','U+1F1EC U+1F1ED','2018-07-21 01:41:03','2021-12-11 18:49:14',1,'Q117'),(84,'Gibraltar','GIB','292','GI','350','Gibraltar','GIP','Gibraltar pound','£','.gi','Gibraltar','Europe','Southern Europe','[{\"zoneName\":\"Europe/Gibraltar\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"지브롤터\",\"br\":\"Gibraltar\",\"pt\":\"Gibraltar\",\"nl\":\"Gibraltar\",\"hr\":\"Gibraltar\",\"fa\":\"جبل‌طارق\",\"de\":\"Gibraltar\",\"es\":\"Gibraltar\",\"fr\":\"Gibraltar\",\"ja\":\"ジブラルタル\",\"it\":\"Gibilterra\",\"cn\":\"直布罗陀\"}',36.13333333,-5.35000000,'??','U+1F1EC U+1F1EE','2018-07-21 01:41:03','2021-12-11 18:49:19',1,NULL),(85,'Greece','GRC','300','GR','30','Athens','EUR','Euro','€','.gr','Ελλάδα','Europe','Southern Europe','[{\"zoneName\":\"Europe/Athens\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]','{\"kr\":\"그리스\",\"br\":\"Grécia\",\"pt\":\"Grécia\",\"nl\":\"Griekenland\",\"hr\":\"Grčka\",\"fa\":\"یونان\",\"de\":\"Griechenland\",\"es\":\"Grecia\",\"fr\":\"Grèce\",\"ja\":\"ギリシャ\",\"it\":\"Grecia\",\"cn\":\"希腊\"}',39.00000000,22.00000000,'??','U+1F1EC U+1F1F7','2018-07-21 01:41:03','2021-12-11 18:49:24',1,'Q41'),(86,'Greenland','GRL','304','GL','299','Nuuk','DKK','Danish krone','Kr.','.gl','Kalaallit Nunaat','Americas','Northern America','[{\"zoneName\":\"America/Danmarkshavn\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"},{\"zoneName\":\"America/Nuuk\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"WGT\",\"tzName\":\"West Greenland Time\"},{\"zoneName\":\"America/Scoresbysund\",\"gmtOffset\":-3600,\"gmtOffsetName\":\"UTC-01:00\",\"abbreviation\":\"EGT\",\"tzName\":\"Eastern Greenland Time\"},{\"zoneName\":\"America/Thule\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"그린란드\",\"br\":\"Groelândia\",\"pt\":\"Gronelândia\",\"nl\":\"Groenland\",\"hr\":\"Grenland\",\"fa\":\"گرینلند\",\"de\":\"Grönland\",\"es\":\"Groenlandia\",\"fr\":\"Groenland\",\"ja\":\"グリーンランド\",\"it\":\"Groenlandia\",\"cn\":\"格陵兰岛\"}',72.00000000,-40.00000000,'??','U+1F1EC U+1F1F1','2018-07-21 01:41:03','2021-12-11 18:49:31',1,NULL),(87,'Grenada','GRD','308','GD','+1-473','St. George\'s','XCD','Eastern Caribbean dollar','$','.gd','Grenada','Americas','Caribbean','[{\"zoneName\":\"America/Grenada\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"그레나다\",\"br\":\"Granada\",\"pt\":\"Granada\",\"nl\":\"Grenada\",\"hr\":\"Grenada\",\"fa\":\"گرنادا\",\"de\":\"Grenada\",\"es\":\"Grenada\",\"fr\":\"Grenade\",\"ja\":\"グレナダ\",\"it\":\"Grenada\",\"cn\":\"格林纳达\"}',12.11666666,-61.66666666,'??','U+1F1EC U+1F1E9','2018-07-21 01:41:03','2021-12-11 18:49:40',1,'Q769'),(88,'Guadeloupe','GLP','312','GP','590','Basse-Terre','EUR','Euro','€','.gp','Guadeloupe','Americas','Caribbean','[{\"zoneName\":\"America/Guadeloupe\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"과들루프\",\"br\":\"Guadalupe\",\"pt\":\"Guadalupe\",\"nl\":\"Guadeloupe\",\"hr\":\"Gvadalupa\",\"fa\":\"جزیره گوادلوپ\",\"de\":\"Guadeloupe\",\"es\":\"Guadalupe\",\"fr\":\"Guadeloupe\",\"ja\":\"グアドループ\",\"it\":\"Guadeloupa\",\"cn\":\"瓜德罗普岛\"}',16.25000000,-61.58333300,'??','U+1F1EC U+1F1F5','2018-07-21 01:41:03','2021-12-11 18:51:29',1,NULL),(89,'Guam','GUM','316','GU','+1-671','Hagatna','USD','US Dollar','$','.gu','Guam','Oceania','Micronesia','[{\"zoneName\":\"Pacific/Guam\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"CHST\",\"tzName\":\"Chamorro Standard Time\"}]','{\"kr\":\"괌\",\"br\":\"Guam\",\"pt\":\"Guame\",\"nl\":\"Guam\",\"hr\":\"Guam\",\"fa\":\"گوام\",\"de\":\"Guam\",\"es\":\"Guam\",\"fr\":\"Guam\",\"ja\":\"グアム\",\"it\":\"Guam\",\"cn\":\"关岛\"}',13.46666666,144.78333333,'??','U+1F1EC U+1F1FA','2018-07-21 01:41:03','2021-12-11 18:50:50',1,NULL),(90,'Guatemala','GTM','320','GT','502','Guatemala City','GTQ','Guatemalan quetzal','Q','.gt','Guatemala','Americas','Central America','[{\"zoneName\":\"America/Guatemala\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"}]','{\"kr\":\"과테말라\",\"br\":\"Guatemala\",\"pt\":\"Guatemala\",\"nl\":\"Guatemala\",\"hr\":\"Gvatemala\",\"fa\":\"گواتمالا\",\"de\":\"Guatemala\",\"es\":\"Guatemala\",\"fr\":\"Guatemala\",\"ja\":\"グアテマラ\",\"it\":\"Guatemala\",\"cn\":\"危地马拉\"}',15.50000000,-90.25000000,'??','U+1F1EC U+1F1F9','2018-07-21 01:41:03','2021-12-11 18:51:50',1,'Q774'),(91,'Guernsey and Alderney','GGY','831','GG','+44-1481','St Peter Port','GBP','British pound','£','.gg','Guernsey','Europe','Northern Europe','[{\"zoneName\":\"Europe/Guernsey\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]','{\"kr\":\"건지, 올더니\",\"br\":\"Guernsey\",\"pt\":\"Guernsey\",\"nl\":\"Guernsey\",\"hr\":\"Guernsey\",\"fa\":\"گرنزی\",\"de\":\"Guernsey\",\"es\":\"Guernsey\",\"fr\":\"Guernesey\",\"ja\":\"ガーンジー\",\"it\":\"Guernsey\",\"cn\":\"根西岛\"}',49.46666666,-2.58333333,'??','U+1F1EC U+1F1EC','2018-07-21 01:41:03','2021-12-11 18:53:37',1,NULL),(92,'Guinea','GIN','324','GN','224','Conakry','GNF','Guinean franc','FG','.gn','Guinée','Africa','Western Africa','[{\"zoneName\":\"Africa/Conakry\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]','{\"kr\":\"기니\",\"br\":\"Guiné\",\"pt\":\"Guiné\",\"nl\":\"Guinee\",\"hr\":\"Gvineja\",\"fa\":\"گینه\",\"de\":\"Guinea\",\"es\":\"Guinea\",\"fr\":\"Guinée\",\"ja\":\"ギニア\",\"it\":\"Guinea\",\"cn\":\"几内亚\"}',11.00000000,-10.00000000,'??','U+1F1EC U+1F1F3','2018-07-21 01:41:03','2021-12-11 18:53:45',1,'Q1006'),(93,'Guinea-Bissau','GNB','624','GW','245','Bissau','XOF','West African CFA franc','CFA','.gw','Guiné-Bissau','Africa','Western Africa','[{\"zoneName\":\"Africa/Bissau\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]','{\"kr\":\"기니비사우\",\"br\":\"Guiné-Bissau\",\"pt\":\"Guiné-Bissau\",\"nl\":\"Guinee-Bissau\",\"hr\":\"Gvineja Bisau\",\"fa\":\"گینه بیسائو\",\"de\":\"Guinea-Bissau\",\"es\":\"Guinea-Bisáu\",\"fr\":\"Guinée-Bissau\",\"ja\":\"ギニアビサウ\",\"it\":\"Guinea-Bissau\",\"cn\":\"几内亚比绍\"}',12.00000000,-15.00000000,'??','U+1F1EC U+1F1FC','2018-07-21 01:41:03','2021-12-11 18:53:54',1,'Q1007'),(94,'Guyana','GUY','328','GY','592','Georgetown','GYD','Guyanese dollar','$','.gy','Guyana','Americas','South America','[{\"zoneName\":\"America/Guyana\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"GYT\",\"tzName\":\"Guyana Time\"}]','{\"kr\":\"가이아나\",\"br\":\"Guiana\",\"pt\":\"Guiana\",\"nl\":\"Guyana\",\"hr\":\"Gvajana\",\"fa\":\"گویان\",\"de\":\"Guyana\",\"es\":\"Guyana\",\"fr\":\"Guyane\",\"ja\":\"ガイアナ\",\"it\":\"Guyana\",\"cn\":\"圭亚那\"}',5.00000000,-59.00000000,'??','U+1F1EC U+1F1FE','2018-07-21 01:41:03','2021-12-11 18:54:01',1,'Q734'),(95,'Haiti','HTI','332','HT','509','Port-au-Prince','HTG','Haitian gourde','G','.ht','Haïti','Americas','Caribbean','[{\"zoneName\":\"America/Port-au-Prince\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"}]','{\"kr\":\"아이티\",\"br\":\"Haiti\",\"pt\":\"Haiti\",\"nl\":\"Haïti\",\"hr\":\"Haiti\",\"fa\":\"هائیتی\",\"de\":\"Haiti\",\"es\":\"Haiti\",\"fr\":\"Haïti\",\"ja\":\"ハイチ\",\"it\":\"Haiti\",\"cn\":\"海地\"}',19.00000000,-72.41666666,'??','U+1F1ED U+1F1F9','2018-07-21 01:41:03','2021-12-11 18:54:06',1,'Q790'),(96,'Heard Island and McDonald Islands','HMD','334','HM','672','','AUD','Australian dollar','$','.hm','Heard Island and McDonald Islands','','','[{\"zoneName\":\"Indian/Kerguelen\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"TFT\",\"tzName\":\"French Southern and Antarctic Time\"}]','{\"kr\":\"허드 맥도날드 제도\",\"br\":\"Ilha Heard e Ilhas McDonald\",\"pt\":\"Ilha Heard e Ilhas McDonald\",\"nl\":\"Heard- en McDonaldeilanden\",\"hr\":\"Otok Heard i otočje McDonald\",\"fa\":\"جزیره هرد و جزایر مک‌دونالد\",\"de\":\"Heard und die McDonaldinseln\",\"es\":\"Islas Heard y McDonald\",\"fr\":\"Îles Heard-et-MacDonald\",\"ja\":\"ハード島とマクドナルド諸島\",\"it\":\"Isole Heard e McDonald\",\"cn\":\"赫德·唐纳岛及麦唐纳岛\"}',-53.10000000,72.51666666,'??','U+1F1ED U+1F1F2','2018-07-21 01:41:03','2021-12-11 19:18:51',1,NULL),(97,'Honduras','HND','340','HN','504','Tegucigalpa','HNL','Honduran lempira','L','.hn','Honduras','Americas','Central America','[{\"zoneName\":\"America/Tegucigalpa\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"}]','{\"kr\":\"온두라스\",\"br\":\"Honduras\",\"pt\":\"Honduras\",\"nl\":\"Honduras\",\"hr\":\"Honduras\",\"fa\":\"هندوراس\",\"de\":\"Honduras\",\"es\":\"Honduras\",\"fr\":\"Honduras\",\"ja\":\"ホンジュラス\",\"it\":\"Honduras\",\"cn\":\"洪都拉斯\"}',15.00000000,-86.50000000,'??','U+1F1ED U+1F1F3','2018-07-21 01:41:03','2021-12-11 18:54:16',1,'Q783'),(98,'Hong Kong S.A.R.','HKG','344','HK','852','Hong Kong','HKD','Hong Kong dollar','$','.hk','香港','Asia','Eastern Asia','[{\"zoneName\":\"Asia/Hong_Kong\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"HKT\",\"tzName\":\"Hong Kong Time\"}]','{\"kr\":\"홍콩\",\"br\":\"Hong Kong\",\"pt\":\"Hong Kong\",\"nl\":\"Hongkong\",\"hr\":\"Hong Kong\",\"fa\":\"هنگ‌کنگ\",\"de\":\"Hong Kong\",\"es\":\"Hong Kong\",\"fr\":\"Hong Kong\",\"ja\":\"香港\",\"it\":\"Hong Kong\",\"cn\":\"中国香港\"}',22.25000000,114.16666666,'??','U+1F1ED U+1F1F0','2018-07-21 01:41:03','2021-12-11 18:54:22',1,'Q8646'),(99,'Hungary','HUN','348','HU','36','Budapest','HUF','Hungarian forint','Ft','.hu','Magyarország','Europe','Eastern Europe','[{\"zoneName\":\"Europe/Budapest\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"헝가리\",\"br\":\"Hungria\",\"pt\":\"Hungria\",\"nl\":\"Hongarije\",\"hr\":\"Mađarska\",\"fa\":\"مجارستان\",\"de\":\"Ungarn\",\"es\":\"Hungría\",\"fr\":\"Hongrie\",\"ja\":\"ハンガリー\",\"it\":\"Ungheria\",\"cn\":\"匈牙利\"}',47.00000000,20.00000000,'??','U+1F1ED U+1F1FA','2018-07-21 01:41:03','2021-12-11 18:54:30',1,'Q28'),(100,'Iceland','ISL','352','IS','354','Reykjavik','ISK','Icelandic króna','kr','.is','Ísland','Europe','Northern Europe','[{\"zoneName\":\"Atlantic/Reykjavik\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]','{\"kr\":\"아이슬란드\",\"br\":\"Islândia\",\"pt\":\"Islândia\",\"nl\":\"IJsland\",\"hr\":\"Island\",\"fa\":\"ایسلند\",\"de\":\"Island\",\"es\":\"Islandia\",\"fr\":\"Islande\",\"ja\":\"アイスランド\",\"it\":\"Islanda\",\"cn\":\"冰岛\"}',65.00000000,-18.00000000,'??','U+1F1EE U+1F1F8','2018-07-21 01:41:03','2021-12-11 18:54:35',1,'Q189'),(101,'India','IND','356','IN','91','New Delhi','INR','Indian rupee','₹','.in','भारत','Asia','Southern Asia','[{\"zoneName\":\"Asia/Kolkata\",\"gmtOffset\":19800,\"gmtOffsetName\":\"UTC+05:30\",\"abbreviation\":\"IST\",\"tzName\":\"Indian Standard Time\"}]','{\"kr\":\"인도\",\"br\":\"Índia\",\"pt\":\"Índia\",\"nl\":\"India\",\"hr\":\"Indija\",\"fa\":\"هند\",\"de\":\"Indien\",\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\",\"it\":\"India\",\"cn\":\"印度\"}',20.00000000,77.00000000,'??','U+1F1EE U+1F1F3','2018-07-21 01:41:03','2021-12-11 18:54:41',1,'Q668'),(102,'Indonesia','IDN','360','ID','62','Jakarta','IDR','Indonesian rupiah','Rp','.id','Indonesia','Asia','South-Eastern Asia','[{\"zoneName\":\"Asia/Jakarta\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"WIB\",\"tzName\":\"Western Indonesian Time\"},{\"zoneName\":\"Asia/Jayapura\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"WIT\",\"tzName\":\"Eastern Indonesian Time\"},{\"zoneName\":\"Asia/Makassar\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"WITA\",\"tzName\":\"Central Indonesia Time\"},{\"zoneName\":\"Asia/Pontianak\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"WIB\",\"tzName\":\"Western Indonesian Time\"}]','{\"kr\":\"인도네시아\",\"br\":\"Indonésia\",\"pt\":\"Indonésia\",\"nl\":\"Indonesië\",\"hr\":\"Indonezija\",\"fa\":\"اندونزی\",\"de\":\"Indonesien\",\"es\":\"Indonesia\",\"fr\":\"Indonésie\",\"ja\":\"インドネシア\",\"it\":\"Indonesia\",\"cn\":\"印度尼西亚\"}',-5.00000000,120.00000000,'??','U+1F1EE U+1F1E9','2018-07-21 01:41:03','2021-12-11 18:54:49',1,'Q252'),(103,'Iran','IRN','364','IR','98','Tehran','IRR','Iranian rial','﷼','.ir','ایران','Asia','Southern Asia','[{\"zoneName\":\"Asia/Tehran\",\"gmtOffset\":12600,\"gmtOffsetName\":\"UTC+03:30\",\"abbreviation\":\"IRDT\",\"tzName\":\"Iran Daylight Time\"}]','{\"kr\":\"이란\",\"br\":\"Irã\",\"pt\":\"Irão\",\"nl\":\"Iran\",\"hr\":\"Iran\",\"fa\":\"ایران\",\"de\":\"Iran\",\"es\":\"Iran\",\"fr\":\"Iran\",\"ja\":\"イラン・イスラム共和国\",\"cn\":\"伊朗\"}',32.00000000,53.00000000,'??','U+1F1EE U+1F1F7','2018-07-21 01:41:03','2021-12-11 18:54:54',1,'Q794'),(104,'Iraq','IRQ','368','IQ','964','Baghdad','IQD','Iraqi dinar','د.ع','.iq','العراق','Asia','Western Asia','[{\"zoneName\":\"Asia/Baghdad\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]','{\"kr\":\"이라크\",\"br\":\"Iraque\",\"pt\":\"Iraque\",\"nl\":\"Irak\",\"hr\":\"Irak\",\"fa\":\"عراق\",\"de\":\"Irak\",\"es\":\"Irak\",\"fr\":\"Irak\",\"ja\":\"イラク\",\"it\":\"Iraq\",\"cn\":\"伊拉克\"}',33.00000000,44.00000000,'??','U+1F1EE U+1F1F6','2018-07-21 01:41:03','2021-12-11 18:55:01',1,'Q796'),(105,'Ireland','IRL','372','IE','353','Dublin','EUR','Euro','€','.ie','Éire','Europe','Northern Europe','[{\"zoneName\":\"Europe/Dublin\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]','{\"kr\":\"아일랜드\",\"br\":\"Irlanda\",\"pt\":\"Irlanda\",\"nl\":\"Ierland\",\"hr\":\"Irska\",\"fa\":\"ایرلند\",\"de\":\"Irland\",\"es\":\"Irlanda\",\"fr\":\"Irlande\",\"ja\":\"アイルランド\",\"it\":\"Irlanda\",\"cn\":\"爱尔兰\"}',53.00000000,-8.00000000,'??','U+1F1EE U+1F1EA','2018-07-21 01:41:03','2021-12-11 18:55:07',1,'Q27'),(106,'Israel','ISR','376','IL','972','Jerusalem','ILS','Israeli new shekel','₪','.il','יִשְׂרָאֵל','Asia','Western Asia','[{\"zoneName\":\"Asia/Jerusalem\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"IST\",\"tzName\":\"Israel Standard Time\"}]','{\"kr\":\"이스라엘\",\"br\":\"Israel\",\"pt\":\"Israel\",\"nl\":\"Israël\",\"hr\":\"Izrael\",\"fa\":\"اسرائیل\",\"de\":\"Israel\",\"es\":\"Israel\",\"fr\":\"Israël\",\"ja\":\"イスラエル\",\"it\":\"Israele\",\"cn\":\"以色列\"}',31.50000000,34.75000000,'??','U+1F1EE U+1F1F1','2018-07-21 01:41:03','2021-12-11 18:55:27',1,'Q801'),(107,'Italy','ITA','380','IT','39','Rome','EUR','Euro','€','.it','Italia','Europe','Southern Europe','[{\"zoneName\":\"Europe/Rome\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"이탈리아\",\"br\":\"Itália\",\"pt\":\"Itália\",\"nl\":\"Italië\",\"hr\":\"Italija\",\"fa\":\"ایتالیا\",\"de\":\"Italien\",\"es\":\"Italia\",\"fr\":\"Italie\",\"ja\":\"イタリア\",\"it\":\"Italia\",\"cn\":\"意大利\"}',42.83333333,12.83333333,'??','U+1F1EE U+1F1F9','2018-07-21 01:41:03','2021-12-11 18:55:33',1,'Q38'),(108,'Jamaica','JAM','388','JM','+1-876','Kingston','JMD','Jamaican dollar','J$','.jm','Jamaica','Americas','Caribbean','[{\"zoneName\":\"America/Jamaica\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"}]','{\"kr\":\"자메이카\",\"br\":\"Jamaica\",\"pt\":\"Jamaica\",\"nl\":\"Jamaica\",\"hr\":\"Jamajka\",\"fa\":\"جامائیکا\",\"de\":\"Jamaika\",\"es\":\"Jamaica\",\"fr\":\"Jamaïque\",\"ja\":\"ジャマイカ\",\"it\":\"Giamaica\",\"cn\":\"牙买加\"}',18.25000000,-77.50000000,'??','U+1F1EF U+1F1F2','2018-07-21 01:41:03','2021-12-11 18:55:41',1,'Q766'),(109,'Japan','JPN','392','JP','81','Tokyo','JPY','Japanese yen','¥','.jp','日本','Asia','Eastern Asia','[{\"zoneName\":\"Asia/Tokyo\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"JST\",\"tzName\":\"Japan Standard Time\"}]','{\"kr\":\"일본\",\"br\":\"Japão\",\"pt\":\"Japão\",\"nl\":\"Japan\",\"hr\":\"Japan\",\"fa\":\"ژاپن\",\"de\":\"Japan\",\"es\":\"Japón\",\"fr\":\"Japon\",\"ja\":\"日本\",\"it\":\"Giappone\",\"cn\":\"日本\"}',36.00000000,138.00000000,'??','U+1F1EF U+1F1F5','2018-07-21 01:41:03','2021-12-11 18:55:46',1,'Q17'),(110,'Jersey','JEY','832','JE','+44-1534','Saint Helier','GBP','British pound','£','.je','Jersey','Europe','Northern Europe','[{\"zoneName\":\"Europe/Jersey\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]','{\"kr\":\"저지 섬\",\"br\":\"Jersey\",\"pt\":\"Jersey\",\"nl\":\"Jersey\",\"hr\":\"Jersey\",\"fa\":\"جرزی\",\"de\":\"Jersey\",\"es\":\"Jersey\",\"fr\":\"Jersey\",\"ja\":\"ジャージー\",\"it\":\"Isola di Jersey\",\"cn\":\"泽西岛\"}',49.25000000,-2.16666666,'??','U+1F1EF U+1F1EA','2018-07-21 01:41:03','2021-12-11 18:55:59',1,'Q785'),(111,'Jordan','JOR','400','JO','962','Amman','JOD','Jordanian dinar','ا.د','.jo','الأردن','Asia','Western Asia','[{\"zoneName\":\"Asia/Amman\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]','{\"kr\":\"요르단\",\"br\":\"Jordânia\",\"pt\":\"Jordânia\",\"nl\":\"Jordanië\",\"hr\":\"Jordan\",\"fa\":\"اردن\",\"de\":\"Jordanien\",\"es\":\"Jordania\",\"fr\":\"Jordanie\",\"ja\":\"ヨルダン\",\"it\":\"Giordania\",\"cn\":\"约旦\"}',31.00000000,36.00000000,'??','U+1F1EF U+1F1F4','2018-07-21 01:41:03','2021-12-11 18:56:07',1,'Q810'),(112,'Kazakhstan','KAZ','398','KZ','7','Astana','KZT','Kazakhstani tenge','лв','.kz','Қазақстан','Asia','Central Asia','[{\"zoneName\":\"Asia/Almaty\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"ALMT\",\"tzName\":\"Alma-Ata Time[1\"},{\"zoneName\":\"Asia/Aqtau\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"AQTT\",\"tzName\":\"Aqtobe Time\"},{\"zoneName\":\"Asia/Aqtobe\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"AQTT\",\"tzName\":\"Aqtobe Time\"},{\"zoneName\":\"Asia/Atyrau\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"MSD+1\",\"tzName\":\"Moscow Daylight Time+1\"},{\"zoneName\":\"Asia/Oral\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"ORAT\",\"tzName\":\"Oral Time\"},{\"zoneName\":\"Asia/Qostanay\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"QYZST\",\"tzName\":\"Qyzylorda Summer Time\"},{\"zoneName\":\"Asia/Qyzylorda\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"QYZT\",\"tzName\":\"Qyzylorda Summer Time\"}]','{\"kr\":\"카자흐스탄\",\"br\":\"Cazaquistão\",\"pt\":\"Cazaquistão\",\"nl\":\"Kazachstan\",\"hr\":\"Kazahstan\",\"fa\":\"قزاقستان\",\"de\":\"Kasachstan\",\"es\":\"Kazajistán\",\"fr\":\"Kazakhstan\",\"ja\":\"カザフスタン\",\"it\":\"Kazakistan\",\"cn\":\"哈萨克斯坦\"}',48.00000000,68.00000000,'??','U+1F1F0 U+1F1FF','2018-07-21 01:41:03','2021-12-11 18:56:18',1,'Q232'),(113,'Kenya','KEN','404','KE','254','Nairobi','KES','Kenyan shilling','KSh','.ke','Kenya','Africa','Eastern Africa','[{\"zoneName\":\"Africa/Nairobi\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]','{\"kr\":\"케냐\",\"br\":\"Quênia\",\"pt\":\"Quénia\",\"nl\":\"Kenia\",\"hr\":\"Kenija\",\"fa\":\"کنیا\",\"de\":\"Kenia\",\"es\":\"Kenia\",\"fr\":\"Kenya\",\"ja\":\"ケニア\",\"it\":\"Kenya\",\"cn\":\"肯尼亚\"}',1.00000000,38.00000000,'??','U+1F1F0 U+1F1EA','2018-07-21 01:41:03','2021-12-11 18:56:23',1,'Q114'),(114,'Kiribati','KIR','296','KI','686','Tarawa','AUD','Australian dollar','$','.ki','Kiribati','Oceania','Micronesia','[{\"zoneName\":\"Pacific/Enderbury\",\"gmtOffset\":46800,\"gmtOffsetName\":\"UTC+13:00\",\"abbreviation\":\"PHOT\",\"tzName\":\"Phoenix Island Time\"},{\"zoneName\":\"Pacific/Kiritimati\",\"gmtOffset\":50400,\"gmtOffsetName\":\"UTC+14:00\",\"abbreviation\":\"LINT\",\"tzName\":\"Line Islands Time\"},{\"zoneName\":\"Pacific/Tarawa\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"GILT\",\"tzName\":\"Gilbert Island Time\"}]','{\"kr\":\"키리바시\",\"br\":\"Kiribati\",\"pt\":\"Quiribáti\",\"nl\":\"Kiribati\",\"hr\":\"Kiribati\",\"fa\":\"کیریباتی\",\"de\":\"Kiribati\",\"es\":\"Kiribati\",\"fr\":\"Kiribati\",\"ja\":\"キリバス\",\"it\":\"Kiribati\",\"cn\":\"基里巴斯\"}',1.41666666,173.00000000,'??','U+1F1F0 U+1F1EE','2018-07-21 01:41:03','2021-12-11 18:56:30',1,'Q710'),(115,'North Korea','PRK','408','KP','850','Pyongyang','KPW','North Korean Won','₩','.kp','북한','Asia','Eastern Asia','[{\"zoneName\":\"Asia/Pyongyang\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"KST\",\"tzName\":\"Korea Standard Time\"}]','{\"kr\":\"조선민주주의인민공화국\",\"br\":\"Coreia do Norte\",\"pt\":\"Coreia do Norte\",\"nl\":\"Noord-Korea\",\"hr\":\"Sjeverna Koreja\",\"fa\":\"کره جنوبی\",\"de\":\"Nordkorea\",\"es\":\"Corea del Norte\",\"fr\":\"Corée du Nord\",\"ja\":\"朝鮮民主主義人民共和国\",\"it\":\"Corea del Nord\",\"cn\":\"朝鲜\"}',40.00000000,127.00000000,'??','U+1F1F0 U+1F1F5','2018-07-21 01:41:03','2021-12-11 19:05:28',1,'Q423'),(116,'South Korea','KOR','410','KR','82','Seoul','KRW','Won','₩','.kr','대한민국','Asia','Eastern Asia','[{\"zoneName\":\"Asia/Seoul\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"KST\",\"tzName\":\"Korea Standard Time\"}]','{\"kr\":\"대한민국\",\"br\":\"Coreia do Sul\",\"pt\":\"Coreia do Sul\",\"nl\":\"Zuid-Korea\",\"hr\":\"Južna Koreja\",\"fa\":\"کره شمالی\",\"de\":\"Südkorea\",\"es\":\"Corea del Sur\",\"fr\":\"Corée du Sud\",\"ja\":\"大韓民国\",\"it\":\"Corea del Sud\",\"cn\":\"韩国\"}',37.00000000,127.50000000,'??','U+1F1F0 U+1F1F7','2018-07-21 01:41:03','2021-12-11 19:12:11',1,'Q884'),(117,'Kuwait','KWT','414','KW','965','Kuwait City','KWD','Kuwaiti dinar','ك.د','.kw','الكويت','Asia','Western Asia','[{\"zoneName\":\"Asia/Kuwait\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]','{\"kr\":\"쿠웨이트\",\"br\":\"Kuwait\",\"pt\":\"Kuwait\",\"nl\":\"Koeweit\",\"hr\":\"Kuvajt\",\"fa\":\"کویت\",\"de\":\"Kuwait\",\"es\":\"Kuwait\",\"fr\":\"Koweït\",\"ja\":\"クウェート\",\"it\":\"Kuwait\",\"cn\":\"科威特\"}',29.50000000,45.75000000,'??','U+1F1F0 U+1F1FC','2018-07-21 01:41:03','2021-12-11 18:56:44',1,'Q817'),(118,'Kyrgyzstan','KGZ','417','KG','996','Bishkek','KGS','Kyrgyzstani som','лв','.kg','Кыргызстан','Asia','Central Asia','[{\"zoneName\":\"Asia/Bishkek\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"KGT\",\"tzName\":\"Kyrgyzstan Time\"}]','{\"kr\":\"키르기스스탄\",\"br\":\"Quirguistão\",\"pt\":\"Quirguizistão\",\"nl\":\"Kirgizië\",\"hr\":\"Kirgistan\",\"fa\":\"قرقیزستان\",\"de\":\"Kirgisistan\",\"es\":\"Kirguizistán\",\"fr\":\"Kirghizistan\",\"ja\":\"キルギス\",\"it\":\"Kirghizistan\",\"cn\":\"吉尔吉斯斯坦\"}',41.00000000,75.00000000,'??','U+1F1F0 U+1F1EC','2018-07-21 01:41:03','2021-12-11 18:56:49',1,'Q813'),(119,'Laos','LAO','418','LA','856','Vientiane','LAK','Lao kip','₭','.la','ສປປລາວ','Asia','South-Eastern Asia','[{\"zoneName\":\"Asia/Vientiane\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"ICT\",\"tzName\":\"Indochina Time\"}]','{\"kr\":\"라오스\",\"br\":\"Laos\",\"pt\":\"Laos\",\"nl\":\"Laos\",\"hr\":\"Laos\",\"fa\":\"لائوس\",\"de\":\"Laos\",\"es\":\"Laos\",\"fr\":\"Laos\",\"ja\":\"ラオス人民民主共和国\",\"it\":\"Laos\",\"cn\":\"寮人民民主共和国\"}',18.00000000,105.00000000,'??','U+1F1F1 U+1F1E6','2018-07-21 01:41:03','2021-12-11 18:56:58',1,'Q819'),(120,'Latvia','LVA','428','LV','371','Riga','EUR','Euro','€','.lv','Latvija','Europe','Northern Europe','[{\"zoneName\":\"Europe/Riga\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]','{\"kr\":\"라트비아\",\"br\":\"Letônia\",\"pt\":\"Letónia\",\"nl\":\"Letland\",\"hr\":\"Latvija\",\"fa\":\"لتونی\",\"de\":\"Lettland\",\"es\":\"Letonia\",\"fr\":\"Lettonie\",\"ja\":\"ラトビア\",\"it\":\"Lettonia\",\"cn\":\"拉脱维亚\"}',57.00000000,25.00000000,'??','U+1F1F1 U+1F1FB','2018-07-21 01:41:03','2021-12-11 18:57:04',1,'Q211'),(121,'Lebanon','LBN','422','LB','961','Beirut','LBP','Lebanese pound','£','.lb','لبنان','Asia','Western Asia','[{\"zoneName\":\"Asia/Beirut\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]','{\"kr\":\"레바논\",\"br\":\"Líbano\",\"pt\":\"Líbano\",\"nl\":\"Libanon\",\"hr\":\"Libanon\",\"fa\":\"لبنان\",\"de\":\"Libanon\",\"es\":\"Líbano\",\"fr\":\"Liban\",\"ja\":\"レバノン\",\"it\":\"Libano\",\"cn\":\"黎巴嫩\"}',33.83333333,35.83333333,'??','U+1F1F1 U+1F1E7','2018-07-21 01:41:03','2021-12-11 18:57:10',1,'Q822'),(122,'Lesotho','LSO','426','LS','266','Maseru','LSL','Lesotho loti','L','.ls','Lesotho','Africa','Southern Africa','[{\"zoneName\":\"Africa/Maseru\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"SAST\",\"tzName\":\"South African Standard Time\"}]','{\"kr\":\"레소토\",\"br\":\"Lesoto\",\"pt\":\"Lesoto\",\"nl\":\"Lesotho\",\"hr\":\"Lesoto\",\"fa\":\"لسوتو\",\"de\":\"Lesotho\",\"es\":\"Lesotho\",\"fr\":\"Lesotho\",\"ja\":\"レソト\",\"it\":\"Lesotho\",\"cn\":\"莱索托\"}',-29.50000000,28.50000000,'??','U+1F1F1 U+1F1F8','2018-07-21 01:41:03','2021-12-11 18:57:27',1,'Q1013'),(123,'Liberia','LBR','430','LR','231','Monrovia','LRD','Liberian dollar','$','.lr','Liberia','Africa','Western Africa','[{\"zoneName\":\"Africa/Monrovia\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]','{\"kr\":\"라이베리아\",\"br\":\"Libéria\",\"pt\":\"Libéria\",\"nl\":\"Liberia\",\"hr\":\"Liberija\",\"fa\":\"لیبریا\",\"de\":\"Liberia\",\"es\":\"Liberia\",\"fr\":\"Liberia\",\"ja\":\"リベリア\",\"it\":\"Liberia\",\"cn\":\"利比里亚\"}',6.50000000,-9.50000000,'??','U+1F1F1 U+1F1F7','2018-07-21 01:41:03','2021-12-11 18:57:33',1,'Q1014'),(124,'Libya','LBY','434','LY','218','Tripolis','LYD','Libyan dinar','د.ل','.ly','‏ليبيا','Africa','Northern Africa','[{\"zoneName\":\"Africa/Tripoli\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]','{\"kr\":\"리비아\",\"br\":\"Líbia\",\"pt\":\"Líbia\",\"nl\":\"Libië\",\"hr\":\"Libija\",\"fa\":\"لیبی\",\"de\":\"Libyen\",\"es\":\"Libia\",\"fr\":\"Libye\",\"ja\":\"リビア\",\"it\":\"Libia\",\"cn\":\"利比亚\"}',25.00000000,17.00000000,'??','U+1F1F1 U+1F1FE','2018-07-21 01:41:03','2021-12-11 18:57:38',1,'Q1016'),(125,'Liechtenstein','LIE','438','LI','423','Vaduz','CHF','Swiss franc','CHf','.li','Liechtenstein','Europe','Western Europe','[{\"zoneName\":\"Europe/Vaduz\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"리히텐슈타인\",\"br\":\"Liechtenstein\",\"pt\":\"Listenstaine\",\"nl\":\"Liechtenstein\",\"hr\":\"Lihtenštajn\",\"fa\":\"لیختن‌اشتاین\",\"de\":\"Liechtenstein\",\"es\":\"Liechtenstein\",\"fr\":\"Liechtenstein\",\"ja\":\"リヒテンシュタイン\",\"it\":\"Liechtenstein\",\"cn\":\"列支敦士登\"}',47.26666666,9.53333333,'??','U+1F1F1 U+1F1EE','2018-07-21 01:41:03','2021-12-11 18:57:47',1,'Q347'),(126,'Lithuania','LTU','440','LT','370','Vilnius','EUR','Euro','€','.lt','Lietuva','Europe','Northern Europe','[{\"zoneName\":\"Europe/Vilnius\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]','{\"kr\":\"리투아니아\",\"br\":\"Lituânia\",\"pt\":\"Lituânia\",\"nl\":\"Litouwen\",\"hr\":\"Litva\",\"fa\":\"لیتوانی\",\"de\":\"Litauen\",\"es\":\"Lituania\",\"fr\":\"Lituanie\",\"ja\":\"リトアニア\",\"it\":\"Lituania\",\"cn\":\"立陶宛\"}',56.00000000,24.00000000,'??','U+1F1F1 U+1F1F9','2018-07-21 01:41:03','2021-12-11 18:58:00',1,'Q37'),(127,'Luxembourg','LUX','442','LU','352','Luxembourg','EUR','Euro','€','.lu','Luxembourg','Europe','Western Europe','[{\"zoneName\":\"Europe/Luxembourg\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"룩셈부르크\",\"br\":\"Luxemburgo\",\"pt\":\"Luxemburgo\",\"nl\":\"Luxemburg\",\"hr\":\"Luksemburg\",\"fa\":\"لوکزامبورگ\",\"de\":\"Luxemburg\",\"es\":\"Luxemburgo\",\"fr\":\"Luxembourg\",\"ja\":\"ルクセンブルク\",\"it\":\"Lussemburgo\",\"cn\":\"卢森堡\"}',49.75000000,6.16666666,'??','U+1F1F1 U+1F1FA','2018-07-21 01:41:03','2021-12-11 18:58:06',1,'Q32'),(128,'Macau S.A.R.','MAC','446','MO','853','Macao','MOP','Macanese pataca','$','.mo','澳門','Asia','Eastern Asia','[{\"zoneName\":\"Asia/Macau\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"CST\",\"tzName\":\"China Standard Time\"}]','{\"kr\":\"마카오\",\"br\":\"Macau\",\"pt\":\"Macau\",\"nl\":\"Macao\",\"hr\":\"Makao\",\"fa\":\"مکائو\",\"de\":\"Macao\",\"es\":\"Macao\",\"fr\":\"Macao\",\"ja\":\"マカオ\",\"it\":\"Macao\",\"cn\":\"中国澳门\"}',22.16666666,113.55000000,'??','U+1F1F2 U+1F1F4','2018-07-21 01:41:03','2021-12-11 18:58:15',1,NULL),(129,'Macedonia','MKD','807','MK','389','Skopje','MKD','Denar','ден','.mk','Северна Македонија','Europe','Southern Europe','[{\"zoneName\":\"Europe/Skopje\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"마케도니아\",\"br\":\"Macedônia\",\"pt\":\"Macedónia\",\"nl\":\"Macedonië\",\"hr\":\"Makedonija\",\"fa\":\"\",\"de\":\"Mazedonien\",\"es\":\"Macedonia\",\"fr\":\"Macédoine\",\"ja\":\"マケドニア旧ユーゴスラビア共和国\",\"it\":\"Macedonia\",\"cn\":\"马其顿\"}',41.83333333,22.00000000,'??','U+1F1F2 U+1F1F0','2018-07-21 01:41:03','2021-12-11 18:58:42',1,'Q221'),(130,'Madagascar','MDG','450','MG','261','Antananarivo','MGA','Malagasy ariary','Ar','.mg','Madagasikara','Africa','Eastern Africa','[{\"zoneName\":\"Indian/Antananarivo\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]','{\"kr\":\"마다가스카르\",\"br\":\"Madagascar\",\"pt\":\"Madagáscar\",\"nl\":\"Madagaskar\",\"hr\":\"Madagaskar\",\"fa\":\"ماداگاسکار\",\"de\":\"Madagaskar\",\"es\":\"Madagascar\",\"fr\":\"Madagascar\",\"ja\":\"マダガスカル\",\"it\":\"Madagascar\",\"cn\":\"马达加斯加\"}',-20.00000000,47.00000000,'??','U+1F1F2 U+1F1EC','2018-07-21 01:41:03','2021-12-11 18:58:52',1,'Q1019'),(131,'Malawi','MWI','454','MW','265','Lilongwe','MWK','Malawian kwacha','MK','.mw','Malawi','Africa','Eastern Africa','[{\"zoneName\":\"Africa/Blantyre\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]','{\"kr\":\"말라위\",\"br\":\"Malawi\",\"pt\":\"Malávi\",\"nl\":\"Malawi\",\"hr\":\"Malavi\",\"fa\":\"مالاوی\",\"de\":\"Malawi\",\"es\":\"Malawi\",\"fr\":\"Malawi\",\"ja\":\"マラウイ\",\"it\":\"Malawi\",\"cn\":\"马拉维\"}',-13.50000000,34.00000000,'??','U+1F1F2 U+1F1FC','2018-07-21 01:41:03','2021-12-11 18:59:01',1,'Q1020'),(132,'Malaysia','MYS','458','MY','60','Kuala Lumpur','MYR','Malaysian ringgit','RM','.my','Malaysia','Asia','South-Eastern Asia','[{\"zoneName\":\"Asia/Kuala_Lumpur\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"MYT\",\"tzName\":\"Malaysia Time\"},{\"zoneName\":\"Asia/Kuching\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"MYT\",\"tzName\":\"Malaysia Time\"}]','{\"kr\":\"말레이시아\",\"br\":\"Malásia\",\"pt\":\"Malásia\",\"nl\":\"Maleisië\",\"hr\":\"Malezija\",\"fa\":\"مالزی\",\"de\":\"Malaysia\",\"es\":\"Malasia\",\"fr\":\"Malaisie\",\"ja\":\"マレーシア\",\"it\":\"Malesia\",\"cn\":\"马来西亚\"}',2.50000000,112.50000000,'??','U+1F1F2 U+1F1FE','2018-07-21 01:41:03','2021-12-11 18:59:08',1,'Q833'),(133,'Maldives','MDV','462','MV','960','Male','MVR','Maldivian rufiyaa','Rf','.mv','Maldives','Asia','Southern Asia','[{\"zoneName\":\"Indian/Maldives\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"MVT\",\"tzName\":\"Maldives Time\"}]','{\"kr\":\"몰디브\",\"br\":\"Maldivas\",\"pt\":\"Maldivas\",\"nl\":\"Maldiven\",\"hr\":\"Maldivi\",\"fa\":\"مالدیو\",\"de\":\"Malediven\",\"es\":\"Maldivas\",\"fr\":\"Maldives\",\"ja\":\"モルディブ\",\"it\":\"Maldive\",\"cn\":\"马尔代夫\"}',3.25000000,73.00000000,'??','U+1F1F2 U+1F1FB','2018-07-21 01:41:03','2021-12-11 18:59:15',1,'Q826'),(134,'Mali','MLI','466','ML','223','Bamako','XOF','West African CFA franc','CFA','.ml','Mali','Africa','Western Africa','[{\"zoneName\":\"Africa/Bamako\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]','{\"kr\":\"말리\",\"br\":\"Mali\",\"pt\":\"Mali\",\"nl\":\"Mali\",\"hr\":\"Mali\",\"fa\":\"مالی\",\"de\":\"Mali\",\"es\":\"Mali\",\"fr\":\"Mali\",\"ja\":\"マリ\",\"it\":\"Mali\",\"cn\":\"马里\"}',17.00000000,-4.00000000,'??','U+1F1F2 U+1F1F1','2018-07-21 01:41:03','2021-12-11 18:59:20',1,'Q912'),(135,'Malta','MLT','470','MT','356','Valletta','EUR','Euro','€','.mt','Malta','Europe','Southern Europe','[{\"zoneName\":\"Europe/Malta\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"몰타\",\"br\":\"Malta\",\"pt\":\"Malta\",\"nl\":\"Malta\",\"hr\":\"Malta\",\"fa\":\"مالت\",\"de\":\"Malta\",\"es\":\"Malta\",\"fr\":\"Malte\",\"ja\":\"マルタ\",\"it\":\"Malta\",\"cn\":\"马耳他\"}',35.83333333,14.58333333,'??','U+1F1F2 U+1F1F9','2018-07-21 01:41:03','2021-12-11 18:59:26',1,'Q233'),(136,'Man (Isle of)','IMN','833','IM','+44-1624','Douglas, Isle of Man','GBP','British pound','£','.im','Isle of Man','Europe','Northern Europe','[{\"zoneName\":\"Europe/Isle_of_Man\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]','{\"kr\":\"맨 섬\",\"br\":\"Ilha de Man\",\"pt\":\"Ilha de Man\",\"nl\":\"Isle of Man\",\"hr\":\"Otok Man\",\"fa\":\"جزیره من\",\"de\":\"Insel Man\",\"es\":\"Isla de Man\",\"fr\":\"Île de Man\",\"ja\":\"マン島\",\"it\":\"Isola di Man\",\"cn\":\"马恩岛\"}',54.25000000,-4.50000000,'??','U+1F1EE U+1F1F2','2018-07-21 01:41:03','2021-12-11 18:59:43',1,NULL),(137,'Marshall Islands','MHL','584','MH','692','Majuro','USD','United States dollar','$','.mh','M̧ajeļ','Oceania','Micronesia','[{\"zoneName\":\"Pacific/Kwajalein\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"MHT\",\"tzName\":\"Marshall Islands Time\"},{\"zoneName\":\"Pacific/Majuro\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"MHT\",\"tzName\":\"Marshall Islands Time\"}]','{\"kr\":\"마셜 제도\",\"br\":\"Ilhas Marshall\",\"pt\":\"Ilhas Marshall\",\"nl\":\"Marshalleilanden\",\"hr\":\"Maršalovi Otoci\",\"fa\":\"جزایر مارشال\",\"de\":\"Marshallinseln\",\"es\":\"Islas Marshall\",\"fr\":\"Îles Marshall\",\"ja\":\"マーシャル諸島\",\"it\":\"Isole Marshall\",\"cn\":\"马绍尔群岛\"}',9.00000000,168.00000000,'??','U+1F1F2 U+1F1ED','2018-07-21 01:41:03','2021-12-11 19:00:32',1,'Q709'),(138,'Martinique','MTQ','474','MQ','596','Fort-de-France','EUR','Euro','€','.mq','Martinique','Americas','Caribbean','[{\"zoneName\":\"America/Martinique\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"마르티니크\",\"br\":\"Martinica\",\"pt\":\"Martinica\",\"nl\":\"Martinique\",\"hr\":\"Martinique\",\"fa\":\"مونتسرات\",\"de\":\"Martinique\",\"es\":\"Martinica\",\"fr\":\"Martinique\",\"ja\":\"マルティニーク\",\"it\":\"Martinica\",\"cn\":\"马提尼克岛\"}',14.66666700,-61.00000000,'??','U+1F1F2 U+1F1F6','2018-07-21 01:41:03','2021-12-11 19:00:44',1,NULL),(139,'Mauritania','MRT','478','MR','222','Nouakchott','MRO','Mauritanian ouguiya','MRU','.mr','موريتانيا','Africa','Western Africa','[{\"zoneName\":\"Africa/Nouakchott\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]','{\"kr\":\"모리타니\",\"br\":\"Mauritânia\",\"pt\":\"Mauritânia\",\"nl\":\"Mauritanië\",\"hr\":\"Mauritanija\",\"fa\":\"موریتانی\",\"de\":\"Mauretanien\",\"es\":\"Mauritania\",\"fr\":\"Mauritanie\",\"ja\":\"モーリタニア\",\"it\":\"Mauritania\",\"cn\":\"毛里塔尼亚\"}',20.00000000,-12.00000000,'??','U+1F1F2 U+1F1F7','2018-07-21 01:41:03','2021-12-11 19:01:03',1,'Q1025'),(140,'Mauritius','MUS','480','MU','230','Port Louis','MUR','Mauritian rupee','₨','.mu','Maurice','Africa','Eastern Africa','[{\"zoneName\":\"Indian/Mauritius\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"MUT\",\"tzName\":\"Mauritius Time\"}]','{\"kr\":\"모리셔스\",\"br\":\"Maurício\",\"pt\":\"Maurícia\",\"nl\":\"Mauritius\",\"hr\":\"Mauricijus\",\"fa\":\"موریس\",\"de\":\"Mauritius\",\"es\":\"Mauricio\",\"fr\":\"Île Maurice\",\"ja\":\"モーリシャス\",\"it\":\"Mauritius\",\"cn\":\"毛里求斯\"}',-20.28333333,57.55000000,'??','U+1F1F2 U+1F1FA','2018-07-21 01:41:03','2021-12-11 19:01:10',1,'Q1027'),(141,'Mayotte','MYT','175','YT','262','Mamoudzou','EUR','Euro','€','.yt','Mayotte','Africa','Eastern Africa','[{\"zoneName\":\"Indian/Mayotte\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]','{\"kr\":\"마요트\",\"br\":\"Mayotte\",\"pt\":\"Mayotte\",\"nl\":\"Mayotte\",\"hr\":\"Mayotte\",\"fa\":\"مایوت\",\"de\":\"Mayotte\",\"es\":\"Mayotte\",\"fr\":\"Mayotte\",\"ja\":\"マヨット\",\"it\":\"Mayotte\",\"cn\":\"马约特\"}',-12.83333333,45.16666666,'??','U+1F1FE U+1F1F9','2018-07-21 01:41:03','2021-12-11 19:01:15',1,NULL),(142,'Mexico','MEX','484','MX','52','Ciudad de México','MXN','Mexican peso','$','.mx','México','Americas','Central America','[{\"zoneName\":\"America/Bahia_Banderas\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Cancun\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Chihuahua\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Hermosillo\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Matamoros\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Mazatlan\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Merida\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Mexico_City\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Monterrey\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Ojinaga\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Tijuana\",\"gmtOffset\":-28800,\"gmtOffsetName\":\"UTC-08:00\",\"abbreviation\":\"PST\",\"tzName\":\"Pacific Standard Time (North America\"}]','{\"kr\":\"멕시코\",\"br\":\"México\",\"pt\":\"México\",\"nl\":\"Mexico\",\"hr\":\"Meksiko\",\"fa\":\"مکزیک\",\"de\":\"Mexiko\",\"es\":\"México\",\"fr\":\"Mexique\",\"ja\":\"メキシコ\",\"it\":\"Messico\",\"cn\":\"墨西哥\"}',23.00000000,-102.00000000,'??','U+1F1F2 U+1F1FD','2018-07-21 01:41:03','2021-12-11 19:01:23',1,'Q96'),(143,'Micronesia','FSM','583','FM','691','Palikir','USD','United States dollar','$','.fm','Micronesia','Oceania','Micronesia','[{\"zoneName\":\"Pacific/Chuuk\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"CHUT\",\"tzName\":\"Chuuk Time\"},{\"zoneName\":\"Pacific/Kosrae\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"KOST\",\"tzName\":\"Kosrae Time\"},{\"zoneName\":\"Pacific/Pohnpei\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"PONT\",\"tzName\":\"Pohnpei Standard Time\"}]','{\"kr\":\"미크로네시아 연방\",\"br\":\"Micronésia\",\"pt\":\"Micronésia\",\"nl\":\"Micronesië\",\"hr\":\"Mikronezija\",\"fa\":\"ایالات فدرال میکرونزی\",\"de\":\"Mikronesien\",\"es\":\"Micronesia\",\"fr\":\"Micronésie\",\"ja\":\"ミクロネシア連邦\",\"it\":\"Micronesia\",\"cn\":\"密克罗尼西亚\"}',6.91666666,158.25000000,'??','U+1F1EB U+1F1F2','2018-07-21 01:41:03','2021-12-11 19:01:30',1,'Q702'),(144,'Moldova','MDA','498','MD','373','Chisinau','MDL','Moldovan leu','L','.md','Moldova','Europe','Eastern Europe','[{\"zoneName\":\"Europe/Chisinau\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]','{\"kr\":\"몰도바\",\"br\":\"Moldávia\",\"pt\":\"Moldávia\",\"nl\":\"Moldavië\",\"hr\":\"Moldova\",\"fa\":\"مولداوی\",\"de\":\"Moldawie\",\"es\":\"Moldavia\",\"fr\":\"Moldavie\",\"ja\":\"モルドバ共和国\",\"it\":\"Moldavia\",\"cn\":\"摩尔多瓦\"}',47.00000000,29.00000000,'??','U+1F1F2 U+1F1E9','2018-07-21 01:41:03','2021-12-11 19:01:39',1,'Q217'),(145,'Monaco','MCO','492','MC','377','Monaco','EUR','Euro','€','.mc','Monaco','Europe','Western Europe','[{\"zoneName\":\"Europe/Monaco\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"모나코\",\"br\":\"Mônaco\",\"pt\":\"Mónaco\",\"nl\":\"Monaco\",\"hr\":\"Monako\",\"fa\":\"موناکو\",\"de\":\"Monaco\",\"es\":\"Mónaco\",\"fr\":\"Monaco\",\"ja\":\"モナコ\",\"it\":\"Principato di Monaco\",\"cn\":\"摩纳哥\"}',43.73333333,7.40000000,'??','U+1F1F2 U+1F1E8','2018-07-21 01:41:03','2021-12-11 19:01:44',1,'Q235'),(146,'Mongolia','MNG','496','MN','976','Ulan Bator','MNT','Mongolian tögrög','₮','.mn','Монгол улс','Asia','Eastern Asia','[{\"zoneName\":\"Asia/Choibalsan\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"CHOT\",\"tzName\":\"Choibalsan Standard Time\"},{\"zoneName\":\"Asia/Hovd\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"HOVT\",\"tzName\":\"Hovd Time\"},{\"zoneName\":\"Asia/Ulaanbaatar\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"ULAT\",\"tzName\":\"Ulaanbaatar Standard Time\"}]','{\"kr\":\"몽골\",\"br\":\"Mongólia\",\"pt\":\"Mongólia\",\"nl\":\"Mongolië\",\"hr\":\"Mongolija\",\"fa\":\"مغولستان\",\"de\":\"Mongolei\",\"es\":\"Mongolia\",\"fr\":\"Mongolie\",\"ja\":\"モンゴル\",\"it\":\"Mongolia\",\"cn\":\"蒙古\"}',46.00000000,105.00000000,'??','U+1F1F2 U+1F1F3','2018-07-21 01:41:03','2021-12-11 19:02:45',1,'Q711'),(147,'Montenegro','MNE','499','ME','382','Podgorica','EUR','Euro','€','.me','Црна Гора','Europe','Southern Europe','[{\"zoneName\":\"Europe/Podgorica\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"몬테네그로\",\"br\":\"Montenegro\",\"pt\":\"Montenegro\",\"nl\":\"Montenegro\",\"hr\":\"Crna Gora\",\"fa\":\"مونته‌نگرو\",\"de\":\"Montenegro\",\"es\":\"Montenegro\",\"fr\":\"Monténégro\",\"ja\":\"モンテネグロ\",\"it\":\"Montenegro\",\"cn\":\"黑山\"}',42.50000000,19.30000000,'??','U+1F1F2 U+1F1EA','2018-07-21 01:41:03','2021-12-11 19:01:46',1,'Q236'),(148,'Montserrat','MSR','500','MS','+1-664','Plymouth','XCD','Eastern Caribbean dollar','$','.ms','Montserrat','Americas','Caribbean','[{\"zoneName\":\"America/Montserrat\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"몬트세랫\",\"br\":\"Montserrat\",\"pt\":\"Monserrate\",\"nl\":\"Montserrat\",\"hr\":\"Montserrat\",\"fa\":\"مایوت\",\"de\":\"Montserrat\",\"es\":\"Montserrat\",\"fr\":\"Montserrat\",\"ja\":\"モントセラト\",\"it\":\"Montserrat\",\"cn\":\"蒙特塞拉特\"}',16.75000000,-62.20000000,'??','U+1F1F2 U+1F1F8','2018-07-21 01:41:03','2021-12-11 19:02:56',1,NULL),(149,'Morocco','MAR','504','MA','212','Rabat','MAD','Moroccan dirham','DH','.ma','المغرب','Africa','Northern Africa','[{\"zoneName\":\"Africa/Casablanca\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WEST\",\"tzName\":\"Western European Summer Time\"}]','{\"kr\":\"모로코\",\"br\":\"Marrocos\",\"pt\":\"Marrocos\",\"nl\":\"Marokko\",\"hr\":\"Maroko\",\"fa\":\"مراکش\",\"de\":\"Marokko\",\"es\":\"Marruecos\",\"fr\":\"Maroc\",\"ja\":\"モロッコ\",\"it\":\"Marocco\",\"cn\":\"摩洛哥\"}',32.00000000,-5.00000000,'??','U+1F1F2 U+1F1E6','2018-07-21 01:41:03','2021-12-11 19:03:08',1,'Q1028'),(150,'Mozambique','MOZ','508','MZ','258','Maputo','MZN','Mozambican metical','MT','.mz','Moçambique','Africa','Eastern Africa','[{\"zoneName\":\"Africa/Maputo\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]','{\"kr\":\"모잠비크\",\"br\":\"Moçambique\",\"pt\":\"Moçambique\",\"nl\":\"Mozambique\",\"hr\":\"Mozambik\",\"fa\":\"موزامبیک\",\"de\":\"Mosambik\",\"es\":\"Mozambique\",\"fr\":\"Mozambique\",\"ja\":\"モザンビーク\",\"it\":\"Mozambico\",\"cn\":\"莫桑比克\"}',-18.25000000,35.00000000,'??','U+1F1F2 U+1F1FF','2018-07-21 01:41:03','2021-12-11 19:03:19',1,'Q1029'),(151,'Myanmar','MMR','104','MM','95','Nay Pyi Taw','MMK','Burmese kyat','K','.mm','မြန်မာ','Asia','South-Eastern Asia','[{\"zoneName\":\"Asia/Yangon\",\"gmtOffset\":23400,\"gmtOffsetName\":\"UTC+06:30\",\"abbreviation\":\"MMT\",\"tzName\":\"Myanmar Standard Time\"}]','{\"kr\":\"미얀마\",\"br\":\"Myanmar\",\"pt\":\"Myanmar\",\"nl\":\"Myanmar\",\"hr\":\"Mijanmar\",\"fa\":\"میانمار\",\"de\":\"Myanmar\",\"es\":\"Myanmar\",\"fr\":\"Myanmar\",\"ja\":\"ミャンマー\",\"it\":\"Birmania\",\"cn\":\"缅甸\"}',22.00000000,98.00000000,'??','U+1F1F2 U+1F1F2','2018-07-21 01:41:03','2021-12-11 19:03:25',1,'Q836'),(152,'Namibia','NAM','516','NA','264','Windhoek','NAD','Namibian dollar','$','.na','Namibia','Africa','Southern Africa','[{\"zoneName\":\"Africa/Windhoek\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"WAST\",\"tzName\":\"West Africa Summer Time\"}]','{\"kr\":\"나미비아\",\"br\":\"Namíbia\",\"pt\":\"Namíbia\",\"nl\":\"Namibië\",\"hr\":\"Namibija\",\"fa\":\"نامیبیا\",\"de\":\"Namibia\",\"es\":\"Namibia\",\"fr\":\"Namibie\",\"ja\":\"ナミビア\",\"it\":\"Namibia\",\"cn\":\"纳米比亚\"}',-22.00000000,17.00000000,'??','U+1F1F3 U+1F1E6','2018-07-21 01:41:03','2021-12-11 19:03:32',1,'Q1030'),(153,'Nauru','NRU','520','NR','674','Yaren','AUD','Australian dollar','$','.nr','Nauru','Oceania','Micronesia','[{\"zoneName\":\"Pacific/Nauru\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"NRT\",\"tzName\":\"Nauru Time\"}]','{\"kr\":\"나우루\",\"br\":\"Nauru\",\"pt\":\"Nauru\",\"nl\":\"Nauru\",\"hr\":\"Nauru\",\"fa\":\"نائورو\",\"de\":\"Nauru\",\"es\":\"Nauru\",\"fr\":\"Nauru\",\"ja\":\"ナウル\",\"it\":\"Nauru\",\"cn\":\"瑙鲁\"}',-0.53333333,166.91666666,'??','U+1F1F3 U+1F1F7','2018-07-21 01:41:03','2021-12-11 19:03:37',1,'Q697'),(154,'Nepal','NPL','524','NP','977','Kathmandu','NPR','Nepalese rupee','₨','.np','नपल','Asia','Southern Asia','[{\"zoneName\":\"Asia/Kathmandu\",\"gmtOffset\":20700,\"gmtOffsetName\":\"UTC+05:45\",\"abbreviation\":\"NPT\",\"tzName\":\"Nepal Time\"}]','{\"kr\":\"네팔\",\"br\":\"Nepal\",\"pt\":\"Nepal\",\"nl\":\"Nepal\",\"hr\":\"Nepal\",\"fa\":\"نپال\",\"de\":\"Népal\",\"es\":\"Nepal\",\"fr\":\"Népal\",\"ja\":\"ネパール\",\"it\":\"Nepal\",\"cn\":\"尼泊尔\"}',28.00000000,84.00000000,'??','U+1F1F3 U+1F1F5','2018-07-21 01:41:03','2021-12-11 19:03:41',1,'Q837'),(155,'Bonaire, Sint Eustatius and Saba','BES','535','BQ','599','Kralendijk','USD','United States dollar','$','.an','Caribisch Nederland','Americas','Caribbean','[{\"zoneName\":\"America/Anguilla\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"보네르 섬\",\"br\":\"Bonaire\",\"pt\":\"Bonaire\",\"fa\":\"بونیر\",\"de\":\"Bonaire, Sint Eustatius und Saba\",\"fr\":\"Bonaire, Saint-Eustache et Saba\",\"it\":\"Bonaire, Saint-Eustache e Saba\",\"cn\":\"博内尔岛、圣尤斯特歇斯和萨巴岛\"}',12.15000000,-68.26666700,'??','U+1F1E7 U+1F1F6','2018-07-21 01:41:03','2021-12-11 18:28:02',1,'Q27561'),(156,'Netherlands','NLD','528','NL','31','Amsterdam','EUR','Euro','€','.nl','Nederland','Europe','Western Europe','[{\"zoneName\":\"Europe/Amsterdam\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"네덜란드 \",\"br\":\"Holanda\",\"pt\":\"Países Baixos\",\"nl\":\"Nederland\",\"hr\":\"Nizozemska\",\"fa\":\"پادشاهی هلند\",\"de\":\"Niederlande\",\"es\":\"Países Bajos\",\"fr\":\"Pays-Bas\",\"ja\":\"オランダ\",\"it\":\"Paesi Bassi\",\"cn\":\"荷兰\"}',52.50000000,5.75000000,'??','U+1F1F3 U+1F1F1','2018-07-21 01:41:03','2021-12-11 19:01:52',1,'Q55'),(157,'New Caledonia','NCL','540','NC','687','Noumea','XPF','CFP franc','₣','.nc','Nouvelle-Calédonie','Oceania','Melanesia','[{\"zoneName\":\"Pacific/Noumea\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"NCT\",\"tzName\":\"New Caledonia Time\"}]','{\"kr\":\"누벨칼레도니\",\"br\":\"Nova Caledônia\",\"pt\":\"Nova Caledónia\",\"nl\":\"Nieuw-Caledonië\",\"hr\":\"Nova Kaledonija\",\"fa\":\"کالدونیای جدید\",\"de\":\"Neukaledonien\",\"es\":\"Nueva Caledonia\",\"fr\":\"Nouvelle-Calédonie\",\"ja\":\"ニューカレドニア\",\"it\":\"Nuova Caledonia\",\"cn\":\"新喀里多尼亚\"}',-21.50000000,165.50000000,'??','U+1F1F3 U+1F1E8','2018-07-21 01:41:03','2021-12-11 19:04:11',1,NULL),(158,'New Zealand','NZL','554','NZ','64','Wellington','NZD','New Zealand dollar','$','.nz','New Zealand','Oceania','Australia and New Zealand','[{\"zoneName\":\"Pacific/Auckland\",\"gmtOffset\":46800,\"gmtOffsetName\":\"UTC+13:00\",\"abbreviation\":\"NZDT\",\"tzName\":\"New Zealand Daylight Time\"},{\"zoneName\":\"Pacific/Chatham\",\"gmtOffset\":49500,\"gmtOffsetName\":\"UTC+13:45\",\"abbreviation\":\"CHAST\",\"tzName\":\"Chatham Standard Time\"}]','{\"kr\":\"뉴질랜드\",\"br\":\"Nova Zelândia\",\"pt\":\"Nova Zelândia\",\"nl\":\"Nieuw-Zeeland\",\"hr\":\"Novi Zeland\",\"fa\":\"نیوزیلند\",\"de\":\"Neuseeland\",\"es\":\"Nueva Zelanda\",\"fr\":\"Nouvelle-Zélande\",\"ja\":\"ニュージーランド\",\"it\":\"Nuova Zelanda\",\"cn\":\"新西兰\"}',-41.00000000,174.00000000,'??','U+1F1F3 U+1F1FF','2018-07-21 01:41:03','2021-12-11 19:04:18',1,'Q664'),(159,'Nicaragua','NIC','558','NI','505','Managua','NIO','Nicaraguan córdoba','C$','.ni','Nicaragua','Americas','Central America','[{\"zoneName\":\"America/Managua\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"}]','{\"kr\":\"니카라과\",\"br\":\"Nicarágua\",\"pt\":\"Nicarágua\",\"nl\":\"Nicaragua\",\"hr\":\"Nikaragva\",\"fa\":\"نیکاراگوئه\",\"de\":\"Nicaragua\",\"es\":\"Nicaragua\",\"fr\":\"Nicaragua\",\"ja\":\"ニカラグア\",\"it\":\"Nicaragua\",\"cn\":\"尼加拉瓜\"}',13.00000000,-85.00000000,'??','U+1F1F3 U+1F1EE','2018-07-21 01:41:03','2021-12-11 19:04:25',1,'Q811'),(160,'Niger','NER','562','NE','227','Niamey','XOF','West African CFA franc','CFA','.ne','Niger','Africa','Western Africa','[{\"zoneName\":\"Africa/Niamey\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]','{\"kr\":\"니제르\",\"br\":\"Níger\",\"pt\":\"Níger\",\"nl\":\"Niger\",\"hr\":\"Niger\",\"fa\":\"نیجر\",\"de\":\"Niger\",\"es\":\"Níger\",\"fr\":\"Niger\",\"ja\":\"ニジェール\",\"it\":\"Niger\",\"cn\":\"尼日尔\"}',16.00000000,8.00000000,'??','U+1F1F3 U+1F1EA','2018-07-21 01:41:03','2021-12-11 19:04:32',1,'Q1032'),(161,'Nigeria','NGA','566','NG','234','Abuja','NGN','Nigerian naira','₦','.ng','Nigeria','Africa','Western Africa','[{\"zoneName\":\"Africa/Lagos\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]','{\"kr\":\"나이지리아\",\"br\":\"Nigéria\",\"pt\":\"Nigéria\",\"nl\":\"Nigeria\",\"hr\":\"Nigerija\",\"fa\":\"نیجریه\",\"de\":\"Nigeria\",\"es\":\"Nigeria\",\"fr\":\"Nigéria\",\"ja\":\"ナイジェリア\",\"it\":\"Nigeria\",\"cn\":\"尼日利亚\"}',10.00000000,8.00000000,'??','U+1F1F3 U+1F1EC','2018-07-21 01:41:03','2021-12-11 19:04:37',1,'Q1033'),(162,'Niue','NIU','570','NU','683','Alofi','NZD','New Zealand dollar','$','.nu','Niuē','Oceania','Polynesia','[{\"zoneName\":\"Pacific/Niue\",\"gmtOffset\":-39600,\"gmtOffsetName\":\"UTC-11:00\",\"abbreviation\":\"NUT\",\"tzName\":\"Niue Time\"}]','{\"kr\":\"니우에\",\"br\":\"Niue\",\"pt\":\"Niue\",\"nl\":\"Niue\",\"hr\":\"Niue\",\"fa\":\"نیووی\",\"de\":\"Niue\",\"es\":\"Niue\",\"fr\":\"Niue\",\"ja\":\"ニウエ\",\"it\":\"Niue\",\"cn\":\"纽埃\"}',-19.03333333,-169.86666666,'??','U+1F1F3 U+1F1FA','2018-07-21 01:41:03','2021-12-11 19:04:42',1,'Q34020'),(163,'Norfolk Island','NFK','574','NF','672','Kingston','AUD','Australian dollar','$','.nf','Norfolk Island','Oceania','Australia and New Zealand','[{\"zoneName\":\"Pacific/Norfolk\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"NFT\",\"tzName\":\"Norfolk Time\"}]','{\"kr\":\"노퍽 섬\",\"br\":\"Ilha Norfolk\",\"pt\":\"Ilha Norfolk\",\"nl\":\"Norfolkeiland\",\"hr\":\"Otok Norfolk\",\"fa\":\"جزیره نورفک\",\"de\":\"Norfolkinsel\",\"es\":\"Isla de Norfolk\",\"fr\":\"Île de Norfolk\",\"ja\":\"ノーフォーク島\",\"it\":\"Isola Norfolk\",\"cn\":\"诺福克岛\"}',-29.03333333,167.95000000,'??','U+1F1F3 U+1F1EB','2018-07-21 01:41:03','2021-12-11 19:05:39',1,NULL),(164,'Northern Mariana Islands','MNP','580','MP','+1-670','Saipan','USD','United States dollar','$','.mp','Northern Mariana Islands','Oceania','Micronesia','[{\"zoneName\":\"Pacific/Saipan\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"ChST\",\"tzName\":\"Chamorro Standard Time\"}]','{\"kr\":\"북마리아나 제도\",\"br\":\"Ilhas Marianas\",\"pt\":\"Ilhas Marianas\",\"nl\":\"Noordelijke Marianeneilanden\",\"hr\":\"Sjevernomarijanski otoci\",\"fa\":\"جزایر ماریانای شمالی\",\"de\":\"Nördliche Marianen\",\"es\":\"Islas Marianas del Norte\",\"fr\":\"Îles Mariannes du Nord\",\"ja\":\"北マリアナ諸島\",\"it\":\"Isole Marianne Settentrionali\",\"cn\":\"北马里亚纳群岛\"}',15.20000000,145.75000000,'??','U+1F1F2 U+1F1F5','2018-07-21 01:41:03','2021-12-11 19:05:55',1,NULL),(165,'Norway','NOR','578','NO','47','Oslo','NOK','Norwegian krone','kr','.no','Norge','Europe','Northern Europe','[{\"zoneName\":\"Europe/Oslo\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"노르웨이\",\"br\":\"Noruega\",\"pt\":\"Noruega\",\"nl\":\"Noorwegen\",\"hr\":\"Norveška\",\"fa\":\"نروژ\",\"de\":\"Norwegen\",\"es\":\"Noruega\",\"fr\":\"Norvège\",\"ja\":\"ノルウェー\",\"it\":\"Norvegia\",\"cn\":\"挪威\"}',62.00000000,10.00000000,'??','U+1F1F3 U+1F1F4','2018-07-21 01:41:03','2021-12-11 19:07:57',1,'Q20'),(166,'Oman','OMN','512','OM','968','Muscat','OMR','Omani rial','.ع.ر','.om','عمان','Asia','Western Asia','[{\"zoneName\":\"Asia/Muscat\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"GST\",\"tzName\":\"Gulf Standard Time\"}]','{\"kr\":\"오만\",\"br\":\"Omã\",\"pt\":\"Omã\",\"nl\":\"Oman\",\"hr\":\"Oman\",\"fa\":\"عمان\",\"de\":\"Oman\",\"es\":\"Omán\",\"fr\":\"Oman\",\"ja\":\"オマーン\",\"it\":\"oman\",\"cn\":\"阿曼\"}',21.00000000,57.00000000,'??','U+1F1F4 U+1F1F2','2018-07-21 01:41:03','2021-12-11 19:08:03',1,'Q842'),(167,'Pakistan','PAK','586','PK','92','Islamabad','PKR','Pakistani rupee','₨','.pk','Pakistan','Asia','Southern Asia','[{\"zoneName\":\"Asia/Karachi\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"PKT\",\"tzName\":\"Pakistan Standard Time\"}]','{\"kr\":\"파키스탄\",\"br\":\"Paquistão\",\"pt\":\"Paquistão\",\"nl\":\"Pakistan\",\"hr\":\"Pakistan\",\"fa\":\"پاکستان\",\"de\":\"Pakistan\",\"es\":\"Pakistán\",\"fr\":\"Pakistan\",\"ja\":\"パキスタン\",\"it\":\"Pakistan\",\"cn\":\"巴基斯坦\"}',30.00000000,70.00000000,'??','U+1F1F5 U+1F1F0','2018-07-21 01:41:03','2021-12-11 19:08:09',1,'Q843'),(168,'Palau','PLW','585','PW','680','Melekeok','USD','United States dollar','$','.pw','Palau','Oceania','Micronesia','[{\"zoneName\":\"Pacific/Palau\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"PWT\",\"tzName\":\"Palau Time\"}]','{\"kr\":\"팔라우\",\"br\":\"Palau\",\"pt\":\"Palau\",\"nl\":\"Palau\",\"hr\":\"Palau\",\"fa\":\"پالائو\",\"de\":\"Palau\",\"es\":\"Palau\",\"fr\":\"Palaos\",\"ja\":\"パラオ\",\"it\":\"Palau\",\"cn\":\"帕劳\"}',7.50000000,134.50000000,'??','U+1F1F5 U+1F1FC','2018-07-21 01:41:03','2021-12-11 19:05:58',1,'Q695'),(169,'Palestinian Territory Occupied','PSE','275','PS','970','East Jerusalem','ILS','Israeli new shekel','₪','.ps','فلسطين','Asia','Western Asia','[{\"zoneName\":\"Asia/Gaza\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"},{\"zoneName\":\"Asia/Hebron\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]','{\"kr\":\"팔레스타인 영토\",\"br\":\"Palestina\",\"pt\":\"Palestina\",\"nl\":\"Palestijnse gebieden\",\"hr\":\"Palestina\",\"fa\":\"فلسطین\",\"de\":\"Palästina\",\"es\":\"Palestina\",\"fr\":\"Palestine\",\"ja\":\"パレスチナ\",\"it\":\"Palestina\",\"cn\":\"巴勒斯坦\"}',31.90000000,35.20000000,'??','U+1F1F5 U+1F1F8','2018-07-21 01:41:03','2021-12-11 19:08:16',1,NULL),(170,'Panama','PAN','591','PA','507','Panama City','PAB','Panamanian balboa','B/.','.pa','Panamá','Americas','Central America','[{\"zoneName\":\"America/Panama\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"}]','{\"kr\":\"파나마\",\"br\":\"Panamá\",\"pt\":\"Panamá\",\"nl\":\"Panama\",\"hr\":\"Panama\",\"fa\":\"پاناما\",\"de\":\"Panama\",\"es\":\"Panamá\",\"fr\":\"Panama\",\"ja\":\"パナマ\",\"it\":\"Panama\",\"cn\":\"巴拿马\"}',9.00000000,-80.00000000,'??','U+1F1F5 U+1F1E6','2018-07-21 01:41:03','2021-12-11 19:08:22',1,'Q804'),(171,'Papua new Guinea','PNG','598','PG','675','Port Moresby','PGK','Papua New Guinean kina','K','.pg','Papua Niugini','Oceania','Melanesia','[{\"zoneName\":\"Pacific/Bougainville\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"BST\",\"tzName\":\"Bougainville Standard Time[6\"},{\"zoneName\":\"Pacific/Port_Moresby\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"PGT\",\"tzName\":\"Papua New Guinea Time\"}]','{\"kr\":\"파푸아뉴기니\",\"br\":\"Papua Nova Guiné\",\"pt\":\"Papua Nova Guiné\",\"nl\":\"Papoea-Nieuw-Guinea\",\"hr\":\"Papua Nova Gvineja\",\"fa\":\"پاپوآ گینه نو\",\"de\":\"Papua-Neuguinea\",\"es\":\"Papúa Nueva Guinea\",\"fr\":\"Papouasie-Nouvelle-Guinée\",\"ja\":\"パプアニューギニア\",\"it\":\"Papua Nuova Guinea\",\"cn\":\"巴布亚新几内亚\"}',-6.00000000,147.00000000,'??','U+1F1F5 U+1F1EC','2018-07-21 01:41:03','2021-12-11 19:08:31',1,'Q691'),(172,'Paraguay','PRY','600','PY','595','Asuncion','PYG','Paraguayan guarani','₲','.py','Paraguay','Americas','South America','[{\"zoneName\":\"America/Asuncion\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"PYST\",\"tzName\":\"Paraguay Summer Time\"}]','{\"kr\":\"파라과이\",\"br\":\"Paraguai\",\"pt\":\"Paraguai\",\"nl\":\"Paraguay\",\"hr\":\"Paragvaj\",\"fa\":\"پاراگوئه\",\"de\":\"Paraguay\",\"es\":\"Paraguay\",\"fr\":\"Paraguay\",\"ja\":\"パラグアイ\",\"it\":\"Paraguay\",\"cn\":\"巴拉圭\"}',-23.00000000,-58.00000000,'??','U+1F1F5 U+1F1FE','2018-07-21 01:41:03','2021-12-11 19:08:49',1,'Q733'),(173,'Peru','PER','604','PE','51','Lima','PEN','Peruvian sol','S/.','.pe','Perú','Americas','South America','[{\"zoneName\":\"America/Lima\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"PET\",\"tzName\":\"Peru Time\"}]','{\"kr\":\"페루\",\"br\":\"Peru\",\"pt\":\"Peru\",\"nl\":\"Peru\",\"hr\":\"Peru\",\"fa\":\"پرو\",\"de\":\"Peru\",\"es\":\"Perú\",\"fr\":\"Pérou\",\"ja\":\"ペルー\",\"it\":\"Perù\",\"cn\":\"秘鲁\"}',-10.00000000,-76.00000000,'??','U+1F1F5 U+1F1EA','2018-07-21 01:41:03','2021-12-11 19:08:59',1,'Q419'),(174,'Philippines','PHL','608','PH','63','Manila','PHP','Philippine peso','₱','.ph','Pilipinas','Asia','South-Eastern Asia','[{\"zoneName\":\"Asia/Manila\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"PHT\",\"tzName\":\"Philippine Time\"}]','{\"kr\":\"필리핀\",\"br\":\"Filipinas\",\"pt\":\"Filipinas\",\"nl\":\"Filipijnen\",\"hr\":\"Filipini\",\"fa\":\"جزایر الندفیلیپین\",\"de\":\"Philippinen\",\"es\":\"Filipinas\",\"fr\":\"Philippines\",\"ja\":\"フィリピン\",\"it\":\"Filippine\",\"cn\":\"菲律宾\"}',13.00000000,122.00000000,'??','U+1F1F5 U+1F1ED','2018-07-21 01:41:03','2021-12-11 19:09:03',1,'Q928'),(175,'Pitcairn Island','PCN','612','PN','870','Adamstown','NZD','New Zealand dollar','$','.pn','Pitcairn Islands','Oceania','Polynesia','[{\"zoneName\":\"Pacific/Pitcairn\",\"gmtOffset\":-28800,\"gmtOffsetName\":\"UTC-08:00\",\"abbreviation\":\"PST\",\"tzName\":\"Pacific Standard Time (North America\"}]','{\"kr\":\"핏케언 제도\",\"br\":\"Ilhas Pitcairn\",\"pt\":\"Ilhas Picárnia\",\"nl\":\"Pitcairneilanden\",\"hr\":\"Pitcairnovo otočje\",\"fa\":\"پیتکرن\",\"de\":\"Pitcairn\",\"es\":\"Islas Pitcairn\",\"fr\":\"Îles Pitcairn\",\"ja\":\"ピトケアン\",\"it\":\"Isole Pitcairn\",\"cn\":\"皮特凯恩群岛\"}',-25.06666666,-130.10000000,'??','U+1F1F5 U+1F1F3','2018-07-21 01:41:03','2021-12-11 19:09:08',1,NULL),(176,'Poland','POL','616','PL','48','Warsaw','PLN','Polish złoty','zł','.pl','Polska','Europe','Eastern Europe','[{\"zoneName\":\"Europe/Warsaw\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"폴란드\",\"br\":\"Polônia\",\"pt\":\"Polónia\",\"nl\":\"Polen\",\"hr\":\"Poljska\",\"fa\":\"لهستان\",\"de\":\"Polen\",\"es\":\"Polonia\",\"fr\":\"Pologne\",\"ja\":\"ポーランド\",\"it\":\"Polonia\",\"cn\":\"波兰\"}',52.00000000,20.00000000,'??','U+1F1F5 U+1F1F1','2018-07-21 01:41:03','2021-12-11 19:09:19',1,'Q36'),(177,'Portugal','PRT','620','PT','351','Lisbon','EUR','Euro','€','.pt','Portugal','Europe','Southern Europe','[{\"zoneName\":\"Atlantic/Azores\",\"gmtOffset\":-3600,\"gmtOffsetName\":\"UTC-01:00\",\"abbreviation\":\"AZOT\",\"tzName\":\"Azores Standard Time\"},{\"zoneName\":\"Atlantic/Madeira\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"WET\",\"tzName\":\"Western European Time\"},{\"zoneName\":\"Europe/Lisbon\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"WET\",\"tzName\":\"Western European Time\"}]','{\"kr\":\"포르투갈\",\"br\":\"Portugal\",\"pt\":\"Portugal\",\"nl\":\"Portugal\",\"hr\":\"Portugal\",\"fa\":\"پرتغال\",\"de\":\"Portugal\",\"es\":\"Portugal\",\"fr\":\"Portugal\",\"ja\":\"ポルトガル\",\"it\":\"Portogallo\",\"cn\":\"葡萄牙\"}',39.50000000,-8.00000000,'??','U+1F1F5 U+1F1F9','2018-07-21 01:41:03','2021-12-11 19:02:09',1,'Q45'),(178,'Puerto Rico','PRI','630','PR','+1-787 and 1-939','San Juan','USD','United States dollar','$','.pr','Puerto Rico','Americas','Caribbean','[{\"zoneName\":\"America/Puerto_Rico\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"푸에르토리코\",\"br\":\"Porto Rico\",\"pt\":\"Porto Rico\",\"nl\":\"Puerto Rico\",\"hr\":\"Portoriko\",\"fa\":\"پورتو ریکو\",\"de\":\"Puerto Rico\",\"es\":\"Puerto Rico\",\"fr\":\"Porto Rico\",\"ja\":\"プエルトリコ\",\"it\":\"Porto Rico\",\"cn\":\"波多黎各\"}',18.25000000,-66.50000000,'??','U+1F1F5 U+1F1F7','2018-07-21 01:41:03','2021-12-11 19:06:02',1,NULL),(179,'Qatar','QAT','634','QA','974','Doha','QAR','Qatari riyal','ق.ر','.qa','قطر','Asia','Western Asia','[{\"zoneName\":\"Asia/Qatar\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]','{\"kr\":\"카타르\",\"br\":\"Catar\",\"pt\":\"Catar\",\"nl\":\"Qatar\",\"hr\":\"Katar\",\"fa\":\"قطر\",\"de\":\"Katar\",\"es\":\"Catar\",\"fr\":\"Qatar\",\"ja\":\"カタール\",\"it\":\"Qatar\",\"cn\":\"卡塔尔\"}',25.50000000,51.25000000,'??','U+1F1F6 U+1F1E6','2018-07-21 01:41:03','2021-12-11 19:09:24',1,'Q846'),(180,'Reunion','REU','638','RE','262','Saint-Denis','EUR','Euro','€','.re','La Réunion','Africa','Eastern Africa','[{\"zoneName\":\"Indian/Reunion\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"RET\",\"tzName\":\"Réunion Time\"}]','{\"kr\":\"레위니옹\",\"br\":\"Reunião\",\"pt\":\"Reunião\",\"nl\":\"Réunion\",\"hr\":\"Réunion\",\"fa\":\"رئونیون\",\"de\":\"Réunion\",\"es\":\"Reunión\",\"fr\":\"Réunion\",\"ja\":\"レユニオン\",\"it\":\"Riunione\",\"cn\":\"留尼汪岛\"}',-21.15000000,55.50000000,'??','U+1F1F7 U+1F1EA','2018-07-21 01:41:03','2021-12-11 19:01:59',1,NULL),(181,'Romania','ROU','642','RO','40','Bucharest','RON','Romanian leu','lei','.ro','România','Europe','Eastern Europe','[{\"zoneName\":\"Europe/Bucharest\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]','{\"kr\":\"루마니아\",\"br\":\"Romênia\",\"pt\":\"Roménia\",\"nl\":\"Roemenië\",\"hr\":\"Rumunjska\",\"fa\":\"رومانی\",\"de\":\"Rumänien\",\"es\":\"Rumania\",\"fr\":\"Roumanie\",\"ja\":\"ルーマニア\",\"it\":\"Romania\",\"cn\":\"罗马尼亚\"}',46.00000000,25.00000000,'??','U+1F1F7 U+1F1F4','2018-07-21 01:41:03','2021-12-11 19:09:31',1,'Q218'),(182,'Russia','RUS','643','RU','7','Moscow','RUB','Russian ruble','₽','.ru','Россия','Europe','Eastern Europe','[{\"zoneName\":\"Asia/Anadyr\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"ANAT\",\"tzName\":\"Anadyr Time[4\"},{\"zoneName\":\"Asia/Barnaul\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"KRAT\",\"tzName\":\"Krasnoyarsk Time\"},{\"zoneName\":\"Asia/Chita\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"YAKT\",\"tzName\":\"Yakutsk Time\"},{\"zoneName\":\"Asia/Irkutsk\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"IRKT\",\"tzName\":\"Irkutsk Time\"},{\"zoneName\":\"Asia/Kamchatka\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"PETT\",\"tzName\":\"Kamchatka Time\"},{\"zoneName\":\"Asia/Khandyga\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"YAKT\",\"tzName\":\"Yakutsk Time\"},{\"zoneName\":\"Asia/Krasnoyarsk\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"KRAT\",\"tzName\":\"Krasnoyarsk Time\"},{\"zoneName\":\"Asia/Magadan\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"MAGT\",\"tzName\":\"Magadan Time\"},{\"zoneName\":\"Asia/Novokuznetsk\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"KRAT\",\"tzName\":\"Krasnoyarsk Time\"},{\"zoneName\":\"Asia/Novosibirsk\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"NOVT\",\"tzName\":\"Novosibirsk Time\"},{\"zoneName\":\"Asia/Omsk\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"OMST\",\"tzName\":\"Omsk Time\"},{\"zoneName\":\"Asia/Sakhalin\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"SAKT\",\"tzName\":\"Sakhalin Island Time\"},{\"zoneName\":\"Asia/Srednekolymsk\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"SRET\",\"tzName\":\"Srednekolymsk Time\"},{\"zoneName\":\"Asia/Tomsk\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"MSD+3\",\"tzName\":\"Moscow Daylight Time+3\"},{\"zoneName\":\"Asia/Ust-Nera\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"VLAT\",\"tzName\":\"Vladivostok Time\"},{\"zoneName\":\"Asia/Vladivostok\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"VLAT\",\"tzName\":\"Vladivostok Time\"},{\"zoneName\":\"Asia/Yakutsk\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"YAKT\",\"tzName\":\"Yakutsk Time\"},{\"zoneName\":\"Asia/Yekaterinburg\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"YEKT\",\"tzName\":\"Yekaterinburg Time\"},{\"zoneName\":\"Europe/Astrakhan\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"SAMT\",\"tzName\":\"Samara Time\"},{\"zoneName\":\"Europe/Kaliningrad\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"},{\"zoneName\":\"Europe/Kirov\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"MSK\",\"tzName\":\"Moscow Time\"},{\"zoneName\":\"Europe/Moscow\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"MSK\",\"tzName\":\"Moscow Time\"},{\"zoneName\":\"Europe/Samara\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"SAMT\",\"tzName\":\"Samara Time\"},{\"zoneName\":\"Europe/Saratov\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"MSD\",\"tzName\":\"Moscow Daylight Time+4\"},{\"zoneName\":\"Europe/Ulyanovsk\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"SAMT\",\"tzName\":\"Samara Time\"},{\"zoneName\":\"Europe/Volgograd\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"MSK\",\"tzName\":\"Moscow Standard Time\"}]','{\"kr\":\"러시아\",\"br\":\"Rússia\",\"pt\":\"Rússia\",\"nl\":\"Rusland\",\"hr\":\"Rusija\",\"fa\":\"روسیه\",\"de\":\"Russland\",\"es\":\"Rusia\",\"fr\":\"Russie\",\"ja\":\"ロシア連邦\",\"it\":\"Russia\",\"cn\":\"俄罗斯联邦\"}',60.00000000,100.00000000,'??','U+1F1F7 U+1F1FA','2018-07-21 01:41:03','2021-12-11 19:09:37',1,'Q159'),(183,'Rwanda','RWA','646','RW','250','Kigali','RWF','Rwandan franc','FRw','.rw','Rwanda','Africa','Eastern Africa','[{\"zoneName\":\"Africa/Kigali\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]','{\"kr\":\"르완다\",\"br\":\"Ruanda\",\"pt\":\"Ruanda\",\"nl\":\"Rwanda\",\"hr\":\"Ruanda\",\"fa\":\"رواندا\",\"de\":\"Ruanda\",\"es\":\"Ruanda\",\"fr\":\"Rwanda\",\"ja\":\"ルワンダ\",\"it\":\"Ruanda\",\"cn\":\"卢旺达\"}',-2.00000000,30.00000000,'??','U+1F1F7 U+1F1FC','2018-07-21 01:41:03','2021-12-11 19:09:42',1,'Q1037'),(184,'Saint Helena','SHN','654','SH','290','Jamestown','SHP','Saint Helena pound','£','.sh','Saint Helena','Africa','Western Africa','[{\"zoneName\":\"Atlantic/St_Helena\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]','{\"kr\":\"세인트헬레나\",\"br\":\"Santa Helena\",\"pt\":\"Santa Helena\",\"nl\":\"Sint-Helena\",\"hr\":\"Sveta Helena\",\"fa\":\"سنت هلنا، اسنشن و تریستان دا کونا\",\"de\":\"Sankt Helena\",\"es\":\"Santa Helena\",\"fr\":\"Sainte-Hélène\",\"ja\":\"セントヘレナ・アセンションおよびトリスタンダクーニャ\",\"it\":\"Sant\'Elena\",\"cn\":\"圣赫勒拿\"}',-15.95000000,-5.70000000,'??','U+1F1F8 U+1F1ED','2018-07-21 01:41:03','2021-12-11 19:09:50',1,NULL),(185,'Saint Kitts And Nevis','KNA','659','KN','+1-869','Basseterre','XCD','Eastern Caribbean dollar','$','.kn','Saint Kitts and Nevis','Americas','Caribbean','[{\"zoneName\":\"America/St_Kitts\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"세인트키츠 네비스\",\"br\":\"São Cristóvão e Neves\",\"pt\":\"São Cristóvão e Neves\",\"nl\":\"Saint Kitts en Nevis\",\"hr\":\"Sveti Kristof i Nevis\",\"fa\":\"سنت کیتس و نویس\",\"de\":\"St. Kitts und Nevis\",\"es\":\"San Cristóbal y Nieves\",\"fr\":\"Saint-Christophe-et-Niévès\",\"ja\":\"セントクリストファー・ネイビス\",\"it\":\"Saint Kitts e Nevis\",\"cn\":\"圣基茨和尼维斯\"}',17.33333333,-62.75000000,'??','U+1F1F0 U+1F1F3','2018-07-21 01:41:03','2021-12-11 19:09:56',1,'Q763'),(186,'Saint Lucia','LCA','662','LC','+1-758','Castries','XCD','Eastern Caribbean dollar','$','.lc','Saint Lucia','Americas','Caribbean','[{\"zoneName\":\"America/St_Lucia\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"세인트루시아\",\"br\":\"Santa Lúcia\",\"pt\":\"Santa Lúcia\",\"nl\":\"Saint Lucia\",\"hr\":\"Sveta Lucija\",\"fa\":\"سنت لوسیا\",\"de\":\"Saint Lucia\",\"es\":\"Santa Lucía\",\"fr\":\"Saint-Lucie\",\"ja\":\"セントルシア\",\"it\":\"Santa Lucia\",\"cn\":\"圣卢西亚\"}',13.88333333,-60.96666666,'??','U+1F1F1 U+1F1E8','2018-07-21 01:41:03','2021-12-11 19:09:58',1,'Q760'),(187,'Saint Pierre and Miquelon','SPM','666','PM','508','Saint-Pierre','EUR','Euro','€','.pm','Saint-Pierre-et-Miquelon','Americas','Northern America','[{\"zoneName\":\"America/Miquelon\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"PMDT\",\"tzName\":\"Pierre & Miquelon Daylight Time\"}]','{\"kr\":\"생피에르 미클롱\",\"br\":\"Saint-Pierre e Miquelon\",\"pt\":\"São Pedro e Miquelon\",\"nl\":\"Saint Pierre en Miquelon\",\"hr\":\"Sveti Petar i Mikelon\",\"fa\":\"سن پیر و میکلن\",\"de\":\"Saint-Pierre und Miquelon\",\"es\":\"San Pedro y Miquelón\",\"fr\":\"Saint-Pierre-et-Miquelon\",\"ja\":\"サンピエール島・ミクロン島\",\"it\":\"Saint-Pierre e Miquelon\",\"cn\":\"圣皮埃尔和密克隆\"}',46.83333333,-56.33333333,'??','U+1F1F5 U+1F1F2','2018-07-21 01:41:03','2021-12-11 19:02:00',1,NULL),(188,'Saint Vincent And The Grenadines','VCT','670','VC','+1-784','Kingstown','XCD','Eastern Caribbean dollar','$','.vc','Saint Vincent and the Grenadines','Americas','Caribbean','[{\"zoneName\":\"America/St_Vincent\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"세인트빈센트 그레나딘\",\"br\":\"São Vicente e Granadinas\",\"pt\":\"São Vicente e Granadinas\",\"nl\":\"Saint Vincent en de Grenadines\",\"hr\":\"Sveti Vincent i Grenadini\",\"fa\":\"سنت وینسنت و گرنادین‌ها\",\"de\":\"Saint Vincent und die Grenadinen\",\"es\":\"San Vicente y Granadinas\",\"fr\":\"Saint-Vincent-et-les-Grenadines\",\"ja\":\"セントビンセントおよびグレナディーン諸島\",\"it\":\"Saint Vincent e Grenadine\",\"cn\":\"圣文森特和格林纳丁斯\"}',13.25000000,-61.20000000,'??','U+1F1FB U+1F1E8','2018-07-21 01:41:03','2021-12-11 19:09:59',1,'Q757'),(189,'Saint-Barthelemy','BLM','652','BL','590','Gustavia','EUR','Euro','€','.bl','Saint-Barthélemy','Americas','Caribbean','[{\"zoneName\":\"America/St_Barthelemy\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"생바르텔레미\",\"br\":\"São Bartolomeu\",\"pt\":\"São Bartolomeu\",\"nl\":\"Saint Barthélemy\",\"hr\":\"Saint Barthélemy\",\"fa\":\"سن-بارتلمی\",\"de\":\"Saint-Barthélemy\",\"es\":\"San Bartolomé\",\"fr\":\"Saint-Barthélemy\",\"ja\":\"サン・バルテルミー\",\"it\":\"Antille Francesi\",\"cn\":\"圣巴泰勒米\"}',18.50000000,-63.41666666,'??','U+1F1E7 U+1F1F1','2018-07-21 01:41:03','2021-12-11 19:06:08',1,NULL),(190,'Saint-Martin (French part)','MAF','663','MF','590','Marigot','EUR','Euro','€','.mf','Saint-Martin','Americas','Caribbean','[{\"zoneName\":\"America/Marigot\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"세인트마틴 섬\",\"br\":\"Saint Martin\",\"pt\":\"Ilha São Martinho\",\"nl\":\"Saint-Martin\",\"hr\":\"Sveti Martin\",\"fa\":\"سینت مارتن\",\"de\":\"Saint Martin\",\"es\":\"Saint Martin\",\"fr\":\"Saint-Martin\",\"ja\":\"サン・マルタン（フランス領）\",\"it\":\"Saint Martin\",\"cn\":\"密克罗尼西亚\"}',18.08333333,-63.95000000,'??','U+1F1F2 U+1F1EB','2018-07-21 01:41:03','2021-12-11 19:06:10',1,NULL),(191,'Samoa','WSM','882','WS','685','Apia','WST','Samoan tālā','SAT','.ws','Samoa','Oceania','Polynesia','[{\"zoneName\":\"Pacific/Apia\",\"gmtOffset\":50400,\"gmtOffsetName\":\"UTC+14:00\",\"abbreviation\":\"WST\",\"tzName\":\"West Samoa Time\"}]','{\"kr\":\"사모아\",\"br\":\"Samoa\",\"pt\":\"Samoa\",\"nl\":\"Samoa\",\"hr\":\"Samoa\",\"fa\":\"ساموآ\",\"de\":\"Samoa\",\"es\":\"Samoa\",\"fr\":\"Samoa\",\"ja\":\"サモア\",\"it\":\"Samoa\",\"cn\":\"萨摩亚\"}',-13.58333333,-172.33333333,'??','U+1F1FC U+1F1F8','2018-07-21 01:41:03','2021-12-11 19:10:07',1,'Q683'),(192,'San Marino','SMR','674','SM','378','San Marino','EUR','Euro','€','.sm','San Marino','Europe','Southern Europe','[{\"zoneName\":\"Europe/San_Marino\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"산마리노\",\"br\":\"San Marino\",\"pt\":\"São Marinho\",\"nl\":\"San Marino\",\"hr\":\"San Marino\",\"fa\":\"سان مارینو\",\"de\":\"San Marino\",\"es\":\"San Marino\",\"fr\":\"Saint-Marin\",\"ja\":\"サンマリノ\",\"it\":\"San Marino\",\"cn\":\"圣马力诺\"}',43.76666666,12.41666666,'??','U+1F1F8 U+1F1F2','2018-07-21 01:41:03','2021-12-11 19:02:15',1,'Q238'),(193,'Sao Tome and Principe','STP','678','ST','239','Sao Tome','STD','Dobra','Db','.st','São Tomé e Príncipe','Africa','Middle Africa','[{\"zoneName\":\"Africa/Sao_Tome\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]','{\"kr\":\"상투메 프린시페\",\"br\":\"São Tomé e Príncipe\",\"pt\":\"São Tomé e Príncipe\",\"nl\":\"Sao Tomé en Principe\",\"hr\":\"Sveti Toma i Princip\",\"fa\":\"کواترو دو فرویرو\",\"de\":\"São Tomé und Príncipe\",\"es\":\"Santo Tomé y Príncipe\",\"fr\":\"Sao Tomé-et-Principe\",\"ja\":\"サントメ・プリンシペ\",\"it\":\"São Tomé e Príncipe\",\"cn\":\"圣多美和普林西比\"}',1.00000000,7.00000000,'??','U+1F1F8 U+1F1F9','2018-07-21 01:41:03','2021-12-11 19:10:28',1,'Q1039'),(194,'Saudi Arabia','SAU','682','SA','966','Riyadh','SAR','Saudi riyal','﷼','.sa','المملكة العربية السعودية','Asia','Western Asia','[{\"zoneName\":\"Asia/Riyadh\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]','{\"kr\":\"사우디아라비아\",\"br\":\"Arábia Saudita\",\"pt\":\"Arábia Saudita\",\"nl\":\"Saoedi-Arabië\",\"hr\":\"Saudijska Arabija\",\"fa\":\"عربستان سعودی\",\"de\":\"Saudi-Arabien\",\"es\":\"Arabia Saudí\",\"fr\":\"Arabie Saoudite\",\"ja\":\"サウジアラビア\",\"it\":\"Arabia Saudita\",\"cn\":\"沙特阿拉伯\"}',25.00000000,45.00000000,'??','U+1F1F8 U+1F1E6','2018-07-21 01:41:03','2021-12-11 19:10:44',1,'Q851'),(195,'Senegal','SEN','686','SN','221','Dakar','XOF','West African CFA franc','CFA','.sn','Sénégal','Africa','Western Africa','[{\"zoneName\":\"Africa/Dakar\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]','{\"kr\":\"세네갈\",\"br\":\"Senegal\",\"pt\":\"Senegal\",\"nl\":\"Senegal\",\"hr\":\"Senegal\",\"fa\":\"سنگال\",\"de\":\"Senegal\",\"es\":\"Senegal\",\"fr\":\"Sénégal\",\"ja\":\"セネガル\",\"it\":\"Senegal\",\"cn\":\"塞内加尔\"}',14.00000000,-14.00000000,'??','U+1F1F8 U+1F1F3','2018-07-21 01:41:03','2021-12-11 19:10:50',1,'Q1041'),(196,'Serbia','SRB','688','RS','381','Belgrade','RSD','Serbian dinar','din','.rs','Србија','Europe','Southern Europe','[{\"zoneName\":\"Europe/Belgrade\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"세르비아\",\"br\":\"Sérvia\",\"pt\":\"Sérvia\",\"nl\":\"Servië\",\"hr\":\"Srbija\",\"fa\":\"صربستان\",\"de\":\"Serbien\",\"es\":\"Serbia\",\"fr\":\"Serbie\",\"ja\":\"セルビア\",\"it\":\"Serbia\",\"cn\":\"塞尔维亚\"}',44.00000000,21.00000000,'??','U+1F1F7 U+1F1F8','2018-07-21 01:41:03','2021-12-11 19:10:55',1,'Q403'),(197,'Seychelles','SYC','690','SC','248','Victoria','SCR','Seychellois rupee','SRe','.sc','Seychelles','Africa','Eastern Africa','[{\"zoneName\":\"Indian/Mahe\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"SCT\",\"tzName\":\"Seychelles Time\"}]','{\"kr\":\"세이셸\",\"br\":\"Seicheles\",\"pt\":\"Seicheles\",\"nl\":\"Seychellen\",\"hr\":\"Sejšeli\",\"fa\":\"سیشل\",\"de\":\"Seychellen\",\"es\":\"Seychelles\",\"fr\":\"Seychelles\",\"ja\":\"セーシェル\",\"it\":\"Seychelles\",\"cn\":\"塞舌尔\"}',-4.58333333,55.66666666,'??','U+1F1F8 U+1F1E8','2018-07-21 01:41:03','2021-12-11 19:11:01',1,'Q1042'),(198,'Sierra Leone','SLE','694','SL','232','Freetown','SLL','Sierra Leonean leone','Le','.sl','Sierra Leone','Africa','Western Africa','[{\"zoneName\":\"Africa/Freetown\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]','{\"kr\":\"시에라리온\",\"br\":\"Serra Leoa\",\"pt\":\"Serra Leoa\",\"nl\":\"Sierra Leone\",\"hr\":\"Sijera Leone\",\"fa\":\"سیرالئون\",\"de\":\"Sierra Leone\",\"es\":\"Sierra Leone\",\"fr\":\"Sierra Leone\",\"ja\":\"シエラレオネ\",\"it\":\"Sierra Leone\",\"cn\":\"塞拉利昂\"}',8.50000000,-11.50000000,'??','U+1F1F8 U+1F1F1','2018-07-21 01:41:03','2021-12-11 19:11:06',1,'Q1044'),(199,'Singapore','SGP','702','SG','65','Singapur','SGD','Singapore dollar','$','.sg','Singapore','Asia','South-Eastern Asia','[{\"zoneName\":\"Asia/Singapore\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"SGT\",\"tzName\":\"Singapore Time\"}]','{\"kr\":\"싱가포르\",\"br\":\"Singapura\",\"pt\":\"Singapura\",\"nl\":\"Singapore\",\"hr\":\"Singapur\",\"fa\":\"سنگاپور\",\"de\":\"Singapur\",\"es\":\"Singapur\",\"fr\":\"Singapour\",\"ja\":\"シンガポール\",\"it\":\"Singapore\",\"cn\":\"新加坡\"}',1.36666666,103.80000000,'??','U+1F1F8 U+1F1EC','2018-07-21 01:41:03','2021-12-11 19:11:12',1,'Q334'),(200,'Slovakia','SVK','703','SK','421','Bratislava','EUR','Euro','€','.sk','Slovensko','Europe','Eastern Europe','[{\"zoneName\":\"Europe/Bratislava\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"슬로바키아\",\"br\":\"Eslováquia\",\"pt\":\"Eslováquia\",\"nl\":\"Slowakije\",\"hr\":\"Slovačka\",\"fa\":\"اسلواکی\",\"de\":\"Slowakei\",\"es\":\"República Eslovaca\",\"fr\":\"Slovaquie\",\"ja\":\"スロバキア\",\"it\":\"Slovacchia\",\"cn\":\"斯洛伐克\"}',48.66666666,19.50000000,'??','U+1F1F8 U+1F1F0','2018-07-21 01:41:03','2021-12-11 19:07:01',1,'Q214'),(201,'Slovenia','SVN','705','SI','386','Ljubljana','EUR','Euro','€','.si','Slovenija','Europe','Southern Europe','[{\"zoneName\":\"Europe/Ljubljana\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"슬로베니아\",\"br\":\"Eslovênia\",\"pt\":\"Eslovénia\",\"nl\":\"Slovenië\",\"hr\":\"Slovenija\",\"fa\":\"اسلوونی\",\"de\":\"Slowenien\",\"es\":\"Eslovenia\",\"fr\":\"Slovénie\",\"ja\":\"スロベニア\",\"it\":\"Slovenia\",\"cn\":\"斯洛文尼亚\"}',46.11666666,14.81666666,'??','U+1F1F8 U+1F1EE','2018-07-21 01:41:03','2021-12-11 19:07:05',1,'Q215'),(202,'Solomon Islands','SLB','090','SB','677','Honiara','SBD','Solomon Islands dollar','Si$','.sb','Solomon Islands','Oceania','Melanesia','[{\"zoneName\":\"Pacific/Guadalcanal\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"SBT\",\"tzName\":\"Solomon Islands Time\"}]','{\"kr\":\"솔로몬 제도\",\"br\":\"Ilhas Salomão\",\"pt\":\"Ilhas Salomão\",\"nl\":\"Salomonseilanden\",\"hr\":\"Solomonski Otoci\",\"fa\":\"جزایر سلیمان\",\"de\":\"Salomonen\",\"es\":\"Islas Salomón\",\"fr\":\"Îles Salomon\",\"ja\":\"ソロモン諸島\",\"it\":\"Isole Salomone\",\"cn\":\"所罗门群岛\"}',-8.00000000,159.00000000,'??','U+1F1F8 U+1F1E7','2018-07-21 01:41:03','2021-12-11 19:11:36',1,'Q685'),(203,'Somalia','SOM','706','SO','252','Mogadishu','SOS','Somali shilling','Sh.so.','.so','Soomaaliya','Africa','Eastern Africa','[{\"zoneName\":\"Africa/Mogadishu\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]','{\"kr\":\"소말리아\",\"br\":\"Somália\",\"pt\":\"Somália\",\"nl\":\"Somalië\",\"hr\":\"Somalija\",\"fa\":\"سومالی\",\"de\":\"Somalia\",\"es\":\"Somalia\",\"fr\":\"Somalie\",\"ja\":\"ソマリア\",\"it\":\"Somalia\",\"cn\":\"索马里\"}',10.00000000,49.00000000,'??','U+1F1F8 U+1F1F4','2018-07-21 01:41:03','2021-12-11 19:11:41',1,'Q1045'),(204,'South Africa','ZAF','710','ZA','27','Pretoria','ZAR','South African rand','R','.za','South Africa','Africa','Southern Africa','[{\"zoneName\":\"Africa/Johannesburg\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"SAST\",\"tzName\":\"South African Standard Time\"}]','{\"kr\":\"남아프리카 공화국\",\"br\":\"República Sul-Africana\",\"pt\":\"República Sul-Africana\",\"nl\":\"Zuid-Afrika\",\"hr\":\"Južnoafrička Republika\",\"fa\":\"آفریقای جنوبی\",\"de\":\"Republik Südafrika\",\"es\":\"República de Sudáfrica\",\"fr\":\"Afrique du Sud\",\"ja\":\"南アフリカ\",\"it\":\"Sud Africa\",\"cn\":\"南非\"}',-29.00000000,24.00000000,'??','U+1F1FF U+1F1E6','2018-07-21 01:41:03','2021-12-11 19:11:49',1,'Q258'),(205,'South Georgia','SGS','239','GS','500','Grytviken','GBP','British pound','£','.gs','South Georgia','Americas','South America','[{\"zoneName\":\"Atlantic/South_Georgia\",\"gmtOffset\":-7200,\"gmtOffsetName\":\"UTC-02:00\",\"abbreviation\":\"GST\",\"tzName\":\"South Georgia and the South Sandwich Islands Time\"}]','{\"kr\":\"사우스조지아\",\"br\":\"Ilhas Geórgias do Sul e Sandwich do Sul\",\"pt\":\"Ilhas Geórgia do Sul e Sanduíche do Sul\",\"nl\":\"Zuid-Georgia en Zuidelijke Sandwicheilanden\",\"hr\":\"Južna Georgija i otočje Južni Sandwich\",\"fa\":\"جزایر جورجیای جنوبی و ساندویچ جنوبی\",\"de\":\"Südgeorgien und die Südlichen Sandwichinseln\",\"es\":\"Islas Georgias del Sur y Sandwich del Sur\",\"fr\":\"Géorgie du Sud-et-les Îles Sandwich du Sud\",\"ja\":\"サウスジョージア・サウスサンドウィッチ諸島\",\"it\":\"Georgia del Sud e Isole Sandwich Meridionali\",\"cn\":\"南乔治亚\"}',-54.50000000,-37.00000000,'??','U+1F1EC U+1F1F8','2018-07-21 01:41:03','2021-12-11 19:06:45',1,NULL),(206,'South Sudan','SSD','728','SS','211','Juba','SSP','South Sudanese pound','£','.ss','South Sudan','Africa','Middle Africa','[{\"zoneName\":\"Africa/Juba\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]','{\"kr\":\"남수단\",\"br\":\"Sudão do Sul\",\"pt\":\"Sudão do Sul\",\"nl\":\"Zuid-Soedan\",\"hr\":\"Južni Sudan\",\"fa\":\"سودان جنوبی\",\"de\":\"Südsudan\",\"es\":\"Sudán del Sur\",\"fr\":\"Soudan du Sud\",\"ja\":\"南スーダン\",\"it\":\"Sudan del sud\",\"cn\":\"南苏丹\"}',7.00000000,30.00000000,'??','U+1F1F8 U+1F1F8','2018-07-21 01:41:03','2021-12-11 19:12:25',1,'Q958'),(207,'Spain','ESP','724','ES','34','Madrid','EUR','Euro','€','.es','España','Europe','Southern Europe','[{\"zoneName\":\"Africa/Ceuta\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"},{\"zoneName\":\"Atlantic/Canary\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"WET\",\"tzName\":\"Western European Time\"},{\"zoneName\":\"Europe/Madrid\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"스페인\",\"br\":\"Espanha\",\"pt\":\"Espanha\",\"nl\":\"Spanje\",\"hr\":\"Španjolska\",\"fa\":\"اسپانیا\",\"de\":\"Spanien\",\"es\":\"España\",\"fr\":\"Espagne\",\"ja\":\"スペイン\",\"it\":\"Spagna\",\"cn\":\"西班牙\"}',40.00000000,-4.00000000,'??','U+1F1EA U+1F1F8','2018-07-21 01:41:03','2021-12-11 19:02:30',1,'Q29'),(208,'Sri Lanka','LKA','144','LK','94','Colombo','LKR','Sri Lankan rupee','Rs','.lk','śrī laṃkāva','Asia','Southern Asia','[{\"zoneName\":\"Asia/Colombo\",\"gmtOffset\":19800,\"gmtOffsetName\":\"UTC+05:30\",\"abbreviation\":\"IST\",\"tzName\":\"Indian Standard Time\"}]','{\"kr\":\"스리랑카\",\"br\":\"Sri Lanka\",\"pt\":\"Sri Lanka\",\"nl\":\"Sri Lanka\",\"hr\":\"Šri Lanka\",\"fa\":\"سری‌لانکا\",\"de\":\"Sri Lanka\",\"es\":\"Sri Lanka\",\"fr\":\"Sri Lanka\",\"ja\":\"スリランカ\",\"it\":\"Sri Lanka\",\"cn\":\"斯里兰卡\"}',7.00000000,81.00000000,'??','U+1F1F1 U+1F1F0','2018-07-21 01:41:03','2021-12-11 19:12:30',1,'Q854'),(209,'Sudan','SDN','729','SD','249','Khartoum','SDG','Sudanese pound','.س.ج','.sd','السودان','Africa','Northern Africa','[{\"zoneName\":\"Africa/Khartoum\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EAT\",\"tzName\":\"Eastern African Time\"}]','{\"kr\":\"수단\",\"br\":\"Sudão\",\"pt\":\"Sudão\",\"nl\":\"Soedan\",\"hr\":\"Sudan\",\"fa\":\"سودان\",\"de\":\"Sudan\",\"es\":\"Sudán\",\"fr\":\"Soudan\",\"ja\":\"スーダン\",\"it\":\"Sudan\",\"cn\":\"苏丹\"}',15.00000000,30.00000000,'??','U+1F1F8 U+1F1E9','2018-07-21 01:41:03','2021-12-11 19:12:35',1,'Q1049'),(210,'Suriname','SUR','740','SR','597','Paramaribo','SRD','Surinamese dollar','$','.sr','Suriname','Americas','South America','[{\"zoneName\":\"America/Paramaribo\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"SRT\",\"tzName\":\"Suriname Time\"}]','{\"kr\":\"수리남\",\"br\":\"Suriname\",\"pt\":\"Suriname\",\"nl\":\"Suriname\",\"hr\":\"Surinam\",\"fa\":\"سورینام\",\"de\":\"Suriname\",\"es\":\"Surinam\",\"fr\":\"Surinam\",\"ja\":\"スリナム\",\"it\":\"Suriname\",\"cn\":\"苏里南\"}',4.00000000,-56.00000000,'??','U+1F1F8 U+1F1F7','2018-07-21 01:41:03','2021-12-11 19:12:40',1,'Q730'),(211,'Svalbard And Jan Mayen Islands','SJM','744','SJ','47','Longyearbyen','NOK','Norwegian Krone','kr','.sj','Svalbard og Jan Mayen','Europe','Northern Europe','[{\"zoneName\":\"Arctic/Longyearbyen\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"스발바르 얀마옌 제도\",\"br\":\"Svalbard\",\"pt\":\"Svalbard\",\"nl\":\"Svalbard en Jan Mayen\",\"hr\":\"Svalbard i Jan Mayen\",\"fa\":\"سوالبارد و یان ماین\",\"de\":\"Svalbard und Jan Mayen\",\"es\":\"Islas Svalbard y Jan Mayen\",\"fr\":\"Svalbard et Jan Mayen\",\"ja\":\"スヴァールバル諸島およびヤンマイエン島\",\"it\":\"Svalbard e Jan Mayen\",\"cn\":\"斯瓦尔巴和扬马延群岛\"}',78.00000000,20.00000000,'??','U+1F1F8 U+1F1EF','2018-07-21 01:41:03','2021-12-11 19:12:54',1,NULL),(212,'Swaziland','SWZ','748','SZ','268','Mbabane','SZL','Lilangeni','E','.sz','Swaziland','Africa','Southern Africa','[{\"zoneName\":\"Africa/Mbabane\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"SAST\",\"tzName\":\"South African Standard Time\"}]','{\"kr\":\"에스와티니\",\"br\":\"Suazilândia\",\"pt\":\"Suazilândia\",\"nl\":\"Swaziland\",\"hr\":\"Svazi\",\"fa\":\"سوازیلند\",\"de\":\"Swasiland\",\"es\":\"Suazilandia\",\"fr\":\"Swaziland\",\"ja\":\"スワジランド\",\"it\":\"Swaziland\",\"cn\":\"斯威士兰\"}',-26.50000000,31.50000000,'??','U+1F1F8 U+1F1FF','2018-07-21 01:41:03','2021-12-11 19:13:12',1,'Q1050'),(213,'Sweden','SWE','752','SE','46','Stockholm','SEK','Swedish krona','kr','.se','Sverige','Europe','Northern Europe','[{\"zoneName\":\"Europe/Stockholm\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"스웨덴\",\"br\":\"Suécia\",\"pt\":\"Suécia\",\"nl\":\"Zweden\",\"hr\":\"Švedska\",\"fa\":\"سوئد\",\"de\":\"Schweden\",\"es\":\"Suecia\",\"fr\":\"Suède\",\"ja\":\"スウェーデン\",\"it\":\"Svezia\",\"cn\":\"瑞典\"}',62.00000000,15.00000000,'??','U+1F1F8 U+1F1EA','2018-07-21 01:41:03','2021-12-11 19:13:24',1,'Q34'),(214,'Switzerland','CHE','756','CH','41','Bern','CHF','Swiss franc','CHf','.ch','Schweiz','Europe','Western Europe','[{\"zoneName\":\"Europe/Zurich\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"스위스\",\"br\":\"Suíça\",\"pt\":\"Suíça\",\"nl\":\"Zwitserland\",\"hr\":\"Švicarska\",\"fa\":\"سوئیس\",\"de\":\"Schweiz\",\"es\":\"Suiza\",\"fr\":\"Suisse\",\"ja\":\"スイス\",\"it\":\"Svizzera\",\"cn\":\"瑞士\"}',47.00000000,8.00000000,'??','U+1F1E8 U+1F1ED','2018-07-21 01:41:03','2021-12-11 19:13:31',1,'Q39'),(215,'Syria','SYR','760','SY','963','Damascus','SYP','Syrian pound','LS','.sy','سوريا','Asia','Western Asia','[{\"zoneName\":\"Asia/Damascus\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]','{\"kr\":\"시리아\",\"br\":\"Síria\",\"pt\":\"Síria\",\"nl\":\"Syrië\",\"hr\":\"Sirija\",\"fa\":\"سوریه\",\"de\":\"Syrien\",\"es\":\"Siria\",\"fr\":\"Syrie\",\"ja\":\"シリア・アラブ共和国\",\"it\":\"Siria\",\"cn\":\"叙利亚\"}',35.00000000,38.00000000,'??','U+1F1F8 U+1F1FE','2018-07-21 01:41:03','2021-12-11 19:13:36',1,'Q858'),(216,'Taiwan','TWN','158','TW','886','Taipei','TWD','New Taiwan dollar','$','.tw','臺灣','Asia','Eastern Asia','[{\"zoneName\":\"Asia/Taipei\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"CST\",\"tzName\":\"China Standard Time\"}]','{\"kr\":\"대만\",\"br\":\"Taiwan\",\"pt\":\"Taiwan\",\"nl\":\"Taiwan\",\"hr\":\"Tajvan\",\"fa\":\"تایوان\",\"de\":\"Taiwan\",\"es\":\"Taiwán\",\"fr\":\"Taïwan\",\"ja\":\"台湾（中華民国）\",\"it\":\"Taiwan\",\"cn\":\"中国台湾\"}',23.50000000,121.00000000,'??','U+1F1F9 U+1F1FC','2018-07-21 01:41:03','2021-12-11 19:13:41',1,'Q865'),(217,'Tajikistan','TJK','762','TJ','992','Dushanbe','TJS','Tajikistani somoni','SM','.tj','Тоҷикистон','Asia','Central Asia','[{\"zoneName\":\"Asia/Dushanbe\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"TJT\",\"tzName\":\"Tajikistan Time\"}]','{\"kr\":\"타지키스탄\",\"br\":\"Tajiquistão\",\"pt\":\"Tajiquistão\",\"nl\":\"Tadzjikistan\",\"hr\":\"Tađikistan\",\"fa\":\"تاجیکستان\",\"de\":\"Tadschikistan\",\"es\":\"Tayikistán\",\"fr\":\"Tadjikistan\",\"ja\":\"タジキスタン\",\"it\":\"Tagikistan\",\"cn\":\"塔吉克斯坦\"}',39.00000000,71.00000000,'??','U+1F1F9 U+1F1EF','2018-07-21 01:41:03','2021-12-11 19:13:46',1,'Q863'),(218,'Tanzania','TZA','834','TZ','255','Dodoma','TZS','Tanzanian shilling','TSh','.tz','Tanzania','Africa','Eastern Africa','[{\"zoneName\":\"Africa/Dar_es_Salaam\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]','{\"kr\":\"탄자니아\",\"br\":\"Tanzânia\",\"pt\":\"Tanzânia\",\"nl\":\"Tanzania\",\"hr\":\"Tanzanija\",\"fa\":\"تانزانیا\",\"de\":\"Tansania\",\"es\":\"Tanzania\",\"fr\":\"Tanzanie\",\"ja\":\"タンザニア\",\"it\":\"Tanzania\",\"cn\":\"坦桑尼亚\"}',-6.00000000,35.00000000,'??','U+1F1F9 U+1F1FF','2018-07-21 01:41:03','2021-12-11 19:13:57',1,'Q924'),(219,'Thailand','THA','764','TH','66','Bangkok','THB','Thai baht','฿','.th','ประเทศไทย','Asia','South-Eastern Asia','[{\"zoneName\":\"Asia/Bangkok\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"ICT\",\"tzName\":\"Indochina Time\"}]','{\"kr\":\"태국\",\"br\":\"Tailândia\",\"pt\":\"Tailândia\",\"nl\":\"Thailand\",\"hr\":\"Tajland\",\"fa\":\"تایلند\",\"de\":\"Thailand\",\"es\":\"Tailandia\",\"fr\":\"Thaïlande\",\"ja\":\"タイ\",\"it\":\"Tailandia\",\"cn\":\"泰国\"}',15.00000000,100.00000000,'??','U+1F1F9 U+1F1ED','2018-07-21 01:41:03','2021-12-11 19:14:06',1,'Q869'),(220,'Togo','TGO','768','TG','228','Lome','XOF','West African CFA franc','CFA','.tg','Togo','Africa','Western Africa','[{\"zoneName\":\"Africa/Lome\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]','{\"kr\":\"토고\",\"br\":\"Togo\",\"pt\":\"Togo\",\"nl\":\"Togo\",\"hr\":\"Togo\",\"fa\":\"توگو\",\"de\":\"Togo\",\"es\":\"Togo\",\"fr\":\"Togo\",\"ja\":\"トーゴ\",\"it\":\"Togo\",\"cn\":\"多哥\"}',8.00000000,1.16666666,'??','U+1F1F9 U+1F1EC','2018-07-21 01:41:03','2021-12-11 19:14:14',1,'Q945'),(221,'Tokelau','TKL','772','TK','690','','NZD','New Zealand dollar','$','.tk','Tokelau','Oceania','Polynesia','[{\"zoneName\":\"Pacific/Fakaofo\",\"gmtOffset\":46800,\"gmtOffsetName\":\"UTC+13:00\",\"abbreviation\":\"TKT\",\"tzName\":\"Tokelau Time\"}]','{\"kr\":\"토켈라우\",\"br\":\"Tokelau\",\"pt\":\"Toquelau\",\"nl\":\"Tokelau\",\"hr\":\"Tokelau\",\"fa\":\"توکلائو\",\"de\":\"Tokelau\",\"es\":\"Islas Tokelau\",\"fr\":\"Tokelau\",\"ja\":\"トケラウ\",\"it\":\"Isole Tokelau\",\"cn\":\"托克劳\"}',-9.00000000,-172.00000000,'??','U+1F1F9 U+1F1F0','2018-07-21 01:41:03','2021-12-11 19:14:33',1,NULL),(222,'Tonga','TON','776','TO','676','Nuku\'alofa','TOP','Tongan paʻanga','$','.to','Tonga','Oceania','Polynesia','[{\"zoneName\":\"Pacific/Tongatapu\",\"gmtOffset\":46800,\"gmtOffsetName\":\"UTC+13:00\",\"abbreviation\":\"TOT\",\"tzName\":\"Tonga Time\"}]','{\"kr\":\"통가\",\"br\":\"Tonga\",\"pt\":\"Tonga\",\"nl\":\"Tonga\",\"hr\":\"Tonga\",\"fa\":\"تونگا\",\"de\":\"Tonga\",\"es\":\"Tonga\",\"fr\":\"Tonga\",\"ja\":\"トンガ\",\"it\":\"Tonga\",\"cn\":\"汤加\"}',-20.00000000,-175.00000000,'??','U+1F1F9 U+1F1F4','2018-07-21 01:41:03','2021-12-11 19:14:44',1,'Q678'),(223,'Trinidad And Tobago','TTO','780','TT','+1-868','Port of Spain','TTD','Trinidad and Tobago dollar','$','.tt','Trinidad and Tobago','Americas','Caribbean','[{\"zoneName\":\"America/Port_of_Spain\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"트리니다드 토바고\",\"br\":\"Trinidad e Tobago\",\"pt\":\"Trindade e Tobago\",\"nl\":\"Trinidad en Tobago\",\"hr\":\"Trinidad i Tobago\",\"fa\":\"ترینیداد و توباگو\",\"de\":\"Trinidad und Tobago\",\"es\":\"Trinidad y Tobago\",\"fr\":\"Trinité et Tobago\",\"ja\":\"トリニダード・トバゴ\",\"it\":\"Trinidad e Tobago\",\"cn\":\"特立尼达和多巴哥\"}',11.00000000,-61.00000000,'??','U+1F1F9 U+1F1F9','2018-07-21 01:41:03','2021-12-11 19:14:51',1,'Q754'),(224,'Tunisia','TUN','788','TN','216','Tunis','TND','Tunisian dinar','ت.د','.tn','تونس','Africa','Northern Africa','[{\"zoneName\":\"Africa/Tunis\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"튀니지\",\"br\":\"Tunísia\",\"pt\":\"Tunísia\",\"nl\":\"Tunesië\",\"hr\":\"Tunis\",\"fa\":\"تونس\",\"de\":\"Tunesien\",\"es\":\"Túnez\",\"fr\":\"Tunisie\",\"ja\":\"チュニジア\",\"it\":\"Tunisia\",\"cn\":\"突尼斯\"}',34.00000000,9.00000000,'??','U+1F1F9 U+1F1F3','2018-07-21 01:41:03','2021-12-11 19:15:00',1,'Q948'),(225,'Turkey','TUR','792','TR','90','Ankara','TRY','Turkish lira','₺','.tr','Türkiye','Asia','Western Asia','[{\"zoneName\":\"Europe/Istanbul\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]','{\"kr\":\"터키\",\"br\":\"Turquia\",\"pt\":\"Turquia\",\"nl\":\"Turkije\",\"hr\":\"Turska\",\"fa\":\"ترکیه\",\"de\":\"Türkei\",\"es\":\"Turquía\",\"fr\":\"Turquie\",\"ja\":\"トルコ\",\"it\":\"Turchia\",\"cn\":\"土耳其\"}',39.00000000,35.00000000,'??','U+1F1F9 U+1F1F7','2018-07-21 01:41:03','2021-12-11 19:15:05',1,'Q43'),(226,'Turkmenistan','TKM','795','TM','993','Ashgabat','TMT','Turkmenistan manat','T','.tm','Türkmenistan','Asia','Central Asia','[{\"zoneName\":\"Asia/Ashgabat\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"TMT\",\"tzName\":\"Turkmenistan Time\"}]','{\"kr\":\"투르크메니스탄\",\"br\":\"Turcomenistão\",\"pt\":\"Turquemenistão\",\"nl\":\"Turkmenistan\",\"hr\":\"Turkmenistan\",\"fa\":\"ترکمنستان\",\"de\":\"Turkmenistan\",\"es\":\"Turkmenistán\",\"fr\":\"Turkménistan\",\"ja\":\"トルクメニスタン\",\"it\":\"Turkmenistan\",\"cn\":\"土库曼斯坦\"}',40.00000000,60.00000000,'??','U+1F1F9 U+1F1F2','2018-07-21 01:41:03','2021-12-11 19:15:10',1,'Q874'),(227,'Turks And Caicos Islands','TCA','796','TC','+1-649','Cockburn Town','USD','United States dollar','$','.tc','Turks and Caicos Islands','Americas','Caribbean','[{\"zoneName\":\"America/Grand_Turk\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"}]','{\"kr\":\"터크스 케이커스 제도\",\"br\":\"Ilhas Turcas e Caicos\",\"pt\":\"Ilhas Turcas e Caicos\",\"nl\":\"Turks- en Caicoseilanden\",\"hr\":\"Otoci Turks i Caicos\",\"fa\":\"جزایر تورکس و کایکوس\",\"de\":\"Turks- und Caicosinseln\",\"es\":\"Islas Turks y Caicos\",\"fr\":\"Îles Turques-et-Caïques\",\"ja\":\"タークス・カイコス諸島\",\"it\":\"Isole Turks e Caicos\",\"cn\":\"特克斯和凯科斯群岛\"}',21.75000000,-71.58333333,'??','U+1F1F9 U+1F1E8','2018-07-21 01:41:03','2021-12-11 19:06:26',1,NULL),(228,'Tuvalu','TUV','798','TV','688','Funafuti','AUD','Australian dollar','$','.tv','Tuvalu','Oceania','Polynesia','[{\"zoneName\":\"Pacific/Funafuti\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"TVT\",\"tzName\":\"Tuvalu Time\"}]','{\"kr\":\"투발루\",\"br\":\"Tuvalu\",\"pt\":\"Tuvalu\",\"nl\":\"Tuvalu\",\"hr\":\"Tuvalu\",\"fa\":\"تووالو\",\"de\":\"Tuvalu\",\"es\":\"Tuvalu\",\"fr\":\"Tuvalu\",\"ja\":\"ツバル\",\"it\":\"Tuvalu\",\"cn\":\"图瓦卢\"}',-8.00000000,178.00000000,'??','U+1F1F9 U+1F1FB','2018-07-21 01:41:03','2021-12-11 19:07:37',1,'Q672'),(229,'Uganda','UGA','800','UG','256','Kampala','UGX','Ugandan shilling','USh','.ug','Uganda','Africa','Eastern Africa','[{\"zoneName\":\"Africa/Kampala\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]','{\"kr\":\"우간다\",\"br\":\"Uganda\",\"pt\":\"Uganda\",\"nl\":\"Oeganda\",\"hr\":\"Uganda\",\"fa\":\"اوگاندا\",\"de\":\"Uganda\",\"es\":\"Uganda\",\"fr\":\"Uganda\",\"ja\":\"ウガンダ\",\"it\":\"Uganda\",\"cn\":\"乌干达\"}',1.00000000,32.00000000,'??','U+1F1FA U+1F1EC','2018-07-21 01:41:03','2021-12-11 19:15:17',1,'Q1036'),(230,'Ukraine','UKR','804','UA','380','Kiev','UAH','Ukrainian hryvnia','₴','.ua','Україна','Europe','Eastern Europe','[{\"zoneName\":\"Europe/Kiev\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"},{\"zoneName\":\"Europe/Simferopol\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"MSK\",\"tzName\":\"Moscow Time\"},{\"zoneName\":\"Europe/Uzhgorod\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"},{\"zoneName\":\"Europe/Zaporozhye\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]','{\"kr\":\"우크라이나\",\"br\":\"Ucrânia\",\"pt\":\"Ucrânia\",\"nl\":\"Oekraïne\",\"hr\":\"Ukrajina\",\"fa\":\"وکراین\",\"de\":\"Ukraine\",\"es\":\"Ucrania\",\"fr\":\"Ukraine\",\"ja\":\"ウクライナ\",\"it\":\"Ucraina\",\"cn\":\"乌克兰\"}',49.00000000,32.00000000,'??','U+1F1FA U+1F1E6','2018-07-21 01:41:03','2021-12-11 19:15:22',1,'Q212'),(231,'United Arab Emirates','ARE','784','AE','971','Abu Dhabi','AED','United Arab Emirates dirham','إ.د','.ae','دولة الإمارات العربية المتحدة','Asia','Western Asia','[{\"zoneName\":\"Asia/Dubai\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"GST\",\"tzName\":\"Gulf Standard Time\"}]','{\"kr\":\"아랍에미리트\",\"br\":\"Emirados árabes Unidos\",\"pt\":\"Emirados árabes Unidos\",\"nl\":\"Verenigde Arabische Emiraten\",\"hr\":\"Ujedinjeni Arapski Emirati\",\"fa\":\"امارات متحده عربی\",\"de\":\"Vereinigte Arabische Emirate\",\"es\":\"Emiratos Árabes Unidos\",\"fr\":\"Émirats arabes unis\",\"ja\":\"アラブ首長国連邦\",\"it\":\"Emirati Arabi Uniti\",\"cn\":\"阿拉伯联合酋长国\"}',24.00000000,54.00000000,'??','U+1F1E6 U+1F1EA','2018-07-21 01:41:03','2021-12-11 19:15:29',1,'Q878'),(232,'United Kingdom','GBR','826','GB','44','London','GBP','British pound','£','.uk','United Kingdom','Europe','Northern Europe','[{\"zoneName\":\"Europe/London\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]','{\"kr\":\"영국\",\"br\":\"Reino Unido\",\"pt\":\"Reino Unido\",\"nl\":\"Verenigd Koninkrijk\",\"hr\":\"Ujedinjeno Kraljevstvo\",\"fa\":\"بریتانیای کبیر و ایرلند شمالی\",\"de\":\"Vereinigtes Königreich\",\"es\":\"Reino Unido\",\"fr\":\"Royaume-Uni\",\"ja\":\"イギリス\",\"it\":\"Regno Unito\",\"cn\":\"英国\"}',54.00000000,-2.00000000,'??','U+1F1EC U+1F1E7','2018-07-21 01:41:03','2021-12-11 19:07:13',1,'Q145'),(233,'United States','USA','840','US','1','Washington','USD','United States dollar','$','.us','United States','Americas','Northern America','[{\"zoneName\":\"America/Adak\",\"gmtOffset\":-36000,\"gmtOffsetName\":\"UTC-10:00\",\"abbreviation\":\"HST\",\"tzName\":\"Hawaii–Aleutian Standard Time\"},{\"zoneName\":\"America/Anchorage\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"America/Boise\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Chicago\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Denver\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Detroit\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Indianapolis\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Knox\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Marengo\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Petersburg\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Tell_City\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Vevay\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Vincennes\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Winamac\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Juneau\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"America/Kentucky/Louisville\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Kentucky/Monticello\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Los_Angeles\",\"gmtOffset\":-28800,\"gmtOffsetName\":\"UTC-08:00\",\"abbreviation\":\"PST\",\"tzName\":\"Pacific Standard Time (North America\"},{\"zoneName\":\"America/Menominee\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Metlakatla\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"America/New_York\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Nome\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"America/North_Dakota/Beulah\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/North_Dakota/Center\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/North_Dakota/New_Salem\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Phoenix\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Sitka\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"America/Yakutat\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"Pacific/Honolulu\",\"gmtOffset\":-36000,\"gmtOffsetName\":\"UTC-10:00\",\"abbreviation\":\"HST\",\"tzName\":\"Hawaii–Aleutian Standard Time\"}]','{\"kr\":\"미국\",\"br\":\"Estados Unidos\",\"pt\":\"Estados Unidos\",\"nl\":\"Verenigde Staten\",\"hr\":\"Sjedinjene Američke Države\",\"fa\":\"ایالات متحده آمریکا\",\"de\":\"Vereinigte Staaten von Amerika\",\"es\":\"Estados Unidos\",\"fr\":\"États-Unis\",\"ja\":\"アメリカ合衆国\",\"it\":\"Stati Uniti D\'America\",\"cn\":\"美国\"}',38.00000000,-97.00000000,'??','U+1F1FA U+1F1F8','2018-07-21 01:41:03','2021-12-11 19:06:28',1,'Q30'),(234,'United States Minor Outlying Islands','UMI','581','UM','1','','USD','United States dollar','$','.us','United States Minor Outlying Islands','Americas','Northern America','[{\"zoneName\":\"Pacific/Midway\",\"gmtOffset\":-39600,\"gmtOffsetName\":\"UTC-11:00\",\"abbreviation\":\"SST\",\"tzName\":\"Samoa Standard Time\"},{\"zoneName\":\"Pacific/Wake\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"WAKT\",\"tzName\":\"Wake Island Time\"}]','{\"kr\":\"미국령 군소 제도\",\"br\":\"Ilhas Menores Distantes dos Estados Unidos\",\"pt\":\"Ilhas Menores Distantes dos Estados Unidos\",\"nl\":\"Kleine afgelegen eilanden van de Verenigde Staten\",\"hr\":\"Mali udaljeni otoci SAD-a\",\"fa\":\"جزایر کوچک حاشیه‌ای ایالات متحده آمریکا\",\"de\":\"Kleinere Inselbesitzungen der Vereinigten Staaten\",\"es\":\"Islas Ultramarinas Menores de Estados Unidos\",\"fr\":\"Îles mineures éloignées des États-Unis\",\"ja\":\"合衆国領有小離島\",\"it\":\"Isole minori esterne degli Stati Uniti d\'America\",\"cn\":\"美国本土外小岛屿\"}',0.00000000,0.00000000,'??','U+1F1FA U+1F1F2','2018-07-21 01:41:03','2021-12-11 19:06:30',1,NULL),(235,'Uruguay','URY','858','UY','598','Montevideo','UYU','Uruguayan peso','$','.uy','Uruguay','Americas','South America','[{\"zoneName\":\"America/Montevideo\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"UYT\",\"tzName\":\"Uruguay Standard Time\"}]','{\"kr\":\"우루과이\",\"br\":\"Uruguai\",\"pt\":\"Uruguai\",\"nl\":\"Uruguay\",\"hr\":\"Urugvaj\",\"fa\":\"اروگوئه\",\"de\":\"Uruguay\",\"es\":\"Uruguay\",\"fr\":\"Uruguay\",\"ja\":\"ウルグアイ\",\"it\":\"Uruguay\",\"cn\":\"乌拉圭\"}',-33.00000000,-56.00000000,'??','U+1F1FA U+1F1FE','2018-07-21 01:41:03','2021-12-11 19:15:36',1,'Q77'),(236,'Uzbekistan','UZB','860','UZ','998','Tashkent','UZS','Uzbekistani soʻm','лв','.uz','O‘zbekiston','Asia','Central Asia','[{\"zoneName\":\"Asia/Samarkand\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"UZT\",\"tzName\":\"Uzbekistan Time\"},{\"zoneName\":\"Asia/Tashkent\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"UZT\",\"tzName\":\"Uzbekistan Time\"}]','{\"kr\":\"우즈베키스탄\",\"br\":\"Uzbequistão\",\"pt\":\"Usbequistão\",\"nl\":\"Oezbekistan\",\"hr\":\"Uzbekistan\",\"fa\":\"ازبکستان\",\"de\":\"Usbekistan\",\"es\":\"Uzbekistán\",\"fr\":\"Ouzbékistan\",\"ja\":\"ウズベキスタン\",\"it\":\"Uzbekistan\",\"cn\":\"乌兹别克斯坦\"}',41.00000000,64.00000000,'??','U+1F1FA U+1F1FF','2018-07-21 01:41:03','2021-12-11 19:15:40',1,'Q265'),(237,'Vanuatu','VUT','548','VU','678','Port Vila','VUV','Vanuatu vatu','VT','.vu','Vanuatu','Oceania','Melanesia','[{\"zoneName\":\"Pacific/Efate\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"VUT\",\"tzName\":\"Vanuatu Time\"}]','{\"kr\":\"바누아투\",\"br\":\"Vanuatu\",\"pt\":\"Vanuatu\",\"nl\":\"Vanuatu\",\"hr\":\"Vanuatu\",\"fa\":\"وانواتو\",\"de\":\"Vanuatu\",\"es\":\"Vanuatu\",\"fr\":\"Vanuatu\",\"ja\":\"バヌアツ\",\"it\":\"Vanuatu\",\"cn\":\"瓦努阿图\"}',-16.00000000,167.00000000,'??','U+1F1FB U+1F1FA','2018-07-21 01:41:03','2021-12-11 19:15:47',1,'Q686'),(238,'Vatican City State (Holy See)','VAT','336','VA','379','Vatican City','EUR','Euro','€','.va','Vaticano','Europe','Southern Europe','[{\"zoneName\":\"Europe/Vatican\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"바티칸 시국\",\"br\":\"Vaticano\",\"pt\":\"Vaticano\",\"nl\":\"Heilige Stoel\",\"hr\":\"Sveta Stolica\",\"fa\":\"سریر مقدس\",\"de\":\"Heiliger Stuhl\",\"es\":\"Santa Sede\",\"fr\":\"voir Saint\",\"ja\":\"聖座\",\"it\":\"Santa Sede\",\"cn\":\"梵蒂冈\"}',41.90000000,12.45000000,'??','U+1F1FB U+1F1E6','2018-07-21 01:41:03','2021-12-11 19:02:24',1,'Q237'),(239,'Venezuela','VEN','862','VE','58','Caracas','VEF','Bolívar','Bs','.ve','Venezuela','Americas','South America','[{\"zoneName\":\"America/Caracas\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"VET\",\"tzName\":\"Venezuelan Standard Time\"}]','{\"kr\":\"베네수엘라\",\"br\":\"Venezuela\",\"pt\":\"Venezuela\",\"nl\":\"Venezuela\",\"hr\":\"Venezuela\",\"fa\":\"ونزوئلا\",\"de\":\"Venezuela\",\"es\":\"Venezuela\",\"fr\":\"Venezuela\",\"ja\":\"ベネズエラ・ボリバル共和国\",\"it\":\"Venezuela\",\"cn\":\"委内瑞拉\"}',8.00000000,-66.00000000,'??','U+1F1FB U+1F1EA','2018-07-21 01:41:03','2021-12-11 19:16:04',1,'Q717'),(240,'Vietnam','VNM','704','VN','84','Hanoi','VND','Vietnamese đồng','₫','.vn','Việt Nam','Asia','South-Eastern Asia','[{\"zoneName\":\"Asia/Ho_Chi_Minh\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"ICT\",\"tzName\":\"Indochina Time\"}]','{\"kr\":\"베트남\",\"br\":\"Vietnã\",\"pt\":\"Vietname\",\"nl\":\"Vietnam\",\"hr\":\"Vijetnam\",\"fa\":\"ویتنام\",\"de\":\"Vietnam\",\"es\":\"Vietnam\",\"fr\":\"Viêt Nam\",\"ja\":\"ベトナム\",\"it\":\"Vietnam\",\"cn\":\"越南\"}',16.16666666,107.83333333,'??','U+1F1FB U+1F1F3','2018-07-21 01:41:03','2021-12-11 19:16:14',1,'Q881'),(241,'Virgin Islands (British)','VGB','092','VG','+1-284','Road Town','USD','United States dollar','$','.vg','British Virgin Islands','Americas','Caribbean','[{\"zoneName\":\"America/Tortola\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"영국령 버진아일랜드\",\"br\":\"Ilhas Virgens Britânicas\",\"pt\":\"Ilhas Virgens Britânicas\",\"nl\":\"Britse Maagdeneilanden\",\"hr\":\"Britanski Djevičanski Otoci\",\"fa\":\"جزایر ویرجین بریتانیا\",\"de\":\"Britische Jungferninseln\",\"es\":\"Islas Vírgenes del Reino Unido\",\"fr\":\"Îles Vierges britanniques\",\"ja\":\"イギリス領ヴァージン諸島\",\"it\":\"Isole Vergini Britanniche\",\"cn\":\"圣文森特和格林纳丁斯\"}',18.43138300,-64.62305000,'??','U+1F1FB U+1F1EC','2018-07-21 01:41:03','2021-12-11 19:06:33',1,NULL),(242,'Virgin Islands (US)','VIR','850','VI','+1-340','Charlotte Amalie','USD','United States dollar','$','.vi','United States Virgin Islands','Americas','Caribbean','[{\"zoneName\":\"America/St_Thomas\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"미국령 버진아일랜드\",\"br\":\"Ilhas Virgens Americanas\",\"pt\":\"Ilhas Virgens Americanas\",\"nl\":\"Verenigde Staten Maagdeneilanden\",\"fa\":\"جزایر ویرجین آمریکا\",\"de\":\"Amerikanische Jungferninseln\",\"es\":\"Islas Vírgenes de los Estados Unidos\",\"fr\":\"Îles Vierges des États-Unis\",\"ja\":\"アメリカ領ヴァージン諸島\",\"it\":\"Isole Vergini americane\",\"cn\":\"维尔京群岛（美国）\"}',18.34000000,-64.93000000,'??','U+1F1FB U+1F1EE','2018-07-21 01:41:03','2021-12-11 19:16:20',1,NULL),(243,'Wallis And Futuna Islands','WLF','876','WF','681','Mata Utu','XPF','CFP franc','₣','.wf','Wallis et Futuna','Oceania','Polynesia','[{\"zoneName\":\"Pacific/Wallis\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"WFT\",\"tzName\":\"Wallis & Futuna Time\"}]','{\"kr\":\"왈리스 푸투나\",\"br\":\"Wallis e Futuna\",\"pt\":\"Wallis e Futuna\",\"nl\":\"Wallis en Futuna\",\"hr\":\"Wallis i Fortuna\",\"fa\":\"والیس و فوتونا\",\"de\":\"Wallis und Futuna\",\"es\":\"Wallis y Futuna\",\"fr\":\"Wallis-et-Futuna\",\"ja\":\"ウォリス・フツナ\",\"it\":\"Wallis e Futuna\",\"cn\":\"瓦利斯群岛和富图纳群岛\"}',-13.30000000,-176.20000000,'??','U+1F1FC U+1F1EB','2018-07-21 01:41:03','2021-12-11 19:16:25',1,NULL),(244,'Western Sahara','ESH','732','EH','212','El-Aaiun','MAD','Moroccan Dirham','MAD','.eh','الصحراء الغربية','Africa','Northern Africa','[{\"zoneName\":\"Africa/El_Aaiun\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WEST\",\"tzName\":\"Western European Summer Time\"}]','{\"kr\":\"서사하라\",\"br\":\"Saara Ocidental\",\"pt\":\"Saara Ocidental\",\"nl\":\"Westelijke Sahara\",\"hr\":\"Zapadna Sahara\",\"fa\":\"جمهوری دموکراتیک عربی صحرا\",\"de\":\"Westsahara\",\"es\":\"Sahara Occidental\",\"fr\":\"Sahara Occidental\",\"ja\":\"西サハラ\",\"it\":\"Sahara Occidentale\",\"cn\":\"西撒哈拉\"}',24.50000000,-13.00000000,'??','U+1F1EA U+1F1ED','2018-07-21 01:41:03','2021-12-11 19:16:40',1,NULL),(245,'Yemen','YEM','887','YE','967','Sanaa','YER','Yemeni rial','﷼','.ye','اليَمَن','Asia','Western Asia','[{\"zoneName\":\"Asia/Aden\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]','{\"kr\":\"예멘\",\"br\":\"Iêmen\",\"pt\":\"Iémen\",\"nl\":\"Jemen\",\"hr\":\"Jemen\",\"fa\":\"یمن\",\"de\":\"Jemen\",\"es\":\"Yemen\",\"fr\":\"Yémen\",\"ja\":\"イエメン\",\"it\":\"Yemen\",\"cn\":\"也门\"}',15.00000000,48.00000000,'??','U+1F1FE U+1F1EA','2018-07-21 01:41:03','2021-12-11 19:16:48',1,'Q805'),(246,'Zambia','ZMB','894','ZM','260','Lusaka','ZMW','Zambian kwacha','ZK','.zm','Zambia','Africa','Eastern Africa','[{\"zoneName\":\"Africa/Lusaka\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]','{\"kr\":\"잠비아\",\"br\":\"Zâmbia\",\"pt\":\"Zâmbia\",\"nl\":\"Zambia\",\"hr\":\"Zambija\",\"fa\":\"زامبیا\",\"de\":\"Sambia\",\"es\":\"Zambia\",\"fr\":\"Zambie\",\"ja\":\"ザンビア\",\"it\":\"Zambia\",\"cn\":\"赞比亚\"}',-15.00000000,30.00000000,'??','U+1F1FF U+1F1F2','2018-07-21 01:41:03','2021-12-11 19:16:53',1,'Q953'),(247,'Zimbabwe','ZWE','716','ZW','263','Harare','ZWL','Zimbabwe Dollar','$','.zw','Zimbabwe','Africa','Eastern Africa','[{\"zoneName\":\"Africa/Harare\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]','{\"kr\":\"짐바브웨\",\"br\":\"Zimbabwe\",\"pt\":\"Zimbabué\",\"nl\":\"Zimbabwe\",\"hr\":\"Zimbabve\",\"fa\":\"زیمباوه\",\"de\":\"Simbabwe\",\"es\":\"Zimbabue\",\"fr\":\"Zimbabwe\",\"ja\":\"ジンバブエ\",\"it\":\"Zimbabwe\",\"cn\":\"津巴布韦\"}',-20.00000000,30.00000000,'??','U+1F1FF U+1F1FC','2018-07-21 01:41:03','2021-12-11 19:17:10',1,'Q954'),(248,'Kosovo','XKX','926','XK','383','Pristina','EUR','Euro','€','.xk','Republika e Kosovës','Europe','Eastern Europe','[{\"zoneName\":\"Europe/Belgrade\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]','{\"kr\":\"코소보\",\"cn\":\"科索沃\"}',42.56129090,20.34030350,'??','U+1F1FD U+1F1F0','2020-08-15 21:03:50','2021-12-11 18:56:38',1,'Q1246'),(249,'Curaçao','CUW','531','CW','599','Willemstad','ANG','Netherlands Antillean guilder','ƒ','.cw','Curaçao','Americas','Caribbean','[{\"zoneName\":\"America/Curacao\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"퀴라소\",\"br\":\"Curaçao\",\"pt\":\"Curaçao\",\"nl\":\"Curaçao\",\"fa\":\"کوراسائو\",\"de\":\"Curaçao\",\"fr\":\"Curaçao\",\"it\":\"Curaçao\",\"cn\":\"库拉索\"}',12.11666700,-68.93333300,'??','U+1F1E8 U+1F1FC','2020-10-25 20:24:20','2021-12-11 18:31:45',1,'Q25279'),(250,'Sint Maarten (Dutch part)','SXM','534','SX','1721','Philipsburg','ANG','Netherlands Antillean guilder','ƒ','.sx','Sint Maarten','Americas','Caribbean','[{\"zoneName\":\"America/Anguilla\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]','{\"kr\":\"신트마르턴\",\"br\":\"Sint Maarten\",\"pt\":\"São Martinho\",\"nl\":\"Sint Maarten\",\"fa\":\"سینت مارتن\",\"de\":\"Sint Maarten (niederl. Teil)\",\"fr\":\"Saint Martin (partie néerlandaise)\",\"it\":\"Saint Martin (parte olandese)\",\"cn\":\"圣马丁岛（荷兰部分）\"}',18.03333300,-63.05000000,'??','U+1F1F8 U+1F1FD','2020-12-05 18:33:39','2021-12-11 19:11:24',1,'Q26273');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_notifications`
--

DROP TABLE IF EXISTS `custom_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(2048) DEFAULT NULL,
  `message` varchar(4096) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_notifications`
--

LOCK TABLES `custom_notifications` WRITE;
/*!40000 ALTER TABLE `custom_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_boy_notifications`
--

DROP TABLE IF EXISTS `delivery_boy_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_boy_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_boy_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `title` mediumtext NOT NULL,
  `message` mediumtext NOT NULL,
  `type` varchar(56) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `delivery_boy_id` (`delivery_boy_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_boy_notifications`
--

LOCK TABLES `delivery_boy_notifications` WRITE;
/*!40000 ALTER TABLE `delivery_boy_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_boy_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digital_orders_mails`
--

DROP TABLE IF EXISTS `digital_orders_mails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digital_orders_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `subject` varchar(256) DEFAULT NULL,
  `message` varchar(256) DEFAULT NULL,
  `file_url` varchar(512) DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digital_orders_mails`
--

LOCK TABLES `digital_orders_mails` WRITE;
/*!40000 ALTER TABLE `digital_orders_mails` DISABLE KEYS */;
/*!40000 ALTER TABLE `digital_orders_mails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` mediumtext DEFAULT NULL,
  `answer` mediumtext DEFAULT NULL,
  `status` char(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_transfers`
--

DROP TABLE IF EXISTS `fund_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fund_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_boy_id` int(11) NOT NULL,
  `opening_balance` double NOT NULL,
  `closing_balance` double NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(28) DEFAULT NULL,
  `message` varchar(512) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `delivery_boy_id` (`delivery_boy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_transfers`
--

LOCK TABLES `fund_transfers` WRITE;
/*!40000 ALTER TABLE `fund_transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'admin','Administrator'),(2,'members','General User'),(3,'delivery_boy','Delivery Boys'),(4,'seller','Sellers');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(128) DEFAULT NULL,
  `code` varchar(8) DEFAULT NULL,
  `is_rtl` tinyint(4) NOT NULL DEFAULT 0,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'english','en',0,'2021-02-11 05:18:42');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL DEFAULT 0,
  `title` mediumtext NOT NULL,
  `name` mediumtext NOT NULL,
  `extension` varchar(16) NOT NULL,
  `type` varchar(16) NOT NULL,
  `sub_directory` mediumtext NOT NULL,
  `size` mediumtext NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,0,'eshop-logo-full','eshop-logo-full.png','png','image','uploads/media/2021/','32358','2021-03-31 06:32:50'),(2,0,'favicon 64','eshop-favicon.png','png','image','uploads/media/2021/','14131','2021-03-31 06:34:15'),(3,0,'1000054383','1000054383.jpg','jpg','image','uploads/media/2023/','477.85','2023-11-05 06:12:09'),(4,0,'10000543831','10000543831.jpg','jpg','image','uploads/media/2023/','477.85','2023-11-05 06:13:00'),(5,0,'github','github.png','png','image','uploads/media/2023/','4.06','2023-11-11 08:06:32'),(6,0,'1000054383','1000054383.jpg','jpg','image','uploads/media/2023/','477.85','2023-12-17 08:12:37');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (14);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `message` varchar(512) NOT NULL,
  `type` varchar(12) NOT NULL,
  `type_id` text NOT NULL,
  `send_to` varchar(64) DEFAULT NULL,
  `users_id` text DEFAULT NULL,
  `image` varchar(128) DEFAULT NULL,
  `link` varchar(512) NOT NULL DEFAULT 'NULL',
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `type_id` int(11) DEFAULT 0,
  `link` varchar(512) NOT NULL DEFAULT 'NULL',
  `image` varchar(256) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_bank_transfer`
--

DROP TABLE IF EXISTS `order_bank_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_bank_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `attachments` varchar(512) DEFAULT NULL,
  `status` tinyint(2) DEFAULT 0 COMMENT '(0:pending|1:rejected|2:accepted)',
  `date_created` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_bank_transfer`
--

LOCK TABLES `order_bank_transfer` WRITE;
/*!40000 ALTER TABLE `order_bank_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_bank_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_charges`
--

DROP TABLE IF EXISTS `order_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `product_variant_ids` varchar(1024) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_item_ids` varchar(1024) NOT NULL,
  `delivery_charge` double DEFAULT NULL,
  `promo_code` varchar(1024) DEFAULT 'NULL',
  `promo_discount` double DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `otp` int(11) NOT NULL DEFAULT 0,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_charges`
--

LOCK TABLES `order_charges` WRITE;
/*!40000 ALTER TABLE `order_charges` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `delivery_boy_id` int(11) DEFAULT NULL,
  `seller_id` int(11) NOT NULL,
  `is_credited` tinyint(2) NOT NULL DEFAULT 0,
  `otp` int(11) NOT NULL DEFAULT 0,
  `product_name` varchar(512) DEFAULT NULL,
  `variant_name` varchar(256) DEFAULT NULL,
  `product_variant_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `discounted_price` double DEFAULT NULL,
  `tax_percent` double DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `discount` double DEFAULT 0,
  `sub_total` double NOT NULL,
  `deliver_by` varchar(128) DEFAULT NULL,
  `updated_by` int(11) DEFAULT 0,
  `status` varchar(1024) NOT NULL,
  `admin_commission_amount` double NOT NULL DEFAULT 0,
  `seller_commission_amount` double NOT NULL DEFAULT 0,
  `active_status` varchar(1024) DEFAULT NULL,
  `hash_link` varchar(512) DEFAULT 'NULL',
  `is_sent` tinyint(4) DEFAULT 0,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  KEY `product_variant_id` (`product_variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_tracking`
--

DROP TABLE IF EXISTS `order_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `shiprocket_order_id` int(11) NOT NULL,
  `shipment_id` int(11) NOT NULL,
  `courier_company_id` int(11) NOT NULL DEFAULT 0,
  `awb_code` varchar(128) NOT NULL DEFAULT 'NULL',
  `pickup_status` int(11) NOT NULL,
  `pickup_scheduled_date` varchar(255) NOT NULL,
  `pickup_token_number` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `others` varchar(255) NOT NULL,
  `pickup_generated_date` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `is_canceled` int(11) NOT NULL DEFAULT 0,
  `manifest_url` varchar(512) NOT NULL,
  `label_url` varchar(512) NOT NULL,
  `invoice_url` varchar(512) NOT NULL,
  `order_item_id` mediumtext DEFAULT NULL,
  `courier_agency` varchar(20) DEFAULT NULL,
  `tracking_id` varchar(120) NOT NULL,
  `url` varchar(256) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_tracking`
--

LOCK TABLES `order_tracking` WRITE;
/*!40000 ALTER TABLE `order_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `mobile` varchar(12) NOT NULL,
  `total` double NOT NULL,
  `delivery_charge` double DEFAULT 0,
  `is_delivery_charge_returnable` tinyint(4) NOT NULL DEFAULT 0,
  `wallet_balance` double DEFAULT 0,
  `promo_code` varchar(28) DEFAULT NULL,
  `promo_discount` double DEFAULT NULL,
  `discount` double DEFAULT 0,
  `total_payable` double DEFAULT NULL,
  `final_total` double DEFAULT NULL,
  `payment_method` varchar(16) NOT NULL,
  `latitude` varchar(256) DEFAULT NULL,
  `longitude` varchar(256) DEFAULT NULL,
  `address` mediumtext DEFAULT NULL,
  `delivery_time` varchar(128) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `otp` int(11) DEFAULT 0,
  `email` varchar(254) DEFAULT 'NULL',
  `notes` varchar(512) DEFAULT NULL,
  `is_pos_order` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_requests`
--

DROP TABLE IF EXISTS `payment_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `payment_type` varchar(56) NOT NULL,
  `payment_address` varchar(1024) NOT NULL,
  `amount_requested` int(11) NOT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_requests`
--

LOCK TABLES `payment_requests` WRITE;
/*!40000 ALTER TABLE `payment_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pickup_locations`
--

DROP TABLE IF EXISTS `pickup_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pickup_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `pickup_location` varchar(256) NOT NULL,
  `name` varchar(512) NOT NULL,
  `email` varchar(256) NOT NULL,
  `phone` varchar(28) NOT NULL,
  `address` text NOT NULL,
  `address_2` text NOT NULL,
  `city` varchar(56) NOT NULL,
  `state` varchar(56) NOT NULL,
  `country` varchar(56) NOT NULL,
  `pin_code` varchar(56) NOT NULL,
  `latitude` varchar(128) DEFAULT 'NULL',
  `longitude` varchar(128) DEFAULT 'NULL',
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pickup_locations`
--

LOCK TABLES `pickup_locations` WRITE;
/*!40000 ALTER TABLE `pickup_locations` DISABLE KEYS */;
INSERT INTO `pickup_locations` VALUES (1,4,'Bhimraj','Bhimraj','raj@yopmail.com','656456456','ff','3rfdfsd','Thane','Maharashtra','India','400606','19.2139266','9641758',0,'2023-11-05 18:40:12');
/*!40000 ALTER TABLE `pickup_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attributes`
--

DROP TABLE IF EXISTS `product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `attribute_value_ids` text NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attributes`
--

LOCK TABLES `product_attributes` WRITE;
/*!40000 ALTER TABLE `product_attributes` DISABLE KEYS */;
INSERT INTO `product_attributes` VALUES (1,1,'','2022-04-04 05:12:09'),(2,2,'','2023-11-11 08:07:22'),(3,3,'','2023-11-14 18:28:08'),(4,4,'','2023-11-14 18:34:27'),(5,5,'','2023-11-14 18:38:13'),(6,6,'','2023-11-14 18:40:03'),(7,7,'','2023-11-15 06:51:24'),(8,8,'','2023-11-15 06:54:20'),(9,9,'','2023-11-15 07:59:36'),(10,10,'','2023-11-15 08:15:58'),(11,11,'','2023-11-15 08:17:45'),(12,12,'','2023-11-15 08:19:56'),(13,13,'','2023-11-15 14:59:26'),(14,14,'','2023-11-19 14:41:56'),(15,15,'','2023-12-17 08:13:12'),(16,16,'','2023-12-17 08:16:10'),(17,17,'','2023-12-17 08:24:33');
/*!40000 ALTER TABLE `product_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_faqs`
--

DROP TABLE IF EXISTS `product_faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `votes` int(11) NOT NULL DEFAULT 0,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `answered_by` int(11) NOT NULL DEFAULT 0,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_faqs`
--

LOCK TABLES `product_faqs` WRITE;
/*!40000 ALTER TABLE `product_faqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_rating`
--

DROP TABLE IF EXISTS `product_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` double NOT NULL DEFAULT 0,
  `images` mediumtext DEFAULT NULL,
  `comment` varchar(1024) DEFAULT NULL,
  `data_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_rating`
--

LOCK TABLES `product_rating` WRITE;
/*!40000 ALTER TABLE `product_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_set`
--

DROP TABLE IF EXISTS `product_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Product_id` int(20) NOT NULL,
  `minimum_quantity` int(20) NOT NULL,
  `maximum_quantity` int(20) NOT NULL,
  `discount_mrp` float NOT NULL,
  `discount_price_set` float NOT NULL,
  `selling_price_set` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(20) NOT NULL COMMENT '0=Active,1=Inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_set`
--

LOCK TABLES `product_set` WRITE;
/*!40000 ALTER TABLE `product_set` DISABLE KEYS */;
INSERT INTO `product_set` VALUES (1,9,0,949,95,9025,0,'2023-11-15 07:59:36',0),(2,11,0,1,1,0,1,'2023-11-15 08:17:45',0),(3,11,0,1,1,0,1,'2023-11-15 08:17:45',0),(4,11,0,1,1,0,1,'2023-11-15 08:17:45',0),(5,12,0,473,16,0,0,'2023-11-15 08:19:56',0),(6,12,0,220,6,0,0,'2023-11-15 08:19:56',0),(7,12,0,327,72,0,0,'2023-11-15 08:19:56',0),(8,13,0,450,28,0,0,'2023-11-15 14:59:26',0),(9,13,0,742,22,0,0,'2023-11-15 14:59:26',0),(10,13,0,495,68,0,0,'2023-11-15 14:59:26',0),(11,14,0,395,40,0,0,'2023-11-19 14:41:56',0),(12,14,0,378,9,0,0,'2023-11-19 14:41:56',0),(13,14,0,892,58,0,0,'2023-11-19 14:41:56',0),(14,17,5,50,2,0,110,'2023-12-17 08:24:33',0);
/*!40000 ALTER TABLE `product_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variants`
--

DROP TABLE IF EXISTS `product_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `attribute_value_ids` text DEFAULT NULL,
  `attribute_set` varchar(1024) DEFAULT NULL,
  `price` double NOT NULL,
  `special_price` double DEFAULT 0,
  `sku` varchar(128) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `weight` float NOT NULL DEFAULT 0,
  `height` float NOT NULL DEFAULT 0,
  `breadth` float NOT NULL DEFAULT 0,
  `length` float NOT NULL DEFAULT 0,
  `images` text DEFAULT NULL,
  `availability` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `unit` varchar(100) DEFAULT NULL,
  `unit_set` varchar(100) NOT NULL,
  `set_unit` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `purchase_rate` float NOT NULL,
  `selling_price` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variants`
--

LOCK TABLES `product_variants` WRITE;
/*!40000 ALTER TABLE `product_variants` DISABLE KEYS */;
INSERT INTO `product_variants` VALUES (2,2,NULL,NULL,500,400,NULL,NULL,0,45,50,80,NULL,NULL,1,'2023-11-11 08:07:22',NULL,'','',0,NULL),(3,3,NULL,NULL,800,500,NULL,NULL,34,83,83,64,NULL,NULL,1,'2023-11-14 18:28:08',NULL,'','',45,NULL),(4,4,NULL,NULL,46,0,NULL,NULL,75,0,0,0,NULL,NULL,1,'2023-11-14 18:34:27',NULL,'','',59,NULL),(5,7,NULL,NULL,500,316,NULL,NULL,15,80,57,93,NULL,NULL,1,'2023-11-15 06:51:24','Dozens','83','Chart',25,NULL),(6,8,NULL,NULL,676,564,NULL,NULL,96,22,12,92,NULL,NULL,1,'2023-11-15 06:54:20','Litre','2','Kg',456,0),(7,11,NULL,NULL,23556,949,NULL,NULL,75,63,81,1,NULL,NULL,1,'2023-11-15 08:17:45','Meter','6','Quintal',453,0),(8,12,NULL,NULL,7564,538,NULL,NULL,14,92,99,15,NULL,NULL,1,'2023-11-15 08:19:56','Pieces','97','Kg',435,0),(9,13,NULL,NULL,200,100,NULL,NULL,26,96,65,63,NULL,NULL,1,'2023-11-15 14:59:26','Pairs','2','Piece',45,0),(10,14,NULL,NULL,6756,552,NULL,NULL,20,9,53,43,NULL,NULL,1,'2023-11-19 14:41:56','Metric Tons','43','Tons',34,0),(11,15,NULL,NULL,100,50,NULL,NULL,0,0,0,0,NULL,NULL,1,'2023-12-17 08:13:12','Meter','2','Litre',12,NULL),(12,16,NULL,NULL,100,40,NULL,NULL,1,45,45,12,NULL,NULL,1,'2023-12-17 08:16:10','Chart','2','Piece',20,NULL),(13,17,NULL,NULL,818,116,NULL,NULL,1,0,0,0,NULL,NULL,1,'2023-12-17 08:24:33',NULL,'','',0,NULL);
/*!40000 ALTER TABLE `product_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_identity` varchar(50) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `tax` double DEFAULT NULL,
  `row_order` int(11) DEFAULT 0,
  `type` varchar(34) DEFAULT NULL,
  `stock_type` varchar(64) DEFAULT NULL COMMENT '0 =>''Simple_Product_Stock_Active'' 1 => "Product_Level" 1 => "Variable_Level"',
  `name` varchar(512) NOT NULL,
  `short_description` mediumtext DEFAULT NULL,
  `slug` varchar(512) NOT NULL,
  `indicator` tinyint(4) DEFAULT NULL COMMENT '0 - none | 1 - veg | 2 - non-veg',
  `cod_allowed` int(11) NOT NULL DEFAULT 1,
  `download_allowed` int(11) NOT NULL DEFAULT 0,
  `download_type` varchar(40) DEFAULT NULL,
  `download_link` varchar(512) DEFAULT NULL,
  `minimum_order_quantity` int(11) NOT NULL DEFAULT 1,
  `quantity_step_size` int(11) NOT NULL DEFAULT 1,
  `total_allowed_quantity` int(11) DEFAULT NULL,
  `is_prices_inclusive_tax` int(11) NOT NULL DEFAULT 0,
  `is_returnable` int(11) DEFAULT 0,
  `is_cancelable` int(11) DEFAULT 0,
  `cancelable_till` varchar(32) DEFAULT NULL,
  `image` mediumtext NOT NULL,
  `other_images` mediumtext DEFAULT NULL,
  `video_type` varchar(32) DEFAULT NULL,
  `video` varchar(512) DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `warranty_period` varchar(32) DEFAULT NULL,
  `guarantee_period` varchar(32) DEFAULT NULL,
  `made_in` varchar(128) DEFAULT NULL,
  `hsn_code` varchar(256) DEFAULT NULL,
  `brand` varchar(256) DEFAULT NULL,
  `sku` varchar(128) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `availability` tinyint(4) DEFAULT NULL,
  `rating` double DEFAULT 0,
  `no_of_ratings` int(11) DEFAULT 0,
  `description` mediumtext DEFAULT NULL,
  `extra_description` varchar(2048) NOT NULL DEFAULT 'NULL',
  `deliverable_type` int(11) NOT NULL DEFAULT 1 COMMENT '(0:none, 1:all, 2:include, 3:exclude)',
  `deliverable_zipcodes` varchar(512) DEFAULT NULL,
  `pickup_location` varchar(512) NOT NULL DEFAULT 'NULL',
  `status` int(2) DEFAULT 1,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,NULL,2,4,4,0,'simple_product',NULL,'Rylee Sheppard','Soluta impedit aut','rylee-sheppard',0,1,0,'','',44,370,394,1,1,1,'processed','uploads/media/2023/github.png','[]','','','','','','India','67567',NULL,NULL,NULL,NULL,0,0,'<p>hee lo ssicser</p>','<p>regfrtret tertret</p>',1,NULL,'Bhimraj',1,'2023-11-11 08:07:22'),(3,NULL,2,4,3,0,'simple_product',NULL,'Dolan Graham','Animi explicabo No','dolan-graham',0,1,0,'','',288,99,373,1,1,1,'received','uploads/media/2023/github.png','[]','','','','Totam reiciendis bla','Eos qui in quam ad','India','5645645',NULL,NULL,NULL,NULL,0,0,'<p>wrewr</p>','<p>erwerw53454fg</p>',1,NULL,'Bhimraj',1,'2023-11-14 18:28:08'),(4,NULL,1,4,3,0,'simple_product',NULL,'Rylee Sheppard','hb','rylee-sheppard-1',0,0,0,'','',1,1,NULL,0,0,0,'','uploads/media/2023/github.png','[]','','','','','',NULL,'',NULL,NULL,NULL,NULL,0,0,'','',1,NULL,'Bhimraj',1,'2023-11-14 18:34:27'),(5,NULL,1,4,4,0,'digital_product',NULL,'Thor Kirby','In voluptas sequi qu','thor-kirby',0,0,0,'','',739,251,1,0,0,0,'','uploads/media/2021/eshop-logo-full.png','[]','','','','Excepteur odit quia','Enim non et sed ipsu',NULL,'Ex fugit enim dolor',NULL,NULL,NULL,NULL,0,0,'','',1,NULL,' ',1,'2023-11-14 18:38:13'),(6,NULL,1,4,4,0,'simple_product',NULL,'MacKenzie Dudley','Rem quia aliqua Obc','mackenzie-dudley',1,1,0,'','',778,839,915,0,0,0,'','uploads/media/2021/eshop-logo-full.png','[]','','','','Atque doloribus labo','Optio et dolor do e',NULL,'Voluptas architecto',NULL,NULL,NULL,NULL,0,0,'','',1,NULL,'Bhimraj',1,'2023-11-14 18:40:03'),(7,NULL,2,4,3,0,'simple_product',NULL,'Dalton Ayala','Voluptatem consecte','dalton-ayala',1,1,0,'','',507,806,78,0,0,0,'','uploads/media/2021/eshop-logo-full.png','[]','','','','Adipisci suscipit la','Vel aut necessitatib',NULL,'Iste iure nihil dolo',NULL,NULL,NULL,NULL,0,0,'<p>gfg</p>','<p>gfgfdg</p>',1,NULL,'Bhimraj',1,'2023-11-15 06:51:24'),(8,NULL,0,4,4,0,'simple_product',NULL,'Brennan Johnston','Temporibus beatae in','brennan-johnston-1',0,1,0,'','',454,138,981,0,0,0,'','uploads/media/2021/eshop-logo-full.png','[]','','','','Excepturi iste facil','Labore velit aut si',NULL,'Eum fugiat et eiusmo',NULL,'Enim aliquip dolores',33,1,0,0,'<p>gdgd</p>','<p>dfgdfg</p>',1,NULL,' ',1,'2023-11-15 06:54:20'),(9,NULL,1,4,4,0,'simple_product','0','Abigail Bender','Ut accusamus est con','abigail-bender',1,1,0,'','',306,787,124,0,0,0,'','uploads/media/2021/eshop-logo-full.png','[]','','','It is very hard to be.','Ex voluptatem aliqu','Quis officia tempor',NULL,'Velit ut tenetur su',NULL,'Laborum distinctio',38,1,0,0,'<p>dg</p>','<p>gfg</p>',1,NULL,'Bhimraj',1,'2023-11-15 07:59:36'),(10,NULL,1,4,3,0,'simple_product','0','Kevyn William','Aute in perferendis','kevyn-william',0,0,0,'','',157,279,241,0,0,0,'','uploads/media/2021/eshop-logo-full.png','[]','','','','Tenetur accusantium','Excepteur exercitati',NULL,'Est maiores repudian',NULL,'Obcaecati sed volupt',64,0,0,0,'<p>ete</p>','<p>tr</p>',1,NULL,'Bhimraj',1,'2023-11-15 08:15:58'),(11,NULL,1,4,4,0,'simple_product','0','Venus Cox','Nihil labore ullam e','venus-cox',1,0,0,'','',427,537,955,0,0,0,'','uploads/media/2021/eshop-logo-full.png','[]','','','','Numquam consequatur','Omnis in quo labore',NULL,'Aut veritatis aut re',NULL,'Quisquam optio volu',94,1,0,0,'','',1,NULL,'Bhimraj',1,'2023-11-15 08:17:45'),(12,NULL,1,2,3,0,'simple_product','0','Scarlett Long','Quidem sed inventore','scarlett-long',0,0,0,'','',287,323,449,0,0,0,'','uploads/media/2021/eshop-logo-full.png','[]','','','','Eaque voluptate sint','Veritatis sint non',NULL,'Fuga Occaecat et ac',NULL,'Voluptate in laboris',58,1,0,0,'','',1,NULL,' ',1,'2023-11-15 08:19:56'),(13,NULL,2,4,3,0,'simple_product','0','Rhonda Carr','Quidem qui in conseq','rhonda-carr',0,1,0,'','',309,248,754,0,0,0,'','uploads/media/2021/eshop-logo-full.png','[]','','','','Qui rerum ut beatae','Asperiores reprehend',NULL,'Aspernatur consequat',NULL,'Officia quas aute at',22,1,0,0,'<p>gdfg</p>','<p>gdfg</p>',1,NULL,'Bhimraj',1,'2023-11-15 14:59:26'),(14,NULL,2,4,4,0,'simple_product','0','Wyoming Chambers','Sit magnam recusanda','wyoming-chambers',0,0,0,'','',160,39,859,0,0,0,'','uploads/media/2021/eshop-logo-full.png','[]','','','','Eius ut enim eiusmod','Quas elit fugiat ve',NULL,'Sint illum do minus',NULL,'Dignissimos et enim',51,1,0,0,'','',1,NULL,'Bhimraj',1,'2023-11-19 14:41:56'),(15,NULL,2,4,4,0,'simple_product',NULL,'Uriah Mcintosh','Eligendi sint qui e','uriah-mcintosh',0,1,0,'','',2,803,2,1,1,1,'shipped','uploads/media/2023/1000054383.jpg','[]','','','ghgf','Est magni cumque bea','Mollitia aut reicien',NULL,'Optio reprehenderit',NULL,NULL,NULL,NULL,0,0,'','',1,NULL,'Bhimraj',1,'2023-12-17 08:13:12'),(16,NULL,2,4,3,0,'simple_product',NULL,'Keegan Burns','Sed voluptas est ut','keegan-burns',0,1,0,'','',1,529,754,1,1,1,'shipped','uploads/media/2023/1000054383.jpg','[]','','','','Alias esse inventor','Culpa occaecat nihil','Afghanistan','Laboriosam qui omni',NULL,NULL,NULL,NULL,0,0,'<p>jghjg</p>','<p>hjghjg</p>',1,NULL,'Bhimraj',1,'2023-12-17 08:16:10'),(17,NULL,2,2,4,0,'simple_product',NULL,'Darius Navarro','Qui pariatur Ut pro','darius-navarro-1',2,0,0,'','',1,898,887,0,0,0,'','uploads/media/2023/1000054383.jpg','[]','','','','Ex est quam reiciend','Non aut sit incidun','Aland Islands','Nihil id mollitia e',NULL,NULL,NULL,NULL,0,0,'<p>jgjg</p>','<p>jgjghj</p>',1,NULL,' ',1,'2023-12-17 08:24:33');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promo_codes`
--

DROP TABLE IF EXISTS `promo_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promo_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promo_code` varchar(28) NOT NULL,
  `message` varchar(512) DEFAULT NULL,
  `start_date` varchar(28) DEFAULT NULL,
  `end_date` varchar(28) DEFAULT NULL,
  `no_of_users` int(11) DEFAULT NULL,
  `minimum_order_amount` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `discount_type` varchar(32) DEFAULT NULL,
  `max_discount_amount` double DEFAULT NULL,
  `repeat_usage` tinyint(4) NOT NULL,
  `no_of_repeat_usage` int(11) NOT NULL,
  `image` varchar(256) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `is_cashback` tinyint(4) DEFAULT 0,
  `list_promocode` tinyint(4) DEFAULT 1,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promo_codes`
--

LOCK TABLES `promo_codes` WRITE;
/*!40000 ALTER TABLE `promo_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `promo_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_requests`
--

DROP TABLE IF EXISTS `return_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `return_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `remarks` varchar(1024) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_requests`
--

LOCK TABLES `return_requests` WRITE;
/*!40000 ALTER TABLE `return_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `return_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(512) NOT NULL,
  `short_description` varchar(512) DEFAULT NULL,
  `style` varchar(16) NOT NULL,
  `product_ids` varchar(1024) DEFAULT NULL,
  `row_order` int(11) NOT NULL DEFAULT 0,
  `categories` mediumtext DEFAULT NULL,
  `product_type` varchar(1024) DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,'new','new','default',NULL,0,'1','new_added_products','2022-04-04 05:12:44','1'),(2,'Hello','Hello','style_1',NULL,0,'1','new_added_products','2023-11-05 06:32:23','1'),(3,'34','fd','style_1',NULL,0,'2','new_added_products','2023-11-06 18:58:35','1');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_commission`
--

DROP TABLE IF EXISTS `seller_commission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller_commission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `commission` double(10,2) NOT NULL DEFAULT 0.00,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_commission`
--

LOCK TABLES `seller_commission` WRITE;
/*!40000 ALTER TABLE `seller_commission` DISABLE KEYS */;
INSERT INTO `seller_commission` VALUES (1,2,1,0.00,'2022-04-04 05:11:35');
/*!40000 ALTER TABLE `seller_commission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_data`
--

DROP TABLE IF EXISTS `seller_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `slug` varchar(512) DEFAULT NULL,
  `category_ids` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `store_name` varchar(256) DEFAULT NULL,
  `store_description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `logo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `store_url` varchar(512) DEFAULT NULL,
  `no_of_ratings` int(11) DEFAULT 0,
  `rating` double(8,2) DEFAULT 0.00,
  `bank_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bank_code` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `account_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `account_number` varchar(100) DEFAULT NULL,
  `national_identity_card` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address_proof` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `authorized_signature` mediumtext NOT NULL,
  `pan_number` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tax_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tax_number` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `commission` double(10,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(2) NOT NULL DEFAULT 2 COMMENT 'approved: 1 | not-approved: 2 | deactive:0 | removed :7',
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_data`
--

LOCK TABLES `seller_data` WRITE;
/*!40000 ALTER TABLE `seller_data` DISABLE KEYS */;
INSERT INTO `seller_data` VALUES (1,2,'dikshita-dikshita','1','dikshita dikshita','','','',0,0.00,'','','','','uploads/seller/51Ptg9X9mdL.jpg','uploads/seller/il_794xN_2697185910_2oy6.jpg','','','test','1234','{\"require_products_approval\":\"0\",\"customer_privacy\":\"0\",\"view_order_otp\":\"0\",\"assign_delivery_boy\":\"0\"}',0.00,1,'2022-04-04 05:11:35'),(2,4,'om-1',NULL,'OM','gdg','uploads/seller/github3.png','',0,0.00,'sdff','43432','ffs','34343','uploads/seller/Blue_and_White_Bold_Business_LinkedIn_Article_Cover_Image_(1)10.png','uploads/seller/Blue_and_White_Bold_Business_LinkedIn_Article_Cover_Image_(1)11.png','uploads/seller/Blue_and_White_Bold_Business_LinkedIn_Article_Cover_Image_(1)9.png','4234rff','regt3','fffdf3','{\"require_products_approval\":\"0\",\"customer_privacy\":\"0\",\"view_order_otp\":\"0\",\"assign_delivery_boy\":\"0\"}',0.00,1,'2023-11-05 18:36:13');
/*!40000 ALTER TABLE `seller_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable` varchar(128) NOT NULL,
  `value` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variable` (`variable`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'logo','uploads/media/2021/eshop-logo-full.png'),(2,'privacy_policy','<p></p><h2><b>Privacy policy</b></h2> costumers ACCESSING, BROWSING OR OTHERWISE USING THE \\r\\nWEBSITE eShop.com, Missed Call Service or mobile application \\r\\nINDICATES user is in AGREEMENT with eShop vegetables & \\r\\nfruits Pvt Ltd for ALL THE TERMS AND CONDITIONS MENTIONED henceforth. \\r\\nUser is requested to READ terms and conditions CAREFULLY BEFORE \\r\\nPROCEEDING FURTHER.<br>\\r\\nUser is the person, group of person, company, trust, society, legal \\r\\nentity, legal personality or anyone who visits website, mobile app or \\r\\ngives missed call or places order with eShop via phone or website \\r\\nor mobile application or browse through website www.eShop.com.<p></p>\\r\\n\\r\\n<p>eShop reserves the right to add, alter, change, modify or delete\\r\\n any of these terms and conditions at any time without prior \\r\\ninformation. The altered terms and conditions becomes binding on the \\r\\nuser since the moment same are unloaded on the website \\r\\nwww.eShop.com</p>\\r\\n\\r\\n<p>eShop is in trade of fresh fruits and vegetables and delivers the order to home (user’s desired address) directly.</p>\\r\\n\\r\\n<p>That any user who gives missed call/call for order on any number \\r\\npublished/used by eShop.com, consents to receive, accept calls and \\r\\nmessages or any after communication from eShop vegetables & \\r\\nfruits Pvt Ltd for Promotion and Telemarketing Purposes within a week.</p>\\r\\n\\r\\n<p>If a customer do not wish to receive any communication from eShop, please SMS NO OFFERS to 9512512125.</p>\\r\\n\\r\\n<p>eShop accept orders on all seven days and user will receive the \\r\\ndelivery next day from date of order placement, as we at eShop \\r\\nprocure the fresh produce from the procurement center and deliver it \\r\\nstraight to user.</p>\\r\\n\\r\\n<p>There is Minimum Order value of Rs. 200. There are no delivery \\r\\ncharges on an order worth Rs. 200 or above. In special cases, if \\r\\npermitted, order value is less then Rs. 200/– , Rs. 40 as shipping \\r\\ncharges shall be charged from user.</p>\\r\\n\\r\\n<p>eShop updates the prices on daily basis and the price displayed \\r\\nat our website www.eShop.com, at the time of placement of order by \\r\\nuser he/she/it will be charged as per the price listed at the website \\r\\nwww.eShop.com.</p>\\r\\n\\r\\n<p>In the event, though there are remote possibilities, of wrong invoice\\r\\n generation due to any reason, in case it happens eShop vegetables \\r\\n& fruits Pvt Ltd reserve its right to again raise the correct \\r\\ninvoice at the revised amount and same shall be paid by user.</p>\\r\\n\\r\\n<p>At times it is difficult to weigh certain vegetables or fruits \\r\\nexactly as per the order or desired quantity of user, hence the delivery\\r\\n might be with five percent variation on both higher or lower side of \\r\\nexact ordered quantity, user are hereby under takes to pay to eShop\\r\\n vegetables & fruits Pvt Ltd as per the final invoice. We at \\r\\neShop understands and our endeavor is to always deliver in exact \\r\\nquantity in consonance with quantity ordered but every time it’s not \\r\\npossible but eShop guarantee the fair deal and weight to all its \\r\\nusers. eShop further assures its users that at no instance delivery\\r\\n weights/quantity vary dramatically from what quantity ordered by user.</p>\\r\\n\\r\\n<p>If some product is not available or is not of good quality, the same \\r\\nitem will not be delivered and will be adjusted accordingly in the \\r\\ninvoice; all rights in this regards are reserved with eShop. Images\\r\\n of Fruits & Vegetables present in the website are for demonstration\\r\\n purpose and may not resemble exactly in size, colour, weight, contrast \\r\\netc; though we assure our best to maintain the best quality in product, \\r\\nwhich is being our foremost commitment to the customer.</p>\\r\\n\\r\\n<p>All orders placed before 11 PM in the Night will be delivered next day or as per delivery date chosen.</p>'),(3,'terms_conditions','<h3><b>Terms and conditions</b></h3><p> costumers eshop.com is a sole proprietary firm , Juridical rights of eshop.com are reserved with eshop</p><p>Personal Information eshop.com and the website eshop.com (”The Site”) . respects your privacy. This Privacy Policy succinctly provides the manner your data is collected and used by eshop.com. on the Site. As a visitor to the Site/ Customer you are advised to please read the Privacy Policy carefully.</p><p><br></p><p>Services Overview As part of the registration process on the Site, eshop.com may collect the following personally identifiable information about you: Name including first and last name, alternate email address, mobile phone number and contact details, Postal code, GPS location, Demographic profile &#40;like your age, gender, occupation, education, address etc.&#41; and information about the pages on the site you visit/access, the links you click on the site, the number of times you access the page and any such browsing information.</p><p><br></p><p>Eligibility Services of the Site would be available to only select geographies in India. Persons who are \\\"incompetent to contract\\\" within the meaning of the Indian Contract Act, 1872 including un-discharged insolvents etc. are not eligible to use the Site. If you are a minor i.e. under the age of 18 years but at least 13 years of age you may use the Site only under the supervision of a parent or legal guardian who agrees to be bound by these Terms of Use. If your age is below 18 years, your parents or legal guardians can transact on behalf of you if they are registered users. You are prohibited from purchasing any material which is for adult consumption and the sale of which to minors is prohibited.</p><p><br></p><p>License & Site Access eshop.com grants you a limited sub-license to access and make personal use of this site and not to download (other than page caching) or modify it, or any portion of it, except with express written consent of eshop.com. This license does not include any resale or commercial use of this site or its contents; any collection and use of any product listings, descriptions, or prices; any derivative use of this site or its contents; any downloading or copying of account information for the benefit of another merchant; or any use of data mining, robots, or similar data gathering and extraction tools. This site or any portion of this site may not be reproduced, duplicated, copied, sold, resold, visited or otherwise exploited for any commercial purpose without express written consent of eshop.com. You may not frame or utilize framing techniques to enclose any trademark, logo, or other proprietary information (including images, text, page layout, or form) of the Site or of eshop.com and its affiliates without express written consent. You may not use any meta tags or any other \\\"hidden text\\\" utilizing the Site’s or eshop.com’s name or eshop.com’s name or trademarks without the express written consent of eshop.com. Any unauthorized use, terminates the permission or license granted by eshop.com</p><p><br></p><p>Account & Registration Obligations All shoppers have to register and login for placing orders on the Site. You have to keep your account and registration details current and correct for communications related to your purchases from the site. By agreeing to the terms and conditions, the shopper agrees to receive promotional communication and newsletters upon registration. The customer can opt out either by unsubscribing in \\\"My Account\\\" or by contacting the customer service.</p><p><br></p><p>Pricing All the products listed on the Site will be sold at MRP unless otherwise specified. The prices mentioned at the time of ordering will be the prices charged on the date of the delivery. Although prices of most of the products do not fluctuate on a daily basis but some of the commodities and fresh food prices do change on a daily basis. In case the prices are higher or lower on the date of delivery not additional charges will be collected or refunded as the case may be at the time of the delivery of the order.</p><p><br></p><p>Cancellation by Site / Customer You as a customer can cancel your order anytime up to the cut-off time of the slot for which you have placed an order by calling our customer service. In such a case we will Credit your wallet against any payments already made by you for the order. If we suspect any fraudulent transaction by any customer or any transaction which defies the terms & conditions of using the website, we at our sole discretion could cancel such orders. We will maintain a negative list of all fraudulent transactions and customers and would deny access to them or cancel any orders placed by them.</p><p><br></p><p>Return & Refunds We have a \\\"no questions asked return policy\\\" which entitles all our Delivery Ambassadors to return the product at the time of delivery if due to any reason they are not satisfied with the quality or freshness of the product. We will take the returned product back with us and issue a credit note for the value of the return products which will be credited to your account on the Site. This can be used to pay your subsequent shopping bills. Refund will be processed through same online mode within 7 working days.</p><p><br></p><p><br></p><p>Delivery & Shipping Charge</p><p><br></p><p>1.You can expect to receive your order depending on the delivery option you have chosen.</p><p><br></p><p>2.You can order 24*7 in website & mobile application , Our delivery timeings are between 06:00 AM - 02:00PM Same day delivery.</p><p><br></p><p>3.You will get free shipping on order amount above Rs.150.</p><p>You Agree and Confirm</p><p>1. That in the event that a non-delivery occurs on account of a mistake by you (i.e. wrong name or address or any other wrong information) any extra cost incurred by eshop. for redelivery shall be claimed from you.</p><p>2. That you will use the services provided by the Site, its affiliates, consultants and contracted companies, for lawful purposes only and comply with all applicable laws and regulations while using and transacting on the Site.</p><p>3. You will provide authentic and true information in all instances where such information is requested you. eshop reserves the right to confirm and validate the information and other details provided by you at any point of time. If upon confirmation your details are found not to be true (wholly or partly), it has the right in its sole discretion to reject the registration and debar you from using the Services and / or other affiliated websites without prior intimation whatsoever.</p><p>4. That you are accessing the services available on this Site and transacting at your sole risk and are using your best and prudent judgment before entering into any transaction through this Site.</p><p>5. That the address at which delivery of the product ordered by you is to be made will be correct and proper in all respects.</p><p>6. That before placing an order you will check the product description carefully. By placing an order for a product you agree to be bound by the conditions of sale included in the item\\\'s description.</p><p><br></p><p>You may not use the Site for any of the following purposes:</p><p>1. Disseminating any unlawful, harassing, libelous, abusive, threatening, harmful, vulgar, obscene, or otherwise objectionable material.</p><p>2. Transmitting material that encourages conduct that constitutes a criminal offence or results in civil liability or otherwise breaches any relevant laws, regulations or code of practice.</p><p>3. Gaining unauthorized access to other computer systems.</p><p>4. Interfering with any other person\\\'s use or enjoyment of the Site.</p><p>5. Breaching any applicable laws;</p><p>6. Interfering or disrupting networks or web sites connected to the Site.</p><p>7. Making, transmitting or storing electronic copies of materials protected by copyright without the permission of the owner.</p><p><br></p><p>Colors we have made every effort to display the colors of our products that appear on the Website as accurately as possible. However, as the actual colors you see will depend on your monitor, we cannot guarantee that your monitor\\\'s display of any color will be accurate.</p><p><br></p><p>Modification of Terms & Conditions of Service eshop may at any time modify the Terms & Conditions of Use of the Website without any prior notification to you. You can access the latest version of these Terms & Conditions at any given time on the Site. You should regularly review the Terms & Conditions on the Site. In the event the modified Terms & Conditions is not acceptable to you, you should discontinue using the Service. However, if you continue to use the Service you shall be deemed to have agreed to accept and abide by the modified Terms & Conditions of Use of this Site.</p><p><br></p><p>Governing Law and Jurisdiction This User Agreement shall be construed in accordance with the applicable laws of India. The Courts at Faridabad shall have exclusive jurisdiction in any proceedings arising out of this agreement. Any dispute or difference either in interpretation or otherwise, of any terms of this User Agreement between the parties hereto, the same shall be referred to an independent arbitrator who will be appointed by eshop and his decision shall be final and binding on the parties hereto. The above arbitration shall be in accordance with the Arbitration and Conciliation Act, 1996 as amended from time to time. The arbitration shall be held in Nagpur. The High Court of judicature at Nagpur Bench of Mumbai High Court alone shall have the jurisdiction and the Laws of India shall apply.</p><p><br></p><p>Reviews, Feedback, Submissions All reviews, comments, feedback, postcards, suggestions, ideas, and other submissions disclosed, submitted or offered to the Site on or by this Site or otherwise disclosed, submitted or offered in connection with your use of this Site (collectively, the \\\"Comments\\\") shall be and remain the property of eshop Such disclosure, submission or offer of any Comments shall constitute an assignment to eshop of all worldwide rights, titles and interests in all copyrights and other intellectual properties in the Comments. Thus, eshop owns exclusively all such rights, titles and interests and shall not be limited in any way in its use, commercial or otherwise, of any Comments. eshopwill be entitled to use, reproduce, disclose, modify, adapt, create derivative works from, publish, display and distribute any Comments you submit for any purpose whatsoever, without restriction and without compensating you in any way. eshop is and shall be under no obligation (1) to maintain any Comments in confidence; (2) to pay you any compensation for any Comments; or (3) to respond to any Comments. You agree that any Comments submitted by you to the Site will not violate this policy or any right of any third party, including copyright, trademark, privacy or other personal or proprietary right(s), and will not cause injury to any person or entity. You further agree that no Comments submitted by you to the Website will be or contain libelous or otherwise unlawful, threatening, abusive or obscene material, or contain software viruses, political campaigning, commercial solicitation, chain letters, mass mailings or any form of \\\"spam\\\". eshop does not regularly review posted Comments, but does reserve the right (but not the obligation) to monitor and edit or remove any Comments submitted to the Site. You grant eshopthe right to use the name that you submit in connection with any Comments. You agree not to use a false email address, impersonate any person or entity, or otherwise mislead as to the origin of any Comments you submit. You are and shall remain solely responsible for the content of any Comments you make and you agree to indemnify eshop and its affiliates for all claims resulting from any Comments you submit. eshop and its affiliates take no responsibility and assume no liability for any Comments submitted by you or any third party.</p><p><br></p><p>Copyright & Trademark eshop.com and eshop.com, its suppliers and licensors expressly reserve all intellectual property rights in all text, programs, products, processes, technology, content and other materials, which appear on this Site. Access to this Website does not confer and shall not be considered as conferring upon anyone any license under any of eshop.com or any third party\\\'s intellectual property rights. All rights, including copyright, in this website are owned by or licensed to eshop.com from eshop.com. Any use of this website or its contents, including copying or storing it or them in whole or part, other than for your own personal, non-commercial use is prohibited without the permission of eshop.com and/or eshop.com. You may not modify, distribute or re-post anything on this website for any purpose.The names and logos and all related product and service names, design marks and slogans are the trademarks or service marks of eshop.com, eshop.com, its affiliates, its partners or its suppliers. All other marks are the property of their respective companies. No trademark or service mark license is granted in connection with the materials contained on this Site. Access to this Site does not authorize anyone to use any name, logo or mark in any manner.References on this Site to any names, marks, products or services of third parties or hypertext links to third party sites or information are provided solely as a convenience to you and do not in any way constitute or imply eshop.com or eshop.com\\\'s endorsement, sponsorship or recommendation of the third party, information, product or service. eshop.com or eshop.com is not responsible for the content of any third party sites and does not make any representations regarding the content or accuracy of material on such sites. If you decide to link to any such third party websites, you do so entirely at your own risk. All materials, including images, text, illustrations, designs, icons, photographs, programs, music clips or downloads, video clips and written and other materials that are part of this Website (collectively, the \\\"Contents\\\") are intended solely for personal, non-commercial use. You may download or copy the Contents and other downloadable materials displayed on the Website for your personal use only. No right, title or interest in any downloaded materials or software is transferred to you as a result of any such downloading or copying. You may not reproduce (except as noted above), publish, transmit, distribute, display, modify, create derivative works from, sell or participate in any sale of or exploit in any way, in whole or in part, any of the Contents, the Website or any related software. All software used on this Website is the property of eshop.com or its licensees and suppliers and protected by Indian and international copyright laws. The Contents and software on this Website may be used only as a shopping resource. Any other use, including the reproduction, modification, distribution, transmission, republication, display, or performance, of the Contents on this Website is strictly prohibited. Unless otherwise noted, all Contents are copyrights, trademarks, trade dress and/or other intellectual property owned, controlled or licensed by eshop.com, one of its affiliates or by third parties who have licensed their materials to eshop.com and are protected by Indian and international copyright laws. The compilation (meaning the collection, arrangement, and assembly) of all Contents on this Website is the exclusive property of eshop.com and eshop.com and is also protected by Indian and international copyright laws.</p><p><br></p><p>Objectionable Material You understand that by using this Site or any services provided on the Site, you may encounter Content that may be deemed by some to be offensive, indecent, or objectionable, which Content may or may not be identified as such. You agree to use the Site and any service at your sole risk and that to the fullest extent permitted under applicable law, eshop.com and/or eshop.com and its affiliates shall have no liability to you for Content that may be deemed offensive, indecent, or objectionable to you.</p><p><br></p><p>Indemnity You agree to defend, indemnify and hold harmless eshop.com, eshop.com, its employees, directors, Coordinators, officers, agents, interns and their successors and assigns from and against any and all claims, liabilities, damages, losses, costs and expenses, including attorney\\\'s fees, caused by or arising out of claims based upon your actions or inactions, which may result in any loss or liability to eshop.com or eshop.com or any third party including but not limited to breach of any warranties, representations or undertakings or in relation to the non-fulfillment of any of your obligations under this User Agreement or arising out of the violation of any applicable laws, regulations including but not limited to Intellectual Property Rights, payment of statutory dues and taxes, claim of libel, defamation, violation of rights of privacy or publicity, loss of service by other subscribers and infringement of intellectual property or other rights. This clause shall survive the expiry or termination of this User Agreement.</p><p><br></p><p>Termination This User Agreement is effective unless and until terminated by either you or eshop.com. You may terminate this User Agreement at any time, provided that you discontinue any further use of this Site. eshop.com may terminate this User Agreement at any time and may do so immediately without notice, and accordingly deny you access to the Site, Such termination will be without any liability to eshop.com. Upon any termination of the User Agreement by either you or eshop.com, you must promptly destroy all materials downloaded or otherwise obtained from this Site, as well as all copies of such materials, whether made under the User Agreement or otherwise. eshop.com\\\'s right to any Comments shall survive any termination of this User Agreement. Any such termination of the User Agreement shall not cancel your obligation to pay for the product already ordered from the Website or affect any liability that may have arisen under the User Agreement.</p>'),(4,'fcm_server_key','your_fcm_server_key'),(5,'contact_us','<h2><strong xss=removed>Contact Us</strong></h2>\\r\\n\\r\\n<p>For any kind of queries related to products, orders or services feel free to contact us on our official email address or phone number as given below :</p>\\r\\n\\r\\n<p> </p>\\r\\n\\r\\n<h3><strong>Areas we deliver : </strong></h3>\\r\\n\\r\\n<p> </p>\\r\\n\\r\\n<h3><strong>Delivery Timings :</strong></h3>\\r\\n\\r\\n<ol>\\r\\n <li><strong>  8:00 AM To 10:30 AM</strong></li>\\r\\n <li><strong>10:30 AM To 12:30 PM</strong></li>\\r\\n <li><strong>  4:00 PM To  7:00 PM</strong></li></ol><h3> <strong></strong>\\r\\n\\r\\n</h3><p><strong>Note : </strong>You can order for maximum 2days in advance. i.e., Today & Tomorrow only.  <br></p>'),(6,'system_settings','{\"system_configurations\":\"1\",\"system_timezone_gmt\":\"+05:30\",\"system_configurations_id\":\"13\",\"app_name\":\"eShop - ecommerce\",\"support_number\":\"9876543210\",\"support_email\":\"support@eshop.com\",\"current_version\":\"1.0.0\",\"current_version_ios\":\"1.0.0\",\"is_version_system_on\":\"1\",\"area_wise_delivery_charge\":\"1\",\"currency\":\"\\u20b9\",\"delivery_charge\":\"10\",\"min_amount\":\"100\",\"system_timezone\":\"Asia\\/Kolkata\",\"is_refer_earn_on\":\"1\",\"min_refer_earn_order_amount\":\"100\",\"refer_earn_bonus\":\"10\",\"refer_earn_method\":\"percentage\",\"max_refer_earn_amount\":\"50\",\"refer_earn_bonus_times\":\"2\",\"welcome_wallet_balance_on\":\"0\",\"wallet_balance_amount\":\"\",\"minimum_cart_amt\":\"50\",\"low_stock_limit\":\"15\",\"max_items_cart\":\"12\",\"delivery_boy_bonus_percentage\":\"1\",\"max_product_return_days\":\"1\",\"is_delivery_boy_otp_setting_on\":\"1\",\"is_single_seller_order\":\"0\",\"is_customer_app_under_maintenance\":\"0\",\"is_seller_app_under_maintenance\":\"0\",\"is_delivery_boy_app_under_maintenance\":\"0\",\"message_for_customer_app\":\"\",\"message_for_seller_app\":\"\",\"message_for_delivery_boy_app\":\"\",\"cart_btn_on_list\":\"1\",\"expand_product_images\":\"0\",\"tax_name\":\"GST Number\",\"tax_number\":\"24GSTIN1022520\",\"company_name\":\"\",\"company_url\":\"\",\"supported_locals\":\"af\"}'),(7,'payment_method','{\"paypal_payment_method\":\"1\",\"paypal_mode\":\"paypal_mode\",\"paypal_business_email\":\"paypal_business_email\",\"currency_code\":\"USD\",\"razorpay_payment_method\":\"1\",\"razorpay_key_id\":\"rzp_test_key\",\"razorpay_secret_key\":\"secret_key\",\"paystack_payment_method\":\"1\",\"paystack_key_id\":\"paystack_public_key\",\"paystack_secret_key\":\"paystack_secret_key\",\"stripe_payment_method\":\"1\",\"stripe_payment_mode\":\"test\",\"stripe_publishable_key\":\"test_key\",\"stripe_secret_key\":\"test_key\",\"stripe_webhook_secret_key\":\"webhook_secret\",\"stripe_currency_code\":\"INR\",\"flutterwave_payment_method\":\"1\",\"flutterwave_public_key\":\"public_key\",\"flutterwave_secret_key\":\"secret_key\",\"flutterwave_encryption_key\":\"enc_key\",\"flutterwave_currency_code\":\"NGN\",\"paytm_payment_method\":\"1\",\"paytm_payment_mode\":\"sandbox\",\"paytm_merchant_key\":\"merchant_key\",\"paytm_merchant_id\":\"merchant_id\",\"paytm_website\":\"WEBSTAGING\",\"paytm_industry_type_id\":\"Retail\",\"google_pay_payment_method\":\"0\",\"google_pay_mode\":\"\",\"google_pay_merchant_name\":\"\",\"google_pay_merchant_id\":\"\",\"google_pay_currency_code\":\"\",\"google_pay_country_code\":\"\",\"direct_bank_transfer\":\"1\",\"account_name\":\"eShop E-Commerce LLC.\",\"account_number\":\"020211022000001\",\"bank_name\":\"State Bank of India\",\"bank_code\":\"SBIIN0007\",\"notes\":\"Please do not forget to upload the bank transfer receipt upon sending \\/ depositing money to the above-mentioned account. Once the amount deposit is confirmed the order will be processed further. To upload the receipt go to your order details page or screen and find a form to upload the receipt.\",\"cod_method\":\"1\"}'),(8,'about_us','<p>About us <br></p>'),(9,'currency','₹'),(11,'email_settings','{\"email\":\"your_email@gmail.com\",\"password\":\"your_pasword\",\"smtp_host\":\"smtp.googlemail.com\",\"smtp_port\":\"465\",\"mail_content_type\":\"html\",\"smtp_encryption\":\"ssl\"}'),(12,'time_slot_config','{\"time_slot_config\":\"1\",\"is_time_slots_enabled\":\"1\",\"delivery_starts_from\":\"1\",\"allowed_days\":\"7\"}'),(13,'favicon','uploads/media/2021/eshop-favicon.png'),(14,'delivery_boy_privacy_policy','<p><span xss=\\\"removed\\\"> delivery boy ACCESSING, </span>BROWSING OR OTHERWISE USING THE WEBSITE eShop.com, Missed Call Service or mobile application INDICATES user is in AGREEMENT with eShop vegetables & fruits Pvt Ltd for ALL THE TERMS AND CONDITIONS MENTIONED henceforth. User is requested to READ terms and conditions CAREFULLY BEFORE PROCEEDING FURTHER.<br>User is the person, group of person, company, trust, society, legal entity, legal personality or anyone who visits website, mobile app or gives missed call or places order with eShop via phone or website or mobile application or browse through website www.eShop.com.</p><p>eShop reserves the right to add, alter, change, modify or delete any of these terms and conditions at any time without prior information. The altered terms and conditions becomes binding on the user since the moment same are unloaded on the website www.eShop.com</p><p>eShop is in trade of fresh fruits and vegetables and delivers the order to home (user’s desired address) directly.</p><p>That any user who gives missed call/call for order on any number published/used by eShop.com, consents to receive, accept calls and messages or any after communication from eShop vegetables & fruits Pvt Ltd for Promotion and Telemarketing Purposes within a week.</p><p>If a customer do not wish to receive any communication from eShop, please SMS NO OFFERS to 9512512125.</p><p>eShop accept orders on all seven days and user will receive the delivery next day from date of order placement, as we at eShop procure the fresh produce from the procurement center and deliver it straight to user.</p><p>There is Minimum Order value of Rs. 200. There are no delivery charges on an order worth Rs. 200 or above. In special cases, if permitted, order value is less then Rs. 200/– , Rs. 40 as shipping charges shall be charged from user.</p><p>eShop updates the prices on daily basis and the price displayed at our website www.eShop.com, at the time of placement of order by user he/she/it will be charged as per the price listed at the website www.eShop.com.</p><p>In the event, though there are remote possibilities, of wrong invoice generation due to any reason, in case it happens eShop vegetables & fruits Pvt Ltd reserve its right to again raise the correct invoice at the revised amount and same shall be paid by user.</p><p>At times it is difficult to weigh certain vegetables or fruits exactly as per the order or desired quantity of user, hence the delivery might be with five percent variation on both higher or lower side of exact ordered quantity, user are hereby under takes to pay to eShop vegetables & fruits Pvt Ltd as per the final invoice. We at eShop understands and our endeavor is to always deliver in exact quantity in consonance with quantity ordered but every time it’s not possible but eShop guarantee the fair deal and weight to all its users. eShop further assures its users that at no instance delivery weights/quantity vary dramatically from what quantity ordered by user.</p><p>If some product is not available or is not of good quality, the same item will not be delivered and will be adjusted accordingly in the invoice; all rights in this regards are reserved with eShop. Images of Fruits & Vegetables present in the website are for demonstration purpose and may not resemble exactly in size, colour, weight, contrast etc; though we assure our best to maintain the best quality in product, which is being our foremost commitment to the customer.</p><p>All orders placed before 11 PM in the Night will be delivered next day or as per delivery date chosen.</p>'),(15,'delivery_boy_terms_conditions','<p><span xss=\\\"removed\\\"> delivery boy ACCESSING,</span><span xss=\\\"removed\\\"> </span>BROWSING OR OTHERWISE USING THE WEBSITE eShop.com, Missed Call Service or mobile application INDICATES user is in AGREEMENT with eShop vegetables & fruits Pvt Ltd for ALL THE TERMS AND CONDITIONS MENTIONED henceforth. User is requested to READ terms and conditions CAREFULLY BEFORE PROCEEDING FURTHER.<br>User is the person, group of person, company, trust, society, legal entity, legal personality or anyone who visits website, mobile app or gives missed call or places order with eShop via phone or website or mobile application or browse through website www.eShop.com.</p><p>eShop reserves the right to add, alter, change, modify or delete any of these terms and conditions at any time without prior information. The altered terms and conditions becomes binding on the user since the moment same are unloaded on the website www.eShop.com</p><p>eShop is in trade of fresh fruits and vegetables and delivers the order to home (user’s desired address) directly.</p><p>That any user who gives missed call/call for order on any number published/used by eShop.com, consents to receive, accept calls and messages or any after communication from eShop vegetables & fruits Pvt Ltd for Promotion and Telemarketing Purposes within a week.</p><p>If a customer do not wish to receive any communication from eShop, please SMS NO OFFERS to 9512512125.</p><p>eShop accept orders on all seven days and user will receive the delivery next day from date of order placement, as we at eShop procure the fresh produce from the procurement center and deliver it straight to user.</p><p>There is Minimum Order value of Rs. 200. There are no delivery charges on an order worth Rs. 200 or above. In special cases, if permitted, order value is less then Rs. 200/– , Rs. 40 as shipping charges shall be charged from user.</p><p>eShop updates the prices on daily basis and the price displayed at our website www.eShop.com, at the time of placement of order by user he/she/it will be charged as per the price listed at the website www.eShop.com.</p><p>In the event, though there are remote possibilities, of wrong invoice generation due to any reason, in case it happens eShop vegetables & fruits Pvt Ltd reserve its right to again raise the correct invoice at the revised amount and same shall be paid by user.</p><p>At times it is difficult to weigh certain vegetables or fruits exactly as per the order or desired quantity of user, hence the delivery might be with five percent variation on both higher or lower side of exact ordered quantity, user are hereby under takes to pay to eShop vegetables & fruits Pvt Ltd as per the final invoice. We at eShop understands and our endeavor is to always deliver in exact quantity in consonance with quantity ordered but every time it’s not possible but eShop guarantee the fair deal and weight to all its users. eShop further assures its users that at no instance delivery weights/quantity vary dramatically from what quantity ordered by user.</p><p>If some product is not available or is not of good quality, the same item will not be delivered and will be adjusted accordingly in the invoice; all rights in this regards are reserved with eShop. Images of Fruits & Vegetables present in the website are for demonstration purpose and may not resemble exactly in size, colour, weight, contrast etc; though we assure our best to maintain the best quality in product, which is being our foremost commitment to the customer.</p><p>All orders placed before 11 PM in the Night will be delivered next day or as per delivery date chosen.</p>'),(16,'web_logo','uploads/media/2021/eshop-logo-full.png'),(17,'web_favicon','uploads/media/2021/eshop-favicon.png'),(18,'web_settings','{\"site_title\":\"eShop - Multipurpose Ecommerce Store\",\"support_number\":\"1234567890\",\"support_email\":\"eshop@gmail.com\",\"copyright_details\":\"Copyright \\u00a9 2021, All Right Reserved WRTeam\",\"address\":\"Time Square Empire, WRTeam , Mirzapar Highway , Bhuj , Kutch , Gujarat - 370001\",\"app_short_description\":\"eShop is a multipurpose Ecommerce Platform best suitable for all kinds of sectors like Electronics, Fashion, Groceries and Vegetables, Flowers, Gift articles, Medical, and more ..\",\"map_iframe\":\"&lt;iframe src=\\\\\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d58652.60185263579!2d69.63381478835316!3d23.250814410717105!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3950e209000b6f17:0x7077f358af0774a6!2sBhuj, Gujarat!5e0!3m2!1sen!2sin!4v1614852897708!5m2!1sen!2sin\\\\\\\" width=\\\\\\\"600\\\\\\\" height=\\\\\\\"450\\\\\\\" style=\\\\\\\"border:0;\\\\\\\" allowfullscreen=\\\\\\\"\\\\\\\" loading=\\\\\\\"lazy\\\\\\\"&gt;&lt;\\/iframe&gt;\",\"logo\":\"uploads\\/media\\/2021\\/eshop-logo-full.png\",\"favicon\":\"uploads\\/media\\/2021\\/eshop-favicon.png\",\"meta_keywords\":\"Eshop , E-commerce\",\"meta_description\":\"Eshop is an ecommerce platform\",\"app_download_section\":true,\"app_download_section_title\":\"eShop Mobile App\",\"app_download_section_tagline\":\"Affordable Ecommerce Platform\",\"app_download_section_short_description\":\"Shop with us at affordable prices and get exciting cashback & offers.\",\"app_download_section_playstore_url\":\"https:\\/\\/play.google.com\\/\",\"app_download_section_appstore_url\":\"https:\\/\\/www.apple.com\\/in\\/app-store\\/\",\"twitter_link\":\"https:\\/\\/twitter.com\\/\",\"facebook_link\":\"https:\\/\\/facebook.com\\/\",\"instagram_link\":\"https:\\/\\/instagram.com\\/\",\"youtube_link\":\"https:\\/\\/youtube.com\\/\",\"shipping_mode\":true,\"shipping_title\":\"Free Shipping\",\"shipping_description\":\"Free Shipping at your door step.\",\"return_mode\":true,\"return_title\":\"Free Returns\",\"return_description\":\"Free return if products are damaged.\",\"support_mode\":true,\"support_title\":\"Support 24\\/7\",\"support_description\":\"24\\/7 and 365 days support is available.\",\"safety_security_mode\":true,\"safety_security_title\":\"100% Safe & Secure\",\"safety_security_description\":\"100% safe & secure.\"}'),(19,'firebase_settings','{\"apiKey\":\"apiKey\",\"authDomain\":\"authDomain\",\"databaseURL\":\"databaseURL\",\"projectId\":\"projectId\",\"storageBucket\":\"storageBucket\",\"messagingSenderId\":\"messagingSenderId\",\"appId\":\"appId\",\"measurementId\":\"measurementId\"}'),(20,'admin_privacy_policy','<p>Admin ACCESSING, BROWSING</span> OR OTHERWISE USING THE WEBSITE eShop.com, Missed Call Service or mobile application INDICATES user is in AGREEMENT with eShop vegetables & fruits Pvt Ltd for ALL THE TERMS AND CONDITIONS MENTIONED henceforth. User is requested to READ terms and conditions CAREFULLY BEFORE PROCEEDING FURTHER.</span></p><p>User is the person, group of person, company, trust, society, legal entity, legal personality or anyone who visits website, mobile app or gives missed call or places order with eShop via phone or website or mobile application or browse through website www.eShop.com.</p><p>eShop reserves the right to add, alter, change, modify or delete any of these terms and conditions at any time without prior information. The altered terms and conditions becomes binding on the user since the moment same are unloaded on the website www.eShop.com</p><p>eShop is in trade of fresh fruits and vegetables and delivers the order to home (user’s desired address) directly.</p><p>That any user who gives missed call/call for order on any number published/used by eShop.com, consents to receive, accept calls and messages or any after communication from eShop vegetables & fruits Pvt Ltd for Promotion and Telemarketing Purposes within a week.</p><p>If a customer do not wish to receive any communication from eShop, please SMS NO OFFERS to 9512512125.</p><p>eShop accept orders on all seven days and user will receive the delivery next day from date of order placement, as we at eShop procure the fresh produce from the procurement center and deliver it straight to user.</p><p>There is Minimum Order value of Rs. 200. There are no delivery charges on an order worth Rs. 200 or above. In special cases, if permitted, order value is less then Rs. 200/– , Rs. 40 as shipping charges shall be charged from user.</p><p>eShop updates the prices on daily basis and the price displayed at our website www.eShop.com, at the time of placement of order by user he/she/it will be charged as per the price listed at the website www.eShop.com.</p><p>In the event, though there are remote possibilities, of wrong invoice generation due to any reason, in case it happens eShop vegetables & fruits Pvt Ltd reserve its right to again raise the correct invoice at the revised amount and same shall be paid by user.</p><p>At times it is difficult to weigh certain vegetables or fruits exactly as per the order or desired quantity of user, hence the delivery might be with five percent variation on both higher or lower side of exact ordered quantity, user are hereby under takes to pay to eShop vegetables & <span xss=\\\"removed\\\">ACCESSING </span><span xss=\\\"removed\\\">fruits Pvt Ltd as per the final invoice. We at eShop understands and our endeavor is to always deliver in exact quantity in consonance with quantity ordered but every time it’s not possible but eShop guarantee the fair deal and weight to all its users. eShop further assures its users that at no instance delivery weights/quantity vary dramatically from what quantity ordered by user.</span></p><p>If some product is not available or is not of good quality, the same item will not be delivered and will be adjusted accordingly in the invoice; all rights in this regards are reserved with eShop. Images of Fruits & Vegetables present in the website are for demonstration purpose and may not resemble exactly in size, colour, weight, contrast etc; though we assure our best to maintain the best quality in product, which is being our foremost commitment to the customer.</p><p>All orders placed before 11 PM in the Night will be delivered next day or as per delivery date chosen.</p>'),(21,'admin_terms_conditions','<p><span xss=\\\"removed\\\"><span xss=\\\"removed\\\"> admin ACCESSING, BROWSING</span> OR OTHERWISE USING THE WEBSITE eShop.com, Missed Call Service or mobile application INDICATES user is in AGREEMENT with eShop vegetables & fruits Pvt Ltd for ALL THE TERMS AND CONDITIONS MENTIONED henceforth. User is requested to READ terms and conditions CAREFULLY BEFORE PROCEEDING FURTHER.</span></p><p>User is the person, group of person, company, trust, society, legal entity, legal personality or anyone who visits website, mobile app or gives missed call or places order with eShop via phone or website or mobile application or browse through website www.eShop.com.</p><p>eShop reserves the right to add, alter, change, modify or delete any of these terms and conditions at any time without prior information. The altered terms and conditions becomes binding on the user since the moment same are unloaded on the website www.eShop.com</p><p>eShop is in trade of fresh fruits and vegetables and delivers the order to home (user’s desired address) directly.</p><p>That any user who gives missed call/call for order on any number published/used by eShop.com, consents to receive, accept calls and messages or any after communication from eShop vegetables & fruits Pvt Ltd for Promotion and Telemarketing Purposes within a week.</p><p>If a customer do not wish to receive any communication from eShop, please SMS NO OFFERS to 9512512125.</p><p>eShop accept orders on all seven days and user will receive the delivery next day from date of order placement, as we at eShop procure the fresh produce from the procurement center and deliver it straight to user.</p><p>There is Minimum Order value of Rs. 200. There are no delivery charges on an order worth Rs. 200 or above. In special cases, if permitted, order value is less then Rs. 200/– , Rs. 40 as shipping charges shall be charged from user.</p><p>eShop updates the prices on daily basis and the price displayed at our website www.eShop.com, at the time of placement of order by user he/she/it will be charged as per the price listed at the website www.eShop.com.</p><p>In the event, though there are remote possibilities, of wrong invoice generation due to any reason, in case it happens eShop vegetables & fruits Pvt Ltd reserve its right to again raise the correct invoice at the revised amount and same shall be paid by user.</p><p>At times it is difficult to weigh certain vegetables or fruits exactly as per the order or desired quantity of user, hence the delivery might be with five percent variation on both higher or lower side of exact ordered quantity, user are hereby under takes to pay to eShop vegetables & fruits Pvt Ltd as per the final invoice. We at eShop understands and our endeavor is to always deliver in exact quantity in consonance with quantity ordered but every time it’s not possible but eShop guarantee the fair deal and weight to all its users. eShop further assures its users that at no instance delivery weights/quantity vary dramatically from what quantity ordered by user.</p><p>If some product is not available or is not of good quality, the same item will not be delivered and will be adjusted accordingly in the invoice; all rights in this regards are reserved with eShop. Images of Fruits & Vegetables present in the website are for demonstration purpose and may not resemble exactly in size, colour, weight, contrast etc; though we assure our best to maintain the best quality in product, which is being our foremost commitment to the customer.</p><p>All orders placed before 11 PM in the Night will be delivered next day or as per delivery date chosen.</p>'),(22,'seller_privacy_policy','<p><span xss=\\\"removed\\\"><span xss=\\\"removed\\\" xss=removed><b>Privacy Policy</b></span><br></span></p><p><span xss=\\\"removed\\\">Seller ACCESSING, </span>BROWSING OR OTHERWISE USING THE WEBSITE eShop.com, Missed Call Service or mobile application INDICATES user is in AGREEMENT with eShop vegetables & fruits Pvt Ltd for ALL THE TERMS AND CONDITIONS MENTIONED henceforth. User is requested to READ terms and conditions CAREFULLY BEFORE PROCEEDING FURTHER.<br>User is the person, group of person, company, trust, society, legal entity, legal personality or anyone who visits website, mobile app or gives missed call or places order with eShop via phone or website or mobile application or browse through website www.eShop.com.</p><p>eShop reserves the right to add, alter, change, modify or delete any of these terms and conditions at any time without prior information. The altered terms and conditions becomes binding on the user since the moment same are unloaded on the website www.eShop.com</p><p>eShop is in trade of fresh fruits and vegetables and delivers the order to home (user’s desired address) directly.</p><p>That any user who gives missed call/call for order on any number published/used by eShop.com, consents to receive, accept calls and messages or any after communication from eShop vegetables & fruits Pvt Ltd for Promotion and Telemarketing Purposes within a week.</p><p>If a customer do not wish to receive any communication from eShop, please SMS NO OFFERS to 9512512125.</p><p>eShop accept orders on all seven days and user will receive the delivery next day from date of order placement, as we at eShop procure the fresh produce from the procurement center and deliver it straight to user.</p><p>There is Minimum Order value of Rs. 200. There are no delivery charges on an order worth Rs. 200 or above. In special cases, if permitted, order value is less then Rs. 200/– , Rs. 40 as shipping charges shall be charged from user.</p><p>eShop updates the prices on daily basis and the price displayed at our website www.eShop.com, at the time of placement of order by user he/she/it will be charged as per the price listed at the website www.eShop.com.</p><p>In the event, though there are remote possibilities, of wrong invoice generation due to any reason, in case it happens eShop vegetables & fruits Pvt Ltd reserve its right to again raise the correct invoice at the revised amount and same shall be paid by user.</p><p>At times it is difficult to weigh certain vegetables or fruits exactly as per the order or desired quantity of user, hence the delivery might be with five percent variation on both higher or lower side of exact ordered quantity, user are hereby under takes to pay to eShop vegetables & fruits Pvt Ltd as per the final invoice. We at eShop understands and our endeavor is to always deliver in exact quantity in consonance with quantity ordered but every time it’s not possible but eShop guarantee the fair deal and weight to all its users. eShop further assures its users that at no instance delivery weights/quantity vary dramatically from what quantity ordered by user.</p><p>If some product is not available or is not of good quality, the same item will not be delivered and will be adjusted accordingly in the invoice; all rights in this regards are reserved with eShop. Images of Fruits & Vegetables present in the website are for demonstration purpose and may not resemble exactly in size, colour, weight, contrast etc; though we assure our best to maintain the best quality in product, which is being our foremost commitment to the customer.</p><p>All orders placed before 11 PM in the Night will be delivered next day or as per delivery date chosen.</p>'),(23,'seller_terms_conditions','<p><span xss=\\\"removed\\\"><span xss=\\\"removed\\\" xss=removed><b>Terms & Conditions</b></span></span><span xss=\\\"removed\\\">﻿</span><span xss=\\\"removed\\\"><br></span></p><p><span xss=\\\"removed\\\">Seller ACCESSING, </span>BROWSING OR OTHERWISE USING THE WEBSITE eShop.com, Missed Call Service or mobile application INDICATES user is in AGREEMENT with eShop vegetables & fruits Pvt Ltd for ALL THE TERMS AND CONDITIONS MENTIONED henceforth. User is requested to READ terms and conditions CAREFULLY BEFORE PROCEEDING FURTHER.<br>User is the person, group of person, company, trust, society, legal entity, legal personality or anyone who visits website, mobile app or gives missed call or places order with eShop via phone or website or mobile application or browse through website www.eShop.com.</p><p>eShop reserves the right to add, alter, change, modify or delete any of these terms and conditions at any time without prior information. The altered terms and conditions becomes binding on the user since the moment same are unloaded on the website www.eShop.com</p><p>eShop is in trade of fresh fruits and vegetables and delivers the order to home (user’s desired address) directly.</p><p>That any user who gives missed call/call for order on any number published/used by eShop.com, consents to receive, accept calls and messages or any after communication from eShop vegetables & fruits Pvt Ltd for Promotion and Telemarketing Purposes within a week.</p><p>If a customer do not wish to receive any communication from eShop, please SMS NO OFFERS to 9512512125.</p><p>eShop accept orders on all seven days and user will receive the delivery next day from date of order placement, as we at eShop procure the fresh produce from the procurement center and deliver it straight to user.</p><p>There is Minimum Order value of Rs. 200. There are no delivery charges on an order worth Rs. 200 or above. In special cases, if permitted, order value is less then Rs. 200/– , Rs. 40 as shipping charges shall be charged from user.</p><p>eShop updates the prices on daily basis and the price displayed at our website www.eShop.com, at the time of placement of order by user he/she/it will be charged as per the price listed at the website www.eShop.com.</p><p>In the event, though there are remote possibilities, of wrong invoice generation due to any reason, in case it happens eShop vegetables & fruits Pvt Ltd reserve its right to again raise the correct invoice at the revised amount and same shall be paid by user.</p><p>At times it is difficult to weigh certain vegetables or fruits exactly as per the order or desired quantity of user, hence the delivery might be with five percent variation on both higher or lower side of exact ordered quantity, user are hereby under takes to pay to eShop vegetables & fruits Pvt Ltd as per the final invoice. We at eShop understands and our endeavor is to always deliver in exact quantity in consonance with quantity ordered but every time it’s not possible but eShop guarantee the fair deal and weight to all its users. eShop further assures its users that at no instance delivery weights/quantity vary dramatically from what quantity ordered by user.</p><p>If some product is not available or is not of good quality, the same item will not be delivered and will be adjusted accordingly in the invoice; all rights in this regards are reserved with eShop. Images of Fruits & Vegetables present in the website are for demonstration purpose and may not resemble exactly in size, colour, weight, contrast etc; though we assure our best to maintain the best quality in product, which is being our foremost commitment to the customer.</p><p>All orders placed before 11 PM in the Night will be delivered next day or as per delivery date chosen.</p>'),(25,'doctor_brown','{\"code_bravo\":\"9b384b07-9076-494a-b3a3-f362ef4d155a\",\"time_check\":\"aa7b7bfd3f7f16976d79c775377781e0b15e47e13cbb96ecde2d656b5f062f7a\",\"code_adam\":\"mjain4078\",\"dr_firestone\":34108271}'),(26,'shipping_method','{\"shiprocket_shipping_method\":\"0\",\"email\":\"\",\"password\":\"\",\"webhook_token\":\"\",\"local_shipping_method\":\"1\",\"standard_shipping_free_delivery\":\"1\",\"minimum_free_delivery_order_amount\":\"500\"}');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT 0,
  `link` varchar(512) NOT NULL DEFAULT 'NULL',
  `image` varchar(256) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_notification`
--

DROP TABLE IF EXISTS `system_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) DEFAULT NULL,
  `message` varchar(20) DEFAULT NULL,
  `type` varchar(256) DEFAULT NULL,
  `type_id` int(11) DEFAULT 0,
  `read_by` tinyint(4) NOT NULL DEFAULT 0,
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notification`
--

LOCK TABLES `system_notification` WRITE;
/*!40000 ALTER TABLE `system_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxes`
--

DROP TABLE IF EXISTS `taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` mediumtext DEFAULT NULL,
  `percentage` mediumtext NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxes`
--

LOCK TABLES `taxes` WRITE;
/*!40000 ALTER TABLE `taxes` DISABLE KEYS */;
INSERT INTO `taxes` VALUES (1,'COD','20',2),(3,'GST','20',1),(4,'CGST','20',1);
/*!40000 ALTER TABLE `taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `slug` varchar(32) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
INSERT INTO `themes` VALUES (1,'Classic','classic','classic.jpg',1,0,'2021-02-11 05:18:42'),(2,'Modern','modern','modern.png',1,1,'2023-07-18 05:18:42');
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_messages`
--

DROP TABLE IF EXISTS `ticket_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_messages`
--

LOCK TABLES `ticket_messages` WRITE;
/*!40000 ALTER TABLE `ticket_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_types`
--

DROP TABLE IF EXISTS `ticket_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_types`
--

LOCK TABLES `ticket_types` WRITE;
/*!40000 ALTER TABLE `ticket_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slots`
--

DROP TABLE IF EXISTS `time_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_slots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  `last_order_time` time NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slots`
--

LOCK TABLES `time_slots` WRITE;
/*!40000 ALTER TABLE `time_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_type` varchar(16) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` varchar(128) DEFAULT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `txn_id` varchar(256) DEFAULT NULL,
  `payu_txn_id` varchar(512) DEFAULT NULL,
  `amount` double NOT NULL,
  `status` varchar(12) DEFAULT NULL,
  `currency_code` varchar(5) DEFAULT NULL,
  `payer_email` varchar(64) DEFAULT NULL,
  `message` varchar(128) NOT NULL,
  `transaction_date` timestamp NULL DEFAULT current_timestamp(),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_refund` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `updates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates`
--

LOCK TABLES `updates` WRITE;
/*!40000 ALTER TABLE `updates` DISABLE KEYS */;
INSERT INTO `updates` VALUES (1,'1.0'),(2,'1.0.1'),(3,'1.0.2'),(4,'1.0.3'),(5,'2.0.0'),(7,'2.0.1'),(14,'2.0.2'),(15,'2.0.3'),(16,'2.0.4'),(17,'2.0.5'),(18,'2.0.6'),(19,'2.0.7'),(20,'2.0.8'),(21,'2.0.9'),(24,'2.1.0'),(25,'2.2.0'),(26,'2.3.0'),(28,'2.4.0'),(29,'2.5.0'),(31,'2.6.0'),(32,'2.6.1'),(33,'2.6.2'),(37,'2.7.0');
/*!40000 ALTER TABLE `updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_fcm`
--

DROP TABLE IF EXISTS `user_fcm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_fcm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fcm_id` varchar(1024) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_fcm`
--

LOCK TABLES `user_fcm` WRITE;
/*!40000 ALTER TABLE `user_fcm` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_fcm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `permissions` mediumtext DEFAULT NULL,
  `created_by` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permissions`
--

LOCK TABLES `user_permissions` WRITE;
/*!40000 ALTER TABLE `user_permissions` DISABLE KEYS */;
INSERT INTO `user_permissions` VALUES (1,1,0,NULL,'2021-05-06 04:24:52');
/*!40000 ALTER TABLE `user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `balance` double DEFAULT 0,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `bonus_type` varchar(30) DEFAULT 'percentage_per_order',
  `bonus` int(11) DEFAULT NULL,
  `cash_received` double(15,2) NOT NULL DEFAULT 0.00,
  `dob` varchar(16) DEFAULT NULL,
  `country_code` int(11) DEFAULT NULL,
  `city` text DEFAULT NULL,
  `area` text DEFAULT NULL,
  `street` text DEFAULT NULL,
  `pincode` varchar(32) DEFAULT NULL,
  `serviceable_zipcodes` varchar(256) DEFAULT NULL,
  `apikey` varchar(32) DEFAULT NULL,
  `referral_code` varchar(32) DEFAULT NULL,
  `friends_code` varchar(28) DEFAULT NULL,
  `fcm_id` text DEFAULT NULL,
  `latitude` varchar(64) DEFAULT NULL,
  `longitude` varchar(64) DEFAULT NULL,
  `type` varchar(1024) NOT NULL DEFAULT 'phone',
  `driving_license` varchar(1024) DEFAULT 'NULL',
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `cod_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'41.176.193.214','Admin','$2y$12$dJ97BExmxI/ZKIH.cxPNn.oQ33vyPV18opLVfC8NyCPYt2ar0YHNC','bhimrajparihar0@gmail.com','8655552214',NULL,21610473638.449993,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1268889823,1702924208,1,'ADMIN',NULL,'percentage_per_order',NULL,0.00,NULL,91,'57','157',NULL,NULL,NULL,NULL,'vXaEvNuR',NULL,'fFQa3MftQ6uliFS6T1IdGk:APA91bGNY-dntY4Yu0zTtjS9hB1ncLHnVmyDnnF4QCvRx3BOT57TfKAIIg036aBQ2tNt3SKFyLVGamBviZu0TjDluRdojAVJMdH40BwL3Hrpr6YNkYwQGYzwmKfpf42Ktp0AyITmT7R5',NULL,NULL,'phone','NULL',0,'2020-06-30 10:20:08',NULL),(2,'::1','dikshita','$2y$10$JkeDBNNmpfx7aD9UET/pZe6mfqlN2daHNJ5m.jcfaUkQvpZmYYl3e','dikshita@gmail.com','222222222',NULL,0,'9bab4eda6f47dce6ddcd','$2y$10$53cUBe9kLAVrpyS.A8Mz/OP6eeXc/u5uQUdbV6TP0MU/aS03Yv8c.',NULL,NULL,NULL,NULL,NULL,1649049092,NULL,1,NULL,'237 time square','percentage_per_order',NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','phone','NULL',0,'2022-04-04 05:11:32',NULL),(3,'34.345.654.345','Bhimraj','$2y$12$dJ97BExmxI/ZKIH.cxPNn.oQ33vyPV18opLVfC8NyCPYt2ar0YHNC','bhimraj@yopmail.com','6764576574',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1268889887,NULL,1,NULL,NULL,'percentage_per_order',NULL,0.00,NULL,91,'57','157',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'phone','NULL',0,'2023-04-04 05:11:32',2),(4,'::1','Bhimraj','$2y$10$FE9LOjM16Ze0oF/DnRbLpem1vAaFz848CyLDYvUnO1KLnEYidqP0i','raj@yopmail.com','656456456',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1699209373,1699209488,1,NULL,'yyy','percentage_per_order',NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','phone','NULL',0,'2023-11-05 18:36:13',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (1,1,1),(2,2,4),(3,3,2),(4,4,4);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_transactions`
--

DROP TABLE IF EXISTS `wallet_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(8) NOT NULL COMMENT 'credit | debit',
  `amount` double NOT NULL,
  `message` varchar(512) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_transactions`
--

LOCK TABLES `wallet_transactions` WRITE;
/*!40000 ALTER TABLE `wallet_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zipcodes`
--

DROP TABLE IF EXISTS `zipcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zipcodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zipcode` varchar(512) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `minimum_free_delivery_order_amount` double NOT NULL DEFAULT 0,
  `delivery_charges` double DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zipcodes`
--

LOCK TABLES `zipcodes` WRITE;
/*!40000 ALTER TABLE `zipcodes` DISABLE KEYS */;
INSERT INTO `zipcodes` VALUES (1,'400606',1,10,10,'2023-11-05 18:22:37');
/*!40000 ALTER TABLE `zipcodes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-19  0:23:47
