-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 07, 2025 at 02:54 PM
-- Server version: 10.5.26-MariaDB-cll-lve
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `monumen8_bellringing`
--

-- --------------------------------------------------------

--
-- Table structure for table `administration`
--

CREATE TABLE `administration` (
  `start_dt` date NOT NULL,
  `end_dt` date NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `administration`
--

INSERT INTO `administration` (`start_dt`, `end_dt`, `project_id`) VALUES
('2023-11-24', '2023-12-24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE `administrators` (
  `listing_order` int(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`listing_order`, `title`, `fname`, `lname`, `email`, `phone`) VALUES
(1, 'Manager', 'Jeff', 'Baker', 'wjeffreybaker@gmail.com', '860-989-8881'),
(2, 'Asst. Manager', 'Mark', 'Zeiger', 'mark.zeiger@gmail.com', '719-494-7718'),
(3, 'Store Manager - King Soopers', NULL, NULL, NULL, NULL),
(4, 'Store Manager - Walmart', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` smallint(11) NOT NULL,
  `location_name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `location_name`) VALUES
(100, 'Walmart East Dr'),
(300, 'King Soopers'),
(200, 'Walmart West Dr');

-- --------------------------------------------------------

--
-- Table structure for table `ringers`
--

CREATE TABLE `ringers` (
  `id` smallint(11) NOT NULL COMMENT 'AUTO INCREMENT',
  `fname` varchar(20) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` char(13) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `forgot_pwd_code` bigint(13) DEFAULT NULL,
  `forgot_pwd_time` datetime DEFAULT NULL,
  `administrator` tinyint(1) NOT NULL DEFAULT 0,
  `Comments` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ringers`
--

INSERT INTO `ringers` (`id`, `fname`, `lname`, `email`, `phone`, `password`, `forgot_pwd_code`, `forgot_pwd_time`, `administrator`, `Comments`) VALUES
(1, 'Mark', 'Zeiger', 'mark.zeiger@gmail.com', '719-494-7718', '$2y$10$AXj.5S36cIABySC76almuuHYRfWKHtkNMGSjs/kHD0sSftpQm0VNG', NULL, NULL, 1, ''),
(287, 'William', 'Baker', 'wjeffreybaker@gmail.com', '860-989-8881', '$2y$10$2gLmAdvxIjzp4QgWPr2af.MuKZe4PIxeL9FQyLt8LkrpIkyQhxUTO', NULL, NULL, 0, ''),
(288, 'Tina', 'Fey', 'zm8032@gmail.com', '719-494-7718', '$2y$10$9vOilweydyaNgJ8CYnbnM.ndZzgorM1qLxqV5htV1NMWkwkibS11.', NULL, NULL, 0, ''),
(356, 'Sally', 'Keding', 'sallou12@yahoo.com', '847-710-2071', '$2y$10$2vOgdaWTrhOARb5hP4WKYuePc3/5IHPdx7Tj0ot9c.3ZWva2v3qI.', NULL, NULL, 0, ''),
(294, 'Lewis-Palmer', 'Middle School', 'dlopez@no-email.com', '719-487-9989', '$2y$10$HfQmoVHrvVB6.7AMN06EJO.MDSr8ddGPMubgLsomlgXvOJCLVoM8K', NULL, NULL, 0, ''),
(300, 'D-38', 'Key Club', 'mike.luginbuhl+kc@comcast.net', '719-282-0841', '$2y$10$ZWis.aH5irtUw3mD3.i4VO6YI9mJb7yUiWGdCszlOvSeXaQh4AHrW', NULL, NULL, 0, ''),
(302, 'Same As', 'East Door', 'blocked@noemail.com', '555-555-5555', '$2y$10$SifXdBlsCczXBM2vo0MK8unaU4nI4rxOmF8ZyhuDA..ZH1k3vwBUm', NULL, NULL, 0, ''),
(303, 'Dennis', 'Beasley', 'pdcbcos@gmail.com', '719-208-9569', '$2y$10$nfmHJqydtJCb.3u75eb/KeiW9Z.m/8hz278ZtaCxEPwO8K0vQZ7va', NULL, NULL, 0, ''),
(304, 'Paul', 'Gourley', 'pgourley53@yahoo.com', '307-630-2958', '$2y$10$wTmYsI18p2V5g2lOjkAVqueXb.2KZIxbt7nGYdF/5WkPDuZk1T2xO', NULL, NULL, 0, ''),
(305, 'Doni', 'Gourley', 'dkgsnoopy@yahoo.com', '307-630-2491', '$2y$10$2TVntweSljZrLT7YonoPHenMR1n1efntWuf7LZ8ypXkr.fz4fDp5O', NULL, NULL, 0, ''),
(306, 'Bill', 'Kaelin', 'williamkaelin@gmail.com', '719-964-1037', '$2y$10$OGum.FhwL3fNKNuaN9kYiOqHvuAf6DM4v9j9tZCMlgd7XUnLQ5Zjm', NULL, NULL, 0, ''),
(307, 'Jim', 'Head', 'jhhead@comcast.net', '719-510-2941', '$2y$10$oo.77Y5NOcbeqgT0GL68XOxxuBt2dsxebcrEZ8CCKlmnuAEP9Jb/S', NULL, NULL, 0, ''),
(308, 'Charlie', 'Brown', 'cbrown41@comcast.net', '719-433-6626', '$2y$10$Vr5fuktCAWlSHgnxs3ly4.xBI8W9t.leJ80Zk7lZlC.wU764BdE7K', NULL, NULL, 0, ''),
(309, 'Gene', 'Jones', 'mgenejones@gmail.com', '719-354-3919', '$2y$10$3zCZ1fhYGPKI1SCSvnfHNu.eHtb9HnbhiglVGk0oIVz8urUmQA7Z.', NULL, NULL, 0, ''),
(310, 'Cay', 'Price', 'cayprice@gmail.com', '832-444-3925', '$2y$10$MQVSlrJzNM1SaKeKKoWQIOEN/M8w1dUiRriB.iPb.2ZH/2cNaTC9S', NULL, NULL, 0, ''),
(311, 'RF', 'Smith', 'rff106k@gmail.com', '719-210-4987', '$2y$10$mXoTmREW5zie7D8IyISmoO.wN8O1n3CRmAkGKrF4yCky/qAW8uXOu', NULL, NULL, 0, ''),
(312, 'Sue', 'Reinecke', 'sereinecke@gmail.com', '719-661-2911', '$2y$10$GImtTAIGnV7njx05SIqEu.qaoaT.BvU8wnrxwjFySkaW.aFiSkxda', NULL, NULL, 0, ''),
(313, 'Ofie', 'Lopez', 'ofielopez@yahoo.com', '719-487-9989', '$2y$10$TmF40cIKzaMQkJFrm450heJ285ecj3iQZj2QIF1gvOMNPQBV.v6ei', NULL, NULL, 0, ''),
(314, 'Steven', 'Keefer', 'steve@keefersplace.com', '720-282-1538', '$2y$10$yn2c5S/mo5GXqa01hyNkpObu8gojrjxsSfhAtzXQiVvPvw8mGM6uq', NULL, NULL, 0, ''),
(315, 'Mark', 'Anderson', 'mark@marksmywords.com', '719-339-7053', '$2y$10$7WmdelcPEQz30uFqoAKPCuuAH4rocgYlKqYTEB828h19cFKzcPYcG', NULL, NULL, 0, ''),
(316, 'Sue', 'Reinecke', 'sereinecke@msn.com', '719-661-2911', '$2y$10$VHlyIdeqp0y7s5sna1MDkO2j6rx17iWg3SOV75pmOSyUPkvceEVvm', NULL, NULL, 0, ''),
(317, 'Jack', 'Fry', 'fryjack@aol.com', '719-339-8456', '$2y$10$nxQiNZheWeGxkcwcXgp4K.qmeS1rlnx8hnXPtpSnMiEPbOwfjJsLG', NULL, NULL, 0, ''),
(318, 'Joe', 'Kneedler', 'kneedlerjoe33@gmail.com', '832-776-5446', '$2y$10$GRcThImkKYo46k6Eg9hR5escjHNTa4fZ49UGHE2LvE8eQA4nNWRJq', NULL, NULL, 0, ''),
(319, 'Ed', 'Hettler', 'edhettler@gmail.com', '719-641-3349', '$2y$10$BWRdR3Q7fWhUMOoegzc5..sIOthNR34Zqxb66aTYWI03j0Kwf6MA2', NULL, NULL, 0, ''),
(320, 'Bryan', 'Hardesty', 'blhardesty@comcast.net', '408-396-9059', '$2y$10$xgn0Rwz3xnVOb2HJx9ahLe5d.msDMgo2yn5kH73cEvLKSof5PYAmC', NULL, NULL, 0, ''),
(321, 'Chuck', 'Leggiero', 'ramcoach26@me.com', '719-440-8970', '$2y$10$Tgcc6y4.snwievxXC0bHXOx2I0WtA5Cuj36Gq.E0TPkCf0g0cx34u', NULL, NULL, 0, ''),
(322, 'Heidi', 'Baker', 'bakerheidi58@gmail.com', '860-208-7075', '$2y$10$wG8hRTQfsQJwNRG1Ru8kE.qRB3L1c4zKS.Jh5ZPn4/lP2dRrl.RkK', NULL, NULL, 0, ''),
(323, 'Benny', 'Nasser', 'benasser19r@gmail.com', '719-488-3189', '$2y$10$vG1epT0H2gM/TClkVAV.2OYmeq2SDh9//eThjK.CFoCVwsspaIM2K', 82830775276, '2024-12-16 16:52:32', 0, ''),
(324, 'JAMES', 'WOLF', 'akwlfpck@gmail.com', '804-704-2532', '$2y$10$VIWrO6yJ4viUYRa6QnMIceykwS/pSOtWIkZZNZNbW.h0A/xADobAi', NULL, NULL, 0, ''),
(325, 'Scott', 'Ross', 'scott@rosses.me', '719-661-9078', '$2y$10$fAZ1am4I.rFR6vaWHYAwWuy9ALwZt0FdWkpP/rn0XZHw7YcndCaTa', NULL, NULL, 0, ''),
(326, 'John', 'Alcorn', 'alcornsalcove@gmail.com', '719-310-5120', '$2y$10$OSHM.xM78Ahl5o2eFcL3K.rgj/iZojk5LjfeVd9ffUWFcaaN8o1mG', NULL, NULL, 0, ''),
(327, 'Teri', 'Alcorn', 'travelagentterialcorn@gmail.com', '719-310-5123', '$2y$10$tebCY.aVei.5buuN9cH32.e8hsnCYjhDUkGAZAEMBuOLtCh0T85Um', NULL, NULL, 0, ''),
(328, 'Chris', 'Kupko', 'kupkofamily@gmail.com', '719-661-4926', '$2y$10$fP9/vzirmKrVoHMAh2wV3ugP8iGAzp07M5TS827CjI4cbcjkvNJGu', NULL, NULL, 0, ''),
(329, 'Rick', 'Schoenlein', 'rjschoenlein@msn.com', '317-376-3850', '$2y$10$ECLRsH.5AFRrA9kgXgtikenUFw7fxf2cr4lzeGZ8hFSf0qbDW.9hm', NULL, NULL, 0, ''),
(330, 'Ed', 'Tomlinson', 'etomlinson24@comcast.net', '719-650-3522', '$2y$10$/qd2wHfXGdVGL3r3ddaVVOH6wyHQDQYxzjZb0I9pcG1aGyaZbOvai', NULL, NULL, 0, ''),
(331, 'Jim', 'Johnston', 'jjohns5122@aol.com', '719-660-7297', '$2y$10$1WhmVDFDC7ulKODe5Q7M9.vjgsF22z2VbzH7dhYQq.i1UUZi7JgMy', NULL, NULL, 0, ''),
(332, 'Christy', 'Woodland-Ferguson', 'christy@maristy2.com', '970-846-6907', '$2y$10$huVdNuXs2BSU5tSXVorNH.aE9OoHvJ5RYenM.eCEnR8iwSURGu2dO', NULL, NULL, 0, ''),
(333, 'Al', 'Thompson', 'mustangthompson@verizon.net', '310-612-1220', '$2y$10$O94PGyAKz/Rt7a0NfCX1zOC2.8YOC6rcJohLPNDIpVG79PYYJo/zK', NULL, NULL, 0, ''),
(334, 'Thomas', 'Csrnko', 'thomas.csrnko@gmail.com', '719-203-4168', '$2y$10$EjcOfSTo4MR4O2nQx/m01OBVbHcVg7BNIEkxlEXWPtrDI914ryGle', NULL, NULL, 0, ''),
(335, 'Yuliya', 'Seaton', 'yuliya.seaton@gmail.com', '719-337-5087', '$2y$10$TMTwi33lnmbMzKUgSyjgnu/GV17ZfXM/XUodpTntA3idLOYXiNLD.', NULL, NULL, 0, ''),
(336, 'James', 'Murphy', 'patt.and.jim@gmail.com', '719-487-9327', '$2y$10$CRO3ie93nkLpDtFJrjYDY.9ci.iaf3mb0C7eFWGLZgh2XiYvXVkoG', NULL, NULL, 0, ''),
(337, 'Robert', 'Knoth', 'baldeagle43@comcast.net', '719-488-2565', '$2y$10$v.L/wYQTDMIXObM86vFBWeBfJkaSPnqWKLNnm5/MKptDFpI8L9kbm', NULL, NULL, 0, ''),
(338, 'Jim', 'Hatley', 'trilakesdoors@gmail.com', '719-213-1598', '$2y$10$1F377LpOJOmPQ53wBRYITO9rIWwz44f/TdjgvOR09xqkwpNcDLT0u', NULL, NULL, 0, ''),
(339, 'Diane', 'Everett', 'ckndever@aol.com', '719-291-4564', '$2y$10$Vtw6nYfRqvD2VXCIAKQ5B.3Z/NGrpNqJWS9y8y4C6xDxIntarb3pu', NULL, NULL, 0, ''),
(340, '', '', '', '', '$2y$10$0NSDddvXe2lj4/WC5J8SZOGlitysdWw0OiwbYl0CI9kLAPx7NWS86', NULL, NULL, 0, ''),
(341, 'Loyd', 'Mowery', 'loydandcandy@gmail.com', '719-660-6376', '$2y$10$GOSIlEao6sPNkdZT1RzhhOpaduAI/oyYD1WGce3WWh3uG7qzcDGPa', NULL, NULL, 0, ''),
(342, 'Kathleen', 'Strom', 'kastrom@q.com', '719-200-6520', '$2y$10$IuKbnClCEfmFVLVJj2PtCOz.PKHRRqdkUxIOx8tuFT1yZnBWrPDKO', NULL, NULL, 0, ''),
(343, 'Ron', 'Mangiarelli', 'nonnon@mangiarelli.com', '719-331-9941', '$2y$10$SF63dmhWKcUuf9if8qhKKutKpwxiUeoJCn9kTfZobZfqI12P0hN16', NULL, NULL, 0, ''),
(344, 'Joanna', 'Lindstrom', 'joannat85@gmail.com', '719-271-9497', '$2y$10$3sQG12jCeqpjA7F6ipeOeu.xVSLB/0niL60zYVC0GSPwPS1dtIrHm', NULL, NULL, 0, ''),
(345, 'Mike', 'Luginbuhl', 'mike.luginbuhl@comcast.net', '719-313-8532', '$2y$10$vrdk0ceFIRaPoUlH1TeHGONhixZyr0uCv9CtIJ76BOoiLIffEFLsu', NULL, NULL, 0, ''),
(346, 'Mike', 'McGrath', 'mmcgrath62@comcast.net', '719-488-0962', '$2y$10$O7eCDadkfHgEW3B2YGWbb.6HQUgyN.hY6FuE1fTUxC0CI1UhTSfPa', NULL, NULL, 0, ''),
(347, 'Anita', 'Hall', 'ahall3820@gmail.com', '729-964-7011', '$2y$10$cSGpWpVzWglYtS3DzlI8dOoPIStFVTng5xjIrZP4Z8NtPVuqJuxT6', NULL, NULL, 0, ''),
(348, 'Michael', 'Hale', 'mbhale.o@hotmail.com', '719-440-4069', '$2y$10$mhNzbL8xfy8HrDcjRMXgjuBOGxpg6cG/NSGTgOh6wVPiY1ZdJX5ia', NULL, NULL, 0, ''),
(349, 'Larry', 'Young', 'llyoung610@gmail.com', '360-355-6485', '$2y$10$rBCSNgQosL7g4l2486aEMeQPsuxJS0yBN9F21U3Bn.hatEyc5RT4C', NULL, NULL, 0, ''),
(350, 'Sheila', 'Ferguson', 'tennosheela@gmail.com', '901-830-7896', '$2y$10$9XeEEbDCcpKFRZFdF4s4i.A832ClAEwPLxX8iRfN/ota/fBOYf9za', NULL, NULL, 0, ''),
(351, 'Daniel', 'Lopez', 'danglopez@msn.com', '719-358-1017', '$2y$10$iWseaP6bPh0sNLsVDhloiurMR8/RNLSC7DIqM73PdwnCZ4vdYWtbS', NULL, NULL, 0, ''),
(352, 'Al', 'Fritts', 'alfritts@gmail.com', '719-332-4088', '$2y$10$SXCUbSk8hkjEQRHlvPSIk.z.8KB.0qB/UGl1BNFLlFIUOmPq4WBXW', NULL, NULL, 0, ''),
(353, 'Jerry', 'Bash', 'jbash7352@aol.com', '719-339-8905', '$2y$10$nYr4BSCO/Lcipwt8wNcJXeDCJ..nTxJ2ECTvKvTJp.8z2/kJWA7ia', NULL, NULL, 0, ''),
(354, 'Kathryn', 'Potter', 'dkpotter2005@gmail.com', '719-649-3573', '$2y$10$1re/IO8oX2zAu0xTYqYjmOMQuEm8pj9mYHvqn4leFrSl50oWSO6YW', NULL, NULL, 0, ''),
(355, 'Richard', 'Strom', 'rsappraisals_6@msn.com', '719-963-4464', '$2y$10$lvS.HXXQWKCVut2ALJVx0.YCG79D8WSKWaEvByIdZf1KZfl1axrnm', NULL, NULL, 0, ''),
(357, 'Jill', 'Markworth', 'jmarkworth@comcast.net', '719-641-0299', '$2y$10$i6APsb6YuYppRLHVjH4m0upPGdiJtDjJHDKTo3M1a//93sxfE/UA2', NULL, NULL, 0, ''),
(358, 'Nancy', 'Young', 'ncy1247@gmail.com', '360-355-0319', '$2y$10$ykV4518ItJNbUCfxjM4PoeFCez4LZ6SU11kLGE/x5B1oCxoz2YLZu', NULL, NULL, 0, ''),
(359, 'Pam', 'Cutcliff', 'pvcutcliff@gmail.com', '317-31-94524', '$2y$10$6uU74tfnlhJ9TjS6kCEwu.W58UpTYApmWUlMnBzAn4NdNtMH.zu2S', NULL, NULL, 0, ''),
(360, 'Sandy', 'Mangiarelli', 'sandy@mangiarelli.com', '719-351-0180', '$2y$10$dYAmXsU5RjN.q/kaISYvVeqrRtoIlN8Fu9PmswGuCSuP49TeHnM06', NULL, NULL, 0, ''),
(361, 'Lisa', 'Ramsey', 'lcramsey3@gmail.com', '512-773-4459', '$2y$10$Q5oVJzk2x5C9BjJtG36DiO5EUG/DQpiAFyssl3Ep6XzMHCz76e9RO', NULL, NULL, 0, ''),
(362, 'Maureen', 'Morgan', 'maureenmorgan@mindspring.com', '719-641-5305', '$2y$10$iIGpgLyvT/OlZpVd48S2j.MecfI6qpG8GCTAPIxj4827B7KNE.eg6', NULL, NULL, 0, ''),
(363, 'Julie', 'Shook', 'jaeshook@gmail.com', '719-351-0408', '$2y$10$5L4iuMVInxYCUVvu1rtPbOsbO9D.0xj6aHqOJcdtwnHGBx91cnLqG', NULL, NULL, 0, ''),
(364, 'Sharon', 'Gann', 'gannsharon62@gmail.com', '719-238-5113', '$2y$10$Zl5SWOlwM5aN0RJQztF2quEe7TeyzdUL8bHd5KBrGt.MytO71xm2K', NULL, NULL, 0, ''),
(365, 'Cathy', 'Wedo', 'cmwedo@comcast.net', '719-290-2833', '$2y$10$WgjlZh0WSsAmRxfGZmc8luGq09tOM2DaB.EepO7oyisQrodpo.HiW', NULL, NULL, 0, ''),
(366, 'Dixie', 'Cannon', 'dixican@comcast.net', '719-761-9284', '$2y$10$GfiSlJ8SGWSe249qiQUJeuxti/.md7OBBTO2xenLwcIbyAy0qDSJe', NULL, NULL, 0, ''),
(367, 'Cindi', 'Monahan', 'davecindi99@gmail.com', '719-964-1026', '$2y$10$zCP0EXQmwDDgCAyHGpnCyOWPpM3vnicQrfUrBQlFEnUPDS6INrS/K', NULL, NULL, 0, ''),
(368, 'Diana', 'Faust', 'dlfaust1986@gmail.com', '214-354-9538', '$2y$10$DcUa4K.rC640s9LS8hKV/OS7v8ZweUMMbKn40SbFC0oiFB1e.T6EG', NULL, NULL, 0, ''),
(369, 'Phoebe', 'Auld', 'paauld2@gmail.com', '512-663-0631', '$2y$10$wX2ZrHOD1YE83Pd3mM1wQe4eoHUcHkGbY2Sqqc8t2cBwoaa78EA.a', NULL, NULL, 0, ''),
(370, 'Leslie', 'Lorenz', 'llorenz8112@gmail.com', '719-484-9851', '$2y$10$wkc.p8JFmO7h.pW9Qewgm.tCct2pFbUpxerFmR7vdD3guoBhBSrwG', NULL, NULL, 0, ''),
(371, 'Carol', 'Costakis', 'costakis.carol@gmail.com', '219-707-1455', '$2y$10$5XvPBvffxdHYojnWGQnHmuLWQD0gtzBR/m88rlUMA9ajiwY8MpI76', NULL, NULL, 0, ''),
(372, 'KAYLEEN', 'JACKSON', 'dreamchaserkkj@hotmail.com', '30-334-54636', '$2y$10$4pq3st1xYYTswg9tgUhGF.Tvmbh4hsfV8czc/XaIVc7xAeOtD8jcu', NULL, NULL, 0, ''),
(373, 'Lynne', 'Caletti', 'glcalet@comcast.net', '719-651-3471', '$2y$10$Hhf5hfL6KDKpZBX//v8Xz.G2TgdonKOt4TzaJKCYUDsze1s5bGw2u', NULL, NULL, 0, ''),
(374, 'Robbie', 'Larson', 'roberta_larson@yahoo.com', '719-271-24451', '$2y$10$8Th0AhwvDOUj6N0O2C3qT.TEf82cgd30N73KRk/F93t3hzdnw.8Ki', NULL, NULL, 0, ''),
(375, 'Judy', 'Sawyer', 'jubloom64@gmail.com', '719-728-9828', '$2y$10$N43EOUdnZI/eKs0vcusGRuDfGkc49ei6YphCDAKp4a71GzL7Jz0UK', NULL, NULL, 0, ''),
(376, 'Carolyn', 'Baker', 'bakercl801@gmail.com', '703-869-2164', '$2y$10$VGJTPxSsLz9LvIZ57EFa1uvaSWCieL2Ln8WoUAj0.tSl9M1bbk8Xm', NULL, NULL, 0, ''),
(377, 'Sue', 'Normile', 'normile417@gmail.com', '719-964-7700', '$2y$10$xfgE0d3O/UiQIl8JhHPx1.ACl.VyE4mu7k/Mm69BIRNIdkUpo6LO.', NULL, NULL, 0, ''),
(378, 'Susan', 'Leggiero', 'sleggie26@me.com', '719-440-8969', '$2y$10$uMkwJ.W4NMjnteJhbYth.eJ4/8LfcYAUGoSFEtRa25wb3ODMckniG', NULL, NULL, 0, ''),
(379, 'Shelley', 'Pruett', 'shellpru@gmail.com', '719-963-3412', '$2y$10$Dp9cifdPyZF8AEf/LL9cOujPguNe3zRcYkJ2XeAs/Um8ppoVMOzii', NULL, NULL, 0, ''),
(380, 'Ted', 'Bauman', 'mr2ba1024@aol.com', '719-331-7673', '$2y$10$Ft8ws83dGHriVBBNTZ/O0OmTe8LcqKWaSs8jVmKrlADJEnF1twr8u', NULL, NULL, 0, ''),
(381, 'Richard', 'Salverson', 'dsalver@hughes.net', '469-307-1507', '$2y$10$EV4.0G24M6piwO0XPkrZY.hC9Bw7QYJQfl2vVsHJQ6lPUJ8D2uXdm', NULL, NULL, 0, ''),
(382, 'Paul', 'Baker', '2bakerz@comcast.net', '719-502-7256', '$2y$10$CS0fTH8hJtfUhKV8itjxPuLopYcrNt3dihGk1E01sHbbRwyFUhKei', NULL, NULL, 0, ''),
(383, 'Bill', 'Stoner', 'clonestone@msn.com', '719-231-4799', '$2y$10$wcaCdgxYlAkWBUnpapLEzeSoFt17.ATOuS95XKPr5rd0tkDhB8edq', NULL, NULL, 0, ''),
(384, 'Dave', 'Bailey', 'daveb@baileyassociates.us', '408-821-5121', '$2y$10$TU1nraFlBvgLKrabVPOa1eRmLDoF1MpHAyeqdoO4xR4r81Bah6Kdy', NULL, NULL, 0, ''),
(385, 'Greg', 'Bielanski', 'gbielanski@msn.com', '719-761-1875', '$2y$10$turtrNUvngyZoFjCpKlHMeYJg5XE.6trY3guYaGHfIBvjQriKYyCy', NULL, NULL, 0, ''),
(386, 'Dave', 'Collins', 'davecollinsjr@centurylink.net', '719-413-7374', '$2y$10$5p66MkU/44qxkwEY82jN2uA5CqLwt9.xQCaD17EA6OVqAwDvC6N92', NULL, NULL, 0, ''),
(387, 'Rich', 'Hicks', 'rich7100@comcast.net', '719-440-7536', '$2y$10$gjftT.QtEGp.rP4beL864u2zm6vle5n1ZniniPt.kIlJy3Y9QsNNC', NULL, NULL, 0, ''),
(388, 'Kelly', 'Trop', 'kaaronm@hotmail.com', '509-520-1275', '$2y$10$YW5L5DExNnHWzffjg/uDIOOHeOeHs8RgP7lrYtm.ze79ytGpLmm.q', NULL, NULL, 0, ''),
(389, 'Sandi', 'Floyd', 'sandi@sandifloyd.com', '719-723-2162', '$2y$10$cdW7tBv/IYhnuwC7qGz4FufixryOubNhJOmWWMYB.f8eW8aPP1/X.', NULL, NULL, 0, ''),
(390, 'Bob', 'Gass', 'rapidcarco@hotmail.com', '208-899-0515', '$2y$10$jQ.EXrJfi3PJB64zBdXcCOS6zI.N./9fRC8Yfb/aBaudGjGcS3mD.', NULL, NULL, 0, ''),
(391, 'Linda', 'Scott', 'gramcracker433@yahoo.com', '714-655-7422', '$2y$10$VP2wKBNJQ4zB3uNKfJ5qV.g2.U.IH1RMhVf2Av.9WgH2I0SGNSRB2', NULL, NULL, 0, ''),
(392, 'Canceled', 'Canceled', 'noemail@noemail.com', '555-555-5555', '$2y$10$qnaYc4UwI.N2Kqkvff3w..nMmOf5lMfdSZyzP46xEci3bsEgSm0oG', NULL, NULL, 0, ''),
(393, 'Terry', 'McMullen', 'slammer37@gmail.com', '719-339-2633', '$2y$10$Ug8l8lzJ9xNNVMJTETTxP.V45BLlRPcLzYayFngjcXAoCE1WDFAKC', NULL, NULL, 0, ''),
(394, 'Ophie', 'Lopez', 'ophielopez@yahoo.com', '719-338-4243', '$2y$10$J7Q.2VfRj9Jhm/qSnK3qK.pAL1p977j6cbnUXO7rll0FKckUj/T92', NULL, NULL, 0, ''),
(395, 'Frank', 'DeLalla', 'fdelalla@aol.com', '719-339-3567', '$2y$10$4sckz9kD./UByHZqnwJQgOK8lQvGJGTIDDF7jmhtjqdfXunQylKQW', NULL, NULL, 0, ''),
(396, 'Robert', 'Harrigan', 'bobharrigan@me.com', '847-902-7664', '$2y$10$cKH0hvKGV9IdL7yQL02h3.3xyKyDvhCt38McXcpkoAiOmaZQhwmSi', NULL, NULL, 0, ''),
(397, 'Ann', 'Smith', 'wits5275@gmail.com', '719-373-0208', '$2y$10$qCdk6zyCLflpZsGFxwkkkeL2.SW/kr9Ej7/zs3.2T2sbsb3d7xQte', NULL, NULL, 0, ''),
(398, 'Steve', 'Sutherland', 'hrxmas@gmail.com', '719-488-2205', '$2y$10$Eei6xjBPgzb2ZPSHQNDeve0SoENrlWRzCdAU9ajA6drc.mnj.mqrK', NULL, NULL, 0, ''),
(399, 'Charlie', 'Searle', 'charliesearle02@gmail.com', '719-649-0058', '$2y$10$jvkI76I6cX65.j2OTsg9ReR26qinDPvoYfYlk2m/Ag7YWSqVd2lly', NULL, NULL, 0, ''),
(400, 'Pete', 'Peterson', 'pete80132@gmail.com', '714-271-5947', '$2y$10$owdz8TxgFeYc4GNCJbE61eVLrMI6APKZcs4Mrtq3F5ZCHIo0AAcDK', NULL, NULL, 0, ''),
(401, 'Liam', 'Wynne', 'liamwyn@aol.com', '719-237-1626', '$2y$10$pkmLDaSDK3f44yrpWgC8l.jjfjrJcQ.Y1e5dOpIniS6dPh.j/3qcW', NULL, NULL, 0, ''),
(402, 'Max', 'Williams', 'mwilliams5866@gmail.com', '719-481-3215', '$2y$10$wD3OUfMUJ1uqjQFMzKX/lOGnHz118s8C.rinT.thKEItC7mKZmmK.', NULL, NULL, 0, ''),
(403, 'Tilden', 'Kinlaw', 'tilden.kinlaw@aol.com', '346-388-8627', '$2y$10$HC2MUB9zR2xkPnXy5iDNwO4SWAxm9lxor9b1WycZJxwPCgL9oeUqK', NULL, NULL, 0, '');

--
-- Triggers `ringers`
--
DELIMITER $$
CREATE TRIGGER `delete_from_schedule_after_ringer` BEFORE DELETE ON `ringers` FOR EACH ROW delete from schedule where ringer = old.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ringing_days`
--

CREATE TABLE `ringing_days` (
  `active_ringing_day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ringing_days`
--

INSERT INTO `ringing_days` (`active_ringing_day`) VALUES
('2024-11-29'),
('2024-11-30'),
('2024-12-01'),
('2024-12-04'),
('2024-12-07'),
('2024-12-08'),
('2024-12-11'),
('2024-12-14'),
('2024-12-15'),
('2024-12-18'),
('2024-12-21'),
('2024-12-22'),
('2024-12-23'),
('2024-12-24');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `dt` date NOT NULL,
  `slot` smallint(6) NOT NULL,
  `ringer` smallint(11) NOT NULL,
  `location` smallint(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`dt`, `slot`, `ringer`, `location`) VALUES
('2024-12-07', 600, 294, 300),
('2024-12-07', 400, 294, 300),
('2024-12-07', 500, 294, 300),
('2024-12-07', 50, 294, 300),
('2024-12-07', 100, 294, 300),
('2024-12-07', 300, 294, 300),
('2024-12-07', 700, 294, 300),
('2024-12-07', 200, 294, 300),
('2024-12-18', 800, 363, 200),
('2024-12-18', 700, 377, 200),
('2024-12-18', 600, 376, 200),
('2024-12-18', 500, 364, 200),
('2024-12-18', 400, 287, 200),
('2024-12-18', 300, 374, 200),
('2024-12-18', 200, 373, 200),
('2024-12-18', 100, 373, 200),
('2024-12-18', 50, 372, 200),
('2024-12-11', 800, 364, 200),
('2024-12-11', 700, 378, 200),
('2024-12-11', 600, 370, 200),
('2024-12-11', 500, 369, 200),
('2024-12-11', 400, 368, 200),
('2024-12-11', 300, 367, 200),
('2024-12-11', 200, 371, 200),
('2024-12-11', 100, 366, 200),
('2024-12-11', 50, 365, 200),
('2024-12-04', 800, 364, 200),
('2024-12-04', 700, 363, 200),
('2024-12-04', 600, 362, 200),
('2024-12-04', 500, 361, 200),
('2024-12-04', 400, 378, 200),
('2024-12-04', 300, 379, 200),
('2024-12-04', 200, 358, 200),
('2024-12-04', 100, 357, 200),
('2024-12-04', 50, 356, 200),
('2024-12-07', 800, 294, 300),
('2024-12-22', 800, 300, 300),
('2024-12-22', 700, 300, 300),
('2024-12-22', 600, 300, 300),
('2024-12-22', 500, 300, 300),
('2024-12-22', 400, 300, 300),
('2024-12-22', 300, 300, 300),
('2024-12-22', 200, 300, 300),
('2024-12-22', 100, 300, 300),
('2024-12-22', 50, 300, 300),
('2024-12-15', 800, 300, 300),
('2024-12-15', 700, 300, 300),
('2024-12-15', 600, 300, 300),
('2024-12-15', 500, 300, 300),
('2024-12-15', 400, 300, 300),
('2024-12-15', 300, 300, 300),
('2024-12-15', 200, 300, 300),
('2024-12-15', 100, 300, 300),
('2024-12-15', 50, 300, 300),
('2024-12-08', 800, 300, 300),
('2024-12-08', 700, 300, 300),
('2024-12-08', 600, 300, 300),
('2024-12-08', 500, 300, 300),
('2024-12-08', 400, 300, 300),
('2024-12-08', 300, 300, 300),
('2024-12-08', 200, 300, 300),
('2024-12-08', 100, 300, 300),
('2024-12-08', 50, 300, 300),
('2024-12-01', 800, 300, 300),
('2024-12-01', 700, 300, 300),
('2024-12-01', 600, 300, 300),
('2024-12-01', 500, 300, 300),
('2024-12-01', 400, 300, 300),
('2024-12-01', 300, 300, 300),
('2024-12-01', 200, 300, 300),
('2024-12-01', 100, 300, 300),
('2024-12-01', 50, 300, 300),
('2024-12-07', 900, 302, 200),
('2024-12-04', 900, 302, 200),
('2024-12-01', 900, 302, 200),
('2024-11-30', 900, 302, 200),
('2024-11-29', 900, 302, 200),
('2024-12-08', 900, 302, 200),
('2024-12-11', 900, 302, 200),
('2024-12-14', 900, 302, 200),
('2024-12-15', 900, 302, 200),
('2024-12-18', 900, 302, 200),
('2024-12-21', 900, 302, 200),
('2024-12-22', 900, 302, 200),
('2024-12-24', 900, 302, 200),
('2024-12-14', 200, 303, 300),
('2024-12-18', 200, 303, 300),
('2024-12-24', 300, 303, 300),
('2024-12-04', 200, 306, 100),
('2024-12-11', 200, 306, 100),
('2024-12-18', 50, 328, 100),
('2024-12-04', 400, 307, 100),
('2024-12-11', 400, 307, 100),
('2024-12-18', 400, 307, 100),
('2024-12-07', 900, 307, 100),
('2024-12-04', 900, 307, 100),
('2024-11-30', 100, 309, 100),
('2024-11-30', 200, 309, 100),
('2024-12-14', 100, 309, 100),
('2024-12-14', 200, 309, 100),
('2024-12-18', 500, 309, 100),
('2024-12-18', 600, 309, 100),
('2024-12-24', 700, 311, 100),
('2024-12-23', 700, 336, 100),
('2024-11-29', 500, 311, 100),
('2024-11-29', 500, 312, 200),
('2024-11-29', 300, 315, 200),
('2024-11-29', 400, 315, 200),
('2024-11-30', 100, 315, 300),
('2024-11-30', 200, 315, 300),
('2024-12-04', 400, 315, 300),
('2024-12-04', 500, 315, 300),
('2024-12-04', 300, 317, 300),
('2024-12-11', 300, 317, 100),
('2024-12-14', 300, 317, 300),
('2024-12-18', 300, 317, 300),
('2024-11-29', 100, 318, 200),
('2024-11-29', 200, 318, 200),
('2024-12-01', 200, 318, 200),
('2024-12-21', 400, 395, 100),
('2024-12-04', 700, 318, 100),
('2024-12-08', 200, 318, 200),
('2024-11-29', 100, 310, 100),
('2024-11-29', 200, 310, 100),
('2024-12-01', 200, 310, 100),
('2024-12-14', 500, 320, 200),
('2024-12-14', 400, 320, 200),
('2024-11-29', 800, 322, 300),
('2024-11-29', 900, 322, 300),
('2024-11-30', 800, 322, 300),
('2024-11-30', 900, 322, 300),
('2024-12-04', 800, 322, 300),
('2024-12-04', 900, 322, 300),
('2024-12-11', 800, 322, 300),
('2024-12-11', 900, 322, 300),
('2024-12-18', 800, 322, 300),
('2024-12-18', 900, 322, 300),
('2024-12-24', 100, 318, 200),
('2024-12-11', 500, 305, 100),
('2024-12-15', 400, 305, 200),
('2024-12-15', 400, 304, 100),
('2024-12-08', 400, 304, 100),
('2024-12-01', 400, 304, 100),
('2024-12-08', 400, 305, 200),
('2024-12-04', 300, 305, 100),
('2024-12-01', 400, 305, 200),
('2024-12-11', 700, 1, 300),
('2024-12-04', 100, 324, 300),
('2024-12-11', 100, 324, 100),
('2024-12-23', 100, 324, 100),
('2024-11-29', 700, 325, 100),
('2024-11-29', 800, 325, 100),
('2024-12-11', 600, 325, 100),
('2024-12-18', 700, 325, 100),
('2024-12-18', 800, 325, 100),
('2024-12-24', 50, 325, 100),
('2024-12-24', 100, 325, 100),
('2024-12-15', 700, 325, 100),
('2024-12-15', 800, 325, 100),
('2024-12-07', 500, 326, 200),
('2024-12-07', 400, 327, 200),
('2024-12-14', 800, 326, 200),
('2024-12-14', 900, 326, 100),
('2024-12-15', 900, 326, 100),
('2024-12-04', 100, 328, 100),
('2024-12-07', 300, 389, 100),
('2024-12-18', 100, 306, 100),
('2024-12-14', 100, 331, 300),
('2024-12-18', 100, 331, 300),
('2024-12-04', 700, 287, 300),
('2024-11-29', 700, 287, 300),
('2024-12-18', 700, 287, 300),
('2024-12-18', 600, 287, 300),
('2024-11-30', 700, 287, 300),
('2024-11-30', 600, 287, 300),
('2024-11-29', 600, 333, 300),
('2024-12-04', 200, 333, 300),
('2024-12-11', 50, 334, 100),
('2024-12-04', 50, 380, 100),
('2024-11-29', 500, 330, 300),
('2024-12-21', 700, 352, 300),
('2024-12-11', 600, 330, 300),
('2024-12-14', 600, 330, 300),
('2024-12-18', 500, 330, 300),
('2024-12-21', 600, 352, 300),
('2024-12-24', 600, 330, 300),
('2024-12-04', 800, 335, 100),
('2024-12-24', 900, 311, 100),
('2024-11-29', 900, 336, 100),
('2024-12-24', 900, 311, 300),
('2024-12-18', 900, 336, 100),
('2024-12-11', 900, 336, 100),
('2024-12-23', 800, 336, 100),
('2024-12-23', 900, 336, 100),
('2024-11-29', 50, 337, 300),
('2024-11-29', 100, 337, 300),
('2024-11-30', 50, 337, 200),
('2024-11-30', 100, 337, 200),
('2024-11-30', 400, 337, 200),
('2024-11-30', 500, 337, 200),
('2024-12-01', 50, 337, 100),
('2024-12-01', 100, 337, 100),
('2024-12-04', 600, 337, 300),
('2024-12-24', 100, 337, 300),
('2024-12-24', 50, 337, 300),
('2024-12-01', 500, 337, 100),
('2024-12-01', 600, 337, 100),
('2024-12-07', 50, 337, 100),
('2024-12-07', 800, 337, 100),
('2024-12-08', 50, 337, 100),
('2024-12-08', 100, 337, 100),
('2024-12-11', 50, 337, 300),
('2024-12-11', 100, 337, 300),
('2024-12-14', 500, 337, 100),
('2024-12-14', 50, 337, 200),
('2024-12-15', 50, 337, 100),
('2024-12-15', 100, 337, 100),
('2024-12-15', 500, 337, 100),
('2024-12-15', 600, 337, 100),
('2024-12-21', 50, 337, 300),
('2024-12-21', 100, 337, 300),
('2024-12-21', 400, 337, 300),
('2024-12-21', 500, 337, 300),
('2024-12-22', 50, 337, 100),
('2024-12-22', 100, 337, 100),
('2024-12-24', 400, 337, 300),
('2024-12-24', 500, 337, 300),
('2024-12-23', 50, 337, 300),
('2024-12-23', 100, 337, 300),
('2024-12-23', 500, 337, 300),
('2024-12-23', 600, 337, 300),
('2024-12-22', 500, 337, 100),
('2024-12-22', 600, 337, 100),
('2024-12-18', 400, 337, 300),
('2024-12-14', 100, 337, 200),
('2024-12-14', 600, 337, 100),
('2024-11-29', 700, 337, 200),
('2024-11-29', 800, 337, 200),
('2024-12-08', 600, 337, 100),
('2024-12-08', 700, 337, 100),
('2024-12-18', 50, 337, 300),
('2024-12-23', 50, 338, 100),
('2024-11-29', 50, 338, 100),
('2024-12-08', 200, 339, 100),
('2024-11-30', 200, 349, 200),
('2024-12-08', 50, 315, 200),
('2024-12-08', 100, 315, 200),
('2024-12-11', 200, 315, 300),
('2024-12-11', 300, 315, 300),
('2024-12-01', 900, 336, 100),
('2024-12-01', 800, 336, 100),
('2024-12-08', 800, 336, 100),
('2024-12-08', 900, 336, 100),
('2024-12-08', 300, 341, 200),
('2024-11-30', 300, 342, 100),
('2024-11-30', 400, 342, 100),
('2024-12-01', 500, 342, 200),
('2024-12-14', 200, 342, 200),
('2024-12-14', 300, 342, 200),
('2024-12-01', 800, 322, 200),
('2024-12-07', 800, 322, 200),
('2024-12-14', 800, 322, 300),
('2024-12-14', 900, 322, 300),
('2024-12-15', 800, 322, 200),
('2024-12-21', 800, 322, 300),
('2024-12-21', 900, 322, 300),
('2024-12-22', 800, 322, 200),
('2024-12-21', 700, 343, 100),
('2024-12-21', 800, 343, 100),
('2024-12-21', 900, 343, 100),
('2024-12-22', 700, 343, 100),
('2024-12-22', 800, 343, 100),
('2024-12-22', 900, 343, 100),
('2024-11-29', 200, 343, 300),
('2024-11-29', 300, 343, 300),
('2024-12-14', 400, 344, 300),
('2024-12-14', 500, 344, 300),
('2024-12-01', 900, 345, 300),
('2024-12-08', 900, 345, 300),
('2024-12-15', 900, 345, 300),
('2024-12-22', 900, 345, 300),
('2024-11-29', 400, 345, 100),
('2024-12-14', 700, 327, 200),
('2024-12-23', 900, 326, 300),
('2024-11-30', 900, 341, 100),
('2024-11-30', 800, 341, 100),
('2024-12-07', 900, 341, 300),
('2024-12-07', 700, 346, 200),
('2024-12-23', 900, 302, 200),
('2024-11-30', 50, 347, 300),
('2024-12-11', 400, 347, 300),
('2024-12-14', 50, 347, 300),
('2024-12-21', 200, 347, 300),
('2024-12-23', 200, 347, 300),
('2024-12-24', 200, 347, 300),
('2024-12-01', 300, 348, 100),
('2024-12-15', 700, 287, 200),
('2024-12-21', 300, 287, 100),
('2024-12-21', 300, 322, 200),
('2024-12-23', 300, 287, 100),
('2024-12-23', 300, 322, 200),
('2024-12-24', 300, 287, 100),
('2024-12-24', 300, 322, 200),
('2024-12-04', 50, 308, 300),
('2024-12-21', 300, 308, 300),
('2024-12-23', 300, 308, 300),
('2024-11-30', 800, 308, 200),
('2024-12-11', 500, 329, 300),
('2024-11-30', 500, 329, 100),
('2024-11-30', 600, 329, 100),
('2024-11-29', 300, 349, 100),
('2024-12-14', 700, 349, 300),
('2024-11-30', 300, 349, 200),
('2024-12-07', 100, 287, 100),
('2024-12-08', 500, 349, 100),
('2024-11-29', 50, 350, 200),
('2024-11-30', 50, 350, 100),
('2024-12-23', 400, 352, 300),
('2024-12-24', 400, 327, 200),
('2024-12-24', 500, 326, 200),
('2024-11-30', 300, 353, 300),
('2024-12-24', 200, 353, 200),
('2024-11-30', 600, 354, 200),
('2024-11-30', 700, 318, 200),
('2024-11-30', 700, 310, 100),
('2024-11-29', 600, 378, 200),
('2024-11-29', 600, 321, 100),
('2024-12-07', 300, 378, 200),
('2024-12-01', 700, 287, 200),
('2024-12-07', 700, 287, 100),
('2024-12-22', 700, 287, 200),
('2024-12-07', 600, 311, 100),
('2024-12-21', 600, 311, 100),
('2024-12-15', 300, 311, 100),
('2024-12-23', 400, 311, 100),
('2024-12-24', 800, 392, 100),
('2024-12-07', 600, 316, 200),
('2024-12-15', 300, 316, 200),
('2024-12-21', 200, 316, 100),
('2024-12-23', 500, 316, 200),
('2024-12-24', 200, 316, 100),
('2024-12-14', 300, 380, 100),
('2024-12-18', 200, 380, 100),
('2024-12-23', 800, 380, 300),
('2024-12-08', 300, 380, 100),
('2024-12-01', 600, 1, 200),
('2024-12-15', 100, 381, 200),
('2024-12-15', 200, 381, 200),
('2024-12-08', 500, 381, 200),
('2024-12-08', 600, 381, 200),
('2024-12-22', 500, 381, 200),
('2024-12-22', 600, 381, 200),
('2024-11-30', 400, 382, 300),
('2024-12-07', 200, 382, 100),
('2024-12-14', 50, 382, 100),
('2024-12-21', 400, 382, 200),
('2024-12-23', 500, 382, 100),
('2024-12-14', 400, 321, 100),
('2024-11-30', 500, 383, 300),
('2024-12-01', 300, 383, 200),
('2024-12-24', 600, 383, 100),
('2024-12-22', 400, 383, 100),
('2024-12-21', 600, 384, 200),
('2024-12-21', 700, 384, 200),
('2024-12-23', 400, 384, 200),
('2024-12-07', 100, 385, 200),
('2024-12-14', 700, 385, 100),
('2024-12-21', 100, 385, 200),
('2024-12-22', 200, 385, 100),
('2024-12-15', 200, 385, 100),
('2024-12-23', 100, 385, 200),
('2024-12-23', 800, 386, 200),
('2024-12-21', 200, 386, 200),
('2024-12-07', 200, 308, 200),
('2024-12-23', 700, 308, 300),
('2024-11-29', 400, 387, 300),
('2024-12-04', 500, 327, 100),
('2024-12-04', 600, 327, 100),
('2024-12-01', 50, 387, 200),
('2024-12-01', 100, 387, 200),
('2024-12-01', 700, 355, 100),
('2024-12-08', 700, 355, 200),
('2024-12-18', 300, 388, 100),
('2024-12-14', 800, 287, 100),
('2024-12-14', 600, 315, 200),
('2024-12-21', 50, 315, 200),
('2024-12-22', 50, 315, 200),
('2024-12-22', 100, 315, 200),
('2024-12-23', 50, 315, 200),
('2024-12-24', 50, 315, 200),
('2024-12-15', 500, 315, 200),
('2024-12-15', 600, 315, 200),
('2024-12-22', 300, 316, 100),
('2024-12-22', 300, 391, 200),
('2024-12-07', 50, 392, 200),
('2024-12-07', 400, 392, 100),
('2024-12-07', 500, 392, 100),
('2024-12-08', 800, 392, 200),
('2024-12-11', 800, 348, 100),
('2024-12-23', 200, 348, 100),
('2024-12-23', 200, 353, 200),
('2024-12-11', 700, 395, 100),
('2024-12-15', 50, 311, 200),
('2024-12-21', 100, 399, 100),
('2024-12-22', 200, 353, 200),
('2024-12-22', 400, 320, 200),
('2024-12-21', 500, 1, 100),
('2024-12-21', 500, 315, 200),
('2024-12-21', 800, 287, 200),
('2024-12-23', 600, 350, 200),
('2024-12-23', 700, 350, 200),
('2024-12-23', 600, 381, 100),
('2024-12-24', 400, 323, 100),
('2024-12-21', 50, 336, 100),
('2024-12-24', 500, 401, 100),
('2024-12-24', 600, 355, 200),
('2024-12-24', 700, 355, 200),
('2024-12-24', 700, 397, 300),
('2024-12-24', 800, 392, 200),
('2024-12-24', 800, 392, 300);

-- --------------------------------------------------------

--
-- Table structure for table `swaps`
--

CREATE TABLE `swaps` (
  `swapId` int(10) UNSIGNED NOT NULL,
  `requesterId` smallint(11) UNSIGNED NOT NULL,
  `requesterSlotId` smallint(11) UNSIGNED NOT NULL,
  `requesterLocationId` smallint(11) UNSIGNED NOT NULL,
  `requesterDate` date NOT NULL,
  `requesteeId` smallint(11) UNSIGNED NOT NULL,
  `requesteeSlotId` smallint(11) UNSIGNED NOT NULL,
  `requesteeLocationId` smallint(11) UNSIGNED NOT NULL,
  `requesteeDate` date NOT NULL,
  `swapStatus` enum('A','D','N') NOT NULL DEFAULT 'N' COMMENT 'A=Accepted, D=declined, N=No status '
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `swaps`
--

INSERT INTO `swaps` (`swapId`, `requesterId`, `requesterSlotId`, `requesterLocationId`, `requesterDate`, `requesteeId`, `requesteeSlotId`, `requesteeLocationId`, `requesteeDate`, `swapStatus`) VALUES
(1, 60, 800, 300, '2019-12-16', 124, 900, 300, '2019-12-16', 'N'),
(2, 60, 800, 300, '2019-12-16', 124, 900, 300, '2019-12-16', 'N'),
(3, 60, 800, 300, '2019-12-16', 124, 900, 300, '2019-12-16', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `timeslots`
--

CREATE TABLE `timeslots` (
  `id` smallint(11) NOT NULL,
  `time` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `timeslots`
--

INSERT INTO `timeslots` (`id`, `time`) VALUES
(100, '10 AM to 11 AM'),
(200, '11 AM to 12 Noon'),
(300, '12 Noon to 1 PM'),
(400, '1 PM to 2 PM'),
(500, '2 PM to 3 PM'),
(600, '3 PM to 4 PM'),
(700, '4 PM to 5 PM'),
(800, '5 PM to 6 PM'),
(900, '6 PM $$ Pickup'),
(50, '9 AM to 10 AM');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_individual_schedule`
-- (See below for the actual view)
--
CREATE TABLE `v_individual_schedule` (
`Date` date
,`Day` varchar(9)
,`Name` varchar(51)
,`Time` varchar(30)
,`Location` varchar(20)
,`ringer` smallint(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_schedule`
-- (See below for the actual view)
--
CREATE TABLE `v_schedule` (
`dt` date
,`slot` smallint(6)
,`ringer` smallint(11)
,`location` smallint(11)
,`fname` varchar(20)
,`lname` varchar(30)
,`email` varchar(50)
,`password` varchar(255)
,`interval` varchar(30)
,`location_name` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_schedule_with_phone`
-- (See below for the actual view)
--
CREATE TABLE `v_schedule_with_phone` (
`dt` date
,`slot` smallint(6)
,`ringer` smallint(11)
,`location` smallint(11)
,`fname` varchar(20)
,`lname` varchar(30)
,`email` varchar(50)
,`password` varchar(255)
,`phone` char(13)
,`interval` varchar(30)
,`location_name` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `v_individual_schedule`
--
DROP TABLE IF EXISTS `v_individual_schedule`;

CREATE VIEW `v_individual_schedule`  AS SELECT `v_schedule`.`dt` AS `Date`, dayname(`v_schedule`.`dt`) AS `Day`, concat(`v_schedule`.`fname`,' ',`v_schedule`.`lname`) AS `Name`, `v_schedule`.`interval` AS `Time`, `v_schedule`.`location_name` AS `Location`, `v_schedule`.`ringer` AS `ringer` FROM `v_schedule` WHERE `v_schedule`.`dt` >= curdate() ORDER BY `v_schedule`.`dt` ASC, `v_schedule`.`interval` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `v_schedule`
--
DROP TABLE IF EXISTS `v_schedule`;

CREATE  VIEW `v_schedule`  AS SELECT `s`.`dt` AS `dt`, `s`.`slot` AS `slot`, `s`.`ringer` AS `ringer`, `s`.`location` AS `location`, `r`.`fname` AS `fname`, `r`.`lname` AS `lname`, `r`.`email` AS `email`, `r`.`password` AS `password`, `t`.`time` AS `interval`, `L`.`location_name` AS `location_name` FROM (((`schedule` `s` left join `ringers` `r` on(`s`.`ringer` = `r`.`id`)) left join `timeslots` `t` on(`s`.`slot` = `t`.`id`)) left join `locations` `L` on(`s`.`location` = `L`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_schedule_with_phone`
--
DROP TABLE IF EXISTS `v_schedule_with_phone`;

CREATE  VIEW `v_schedule_with_phone`  AS SELECT `s`.`dt` AS `dt`, `s`.`slot` AS `slot`, `s`.`ringer` AS `ringer`, `s`.`location` AS `location`, `r`.`fname` AS `fname`, `r`.`lname` AS `lname`, `r`.`email` AS `email`, `r`.`password` AS `password`, `r`.`phone` AS `phone`, `t`.`time` AS `interval`, `L`.`location_name` AS `location_name` FROM (((`schedule` `s` left join `ringers` `r` on(`s`.`ringer` = `r`.`id`)) left join `timeslots` `t` on(`s`.`slot` = `t`.`id`)) left join `locations` `L` on(`s`.`location` = `L`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administration`
--
ALTER TABLE `administration`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `administrators`
--
ALTER TABLE `administrators`
  ADD UNIQUE KEY `listing_order` (`listing_order`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `location` (`location_name`);

--
-- Indexes for table `ringers`
--
ALTER TABLE `ringers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_2` (`email`);

--
-- Indexes for table `ringing_days`
--
ALTER TABLE `ringing_days`
  ADD UNIQUE KEY `idx_active_ringing_day` (`active_ringing_day`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD UNIQUE KEY `Unique Index` (`dt`,`slot`,`location`);

--
-- Indexes for table `swaps`
--
ALTER TABLE `swaps`
  ADD PRIMARY KEY (`swapId`);

--
-- Indexes for table `timeslots`
--
ALTER TABLE `timeslots`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ringers`
--
ALTER TABLE `ringers`
  MODIFY `id` smallint(11) NOT NULL AUTO_INCREMENT COMMENT 'AUTO INCREMENT', AUTO_INCREMENT=404;

--
-- AUTO_INCREMENT for table `swaps`
--
ALTER TABLE `swaps`
  MODIFY `swapId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
