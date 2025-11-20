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
INSERT INTO `administrators` VALUES (1,'Manager','Mark','Zeiger','mark.zeiger@gmail.com','719-494-7718'),(2,'Asst. Manager','Jeff','Baker','wjeffreybaker@gmail.com','860-989-8881'),(3,'Store Manager - King Soopers','Heidi','Baker','bakerheidi58@gmail.com','860-208-7075'),(4,'Store Manager - Walmart',NULL,NULL,NULL,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=283 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ringers`
--

LOCK TABLES `ringers` WRITE;
/*!40000 ALTER TABLE `ringers` DISABLE KEYS */;
INSERT INTO `ringers` VALUES (1,'Mark','Zeiger','mark.zeiger@gmail.com','$2y$10$AXj.5S36cIABySC76almuuHYRfWKHtkNMGSjs/kHD0sSftpQm0VNG',NULL,NULL,'719-494-7718',1,''),(167,'D-38','Key Clubs','mike.luginbuhl+1@comcast.net','$2y$10$0.HRghoR1zkLEYUagiSzSuPhnAWKZcgiGSqbME/Kr9Vugkud8eham',NULL,NULL,'719-313-8532',0,''),(168,'Susan','Leggiero','sleggie26@me.com','$2y$10$69mnZrMDL4eaSL.J3V8cVuTzDsJ9v5.d3UVeRr2gTt3PeKS3KZMQC',NULL,NULL,'719-440-8969',0,''),(169,'Same as','East Door','sameaseast@noemail.com','$2y$10$Po/8JEQKcbE0kPy2xhpqAOcWFoiLaUtmE.QwM2vnqsj14OxUEOhIC',NULL,NULL,'555-555-5555',0,''),(189,'RF','Smith','rff106k@gmail.com','$2y$10$R2BoCO6Fvjw5eJHRGcc4IetJ832OA4VJp8kNHiHKXmonrvoORUZoa',NULL,NULL,'719-210-4987',0,''),(188,'Chuck','Leggiero','ramcoach26@me.com','$2y$10$Yde8FpJY.hmK4o1ZcERNeu7Yb9kqgr.CWb/70xAjnbjsayrl3QT4i',NULL,NULL,'719-440-8970',0,''),(187,'Max','Williams','mwilliams5866@gmail.com','$2y$10$Z9xspdNIxKHMN21RDPa3QuuLiuttelKLH2J5Od7YNk8nzXNa8WrD2',22491431268,'2023-12-16 15:22:32','719-338-5866',0,''),(186,'Benny','Nasser','benasser19r@gmail.com','$2y$10$gMU93ttkS/jOAcdGPRyHUO6O2HL9x327biQwjpDEUDiqTsn580sZa',NULL,NULL,'719-488-3189',0,''),(184,'James','Murphy','patt.and.jim@gmail.com','$2y$10$j9UKZ88XfTdRmvY9JyNHcuqpxQc3a0dXFhNEZ260p0mterPajd8sG',NULL,NULL,'719-487-9327',0,''),(185,'Tri-Lakes','Women\'s Club','sleggie26+1@me.com','$2y$10$xAXfuUdHlL8HiLnPBcYN3OgBtqGvCcrddbqTXrwDNeAtgnZiYeDSC',NULL,NULL,'719-440-8969',0,''),(179,'Daniel','Lopez','danglopez@msn.com','$2y$10$sQzvy3PjgjjNqM.Lqo5GSOFp.lW06rdQX0hfwJlN3FL/JHARSJQlK',NULL,NULL,'719-358-1017',0,''),(180,'Ron','Mangiarelli','nonnon@mangiarelli.com','$2y$10$yNFpwNHZxUMHnQ/.L7UE1.cb/NLkYeGf5pINtiuotvk9.m7NBSBf.',NULL,NULL,'719-331-9941',0,''),(181,'Sandy','Mangiarelli','sandy@mangiarelli.com','$2y$10$4G.5YHr1OPBmqdTPUXyHUuaJHWyEjd1evlhjY5qcWNJnp0arUAAZ.',NULL,NULL,'719-351-0180',0,''),(182,'Builders','Club','danglopez+1@msn.com','$2y$10$1gLmrfE69IqNXRFcnlZlYuBoXGIAo65kj50akuZScKLU6V9tJJP1W',NULL,NULL,'719-358-1017',0,''),(190,'Sharon','Williams','swilliams9960@gmail.com','$2y$10$OnBeeUtYlmc/e1Pwhyg7GOz56MG2qSznSQrwBIXh7ZKAlESvme5Jy',NULL,NULL,'719-660-9960',0,''),(191,'Ed','Tomlinson','etomlinson24@comcast.net','$2y$10$jrh/aA5PNjHbYtcGJsGWPenK.IzMi4Fo59gtyr3I6pDfNQ57ienq.',NULL,NULL,'719-650-3522',0,''),(192,'Rick','Schoenlein','rjschoenlein@msn.com','$2y$10$LW3VXaC4ti6IgMzJrKBQYOyfSf2oQIgCCqnvlw.pr6mUSRX4iXLVq',NULL,NULL,'317-376-3850',0,''),(193,'Larry','Vliet','lv8014@comcast.net','$2y$10$ZR2af3af7ab7vDJOWIpvPuyQMwUxV00LGkOaLX5F0/256EmxDk49S',NULL,NULL,'719-761-3118',0,''),(194,'Mark','Anderson','mark@marksmywords.com','$2y$10$3Ir5woLED0t7aJ2nLoYw2OnRaH16sAWW7DLw2g2nlTgrWUhWaM6Fe',NULL,NULL,'719-339-7053',0,''),(195,'Chris','Kupko','kupkofamily@gmail.com','$2y$10$c5C/iEZ7CuzoYyKwaR5lVu5pQB5e/49v/1AdrZ0Fztvcd8tRsYigC',NULL,NULL,'719-661-4926',0,''),(196,'Dave','Wittman','dtwittman@sbcglobal.net','$2y$10$v93uz6WRxhwXb09eYeD7XuezcoALo18fMLnA5QxCl6RZGZpYrcPKa',NULL,NULL,'925-683-8291',0,''),(197,'Candy','Mowery','candymowery44@gmail.com','$2y$10$ESlfkZB/YLtzaAQ29D2oHutvPfX0YVgLnwrfkC2V1bncA.zhFZuRe',NULL,NULL,'719-660-6376',0,''),(198,'Charlie','Brown','cbrown41@comcast.net','$2y$10$KG0VlSVTLxWSr7dldMUK2Oe0cyBd.LK6cNG64YLGLqMo6BpjGwNnO',NULL,NULL,'719-481-3029',0,''),(199,'Scott','Ross','scott@rosses.me','$2y$10$xtJb3BAAdMdIUKG3UbzurOsH.ygw0aTS4.KuytFiLoOUoXY0lBKpe',NULL,NULL,'719-661-9078',0,''),(200,'Benjamin','Bellis Jr.','benbellis@hotmail.com','$2y$10$kJqNMTlYO9Zs5Dz1GUfmSeEUTMCGhu7ERm4r.UJPpmBPnnswzCpGC',NULL,NULL,'671-637-9467',0,''),(201,'Loyd','Mowery','loydandcandy@gmail.com','$2y$10$fYBboseiN/T1KjdSlcBJUecoB7yJjUcKJ7OBSYajz.Lp2hbbBO/oi',NULL,NULL,'719-660-4620',0,''),(202,'Jim','Wolf','akwlfpck@gmail.com','$2y$10$cC9IXkIeEx5PP/G9bXHHN.99LfKU2SFAOwJcwJMCRFj6qYPh8t0u.',NULL,NULL,'804-704-2532',0,''),(203,'Paul','Gourley','pgourley53@yahoo.com','$2y$10$jorN5SvEcw1Fr4.9qRPYreeGXLB1QCFoNXoeSdHbRRJ0OuM0bd3hC',NULL,NULL,'307-630-2958',0,''),(204,'Doni','Gourley','dkgsnoopy@yahoo.com','$2y$10$sd2woJ46EyWIcX7UExphJu28rjPdd33r.EnKcpLCkL3tQCOucjFtu',NULL,NULL,'307-630-2491',0,''),(205,'Gene','Jones','mgenejones@gmail.com','$2y$10$vlINczzyfPutJzZOJQipDOTVcmGsmZatLhR1VGMvkAvls7B7USDPq',NULL,NULL,'719-354-3919',0,''),(206,'Ofie','Lopez','ofielopez@yahoo.com','$2y$10$TNBqFMPktsxxfSeZE2VSGOkS6Vj5P49aVTyAKp7189/Z0R.FNwA2u',10339729677,'2023-11-04 16:49:08','719-487-9989',0,''),(207,'Heidi','Baker','bakerheidi58@gmail.com','$2y$10$MreyI7IqPRVIqsRk.8YqMef.l7PuOTzX2.ENA7NyjehP464OECCXC',NULL,NULL,'860-208-7075',0,''),(208,'Rich','Hicks','rich7100@comcast.net','$2y$10$OfBGJ9lSyuSxuts4NR5hY.91DxJIeXeCHpaQ2pdcccFyEOGJp89EG',NULL,NULL,'719-440-7536',0,''),(209,'Joe','Kneedler','kneedlerjoe33@gmail.com','$2y$10$8AWu5rhgEZBjOw0TVhLO1.fjo6ZjD3007CF7.L/pyftgDxpqaaJhO',NULL,NULL,'832-776-5446',0,''),(210,'Cay','Price','cayprice@gmail.com','$2y$10$oV/flQxpEzpd4YfsQycyR.IcPFC/RJkj/.e1PAlHyrnowHrifv75u',NULL,NULL,'832-444-3925',0,''),(211,'Greg','Bielanski','gbielanski@msn.com','$2y$10$FxBEoYyUUBdpPrFjtruqx.xzAMd6dWK872z9WR2I1MuVFFovB70LC',NULL,NULL,'719-761-1875',0,''),(212,'Harry','Brandon','harry.brandon@gmail.com','$2y$10$sIDQilOSzcFjjotGzrM.pOkVHauCw4MUPzhXF0pLz3QpRiDiBWEeS',NULL,NULL,'303-512-3198',0,''),(213,'Sue','Reinecke','sereinecke@msn.com','$2y$10$8H.mzqIVITD6RbDlTdhZJeQrS9Q2tk2CWr2JeuBQuq17PErMJIvg6',NULL,NULL,'719-661-2911',0,''),(214,'Jack','Fry','fryjack@aol.com','$2y$10$hePmeQOB6FMFER4pLG0h/u4CIXD2qWSfn1JgbW4zp5XNOlOBZ28qq',NULL,NULL,'719-339-8456',0,''),(215,'Pete','Peterson','pete80132@gmail.com','$2y$10$7sHSFtLogti175MQ2MTqfeyOJo0WenFEHsm2ivKfSp4zQUdmq/GZO',NULL,NULL,'714-271-5947',0,''),(216,'Mahlon','Lang','mahlon_lang@yahoo.com','$2y$10$WepbM9khov9hPmM.qldjCu0dwfaEqls4v/I2Yw.fmE5HsNEOgBkqK',NULL,NULL,'719-639-0751',0,''),(217,'Jordawna','Bull','cassyj18@hotmail.com','$2y$10$2foCpf4FyzhRVsY2Mb9ynuPvd67tH9hvHGNyoK1Q/GWhx/37xK1L.',NULL,NULL,'719-337-2127',0,''),(218,'John','Alcorn','alcornsalcove@gmail.com','$2y$10$BI2gh.LwcWR0KSIiNCX56OyznIfXFVvcXVQqqI..dnHsdazM4QlvG',NULL,NULL,'719-310-5120',0,''),(219,'Teri','Alcorn','travelagentterialcorn@gmail.com','$2y$10$ZsdMeMSQ9tmPkUnpGWDzcexJNqDNgYNOAvuOJz38RtNmhM1V9BQnG',NULL,NULL,'719-310-5123',0,''),(220,'Dave','Collins','davecollinsjr@centurylink.net','$2y$10$CVfnC..1DmBOuQUkThNHKOnS12V95w0kPClvwzQSzUQBW5AHs89.W',NULL,NULL,'719-426-2205',0,''),(221,'Jeff','Baker','wjeffreybaker@gmail.com','$2y$10$RFd2y8RWy3YsFRSWGbLG1u0DGFtv1WfkYF1FgAyckSarbLSKOZdc.',NULL,NULL,'860-989-8881',0,''),(222,'Mike','Luginbuhl','mike.luginbuhl@comcast.net','$2y$10$D8GZs.Jp75CjsfywrlRXNuqDQ20zWMHUAYtbZTiu/jOMhHS5XpJtm',NULL,NULL,'719-313-8532',0,''),(223,'Chris','Wilson','cwwilson45@yahoo.com','$2y$10$yW3D4TIv0.inAXHW/kfCG.2/BIfYE9RTsejq9OVhSOiRAvbd7MbAe',NULL,NULL,'615-516-3880',0,''),(224,'Christy','Smith','idahochristy@gmail.com','$2y$10$jwY5ARfHYAHQEykRy0XKuu3DDPaYU0vEt7LF2OR8zXmbcshLo1svW',NULL,NULL,'719-722-4644',0,''),(225,'Nicole','Schoolsky','nicoleschoolsky@gmail.com','$2y$10$AFg9ySNZk1irabT3QlhC1u/2AoH20gqUTXgqJvstSgSAVARgWX1a6',NULL,NULL,'619-609-1565',0,''),(226,'Robert','Knoth','r.knoth@comcast.net','$2y$10$af6hC5uLH2Kj99/5N/kIc.VGu9kCRO.D/S6UJatU6Q12uGvzCOzaO',NULL,NULL,'719-488-2565',0,''),(227,'Jim','Head','jhhead@comcast.net','$2y$10$ibmQFOh.Gniacgw8Bz3bFu.G6Uf3HtrhAvMVI5yaGr6qxAxTVNCqi',NULL,NULL,'719-510-2941',0,''),(228,'Tri-Lakes','Rotary','idahochristy+1@gmail.com','$2y$10$EpfnXMU8TFChEmlFqJb1ne5RoWzK0Agr/QiFBmB97vuLnOkOP6ydW',NULL,NULL,'719-722-4644',0,''),(229,'Brian','Bush','bushbx@aol.com','$2y$10$Dv2aic1/FtARLpnMbM6uleSrT8reZpfeu89wSqf2X5YpbPo328/9i',NULL,NULL,'719-649-4538',0,''),(230,'Steve & Anita','Hall','sertomasteve@aol.com','$2y$10$f5GVeoTWlLagOpbKUE.wfeSR6qXXcZDKFToNCEpQpfqpoP.EJF.O.',NULL,NULL,'719-597-9184',0,''),(231,'Robert','Harrigan','bobharrigan@me.com','$2y$10$TiYIviYPOoHrIndKX8NhieZy2UK7kV3dPLZMdFyV0oXs3ypCkWBOu',NULL,NULL,'847-902-7664',0,''),(232,'Larry','Stevens','larryandpatrice@gmail.com','$2y$10$XbreCaBFy54oW6H04wbGlOXl6zj4kTLFvvkWpUhTZoiaEonGOyc2q',NULL,NULL,'719-481-1388',0,''),(233,'Sheila','Ferguson','tennosheela@gmail.com','$2y$10$VdrEx8BDI4iv3GNH.gPd5O3/fN.M6kveIS485J1PpTc/5/PQHwKPu',NULL,NULL,'901-830-7896',0,''),(234,'Bill','Kaelin','williamkaelin@gmail.com','$2y$10$KNZEbsVnoh8OtybKSPN.F.dQ0i7diuYnvT72XqURRCZ5U6qwh9P9y',NULL,NULL,'719-964-1037',0,''),(236,'Thomas','Csrnko','thomas.csrnko@gmail.com','$2y$10$GyqtN2cQYkRe/49v6juN8OdhbnaxJYPQCKBVN2yCL.kBDNmhdUBfG',NULL,NULL,'719-220-0150',0,''),(237,'Grace','Ferguson','howiegrace@yahoo.com','$2y$10$lSWCR5BgYuX66uI8kUecV.wB6xyv1iY2DPuF4.ov2X95vWcxqpRee',NULL,NULL,'719-238-5129',0,''),(238,'Dave','Bailey','daveb@baileyassociates.us','$2y$10$iVi5xEXZTOuaUfMUFLewE.hf3yH/7c60B9ftDfjsQyJ0Owi3UMsPS',NULL,NULL,'408-821-5121',0,''),(239,'Steve','Sutherland','hrxmas@gmail.com','$2y$10$YFr24sKb1PhYRmFRLozVQOoWHLQC.iWnMvyDKAjSHcwMBVAzV73uC',NULL,NULL,'719-488-2205',0,''),(240,'Jerry','Bash','jbash7352@aol.com','$2y$10$n4P.KMZfTGjMUooo9INfne7k3QbMoZAFKW3ZrznCPAD6dOXUJfYVC',NULL,NULL,'719-339-8905',0,''),(241,'Frank','DeLalla','fdelalla@aol.com','$2y$10$gwFK5dnyg1TuGHvVNvyAWOw2d3XgLZeeFohZY4U6NwASVvuhSaHmS',NULL,NULL,'719-339-3567',0,''),(242,'Barbara','Brandon','barb.brandon@rocketmail.com','$2y$10$y0/Ce5XCSCF1TaeaWqw9dO47HASzrz9hWor9XL/spBYCvuqkWwpea',NULL,NULL,'719-375-5538',0,''),(243,'Randy','Vernon','randall_vernon@comcast.net','$2y$10$OUhghkwKiNlpaLrXEFnueufE8wh4GL3UEBQRfK6andVPn774UFteq',NULL,NULL,'573-465-3163',0,''),(244,'Kendell','Vliet','kv8588@comcast.net','$2y$10$n5Ov7VspLjt3jWhlQRccKO0qdZsIJN2aljk7iAJvYcuqZ0G0j8pLG',NULL,NULL,'719-761-8588',0,''),(245,'Mary','Amerson','mamenson@comcast.net','$2y$10$EL8PVcHgFAxY.wdqSED4m.0PNzIPHtEUaLxn5SRWKpxrWxJ3pNunC',NULL,NULL,'719-323-0945',0,''),(246,'Pam','Cutcliff','pvcutcliff@gmail.com','$2y$10$Tp.Tz7iFcBgUDBeOH7Rx/OzePFQHgCRfwXPlBlIDpwC2CBb.AxLoe',NULL,NULL,'317-319-4524',0,''),(247,'Pamela','Acuff','treasurers@tlwc.net','$2y$10$c8ULpfw.Bed3ipJjSOCv1eXu50PAsKJlSxpX3thbkcXxcLZdEjqSy',NULL,NULL,'402-960-1118',0,''),(248,'Jill','Markworth','jmarkworth@comcast.net','$2y$10$xXDg47CssdzYRzCh0ha3k.KfRT5XXUQrVt8ZKSBjwfoYpF3iPsgbu',NULL,NULL,'719-641-0299',0,''),(249,'Susan','Klein','kleinsusanv@gmail.com','$2y$10$ATAZSCXulvYCmB0QLvamxOl1c.nRhbjLlKL9WRgbHBdwQ5fQvBDJO',NULL,NULL,'815-814-0323',0,''),(250,'Judy','Sawyer','jubloom64@yahoo.com','$2y$10$nTnPlLo5K/tpI1cpiTTxguYjNqSXXJH0QNXZBL8xjo4cwCYO790w.',NULL,NULL,'719-728-9828',0,''),(251,'Lisa','Ramsey','lcramsey3@gmail.com','$2y$10$dRh2JBCXRovWNJp.JfOUROPJSAL/pbnzEeNzCfmSBbAqhhgLDzvBa',NULL,NULL,'512-773-4459',0,''),(252,'Dixie','Cannon','dixican@comcast.net','$2y$10$nKs0awOSzs7.sI2BOdGVHOeqAv2dzgQnnDUruPvI3AG66lFNttPQW',NULL,NULL,'719-761-9284',0,''),(253,'Kathy','Wentzel','ctwent@aol.com','$2y$10$kIV8C7gokmBIAJL0Fh4LyelT2PsEa79SpkbBFWBr8y9hWxKQUlD.u',NULL,NULL,'719-651-7197',0,''),(254,'Carol','Costakis','costakis.carol@gmail.com','$2y$10$5oLeViUCoj0KKGDNALzute27TkAr1JLc0GcKiFb26kQp6eBvrXu1.',NULL,NULL,'219-707-1455',0,''),(255,'Carolyn','Baker','bakercl801@gmail.com','$2y$10$vNb/U6P.lN.zFXM8uyabVuG2z86gjZNrYE22MdZdJn84hJcQ/SDpm',NULL,NULL,'703-869-2164',0,''),(256,'Judy','Crusius','crusii@aol.com','$2y$10$LXDOolZFnyv6US7cKjN6zeml6RSfrQf8oeYAlZmIBi8tMpfcfgJ/a',NULL,NULL,'719-440-5744',0,''),(257,'Kate','Best','kadohutch@gmail.com','$2y$10$egPdoDehg7Lfmgr55IncxufJ0gpt4xx0mCJaOa7BPOqc5/BAzGJIC',NULL,NULL,'512-437-1048',0,''),(258,'Lynne','Caletti','glcalet@comcast.net','$2y$10$Eb5V1w3VTBagj1qExVAfpulbPZpQoywKx5dz1O0EPJGwEY2vV7gfW',NULL,NULL,'719-651-3471',0,''),(259,'Judy','Williamson','jmfwmson@yahoo.com','$2y$10$nM6iatOAdOcKmHWbxqLnAuJrANX9OxoCGiczP/yXtp4H3YiK.jbyW',NULL,NULL,'719-337-8485',0,''),(260,'Cindi','Monahan','davecindi99@gmail.com','$2y$10$F/0U5rzaLd77k2s.UfpJHuNq93mcW2ApLfe4mlWbkXhHMF519ibh2',NULL,NULL,'719-964-1026',0,''),(261,'Ann','Cook','anndanco@gmail.com','$2y$10$2/5lD4jVa6qFa6UQponcPOxntd89KuNWswtPeL7KPKVF/jLyP88ji',NULL,NULL,'719-659-1692',0,''),(262,'Nancy','Pokorny','nancy_pokorny@msn.com','$2y$10$GU5jNs5iQ74pZNp7uRZLv.w/tysXblUnxci6kJguXv6g/NRPPz92y',NULL,NULL,'720-299-6043',0,''),(263,'Sharon','Gann','gannsharon62@gmail.com','$2y$10$3i3b8pPUtLAJ.wo82IRGue7tz6qRvxpL9Ttk.lsHr2Dut4NXo8pt.',NULL,NULL,'719-238-5113',0,''),(264,'Leslie','Lorenz','llorenz8112@gmail.com','$2y$10$VGZu3oQ5xJsi7RZ9apt2selFQmrvm3t9zXAOUVnmX6Yi9XveaaGcy',NULL,NULL,'719-484-9851',0,''),(265,'Shelley','Pruett','shellpru@gmail.com','$2y$10$iBztXDN6Y7Z2sEKhmtngx.XxomHf0ffwf.p.KLqj88eFUogRaU1mK',NULL,NULL,'719-963-3412',0,''),(266,'Sandra','Sciadini','sandra.sciadini@gmail.com','$2y$10$z.Qcb8KYwkP6Rt.UgtyKE.dpZfs0TiNXdf/A/oPTrzMezBgg7vscm',NULL,NULL,'719-337-2986',0,''),(267,'Maureen','Morgan','maureenmorgan@mindspring.com','$2y$10$rLQfBD7K7ylH5j8HoX75q.fpRu65UUw.c/NGn89TwbiYHS2k.LTuy',NULL,NULL,'719-481-1060',0,''),(268,'Diana','Faust','dlfaust1986@gmail.com','$2y$10$PK7aTuo8FFAoAoz96lp5ee0NinPXHSPezZfER82HopOExwcltaLlC',NULL,NULL,'214-354-9538',0,''),(269,'Linda','Scott','gramcracker433@yahoo.com','$2y$10$Iw4rVlIiWJbOyrugibXJAeSLSeZT5I0Nxv.kVU5tLjm7FA9auWaxK',NULL,NULL,'714-655-7422',0,''),(270,'Paul','Baker','2bakerz@comcast.net','$2y$10$GSiOsw0u2lnoREBGIA5sxONCovaIi4odc/rFdzxq0WMNvjMh8PsrW',NULL,NULL,'719-502-7256',0,''),(271,'Joanna','Lindstrom','joannat85@gmail.com','$2y$10$C1x055xl041fgTEXc61/zOGeuShcf3sC/wO9w0kBF9Af3SLukZlJu',NULL,NULL,'719-271-4700',0,''),(272,'Scott','Linda','gramcrackers433@yahoo.com','$2y$10$C72lnbeCspclPQ/JQamtCed4u/9qYcchPPZ/kB73SnqG8Ls7LtFvO',NULL,NULL,'714-655-7422',0,''),(273,'Ted','Bauman','mr2ba1024@aol.com','$2y$10$sA8T27Fhs/Li0T2aODMFneM3xq/1tdOXu3KQrhP2FA90RLiHkkqW2',NULL,NULL,'719-331-7673',0,''),(274,'John','Spidell','spidelljw@aol.com','$2y$10$PfSuMKOieRZASMoA0ojem.Cx8iWF6bukfdJ5DJhG06MoVRH2epxpi',NULL,NULL,'719-481-8464',0,''),(275,'Gov','Vaughn','gov@thevinesbestwines.com','$2y$10$83rxxqkhmHL0OSu3FBJUFeZqFtQw/CCi3nOcNzeT9xv34c/8umRu2',NULL,NULL,'719-332-8956',0,''),(276,'','','','$2y$10$MjuenPlHQjpHOPd0bJqRG.FaRR53QR41.Vt48oumuiuPd0RVOWcze',NULL,NULL,'',0,''),(277,'Al','Fritts','alfritts@gmail.com','$2y$10$7UVTJIRb2rg8TPqrRROhdezTTgjBXJ/mFhmz.gOjaAhCQiPEUckhC',NULL,NULL,'719-332-3088',0,''),(278,'Frank','Bittinger','outdoorguy146@gmail.com','$2y$10$eLfvn7PVwSzsUNCiyMCk1uGkmNcHED4LoJfHBjnFJYdiK.Z/D8g42',NULL,NULL,'832-545-7828',0,''),(279,'Max','Williams','maxwork74@outlook.com','$2y$10$dS29WW5icT5iEkP5X.BEnOljkDIX8tuP50ecSqwBQI6Lwdy.aS3dC',NULL,NULL,'719-338-5866',0,''),(280,'Max','Williams','maxwilli@msn.com','$2y$10$lSgTVUzocoomnX5eNA78s.SvbQcvTt8sQjIJOz.uMPXvjDIzo1BRy',NULL,NULL,'719-338-5866',0,''),(281,'Richard','Salverson','dsalver@hughes.net','$2y$10$TbRLrzAXRK5gZvRsDTrOOu9UAM3CrRqV2/He4YQhLNi7dzxykcQMa',NULL,NULL,'469-307-1507',0,''),(282,'Bill','Stoner','clonestone@msn.com','$2y$10$wSQarNyZgpH84.kwoBow3.xUyVm0yr6Z6shP3YLdnzh.RrZvbrbqm',NULL,NULL,'719-231-4799',0,'');
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
INSERT INTO `schedule` VALUES ('2023-11-26',500,167,300),('2023-11-26',100,167,300),('2023-11-26',200,167,300),('2023-11-26',300,167,300),('2023-11-26',400,167,300),('2023-11-26',600,167,300),('2023-11-26',700,167,300),('2023-12-03',50,167,300),('2023-12-03',100,167,300),('2023-12-03',200,167,300),('2023-12-03',300,167,300),('2023-12-03',400,167,300),('2023-12-03',500,167,300),('2023-12-03',600,167,300),('2023-12-03',700,167,300),('2023-12-10',50,167,300),('2023-12-10',100,167,300),('2023-12-10',200,167,300),('2023-12-10',300,167,300),('2023-12-10',400,167,300),('2023-12-10',500,167,300),('2023-12-10',600,167,300),('2023-12-10',700,167,300),('2023-12-17',50,167,300),('2023-12-17',100,167,300),('2023-12-17',200,167,300),('2023-12-17',300,167,300),('2023-12-17',400,167,300),('2023-12-17',500,167,300),('2023-12-17',600,167,300),('2023-12-17',700,167,300),('2023-11-24',900,169,200),('2023-11-25',900,169,200),('2023-11-26',900,169,200),('2023-11-29',900,169,200),('2023-12-02',900,169,200),('2023-12-03',900,169,200),('2023-12-06',900,169,200),('2023-12-09',900,169,200),('2023-12-10',900,169,200),('2023-12-13',900,169,200),('2023-12-16',900,169,200),('2023-12-17',900,169,200),('2023-12-20',900,169,200),('2023-12-22',900,169,200),('2023-12-23',900,169,200),('2023-12-24',900,169,200),('2023-11-26',50,167,300),('2023-12-20',500,188,100),('2023-12-13',500,188,100),('2023-12-24',800,190,100),('2023-12-20',500,168,200),('2023-12-20',600,266,200),('2023-12-20',700,267,200),('2023-12-20',800,268,200),('2023-12-13',100,259,200),('2023-12-13',200,260,200),('2023-12-13',400,255,200),('2023-12-13',500,168,200),('2023-12-13',300,261,200),('2023-12-13',600,262,200),('2023-12-06',100,252,200),('2023-12-06',200,253,200),('2023-12-06',300,254,200),('2023-12-06',400,255,200),('2023-12-06',500,256,200),('2023-12-06',600,257,200),('2023-11-29',500,248,200),('2023-12-10',900,184,100),('2023-12-10',800,184,100),('2023-11-24',400,209,200),('2023-11-29',800,184,100),('2023-11-29',900,184,100),('2023-11-29',800,251,200),('2023-11-26',900,184,100),('2023-11-26',800,184,100),('2023-11-29',100,244,200),('2023-11-29',200,245,200),('2023-11-29',300,246,200),('2023-12-02',800,274,300),('2023-12-06',900,179,100),('2023-12-09',900,179,300),('2023-11-24',900,180,100),('2023-11-24',700,180,100),('2023-11-24',800,180,100),('2023-12-03',900,180,100),('2023-12-03',700,180,100),('2023-12-03',800,180,100),('2023-12-13',700,180,100),('2023-12-13',800,180,100),('2023-12-13',900,180,100),('2023-11-24',700,181,200),('2023-11-24',800,181,200),('2023-12-03',700,181,200),('2023-12-03',800,181,200),('2023-12-13',700,181,200),('2023-12-13',800,181,200),('2023-11-29',400,247,200),('2023-11-29',700,250,200),('2023-11-29',600,249,200),('2023-12-24',800,187,300),('2023-12-20',100,263,200),('2023-12-20',200,264,200),('2023-12-20',300,265,200),('2023-12-06',700,258,200),('2023-12-06',800,181,200),('2023-12-20',400,181,200),('2023-12-17',600,226,100),('2023-12-22',500,226,100),('2023-12-02',200,234,300),('2023-12-02',300,275,300),('2023-12-02',400,201,300),('2023-12-02',600,179,300),('2023-12-02',500,179,300),('2023-12-02',700,221,300),('2023-12-24',50,184,100),('2023-11-24',600,191,300),('2023-11-29',600,191,300),('2023-12-06',600,191,300),('2023-12-13',600,191,300),('2023-12-20',600,191,300),('2023-12-22',600,191,300),('2023-11-29',100,193,100),('2023-11-29',400,195,100),('2023-12-06',200,195,100),('2023-11-24',50,194,200),('2023-12-13',200,195,100),('2023-12-20',200,195,100),('2023-12-22',700,195,100),('2023-11-25',100,194,300),('2023-11-24',100,194,200),('2023-11-25',200,194,300),('2023-12-16',900,196,100),('2023-12-20',900,196,100),('2023-11-25',100,197,100),('2023-11-24',50,199,100),('2023-11-24',100,199,100),('2023-12-22',100,198,300),('2023-11-29',200,197,100),('2023-12-06',500,198,300),('2023-12-20',100,198,300),('2023-12-24',100,197,100),('2023-11-29',600,199,100),('2023-11-29',700,199,100),('2023-12-06',50,199,100),('2023-12-06',100,199,100),('2023-12-13',50,199,100),('2023-12-13',100,199,100),('2023-12-20',50,199,100),('2023-12-20',100,199,100),('2023-12-24',700,1,100),('2023-11-25',400,189,100),('2023-11-25',500,189,100),('2023-11-26',400,189,100),('2023-11-26',500,189,100),('2023-12-03',400,189,100),('2023-12-03',500,189,100),('2023-12-06',400,205,100),('2023-12-06',500,205,100),('2023-12-10',600,189,100),('2023-11-25',700,199,200),('2023-11-24',500,200,200),('2023-11-24',600,200,200),('2023-11-25',200,200,200),('2023-11-25',300,200,200),('2023-11-26',400,200,200),('2023-11-26',500,200,200),('2023-12-02',500,233,200),('2023-12-06',300,1,100),('2023-11-25',200,201,100),('2023-11-29',300,201,100),('2023-12-24',200,201,100),('2023-12-02',400,204,200),('2023-12-02',400,203,100),('2023-12-03',600,204,200),('2023-12-03',600,203,100),('2023-11-25',600,205,100),('2023-11-25',700,205,100),('2023-11-26',600,205,100),('2023-11-26',700,205,100),('2023-11-29',500,205,100),('2023-12-06',600,189,100),('2023-12-06',700,189,100),('2023-12-09',200,205,100),('2023-12-09',300,205,100),('2023-12-13',300,205,100),('2023-12-13',400,205,100),('2023-12-16',100,205,100),('2023-12-16',200,205,100),('2023-12-20',300,205,100),('2023-12-20',400,205,100),('2023-11-24',700,208,300),('2023-11-24',800,208,300),('2023-11-24',900,208,300),('2023-12-20',500,212,300),('2023-12-13',500,212,300),('2023-12-02',800,208,100),('2023-11-24',500,241,100),('2023-12-22',500,212,300),('2023-11-29',500,212,300),('2023-12-10',300,209,200),('2023-12-16',100,209,200),('2023-11-24',400,216,100),('2023-11-24',300,216,100),('2023-12-02',100,211,100),('2023-12-06',50,211,300),('2023-12-09',200,211,200),('2023-12-13',50,211,300),('2023-12-22',800,199,200),('2023-12-20',50,211,300),('2023-12-23',50,211,100),('2023-11-24',200,213,100),('2023-11-25',100,213,200),('2023-11-26',100,213,100),('2023-12-03',300,213,100),('2023-12-24',50,213,300),('2023-12-17',100,213,200),('2023-12-10',200,213,100),('2023-11-29',400,213,300),('2023-11-29',300,214,300),('2023-12-16',300,278,300),('2023-11-25',800,216,100),('2023-11-25',900,216,100),('2023-11-26',200,216,100),('2023-11-26',300,216,100),('2023-11-29',800,216,300),('2023-11-29',900,216,300),('2023-12-02',200,216,100),('2023-12-02',300,216,100),('2023-12-03',400,216,200),('2023-12-03',500,216,200),('2023-12-06',300,216,300),('2023-12-06',400,216,300),('2023-12-09',200,216,300),('2023-12-09',300,216,300),('2023-12-10',300,216,100),('2023-12-10',400,216,100),('2023-12-13',300,216,300),('2023-12-13',400,216,300),('2023-12-16',100,216,300),('2023-12-16',200,216,300),('2023-12-17',200,216,100),('2023-12-17',300,216,100),('2023-12-20',300,216,300),('2023-12-20',400,216,300),('2023-12-22',300,216,300),('2023-12-22',400,216,300),('2023-12-23',100,216,100),('2023-12-23',200,216,100),('2023-12-09',800,218,200),('2023-12-09',700,219,200),('2023-12-16',700,219,200),('2023-12-23',700,219,200),('2023-12-09',900,218,100),('2023-12-16',800,218,200),('2023-12-23',800,218,200),('2023-12-23',900,218,100),('2023-12-20',800,220,100),('2023-12-06',800,220,100),('2023-12-22',800,220,100),('2023-11-26',800,222,300),('2023-11-26',900,222,300),('2023-11-29',200,207,300),('2023-12-22',800,207,300),('2023-12-20',800,207,300),('2023-12-24',400,207,300),('2023-12-09',400,207,300),('2023-12-03',800,222,300),('2023-12-03',900,222,300),('2023-12-10',900,208,300),('2023-12-10',800,208,300),('2023-12-17',800,222,300),('2023-12-17',900,222,300),('2023-11-24',200,222,200),('2023-11-24',500,223,300),('2023-11-25',900,223,300),('2023-11-25',800,223,300),('2023-12-17',900,227,100),('2023-11-25',400,227,200),('2023-12-22',900,199,100),('2023-11-24',50,226,300),('2023-11-24',100,226,300),('2023-11-25',300,226,300),('2023-11-25',400,226,300),('2023-11-26',50,226,200),('2023-11-26',100,226,200),('2023-11-29',50,226,300),('2023-11-29',100,226,300),('2023-12-02',200,226,200),('2023-12-02',300,226,200),('2023-12-03',100,226,100),('2023-12-03',50,226,100),('2023-12-06',100,226,300),('2023-12-06',200,226,300),('2023-12-09',800,226,100),('2023-12-09',700,226,100),('2023-12-13',100,226,300),('2023-12-13',200,226,300),('2023-12-10',100,226,100),('2023-12-10',50,226,100),('2023-12-16',300,226,100),('2023-12-16',400,226,100),('2023-12-17',50,226,100),('2023-12-17',100,226,100),('2023-12-20',600,226,100),('2023-12-20',700,226,100),('2023-12-22',50,226,100),('2023-12-22',100,226,100),('2023-12-23',50,226,300),('2023-12-23',100,226,300),('2023-12-24',100,226,300),('2023-12-24',200,226,300),('2023-12-03',100,228,200),('2023-12-03',200,228,200),('2023-12-03',300,228,200),('2023-12-06',800,207,300),('2023-12-06',900,207,300),('2023-12-20',900,207,300),('2023-12-22',900,207,300),('2023-12-13',900,229,300),('2023-12-16',900,229,300),('2023-12-16',800,229,300),('2023-12-13',800,229,300),('2023-12-16',500,230,300),('2023-12-20',200,230,300),('2023-12-22',200,230,300),('2023-12-23',200,230,300),('2023-11-29',700,208,300),('2023-11-26',600,207,200),('2023-11-25',600,240,300),('2023-12-06',700,231,300),('2023-12-09',500,231,300),('2023-12-13',700,231,300),('2023-12-16',600,231,300),('2023-12-17',400,231,200),('2023-12-17',500,231,200),('2023-12-20',700,231,300),('2023-12-22',700,231,300),('2023-12-24',300,231,300),('2023-11-24',300,232,200),('2023-11-25',500,232,200),('2023-11-25',600,232,200),('2023-11-26',200,232,200),('2023-11-26',300,232,200),('2023-12-02',50,232,200),('2023-12-02',100,232,200),('2023-12-03',50,232,200),('2023-12-06',50,232,200),('2023-11-24',200,1,300),('2023-12-09',600,204,200),('2023-12-09',600,203,100),('2023-12-10',500,204,200),('2023-12-10',500,203,100),('2023-12-13',600,234,100),('2023-12-20',50,234,200),('2023-12-22',200,234,100),('2023-11-24',300,202,300),('2023-11-24',400,202,300),('2023-11-25',700,207,300),('2023-11-26',700,207,200),('2023-12-03',200,207,100),('2023-12-10',800,207,200),('2023-12-24',900,216,300),('2023-12-02',900,1,300),('2023-12-02',900,208,100),('2023-12-02',50,236,100),('2023-12-13',50,236,200),('2023-12-09',100,237,300),('2023-12-10',400,237,200),('2023-12-22',600,238,100),('2023-11-25',300,201,100),('2023-12-02',700,208,100),('2023-12-10',700,184,100),('2023-11-24',600,241,100),('2023-11-25',50,242,200),('2023-11-26',50,242,100),('2023-12-09',600,194,300),('2023-12-09',700,194,300),('2023-12-16',700,194,300),('2023-11-25',500,1,300),('2023-12-09',400,213,100),('2023-12-17',200,194,200),('2023-12-17',300,194,200),('2023-11-25',50,240,300),('2023-12-02',500,189,100),('2023-12-02',600,189,100),('2023-11-25',800,199,200),('2023-12-16',300,1,200),('2023-12-09',500,189,100),('2023-12-02',600,206,200),('2023-11-26',800,211,200),('2023-12-02',700,207,200),('2023-12-02',800,207,200),('2023-12-10',700,207,200),('2023-12-09',100,230,200),('2023-12-23',800,222,100),('2023-12-23',700,222,100),('2023-11-29',50,270,200),('2023-12-10',600,270,200),('2023-12-16',50,270,300),('2023-12-22',50,270,300),('2023-12-23',400,270,300),('2023-12-17',600,270,200),('2023-12-09',300,1,200),('2023-12-23',300,273,300),('2023-12-09',800,271,300),('2023-12-10',200,272,200),('2023-12-16',500,272,100),('2023-12-16',500,213,200),('2023-12-10',50,194,200),('2023-12-10',100,194,200),('2023-12-09',100,273,100),('2023-12-16',50,273,100),('2023-12-17',800,273,100),('2023-12-23',700,1,300),('2023-12-23',500,198,300),('2023-12-02',100,241,300),('2023-12-09',400,240,200),('2023-12-09',500,207,200),('2023-12-16',600,207,100),('2023-12-16',800,222,100),('2023-12-17',400,207,100),('2023-12-17',500,207,100),('2023-12-24',500,207,300),('2023-12-16',700,207,100),('2023-12-16',400,192,300),('2023-12-16',200,192,200),('2023-12-17',800,218,200),('2023-12-17',700,219,200),('2023-12-16',50,209,200),('2023-12-22',50,194,200),('2023-12-22',100,194,200),('2023-12-23',600,194,300),('2023-12-24',600,216,300),('2023-12-24',700,216,300),('2023-12-23',800,186,300),('2023-12-24',300,1,200),('2023-12-16',400,241,200),('2023-12-17',50,184,200),('2023-12-16',600,199,200),('2023-12-17',700,208,100),('2023-12-22',200,277,200),('2023-12-22',300,277,200),('2023-12-23',200,277,200),('2023-12-23',100,277,200),('2023-12-24',900,1,100),('2023-12-24',800,207,200),('2023-12-22',700,207,200),('2023-12-22',300,209,100),('2023-12-22',400,209,100),('2023-12-24',400,210,100),('2023-12-24',400,209,200),('2023-12-23',300,209,200),('2023-12-23',400,209,200),('2023-12-24',500,209,200),('2023-12-24',500,210,100),('2023-12-24',600,219,200),('2023-12-24',700,219,200),('2023-12-24',200,213,200),('2023-12-22',600,213,200),('2023-12-24',600,226,100),('2023-12-23',600,226,100),('2023-12-24',100,190,200),('2023-12-24',300,190,100),('2023-12-24',50,280,200),('2023-12-22',400,211,200),('2023-12-23',900,207,300),('2023-12-22',500,281,200),('2023-12-23',500,241,200),('2023-12-23',600,241,200),('2023-12-23',50,282,200),('2023-12-23',500,221,100),('2023-12-23',300,201,100),('2023-12-23',400,203,100);
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

-- Dump completed on 2023-12-25  1:30:02
