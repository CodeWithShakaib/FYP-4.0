-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2020 at 08:22 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `Id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `categoryID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`Id`, `name`, `categoryID`) VALUES
(1, 'Prada', 1),
(2, 'Balmain', 1),
(5, 'Balenciaga', 1),
(6, 'Diesel', 1),
(9, 'Rolex', 2),
(10, 'Audemars Piguet', 2),
(11, 'Patek Philippe', 2),
(12, 'Nike', 3),
(13, 'Clarks', 3),
(14, 'Burberry', 4),
(15, 'Belstaff', 4),
(16, 'Backpak', 2),
(17, 'oxford', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `Id` bigint(20) NOT NULL,
  `Name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`Id`, `Name`) VALUES
(1, 'Men Westren Clothes and Shoes'),
(2, 'Wallets and watches'),
(3, 'Eastren men clothes and Shoes'),
(4, 'Belts and other Assories'),
(5, 'Eastren Women clothes and Shoes'),
(6, 'Dry Fruits');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `Id` bigint(20) NOT NULL,
  `Review` text DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `ProductID` bigint(20) NOT NULL,
  `UserID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `Id` bigint(20) NOT NULL,
  `productID` bigint(20) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `size` varchar(30) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `UserOrderID` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`Id`, `productID`, `color`, `size`, `quantity`, `UserOrderID`) VALUES
