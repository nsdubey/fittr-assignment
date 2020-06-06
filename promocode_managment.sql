-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2020 at 08:31 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `promocode_managment`
--

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `userId` int(11) NOT NULL,
  `promocodeId` int(11) NOT NULL,
  `createdAt` varchar(255) NOT NULL,
  `createdBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `application`
--

INSERT INTO `application` (`userId`, `promocodeId`, `createdAt`, `createdBy`) VALUES
(1, 1, '', 0),
(2, 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` enum('female','male') NOT NULL,
  `region` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `createdBy` int(11) NOT NULL,
  `updatedAt` datetime NOT NULL,
  `updatedBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `age`, `gender`, `region`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`) VALUES
(1, 'Namrata Dubey', 25, 'female', 'India', '2020-06-06 23:23:18', 1, '0000-00-00 00:00:00', 0),
(2, 'Surabhi', 12, 'male', 'India', '2020-06-06 23:24:01', 1, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `promocode`
--

CREATE TABLE `promocode` (
  `id` int(11) NOT NULL,
  `promocode` varchar(255) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `minAge` int(11) NOT NULL,
  `gender` enum('female','male') NOT NULL,
  `region` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `createdBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `promocode`
--

INSERT INTO `promocode` (`id`, `promocode`, `startDate`, `endDate`, `minAge`, `gender`, `region`, `createdAt`, `createdBy`) VALUES
(1, 'Test1', '2020-06-03 00:00:00', '2020-06-30 00:00:00', 12, 'female', 'India', '0000-00-00 00:00:00', 0),
(2, 'Test2', '2020-02-03 00:00:00', '2020-03-30 00:00:00', 12, 'male', 'India', '0000-00-00 00:00:00', 0),
(3, 'Test2', '2020-02-03 00:00:00', '2020-03-30 00:00:00', 25, 'male', 'India', '0000-00-00 00:00:00', 0),
(4, 'Test2', '2020-02-03 00:00:00', '2020-03-06 00:00:00', 25, 'male', 'India', '0000-00-00 00:00:00', 0),
(5, 'Test4', '2020-02-03 00:00:00', '2020-03-06 00:00:00', 25, 'male', 'India', '0000-00-00 00:00:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocode`
--
ALTER TABLE `promocode`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `application`
--
ALTER TABLE `application`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `promocode`
--
ALTER TABLE `promocode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
