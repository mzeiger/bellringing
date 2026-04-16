START TRANSACTUIN
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

-
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
