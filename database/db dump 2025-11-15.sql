-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 15, 2025 at 02:39 PM
-- Server version: 10.5.26-MariaDB-cll-lve
-- PHP Version: 8.4.14

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

DROP TABLE IF EXISTS `administration`;
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

DROP TABLE IF EXISTS `administrators`;
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

DROP TABLE IF EXISTS `locations`;
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

DROP TABLE IF EXISTS `ringers`;
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
(404, 'Mark', 'Zeiger', 'mark.zeiger@gmail.com', '719-494-7718', '$2y$10$QXnk7.UHRzNlJsWnkNUuaeJtKqNMDi5flyskjn82R4fpc6apXMd4.', NULL, NULL, 0, ''),
(406, 'Tri-Lakes', 'Womans Club', 'tlwc@gmail.com', '111-111-1111', '$2y$10$KC0ZjiGretedr4uDmlfeo.TRVfbRiIpenQxC.y1SZJpOC0i0KOH0y', NULL, NULL, 0, ''),
(419, 'Lewis-Palmer', 'Middle School', 'danglopez+1@msn.com', '719-358-1017', '$2y$10$tv4v1Je1cg77WQYTuqyLd.XrKNbe6.UWE5ww3G8YjrTeuCdTnUi/u', NULL, NULL, 0, ''),
(408, 'Same as', 'East Door', 'no-reply@noreply.xxx', '222-222-2222', '$2y$10$SSscaWoduozPw7MwX25MU.b3Df3t983TKmSSBviwjte0IVidLNsAm', NULL, NULL, 1, ''),
(409, 'Slot', 'Canceled', 'canceled@noreply.com', '222-222-2222', '$2y$10$A8vUHn51VDrGiWEuTu8ZIuXK0alf7onyHA9oWXEOObFSqkbuyk0SG', NULL, NULL, 1, ''),
(410, 'Special Pickup', 'Time', 'specialpickup@noreply.noreply', '222-222-2222', '$2y$10$wBkgXTHghNgOgm/WW5rDjOXv3HU4ey.frJ8Ag7nFKTQ7Vdm5deWAq', NULL, NULL, 1, ''),
(411, 'Jill', 'Markworth', 'jmarkworth@comcast.net', '719-641-0299', '$2y$10$PeswB3T8jtjSERza/BeQNOx5Ubcc/XWjW9KVgCAWvNvEISttUoepS', NULL, NULL, 0, ''),
(420, 'Key', 'Club', 'mike.luginbuhl+1@comcast.net', '719-313-8532', '$2y$10$dRtVWT/JLJtmJ/980Qp8GuXFDMc8CnQ2l5rmd8HpajTRNYTcNCn66', NULL, NULL, 0, ''),
(424, 'William', 'Baker', 'wjeffreybaker@gmail.com', '860-989-8881', '$2y$10$ls4sUywljyjKLotD6g2j4u2NpVLg706k3oFIwwj7sDwQKcEU/F/XK', NULL, NULL, 0, ''),
(422, 'Daniel', 'Lopez', 'danglopez@msn.com', '719-358-1017', '$2y$10$o8NBVNHBcicN2uFdNcTMAumBvOuI6NXdWBlV1O8m.TxCtlC5tYkp2', NULL, NULL, 0, ''),
(423, 'Heidi', 'Baker', 'bakerheidi58@gmail.com', '860-208-7075', '$2y$10$WiaFSeZnk1QarkecN2mYjOSlmMedar.mqmwN1hU9FvPgD0x2sQDQ.', NULL, NULL, 0, ''),
(425, 'Dennis', 'Beasley', 'pdcbcos@gmail.com', '719-208-9569', '$2y$10$WUmbqtlKbYwS9YIDoki8BuHkYC4ggXLW49khYxywis/yK1O9ogluu', NULL, NULL, 0, ''),
(426, 'Joe', 'Kneedler', 'kneedlerjoe33@gmail.com', '832-776-5446', '$2y$10$eORJ8kw7B3OaiP51bq0H6O/VOF0sHFT9BRGW7ppalkJQsl/HUBBvO', NULL, NULL, 0, ''),
(427, 'Cay', 'Price', 'cayprice@gmail.com', '832-444-3925', '$2y$10$hBGjwEa/5Ks3xRRSD9/lIOJasmaF6Phpe/6q6lqjb1diDyflYxaXG', NULL, NULL, 0, ''),
(428, 'Ronald', 'Mangiarelli', 'nonnon@mangiarelli.com', '719-331-9941', '$2y$10$SW9ave7s15DrOGfYoBTLFObVFU6Ykk92i3AVn/4RKCgwx/CwKeaem', NULL, NULL, 0, ''),
(429, 'Charles', 'Brown', 'cbrown41@comcast.net', '719-433-6626', '$2y$10$Cx1iI/092xSCUE9AgTTLcuH9Zv0WKYmcMiRcwCOu8F2EJzcsAxUV.', NULL, NULL, 0, ''),
(430, 'Richard', 'Hicks', 'rich7100@comcast.net', '719-440-7536', '$2y$10$WDjZKmp9Tw5YQywfmF8kH.8BH5RpslevGdckX0pSd/v2xN/E71g/2', NULL, NULL, 0, ''),
(431, 'Bill', 'Kaelin', 'williamkaelin@gmail.com', '719-964-1037', '$2y$10$FDWfY5dOUL5ciyWa2zjhU.oq1/oB59IngGxuHC4snFsnhAnoPHfmi', NULL, NULL, 0, ''),
(432, 'Howard Jack', 'Fry', 'hjfry67@gmail.com', '719-339-8456', '$2y$10$yyqzoYI9RpYy4kLNm1R0je6EBd6udxYTatQdVn/3Q0EbbSjLM2Qzy', NULL, NULL, 0, ''),
(433, 'Susan', 'Leggiero', 'sleggie26@me.com', '719-440-8969', '$2y$10$euBxh8jM86mij1UPjYd8Vu1wShMZ6AfkCCPCaNBCD15DHInDkErXi', NULL, NULL, 0, ''),
(434, 'Ed', 'Tomlinson', 'etomlinson24@comcast.net', '719-650-3522', '$2y$10$aWMG//MHx9FYbIvrQhNv5OVhudNnEOaje7Vwq11CgzohzLx.aDEfa', NULL, NULL, 0, ''),
(435, 'Chuck', 'Leggiero', 'ramcoach26@me.com', '719-440-8970', '$2y$10$oPgcN8NmxGTBWiwRqovv0eNJGBph6DFEfA55U4cUQ2MgEfbKF42ai', NULL, NULL, 0, ''),
(436, 'Scott', 'Ross', 'scott@rosses.me', '719-661-9078', '$2y$10$XoVfHcuB9/54sBQvQywTEedJAGtGZ3yIrSeKBhpjWzk.jcEZlZ71O', NULL, NULL, 0, ''),
(437, 'Bob', 'Harrigan', 'bobharrigan@me.com', '847-902-7664', '$2y$10$JiP3OzTqLQCB3IPUQaRRH.BY.f1Ld5FAPBGMR9WskUG/ukYMNWMe.', NULL, NULL, 0, ''),
(438, 'RF', 'Smith', 'rff106k@gmail.com', '719-210-4987', '$2y$10$mpiP3Z0.SGzUKJfK/.HCPeXKLkYvdN./Fj1/XCenKA6mVE77908xi', NULL, NULL, 0, ''),
(439, 'James', 'Murphy', 'patt.and.jim@gmail.com', '719-487-9327', '$2y$10$dB7J2h2xkdT39odi75gUEeZp80flV3tBFLO8xl8ycJB.TwSpexiEy', NULL, NULL, 0, ''),
(440, 'Ben', 'Bellis', 'benbellis@hotmail.com', '671-637-9467', '$2y$10$2rD0hOJfFjBcnkvZ7dD7kO1tx0LMBC.zld8I4F9Sg86026XRrdee2', NULL, NULL, 0, ''),
(441, 'Chris', 'Kupko', 'kupkofamily@gmail.com', '719-661-4926', '$2y$10$5s1/aOSb4KyXZZRJmUM2euIrA5tjuGGN/W4X9wmmedKCh2Z.Li96W', NULL, NULL, 0, ''),
(442, 'Jim', 'Wolf', 'akwlfpck@gmail.com', '804-704-2532', '$2y$10$prq1d7Rs2gdb3waZTPxGq.QhN85bqAu2ZUbUXiQo9.MJxXDZEw4om', NULL, NULL, 0, ''),
(443, 'Mike', 'Luginbuhl', 'mike.luginbuhl@comcast.net', '719-313-8532', '$2y$10$PNnaKvzutYoNz3zszIBEmO03JWss.xicjuiZ909sNHA2bU33hPhFi', NULL, NULL, 0, ''),
(444, 'Dave', 'Collins', 'davecollins@cc-logic.com', '719-413-7374', '$2y$10$jeArabVlEWWDa3xMnDeTCu1ZFMYCkurYm8vYWwQXKwYwoBEl/DMrW', NULL, NULL, 0, ''),
(445, 'Sue', 'Reinecke', 'sereinecke@msn.com', '719-661-2911', '$2y$10$pfb8RAP3X/dBXpL/NDP5r.KuQMgAvpbVA8crNkHaCVFRYmQMVhrLm', NULL, NULL, 0, ''),
(446, 'Dave', 'Bailey', 'daveb@baileyassociates.us', '408-821-5121', '$2y$10$fMzQkEows421CLO2SgppleGPTV6ybftUx00LRNuDVqI8Yd0Tzu7AK', NULL, NULL, 0, ''),
(448, 'Ted', 'Bauman', 'mr2ba1024@aol.com', '719-331-7673', '$2y$10$A5xpcbpDje/vRBw5QkprDeBXtqcG0IqtQQiWmWkII6hZfZozcaqGW', NULL, NULL, 0, ''),
(447, 'Mark', 'Anderson', 'mark@marksmywords.com', '719-339-7053', '$2y$10$h30QYYG0gFLBaGWzc5EP1uHr.ehE/N8sky5l4VKL7V55Rld3I.rku', NULL, NULL, 0, ''),
(449, 'Jim', 'Head', 'jhhead@comcast.net', '719-510-2941', '$2y$10$w52F09ITP6N.t8SLtKF.5ujhMshZ3FN8K5Zc20pscXfCfpo1/I9xW', NULL, NULL, 0, ''),
(450, 'Robert', 'Knoth', 'r.l.r.knoth@gmail.com', '719-650-9897', '$2y$10$7ABKPw6lc/c6sQdqdRfIT.Og1wolZOp5qWmdMo/HwOmHEZRjpLe3e', NULL, NULL, 0, ''),
(451, 'Larry', 'Young', 'llyoung610@gmail.com', '360-355-6485', '$2y$10$RGPc7YzknPAvlqekmZSD1.4UHph70.YRj1gtDzOonw5NC3pZE0McS', NULL, NULL, 0, ''),
(452, 'Paul', 'Gourley', 'pgourley53@yahoo.com', '307-630-2958', '$2y$10$LPbGrDCYtoAJrsDVHYJ/r.NhiqYceterBkhJlCadLW62D833AtBVC', NULL, NULL, 0, ''),
(453, 'Alan', 'Thompson', 'mustangthompson@verizon.net', '310-612-1220', '$2y$10$3n.UV43Qtgy8zzB0F.G5Lu8G67yDO2BXSGRRqQZU7bqStrHDHJsZ6', NULL, NULL, 0, ''),
(455, 'Doni', 'Gourley', 'dkgsnoopy@yahoo.com', '307-630-2491', '$2y$10$rXuxiKdEAi7GvQiLaZ.Ob.7aqR1ATHJhBhboeCi1Zr9ZyUbYbB0lS', NULL, NULL, 0, '');

