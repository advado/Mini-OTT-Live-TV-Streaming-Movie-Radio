-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 30, 2022 at 12:39 PM
-- Server version: 8.0.31-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `live_tv_mini`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `userName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `userName`, `password`, `email`, `full_name`, `user_role`, `created_at`, `updated_at`) VALUES
(1, 'Abdur Rahman', '$2y$10$/v8diH/7Y9r3pv0sAwM9fuB88EOXOcBNxIoTFnz0ghpzrcbtjzvBu', 'admin@gmail.com', 'ProRahman', 'super_admin', '2021-06-06 05:37:01', '2022-09-07 05:17:42');

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` bigint UNSIGNED NOT NULL,
  `admob_inter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admob_native` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admob_banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admob_reward` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_inter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_native` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_reward` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unity_appId_gameId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iron_appKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appnext_placementId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startapp_appId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `industrial_interval` int DEFAULT NULL,
  `native_ads` int DEFAULT NULL,
  `ad_types` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`id`, `admob_inter`, `admob_native`, `admob_banner`, `admob_reward`, `fb_inter`, `fb_native`, `fb_banner`, `fb_reward`, `unity_appId_gameId`, `iron_appKey`, `appnext_placementId`, `startapp_appId`, `industrial_interval`, `native_ads`, `ad_types`, `created_at`, `updated_at`) VALUES
(1, 'ca-app-pub-3940256099942544/1033173712', 'ca-app-pub-3940256099942544/2247696110', 'ca-app-pub-3940256099942544/6300978111', 'ca-app-pub-/5224354917', 'IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID', 'IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID', 'IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID', 'IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID', '4299991', '10ee0422d', 'e3cc500b-ab1b-4dfe-b435-e9dba6b5cb18', '21183084', 3, 3, '2', NULL, '2022-10-27 07:17:36');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_image`, `created_at`, `updated_at`) VALUES
(8, 'category 1', '1663491854.jpg', '2022-09-07 05:46:54', '2022-09-18 09:04:14'),
(9, 'category 2', '1665385216.jpg', '2022-09-07 06:19:44', '2022-10-10 07:00:16'),
(10, 'Songs', '1663576811.jpg', '2022-09-19 08:40:11', '2022-09-19 08:40:11');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint UNSIGNED NOT NULL,
  `cat_id` bigint UNSIGNED NOT NULL,
  `video_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_views` int NOT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `cat_id`, `video_title`, `video_url`, `video_id`, `video_thumbnail`, `video_duration`, `video_description`, `video_type`, `size`, `total_views`, `date_time`, `created_at`, `updated_at`) VALUES