(20, 2, 'Red', 'Large', 1, 47),
(19, 2, 'Red', 'Large', 1, 47),
(18, 4, 'Red', 'Large', 1, 47),
(17, 2, 'Red', 'Large', 1, 47),
(16, 4, 'Red', 'Large', 1, 47),
(15, 1, 'Red', 'Large', 1, 47),
(14, 2, 'Red', 'Large', 1, 47),
(13, 4, 'Red', 'Large', 1, 47),
(12, 2, 'Red', 'Large', 1, 47),
(11, 2, 'Red', 'Large', 1, 47),
(21, 2, 'Red', 'Large', 1, 47),
(22, 2, 'Red', 'Large', 1, 47),
(23, 2, 'Red', 'Large', 1, 47),
(24, 2, 'Red', 'Large', 1, 47),
(25, 2, 'Red', 'Large', 1, 47),
(26, 2, 'Red', 'Large', 1, 47),
(27, 2, 'Red', 'Large', 1, 47),
(28, 2, 'Red', 'Large', 1, 47),
(29, 4, 'Red', 'Large', 1, 47),
(30, 2, 'Red', 'Large', 1, 47),
(31, 2, 'Red', 'Large', 1, 47),
(32, 4, 'Red', 'Large', 1, 47),
(33, 4, 'Red', 'Large', 1, 47),
(34, 1, 'Red', 'Large', 1, 47),
(35, 2, 'Red', 'Large', 1, 47),
(36, 2, 'Red', 'Large', 1, 47),
(37, 2, 'Red', 'Large', 1, 47),
(38, 1, 'Red', 'Large', 1, 47),
(39, 1, 'Red', 'Large', 1, 47),
(40, 1, 'Red', 'Large', 1, 47),
(41, 1, 'Red', 'Large', 1, 47),
(42, 1, 'Red', 'Large', 1, 47),
(43, 1, 'Red', 'Large', 1, 47),
(44, 1, 'Red', 'Large', 1, 47),
(45, 1, 'Red', 'Large', 1, 47),
(46, 1, 'Red', 'Large', 1, 47),
(47, 1, 'Red', 'Large', 1, 47),
(48, 1, 'Red', 'Large', 1, 48),
(49, 1, 'Red', 'Large', 1, 47),
(50, 1, 'Red', 'Large', 1, 48),
(51, 2, 'Red', 'Large', 1, 49),
(54, 1, 'Red', 'Large', 1, 51),
(53, 1, 'Red', 'Large', 1, 52),
(55, 1, 'Red', 'Large', 1, 53),
(56, 1, 'Red', 'Large', 1, 52),
(57, 1, 'Red', 'Large', 1, 54);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Id` bigint(20) NOT NULL,
  `name` text DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `description` text DEFAULT NULL,
  `img1` text DEFAULT NULL,
  `img2` text DEFAULT NULL,
  `img3` text DEFAULT NULL,
  `favourite` tinyint(1) DEFAULT NULL,
  `categoryID` bigint(20) NOT NULL,
  `brandID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Id`, `name`, `price`, `quantity`, `discount`, `description`, `img1`, `img2`, `img3`, `favourite`, `categoryID`, `brandID`) VALUES
(1, 'Pure Leather Bag', 2000, 10, 0, 'Intimate Design, Shockproof Inside , Think Plush Design Soft Scratch Resistant, Fine Workmanship , Excellent Quality, All-Round Protection Of Your Machine.\r\nHigh Quality Waterproof Fabric, Only To Better Protect Your Computer.\r\nSlim And Lightweight, Excellent Quality , Practical And Stylish Design.\r\nDoes Not Bulk Your Laptop Up And Can Easily Slide Into Your Briefcase, Backpack, Or Other Bag.\r\nTop Handles Of The Case Enable You To Carry Your Laptop In Comfort, And Can Tuck Away In The Pockets When Not Needed.', 'img/product-1.jpg', 'img/bags.jpg', 'img/product-1.jpg', 1, 1, 2),
(2, 'Sky-Dweller', 35000, 10, 0, 'This distinctive watch is characterized by its second time zone display on an off-centre disc on the dial. Furthermore, its innovative system for setting the functions, using the rotatable Ring Command bezel, is unique to Rolex.', 'img/watches_slider13.png', 'img/watches_slider13.png', 'img/watches_slider13.png', 1, 2, 9),
(3, 'Levi\'s Declan Shoes', 2000, 10, 0, '• Sneakers\r\n• Material: PU\r\n• Color: Brown\r\n• Versatility\r\n• Functionality\r\n• Style\r\n• Comfortable\r\n', 'img/shoes.jpg', 'img/shoes.jpg', 'img/shoes.jpg', 1, 3, 12),
(4, 'British Warm', 15000, 10, 0, 'The modern terms \"jacket\" and \"coat\" are often used interchangeably as terms, although the term \"coat\" tends to be used to refer to longer garments.', 'img/2.jpg', 'img/2.jpg', 'img/2.jpg', 1, 4, 14),
(5, 'Pure Leather Bag', 2000, 10, 0, 'Intimate Design, Shockproof Inside , Think Plush D...', 'img/watches.jpg', 'img/watches.jpg', 'img/watches.jpg', 1, 2, 9),
(6, 'Water Proof Watch', 2000, 12, 0, 'Orignal Steelness steel.\r\nWaterProof,Easy to ware.Best watch for gift someone/', 'img/watch122.jpg', 'img/watch122.jpg', 'img/watch122.jpg', 1, 2, 9),
(7, 'BLACK Wallet', 3797, 10, 0, 'Eco - Friendly waterproof material\r\nIt is shockproof inside , no damge to your money and Cards.\r\nThick soft felt for avoiding your card and money damage.\r\nUltra-light & durable. The bag is perfect for use and great gift for everyone.', 'img/wallets.jpg', 'img/wallets.jpg', 'img/wallets.jpg', 1, 2, 16),
(8, 'LEATHER WALLET', 2000, 10, 0, 'Eco - Friendly waterproof material\r\nIt is shockproof inside , no damge to your card and money.\r\nThick soft felt for avoiding your cards and money damage.\r\nUltra-light & durable. The Wallet is perfect for use and great gift for everyone.', 'img/wallet-2.png', 'img/wallet-2.png', 'img/wallet-2.png', 1, 2, 16),
(9, 'LEATHER BROWN WALLET', 1500, 10, 0, 'Eco - Friendly waterproof material\r\nIt is shockproof inside no damge to your Cards.\r\nThick soft felt for avoiding your card,money damage.\r\nUltra-light & durable. The wallet is perfect for use and great gift for everyone.', 'img/wallet-1.png', 'img/wallet-1.png', 'img/wallet-1.png', 1, 2, 16),
(10, 'Stainless Steel', 2500, 10, 0, 'Brand Name: KADEMAN\r\nClasp Type: Buckle\r\nBand Length: 25cm\r\nStyle: Fashion & Casual\r\nMovement: QUARTZ\r\nMovement: Dual Display\r\nWater Resistance Depth: 3Bar\r\nCase Material: Stainless Steel\r\nCase Thickness: 16mm\r\nDial Window Material Type: Hardlex\r\nModel Number: K9071\r\nBand Width: 24mm\r\nCase Shape: Round\r\nItem Type: Quartz Wristwatches\r\nBoxes & Cases Material: Paper\r\nBand Material Type: Stainless Steel\r\nFeature: Luminous\r\nFeature: Auto Date\r\nFeature: Chronograph\r\nFeature: Complete Calendar\r\nFeature: Water Resistant\r\nFeature: Alarm\r\nFeature: Week Display\r\nDial Diameter: 45mm\r\nWeight: 133g', 'img/watch123.png', 'img/watch123.png', 'img/watch123.png', 1, 2, 9),
(11, 'Winter Collect Men suit ', 3000, 10, 0, 'Brand Name: KADEMAN\r\nClasp Type: Buckle\r\nBand Length: 25cm\r\nStyle: Fashion & Casual\r\nMovement: QUARTZ\r\nMovement: Dual Display\r\nWater Resistance Depth: 3Bar\r\nCase Material: Stainless Steel\r\nCase Thickness: 16mm\r\nDial Window Material Type: Hardlex\r\nModel Number: K9071\r\nBand Width: 24mm\r\nCase Shape: Round\r\nItem Type: Quartz Wristwatches\r\nBoxes & Cases Material: Paper\r\nBand Material Type: Stainless Steel\r\nFeature: Luminous\r\nFeature: Auto Date\r\nFeature: Chronograph\r\nFeature: Complete Calendar\r\nFeature: Water Resistant\r\nFeature: Alarm\r\nFeature: Week Display\r\nDial Diameter: 45mm\r\nWeight: 133g', 'img/coat-1.png', 'img/coat-1.png', 'img/coat-1.png', 1, 1, 1),
(12, 'Blue Cotton Gentle Formal Shirt for Me', 1500, 10, 0, 'Color: Black\r\nMaterial: Cotton\r\nSmart and Formal Shirt\r\nComfortable', 'img/shirt-1.jpg', 'img/shirt-1.jpg', 'img/shirt-1.jpg', 0, 1, 17),
(13, 'Fashion Business Leather Shoes', 25000, 10, 0, 'Dipping without degumming\r\nSewing thread Sole\r\nCirculating ventilation', 'img/shoe-1.jpg', 'img/shoe-1.jpg', 'img/shoe-1.jpg', 0, 1, 17),
(14, 'Men Leather Shoes', 25000, 10, 0, 'Leather upper, synthetic lining, comfort insole and stacked heel.\r\nThis tapered cap toe double monk strap loafer is outrageously on trend featuring special paint and brush technique on upper in Argentinean leather.\r\nLa Milano Mens Double Monk Strap Slip on Loafer Cap Toe Leather \r\nDouble monk strap details and block heel are great for any dress, formal, or party occasions.\r\nPerfect for any dress, formal, or party occasions.\r\nClassic cap toe design, comfortable slip on loafer.\r\n', 'img/shoes12.png', 'img/shoes12.png', 'img/shoes12.png', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `Id` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`Id`, `comment`, `Date`, `rating`, `userId`) VALUES
(1, 'the site is amazing to shop it has many vendor and you can choose from a variety of goods available.the only problem which I feel is some vendor don\'t deliver upto the mark or quality is compromised, but they are only 10% in total.', '2020-05-22', 5, 17),
(2, 'the site is amazing to shop it has many vendor and you can choose from a variety of goods available.the only problem which I feel is some vendor don\'t deliver upto the mark or quality is compromised, but they are only 10% in total.', '2020-05-22', 5, 18),
(3, 'the site is amazing to shop it has many vendor and you can choose from a variety of goods available.the only problem which I feel is some vendor don\'t deliver upto the mark or quality is compromised, but they are only 10% in total.', '2020-05-22', 4, 19);

-- --------------------------------------------------------

--
-- Table structure for table `userorder`
--

CREATE TABLE `userorder` (
  `Id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `userID` bigint(20) NOT NULL,
  `status` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `firstName` text DEFAULT NULL,
  `lastName` text DEFAULT NULL,
  `phoneNo` varchar(50) DEFAULT NULL,
  `provence` text DEFAULT NULL,
  `city` text DEFAULT NULL,
  `area` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `occupation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userorder`
