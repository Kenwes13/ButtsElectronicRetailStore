-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ElectStore
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ElectStore
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ElectStore` DEFAULT CHARACTER SET utf8 ;
USE `ElectStore` ;

-- -----------------------------------------------------
-- Table `ElectStore`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElectStore`.`Product` (
  `Productid` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(45) NOT NULL UNIQUE,
  `Price` DOUBLE NULL,
  `Rating` DOUBLE DEFAULT '0',
  `Ratedtimes` int(11) NOT NULL DEFAULT '0',
  `Description` VARCHAR(1000) NOT NULL,
  `Category` VARCHAR(45) NULL,
  `ImageDirectory` VARCHAR(500) NULL,
  `CreatedAt` DATETIME,
  PRIMARY KEY (`Productid`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ElectStore`.`Cart` (
	`ProductName` VARCHAR(45) NULL,
	`Customerid` INT NOT NULL ,
    `Quantity` INT NOT NULL,
     FOREIGN KEY (`Customerid`) REFERENCES `ElectStore`.`Customer` (`Customerid`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `ElectStore`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElectStore`.`Customer` (
  `Customerid` INT NOT NULL AUTO_INCREMENT, 
  `CustomerName` VARCHAR(45) NULL UNIQUE,
  `Address` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL UNIQUE,
  `Password` VARCHAR(500) NULL,
  `IsEmployee` TINYINT DEFAULT 0,
  `IsManager` TINYINT DEFAULT 0,
  PRIMARY KEY (`Customerid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElectStore`.`orderhistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElectStore`.`orderhistory` (
	`ProductName` VARCHAR(45) NULL,
	`Customerid` INT NOT NULL ,
    `Quantity` INT NOT NULL,
     FOREIGN KEY (`Customerid`) REFERENCES `ElectStore`.`Customer` (`Customerid`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `ElectStore`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElectStore`.`Orders` (
  `Orderid` INT NOT NULL AUTO_INCREMENT,
  `Storeid` INT NOT NULL,
  `Date` DATETIME,
  `Country` VARCHAR(200) NOT NULL,
  `FirstName` VARCHAR(200) NOT NULL,
  `LastName` VARCHAR(200) NOT NULL,
  `CustAddress` VARCHAR(200) NOT NULL,
  `State` VARCHAR(200) NOT NULL,
  `ZipCode` VARCHAR(200) NOT NULL,
  `PhoneNumber` VARCHAR(200) NOT NULL,
  `Email` VARCHAR(200) NOT NULL,   
  `DeliverStatus` VARCHAR(45) NULL,
  `TotalCost` INT NULL,
  `Customerid` INT NOT NULL,
  PRIMARY KEY (`Orderid`),
  INDEX `Customerid_idx` (`Customerid` ASC),
  FOREIGN KEY (`Storeid`)
    REFERENCES `ElectStore`.`Stores` (`Storeid`),
  CONSTRAINT `Customerid`
    FOREIGN KEY (`Customerid`)
    REFERENCES `ElectStore`.`Customer` (`Customerid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElectStore`.`Stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElectStore`.`Stores` (
  `Storeid` INT NOT NULL AUTO_INCREMENT,
  `StoreAddress` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Zipcode` VARCHAR(45) NULL,
  `Lat` FLOAT NULL,
  `Lng` FLOAT NULL,
  PRIMARY KEY (`Storeid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElectStore`.`Store_Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElectStore`.`Store_Product` (
  `Storeid` INT NOT NULL,
  `Productid` INT NOT NULL,
  `UnitsinStock` INT NULL,
  INDEX `Storeididx` (`Storeid` ASC),
  INDEX `Productididx` (`Productid` ASC),
  CONSTRAINT `StoreID`
    FOREIGN KEY (`Storeid`)
    REFERENCES `ElectStore`.`Stores` (`Storeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ProductID`
    FOREIGN KEY (`Productid`)
    REFERENCES `ElectStore`.`Product` (`Productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElectStore`.`Order_Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElectStore`.`Order_Product` (
  `Order_id` INT NULL,
  `Product_id` INT NULL,
  `Quantity` INT NULL,
  INDEX `Productid_idx` (`Product_id` ASC),
  INDEX `Orderid_idx` (`Order_id` ASC),
  CONSTRAINT `Order_id`
    FOREIGN KEY (`Order_id`)
    REFERENCES `ElectStore`.`Orders` (`Orderid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Product_id`
    FOREIGN KEY (`Product_id`)
    REFERENCES `ElectStore`.`Product` (`Productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO ElectStore.Stores(Storeid, StoreAddress, City, State, Zipcode, Lat, Lng) VALUES
(001, "25453 Mission Blvd", "Hayward", "CA", "94544", 37.655508, -122.070641),
(002, "2107 Poplar St,","Oakland","CA","94607", 37.815671, -122.287572),
(003, "4596 Pacheco Blvd", "Martinez", "CA", "94553", 38.005712 ,-122.089431),
(004, "3139 Garrity Way", "Richmond", "CA", "94806", 37.978347, -122.322537),
(005, "Goble Lane", "San Jose", "CA", "95111", 37.292759, -121.851698),
(006, "2386 Mission College Blvd", "Santa Clara", "CA", "95054", 37.388079 ,-121.967919),
(007, "900 Yates Way", "San Mateo", "CA", "94403", 37.545165, -122.295469),
(008, "816 Antoinette Ln", "South San Francisco","CA", "94080", 37.655331, -122.429529),
(009, "1695 Mission St", "San Francisco", "CA", "94103", 37.770352 ,-122.419098),
(010, "2699 19th Ave", "San Francisco", "CA", "94116", 37.737660, -122.475911);

INSERT INTO ElectStore.Customer(CustomerName, Address, Email,Password,IsEmployee,IsManager) VALUES ('manager', 'nowhere', 'nowhere@gmail.com','$2y$10$bSoPeM9szKz8ub7F.cyYXu.VHf9jzZHsb4nArdsqXVMC8k.ACw3g.',1,1);

INSERT INTO ElectStore.Product(Productid, Productname, Price, Rating, Ratedtimes, Description, category, ImageDirectory, CreatedAt) VALUES
(1,'EVGA GeForce GTX 1050', 149.99,0,0,'Coprocessor: Nvidia, Ram Size: 4, Ram Type: gddr5, Card Interface:PCsi e, Memory Bus Width: 128 bits','Graphics Cards', null, NOW()),
(2,'EVGA GeForce GTX 1070', 409.99,0,0,'Coprocessor: Nvidia, Ram Size: 8192MB, Ram Type: gddr5, Card Interface:PCsi e, Memory Bus Width: 256 bits','Graphics Cards',null, NOW()),
(3,'EVGA GeForce GTX 1060',239.99,0,0, 'Coprocessor: Nvidia, Ram Size: 6144MB, Ram Type: gddr5, Card Interface:PCsi e, Memory Bus Width: 192 bits', 'Graphics Cards',null, NOW()),
(4,'EVGA GeForce GTX 950',169.97,0,0, 'Coprocessor: Nvidia, Ram Size: 2, Ram Type: gddr5, Card Interface:PCsi e, Memory Bus Width: 2000 bits', 'Graphics Cards',null, NOW()),
(5,'EVGA GeForce GTX 960', 199.99,0,0, 'Coprocessor: Nvidia, Ram Size: 2, Ram Type: gddr5, Card Interface:PCsi e, Memory Bus Width: 2000 bits', 'Graphics Cards',null, NOW()),
(6,'EVGA GeForce GTX 1080', 699.00,0,0, 'Coprocessor: Nvidia, Ram Size: 8192MB, Ram Type: gddr5, Card Interface:PCsi e, Memory Bus Width: 256 bits', 'Graphics Cards',null, NOW()),
(7,'ASUS GeForce GTX 1080', 639.99,0,0, 'Coprocessor: Nvidia, Ram Size: 8000MB, Ram Type: gddr5, Card Interface:PCsi e, Memory Bus Width: 256 bits', 'Graphics Cards',null, NOW()),
(8,'EVGA GeForce GTX 970', 359.00,0,0, 'Coprocessor: Nvidia, Ram Size: 4,Ram Type: gddr5, Card Interface:PCsi e, Memory Bus Width: 256 bits', 'Graphics Cards',null, NOW()),
(9,'Sapphire AMD Radeon HD 6850',399.96,0,0, 'Graphics Coprocessor: Radeon HD 6850, Ram Size: 1GB, Ram Type: gddr5, Card Interface: PCsi e', 'Graphics Cards',null, NOW()),
(10,'Sapphire Radeon VAPOR-X R9 290X', 329.99,0,0, 'Graphics Coprocessor: AMD, Ram Size: 8GB, Ram Type: ddr5 sdram, Card Interface: PCsi e', 'Graphics Cards',null, NOW()),
(11,'MSI R7 370 Gaming', 392.15,0,0, 'Graphics Coprocessor: AMD Radeon R 7 370, Ram Size: 4, Ram Type: ddr5 sdram , Card Interface: PCsi e', 'Graphics Cards',null, NOW()),
(12,'MSI R9 380', 219.97,0,0, 'Graphics Coprocessor: AMD Radeon R9 380, Ram Size: 2, Ram Type: gddr5, Card Interface: PCsi e', 'Graphics Cards',null, NOW()),
(13,'Club3D Radeon R7 370', 159.00,0,0, 'Graphics Coprocessor: AMD, Ram Size: 2048MB, Ram Type: gddr5, Card Interface: PCsi e', 'Graphics Cards	',null, NOW()),
(14,'Sapphrie Radeon Nitro R9 380', 212.11,0,0, 'Graphics Coprocessor: AMD, Ram Size: 4GB, Ram Type: gddr5, Card Interface: PCsi e', 'Graphics Cards',null, NOW()),
(15,'VisionTek Radeon 7870', 359.32,0,0, 'Graphics Coprocessor: AMD Radeon HD7870, Ram Size: 2, Ram Type: gddr5, Card Interface: PCsi e', 'Graphics Cards',null, NOW()),
(16,'XFX R7-369', 104.95,0,0, 'Graphics Coprocessor: AMD, Ram Size: 2, Ram Type: gddr5, Card Interface: PCsi e', 'Graphics Cards',null, NOW()),
(17,'Syma X5C', 42.99,0,0, 'T/R: 2.4G, Axis: 6, Camera: 2.0MP', 'Quadcopters',null, NOW()),
(18,'Syma X11', 23.98,0,0, 'T/R: 2.4G, Axis: 6, Protection Guard', 'Quadcopters',null, NOW()),
(19,'Syma X12S', 19.99,0,0, 'Channels: 4, Protection Guard: Wings, Easy to Fly', 'Quadcopters',null, NOW()),
(20,'DJI Phantom 3', 427.92,0,0, '2.7K Video GPS assisted flight features', 'Quadcopters',null, NOW()),
(21,'DJI Phantom 4', 1399.99,0,0, '4K Video Everything you Need', 'Quadcopters',null, NOW()),
(22,'DJI Phantom 2', 529.99,0,0, 'Bundle with 3-axis Zenmuse, H3-3D Gimbal for GoPro', 'Quadcopters',null, NOW()),
(23,'Parrot Bebop Drone', 219.11,0,0, 'Full HD 1080p camera, Lithium Batteries, Free Flight3 app', 'Quadcopters',null, NOW()),
(24,'Parrot AR.Drone 2.0', 207.46,0,0, 'HD 720p camera, Lithium Batteries, Free Flight3 app', 'Quadcopters',null, NOW()),
(25,'Parrot Minidrone Series Mambo', 139.99,0,0, 'Comes with cannon and hook', 'Quadcopters',null, NOW()),
(26,'Printrbot Simple', 999,0,0, 'Print from anywhere. The Latest 3D Printers from printrbot', '3D Printers',null, NOW()),
(27,'Printrbot Play', 399,0,0, 'For beginners, kids, and enthusiasts', '3D Printers',null, NOW()),
(28,'FlashForge Finder', 535.35,0,0, 'Build Volume: 140L x 140W x 140H, Nozzle Diameter: 0.4mm, No Heated Bed', '3D Printers',null, NOW()),
(29,'XYZprinting da Vinci mini', 269.00,0,0, 'Build Volume: 5.9in.^3, Connect from your local network', '3D Printers',null, NOW()),
(30,'MakerBot Replicator+', 2499.89,0,0, '5th Generation, Build Volume: 573in^3', '3D Printers',null, NOW()),
(31,'Printrbot Plus', 1199,0,0, 'Great Value', '3D Printers',null, NOW()),
(32,'LulzBot TAZ 6', 2500.99,0,0, 'Expensive as $4!t', '3D Printers',null, NOW()),
(33,'Monoprice Select Mini', 219.99,0,0, 'Has a heated bed', '3D Printers',null, NOW()),
(34,'Borlee Mini01', 299.98,0,0, 'Entry Level Printer', '3D Printers',null, NOW()),
(35,'Dell E2416HM', 119.11,0,0, 'Full HD 1920 x 1080', 'Computer Monitors',null, NOW()),
(36,'LG Electronics 25UM57', 179.99,0,0, '25-Inch Screen LED-lit', 'Computer Monitors',null, NOW()),
(37,'Sceptre E248W-1920', 115.75,0,0, '24-inch Screen LED-lit', 'Computer Monitors',null, NOW()),
(38,'ASUS VS248H-P', 144.99,0,0, 'Full HD 1920x1080 2ms HDMI DVI VGA Back-Lit LED', 'Computer Monitors',null, NOW()),
(39,'HP Pavilion 25xw', 179.99,0,0, '25 inch IPS LED Backlit', 'Computer Monitors',null, NOW()),
(40,'Macbook Pro 13.3', 1037.54,0,0,'Intel Core i5, 4GB DDR3 RAM, 500GB Hard Drive','Laptops',null, NOW()),
(41,'Dell Inspiron 3000', 301.11,0,0,'Intel Core i3, 4GB RAM, 1TB Hard Drive','Laptops',null, NOW()),
(42,'Lenovo ThinkPad X1 Yoga', 1490.00,0,0,'Intel Core i7, 8GB RAM, 256GB Hard Drive','Laptops',null, NOW()),
(43,'Acer Aspire ES', 299.99,0,0,'Intel Core i3, 4GB RAM, 1TB HDD','Laptops',null, NOW()),
(44,'CUK MSI GT62VR Dominator', 1389.99,0,0, 'Intel Core i7, 16GB RAM, 128GB SSD + 1TB HDD, Nvidia GeForce GTX 1060', 'Laptops',null, NOW()),
(45,'PDP-1', 777.77,0,0,'The first computer used to play the video game Spacewar','PCs',null, NOW()),
(46,'Alienware X51 AX51R3-1510BLK', 824.99,0,0, 'Intel Core i5, 8GB Ram, 1TB HDD, NVIDIA GTX 745', 'PCs',null, NOW()),
(47,'CyberpowerPC GUA3100A Gaming Desktop', 505.99,0,0, 'AMD FX-4300, 8GB RAM, 1TB HDD, AMD R7 240', 'PCs',null, NOW()),
(48,'Apple II', 666.66,0,0, 'Built By The Great WOZ', 'PCs',null, NOW()),
(49,'Dell Alienware Area-51 Gaming Machine', 7939.99,0,0, 'Intel Core i7, 32GB DD4 RAM, 18TB HDD', 'PCs',null, NOW()),
(50,'D-WAVE 2X', 11000000.99 ,0,0, 'Quantum Computer', 'PCs',null, NOW()),
(51,'X-Box One', 275.99,0,0,'500GB, Name Your Bundle','Consoles',null, NOW()),
(52,'PlayStation 4', 323.99,0,0,'Pro, 1TB','Consoles',null, NOW()),
(53,'Steam Machine', 355.98,0,0,'Alienware Steam Machine','Consoles',null, NOW()),
(54,'Nintendo Entertainment System', 224.99,0,0,'Classic Nintendo Gaming System','Consoles',null, NOW()),
(55,'Hitachi 39 Class 720p', 196.94,0,0, 'Slim LED HDTV', 'TVs',null, NOW()),
(56,'Panasonic TC-P65VT60', 5999.99,0,0, '600Hz 3D Smart Plasma HDTV', 'TVs',null, NOW()),
(57,'Samsung UN50KU6300', 477.99, 0,0,'50 inch, Ultra HD Smart LED', 'TVs',null, NOW()),
(58,'Samsung UN65KS8000', 1497.99,0,0, '65-inch, 4K Ultra HD Smart LED TVs', 'TVs',null, NOW()),
(59,'Vizio D32X-D1', 189.95,0,0, '32-inch 1080p 60Hz Smart LED HDTV', 'TVs',null, NOW()),
(60,'Raspberry Pi 3', 29.99,0,0, '1.2GHz 64-bit quad-core ARMv8 CPU, 1GB RAM', 'Microcontrollers',null, NOW()),
(61,'Arduino Uno R3', 15.67,0,0, '8KB RAM, SRAM, 5volt', 'Microcontrollers',null, NOW()),
(62,'BeagleBone Black Rev C', 56.69,0,0, 'Single Board Computer Developlment Board', 'Microcontrollers',null, NOW()),
(63,'Mini Nano V3.0', 6.51, 0,0,'ATmega328P Microcontrollers with USB Cable', 'Microcontrollers',null, NOW()),
(64,'Intel Edison Kit', 223.61, 0,0,'Intel Atom system-on-a-chip, Integrated Wi-Fi', 'Microcontrollers',null, NOW());




Insert into Store_Product (Storeid, Productid)Select Storeid, Productid from Stores cross join Product;
update Product set imageDirectory = Concat(Trim(Concat('resources/images/',ProductName)),'.jpg');
update Product set imageDirectory = Replace(imageDirectory, ' ','');
update Store_Product SET UnitsInStock = 100;
