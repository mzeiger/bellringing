/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.26-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: monumen8_bellringing
-- ------------------------------------------------------
-- Server version	10.5.26-MariaDB-cll-lve

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
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
  `title` varchar(50) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  UNIQUE KEY `listing_order` (`listing_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` VALUES (1,'Manager','Jeff','Baker','wjeffreybaker@gmail.com','860-989-8881'),(2,'Asst. Manager','Mark','Zeiger','mark.zeiger@gmail.com','719-494-7718'),(3,'Store Manager - King Soopers',NULL,NULL,NULL,NULL),(4,'Store Manager - Walmart',NULL,NULL,NULL,NULL);
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
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
  `phone` char(13) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `forgot_pwd_code` bigint(13) DEFAULT NULL,
  `forgot_pwd_time` datetime DEFAULT NULL,
  `administrator` tinyint(1) NOT NULL DEFAULT 0,
  `Comments` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_2` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=465 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ringers`
--

LOCK TABLES `ringers` WRITE;
/*!40000 ALTER TABLE `ringers` DISABLE KEYS */;
INSERT INTO `ringers` VALUES (404,'Mark','Zeiger','mark.zeiger@gmail.com','719-494-7718','$2y$10$QXnk7.UHRzNlJsWnkNUuaeJtKqNMDi5flyskjn82R4fpc6apXMd4.',NULL,NULL,0,''),(406,'Tri-Lakes','Womans Club','tlwc@gmail.com','111-111-1111','$2y$10$KC0ZjiGretedr4uDmlfeo.TRVfbRiIpenQxC.y1SZJpOC0i0KOH0y',NULL,NULL,0,''),(419,'Lewis-Palmer','Middle School','danglopez+1@msn.com','719-358-1017','$2y$10$tv4v1Je1cg77WQYTuqyLd.XrKNbe6.UWE5ww3G8YjrTeuCdTnUi/u',NULL,NULL,0,''),(408,'Same as','East Door','no-reply@noreply.xxx','222-222-2222','$2y$10$SSscaWoduozPw7MwX25MU.b3Df3t983TKmSSBviwjte0IVidLNsAm',NULL,NULL,1,''),(409,'Slot','Canceled','canceled@noreply.com','222-222-2222','$2y$10$A8vUHn51VDrGiWEuTu8ZIuXK0alf7onyHA9oWXEOObFSqkbuyk0SG',NULL,NULL,1,''),(410,'Special Pickup','Time','specialpickup@noreply.noreply','222-222-2222','$2y$10$wBkgXTHghNgOgm/WW5rDjOXv3HU4ey.frJ8Ag7nFKTQ7Vdm5deWAq',NULL,NULL,1,''),(411,'Jill','Markworth','jmarkworth@comcast.net','719-641-0299','$2y$10$PeswB3T8jtjSERza/BeQNOx5Ubcc/XWjW9KVgCAWvNvEISttUoepS',NULL,NULL,0,''),(420,'Key','Club','mike.luginbuhl+1@comcast.net','719-313-8532','$2y$10$dRtVWT/JLJtmJ/980Qp8GuXFDMc8CnQ2l5rmd8HpajTRNYTcNCn66',NULL,NULL,0,''),(424,'William','Baker','wjeffreybaker@gmail.com','860-989-8881','$2y$10$ls4sUywljyjKLotD6g2j4u2NpVLg706k3oFIwwj7sDwQKcEU/F/XK',NULL,NULL,0,''),(422,'Daniel','Lopez','danglopez@msn.com','719-358-1017','$2y$10$o1bw6aSWpPKDeV0L1T58VeRNXxhB34h/dRcf/MURKx7hnJ5nRAcOy',NULL,NULL,0,''),(423,'Heidi','Baker','bakerheidi58@gmail.com','860-208-7075','$2y$10$WiaFSeZnk1QarkecN2mYjOSlmMedar.mqmwN1hU9FvPgD0x2sQDQ.',NULL,NULL,0,''),(425,'Dennis','Beasley','pdcbcos@gmail.com','719-208-9569','$2y$10$WUmbqtlKbYwS9YIDoki8BuHkYC4ggXLW49khYxywis/yK1O9ogluu',NULL,NULL,0,''),(426,'Joe','Kneedler','kneedlerjoe33@gmail.com','832-776-5446','$2y$10$eORJ8kw7B3OaiP51bq0H6O/VOF0sHFT9BRGW7ppalkJQsl/HUBBvO',NULL,NULL,0,''),(427,'Cay','Price','cayprice@gmail.com','832-444-3925','$2y$10$hBGjwEa/5Ks3xRRSD9/lIOJasmaF6Phpe/6q6lqjb1diDyflYxaXG',NULL,NULL,0,''),(428,'Ronald','Mangiarelli','nonnon@mangiarelli.com','719-331-9941','$2y$10$SW9ave7s15DrOGfYoBTLFObVFU6Ykk92i3AVn/4RKCgwx/CwKeaem',NULL,NULL,0,''),(429,'Charles','Brown','cbrown41@comcast.net','719-433-6626','$2y$10$Cx1iI/092xSCUE9AgTTLcuH9Zv0WKYmcMiRcwCOu8F2EJzcsAxUV.',NULL,NULL,0,''),(430,'Richard','Hicks','rich7100@comcast.net','719-440-7536','$2y$10$WDjZKmp9Tw5YQywfmF8kH.8BH5RpslevGdckX0pSd/v2xN/E71g/2',NULL,NULL,0,''),(431,'Bill','Kaelin','williamkaelin@gmail.com','719-964-1037','$2y$10$FDWfY5dOUL5ciyWa2zjhU.oq1/oB59IngGxuHC4snFsnhAnoPHfmi',NULL,NULL,0,''),(432,'Howard Jack','Fry','hjfry67@gmail.com','719-339-8456','$2y$10$yyqzoYI9RpYy4kLNm1R0je6EBd6udxYTatQdVn/3Q0EbbSjLM2Qzy',NULL,NULL,0,''),(433,'Susan','Leggiero','sleggie26@me.com','719-440-8969','$2y$10$euBxh8jM86mij1UPjYd8Vu1wShMZ6AfkCCPCaNBCD15DHInDkErXi',NULL,NULL,0,''),(434,'Ed','Tomlinson','etomlinson24@comcast.net','719-650-3522','$2y$10$aWMG//MHx9FYbIvrQhNv5OVhudNnEOaje7Vwq11CgzohzLx.aDEfa',NULL,NULL,0,''),(435,'Chuck','Leggiero','ramcoach26@me.com','719-440-8970','$2y$10$H/IAQ/cLwXIjpNfQM11P4.FIadSvsw5T0PBuKPr3I7h76Yi8qZgjy',NULL,NULL,0,''),(436,'Scott','Ross','scott@rosses.me','719-661-9078','$2y$10$XoVfHcuB9/54sBQvQywTEedJAGtGZ3yIrSeKBhpjWzk.jcEZlZ71O',NULL,NULL,0,''),(437,'Bob','Harrigan','bobharrigan@me.com','847-902-7664','$2y$10$JiP3OzTqLQCB3IPUQaRRH.BY.f1Ld5FAPBGMR9WskUG/ukYMNWMe.',NULL,NULL,0,''),(438,'RF','Smith','rff106k@gmail.com','719-210-4987','$2y$10$mpiP3Z0.SGzUKJfK/.HCPeXKLkYvdN./Fj1/XCenKA6mVE77908xi',NULL,NULL,0,''),(439,'James','Murphy','patt.and.jim@gmail.com','719-487-9327','$2y$10$dB7J2h2xkdT39odi75gUEeZp80flV3tBFLO8xl8ycJB.TwSpexiEy',NULL,NULL,0,''),(440,'Ben','Bellis','benbellis@hotmail.com','671-637-9467','$2y$10$2rD0hOJfFjBcnkvZ7dD7kO1tx0LMBC.zld8I4F9Sg86026XRrdee2',NULL,NULL,0,''),(441,'Chris','Kupko','kupkofamily@gmail.com','719-661-4926','$2y$10$5s1/aOSb4KyXZZRJmUM2euIrA5tjuGGN/W4X9wmmedKCh2Z.Li96W',NULL,NULL,0,''),(442,'Jim','Wolf','akwlfpck@gmail.com','804-704-2532','$2y$10$prq1d7Rs2gdb3waZTPxGq.QhN85bqAu2ZUbUXiQo9.MJxXDZEw4om',NULL,NULL,0,''),(443,'Mike','Luginbuhl','mike.luginbuhl@comcast.net','719-313-8532','$2y$10$PNnaKvzutYoNz3zszIBEmO03JWss.xicjuiZ909sNHA2bU33hPhFi',NULL,NULL,0,''),(444,'Dave','Collins','davecollins@cc-logic.com','719-413-7374','$2y$10$jeArabVlEWWDa3xMnDeTCu1ZFMYCkurYm8vYWwQXKwYwoBEl/DMrW',NULL,NULL,0,''),(445,'Sue','Reinecke','sereinecke@msn.com','719-661-2911','$2y$10$1AzKzyXPUDZnqENMy3gsn.Vezq6jbRjRkCVKvXJ6RMFL5tOsKi3iC',NULL,NULL,0,''),(446,'Dave','Bailey','daveb@baileyassociates.us','408-821-5121','$2y$10$fMzQkEows421CLO2SgppleGPTV6ybftUx00LRNuDVqI8Yd0Tzu7AK',NULL,NULL,0,''),(448,'Ted','Bauman','mr2ba1024@aol.com','719-331-7673','$2y$10$A5xpcbpDje/vRBw5QkprDeBXtqcG0IqtQQiWmWkII6hZfZozcaqGW',NULL,NULL,0,''),(447,'Mark','Anderson','mark@marksmywords.com','719-339-7053','$2y$10$h30QYYG0gFLBaGWzc5EP1uHr.ehE/N8sky5l4VKL7V55Rld3I.rku',NULL,NULL,0,''),(449,'Jim','Head','jhhead@comcast.net','719-510-2941','$2y$10$w52F09ITP6N.t8SLtKF.5ujhMshZ3FN8K5Zc20pscXfCfpo1/I9xW',NULL,NULL,0,''),(450,'Robert','Knoth','r.l.r.knoth@gmail.com','719-650-9897','$2y$10$7ABKPw6lc/c6sQdqdRfIT.Og1wolZOp5qWmdMo/HwOmHEZRjpLe3e',NULL,NULL,0,''),(451,'Larry','Young','llyoung610@gmail.com','360-355-6485','$2y$10$RGPc7YzknPAvlqekmZSD1.4UHph70.YRj1gtDzOonw5NC3pZE0McS',NULL,NULL,0,''),(452,'Paul','Gourley','pgourley53@yahoo.com','307-630-2958','$2y$10$LPbGrDCYtoAJrsDVHYJ/r.NhiqYceterBkhJlCadLW62D833AtBVC',NULL,NULL,0,''),(453,'Alan','Thompson','mustangthompson@verizon.net','310-612-1220','$2y$10$3n.UV43Qtgy8zzB0F.G5Lu8G67yDO2BXSGRRqQZU7bqStrHDHJsZ6',NULL,NULL,0,''),(455,'Doni','Gourley','dkgsnoopy@yahoo.com','307-630-2491','$2y$10$rXuxiKdEAi7GvQiLaZ.Ob.7aqR1ATHJhBhboeCi1Zr9ZyUbYbB0lS',NULL,NULL,0,''),(456,'Larry','Vliet','lv8014@comcast.net','719-761-3118','$2y$10$XtHHhO1zyPjicZUv.z6BweUQJaGkdVmMVQYHM7bVObieTsQEnDrym',NULL,NULL,0,''),(457,'Paul','Baker','2bakerz@comcast.net','719-502-7256','$2y$10$tVDLvvQYVV51LqJHhCw9N.6ilT/wfAUuAwAYyrHmI0eC3KMgQ6LVi',NULL,NULL,0,''),(458,'Ofie','Lopez','ofielopez@yahoo.com','719-487-9989','$2y$10$zFjbuVX2K4RfjCnxBd5Xz.yrHCwn2Ln8.QDeYlwr9yVfeLbmDyvqa',NULL,NULL,0,''),(459,'Pete','Peterson','pete80132@gmail.com','714-271-5947','$2y$10$lkBbJsR1ELacrSmku8D1deFwrigswrNspZl/4oKk5QqwTXG590jre',NULL,NULL,0,''),(460,'Benny','Nasser','benasser19r@gmail.com','719-488-3189','$2y$10$tM.U1nRQL6f/Dw8CBwHl4eNSc0GBQqvlOJNX6CAeiKTfpIqfID89u',NULL,NULL,0,''),(461,'Dean','Snow','dean.snow@gmail.com','719-351-8528','$2y$10$cqGGVn7QFSM9GzDAw6XLbud5/qNuUKh7VHPyCuG5jz7tG4Zkjdd3e',NULL,NULL,0,''),(462,'Richard','Strom','rsappraisals_6@msn.com','719-963-4464','$2y$10$ddpHUfoqlo0036jgRMVFRujDDI5/spXa8E1czyWzwOOYLHTi9Zfrm',NULL,NULL,0,''),(463,'Frank','DeLalla','fdelalla@aol.com','719-339-3567','$2y$10$2wMQBWY21loNXUswK5iJ5uNsas5eK4rASeHm3n6PL8LFRfnU5Wjui',NULL,NULL,0,''),(464,'Markus','Galle','mark.galle@spartanxcorp.com','719-231-7257','$2y$10$LhoceSeurCE0QRKN68T34OT3clsx/4AA7coRjKFxmI4tM77a9Jyb6',NULL,NULL,0,'');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_from_schedule_after_ringer` BEFORE DELETE ON `ringers` FOR EACH ROW delete from schedule where ringer = old.id */;;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ringing_days`
--

LOCK TABLES `ringing_days` WRITE;
/*!40000 ALTER TABLE `ringing_days` DISABLE KEYS */;
INSERT INTO `ringing_days` VALUES ('2025-11-28'),('2025-11-29'),('2025-11-30'),('2025-12-03'),('2025-12-06'),('2025-12-07'),('2025-12-10'),('2025-12-13'),('2025-12-14'),('2025-12-17'),('2025-12-20'),('2025-12-21'),('2025-12-23'),('2025-12-24');
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES ('2025-12-03',50,406,200),('2025-12-03',100,406,200),('2025-12-03',200,406,200),('2025-12-03',300,406,200),('2025-12-03',400,406,200),('2025-12-03',500,406,200),('2025-12-03',600,406,200),('2025-12-03',700,406,200),('2025-12-03',800,406,200),('2025-12-10',50,406,200),('2025-12-10',100,406,200),('2025-12-10',200,406,200),('2025-12-10',300,406,200),('2025-12-10',400,406,200),('2025-12-10',500,406,200),('2025-12-10',600,406,200),('2025-12-10',700,406,200),('2025-12-10',800,406,200),('2025-12-17',50,406,200),('2025-12-17',100,406,200),('2025-12-17',200,406,200),('2025-12-17',300,406,200),('2025-12-17',400,406,200),('2025-12-17',500,406,200),('2025-12-17',600,406,200),('2025-12-17',700,406,200),('2025-12-17',800,406,200),('2025-12-21',800,420,300),('2025-12-21',700,420,300),('2025-12-21',600,420,300),('2025-12-21',500,420,300),('2025-12-21',400,420,300),('2025-12-21',300,420,300),('2025-12-21',200,420,300),('2025-12-21',100,420,300),('2025-12-21',50,420,300),('2025-11-28',900,408,200),('2025-11-29',900,408,200),('2025-11-30',900,408,200),('2025-12-03',900,408,200),('2025-12-06',900,408,200),('2025-12-07',900,408,200),('2025-12-10',900,408,200),('2025-12-13',900,409,200),('2025-12-14',900,409,200),('2025-12-17',900,408,200),('2025-12-20',900,408,200),('2025-12-21',900,408,200),('2025-12-23',900,408,200),('2025-12-24',700,408,200),('2025-12-24',800,409,300),('2025-12-24',900,439,300),('2025-12-24',800,409,200),('2025-12-24',800,409,100),('2025-12-24',900,439,100),('2025-12-24',900,408,200),('2025-12-24',700,439,100),('2025-12-24',400,435,100),('2025-12-14',800,420,300),('2025-12-14',700,420,300),('2025-12-14',600,420,300),('2025-12-14',500,420,300),('2025-12-14',400,420,300),('2025-12-14',300,420,300),('2025-12-14',200,420,300),('2025-12-14',100,420,300),('2025-12-14',50,420,300),('2025-11-30',800,420,300),('2025-11-30',700,420,300),('2025-11-30',600,420,300),('2025-11-30',500,420,300),('2025-11-30',400,420,300),('2025-11-30',300,420,300),('2025-11-30',200,420,300),('2025-11-30',100,420,300),('2025-11-30',50,420,300),('2025-12-07',800,419,300),('2025-12-07',700,419,300),('2025-12-07',600,419,300),('2025-12-07',500,419,300),('2025-12-07',400,419,300),('2025-12-07',300,419,300),('2025-12-07',200,419,300),('2025-12-07',100,419,300),('2025-12-07',50,419,300),('2025-12-07',900,422,300),('2025-11-30',700,423,200),('2025-12-03',700,423,300),('2025-12-06',700,423,300),('2025-12-07',700,423,200),('2025-12-10',700,409,300),('2025-12-13',700,423,300),('2025-12-14',700,409,200),('2025-12-17',700,423,300),('2025-12-20',700,423,300),('2025-12-21',700,423,200),('2025-12-23',700,423,300),('2025-12-24',500,423,300),('2025-12-06',300,425,300),('2025-12-10',300,425,300),('2025-12-20',300,425,300),('2025-11-29',300,425,300),('2025-11-28',200,426,200),('2025-11-28',300,426,200),('2025-12-24',200,406,200),('2025-12-24',300,406,200),('2025-11-29',200,426,200),('2025-11-30',200,426,200),('2025-11-30',300,426,200),('2025-12-23',700,426,200),('2025-12-20',200,426,200),('2025-12-21',200,426,200),('2025-11-28',300,427,100),('2025-11-28',200,427,100),('2025-11-29',200,427,100),('2025-11-30',300,427,100),('2025-11-30',200,427,100),('2025-12-20',200,427,100),('2025-12-21',200,427,100),('2025-12-17',700,428,100),('2025-12-17',800,428,100),('2025-12-17',900,428,100),('2025-12-20',800,428,100),('2025-12-20',700,428,100),('2025-11-28',700,428,100),('2025-11-28',800,428,100),('2025-11-28',900,428,100),('2025-11-28',200,447,300),('2025-12-06',600,429,300),('2025-12-13',100,429,300),('2025-12-20',100,429,300),('2025-12-23',600,429,300),('2025-12-03',700,428,100),('2025-12-03',800,428,100),('2025-12-03',900,428,100),('2025-11-29',300,404,200),('2025-12-10',100,431,300),('2025-12-17',100,431,300),('2025-12-17',200,432,300),('2025-12-10',200,432,300),('2025-12-03',200,432,300),('2025-11-28',400,436,100),('2025-11-28',500,436,100),('2025-11-29',400,436,100),('2025-11-29',500,436,100),('2025-12-03',50,436,100),('2025-12-03',100,436,100),('2025-12-10',50,436,100),('2025-12-10',100,436,100),('2025-12-17',50,436,100),('2025-12-17',100,436,100),('2025-12-23',50,436,100),('2025-12-23',100,436,100),('2025-11-28',100,437,300),('2025-12-03',100,437,300),('2025-12-06',400,438,100),('2025-12-06',500,438,100),('2025-12-10',400,438,100),('2025-12-10',500,438,100),('2025-12-14',400,409,100),('2025-12-14',500,409,100),('2025-12-17',400,438,100),('2025-12-17',500,438,100),('2025-12-21',400,438,100),('2025-12-21',500,438,100),('2025-12-23',400,438,100),('2025-12-23',500,438,100),('2025-12-07',800,439,100),('2025-12-07',900,439,100),('2025-12-10',800,439,100),('2025-12-10',900,439,100),('2025-12-14',800,409,100),('2025-12-14',900,409,100),('2025-12-21',800,439,100),('2025-12-21',900,439,100),('2025-11-28',400,440,200),('2025-11-28',500,440,200),('2025-11-29',400,440,200),('2025-11-29',500,440,200),('2025-12-10',200,441,100),('2025-12-17',200,441,100),('2025-12-23',200,441,100),('2025-12-24',50,406,200),('2025-12-24',100,406,200),('2025-12-24',400,406,200),('2025-12-24',500,406,200),('2025-12-24',600,406,200),('2025-12-24',200,426,100),('2025-12-24',300,426,100),('2025-11-30',900,443,300),('2025-12-14',900,443,300),('2025-12-21',900,443,300),('2025-11-28',100,443,200),('2025-12-23',800,444,100),('2025-12-03',600,444,100),('2025-12-17',600,444,100),('2025-11-28',100,445,100),('2025-11-29',100,445,100),('2025-11-30',100,445,100),('2025-12-06',100,445,100),('2025-12-07',100,445,100),('2025-12-10',50,445,300),('2025-12-13',100,409,200),('2025-12-14',100,409,100),('2025-12-20',300,446,200),('2025-12-21',400,446,200),('2025-11-28',300,447,300),('2025-11-29',100,447,300),('2025-11-29',200,447,300),('2025-11-30',50,447,200),('2025-11-30',100,447,200),('2025-12-03',400,447,300),('2025-12-03',500,447,300),('2025-12-07',100,447,200),('2025-12-07',200,447,200),('2025-12-10',400,447,300),('2025-12-10',500,447,300),('2025-12-13',200,447,300),('2025-12-13',300,447,300),('2025-12-14',50,409,200),('2025-12-14',100,409,200),('2025-12-17',300,447,300),('2025-12-17',400,447,300),('2025-12-20',400,447,300),('2025-12-20',500,447,300),('2025-12-21',50,447,200),('2025-12-21',100,447,200),('2025-12-23',50,447,300),('2025-12-23',100,447,300),('2025-12-24',50,447,300),('2025-12-24',100,447,300),('2025-11-28',600,434,300),('2025-12-03',600,434,300),('2025-12-10',600,409,300),('2025-12-17',600,434,300),('2025-12-06',50,448,300),('2025-12-10',800,409,300),('2025-12-13',100,409,100),('2025-12-23',800,448,300),('2025-12-10',600,449,100),('2025-12-17',300,449,100),('2025-11-29',50,450,200),('2025-11-29',100,450,200),('2025-11-28',400,450,300),('2025-11-28',500,450,300),('2025-11-29',400,450,300),('2025-11-29',500,450,300),('2025-11-30',400,450,100),('2025-11-30',500,450,100),('2025-12-03',200,450,100),('2025-12-03',300,450,100),('2025-12-07',200,450,100),('2025-12-07',300,450,100),('2025-12-07',700,450,100),('2025-12-10',300,450,100),('2025-12-06',50,450,100),('2025-12-13',400,450,300),('2025-12-13',500,450,300),('2025-12-20',50,450,100),('2025-12-20',100,450,100),('2025-12-21',50,450,100),('2025-12-21',100,450,100),('2025-12-21',600,450,100),('2025-12-21',700,450,100),('2025-12-06',800,450,100),('2025-12-24',200,450,300),('2025-12-24',300,450,300),('2025-12-23',200,450,300),('2025-12-23',300,450,300),('2025-12-20',600,450,300),('2025-12-17',50,450,300),('2025-12-14',300,409,100),('2025-12-14',200,409,100),('2025-12-10',700,450,100),('2025-11-28',50,450,100),('2025-12-23',600,450,100),('2025-12-23',700,450,100),('2025-11-28',800,451,300),('2025-12-17',500,451,300),('2025-12-06',500,451,300),('2025-12-13',600,451,300),('2025-12-23',400,451,300),('2025-11-30',600,451,100),('2025-11-29',600,451,300),('2025-12-03',400,451,100),('2025-12-07',600,451,100),('2025-12-21',500,451,200),('2025-11-28',50,453,300),('2025-12-06',300,455,200),('2025-12-07',400,455,200),('2025-12-13',200,409,200),('2025-12-14',200,409,200),('2025-12-06',300,452,100),('2025-12-07',400,452,100),('2025-12-13',200,409,100),('2025-12-14',300,409,200),('2025-12-20',900,428,100),('2025-12-13',700,409,100),('2025-12-13',800,409,100),('2025-12-13',900,409,100),('2025-12-03',800,424,300),('2025-12-03',900,424,300),('2025-11-30',700,424,100),('2025-12-06',800,424,300),('2025-12-06',900,424,300),('2025-12-20',800,424,300),('2025-12-20',900,424,300),('2025-12-24',500,424,100),('2025-11-30',900,449,100),('2025-11-29',900,449,100),('2025-12-13',300,409,200),('2025-12-13',400,409,200),('2025-12-20',400,456,200),('2025-12-20',500,456,200),('2025-11-29',600,457,100),('2025-12-03',500,457,100),('2025-12-06',600,457,100),('2025-12-13',500,409,200),('2025-12-20',600,457,200),('2025-12-23',900,404,300),('2025-12-07',300,458,200),('2025-12-13',50,409,200),('2025-12-14',400,409,200),('2025-11-28',900,451,300),('2025-11-29',900,451,300),('2025-12-10',900,451,300),('2025-12-06',900,459,100),('2025-12-23',900,459,100),('2025-12-17',900,459,300),('2025-12-13',600,409,100),('2025-11-28',700,460,300),('2025-11-28',700,423,200),('2025-11-29',700,423,200),('2025-12-13',50,409,100),('2025-12-13',300,409,100),('2025-12-13',400,409,100),('2025-12-13',500,409,100),('2025-12-13',600,409,200),('2025-12-13',700,409,200),('2025-12-13',800,409,200),('2025-12-14',50,409,100),('2025-12-14',600,409,100),('2025-12-14',700,409,100),('2025-12-14',500,409,200),('2025-12-14',600,409,200),('2025-12-14',800,409,200),('2025-11-30',500,455,200),('2025-11-30',600,452,200),('2025-11-28',600,424,100),('2025-11-30',400,442,200),('2025-12-07',500,442,200),('2025-12-12',600,409,300),('2025-11-30',800,464,100),('2025-11-29',800,424,300),('2025-11-28',600,430,200);
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
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
-- Temporary table structure for view `v_schedule_with_phone_administrator`
--

DROP TABLE IF EXISTS `v_schedule_with_phone_administrator`;
/*!50001 DROP VIEW IF EXISTS `v_schedule_with_phone_administrator`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_schedule_with_phone_administrator` AS SELECT
 1 AS `dt`,
  1 AS `slot`,
  1 AS `ringer`,
  1 AS `location`,
  1 AS `fname`,
  1 AS `lname`,
  1 AS `email`,
  1 AS `password`,
  1 AS `phone`,
  1 AS `administrator`,
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
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_individual_schedule` AS select `schedule`.`dt` AS `Date`,dayname(`schedule`.`dt`) AS `Day`,concat(`schedule`.`fname`,' ',`schedule`.`lname`) AS `Name`,`schedule`.`interval` AS `Time`,`schedule`.`location_name` AS `Location`,`schedule`.`ringer` AS `ringer` from `v_schedule` where `schedule`.`dt` >= curdate() order by `schedule`.`dt`,`schedule`.`interval` */;
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

--
-- Final view structure for view `v_schedule_with_phone_administrator`
--

/*!50001 DROP VIEW IF EXISTS `v_schedule_with_phone_administrator`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`monumen8`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_schedule_with_phone_administrator` AS select `s`.`dt` AS `dt`,`s`.`slot` AS `slot`,`s`.`ringer` AS `ringer`,`s`.`location` AS `location`,`r`.`fname` AS `fname`,`r`.`lname` AS `lname`,`r`.`email` AS `email`,`r`.`password` AS `password`,`r`.`phone` AS `phone`,`r`.`administrator` AS `administrator`,`t`.`time` AS `interval`,`L`.`location_name` AS `location_name` from (((`schedule` `s` left join `ringers` `r` on(`s`.`ringer` = `r`.`id`)) left join `timeslots` `t` on(`s`.`slot` = `t`.`id`)) left join `locations` `L` on(`s`.`location` = `L`.`id`)) */;
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

-- Dump completed on 2025-11-24  4:07:02
