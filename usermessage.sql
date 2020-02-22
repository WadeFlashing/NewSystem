-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: usermessage
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `authority` (
  `id` bigint(10) NOT NULL,
  `authority` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `image` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'java','men','15622926578','广东科技学院','java.jpg'),(2,'job','men','15622924927','广东科技学院','ee.jpg'),(3,'abc','men','123465789','广东科技学院','SpringMyBatis.jpg'),(4,'teacher','men','1897465488','广东东莞','android.jpg'),(5,'number','men','15699826484','南开大学','ajax.jpg'),(7,'Alice','women','12566874652','华南农业大学','javaee.jpg'),(9,'Wade','women','15622324989','广州航海大学','javaee.jpg');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'admin','admin'),(3,'manager','manager'),(4,'abc','abc'),(5,'vbg456789','123456');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_authority`
--

DROP TABLE IF EXISTS `manager_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manager_authority` (
  `managerid` int(11) DEFAULT NULL,
  `authorityid` bigint(10) DEFAULT NULL,
  KEY `authorityid` (`authorityid`),
  CONSTRAINT `authorityid` FOREIGN KEY (`authorityid`) REFERENCES `authority` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_authority`
--

LOCK TABLES `manager_authority` WRITE;
/*!40000 ALTER TABLE `manager_authority` DISABLE KEYS */;
INSERT INTO `manager_authority` VALUES (1,1),(3,1),(4,1);
/*!40000 ALTER TABLE `manager_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL,
  `content` varchar(200) NOT NULL,
  `post_time` varchar(50) NOT NULL,
  PRIMARY KEY (`news_id`),
  KEY `fk` (`uid`),
  CONSTRAINT `fk` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,1,'北京','教育','beijing','2019-01-03 20:49:31'),(2,1,'上海','教育','shanghai','2019-01-03 20:49:52'),(4,2,'aaaaaaa','教育','啊啊啊啊啊','2019-01-03 20:55:08'),(7,3,'JSP','教育','Java Serverlet Page','2019-01-04 08:56:39'),(8,3,'php','教育','爬虫','2019-01-04 08:57:15'),(9,3,'c#','教育','c#','2019-01-04 08:57:41'),(11,3,'广东科技学院 ','娱乐','广东东莞','2019-01-04 10:38:18');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsdata`
--

DROP TABLE IF EXISTS `newsdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `newsdata` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL,
  `content` varchar(200) NOT NULL,
  `post_time` varchar(50) NOT NULL,
  PRIMARY KEY (`news_id`),
  KEY `uidfk` (`uid`),
  CONSTRAINT `uidfk` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsdata`
--

LOCK TABLES `newsdata` WRITE;
/*!40000 ALTER TABLE `newsdata` DISABLE KEYS */;
INSERT INTO `newsdata` VALUES (15,1,'广东科技学院新校区','教育','松山湖校区','2019-12-04 10:59:39'),(16,2,'东莞','政治','广东科技学院','2019-12-04 11:09:36'),(17,2,'广州','政治','大学城','2019-12-04 11:12:44'),(19,2,'网易考拉','商业','跨境电商','2019-12-06 14:54:32'),(23,7,'数学课','政治','三角函数','2019-12-04 21:53:21'),(25,7,'物理课','教育','波粒二象性','2019-12-05 13:31:51'),(30,2,'腾讯云','商业','发布NVIDIAvComputeServervGPU实例','2019-12-13 15:13:22'),(37,2,'asdasd','教育','asdqwd','2019-12-13 15:32:56'),(40,2,'南水北调','政治','我太南了','2019-12-13 15:37:36'),(46,2,'《焦点访谈》南水北调：益民生，润民心','政治','南水北调工程是缓解我国北方地区水资源短缺的国家战略性工程。今年的12月12日是南水北调东、中线一期工程全面通水五周年的日子。通水五年来，不仅缓解了北方水资源紧张的状况，也给沿线省市带来了各种附加效益，同时为北方奉献了一汪碧水的水源区也有了不错的发展。今天我们就来看看，这个国家战略性工程为地区和民众带来了哪些利好？','2019-12-13 15:46:05'),(48,2,'浪潮云高调宣布在推动上市：烧钱的云计算 盈利从何而来','商业','现在为了争夺市场，各家云服务厂商都在不计成本的推广市场，能够公开说自己盈利的寥寥无几。不过在前不久，浪潮云董事长袁谊生接受采访时表示，浪潮云在推动上市计划，计划于2019年下半年完成股改，浪潮云目前已经实现盈利，上市地点会是国内科创板。','2019-12-13 15:50:42');
/*!40000 ALTER TABLE `newsdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(30) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'java','123','men','15622926578','广东科技学院'),(2,'job','123','men','15622924927','广东科技学院'),(3,'abc','123','men','123465789','广东科技学院'),(7,'teacher','123','men','1897465488','广东东莞');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-22 23:16:12
