-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2021 at 10:16 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pessdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `dispatch`
--

CREATE TABLE `dispatch` (
  `incident_id` int(11) NOT NULL,
  `patrolcar_id` varchar(10) NOT NULL,
  `time_dispatched` datetime NOT NULL,
  `time_arrived` datetime DEFAULT NULL,
  `time_completed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dispatch`
--

INSERT INTO `dispatch` (`incident_id`, `patrolcar_id`, `time_dispatched`, `time_arrived`, `time_completed`) VALUES
(14, 'QX1123T', '2021-03-10 14:16:42', '2021-03-10 16:01:09', '2021-03-10 16:33:02'),
(16, 'QX1126F', '2021-03-10 14:43:38', NULL, NULL),
(17, 'QX2202V', '2021-03-10 14:49:00', '2021-03-10 15:52:02', '2021-03-10 16:29:57'),
(18, 'QX2226G', '2021-03-10 14:49:24', '2021-03-10 16:41:44', '2021-03-10 16:35:49'),
(19, 'QX2274F', '2021-03-10 15:30:15', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE `incident` (
  `incident_id` int(11) NOT NULL,
  `caller_name` varchar(30) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `incident_type_id` varchar(3) NOT NULL,
  `incident_location` varchar(50) NOT NULL,
  `incident_desc` varchar(100) NOT NULL,
  `incident_status_id` varchar(1) NOT NULL,
  `time_called` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`incident_id`, `caller_name`, `phone_number`, `incident_type_id`, `incident_location`, `incident_desc`, `incident_status_id`, `time_called`) VALUES
(1, 'David', '81234567', '060', 'Outside ITE CW', 'Car clashed with van', '1', '2021-02-08 15:43:39'),
(2, 'David', '91234566', '010', 'CCK', 'Fire at CCK', '1', '2021-03-01 15:08:43'),
(3, 'David', '91234566', '010', 'CCK', 'Fire at CCK', '1', '2021-03-03 16:42:59'),
(4, 'Jack', '91234567', '010', 'Jurong', 'Fire at Jurong', '1', '2021-03-03 17:03:12'),
(5, 'Jack', '81234567', '010', 'Jurong', 'Fire at Jurong', '1', '2021-03-03 17:19:42'),
(6, 'Jack', '91234567', '010', 'Jurong', 'Fire at Jurong', '1', '2021-03-03 17:21:06'),
(7, 'Jack', '91234566', '010', 'Jurong', 'Fire at Jurong', '2', '2021-03-08 15:34:37'),
(9, 'Jack', '91234566', '010', 'Jurong', 'Fire at Jurong', '1', '2021-03-10 11:42:13'),
(10, 'Jack', '91234566', '010', 'Jurong', 'Fire at Jurong', '1', '2021-03-10 11:42:16'),
(11, 'Jack', '91234566', '010', 'Jurong', 'Fire at Jurong', '1', '2021-03-10 11:42:19'),
(12, 'David', '91234567', '030', 'Hougang', 'Thief at Shopping Mall', '2', '2021-03-10 13:49:23'),
(13, 'David', '91234567', '010', 'Hougang', 'Fire at Polyclincs', '2', '2021-03-10 13:53:19'),
(14, 'Jack', '91234566', '050', 'Yew Tee', 'Tree fallen.', '2', '2021-03-10 14:08:18'),
(15, 'Thomas', '81234567', '070', 'Tampines', 'Painting outside housde', '2', '2021-03-10 14:33:40'),
(16, 'Thomas', '81234567', '070', 'Tampines', 'Painting outside house', '2', '2021-03-10 14:43:38'),
(17, 'Fanny', '81234565', '080', 'Pasir Ris', 'Flooding ', '2', '2021-03-10 14:49:00'),
(18, 'Thomas', '81234567', '070', 'Tampines', 'Painting outside house', '2', '2021-03-10 14:49:24'),
(19, 'David', '91234567', '010', 'Jurong', 'Fire at Jurong', '2', '2021-03-10 15:30:15');

-- --------------------------------------------------------

--
-- Table structure for table `incident_status`
--

CREATE TABLE `incident_status` (
  `incident_status_id` varchar(1) NOT NULL,
  `incident_status_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident_status`
--

INSERT INTO `incident_status` (`incident_status_id`, `incident_status_desc`) VALUES
('1', 'Pending'),
('2', 'Dispatched'),
('3', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `incident_type`
--

CREATE TABLE `incident_type` (
  `incident_type_id` varchar(3) NOT NULL,
  `incident_type_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident_type`
--

INSERT INTO `incident_type` (`incident_type_id`, `incident_type_desc`) VALUES
('010', 'Fire'),
('020', 'Riot'),
('030', 'Burglary'),
('040', 'Domestic Violence'),
('050', 'Fallen Tree'),
('060', 'Traffic Accident'),
('070', 'Loan Shark'),
('080', 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar`
--

CREATE TABLE `patrolcar` (
  `patrolcar_id` varchar(10) NOT NULL,
  `patrolcar_status_id` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patrolcar`
--

INSERT INTO `patrolcar` (`patrolcar_id`, `patrolcar_status_id`) VALUES
('QX1124V', '1'),
('QX1126F', '1'),
('QX2274F', '1'),
('QX1123T', '3'),
('QX2202V', '3'),
('QX3332J', '3'),
('QX3334K', '3'),
('QX1111A', '4'),
('QX2226G', '4'),
('QX3336P', '4');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar_status`
--

CREATE TABLE `patrolcar_status` (
  `patrolcar_status_id` varchar(1) NOT NULL,
  `patrolcar_status_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patrolcar_status`
--

INSERT INTO `patrolcar_status` (`patrolcar_status_id`, `patrolcar_status_desc`) VALUES
('4', 'Arrived'),
('1', 'Dispatched'),
('3', 'Free'),
('2', 'Patrol');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dispatch`
--
ALTER TABLE `dispatch`
  ADD PRIMARY KEY (`incident_id`,`patrolcar_id`),
  ADD KEY `patrolcar_id` (`patrolcar_id`);

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`incident_id`),
  ADD KEY `incident_type_id` (`incident_type_id`,`incident_status_id`),
  ADD KEY `incident_status_id` (`incident_status_id`);

--
-- Indexes for table `incident_status`
--
ALTER TABLE `incident_status`
  ADD PRIMARY KEY (`incident_status_id`);

--
-- Indexes for table `incident_type`
--
ALTER TABLE `incident_type`
  ADD PRIMARY KEY (`incident_type_id`);

--
-- Indexes for table `patrolcar`
--
ALTER TABLE `patrolcar`
  ADD PRIMARY KEY (`patrolcar_id`),
  ADD KEY `patrolcar_status_id` (`patrolcar_status_id`);

--
-- Indexes for table `patrolcar_status`
--
ALTER TABLE `patrolcar_status`
  ADD PRIMARY KEY (`patrolcar_status_id`),
  ADD KEY `patrolcar_status_desc` (`patrolcar_status_desc`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
  MODIFY `incident_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dispatch`
--
ALTER TABLE `dispatch`
  ADD CONSTRAINT `dispatch_ibfk_1` FOREIGN KEY (`patrolcar_id`) REFERENCES `patrolcar` (`patrolcar_id`),
  ADD CONSTRAINT `dispatch_ibfk_2` FOREIGN KEY (`incident_id`) REFERENCES `incident` (`incident_id`);

--
-- Constraints for table `incident`
--
ALTER TABLE `incident`
  ADD CONSTRAINT `incident_ibfk_1` FOREIGN KEY (`incident_type_id`) REFERENCES `incident_type` (`incident_type_id`),
  ADD CONSTRAINT `incident_ibfk_2` FOREIGN KEY (`incident_status_id`) REFERENCES `incident_status` (`incident_status_id`);

--
-- Constraints for table `patrolcar`
--
ALTER TABLE `patrolcar`
  ADD CONSTRAINT `patrolcar_ibfk_1` FOREIGN KEY (`patrolcar_status_id`) REFERENCES `patrolcar_status` (`patrolcar_status_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
