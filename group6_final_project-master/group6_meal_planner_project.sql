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
(1, 2, 'Blueberry Pancakes with Mandarin', 'Flour, eggs, milk, butter, blueberries, mandarin slices, sugar, baking powder, vanilla extract', 'Fluffy pancakes topped with fresh blueberries and mandarin slices.', '/breakfest1.png', 20, 10, 350, NULL, 'Breakfast', '2024-03-15 08:00:00', NULL, 1),
(2, 2, 'Cinnamon Roll with Honey and Berries', 'Cinnamon roll, honey, whipped cream, strawberries, raspberries, blueberries, mint leaves', 'Warm cinnamon roll with honey and a medley of fresh berries.', '/breakfest2.png', 15, 5, 420, NULL, 'Breakfast', '2024-03-15 08:10:00', NULL, 1),
(3, 2, 'Avocado Toast with Eggs and Berries', 'Whole grain bread, avocado, eggs, strawberries, blueberries, salt, pepper', 'Creamy avocado toast served with sunny-side-up eggs and a side of fresh berries.', '/breakfest3.png', 10, 5, 400, NULL, 'Breakfast', '2024-03-15 08:20:00', NULL, 1),
(4, 2, 'Classic American Breakfast', 'Pancakes, eggs, bacon, toast, butter, maple syrup', 'A hearty breakfast plate with pancakes, crispy bacon, and eggs.', '/breakfest4.png', 25, 10, 700, NULL, 'Breakfast', '2024-03-15 08:30:00', NULL, 1),
(5, 2, 'Full English Breakfast', 'Eggs, bacon, sausage, baked beans, mushrooms, toast, butter', 'Traditional full English breakfast with eggs, bacon, and baked beans.', '/breakfest5.png', 30, 10, 850, NULL, 'Breakfast', '2024-03-15 08:40:00', NULL, 1),
(6, 2, 'Avocado and Cucumber Toast', 'Whole grain bread, avocado, cucumber, poached egg, parsley, red onions, olive oil', 'Light avocado and cucumber toast topped with a perfectly poached egg.', '/breakfest6.png', 15, 5, 330, NULL, 'Breakfast', '2024-03-15 08:50:00', NULL, 1),
(7, 2, 'Blueberry and Strawberry Pancakes', 'Flour, eggs, milk, butter, blueberries, strawberries, maple syrup, powdered sugar', 'Fluffy pancakes served with blueberries, strawberries, and maple syrup.', '/breakfest7.png', 20, 10, 400, NULL, 'Breakfast', '2024-03-15 09:00:00', NULL, 1),
(8, 2, 'Fruit Pancake Platter', 'Pancakes, blueberries, strawberries, raspberries, yogurt, maple syrup, mint leaves', 'A vibrant platter of pancakes topped with fresh berries and yogurt.', '/breakfest8.png', 20, 10, 380, NULL, 'Breakfast', '2024-03-15 09:10:00', NULL, 1),
(9, 2, 'Ham and Spinach Omelette', 'Eggs, ham, spinach, mozzarella, cherry tomatoes, salt, pepper', 'Delicious omelette filled with ham, spinach, and melted mozzarella cheese.', '/breakfest9.png', 15, 5, 320, NULL, 'Breakfast', '2024-03-15 09:20:00', NULL, 1),
(10, 2, 'Egg Toast with Veggies', 'Whole grain bread, eggs, avocado, bell peppers, cilantro, tomatoes, olive oil', 'Crunchy toast topped with a fried egg and fresh veggies.', '/breakfest10.png', 10, 5, 280, NULL, 'Breakfast', '2024-03-15 09:30:00', NULL, 1),
(11, 2, 'Grilled Steak with Tomato and Pepper', 'Beef steak, cherry tomato, yellow pepper, rosemary, olive oil, salt, pepper', 'Juicy grilled steak served with roasted cherry tomato and pepper.', '/dinner1.png', 20, 10, 500, NULL, 'Dinner', '2024-03-15 12:00:00', NULL, 1),
(12, 2, 'Grilled Steak with Asparagus', 'Beef steak, asparagus, garlic butter, salt, pepper, olive oil', 'Perfectly grilled steak served with garlic butter asparagus.', '/dinner2.png', 25, 10, 480, NULL, 'Dinner', '2024-03-15 12:10:00', NULL, 1),
(13, 2, 'Herb-Crusted Fish with Potatoes', 'Whole fish, potatoes, lemon, parsley, olive oil, salt, pepper', 'Fresh herb-crusted fish served with soft boiled potatoes.', '/dinner3.png', 30, 15, 450, NULL, 'Dinner', '2024-03-15 12:20:00', NULL, 1),
(14, 2, 'Grilled Salmon with Mixed Greens', 'Salmon fillet, mixed greens, cherry tomatoes, red pepper, carrots, olive oil', 'Delicious grilled salmon served with a colorful salad mix.', '/dinner4.png', 20, 10, 420, NULL, 'Dinner', '2024-03-15 12:30:00', NULL, 1),
(15, 2, 'Classic Spaghetti Bolognese', 'Spaghetti, ground beef, tomato sauce, garlic, onion, basil, parmesan cheese', 'Traditional spaghetti served with a rich Bolognese meat sauce.', '/lunch1.png', 30, 10, 650, NULL, 'Lunch', '2024-03-15 13:00:00', NULL, 1),
(16, 2, 'Grilled Chicken Protein Bowl', 'Grilled chicken breast, edamame, cherry tomatoes, corn, mushrooms, poached egg, mixed greens', 'Healthy and nutritious bowl packed with grilled chicken and fresh vegetables.', '/lunch2.png', 20, 10, 600, NULL, 'Lunch', '2024-03-15 13:10:00', NULL, 1),
(17, 2, 'Smoked Salmon with Rosti and Egg', 'Smoked salmon, rosti potatoes, poached egg, arugula, yogurt sauce, lemon', 'Savory smoked salmon paired with crispy rosti and a perfectly poached egg.', '/lunch3.png', 25, 10, 500, NULL, 'Lunch', '2024-03-15 13:20:00', NULL, 1),
(18, 2, 'Slow-Roasted Pork with Lentils', 'Pork loin, lentils, pomegranate seeds, sweet potato, parsley, olive oil, garlic', 'Tender slow-roasted pork served with seasoned lentils and sweet potatoes.', '/specials1.png', 60, 20, 750, NULL, 'Special', '2024-03-15 14:00:00', NULL, 1),
(19, 2, 'Grilled Leeks with Cheese and Nuts', 'Leeks, parmesan cheese, walnuts, garlic, olive oil, pepper', 'Grilled leeks topped with melted cheese and crunchy walnuts.', '/specials2.png', 20, 10, 300, NULL, 'Special', '2024-03-15 14:10:00', NULL, 1),
(20, 2, 'Beetroot and Gnocchi Delight', 'Gnocchi, beetroot, ricotta cheese, garlic, basil, olive oil', 'Flavorful gnocchi served with beetroot puree and creamy ricotta.', '/specials3.png', 20, 10, 350, NULL, 'Special', '2024-03-15 14:20:00', NULL, 1);

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
(2, 'james.wilson@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'James', 'Wilson', '/users/user1_m.jpeg', 987654321, 0),
(3, 'michael.brown@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'Michael', 'Brown', '/users/user2_m.jpeg', 456789123, 0),
(4, 'david.miller@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'David', 'Miller', '/users/user3_m.jpeg', 234567890, 0),
(5, 'sarah.johnson@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'Sarah', 'Johnson', '/users/user4_f.jpeg', 345678901, 0),
(6, 'emma.davis@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'Emma', 'Davis', '/users/user5_f.jpeg', 456789012, 0),
(7, 'robert.taylor@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'Robert', 'Taylor', '/users/user6_m.jpeg', 567890123, 0),
(8, 'olivia.anderson@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'Olivia', 'Anderson', '/users/user7_f.jpeg', 678901234, 0),
(9, 'william.thomas@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'William', 'Thomas', '/users/user8_m.jpeg', 789012345, 0),
(10, 'daniel.moore@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'Daniel', 'Moore', '/users/user9_m.jpeg', 890123456, 0),
(11, 'joseph.white@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'Joseph', 'White', '/users/user10_m.jpeg', 901234567, 0);

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


