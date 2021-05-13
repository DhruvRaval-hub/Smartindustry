-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: sdb-d.hosting.stackcp.net
-- Generation Time: Apr 28, 2021 at 03:40 AM
-- Server version: 10.4.14-MariaDB-log
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_industry-31373343df`
--
CREATE DATABASE IF NOT EXISTS `smart_industry-31373343df` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `smart_industry-31373343df`;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_table`
--

CREATE TABLE `attendance_table` (
  `ATTENDANCE_ID` int(50) NOT NULL,
  `ALLOCATION_ID` int(50) NOT NULL,
  `STATUS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TIME` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attendance_table`
--

INSERT INTO `attendance_table` (`ATTENDANCE_ID`, `ALLOCATION_ID`, `STATUS`, `TIME`) VALUES
(1, 2, 'IN', '2021-03-26 09:06:47'),
(2, 1, 'OUT', '2021-03-26 09:15:11'),
(3, 1, 'IN', '2021-03-26 09:15:40'),
(4, 2, 'OUT', '2021-03-26 09:16:23'),
(5, 2, 'IN', '2021-03-26 09:17:49'),
(6, 2, 'OUT', '2021-03-26 09:20:06'),
(7, 2, 'IN', '2021-03-26 09:38:55'),
(8, 2, 'OUT', '2021-03-26 09:42:18'),
(9, 2, 'IN', '2021-03-27 12:06:20'),
(10, 2, 'OUT', '2021-03-27 12:06:22'),
(11, 2, 'IN', '2021-03-27 12:16:01'),
(12, 2, 'OUT', '2021-03-27 12:16:05'),
(13, 2, 'IN', '2021-03-27 12:16:48'),
(14, 2, 'OUT', '2021-03-27 12:30:14'),
(15, 2, 'IN', '2021-03-27 12:30:23'),
(16, 2, 'OUT', '2021-03-27 12:30:31'),
(17, 2, 'IN', '2021-03-27 12:30:40'),
(18, 2, 'OUT', '2021-03-27 12:31:07'),
(19, 2, 'IN', '2021-03-27 12:31:17'),
(20, 2, 'OUT', '2021-03-27 12:31:33'),
(21, 2, 'IN', '2021-03-31 06:16:06'),
(22, 2, 'OUT', '2021-03-31 06:16:37'),
(23, 2, 'IN', '2021-03-31 06:18:39'),
(24, 2, 'OUT', '2021-03-31 06:18:57'),
(25, 2, 'IN', '2021-04-08 09:28:28'),
(26, 2, 'OUT', '2021-04-08 09:28:47'),
(27, 2, 'IN', '2021-04-08 09:30:07'),
(28, 2, 'OUT', '2021-04-08 09:30:49');

-- --------------------------------------------------------

--
-- Table structure for table `detail_table`
--

CREATE TABLE `detail_table` (
  `DETAIL_ID` int(5) NOT NULL,
  `LOGIN_ID` int(25) NOT NULL,
  `NAME` varchar(25) NOT NULL,
  `DOB` date NOT NULL,
  `DISPLAY_PIC` longtext NOT NULL,
  `ADDRESS` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `device_table`
--

CREATE TABLE `device_table` (
  `DEVICE_ID` int(5) NOT NULL,
  `L_ID` int(10) NOT NULL,
  `KEY` int(30) NOT NULL,
  `ADDED_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `device_table`
--

INSERT INTO `device_table` (`DEVICE_ID`, `L_ID`, `KEY`, `ADDED_TIME`) VALUES
(1, 1, 1, '2021-03-07 15:21:36');

-- --------------------------------------------------------

--
-- Table structure for table `flame_sensor_table`
--

CREATE TABLE `flame_sensor_table` (
  `FLAME_ID` int(5) NOT NULL,
  `DEVICE_ID` int(5) NOT NULL,
  `FLAME_VALUE` varchar(25) NOT NULL,
  `READING_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flame_sensor_table`
--

INSERT INTO `flame_sensor_table` (`FLAME_ID`, `DEVICE_ID`, `FLAME_VALUE`, `READING_TIME`) VALUES
(1, 1, '0', '2021-04-21 11:16:21'),
(2, 1, '1', '2021-04-21 11:16:24'),
(3, 1, '0', '2021-04-21 11:16:29'),
(4, 1, '0', '2021-04-21 11:16:33'),
(5, 1, '1', '2021-04-21 11:16:35');

-- --------------------------------------------------------

--
-- Table structure for table `industry_table`
--

CREATE TABLE `industry_table` (
  `INDUSTRY_ID` int(5) NOT NULL,
  `LOGIN_ID` int(25) NOT NULL,
  `NAME` varchar(25) NOT NULL,
  `DETAIL` varchar(25) NOT NULL,
  `LOGO` longtext NOT NULL,
  `ADDRESS` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ir_table`
--

CREATE TABLE `ir_table` (
  `IR_ID` int(5) NOT NULL,
  `DEVICE_ID` int(5) NOT NULL,
  `COUNT` varchar(23) NOT NULL,
  `IR_VALUE` varchar(25) NOT NULL,
  `READING_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ir_table`
--

INSERT INTO `ir_table` (`IR_ID`, `DEVICE_ID`, `COUNT`, `IR_VALUE`, `READING_TIME`) VALUES
(1, 1, '1', '1', '2021-04-21 11:18:26'),
(2, 1, '1', '0', '2021-04-21 11:18:30'),
(3, 1, '1', '1', '2021-04-21 11:18:33'),
(4, 1, '1', '1', '2021-04-21 11:18:35'),
(5, 1, '1', '0', '2021-04-21 11:18:38');

-- --------------------------------------------------------

--
-- Table structure for table `ldr_table`
--

CREATE TABLE `ldr_table` (
  `LDR_ID` int(5) NOT NULL,
  `DEVICE_ID` int(5) NOT NULL,
  `LDR_VALUE` varchar(25) NOT NULL,
  `READING_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ldr_table`
--

INSERT INTO `ldr_table` (`LDR_ID`, `DEVICE_ID`, `LDR_VALUE`, `READING_TIME`) VALUES
(1, 1, '1', '2021-04-21 11:13:40'),
(2, 1, '0', '2021-04-21 11:13:45'),
(3, 1, '1', '2021-04-21 11:13:48'),
(4, 1, '1', '2021-04-21 11:13:51'),
(5, 1, '1', '2021-04-21 11:13:53');

-- --------------------------------------------------------

--
-- Table structure for table `pir_sensor_table`
--

CREATE TABLE `pir_sensor_table` (
  `PIR_ID` int(5) NOT NULL,
  `DEVICE_ID` int(5) NOT NULL,
  `PIR_VALUE` varchar(25) NOT NULL,
  `COUNT` varchar(23) NOT NULL,
  `READING_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pir_sensor_table`
--

INSERT INTO `pir_sensor_table` (`PIR_ID`, `DEVICE_ID`, `PIR_VALUE`, `COUNT`, `READING_TIME`) VALUES
(1, 1, '0', '1', '2021-04-21 11:20:27'),
(2, 1, '1', '1', '2021-04-21 11:20:33'),
(3, 1, '0', '1', '2021-04-21 11:20:37'),
(4, 1, '1', '1', '2021-04-21 11:20:43'),
(5, 1, '1', '1', '2021-04-21 11:20:47');

-- --------------------------------------------------------

--
-- Table structure for table `rfid_table`
--

CREATE TABLE `rfid_table` (
  `ALLOCATION_ID` int(50) NOT NULL,
  `EMAIL_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RFID_KEY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DEVICE_ID` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rfid_table`
--

INSERT INTO `rfid_table` (`ALLOCATION_ID`, `EMAIL_ID`, `RFID_KEY`, `DEVICE_ID`) VALUES
(1, 'd@gmail.com', '10', 1),
(2, 'dhruvraval@gmail.com', 'E7 94 9F 5F', 1),
(4, 'twinkle@gmail.com', 'tt ff ee 44', 1),
(5, 'twin@gmail.com', '10', 1),
(6, 'neel@op.com', 'R8 EE 56 22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `smoke_sensor_table`
--

CREATE TABLE `smoke_sensor_table` (
  `SMOKE_ID` int(5) NOT NULL,
  `DEVICE_ID` int(5) NOT NULL,
  `SMOKE_VALUE` varchar(25) NOT NULL,
  `READING_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `smoke_sensor_table`
--

INSERT INTO `smoke_sensor_table` (`SMOKE_ID`, `DEVICE_ID`, `SMOKE_VALUE`, `READING_TIME`) VALUES
(1, 1, '0', '2021-04-21 11:22:16'),
(2, 1, '0', '2021-04-21 11:22:18'),
(3, 1, '1', '2021-04-21 11:22:21'),
(4, 1, '1', '2021-04-21 11:22:23'),
(5, 1, '0', '2021-04-21 11:22:26');

-- --------------------------------------------------------

--
-- Table structure for table `soil_mositure_table`
--

CREATE TABLE `soil_mositure_table` (
  `SM_ID` int(5) NOT NULL,
  `DEVICE_ID` int(5) NOT NULL,
  `SOILM_VALUE` varchar(25) NOT NULL,
  `READING_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `soil_mositure_table`
--

INSERT INTO `soil_mositure_table` (`SM_ID`, `DEVICE_ID`, `SOILM_VALUE`, `READING_TIME`) VALUES
(1, 1, '0', '2021-04-21 11:23:38'),
(2, 1, '1', '2021-04-21 11:23:41'),
(3, 1, '0', '2021-04-21 11:23:45'),
(4, 1, '1', '2021-04-21 11:23:48'),
(5, 1, '1', '2021-04-21 11:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `LOGIN_ID` int(5) NOT NULL,
  `EMAIL_ID` varchar(255) NOT NULL,
  `PASSWORD` varchar(25) NOT NULL,
  `PHONE_NO` bigint(10) NOT NULL,
  `ROLE` int(2) NOT NULL,
  `STATUS` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`LOGIN_ID`, `EMAIL_ID`, `PASSWORD`, `PHONE_NO`, `ROLE`, `STATUS`) VALUES
(1, 'admin', '123', 9106731884, 1, 1),
(2, 'dhruvraval55@gmail.com', 'smartindustry', 9824771415, 1, 1),
(10, 'info@smart-industry.tech', 'smartindustry', 8877665544, 1, 1),
(12, 'neelradadiya20@gmail.com', 'smartindustry', 9377303594, 1, 1),
(14, 'urvishsangani3442@gmail.com', 'smartindustry', 9824218688, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `temperature_table`
--

CREATE TABLE `temperature_table` (
  `TEMP_ID` int(5) NOT NULL,
  `DEVICE_ID` int(5) NOT NULL,
  `TEMPERATURE_VALUE` varchar(25) NOT NULL,
  `HUMIDITY_VALUE` varchar(25) NOT NULL,
  `READING_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `temperature_table`
--

INSERT INTO `temperature_table` (`TEMP_ID`, `DEVICE_ID`, `TEMPERATURE_VALUE`, `HUMIDITY_VALUE`, `READING_TIME`) VALUES
(1, 1, '38', '41', '2021-04-21 11:27:45'),
(2, 1, '42', '42.6', '2021-04-21 11:28:16'),
(3, 1, '39', '37.9', '2021-04-21 11:28:31'),
(4, 1, '', '', '2021-04-22 05:15:10'),
(5, 1, '', '', '2021-04-22 05:57:09');

-- --------------------------------------------------------

--
-- Table structure for table `ultrasonic_table`
--

CREATE TABLE `ultrasonic_table` (
  `ULTRASONIC_ID` int(5) NOT NULL,
  `DEVICE_ID` int(5) NOT NULL,
  `ULTRASONIC_VALUE` varchar(25) NOT NULL,
  `READING_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ultrasonic_table`
--

INSERT INTO `ultrasonic_table` (`ULTRASONIC_ID`, `DEVICE_ID`, `ULTRASONIC_VALUE`, `READING_TIME`) VALUES
(1, 1, '26', '2021-04-21 11:29:37'),
(2, 1, '52', '2021-04-21 11:29:40'),
(3, 1, '36', '2021-04-21 11:29:48'),
(4, 1, '48', '2021-04-21 11:29:52'),
(5, 1, '18', '2021-04-21 11:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `warnings_table`
--

CREATE TABLE `warnings_table` (
  `W_ID` int(5) NOT NULL,
  `DEVICE_ID` int(5) NOT NULL,
  `IR_VALUE` varchar(25) NOT NULL,
  `ULTRASONIC_VALUE` varchar(25) NOT NULL,
  `TEMPERATURE_VALUE` varchar(25) NOT NULL,
  `HUMIDITY_VALUE` varchar(25) NOT NULL,
  `SMOKE_VALUE` varchar(25) NOT NULL,
  `FLAME_VALUE` varchar(25) NOT NULL,
  `SOILM_VALUE` varchar(25) NOT NULL,
  `LDR_VALUE` varchar(25) NOT NULL,
  `PIR_VALUE` varchar(25) NOT NULL,
  `READING_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `warnings_table`
--

INSERT INTO `warnings_table` (`W_ID`, `DEVICE_ID`, `IR_VALUE`, `ULTRASONIC_VALUE`, `TEMPERATURE_VALUE`, `HUMIDITY_VALUE`, `SMOKE_VALUE`, `FLAME_VALUE`, `SOILM_VALUE`, `LDR_VALUE`, `PIR_VALUE`, `READING_TIME`) VALUES
(2, 1, '10', '10', '10', '10', '10', '10', '10', '10', '10', '2021-03-14 22:57:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance_table`
--
ALTER TABLE `attendance_table`
  ADD PRIMARY KEY (`ATTENDANCE_ID`),
  ADD KEY `ALLOCATION_ID` (`ALLOCATION_ID`);

--
-- Indexes for table `detail_table`
--
ALTER TABLE `detail_table`
  ADD PRIMARY KEY (`DETAIL_ID`),
  ADD KEY `LOGIN_ID` (`LOGIN_ID`);

--
-- Indexes for table `device_table`
--
ALTER TABLE `device_table`
  ADD PRIMARY KEY (`DEVICE_ID`),
  ADD KEY `L_ID` (`L_ID`);

--
-- Indexes for table `flame_sensor_table`
--
ALTER TABLE `flame_sensor_table`
  ADD PRIMARY KEY (`FLAME_ID`),
  ADD KEY `DEVICE_ID` (`DEVICE_ID`);

--
-- Indexes for table `industry_table`
--
ALTER TABLE `industry_table`
  ADD PRIMARY KEY (`INDUSTRY_ID`),
  ADD KEY `LOGIN_ID` (`LOGIN_ID`);

--
-- Indexes for table `ir_table`
--
ALTER TABLE `ir_table`
  ADD PRIMARY KEY (`IR_ID`),
  ADD KEY `DEVICE_ID` (`DEVICE_ID`);

--
-- Indexes for table `ldr_table`
--
ALTER TABLE `ldr_table`
  ADD PRIMARY KEY (`LDR_ID`),
  ADD KEY `DEVICE_ID` (`DEVICE_ID`);

--
-- Indexes for table `pir_sensor_table`
--
ALTER TABLE `pir_sensor_table`
  ADD PRIMARY KEY (`PIR_ID`),
  ADD KEY `DEVICE_ID` (`DEVICE_ID`);

--
-- Indexes for table `rfid_table`
--
ALTER TABLE `rfid_table`
  ADD PRIMARY KEY (`ALLOCATION_ID`),
  ADD KEY `DEVICE_ID` (`DEVICE_ID`);

--
-- Indexes for table `smoke_sensor_table`
--
ALTER TABLE `smoke_sensor_table`
  ADD PRIMARY KEY (`SMOKE_ID`),
  ADD KEY `DEVICE_ID` (`DEVICE_ID`);

--
-- Indexes for table `soil_mositure_table`
--
ALTER TABLE `soil_mositure_table`
  ADD PRIMARY KEY (`SM_ID`),
  ADD KEY `DEVICE_ID` (`DEVICE_ID`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`LOGIN_ID`);

--
-- Indexes for table `temperature_table`
--
ALTER TABLE `temperature_table`
  ADD PRIMARY KEY (`TEMP_ID`),
  ADD KEY `DEVICE_ID` (`DEVICE_ID`);

--
-- Indexes for table `ultrasonic_table`
--
ALTER TABLE `ultrasonic_table`
  ADD PRIMARY KEY (`ULTRASONIC_ID`),
  ADD KEY `DEVICE_ID` (`DEVICE_ID`);

--
-- Indexes for table `warnings_table`
--
ALTER TABLE `warnings_table`
  ADD PRIMARY KEY (`W_ID`),
  ADD KEY `DEVICE_ID` (`DEVICE_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance_table`
--
ALTER TABLE `attendance_table`
  MODIFY `ATTENDANCE_ID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `detail_table`
--
ALTER TABLE `detail_table`
  MODIFY `DETAIL_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `device_table`
--
ALTER TABLE `device_table`
  MODIFY `DEVICE_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flame_sensor_table`
--
ALTER TABLE `flame_sensor_table`
  MODIFY `FLAME_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `industry_table`
--
ALTER TABLE `industry_table`
  MODIFY `INDUSTRY_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ir_table`
--
ALTER TABLE `ir_table`
  MODIFY `IR_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ldr_table`
--
ALTER TABLE `ldr_table`
  MODIFY `LDR_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pir_sensor_table`
--
ALTER TABLE `pir_sensor_table`
  MODIFY `PIR_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rfid_table`
--
ALTER TABLE `rfid_table`
  MODIFY `ALLOCATION_ID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `smoke_sensor_table`
--
ALTER TABLE `smoke_sensor_table`
  MODIFY `SMOKE_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `soil_mositure_table`
--
ALTER TABLE `soil_mositure_table`
  MODIFY `SM_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `LOGIN_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `temperature_table`
--
ALTER TABLE `temperature_table`
  MODIFY `TEMP_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ultrasonic_table`
--
ALTER TABLE `ultrasonic_table`
  MODIFY `ULTRASONIC_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `warnings_table`
--
ALTER TABLE `warnings_table`
  MODIFY `W_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance_table`
--
ALTER TABLE `attendance_table`
  ADD CONSTRAINT `attendance_table_ibfk_1` FOREIGN KEY (`ALLOCATION_ID`) REFERENCES `rfid_table` (`ALLOCATION_ID`);

--
-- Constraints for table `detail_table`
--
ALTER TABLE `detail_table`
  ADD CONSTRAINT `detail_table_ibfk_1` FOREIGN KEY (`LOGIN_ID`) REFERENCES `tbl_login` (`LOGIN_ID`);

--
-- Constraints for table `device_table`
--
ALTER TABLE `device_table`
  ADD CONSTRAINT `device_table_ibfk_1` FOREIGN KEY (`L_ID`) REFERENCES `tbl_login` (`LOGIN_ID`);

--
-- Constraints for table `flame_sensor_table`
--
ALTER TABLE `flame_sensor_table`
  ADD CONSTRAINT `flame_sensor_table_ibfk_1` FOREIGN KEY (`DEVICE_ID`) REFERENCES `device_table` (`DEVICE_ID`);

--
-- Constraints for table `industry_table`
--
ALTER TABLE `industry_table`
  ADD CONSTRAINT `industry_table_ibfk_1` FOREIGN KEY (`LOGIN_ID`) REFERENCES `tbl_login` (`LOGIN_ID`);

--
-- Constraints for table `ir_table`
--
ALTER TABLE `ir_table`
  ADD CONSTRAINT `ir_table_ibfk_1` FOREIGN KEY (`DEVICE_ID`) REFERENCES `device_table` (`DEVICE_ID`);

--
-- Constraints for table `ldr_table`
--
ALTER TABLE `ldr_table`
  ADD CONSTRAINT `ldr_table_ibfk_1` FOREIGN KEY (`DEVICE_ID`) REFERENCES `device_table` (`DEVICE_ID`);

--
-- Constraints for table `pir_sensor_table`
--
ALTER TABLE `pir_sensor_table`
  ADD CONSTRAINT `pir_sensor_table_ibfk_1` FOREIGN KEY (`DEVICE_ID`) REFERENCES `device_table` (`DEVICE_ID`);

--
-- Constraints for table `rfid_table`
--
ALTER TABLE `rfid_table`
  ADD CONSTRAINT `rfid_table_ibfk_1` FOREIGN KEY (`DEVICE_ID`) REFERENCES `rfid_table` (`ALLOCATION_ID`);

--
-- Constraints for table `smoke_sensor_table`
--
ALTER TABLE `smoke_sensor_table`
  ADD CONSTRAINT `smoke_sensor_table_ibfk_1` FOREIGN KEY (`DEVICE_ID`) REFERENCES `device_table` (`DEVICE_ID`);

--
-- Constraints for table `soil_mositure_table`
--
ALTER TABLE `soil_mositure_table`
  ADD CONSTRAINT `soil_mositure_table_ibfk_1` FOREIGN KEY (`DEVICE_ID`) REFERENCES `device_table` (`DEVICE_ID`);

--
-- Constraints for table `temperature_table`
--
ALTER TABLE `temperature_table`
  ADD CONSTRAINT `temperature_table_ibfk_1` FOREIGN KEY (`DEVICE_ID`) REFERENCES `device_table` (`DEVICE_ID`);

--
-- Constraints for table `ultrasonic_table`
--
ALTER TABLE `ultrasonic_table`
  ADD CONSTRAINT `ultrasonic_table_ibfk_1` FOREIGN KEY (`DEVICE_ID`) REFERENCES `device_table` (`DEVICE_ID`);

--
-- Constraints for table `warnings_table`
--
ALTER TABLE `warnings_table`
  ADD CONSTRAINT `warnings_table_ibfk_1` FOREIGN KEY (`DEVICE_ID`) REFERENCES `device_table` (`DEVICE_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
