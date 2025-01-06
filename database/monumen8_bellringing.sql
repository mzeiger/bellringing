-- MariaDB dump 10.19  Distrib 10.5.17-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: monumen8_bellringing
-- ------------------------------------------------------
-- Server version	10.5.17-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administration`
--

DROP TABLE IF EXISTS `administration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administration` (
  `start_dt` date NOT NULL,
  `end_dt` date NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administration`
--

LOCK TABLES `administration` WRITE;
/*!40000 ALTER TABLE `administration` DISABLE KEYS */;
INSERT INTO `administration` VALUES ('2023-11-24','2023-12-24',1);
/*!40000 ALTER TABLE `administration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrators` (
  `listing_order` int(1) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `listing_order` (`listing_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` VALUES (1,'Manager','Mark','Zeiger','mark.zeiger@gmail.com','719-494-7718'),(2,'Asst. Manager','Jeff','Baker','wjeffreybaker@gmail.com','860-989-8881'),(3,'Store Manager - King Soopers',NULL,NULL,NULL,NULL),(4,'Store Manager - Walmart',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` smallint(11) NOT NULL,
  `location_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location` (`location_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (100,'Walmart East Dr'),(300,'King Soopers'),(200,'Walmart West Dr');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ringers`
--

DROP TABLE IF EXISTS `ringers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ringers` (
  `id` smallint(11) NOT NULL AUTO_INCREMENT COMMENT 'AUTO INCREMENT',
  `fname` varchar(20) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `forgot_pwd_code` bigint(13) DEFAULT NULL,
  `forgot_pwd_time` datetime DEFAULT NULL,
  `phone` char(13) DEFAULT NULL,
  `administrator` tinyint(1) NOT NULL DEFAULT 0,
  `Comments` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_2` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=216 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ringers`
--

LOCK TABLES `ringers` WRITE;
/*!40000 ALTER TABLE `ringers` DISABLE KEYS */;
INSERT INTO `ringers` VALUES (1,'Mark','Zeiger','mark.zeiger@gmail.com','$2y$10$AXj.5S36cIABySC76almuuHYRfWKHtkNMGSjs/kHD0sSftpQm0VNG',NULL,NULL,'719-494-7718',1,''),(167,'D-38','Key Clubs','mike.luginbuhl+1@comcast.net','$2y$10$0.HRghoR1zkLEYUagiSzSuPhnAWKZcgiGSqbME/Kr9Vugkud8eham',NULL,NULL,'719-313-8532',0,''),(168,'Susan','Leggiero','sleggie26@me.com','$2y$10$h8H2XODz.SYnJl4svwxbxusY2tLo5KY9ec6bw04HPIu67evz/d2LO',NULL,NULL,'719-440-8969',0,''),(169,'Same as','East Door','sameaseast@noemail.com','$2y$10$Po/8JEQKcbE0kPy2xhpqAOcWFoiLaUtmE.QwM2vnqsj14OxUEOhIC',NULL,NULL,'555-555-5555',0,''),(189,'RF','Smith','rff106k@gmail.com','$2y$10$R2BoCO6Fvjw5eJHRGcc4IetJ832OA4VJp8kNHiHKXmonrvoORUZoa',NULL,NULL,'719-210-4987',0,''),(188,'Chuck','Leggiero','ramcoach26@me.com','$2y$10$Yde8FpJY.hmK4o1ZcERNeu7Yb9kqgr.CWb/70xAjnbjsayrl3QT4i',NULL,NULL,'719-440-8970',0,''),(187,'Max','Williams','mwilliams5866@gmail.com','$2y$10$mljIpFN96T6EqE/yjDG6c.orrMUkueG7.3lhKImxUI4cZoQ6Hs7eG',NULL,NULL,'719-338-5866',0,''),(186,'Benny','Nasser','benasser19r@gmail.com','$2y$10$gMU93ttkS/jOAcdGPRyHUO6O2HL9x327biQwjpDEUDiqTsn580sZa',NULL,NULL,'719-488-3189',0,''),(184,'James','Murphy','patt.and.jim@gmail.com','$2y$10$j9UKZ88XfTdRmvY9JyNHcuqpxQc3a0dXFhNEZ260p0mterPajd8sG',NULL,NULL,'719-487-9327',0,''),(185,'Tri-Lakes','Women\'s Club','sleggie26+1@me.com','$2y$10$xAXfuUdHlL8HiLnPBcYN3OgBtqGvCcrddbqTXrwDNeAtgnZiYeDSC',NULL,NULL,'719-440-8969',0,''),(179,'Daniel','Lopez','danglopez@msn.com','$2y$10$sQzvy3PjgjjNqM.Lqo5GSOFp.lW06rdQX0hfwJlN3FL/JHARSJQlK',NULL,NULL,'719-358-1017',0,''),(180,'Ron','Mangiarelli','nonnon@mangiarelli.com','$2y$10$yNFpwNHZxUMHnQ/.L7UE1.cb/NLkYeGf5pINtiuotvk9.m7NBSBf.',NULL,NULL,'719-331-9941',0,''),(181,'Sandy','Mangiarelli','sandy@mangiarelli.com','$2y$10$4G.5YHr1OPBmqdTPUXyHUuaJHWyEjd1evlhjY5qcWNJnp0arUAAZ.',NULL,NULL,'719-351-0180',0,''),(182,'Builders','Club','danglopez+1@msn.com','$2y$10$1gLmrfE69IqNXRFcnlZlYuBoXGIAo65kj50akuZScKLU6V9tJJP1W',NULL,NULL,'719-358-1017',0,''),(190,'Sharon','Williams','swilliams9960@gmail.com','$2y$10$OnBeeUtYlmc/e1Pwhyg7GOz56MG2qSznSQrwBIXh7ZKAlESvme5Jy',NULL,NULL,'719-660-9960',0,''),(191,'Ed','Tomlinson','etomlinson24@comcast.net','$2y$10$jrh/aA5PNjHbYtcGJsGWPenK.IzMi4Fo59gtyr3I6pDfNQ57ienq.',NULL,NULL,'719-650-3522',0,''),(192,'Rick','Schoenlein','rjschoenlein@msn.com','$2y$10$XWQ/NW9YFxVqLTkuPp3F4uvbCGkLTTa3mR3yV.gSVH5jku.YUo6Oi',NULL,NULL,'317-376-3850',0,''),(193,'Larry','Vliet','lv8014@comcast.net','$2y$10$ZR2af3af7ab7vDJOWIpvPuyQMwUxV00LGkOaLX5F0/256EmxDk49S',NULL,NULL,'719-761-3118',0,''),(194,'Mark','Anderson','mark@marksmywords.com','$2y$10$3Ir5woLED0t7aJ2nLoYw2OnRaH16sAWW7DLw2g2nlTgrWUhWaM6Fe',NULL,NULL,'719-339-7053',0,''),(195,'Chris','Kupko','kupkofamily@gmail.com','$2y$10$c5C/iEZ7CuzoYyKwaR5lVu5pQB5e/49v/1AdrZ0Fztvcd8tRsYigC',NULL,NULL,'719-661-4926',0,''),(196,'Dave','Wittman','dtwittman@sbcglobal.net','$2y$10$v93uz6WRxhwXb09eYeD7XuezcoALo18fMLnA5QxCl6RZGZpYrcPKa',NULL,NULL,'925-683-8291',0,''),(197,'Candy','Mowery','candymowery44@gmail.com','$2y$10$ESlfkZB/YLtzaAQ29D2oHutvPfX0YVgLnwrfkC2V1bncA.zhFZuRe',NULL,NULL,'719-660-6376',0,''),(198,'Charlie','Brown','cbrown41@comcast.net','$2y$10$KG0VlSVTLxWSr7dldMUK2Oe0cyBd.LK6cNG64YLGLqMo6BpjGwNnO',NULL,NULL,'719-481-3029',0,''),(199,'Scott','Ross','scott@rosses.me','$2y$10$xtJb3BAAdMdIUKG3UbzurOsH.ygw0aTS4.KuytFiLoOUoXY0lBKpe',NULL,NULL,'719-661-9078',0,''),(200,'Benjamin','Bellis Jr.','benbellis@hotmail.com','$2y$10$kJqNMTlYO9Zs5Dz1GUfmSeEUTMCGhu7ERm4r.UJPpmBPnnswzCpGC',NULL,NULL,'671-637-9467',0,''),(201,'Loyd','Mowery','loydandcandy@gmail.com','$2y$10$fYBboseiN/T1KjdSlcBJUecoB7yJjUcKJ7OBSYajz.Lp2hbbBO/oi',NULL,NULL,'719-660-4620',0,''),(202,'Jim','Wolf','akwlfpck@gmail.com','$2y$10$cC9IXkIeEx5PP/G9bXHHN.99LfKU2SFAOwJcwJMCRFj6qYPh8t0u.',NULL,NULL,'804-704-2532',0,''),(203,'Paul','Gourley','pgourley53@yahoo.com','$2y$10$jorN5SvEcw1Fr4.9qRPYreeGXLB1QCFoNXoeSdHbRRJ0OuM0bd3hC',NULL,NULL,'307-630-2958',0,''),(204,'Doni','Gourley','dkgsnoopy@yahoo.com','$2y$10$sd2woJ46EyWIcX7UExphJu28rjPdd33r.EnKcpLCkL3tQCOucjFtu',NULL,NULL,'307-630-2491',0,''),(205,'Gene','Jones','mgenejones@gmail.com','$2y$10$vlINczzyfPutJzZOJQipDOTVcmGsmZatLhR1VGMvkAvls7B7USDPq',NULL,NULL,'719-354-3919',0,''),(206,'Ofie','Lopez','ofielopez@yahoo.com','$2y$10$TNBqFMPktsxxfSeZE2VSGOkS6Vj5P49aVTyAKp7189/Z0R.FNwA2u',10339729677,'2023-11-04 16:49:08','719-487-9989',0,''),(207,'Heidi','Baker','bakerheidi58@gmail.com','$2y$10$MreyI7IqPRVIqsRk.8YqMef.l7PuOTzX2.ENA7NyjehP464OECCXC',NULL,NULL,'860-208-7075',0,''),(208,'Rich','Hicks','rich7100@comcast.net','$2y$10$JldNQBjkxrTYVGOcNLxjFe2XcVt1O7dH2V75f3ci0LqdMduixxFTi',NULL,NULL,'719-440-7536',0,''),(209,'Joe','Kneedler','kneedlerjoe33@gmail.com','$2y$10$8AWu5rhgEZBjOw0TVhLO1.fjo6ZjD3007CF7.L/pyftgDxpqaaJhO',NULL,NULL,'832-776-5446',0,''),(210,'Cay','Price','cayprice@gmail.com','$2y$10$oV/flQxpEzpd4YfsQycyR.IcPFC/RJkj/.e1PAlHyrnowHrifv75u',NULL,NULL,'832-444-3925',0,''),(211,'Gregb','Bielanski','gbielanski@msn.com','$2y$10$FxBEoYyUUBdpPrFjtruqx.xzAMd6dWK872z9WR2I1MuVFFovB70LC',NULL,NULL,'719-761-1875',0,''),(212,'Harry','Brandon','harry.brandon@gmail.com','$2y$10$cFmCKxZx45IWHzC.oY4hZO8nf3b0ym6krVQn6yxds4hpGf6Jw97.i',NULL,NULL,'303-512-3198',0,''),(213,'Sue','Reinecke','sereinecke@msn.com','$2y$10$8H.mzqIVITD6RbDlTdhZJeQrS9Q2tk2CWr2JeuBQuq17PErMJIvg6',NULL,NULL,'719-661-2911',0,''),(214,'Jack','Fry','fryjack@aol.com','$2y$10$hePmeQOB6FMFER4pLG0h/u4CIXD2qWSfn1JgbW4zp5XNOlOBZ28qq',NULL,NULL,'719-339-8456',0,''),(215,'Pete','Peterson','pete80132@gmail.com','$2y$10$SCluzeXnaTyMkcv0ydJfZ.Ks9Do18qC2t9P7KXcZhmXSOdyfqxex.',NULL,NULL,'714-271-5947',0,'');
/*!40000 ALTER TABLE `ringers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE TRIGGER `delete_from_schedule_after_ringer`
BEFORE DELETE ON `ringers` FOR EACH ROW delete from schedule where ringer = old.id *;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ringing_days`
--

DROP TABLE IF EXISTS `ringing_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ringing_days` (
  `active_ringing_day` date NOT NULL,
  UNIQUE KEY `idx_active_ringing_day` (`active_ringing_day`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ringing_days`
--

LOCK TABLES `ringing_days` WRITE;
/*!40000 ALTER TABLE `ringing_days` DISABLE KEYS */;
INSERT INTO `ringing_days` VALUES ('2023-11-24'),('2023-11-25'),('2023-11-26'),('2023-11-29'),('2023-12-02'),('2023-12-03'),('2023-12-06'),('2023-12-09'),('2023-12-10'),('2023-12-13'),('2023-12-16'),('2023-12-17'),('2023-12-20'),('2023-12-22'),('2023-12-23'),('2023-12-24');
/*!40000 ALTER TABLE `ringing_days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `dt` date NOT NULL,
  `slot` smallint(6) NOT NULL,
  `ringer` smallint(11) NOT NULL,
  `location` smallint(11) NOT NULL,
  UNIQUE KEY `Unique Index` (`dt`,`slot`,`location`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES ('2023-11-26',500,167,300),('2023-11-26',100,167,300),('2023-11-26',200,167,300),('2023-11-26',300,167,300),('2023-11-26',400,167,300),('2023-11-26',600,167,300),('2023-11-26',700,167,300),('2023-12-03',50,167,300),('2023-12-03',100,167,300),('2023-12-03',200,167,300),('2023-12-03',300,167,300),('2023-12-03',400,167,300),('2023-12-03',500,167,300),('2023-12-03',600,167,300),('2023-12-03',700,167,300),('2023-12-10',50,167,300),('2023-12-10',100,167,300),('2023-12-10',200,167,300),('2023-12-10',300,167,300),('2023-12-10',400,167,300),('2023-12-10',500,167,300),('2023-12-10',600,167,300),('2023-12-10',700,167,300),('2023-12-17',50,167,300),('2023-12-17',100,167,300),('2023-12-17',200,167,300),('2023-12-17',300,167,300),('2023-12-17',400,167,300),('2023-12-17',500,167,300),('2023-12-17',600,167,300),('2023-12-17',700,167,300),('2023-11-24',900,169,200),('2023-11-25',900,169,200),('2023-11-26',900,169,200),('2023-11-29',900,169,200),('2023-12-02',900,169,200),('2023-12-03',900,169,200),('2023-12-06',900,169,200),('2023-12-09',900,169,200),('2023-12-10',900,169,200),('2023-12-13',900,169,200),('2023-12-16',900,169,200),('2023-12-17',900,169,200),('2023-12-20',900,169,200),('2023-12-22',900,169,200),('2023-12-23',900,169,200),('2023-12-24',900,169,200),('2023-11-26',50,167,300),('2023-12-20',500,188,100),('2023-12-13',500,188,100),('2023-12-24',800,190,100),('2023-12-20',400,185,200),('2023-12-20',300,185,200),('2023-12-20',200,185,200),('2023-12-20',100,185,200),('2023-12-13',600,185,200),('2023-12-13',500,185,200),('2023-12-13',400,185,200),('2023-12-13',300,185,200),('2023-12-13',200,185,200),('2023-12-13',100,185,200),('2023-12-06',800,185,200),('2023-12-06',700,185,200),('2023-12-06',600,185,200),('2023-12-06',500,185,200),('2023-12-06',400,185,200),('2023-12-06',300,185,200),('2023-11-29',400,185,200),('2023-12-10',900,184,100),('2023-12-10',800,184,100),('2023-11-24',400,209,200),('2023-11-29',800,184,100),('2023-11-29',900,184,100),('2023-11-29',100,185,200),('2023-11-26',900,184,100),('2023-11-26',800,184,100),('2023-11-29',800,185,200),('2023-11-29',700,185,200),('2023-11-29',600,185,200),('2023-12-02',900,179,100),('2023-12-06',900,179,100),('2023-12-09',900,179,300),('2023-11-24',900,180,100),('2023-11-24',700,180,100),('2023-11-24',800,180,100),('2023-12-03',900,180,100),('2023-12-03',700,180,100),('2023-12-03',800,180,100),('2023-12-13',700,180,100),('2023-12-13',800,180,100),('2023-12-13',900,180,100),('2023-11-24',700,181,200),('2023-11-24',800,181,200),('2023-12-03',700,181,200),('2023-12-03',800,181,200),('2023-12-13',700,181,200),('2023-12-13',800,181,200),('2023-11-29',500,185,200),('2023-11-29',200,185,200),('2023-11-29',300,185,200),('2023-12-24',800,187,300),('2023-12-20',800,185,200),('2023-12-20',700,185,200),('2023-12-20',600,185,200),('2023-12-06',200,185,200),('2023-12-06',100,185,200),('2023-12-20',500,185,200),('2023-12-02',50,182,300),('2023-12-02',100,182,300),('2023-12-02',200,182,300),('2023-12-02',300,182,300),('2023-12-02',400,182,300),('2023-12-02',500,182,300),('2023-12-02',600,182,300),('2023-12-02',700,182,300),('2023-12-24',50,184,100),('2023-11-24',600,191,300),('2023-11-29',600,191,300),('2023-12-06',600,191,300),('2023-12-13',600,191,300),('2023-12-20',600,191,300),('2023-12-22',600,191,300),('2023-11-29',100,193,100),('2023-11-29',400,195,100),('2023-12-06',200,195,100),('2023-11-24',50,194,200),('2023-12-13',200,195,100),('2023-12-20',200,195,100),('2023-12-22',700,195,100),('2023-11-25',100,194,300),('2023-11-24',100,194,200),('2023-11-25',200,194,300),('2023-12-16',900,196,100),('2023-12-20',900,196,100),('2023-11-25',100,197,100),('2023-11-24',100,199,100),('2023-11-24',50,199,100),('2023-12-22',100,198,300),('2023-11-29',200,197,100),('2023-12-06',500,198,300),('2023-12-20',100,198,300),('2023-12-24',100,197,100),('2023-11-29',600,199,100),('2023-11-29',700,199,100),('2023-12-06',50,199,100),('2023-12-06',100,199,100),('2023-12-13',50,199,100),('2023-12-13',100,199,100),('2023-12-20',50,199,100),('2023-12-20',100,199,100),('2023-12-24',700,199,100),('2023-11-25',400,189,100),('2023-11-25',500,189,100),('2023-11-26',400,189,100),('2023-11-26',500,189,100),('2023-12-03',400,189,100),('2023-12-03',500,189,100),('2023-12-06',400,189,100),('2023-12-06',500,189,100),('2023-12-17',400,189,100),('2023-12-17',500,189,100),('2023-11-24',500,200,200),('2023-11-24',600,200,200),('2023-11-25',200,200,200),('2023-11-25',300,200,200),('2023-11-26',400,200,200),('2023-11-26',500,200,200),('2023-12-02',100,1,200),('2023-12-06',300,1,100),('2023-11-25',200,201,100),('2023-11-29',300,201,100),('2023-12-24',200,201,100),('2023-12-02',400,204,200),('2023-12-02',400,203,100),('2023-12-03',600,204,200),('2023-12-03',600,203,100),('2023-11-25',600,205,100),('2023-11-25',700,205,100),('2023-11-26',600,205,100),('2023-11-26',700,205,100),('2023-11-29',500,205,100),('2023-12-06',600,205,100),('2023-12-06',700,205,100),('2023-12-09',200,205,100),('2023-12-09',300,205,100),('2023-12-13',300,205,100),('2023-12-13',400,205,100),('2023-12-16',100,205,100),('2023-12-16',200,205,100),('2023-12-20',300,205,100),('2023-12-20',400,205,100),('2023-11-24',700,208,300),('2023-11-24',800,208,300),('2023-11-24',900,208,300),('2023-12-20',500,212,300),('2023-12-13',500,212,300),('2023-12-02',800,208,300),('2023-12-02',900,208,300),('2023-12-22',500,212,300),('2023-11-29',500,212,300),('2023-12-10',300,209,200),('2023-12-16',100,209,200),('2023-12-02',100,211,100),('2023-12-06',50,211,300),('2023-12-09',100,211,100),('2023-12-13',50,211,300),('2023-12-16',50,211,100),('2023-12-20',50,211,300),('2023-12-23',50,211,100),('2023-11-24',200,213,100),('2023-11-25',100,213,200),('2023-11-26',100,213,100),('2023-12-03',300,213,100),('2023-12-24',50,213,300),('2023-12-17',100,213,200),('2023-12-10',200,213,100),('2023-11-29',400,213,300),('2023-11-29',300,214,300),('2023-12-16',300,214,300);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `swaps`
--

DROP TABLE IF EXISTS `swaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swaps` (
  `swapId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `requesterId` smallint(11) unsigned NOT NULL,
  `requesterSlotId` smallint(11) unsigned NOT NULL,
  `requesterLocationId` smallint(11) unsigned NOT NULL,
  `requesterDate` date NOT NULL,
  `requesteeId` smallint(11) unsigned NOT NULL,
  `requesteeSlotId` smallint(11) unsigned NOT NULL,
  `requesteeLocationId` smallint(11) unsigned NOT NULL,
  `requesteeDate` date NOT NULL,
  `swapStatus` enum('A','D','N') NOT NULL DEFAULT 'N' COMMENT 'A=Accepted, D=declined, N=No status ',
  PRIMARY KEY (`swapId`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `swaps`
--

LOCK TABLES `swaps` WRITE;
/*!40000 ALTER TABLE `swaps` DISABLE KEYS */;
INSERT INTO `swaps` VALUES (1,60,800,300,'2019-12-16',124,900,300,'2019-12-16','N'),(2,60,800,300,'2019-12-16',124,900,300,'2019-12-16','N'),(3,60,800,300,'2019-12-16',124,900,300,'2019-12-16','N');
/*!40000 ALTER TABLE `swaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeslots`
--

DROP TABLE IF EXISTS `timeslots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeslots` (
  `id` smallint(11) NOT NULL,
  `time` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeslots`
--

LOCK TABLES `timeslots` WRITE;
/*!40000 ALTER TABLE `timeslots` DISABLE KEYS */;
INSERT INTO `timeslots` VALUES (100,'10 AM to 11 AM'),(200,'11 AM to 12 Noon'),(300,'12 Noon to 1 PM'),(400,'1 PM to 2 PM'),(500,'2 PM to 3 PM'),(600,'3 PM to 4 PM'),(700,'4 PM to 5 PM'),(800,'5 PM to 6 PM'),(900,'6 PM $$ Pickup'),(50,'9 AM to 10 AM');
/*!40000 ALTER TABLE `timeslots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_individual_schedule`
--

DROP TABLE IF EXISTS `v_individual_schedule`;
/*!50001 DROP VIEW IF EXISTS `v_individual_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_individual_schedule` AS SELECT
 1 AS `Date`,
  1 AS `Day`,
  1 AS `Name`,
  1 AS `Time`,
  1 AS `Location`,
  1 AS `ringer` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_schedule`
--

DROP TABLE IF EXISTS `v_schedule`;
/*!50001 DROP VIEW IF EXISTS `v_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_schedule` AS SELECT
 1 AS `dt`,
  1 AS `slot`,
  1 AS `ringer`,
  1 AS `location`,
  1 AS `fname`,
  1 AS `lname`,
  1 AS `email`,
  1 AS `password`,
  1 AS `interval`,
  1 AS `location_name` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_schedule_with_phone`
--

DROP TABLE IF EXISTS `v_schedule_with_phone`;
/*!50001 DROP VIEW IF EXISTS `v_schedule_with_phone`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_schedule_with_phone` AS SELECT
 1 AS `dt`,
  1 AS `slot`,
  1 AS `ringer`,
  1 AS `location`,
  1 AS `fname`,
  1 AS `lname`,
  1 AS `email`,
  1 AS `password`,
  1 AS `phone`,
  1 AS `interval`,
  1 AS `location_name` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_individual_schedule`
--

/*!50001 DROP VIEW IF EXISTS `v_individual_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`monumen8`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_individual_schedule` AS select `v_schedule`.`dt` AS `Date`,dayname(`v_schedule`.`dt`) AS `Day`,concat(`v_schedule`.`fname`,' ',`v_schedule`.`lname`) AS `Name`,`v_schedule`.`interval` AS `Time`,`v_schedule`.`location_name` AS `Location`,`v_schedule`.`ringer` AS `ringer` from `v_schedule` where `v_schedule`.`dt` >= curdate() order by `v_schedule`.`dt`,`v_schedule`.`interval` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_schedule`
--

/*!50001 DROP VIEW IF EXISTS `v_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`monumen8`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_schedule` AS select `s`.`dt` AS `dt`,`s`.`slot` AS `slot`,`s`.`ringer` AS `ringer`,`s`.`location` AS `location`,`r`.`fname` AS `fname`,`r`.`lname` AS `lname`,`r`.`email` AS `email`,`r`.`password` AS `password`,`t`.`time` AS `interval`,`L`.`location_name` AS `location_name` from (((`schedule` `s` left join `ringers` `r` on(`s`.`ringer` = `r`.`id`)) left join `timeslots` `t` on(`s`.`slot` = `t`.`id`)) left join `locations` `L` on(`s`.`location` = `L`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_schedule_with_phone`
--

/*!50001 DROP VIEW IF EXISTS `v_schedule_with_phone`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_schedule_with_phone` AS select `s`.`dt` AS `dt`,`s`.`slot` AS `slot`,`s`.`ringer` AS `ringer`,`s`.`location` AS `location`,`r`.`fname` AS `fname`,`r`.`lname` AS `lname`,`r`.`email` AS `email`,`r`.`password` AS `password`,`r`.`phone` AS `phone`,`t`.`time` AS `interval`,`L`.`location_name` AS `location_name` from (((`schedule` `s` left join `ringers` `r` on(`s`.`ringer` = `r`.`id`)) left join `timeslots` `t` on(`s`.`slot` = `t`.`id`)) left join `locations` `L` on(`s`.`location` = `L`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-07  1:30:02