--
-- Triggers `ringers`
--
DROP TRIGGER IF EXISTS `delete_from_schedule_after_ringer`;
DELIMITER $$
CREATE TRIGGER `delete_from_schedule_after_ringer` BEFORE DELETE ON `ringers` FOR EACH ROW delete from schedule where ringer = old.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ringing_days`
--

DROP TABLE IF EXISTS `ringing_days`;
CREATE TABLE `ringing_days` (
  `active_ringing_day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ringing_days`
--

INSERT INTO `ringing_days` (`active_ringing_day`) VALUES
('2025-11-28'),
('2025-11-29'),
('2025-11-30'),
('2025-12-03'),
('2025-12-06'),
('2025-12-07'),
('2025-12-10'),
('2025-12-13'),
('2025-12-14'),
('2025-12-17'),
('2025-12-20'),
('2025-12-21'),
('2025-12-23'),
('2025-12-24');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
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
('2025-12-03', 50, 406, 200),
('2025-12-03', 100, 406, 200),
('2025-12-03', 200, 406, 200),
('2025-12-03', 300, 406, 200),
('2025-12-03', 400, 406, 200),
('2025-12-03', 500, 406, 200),
('2025-12-03', 600, 406, 200),
('2025-12-03', 700, 406, 200),
('2025-12-03', 800, 406, 200),
('2025-12-10', 50, 406, 200),
('2025-12-10', 100, 406, 200),
('2025-12-10', 200, 406, 200),
('2025-12-10', 300, 406, 200),
('2025-12-10', 400, 406, 200),
('2025-12-10', 500, 406, 200),
('2025-12-10', 600, 406, 200),
('2025-12-10', 700, 406, 200),
('2025-12-10', 800, 406, 200),
('2025-12-17', 50, 406, 200),
('2025-12-17', 100, 406, 200),
('2025-12-17', 200, 406, 200),
('2025-12-17', 300, 406, 200),
('2025-12-17', 400, 406, 200),
('2025-12-17', 500, 406, 200),
('2025-12-17', 600, 406, 200),
('2025-12-17', 700, 406, 200),
('2025-12-17', 800, 406, 200),
('2025-12-21', 800, 420, 300),
('2025-12-21', 700, 420, 300),
('2025-12-21', 600, 420, 300),
('2025-12-21', 500, 420, 300),
('2025-12-21', 400, 420, 300),
('2025-12-21', 300, 420, 300),
('2025-12-21', 200, 420, 300),
('2025-12-21', 100, 420, 300),
('2025-12-21', 50, 420, 300),
('2025-11-28', 900, 408, 200),
('2025-11-29', 900, 408, 200),
('2025-11-30', 900, 408, 200),
('2025-12-03', 900, 408, 200),
('2025-12-06', 900, 408, 200),
('2025-12-07', 900, 408, 200),
('2025-12-10', 900, 408, 200),
('2025-12-13', 900, 408, 200),
('2025-12-14', 900, 408, 200),
('2025-12-17', 900, 408, 200),
('2025-12-20', 900, 408, 200),
('2025-12-21', 900, 408, 200),
('2025-12-23', 900, 408, 200),
('2025-12-24', 700, 408, 200),
('2025-12-24', 800, 409, 300),
('2025-12-24', 900, 439, 300),
('2025-12-24', 800, 409, 200),
('2025-12-24', 800, 409, 100),
('2025-12-24', 900, 439, 100),
('2025-12-24', 900, 408, 200),
('2025-12-24', 700, 439, 100),
('2025-12-24', 700, 439, 300),
('2025-12-14', 800, 420, 300),
('2025-12-14', 700, 420, 300),
('2025-12-14', 600, 420, 300),
('2025-12-14', 500, 420, 300),
('2025-12-14', 400, 420, 300),
('2025-12-14', 300, 420, 300),
('2025-12-14', 200, 420, 300),
('2025-12-14', 100, 420, 300),
('2025-12-14', 50, 420, 300),
('2025-11-30', 800, 420, 300),
('2025-11-30', 700, 420, 300),
('2025-11-30', 600, 420, 300),
('2025-11-30', 500, 420, 300),
('2025-11-30', 400, 420, 300),
('2025-11-30', 300, 420, 300),
('2025-11-30', 200, 420, 300),
('2025-11-30', 100, 420, 300),
('2025-11-30', 50, 420, 300),
('2025-12-07', 800, 419, 300),
('2025-12-07', 700, 419, 300),
('2025-12-07', 600, 419, 300),
('2025-12-07', 500, 419, 300),
('2025-12-07', 400, 419, 300),
('2025-12-07', 300, 419, 300),
('2025-12-07', 200, 419, 300),
('2025-12-07', 100, 419, 300),
('2025-12-07', 50, 419, 300),
('2025-12-07', 900, 422, 300),
('2025-11-30', 700, 423, 200),
('2025-12-03', 700, 423, 300),
('2025-12-06', 700, 423, 300),
('2025-12-07', 700, 423, 200),
('2025-12-10', 700, 423, 300),
('2025-12-13', 700, 423, 300),
('2025-12-14', 700, 423, 200),
('2025-12-17', 700, 423, 300),
('2025-12-20', 700, 423, 300),
('2025-12-21', 700, 423, 200),
('2025-12-23', 700, 423, 300),
('2025-12-24', 500, 423, 300),
('2025-12-03', 300, 425, 300),
('2025-12-10', 300, 425, 300),
('2025-12-20', 300, 425, 300),
('2025-11-29', 300, 425, 300),
('2025-11-28', 200, 426, 200),
('2025-11-28', 300, 426, 200),
('2025-12-24', 200, 406, 200),
('2025-12-24', 300, 406, 200),
('2025-11-29', 200, 426, 200),
('2025-11-30', 200, 426, 200),
('2025-11-30', 300, 426, 200),
('2025-12-23', 700, 426, 200),
('2025-12-20', 200, 426, 200),
('2025-12-21', 200, 426, 200),
('2025-11-28', 300, 427, 100),
('2025-11-28', 200, 427, 100),
('2025-11-29', 200, 427, 100),
('2025-11-30', 300, 427, 100),
('2025-11-30', 200, 427, 100),
('2025-12-20', 200, 427, 100),
('2025-12-21', 200, 427, 100),
('2025-12-17', 700, 428, 100),
('2025-12-17', 800, 428, 100),
('2025-12-17', 900, 428, 100),
('2025-12-24', 50, 428, 100),
('2025-12-24', 100, 428, 100),
('2025-11-28', 700, 428, 100),
('2025-11-28', 800, 428, 100),
('2025-11-28', 900, 428, 100),
('2025-11-28', 200, 447, 300),
('2025-12-06', 600, 429, 300),
('2025-12-13', 100, 429, 300),
('2025-12-20', 100, 429, 300),
('2025-12-23', 600, 429, 300),
('2025-12-03', 700, 428, 100),
('2025-12-03', 800, 428, 100),
('2025-12-03', 900, 428, 100),
('2025-11-29', 300, 404, 200),
('2025-12-10', 100, 431, 300),
('2025-12-17', 100, 431, 300),
('2025-12-17', 200, 432, 300),
('2025-12-10', 200, 432, 300),
('2025-12-03', 200, 432, 300),
('2025-11-28', 400, 436, 100),
('2025-11-28', 500, 436, 100),
('2025-11-29', 400, 436, 100),
('2025-11-29', 500, 436, 100),
('2025-12-03', 50, 436, 100),
('2025-12-03', 100, 436, 100),
('2025-12-10', 50, 436, 100),
('2025-12-10', 100, 436, 100),
('2025-12-17', 50, 436, 100),
('2025-12-17', 100, 436, 100),
('2025-12-23', 50, 436, 100),
('2025-12-23', 100, 436, 100),
('2025-11-28', 100, 437, 300),
('2025-12-03', 100, 437, 300),
('2025-12-06', 400, 438, 100),
('2025-12-06', 500, 438, 100),
('2025-12-10', 400, 438, 100),
('2025-12-10', 500, 438, 100),
('2025-12-14', 400, 438, 100),
('2025-12-14', 500, 438, 100),
('2025-12-17', 400, 438, 100),
('2025-12-17', 500, 438, 100),
('2025-12-21', 400, 438, 100),
('2025-12-21', 500, 438, 100),
('2025-12-23', 400, 438, 100),
('2025-12-23', 500, 438, 100),
('2025-12-07', 800, 439, 100),
('2025-12-07', 900, 439, 100),
('2025-12-10', 800, 439, 100),
('2025-12-10', 900, 439, 100),
('2025-12-14', 800, 439, 100),
('2025-12-14', 900, 439, 100),
('2025-12-21', 800, 439, 100),
('2025-12-21', 900, 439, 100),
('2025-11-28', 400, 440, 200),
('2025-11-28', 500, 440, 200),
('2025-11-29', 400, 440, 200),
('2025-11-29', 500, 440, 200),
('2025-12-10', 200, 441, 100),
('2025-12-17', 200, 441, 100),
('2025-12-23', 200, 441, 100),
('2025-12-24', 50, 406, 200),
('2025-12-24', 100, 406, 200),
('2025-12-24', 400, 406, 200),
('2025-12-24', 500, 406, 200),
('2025-12-24', 600, 406, 200),
('2025-12-24', 200, 426, 100),
('2025-12-24', 300, 426, 100),
('2025-11-30', 900, 443, 300),
('2025-12-14', 900, 443, 300),
('2025-12-21', 900, 443, 300),
('2025-11-28', 100, 443, 200),
('2025-12-23', 800, 444, 100),
('2025-12-03', 600, 444, 100),
('2025-12-17', 600, 444, 100),
('2025-11-28', 100, 445, 100),
('2025-11-29', 100, 445, 100),
('2025-11-30', 100, 445, 100),
('2025-12-06', 100, 445, 100),
('2025-12-07', 100, 445, 100),
('2025-12-10', 50, 445, 300),
('2025-12-13', 100, 445, 200),
('2025-12-14', 100, 445, 100),
('2025-12-20', 300, 446, 200),
('2025-12-21', 400, 446, 200),
('2025-11-28', 300, 447, 300),
('2025-11-29', 100, 447, 300),
('2025-11-29', 200, 447, 300),
('2025-11-30', 50, 447, 200),
('2025-11-30', 100, 447, 200),
('2025-12-03', 400, 447, 300),
('2025-12-03', 500, 447, 300),
('2025-12-07', 100, 447, 200),
('2025-12-07', 200, 447, 200),
('2025-12-10', 400, 447, 300),
('2025-12-10', 500, 447, 300),
('2025-12-13', 200, 447, 300),
('2025-12-13', 300, 447, 300),
('2025-12-14', 50, 447, 200),
('2025-12-14', 100, 447, 200),
('2025-12-17', 300, 447, 300),
('2025-12-17', 400, 447, 300),
('2025-12-20', 400, 447, 300),
('2025-12-20', 500, 447, 300),
('2025-12-21', 50, 447, 200),
('2025-12-21', 100, 447, 200),
('2025-12-23', 50, 447, 300),
('2025-12-23', 100, 447, 300),
('2025-12-24', 50, 447, 300),
('2025-12-24', 100, 447, 300),
('2025-11-28', 600, 434, 300),
('2025-12-03', 600, 434, 300),
('2025-12-10', 600, 434, 300),
('2025-12-17', 600, 434, 300),
('2025-12-06', 50, 448, 300),
('2025-12-10', 800, 448, 300),
('2025-12-13', 100, 448, 100),
('2025-12-23', 800, 448, 300),
('2025-12-10', 600, 449, 100),
('2025-12-17', 300, 449, 100),
('2025-11-29', 50, 450, 200),
('2025-11-29', 100, 450, 200),
('2025-11-28', 400, 450, 300),
('2025-11-28', 500, 450, 300),
('2025-11-29', 400, 450, 300),
('2025-11-29', 500, 450, 300),
('2025-11-30', 400, 450, 100),
('2025-11-30', 500, 450, 100),
('2025-12-03', 200, 450, 100),
('2025-12-03', 300, 450, 100),
('2025-12-07', 200, 450, 100),
('2025-12-07', 300, 450, 100),
('2025-12-07', 700, 450, 100),
('2025-12-10', 300, 450, 100),
('2025-12-06', 50, 450, 100),
('2025-12-13', 400, 450, 300),
('2025-12-13', 500, 450, 300),
('2025-12-20', 50, 450, 100),
('2025-12-20', 100, 450, 100),
('2025-12-21', 50, 450, 100),
('2025-12-21', 100, 450, 100),
('2025-12-21', 600, 450, 100),
('2025-12-21', 700, 450, 100),
('2025-12-06', 800, 450, 100),
('2025-12-24', 200, 450, 300),
('2025-12-24', 300, 450, 300),
('2025-12-23', 200, 450, 300),
('2025-12-23', 300, 450, 300),
('2025-12-20', 600, 450, 300),
('2025-12-17', 50, 450, 300),
('2025-12-14', 300, 450, 100),
('2025-12-14', 200, 450, 100),
('2025-12-10', 700, 450, 100),
('2025-11-28', 50, 450, 100),
('2025-12-23', 600, 450, 100),
('2025-12-23', 700, 450, 100),
('2025-11-28', 700, 451, 300),
('2025-12-17', 500, 451, 300),
('2025-12-06', 500, 451, 300),
('2025-12-13', 600, 451, 300),
('2025-12-23', 400, 451, 300),
('2025-11-30', 600, 451, 100),
('2025-11-29', 600, 451, 300),
('2025-12-03', 400, 451, 100),
('2025-12-07', 600, 451, 100),
('2025-12-21', 500, 451, 200),
('2025-11-28', 50, 453, 300),
('2025-12-06', 300, 455, 200),
('2025-12-07', 400, 455, 200),
('2025-12-13', 200, 455, 200),
('2025-12-14', 200, 455, 200),
('2025-12-06', 300, 452, 100),
('2025-12-07', 400, 452, 100),
('2025-12-13', 200, 452, 100),
('2025-12-14', 300, 452, 200);

-- --------------------------------------------------------

--
-- Table structure for table `swaps`
--

DROP TABLE IF EXISTS `swaps`;
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

DROP TABLE IF EXISTS `timeslots`;
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
DROP VIEW IF EXISTS `v_individual_schedule`;
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
DROP VIEW IF EXISTS `v_schedule`;
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
DROP VIEW IF EXISTS `v_schedule_with_phone`;
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
-- Stand-in structure for view `v_schedule_with_phone_administrator`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `v_schedule_with_phone_administrator`;
CREATE TABLE `v_schedule_with_phone_administrator` (
`dt` date
,`slot` smallint(6)
,`ringer` smallint(11)
,`location` smallint(11)
,`fname` varchar(20)
,`lname` varchar(30)
,`email` varchar(50)
,`password` varchar(255)
,`phone` char(13)
,`administrator` tinyint(1)
,`interval` varchar(30)
,`location_name` varchar(20)
);

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
  MODIFY `id` smallint(11) NOT NULL AUTO_INCREMENT COMMENT 'AUTO INCREMENT', AUTO_INCREMENT=456;

--
-- AUTO_INCREMENT for table `swaps`
--
ALTER TABLE `swaps`
  MODIFY `swapId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- --------------------------------------------------------

