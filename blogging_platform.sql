-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2024 at 01:56 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogging_platform`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `user_id`, `category_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 4, 6, 'Qui sed veniam excepturi totam dolor quod.', 'Error corporis pariatur quo rerum aperiam. Sit asperiores tempora architecto. Magni non sunt asperiores aliquam nemo.', '2024-02-02 01:39:07', '2024-02-02 01:39:07'),
(2, 5, 7, 'Vitae sunt deleniti quia numquam.', 'Alias quia quis numquam id et quas eos cumque. Natus iste suscipit pariatur hic voluptas ratione ipsum. Eaque nobis rerum officia. Et labore autem optio perspiciatis sint repellendus est.', '2024-02-02 01:39:09', '2024-02-02 01:39:09'),
(3, 6, 8, 'Voluptatem debitis omnis ut deleniti voluptatem mollitia exercitationem.', 'Dolorem animi consequatur aperiam cum. Ea modi reiciendis velit rerum rem. Est deleniti sed atque molestiae ducimus.', '2024-02-02 01:39:09', '2024-02-02 01:39:09'),
(4, 7, 9, 'Porro omnis mollitia quod ipsum.', 'Et odio quas voluptatum qui. Excepturi laudantium et nostrum deserunt aliquid at non odit. Illo facere rerum quia quo nostrum cum. Inventore quia aut voluptatem cumque.', '2024-02-02 01:39:09', '2024-02-02 01:39:09'),
(5, 8, 10, 'Doloremque minus debitis perspiciatis nobis eveniet provident numquam dolore.', 'Accusamus consequatur vel voluptas neque voluptatibus omnis. Voluptas assumenda sint qui aut. Modi non velit porro ut dolorem.', '2024-02-02 01:39:09', '2024-02-02 01:39:09'),
(20, 12, 3, 'Testing Post', '<p>This is testing post</p>', '2024-02-02 06:33:25', '2024-02-02 06:33:25');

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_tag`
--

CREATE TABLE `blog_post_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_post_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_post_tag`
--

INSERT INTO `blog_post_tag` (`id`, `blog_post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(19, 20, 12, NULL, NULL),
(20, 20, 13, NULL, NULL),
(21, 20, 14, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'quos', '2024-02-02 01:39:02', '2024-02-02 01:39:02'),
(2, 'autem', '2024-02-02 01:39:02', '2024-02-02 01:39:02'),
(3, 'repellat', '2024-02-02 01:39:02', '2024-02-02 01:39:02'),
(4, 'alias', '2024-02-02 01:39:03', '2024-02-02 01:39:03'),
(5, 'rerum', '2024-02-02 01:39:03', '2024-02-02 01:39:03'),
(6, 'mollitia', '2024-02-02 01:39:04', '2024-02-02 01:39:04'),
(7, 'omnis', '2024-02-02 01:39:04', '2024-02-02 01:39:04'),
(8, 'velit', '2024-02-02 01:39:05', '2024-02-02 01:39:05'),
(9, 'necessitatibus', '2024-02-02 01:39:06', '2024-02-02 01:39:06'),
(10, 'voluptatem', '2024-02-02 01:39:06', '2024-02-02 01:39:06');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `blog_post_id` bigint(20) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `blog_post_id`, `content`, `created_at`, `updated_at`) VALUES
(5, 11, 2, 'good post', '2024-02-02 06:31:35', '2024-02-02 06:31:35');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_31_130518_create_categories_table', 1),
(6, '2024_01_31_130648_create_blog_posts_table', 1),
(7, '2024_01_31_130845_create_comments_table', 1),
(8, '2024_02_01_210955_create_tags_table', 1),
(9, '2024_02_01_211415_create_blog_post_tag_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'test', '2024-02-02 01:56:37', '2024-02-02 01:56:37'),
(2, 'testing', '2024-02-02 01:56:37', '2024-02-02 01:56:37'),
(3, 'taggg', '2024-02-02 01:56:38', '2024-02-02 01:56:38'),
(4, 'zdvfzd', '2024-02-02 02:04:00', '2024-02-02 02:04:00'),
(5, 'dzfd', '2024-02-02 02:04:01', '2024-02-02 02:04:01'),
(6, 'dfd', '2024-02-02 02:04:51', '2024-02-02 02:04:51'),
(7, 'dfdsf', '2024-02-02 02:07:23', '2024-02-02 02:07:23'),
(8, '', '2024-02-02 02:08:50', '2024-02-02 02:08:50'),
(9, 'dsfsdf', '2024-02-02 02:11:46', '2024-02-02 02:11:46'),
(10, 'dhdt', '2024-02-02 02:31:33', '2024-02-02 02:31:33'),
(11, 'dfghdfg', '2024-02-02 02:33:44', '2024-02-02 02:33:44'),
(12, 'software', '2024-02-02 06:33:25', '2024-02-02 06:33:25'),
(13, 'information', '2024-02-02 06:33:25', '2024-02-02 06:33:25'),
(14, 'technology', '2024-02-02 06:33:25', '2024-02-02 06:33:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Shanie Boyer', 'adams.vito@example.net', '2024-02-02 01:38:59', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jkj6Ho7i8t', '2024-02-02 01:38:59', '2024-02-02 01:38:59'),
(2, 'Dr. Rowena Hintz', 'emcglynn@example.com', '2024-02-02 01:38:59', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bhdtt3ADLk', '2024-02-02 01:38:59', '2024-02-02 01:38:59'),
(3, 'Shea Gutkowski', 'emmerich.alberto@example.com', '2024-02-02 01:38:59', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rJDcSNstqw', '2024-02-02 01:39:00', '2024-02-02 01:39:00'),
(4, 'Erling Jaskolski', 'tpouros@example.com', '2024-02-02 01:39:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'IeELGK3HcJ', '2024-02-02 01:39:04', '2024-02-02 01:39:04'),
(5, 'German Koepp', 'trever.waters@example.com', '2024-02-02 01:39:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OrgDv339TD', '2024-02-02 01:39:04', '2024-02-02 01:39:04'),
(6, 'Jack Nolan', 'spencer.marley@example.com', '2024-02-02 01:39:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HnLo6YfpLZ', '2024-02-02 01:39:05', '2024-02-02 01:39:05'),
(7, 'Ms. Kaylie McLaughlin PhD', 'nhermiston@example.org', '2024-02-02 01:39:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'WBuh5FoXiK', '2024-02-02 01:39:05', '2024-02-02 01:39:05'),
(8, 'Dr. Cordell Rohan II', 'weber.alejandra@example.com', '2024-02-02 01:39:06', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'IWLNRAN1ZG', '2024-02-02 01:39:06', '2024-02-02 01:39:06'),
(10, 'madhu', 'madhu@gmail.com', NULL, '$2y$10$gFpB4KUuMVPoe.CNhUePlOHP9S65K47pya5A6niMtt6XGTwBhdmvC', 'XOrk5PDrSniZB41JH8bJbJP11QIpAse0rzKaxUo5VOa62qdBwtsMQBjxIche', '2024-02-02 01:45:14', '2024-02-02 01:45:14'),
(11, 'akshay', 'akshay@gmail.com', NULL, '$2y$10$h51JuCmy9aQn9.5PlB.wseH/sCwPJqcbFxeyWR/MCJ5YhykXnsJ.e', 'EETolgSDN9cHT2TrPLFxo0KXHVxwp3QijK0RBr6ZgH4OA9QXR2enQ30kwDsE', '2024-02-02 02:33:25', '2024-02-02 02:33:25'),
(12, 'Sweta Sharma', 'Sweta_sharma@gmail.com', NULL, '$2y$10$fw2A0JBgUX0SGkpzbtfyoOZfUGkN7ua15LjO6CujBl00ZUv5kwTPS', 'PY0d3WpRI5idWpuBGBOuNMlYXftuCx20JzBNz7Qcz2jQPLRIGl1Pq3K1TKXl', '2024-02-02 06:32:28', '2024-02-02 06:32:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_posts_user_id_foreign` (`user_id`),
  ADD KEY `blog_posts_category_id_foreign` (`category_id`);

--
-- Indexes for table `blog_post_tag`
--
ALTER TABLE `blog_post_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_post_tag_blog_post_id_foreign` (`blog_post_id`),
  ADD KEY `blog_post_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_blog_post_id_foreign` (`blog_post_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
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
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `blog_post_tag`
--
ALTER TABLE `blog_post_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `blog_posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_post_tag`
--
ALTER TABLE `blog_post_tag`
  ADD CONSTRAINT `blog_post_tag_blog_post_id_foreign` FOREIGN KEY (`blog_post_id`) REFERENCES `blog_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_blog_post_id_foreign` FOREIGN KEY (`blog_post_id`) REFERENCES `blog_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
