-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 09:08 PM
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
  `type` varchar(20) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `date_updated` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`id`, `author_id`, `name`, `ingredients`, `description`, `photo`, `cooking_time`, `preparation_time`, `calories`, `link`, `type`, `date_added`, `date_updated`, `status`) VALUES
(25, 1, 'Spinach and Feta Stuffed Chicken', 'Chicken breasts, spinach, feta cheese, garlic, olive oil, salt, pepper', 'Succulent chicken breasts stuffed with creamy feta and nutritious spinach, seasoned and baked to perfection.', 'broccoli-3183560-1280-67632702dc066.jpg', 15, 15, 350, 'https://feelgoodfoodie.net/recipe/spinach-feta-stuffed-chicken/', 'Carnivore', '2024-12-18 20:48:18', NULL, 1),
(26, 1, 'Cauliflower Tacos', 'Cauliflower, corn tortillas, avocado, lime, cabbage, chipotle sauce', 'Tasty and light, these tacos feature roasted cauliflower, topped with a zesty chipotle sauce and fresh avocado', 'taco-4709325-1280-676327944155d.jpg', 25, 15, 480, 'https://www.eatingbirdfood.com/cauliflower-tacos/', 'Vegetarian', '2024-12-18 20:50:44', NULL, 1),
(27, 1, 'Garlic Butter Shrimp Pasta', 'Shrimp, spaghetti, garlic, butter, parsley, lemon', 'A quick and delicious pasta dish with shrimp sautéed in a rich garlic butter sauce, finished with fresh parsley and lemon zest', 'pasta-2912183-1280-676328062130b.jpg', 10, 10, 550, 'https://damndelicious.net/2015/03/13/garlic-butter-shrimp-pasta/', 'Pescatarian', '2024-12-18 20:52:38', NULL, 1),
(28, 1, 'Sweet Potato Soup', 'Sweet potatoes, vegetable broth, onion, garlic, ginger, coconut milk', 'A smooth and creamy soup that combines sweet potatoes with a hint of ginger and coconut milk for a comforting meal.', 'pumpkin-6662081-1280-676328894dd8a.jpg', 30, 15, 230, 'https://www.loveandlemons.com/sweet-potato-soup/', 'Vegan', '2024-12-18 20:54:49', NULL, 1),
(29, 1, 'Moroccan Chicken Tagine', 'Chicken thighs, olives, lemons, onions, Moroccan spices, cilantro', 'Aromatic and flavorful, this Moroccan tagine features tender chicken cooked with preserved lemons and olives.', 'lamb-4506612-1280-676328f5cdd6e.jpg', 45, 15, 440, 'https://www.onceuponachef.com/recipes/moroccan-chicken-tagine.html', 'Carnivore', '2024-12-18 20:56:37', NULL, 1),
(30, 1, 'Zucchini Noodles with Pesto', 'Zucchini, basil pesto, cherry tomatoes, pine nuts, Parmesan cheese', 'Fresh and healthy, these zucchini noodles are tossed with homemade basil pesto and topped with cherry tomatoes and pine nuts.', 'zucchini-1970375-1280-6763295d7fd87.jpg', 15, 15, 550, 'https://www.twopeasandtheirpod.com/zucchini-noodles-with-pesto/', 'Vegetarian', '2024-12-18 20:58:21', NULL, 1),
(31, 1, 'Korean Bibimbap', 'Rice, mixed vegetables (carrots, spinach, mushrooms), beef, gochujang, egg', 'A popular Korean dish that combines rice with seasoned vegetables, spicy beef, and a fried egg on top.', 'food-photography-2610863-1280-676329fbc7590.jpg', 30, 40, 550, 'https://www.recipetineats.com/bibimbap/', 'Carnivore', '2024-12-18 21:00:12', '2024-12-18 21:00:59', 1),
(32, 1, 'Lentil Salad', 'Lentils, cherry tomatoes, cucumber, feta cheese, red onion, lemon vinaigrette', 'Nutritious lentils mixed with fresh vegetables and feta, dressed in a zesty lemon vinaigrette, perfect for a light meal.', 'salad-1786327-1280-67632a74015d2.jpg', 15, 5, 250, 'https://www.twopeasandtheirpod.com/lentil-salad/', 'Vegetarian', '2024-12-18 21:03:00', NULL, 1),
(33, 1, 'Beef and Broccoli Stir-Fry', 'Beef strips, broccoli, soy sauce, garlic, ginger, sesame oil', 'Classic stir-fry combining tender beef and broccoli in a savory garlic and soy sauce.', 'oriental-2092468-960-720-67632af568cba.jpg', 20, 10, 335, 'https://www.dinneratthezoo.com/beef-and-broccoli-stir-fry/', 'Carnivore', '2024-12-18 21:05:09', NULL, 1),
(34, 1, 'Avocado Chocolate Mousse', 'Avocado, cocoa powder, maple syrup, vanilla extract, sea salt', 'A decadent and healthy dessert made from avocados blended with cocoa and maple syrup to create a smooth chocolate mousse.', 'chocolate-mousse-2002703-1280-67632b509da99.jpg', 1, 5, 320, 'https://chocolatecoveredkatie.com/avocado-chocolate-mousse-vegan-healthy/', 'Vegan', '2024-12-18 21:06:40', NULL, 1);

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
  `phone_number` varchar(20) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `first_name`, `last_name`, `photo`, `phone_number`, `blocked`, `image_size`, `updated_at`) VALUES
