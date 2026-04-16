-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 15, 2026 at 07:23 PM
-- Server version: 10.5.26-MariaDB-cll-lve
-- PHP Version: 8.4.19

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
-- Table structure for table `password_reset_token`
--

DROP TABLE IF EXISTS `password_reset_token`;
CREATE TABLE `password_reset_token` (
  `id` int(11) NOT NULL,
  `ringer_id` int(11) NOT NULL,
  `token_hash` char(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_token`
--

INSERT INTO `password_reset_token` (`id`, `ringer_id`, `token_hash`, `expires_at`, `created_at`) VALUES
(12, 404, 'c6dba9a1bf55f258c4db42dbda34704623d7e271324d4897f818f2a74d171cd6', '2026-04-16 02:15:20', '2026-04-15 18:15:20');

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
(404, 'Mark', 'Zeiger', 'mark.zeiger@gmail.com', '719-494-7718', '$2y$10$5RUGPD5qHp3MSaaLQY9KQ.tqNjgmXvO1HD.FPOjRgTFxYZfslI3yS', NULL, NULL, 0, ''),
(419, 'Lewis-Palmer', 'Middle School', 'danglopez+1@msn.com', '719-358-1017', '$2y$10$tv4v1Je1cg77WQYTuqyLd.XrKNbe6.UWE5ww3G8YjrTeuCdTnUi/u', NULL, NULL, 0, ''),
(408, 'Same as', 'East Door', 'no-reply@noreply.xxx', '222-222-2222', '$2y$10$SSscaWoduozPw7MwX25MU.b3Df3t983TKmSSBviwjte0IVidLNsAm', NULL, NULL, 1, ''),
(409, 'Slot', 'Canceled', 'canceled@noreply.com', '222-222-2222', '$2y$10$A8vUHn51VDrGiWEuTu8ZIuXK0alf7onyHA9oWXEOObFSqkbuyk0SG', NULL, NULL, 1, ''),
(410, 'Special Pickup', 'Time', 'specialpickup@noreply.noreply', '222-222-2222', '$2y$10$wBkgXTHghNgOgm/WW5rDjOXv3HU4ey.frJ8Ag7nFKTQ7Vdm5deWAq', NULL, NULL, 1, ''),
(411, 'Jill', 'Markworth', 'jmarkworth@comcast.net', '719-641-0299', '$2y$10$PeswB3T8jtjSERza/BeQNOx5Ubcc/XWjW9KVgCAWvNvEISttUoepS', NULL, NULL, 0, ''),
(420, 'Key', 'Club', 'mike.luginbuhl+1@comcast.net', '719-313-8532', '$2y$10$dRtVWT/JLJtmJ/980Qp8GuXFDMc8CnQ2l5rmd8HpajTRNYTcNCn66', NULL, NULL, 0, ''),
(424, 'William', 'Baker', 'wjeffreybaker@gmail.com', '860-989-8881', '$2y$10$ls4sUywljyjKLotD6g2j4u2NpVLg706k3oFIwwj7sDwQKcEU/F/XK', NULL, NULL, 0, ''),
(422, 'Daniel', 'Lopez', 'danglopez@msn.com', '719-358-1017', '$2y$10$o1bw6aSWpPKDeV0L1T58VeRNXxhB34h/dRcf/MURKx7hnJ5nRAcOy', NULL, NULL, 0, ''),
(423, 'Heidi', 'Baker', 'bakerheidi58@gmail.com', '860-208-7075', '$2y$10$WiaFSeZnk1QarkecN2mYjOSlmMedar.mqmwN1hU9FvPgD0x2sQDQ.', NULL, NULL, 0, ''),
(425, 'Dennis', 'Beasley', 'pdcbcos@gmail.com', '719-208-9569', '$2y$10$Rcu7L7T63R4YzOAyV1ztkeaiy3JijQuFgQ9UW41ntSRlSfBn8R6Nq', NULL, NULL, 0, ''),
(426, 'Joe', 'Kneedler', 'kneedlerjoe33@gmail.com', '832-776-5446', '$2y$10$eORJ8kw7B3OaiP51bq0H6O/VOF0sHFT9BRGW7ppalkJQsl/HUBBvO', NULL, NULL, 0, ''),
(427, 'Cay', 'Price', 'cayprice@gmail.com', '832-444-3925', '$2y$10$hBGjwEa/5Ks3xRRSD9/lIOJasmaF6Phpe/6q6lqjb1diDyflYxaXG', NULL, NULL, 0, ''),
(428, 'Ronald', 'Mangiarelli', 'nonnon@mangiarelli.com', '719-331-9941', '$2y$10$SW9ave7s15DrOGfYoBTLFObVFU6Ykk92i3AVn/4RKCgwx/CwKeaem', NULL, NULL, 0, ''),
(429, 'Charles', 'Brown', 'cbrown41@comcast.net', '719-433-6626', '$2y$10$Cx1iI/092xSCUE9AgTTLcuH9Zv0WKYmcMiRcwCOu8F2EJzcsAxUV.', NULL, NULL, 0, ''),
(430, 'Richard', 'Hicks', 'rich7100@comcast.net', '719-440-7536', '$2y$10$WDjZKmp9Tw5YQywfmF8kH.8BH5RpslevGdckX0pSd/v2xN/E71g/2', NULL, NULL, 0, ''),
(431, 'Bill', 'Kaelin', 'williamkaelin@gmail.com', '719-964-1037', '$2y$10$FDWfY5dOUL5ciyWa2zjhU.oq1/oB59IngGxuHC4snFsnhAnoPHfmi', NULL, NULL, 0, ''),
(432, 'Howard Jack', 'Fry', 'hjfry67@gmail.com', '719-339-8456', '$2y$10$yyqzoYI9RpYy4kLNm1R0je6EBd6udxYTatQdVn/3Q0EbbSjLM2Qzy', NULL, NULL, 0, ''),
(433, 'Susan', 'Leggiero', 'sleggie26@me.com', '719-440-8969', '$2y$10$euBxh8jM86mij1UPjYd8Vu1wShMZ6AfkCCPCaNBCD15DHInDkErXi', NULL, NULL, 0, ''),
(434, 'Ed', 'Tomlinson', 'etomlinson24@comcast.net', '719-650-3522', '$2y$10$aWMG//MHx9FYbIvrQhNv5OVhudNnEOaje7Vwq11CgzohzLx.aDEfa', NULL, NULL, 0, ''),
(435, 'Chuck', 'Leggiero', 'ramcoach26@me.com', '719-440-8970', '$2y$10$H/IAQ/cLwXIjpNfQM11P4.FIadSvsw5T0PBuKPr3I7h76Yi8qZgjy', NULL, NULL, 0, ''),
(436, 'Scott', 'Ross', 'scott@rosses.me', '719-661-9078', '$2y$10$XoVfHcuB9/54sBQvQywTEedJAGtGZ3yIrSeKBhpjWzk.jcEZlZ71O', NULL, NULL, 0, ''),
(437, 'Bob', 'Harrigan', 'bobharrigan@me.com', '847-902-7664', '$2y$10$HHE1b8GYJiktdF495cyAoeN22Rl1KURQ2AIiY.fowUO5ItIIAVMYy', NULL, NULL, 0, ''),
(438, 'RF', 'Smith', 'rff106k@gmail.com', '719-210-4987', '$2y$10$5oCl.bY7frF9uZJ5hxMwLO44LQYEhl0KkGvu6RyEMvP4aMtxkcOmO', NULL, NULL, 0, ''),
(439, 'James', 'Murphy', 'patt.and.jim@gmail.com', '719-487-9327', '$2y$10$dB7J2h2xkdT39odi75gUEeZp80flV3tBFLO8xl8ycJB.TwSpexiEy', NULL, NULL, 0, ''),
(440, 'Ben', 'Bellis', 'benbellis@hotmail.com', '671-637-9467', '$2y$10$2rD0hOJfFjBcnkvZ7dD7kO1tx0LMBC.zld8I4F9Sg86026XRrdee2', NULL, NULL, 0, ''),
(441, 'Chris', 'Kupko', 'kupkofamily@gmail.com', '719-661-4926', '$2y$10$5s1/aOSb4KyXZZRJmUM2euIrA5tjuGGN/W4X9wmmedKCh2Z.Li96W', NULL, NULL, 0, ''),
(442, 'Jim', 'Wolf', 'akwlfpck@gmail.com', '804-704-2532', '$2y$10$prq1d7Rs2gdb3waZTPxGq.QhN85bqAu2ZUbUXiQo9.MJxXDZEw4om', NULL, NULL, 0, ''),
(443, 'Mike', 'Luginbuhl', 'mike.luginbuhl@comcast.net', '719-313-8532', '$2y$10$PNnaKvzutYoNz3zszIBEmO03JWss.xicjuiZ909sNHA2bU33hPhFi', NULL, NULL, 0, ''),
(444, 'Dave', 'Collins', 'davecollins@cc-logic.com', '719-413-7374', '$2y$10$jeArabVlEWWDa3xMnDeTCu1ZFMYCkurYm8vYWwQXKwYwoBEl/DMrW', NULL, NULL, 0, ''),
(445, 'Sue', 'Reinecke', 'sereinecke@msn.com', '719-661-2911', '$2y$10$1AzKzyXPUDZnqENMy3gsn.Vezq6jbRjRkCVKvXJ6RMFL5tOsKi3iC', NULL, NULL, 0, ''),
(446, 'Dave', 'Bailey', 'daveb@baileyassociates.us', '408-821-5121', '$2y$10$fMzQkEows421CLO2SgppleGPTV6ybftUx00LRNuDVqI8Yd0Tzu7AK', NULL, NULL, 0, ''),
(448, 'Ted', 'Bauman', 'mr2ba1024@aol.com', '719-331-7673', '$2y$10$A5xpcbpDje/vRBw5QkprDeBXtqcG0IqtQQiWmWkII6hZfZozcaqGW', NULL, NULL, 0, ''),
(447, 'Mark', 'Anderson', 'mark@marksmywords.com', '719-339-7053', '$2y$10$h30QYYG0gFLBaGWzc5EP1uHr.ehE/N8sky5l4VKL7V55Rld3I.rku', NULL, NULL, 0, ''),
(449, 'Jim', 'Head', 'jhhead@comcast.net', '719-510-2941', '$2y$10$w52F09ITP6N.t8SLtKF.5ujhMshZ3FN8K5Zc20pscXfCfpo1/I9xW', NULL, NULL, 0, ''),
(450, 'Robert', 'Knoth', 'r.l.r.knoth@gmail.com', '719-650-9897', '$2y$10$7ABKPw6lc/c6sQdqdRfIT.Og1wolZOp5qWmdMo/HwOmHEZRjpLe3e', NULL, NULL, 0, ''),
(451, 'Larry', 'Young', 'llyoung610@gmail.com', '360-355-6485', '$2y$10$RGPc7YzknPAvlqekmZSD1.4UHph70.YRj1gtDzOonw5NC3pZE0McS', NULL, NULL, 0, ''),
(452, 'Paul', 'Gourley', 'pgourley53@yahoo.com', '307-630-2958', '$2y$10$zTH8Ggj2uloCsIXfAiH2I.BatT/ja18NYBZT8oCY6l0Xz8mbYQTg2', NULL, NULL, 0, ''),
(453, 'Alan', 'Thompson', 'mustangthompson@verizon.net', '310-612-1220', '$2y$10$3n.UV43Qtgy8zzB0F.G5Lu8G67yDO2BXSGRRqQZU7bqStrHDHJsZ6', NULL, NULL, 0, ''),
(455, 'Doni', 'Gourley', 'dkgsnoopy@yahoo.com', '307-630-2491', '$2y$10$rXuxiKdEAi7GvQiLaZ.Ob.7aqR1ATHJhBhboeCi1Zr9ZyUbYbB0lS', NULL, NULL, 0, ''),
(456, 'Larry', 'Vliet', 'lv8014@comcast.net', '719-761-3118', '$2y$10$XtHHhO1zyPjicZUv.z6BweUQJaGkdVmMVQYHM7bVObieTsQEnDrym', NULL, NULL, 0, ''),
(457, 'Paul', 'Baker', '2bakerz@comcast.net', '719-502-7256', '$2y$10$tVDLvvQYVV51LqJHhCw9N.6ilT/wfAUuAwAYyrHmI0eC3KMgQ6LVi', NULL, NULL, 0, ''),
(458, 'Ofie', 'Lopez', 'ofielopez@yahoo.com', '719-487-9989', '$2y$10$zFjbuVX2K4RfjCnxBd5Xz.yrHCwn2Ln8.QDeYlwr9yVfeLbmDyvqa', NULL, NULL, 0, ''),
(459, 'Pete', 'Peterson', 'pete80132@gmail.com', '714-271-5947', '$2y$10$lkBbJsR1ELacrSmku8D1deFwrigswrNspZl/4oKk5QqwTXG590jre', NULL, NULL, 0, ''),
(460, 'Benny', 'Nasser', 'benasser19r@gmail.com', '719-488-3189', '$2y$10$tM.U1nRQL6f/Dw8CBwHl4eNSc0GBQqvlOJNX6CAeiKTfpIqfID89u', NULL, NULL, 0, ''),
(461, 'Dean', 'Snow', 'dean.snow@gmail.com', '719-351-8528', '$2y$10$cqGGVn7QFSM9GzDAw6XLbud5/qNuUKh7VHPyCuG5jz7tG4Zkjdd3e', NULL, NULL, 0, ''),
(462, 'Richard', 'Strom', 'rsappraisals_6@msn.com', '719-963-4464', '$2y$10$ddpHUfoqlo0036jgRMVFRujDDI5/spXa8E1czyWzwOOYLHTi9Zfrm', NULL, NULL, 0, ''),
(463, 'Frank', 'DeLalla', 'fdelalla@aol.com', '719-339-3567', '$2y$10$2417KtERtwad06m9Ky5YkOksJefKDvnrr7w4xMdrpXvxTYmdlPrcK', NULL, NULL, 0, ''),
(464, 'Markus', 'Galle', 'mark.galle@spartanxcorp.com', '719-231-7257', '$2y$10$LVGbzBh0w1JmfbMxXyOdPuFnbuVD3c.IkeBuSrPA3kVZ2Y6DuCLQq', NULL, NULL, 0, ''),
(465, 'Jim', 'Johnston', 'jjohns5122@aol.com', '719-660-7297', '$2y$10$GU4x9divhZKRyH0.Ys5YYuKi6vPfpFgcZwtAY0Q6JRQYz701QQQ16', NULL, NULL, 0, ''),
(466, 'Greg', 'Bielanski', 'gbielanski@msn.com', '719-761-1875', '$2y$10$6pccn2CMfb6ZUqgq2qxnGeT7wG0VmWa/xdPbHje8ZgGrZLoer8n4q', NULL, NULL, 0, ''),
(467, 'Julie', 'Shook', 'jaeshook@gmail.com', '719-351-0408', '$2y$10$rb0rOxw.4hqegWbk.yYa6.H9USwUTz/txPrbxOTOQeGbAMtNmjrgG', NULL, NULL, 0, ''),
(468, 'Pamela', 'Acuff', 'acuffconsulting@me.com', '402-960-1118', '$2y$10$2KHvnMHdRwLsg5YJkrDpLuEjsQIp3tlGOYbx7oZpTTuFAAlOEVAFy', NULL, NULL, 0, ''),
(469, 'Kristi', 'Westhoff', 'kwesthoff@comcast.net', '719-338-5494', '$2y$10$PyKN/D98cbLyz5cQLw0dK.k0.dy.vBeVgFQG3K3iF8n2PgKfCDfIK', NULL, NULL, 0, ''),
(470, 'Judy', 'Williamson', 'jmfwmson@yahoo.com', '719-337-8485', '$2y$10$RS.5HJYUI1Cetdtafi/L5.0Bg0P0hWfdG8UGxyr18tZZxNg/PL0Pu', NULL, NULL, 0, ''),
(471, 'Judy ', 'Sawyer', 'jubloom64@yahoo.com', '719-728-9828', '$2y$10$o09Hf1saN6jfNXfPnvOfIu8UuTORSb3zuPASCRjKA32W65RnErtNC', NULL, NULL, 0, ''),
(472, 'Lynne ', 'Caletti', 'glcalet@comcast.net', '719-651-3471', '$2y$10$xoywC8X8e8wCFZMMmreyGe0oNcQ30sCTXtaX2i1mJDNWv6.IkwKNS', NULL, NULL, 0, ''),
(473, 'Vonda', 'Dowdy', 'vondadowdy@msn.com', '719-330-4785', '$2y$10$v1xFyve7TMGaUOGIt5khTey7nzFgaTBPY2l2NKCvBty7hsBcb0GhG', NULL, NULL, 0, ''),
(474, 'Sandy', 'Mangiarelli', 'sandy@mangiarelli.com', '719-351-0180', '$2y$10$kPXTF8Zeh/r9RZSs1xpYfu.YW1R6CJrLQBxXs1M/CCjT.mzk2RtE.', NULL, NULL, 0, ''),
(475, 'Koko', 'Pavich', 'tkpavich@yahoo.com', '808-866-0686', '$2y$10$2vaZP7OVNDLbs34PXMXN4uGPt0husLzgU9zaH7OP04epvIqjukJu6', NULL, NULL, 0, ''),
(476, 'Donna', 'Muench', 'mtndonna@comcast.net', '719-659-0383', '$2y$10$lwFJ8W3j7OghxjAcyLola.SdkOuqAuQFESuZ6oB8oCNiDFYPMYb2e', NULL, NULL, 0, ''),
(477, 'Kate', 'Best', 'kadohutch@gmail.com', '512-437-1048', '$2y$10$yyIdz3mLsIU/EW7cb35IVO2dN6ZpN6B/2QfsF1NI8IkxImrau2XqW', NULL, NULL, 0, ''),
(478, 'Phoebe', 'Auld', 'paauld2@gmail.com', '512-663-0631', '$2y$10$Ms0SfCdYTkMcLn8iAH4uQexT6FwF49j/DsIQci6KUkwkOWpAsbMg6', NULL, NULL, 0, ''),
(479, 'Dixie', 'Canon', 'dixican@comcast.net', '719-761-9284', '$2y$10$YXE5sZqj6OEnwyNiMlmZ/O8vJQkYwotbCB25QcaJepE1GfTmLlWr.', NULL, NULL, 0, ''),
(480, 'Carol', 'Costakis', 'costakis.carol@gmail.com', '219-707-1455', '$2y$10$V/pUt4E9RWkb3IzVWkDsYO76lfzwH485mxu6kj2vqGFTHJoPKAoRW', NULL, NULL, 0, ''),
(481, 'Carolyn', 'Baker', 'bakercl801@gmail.com', '703-869-2164', '$2y$10$sKWHsiwb5jkcIZaDUJe9Z.vhjOcBlGROl.GsrI1zHn2s49WMC1oeC', NULL, NULL, 0, ''),
(482, 'Carmen', 'Carubia', 'rcarubia@aol.com', '719-659-3248', '$2y$10$1NXhP8BGOoUHJ4gRspD3q.1gmLhdBTq5053Wv1IRS5j/.4BtJwJ0W', NULL, NULL, 0, ''),
(483, 'Sally', 'Keding', 'sallou12@yahoo.com', '847-710-2071', '$2y$10$nYYd91jR04L4YPA.SH8a2u9otAa8uiDHm.nJPCy4VaxMt6gnTYqem', NULL, NULL, 0, ''),
(484, 'Billie', 'Healy', 'famhealy@comcast.net', '719-510-0925', '$2y$10$jj1QLe587phCD.4DiUP8rOwZU0sVO0APq.SiH/Y73Q9TJZ/5Cn7oe', NULL, NULL, 0, ''),
(485, 'Charlie', 'Hayes', 'nonahayes@comcast.net', '719-237-3863', '$2y$10$Oh/PswZUGDjwDahoXt4txul36Y0ij4Sa6wVn.MEUfIgMR6EIgJeR2', NULL, NULL, 0, ''),
(486, 'Cathy', 'Wedo', 'cmwedo@comcast.net', '719-290-2833', '$2y$10$mrIsHKSbz6SVrYpni0vR9eby7Aq3LGuVMOkaDqTwtvu9dCOQblely', NULL, NULL, 0, ''),
(487, 'Nancy', 'Pokorny', 'nancyp5315@gmail.com', '720-299-6043', '$2y$10$6NXws1fo1imPcX6H8z2oB.1FGkxWGGTaxMUBQ3Id7WTpJRrizaJcq', NULL, NULL, 0, ''),
(488, 'Maureen', 'Morgan', 'maureenmorgan@mindspring.com', '719-641-5305', '$2y$10$XwfgXofySVAAYfouReq/..M0QTOzYYFX9mvzjl3ywC.6mdU4tRBaS', NULL, NULL, 0, ''),
(489, 'Cyndi', 'Preston', 'prestoncynthia@rocketmail.com', '719-310-8037', '$2y$10$bm5vaB1UWxpYD.31VHIMvu8QcNiVxXkJuUCOHdZofQo8fj4DVmR16', NULL, NULL, 0, ''),
(490, 'Diana', 'Faust', 'dlfaust1986@gmail.com', '214-354-9538', '$2y$10$4VGzlXoPwnaT1yBVINPtwe70i4bvvD4N/MxEmbvzrVXchqJmVP.J2', NULL, NULL, 0, ''),
(491, 'Susan', 'Propst', 'susan.propst@zoho.com', '719-466-7070', '$2y$10$ZYZD32O1a4qdqOhSECdYCOM8cBiupzN21Tj8WmkAyiRC/lBgUMNp2', NULL, NULL, 0, ''),
(492, 'Bryan', 'Hardesty', 'blhardesty@comcast.net', '408-396-9059', '$2y$10$6sMCQ0.P0f1.0ZIrY3JqbulsmYmwIHSF98LBJ0amq80sKki4gKOBS', NULL, NULL, 0, ''),
(493, 'Richard', 'Salverson', 'dsalver@hughes.net', '469-307-1507', '$2y$10$m3OzSwo8fLGS874kcH2KYeM29nhKtcC9CClJDGbKMD2nG0nWtDqge', NULL, NULL, 0, ''),
(494, 'Chris', 'Wilson', 'cwwilson45@yahoo.com', '615-516-3880', '$2y$10$min8YFIq9BwMa7s9l1sEReJl03XR.eKZ9Kxa2i9e8seuqANwDoH3m', NULL, NULL, 0, ''),
(495, '', '', '', '', '$2y$10$6joREiIY5aUMrmkvyLrOdOuyZxrFMSMdrcofUyqsQhXj2BTdr.Frm', NULL, NULL, 0, ''),
(496, 'Sheila', 'Ferguson', 'nonprofit.ldr.sheila@gmail.com', '901-830-7896', '$2y$10$yugm1zt.j8P7IG/NTVkoc.Hm0uLR8l6U2nTzQycS86rH2A5gGUSAe', NULL, NULL, 0, ''),
(497, 'Jim', 'Hatley', 'trilakesdoors@gmail.com', '719-213-1598', '$2y$10$CNie5/FiqWPSGRwMrchme.MxXGfBBl3UXPIQge/cFk05KkETWJwXq', NULL, NULL, 0, ''),
(498, 'Rick', 'Schoenlein', 'rjschoenlein@msn.com', '317-376-3850', '$2y$10$yLxjRo9P.L75yDbpuk0LFeIMK8B1i4qUCciqjm7U7k1D/QE9lni4a', NULL, NULL, 0, ''),
(499, 'Jerry', 'Bash', 'jbash7352@aol.com', '719-339-8905', '$2y$10$PGELPUgzmpBp4hiXFIOituXhe95qUj/YRwEp6wmthGMSvJBE8lKgG', NULL, NULL, 0, ''),
(500, 'Steve', 'Hall', 'sertomasteve@aol.com', '719-597-9184', '$2y$10$jE.RGG1psC8bjeKyUff.leUwb0NrUoa/1jnyX7X3cqgluNXpBgnYK', NULL, NULL, 0, ''),
(501, 'Bill', 'Stoner', 'clonestone@msn.com', '719-231-4799', '$2y$10$MXxkAjHQSYxv8s.4p.Ie1u/VfNzRUyWRZymlWQvdgmz0rhApGl6i2', NULL, NULL, 0, ''),
(502, 'Sonja', 'Baumgarten', 'sonjabplano@verizon.net', '469-387-7319', '$2y$10$fiW3DmShqYcwkLggXFnTPeZLmXHfFHkGqYmdXcefo.fFUfGLDxn8W', NULL, NULL, 0, '');

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
('2025-12-03', 50, 467, 200),
('2025-12-03', 100, 468, 200),
('2025-12-03', 200, 411, 200),
('2025-12-03', 300, 469, 200),
('2025-12-03', 400, 470, 200),
('2025-12-03', 500, 471, 200),
('2025-12-03', 600, 472, 200),
('2025-12-03', 700, 473, 200),
('2025-12-03', 800, 474, 200),
('2025-12-10', 50, 475, 200),
('2025-12-10', 100, 476, 200),
('2025-12-10', 200, 477, 200),
('2025-12-10', 300, 478, 200),
('2025-12-10', 400, 478, 200),
('2025-12-10', 500, 479, 200),
('2025-12-10', 600, 480, 200),
('2025-12-10', 700, 481, 200),
('2025-12-10', 800, 482, 200),
('2025-12-17', 50, 483, 200),
('2025-12-17', 100, 470, 200),
('2025-12-17', 200, 484, 200),
('2025-12-17', 300, 433, 200),
('2025-12-17', 400, 411, 200),
('2025-12-17', 500, 486, 200),
('2025-12-17', 600, 487, 200),
('2025-12-17', 700, 481, 200),
('2025-12-17', 800, 474, 200),
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
('2025-12-13', 900, 409, 200),
('2025-12-14', 900, 409, 200),
('2025-12-17', 900, 408, 200),
('2025-12-20', 900, 408, 200),
('2025-12-21', 900, 408, 200),
('2025-12-23', 900, 408, 200),
('2025-12-24', 700, 409, 200),
('2025-12-24', 800, 409, 300),
('2025-12-24', 900, 439, 300),
('2025-12-24', 800, 409, 200),
('2025-12-24', 800, 409, 100),
('2025-12-24', 900, 439, 100),
('2025-12-24', 900, 408, 200),
('2025-12-24', 700, 409, 100),
('2025-12-24', 400, 435, 100),
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
('2025-12-10', 700, 409, 300),
('2025-12-13', 700, 423, 300),
('2025-12-14', 700, 409, 200),
('2025-12-17', 700, 423, 300),
('2025-12-20', 700, 423, 300),
('2025-12-21', 700, 423, 200),
('2025-12-23', 700, 423, 300),
('2025-12-23', 500, 452, 200),
('2025-12-06', 300, 425, 300),
('2025-12-10', 300, 425, 300),
('2025-12-20', 300, 425, 300),
('2025-11-29', 300, 425, 300),
('2025-11-28', 200, 426, 200),
('2025-11-28', 300, 426, 200),
('2025-12-24', 200, 490, 200),
('2025-12-24', 300, 491, 200),
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
('2025-12-20', 800, 428, 100),
('2025-12-20', 700, 428, 100),
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
('2025-12-20', 400, 493, 100),
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
('2025-12-06', 500, 494, 100),
('2025-12-07', 100, 499, 100),
('2025-12-10', 400, 438, 100),
('2025-12-10', 500, 438, 100),
('2025-12-14', 400, 409, 100),
('2025-12-14', 500, 409, 100),
('2025-12-17', 400, 438, 100),
('2025-12-17', 500, 438, 100),
('2025-12-21', 400, 438, 100),
('2025-12-21', 500, 438, 100),
('2025-12-23', 600, 438, 200),
('2025-12-23', 300, 464, 100),
('2025-12-07', 800, 439, 100),
('2025-12-07', 900, 439, 100),
('2025-12-10', 800, 439, 100),
('2025-12-10', 900, 439, 100),
('2025-12-14', 800, 409, 100),
('2025-12-14', 900, 409, 100),
('2025-12-21', 800, 439, 100),
('2025-12-21', 900, 439, 100),
('2025-11-28', 400, 440, 200),
('2025-11-28', 500, 440, 200),
('2025-11-29', 400, 440, 200),
('2025-11-29', 500, 440, 200),
('2025-12-10', 200, 441, 100),
('2025-12-17', 200, 441, 100),
('2025-12-23', 200, 441, 100),
('2025-12-24', 50, 488, 200),
('2025-12-24', 100, 489, 200),
('2025-12-24', 400, 433, 200),
('2025-12-06', 200, 492, 200),
('2025-11-29', 600, 492, 200),
('2025-12-24', 200, 426, 100),
('2025-12-24', 300, 426, 100),
('2025-11-30', 900, 443, 300),
('2025-12-14', 900, 446, 300),
('2025-12-21', 900, 443, 300),
('2025-11-28', 100, 443, 200),
('2025-12-23', 800, 444, 100),
('2025-12-03', 600, 444, 100),
('2025-12-17', 600, 444, 100),
('2025-11-28', 100, 445, 100),
('2025-11-29', 100, 445, 100),
('2025-11-30', 100, 445, 100),
('2025-12-06', 100, 445, 100),
('2025-12-17', 800, 424, 300),
('2025-12-10', 50, 445, 300),
('2025-12-13', 100, 409, 200),
('2025-12-14', 100, 409, 100),
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
('2025-12-14', 50, 409, 200),
('2025-12-14', 100, 409, 200),
('2025-12-17', 300, 447, 300),
('2025-12-17', 400, 447, 300),
('2025-12-20', 400, 447, 300),
('2025-12-20', 500, 447, 300),
('2025-12-21', 50, 447, 200),
('2025-12-21', 100, 447, 200),
('2025-12-23', 50, 447, 300),
('2025-12-23', 100, 447, 300),
('2025-12-24', 50, 430, 300),
('2025-12-24', 100, 430, 300),
('2025-11-28', 600, 434, 300),
('2025-12-03', 600, 434, 300),
('2025-12-10', 600, 409, 300),
('2025-12-17', 600, 434, 300),
('2025-12-06', 50, 448, 300),
('2025-12-10', 800, 409, 300),
('2025-12-13', 100, 409, 100),
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
('2025-12-24', 100, 450, 100),
('2025-12-24', 50, 450, 100),
('2025-12-23', 200, 450, 300),
('2025-12-23', 300, 450, 300),
('2025-12-23', 50, 497, 200),
('2025-12-17', 50, 450, 300),
('2025-12-14', 300, 409, 100),
('2025-12-14', 200, 409, 100),
('2025-12-10', 700, 450, 100),
('2025-11-28', 50, 450, 100),
('2025-12-23', 600, 450, 100),
('2025-12-23', 700, 450, 100),
('2025-11-28', 800, 451, 300),
('2025-12-17', 500, 451, 300),
('2025-12-06', 500, 451, 300),
('2025-12-13', 600, 451, 300),
('2025-12-23', 400, 434, 300),
('2025-11-30', 600, 451, 100),
('2025-11-29', 600, 451, 300),
('2025-12-03', 400, 451, 100),
('2025-12-07', 600, 451, 100),
('2025-12-21', 500, 451, 200),
('2025-11-28', 50, 453, 300),
('2025-12-06', 300, 455, 200),
('2025-12-07', 400, 455, 200),
('2025-12-13', 200, 409, 200),
('2025-12-14', 200, 409, 200),
('2025-12-06', 300, 452, 100),
('2025-12-07', 400, 452, 100),
('2025-12-13', 200, 409, 100),
('2025-12-14', 300, 409, 200),
('2025-12-20', 900, 428, 100),
('2025-12-13', 700, 409, 100),
('2025-12-13', 800, 409, 100),
('2025-12-13', 900, 409, 100),
('2025-12-03', 800, 424, 300),
('2025-12-03', 900, 424, 300),
('2025-11-30', 700, 424, 100),
('2025-12-06', 800, 424, 300),
('2025-12-06', 900, 424, 300),
('2025-12-20', 800, 424, 300),
('2025-12-20', 900, 424, 300),
('2025-12-24', 500, 424, 100),
('2025-11-30', 900, 449, 100),
('2025-11-29', 900, 449, 100),
('2025-12-13', 300, 409, 200),
('2025-12-13', 400, 409, 200),
('2025-12-20', 400, 456, 200),
('2025-12-20', 500, 456, 200),
('2025-11-29', 600, 457, 100),
('2025-12-03', 500, 457, 100),
('2025-12-06', 600, 457, 100),
('2025-12-13', 500, 409, 200),
('2025-12-20', 600, 457, 200),
('2025-12-23', 900, 404, 300),
('2025-12-07', 300, 458, 200),
('2025-12-13', 50, 409, 200),
('2025-12-14', 400, 409, 200),
('2025-11-28', 900, 451, 300),
('2025-11-29', 900, 451, 300),
('2025-12-10', 900, 451, 300),
('2025-12-06', 900, 459, 100),
('2025-12-23', 900, 459, 100),
('2025-12-03', 300, 465, 300),
('2025-12-17', 900, 459, 300),
('2025-12-13', 600, 409, 100),
('2025-11-28', 700, 460, 300),
('2025-11-28', 700, 423, 200),
('2025-11-29', 700, 423, 200),
('2025-12-13', 50, 409, 100),
('2025-12-13', 300, 409, 100),
('2025-12-13', 400, 409, 100),
('2025-12-13', 500, 409, 100),
('2025-12-13', 600, 409, 200),
('2025-12-13', 700, 409, 200),
('2025-12-13', 800, 409, 200),
('2025-12-14', 50, 409, 100),
('2025-12-14', 600, 409, 100),
('2025-12-14', 700, 409, 100),
('2025-12-14', 500, 409, 200),
('2025-12-14', 600, 409, 200),
('2025-12-14', 800, 409, 200),
('2025-11-30', 500, 455, 200),
('2025-11-30', 600, 452, 200),
('2025-11-28', 600, 424, 100),
('2025-11-30', 400, 442, 200),
('2025-12-07', 500, 442, 200),
('2025-12-12', 600, 409, 300),
('2025-11-30', 800, 464, 100),
('2025-11-29', 800, 424, 300),
('2025-11-28', 600, 430, 200),
('2025-12-06', 400, 465, 300),
('2025-12-06', 100, 466, 200),
('2025-12-20', 100, 466, 200),
('2025-12-23', 100, 466, 200),
('2025-12-21', 300, 466, 200),
('2025-11-29', 700, 430, 100),
('2025-11-29', 800, 430, 100),
('2025-12-20', 700, 492, 200),
('2025-12-20', 800, 492, 200),
('2025-11-29', 50, 494, 100),
('2025-11-28', 50, 462, 200),
('2025-11-30', 800, 462, 200),
('2025-11-29', 800, 494, 200),
('2025-12-23', 500, 457, 300),
('2025-11-29', 700, 463, 300),
('2025-11-28', 800, 452, 200),
('2025-11-29', 300, 426, 100),
('2025-11-30', 50, 430, 100),
('2025-12-07', 600, 424, 200),
('2025-12-13', 800, 424, 300),
('2025-12-06', 600, 497, 200),
('2025-12-07', 500, 497, 100),
('2025-12-20', 600, 497, 100),
('2025-12-07', 50, 445, 100),
('2025-12-06', 200, 499, 300),
('2025-12-20', 300, 499, 100),
('2025-12-21', 600, 499, 200),
('2025-12-24', 400, 499, 300),
('2025-12-13', 50, 450, 300),
('2025-12-03', 50, 430, 300),
('2025-12-20', 50, 500, 300),
('2025-12-24', 600, 500, 300),
('2025-12-06', 400, 424, 200),
('2025-12-06', 400, 423, 100),
('2025-12-06', 200, 430, 100),
('2025-12-13', 900, 424, 300),
('2025-12-06', 700, 430, 100),
('2025-12-06', 100, 499, 300),
('2025-12-07', 800, 423, 200),
('2025-12-06', 500, 423, 200),
('2025-12-23', 800, 424, 200),
('2025-12-07', 50, 430, 200),
('2025-12-21', 800, 424, 200),
('2025-12-20', 500, 493, 100),
('2025-12-21', 300, 493, 100),
('2025-12-17', 100, 450, 300),
('2025-12-20', 200, 498, 300),
('2025-12-23', 400, 464, 100),
('2025-12-23', 500, 464, 100),
('2025-12-24', 600, 439, 100),
('2025-12-24', 700, 409, 300),
('2025-12-24', 500, 501, 200),
('2025-12-24', 600, 501, 200),
('2025-12-20', 50, 501, 200),
('2025-12-24', 200, 448, 300),
('2025-12-20', 600, 462, 300),
('2025-12-23', 200, 462, 200),
('2025-12-24', 300, 462, 300),
('2025-12-23', 400, 455, 200),
('2025-12-24', 500, 499, 300),
('2025-12-23', 300, 435, 200);

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
-- Indexes for table `password_reset_token`
--
ALTER TABLE `password_reset_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_hash` (`token_hash`),
  ADD KEY `ringer_id` (`ringer_id`);

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
-- AUTO_INCREMENT for table `password_reset_token`
--
ALTER TABLE `password_reset_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ringers`
--
ALTER TABLE `ringers`
  MODIFY `id` smallint(11) NOT NULL AUTO_INCREMENT COMMENT 'AUTO INCREMENT', AUTO_INCREMENT=503;

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
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_individual_schedule`  AS SELECT `v_schedule`.`dt` AS `Date`, dayname(`v_schedule`.`dt`) AS `Day`, concat(`v_schedule`.`fname`,' ',`v_schedule`.`lname`) AS `Name`, `v_schedule`.`interval` AS `Time`, `v_schedule`.`location_name` AS `Location`, `v_schedule`.`ringer` AS `ringer` FROM `v_schedule` WHERE `v_schedule`.`dt` >= curdate() ORDER BY `v_schedule`.`dt` ASC, `v_schedule`.`interval` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `v_schedule`
--
DROP TABLE IF EXISTS `v_schedule`;

DROP VIEW IF EXISTS `v_schedule`;
CREATE ALGORITHM=UNDEFINED DEFINER=`monumen8`@`localhost` SQL SECURITY DEFINER VIEW `v_schedule`  AS SELECT `s`.`dt` AS `dt`, `s`.`slot` AS `slot`, `s`.`ringer` AS `ringer`, `s`.`location` AS `location`, `r`.`fname` AS `fname`, `r`.`lname` AS `lname`, `r`.`email` AS `email`, `r`.`password` AS `password`, `t`.`time` AS `interval`, `L`.`location_name` AS `location_name` FROM (((`schedule` `s` left join `ringers` `r` on(`s`.`ringer` = `r`.`id`)) left join `timeslots` `t` on(`s`.`slot` = `t`.`id`)) left join `locations` `L` on(`s`.`location` = `L`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_schedule_with_phone`
--
DROP TABLE IF EXISTS `v_schedule_with_phone`;

DROP VIEW IF EXISTS `v_schedule_with_phone`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_schedule_with_phone`  AS SELECT `s`.`dt` AS `dt`, `s`.`slot` AS `slot`, `s`.`ringer` AS `ringer`, `s`.`location` AS `location`, `r`.`fname` AS `fname`, `r`.`lname` AS `lname`, `r`.`email` AS `email`, `r`.`password` AS `password`, `r`.`phone` AS `phone`, `t`.`time` AS `interval`, `L`.`location_name` AS `location_name` FROM (((`schedule` `s` left join `ringers` `r` on(`s`.`ringer` = `r`.`id`)) left join `timeslots` `t` on(`s`.`slot` = `t`.`id`)) left join `locations` `L` on(`s`.`location` = `L`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_schedule_with_phone_administrator`
--
DROP TABLE IF EXISTS `v_schedule_with_phone_administrator`;

DROP VIEW IF EXISTS `v_schedule_with_phone_administrator`;
CREATE ALGORITHM=UNDEFINED DEFINER=`monumen8`@`localhost` SQL SECURITY DEFINER VIEW `v_schedule_with_phone_administrator`  AS SELECT `s`.`dt` AS `dt`, `s`.`slot` AS `slot`, `s`.`ringer` AS `ringer`, `s`.`location` AS `location`, `r`.`fname` AS `fname`, `r`.`lname` AS `lname`, `r`.`email` AS `email`, `r`.`password` AS `password`, `r`.`phone` AS `phone`, `r`.`administrator` AS `administrator`, `t`.`time` AS `interval`, `L`.`location_name` AS `location_name` FROM (((`schedule` `s` left join `ringers` `r` on(`s`.`ringer` = `r`.`id`)) left join `timeslots` `t` on(`s`.`slot` = `t`.`id`)) left join `locations` `L` on(`s`.`location` = `L`.`id`)) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
