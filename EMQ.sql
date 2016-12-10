-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 10, 2016 at 02:28 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ElectStore`
--

-- --------------------------------------------------------

--
-- Table structure for table `Cart`
--

CREATE TABLE `Cart` (
  `ProductName` varchar(45) DEFAULT NULL,
  `Customerid` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `Customerid` int(11) NOT NULL,
  `CustomerName` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Password` varchar(500) DEFAULT NULL,
  `IsEmployee` tinyint(4) DEFAULT '0',
  `IsManager` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Customer_Rate`
--

CREATE TABLE `Customer_Rate` (
  `Customername` varchar(45) NOT NULL,
  `Ratedproductid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orderhistory`
--

CREATE TABLE `orderhistory` (
  `ProductName` varchar(45) DEFAULT NULL,
  `Customerid` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `Orderid` int(11) NOT NULL,
  `Storeid` int(11) NOT NULL,
  `Date` datetime DEFAULT NULL,
  `Country` varchar(200) NOT NULL,
  `FirstName` varchar(200) NOT NULL,
  `LastName` varchar(200) NOT NULL,
  `CustAddress` varchar(200) NOT NULL,
  `State` varchar(200) NOT NULL,
  `ZipCode` varchar(200) NOT NULL,
  `PhoneNumber` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `DeliverStatus` varchar(45) DEFAULT NULL,
  `TotalCost` int(11) DEFAULT NULL,
  `Customerid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Order_Product`
--

CREATE TABLE `Order_Product` (
  `Order_id` int(11) DEFAULT NULL,
  `Product_id` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `Productid` int(11) NOT NULL,
  `ProductName` varchar(45) NOT NULL,
  `Price` double DEFAULT NULL,
  `Rating` double DEFAULT '0',
  `Ratedtimes` int(11) NOT NULL DEFAULT '0',
  `Description` varchar(1000) NOT NULL,
  `Category` varchar(45) DEFAULT NULL,
  `ImageDirectory` varchar(500) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`Productid`, `ProductName`, `Price`, `Rating`, `Ratedtimes`, `Description`, `Category`, `ImageDirectory`, `CreatedAt`) VALUES
(1, 'EVGA GeForce GTX 1050', 149.99, 4.44, 15, 'Coprocessor: Nvidia, Ram Size: 4, Ram Type: gddr5, Card Interface:PCsi e, Memory Bus Width: 128 bits', 'Graphics Cards', './resources/images/EVGAGeForceGTX1050.jpg', '2016-11-22 22:54:33'),
(2, 'EVGA GeForce GTX 1070', 409.99, 4.3608465608465, 15, 'Coprocessor: Nvidia, Ram Size: 8192MB, Ram Type: gddr5, Card Interface:PCsi e, Memory Bus Width: 256 bits', 'Graphics Cards', './resources/images/EVGAGeForceGTX1070.jpg', '2016-11-22 22:54:33'),
(3, 'EVGA GeForce GTX 1060', 239.99, 4.3333333333333, 3, 'Coprocessor: Nvidia, Ram Size: 6144MB, Ram Type: gddr5, Card Interface:PCsi e, Memory Bus Width: 192 bits', 'Graphics Cards', './resources/images/EVGAGeForceGTX1060.jpg', '2016-11-22 22:54:33'),
(4, 'EVGA GeForce GTX 950', 169.97, 5, 3, 'Coprocessor: Nvidia, Ram Size: 2, Ram Type: gddr5, Card Interface:PCsi e, Memory Bus Width: 2000 bits', 'Graphics Cards', './resources/images/EVGAGeForceGTX950.jpg', '2016-11-22 22:54:33'),
(5, 'EVGA GeForce GTX 960', 199.99, 5, 1, 'Coprocessor: Nvidia, Ram Size: 2, Ram Type: gddr5, Card Interface:PCsi e, Memory Bus Width: 2000 bits', 'Graphics Cards', './resources/images/EVGAGeForceGTX960.jpg', '2016-11-22 22:54:33'),
(6, 'EVGA GeForce GTX 1080', 699, 4, 1, 'Coprocessor: Nvidia, Ram Size: 8192MB, Ram Type: gddr5, Card Interface:PCsi e, Memory Bus Width: 256 bits', 'Graphics Cards', './resources/images/EVGAGeForceGTX1080.jpg', '2016-11-22 22:54:33'),
(7, 'ASUS GeForce GTX 1080', 639.99, 4.0285714285715, 8, 'Coprocessor: Nvidia, Ram Size: 8000MB, Ram Type: gddr5, Card Interface:PCsi e, Memory Bus Width: 256 bits', 'Graphics Cards', './resources/images/ASUSGeForceGTX1080.jpg', '2016-11-22 22:54:33'),
(8, 'EVGA GeForce GTX 970', 359, 4, 1, 'Coprocessor: Nvidia, Ram Size: 4,Ram Type: gddr5, Card Interface:PCsi e, Memory Bus Width: 256 bits', 'Graphics Cards', './resources/images/EVGAGeForceGTX970.jpg', '2016-11-22 22:54:33'),
(9, 'Sapphire AMD Radeon HD 6850', 399.96, 4, 2, 'Graphics Coprocessor: Radeon HD 6850, Ram Size: 1GB, Ram Type: gddr5, Card Interface: PCsi e', 'Graphics Cards', './resources/images/SapphireAMDRadeonHD6850.jpg', '2016-11-22 22:54:33'),
(10, 'Sapphire Radeon VAPOR-X R9 290X', 329.99, 4, 1, 'Graphics Coprocessor: AMD, Ram Size: 8GB, Ram Type: ddr5 sdram, Card Interface: PCsi e', 'Graphics Cards', './resources/images/SapphireRadeonVAPOR-XR9290X.jpg', '2016-11-22 22:54:33'),
(11, 'MSI R7 370 Gaming', 392.15, 0, 0, 'Graphics Coprocessor: AMD Radeon R 7 370, Ram Size: 4, Ram Type: ddr5 sdram , Card Interface: PCsi e', 'Graphics Cards', './resources/images/MSIR7370Gaming.jpg', '2016-11-22 22:54:33'),
(12, 'MSI R9 380', 219.97, 0, 0, 'Graphics Coprocessor: AMD Radeon R9 380, Ram Size: 2, Ram Type: gddr5, Card Interface: PCsi e', 'Graphics Cards', './resources/images/MSIR9380.jpg', '2016-11-22 22:54:33'),
(13, 'Club3D Radeon R7 370', 159, 0, 0, 'Graphics Coprocessor: AMD, Ram Size: 2048MB, Ram Type: gddr5, Card Interface: PCsi e', 'Graphics Cards	', './resources/images/Club3DRadeonR7370.jpg', '2016-11-22 22:54:33'),
(14, 'Sapphrie Radeon Nitro R9 380', 212.11, 0, 0, 'Graphics Coprocessor: AMD, Ram Size: 4GB, Ram Type: gddr5, Card Interface: PCsi e', 'Graphics Cards', './resources/images/SapphrieRadeonNitroR9380.jpg', '2016-11-22 22:54:33'),
(15, 'VisionTek Radeon 7870', 359.32, 4, 1, 'Graphics Coprocessor: AMD Radeon HD7870, Ram Size: 2, Ram Type: gddr5, Card Interface: PCsi e', 'Graphics Cards', './resources/images/VisionTekRadeon7870.jpg', '2016-11-22 22:54:33'),
(16, 'XFX R7-370', 104.95, 0, 0, 'Graphics Coprocessor: AMD, Ram Size: 2, Ram Type: gddr5, Card Interface: PCsi e', 'Graphics Cards', './resources/images/XFXR7-370.jpg', '2016-11-22 22:54:33'),
(17, 'Syma X5C', 42.99, 0, 0, 'T/R: 2.4G, Axis: 6, Camera: 2.0MP', 'Quadcopters', './resources/images/SymaX5C.jpg', '2016-11-22 22:54:33'),
(18, 'Syma X11', 23.98, 0, 0, 'T/R: 2.4G, Axis: 6, Protection Guard', 'Quadcopters', './resources/images/SymaX11.jpg', '2016-11-22 22:54:33'),
(19, 'Syma X12S', 19.99, 0, 0, 'Channels: 4, Protection Guard: Wings, Easy to Fly', 'Quadcopters', './resources/images/SymaX12S.jpg', '2016-11-22 22:54:33'),
(20, 'DJI Phantom 3', 427.92, 0, 0, '2.7K Video GPS assisted flight features', 'Quadcopters', './resources/images/DJIPhantom3.jpg', '2016-11-22 22:54:33'),
(21, 'DJI Phantom 4', 1399.99, 0, 0, '4K Video Everything you Need', 'Quadcopters', './resources/images/DJIPhantom4.jpg', '2016-11-22 22:54:33'),
(22, 'DJI Phantom 2', 529.99, 0, 0, 'Bundle with 3-axis Zenmuse, H3-3D Gimbal for GoPro', 'Quadcopters', './resources/images/DJIPhantom2.jpg', '2016-11-22 22:54:33'),
(23, 'Parrot Bebop Drone', 219.11, 0, 0, 'Full HD 1080p camera, Lithium Batteries, Free Flight3 app', 'Quadcopters', './resources/images/ParrotBebopDrone.jpg', '2016-11-22 22:54:33'),
(24, 'Parrot AR.Drone 2.0', 207.46, 0, 0, 'HD 720p camera, Lithium Batteries, Free Flight3 app', 'Quadcopters', './resources/images/ParrotAR.Drone2.0.jpg', '2016-11-22 22:54:33'),
(25, 'Parrot Minidrone Series Mambo', 139.99, 0, 0, 'Comes with cannon and hook', 'Quadcopters', './resources/images/ParrotMinidroneSeriesMambo.jpg', '2016-11-22 22:54:33'),
(26, 'Printrbot Simple', 999, 0, 0, 'Print from anywhere. The Latest 3D Printers from printrbot', '3D Printers', './resources/images/PrintrbotSimple.jpg', '2016-11-22 22:54:33'),
(27, 'Printrbot Play', 399, 0, 0, 'For beginners, kids, and enthusiasts', '3D Printers', './resources/images/PrintrbotPlay.jpg', '2016-11-22 22:54:33'),
(28, 'FlashForge Finder', 535.35, 0, 0, 'Build Volume: 140L x 140W x 140H, Nozzle Diameter: 0.4mm, No Heated Bed', '3D Printers', './resources/images/FlashForgeFinder.jpg', '2016-11-22 22:54:33'),
(29, 'XYZprinting da Vinci mini', 269, 0, 0, 'Build Volume: 5.9in.^3, Connect from your local network', '3D Printers', './resources/images/XYZprintingdaVincimini.jpg', '2016-11-22 22:54:33'),
(30, 'MakerBot Replicator+', 2499.89, 0, 0, '5th Generation, Build Volume: 573in^3', '3D Printers', './resources/images/MakerBotReplicator+.jpg', '2016-11-22 22:54:33'),
(31, 'Printrbot Plus', 1199, 0, 0, 'Great Value', '3D Printers', './resources/images/PrintrbotPlus.jpg', '2016-11-22 22:54:33'),
(32, 'LulzBot TAZ 6', 2500.99, 0, 0, 'Expensive as $4!t', '3D Printers', './resources/images/LulzBotTAZ6.jpg', '2016-11-22 22:54:33'),
(33, 'Monoprice Select Mini', 219.99, 0, 0, 'Has a heated bed', '3D Printers', './resources/images/MonopriceSelectMini.jpg', '2016-11-22 22:54:33'),
(34, 'Borlee Mini01', 299.98, 0, 0, 'Entry Level Printer', '3D Printers', './resources/images/BorleeMini01.jpg', '2016-11-22 22:54:33'),
(35, 'Dell E2416HM', 119.11, 0, 0, 'Full HD 1920 x 1080', 'Computer Monitors', './resources/images/DellE2416HM.jpg', '2016-11-22 22:54:33'),
(36, 'LG Electronics 25UM57', 179.99, 0, 0, '25-Inch Screen LED-lit', 'Computer Monitors', './resources/images/LGElectronics25UM57.jpg', '2016-11-22 22:54:33'),
(37, 'Sceptre E248W-1920', 115.75, 0, 0, '24-inch Screen LED-lit', 'Computer Monitors', './resources/images/SceptreE248W-1920.jpg', '2016-11-22 22:54:33'),
(38, 'ASUS VS248H-P', 144.99, 0, 0, 'Full HD 1920x1080 2ms HDMI DVI VGA Back-Lit LED', 'Computer Monitors', './resources/images/ASUSVS248H-P.jpg', '2016-11-22 22:54:33'),
(39, 'HP Pavilion 25xw', 179.99, 0, 0, '25 inch IPS LED Backlit', 'Computer Monitors', './resources/images/HPPavilion25xw.jpg', '2016-11-22 22:54:33'),
(40, 'Macbook Pro 13.3', 1037.54, 0, 0, 'Intel Core i5, 4GB DDR3 RAM, 500GB Hard Drive', 'Laptops', './resources/images/MacbookPro13.3.jpg', '2016-11-22 22:54:33'),
(41, 'Dell Inspiron 3000', 301.11, 0, 0, 'Intel Core i3, 4GB RAM, 1TB Hard Drive', 'Laptops', './resources/images/DellInspiron3000.jpg', '2016-11-22 22:54:33'),
(42, 'Lenovo ThinkPad X1 Yoga', 1490, 0, 0, 'Intel Core i7, 8GB RAM, 256GB Hard Drive', 'Laptops', './resources/images/LenovoThinkPadX1Yoga.jpg', '2016-11-22 22:54:33'),
(43, 'Acer Aspire ES', 299.99, 0, 0, 'Intel Core i3, 4GB RAM, 1TB HDD', 'Laptops', './resources/images/AcerAspireES.jpg', '2016-11-22 22:54:33'),
(44, 'CUK MSI GT62VR Dominator', 1389.99, 0, 0, 'Intel Core i7, 16GB RAM, 128GB SSD + 1TB HDD, Nvidia GeForce GTX 1060', 'Laptops', './resources/images/CUKMSIGT62VRDominator.jpg', '2016-11-22 22:54:33'),
(45, 'PDP-1', 777.77, 0, 0, 'The first computer used to play the video game Spacewar', 'PCs', './resources/images/PDP-1.jpg', '2016-11-22 22:54:33'),
(46, 'Alienware X51 AX51R3-1510BLK', 824.99, 0, 0, 'Intel Core i5, 8GB Ram, 1TB HDD, NVIDIA GTX 745', 'PCs', './resources/images/AlienwareX51AX51R3-1510BLK.jpg', '2016-11-22 22:54:33'),
(47, 'CyberpowerPC Gaming Desktop', 505.99, 0, 0, 'AMD FX-4300, 8GB RAM, 1TB HDD, AMD R7 240', 'PCs', './resources/images/CyberpowerPCGamingDesktop.jpg', '2016-11-22 22:54:33'),
(48, 'Apple II', 666.66, 0, 0, 'Built By The Great WOZ', 'PCs', './resources/images/AppleII.jpg', '2016-11-22 22:54:33'),
(49, 'Dell Alienware Area-51 Gaming Machine', 7939.99, 0, 0, 'Intel Core i7, 32GB DD4 RAM, 18TB HDD', 'PCs', './resources/images/DellAlienwareArea-51GamingMachine.jpg', '2016-11-22 22:54:33'),
(50, 'D-WAVE 2X', 11000000.99, 0, 0, 'Quantum Computer', 'PCs', './resources/images/D-WAVE2X.jpg', '2016-11-22 22:54:33'),
(51, 'X-Box One', 275.99, 0, 0, '500GB, Name Your Bundle', 'Consoles', './resources/images/X-BoxOne.jpg', '2016-11-22 22:54:33'),
(52, 'PlayStation 4', 323.99, 0, 0, 'Pro, 1TB', 'Consoles', './resources/images/PlayStation4.jpg', '2016-11-22 22:54:33'),
(53, 'Steam Machine', 355.98, 0, 0, 'Alienware Steam Machine', 'Consoles', './resources/images/SteamMachine.jpg', '2016-11-22 22:54:33'),
(54, 'Nintendo Entertainment System', 224.99, 0, 0, 'Classic Nintendo Gaming System', 'Consoles', './resources/images/NintendoEntertainmentSystem.jpg', '2016-11-22 22:54:33'),
(55, 'Hitachi 39 Class 720p', 196.94, 0, 0, 'Slim LED HDTV', 'TVs', './resources/images/Hitachi39Class720p.jpg', '2016-11-22 22:54:33'),
(56, 'Panasonic TC-P65VT60', 5999.99, 0, 0, '600Hz 3D Smart Plasma HDTV', 'TVs', './resources/images/PanasonicTC-P65VT60.jpg', '2016-11-22 22:54:33'),
(57, 'Samsung UN50KU6300', 477.99, 0, 0, '50 inch, Ultra HD Smart LED', 'TVs', './resources/images/SamsungUN50KU6300.jpg', '2016-11-22 22:54:33'),
(58, 'Samsung UN65KS8000', 1497.99, 0, 0, '65-inch, 4K Ultra HD Smart LED TVs', 'TVs', './resources/images/SamsungUN65KS8000.jpg', '2016-11-22 22:54:33'),
(59, 'Vizio D32X-D1', 189.95, 0, 0, '32-inch 1080p 60Hz Smart LED HDTV', 'TVs', './resources/images/VizioD32X-D1.jpg', '2016-11-22 22:54:33'),
(60, 'Raspberry Pi 3', 29.99, 0, 0, '1.2GHz 64-bit quad-core ARMv8 CPU, 1GB RAM', 'Microcontrollers', './resources/images/RaspberryPi3.jpg', '2016-11-22 22:54:33'),
(61, 'Arduino Uno R3', 15.67, 0, 0, '8KB RAM, SRAM, 5volt', 'Microcontrollers', './resources/images/ArduinoUnoR3.jpg', '2016-11-22 22:54:33'),
(62, 'BeagleBone Black Rev C', 56.69, 0, 0, 'Single Board Computer Developlment Board', 'Microcontrollers', './resources/images/BeagleBoneBlackRevC.jpg', '2016-11-22 22:54:33'),
(63, 'Mini Nano V3.0', 6.51, 0, 0, 'ATmega328P Microcontrollers with USB Cable', 'Microcontrollers', './resources/images/MiniNanoV3.0.jpg', '2016-11-22 22:54:33'),
(64, 'Intel Edison Kit', 223.61, 0, 0, 'Intel Atom system-on-a-chip, Integrated Wi-Fi', 'Microcontrollers', './resources/images/IntelEdisonKit.jpg', '2016-11-22 22:54:33');

-- --------------------------------------------------------

--
-- Table structure for table `Stores`
--

CREATE TABLE `Stores` (
  `Storeid` int(11) NOT NULL,
  `StoreAddress` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Zipcode` varchar(45) DEFAULT NULL,
  `Lat` float DEFAULT NULL,
  `Lng` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Stores`
--

INSERT INTO `Stores` (`Storeid`, `StoreAddress`, `City`, `State`, `Zipcode`, `Lat`, `Lng`) VALUES
(1, '25453 Mission Blvd', 'Hayward', 'CA', '94544', 37.6555, -122.071),
(2, '2107 Poplar St,', 'Oakland', 'CA', '94607', 37.8157, -122.288),
(3, '4596 Pacheco Blvd', 'Martinez', 'CA', '94553', 38.0057, -122.089),
(4, '3139 Garrity Way', 'Richmond', 'CA', '94806', 37.9783, -122.323),
(5, 'Goble Lane', 'San Jose', 'CA', '95111', 37.2928, -121.852),
(6, '2386 Mission College Blvd', 'Santa Clara', 'CA', '95054', 37.3881, -121.968),
(7, '900 Yates Way', 'San Mateo', 'CA', '94403', 37.5452, -122.295),
(8, '816 Antoinette Ln', 'South San Francisco', 'CA', '94080', 37.6553, -122.43),
(9, '1695 Mission St', 'San Francisco', 'CA', '94103', 37.7704, -122.419),
(10, '2699 19th Ave', 'San Francisco', 'CA', '94116', 37.7377, -122.476);

-- --------------------------------------------------------

--
-- Table structure for table `Store_Product`
--

CREATE TABLE `Store_Product` (
  `Storeid` int(11) NOT NULL,
  `Productid` int(11) NOT NULL,
  `UnitsinStock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Store_Product`
--

INSERT INTO `Store_Product` (`Storeid`, `Productid`, `UnitsinStock`) VALUES
(1, 1, 100),
(2, 1, 100),
(3, 1, 100),
(4, 1, 100),
(5, 1, 100),
(6, 1, 100),
(7, 1, 100),
(8, 1, 100),
(9, 1, 100),
(10, 1, 100),
(1, 2, 100),
(2, 2, 100),
(3, 2, 100),
(4, 2, 100),
(5, 2, 100),
(6, 2, 100),
(7, 2, 100),
(8, 2, 100),
(9, 2, 100),
(10, 2, 100),
(1, 3, 100),
(2, 3, 100),
(3, 3, 100),
(4, 3, 100),
(5, 3, 100),
(6, 3, 100),
(7, 3, 100),
(8, 3, 100),
(9, 3, 100),
(10, 3, 100),
(1, 4, 100),
(2, 4, 100),
(3, 4, 100),
(4, 4, 100),
(5, 4, 100),
(6, 4, 100),
(7, 4, 100),
(8, 4, 100),
(9, 4, 100),
(10, 4, 100),
(1, 5, 100),
(2, 5, 100),
(3, 5, 100),
(4, 5, 100),
(5, 5, 100),
(6, 5, 100),
(7, 5, 100),
(8, 5, 100),
(9, 5, 100),
(10, 5, 100),
(1, 6, 100),
(2, 6, 100),
(3, 6, 100),
(4, 6, 100),
(5, 6, 100),
(6, 6, 100),
(7, 6, 100),
(8, 6, 100),
(9, 6, 100),
(10, 6, 100),
(1, 7, 100),
(2, 7, 100),
(3, 7, 100),
(4, 7, 100),
(5, 7, 100),
(6, 7, 100),
(7, 7, 100),
(8, 7, 100),
(9, 7, 100),
(10, 7, 100),
(1, 8, 100),
(2, 8, 100),
(3, 8, 100),
(4, 8, 100),
(5, 8, 100),
(6, 8, 100),
(7, 8, 100),
(8, 8, 100),
(9, 8, 100),
(10, 8, 100),
(1, 9, 100),
(2, 9, 100),
(3, 9, 100),
(4, 9, 100),
(5, 9, 100),
(6, 9, 100),
(7, 9, 100),
(8, 9, 100),
(9, 9, 100),
(10, 9, 100),
(1, 10, 100),
(2, 10, 100),
(3, 10, 100),
(4, 10, 100),
(5, 10, 100),
(6, 10, 100),
(7, 10, 100),
(8, 10, 100),
(9, 10, 100),
(10, 10, 100),
(1, 11, 100),
(2, 11, 100),
(3, 11, 100),
(4, 11, 100),
(5, 11, 100),
(6, 11, 100),
(7, 11, 100),
(8, 11, 100),
(9, 11, 100),
(10, 11, 100),
(1, 12, 100),
(2, 12, 100),
(3, 12, 100),
(4, 12, 100),
(5, 12, 100),
(6, 12, 100),
(7, 12, 100),
(8, 12, 100),
(9, 12, 100),
(10, 12, 100),
(1, 13, 100),
(2, 13, 100),
(3, 13, 100),
(4, 13, 100),
(5, 13, 100),
(6, 13, 100),
(7, 13, 100),
(8, 13, 100),
(9, 13, 100),
(10, 13, 100),
(1, 14, 100),
(2, 14, 100),
(3, 14, 100),
(4, 14, 100),
(5, 14, 100),
(6, 14, 100),
(7, 14, 100),
(8, 14, 100),
(9, 14, 100),
(10, 14, 100),
(1, 15, 100),
(2, 15, 100),
(3, 15, 100),
(4, 15, 100),
(5, 15, 100),
(6, 15, 100),
(7, 15, 100),
(8, 15, 100),
(9, 15, 100),
(10, 15, 100),
(1, 16, 100),
(2, 16, 100),
(3, 16, 100),
(4, 16, 100),
(5, 16, 100),
(6, 16, 100),
(7, 16, 100),
(8, 16, 100),
(9, 16, 100),
(10, 16, 100),
(1, 17, 100),
(2, 17, 100),
(3, 17, 100),
(4, 17, 100),
(5, 17, 100),
(6, 17, 100),
(7, 17, 100),
(8, 17, 100),
(9, 17, 100),
(10, 17, 100),
(1, 18, 100),
(2, 18, 100),
(3, 18, 100),
(4, 18, 100),
(5, 18, 100),
(6, 18, 100),
(7, 18, 100),
(8, 18, 100),
(9, 18, 100),
(10, 18, 100),
(1, 19, 100),
(2, 19, 100),
(3, 19, 100),
(4, 19, 100),
(5, 19, 100),
(6, 19, 100),
(7, 19, 100),
(8, 19, 100),
(9, 19, 100),
(10, 19, 100),
(1, 20, 100),
(2, 20, 100),
(3, 20, 100),
(4, 20, 100),
(5, 20, 100),
(6, 20, 100),
(7, 20, 100),
(8, 20, 100),
(9, 20, 100),
(10, 20, 100),
(1, 21, 100),
(2, 21, 100),
(3, 21, 100),
(4, 21, 100),
(5, 21, 100),
(6, 21, 100),
(7, 21, 100),
(8, 21, 100),
(9, 21, 100),
(10, 21, 100),
(1, 22, 100),
(2, 22, 100),
(3, 22, 100),
(4, 22, 100),
(5, 22, 100),
(6, 22, 100),
(7, 22, 100),
(8, 22, 100),
(9, 22, 100),
(10, 22, 100),
(1, 23, 100),
(2, 23, 100),
(3, 23, 100),
(4, 23, 100),
(5, 23, 100),
(6, 23, 100),
(7, 23, 100),
(8, 23, 100),
(9, 23, 100),
(10, 23, 100),
(1, 24, 100),
(2, 24, 100),
(3, 24, 100),
(4, 24, 100),
(5, 24, 100),
(6, 24, 100),
(7, 24, 100),
(8, 24, 100),
(9, 24, 100),
(10, 24, 100),
(1, 25, 100),
(2, 25, 100),
(3, 25, 100),
(4, 25, 100),
(5, 25, 100),
(6, 25, 100),
(7, 25, 100),
(8, 25, 100),
(9, 25, 100),
(10, 25, 100),
(1, 26, 100),
(2, 26, 100),
(3, 26, 100),
(4, 26, 100),
(5, 26, 100),
(6, 26, 100),
(7, 26, 100),
(8, 26, 100),
(9, 26, 100),
(10, 26, 100),
(1, 27, 100),
(2, 27, 100),
(3, 27, 100),
(4, 27, 100),
(5, 27, 100),
(6, 27, 100),
(7, 27, 100),
(8, 27, 100),
(9, 27, 100),
(10, 27, 100),
(1, 28, 100),
(2, 28, 100),
(3, 28, 100),
(4, 28, 100),
(5, 28, 100),
(6, 28, 100),
(7, 28, 100),
(8, 28, 100),
(9, 28, 100),
(10, 28, 100),
(1, 29, 100),
(2, 29, 100),
(3, 29, 100),
(4, 29, 100),
(5, 29, 100),
(6, 29, 100),
(7, 29, 100),
(8, 29, 100),
(9, 29, 100),
(10, 29, 100),
(1, 30, 100),
(2, 30, 100),
(3, 30, 100),
(4, 30, 100),
(5, 30, 100),
(6, 30, 100),
(7, 30, 100),
(8, 30, 100),
(9, 30, 100),
(10, 30, 100),
(1, 31, 100),
(2, 31, 100),
(3, 31, 100),
(4, 31, 100),
(5, 31, 100),
(6, 31, 100),
(7, 31, 100),
(8, 31, 100),
(9, 31, 100),
(10, 31, 100),
(1, 32, 100),
(2, 32, 100),
(3, 32, 100),
(4, 32, 100),
(5, 32, 100),
(6, 32, 100),
(7, 32, 100),
(8, 32, 100),
(9, 32, 100),
(10, 32, 100),
(1, 33, 100),
(2, 33, 100),
(3, 33, 100),
(4, 33, 100),
(5, 33, 100),
(6, 33, 100),
(7, 33, 100),
(8, 33, 100),
(9, 33, 100),
(10, 33, 100),
(1, 34, 100),
(2, 34, 100),
(3, 34, 100),
(4, 34, 100),
(5, 34, 100),
(6, 34, 100),
(7, 34, 100),
(8, 34, 100),
(9, 34, 100),
(10, 34, 100),
(1, 35, 100),
(2, 35, 100),
(3, 35, 100),
(4, 35, 100),
(5, 35, 100),
(6, 35, 100),
(7, 35, 100),
(8, 35, 100),
(9, 35, 100),
(10, 35, 100),
(1, 36, 100),
(2, 36, 100),
(3, 36, 100),
(4, 36, 100),
(5, 36, 100),
(6, 36, 100),
(7, 36, 100),
(8, 36, 100),
(9, 36, 100),
(10, 36, 100),
(1, 37, 100),
(2, 37, 100),
(3, 37, 100),
(4, 37, 100),
(5, 37, 100),
(6, 37, 100),
(7, 37, 100),
(8, 37, 100),
(9, 37, 100),
(10, 37, 100),
(1, 38, 100),
(2, 38, 100),
(3, 38, 100),
(4, 38, 100),
(5, 38, 100),
(6, 38, 100),
(7, 38, 100),
(8, 38, 100),
(9, 38, 100),
(10, 38, 100),
(1, 39, 100),
(2, 39, 100),
(3, 39, 100),
(4, 39, 100),
(5, 39, 100),
(6, 39, 100),
(7, 39, 100),
(8, 39, 100),
(9, 39, 100),
(10, 39, 100),
(1, 40, 100),
(2, 40, 100),
(3, 40, 100),
(4, 40, 100),
(5, 40, 100),
(6, 40, 100),
(7, 40, 100),
(8, 40, 100),
(9, 40, 100),
(10, 40, 100),
(1, 41, 100),
(2, 41, 100),
(3, 41, 100),
(4, 41, 100),
(5, 41, 100),
(6, 41, 100),
(7, 41, 100),
(8, 41, 100),
(9, 41, 100),
(10, 41, 100),
(1, 42, 100),
(2, 42, 100),
(3, 42, 100),
(4, 42, 100),
(5, 42, 100),
(6, 42, 100),
(7, 42, 100),
(8, 42, 100),
(9, 42, 100),
(10, 42, 100),
(1, 43, 100),
(2, 43, 100),
(3, 43, 100),
(4, 43, 100),
(5, 43, 100),
(6, 43, 100),
(7, 43, 100),
(8, 43, 100),
(9, 43, 100),
(10, 43, 100),
(1, 44, 100),
(2, 44, 100),
(3, 44, 100),
(4, 44, 100),
(5, 44, 100),
(6, 44, 100),
(7, 44, 100),
(8, 44, 100),
(9, 44, 100),
(10, 44, 100),
(1, 45, 100),
(2, 45, 100),
(3, 45, 100),
(4, 45, 100),
(5, 45, 100),
(6, 45, 100),
(7, 45, 100),
(8, 45, 100),
(9, 45, 100),
(10, 45, 100),
(1, 46, 100),
(2, 46, 100),
(3, 46, 100),
(4, 46, 100),
(5, 46, 100),
(6, 46, 100),
(7, 46, 100),
(8, 46, 100),
(9, 46, 100),
(10, 46, 100),
(1, 47, 100),
(2, 47, 100),
(3, 47, 100),
(4, 47, 100),
(5, 47, 100),
(6, 47, 100),
(7, 47, 100),
(8, 47, 100),
(9, 47, 100),
(10, 47, 100),
(1, 48, 100),
(2, 48, 100),
(3, 48, 100),
(4, 48, 100),
(5, 48, 100),
(6, 48, 100),
(7, 48, 100),
(8, 48, 100),
(9, 48, 100),
(10, 48, 100),
(1, 49, 100),
(2, 49, 100),
(3, 49, 100),
(4, 49, 100),
(5, 49, 100),
(6, 49, 100),
(7, 49, 100),
(8, 49, 100),
(9, 49, 100),
(10, 49, 100),
(1, 50, 100),
(2, 50, 100),
(3, 50, 100),
(4, 50, 100),
(5, 50, 100),
(6, 50, 100),
(7, 50, 100),
(8, 50, 100),
(9, 50, 100),
(10, 50, 100),
(1, 51, 100),
(2, 51, 100),
(3, 51, 100),
(4, 51, 100),
(5, 51, 100),
(6, 51, 100),
(7, 51, 100),
(8, 51, 100),
(9, 51, 100),
(10, 51, 100),
(1, 52, 100),
(2, 52, 100),
(3, 52, 100),
(4, 52, 100),
(5, 52, 100),
(6, 52, 100),
(7, 52, 100),
(8, 52, 100),
(9, 52, 100),
(10, 52, 100),
(1, 53, 100),
(2, 53, 100),
(3, 53, 100),
(4, 53, 100),
(5, 53, 100),
(6, 53, 100),
(7, 53, 100),
(8, 53, 100),
(9, 53, 100),
(10, 53, 100),
(1, 54, 100),
(2, 54, 100),
(3, 54, 100),
(4, 54, 100),
(5, 54, 100),
(6, 54, 100),
(7, 54, 100),
(8, 54, 100),
(9, 54, 100),
(10, 54, 100),
(1, 55, 100),
(2, 55, 100),
(3, 55, 100),
(4, 55, 100),
(5, 55, 100),
(6, 55, 100),
(7, 55, 100),
(8, 55, 100),
(9, 55, 100),
(10, 55, 100),
(1, 56, 100),
(2, 56, 100),
(3, 56, 100),
(4, 56, 100),
(5, 56, 100),
(6, 56, 100),
(7, 56, 100),
(8, 56, 100),
(9, 56, 100),
(10, 56, 100),
(1, 57, 100),
(2, 57, 100),
(3, 57, 100),
(4, 57, 100),
(5, 57, 100),
(6, 57, 100),
(7, 57, 100),
(8, 57, 100),
(9, 57, 100),
(10, 57, 100),
(1, 58, 100),
(2, 58, 100),
(3, 58, 100),
(4, 58, 100),
(5, 58, 100),
(6, 58, 100),
(7, 58, 100),
(8, 58, 100),
(9, 58, 100),
(10, 58, 100),
(1, 59, 100),
(2, 59, 100),
(3, 59, 100),
(4, 59, 100),
(5, 59, 100),
(6, 59, 100),
(7, 59, 100),
(8, 59, 100),
(9, 59, 100),
(10, 59, 100),
(1, 60, 100),
(2, 60, 100),
(3, 60, 100),
(4, 60, 100),
(5, 60, 100),
(6, 60, 100),
(7, 60, 100),
(8, 60, 100),
(9, 60, 100),
(10, 60, 100),
(1, 61, 100),
(2, 61, 100),
(3, 61, 100),
(4, 61, 100),
(5, 61, 100),
(6, 61, 100),
(7, 61, 100),
(8, 61, 100),
(9, 61, 100),
(10, 61, 100),
(1, 62, 100),
(2, 62, 100),
(3, 62, 100),
(4, 62, 100),
(5, 62, 100),
(6, 62, 100),
(7, 62, 100),
(8, 62, 100),
(9, 62, 100),
(10, 62, 100),
(1, 63, 100),
(2, 63, 100),
(3, 63, 100),
(4, 63, 100),
(5, 63, 100),
(6, 63, 100),
(7, 63, 100),
(8, 63, 100),
(9, 63, 100),
(10, 63, 100),
(1, 64, 100),
(2, 64, 100),
(3, 64, 100),
(4, 64, 100),
(5, 64, 100),
(6, 64, 100),
(7, 64, 100),
(8, 64, 100),
(9, 64, 100),
(10, 64, 100);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Cart`
--
ALTER TABLE `Cart`
  ADD KEY `Customerid` (`Customerid`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`Customerid`),
  ADD UNIQUE KEY `CustomerName` (`CustomerName`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `orderhistory`
--
ALTER TABLE `orderhistory`
  ADD KEY `Customerid` (`Customerid`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`Orderid`),
  ADD KEY `Customerid_idx` (`Customerid`),
  ADD KEY `Storeid` (`Storeid`);

--
-- Indexes for table `Order_Product`
--
ALTER TABLE `Order_Product`
  ADD KEY `Productid_idx` (`Product_id`),
  ADD KEY `Orderid_idx` (`Order_id`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`Productid`),
  ADD UNIQUE KEY `ProductName` (`ProductName`);

--
-- Indexes for table `Stores`
--
ALTER TABLE `Stores`
  ADD PRIMARY KEY (`Storeid`);

--
-- Indexes for table `Store_Product`
--
ALTER TABLE `Store_Product`
  ADD KEY `Storeididx` (`Storeid`),
  ADD KEY `Productididx` (`Productid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Customer`
--
ALTER TABLE `Customer`
  MODIFY `Customerid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `Orderid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Product`
--
ALTER TABLE `Product`
  MODIFY `Productid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `Stores`
--
ALTER TABLE `Stores`
  MODIFY `Storeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Cart`
--
ALTER TABLE `Cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`Customerid`) REFERENCES `Customer` (`Customerid`);

--
-- Constraints for table `orderhistory`
--
ALTER TABLE `orderhistory`
  ADD CONSTRAINT `orderhistory_ibfk_1` FOREIGN KEY (`Customerid`) REFERENCES `Customer` (`Customerid`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Customerid` FOREIGN KEY (`Customerid`) REFERENCES `Customer` (`Customerid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Storeid`) REFERENCES `Stores` (`Storeid`);

--
-- Constraints for table `Order_Product`
--
ALTER TABLE `Order_Product`
  ADD CONSTRAINT `Order_id` FOREIGN KEY (`Order_id`) REFERENCES `Orders` (`Orderid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Product_id` FOREIGN KEY (`Product_id`) REFERENCES `Product` (`Productid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Store_Product`
--
ALTER TABLE `Store_Product`
  ADD CONSTRAINT `ProductID` FOREIGN KEY (`Productid`) REFERENCES `Product` (`Productid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `StoreID` FOREIGN KEY (`Storeid`) REFERENCES `Stores` (`Storeid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
