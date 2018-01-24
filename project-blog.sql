-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 24 яну 2018 в 14:53
-- Версия на сървъра: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project-blog`
--

-- --------------------------------------------------------

--
-- Структура на таблица `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `admins`
--

INSERT INTO `admins` (`id`, `remember_token`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, NULL, 'test@test.com', '$2y$10$3ltx8/HABPIDKfF.aleQrO5FZEXmftU1wQ82NuhiPMxBd89TGMFfy', '2018-01-24 11:37:26', '2018-01-24 11:37:26');

-- --------------------------------------------------------

--
-- Структура на таблица `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Tech', '2018-01-24 11:37:26', '2018-01-24 11:37:26'),
(2, 'Sports', '2018-01-24 11:37:26', '2018-01-24 11:37:26'),
(3, 'Food', '2018-01-24 11:37:26', '2018-01-24 11:37:26');

-- --------------------------------------------------------

--
-- Структура на таблица `category_post`
--

CREATE TABLE `category_post` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `category_post`
--

INSERT INTO `category_post` (`id`, `category_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, NULL, NULL),
(2, 2, 2, NULL, NULL),
(3, 2, 3, NULL, NULL),
(4, 1, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура на таблица `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_01_16_103303_create_posts_table', 1),
(4, '2018_01_16_103421_create_categories_table', 1),
(5, '2018_01_16_103517_create_contact_messages_table', 1),
(6, '2018_01_16_103552_create_admins_table', 1),
(7, '2018_01_16_103745_create_category_post_table', 1);

-- --------------------------------------------------------

--
-- Структура на таблица `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `posts`
--

INSERT INTO `posts` (`id`, `title`, `author`, `body`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Grigor Dimitrov is Now 3rd in the World Ranking', 'Vladimir', 'Bulgarian top tennis player Grigor Dimtrov beat American Jack Sock 4:6 6:0 6:3 in an epic semi-final at the ATP World Tour in London on 18th of November. Grigor will face David Goffin of Belgium in Sunday’s final.\r\n\r\n“I don’t know what to say. Jack is an unbelievable player. After the first set I thought I had given everything. But I did not stop believing, I like to win and today I succeeded. I tried not to have negative thoughts at the end, I am extremely happy to be in the final", Grigor said immediately after the victory.\r\n\r\nI have one more match, the last for the season, he said and thanked his fans in the arena.\r\n\r\nAs a result of this victory Grigor Dimitrov will be in third place in the world ranking; only Nadal and Federer are ahead of him.', 1, '2018-01-24 11:39:24', '2018-01-24 11:39:24'),
(2, 'Kyle Edmund blasts way into Australian Open semi-finals by ousting third seed Grigor Dimitrov', 'Vladimir', 'Kyle Edmund can never have endured a longer 20 seconds. When Grigor Dimitrov challenged the “out” call on his final slice backhand, Edmund looked up at the big screen and covered his mouth with his palm.\r\n\r\nYet the Hawk-Eye ruling, like the result itself, was categorical. The ball was long, by a couple of inches. Dimitrov, the No. 3 seed and recent ATP Finals champion, was out of the Australian Open. And Great Britain had a new sporting hero.', 1, '2018-01-24 11:40:37', '2018-01-24 11:40:37'),
(3, '2018 Australian Open: Federer says a 36-year-old shouldn''t be the favorite', 'Milen', 'Roger Federer distanced himself from favoritism for the Australian Open, highlighting his advancing age as the defending champion talked up the chances of world number one Rafael Nadal and six-time winner Novak Djokovic.\r\n\r\nEvergreen Swiss second seed Federer, 36, returns to Melbourne Park in his quest for a record-equaling sixth Australian Open title and 20th grand slam.\r\n\r\nFederer – enjoying a relaxed a stress-free preparation for the year''s opening slam which gets underway on Monday – is the early favorite to reign supreme on Rod Laver as Nadal and Djokovic battle to be fully fit in Melbourne.\r\n\r\nHowever, the former world number one insisted he is far from favorite to take out the 106th Australian Open.\r\n\r\n"I feel like maybe somebody like a Rafa, with the year that he''s had, and Novak with the six titles he''s had here, even if it''s unknown how he''s feeling, they could very well be the favorites too," Federer told reporters on Sunday.', 2, '2018-01-24 11:43:39', '2018-01-24 11:43:39'),
(4, 'What are the new features in Laravel 5.5', 'Milen', 'The Laravel community is always ready to launch the new features with its upgraded version and I have too much interest about upcoming features in Laravel.\r\n\r\nYou will have to upgrade your PHP version if you have installed older than 7.0 because Laravel 5.5 will require PHP 7.0+.\r\n\r\nLTS Release\r\nAfter Laravel 5.1, for LTS release, You will get a long term support policy with Laravel 5.5 including 2 years bug fixes and 3 years security fixes.\r\n\r\nWhoops features back in Laravel 5.5\r\nwhoops is an error handler framework for PHP used with Laravel 4 but it was removed from Laravel 5.0\r\n\r\nwhoops provide a nice, clean and elegant interface for error that notify you the error line in the file where you exactly get the error.\r\n\r\nNow you can directly open referenced files directly in your editor from whoops interface.\r\n\r\nYou can set your installed editor in handler file to overrides the whoopsHandler() method.\r\n\r\nReturn request data from validation\r\nThere are two changes in validation rules in Laravel 5.5. Now you can directly call the validate method on the request, before you pass the request instance as a first argument to validate request data, but with the release of Laravel 5.5, there is no need to pass request instance as a second argument.', 2, '2018-01-24 11:51:10', '2018-01-24 11:51:10');

-- --------------------------------------------------------

--
-- Структура на таблица `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'vladikirov@gmail.com', '$2y$10$VqQeHnC03pJXWYNPql0TquGDdRPJQi6hUhgmIMXH9.m049X5Zu1h.', '2E0cDkw9lPuVa7w4WTRCzcV87Y9qwJo2vQNdPRUqhG7gllsn6g7abhWgt0Eu', '2018-01-24 11:38:24', '2018-01-24 11:38:24'),
(2, 'milen_sh@abv.bg', '$2y$10$3xOe.LpwWXtxbyoxuYx9cOxxOyjER2NeHDSVUGYQcffvWKV60XI12', NULL, '2018-01-24 11:42:15', '2018-01-24 11:42:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_post`
--
ALTER TABLE `category_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `category_post`
--
ALTER TABLE `category_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