--

INSERT INTO `userorder` (`Id`, `date`, `userID`, `status`, `comment`, `firstName`, `lastName`, `phoneNo`, `provence`, `city`, `area`, `address`, `occupation`) VALUES
(47, '2020-05-27', 20, 'Confirm', 'Noconfirm yet', 'test2', 'qamrani', '303030303', 'Azad Jammu & Kashmir', 'Islamabad', 'Islmabad', 'House#20,Street 76', 'Home'),
(48, '2020-06-03', 21, 'Confirm', 'Noconfirm yet', 'Tayyab', 'qamrani', '303030303', 'Balochistan', 'Islamabad', 'Islmabad', 'House#20,Street 76', 'Home'),
(49, '2020-06-04', 22, 'Confirm', 'Noconfirm yet', 'Tayyab', 'qamrani', '303030303', 'Islamabad Capital Territory', 'Islamabad', 'Islmabad', 'House#20,Street 76', 'Office'),
(50, '2020-06-04', 0, 'confirm', 'goig', 'tayyab', 'qamrani', '213131312', 'punjab', 'muzafarghar', 'katchipake', 'house 5,streeen 8', 'Student'),
(51, '2020-06-04', 22, 'NotConfirmed', 'Noconfirm yet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, '2020-06-04', 20, 'NotConfirmed', 'Noconfirm yet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, '2020-06-06', 23, 'Confirm', 'Noconfirm yet', 'test2', 'test2', '303030303', 'Islamabad Capital Territory', 'Islamabad', 'Islmabad', 'House#20,Street 76', 'Home'),
(54, '2020-06-07', 24, 'Confirm', 'Noconfirm yet', 'Hamza', 'Khan', '9182309127', 'Federally Administered Tribal Areas', 'Islamabad', 'Islmabad', 'House#20,Street 76', 'Home');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Id` bigint(20) NOT NULL,
  `firstName` text DEFAULT NULL,
  `secondName` text DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `Address` varchar(1000) DEFAULT NULL,
  `phoneNo` varchar(14) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `city` text DEFAULT NULL,
  `sex` varchar(30) DEFAULT NULL,
  `Role` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Id`, `firstName`, `secondName`, `password`, `Email`, `image`, `Address`, `phoneNo`, `Age`, `country`, `city`, `sex`, `Role`) VALUES
