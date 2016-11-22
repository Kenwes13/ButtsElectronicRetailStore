-- MySQL dump 10.13  Distrib 5.5.52, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ElectStore
-- ------------------------------------------------------
-- Server version	5.5.52-0ubuntu0.14.04.1

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
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cart` (
  `ProductName` varchar(45) DEFAULT NULL,
  `Customerid` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  KEY `Customerid` (`Customerid`),
  CONSTRAINT `Cart_ibfk_1` FOREIGN KEY (`Customerid`) REFERENCES `Customer` (`Customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `Customerid` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `IsEmployee` tinyint(4) DEFAULT '0',
  `IsManager` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`Customerid`),
  UNIQUE KEY `CustomerName` (`CustomerName`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Order_Product`
--

DROP TABLE IF EXISTS `Order_Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order_Product` (
  `Order_id` int(11) DEFAULT NULL,
  `Product_id` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  KEY `Productid_idx` (`Product_id`),
  KEY `Orderid_idx` (`Order_id`),
  CONSTRAINT `Order_id` FOREIGN KEY (`Order_id`) REFERENCES `Orders` (`Orderid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Product_id` FOREIGN KEY (`Product_id`) REFERENCES `Product` (`Productid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `Orderid` int(11) NOT NULL AUTO_INCREMENT,
  `Storeid` int(11) NOT NULL,
  `Date` datetime DEFAULT NULL,
  `Country` varchar(200) NOT NULL,
  `FirstName` varchar(200) NOT NULL,
  `LastName` varchar(200) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `City` varchar(200) NOT NULL,
  `State` varchar(200) NOT NULL,
  `ZipCode` varchar(200) NOT NULL,
  `PhoneNumber` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `DeliverStatus` varchar(45) DEFAULT NULL,
  `TotalCost` int(11) DEFAULT NULL,
  `Customerid` int(11) NOT NULL,
  PRIMARY KEY (`Orderid`),
  KEY `Customerid_idx` (`Customerid`),
  KEY `Storeid` (`Storeid`),
  CONSTRAINT `Customerid` FOREIGN KEY (`Customerid`) REFERENCES `Customer` (`Customerid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`Storeid`) REFERENCES `Stores` (`Storeid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `Productid` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(45) NOT NULL,
  `Price` double DEFAULT NULL,
  `Rating` int(11) DEFAULT '0',
  `Description` varchar(1000) NOT NULL,
  `Category` varchar(45) DEFAULT NULL,
  `ImageDirectory` varchar(500) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Productid`),
  UNIQUE KEY `ProductName` (`ProductName`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Store_Product`
--

DROP TABLE IF EXISTS `Store_Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Store_Product` (
  `Storeid` int(11) NOT NULL,
  `Productid` int(11) NOT NULL,
  `UnitsinStock` int(11) DEFAULT NULL,
  KEY `Storeididx` (`Storeid`),
  KEY `Productididx` (`Productid`),
  CONSTRAINT `ProductID` FOREIGN KEY (`Productid`) REFERENCES `Product` (`Productid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `StoreID` FOREIGN KEY (`Storeid`) REFERENCES `Stores` (`Storeid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Stores`
--

DROP TABLE IF EXISTS `Stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Stores` (
  `Storeid` int(11) NOT NULL AUTO_INCREMENT,
  `Address` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Zipcode` varchar(45) DEFAULT NULL,
  `Lat` int(11) DEFAULT NULL,
  `Lng` int(11) DEFAULT NULL,
  PRIMARY KEY (`Storeid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderhistory`
--

DROP TABLE IF EXISTS `orderhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderhistory` (
  `ProductName` varchar(45) DEFAULT NULL,
  `Customerid` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  KEY `Customerid` (`Customerid`),
  CONSTRAINT `orderhistory_ibfk_1` FOREIGN KEY (`Customerid`) REFERENCES `Customer` (`Customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-20 19:10:44
