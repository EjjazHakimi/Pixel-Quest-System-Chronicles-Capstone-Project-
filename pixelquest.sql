-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 21, 2025 at 03:49 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pixelquest`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
CREATE TABLE IF NOT EXISTS `administrator` (
  `AdministratorID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`AdministratorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`AdministratorID`, `Username`, `Name`, `Email`, `Password`) VALUES
('AD000001', 'Elianna1593', 'Elianna', 'elianna@gmail.com', 'password123');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `FeedbackID` varchar(8) NOT NULL,
  `AdministratorID` varchar(8) NOT NULL,
  `PlayerID` varchar(8) NOT NULL,
  `ResultsID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Feedback` varchar(255) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`FeedbackID`),
  UNIQUE KEY `AdministratorID` (`AdministratorID`,`PlayerID`,`ResultsID`),
  KEY `PlayerID` (`PlayerID`),
  KEY `ResultID` (`ResultsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`FeedbackID`, `AdministratorID`, `PlayerID`, `ResultsID`, `Feedback`, `Date`) VALUES
('FB680612', 'AD000001', '1', '1', 'Goodjob', '2025-04-21');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
CREATE TABLE IF NOT EXISTS `player` (
  `PlayerID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(100) NOT NULL,
  PRIMARY KEY (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`PlayerID`, `Username`, `Name`, `Email`, `Password`) VALUES
('1', 'mochi1410', 'Suchitra Nambiar', 'suchitranabiar@gmail.com', 'password123'),
('2', 'HandsomeKenji', 'Kenji Lee', 'kenjileelianjie@gmail.com', 'password123'),
('3', 'ellyJellyBelly', 'Elianna Catrina Herrera', 'eliannaherrera2005@gmail.com', 'password123'),
('4', 'minsuga', 'Min Yoongi', 'minsugaswag@gmail.com', 'password123');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
CREATE TABLE IF NOT EXISTS `report` (
  `ReportID` varchar(8) NOT NULL,
  `PlayerID` varchar(8) NOT NULL,
  `ResultsID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Total Score` int NOT NULL,
  `Time Played` time NOT NULL,
  `Completion Percentage` float NOT NULL,
  PRIMARY KEY (`ReportID`),
  UNIQUE KEY `PlayerID` (`PlayerID`),
  UNIQUE KEY `ResultsID` (`ResultsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`ReportID`, `PlayerID`, `ResultsID`, `Total Score`, `Time Played`, `Completion Percentage`) VALUES
('RT00001', '1', '1', 500, '16:51:37', 20);

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
CREATE TABLE IF NOT EXISTS `results` (
  `ResultsID` varchar(8) NOT NULL,
  `PlayerID` varchar(8) NOT NULL,
  `StageID` varchar(8) NOT NULL,
  `Score` int NOT NULL,
  `Date` date NOT NULL,
  `Total Time` time NOT NULL,
  PRIMARY KEY (`ResultsID`),
  UNIQUE KEY `PlayerID` (`PlayerID`,`StageID`),
  KEY `StageID` (`StageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`ResultsID`, `PlayerID`, `StageID`, `Score`, `Date`, `Total Time`) VALUES
('1', '1', 'ST1', 90, '2025-04-18', '00:03:30'),
('2', '2', 'ST1', 85, '2025-04-18', '00:04:00'),
('3', '3', 'ST1', 75, '2025-04-18', '00:04:30'),
('6', '1', 'ST2', 45, '2025-04-24', '00:08:45'),
('7', '2', 'ST2', 60, '2025-04-23', '00:10:00'),
('8', '3', 'ST2', 100, '2025-04-22', '00:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `stage`
--

DROP TABLE IF EXISTS `stage`;
CREATE TABLE IF NOT EXISTS `stage` (
  `StageID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Stage Name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Stage Length` time NOT NULL,
  `Total Score` varchar(255) NOT NULL,
  PRIMARY KEY (`StageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `stage`
--

INSERT INTO `stage` (`StageID`, `Stage Name`, `Stage Length`, `Total Score`) VALUES
('ST1', 'Level 1', '00:02:00', '1000'),
('ST2', 'Level 2', '00:06:00', '2000'),
('ST3', 'Level 3', '00:10:00', '3000');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`AdministratorID`) REFERENCES `administrator` (`AdministratorID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`ResultsID`) REFERENCES `results` (`ResultsID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`ResultsID`) REFERENCES `results` (`ResultsID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`StageID`) REFERENCES `stage` (`StageID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
