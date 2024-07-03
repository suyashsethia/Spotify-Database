-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: Music
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `name` varchar(255) NOT NULL,
  `creator_id` int NOT NULL,
  `release_date` date NOT NULL,
  `number_of_songs` int NOT NULL COMMENT 'Derived Attribute',
  PRIMARY KEY (`name`,`creator_id`),
  KEY `creator_id` (`creator_id`),
  CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `creators` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES ('Abbey Road',2005,'1969-09-26',4),('Flower Dance',2008,'2010-12-30',1),('Imagine',2006,'1971-09-09',3),('Master Of Puppets',2003,'1986-03-03',3),('Norman Fucking Rockwell',2001,'2019-08-30',6),('Portals',2004,'2022-04-23',4),('Titanic Rising',2002,'2019-08-05',3),('Under The Floor',2000,'2022-08-22',3),('Welcome To The Crazy Maze',2007,'2020-07-06',1);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_instruments`
--

DROP TABLE IF EXISTS `artist_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_instruments` (
  `artist_id` int NOT NULL,
  `instrument` varchar(255) NOT NULL,
  PRIMARY KEY (`artist_id`,`instrument`),
  CONSTRAINT `artist_instruments_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_instruments`
--

LOCK TABLES `artist_instruments` WRITE;
/*!40000 ALTER TABLE `artist_instruments` DISABLE KEYS */;
/*!40000 ALTER TABLE `artist_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `id` int NOT NULL,
  `occupation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`occupation`),
  CONSTRAINT `artists_ibfk_1` FOREIGN KEY (`id`) REFERENCES `creators` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (2000,'producer'),(2000,'singer'),(2000,'writer'),(2001,'singer'),(2001,'writer'),(2002,'singer'),(2002,'writer'),(2004,'guitarist'),(2006,'pianist'),(2006,'singer'),(2006,'writer'),(2007,'guitarist'),(2008,'producer');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `band_genres`
--

DROP TABLE IF EXISTS `band_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `band_genres` (
  `band_id` int NOT NULL,
  `genre` varchar(255) NOT NULL,
  PRIMARY KEY (`band_id`,`genre`),
  CONSTRAINT `band_genres_ibfk_1` FOREIGN KEY (`band_id`) REFERENCES `bands` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `band_genres`
--

LOCK TABLES `band_genres` WRITE;
/*!40000 ALTER TABLE `band_genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `band_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bands`
--

DROP TABLE IF EXISTS `bands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bands` (
  `id` int NOT NULL,
  `creation_year` year NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `bands_ibfk_1` FOREIGN KEY (`id`) REFERENCES `creators` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bands`
--

LOCK TABLES `bands` WRITE;
/*!40000 ALTER TABLE `bands` DISABLE KEYS */;
INSERT INTO `bands` VALUES (2003,1981),(2005,1960);
/*!40000 ALTER TABLE `bands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `bands_view`
--

DROP TABLE IF EXISTS `bands_view`;
/*!50001 DROP VIEW IF EXISTS `bands_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bands_view` AS SELECT 
 1 AS `id`,
 1 AS `creation_year`,
 1 AS `number_songs_released`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `belongs`
--

DROP TABLE IF EXISTS `belongs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `belongs` (
  `artist_id` int NOT NULL,
  `band_id` int NOT NULL,
  `joining_year` year NOT NULL,
  PRIMARY KEY (`artist_id`,`band_id`),
  KEY `band_id` (`band_id`),
  CONSTRAINT `belongs_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`),
  CONSTRAINT `belongs_ibfk_2` FOREIGN KEY (`band_id`) REFERENCES `bands` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `belongs`
--

LOCK TABLES `belongs` WRITE;
/*!40000 ALTER TABLE `belongs` DISABLE KEYS */;
INSERT INTO `belongs` VALUES (2004,2003,1981),(2006,2005,1960);
/*!40000 ALTER TABLE `belongs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creator_awards`
--

DROP TABLE IF EXISTS `creator_awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creator_awards` (
  `creator_id` int NOT NULL,
  `award` varchar(255) NOT NULL,
  PRIMARY KEY (`creator_id`,`award`),
  CONSTRAINT `creator_awards_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `creators` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creator_awards`
--

LOCK TABLES `creator_awards` WRITE;
/*!40000 ALTER TABLE `creator_awards` DISABLE KEYS */;
INSERT INTO `creator_awards` VALUES (2001,'ASCAP Pop Music Awards'),(2001,'Billboard Women in Music'),(2001,'Brit Awards'),(2001,'Grammy Awards'),(2001,'MTV Europe Music Awards'),(2001,'Rober music awards prize'),(2002,'Libera Awards'),(2003,'Billboard Music Awards'),(2003,'California Music Awards'),(2003,'GAFFA Awards'),(2003,'Grammy Awards'),(2003,'Hungarian Music Awards'),(2003,'iHeartRadio Music Awards'),(2003,'Juno Awards'),(2005,'Academy Awards'),(2005,'Billboard Music Awards'),(2005,'Brit Awards'),(2005,'Grammy Awards'),(2005,'Grammy Hall of Fame'),(2005,'Ivor Novello Awards'),(2005,'NME Awards'),(2005,'Rock and Roll Hall of Fame'),(2005,'UK Music Hall of Fame'),(2005,'Vocal Group Hall of Fame'),(2006,'Grammy Awards');
/*!40000 ALTER TABLE `creator_awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creators`
--

DROP TABLE IF EXISTS `creators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creators` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('individual','group') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `creators_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creators`
--

LOCK TABLES `creators` WRITE;
/*!40000 ALTER TABLE `creators` DISABLE KEYS */;
INSERT INTO `creators` VALUES (2000,3000,'Johnny Goth','individual'),(2001,3001,'Lana Del Rey','individual'),(2002,3002,'Weyes Blood','individual'),(2003,3003,'Metallica','group'),(2004,3004,'Kirk Hammett','individual'),(2005,3005,'The Beatles','group'),(2006,3006,'John Lennon','individual'),(2007,3007,'Andy James','individual'),(2008,3008,'DJ Okawari','individual');
/*!40000 ALTER TABLE `creators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_access`
--

DROP TABLE IF EXISTS `edit_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edit_access` (
  `playlist_name` varchar(255) NOT NULL,
  `creator_user_id` int NOT NULL,
  `editor_user_id` int NOT NULL,
  PRIMARY KEY (`playlist_name`,`creator_user_id`,`editor_user_id`),
  KEY `creator_user_id` (`creator_user_id`),
  KEY `editor_user_id` (`editor_user_id`),
  CONSTRAINT `edit_access_ibfk_1` FOREIGN KEY (`creator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `edit_access_ibfk_2` FOREIGN KEY (`editor_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_access`
--

LOCK TABLES `edit_access` WRITE;
/*!40000 ALTER TABLE `edit_access` DISABLE KEYS */;
INSERT INTO `edit_access` VALUES ('momentous',3000,3001),('momentous',3000,3008),('blonded',3001,3000),('blonded',3001,3003),('blonded',3001,3005),('blonded',3001,3006),('blonded',3001,3011),('blonded',3001,3014),('fine indeed',3003,3001),('fine indeed',3003,3005),('fine indeed',3003,3006),('fine indeed',3003,3007),('fine indeed',3003,3008),('fine indeed',3003,3010),('fine indeed',3003,3013),('collisions',3004,3010),('collisions',3004,3011),('collisions',3004,3014),('hell’s fusion',3005,3002),('pink sky',3005,3012),('pink sky',3005,3014),('the conspiracist',3005,3003),('the conspiracist',3005,3007),('the conspiracist',3005,3008),('the conspiracist',3005,3009),('the conspiracist',3005,3010),('the conspiracist',3005,3011),('the conspiracist',3005,3013),('american girl',3006,3000),('american girl',3006,3001),('american girl',3006,3003),('american girl',3006,3014),('palm springs',3006,3001),('music to be murdered by',3007,3000),('music to be murdered by',3007,3001),('music to be murdered by',3007,3002),('music to be murdered by',3007,3009),('license to kill',3009,3002),('license to kill',3009,3003),('license to kill',3009,3006),('white kicks',3009,3000),('white kicks',3009,3002),('white kicks',3009,3007),('white kicks',3009,3012),('dragon flame',3010,3002),('dragon flame',3010,3006),('dragon flame',3010,3008),('dragon flame',3010,3013),('psycho',3012,3011),('supernova',3012,3002),('supernova',3012,3003),('supernova',3012,3005),('supernova',3012,3009),('fallen tragedy',3013,3001),('fallen tragedy',3013,3002),('fallen tragedy',3013,3010),('super basic',3013,3000),('super basic',3013,3006),('super basic',3013,3007);
/*!40000 ALTER TABLE `edit_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label_companies`
--

DROP TABLE IF EXISTS `label_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `label_companies` (
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label_companies`
--

LOCK TABLES `label_companies` WRITE;
/*!40000 ALTER TABLE `label_companies` DISABLE KEYS */;
INSERT INTO `label_companies` VALUES ('5 Points'),('ABC-Paramount Records'),('AJR Productions LTD'),('Apple Records'),('Atlantic Records'),('Blackened'),('BMG Rights Management'),('Carpark Records'),('Elektra'),('Fat Possum Records'),('Interscope Records'),('Island Records'),('Lion Bold Records'),('Polydor'),('Red Hill Records'),('Sony Music Entertainment'),('Soundcloud'),('Stranger'),('SUB POP'),('Universal Music Publishing Group'),('Virgin Records'),('Warner Music Group'),('Wixen Music Publishing');
/*!40000 ALTER TABLE `label_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `label_companies_view`
--

DROP TABLE IF EXISTS `label_companies_view`;
/*!50001 DROP VIEW IF EXISTS `label_companies_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `label_companies_view` AS SELECT 
 1 AS `name`,
 1 AS `number_songs_labeled`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `listens`
--

DROP TABLE IF EXISTS `listens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listens` (
  `user_id` int NOT NULL,
  `song_id` int NOT NULL,
  `timestamp` timestamp NOT NULL,
  `duration` int NOT NULL,
  PRIMARY KEY (`user_id`,`song_id`,`timestamp`),
  KEY `song_id` (`song_id`),
  CONSTRAINT `listens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `listens_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listens`
--

LOCK TABLES `listens` WRITE;
/*!40000 ALTER TABLE `listens` DISABLE KEYS */;
INSERT INTO `listens` VALUES (3000,1000,'2013-12-16 16:38:11',34),(3000,1000,'2022-11-27 15:12:58',169),(3000,1004,'2016-04-01 14:59:56',161),(3000,1009,'2008-01-22 23:40:48',144),(3000,1010,'2006-07-18 03:50:06',49),(3000,1010,'2008-01-21 14:37:50',69),(3000,1012,'2018-07-24 14:58:52',40),(3000,1016,'2014-06-15 12:08:09',96),(3000,1016,'2015-11-09 20:36:20',59),(3000,1017,'2007-08-13 10:19:26',14),(3000,1022,'2006-03-05 12:57:44',103),(3000,1025,'2016-03-17 15:32:42',45),(3000,1026,'2014-12-20 02:37:26',164),(3001,1001,'2021-07-13 12:46:16',41),(3001,1002,'2013-10-26 14:29:02',49),(3001,1002,'2018-03-08 06:16:00',127),(3001,1002,'2021-06-13 02:34:06',43),(3001,1003,'2021-05-02 12:37:34',114),(3001,1005,'2021-05-09 07:34:27',4),(3001,1020,'2017-07-22 12:53:17',174),(3001,1023,'2022-08-19 02:49:31',21),(3001,1024,'2009-03-07 07:46:32',106),(3001,1027,'2007-09-20 01:15:31',157),(3002,1000,'2016-03-09 05:15:35',141),(3002,1002,'2009-07-25 12:46:32',19),(3002,1005,'2015-08-04 21:47:53',113),(3002,1006,'2021-08-09 21:50:55',168),(3002,1010,'2010-05-03 14:34:00',150),(3002,1010,'2015-04-06 16:40:23',108),(3002,1013,'2008-07-05 09:04:30',112),(3002,1017,'2011-12-17 19:28:00',125),(3002,1020,'2017-12-11 18:39:10',103),(3002,1020,'2018-11-05 03:06:49',34),(3002,1023,'2020-07-15 09:36:51',145),(3002,1024,'2016-06-09 02:24:16',15),(3002,1026,'2020-03-07 19:36:33',144),(3002,1027,'2015-03-09 05:23:31',169),(3003,1001,'2007-04-06 09:01:15',156),(3003,1001,'2007-05-26 14:23:38',87),(3003,1003,'2021-09-21 15:40:20',132),(3003,1005,'2005-08-06 01:37:11',33),(3003,1005,'2007-12-23 17:37:58',150),(3003,1009,'2007-12-08 20:58:53',143),(3003,1009,'2008-10-07 04:26:27',78),(3003,1009,'2013-12-08 08:12:49',31),(3003,1011,'2005-01-26 06:10:09',97),(3003,1011,'2013-04-09 06:09:22',95),(3003,1012,'2013-09-12 21:41:14',20),(3003,1016,'2022-12-10 01:41:35',15),(3003,1021,'2013-06-22 21:50:53',63),(3003,1022,'2019-05-23 17:40:45',62),(3003,1023,'2011-12-07 17:56:30',17),(3003,1024,'2017-02-03 09:43:13',9),(3003,1025,'2011-03-05 05:53:18',172),(3004,1003,'2013-04-10 05:55:39',17),(3004,1004,'2008-04-04 00:19:24',66),(3004,1005,'2007-08-19 02:29:33',24),(3004,1007,'2005-06-04 05:10:26',24),(3004,1010,'2012-04-05 04:47:49',88),(3004,1011,'2008-12-23 15:10:18',66),(3004,1012,'2013-08-24 08:23:51',151),(3004,1012,'2022-11-01 22:03:28',37),(3004,1013,'2009-07-01 16:14:48',118),(3004,1013,'2017-07-12 18:09:49',56),(3004,1014,'2005-04-09 11:13:44',173),(3004,1014,'2015-12-19 21:30:11',74),(3004,1017,'2010-03-15 18:19:59',102),(3004,1019,'2012-10-02 16:41:29',130),(3004,1021,'2012-11-02 07:37:51',83),(3004,1022,'2021-05-26 02:17:34',27),(3004,1025,'2008-01-05 00:03:41',95),(3004,1026,'2009-07-10 13:12:52',40),(3004,1027,'2020-01-19 21:28:05',49),(3005,1000,'2008-04-03 14:05:35',8),(3005,1000,'2013-08-14 00:13:16',73),(3005,1005,'2020-03-03 00:12:00',118),(3005,1006,'2006-12-19 06:44:03',165),(3005,1009,'2009-09-02 16:13:46',112),(3005,1009,'2015-06-11 17:48:08',30),(3005,1010,'2008-06-06 20:33:10',178),(3005,1011,'2010-03-03 04:42:36',110),(3005,1011,'2017-09-26 08:10:43',177),(3005,1012,'2005-06-18 06:07:51',74),(3005,1012,'2015-07-12 15:27:42',105),(3005,1013,'2011-06-20 00:40:21',148),(3005,1013,'2014-03-26 10:32:38',114),(3005,1015,'2013-11-24 12:42:25',32),(3005,1019,'2006-09-06 12:29:28',172),(3005,1022,'2016-12-12 11:21:32',90),(3005,1026,'2020-05-08 02:49:39',150),(3006,1001,'2013-05-26 15:27:09',77),(3006,1010,'2021-04-16 18:20:25',80),(3006,1018,'2019-05-26 04:20:44',113),(3006,1019,'2014-08-13 10:47:33',7),(3006,1023,'2009-03-17 14:11:22',120),(3006,1025,'2011-06-14 00:00:53',84),(3007,1003,'2016-10-09 04:16:52',98),(3007,1006,'2007-12-22 00:16:31',81),(3007,1010,'2015-10-01 04:43:06',178),(3007,1011,'2019-06-21 18:29:44',103),(3007,1011,'2022-05-15 18:24:01',99),(3007,1015,'2014-05-03 05:32:48',60),(3007,1016,'2022-09-25 15:32:50',63),(3007,1021,'2013-02-16 15:22:12',153),(3007,1023,'2005-01-07 20:57:12',32),(3007,1023,'2013-05-13 22:03:23',89),(3007,1025,'2013-08-26 10:23:50',118),(3007,1027,'2007-11-07 14:02:50',73),(3008,1001,'2007-10-17 08:48:37',37),(3008,1001,'2021-07-19 01:25:28',66),(3008,1002,'2017-03-18 16:09:16',13),(3008,1003,'2009-03-18 18:41:21',94),(3008,1003,'2015-06-01 03:33:09',177),(3008,1005,'2006-05-13 23:52:45',54),(3008,1013,'2018-05-02 05:21:39',117),(3008,1018,'2006-03-06 20:05:59',89),(3009,1002,'2017-11-15 04:00:36',80),(3009,1002,'2020-12-27 13:05:08',40),(3009,1004,'2012-04-22 06:17:52',93),(3009,1005,'2019-06-09 14:22:07',43),(3009,1006,'2009-05-03 08:38:45',159),(3009,1012,'2013-07-06 00:51:13',13),(3009,1012,'2021-07-10 19:49:40',95),(3009,1019,'2011-04-25 13:34:48',115),(3009,1020,'2006-04-26 05:23:12',170),(3009,1021,'2015-10-09 15:52:02',83),(3009,1022,'2010-08-02 00:17:39',49),(3009,1025,'2006-02-10 00:40:19',98),(3009,1026,'2012-10-18 06:11:20',34),(3009,1027,'2022-08-18 14:11:39',152),(3009,1027,'2022-11-17 19:48:51',34),(3010,1004,'2009-01-01 04:27:17',37),(3010,1004,'2012-03-25 18:28:40',63),(3010,1013,'2022-10-17 11:48:05',4),(3010,1014,'2019-09-22 18:09:06',166),(3010,1018,'2015-12-18 04:26:30',56),(3010,1018,'2018-06-20 12:51:51',15),(3010,1021,'2006-04-16 20:38:03',52),(3010,1026,'2022-05-23 08:11:07',165),(3010,1027,'2014-08-15 23:23:59',82),(3011,1005,'2015-02-20 22:33:19',102),(3011,1007,'2012-04-11 11:50:54',171),(3011,1008,'2005-09-04 14:02:37',105),(3011,1008,'2010-05-05 18:02:31',10),(3011,1009,'2019-03-22 20:15:45',105),(3011,1010,'2006-12-24 04:18:38',88),(3011,1013,'2017-01-07 01:28:51',97),(3011,1016,'2011-11-11 19:12:36',68),(3011,1017,'2022-10-11 20:23:43',180),(3011,1019,'2014-04-04 05:11:20',149),(3011,1023,'2011-03-14 22:06:05',107),(3011,1025,'2021-08-14 16:29:05',118),(3011,1027,'2016-05-21 22:52:52',52),(3012,1000,'2008-05-09 02:45:39',62),(3012,1000,'2011-10-15 08:44:00',154),(3012,1000,'2021-09-17 02:56:01',106),(3012,1001,'2006-07-21 00:01:13',45),(3012,1001,'2013-05-04 04:39:03',41),(3012,1001,'2017-08-24 13:26:00',39),(3012,1004,'2013-01-10 23:16:06',175),(3012,1004,'2017-10-26 02:07:08',16),(3012,1004,'2021-11-25 23:26:57',7),(3012,1010,'2008-10-18 15:57:31',117),(3012,1010,'2011-01-24 23:14:33',134),(3012,1011,'2005-06-16 21:39:50',49),(3012,1017,'2007-04-21 14:33:50',8),(3012,1017,'2019-01-18 22:17:19',58),(3012,1018,'2020-07-16 23:12:51',26),(3012,1020,'2014-02-22 15:05:30',19),(3012,1023,'2007-11-10 03:26:19',171),(3012,1023,'2014-11-12 13:10:20',119),(3012,1024,'2022-11-12 19:47:24',136),(3012,1025,'2008-08-09 15:17:49',150),(3012,1026,'2010-12-08 21:31:05',63),(3012,1026,'2013-08-11 22:11:17',35),(3013,1000,'2018-11-25 15:51:59',105),(3013,1003,'2014-11-27 16:27:50',97),(3013,1006,'2005-01-04 02:00:34',170),(3013,1006,'2009-09-21 17:27:55',113),(3013,1009,'2007-07-16 10:52:22',147),(3013,1011,'2013-01-11 19:09:17',81),(3013,1012,'2008-07-21 17:31:43',129),(3013,1015,'2006-06-19 00:48:29',148),(3013,1018,'2014-08-15 02:16:12',70),(3013,1021,'2009-10-16 12:20:43',11),(3013,1021,'2019-12-09 11:10:20',47),(3013,1022,'2022-06-10 13:37:18',58),(3013,1025,'2006-05-19 00:35:57',141),(3014,1000,'2006-03-01 22:44:04',25),(3014,1001,'2007-05-22 22:42:10',123),(3014,1001,'2010-12-05 02:50:26',79),(3014,1003,'2019-08-08 07:56:02',66),(3014,1007,'2011-12-27 06:22:05',65),(3014,1009,'2007-12-24 23:35:56',9),(3014,1011,'2015-03-20 05:51:17',3),(3014,1012,'2008-10-20 07:20:55',147),(3014,1020,'2010-05-16 10:07:57',12),(3014,1022,'2007-08-12 09:17:58',97),(3014,1024,'2008-02-25 07:25:28',43),(3014,1025,'2017-01-07 08:22:48',79),(3014,1027,'2014-09-27 08:34:03',152);
/*!40000 ALTER TABLE `listens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_songs`
--

DROP TABLE IF EXISTS `playlist_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_songs` (
  `playlist_name` varchar(255) NOT NULL,
  `song_id` int NOT NULL,
  `creator_user_id` int NOT NULL,
  `editor_user_id` int NOT NULL,
  PRIMARY KEY (`playlist_name`,`song_id`,`creator_user_id`),
  KEY `song_id` (`song_id`),
  KEY `creator_user_id` (`creator_user_id`),
  KEY `editor_user_id` (`editor_user_id`),
  CONSTRAINT `playlist_songs_ibfk_1` FOREIGN KEY (`playlist_name`) REFERENCES `playlists` (`name`),
  CONSTRAINT `playlist_songs_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`),
  CONSTRAINT `playlist_songs_ibfk_3` FOREIGN KEY (`creator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `playlist_songs_ibfk_4` FOREIGN KEY (`editor_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_songs`
--

LOCK TABLES `playlist_songs` WRITE;
/*!40000 ALTER TABLE `playlist_songs` DISABLE KEYS */;
INSERT INTO `playlist_songs` VALUES ('american girl',1005,3006,3000),('blonded',1010,3001,3000),('momentous',1000,3000,3000),('momentous',1002,3000,3000),('momentous',1004,3000,3000),('momentous',1008,3000,3000),('momentous',1009,3000,3000),('momentous',1012,3000,3000),('momentous',1015,3000,3000),('momentous',1016,3000,3000),('momentous',1023,3000,3000),('momentous',1024,3000,3000),('momentous',1025,3000,3000),('music to be murdered by',1018,3007,3000),('not any',1014,3000,3000),('super basic',1006,3013,3000),('white kicks',1016,3009,3000),('american girl',1021,3006,3001),('blonded',1004,3001,3001),('blonded',1008,3001,3001),('blonded',1009,3001,3001),('blonded',1011,3001,3001),('blonded',1015,3001,3001),('blonded',1021,3001,3001),('fallen tragedy',1011,3013,3001),('fine indeed',1009,3003,3001),('momentous',1005,3000,3001),('music to be murdered by',1002,3007,3001),('music to be murdered by',1027,3007,3001),('palm springs',1001,3006,3001),('dragon flame',1013,3010,3002),('fallen tragedy',1001,3013,3002),('hellpoint',1000,3005,3002),('hellpoint',1024,3005,3002),('hellpoint',1025,3005,3002),('license to kill',1021,3009,3002),('music to be murdered by',1008,3007,3002),('music to be murdered by',1019,3007,3002),('supernova',1026,3012,3002),('universal pop',1012,3002,3002),('universal pop',1016,3002,3002),('universal pop',1022,3002,3002),('universal pop',1025,3002,3002),('white kicks',1008,3009,3002),('white kicks',1025,3009,3002),('american girl',1016,3006,3003),('blonded',1003,3001,3003),('fine indeed',1002,3003,3003),('fine indeed',1004,3003,3003),('fine indeed',1019,3003,3003),('fine indeed',1020,3003,3003),('fine indeed',1021,3003,3003),('fine indeed',1026,3003,3003),('fine indeed',1027,3003,3003),('license to kill',1023,3009,3003),('supernova',1005,3012,3003),('the conspiracist',1008,3005,3003),('collisions',1000,3004,3004),('collisions',1001,3004,3004),('collisions',1002,3004,3004),('collisions',1006,3004,3004),('collisions',1023,3004,3004),('collisions',1025,3004,3004),('collisions',1026,3004,3004),('blonded',1023,3001,3005),('fine indeed',1016,3003,3005),('hellpoint',1005,3005,3005),('hellpoint',1009,3005,3005),('hellpoint',1010,3005,3005),('hellpoint',1011,3005,3005),('pink sky',1001,3005,3005),('pink sky',1014,3005,3005),('pink sky',1023,3005,3005),('supernova',1012,3012,3005),('supernova',1019,3012,3005),('the conspiracist',1002,3005,3005),('the conspiracist',1004,3005,3005),('the conspiracist',1006,3005,3005),('the conspiracist',1010,3005,3005),('the conspiracist',1015,3005,3005),('the conspiracist',1020,3005,3005),('the conspiracist',1027,3005,3005),('american girl',1001,3006,3006),('american girl',1012,3006,3006),('american girl',1015,3006,3006),('american girl',1018,3006,3006),('american girl',1020,3006,3006),('american girl',1022,3006,3006),('american girl',1023,3006,3006),('american girl',1025,3006,3006),('american girl',1027,3006,3006),('blonded',1018,3001,3006),('dragon flame',1012,3010,3006),('fine indeed',1010,3003,3006),('license to kill',1016,3009,3006),('palm springs',1003,3006,3006),('palm springs',1004,3006,3006),('palm springs',1011,3006,3006),('palm springs',1013,3006,3006),('palm springs',1016,3006,3006),('palm springs',1021,3006,3006),('palm springs',1026,3006,3006),('super basic',1005,3013,3006),('super basic',1017,3013,3006),('fine indeed',1017,3003,3007),('music to be murdered by',1006,3007,3007),('music to be murdered by',1009,3007,3007),('music to be murdered by',1016,3007,3007),('music to be murdered by',1022,3007,3007),('music to be murdered by',1024,3007,3007),('music to be murdered by',1026,3007,3007),('super basic',1019,3013,3007),('the conspiracist',1003,3005,3007),('white kicks',1000,3009,3007),('dragon flame',1015,3010,3008),('fine indeed',1024,3003,3008),('momentous',1010,3000,3008),('the conspiracist',1012,3005,3008),('bullet in the chamber',1015,3009,3009),('license to kill',1000,3009,3009),('license to kill',1005,3009,3009),('license to kill',1006,3009,3009),('license to kill',1017,3009,3009),('license to kill',1025,3009,3009),('license to kill',1026,3009,3009),('music to be murdered by',1014,3007,3009),('supernova',1007,3012,3009),('the conspiracist',1009,3005,3009),('white kicks',1004,3009,3009),('white kicks',1005,3009,3009),('white kicks',1007,3009,3009),('white kicks',1014,3009,3009),('white kicks',1015,3009,3009),('white kicks',1017,3009,3009),('white kicks',1018,3009,3009),('white kicks',1023,3009,3009),('collisions',1014,3004,3010),('dragon flame',1000,3010,3010),('dragon flame',1004,3010,3010),('dragon flame',1014,3010,3010),('fallen tragedy',1019,3013,3010),('fine indeed',1025,3003,3010),('the conspiracist',1018,3005,3010),('blonded',1002,3001,3011),('collisions',1009,3004,3011),('psycho',1001,3012,3011),('the conspiracist',1005,3005,3011),('the conspiracist',1026,3005,3011),('pink sky',1026,3005,3012),('psycho',1002,3012,3012),('white kicks',1012,3009,3012),('dragon flame',1020,3010,3013),('fallen tragedy',1003,3013,3013),('fallen tragedy',1010,3013,3013),('fallen tragedy',1016,3013,3013),('fallen tragedy',1024,3013,3013),('fine indeed',1011,3003,3013),('super basic',1011,3013,3013),('super basic',1013,3013,3013),('super basic',1015,3013,3013),('super basic',1020,3013,3013),('super basic',1021,3013,3013),('super basic',1025,3013,3013),('the conspiracist',1013,3005,3013),('american girl',1006,3006,3014),('blonded',1012,3001,3014),('blonded',1027,3001,3014),('collisions',1005,3004,3014),('pink sky',1015,3005,3014);
/*!40000 ALTER TABLE `playlist_songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `name` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `status` enum('public','private','unlisted') NOT NULL,
  PRIMARY KEY (`name`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES ('american girl',3006,'public'),('blonded',3001,'unlisted'),('bullet in the chamber',3009,'public'),('collisions',3004,'unlisted'),('dragon flame',3010,'private'),('fallen tragedy',3013,'public'),('fine indeed',3003,'public'),('hellpoint',3005,'unlisted'),('license to kill',3009,'private'),('momentous',3000,'unlisted'),('music to be murdered by',3007,'private'),('not any',3000,'unlisted'),('palm springs',3006,'unlisted'),('pink sky',3005,'private'),('psycho',3012,'public'),('super basic',3013,'public'),('supernova',3012,'private'),('the black guitar',3014,'public'),('the conspiracist',3005,'unlisted'),('universal pop',3002,'private'),('white kicks',3009,'public');
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `playlists_view`
--

DROP TABLE IF EXISTS `playlists_view`;
/*!50001 DROP VIEW IF EXISTS `playlists_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `playlists_view` AS SELECT 
 1 AS `name`,
 1 AS `user_id`,
 1 AS `status`,
 1 AS `duration`,
 1 AS `number_of_songs`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `release_information`
--

DROP TABLE IF EXISTS `release_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `release_information` (
  `song_id` int NOT NULL,
  `album_name` varchar(255) NOT NULL,
  `creator_id` int NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `release_date` date NOT NULL,
  PRIMARY KEY (`song_id`),
  KEY `album_name` (`album_name`),
  KEY `creator_id` (`creator_id`),
  KEY `company_name` (`company_name`),
  CONSTRAINT `release_information_ibfk_1` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`),
  CONSTRAINT `release_information_ibfk_2` FOREIGN KEY (`album_name`) REFERENCES `albums` (`name`),
  CONSTRAINT `release_information_ibfk_3` FOREIGN KEY (`creator_id`) REFERENCES `creators` (`id`),
  CONSTRAINT `release_information_ibfk_4` FOREIGN KEY (`company_name`) REFERENCES `label_companies` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `release_information`
--

LOCK TABLES `release_information` WRITE;
/*!40000 ALTER TABLE `release_information` DISABLE KEYS */;
INSERT INTO `release_information` VALUES (1000,'Under The Floor',2000,'Soundcloud','2022-08-22'),(1001,'Under The Floor',2000,'Soundcloud','2022-08-22'),(1002,'Under The Floor',2000,'Soundcloud','2022-08-22'),(1003,'Norman Fucking Rockwell',2001,'Interscope Records','2018-09-12'),(1004,'Norman Fucking Rockwell',2001,'Interscope Records','2018-09-18'),(1005,'Norman Fucking Rockwell',2001,'Interscope Records','2019-09-13'),(1006,'Norman Fucking Rockwell',2001,'Interscope Records','2019-01-19'),(1007,'Norman Fucking Rockwell',2001,'Interscope Records','2019-08-30'),(1008,'Norman Fucking Rockwell',2001,'Interscope Records','2019-08-30'),(1009,'Titanic Rising',2002,'SUB POP','2019-01-17'),(1010,'Titanic Rising',2002,'SUB POP','2019-02-12'),(1011,'Titanic Rising',2002,'SUB POP','2019-08-05'),(1012,'Master Of Puppets',2003,'Elektra','1986-03-03'),(1013,'Master Of Puppets',2003,'Elektra','1986-03-03'),(1014,'Master Of Puppets',2003,'Elektra','1986-03-03'),(1015,'Portals',2004,'Blackened','2022-04-23'),(1016,'Portals',2004,'Blackened','2022-04-23'),(1017,'Portals',2004,'Blackened','2022-04-23'),(1018,'Portals',2004,'Blackened','2022-04-23'),(1019,'Abbey Road',2005,'Apple Records','1969-09-26'),(1020,'Abbey Road',2005,'Apple Records','1969-09-26'),(1021,'Abbey Road',2005,'Apple Records','1969-09-26'),(1022,'Abbey Road',2005,'Apple Records','1969-09-26'),(1023,'Imagine',2006,'Apple Records','1971-09-09'),(1024,'Imagine',2006,'Apple Records','1971-09-09'),(1025,'Imagine',2006,'Apple Records','1971-09-09'),(1026,'Welcome To The Crazy Maze',2007,'AJR Productions LTD','2020-07-06'),(1027,'Flower Dance',2008,'Wixen Music Publishing','2010-12-30');
/*!40000 ALTER TABLE `release_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_genres`
--

DROP TABLE IF EXISTS `song_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song_genres` (
  `song_id` int NOT NULL,
  `genre` varchar(255) NOT NULL COMMENT 'maybe make an enum for this',
  PRIMARY KEY (`song_id`,`genre`),
  CONSTRAINT `song_genres_ibfk_1` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_genres`
--

LOCK TABLES `song_genres` WRITE;
/*!40000 ALTER TABLE `song_genres` DISABLE KEYS */;
INSERT INTO `song_genres` VALUES (1000,'alternative/indie rock'),(1001,'alternative/indie rock'),(1002,'alternative/indie rock'),(1003,'chamber pop'),(1003,'soft rock'),(1004,'chamber pop'),(1004,'psychedelic pop'),(1005,'chamber pop'),(1005,'mellow pop'),(1006,'soft rock'),(1007,'chamber pop'),(1008,'soft rock'),(1009,'baroque pop'),(1009,'camber pop'),(1009,'soft rock'),(1010,'baroque pop'),(1010,'camber pop'),(1010,'soft rock'),(1011,'baroque pop'),(1011,'camber pop'),(1011,'soft rock'),(1012,'thrash metal'),(1013,'thrash metal'),(1014,'thrash metal'),(1015,'classic'),(1015,'instrumental'),(1015,'metal'),(1015,'progressive rock'),(1016,'classic'),(1016,'instrumental'),(1016,'metal'),(1016,'progressive rock'),(1017,'classic'),(1017,'instrumental'),(1017,'metal'),(1017,'progressive rock'),(1018,'classic'),(1018,'instrumental'),(1018,'metal'),(1018,'progressive rock'),(1019,'rock'),(1020,'rock'),(1021,'rock'),(1022,'rock'),(1023,'soft rock'),(1024,'soft rock'),(1025,'soft rock'),(1026,'instrumental'),(1026,'progressive rock'),(1027,'instrumental'),(1027,'piano ballad');
/*!40000 ALTER TABLE `song_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_instruments`
--

DROP TABLE IF EXISTS `song_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song_instruments` (
  `song_id` int NOT NULL,
  `instrument` varchar(255) NOT NULL,
  PRIMARY KEY (`song_id`,`instrument`),
  CONSTRAINT `song_instruments_ibfk_1` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_instruments`
--

LOCK TABLES `song_instruments` WRITE;
/*!40000 ALTER TABLE `song_instruments` DISABLE KEYS */;
/*!40000 ALTER TABLE `song_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `duration` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1000,'Midnight','00:02:49'),(1001,'Under The Floor','00:03:24'),(1002,'Wicked Children','00:03:47'),(1003,'Mariners Apartment Complex ','00:04:07'),(1004,'Venice Bitch','00:09:37'),(1005,'Happiness Is A Butterfly','00:04:32'),(1006,'The Greatest','00:05:00'),(1007,'Hope Is A Dangerous Thing For A Woman Like Me To Have - But I Have It','00:05:24'),(1008,'The Next Best American Record','00:05:49'),(1009,'Picture Me Better','00:03:41'),(1010,'Andromeda','00:04:40'),(1011,'Movies','00:05:53'),(1012,'Battery','00:05:12'),(1013,'Master Of Puppets','00:08:35'),(1014,'Orion','00:08:27'),(1015,'Maiden And The Monster','00:07:17'),(1016,'The Jinn','00:06:57'),(1017,'High Plains Drifter','00:04:45'),(1018,'The Incantation','00:08:07'),(1019,'Golden Slumbers ','00:01:31'),(1020,'Carry That Weight','00:01:36'),(1021,'Octopus’s Garden','00:02:50'),(1022,'Here Comes The Sun','00:03:05'),(1023,'Imagine','00:03:07'),(1024,'It’s So Hard','00:02:29'),(1025,'How?','00:03:46'),(1026,'Welcome To The Crazy Maze','00:05:27'),(1027,'Flower Dance','00:04:25');
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `songs_view`
--

DROP TABLE IF EXISTS `songs_view`;
/*!50001 DROP VIEW IF EXISTS `songs_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `songs_view` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `duration`,
 1 AS `times_played`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int NOT NULL,
  `joining_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3000,'goth69','Johnny Goth',32,'2002-09-01'),(3001,'honeymoon','Lana Del Rey',39,'2004-07-02'),(3002,'one_drop','Weyes Blood',29,'2006-05-03'),(3003,'the_one','Metallica',41,'2001-12-12'),(3004,'quirkyhammer','Kirk Hammett',60,'2004-03-27'),(3005,'wearethebeets','The Beatles',57,'2000-02-01'),(3006,'winstonOboogie','John Lennon',82,'2001-02-07'),(3007,'andy17','Andy James',30,'2018-02-01'),(3008,'jodusprimus','DJ Okawari',56,'2005-10-17'),(3009,'strifelife','Mayank Goel',20,'2022-11-27'),(3010,'leonardoDiPitt','Radhikesh Agrawal',19,'2020-10-08'),(3011,'fineman','Vansh Garg',19,'2018-08-21'),(3012,'razumnik','Kyrylo Shyvam Kumar',20,'2022-09-22'),(3013,'chipakupoy','Anika Roy',19,'2017-02-11'),(3014,'anabolx','Ujjwal Shekhar',22,'2000-01-02'),(3015,'toosoon','Abhishek',22,'2022-11-27');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worked_on`
--

DROP TABLE IF EXISTS `worked_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worked_on` (
  `creator_id` int NOT NULL,
  `song_id` int NOT NULL,
  `work` varchar(255) NOT NULL,
  PRIMARY KEY (`creator_id`,`song_id`,`work`),
  KEY `song_id` (`song_id`),
  CONSTRAINT `worked_on_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `creators` (`id`),
  CONSTRAINT `worked_on_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worked_on`
--

LOCK TABLES `worked_on` WRITE;
/*!40000 ALTER TABLE `worked_on` DISABLE KEYS */;
INSERT INTO `worked_on` VALUES (2000,1000,'producer'),(2000,1000,'singer'),(2000,1000,'writer'),(2000,1001,'producer'),(2000,1001,'singer'),(2000,1001,'writer'),(2000,1002,'producer'),(2000,1002,'singer'),(2000,1002,'writer'),(2001,1003,'singer'),(2001,1003,'writer'),(2001,1004,'singer'),(2001,1004,'writer'),(2001,1005,'singer'),(2001,1005,'writer'),(2001,1006,'singer'),(2001,1006,'writer'),(2001,1007,'singer'),(2001,1007,'writer'),(2001,1008,'singer'),(2001,1008,'writer'),(2002,1009,'singer'),(2002,1009,'writer'),(2002,1010,'singer'),(2002,1010,'writer'),(2002,1011,'singer'),(2002,1011,'writer'),(2004,1012,'guitarist'),(2004,1013,'guitarist'),(2004,1014,'guitarist'),(2004,1015,'guitarist'),(2004,1015,'writer'),(2004,1016,'guitarist'),(2004,1016,'writer'),(2004,1017,'guitarist'),(2004,1017,'writer'),(2004,1018,'guitarist'),(2004,1018,'writer'),(2006,1019,'pianist'),(2006,1020,'bassist'),(2006,1021,'pianist'),(2006,1022,'bassist'),(2006,1023,'pianist'),(2006,1023,'singer'),(2006,1023,'writer'),(2006,1024,'guitarist'),(2006,1024,'singer'),(2006,1024,'writer'),(2006,1025,'pianist'),(2006,1025,'singer'),(2006,1025,'writer'),(2007,1026,'guitarist'),(2007,1026,'producer'),(2007,1026,'writer'),(2008,1027,'producer'),(2008,1027,'writer');
/*!40000 ALTER TABLE `worked_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `bands_view`
--

/*!50001 DROP VIEW IF EXISTS `bands_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bands_view` AS select `bands`.`id` AS `id`,`bands`.`creation_year` AS `creation_year`,(select count(0) from `release_information` `RI` where (`RI`.`creator_id` = `bands`.`id`)) AS `number_songs_released` from `bands` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `label_companies_view`
--

/*!50001 DROP VIEW IF EXISTS `label_companies_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `label_companies_view` AS select `label_companies`.`name` AS `name`,(select count(0) from `release_information` `RI` where (`RI`.`company_name` = `label_companies`.`name`)) AS `number_songs_labeled` from `label_companies` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `playlists_view`
--

/*!50001 DROP VIEW IF EXISTS `playlists_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `playlists_view` AS select `playlists`.`name` AS `name`,`playlists`.`user_id` AS `user_id`,`playlists`.`status` AS `status`,(select sum(`ps`.`duration`) from (select `playlist_songs`.`playlist_name` AS `playlist_name`,`playlist_songs`.`song_id` AS `song_id`,`playlist_songs`.`creator_user_id` AS `creator_user_id`,`songs`.`duration` AS `duration` from (`playlist_songs` join `songs` on((`playlist_songs`.`song_id` = `songs`.`id`)))) `ps` where ((`ps`.`playlist_name` = `playlists`.`name`) and (`ps`.`creator_user_id` = `playlists`.`user_id`))) AS `duration`,(select count(0) from `playlist_songs` where ((`playlist_songs`.`playlist_name` = `playlists`.`name`) and (`playlist_songs`.`creator_user_id` = `playlists`.`user_id`))) AS `number_of_songs` from `playlists` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `songs_view`
--

/*!50001 DROP VIEW IF EXISTS `songs_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `songs_view` AS select `songs`.`id` AS `id`,`songs`.`name` AS `name`,`songs`.`duration` AS `duration`,(select count(0) from `listens` where (`listens`.`song_id` = `songs`.`id`)) AS `times_played` from `songs` */;
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

-- Dump completed on 2022-11-27 21:04:05
