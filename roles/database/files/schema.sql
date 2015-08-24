-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sandbox
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` varchar(36) NOT NULL,
  `test_run_id` varchar(36) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `attachment` blob,
  PRIMARY KEY (`id`),
  KEY `test_run_id` (`test_run_id`),
  CONSTRAINT `attachments_ibfk_1` FOREIGN KEY (`test_run_id`) REFERENCES `test_runs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `run_metadata`
--

DROP TABLE IF EXISTS `run_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `run_metadata` (
  `id` varchar(36) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `run_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `run_id` (`run_id`),
  CONSTRAINT `run_metadata_ibfk_1` FOREIGN KEY (`run_id`) REFERENCES `runs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `runs`
--

DROP TABLE IF EXISTS `runs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `runs` (
  `id` varchar(36) NOT NULL,
  `skips` int(11) DEFAULT NULL,
  `fails` int(11) DEFAULT NULL,
  `passes` int(11) DEFAULT NULL,
  `run_time` float DEFAULT NULL,
  `artifacts` text,
  `run_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_metadata`
--

DROP TABLE IF EXISTS `test_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_metadata` (
  `id` varchar(36) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `test_run_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `test_run_id` (`test_run_id`),
  CONSTRAINT `test_metadata_ibfk_1` FOREIGN KEY (`test_run_id`) REFERENCES `tests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_run_metadata`
--

DROP TABLE IF EXISTS `test_run_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_run_metadata` (
  `id` varchar(36) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `test_run_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `test_run_metadata_ibfk_1` (`test_run_id`),
  CONSTRAINT `test_run_metadata_ibfk_1` FOREIGN KEY (`test_run_id`) REFERENCES `test_runs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_runs`
--

DROP TABLE IF EXISTS `test_runs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_runs` (
  `id` varchar(36) NOT NULL,
  `test_id` varchar(36) NOT NULL,
  `run_id` varchar(36) NOT NULL,
  `status` varchar(256) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `stop_time` datetime DEFAULT NULL,
  `start_time_microsecond` int(11) DEFAULT '0',
  `stop_time_microsecond` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_test_runs` (`test_id`,`run_id`),
  KEY `ix_test_runs_run_id` (`run_id`),
  KEY `ix_test_runs_test_id` (`test_id`),
  KEY `ix_test_run_test_id` (`test_id`),
  KEY `ix_test_run_run_id` (`run_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests` (
  `id` varchar(36) NOT NULL,
  `test_id` varchar(256) NOT NULL,
  `run_count` int(11) DEFAULT NULL,
  `success` int(11) DEFAULT NULL,
  `failure` int(11) DEFAULT NULL,
  `run_time` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_test_id` (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-24 21:16:43
