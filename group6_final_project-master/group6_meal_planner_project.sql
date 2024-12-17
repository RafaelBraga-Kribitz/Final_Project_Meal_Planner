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
(1, 2, 'Quinoa Buddha Bowl', 'Quinoa, chickpeas, sweet potato, kale, tahini, olive oil, lemon juice, garlic', 'A nutritious and colorful Buddha bowl packed with protein and vegetables', 'buddha-bowl.jpg', 20, 15, 450, 'https://mealplanner.com/recipes/buddha-bowl', 'Vegan', '2024-03-15 10:00:00', NULL, 1),
(2, 2, 'Grilled Salmon with Asparagus', 'Fresh salmon fillet, asparagus, lemon, olive oil, garlic, dill, salt, pepper', 'Perfectly grilled salmon served with crispy asparagus', 'salmon-asparagus.jpg', 15, 10, 380, 'https://mealplanner.com/recipes/grilled-salmon', 'Pescatarian', '2024-03-15 10:15:00', NULL, 1),
(3, 3, 'Mediterranean Chicken Bowl', 'Chicken breast, quinoa, cucumber, cherry tomatoes, red onion, feta cheese, olive oil', 'Fresh and light Mediterranean-style chicken bowl', 'med-chicken.jpg', 25, 15, 520, 'https://mealplanner.com/recipes/med-chicken', 'Meat', '2024-03-15 11:00:00', NULL, 1),
(4, 2, 'Vegetarian Lentil Curry', 'Red lentils, coconut milk, curry powder, onion, garlic, ginger, tomatoes, spinach', 'Creamy and spicy lentil curry perfect for cold days', 'lentil-curry.jpg', 30, 10, 320, 'https://mealplanner.com/recipes/lentil-curry', 'Vegetarian', '2024-03-15 12:00:00', NULL, 1),
(5, 2, 'Tofu Stir-Fry', 'Firm tofu, broccoli, carrots, snap peas, soy sauce, ginger, garlic, sesame oil', 'Quick and healthy tofu stir-fry with crispy vegetables', 'tofu-stirfry.jpg', 20, 15, 300, 'https://mealplanner.com/recipes/tofu-stirfry', 'Vegan', '2024-03-15 13:00:00', NULL, 1),
(6, 3, 'Greek Salad Bowl', 'Mixed greens, cucumber, tomatoes, red onion, olives, feta cheese, olive oil, oregano', 'Classic Greek salad with fresh Mediterranean ingredients', 'greek-salad.jpg', 0, 15, 280, 'https://mealplanner.com/recipes/greek-salad', 'Vegetarian', '2024-03-15 14:00:00', NULL, 1),
(7, 3, 'Shrimp Scampi', 'Shrimp, garlic, white wine, lemon juice, parsley, butter, pasta', 'Classic shrimp scampi served over pasta', 'shrimp-scampi.jpg', 20, 10, 420, 'https://mealplanner.com/recipes/shrimp-scampi', 'Pescatarian', '2024-03-15 15:00:00', NULL, 1),
(8, 2, 'Turkey Meatballs', 'Ground turkey, breadcrumbs, egg, garlic, onion, parsley, marinara sauce', 'Healthy turkey meatballs in marinara sauce', 'turkey-meatballs.jpg', 25, 15, 380, 'https://mealplanner.com/recipes/turkey-meatballs', 'Meat', '2024-03-15 16:00:00', NULL, 1),
(9, 3, 'Chickpea Curry', 'Chickpeas, coconut milk, tomatoes, onion, garlic, ginger, curry powder, cilantro', 'Hearty vegan chickpea curry with aromatic spices', 'chickpea-curry.jpg', 30, 10, 340, 'https://mealplanner.com/recipes/chickpea-curry', 'Vegan', '2024-03-15 17:00:00', NULL, 1),
(10, 2, 'Grilled Vegetable Platter', 'Zucchini, eggplant, bell peppers, mushrooms, olive oil, herbs', 'Colorful platter of grilled seasonal vegetables', 'grilled-veggies.jpg', 20, 15, 200, 'https://mealplanner.com/recipes/grilled-veggies', 'Vegan', '2024-03-15 18:00:00', NULL, 1);

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
(1, 'rafael@mail.com', '[\"ROLE_ADMIN\"]', '$2y$13$fm1h4k7nOjR0g3TARawc/OR8IlcoWFxtnEHUXTVeSJmruG87gLXyO', 'Rafael', 'Braga', 'rafael-avatar.jpg', 123456789, 0),
(2, 'chef.maria@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'Maria', 'Rodriguez', 'maria-profile.jpg', 987654321, 0),
(3, 'john.cook@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'John', 'Cook', 'john-avatar.jpg', 456789123, 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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


