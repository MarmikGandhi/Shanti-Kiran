-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2025 at 06:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shantikiran`
--

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `full_name`, `email`, `phone`, `address`, `city`, `state`, `zip_code`, `country`, `created_at`) VALUES
(1, 'Mars', 'marmik@gmail.com', '08799293933', '76 rajsthmabh society, behind baroda high school, navapura vadodara gujarat 390001', 'Vadodara', 'Gujarat', '390001', 'India', '2025-05-14 10:03:44');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `yoga_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `payer_name` varchar(100) DEFAULT NULL,
  `payment_status` enum('Pending','Completed','Failed') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `member_id`, `yoga_id`, `price`, `payment_date`, `transaction_id`, `payer_name`, `payment_status`, `created_at`) VALUES
(1, 1, 1, 600.00, '2025-05-14', '12345677833', 'mars', 'Pending', '2025-05-14 10:03:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(150) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `contact`, `created_at`) VALUES
(1, 'mars', '$2y$10$Q1G0pqDiCxPDKSWGrVdkyeFTyVexlS8NS2Dr3UO04nxvzNweKYdoi', 'marmik@gmail.com', '8799293933', '2025-05-14 10:02:05');

-- --------------------------------------------------------

--
-- Table structure for table `yoga_plans`
--

CREATE TABLE `yoga_plans` (
  `yoga_id` int(11) NOT NULL,
  `yoga_type` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `yoga_plans`
--

INSERT INTO `yoga_plans` (`yoga_id`, `yoga_type`, `description`, `price`) VALUES
(1, 'Hatha Yoga', 'Beginner-friendly sessions focusing on postures.', 600.00),
(2, 'Vinyasa Yoga', 'Dynamic flow sessions to improve flexibility.', 1500.00),
(3, 'Ashtanga Yoga', 'Structured sequences for strength building.', 1000.00),
(4, 'Yin Yoga', 'Deep stretches and relaxation-focused sessions.', 700.00),
(5, 'Power Yoga', 'High-intensity sessions for burning calories.', 1200.00),
(6, 'Prenatal Yoga', 'Focused on comfort and childbirth preparation.', 1100.00),
(7, 'Kundalini Yoga', 'Energy awakening through meditation and breathing.', 1500.00),
(8, 'Restorative Yoga', 'Gentle postures and deep relaxation sessions.', 1200.00),
(9, 'Iyengar Yoga', 'Focus on precise alignment and use of props.', 1200.00),
(10, 'Bikram Yoga', 'Hot yoga for detoxification and strength.', 800.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `yoga_id` (`yoga_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `yoga_plans`
--
ALTER TABLE `yoga_plans`
  ADD PRIMARY KEY (`yoga_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `yoga_plans`
--
ALTER TABLE `yoga_plans`
  MODIFY `yoga_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`yoga_id`) REFERENCES `yoga_plans` (`yoga_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
