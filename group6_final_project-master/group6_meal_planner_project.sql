-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2024 at 02:18 PM
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
-- Database: `group6_meal_planner_project`
--
CREATE DATABASE IF NOT EXISTS `group6_meal_planner_project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `group6_meal_planner_project`;

-- --------------------------------------------------------

--
-- Table structure for table `meal_planner`
--

CREATE TABLE `meal_planner` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `chosen_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meal_planner_recipe`
--

CREATE TABLE `meal_planner_recipe` (
  `meal_planner_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ingredients` longtext NOT NULL,
  `description` longtext DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `cooking_time` int(11) NOT NULL,
  `preparation_time` int(11) NOT NULL,
  `calories` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `date_added` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `date_updated` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`id`, `author_id`, `name`, `ingredients`, `description`, `photo`, `cooking_time`, `preparation_time`, `calories`, `link`, `type`, `date_added`, `date_updated`, `status`) VALUES
(3, 1, 'rrw', 'frwerew', 'rwre', 'rwerew', 32, 2333, 43, '43', 'Vegan', '2024-12-10 10:12:30', '2024-12-10 14:26:00', 1),
(4, 2, 'grg34', 'grg3rg34', 'grgre', 'gwrgw', 23, 324, 2434, 'fwef', 'Vegan', '2024-12-10 14:54:26', '2024-12-11 13:27:31', 1),
(5, 2, 'ferger', 'vrev', 'vervre', 'vrevre', 33, 33, 33, 'few', 'Vegan', '2024-12-11 10:05:06', NULL, 1),
(6, 2, 'efe', 'fefe', 'fefe', 'fefe', 22, 22, 22, 'fef', 'Vegan', '2024-12-11 10:06:40', NULL, 1),
(7, 2, 'fewf', 'fwfwe', 'fefw', 'fwe', 2, 2, 2, 'cds', 'Vegan', '2024-12-11 10:08:42', NULL, 1),
(8, 2, 'fe', 'fe', 'fe', 'fe', 2, 2, 2, 'fe', 'Vegan', '2024-12-11 10:15:47', NULL, 0),
(9, 2, 'fsfs', 'sdfsd', 'fsdfs', '33', 33, 33, 33, 'fs', 'Vegan', '2024-12-11 12:14:06', NULL, 0),
(10, 1, 'ferffefer', 'efe', 'fefe', 'fefe', 22, 22, 22, 'de', 'Vegan', '2024-12-11 12:51:03', '2024-12-11 13:40:04', 1),
(11, 1, 'dwedw', 'dwed', 'edwe', 'dwedw', 11, 11, 11, 'e3', 'Vegan', '2024-12-11 12:51:42', NULL, 0),
(12, 1, 'fewewew', 'dewdew', 'dewdew', 'dewdw', 11, 11, 11, 'vevr', 'Vegan', '2024-12-11 13:00:15', NULL, 1),
(13, 1, 'AdminMeal', 'fefe', 'fefe', 'fefe', 1, 1, 1, 'a', 'Vegan', '2024-12-11 13:38:52', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `first_name`, `last_name`, `photo`, `phone_number`, `blocked`) VALUES
(1, 'admin@mail.com', '[\"ROLE_ADMIN\"]', '$2y$13$fmTS7GRAJQWOwWENpN6ssexNcfelsMjC9gznUqKF0GJDRChOKOTlG', 'Admin', 'Test', NULL, 660123456, 0),
(2, 'test@mail.com', '[]', '$2y$13$WJ1N4PKluBpbBqX34wXD/.hCSmcvLnBHfPNfL5lkGZXeC/dWAwBL.', 'Test', 'Test', 'fnfe', 25468, 0),
(3, 'test1@mail.com', '[]', '$2y$13$PhXZ.hsDKi1Ah5314zVrteATkx4paMQGiW0BL6o6Bd8rQaYfW90Le', 'Test', 'Teste', 'fe', 555, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `meal_planner`
--
ALTER TABLE `meal_planner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_ECE2C578A76ED395` (`user_id`);

--
-- Indexes for table `meal_planner_recipe`
--
ALTER TABLE `meal_planner_recipe`
  ADD PRIMARY KEY (`meal_planner_id`,`recipe_id`),
  ADD KEY `IDX_73A42DC0C42A5C6B` (`meal_planner_id`),
  ADD KEY `IDX_73A42DC059D8A214` (`recipe_id`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_DA88B137F675F31B` (`author_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `meal_planner`
--
ALTER TABLE `meal_planner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `meal_planner`
--
ALTER TABLE `meal_planner`
  ADD CONSTRAINT `FK_ECE2C578A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `meal_planner_recipe`
--
ALTER TABLE `meal_planner_recipe`
  ADD CONSTRAINT `FK_73A42DC059D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_73A42DC0C42A5C6B` FOREIGN KEY (`meal_planner_id`) REFERENCES `meal_planner` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `FK_DA88B137F675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