(1, 'admin@mail.com', '[\"ROLE_ADMIN\"]', '$2y$13$vWAtSdQk2HSO.8sZ3zwDIeQVhYttq3V4UumYBGSvIkqYQ1CSqzpGK', 'Admin', 'Admin', NULL, '+0660123456', 0, NULL, NULL),
(2, 'james.wilson@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'James', 'Wilson', 'user1-m-6763167786d6e771178820.jpg', '987654321', 1, 571849, '2024-12-18 19:37:43'),
(3, 'michael.brown@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'Michael', 'Brown', 'user3-m-67631be26d0cb284587989.jpg', '456789123', 0, 505573, '2024-12-18 20:00:50'),
(4, 'david.miller@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'David', 'Miller', 'user2-m-6763168471b2f962072108.jpg', '234567890', 0, 572763, '2024-12-18 19:37:56'),
(5, 'sarah.johnson@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'Sarah', 'Johnson', 'user4-f-67631691a011a396705306.jpg', '+51518', 0, 503442, '2024-12-18 19:38:09'),
(6, 'emma.davis@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'Emma', 'Davis', 'user5-f-67631cbd5c1ef530294382.jpg', '456789012', 0, 605404, '2024-12-18 20:04:29'),
(7, 'robert.taylor@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'Robert', 'Taylor', 'user6-m-67631cf070042785850668.jpg', '567890123', 0, 527160, '2024-12-18 20:05:20'),
(8, 'olivia.anderson@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'Olivia', 'Anderson', 'user7-f-67631cfa8923b627139640.jpg', '678901234', 0, 552339, '2024-12-18 20:05:30'),
(9, 'william.thomas@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'William', 'Thomas', 'user8-m-67631dafcc7f7376583759.jpg', '789012345', 0, 611956, '2024-12-18 20:08:31'),
(10, 'daniel.moore@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'Daniel', 'Moore', 'user9-m-67631e98c1031267446139.jpg', '890123456', 0, 556205, '2024-12-18 20:12:24'),
(11, 'joseph.white@mealplanner.com', '[]', '$2y$13$4JnwP/TG4biRIavFUlMjRuIAyDisWgvlrPcrwL/Qyelf1h0fQNWkK', 'Joseph', 'White', 'user10-m-67631ea6f2392497161628.jpg', '901234567', 0, 526155, '2024-12-18 20:12:38'),
(35, 'sara@mail.com', '[]', '$2y$13$7hVJGyT7OE2TsoZ7Eyl6D.QOLTCAl4K1XRP4XqjSUZ/uwVTjRhGla', 'Sara', 'Test', 'hair-5273705-1280-67632272ed743670086759.jpg', '+066078421', 0, 244532, '2024-12-18 20:28:50');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