(29, 8, 'Puthiyoru Lokam Video Song | Hridayam', '2094072682.mp4', 'cda11up', '1666868373.webp', '00:00', '<span style=\"font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\">Song: Puthiyoru Lokam \r\nSong composed, arranged, and programmed by Hesham Abdul Wahab\r\nSung by Vimal Roy and Bhadra Rajin\r\nLyrics by Kaithapram\r\nAdditional Vocals by Suroor Musthafa, Sara Maria Rose,\r\nAdwaith B Kumar and Amrutha KS\r\n\r\nSong mixed by Harishankar V at My Studio (Cochin)\r\nMix assisted by Akshay Kakkoth\r\nMy Studio sessions are managed by Murali Krishna Nair</span>', 'Upload', '20.20 MB', 13, '2022-09-07 10:37:44', '2022-09-07 10:37:44', '2022-10-27 10:59:33'),
(31, 9, 'Firebase Realtime Database Tutorial for Android(MVP)', 'https://www.youtube.com/watch?v=VUCbPZGjdzA', 'VUCbPZGjdzA', '1663487682.jpg', '00:05', '<div><span style=\"font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\">-Fetching the stored data from Firebase Database</span><br></div><div><span style=\"font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\">-Displaying the Fetched Items in a recycler view</span><br></div>', 'Youtube', '', 1, '2022-09-18 07:21:03', '2022-09-18 07:21:03', '2022-10-19 07:57:08'),
(32, 9, 'কোন ডিজিটাল স্কিলগুলো একুশ শতকে ম্যাটার করে', 'https://www.youtube.com/watch?v=EerV9PW7yto', 'EerV9PW7yto', '1663488460.jpg', '00:00', '<span style=\"font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\">বহুব্রীহির কো</span><span style=\"font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\">বহুব্রীহির কোর্সগুলো চেক করতে পারেন এই লিংকেঃ</span><span style=\"font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\">র্সগুলো চেক করতে পারেন এই লিংকেঃ</span>', 'Youtube', '', 1, '2022-09-18 08:07:40', '2022-09-18 08:07:40', '2022-10-10 07:42:43'),
(33, 10, '96 Songs | The Life of Ram Video Song', 'https://www.youtube.com/watch?v=6LD30ChPsSs', '6LD30ChPsSs', '1663576910.jpg', '00:00', '<span dir=\"auto\" class=\"style-scope yt-formatted-string\" style=\"margin: 0px; padding: 0px; border: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\">Madras Enterprises presents \"96\" Tamil Movie Songs\r\n\r\n96 Songs | </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" spellcheck=\"false\" href=\"https://www.youtube.com/hashtag/thelifeofram\" dir=\"auto\" style=\"display: var(--yt-endpoint-display,inline-block); cursor: pointer; text-decoration: var(--yt-endpoint-text-regular-decoration,none); overflow-wrap: var(--yt-endpoint-word-wrap,none); word-break: var(--yt-endpoint-word-break,none); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\">#TheLifeofRam</a><span dir=\"auto\" class=\"style-scope yt-formatted-string\" style=\"margin: 0px; padding: 0px; border: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\"> Video Song | </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" spellcheck=\"false\" href=\"https://www.youtube.com/hashtag/vijaysethupathi\" dir=\"auto\" style=\"display: var(--yt-endpoint-display,inline-block); cursor: pointer; text-decoration: var(--yt-endpoint-text-regular-decoration,none); overflow-wrap: var(--yt-endpoint-word-wrap,none); word-break: var(--yt-endpoint-word-break,none); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\">#VijaySethupathi</a><span dir=\"auto\" class=\"style-scope yt-formatted-string\" style=\"margin: 0px; padding: 0px; border: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\">, </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" spellcheck=\"false\" href=\"https://www.youtube.com/hashtag/trisha\" dir=\"auto\" style=\"display: var(--yt-endpoint-display,inline-block); cursor: pointer; text-decoration: var(--yt-endpoint-text-regular-decoration,none); overflow-wrap: var(--yt-endpoint-word-wrap,none); word-break: var(--yt-endpoint-word-break,none); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\">#Trisha</a><span dir=\"auto\" class=\"style-scope yt-formatted-string\" style=\"margin: 0px; padding: 0px; border: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\"> | </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" spellcheck=\"false\" href=\"https://www.youtube.com/hashtag/govindvasantha\" dir=\"auto\" style=\"display: var(--yt-endpoint-display,inline-block); cursor: pointer; text-decoration: var(--yt-endpoint-text-regular-decoration,none); overflow-wrap: var(--yt-endpoint-word-wrap,none); word-break: var(--yt-endpoint-word-break,none); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\">#GovindVasantha</a><span dir=\"auto\" class=\"style-scope yt-formatted-string\" style=\"margin: 0px; padding: 0px; border: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\"> | C. Prem Kumar\r\n\r\n#96 Ringback Tunes ► </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" spellcheck=\"false\" href=\"https://www.youtube.com/redirect?event=video_description&amp;redir_token=QUFFLUhqa0JDSGhZZVZFY2E2cWdDZjJ5OWtQUGFIbEVkZ3xBQ3Jtc0trQlA3U3ZwSWlvR1E0Nmo2Mi0xbWEzZWhIQk9aZUpfcmRqM0dScEFaOU9sRUtkYjdyY05pSGppbW92VHBwMzhnOVdUSDZpOG0zYUUyNXVoLUNtV05hQW80UmQwY3ZEenI5Y2h4bF9QUjRnSzFGbUtFWQ&amp;q=https%3A%2F%2Fbit.ly%2F2woIXyu&amp;v=6LD30ChPsSs\" rel=\"nofollow\" target=\"_blank\" dir=\"auto\" style=\"display: var(--yt-endpoint-display,inline-block); cursor: pointer; text-decoration: var(--yt-endpoint-text-regular-decoration,none); overflow-wrap: var(--yt-endpoint-word-wrap,none); word-break: var(--yt-endpoint-word-break,none); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\">https://bit.ly/2woIXyu</a>', 'Youtube', '', 0, '2022-09-19 08:41:50', '2022-09-19 08:41:50', '2022-09-19 08:41:50'),
(35, 8, 'testting2222', 'https://youtu.be/QKW7_jOjTQ8', 'QKW7_jOjTQ8', NULL, '00:00', 'asdew', 'Youtube', '', 8, '2022-10-03 10:37:18', '2022-10-03 10:37:18', '2022-10-30 12:33:09'),
(36, 9, 'hsabhjb', 'https://www.youtube.com/watch?v=bTdW0hoz-J4', 'bTdW0hoz-J4', NULL, '00:00', 'sgsgsggs', 'Youtube', '', 4, '2022-10-03 10:53:24', '2022-10-03 10:53:24', '2022-10-30 12:25:18'),
(37, 8, 'rerer', 'https://ndtv24x7elemarchana.akamaized.net/hls/live/2003678/ndtv24x7/ndtv24x7master.m3u8', 'zpOULjyy-n8', '1664795149.jpg', '00:00', 'agagsf', 'Url', '', 14, '2022-10-03 11:05:49', '2022-10-03 11:05:49', '2022-10-27 10:37:36');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(60, '2021_04_20_051617_create_regusers_table', 3),
(64, '2014_10_12_000000_create_users_table', 6),
(67, '2021_03_21_120852_create_admins_table', 6),
(69, '2021_06_21_062028_create_advertisements_table', 7),
(80, '2021_06_21_101831_create_settings_table', 8),
(81, '2021_06_24_112246_create_tokens_table', 8),
(82, '2021_06_29_060235_create_notifications_table', 8),
(88, '2021_07_14_080503_create_url_types_table', 8),
(89, '2021_07_14_090933_create_user_agent_types_table', 8),
(90, '2021_07_15_120252_create_token_types_table', 9),
(92, '2022_07_18_131753_create_categories_table', 11),
(95, '2021_05_27_075818_create_sliders_table', 13),
(96, '2022_07_19_064520_create_items_table', 14);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `message`, `url`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 'Hair Cut', 'asdgfhjhhhgf', 'https://www.google.com/', 'https://i.pinimg.com/736x/5c/a9/6f/5ca96fe550aab0f2cc2768d3dee9417d.jpg', '2021-07-25 04:46:15', '2021-07-25 04:46:15'),
(2, 'ashbfdjhb', 'sdjbkjdbnkj', 'cdsbckjbn', 'https://i.pinimg.com/736x/5c/a9/6f/5ca96fe550aab0f2cc2768d3dee9417d.jpg', '2022-07-20 10:27:12', '2022-07-20 10:27:12'),
(3, 'hi', 'hello', 'how r you', 'https://i.pinimg.com/736x/5c/a9/6f/5ca96fe550aab0f2cc2768d3dee9417d.jpg', '2022-09-07 05:14:50', '2022-09-07 05:14:50'),
(4, 'test', 'hello', 'https://www.youtube.com/watch?v=P2ra45c4Gp4', 'https://media.istockphoto.com/vectors/hand-holding-mobile-phone-with-new-email-icon-vector-illustration-vector-id1256767138?k=20&m=1256767138&s=612x612&w=0&h=CCNflxf6O4nT2g2vYyAljOaNGTJBXpvPj6t4bQhfh44=', '2022-09-18 09:13:55', '2022-09-18 09:13:55'),
(5, 'test', 'go ahead', 'https://www.youtube.com/watch?v=P2ra45c4Gp4', 'https://media.istockphoto.com/vectors/hand-holding-mobile-phone-with-new-email-icon-vector-illustration-vector-id1256767138?k=20&m=1256767138&s=612x612&w=0&h=CCNflxf6O4nT2g2vYyAljOaNGTJBXpvPj6t4bQhfh44=', '2022-09-18 10:04:28', '2022-09-18 10:04:28'),
(6, 'test', 'hello, good evening', 'https://www.youtube.com/watch?v=7REPYx4XMW8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png', '2022-10-03 12:40:12', '2022-10-03 12:40:12'),
(7, 'test 1', 'check', 'https://www.youtube.com/watch?v=7REPYx4XMW8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png', '2022-10-03 12:43:12', '2022-10-03 12:43:12');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `app_fcm_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `one_signal` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `api_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ggl_ply_lcns_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_subscription_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ggl_product_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `privacy_policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `app_fcm_key`, `one_signal`, `api_key`, `app_version`, `ggl_ply_lcns_key`, `app_subscription_key`, `ggl_product_key`, `privacy_policy`, `created_at`, `updated_at`) VALUES
(1, 'AAAA6a5D-3A:APA91bFrJghKny1lk4qgLFl9hRLTpDh6-YL48QK8OiIQA4W3VJn2ySok_pVjt_JpIbdrkV7mEbsFE99Sk_ztAIxVu7rHhW96ivmQZE0x5v5MjodD5334pwStuPZpo-xZmUeXkI6aby-7', NULL, 'fchgjvhiooijoj', '', '', '', '1asgdggfedw5EgrFdwerght', '<p style=\"margin-bottom: 25px; width: 777px; caret-color: rgb(33, 37, 41); color: rgb(33, 37, 41); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 18px;\">Developing or publishing a mobile app?&nbsp;Your mobile app almost certainly requires a Privacy Policy sdfkjdnj</p><ul style=\"margin-bottom: 30px; caret-color: rgb(33, 37, 41); color: rgb(33, 37, 41); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 18px;\"><li style=\"margin-bottom: 20px;\">You may need a Privacy Policy to comply with privacy law</li><li style=\"margin-bottom: 20px;\">Apple requires all iOS developers to publish a Privacy Policy</li><li style=\"margin-bottom: 20px;\">Google requires almost all Android developers to publish a Privacy Policy</li></ul><p style=\"margin-bottom: 25px; width: 777px; caret-color: rgb(33, 37, 41); color: rgb(33, 37, 41); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 18px;\">This article contains&nbsp;some simple, step-by-step guides to creating a basic Privacy Policy for your mobile app.</p><p style=\"margin-bottom: 25px; width: 777px; caret-color: rgb(33, 37, 41); color: rgb(33, 37, 41); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 18px;\"><br></p><p style=\"margin-bottom: 25px; width: 777px; caret-color: rgb(33, 37, 41); color: rgb(33, 37, 41); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 18px;\">We\'re going to look briefly at the requirements under&nbsp;<a href=\"https://www.termsfeed.com/blog/sample-mobile-app-privacy-policy-template/#Privacy_Law_And_Mobile_Apps\" style=\"color: rgb(0, 81, 170); outline: none;\">privacy law</a>,&nbsp;<a href=\"https://www.termsfeed.com/blog/sample-mobile-app-privacy-policy-template/#Do_I_Need_A_Privacy_Policy_For_My_Ios_App\" style=\"color: rgb(0, 81, 170); outline: none;\">Apple\'s policies</a>, and&nbsp;<a href=\"https://www.termsfeed.com/blog/sample-mobile-app-privacy-policy-template/#Do_I_Need_A_Privacy_Policy_For_My_Android_App\" style=\"color: rgb(0, 81, 170); outline: none;\">Google\'s policies</a>, so you can confirm whether you&nbsp;<em>need</em>&nbsp;a Privacy Policy for your mobile app.</p><p style=\"margin-bottom: 25px; width: 777px; caret-color: rgb(33, 37, 41); color: rgb(33, 37, 41); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 18px;\">If you already know you need to create a Privacy Policy for your mobile app, you can&nbsp;jump straight to our step-by-step guides to creating a Privacy Policy&nbsp;for an&nbsp;&nbsp;an&nbsp;<a href=\"https://www.termsfeed.com/blog/sample-mobile-app-privacy-policy-template/#Privacy_Policy_For_Android_Apps\" style=\"color: rgb(0, 81, 170); outline: none;\">Android app</a>, or for&nbsp;<a href=\"https://www.termsfeed.com/blog/sample-mobile-app-privacy-policy-template/#Cross_Platform_Mobile_App_Privacy_Policy\" style=\"color: rgb(0, 81, 170); outline: none;\">both platforms</a>.</p>', NULL, '2022-10-03 12:39:23');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `cat_id` bigint UNSIGNED NOT NULL,
  `video_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_views` int NOT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `cat_id`, `video_title`, `video_url`, `video_id`, `video_thumbnail`, `video_duration`, `video_description`, `video_type`, `size`, `total_views`, `date_time`, `created_at`, `updated_at`) VALUES
(29, 9, 'adhbajhbd', '1775228223.mp4', 'cda11up', '1663487661.jpg', '21', 'asffsa', 'Upload', '5.01 MB', 11, '2022-09-07 07:15:10', '2022-09-07 07:15:10', '2022-10-19 08:00:48'),
(30, 10, 'Test Slider', 'https://www.youtube.com/watch?v=H8MEOs-uSvY', 'H8MEOs-uSvY', '1663577533.jpg', '00:00', 'nothing', 'Youtube', '', 0, '2022-09-19 08:52:13', '2022-09-19 08:52:13', '2022-09-19 08:55:28'),
(31, 10, 'OneRepublic - Someday', '615563636.mp4', '', '1663578883.jpg', '00:00', 'video id missing test', 'Upload', '11.45 MB', 0, '2022-09-19 09:14:43', '2022-09-19 09:14:43', '2022-09-19 09:19:40'),
(32, 10, '96 Songs | The Life of Ram Video Song', 'https://youtu.be/VUCbPZGjdzA', 'VUCbPZGjdzA', '', '00:00', 'fsf', 'Youtube', '', 2, '2022-10-03 11:29:11', '2022-10-03 11:29:11', '2022-10-19 07:56:41');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `device_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `device_token`, `device_name`, `created_at`, `updated_at`) VALUES
(1, 'dHc7o5FyTDm0t7xVXfyT1L:APA91bGLAr8eCVugTH4XF--iOI1UHZ_DpDViwnlgq3Q1RBzTCS2HC0GLS7Tof0idTenqL856SjCx0oyDemXcaMYWz3FlpFvCDLF9C0HL43xGYQUCUcfHWhXF97gj8o1GyzTKFXPfo-CY', 'Xiaomi Mi 9 Lite', '2021-07-29 05:50:57', '2021-07-29 05:50:57'),
(2, 'cshF29--RsS54t1DVJ4Kjd:APA91bHrbEmJRZy2Pac2OvI2C450YqQ6wQGrWZ7dEUF4pG6D880ZzpUPhH5DN8UotjQu3tUjiDDUlLzUUSMGVho6Gxz3gsrWwWPg0RMziHP6W7t-pdpfLf_V8pHralGZ4bNeMqC4ON5p', 'Xiaomi Mi 9 Lite', '2021-07-31 11:06:06', '2021-07-31 11:06:06'),
(3, 'dn_m3OPhRnmzj_tYnMNIII:APA91bF7mPFv7ABoa2ZOPTanpgyyFkHQmJ2rrDgu4FzfAZQOmfx3EMDTpMYB5v6F8uUnXHCiIpdz0c7cUboBOAjXzSskyZpfFKvW7myhVaVNikE1R_ty3AZ3II8jRmUlSQuJN6W94msb', 'Xiaomi Mi 9 Lite', '2021-08-07 05:26:05', '2021-08-07 05:26:05'),
(4, 'cKXQc8XtTgObDBaC9LPnmR:APA91bFu-kWjZBK3Q67GbbVHaprSG0Z5Moc9_hD4pOojJNsaTZGVHC9mYdI0GEd79-R3QQtq3WOkEOVJ6xGLHi9-A4a9ZCq6DMDTEReHoEhZ_IwGi-dfCCifBW2Q_dbb87BJUeNQpSOS', 'Xiaomi M2003J15SC', '2021-08-07 06:03:34', '2021-08-07 06:03:34'),
(5, 'dn_m3OPhRnmzj_tYnMNIII:APA91bHRKXk5jsbYYrb0Kp0E6JlNAdrOvw39dKsUwTzjU2pIgep9R6Bps002D8wE68gDtRBinx3nvGOBAJY7PojKy_zZIV4JT9C219yK_ULdognyvejA-X3aHnSioAKM-RkFt-aH1bMu', 'Xiaomi Mi 9 Lite', '2021-08-08 05:48:32', '2021-08-08 05:48:32'),
(6, 'dn_m3OPhRnmzj_tYnMNIII:APA91bFyMjIwZK_OibttDIA-EEYZyo1wD5il_Mflvwbiq2YS1HEymNH_vVVmTz7kBp3YK1v58ApE3GpgkczSWY4JGlsodikrE9WzJexZCxqr6xwiOYevjFAXhiZJHGou1Ul580LsU0xz', 'Xiaomi Mi 9 Lite', '2021-08-08 06:34:58', '2021-08-08 06:34:58'),
(7, 'dn_m3OPhRnmzj_tYnMNIII:APA91bHwWFPjerkfjWgE7jYj8WyqyKk8wykSsFXbMynKlDDt3rkMIoYKE0k8om6uHD19viSwj805P0RnjyZnYK3Yvg_UMbFqltl7-_Z0NEEmg2v7-j3tEAxdUjv5LeMY9E9tzhz6Jzu5', 'Xiaomi Mi 9 Lite', '2021-08-08 06:36:33', '2021-08-08 06:36:33'),
(8, 'dn_m3OPhRnmzj_tYnMNIII:APA91bHYdqL8sOUB9sQXzhDxAn1KywDtLmvLtzZ5O_StaKcMA71nEJXFZRIC0JuLXj8r7r0uRHj7a3O--LVk5hjwobRIxteHb7R8t-Z9g3RdmWoISAFFRRW1e0sLvcab4psbJ6Zrs9Hm', 'Xiaomi Mi 9 Lite', '2021-08-08 06:49:59', '2021-08-08 06:49:59'),
(9, 'dn_m3OPhRnmzj_tYnMNIII:APA91bHYdqL8sOUB9sQXzhDxAn1KywDtLmvLtzZ5O_StaKcMA71nEJXFZRIC0JuLXj8r7r0uRHj7a3O--LVk5hjwobRIxteHb7R8t-Z9g3RdmWoISAFFRRW1e0sLvcab4psbJ6Zrs9Hm', 'Xiaomi Mi 9 Lite', '2021-08-08 06:49:59', '2021-08-08 06:49:59'),
(10, 'dn_m3OPhRnmzj_tYnMNIII:APA91bG4LvN2fGqF-6oobMN5aZUr29rMW7JRMBhbmFwCfDwQYxN9EkpjoQ0EoKa0GgJcHTk8wvhO2b1G_GUiwbX4HY8p2Nu2cIswZyF0ao3jHfhsuVVt-SgEbb8f5KJnYA3P-MDZJIfM', 'Xiaomi Mi 9 Lite', '2021-08-08 06:50:04', '2021-08-08 06:50:04'),
(11, 'dn_m3OPhRnmzj_tYnMNIII:APA91bG4LvN2fGqF-6oobMN5aZUr29rMW7JRMBhbmFwCfDwQYxN9EkpjoQ0EoKa0GgJcHTk8wvhO2b1G_GUiwbX4HY8p2Nu2cIswZyF0ao3jHfhsuVVt-SgEbb8f5KJnYA3P-MDZJIfM', 'Xiaomi Mi 9 Lite', '2021-08-08 06:50:04', '2021-08-08 06:50:04'),
(12, 'dn_m3OPhRnmzj_tYnMNIII:APA91bGiQcub7_-ABhMHs1uDe0oO6beRkcxGY57mbj4E6rvrd_BR8ZvG90i9kJmHu4zK1S1bjyyubdnmqqhky81RaMFjNT13HT7Rt6dyQPhrVfgjzoYBvBzyGOeTN84AdLj7Mj-tjpDP', 'Xiaomi Mi 9 Lite', '2021-08-08 06:50:07', '2021-08-08 06:50:07'),
(13, 'dn_m3OPhRnmzj_tYnMNIII:APA91bGiQcub7_-ABhMHs1uDe0oO6beRkcxGY57mbj4E6rvrd_BR8ZvG90i9kJmHu4zK1S1bjyyubdnmqqhky81RaMFjNT13HT7Rt6dyQPhrVfgjzoYBvBzyGOeTN84AdLj7Mj-tjpDP', 'Xiaomi Mi 9 Lite', '2021-08-08 06:50:07', '2021-08-08 06:50:07'),
(14, 'dn_m3OPhRnmzj_tYnMNIII:APA91bHq3_WW--5P-q-LAk6dmRCTwHx_j7bKqqOkFNgC2WSZhZOlCSVtuer_FB2uOmGa7N0Qi-WhJHdmEAzFT1pkaSAZr6doNU4lF5vcbFsPsUAZFYGUoCGiWBEB-9iqaGhX95NZ_Ypt', 'Xiaomi Mi 9 Lite', '2021-08-08 06:50:14', '2021-08-08 06:50:14'),
(15, 'dn_m3OPhRnmzj_tYnMNIII:APA91bHq3_WW--5P-q-LAk6dmRCTwHx_j7bKqqOkFNgC2WSZhZOlCSVtuer_FB2uOmGa7N0Qi-WhJHdmEAzFT1pkaSAZr6doNU4lF5vcbFsPsUAZFYGUoCGiWBEB-9iqaGhX95NZ_Ypt', 'Xiaomi Mi 9 Lite', '2021-08-08 06:50:14', '2021-08-08 06:50:14'),
(16, 'dn_m3OPhRnmzj_tYnMNIII:APA91bHk_-D812Kx1AZHkK-rKpTXeaz_CkaBu3zT7-_mTuAe0jPQgM6qZj7NnVcyvMhXF6b9b9ZOjThNAueibmvkoLZbvdvnHwqlZd-mhuOFJpZn87A2UHuepMLZxzlZj-UfR8rdXK4k', 'Xiaomi Mi 9 Lite', '2021-08-08 06:50:47', '2021-08-08 06:50:47'),
(17, 'dn_m3OPhRnmzj_tYnMNIII:APA91bHk_-D812Kx1AZHkK-rKpTXeaz_CkaBu3zT7-_mTuAe0jPQgM6qZj7NnVcyvMhXF6b9b9ZOjThNAueibmvkoLZbvdvnHwqlZd-mhuOFJpZn87A2UHuepMLZxzlZj-UfR8rdXK4k', 'Xiaomi Mi 9 Lite', '2021-08-08 06:50:47', '2021-08-08 06:50:47'),
(18, 'dn_m3OPhRnmzj_tYnMNIII:APA91bG2EuS7lk_xKXnAZRIej9W5UHG5F5AVhj5gqsHtPD_Qr7Oxv7geSdt27n5aXKVXGhNW1cH7mv2ZqNHbkjHfNCiIh4m7xUO77u00YGOx90R_-Juhu23n12_jyDC1KzcgIVUWkwsm', 'Xiaomi Mi 9 Lite', '2021-08-08 06:50:57', '2021-08-08 06:50:57'),
(19, 'dn_m3OPhRnmzj_tYnMNIII:APA91bG2EuS7lk_xKXnAZRIej9W5UHG5F5AVhj5gqsHtPD_Qr7Oxv7geSdt27n5aXKVXGhNW1cH7mv2ZqNHbkjHfNCiIh4m7xUO77u00YGOx90R_-Juhu23n12_jyDC1KzcgIVUWkwsm', 'Xiaomi Mi 9 Lite', '2021-08-08 06:50:57', '2021-08-08 06:50:57'),
(20, 'dn_m3OPhRnmzj_tYnMNIII:APA91bFyg9oTxTaB2BgxxrR_g7-rzBZv5xh9SstGRcjzHb2xIjQKnWqImygItMvBM9JLrRitQQQHRmt_rpItHIQxBoka530V9QIcPDROXNABpCBgxv1ep4F2c38jZLPbS-K3UY7A_X4A', 'Xiaomi Mi 9 Lite', '2021-08-08 06:50:59', '2021-08-08 06:50:59'),
(21, 'dn_m3OPhRnmzj_tYnMNIII:APA91bFyg9oTxTaB2BgxxrR_g7-rzBZv5xh9SstGRcjzHb2xIjQKnWqImygItMvBM9JLrRitQQQHRmt_rpItHIQxBoka530V9QIcPDROXNABpCBgxv1ep4F2c38jZLPbS-K3UY7A_X4A', 'Xiaomi Mi 9 Lite', '2021-08-08 06:50:59', '2021-08-08 06:50:59'),
(22, 'dn_m3OPhRnmzj_tYnMNIII:APA91bHRI0VdGD3c5N0SXGuNzQOntB9DaEkGRljwGN4Co8EVKwDsZDRGBK5F9OhLWP9okec1RJ8mrOKS7BtSmxQ9Qxfuv-KpthlkgRIzr1IiAq4bxu7ZeXcXKxTnOBjukMGcrWnILLNA', 'Xiaomi Mi 9 Lite', '2021-08-08 06:51:59', '2021-08-08 06:51:59'),
(23, 'dn_m3OPhRnmzj_tYnMNIII:APA91bHRI0VdGD3c5N0SXGuNzQOntB9DaEkGRljwGN4Co8EVKwDsZDRGBK5F9OhLWP9okec1RJ8mrOKS7BtSmxQ9Qxfuv-KpthlkgRIzr1IiAq4bxu7ZeXcXKxTnOBjukMGcrWnILLNA', 'Xiaomi Mi 9 Lite', '2021-08-08 06:52:11', '2021-08-08 06:52:11'),
(24, 'dn_m3OPhRnmzj_tYnMNIII:APA91bEFokNPI9J1UhsFm9OpfZq_NNY1R-qqaWp8ECrT8J0q36e6p_EHk3Lad2P4T-76gE1weLs6q1bla66g-uhFkxr-4bvx7lYZNGTHeEP1IIjy-Zu8Rz9ZtDQf30_rUcRJLUS1EBUR', 'Xiaomi Mi 9 Lite', '2021-08-08 06:52:14', '2021-08-08 06:52:14'),
(25, 'dn_m3OPhRnmzj_tYnMNIII:APA91bEFokNPI9J1UhsFm9OpfZq_NNY1R-qqaWp8ECrT8J0q36e6p_EHk3Lad2P4T-76gE1weLs6q1bla66g-uhFkxr-4bvx7lYZNGTHeEP1IIjy-Zu8Rz9ZtDQf30_rUcRJLUS1EBUR', 'Xiaomi Mi 9 Lite', '2021-08-08 06:52:14', '2021-08-08 06:52:14'),
(26, 'dn_m3OPhRnmzj_tYnMNIII:APA91bElZKWG3-yr4ieLWr-DCAigTVjktQ_2UaKv0Bnaxipa8guvArear2H56Z31CAENA5tJdUy6ylaQrG0pWtD9RCIfJgrAx21Em7YlSlHxAXhzJmPI-YwRXT-7eZrDpf9uI85lSBLk', 'Xiaomi Mi 9 Lite', '2021-08-08 06:52:16', '2021-08-08 06:52:16'),
(27, 'dn_m3OPhRnmzj_tYnMNIII:APA91bElZKWG3-yr4ieLWr-DCAigTVjktQ_2UaKv0Bnaxipa8guvArear2H56Z31CAENA5tJdUy6ylaQrG0pWtD9RCIfJgrAx21Em7YlSlHxAXhzJmPI-YwRXT-7eZrDpf9uI85lSBLk', 'Xiaomi Mi 9 Lite', '2021-08-08 06:52:16', '2021-08-08 06:52:16'),
(28, 'dn_m3OPhRnmzj_tYnMNIII:APA91bHTlx3_js30g2BtIJbMaloBEYGRqWLgsAwTfm4kcLq_1HNz3CZMVTsR0745OcACvE0LhpI7qOQG_Ub1gFlQymQZnZegpnwoONK13hPY-qINctND6csrqNU0mr8P0eavC7zpbqA0', 'Xiaomi Mi 9 Lite', '2021-08-08 06:53:24', '2021-08-08 06:53:24'),
(29, 'dn_m3OPhRnmzj_tYnMNIII:APA91bHTlx3_js30g2BtIJbMaloBEYGRqWLgsAwTfm4kcLq_1HNz3CZMVTsR0745OcACvE0LhpI7qOQG_Ub1gFlQymQZnZegpnwoONK13hPY-qINctND6csrqNU0mr8P0eavC7zpbqA0', 'Xiaomi Mi 9 Lite', '2021-08-08 06:53:24', '2021-08-08 06:53:24'),
(30, 'dn_m3OPhRnmzj_tYnMNIII:APA91bF5xYBjTHC6xAehhOaQn62AN6AetRZH5p-BaBtppOY3BxeVsgP_huYHMDZM0aOx8wpbt_F0ceRKWP5jp3qGt1JoqsPs01fzwg4gk9h2rVg9s7p6NDMtKf6re--5wSDqENWNkHhV', 'Xiaomi Mi 9 Lite', '2021-08-08 06:54:18', '2021-08-08 06:54:18'),
(31, 'dn_m3OPhRnmzj_tYnMNIII:APA91bF5xYBjTHC6xAehhOaQn62AN6AetRZH5p-BaBtppOY3BxeVsgP_huYHMDZM0aOx8wpbt_F0ceRKWP5jp3qGt1JoqsPs01fzwg4gk9h2rVg9s7p6NDMtKf6re--5wSDqENWNkHhV', 'Xiaomi Mi 9 Lite', '2021-08-08 06:54:36', '2021-08-08 06:54:36'),
(32, 'dn_m3OPhRnmzj_tYnMNIII:APA91bFUS04oSwLlniYdMls6CWE6u-YzFLj4ZQ21MiFLlOupJI5rZ90R_A3Gp9BesF5BthIK8wo1ni5JYlvNESWX4sFgZsOZNYENE5iu-iCawYuZHOGCr1UqL4j7gEkq_f5RNfgQcwjH', 'Xiaomi Mi 9 Lite', '2021-08-08 06:55:12', '2021-08-08 06:55:12'),
(33, 'dn_m3OPhRnmzj_tYnMNIII:APA91bFUS04oSwLlniYdMls6CWE6u-YzFLj4ZQ21MiFLlOupJI5rZ90R_A3Gp9BesF5BthIK8wo1ni5JYlvNESWX4sFgZsOZNYENE5iu-iCawYuZHOGCr1UqL4j7gEkq_f5RNfgQcwjH', 'Xiaomi Mi 9 Lite', '2021-08-08 06:55:35', '2021-08-08 06:55:35'),
(34, 'dn_m3OPhRnmzj_tYnMNIII:APA91bFzPdV2HlsdZ85L4dbdXInmdUi6lPlq_6ICbjv7IPDh4kAln-P-wZCwEOPCkEqfJaQ7cHiTUwdRKmBZTrtHNrJr1CDCG3Rasifd3XH6-viHsCHSFz833mNgZ86_s-3PgH7kiD5V', 'Xiaomi Mi 9 Lite', '2021-08-08 06:56:37', '2021-08-08 06:56:37'),
(35, 'dn_m3OPhRnmzj_tYnMNIII:APA91bFzPdV2HlsdZ85L4dbdXInmdUi6lPlq_6ICbjv7IPDh4kAln-P-wZCwEOPCkEqfJaQ7cHiTUwdRKmBZTrtHNrJr1CDCG3Rasifd3XH6-viHsCHSFz833mNgZ86_s-3PgH7kiD5V', 'Xiaomi Mi 9 Lite', '2021-08-08 06:56:37', '2021-08-08 06:56:37'),
(36, 'dn_m3OPhRnmzj_tYnMNIII:APA91bGtniwrvS8rPaso0_BqQjafwCo4Asow7caYYwOmdBFjkhs6MnmUrUbQzYwV5THWeWTZDfuke2ZjQ6V68UaaxBKFuqor8UOqTq3vEp4vE5G2e-adsHAW8rRj8HScw4dVPifq32UB', 'Xiaomi Mi 9 Lite', '2021-08-08 06:56:40', '2021-08-08 06:56:40'),
(37, 'dn_m3OPhRnmzj_tYnMNIII:APA91bGtniwrvS8rPaso0_BqQjafwCo4Asow7caYYwOmdBFjkhs6MnmUrUbQzYwV5THWeWTZDfuke2ZjQ6V68UaaxBKFuqor8UOqTq3vEp4vE5G2e-adsHAW8rRj8HScw4dVPifq32UB', 'Xiaomi Mi 9 Lite', '2021-08-08 06:56:40', '2021-08-08 06:56:40'),
(38, 'dn_m3OPhRnmzj_tYnMNIII:APA91bGMBuVhrmjDaNqgMQh_D-7b8bCt6QZeQFJvGvHu0UkgCAsKOKAtFeZKPUBqzmn6wJKDKehUBz7f3vdVSlQM8VdAhwE83_N6h9c0VXMETMXN_brN0tfY4hiaigF9VuT3mHfqW_nt', 'Xiaomi Mi 9 Lite', '2021-08-08 06:57:14', '2021-08-08 06:57:14'),
(39, 'dn_m3OPhRnmzj_tYnMNIII:APA91bGMBuVhrmjDaNqgMQh_D-7b8bCt6QZeQFJvGvHu0UkgCAsKOKAtFeZKPUBqzmn6wJKDKehUBz7f3vdVSlQM8VdAhwE83_N6h9c0VXMETMXN_brN0tfY4hiaigF9VuT3mHfqW_nt', 'Xiaomi Mi 9 Lite', '2021-08-08 06:57:14', '2021-08-08 06:57:14'),
(40, 'dn_m3OPhRnmzj_tYnMNIII:APA91bHYEViu6my4wRrB0lQiGk7eqqtKwCWvp-jIyUY1cIzToVDdL7CudXTDYOJydTTPhgTkncN5BzXoH-Row-7tQ-yLAzxQYScU3bVCaqD_gxrwLWf9Gb8_M5uve2Y0QFwosk3h8H_B', 'Xiaomi Mi 9 Lite', '2021-08-08 07:04:27', '2021-08-08 07:04:27'),
(41, 'eTZSkpe0QlaEeZ_h-h-8Yv:APA91bGt2vJrJ_fhvhmqNCRmtow5gW8QMM002wAGK0ydQIQukFpkBJKJkBKnXXRh6o2b6xUbjlvGe6XJMw27Dl3QyrKERzqZ07l2aN_F7GxTE92kQh6qhY-kb-PhBh9MEAh08LmKf7dt', 'Xiaomi Mi 9 Lite', '2021-08-08 09:51:28', '2021-08-08 09:51:28'),
(42, 'fdS-6p_cR6KQah7f9a1A7_:APA91bFSiHZZ9gdY72taNZviXOWh5_VRCmCoK70weaAblGJlt9UZ56FQ2sxZTmhec9nszUKMBA7zdgGymGlVcCYc624X1wGeYQ9JqfvrH4ZlzO3o_VBHZH7xxCpfxfuaceV1cY2QPSvi', 'OnePlus ONEPLUS A6000', '2021-08-08 10:07:45', '2021-08-08 10:07:45'),
(43, 'c7AWqhJ7TcmEvHgKX2fiD5:APA91bHlywZT0qHA61BbTK2IJl6iVSYOCCXwtlOl22hfcx9PeQF4rPzqHFojZ8aZ1vWlpkxyQ4t82jLJp9U_dQkpt0JExR0JQo6ZhCSYFmtbQzTB3QsiF4tPiqSBVMQqqt33JGWkkZCl', 'Xiaomi Mi 9 Lite', '2021-08-08 11:41:28', '2021-08-08 11:41:28'),
(44, 'eW-ZhEP9RpSTxJkmPulBmV:APA91bFwtTyB1laUfoU9aX7o3pJ599EG-q06tN-5u4rrQIxERBo9L2mAAjFWQ85TMlDR-_2ZK3eAAPevfL7KSPwnnJRSeC0F-Gtu8671a2i3u0_JirRWi2QW_yU9qo7XzrsX6ctkJyAM', 'Xiaomi Mi 9 Lite', '2021-08-08 14:49:57', '2021-08-08 14:49:57'),
(45, 'c7AWqhJ7TcmEvHgKX2fiD5:APA91bHlywZT0qHA61BbTK2IJl6iVSYOCCXwtlOl22hfcx9PeQF4rPzqHFojZ8aZ1vWlpkxyQ4t82jLJp9U_dQkpt0JExR0JQo6ZhCSYFmtbQzTB3QsiF4tPiqSBVMQqqt33JGWkkZCl', 'Xiaomi Mi 9 Lite', '2021-08-09 04:45:35', '2021-08-09 04:45:35'),
(46, 'c7AWqhJ7TcmEvHgKX2fiD5:APA91bGjB-p2tU8z4uNfgAYkuexqDnpLrL6MAUBuITiqYH6UvqeQ2ent0cDCMyosPL4ZpzeI_NQnItNPjPi5zltdiLb74iRl1vwG3GNphISRIH86_M7Jexyx9aKm0CyJ-MMVZlLKXyzY', 'Xiaomi Mi 9 Lite', '2021-08-09 04:46:32', '2021-08-09 04:46:32'),
(47, 'deITvCUpTCiYsn1xeZWZEt:APA91bHeUVMPxwYClowecG6EqbFRl9QW07d7ENEAb6a3A_ogUnKsEqdxUxPJj83JSaTtTRkQLlwQpTvBbQrH0lIwC3wwJrUX9nSy7wo5e-fNt9Eped0tZ10C3SBcutGdD1y5vuMjtNUa', 'Xiaomi Mi 9 Lite', '2021-08-09 12:47:05', '2021-08-09 12:47:05'),
(48, 'dvYy2_65Q4iZTSw1r05T5w:APA91bEWsP7cybwVoN1B5k9jlyzP914zFXJ05ktnrUQz9epgPPBS4i6Q_y5_cq4R2rQa8gROmCiSbx6_WUXOvhL80qpGh66mpWms_Fz0uJGFs98fUmN7TRwIIIKqk9phnGNihyL8gyQR', 'Xiaomi Mi 9 Lite', '2021-08-09 14:17:56', '2021-08-09 14:17:56'),
(49, 'eFU5JvA1SMeiRXfEomLXej:APA91bEIDJFPWESo9z5fPUDk5JY3lonA8rwfmwNcJOoYIBXYTnFUWuj9S2f9Axfj4FsUrai0iEb1heLualfr4zal8fCOm7OLwy1jhgMJGRCo6EMCDfLanun9E-B7ve1n-jSJXaS4p9Y_', 'OnePlus ONEPLUS A6000', '2021-08-10 06:34:13', '2021-08-10 06:34:13'),
(50, 'eiUFq-yQTqGcJadP5XQLtf:APA91bGXPXCyQBabTnzgBkpCuMt3Ihr7RKGE995gEiY0eha9j6L0y42qooUpq8nIMn5YLUZMjNojcFsAjOH3FAJKPToufCEVjqYJHuOdboopATRGJ3IhGjCwjBkvgzGsNCHxj6m1SQOm', 'Xiaomi Mi 9 Lite', '2021-08-10 06:36:55', '2021-08-10 06:36:55'),
(51, 'e_pXPKgqSMKcsSA0DMfgzg:APA91bFkcuf_24iXqIeGTVqIAcdpc0qirKI9mhM3ShD5usKBHFB5nnQrUu-9dTHZAObFlwKoCuZeFgLrTEoV8kU7uLCbaXf0ID28mCAQRzEYy48oBzy1pERkndM05KKQHy1If-5IyOrt', 'Xiaomi Mi 9 Lite', '2021-08-10 06:41:58', '2021-08-10 06:41:58'),
(52, 'eFU5JvA1SMeiRXfEomLXej:APA91bEIDJFPWESo9z5fPUDk5JY3lonA8rwfmwNcJOoYIBXYTnFUWuj9S2f9Axfj4FsUrai0iEb1heLualfr4zal8fCOm7OLwy1jhgMJGRCo6EMCDfLanun9E-B7ve1n-jSJXaS4p9Y_', 'OnePlus ONEPLUS A6000', '2021-08-10 06:48:22', '2021-08-10 06:48:22'),
(53, 'eFU5JvA1SMeiRXfEomLXej:APA91bHd3Xeot6Il-kuFK295QSPLC_mZ9K5CCxOm6m5qLt1QPgaD0wPMDnQuGlY5rrXRFTDQcMj6f1Ove_w8jyVArq3TtWqMZYlZeDHooNzVPoT-K80M9IKu4Ps617S_M962LqjeyEtv', 'OnePlus ONEPLUS A6000', '2021-08-10 06:48:26', '2021-08-10 06:48:26'),
(54, 'eFU5JvA1SMeiRXfEomLXej:APA91bHd3Xeot6Il-kuFK295QSPLC_mZ9K5CCxOm6m5qLt1QPgaD0wPMDnQuGlY5rrXRFTDQcMj6f1Ove_w8jyVArq3TtWqMZYlZeDHooNzVPoT-K80M9IKu4Ps617S_M962LqjeyEtv', 'OnePlus ONEPLUS A6000', '2021-08-10 06:48:26', '2021-08-10 06:48:26'),
(55, 'c8cYr20cTxKnc-lLt5XJTZ:APA91bFapge7mxXHdTZHwfOk5_2K8s2bJmdADmvxqgf1kSvtp5cq_dmOaEdZWUp5byolnq2HZDhjpjqSVlOHV6L3G0xKXulaoyLPucI2k554E1rPZdlUbxmAFXvDIyserhFjOPoyXaqh', 'Xiaomi Mi 9 Lite', '2021-08-10 07:38:17', '2021-08-10 07:38:17'),
(56, 'cXKZLyN8TiSkoIMQdEM08d:APA91bF-ijoscswbWioDssNY3QpX6-t0-RFf7de9QVvp-HUjW0mqMEqAF3LDSg0qqLvzu3ZbUyY2fWszolpamAKGyJfXw0rCQFwVbon6ONBD1bPD0BFdFX2YKllE5vme1j1voSlINk2t', 'Xiaomi Mi 9 Lite', '2021-08-10 11:30:59', '2021-08-10 11:30:59'),
(57, 'cZJnn8AeR2SmFdHcqh_ROh:APA91bGB8Bsc6NhUs6wXOXBkp_pYVG-MrMw1FOabsYMsUdQWFI4p2rxemJ1slscPZqk_smHcV1APA2jYLPtsY6UUE7JFywt2uzpiVp0G00avQ3c-BAbMsXMIJH1m4o9MKJYXxraEnDcV', 'Xiaomi Mi 9 Lite', '2021-08-10 14:23:40', '2021-08-10 14:23:40'),
(58, 'c4NcH5gcSxucS1Jpr4V-x5:APA91bEuXtz9xtFlfQPQbS0NCiOTgXcUhUPJajtJQbQ1qgbVviWdWo8cBu3GVxXUtxpza07s_dnw6Xb7Bwi5iWeVMwqcB9_Af4PP_creJMZS10kDL7AXTIdJpIyDF8oCcLI6wLXKXfIO', 'Xiaomi Mi 9 Lite', '2021-08-11 09:05:35', '2021-08-11 09:05:35'),
(59, 'dZ4GUpioTx25WfFaX4ogYk:APA91bFw1UNCW4UpCMoi-gJXXp9zHaXEjEAUMGXfYIjZBPk3_UUN8j2ukzaEJYbkFkThxy1lyfSGeA-Y9cmxb9EyztTLHxH2-s5lLhAUo85X3L-wDsUe3XHYn-qTASzoGNbfyucCAfMm', 'Xiaomi Mi 9 Lite', '2021-08-11 13:28:58', '2021-08-11 13:28:58'),
(60, 'dJQIl6GJRW-XTCc6wOkHLq:APA91bH-CGBqNTsxynriuFnByvc4WSKfxeYZlUwIK7WwZhki8-2O6XqCbKgoqRlFiYOrXhapy58BAF78YRyiPaNfBbpM4KS-HmL13ixPQ7m7c9QJ69S-I-WBsXxo6jTw4FOV8_2WS9-_', 'Xiaomi Mi 9 Lite', '2021-08-12 04:44:02', '2021-08-12 04:44:02'),
(61, 'eFU5JvA1SMeiRXfEomLXej:APA91bEi1MMfzXOv5vdjUpBbTFYysMreibbAP2SU0KNHzcdDRzGooCI8ycMdttMp6iLaRpidgExW0FPZvWNSrVDBiWh-yww5yGI3r2y-X-PTyhLJPjCkQONrMnfrArLIh8YVt1F3sLAD', 'OnePlus ONEPLUS A6000', '2021-08-12 18:35:07', '2021-08-12 18:35:07'),
(62, 'd3E2a7ykRHGy3SsiLCYuki:APA91bGdMUnOnL8YUTWVAkFBXE5YW1C-sWe1zP8oIunPRs01nnchuivyBpSSHf-uuDtWNxYEVlG7gcTUE4LGGu1--7lQo1B9ctoFu57ECMOSC-9uTe9Pwh_LszWNR-FeDCWZiE6rdfYe', 'OnePlus ONEPLUS A6000', '2021-08-15 05:58:53', '2021-08-15 05:58:53'),
(63, 'fOfo5wxbQgyrM1_WcZZx7U:APA91bHz-fHgP4yhxaC4bIy5aCcwS0AWQFpPx1_rGRV7kCPYo734gpz9uv8JsUUlErpckkp0XP_MJy2KJvjbY6kTUrdFsdfylp8q_igaIIFODcSoAfYU_g4cCnz7STDv-xAOieOHdOOU', 'Xiaomi Mi 9 Lite', '2021-08-15 13:48:25', '2021-08-15 13:48:25'),
(64, 'dEfEkvxtTf2x_WZRGbXj-e:APA91bEs4yFbicqDlP908kw1Q4CJPXB74_Uu1a1cXulkHfnZOPmtKFeXVDnRcVEuRbFk6Dy1FZjjVnIbebvpHXjV48-YdylxqxI_iNxeG6BdoELm8Og6hVPz84cBBp1TyX257qxOt6ZQ', 'Xiaomi Mi 9 Lite', '2021-08-17 09:42:15', '2021-08-17 09:42:15'),
(65, 'dPgWVrJORBGgI8XGQotajs:APA91bFPZ_G9GFV7kfepwU_j7lhHiu7uwidn0G9DJEIGHTzch6JH8aVooobeYb3Ge-mCd95l9wgw5aZ2kU4a9IsrYsZpaaEajJH7jLgRnxy63n1TeTKHzgqSXI1yLRzyZX3wb2iUQW-d', 'Xiaomi Mi 9 Lite', '2021-08-17 11:41:26', '2021-08-17 11:41:26'),
(66, 'ezU_l6vZSn6KStz9nkT-4x:APA91bHswLXF2idFj_BjOGfrFhXsPouHF9MrqEyvP626nmIOKixu9R0Gr1S1d2kfIzycM2qU7MqpuTgtaw3DlguQ_lbOF1FRDVsN_boiO4Necn6eBZrQp9WqqY2B_HPI9FaImZx7-dOT', 'OnePlus ONEPLUS A6000', '2021-08-17 12:03:11', '2021-08-17 12:03:11'),
(67, 'dXoaqpY6TrGEp-oYobu011:APA91bEI9gH2hgAfJYEFU2zojoBp8V2c9r6Gfu5A1cbc95VJMnC9I_Jg0MqEwEKfbebinkI3kVNw7TQLovGPPUikSgkJGmOzndhxvPE3p248z0SQdFXLjyGJNiK8OlknI-VZ8hYVn8vr', 'OnePlus ONEPLUS A6000', '2021-08-17 13:37:51', '2021-08-17 13:37:51'),
(68, 'dXoaqpY6TrGEp-oYobu011:APA91bEI9gH2hgAfJYEFU2zojoBp8V2c9r6Gfu5A1cbc95VJMnC9I_Jg0MqEwEKfbebinkI3kVNw7TQLovGPPUikSgkJGmOzndhxvPE3p248z0SQdFXLjyGJNiK8OlknI-VZ8hYVn8vr', 'OnePlus ONEPLUS A6000', '2021-08-17 17:28:32', '2021-08-17 17:28:32'),
(69, 'dXoaqpY6TrGEp-oYobu011:APA91bHAVTMTrZU1Ja6pWUf79lhYmmWMsgycREFFAz7oyEmikXTiIqCVW_BXbEOhXsjF_k7s63a6h-BEEIynCvk1qm78ufzcYGm5SBeKT5Nd8oPeYtE2lFwLMYDmuWnoELywB_1Qkx7e', 'OnePlus ONEPLUS A6000', '2021-08-17 17:29:57', '2021-08-17 17:29:57'),
(70, 'fyq-0cXsQNyQEUNCD1MHeB:APA91bETiOutS_W8HGS74qOr4Kck90rU2Sz2o7szXnN-DAH8-ZfiU1V4WvG2jUewxZ7vxmZMrhkLL75hJjhTouUGm9O0cWWAzXzyahkm7XuuVe8SsdX9MXc3018aObLi7wkBMUAnvrSI', 'OnePlus ONEPLUS A6000', '2021-08-17 17:34:18', '2021-08-17 17:34:18'),
(71, 'fyq-0cXsQNyQEUNCD1MHeB:APA91bFNWE7DLGPBDT3Iz9Pi8A9spSWPFEf6BJb0REG-kmlFxGiyNy48nS1Tr00tVohuX05qTFy6_E6WIbr85TBwLXYIDhTgEgW4UBbhauxxp81TvhxewQQxoeriQuI-oj5UFwda_w9g', 'OnePlus ONEPLUS A6000', '2021-08-21 13:33:07', '2021-08-21 13:33:07'),
(72, 'fxH4LmSeTHq1KRzLyWa4IF:APA91bGRkisqcrearECFnMLygXTbpgGUX0T_ug-rh8g-SqFspVCWYJobXbXkV3D5d-gSKZQduNdPgkUXDcYWx7Dplr2KQu975JAw-rWiZA4MhaVtLS5qw29OOP2W7qhceFsjAB0VbMh1', 'Xiaomi Mi 9 Lite', '2021-08-26 13:53:32', '2021-08-26 13:53:32'),
(73, 'fyq-0cXsQNyQEUNCD1MHeB:APA91bFNWE7DLGPBDT3Iz9Pi8A9spSWPFEf6BJb0REG-kmlFxGiyNy48nS1Tr00tVohuX05qTFy6_E6WIbr85TBwLXYIDhTgEgW4UBbhauxxp81TvhxewQQxoeriQuI-oj5UFwda_w9g', 'OnePlus ONEPLUS A6000', '2021-08-30 11:12:19', '2021-08-30 11:12:19'),
(74, 'fyq-0cXsQNyQEUNCD1MHeB:APA91bEFYPQe9yVcHmFv4uopMsDBg4-p3eFk_7tIlZqj6ZCsvY3Skyl9aSFlvSOBG9c7hntAtrz7aCXcSSsxQltLVQgW60sfMlj8BatlLMhxpSQcQQtpyrN2wfP_BaMCqCA9q4QYbPvF', 'OnePlus ONEPLUS A6000', '2021-08-30 18:22:50', '2021-08-30 18:22:50'),
(75, 'c1j2N7qTSlOquGc0962SEC:APA91bGjpqDs7Ztk6TFgWxRy3Pvmwuw_RsTjqQdaIH_pjoJhSXlrXlofHHZWyYOXw5WXF4mGJWsscqjRuGRUFkFNghTqGkExiqZR4ajEYwz8xbjYoqdNaxGSEk2pKp0UsnKakA1pYD5S', 'Xiaomi Mi 9 Lite', '2021-09-08 12:39:20', '2021-09-08 12:39:20'),
(76, 'f-BgroO1Q5OcvCDC0jg6Gm:APA91bEmEKaK5uvldjTcCc_KapihMB96a5DjL_7SUzQ4VOm7rru1weWT-rczrmYraUvrNhk-w82qtQ-Sk9nXKRnE-PNvdgVC4rllZuglcLnXGsNVOyYA5AaJtIj6XaEzOgORqfuVlAY7', 'Redmi Note 9 Pro', '2022-10-03 12:00:22', '2022-10-03 12:00:22'),
(77, 'cGGOqFa9TTqBUk9omRZcMy:APA91bFIxO63dcktmwcT9igRykQpVfqyTvu3HkYHUS8tV6zXIJ8xv69pEAdnGeprgO0g59rKIwgfkOCh6esHZWFXkj2_E90CU5fKTEW9U4ASv-zp7ymkBxyj-JgagTRvaVHMwl1oiHvy', 'Redmi Note 9 Pro', '2022-10-03 12:04:34', '2022-10-03 12:04:34'),
(78, 'd1NAHixcQHqCLCpVxDxjNV:APA91bGhK6uCJW3pEioQLW9OX1uub_a7UUkzGdap4duSvSYVoWl1KVl4SC8bYyzCPQHY_rHfxTQINXLPPV71yM6FHgBYnGcCBBDAzcsRQlYIe_6Qc2jo82Nv_QhpNboB31EJQuMIYiHA', 'Redmi Note 9 Pro', '2022-10-03 12:42:46', '2022-10-03 12:42:46'),
(79, 'em8hVb4oRYK93dsvaB-MbR:APA91bFPKYkeSkEhJ2adEYVP9TY10tfHyiTatn2uyg1mG2lgNJuJ8HWI-ex1YpK-nlz50sx3lPgUcwX7-Vu9EUrfRwUxDDbzrqE_msmRUGP_zn7A6YIdrchiH2ZpS6ylu9clnMsYFLvZ', 'Redmi Note 9 Pro', '2022-10-08 06:45:27', '2022-10-08 06:45:27'),
(80, 'c6QVTLowQxClhk9366OKMF:APA91bFOtdYWMNc1QlsePHasV3JeD4Q5GaV5bkVjn5RKGjf3h-OXG1uQnxbtTGtthkR_ff0gSXELF8OX7vvrDfulXOXu4AtdhCV0UnpuzW4IA9CLqkd45wpAJriEcWWVspWH5NdVE4Pd', 'Redmi Note 9 Pro', '2022-10-08 07:00:17', '2022-10-08 07:00:17'),
(81, 'cqKbNbrxSsCUWhj5BHRbAs:APA91bFd5KCepfe_OqzvcTnvAgk0GN9DyTwBIOCw4SyOCIYtJyEIlWig0IVwMU3Em2j35Yb95zB4ju7tbgQtnSBS3OFuPLh0BOH0VgKVGqC3i5oXFzD-x6Klm8qG-Ozt6vAhNX9skE5L', 'Redmi Note 9 Pro', '2022-10-08 07:05:52', '2022-10-08 07:05:52'),
(82, 'f42cT9XGQ7GhNz0GlphXqT:APA91bFgmoCE9ktgpTXQt1GrkGJWUghgM_CnA-nst8r90tg2OZlbMJJy-krtUOjBVqoAfg58gk981IyC91BpWJ_PWts3IV-BF0fqDVQNQKnemtenUKjsLbE5mClK_ct3pRcMrU2Bs-vr', 'Redmi Note 9 Pro', '2022-10-10 06:10:18', '2022-10-10 06:10:18'),
(83, 'fd0avGpvTDapCeC6jpXSoJ:APA91bGt3c74jLXhs3JHp8lqq5LERQi0ptiYPfYL47ki_eIZt9GgMdNcYnCzd_uUVNGdcHIu-iFE3BV5DrEhVidC5At0yZU7jGbf916noP8iFmnLO6ITEao7l5XyML-g2QkXfh04UIdQ', 'Redmi Note 9 Pro', '2022-10-15 07:17:44', '2022-10-15 07:17:44'),
(84, 'dJrWa3C1Sb2eCueNUH9E6w:APA91bGakDiChdQMQ1_nSlB6y5UJT77QPGLSVlw9OomriVM-k4lirIsIx91e8WG_eusQBvQye-CBX-rXdK0cUcXYm-aR5ojWt7bvql_cA1qcKOB1j8bSvZKYns9GczKxSzPrXIfIADrs', 'Redmi Note 9 Pro', '2022-10-15 07:23:13', '2022-10-15 07:23:13'),
(85, 'daZww5TBRWqIGsIUaRMxp5:APA91bHWB-C2qn9kGB9lMg01QeVeB7r0Nzidc1bKLPjGRcmL2Lv5ooDCb4x_7NgwludTEpRffnTWJ9edTGsJg96ojv-RBceFXxrp9jNbsVvp6Zd5w-ZvC7xHHCanrJekDeFLRoPDVDpo', 'Redmi Note 9 Pro', '2022-10-15 07:27:53', '2022-10-15 07:27:53'),
(86, 'dO9ZFNjHR1O7sPqMVc-Xpo:APA91bEsL7wmZBaWDpgz2GXrMCIEJ--5uZ20Dkj0dBFFy5ZCemnvotZsWz8ylEOabUxOg8NDatka4y3_eCtuYNKNcP-f_IyvAZhae9S7vgli4ydKBh8bkJE4ie2XFb_rLhMCEP3Zdh23', 'Redmi Note 9 Pro', '2022-10-19 07:34:20', '2022-10-19 07:34:20'),
(87, 'eEIDYOGaTke6howIB3h0CP:APA91bHJRkr5wOWsT0zl25-U4NtfIUOGg2Y1zgV7NVhUcJ9d_Um72dXUpjuFYWhVhfb0EQz_D5e4ldqisMSOnfgNxcuzZuVgxYkD8NVwor5fTUSUQXSbuB00228qVe9kyv5Pa-v-tcEk', 'Redmi Note 9 Pro', '2022-10-19 11:02:03', '2022-10-19 11:02:03'),
(88, 'caOQpFmoSj-aEPhvAKWEqx:APA91bHKFgAzvMPCOAUOaB_6mmleb6JZg-_TWXJ7Wf9kwVH429hoDC35haDl-nF1FU6RvxAdgfiTWQ-s_55lNZ0SazgZZxGdkXK3q4ARBRnQvae5VRR29aFmQieouVFJsFU3u_FvrdvD', 'Redmi Note 9 Pro', '2022-10-19 12:08:24', '2022-10-19 12:08:24');

-- --------------------------------------------------------

--
-- Table structure for table `token_types`
--

CREATE TABLE `token_types` (
  `id` bigint UNSIGNED NOT NULL,
  `token_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_type_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `token_types`
--

INSERT INTO `token_types` (`id`, `token_name`, `token_type_value`, `created_at`, `updated_at`) VALUES
(1, 'json', '0', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sliders_cat_id_foreign` (`cat_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sliders_cat_id_foreign` (`cat_id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token_types`
--
ALTER TABLE `token_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `token_types`
--
ALTER TABLE `token_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `category_foregin_id_key` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sliders`
--
ALTER TABLE `sliders`
  ADD CONSTRAINT `sliders_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
