-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: hikers_guide_to_the_galaxy
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.21-MariaDB

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
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,8,'Free Ice Cream!'),(2,10,'Horseback Riding');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `completed_trails`
--

LOCK TABLES `completed_trails` WRITE;
/*!40000 ALTER TABLE `completed_trails` DISABLE KEYS */;
INSERT INTO `completed_trails` VALUES (2,1,2),(1,2,2),(3,3,3),(4,4,3);
/*!40000 ALTER TABLE `completed_trails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `geocaches`
--

LOCK TABLES `geocaches` WRITE;
/*!40000 ALTER TABLE `geocaches` DISABLE KEYS */;
INSERT INTO `geocaches` VALUES (1,6,1,'The Answer'),(2,11,1,'The Question');
/*!40000 ALTER TABLE `geocaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `gps_coords`
--

LOCK TABLES `gps_coords` WRITE;
/*!40000 ALTER TABLE `gps_coords` DISABLE KEYS */;
INSERT INTO `gps_coords` VALUES (1,'\0\0\0\0\0\0\0\0\0\0@\áz„?\0\0\0 ™™É¿',2),(2,'\0\0\0\0\0\0\0\0\0\0\0\0\0ð?\0\0\0\0\0\0\0À',4),(3,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0@',2),(4,'\0\0\0\0\0\0\0\0\0\0@33ó?\0\0\0@\áz”?',3),(5,'\0\0\0\0\0\0\0\0\0\0\0\0\0E@\0\0\0\0\0\0RÀ',1),(6,'\0\0\0\0\0\0\0\0\0\0\0\0\0ð?\0\0\0\0\0\0ð¿',2),(7,'\0\0\0\0\0\0\0\0\0\0\0\0€E@\0\0\0\0\0ÀQÀ',1),(8,'\0\0\0\0\0\0\0\0\0\0À\Ì\Ìü?\0\0\0 ™™\é¿',2),(9,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0ð?',3),(10,'\0\0\0\0\0\0\0\0\0\0\0\0\0$@\0\0\0\0\0\0@',3),(11,'\0\0\0\0\0\0\0\0\0\0\0\0\0E@\0\0\0\0\0\08@',1),(12,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0@',6);
/*!40000 ALTER TABLE `gps_coords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `parks`
--

LOCK TABLES `parks` WRITE;
/*!40000 ALTER TABLE `parks` DISABLE KEYS */;
INSERT INTO `parks` VALUES (1,'Boston'),(2,'Yosemite'),(3,'');
/*!40000 ALTER TABLE `parks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` VALUES (1,'freedom_trail.jpg',2,7),(2,'image_968295bb.jpeg',3,9);
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trail_heads`
--

LOCK TABLES `trail_heads` WRITE;
/*!40000 ALTER TABLE `trail_heads` DISABLE KEYS */;
INSERT INTO `trail_heads` VALUES (1,5),(2,1),(2,3),(3,4),(4,2),(6,12);
/*!40000 ALTER TABLE `trail_heads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trail_reviews`
--

LOCK TABLES `trail_reviews` WRITE;
/*!40000 ALTER TABLE `trail_reviews` DISABLE KEYS */;
INSERT INTO `trail_reviews` VALUES (1,'Pretty Good',3),(2,'Good trail, super far though.',5),(3,'Good Hikin',3),(4,'They almost killed me, but good time overall',5);
/*!40000 ALTER TABLE `trail_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trail_types`
--

LOCK TABLES `trail_types` WRITE;
/*!40000 ALTER TABLE `trail_types` DISABLE KEYS */;
INSERT INTO `trail_types` VALUES (1,'Shared-use trail'),(2,'Forest road'),(3,'Rail trail'),(4,'Towpath'),(5,'Urban trail'),(6,'Segregated trail'),(7,'Footpath'),(8,'Bicycle trail'),(9,'Equestrian trail'),(10,'Cross-country skiing trail'),(11,'Water trail'),(12,'Motorized trail');
/*!40000 ALTER TABLE `trail_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trails`
--

LOCK TABLES `trails` WRITE;
/*!40000 ALTER TABLE `trails` DISABLE KEYS */;
INSERT INTO `trails` VALUES (1,'Freedom Trail',2,50,7,1),(2,'Green Trail',1,50,7,1),(3,'Oregon Trail',3,100,7,2),(4,'Zombie Walk',3,99,2,3),(5,'Hidden Trail',2,100,7,3),(6,'Cave Walk',2,100,7,3);
/*!40000 ALTER TABLE `trails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','5f4dcc3b5aa765d61d8327deb882cf99','email@address','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(2,'John','1a1dc91c907325c69271ddf0c944bc72','email','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(3,'Keith','1a1dc91c907325c69271ddf0c944bc72','hikeIt@gmail.com','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(4,'Kevin','48cccca3bab2ad18832233ee8dff1b0b','emails@reFun','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-08 23:04:47
