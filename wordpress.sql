-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: wordpress
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
-- Table structure for table `wp_actionscheduler_actions`
--

DROP TABLE IF EXISTS `wp_actionscheduler_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_actions` (
  `action_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `scheduled_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `args` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schedule` longtext COLLATE utf8mb4_unicode_520_ci,
  `group_id` bigint unsigned NOT NULL DEFAULT '0',
  `attempts` int NOT NULL DEFAULT '0',
  `last_attempt_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint unsigned NOT NULL DEFAULT '0',
  `extended_args` varchar(8000) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `hook` (`hook`),
  KEY `status` (`status`),
  KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  KEY `args` (`args`),
  KEY `group_id` (`group_id`),
  KEY `last_attempt_gmt` (`last_attempt_gmt`),
  KEY `claim_id` (`claim_id`),
  KEY `claim_id_status_scheduled_date_gmt` (`claim_id`,`status`,`scheduled_date_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_actions`
--

LOCK TABLES `wp_actionscheduler_actions` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_actions` DISABLE KEYS */;
INSERT INTO `wp_actionscheduler_actions` VALUES (8,'action_scheduler/migration_hook','complete','2021-09-02 17:46:48','2021-09-02 17:46:48','[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1630604808;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1630604808;}',1,1,'2021-09-02 17:46:49','2021-09-02 17:46:49',0,NULL),(9,'action_scheduler/migration_hook','complete','2021-09-02 17:47:49','2021-09-02 17:47:49','[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1630604869;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1630604869;}',1,1,'2021-09-02 17:47:53','2021-09-02 17:47:53',0,NULL);
/*!40000 ALTER TABLE `wp_actionscheduler_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_actionscheduler_claims`
--

DROP TABLE IF EXISTS `wp_actionscheduler_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_claims` (
  `claim_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`claim_id`),
  KEY `date_created_gmt` (`date_created_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_claims`
--

LOCK TABLES `wp_actionscheduler_claims` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_claims` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_actionscheduler_claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_actionscheduler_groups`
--

DROP TABLE IF EXISTS `wp_actionscheduler_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_groups` (
  `group_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `slug` (`slug`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_groups`
--

LOCK TABLES `wp_actionscheduler_groups` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_groups` DISABLE KEYS */;
INSERT INTO `wp_actionscheduler_groups` VALUES (1,'action-scheduler-migration');
/*!40000 ALTER TABLE `wp_actionscheduler_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_actionscheduler_logs`
--

DROP TABLE IF EXISTS `wp_actionscheduler_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_logs` (
  `log_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action_id` bigint unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `log_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`),
  KEY `action_id` (`action_id`),
  KEY `log_date_gmt` (`log_date_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_logs`
--

LOCK TABLES `wp_actionscheduler_logs` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_logs` DISABLE KEYS */;
INSERT INTO `wp_actionscheduler_logs` VALUES (1,8,'acción creada','2021-09-02 17:45:48','2021-09-02 17:45:48'),(2,8,'acción empezada vía Async Request','2021-09-02 17:46:49','2021-09-02 17:46:49'),(3,8,'acción completa vía Async Request','2021-09-02 17:46:49','2021-09-02 17:46:49'),(4,9,'acción creada','2021-09-02 17:46:49','2021-09-02 17:46:49'),(5,9,'acción empezada vía WP Cron','2021-09-02 17:47:53','2021-09-02 17:47:53'),(6,9,'acción completa vía WP Cron','2021-09-02 17:47:53','2021-09-02 17:47:53');
/*!40000 ALTER TABLE `wp_actionscheduler_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint unsigned NOT NULL DEFAULT '0',
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10)),
  KEY `woo_idx_comment_type` (`comment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES (1,1,'Un comentarista de WordPress','wapuu@wordpress.example','https://wordpress.org/','','2021-09-02 17:32:46','2021-09-02 17:32:46','Hola, esto es un comentario.\nPara empezar a moderar, editar y borrar comentarios, por favor, visita la pantalla de comentarios en el escritorio.\nLos avatares de los comentaristas provienen de <a href=\"https://gravatar.com\">Gravatar</a>.',0,'1','','comment',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_links` (
  `link_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint unsigned NOT NULL DEFAULT '1',
  `link_rating` int NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_options` (
  `option_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=430 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (344,'_transient_wc_onboarding_themes','a:36:{s:8:\"miyazaki\";a:6:{s:4:\"slug\";s:8:\"miyazaki\";s:5:\"title\";s:8:\"Miyazaki\";s:5:\"price\";s:4:\"0.00\";s:12:\"is_installed\";b:1;s:5:\"image\";s:68:\"http://localhost/wordpress/wp-content/themes/miyazaki/screenshot.jpg\";s:23:\"has_woocommerce_support\";b:1;}s:10:\"storefront\";a:11:{s:5:\"title\";s:10:\"Storefront\";s:5:\"image\";s:77:\"https://woocommerce.com/wp-content/themes/woo/images/storefront/feature-1.jpg\";s:7:\"excerpt\";s:161:\"Storefront is an intuitive &amp; flexible, free theme offering deep integration with WooCommerce.\r\n\r\nIt\'s the perfect platform for your next WooCommerce project.\";s:4:\"link\";s:113:\"https://woocommerce.com/products/storefront/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:42:\"https://themes.woocommerce.com/storefront/\";s:5:\"price\";s:9:\"&#36;0.00\";s:4:\"hash\";s:32:\"5714dad8f8d0b930bd6cc9c99657b930\";s:4:\"slug\";s:10:\"storefront\";s:2:\"id\";i:565154;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:16:\"organic-goodness\";a:11:{s:5:\"title\";s:16:\"Organic Goodness\";s:5:\"image\";s:99:\"https://woocommerce.com/wp-content/uploads/2021/08/organic-goodness-cosmetics-woocommerce-theme.jpg\";s:7:\"excerpt\";s:92:\"Organic Goodness is a block theme with natural elements perfect for health and beauty stores\";s:4:\"link\";s:119:\"https://woocommerce.com/products/organic-goodness/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:43:\"https://organicgoodness.thunder-stores.com/\";s:5:\"price\";s:10:\"&#36;79.00\";s:4:\"hash\";s:36:\"705fea70-54f7-4b0b-a0f5-b87c32fc1a17\";s:4:\"slug\";s:16:\"organic-goodness\";s:2:\"id\";i:8485741;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:7:\"maudern\";a:11:{s:5:\"title\";s:7:\"Maudern\";s:5:\"image\";s:115:\"https://woocommerce.com/wp-content/uploads/woocommerce_uploads/2021/08/Maudern-Minimal-WooCommerce-Theme-wk3eph.jpg\";s:7:\"excerpt\";s:113:\"A contemporary block-based theme that helps you effortlessly design a minimalistic online store with WooCommerce.\";s:4:\"link\";s:110:\"https://woocommerce.com/products/maudern/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:35:\"https://maudern.thunder-stores.com/\";s:5:\"price\";s:10:\"&#36;79.00\";s:4:\"hash\";s:36:\"e5afb6cf-4a53-4aed-9b05-280d3df3afc1\";s:4:\"slug\";s:7:\"maudern\";s:2:\"id\";i:8424179;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:5:\"olymp\";a:11:{s:5:\"title\";s:5:\"Olymp\";s:5:\"image\";s:71:\"https://woocommerce.com/wp-content/uploads/2021/05/screenshot-olymp.png\";s:7:\"excerpt\";s:135:\"Olymp is a WooCommerce and Gutenberg WordPress theme. Fully responsive and beautifully designed will get you up and running in no time.\";s:4:\"link\";s:108:\"https://woocommerce.com/products/olymp/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:41:\"https://demo.vivathemes.com/themes/olymp/\";s:5:\"price\";s:10:\"&#36;79.00\";s:4:\"hash\";s:36:\"5f900199-70e6-4c0a-b533-293f0c4ba707\";s:4:\"slug\";s:5:\"olymp\";s:2:\"id\";i:8384551;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:9:\"miniature\";a:11:{s:5:\"title\";s:9:\"Miniature\";s:5:\"image\";s:74:\"https://woocommerce.com/wp-content/uploads/2021/07/featured_miniature2.jpg\";s:7:\"excerpt\";s:185:\"Miniature is a playful WordPress theme designed for stores selling children’s products. Fun and lively, Miniature will definitely add an extra touch of character to your online store.\";s:4:\"link\";s:112:\"https://woocommerce.com/products/miniature/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:49:\"https://www.cssigniter.com/woocommerce/miniature/\";s:5:\"price\";s:10:\"&#36;79.00\";s:4:\"hash\";s:36:\"28b97cd1-5b52-415c-8c9a-7f697e013a87\";s:4:\"slug\";s:9:\"miniature\";s:2:\"id\";i:8292607;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:5:\"frame\";a:11:{s:5:\"title\";s:5:\"Frame\";s:5:\"image\";s:60:\"https://woocommerce.com/wp-content/uploads/2021/06/frame.jpg\";s:7:\"excerpt\";s:114:\"Frame is a Gutenberg Powered WooCommerce theme suitable for stores with a large number of products and categories.\";s:4:\"link\";s:108:\"https://woocommerce.com/products/frame/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:29:\"https://frame.fuelthemes.net/\";s:5:\"price\";s:10:\"&#36;79.00\";s:4:\"hash\";s:36:\"1b480c21-8122-478e-a728-68e235b0b9cf\";s:4:\"slug\";s:5:\"frame\";s:2:\"id\";i:8152078;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:10:\"smart-home\";a:11:{s:5:\"title\";s:10:\"Smart Home\";s:5:\"image\";s:62:\"https://woocommerce.com/wp-content/uploads/2021/04/browser.jpg\";s:7:\"excerpt\";s:131:\"Smart Home is a beautiful Gutenberg-powered theme with a technology-style look suitable for all stores selling smart home products.\";s:4:\"link\";s:113:\"https://woocommerce.com/products/smart-home/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:33:\"https://smarthome.fuelthemes.net/\";s:5:\"price\";s:10:\"&#36;79.00\";s:4:\"hash\";s:36:\"d1d581ad-3efa-40c2-b7e0-bb6722779a0b\";s:4:\"slug\";s:10:\"smart-home\";s:2:\"id\";i:7916465;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:6:\"skinny\";a:11:{s:5:\"title\";s:6:\"Skinny\";s:5:\"image\";s:71:\"https://woocommerce.com/wp-content/uploads/2021/04/SKfeatured.png?w=800\";s:7:\"excerpt\";s:123:\"Create a beautiful online shop with Skinny, and optionally allow your site visitors to switch between light and dark skins.\";s:4:\"link\";s:109:\"https://woocommerce.com/products/skinny/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:32:\"https://demo.codestag.com/skinny\";s:5:\"price\";s:10:\"&#36;69.00\";s:4:\"hash\";s:36:\"a21bf5b9-3c45-4d6c-bf24-74ddae21023f\";s:4:\"slug\";s:6:\"skinny\";s:2:\"id\";i:7753168;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:12:\"pure-fashion\";a:11:{s:5:\"title\";s:12:\"Pure Fashion\";s:5:\"image\";s:62:\"https://woocommerce.com/wp-content/uploads/2021/03/browser.jpg\";s:7:\"excerpt\";s:88:\"Beautiful WooCommerce theme with soft colors and a unique layout using Gutenberg editor.\";s:4:\"link\";s:115:\"https://woocommerce.com/products/pure-fashion/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:35:\"https://purefashion.fuelthemes.net/\";s:5:\"price\";s:10:\"&#36;79.00\";s:4:\"hash\";s:36:\"9d7ed165-8435-4b0f-8315-8e4a5868f0b0\";s:4:\"slug\";s:12:\"pure-fashion\";s:2:\"id\";i:7704815;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:8:\"overline\";a:11:{s:5:\"title\";s:8:\"Overline\";s:5:\"image\";s:63:\"https://woocommerce.com/wp-content/uploads/2020/11/overline.jpg\";s:7:\"excerpt\";s:171:\"Overline is designed for the new generation of beauty brands and influencers opening their own e-commerce shops. Custom Gutenberg elements allow for increased flexibility.\";s:4:\"link\";s:111:\"https://woocommerce.com/products/overline/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:32:\"https://overline.fuelthemes.net/\";s:5:\"price\";s:10:\"&#36;79.00\";s:4:\"hash\";s:36:\"6eab91f2-ca09-4f7e-9022-df55fd8540a9\";s:4:\"slug\";s:8:\"overline\";s:2:\"id\";i:7320744;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:6:\"agency\";a:11:{s:5:\"title\";s:6:\"Agency\";s:5:\"image\";s:70:\"https://woocommerce.com/wp-content/uploads/2020/10/agency-featured.jpg\";s:7:\"excerpt\";s:134:\"Agency is a Gutenberg and WooCommerce optimized WordPress theme for marketing, advertising, and creative agencies. Sell your services!\";s:4:\"link\";s:109:\"https://woocommerce.com/products/agency/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:38:\"https://organicthemes.com/demo/agency/\";s:5:\"price\";s:10:\"&#36;79.00\";s:4:\"hash\";s:36:\"4a3a3a22-a5f0-4fa4-8c09-4f37575602ef\";s:4:\"slug\";s:6:\"agency\";s:2:\"id\";i:6674855;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:6:\"rhodes\";a:11:{s:5:\"title\";s:6:\"Rhodes\";s:5:\"image\";s:66:\"https://woocommerce.com/wp-content/uploads/2020/09/rhodes-home.jpg\";s:7:\"excerpt\";s:193:\"The perfect WooCommerce theme for retailers. Whether you\'re selling high-street fashion, beauty products, or home accessories, Rhodes will just stand out of the way letting your products shine.\";s:4:\"link\";s:109:\"https://woocommerce.com/products/rhodes/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:34:\"https://www.cssigniter.com/rhodes/\";s:5:\"price\";s:10:\"&#36;79.00\";s:4:\"hash\";s:36:\"b95c0103-23b9-43f3-af49-ee7eaa35e49b\";s:4:\"slug\";s:6:\"rhodes\";s:2:\"id\";i:6509339;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:11:\"restoration\";a:11:{s:5:\"title\";s:11:\"Restoration\";s:5:\"image\";s:78:\"https://woocommerce.com/wp-content/uploads/2020/09/restoration-woocommerce.jpg\";s:7:\"excerpt\";s:90:\"An elegant and sophisticated mobile-first, Gutenberg-powered theme for WooCommerce stores.\";s:4:\"link\";s:114:\"https://woocommerce.com/products/restoration/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:35:\"https://restoration.fuelthemes.net/\";s:5:\"price\";s:10:\"&#36;79.00\";s:4:\"hash\";s:36:\"e793e6af-f338-4e92-b268-e0576ddb137b\";s:4:\"slug\";s:11:\"restoration\";s:2:\"id\";i:6454820;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:7:\"matthew\";a:11:{s:5:\"title\";s:7:\"Matthew\";s:5:\"image\";s:73:\"https://woocommerce.com/wp-content/uploads/2020/07/matthew-screenshot.jpg\";s:7:\"excerpt\";s:145:\"Matthew is a Gutenberg-powered WooCommerce theme designed for building a professional online store so that you can sell goods or services online.\";s:4:\"link\";s:110:\"https://woocommerce.com/products/matthew/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:38:\"https://demo.themesharbor.com/matthew/\";s:5:\"price\";s:11:\"&#36;129.00\";s:4:\"hash\";s:36:\"b3983408-c4f6-4751-8bd7-ae65ae34cf3b\";s:4:\"slug\";s:7:\"matthew\";s:2:\"id\";i:6214538;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:11:\"fifthavenue\";a:11:{s:5:\"title\";s:12:\"Fifth Avenue\";s:5:\"image\";s:78:\"https://woocommerce.com/wp-content/uploads/2020/06/fifthavenue-woocommerce.jpg\";s:7:\"excerpt\";s:103:\"Beautiful Gutenberg powered WooCommerce theme designed to be easily customized for all types of stores.\";s:4:\"link\";s:115:\"https://woocommerce.com/products/fifth-avenue/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:35:\"https://fifthavenue.fuelthemes.net/\";s:5:\"price\";s:10:\"&#36;79.00\";s:4:\"hash\";s:36:\"9e093a9f-3d49-4fcd-bec7-c87b097d9df8\";s:4:\"slug\";s:11:\"fifthavenue\";s:2:\"id\";i:5989481;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:7:\"artisan\";a:11:{s:5:\"title\";s:7:\"Artisan\";s:5:\"image\";s:71:\"https://woocommerce.com/wp-content/uploads/2020/03/artisan-featured.jpg\";s:7:\"excerpt\";s:79:\"Sell your hand-crafted products online using the Artisan Theme for WooCommerce.\";s:4:\"link\";s:110:\"https://woocommerce.com/products/artisan/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:39:\"https://organicthemes.com/demo/artisan/\";s:5:\"price\";s:10:\"&#36;79.00\";s:4:\"hash\";s:36:\"64529812-81f6-4efd-9686-ecb34e527421\";s:4:\"slug\";s:7:\"artisan\";s:2:\"id\";i:5576887;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:7:\"threads\";a:11:{s:5:\"title\";s:7:\"Threads\";s:5:\"image\";s:75:\"https://woocommerce.com/wp-content/uploads/2019/08/threads-home-cropped.jpg\";s:7:\"excerpt\";s:79:\"Create a stunning website for your apparel brand using Threads for WooCommerce.\";s:4:\"link\";s:110:\"https://woocommerce.com/products/threads/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:39:\"https://organicthemes.com/demo/threads/\";s:5:\"price\";s:10:\"&#36;79.00\";s:4:\"hash\";s:36:\"7ca579a6-6aaf-498c-9ee7-e15280ace9e9\";s:4:\"slug\";s:7:\"threads\";s:2:\"id\";i:4663191;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:10:\"block-shop\";a:11:{s:5:\"title\";s:10:\"Block Shop\";s:5:\"image\";s:79:\"https://woocommerce.com/wp-content/uploads/2019/08/block-shop-theme-preview.jpg\";s:7:\"excerpt\";s:76:\"A hassle-free block-based theme for your next WooCommerce project.\r\n\r\n&nbsp;\";s:4:\"link\";s:113:\"https://woocommerce.com/products/block-shop/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:34:\"https://blockshop.wp-theme.design/\";s:5:\"price\";s:10:\"&#36;59.00\";s:4:\"hash\";s:36:\"21fa433c-6c31-4be7-83ab-8d2cc8986130\";s:4:\"slug\";s:10:\"block-shop\";s:2:\"id\";i:4660093;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:6:\"bistro\";a:11:{s:5:\"title\";s:6:\"Bistro\";s:5:\"image\";s:61:\"https://woocommerce.com/wp-content/uploads/2016/07/bistro.png\";s:7:\"excerpt\";s:174:\"Bistro is a Storefront child theme designed for stores selling organic goods and other consumables. It features a friendly and warm design that lends itself to this industry.\";s:4:\"link\";s:109:\"https://woocommerce.com/products/bistro/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:37:\"https://themes.woocommerce.com/bistro\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"58e753f91fddf40abe8ebe4486f8c378\";s:4:\"slug\";s:6:\"bistro\";s:2:\"id\";i:1822936;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:10:\"stationery\";a:11:{s:5:\"title\";s:10:\"Stationery\";s:5:\"image\";s:65:\"https://woocommerce.com/wp-content/uploads/2016/04/stationery.jpg\";s:7:\"excerpt\";s:186:\"Stationery is a Storefront child theme designed for stores selling office supplies and/or arts &amp; crafts. The design has subtle tactile decorations while also being clean and elegant.\";s:4:\"link\";s:113:\"https://woocommerce.com/products/stationery/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:42:\"https://themes.woocommerce.com/stationery/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"b939225b8b8ccdc7b14ffb6d7eab2ac2\";s:4:\"slug\";s:10:\"stationery\";s:2:\"id\";i:1629126;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:7:\"petshop\";a:11:{s:5:\"title\";s:7:\"Petshop\";s:5:\"image\";s:62:\"https://woocommerce.com/wp-content/uploads/2016/03/petshop.png\";s:7:\"excerpt\";s:181:\"Petshop is a Storefront child theme designed for stores selling products in the pet industry. The design is organic and friendly, featuring many details that point to pet ownership.\";s:4:\"link\";s:110:\"https://woocommerce.com/products/petshop/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:39:\"https://themes.woocommerce.com/petshop/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"8060743c9031974326850f539aba5196\";s:4:\"slug\";s:7:\"petshop\";s:2:\"id\";i:1587689;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:5:\"hotel\";a:11:{s:5:\"title\";s:5:\"Hotel\";s:5:\"image\";s:69:\"https://woocommerce.com/wp-content/uploads/2016/03/hotel-featured.jpg\";s:7:\"excerpt\";s:246:\"Hotel is designed for businesses selling time, services and accommodation, offering unique integration with WooCommerce Bookings and Accommodation Bookings. The design is bold yet simple, allowing your content and imagery to do all the talking.\";s:4:\"link\";s:108:\"https://woocommerce.com/products/hotel/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:37:\"https://themes.woocommerce.com/hotel/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"0b0df891aa46f289f4e49bae2389bb04\";s:4:\"slug\";s:5:\"hotel\";s:2:\"id\";i:1554532;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:8:\"bookshop\";a:11:{s:5:\"title\";s:8:\"Bookshop\";s:5:\"image\";s:63:\"https://woocommerce.com/wp-content/uploads/2016/02/featured.png\";s:7:\"excerpt\";s:183:\"Bookshop comes with a unique homepage layout that prominently displays product categories and a variety of products in an arrangement that is popular with bookstores and collectibles.\";s:4:\"link\";s:111:\"https://woocommerce.com/products/bookshop/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:40:\"https://themes.woocommerce.com/bookshop/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"9fe861227e3e82fde8fe5d7e8cc3340e\";s:4:\"slug\";s:8:\"bookshop\";s:2:\"id\";i:1508713;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:6:\"arcade\";a:11:{s:5:\"title\";s:6:\"Arcade\";s:5:\"image\";s:61:\"https://woocommerce.com/wp-content/uploads/2016/01/arcade.png\";s:7:\"excerpt\";s:216:\"Upgrade your video game shops look and feel with Arcade. It\'s bold and modern design will engage visitors and the unique homepage layout will present them with a variety of products as soon as they hit your homepage.\";s:4:\"link\";s:109:\"https://woocommerce.com/products/arcade/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:38:\"https://themes.woocommerce.com/arcade/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"5af09d4e590eec977c6b9519b517f479\";s:4:\"slug\";s:6:\"arcade\";s:2:\"id\";i:1418260;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:9:\"homestore\";a:11:{s:5:\"title\";s:9:\"Homestore\";s:5:\"image\";s:64:\"https://woocommerce.com/wp-content/uploads/2015/12/homestore.jpg\";s:7:\"excerpt\";s:166:\"Give your Department Store a classic look with Homestore. Its clean and efficient design will work well whether you\'re a boutique independent or a high street giant.\";s:4:\"link\";s:112:\"https://woocommerce.com/products/homestore/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:41:\"https://themes.woocommerce.com/homestore/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"d79fe7a1beba26523aafa6ce6d3e1e85\";s:4:\"slug\";s:9:\"homestore\";s:2:\"id\";i:1365559;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:8:\"pharmacy\";a:11:{s:5:\"title\";s:8:\"Pharmacy\";s:5:\"image\";s:63:\"https://woocommerce.com/wp-content/uploads/2015/12/pharmacy.jpg\";s:7:\"excerpt\";s:235:\"Give your health store a professional, trust-worthy design with the Pharmacy Storefront Child Theme. Built upon our rock solid Storefront Parent theme you\'ll also enjoy reliable integration with current and future WooCommerce releases.\";s:4:\"link\";s:111:\"https://woocommerce.com/products/pharmacy/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:40:\"https://themes.woocommerce.com/pharmacy/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"ebeff3c0f89cd3169fb6b3e7e137e513\";s:4:\"slug\";s:8:\"pharmacy\";s:2:\"id\";i:1365557;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:7:\"toyshop\";a:11:{s:5:\"title\";s:7:\"ToyShop\";s:5:\"image\";s:62:\"https://woocommerce.com/wp-content/uploads/2015/09/toyshop.jpg\";s:7:\"excerpt\";s:269:\"Add some fun to your store with ToyShop. The engaging and colorful design of ToyShop makes it a perfect child theme or any store that sells exciting products that are aimed at customers that like to have fun. The outdoorsy style would even be perfect for a flower shop.\";s:4:\"link\";s:110:\"https://woocommerce.com/products/toyshop/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:39:\"https://themes.woocommerce.com/toyshop/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"3e2520021b41ee49a55b93362aaced98\";s:4:\"slug\";s:7:\"toyshop\";s:2:\"id\";i:1230716;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:6:\"outlet\";a:11:{s:5:\"title\";s:6:\"Outlet\";s:5:\"image\";s:61:\"https://woocommerce.com/wp-content/uploads/2015/09/outlet.jpg\";s:7:\"excerpt\";s:221:\"Overclock your tech store with Outlet! Whether you sell boutique iPad jewellery or the nuts and bolts of hardware itself, Outlet will give your shop a stylish look and feel while enjoying the stability of Storefront core.\";s:4:\"link\";s:109:\"https://woocommerce.com/products/outlet/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:38:\"https://themes.woocommerce.com/outlet/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"4c311cb3a3131570946b8799715a0991\";s:4:\"slug\";s:6:\"outlet\";s:2:\"id\";i:1212805;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:7:\"proshop\";a:11:{s:5:\"title\";s:7:\"ProShop\";s:5:\"image\";s:62:\"https://woocommerce.com/wp-content/uploads/2015/06/proshop.jpg\";s:7:\"excerpt\";s:176:\"Unlock the true potential of your sports clothing and equipment store with ProShop! It\'s metropolitan design provides an active aesthetic giving your store oodles of character.\";s:4:\"link\";s:110:\"https://woocommerce.com/products/proshop/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:39:\"https://themes.woocommerce.com/proshop/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"1d51b8633bbd1782dc17fce15f8bd2af\";s:4:\"slug\";s:7:\"proshop\";s:2:\"id\";i:1000757;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:8:\"galleria\";a:11:{s:5:\"title\";s:8:\"Galleria\";s:5:\"image\";s:68:\"https://woocommerce.com/wp-content/uploads/2015/05/galleria-hero.png\";s:7:\"excerpt\";s:162:\"Galleria is a Storefront child theme perfect for fashion and design stores. Stylish and minimalist, it gives sites a classy look and keeps products center stage.\";s:4:\"link\";s:111:\"https://woocommerce.com/products/galleria/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:40:\"https://themes.woocommerce.com/galleria/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"2429c1dde521031cd053886b15844bbf\";s:4:\"slug\";s:8:\"galleria\";s:2:\"id\";i:887931;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:4:\"deli\";a:11:{s:5:\"title\";s:4:\"Deli\";s:5:\"image\";s:59:\"https://woocommerce.com/wp-content/uploads/2015/03/deli.jpg\";s:7:\"excerpt\";s:135:\"Deli is a Storefront child theme featuring a texturised, earthy design, perfect for stores selling natural, organic or hand made goods.\";s:4:\"link\";s:107:\"https://woocommerce.com/products/deli/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:36:\"https://themes.woocommerce.com/deli/\";s:5:\"price\";s:9:\"&#36;0.00\";s:4:\"hash\";s:32:\"83c6db94c8ebf9da56b59fb97f724e88\";s:4:\"slug\";s:4:\"deli\";s:2:\"id\";i:784823;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:8:\"boutique\";a:11:{s:5:\"title\";s:8:\"Boutique\";s:5:\"image\";s:63:\"https://woocommerce.com/wp-content/uploads/2015/01/boutique.png\";s:7:\"excerpt\";s:168:\"Boutique is a simple, traditionally designed Storefront child theme, ideal for small stores or boutiques. Add your logo, create a unique color scheme and start selling!\";s:4:\"link\";s:111:\"https://woocommerce.com/products/boutique/?utm_source=extensionsscreen&utm_medium=product&utm_campaign=wcaddons\";s:8:\"demo_url\";s:40:\"https://themes.woocommerce.com/boutique/\";s:5:\"price\";s:9:\"&#36;0.00\";s:4:\"hash\";s:32:\"71815288e266d58031727d48d6deee25\";s:4:\"slug\";s:8:\"boutique\";s:2:\"id\";i:605777;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:14:\"twentynineteen\";a:6:{s:4:\"slug\";s:14:\"twentynineteen\";s:5:\"title\";s:15:\"Twenty Nineteen\";s:5:\"price\";s:4:\"0.00\";s:12:\"is_installed\";b:1;s:5:\"image\";s:74:\"http://localhost/wordpress/wp-content/themes/twentynineteen/screenshot.png\";s:23:\"has_woocommerce_support\";b:1;}s:12:\"twentytwenty\";a:6:{s:4:\"slug\";s:12:\"twentytwenty\";s:5:\"title\";s:13:\"Twenty Twenty\";s:5:\"price\";s:4:\"0.00\";s:12:\"is_installed\";b:1;s:5:\"image\";s:72:\"http://localhost/wordpress/wp-content/themes/twentytwenty/screenshot.png\";s:23:\"has_woocommerce_support\";b:1;}s:15:\"twentytwentyone\";a:6:{s:4:\"slug\";s:15:\"twentytwentyone\";s:5:\"title\";s:17:\"Twenty Twenty-One\";s:5:\"price\";s:4:\"0.00\";s:12:\"is_installed\";b:1;s:5:\"image\";s:75:\"http://localhost/wordpress/wp-content/themes/twentytwentyone/screenshot.png\";s:23:\"has_woocommerce_support\";b:1;}}','no'),(351,'action_scheduler_migration_status','complete','yes');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (1,2,'_wp_page_template','default'),(2,3,'_wp_page_template','default'),(3,5,'_edit_lock','1630614641:1'),(4,7,'_wp_attached_file','woocommerce-placeholder.png'),(5,7,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:1200;s:6:\"height\";i:1200;s:4:\"file\";s:27:\"woocommerce-placeholder.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_posts` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (1,1,'2021-09-02 17:32:46','2021-09-02 17:32:46','<!-- wp:paragraph -->\n<p>Bienvenido a WordPress. Esta es tu primera entrada. Edítala o bórrala, ¡luego empieza a escribir!</p>\n<!-- /wp:paragraph -->','¡Hola mundo!','','publish','open','open','','hola-mundo','','','2021-09-02 17:32:46','2021-09-02 17:32:46','',0,'http://localhost/wordpress/?p=1',0,'post','',1),(2,1,'2021-09-02 17:32:46','2021-09-02 17:32:46','<!-- wp:paragraph -->\n<p>Esta es una página de ejemplo. Es diferente a una entrada del blog porque permanecerá en un solo lugar y aparecerá en la navegación de su sitio (en la mayoría de los temas). La mayoría de las personas comienzan con una página \"Acerca de\" que les presenta a los visitantes potenciales del sitio. Podría decir algo así:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>¡Bienvenido! Soy camarero de día, aspirante a actor de noche y esta es mi web. Vivo en Morelia, tengo un perro que se llama Firulais y me gusta el mezcal. (Y las tardes largas con café)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>…o algo así:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>La empresa Mariscos Recio fue fundada por Antonio Recio Mata. Empezó siendo una pequeña empresa que suministraba marisco a hoteles y restaurantes, pero poco a poco se ha ido transformando en un gran imperio. Mariscos Recio, el mar al mejor precio.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Como nuevo usuario de WordPress, deberías ir a <a href=\"http://localhost/wordpress/wp-admin/\">tu escritorio</a> para borrar esta página y crear nuevas páginas para tu contenido. ¡Pásalo bien!</p>\n<!-- /wp:paragraph -->','Página de ejemplo','','publish','closed','open','','pagina-ejemplo','','','2021-09-02 17:32:46','2021-09-02 17:32:46','',0,'http://localhost/wordpress/?page_id=2',0,'page','',0),(3,1,'2021-09-02 17:32:46','2021-09-02 17:32:46','<!-- wp:heading --><h2>Quiénes somos</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texto sugerido: </strong>La dirección de nuestra web es: http://localhost/wordpress.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Comentarios</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texto sugerido: </strong>Cuando los visitantes dejan comentarios en la web, recopilamos los datos que se muestran en el formulario de comentarios, así como la dirección IP del visitante y la cadena de agentes de usuario del navegador para ayudar a la detección de spam.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Una cadena anónima creada a partir de tu dirección de correo electrónico (también llamada hash) puede ser proporcionada al servicio de Gravatar para ver si la estás usando. La política de privacidad del servicio Gravatar está disponible aquí: https://automattic.com/privacy/. Después de la aprobación de tu comentario, la imagen de tu perfil es visible para el público en el contexto de su comentario.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Medios</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texto sugerido: </strong>Si subes imágenes a la web deberías evitar subir imágenes con datos de ubicación (GPS EXIF) incluidos. Los visitantes de la web pueden descargar y extraer cualquier dato de localización de las imágenes de la web.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Cookies</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texto sugerido: </strong>Si dejas un comentario en nuestro sitio puedes elegir guardar tu nombre, dirección de correo electrónico y web en cookies. Esto es para tu comodidad, para que no tengas que volver a rellenar tus datos cuando dejes otro comentario. Estas cookies tendrán una duración de un año.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Si tienes una cuenta y te conectas a este sitio, instalaremos una cookie temporal para determinar si tu navegador acepta cookies. Esta cookie no contiene datos personales y se elimina al cerrar el navegador.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Cuando inicias sesión, también instalaremos varias cookies para guardar tu información de inicio de sesión y tus opciones de visualización de pantalla. Las cookies de inicio de sesión duran dos días, y las cookies de opciones de pantalla duran un año. Si seleccionas &quot;Recordarme&quot;, tu inicio de sesión perdurará durante dos semanas. Si sales de tu cuenta, las cookies de inicio de sesión se eliminarán.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Si editas o publicas un artículo se guardará una cookie adicional en tu navegador. Esta cookie no incluye datos personales y simplemente indica el ID del artículo que acabas de editar. Caduca después de 1 día.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Contenido incrustado de otros sitios web</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texto sugerido: </strong>Los artículos de este sitio pueden incluir contenido incrustado (por ejemplo, vídeos, imágenes, artículos, etc.). El contenido incrustado de otras web se comporta exactamente de la misma manera que si el visitante hubiera visitado la otra web.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Estas web pueden recopilar datos sobre ti, utilizar cookies, incrustar un seguimiento adicional de terceros, y supervisar tu interacción con ese contenido incrustado, incluido el seguimiento de tu interacción con el contenido incrustado si tienes una cuenta y estás conectado a esa web.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Con quién compartimos tus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texto sugerido: </strong>Si solicitas un restablecimiento de contraseña, tu dirección IP será incluida en el correo electrónico de restablecimiento.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Cuánto tiempo conservamos tus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texto sugerido: </strong>Si dejas un comentario, el comentario y sus metadatos se conservan indefinidamente. Esto es para que podamos reconocer y aprobar comentarios sucesivos automáticamente en lugar de mantenerlos en una cola de moderación.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>De los usuarios que se registran en nuestra web (si los hay), también almacenamos la información personal que proporcionan en su perfil de usuario. Todos los usuarios pueden ver, editar o eliminar su información personal en cualquier momento (excepto que no pueden cambiar su nombre de usuario). Los administradores de la web también pueden ver y editar esa información.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Qué derechos tienes sobre tus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texto sugerido: </strong>Si tienes una cuenta o has dejado comentarios en esta web, puedes solicitar recibir un archivo de exportación de los datos personales que tenemos sobre ti, incluyendo cualquier dato que nos hayas proporcionado. También puedes solicitar que eliminemos cualquier dato personal que tengamos sobre ti. Esto no incluye ningún dato que estemos obligados a conservar con fines administrativos, legales o de seguridad.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Dónde enviamos tus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texto sugerido: </strong>Los comentarios de los visitantes puede que los revise un servicio de detección automática de spam.</p><!-- /wp:paragraph -->','Política de privacidad','','draft','closed','open','','politica-privacidad','','','2021-09-02 17:32:46','2021-09-02 17:32:46','',0,'http://localhost/wordpress/?page_id=3',0,'page','',0),(4,1,'2021-09-02 17:34:30','0000-00-00 00:00:00','','Borrador automático','','auto-draft','open','open','','','','','2021-09-02 17:34:30','0000-00-00 00:00:00','',0,'http://localhost/wordpress/?p=4',0,'post','',0),(5,1,'2021-09-02 17:36:43','0000-00-00 00:00:00','<!-- wp:paragraph -->\n<p>tdtdaytvd ytafdytfdyawy oiiwjeksnhskj</p>\n<!-- /wp:paragraph -->','Test','','draft','closed','closed','','','','','2021-09-02 17:36:43','2021-09-02 17:36:43','',0,'http://localhost/wordpress/?page_id=5',0,'page','',0),(6,1,'2021-09-02 17:36:43','2021-09-02 17:36:43','<!-- wp:paragraph -->\n<p>tdtdaytvd ytafdytfdyawy oiiwjeksnhskj</p>\n<!-- /wp:paragraph -->','Test','','inherit','closed','closed','','5-revision-v1','','','2021-09-02 17:36:43','2021-09-02 17:36:43','',5,'http://localhost/wordpress/?p=6',0,'revision','',0),(7,1,'2021-09-02 17:45:46','2021-09-02 17:45:46','','woocommerce-placeholder','','inherit','open','closed','','woocommerce-placeholder','','','2021-09-02 17:45:46','2021-09-02 17:45:46','',0,'http://localhost/wordpress/wp-content/uploads/2021/09/woocommerce-placeholder.png',0,'attachment','image/png',0),(8,1,'2021-09-02 17:45:46','2021-09-02 17:45:46','','Tienda','','publish','closed','closed','','tienda','','','2021-09-02 17:45:46','2021-09-02 17:45:46','',0,'http://localhost/wordpress/tienda/',0,'page','',0),(9,1,'2021-09-02 17:45:46','2021-09-02 17:45:46','<!-- wp:shortcode -->[woocommerce_cart]<!-- /wp:shortcode -->','Carrito','','publish','closed','closed','','carrito','','','2021-09-02 17:45:46','2021-09-02 17:45:46','',0,'http://localhost/wordpress/carrito/',0,'page','',0),(10,1,'2021-09-02 17:45:46','2021-09-02 17:45:46','<!-- wp:shortcode -->[woocommerce_checkout]<!-- /wp:shortcode -->','Finalizar compra','','publish','closed','closed','','finalizar-compra','','','2021-09-02 17:45:46','2021-09-02 17:45:46','',0,'http://localhost/wordpress/finalizar-compra/',0,'page','',0),(11,1,'2021-09-02 17:45:46','2021-09-02 17:45:46','<!-- wp:shortcode -->[woocommerce_my_account]<!-- /wp:shortcode -->','Mi cuenta','','publish','closed','closed','','mi-cuenta','','','2021-09-02 17:45:46','2021-09-02 17:45:46','',0,'http://localhost/wordpress/mi-cuenta/',0,'page','',0),(12,1,'2021-09-02 17:45:46','0000-00-00 00:00:00','<!-- wp:paragraph -->\n<p><b>This is a sample page.</b></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<h3>Overview</h3>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Our refund and returns policy lasts 30 days. If 30 days have passed since your purchase, we can’t offer you a full refund or exchange.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>To be eligible for a return, your item must be unused and in the same condition that you received it. It must also be in the original packaging.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Several types of goods are exempt from being returned. Perishable goods such as food, flowers, newspapers or magazines cannot be returned. We also do not accept products that are intimate or sanitary goods, hazardous materials, or flammable liquids or gases.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Additional non-returnable items:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul>\n<li>Gift cards</li>\n<li>Downloadable software products</li>\n<li>Some health and personal care items</li>\n</ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>To complete your return, we require a receipt or proof of purchase.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Please do not send your purchase back to the manufacturer.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>There are certain situations where only partial refunds are granted:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul>\n<li>Book with obvious signs of use</li>\n<li>CD, DVD, VHS tape, software, video game, cassette tape, or vinyl record that has been opened.</li>\n<li>Any item not in its original condition, is damaged or missing parts for reasons not due to our error.</li>\n<li>Any item that is returned more than 30 days after delivery</li>\n</ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<h2>Refunds</h2>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Once your return is received and inspected, we will send you an email to notify you that we have received your returned item. We will also notify you of the approval or rejection of your refund.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If you are approved, then your refund will be processed, and a credit will automatically be applied to your credit card or original method of payment, within a certain amount of days.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<b>Late or missing refunds</b>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If you haven’t received a refund yet, first check your bank account again.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Then contact your credit card company, it may take some time before your refund is officially posted.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Next contact your bank. There is often some processing time before a refund is posted.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If you’ve done all of this and you still have not received your refund yet, please contact us at {email address}.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<b>Sale items</b>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Only regular priced items may be refunded. Sale items cannot be refunded.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<h2>Exchanges</h2>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>We only replace items if they are defective or damaged. If you need to exchange it for the same item, send us an email at {email address} and send your item to: {physical address}.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<h2>Gifts</h2>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If the item was marked as a gift when purchased and shipped directly to you, you’ll receive a gift credit for the value of your return. Once the returned item is received, a gift certificate will be mailed to you.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If the item wasn’t marked as a gift when purchased, or the gift giver had the order shipped to themselves to give to you later, we will send a refund to the gift giver and they will find out about your return.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<h2>Shipping returns</h2>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>To return your product, you should mail your product to: {physical address}.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>You will be responsible for paying for your own shipping costs for returning your item. Shipping costs are non-refundable. If you receive a refund, the cost of return shipping will be deducted from your refund.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Depending on where you live, the time it may take for your exchanged product to reach you may vary.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If you are returning more expensive items, you may consider using a trackable shipping service or purchasing shipping insurance. We don’t guarantee that we will receive your returned item.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<h2>Need help?</h2>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Contact us at {email} for questions related to refunds and returns.</p>\n<!-- /wp:paragraph -->','Refund and Returns Policy','','draft','closed','closed','','refund_returns','','','2021-09-02 17:45:46','0000-00-00 00:00:00','',0,'http://localhost/wordpress/?page_id=12',0,'page','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint unsigned NOT NULL DEFAULT '0',
  `term_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (1,1,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint unsigned NOT NULL DEFAULT '0',
  `count` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,1),(2,2,'product_type','',0,0),(3,3,'product_type','',0,0),(4,4,'product_type','',0,0),(5,5,'product_type','',0,0),(6,6,'product_visibility','',0,0),(7,7,'product_visibility','',0,0),(8,8,'product_visibility','',0,0),(9,9,'product_visibility','',0,0),(10,10,'product_visibility','',0,0),(11,11,'product_visibility','',0,0),(12,12,'product_visibility','',0,0),(13,13,'product_visibility','',0,0),(14,14,'product_visibility','',0,0),(15,15,'product_cat','',0,0);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Sin categoría','sin-categoria',0),(2,'simple','simple',0),(3,'grouped','grouped',0),(4,'variable','variable',0),(5,'external','external',0),(6,'exclude-from-search','exclude-from-search',0),(7,'exclude-from-catalog','exclude-from-catalog',0),(8,'featured','featured',0),(9,'outofstock','outofstock',0),(10,'rated-1','rated-1',0),(11,'rated-2','rated-2',0),(12,'rated-3','rated-3',0),(13,'rated-4','rated-4',0),(14,'rated-5','rated-5',0),(15,'Sin categorizar','sin-categorizar',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'nickname','admin'),(2,1,'first_name',''),(3,1,'last_name',''),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'syntax_highlighting','true'),(7,1,'comment_shortcuts','false'),(8,1,'admin_color','fresh'),(9,1,'use_ssl','0'),(10,1,'show_admin_bar_front','true'),(11,1,'locale',''),(12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(13,1,'wp_user_level','10'),(14,1,'dismissed_wp_pointers',''),(15,1,'show_welcome_panel','1'),(16,1,'session_tokens','a:1:{s:64:\"aa8365135982b8631bc4d0ec6e522676903b38dcf9e20836fc2f72f7d4aa09b8\";a:4:{s:10:\"expiration\";i:1630776869;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:131:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36 Edg/92.0.902.84\";s:5:\"login\";i:1630604069;}}'),(17,1,'wp_dashboard_quick_press_last_post_id','4'),(18,1,'_woocommerce_tracks_anon_id','woo:JgPbsZ1/n8sp2u07sjjq55d5'),(19,1,'last_update','1630604754'),(20,1,'woocommerce_admin_activity_panel_inbox_last_read','1630604752061');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_users` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'admin','$P$Bf28wuv52F5H97IjtJk3xr67th8GIb.','admin','admin@admin.com','http://localhost/wordpress','2021-09-02 17:32:46','',0,'admin');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_admin_note_actions`
--

DROP TABLE IF EXISTS `wp_wc_admin_note_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_admin_note_actions` (
  `action_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `note_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `query` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `actioned_text` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `nonce_action` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `nonce_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `note_id` (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_admin_note_actions`
--

LOCK TABLES `wp_wc_admin_note_actions` WRITE;
/*!40000 ALTER TABLE `wp_wc_admin_note_actions` DISABLE KEYS */;
INSERT INTO `wp_wc_admin_note_actions` VALUES (40,36,'yes-please','¡Sí, por favor!','https://woocommerce.us8.list-manage.com/subscribe/post?u=2c1434dc56f9506bf3c3ecd21&amp;id=13860df971&amp;SIGNUPPAGE=plugin','actioned',0,'',NULL,NULL),(47,37,'notify-refund-returns-page','Edit page','http://localhost/wordpress/wp-admin/post.php?post=12&action=edit','actioned',0,'',NULL,NULL),(51,38,'connect','Conectar','?page=wc-addons&section=helper','unactioned',0,'',NULL,NULL),(82,1,'mercadopago_q3_2021_ES','Descargalo gratis','https://woocommerce.com/products/mercado-pago-checkout/?utm_source=inbox&utm_medium=product&utm_campaign=mercadopago_q3_2021_ES','actioned',1,'',NULL,NULL),(83,1,'dismiss','Desestimar','','actioned',0,'',NULL,NULL),(84,2,'mercadopago_q3_2021_EN','Free download','https://woocommerce.com/products/mercado-pago-checkout/?utm_source=inbox&utm_medium=product&utm_campaign=mercadopago_q3_2021_EN','actioned',1,'',NULL,NULL),(85,3,'wayflyer_q3_2021','Get funded','https://woocommerce.com/products/wayflyer/','actioned',1,'',NULL,NULL),(86,4,'eu_vat_changes_2021','Learn more about the EU tax regulations','https://woocommerce.com/posts/new-eu-vat-regulations','actioned',1,'',NULL,NULL),(87,5,'open_wc_paypal_payments_product_page','Learn more','https://woocommerce.com/products/woocommerce-paypal-payments/','actioned',1,'',NULL,NULL),(88,6,'upgrade_now_facebook_pixel_api','Upgrade now','plugin-install.php?tab=plugin-information&plugin=&section=changelog','actioned',1,'',NULL,NULL),(89,7,'learn_more_facebook_ec','Learn more','https://woocommerce.com/products/facebook/','unactioned',1,'',NULL,NULL),(90,8,'set-up-concierge','Schedule free session','https://wordpress.com/me/concierge','actioned',1,'',NULL,NULL),(91,9,'learn-more','Learn more','https://docs.woocommerce.com/document/woocommerce-shipping-and-tax/?utm_source=inbox','unactioned',1,'',NULL,NULL),(92,10,'learn-more-ecomm-unique-shopping-experience','Learn more','https://docs.woocommerce.com/document/product-add-ons/?utm_source=inbox','actioned',1,'',NULL,NULL),(93,11,'watch-the-webinar','Watch the webinar','https://youtu.be/V_2XtCOyZ7o','actioned',1,'',NULL,NULL),(94,12,'learn-more','Learn more','https://woocommerce.com/posts/ecommerce-shipping-solutions-guide/?utm_source=inbox','actioned',1,'',NULL,NULL),(95,13,'boost-sales-marketing-guide','See marketing guide','https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=square-boost-sales','actioned',1,'',NULL,NULL),(96,14,'grow-your-business-marketing-guide','See marketing guide','https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=square-grow-your-business','actioned',1,'',NULL,NULL),(97,15,'add-apple-pay','Add Apple Pay','/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments','actioned',1,'',NULL,NULL),(98,15,'learn-more','Learn more','https://docs.woocommerce.com/document/payments/apple-pay/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_applepay','actioned',1,'',NULL,NULL),(99,16,'boost-sales-marketing-guide','See marketing guide','https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=wcpay-boost-sales','actioned',1,'',NULL,NULL),(100,17,'grow-your-business-marketing-guide','See marketing guide','https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=wcpay-grow-your-business','actioned',1,'',NULL,NULL),(101,18,'optimizing-the-checkout-flow','Learn more','https://woocommerce.com/posts/optimizing-woocommerce-checkout?utm_source=inbox','actioned',1,'',NULL,NULL),(102,19,'learn-more','Learn more','https://woocommerce.com/posts/first-things-customize-woocommerce/?utm_source=inbox','unactioned',1,'',NULL,NULL),(103,20,'qualitative-feedback-from-new-users','Share feedback','https://automattic.survey.fm/wc-pay-new','actioned',1,'',NULL,NULL),(104,21,'share-feedback','Share feedback','http://automattic.survey.fm/paypal-feedback','unactioned',1,'',NULL,NULL),(105,22,'learn-more','Learn about Instant Deposits eligibility','https://docs.woocommerce.com/document/payments/instant-deposits/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_instant_deposits','actioned',1,'',NULL,NULL),(106,23,'get-started','Get started','https://woocommerce.com/products/google-listings-and-ads','actioned',1,'',NULL,NULL),(107,24,'update-wc-subscriptions-3-0-15','View latest version','http://localhost/wordpress/wp-admin/admin.php?page=wc-admin&page=wc-addons&section=helper','actioned',1,'',NULL,NULL),(108,25,'update-wc-core-5-4-0','How to update WooCommerce','https://docs.woocommerce.com/document/how-to-update-woocommerce/','actioned',1,'',NULL,NULL),(109,28,'get-woo-commerce-payments','Get WooCommerce Payments','admin.php?page=wc-admin&action=setup-woocommerce-payments','actioned',1,'',NULL,NULL),(110,29,'get-woocommerce-payments','Get WooCommerce Payments','admin.php?page=wc-admin&action=setup-woocommerce-payments','actioned',1,'',NULL,NULL),(111,30,'ppxo-pps-install-paypal-payments-1','View upgrade guide','https://docs.woocommerce.com/document/woocommerce-paypal-payments/paypal-payments-upgrade-guide/','actioned',1,'',NULL,NULL),(112,31,'ppxo-pps-install-paypal-payments-2','View upgrade guide','https://docs.woocommerce.com/document/woocommerce-paypal-payments/paypal-payments-upgrade-guide/','actioned',1,'',NULL,NULL),(113,32,'learn-more','Learn more','https://woocommerce.com/posts/critical-vulnerability-detected-july-2021/?utm_source=inbox_note&utm_medium=product&utm_campaign=vulnerability_comms','unactioned',1,'',NULL,NULL),(114,32,'dismiss','Dismiss','','actioned',0,'',NULL,NULL),(115,33,'learn-more','Learn more','https://woocommerce.com/posts/critical-vulnerability-detected-july-2021/?utm_source=inbox_note&utm_medium=product&utm_campaign=vulnerability_comms','unactioned',1,'',NULL,NULL),(116,33,'dismiss','Dismiss','','actioned',0,'',NULL,NULL),(117,34,'learn-more','Learn more','https://woocommerce.com/posts/critical-vulnerability-detected-july-2021/?utm_source=inbox_note&utm_medium=product&utm_campaign=vulnerability_comms','unactioned',1,'',NULL,NULL),(118,34,'dismiss','Dismiss','','actioned',0,'',NULL,NULL),(119,35,'learn-more','Learn more','https://woocommerce.com/posts/critical-vulnerability-detected-july-2021/?utm_source=inbox_note&utm_medium=product&utm_campaign=vulnerability_comms','unactioned',1,'',NULL,NULL),(120,35,'dismiss','Dismiss','','actioned',0,'',NULL,NULL);
/*!40000 ALTER TABLE `wp_wc_admin_note_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_admin_notes`
--

DROP TABLE IF EXISTS `wp_wc_admin_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_admin_notes` (
  `note_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `content_data` longtext COLLATE utf8mb4_unicode_520_ci,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_reminder` datetime DEFAULT NULL,
  `is_snoozable` tinyint(1) NOT NULL DEFAULT '0',
  `layout` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `image` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'info',
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_admin_notes`
--

LOCK TABLES `wp_wc_admin_notes` WRITE;
/*!40000 ALTER TABLE `wp_wc_admin_notes` DISABLE KEYS */;
INSERT INTO `wp_wc_admin_notes` VALUES (1,'mercadopago_q3_2021_ES','marketing','en_US','Cobrá con el Checkout de Mercado Pago','El procesador de pagos líder en América Latina ya está disponible para las tiendas de WooCommerce. Acepta pagos de forma segura con tarjetas de débito y crédito, dinero en efectivo, transferencias bancarias y meses con y sin interés, con el respaldo herramientas exclusivas de prevención del fraude.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(2,'mercadopago_q3_2021_EN','marketing','en_US','Get paid with Mercado Pago Checkout','Latin America\'s leading payment processor is now available for WooCommerce stores. Securely accept debit and credit cards, cash, bank transfers, and installment payments – backed by exclusive fraud prevention tools.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(3,'wayflyer_q3_2021','marketing','en_US','Grow your revenue with Wayflyer financing and analytics','Flexible financing tailored to your needs by <a href=\"https://woocommerce.com/products/wayflyer/\">Wayflyer</a> – one fee, no interest rates, penalties, equity, or personal guarantees. Based on your store\'s performance, Wayflyer can provide the financing you need to grow and the analytical insights to help you spend it.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(4,'eu_vat_changes_2021','marketing','en_US','Get your business ready for the new EU tax regulations','On July 1, 2021, new taxation rules will come into play when the <a href=\"https://ec.europa.eu/taxation_customs/business/vat/modernising-vat-cross-border-ecommerce_en\">European Union (EU) Value-Added Tax (VAT) eCommerce package</a> takes effect.<br /><br />The new regulations will impact virtually every B2C business involved in cross-border eCommerce trade with the EU.<br /><br />We therefore recommend <a href=\"https://woocommerce.com/posts/new-eu-vat-regulations\">familiarizing yourself with the new updates</a>, and consult with a tax professional to ensure your business is following regulations and best practice.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(5,'paypal_ppcp_gtm_2021','marketing','en_US','Offer more options with the new PayPal','Get the latest PayPal extension for a full suite of payment methods with extensive currency and country coverage.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(6,'facebook_pixel_api_2021','marketing','en_US','Improve the performance of your Facebook ads','Enable Facebook Pixel and Conversions API through the latest version of Facebook for WooCommerce for improved measurement and ad targeting capabilities.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(7,'facebook_ec_2021','marketing','en_US','Sync your product catalog with Facebook to help boost sales','A single click adds all products to your Facebook Business Page shop. Product changes are automatically synced, with the flexibility to control which products are listed.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(8,'ecomm-need-help-setting-up-your-store','info','en_US','Need help setting up your Store?','Schedule a free 30-min <a href=\"https://wordpress.com/support/concierge-support/\">quick start session</a> and get help from our specialists. We’re happy to walk through setup steps, show you around the WordPress.com dashboard, troubleshoot any issues you may have, and help you the find the features you need to accomplish your goals for your site.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(9,'woocommerce-services','info','en_US','WooCommerce Shipping & Tax','WooCommerce Shipping &amp; Tax helps get your store “ready to sell” as quickly as possible. You create your products. We take care of tax calculation, payment processing, and shipping label printing! Learn more about the extension that you just installed.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(10,'ecomm-unique-shopping-experience','info','en_US','For a shopping experience as unique as your customers','Product Add-Ons allow your customers to personalize products while they’re shopping on your online store. No more follow-up email requests—customers get what they want, before they’re done checking out. Learn more about this extension that comes included in your plan.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(11,'wc-admin-getting-started-in-ecommerce','info','en_US','Getting Started in eCommerce - webinar','We want to make eCommerce and this process of getting started as easy as possible for you. Watch this webinar to get tips on how to have our store up and running in a breeze.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(12,'your-first-product','info','en_US','Your first product','That\'s huge! You\'re well on your way to building a successful online store — now it’s time to think about how you\'ll fulfill your orders.<br /><br />Read our shipping guide to learn best practices and options for putting together your shipping strategy. And for WooCommerce stores in the United States, you can print discounted shipping labels via USPS with <a href=\"https://href.li/?https://woocommerce.com/shipping\" target=\"_blank\">WooCommerce Shipping</a>.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(13,'wc-square-apple-pay-boost-sales','marketing','en_US','Boost sales with Apple Pay','Now that you accept Apple Pay® with Square you can increase conversion rates by letting your customers know that Apple Pay® is available. Here’s a marketing guide to help you get started.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(14,'wc-square-apple-pay-grow-your-business','marketing','en_US','Grow your business with Square and Apple Pay ','Now more than ever, shoppers want a fast, simple, and secure online checkout experience. Increase conversion rates by letting your customers know that you now accept Apple Pay®.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(15,'wcpay-apple-pay-is-now-available','marketing','en_US','Apple Pay is now available with WooCommerce Payments!','Increase your conversion rate by offering a fast and secure checkout with <a href=\"https://woocommerce.com/apple-pay/?utm_source=inbox&amp;utm_medium=product&amp;utm_campaign=wcpay_applepay\" target=\"_blank\">Apple Pay</a>®. It’s free to get started with <a href=\"https://woocommerce.com/payments/?utm_source=inbox&amp;utm_medium=product&amp;utm_campaign=wcpay_applepay\" target=\"_blank\">WooCommerce Payments</a>.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(16,'wcpay-apple-pay-boost-sales','marketing','en_US','Boost sales with Apple Pay','Now that you accept Apple Pay® with WooCommerce Payments you can increase conversion rates by letting your customers know that Apple Pay® is available. Here’s a marketing guide to help you get started.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(17,'wcpay-apple-pay-grow-your-business','marketing','en_US','Grow your business with WooCommerce Payments and Apple Pay','Now more than ever, shoppers want a fast, simple, and secure online checkout experience. Increase conversion rates by letting your customers know that you now accept Apple Pay®.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(18,'wc-admin-optimizing-the-checkout-flow','info','en_US','Optimizing the checkout flow','It\'s crucial to get your store\'s checkout as smooth as possible to avoid losing sales. Let\'s take a look at how you can optimize the checkout experience for your shoppers.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(19,'wc-admin-first-five-things-to-customize','info','en_US','The first 5 things to customize in your store','Deciding what to start with first is tricky. To help you properly prioritize, we\'ve put together this short list of the first few things you should customize in WooCommerce.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(20,'wc-payments-qualitative-feedback','info','en_US','WooCommerce Payments setup - let us know what you think','Congrats on enabling WooCommerce Payments for your store. Please share your feedback in this 2 minute survey to help us improve the setup process.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(21,'share-your-feedback-on-paypal','info','en_US','Share your feedback on PayPal','Share your feedback in this 2 minute survey about how we can make the process of accepting payments more useful for your store.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(22,'wcpay_instant_deposits_gtm_2021','marketing','en_US','Get paid within minutes – Instant Deposits for WooCommerce Payments','Stay flexible with immediate access to your funds when you need them – including nights, weekends, and holidays. With <a href=\"https://woocommerce.com/products/woocommerce-payments/?utm_source=inbox&amp;utm_medium=product&amp;utm_campaign=wcpay_instant_deposits\">WooCommerce Payments\'</a> new Instant Deposits feature, you’re able to transfer your earnings to a debit card within minutes.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(23,'google_listings_and_ads_install','marketing','en_US','Drive traffic and sales with Google','Reach online shoppers to drive traffic and sales for your store by showcasing products across Google, for free or with ads.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(24,'wc-subscriptions-security-update-3-0-15','info','en_US','WooCommerce Subscriptions security update!','We recently released an important security update to WooCommerce Subscriptions. To ensure your site\'s data is protected, please upgrade <strong>WooCommerce Subscriptions to version 3.0.15</strong> or later.<br /><br />Click the button below to view and update to the latest Subscriptions version, or log in to <a href=\"https://woocommerce.com/my-dashboard\">WooCommerce.com Dashboard</a> and navigate to your <strong>Downloads</strong> page.<br /><br />We recommend always using the latest version of WooCommerce Subscriptions, and other software running on your site, to ensure maximum security.<br /><br />If you have any questions we are here to help — just <a href=\"https://woocommerce.com/my-account/create-a-ticket/\">open a ticket</a>.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(25,'woocommerce-core-update-5-4-0','info','en_US','Update to WooCommerce 5.4.1 now','WooCommerce 5.4.1 addresses a checkout issue discovered in WooCommerce 5.4. We recommend upgrading to WooCommerce 5.4.1 as soon as possible.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(26,'wcpay-promo-2020-11','marketing','en_US','wcpay-promo-2020-11','wcpay-promo-2020-11','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(27,'wcpay-promo-2020-12','marketing','en_US','wcpay-promo-2020-12','wcpay-promo-2020-12','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(28,'wcpay-promo-2021-6-incentive-1','marketing','en_US','Simplify the payments process for you and your customers with WooCommerce Payments','With <a href=\"https://woocommerce.com/payments/?utm_medium=notification&amp;utm_source=product&amp;utm_campaign=wcpay601\">WooCommerce Payments</a>, you can securely accept all major cards, Apple Pay®, and recurring revenue in over 100 currencies.\n				Built into your store’s WooCommerce dashboard, track cash flow and manage all of your transactions in one place – with no setup costs or monthly fees.\n				<br /><br />\n				By clicking \"Get WooCommerce Payments,\" you agree to the <a href=\"https://wordpress.com/tos/?utm_medium=notification&amp;utm_source=product&amp;utm_campaign=wcpay601\">Terms of Service</a>\n				and acknowledge you have read the <a href=\"https://automattic.com/privacy/\">Privacy Policy</a>.\n				','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(29,'wcpay-promo-2021-6-incentive-2','marketing','en_US','Simplify the payments process for you and your customers with WooCommerce Payments','With <a href=\"https://woocommerce.com/payments/?utm_medium=notification&amp;utm_source=product&amp;utm_campaign=wcpay601\">WooCommerce Payments</a>, you can securely accept all major cards, Apple Pay®, and recurring revenue in over 100 currencies.\n				Built into your store’s WooCommerce dashboard, track cash flow and manage all of your transactions in one place – with no setup costs or monthly fees.\n				<br /><br />\n				By clicking \"Get WooCommerce Payments,\" you agree to the <a href=\"https://wordpress.com/tos/?utm_medium=notification&amp;utm_source=product&amp;utm_campaign=wcpay601\">Terms of Service</a>\n				and acknowledge you have read the <a href=\"https://automattic.com/privacy/\">Privacy Policy</a>.\n				','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(30,'ppxo-pps-upgrade-paypal-payments-1','info','en_US','Get the latest PayPal extension for WooCommerce','Heads up! There\'s a new PayPal on the block!<br /><br />Now is a great time to upgrade to our latest <a href=\"https://woocommerce.com/products/woocommerce-paypal-payments/\" target=\"_blank\">PayPal extension</a> to continue to receive support and updates with PayPal.<br /><br />Get access to a full suite of PayPal payment methods, extensive currency and country coverage, and pay later options with the all-new PayPal extension for WooCommerce.','{}','unactioned','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(31,'ppxo-pps-upgrade-paypal-payments-2','info','en_US','Upgrade your PayPal experience!','We\'ve developed a whole new <a href=\"https://woocommerce.com/products/woocommerce-paypal-payments/\" target=\"_blank\">PayPal extension for WooCommerce</a> that combines the best features of our many PayPal extensions into just one extension.<br /><br />Get access to a full suite of PayPal payment methods, extensive currency and country coverage, offer subscription and recurring payments, and the new PayPal pay later options.<br /><br />Start using our latest PayPal today to continue to receive support and updates.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(32,'woocommerce-core-sqli-july-2021-need-to-update','update','en_US','Action required: Critical vulnerabilities in WooCommerce','In response to a critical vulnerability identified on July 13, 2021, we are working with the WordPress Plugins Team to deploy software updates to stores running WooCommerce (versions 3.3 to 5.5) and the WooCommerce Blocks feature plugin (versions 2.5 to 5.5).<br /><br />Our investigation into this vulnerability is ongoing, but <strong>we wanted to let you know now about the importance of updating immediately</strong>.<br /><br />For more information on which actions you should take, as well as answers to FAQs, please urgently review our blog post detailing this issue.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(33,'woocommerce-blocks-sqli-july-2021-need-to-update','update','en_US','Action required: Critical vulnerabilities in WooCommerce Blocks','In response to a critical vulnerability identified on July 13, 2021, we are working with the WordPress Plugins Team to deploy software updates to stores running WooCommerce (versions 3.3 to 5.5) and the WooCommerce Blocks feature plugin (versions 2.5 to 5.5).<br /><br />Our investigation into this vulnerability is ongoing, but <strong>we wanted to let you know now about the importance of updating immediately</strong>.<br /><br />For more information on which actions you should take, as well as answers to FAQs, please urgently review our blog post detailing this issue.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(34,'woocommerce-core-sqli-july-2021-store-patched','update','en_US','Solved: Critical vulnerabilities patched in WooCommerce','In response to a critical vulnerability identified on July 13, 2021, we worked with the WordPress Plugins Team to deploy software updates to stores running WooCommerce (versions 3.3 to 5.5) and the WooCommerce Blocks feature plugin (versions 2.5 to 5.5).<br /><br /><strong>Your store has been updated to the latest secure version(s)</strong>. For more information and answers to FAQs, please review our blog post detailing this issue.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(35,'woocommerce-blocks-sqli-july-2021-store-patched','update','en_US','Solved: Critical vulnerabilities patched in WooCommerce Blocks','In response to a critical vulnerability identified on July 13, 2021, we worked with the WordPress Plugins Team to deploy software updates to stores running WooCommerce (versions 3.3 to 5.5) and the WooCommerce Blocks feature plugin (versions 2.5 to 5.5).<br /><br /><strong>Your store has been updated to the latest secure version(s)</strong>. For more information and answers to FAQs, please review our blog post detailing this issue.','{}','pending','woocommerce.com','2021-09-02 17:45:48',NULL,0,'plain','',0,'info'),(36,'wc-admin-onboarding-email-marketing','info','en_US','Regístrate para obtener trucos, actualizaciones sobre productos e inspiración','Estamos aquí para ti - consigue trucos, actualizaciones de productos e inspiración en tu buzón','{}','unactioned','woocommerce-admin','2021-09-02 17:45:49',NULL,0,'plain','',0,'info'),(37,'wc-refund-returns-page','info','en_US','Setup a Refund and Returns Policy page to boost your store\'s credibility.','We have created a sample draft Refund and Returns Policy page for you. Please have a look and update it to fit your store.','{}','unactioned','woocommerce-core','2021-09-02 17:45:49',NULL,0,'plain','',0,'info'),(38,'wc-admin-wc-helper-connection','info','en_US','Conectar con WooCommerce.com','Conéctate para recibir avisos y actualizaciones importantes de productos.','{}','unactioned','woocommerce-admin','2021-09-02 17:45:49',NULL,0,'plain','',0,'info');
/*!40000 ALTER TABLE `wp_wc_admin_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_category_lookup`
--

DROP TABLE IF EXISTS `wp_wc_category_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_category_lookup` (
  `category_tree_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`category_tree_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_category_lookup`
--

LOCK TABLES `wp_wc_category_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_category_lookup` DISABLE KEYS */;
INSERT INTO `wp_wc_category_lookup` VALUES (15,15);
/*!40000 ALTER TABLE `wp_wc_category_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_customer_lookup`
--

DROP TABLE IF EXISTS `wp_wc_customer_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_customer_lookup` (
  `customer_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `date_last_active` timestamp NULL DEFAULT NULL,
  `date_registered` timestamp NULL DEFAULT NULL,
  `country` char(2) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `postcode` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `city` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `state` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_customer_lookup`
--

LOCK TABLES `wp_wc_customer_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_customer_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_customer_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_download_log`
--

DROP TABLE IF EXISTS `wp_wc_download_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_download_log` (
  `download_log_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `permission_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `user_ip_address` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  PRIMARY KEY (`download_log_id`),
  KEY `permission_id` (`permission_id`),
  KEY `timestamp` (`timestamp`),
  CONSTRAINT `fk_wp_wc_download_log_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `wp_woocommerce_downloadable_product_permissions` (`permission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_download_log`
--

LOCK TABLES `wp_wc_download_log` WRITE;
/*!40000 ALTER TABLE `wp_wc_download_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_download_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_order_coupon_lookup`
--

DROP TABLE IF EXISTS `wp_wc_order_coupon_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_coupon_lookup` (
  `order_id` bigint unsigned NOT NULL,
  `coupon_id` bigint NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `discount_amount` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`,`coupon_id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_coupon_lookup`
--

LOCK TABLES `wp_wc_order_coupon_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_coupon_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_order_coupon_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_order_product_lookup`
--

DROP TABLE IF EXISTS `wp_wc_order_product_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_product_lookup` (
  `order_item_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `variation_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_qty` int NOT NULL,
  `product_net_revenue` double NOT NULL DEFAULT '0',
  `product_gross_revenue` double NOT NULL DEFAULT '0',
  `coupon_amount` double NOT NULL DEFAULT '0',
  `tax_amount` double NOT NULL DEFAULT '0',
  `shipping_amount` double NOT NULL DEFAULT '0',
  `shipping_tax_amount` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_product_lookup`
--

LOCK TABLES `wp_wc_order_product_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_product_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_order_product_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_order_stats`
--

DROP TABLE IF EXISTS `wp_wc_order_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_stats` (
  `order_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `num_items_sold` int NOT NULL DEFAULT '0',
  `total_sales` double NOT NULL DEFAULT '0',
  `tax_total` double NOT NULL DEFAULT '0',
  `shipping_total` double NOT NULL DEFAULT '0',
  `net_total` double NOT NULL DEFAULT '0',
  `returning_customer` tinyint(1) DEFAULT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `date_created` (`date_created`),
  KEY `customer_id` (`customer_id`),
  KEY `status` (`status`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_stats`
--

LOCK TABLES `wp_wc_order_stats` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_order_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_order_tax_lookup`
--

DROP TABLE IF EXISTS `wp_wc_order_tax_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_tax_lookup` (
  `order_id` bigint unsigned NOT NULL,
  `tax_rate_id` bigint unsigned NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shipping_tax` double NOT NULL DEFAULT '0',
  `order_tax` double NOT NULL DEFAULT '0',
  `total_tax` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`,`tax_rate_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_tax_lookup`
--

LOCK TABLES `wp_wc_order_tax_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_tax_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_order_tax_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_product_meta_lookup`
--

DROP TABLE IF EXISTS `wp_wc_product_meta_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_product_meta_lookup` (
  `product_id` bigint NOT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `virtual` tinyint(1) DEFAULT '0',
  `downloadable` tinyint(1) DEFAULT '0',
  `min_price` decimal(19,4) DEFAULT NULL,
  `max_price` decimal(19,4) DEFAULT NULL,
  `onsale` tinyint(1) DEFAULT '0',
  `stock_quantity` double DEFAULT NULL,
  `stock_status` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT 'instock',
  `rating_count` bigint DEFAULT '0',
  `average_rating` decimal(3,2) DEFAULT '0.00',
  `total_sales` bigint DEFAULT '0',
  `tax_status` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT 'taxable',
  `tax_class` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  PRIMARY KEY (`product_id`),
  KEY `virtual` (`virtual`),
  KEY `downloadable` (`downloadable`),
  KEY `stock_status` (`stock_status`),
  KEY `stock_quantity` (`stock_quantity`),
  KEY `onsale` (`onsale`),
  KEY `min_max_price` (`min_price`,`max_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_product_meta_lookup`
--

LOCK TABLES `wp_wc_product_meta_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_product_meta_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_product_meta_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_reserved_stock`
--

DROP TABLE IF EXISTS `wp_wc_reserved_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_reserved_stock` (
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `stock_quantity` double NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_reserved_stock`
--

LOCK TABLES `wp_wc_reserved_stock` WRITE;
/*!40000 ALTER TABLE `wp_wc_reserved_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_reserved_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_tax_rate_classes`
--

DROP TABLE IF EXISTS `wp_wc_tax_rate_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_tax_rate_classes` (
  `tax_rate_class_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_class_id`),
  UNIQUE KEY `slug` (`slug`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_tax_rate_classes`
--

LOCK TABLES `wp_wc_tax_rate_classes` WRITE;
/*!40000 ALTER TABLE `wp_wc_tax_rate_classes` DISABLE KEYS */;
INSERT INTO `wp_wc_tax_rate_classes` VALUES (1,'Tasa reducida','tasa-reducida'),(2,'Tasa cero','tasa-cero');
/*!40000 ALTER TABLE `wp_wc_tax_rate_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_webhooks`
--

DROP TABLE IF EXISTS `wp_wc_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_webhooks` (
  `webhook_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `delivery_url` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `secret` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `topic` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint NOT NULL,
  `failure_count` smallint NOT NULL DEFAULT '0',
  `pending_delivery` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`webhook_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_webhooks`
--

LOCK TABLES `wp_wc_webhooks` WRITE;
/*!40000 ALTER TABLE `wp_wc_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_api_keys`
--

DROP TABLE IF EXISTS `wp_woocommerce_api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_api_keys` (
  `key_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_520_ci,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`key_id`),
  KEY `consumer_key` (`consumer_key`),
  KEY `consumer_secret` (`consumer_secret`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_api_keys`
--

LOCK TABLES `wp_woocommerce_api_keys` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_attribute_taxonomies`
--

DROP TABLE IF EXISTS `wp_woocommerce_attribute_taxonomies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_label` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `attribute_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_orderby` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_public` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`attribute_id`),
  KEY `attribute_name` (`attribute_name`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_attribute_taxonomies`
--

LOCK TABLES `wp_woocommerce_attribute_taxonomies` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_attribute_taxonomies` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_attribute_taxonomies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_downloadable_product_permissions`
--

DROP TABLE IF EXISTS `wp_woocommerce_downloadable_product_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `download_id` varchar(36) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned NOT NULL DEFAULT '0',
  `order_key` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_id`),
  KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(16),`download_id`),
  KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  KEY `order_id` (`order_id`),
  KEY `user_order_remaining_expires` (`user_id`,`order_id`,`downloads_remaining`,`access_expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_downloadable_product_permissions`
--

LOCK TABLES `wp_woocommerce_downloadable_product_permissions` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_downloadable_product_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_downloadable_product_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_log`
--

DROP TABLE IF EXISTS `wp_woocommerce_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_log` (
  `log_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `level` smallint NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`log_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_log`
--

LOCK TABLES `wp_woocommerce_log` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_order_itemmeta`
--

DROP TABLE IF EXISTS `wp_woocommerce_order_itemmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_item_id` bigint unsigned NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `meta_key` (`meta_key`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_order_itemmeta`
--

LOCK TABLES `wp_woocommerce_order_itemmeta` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_order_itemmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_order_itemmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_order_items`
--

DROP TABLE IF EXISTS `wp_woocommerce_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_item_name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `order_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_order_items`
--

LOCK TABLES `wp_woocommerce_order_items` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_payment_tokenmeta`
--

DROP TABLE IF EXISTS `wp_woocommerce_payment_tokenmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_payment_tokenmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_token_id` bigint unsigned NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `payment_token_id` (`payment_token_id`),
  KEY `meta_key` (`meta_key`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_payment_tokenmeta`
--

LOCK TABLES `wp_woocommerce_payment_tokenmeta` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_payment_tokenmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_payment_tokenmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_payment_tokens`
--

DROP TABLE IF EXISTS `wp_woocommerce_payment_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_payment_tokens` (
  `token_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gateway_id` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `type` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`token_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_payment_tokens`
--

LOCK TABLES `wp_woocommerce_payment_tokens` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_payment_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_payment_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_sessions`
--

DROP TABLE IF EXISTS `wp_woocommerce_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_sessions` (
  `session_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `session_key` char(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `session_expiry` bigint unsigned NOT NULL,
  PRIMARY KEY (`session_id`),
  UNIQUE KEY `session_key` (`session_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_sessions`
--

LOCK TABLES `wp_woocommerce_sessions` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_sessions` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_sessions` VALUES (1,'1','a:7:{s:4:\"cart\";s:6:\"a:0:{}\";s:11:\"cart_totals\";s:367:\"a:15:{s:8:\"subtotal\";i:0;s:12:\"subtotal_tax\";i:0;s:14:\"shipping_total\";i:0;s:12:\"shipping_tax\";i:0;s:14:\"shipping_taxes\";a:0:{}s:14:\"discount_total\";i:0;s:12:\"discount_tax\";i:0;s:19:\"cart_contents_total\";i:0;s:17:\"cart_contents_tax\";i:0;s:19:\"cart_contents_taxes\";a:0:{}s:9:\"fee_total\";i:0;s:7:\"fee_tax\";i:0;s:9:\"fee_taxes\";a:0:{}s:5:\"total\";i:0;s:9:\"total_tax\";i:0;}\";s:15:\"applied_coupons\";s:6:\"a:0:{}\";s:22:\"coupon_discount_totals\";s:6:\"a:0:{}\";s:26:\"coupon_discount_tax_totals\";s:6:\"a:0:{}\";s:21:\"removed_cart_contents\";s:6:\"a:0:{}\";s:8:\"customer\";s:762:\"a:27:{s:2:\"id\";s:1:\"1\";s:13:\"date_modified\";s:25:\"2021-09-02T17:45:54+00:00\";s:8:\"postcode\";s:0:\"\";s:4:\"city\";s:0:\"\";s:9:\"address_1\";s:0:\"\";s:7:\"address\";s:0:\"\";s:9:\"address_2\";s:0:\"\";s:5:\"state\";s:2:\"CA\";s:7:\"country\";s:2:\"US\";s:17:\"shipping_postcode\";s:0:\"\";s:13:\"shipping_city\";s:0:\"\";s:18:\"shipping_address_1\";s:0:\"\";s:16:\"shipping_address\";s:0:\"\";s:18:\"shipping_address_2\";s:0:\"\";s:14:\"shipping_state\";s:2:\"CA\";s:16:\"shipping_country\";s:2:\"US\";s:13:\"is_vat_exempt\";s:0:\"\";s:19:\"calculated_shipping\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:7:\"company\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:5:\"email\";s:15:\"admin@admin.com\";s:19:\"shipping_first_name\";s:0:\"\";s:18:\"shipping_last_name\";s:0:\"\";s:16:\"shipping_company\";s:0:\"\";s:14:\"shipping_phone\";s:0:\"\";}\";}',1630777609);
/*!40000 ALTER TABLE `wp_woocommerce_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_shipping_zone_locations`
--

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_shipping_zone_locations` (
  `location_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `zone_id` bigint unsigned NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `location_id` (`location_id`),
  KEY `location_type_code` (`location_type`(10),`location_code`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_shipping_zone_locations`
--

LOCK TABLES `wp_woocommerce_shipping_zone_locations` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zone_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zone_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_shipping_zone_methods`
--

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_shipping_zone_methods` (
  `zone_id` bigint unsigned NOT NULL,
  `instance_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `method_id` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `method_order` bigint unsigned NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_shipping_zone_methods`
--

LOCK TABLES `wp_woocommerce_shipping_zone_methods` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zone_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zone_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_shipping_zones`
--

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_shipping_zones` (
  `zone_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `zone_order` bigint unsigned NOT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_shipping_zones`
--

LOCK TABLES `wp_woocommerce_shipping_zones` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zones` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_tax_rate_locations`
--

DROP TABLE IF EXISTS `wp_woocommerce_tax_rate_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `tax_rate_id` bigint unsigned NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `location_type_code` (`location_type`(10),`location_code`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_tax_rate_locations`
--

LOCK TABLES `wp_woocommerce_tax_rate_locations` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rate_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rate_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_tax_rates`
--

DROP TABLE IF EXISTS `wp_woocommerce_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tax_rate_country` varchar(2) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(8) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint unsigned NOT NULL,
  `tax_rate_compound` int NOT NULL DEFAULT '0',
  `tax_rate_shipping` int NOT NULL DEFAULT '1',
  `tax_rate_order` bigint unsigned NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_id`),
  KEY `tax_rate_country` (`tax_rate_country`),
  KEY `tax_rate_state` (`tax_rate_state`(2)),
  KEY `tax_rate_class` (`tax_rate_class`(10)),
  KEY `tax_rate_priority` (`tax_rate_priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_tax_rates`
--

LOCK TABLES `wp_woocommerce_tax_rates` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-06 11:58:26