--
-- Structure for view `v_individual_schedule`
--
DROP TABLE IF EXISTS `v_individual_schedule`;

DROP VIEW IF EXISTS `v_individual_schedule`;
CREATE VIEW `v_individual_schedule`  AS SELECT `v_schedule`.`dt` AS `Date`, dayname(`v_schedule`.`dt`) AS `Day`, concat(`v_schedule`.`fname`,' ',`v_schedule`.`lname`) AS `Name`, `v_schedule`.`interval` AS `Time`, `v_schedule`.`location_name` AS `Location`, `v_schedule`.`ringer` AS `ringer` FROM `v_schedule` WHERE `v_schedule`.`dt` >= curdate() ORDER BY `v_schedule`.`dt` ASC, `v_schedule`.`interval` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `v_schedule`
--
DROP TABLE IF EXISTS `v_schedule`;

DROP VIEW IF EXISTS `v_schedule`;
CREATE VIEW `v_schedule`  AS SELECT `s`.`dt` AS `dt`, `s`.`slot` AS `slot`, `s`.`ringer` AS `ringer`, `s`.`location` AS `location`, `r`.`fname` AS `fname`, `r`.`lname` AS `lname`, `r`.`email` AS `email`, `r`.`password` AS `password`, `t`.`time` AS `interval`, `L`.`location_name` AS `location_name` FROM (((`schedule` `s` left join `ringers` `r` on(`s`.`ringer` = `r`.`id`)) left join `timeslots` `t` on(`s`.`slot` = `t`.`id`)) left join `locations` `L` on(`s`.`location` = `L`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_schedule_with_phone`
--
DROP TABLE IF EXISTS `v_schedule_with_phone`;

DROP VIEW IF EXISTS `v_schedule_with_phone`;
CREATE VIEW `v_schedule_with_phone`  AS SELECT `s`.`dt` AS `dt`, `s`.`slot` AS `slot`, `s`.`ringer` AS `ringer`, `s`.`location` AS `location`, `r`.`fname` AS `fname`, `r`.`lname` AS `lname`, `r`.`email` AS `email`, `r`.`password` AS `password`, `r`.`phone` AS `phone`, `t`.`time` AS `interval`, `L`.`location_name` AS `location_name` FROM (((`schedule` `s` left join `ringers` `r` on(`s`.`ringer` = `r`.`id`)) left join `timeslots` `t` on(`s`.`slot` = `t`.`id`)) left join `locations` `L` on(`s`.`location` = `L`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_schedule_with_phone_administrator`
--
DROP TABLE IF EXISTS `v_schedule_with_phone_administrator`;

DROP VIEW IF EXISTS `v_schedule_with_phone_administrator`;
CREATE VIEW `v_schedule_with_phone_administrator`  AS SELECT `s`.`dt` AS `dt`, `s`.`slot` AS `slot`, `s`.`ringer` AS `ringer`, `s`.`location` AS `location`, `r`.`fname` AS `fname`, `r`.`lname` AS `lname`, `r`.`email` AS `email`, `r`.`password` AS `password`, `r`.`phone` AS `phone`, `r`.`administrator` AS `administrator`, `t`.`time` AS `interval`, `L`.`location_name` AS `location_name` FROM (((`schedule` `s` left join `ringers` `r` on(`s`.`ringer` = `r`.`id`)) left join `timeslots` `t` on(`s`.`slot` = `t`.`id`)) left join `locations` `L` on(`s`.`location` = `L`.`id`)) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