(15, 'Shakaib', 'Hassan', '123', 'sk@gmail.com', NULL, 'sk@gmail.com', '0002312365', 22, 'Pakistan', 'isb', 'Male', 'Customer'),
(16, 'Shakaib ', 'Hassan ', '123', 'shakaibhassan16@gmial.com', NULL, 'shakaibhassan16@gmial.com', '03015015616', 22, 'Pakistan', 'Rawalpindi', 'Male', 'Customer'),
(17, 'Muhammad Tayyab', 'Tayyab', '123', 'imran@gmail.com', 'img/me.jpg', 'Primenester House,Islamabad', '03025789888', 65, 'Pakistan', 'Islmabad', 'Male', 'Customer'),
(18, 'Usman Khan', 'Erçel', '123', 'Hande@gmail.com', 'img/watch2.jpg', 'Istenbol,Turkey', '+782293949444', 30, 'Turkey', 'Intenbol', 'Female', 'Customer'),
(19, 'Shakaib Hassan', 'Hassan', '123', 'Shan@gamail.com', 'img/shakaib.jpg', 'Lahore,Pakistan', '0403030303', 45, 'Paksitan', 'Lahore', 'Male', 'Customer'),
(20, 'Muhammad Tayyab', 'Qamrani', '123', 'mtq@gmail.com', NULL, 'mtq@gmail.com', '0301679923', 22, 'Pakistan', 'Islamabad', 'Male', 'Customer'),
(21, 'shakaib', 'hassan', '123', 'sh@gmail.com', NULL, 'sh@gmail.com', '0301679923', 22, 'Pakistan', 'Islamabad', 'Male', 'Customer'),
(22, 'someone', 'some', '123', 'test@gmail.com', NULL, 'test@gmail.com', '1231', 22, 'Pakistan', 'islamabad', 'Male', 'Customer'),
(23, 'Test1', 'Test1', '123', 'test1@gmail.com', NULL, 'test1@gmail.com', '0301679923', 22, 'Pakistan', 'Islamabad', 'Male', 'Customer'),
(24, 'Hamza', 'Khan', '123', 'Hamza@gmail.com', NULL, 'Hamza@gmail.com', '09090707070', 22, 'Pakistan', 'Islamabad', 'Male', 'Customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `userorder`
--
ALTER TABLE `userorder`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userorder`
--
ALTER TABLE `userorder`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
