-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 10, 2018 at 06:14 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ExpressFood (many to many)`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerID` int(11) NOT NULL,
  `firstName` varchar(15) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phoneNumber` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerID`, `firstName`, `lastName`, `address`, `email`, `phoneNumber`) VALUES
(1, 'Eliza', 'Lomas', '52 Yewtree Road, Bristol UK', 'lomaseliza@gmail.com', '01612050173'),
(2, 'Jimmy', 'Tran', '47 ParkWay Drive, Berkeley CA', 'jimmytranmann@gmail.com', '03859204899'),
(3, 'Claire', 'Barnard', '40 Post Falls st, Spokane WA', 'cbeebies@gmail.com', '01938462890'),
(4, 'Jacques', 'Smit', '45 Afrikaans road, Cape Town', 'jacsmit@gmail.com', '09291840292'),
(5, 'Javier', 'Rodriguez', '11 Tramontina Ave, Austin TX', 'javierrodriguez@gmail.com', '01945907268');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryDrivers`
--

CREATE TABLE `deliveryDrivers` (
  `driverID` int(11) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phoneNumber` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deliveryDrivers`
--

INSERT INTO `deliveryDrivers` (`driverID`, `firstName`, `lastName`, `address`, `email`, `phoneNumber`) VALUES
(1, 'Mike ', 'Patton', '23 Terrence way, London', 'chafenomore@gmail.com', '07342432345'),
(2, 'Jonathan', 'Davis', '38 Adidas street, Bakersfield', 'freakkk@gmail.com', '03859204828');

-- --------------------------------------------------------

--
-- Table structure for table `menuItems`
--

CREATE TABLE `menuItems` (
  `itemID` int(11) NOT NULL,
  `dishName` varchar(255) NOT NULL,
  `dayAvailable` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL,
  `type` enum('Main','Dessert') NOT NULL,
  `price` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menuItems`
--

INSERT INTO `menuItems` (`itemID`, `dishName`, `dayAvailable`, `type`, `price`) VALUES
(1, 'Beef Rendang', 'Monday', 'Main', '5.50'),
(2, 'Curry Laksa', 'Monday', 'Main', '4.50'),
(3, 'Cendol', 'Monday', 'Dessert', '2.50'),
(4, 'Rojak', 'Monday', 'Dessert', '3.00'),
(5, 'Banh Mi', 'Tuesday', 'Main', '4.50'),
(6, 'Pho Bo', 'Tuesday', 'Main', '6.00'),
(7, 'Che', 'Tuesday', 'Dessert', '3.00'),
(8, 'Sua Chua Nep Cam', 'Tuesday', 'Dessert', '4.00'),
(9, 'Spaghetti Bolognese', 'Wednesday', 'Main', '6.00'),
(10, 'Pasta Con La Sarde', 'Wednesday', 'Main', '6.00'),
(11, 'Biscotti', 'Wednesday', 'Dessert', '2.00'),
(12, 'Gelato', 'Wednesday', 'Dessert', '3.00'),
(13, 'Tacos Al Pastore', 'Thursday', 'Main', '6.00'),
(14, 'Chicken Quisedilia', 'Thursday', 'Main', '5.00'),
(15, 'Mexican flan', 'Thursday', 'Dessert', '4.50'),
(16, 'Brownies', 'Thursday', 'Dessert', '3.50'),
(17, 'Perogi', 'Friday', 'Main', '5.50'),
(18, 'Bigos', 'Friday', 'Main', '7.00'),
(19, 'Apple pancake', 'Friday', 'Dessert', '3.00'),
(20, 'cream pastry', 'Friday', 'Dessert', '3.00'),
(21, 'Falafel', 'Saturday', 'Main', '5.00'),
(22, 'Hoummus and pitta', 'Saturday', 'Main', '4.50'),
(23, 'Rice pudding', 'Saturday', 'Dessert', '3.00'),
(24, 'Baklava', 'Saturday', 'Dessert', '3.50'),
(25, 'Katsu Kare', 'Sunday', 'Main', '5.50'),
(26, 'Tamago Kake Gohan', 'Sunday', 'Main', '4.50'),
(27, 'Mochi', 'Sunday', 'Dessert', '3.00'),
(28, 'Doriyaki', 'Sunday', 'Dessert', '3.50');

-- --------------------------------------------------------

--
-- Table structure for table `menuItems_purchased`
--

CREATE TABLE `menuItems_purchased` (
  `purchaseID` int(11) DEFAULT NULL,
  `itemID` int(11) DEFAULT NULL,
  `qty` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menuItems_purchased`
--

INSERT INTO `menuItems_purchased` (`purchaseID`, `itemID`, `qty`) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 18, 3);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `purchaseID` int(11) NOT NULL,
  `customerID` int(11) DEFAULT NULL,
  `driverID` int(11) DEFAULT NULL,
  `timeCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total` varchar(10) DEFAULT NULL,
  `paid` tinyint(4) DEFAULT NULL,
  `estDeliveryTime` int(2) DEFAULT NULL,
  `timeDelivered` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`purchaseID`, `customerID`, `driverID`, `timeCreated`, `total`, `paid`, `estDeliveryTime`, `timeDelivered`) VALUES
(1, 3, 1, '2018-08-30 12:54:09', '13.50', 1, 13, '2018-08-30 12:54:09'),
(2, 3, 2, '2018-08-30 14:04:55', '21', 1, 15, '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `deliveryDrivers`
--
ALTER TABLE `deliveryDrivers`
  ADD PRIMARY KEY (`driverID`);

--
-- Indexes for table `menuItems`
--
ALTER TABLE `menuItems`
  ADD PRIMARY KEY (`itemID`);

--
-- Indexes for table `menuItems_purchased`
--
ALTER TABLE `menuItems_purchased`
  ADD KEY `purchaseID` (`purchaseID`),
  ADD KEY `itemID` (`itemID`) USING BTREE;

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`purchaseID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `driverID` (`driverID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `deliveryDrivers`
--
ALTER TABLE `deliveryDrivers`
  MODIFY `driverID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menuItems`
--
ALTER TABLE `menuItems`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `purchaseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menuItems_purchased`
--
ALTER TABLE `menuItems_purchased`
  ADD CONSTRAINT `menuItems_purchased_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `menuItems` (`itemID`),
  ADD CONSTRAINT `menuItems_purchased_ibfk_2` FOREIGN KEY (`purchaseID`) REFERENCES `purchases` (`purchaseID`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customers` (`customerID`),
  ADD CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`driverID`) REFERENCES `deliveryDrivers` (`driverID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
