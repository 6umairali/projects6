-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 05, 2026 at 01:41 PM
-- Server version: 10.11.19-MariaDB-ubu2404
-- PHP Version: 8.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dahi_mail`
--

-- --------------------------------------------------------

--
-- Table structure for table `ab_test_variants`
--

CREATE TABLE `ab_test_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `variant` varchar(1) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body_html` text DEFAULT NULL,
  `percentage` tinyint(3) UNSIGNED NOT NULL DEFAULT 50,
  `is_winner` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'email_accounts', 'Email account created', 'App\\Models\\EmailAccount', 'created', 1, 'App\\Models\\User', 3, '{\"attributes\":{\"email\":\"uape@dahimail.com\",\"status\":\"connected\",\"provider\":\"imap\",\"display_name\":\"nb\"},\"workspace_id\":4}', NULL, '2026-09-27 12:05:02', '2026-09-27 12:05:02'),
(2, 'contacts', 'Contact created', 'App\\Models\\Contact', 'created', 1, 'App\\Models\\User', 3, '{\"attributes\":{\"first_name\":\"Umair\",\"last_name\":\"Ali\",\"email\":\"umairkheshgi@gmail.com\",\"phone\":null,\"company\":null,\"status\":\"active\"},\"workspace_id\":4}', NULL, '2026-09-27 12:07:16', '2026-09-27 12:07:16'),
(3, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 1, 'App\\Models\\User', 3, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"Accfc\"},\"workspace_id\":4}', NULL, '2026-09-27 12:07:16', '2026-09-27 12:07:16'),
(4, 'messages', 'Message created', 'App\\Models\\Message', 'created', 1, 'App\\Models\\User', 3, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"Accfc\",\"from_email\":\"umairkheshgi@gmail.com\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":4}', NULL, '2026-09-27 12:07:16', '2026-09-27 12:07:16'),
(5, 'messages', 'Message created', 'App\\Models\\Message', 'created', 2, 'App\\Models\\User', 3, '{\"attributes\":{\"direction\":\"outbound\",\"subject\":\"Re: Accfc\",\"from_email\":\"uape@dahimail.com\",\"delivery_status\":\"queued\",\"type\":\"message\"},\"workspace_id\":4}', NULL, '2026-09-27 12:07:31', '2026-09-27 12:07:31'),
(6, 'messages', 'Message created', 'App\\Models\\Message', 'created', 3, 'App\\Models\\User', 3, '{\"attributes\":{\"direction\":\"outbound\",\"subject\":\"Re: Accfc\",\"from_email\":\"uape@dahimail.com\",\"delivery_status\":\"queued\",\"type\":\"message\"},\"workspace_id\":4}', NULL, '2026-09-27 12:13:48', '2026-09-27 12:13:48'),
(7, 'messages', 'Message updated', 'App\\Models\\Message', 'updated', 3, 'App\\Models\\User', 3, '{\"attributes\":{\"delivery_status\":\"failed\"},\"old\":{\"delivery_status\":\"queued\"},\"workspace_id\":4}', NULL, '2026-09-27 12:13:59', '2026-09-27 12:13:59'),
(8, 'messages', 'Message created', 'App\\Models\\Message', 'created', 4, 'App\\Models\\User', 3, '{\"attributes\":{\"direction\":\"outbound\",\"subject\":\"Re: Accfc\",\"from_email\":\"uape@dahimail.com\",\"delivery_status\":\"queued\",\"type\":\"message\"},\"workspace_id\":4}', NULL, '2026-09-27 12:14:42', '2026-09-27 12:14:42'),
(9, 'messages', 'Message updated', 'App\\Models\\Message', 'updated', 4, 'App\\Models\\User', 3, '{\"attributes\":{\"delivery_status\":\"failed\"},\"old\":{\"delivery_status\":\"queued\"},\"workspace_id\":4}', NULL, '2026-09-27 12:14:53', '2026-09-27 12:14:53'),
(10, 'messages', 'Message created', 'App\\Models\\Message', 'created', 5, 'App\\Models\\User', 3, '{\"attributes\":{\"direction\":\"outbound\",\"subject\":\"Re: Accfc\",\"from_email\":\"uape@dahimail.com\",\"delivery_status\":\"queued\",\"type\":\"message\"},\"workspace_id\":4}', NULL, '2026-09-27 12:35:52', '2026-09-27 12:35:52'),
(11, 'messages', 'Message updated', 'App\\Models\\Message', 'updated', 5, 'App\\Models\\User', 3, '{\"attributes\":{\"delivery_status\":\"sent\"},\"old\":{\"delivery_status\":\"queued\"},\"workspace_id\":4}', NULL, '2026-09-27 12:36:03', '2026-09-27 12:36:03'),
(12, 'email_accounts', 'Email account created', 'App\\Models\\EmailAccount', 'created', 2, NULL, NULL, '{\"attributes\":{\"email\":\"ali1@dahimail.com\",\"status\":\"connected\",\"provider\":\"imap\",\"display_name\":\"ali\"},\"workspace_id\":5}', NULL, '2026-09-27 12:55:19', '2026-09-27 12:55:19'),
(13, 'email_accounts', 'Email account created', 'App\\Models\\EmailAccount', 'created', 3, NULL, NULL, '{\"attributes\":{\"email\":\"khan@dahimail.com\",\"status\":\"connected\",\"provider\":\"imap\",\"display_name\":\"khan\"},\"workspace_id\":6}', NULL, '2026-09-27 13:09:17', '2026-09-27 13:09:17'),
(14, 'contacts', 'Contact created', 'App\\Models\\Contact', 'created', 2, 'App\\Models\\User', 6, '{\"attributes\":{\"first_name\":\"Umair\",\"last_name\":\"Ali\",\"email\":\"umairkheshgi@gmail.com\",\"phone\":null,\"company\":null,\"status\":\"active\"},\"workspace_id\":6}', NULL, '2026-09-27 13:13:35', '2026-09-27 13:13:35'),
(15, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 2, 'App\\Models\\User', 6, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"Qdududud\"},\"workspace_id\":6}', NULL, '2026-09-27 13:13:35', '2026-09-27 13:13:35'),
(16, 'messages', 'Message created', 'App\\Models\\Message', 'created', 6, 'App\\Models\\User', 6, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"Qdududud\",\"from_email\":\"umairkheshgi@gmail.com\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":6}', NULL, '2026-09-27 13:13:35', '2026-09-27 13:13:35'),
(17, 'messages', 'Message created', 'App\\Models\\Message', 'created', 7, 'App\\Models\\User', 6, '{\"attributes\":{\"direction\":\"outbound\",\"subject\":\"Re: Qdududud\",\"from_email\":\"khan@dahimail.com\",\"delivery_status\":\"queued\",\"type\":\"message\"},\"workspace_id\":6}', NULL, '2026-09-27 13:17:56', '2026-09-27 13:17:56'),
(18, 'messages', 'Message updated', 'App\\Models\\Message', 'updated', 7, 'App\\Models\\User', 6, '{\"attributes\":{\"delivery_status\":\"sent\"},\"old\":{\"delivery_status\":\"queued\"},\"workspace_id\":6}', NULL, '2026-09-27 13:18:08', '2026-09-27 13:18:08'),
(19, 'email_accounts', 'Email account created', 'App\\Models\\EmailAccount', 'created', 4, NULL, NULL, '{\"attributes\":{\"email\":\"abc@dahimail.com\",\"status\":\"connected\",\"provider\":\"imap\",\"display_name\":\"abc\"},\"workspace_id\":7}', NULL, '2026-09-27 13:22:34', '2026-09-27 13:22:34'),
(20, 'messages', 'Message created', 'App\\Models\\Message', 'created', 8, 'App\\Models\\User', 3, '{\"attributes\":{\"direction\":\"outbound\",\"subject\":\"Re: Accfc\",\"from_email\":\"uape@dahimail.com\",\"delivery_status\":\"queued\",\"type\":\"message\"},\"workspace_id\":4}', NULL, '2026-09-27 14:17:54', '2026-09-27 14:17:54'),
(21, 'messages', 'Message updated', 'App\\Models\\Message', 'updated', 8, 'App\\Models\\User', 3, '{\"attributes\":{\"delivery_status\":\"sent\"},\"old\":{\"delivery_status\":\"queued\"},\"workspace_id\":4}', NULL, '2026-09-27 14:18:05', '2026-09-27 14:18:05'),
(22, 'messages', 'Message created', 'App\\Models\\Message', 'created', 9, 'App\\Models\\User', 3, '{\"attributes\":{\"direction\":\"outbound\",\"subject\":\"Re: Accfc\",\"from_email\":\"uape@dahimail.com\",\"delivery_status\":\"queued\",\"type\":\"message\"},\"workspace_id\":4}', NULL, '2026-09-28 04:41:28', '2026-09-28 04:41:28'),
(23, 'messages', 'Message updated', 'App\\Models\\Message', 'updated', 9, 'App\\Models\\User', 3, '{\"attributes\":{\"delivery_status\":\"sent\"},\"old\":{\"delivery_status\":\"queued\"},\"workspace_id\":4}', NULL, '2026-09-28 04:41:39', '2026-09-28 04:41:39'),
(24, 'email_accounts', 'Email account created', 'App\\Models\\EmailAccount', 'created', 5, NULL, NULL, '{\"attributes\":{\"email\":\"aaa@dahimail.com\",\"status\":\"connected\",\"provider\":\"imap\",\"display_name\":\"aaa\"},\"workspace_id\":8}', NULL, '2026-09-28 05:15:10', '2026-09-28 05:15:10'),
(25, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 3, 'App\\Models\\User', 3, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":3,\"is_starred\":false,\"subject\":\"scsdcsdcscscdsc\"},\"workspace_id\":4}', NULL, '2026-09-28 11:48:34', '2026-09-28 11:48:34'),
(26, 'messages', 'Message created', 'App\\Models\\Message', 'created', 10, 'App\\Models\\User', 3, '{\"attributes\":{\"direction\":\"outbound\",\"subject\":\"scsdcsdcscscdsc\",\"from_email\":\"uape@dahimail.com\",\"delivery_status\":\"queued\",\"type\":\"message\"},\"workspace_id\":4}', NULL, '2026-09-28 11:48:34', '2026-09-28 11:48:34'),
(27, 'messages', 'Message updated', 'App\\Models\\Message', 'updated', 10, 'App\\Models\\User', 3, '{\"attributes\":{\"delivery_status\":\"sent\"},\"old\":{\"delivery_status\":\"queued\"},\"workspace_id\":4}', NULL, '2026-09-28 11:48:45', '2026-09-28 11:48:45'),
(28, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 4, 'App\\Models\\User', 3, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":3,\"is_starred\":false,\"subject\":\"cascasca\"},\"workspace_id\":4}', NULL, '2026-09-28 12:09:25', '2026-09-28 12:09:25'),
(29, 'messages', 'Message created', 'App\\Models\\Message', 'created', 11, 'App\\Models\\User', 3, '{\"attributes\":{\"direction\":\"outbound\",\"subject\":\"cascasca\",\"from_email\":\"uape@dahimail.com\",\"delivery_status\":\"queued\",\"type\":\"message\"},\"workspace_id\":4}', NULL, '2026-09-28 12:09:25', '2026-09-28 12:09:25'),
(30, 'messages', 'Message updated', 'App\\Models\\Message', 'updated', 11, 'App\\Models\\User', 3, '{\"attributes\":{\"delivery_status\":\"sent\"},\"old\":{\"delivery_status\":\"queued\"},\"workspace_id\":4}', NULL, '2026-09-28 12:09:36', '2026-09-28 12:09:36'),
(31, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 5, 'App\\Models\\User', 3, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":3,\"is_starred\":false,\"subject\":\"ascacacc\"},\"workspace_id\":4}', NULL, '2026-09-28 12:12:19', '2026-09-28 12:12:19'),
(32, 'messages', 'Message created', 'App\\Models\\Message', 'created', 12, 'App\\Models\\User', 3, '{\"attributes\":{\"direction\":\"outbound\",\"subject\":\"ascacacc\",\"from_email\":\"uape@dahimail.com\",\"delivery_status\":\"queued\",\"type\":\"message\"},\"workspace_id\":4}', NULL, '2026-09-28 12:12:19', '2026-09-28 12:12:19'),
(33, 'messages', 'Message updated', 'App\\Models\\Message', 'updated', 12, 'App\\Models\\User', 3, '{\"attributes\":{\"delivery_status\":\"sent\"},\"old\":{\"delivery_status\":\"queued\"},\"workspace_id\":4}', NULL, '2026-09-28 12:12:30', '2026-09-28 12:12:30'),
(34, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 6, 'App\\Models\\User', 3, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":3,\"is_starred\":false,\"subject\":\"aaaaa\"},\"workspace_id\":4}', NULL, '2026-09-28 12:18:56', '2026-09-28 12:18:56'),
(35, 'messages', 'Message created', 'App\\Models\\Message', 'created', 13, 'App\\Models\\User', 3, '{\"attributes\":{\"direction\":\"outbound\",\"subject\":\"aaaaa\",\"from_email\":\"uape@dahimail.com\",\"delivery_status\":\"queued\",\"type\":\"message\"},\"workspace_id\":4}', NULL, '2026-09-28 12:18:56', '2026-09-28 12:18:56'),
(36, 'messages', 'Message updated', 'App\\Models\\Message', 'updated', 13, 'App\\Models\\User', 3, '{\"attributes\":{\"delivery_status\":\"sent\"},\"old\":{\"delivery_status\":\"queued\"},\"workspace_id\":4}', NULL, '2026-09-28 12:19:07', '2026-09-28 12:19:07'),
(37, 'email_accounts', 'Email account created', 'App\\Models\\EmailAccount', 'created', 6, NULL, NULL, '{\"attributes\":{\"email\":\"shabinafbr@dahimail.com\",\"status\":\"connected\",\"provider\":\"imap\",\"display_name\":\"Shabina Amin\"},\"workspace_id\":9}', NULL, '2026-09-29 04:46:43', '2026-09-29 04:46:43'),
(38, 'contacts', 'Contact created', 'App\\Models\\Contact', 'created', 3, 'App\\Models\\User', 9, '{\"attributes\":{\"first_name\":\"Dahimail\",\"last_name\":null,\"email\":\"noreply@dahimail.com\",\"phone\":null,\"company\":null,\"status\":\"active\"},\"workspace_id\":9}', NULL, '2026-09-29 04:49:08', '2026-09-29 04:49:08'),
(39, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 7, 'App\\Models\\User', 9, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"Welcome to Dahimail!\"},\"workspace_id\":9}', NULL, '2026-09-29 04:49:08', '2026-09-29 04:49:08'),
(40, 'messages', 'Message created', 'App\\Models\\Message', 'created', 14, 'App\\Models\\User', 9, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"Welcome to Dahimail!\",\"from_email\":\"noreply@dahimail.com\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":9}', NULL, '2026-09-29 04:49:08', '2026-09-29 04:49:08'),
(41, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 8, 'App\\Models\\User', 9, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"Verify Email Address\"},\"workspace_id\":9}', NULL, '2026-09-29 04:49:08', '2026-09-29 04:49:08'),
(42, 'messages', 'Message created', 'App\\Models\\Message', 'created', 15, 'App\\Models\\User', 9, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"Verify Email Address\",\"from_email\":\"noreply@dahimail.com\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":9}', NULL, '2026-09-29 04:49:08', '2026-09-29 04:49:08'),
(43, 'contacts', 'Contact created', 'App\\Models\\Contact', 'created', 4, 'App\\Models\\User', 9, '{\"attributes\":{\"first_name\":\"noreply@fbr.gov.pk\",\"last_name\":null,\"email\":\"noreply@fbr.gov.pk\",\"phone\":null,\"company\":null,\"status\":\"active\"},\"workspace_id\":9}', NULL, '2026-09-29 04:54:03', '2026-09-29 04:54:03'),
(44, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 9, 'App\\Models\\User', 9, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"(No Subject)\"},\"workspace_id\":9}', NULL, '2026-09-29 04:54:03', '2026-09-29 04:54:03'),
(45, 'messages', 'Message created', 'App\\Models\\Message', 'created', 16, 'App\\Models\\User', 9, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"(No Subject)\",\"from_email\":\"noreply@fbr.gov.pk\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":9}', NULL, '2026-09-29 04:54:03', '2026-09-29 04:54:03'),
(48, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 12, 'App\\Models\\User', 3, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":3,\"is_starred\":false,\"subject\":\"sjdjddu\"},\"workspace_id\":4}', NULL, '2026-09-29 14:55:43', '2026-09-29 14:55:43'),
(49, 'messages', 'Message created', 'App\\Models\\Message', 'created', 17, 'App\\Models\\User', 3, '{\"attributes\":{\"direction\":\"outbound\",\"subject\":\"sjdjddu\",\"from_email\":\"uape@dahimail.com\",\"delivery_status\":\"queued\",\"type\":\"message\"},\"workspace_id\":4}', NULL, '2026-09-29 14:55:43', '2026-09-29 14:55:43'),
(50, 'messages', 'Message created', 'App\\Models\\Message', 'created', 18, 'App\\Models\\User', 3, '{\"attributes\":{\"direction\":\"outbound\",\"subject\":\"Re: sjdjddu\",\"from_email\":\"uape@dahimail.com\",\"delivery_status\":\"queued\",\"type\":\"message\"},\"workspace_id\":4}', NULL, '2026-09-29 14:56:40', '2026-09-29 14:56:40'),
(51, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 13, 'App\\Models\\User', 3, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":3,\"is_starred\":false,\"subject\":\"ghfd\"},\"workspace_id\":4}', NULL, '2026-09-29 16:04:05', '2026-09-29 16:04:05'),
(52, 'messages', 'Message created', 'App\\Models\\Message', 'created', 19, 'App\\Models\\User', 3, '{\"attributes\":{\"direction\":\"outbound\",\"subject\":\"ghfd\",\"from_email\":\"uape@dahimail.com\",\"delivery_status\":\"queued\",\"type\":\"message\"},\"workspace_id\":4}', NULL, '2026-09-29 16:04:05', '2026-09-29 16:04:05'),
(53, 'messages', 'Message updated', 'App\\Models\\Message', 'updated', 19, 'App\\Models\\User', 3, '{\"attributes\":{\"delivery_status\":\"sent\"},\"old\":{\"delivery_status\":\"queued\"},\"workspace_id\":4}', NULL, '2026-09-29 16:04:05', '2026-09-29 16:04:05'),
(54, 'messages', 'Message updated', 'App\\Models\\Message', 'updated', 19, 'App\\Models\\User', 3, '{\"attributes\":{\"delivery_status\":\"sent\"},\"old\":{\"delivery_status\":\"queued\"},\"workspace_id\":4}', NULL, '2026-09-29 16:04:05', '2026-09-29 16:04:05'),
(55, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 14, 'App\\Models\\User', 3, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"acasc\"},\"workspace_id\":4}', NULL, '2026-09-29 16:04:12', '2026-09-29 16:04:12'),
(56, 'messages', 'Message created', 'App\\Models\\Message', 'created', 20, 'App\\Models\\User', 3, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"acasc\",\"from_email\":\"umairkheshgi@gmail.com\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":4}', NULL, '2026-09-29 16:04:12', '2026-09-29 16:04:12'),
(57, 'messages', 'Message created', 'App\\Models\\Message', 'created', 21, 'App\\Models\\User', 3, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"Re: ghfd\",\"from_email\":\"umairkheshgi@gmail.com\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":4}', NULL, '2026-09-30 03:46:12', '2026-09-30 03:46:12'),
(58, 'email_accounts', 'Email account created', 'App\\Models\\EmailAccount', 'created', 7, NULL, NULL, '{\"attributes\":{\"email\":\"uape1@dahimail.com\",\"status\":\"connected\",\"provider\":\"imap\",\"display_name\":\"Umair Ali\"},\"workspace_id\":10}', NULL, '2026-09-30 03:53:32', '2026-09-30 03:53:32'),
(59, 'email_accounts', 'Email account created', 'App\\Models\\EmailAccount', 'created', 8, NULL, NULL, '{\"attributes\":{\"email\":\"qaqa@dahimail.com\",\"status\":\"connected\",\"provider\":\"imap\",\"display_name\":\"Qaqa\"},\"workspace_id\":11}', NULL, '2026-09-30 04:18:58', '2026-09-30 04:18:58'),
(60, 'contacts', 'Contact created', 'App\\Models\\Contact', 'created', 5, 'App\\Models\\User', 11, '{\"attributes\":{\"first_name\":\"Dahimail\",\"last_name\":null,\"email\":\"noreply@dahimail.com\",\"phone\":null,\"company\":null,\"status\":\"active\"},\"workspace_id\":11}', NULL, '2026-09-30 04:19:14', '2026-09-30 04:19:14'),
(61, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 15, 'App\\Models\\User', 11, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"Welcome to Dahimail!\"},\"workspace_id\":11}', NULL, '2026-09-30 04:19:14', '2026-09-30 04:19:14'),
(62, 'messages', 'Message created', 'App\\Models\\Message', 'created', 22, 'App\\Models\\User', 11, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"Welcome to Dahimail!\",\"from_email\":\"noreply@dahimail.com\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":11}', NULL, '2026-09-30 04:19:14', '2026-09-30 04:19:14'),
(63, 'contacts', 'Contact created', 'App\\Models\\Contact', 'created', 6, 'App\\Models\\User', 11, '{\"attributes\":{\"first_name\":\"umairkheshgi\",\"last_name\":null,\"email\":\"umairkheshgi@gmail.com\",\"phone\":null,\"company\":null,\"status\":\"active\"},\"workspace_id\":11}', NULL, '2026-09-30 04:19:49', '2026-09-30 04:19:49'),
(64, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 16, 'App\\Models\\User', 11, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":11,\"is_starred\":false,\"subject\":\"sjsjfjfj\"},\"workspace_id\":11}', NULL, '2026-09-30 04:19:49', '2026-09-30 04:19:49'),
(65, 'messages', 'Message created', 'App\\Models\\Message', 'created', 23, 'App\\Models\\User', 11, '{\"attributes\":{\"direction\":\"outbound\",\"subject\":\"sjsjfjfj\",\"from_email\":\"qaqa@dahimail.com\",\"delivery_status\":\"queued\",\"type\":\"message\"},\"workspace_id\":11}', NULL, '2026-09-30 04:19:49', '2026-09-30 04:19:49'),
(66, 'messages', 'Message updated', 'App\\Models\\Message', 'updated', 23, 'App\\Models\\User', 11, '{\"attributes\":{\"delivery_status\":\"sent\"},\"old\":{\"delivery_status\":\"queued\"},\"workspace_id\":11}', NULL, '2026-09-30 04:19:49', '2026-09-30 04:19:49'),
(67, 'messages', 'Message updated', 'App\\Models\\Message', 'updated', 23, 'App\\Models\\User', 11, '{\"attributes\":{\"delivery_status\":\"sent\"},\"old\":{\"delivery_status\":\"queued\"},\"workspace_id\":11}', NULL, '2026-09-30 04:19:49', '2026-09-30 04:19:49'),
(68, 'email_accounts', 'Email account created', 'App\\Models\\EmailAccount', 'created', 9, NULL, NULL, '{\"attributes\":{\"email\":\"zubairfbr@dahimail.com\",\"status\":\"connected\",\"provider\":\"imap\",\"display_name\":\"Zubair Bin Shame\"},\"workspace_id\":12}', NULL, '2026-09-30 11:08:48', '2026-09-30 11:08:48'),
(69, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 17, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"Welcome to Dahimail!\"},\"workspace_id\":12}', NULL, '2026-09-30 11:14:36', '2026-09-30 11:14:36'),
(70, 'messages', 'Message created', 'App\\Models\\Message', 'created', 24, 'App\\Models\\User', 12, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"Welcome to Dahimail!\",\"from_email\":\"noreply@dahimail.com\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":12}', NULL, '2026-09-30 11:14:36', '2026-09-30 11:14:36'),
(71, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 18, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"(No Subject)\"},\"workspace_id\":12}', NULL, '2026-09-30 11:48:11', '2026-09-30 11:48:11'),
(72, 'messages', 'Message created', 'App\\Models\\Message', 'created', 25, 'App\\Models\\User', 12, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"(No Subject)\",\"from_email\":\"noreply@fbr.gov.pk\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":12}', NULL, '2026-09-30 11:48:11', '2026-09-30 11:48:11'),
(73, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 19, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"(No Subject)\"},\"workspace_id\":12}', NULL, '2026-09-30 12:04:16', '2026-09-30 12:04:16'),
(74, 'messages', 'Message created', 'App\\Models\\Message', 'created', 26, 'App\\Models\\User', 12, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"(No Subject)\",\"from_email\":\"noreply@fbr.gov.pk\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":12}', NULL, '2026-09-30 12:04:16', '2026-09-30 12:04:16'),
(75, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 20, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"(No Subject)\"},\"workspace_id\":12}', NULL, '2026-09-30 12:06:16', '2026-09-30 12:06:16'),
(76, 'messages', 'Message created', 'App\\Models\\Message', 'created', 27, 'App\\Models\\User', 12, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"(No Subject)\",\"from_email\":\"noreply@fbr.gov.pk\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":12}', NULL, '2026-09-30 12:06:16', '2026-09-30 12:06:16'),
(77, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 21, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"181 (Order to grant \\/ refuse registration on application)\"},\"workspace_id\":12}', NULL, '2026-09-30 12:18:20', '2026-09-30 12:18:20'),
(78, 'messages', 'Message created', 'App\\Models\\Message', 'created', 28, 'App\\Models\\User', 12, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"181 (Order to grant \\/ refuse registration on application)\",\"from_email\":\"noreply@fbr.gov.pk\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":12}', NULL, '2026-09-30 12:18:20', '2026-09-30 12:18:20'),
(79, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 22, 'App\\Models\\User', 12, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"181 (Order to grant \\/ refuse registration on application)\"},\"workspace_id\":12}', NULL, '2026-09-30 12:18:20', '2026-09-30 12:18:20'),
(80, 'messages', 'Message created', 'App\\Models\\Message', 'created', 29, 'App\\Models\\User', 12, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"181 (Order to grant \\/ refuse registration on application)\",\"from_email\":\"noreply@fbr.gov.pk\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":12}', NULL, '2026-09-30 12:18:20', '2026-09-30 12:18:20'),
(81, 'email_accounts', 'Email account created', 'App\\Models\\EmailAccount', 'created', 10, NULL, NULL, '{\"attributes\":{\"email\":\"nawazfbr@dahimail.com\",\"status\":\"connected\",\"provider\":\"imap\",\"display_name\":\"MUHAMMAD NAWAZ\"},\"workspace_id\":13}', NULL, '2026-10-01 04:40:05', '2026-10-01 04:40:05'),
(82, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 23, 'App\\Models\\User', 13, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"Welcome to Dahimail!\"},\"workspace_id\":13}', NULL, '2026-10-01 04:41:46', '2026-10-01 04:41:46'),
(83, 'messages', 'Message created', 'App\\Models\\Message', 'created', 30, 'App\\Models\\User', 13, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"Welcome to Dahimail!\",\"from_email\":\"noreply@dahimail.com\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":13}', NULL, '2026-10-01 04:41:47', '2026-10-01 04:41:47'),
(84, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 24, 'App\\Models\\User', 13, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"Verify Email Address\"},\"workspace_id\":13}', NULL, '2026-10-01 04:41:47', '2026-10-01 04:41:47'),
(85, 'messages', 'Message created', 'App\\Models\\Message', 'created', 31, 'App\\Models\\User', 13, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"Verify Email Address\",\"from_email\":\"noreply@dahimail.com\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":13}', NULL, '2026-10-01 04:41:47', '2026-10-01 04:41:47'),
(86, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 25, 'App\\Models\\User', 13, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"(No Subject)\"},\"workspace_id\":13}', NULL, '2026-10-01 04:41:58', '2026-10-01 04:41:58'),
(87, 'messages', 'Message created', 'App\\Models\\Message', 'created', 32, 'App\\Models\\User', 13, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"(No Subject)\",\"from_email\":\"noreply@fbr.gov.pk\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":13}', NULL, '2026-10-01 04:41:58', '2026-10-01 04:41:58'),
(88, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 26, 'App\\Models\\User', 3, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":3,\"is_starred\":false,\"subject\":\"eududud\"},\"workspace_id\":4}', NULL, '2026-10-01 13:57:31', '2026-10-01 13:57:31'),
(89, 'messages', 'Message created', 'App\\Models\\Message', 'created', 33, 'App\\Models\\User', 3, '{\"attributes\":{\"direction\":\"outbound\",\"subject\":\"eududud\",\"from_email\":\"uape@dahimail.com\",\"delivery_status\":\"queued\",\"type\":\"message\"},\"workspace_id\":4}', NULL, '2026-10-01 13:57:31', '2026-10-01 13:57:31'),
(90, 'messages', 'Message updated', 'App\\Models\\Message', 'updated', 33, 'App\\Models\\User', 3, '{\"attributes\":{\"delivery_status\":\"sent\"},\"old\":{\"delivery_status\":\"queued\"},\"workspace_id\":4}', NULL, '2026-10-01 13:57:32', '2026-10-01 13:57:32'),
(91, 'messages', 'Message updated', 'App\\Models\\Message', 'updated', 33, 'App\\Models\\User', 3, '{\"attributes\":{\"delivery_status\":\"sent\"},\"old\":{\"delivery_status\":\"queued\"},\"workspace_id\":4}', NULL, '2026-10-01 13:57:32', '2026-10-01 13:57:32'),
(92, 'email_accounts', 'Email account created', 'App\\Models\\EmailAccount', 'created', 11, NULL, NULL, '{\"attributes\":{\"email\":\"umairali@dahimail.com\",\"status\":\"connected\",\"provider\":\"imap\",\"display_name\":\"Umair Ali\"},\"workspace_id\":14}', NULL, '2026-10-02 12:05:25', '2026-10-02 12:05:25'),
(93, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 27, 'App\\Models\\User', 14, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"Welcome to Dahimail!\"},\"workspace_id\":14}', NULL, '2026-10-02 12:05:29', '2026-10-02 12:05:29'),
(94, 'messages', 'Message created', 'App\\Models\\Message', 'created', 34, 'App\\Models\\User', 14, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"Welcome to Dahimail!\",\"from_email\":\"noreply@dahimail.com\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":14}', NULL, '2026-10-02 12:05:29', '2026-10-02 12:05:29'),
(95, 'email_accounts', 'Email account created', 'App\\Models\\EmailAccount', 'created', 12, NULL, NULL, '{\"attributes\":{\"email\":\"zulfiqar@dahimail.com\",\"status\":\"connected\",\"provider\":\"imap\",\"display_name\":\"Sardar Zulfiqar Ali Shah\"},\"workspace_id\":15}', NULL, '2026-10-02 12:25:51', '2026-10-02 12:25:51'),
(96, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 28, 'App\\Models\\User', 15, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"Welcome to Dahimail!\"},\"workspace_id\":15}', NULL, '2026-10-02 12:27:31', '2026-10-02 12:27:31'),
(97, 'messages', 'Message created', 'App\\Models\\Message', 'created', 35, 'App\\Models\\User', 15, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"Welcome to Dahimail!\",\"from_email\":\"noreply@dahimail.com\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":15}', NULL, '2026-10-02 12:27:31', '2026-10-02 12:27:31'),
(98, 'contacts', 'Contact created', 'App\\Models\\Contact', 'created', 7, 'App\\Models\\User', 14, '{\"attributes\":{\"first_name\":\"zulfiqar\",\"last_name\":null,\"email\":\"zulfiqar@dahimail.com\",\"phone\":null,\"company\":null,\"status\":\"active\"},\"workspace_id\":14}', NULL, '2026-10-02 12:38:13', '2026-10-02 12:38:13'),
(99, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 29, 'App\\Models\\User', 14, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":14,\"is_starred\":false,\"subject\":\"mail\"},\"workspace_id\":14}', NULL, '2026-10-02 12:38:13', '2026-10-02 12:38:13'),
(100, 'messages', 'Message created', 'App\\Models\\Message', 'created', 36, 'App\\Models\\User', 14, '{\"attributes\":{\"direction\":\"outbound\",\"subject\":\"mail\",\"from_email\":\"umairali@dahimail.com\",\"delivery_status\":\"queued\",\"type\":\"message\"},\"workspace_id\":14}', NULL, '2026-10-02 12:38:13', '2026-10-02 12:38:13'),
(101, 'messages', 'Message updated', 'App\\Models\\Message', 'updated', 36, 'App\\Models\\User', 14, '{\"attributes\":{\"delivery_status\":\"sent\"},\"old\":{\"delivery_status\":\"queued\"},\"workspace_id\":14}', NULL, '2026-10-02 12:38:13', '2026-10-02 12:38:13'),
(102, 'messages', 'Message updated', 'App\\Models\\Message', 'updated', 36, 'App\\Models\\User', 14, '{\"attributes\":{\"delivery_status\":\"sent\"},\"old\":{\"delivery_status\":\"queued\"},\"workspace_id\":14}', NULL, '2026-10-02 12:38:13', '2026-10-02 12:38:13'),
(103, 'contacts', 'Contact created', 'App\\Models\\Contact', 'created', 8, 'App\\Models\\User', 15, '{\"attributes\":{\"first_name\":\"Umair\",\"last_name\":\"Ali\",\"email\":\"umairali@dahimail.com\",\"phone\":null,\"company\":null,\"status\":\"active\"},\"workspace_id\":15}', NULL, '2026-10-02 12:38:16', '2026-10-02 12:38:16'),
(104, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 30, 'App\\Models\\User', 15, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"mail\"},\"workspace_id\":15}', NULL, '2026-10-02 12:38:16', '2026-10-02 12:38:16'),
(105, 'messages', 'Message created', 'App\\Models\\Message', 'created', 37, 'App\\Models\\User', 15, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"mail\",\"from_email\":\"umairali@dahimail.com\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":15}', NULL, '2026-10-02 12:38:16', '2026-10-02 12:38:16'),
(106, 'messages', 'Message created', 'App\\Models\\Message', 'created', 38, 'App\\Models\\User', 15, '{\"attributes\":{\"direction\":\"outbound\",\"subject\":\"Re: mail\",\"from_email\":\"zulfiqar@dahimail.com\",\"delivery_status\":\"queued\",\"type\":\"message\"},\"workspace_id\":15}', NULL, '2026-10-02 12:38:55', '2026-10-02 12:38:55'),
(107, 'messages', 'Message updated', 'App\\Models\\Message', 'updated', 38, 'App\\Models\\User', 15, '{\"attributes\":{\"delivery_status\":\"sent\"},\"old\":{\"delivery_status\":\"queued\"},\"workspace_id\":15}', NULL, '2026-10-02 12:38:55', '2026-10-02 12:38:55'),
(108, 'messages', 'Message updated', 'App\\Models\\Message', 'updated', 38, 'App\\Models\\User', 15, '{\"attributes\":{\"delivery_status\":\"sent\"},\"old\":{\"delivery_status\":\"queued\"},\"workspace_id\":15}', NULL, '2026-10-02 12:38:55', '2026-10-02 12:38:55'),
(109, 'messages', 'Message created', 'App\\Models\\Message', 'created', 39, 'App\\Models\\User', 14, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"Re: mail\",\"from_email\":\"zulfiqar@dahimail.com\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":14}', NULL, '2026-10-02 12:39:03', '2026-10-02 12:39:03'),
(110, 'email_accounts', 'Email account created', 'App\\Models\\EmailAccount', 'created', 13, NULL, NULL, '{\"attributes\":{\"email\":\"zulfiqar1@dahimail.com\",\"status\":\"connected\",\"provider\":\"imap\",\"display_name\":\"Zulfiqar\"},\"workspace_id\":16}', NULL, '2026-10-02 12:53:00', '2026-10-02 12:53:00'),
(111, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 31, 'App\\Models\\User', 16, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"Welcome to Dahimail!\"},\"workspace_id\":16}', NULL, '2026-10-02 12:53:07', '2026-10-02 12:53:07'),
(112, 'messages', 'Message created', 'App\\Models\\Message', 'created', 40, 'App\\Models\\User', 16, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"Welcome to Dahimail!\",\"from_email\":\"noreply@dahimail.com\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":16}', NULL, '2026-10-02 12:53:07', '2026-10-02 12:53:07'),
(113, 'email_accounts', 'Email account created', 'App\\Models\\EmailAccount', 'created', 14, NULL, NULL, '{\"attributes\":{\"email\":\"rukhsanafbr@dahimail.com\",\"status\":\"connected\",\"provider\":\"imap\",\"display_name\":\"Rukhsana\"},\"workspace_id\":17}', NULL, '2026-10-05 08:05:34', '2026-10-05 08:05:34'),
(114, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 32, 'App\\Models\\User', 17, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"Welcome to Dahimail!\"},\"workspace_id\":17}', NULL, '2026-10-05 08:12:09', '2026-10-05 08:12:09'),
(115, 'messages', 'Message created', 'App\\Models\\Message', 'created', 41, 'App\\Models\\User', 17, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"Welcome to Dahimail!\",\"from_email\":\"noreply@dahimail.com\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":17}', NULL, '2026-10-05 08:12:09', '2026-10-05 08:12:09'),
(116, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 33, 'App\\Models\\User', 17, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"Verify Email Address\"},\"workspace_id\":17}', NULL, '2026-10-05 08:12:09', '2026-10-05 08:12:09'),
(117, 'messages', 'Message created', 'App\\Models\\Message', 'created', 42, 'App\\Models\\User', 17, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"Verify Email Address\",\"from_email\":\"noreply@dahimail.com\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":17}', NULL, '2026-10-05 08:12:09', '2026-10-05 08:12:09'),
(118, 'contacts', 'Contact created', 'App\\Models\\Contact', 'created', 9, 'App\\Models\\User', 17, '{\"attributes\":{\"first_name\":\"Shah\",\"last_name\":\"Fahad\",\"email\":\"fahadkheshgi1@gmail.com\",\"phone\":null,\"company\":null,\"status\":\"active\"},\"workspace_id\":17}', NULL, '2026-10-05 08:12:20', '2026-10-05 08:12:20'),
(119, 'conversations', 'Conversation created', 'App\\Models\\Conversation', 'created', 34, 'App\\Models\\User', 17, '{\"attributes\":{\"status\":\"open\",\"priority\":\"normal\",\"assigned_to\":null,\"is_starred\":false,\"subject\":\"F\"},\"workspace_id\":17}', NULL, '2026-10-05 08:12:20', '2026-10-05 08:12:20'),
(120, 'messages', 'Message created', 'App\\Models\\Message', 'created', 43, 'App\\Models\\User', 17, '{\"attributes\":{\"direction\":\"inbound\",\"subject\":\"F\",\"from_email\":\"fahadkheshgi1@gmail.com\",\"delivery_status\":\"delivered\",\"type\":\"message\"},\"workspace_id\":17}', NULL, '2026-10-05 08:12:20', '2026-10-05 08:12:20');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `two_factor_secret` varchar(255) DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `ip_whitelist` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`ip_whitelist`)),
  `role` enum('super_admin','admin','support') NOT NULL DEFAULT 'admin',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_impersonations`
--

CREATE TABLE `admin_impersonations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(100) NOT NULL,
  `expires_at` timestamp NOT NULL,
  `ended_at` timestamp NULL DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ai_channel_configs`
--

CREATE TABLE `ai_channel_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `channel` enum('email','whatsapp','sms','live_chat','telegram') NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `personality_preset` varchar(32) NOT NULL DEFAULT 'friendly',
  `custom_prompt` text DEFAULT NULL,
  `additional_instructions` text DEFAULT NULL,
  `send_mode` enum('autonomous','approval','suggestions') NOT NULL DEFAULT 'approval',
  `confidence_threshold` tinyint(3) UNSIGNED NOT NULL DEFAULT 75,
  `max_reply_length` enum('short','medium','long','very_long') NOT NULL DEFAULT 'medium',
  `temperature` decimal(3,2) DEFAULT NULL,
  `skip_filters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`skip_filters`)),
  `first_message_only` tinyint(1) NOT NULL DEFAULT 0,
  `max_replies_per_conversation` tinyint(3) UNSIGNED NOT NULL DEFAULT 3,
  `skip_own_threads` tinyint(1) NOT NULL DEFAULT 1,
  `reply_delay` enum('none','30s','1m','2m','5m','random') NOT NULL DEFAULT 'none',
  `escalation_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `escalate_below_confidence` tinyint(3) UNSIGNED NOT NULL DEFAULT 50,
  `escalation_assignee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `escalation_tag` varchar(64) NOT NULL DEFAULT 'needs_human',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ai_configs`
--

CREATE TABLE `ai_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `provider` varchar(255) NOT NULL DEFAULT 'openai',
  `model` varchar(255) NOT NULL DEFAULT 'gpt-4o',
  `use_own_key` tinyint(1) NOT NULL DEFAULT 0,
  `api_key` text DEFAULT NULL,
  `custom_endpoint` varchar(255) DEFAULT NULL,
  `temperature` decimal(3,2) NOT NULL DEFAULT 0.30,
  `max_reply_length` varchar(20) NOT NULL DEFAULT 'medium',
  `top_p` decimal(3,2) NOT NULL DEFAULT 0.90,
  `frequency_penalty` decimal(3,2) NOT NULL DEFAULT 0.30,
  `presence_penalty` decimal(3,2) NOT NULL DEFAULT 0.10,
  `personality_preset` varchar(255) NOT NULL DEFAULT 'friendly',
  `custom_prompt` text DEFAULT NULL,
  `additional_instructions` text DEFAULT NULL,
  `reply_language` varchar(20) NOT NULL DEFAULT 'auto',
  `multi_language_greeting` tinyint(1) NOT NULL DEFAULT 0,
  `include_greeting` varchar(20) NOT NULL DEFAULT 'ai_decides',
  `include_signoff` varchar(20) NOT NULL DEFAULT 'always',
  `signoff_text` varchar(255) NOT NULL DEFAULT 'Best regards,',
  `include_sender_name` tinyint(1) NOT NULL DEFAULT 1,
  `include_company_name` tinyint(1) NOT NULL DEFAULT 0,
  `use_html_formatting` tinyint(1) NOT NULL DEFAULT 1,
  `use_bullet_points` tinyint(1) NOT NULL DEFAULT 1,
  `auto_reply_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `monthly_cost_limit` decimal(8,2) NOT NULL DEFAULT 10.00,
  `business_hours_only` tinyint(1) NOT NULL DEFAULT 0,
  `outside_hours_message` text DEFAULT NULL,
  `confidence_threshold` tinyint(3) UNSIGNED NOT NULL DEFAULT 75,
  `escalation_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `escalate_below_confidence` tinyint(3) UNSIGNED NOT NULL DEFAULT 50,
  `escalation_assignee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `escalation_tag` varchar(64) NOT NULL DEFAULT 'needs_human',
  `send_mode` enum('autonomous','approval','suggestions') NOT NULL DEFAULT 'approval',
  `reply_delay` varchar(20) NOT NULL DEFAULT 'none',
  `first_message_only` tinyint(1) NOT NULL DEFAULT 0,
  `max_ai_replies_per_conversation` tinyint(3) UNSIGNED NOT NULL DEFAULT 3,
  `skip_own_threads` tinyint(1) NOT NULL DEFAULT 1,
  `auto_action_hours` int(10) UNSIGNED DEFAULT NULL,
  `auto_action_type` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ai_configs`
--

INSERT INTO `ai_configs` (`id`, `workspace_id`, `provider`, `model`, `use_own_key`, `api_key`, `custom_endpoint`, `temperature`, `max_reply_length`, `top_p`, `frequency_penalty`, `presence_penalty`, `personality_preset`, `custom_prompt`, `additional_instructions`, `reply_language`, `multi_language_greeting`, `include_greeting`, `include_signoff`, `signoff_text`, `include_sender_name`, `include_company_name`, `use_html_formatting`, `use_bullet_points`, `auto_reply_enabled`, `monthly_cost_limit`, `business_hours_only`, `outside_hours_message`, `confidence_threshold`, `escalation_enabled`, `escalate_below_confidence`, `escalation_assignee_id`, `escalation_tag`, `send_mode`, `reply_delay`, `first_message_only`, `max_ai_replies_per_conversation`, `skip_own_threads`, `auto_action_hours`, `auto_action_type`, `created_at`, `updated_at`) VALUES
(1, 2, 'openai', 'gpt-4o', 0, NULL, NULL, 0.30, 'medium', 0.90, 0.30, 0.10, 'friendly', NULL, NULL, 'auto', 0, 'ai_decides', 'always', 'Best regards,', 1, 0, 1, 1, 1, 10.00, 1, NULL, 75, 0, 50, NULL, 'needs_human', 'approval', '0', 0, 3, 1, NULL, NULL, '2026-09-27 08:44:56', '2026-09-27 08:44:56'),
(2, 3, 'openai', 'gpt-4o', 0, NULL, NULL, 0.30, 'medium', 0.90, 0.30, 0.10, 'friendly', NULL, NULL, 'auto', 0, 'ai_decides', 'always', 'Best regards,', 1, 0, 1, 1, 1, 10.00, 1, NULL, 75, 0, 50, NULL, 'needs_human', 'approval', '0', 0, 3, 1, NULL, NULL, '2026-09-27 08:45:36', '2026-09-27 08:45:36'),
(3, 4, 'openai', 'gpt-4o', 0, NULL, NULL, 0.30, 'medium', 0.90, 0.30, 0.10, 'friendly', NULL, NULL, 'auto', 0, 'ai_decides', 'always', 'Best regards,', 1, 0, 1, 1, 1, 10.00, 1, NULL, 75, 0, 50, NULL, 'needs_human', 'approval', '0', 0, 3, 1, NULL, NULL, '2026-09-27 12:05:14', '2026-09-27 12:05:14');

-- --------------------------------------------------------

--
-- Table structure for table `ai_exclusions`
--

CREATE TABLE `ai_exclusions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('email','domain','keyword') NOT NULL,
  `value` varchar(255) NOT NULL,
  `match_type` varchar(20) NOT NULL DEFAULT 'contains',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ai_exclusion_rules`
--

CREATE TABLE `ai_exclusion_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `rule_key` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`config`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ai_usage_logs`
--

CREATE TABLE `ai_usage_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `provider` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `type` enum('reply','sentiment','embedding','playground','classification') NOT NULL DEFAULT 'reply',
  `tokens_in` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tokens_out` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cost` decimal(8,5) NOT NULL DEFAULT 0.00000,
  `response_time_ms` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message_id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `original_filename` varchar(255) NOT NULL,
  `mime_type` varchar(255) NOT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `storage_path` varchar(255) NOT NULL,
  `thumbnail_path` varchar(255) DEFAULT NULL,
  `is_inline` tinyint(1) NOT NULL DEFAULT 0,
  `content_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `auditable_type` varchar(255) DEFAULT NULL,
  `auditable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(255) NOT NULL,
  `actor_type` varchar(255) DEFAULT NULL,
  `actor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `actor_name` varchar(255) DEFAULT NULL,
  `old_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_values`)),
  `new_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_values`)),
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `auditable_type`, `auditable_id`, `event`, `actor_type`, `actor_id`, `actor_name`, `old_values`, `new_values`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Payment', 1, 'payment_approved', 'admin', 1, 'Umair Ali', NULL, '{\"subscription_activated\":true,\"workspace_id\":4,\"amount\":\"1.00\"}', '39.60.73.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-09-28 11:47:49', '2026-09-28 11:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `auto_reply_rules`
--

CREATE TABLE `auto_reply_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `keywords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`keywords`)),
  `match_type` enum('any','all','exact') NOT NULL DEFAULT 'any',
  `reply_body` text NOT NULL,
  `reply_subject` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `channel` enum('all','email','whatsapp','sms','chat') NOT NULL DEFAULT 'all',
  `first_message_only` tinyint(1) NOT NULL DEFAULT 1,
  `priority` int(11) NOT NULL DEFAULT 0,
  `usage_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blocked_ips`
--

CREATE TABLE `blocked_ips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `blocked_until` timestamp NULL DEFAULT NULL,
  `blocked_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blocked_locations`
--

CREATE TABLE `blocked_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(5) DEFAULT NULL,
  `country_name` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('dahimail-cache-45daab0ec39a2611804c92fd8bd518fc', 'i:2;', 1791200189),
('dahimail-cache-45daab0ec39a2611804c92fd8bd518fc:timer', 'i:1791200189;', 1791200189),
('dahimail-cache-6a9239c2f7e4aec8b1dbc5e2aaa4d311', 'i:1;', 1791199976),
('dahimail-cache-6a9239c2f7e4aec8b1dbc5e2aaa4d311:timer', 'i:1791199976;', 1791199976),
('dahimail-cache-77de68daecd823babbb58edb1c8e14d7106e83bb', 'i:31;', 1791201320),
('dahimail-cache-77de68daecd823babbb58edb1c8e14d7106e83bb:timer', 'i:1791201320;', 1791201320),
('dahimail-cache-active_languages', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:10:{i:0;O:19:\"App\\Models\\Language\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"languages\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:11:{s:2:\"id\";i:1;s:4:\"name\";s:7:\"English\";s:4:\"code\";s:2:\"en\";s:11:\"native_name\";s:7:\"English\";s:9:\"direction\";s:3:\"ltr\";s:4:\"flag\";s:8:\"🇺🇸\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:1;s:10:\"sort_order\";i:1;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:11:\"\0*\0original\";a:11:{s:2:\"id\";i:1;s:4:\"name\";s:7:\"English\";s:4:\"code\";s:2:\"en\";s:11:\"native_name\";s:7:\"English\";s:9:\"direction\";s:3:\"ltr\";s:4:\"flag\";s:8:\"🇺🇸\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:1;s:10:\"sort_order\";i:1;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:9:\"is_active\";s:7:\"boolean\";s:10:\"is_default\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:8:{i:0;s:4:\"name\";i:1;s:4:\"code\";i:2;s:11:\"native_name\";i:3;s:9:\"direction\";i:4;s:4:\"flag\";i:5;s:9:\"is_active\";i:6;s:10:\"is_default\";i:7;s:10:\"sort_order\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}i:1;O:19:\"App\\Models\\Language\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"languages\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:11:{s:2:\"id\";i:2;s:4:\"name\";s:7:\"Spanish\";s:4:\"code\";s:2:\"es\";s:11:\"native_name\";s:8:\"Español\";s:9:\"direction\";s:3:\"ltr\";s:4:\"flag\";s:8:\"🇪🇸\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:0;s:10:\"sort_order\";i:2;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:11:\"\0*\0original\";a:11:{s:2:\"id\";i:2;s:4:\"name\";s:7:\"Spanish\";s:4:\"code\";s:2:\"es\";s:11:\"native_name\";s:8:\"Español\";s:9:\"direction\";s:3:\"ltr\";s:4:\"flag\";s:8:\"🇪🇸\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:0;s:10:\"sort_order\";i:2;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:9:\"is_active\";s:7:\"boolean\";s:10:\"is_default\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:8:{i:0;s:4:\"name\";i:1;s:4:\"code\";i:2;s:11:\"native_name\";i:3;s:9:\"direction\";i:4;s:4:\"flag\";i:5;s:9:\"is_active\";i:6;s:10:\"is_default\";i:7;s:10:\"sort_order\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}i:2;O:19:\"App\\Models\\Language\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"languages\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:11:{s:2:\"id\";i:3;s:4:\"name\";s:6:\"French\";s:4:\"code\";s:2:\"fr\";s:11:\"native_name\";s:9:\"Français\";s:9:\"direction\";s:3:\"ltr\";s:4:\"flag\";s:8:\"🇫🇷\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:0;s:10:\"sort_order\";i:3;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:11:\"\0*\0original\";a:11:{s:2:\"id\";i:3;s:4:\"name\";s:6:\"French\";s:4:\"code\";s:2:\"fr\";s:11:\"native_name\";s:9:\"Français\";s:9:\"direction\";s:3:\"ltr\";s:4:\"flag\";s:8:\"🇫🇷\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:0;s:10:\"sort_order\";i:3;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:9:\"is_active\";s:7:\"boolean\";s:10:\"is_default\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:8:{i:0;s:4:\"name\";i:1;s:4:\"code\";i:2;s:11:\"native_name\";i:3;s:9:\"direction\";i:4;s:4:\"flag\";i:5;s:9:\"is_active\";i:6;s:10:\"is_default\";i:7;s:10:\"sort_order\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}i:3;O:19:\"App\\Models\\Language\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"languages\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:11:{s:2:\"id\";i:4;s:4:\"name\";s:6:\"German\";s:4:\"code\";s:2:\"de\";s:11:\"native_name\";s:7:\"Deutsch\";s:9:\"direction\";s:3:\"ltr\";s:4:\"flag\";s:8:\"🇩🇪\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:0;s:10:\"sort_order\";i:4;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:11:\"\0*\0original\";a:11:{s:2:\"id\";i:4;s:4:\"name\";s:6:\"German\";s:4:\"code\";s:2:\"de\";s:11:\"native_name\";s:7:\"Deutsch\";s:9:\"direction\";s:3:\"ltr\";s:4:\"flag\";s:8:\"🇩🇪\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:0;s:10:\"sort_order\";i:4;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:9:\"is_active\";s:7:\"boolean\";s:10:\"is_default\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:8:{i:0;s:4:\"name\";i:1;s:4:\"code\";i:2;s:11:\"native_name\";i:3;s:9:\"direction\";i:4;s:4:\"flag\";i:5;s:9:\"is_active\";i:6;s:10:\"is_default\";i:7;s:10:\"sort_order\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}i:4;O:19:\"App\\Models\\Language\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"languages\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:11:{s:2:\"id\";i:5;s:4:\"name\";s:10:\"Portuguese\";s:4:\"code\";s:2:\"pt\";s:11:\"native_name\";s:10:\"Português\";s:9:\"direction\";s:3:\"ltr\";s:4:\"flag\";s:8:\"🇧🇷\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:0;s:10:\"sort_order\";i:5;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:11:\"\0*\0original\";a:11:{s:2:\"id\";i:5;s:4:\"name\";s:10:\"Portuguese\";s:4:\"code\";s:2:\"pt\";s:11:\"native_name\";s:10:\"Português\";s:9:\"direction\";s:3:\"ltr\";s:4:\"flag\";s:8:\"🇧🇷\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:0;s:10:\"sort_order\";i:5;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:9:\"is_active\";s:7:\"boolean\";s:10:\"is_default\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:8:{i:0;s:4:\"name\";i:1;s:4:\"code\";i:2;s:11:\"native_name\";i:3;s:9:\"direction\";i:4;s:4:\"flag\";i:5;s:9:\"is_active\";i:6;s:10:\"is_default\";i:7;s:10:\"sort_order\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}i:5;O:19:\"App\\Models\\Language\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"languages\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:11:{s:2:\"id\";i:6;s:4:\"name\";s:6:\"Arabic\";s:4:\"code\";s:2:\"ar\";s:11:\"native_name\";s:14:\"العربية\";s:9:\"direction\";s:3:\"rtl\";s:4:\"flag\";s:8:\"🇸🇦\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:0;s:10:\"sort_order\";i:6;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:11:\"\0*\0original\";a:11:{s:2:\"id\";i:6;s:4:\"name\";s:6:\"Arabic\";s:4:\"code\";s:2:\"ar\";s:11:\"native_name\";s:14:\"العربية\";s:9:\"direction\";s:3:\"rtl\";s:4:\"flag\";s:8:\"🇸🇦\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:0;s:10:\"sort_order\";i:6;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:9:\"is_active\";s:7:\"boolean\";s:10:\"is_default\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:8:{i:0;s:4:\"name\";i:1;s:4:\"code\";i:2;s:11:\"native_name\";i:3;s:9:\"direction\";i:4;s:4:\"flag\";i:5;s:9:\"is_active\";i:6;s:10:\"is_default\";i:7;s:10:\"sort_order\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}i:6;O:19:\"App\\Models\\Language\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"languages\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:11:{s:2:\"id\";i:7;s:4:\"name\";s:5:\"Hindi\";s:4:\"code\";s:2:\"hi\";s:11:\"native_name\";s:18:\"हिन्दी\";s:9:\"direction\";s:3:\"ltr\";s:4:\"flag\";s:8:\"🇮🇳\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:0;s:10:\"sort_order\";i:7;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:11:\"\0*\0original\";a:11:{s:2:\"id\";i:7;s:4:\"name\";s:5:\"Hindi\";s:4:\"code\";s:2:\"hi\";s:11:\"native_name\";s:18:\"हिन्दी\";s:9:\"direction\";s:3:\"ltr\";s:4:\"flag\";s:8:\"🇮🇳\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:0;s:10:\"sort_order\";i:7;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:9:\"is_active\";s:7:\"boolean\";s:10:\"is_default\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:8:{i:0;s:4:\"name\";i:1;s:4:\"code\";i:2;s:11:\"native_name\";i:3;s:9:\"direction\";i:4;s:4:\"flag\";i:5;s:9:\"is_active\";i:6;s:10:\"is_default\";i:7;s:10:\"sort_order\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}i:7;O:19:\"App\\Models\\Language\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"languages\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:11:{s:2:\"id\";i:11;s:4:\"name\";s:7:\"Turkish\";s:4:\"code\";s:2:\"tr\";s:11:\"native_name\";s:8:\"Türkçe\";s:9:\"direction\";s:3:\"ltr\";s:4:\"flag\";s:8:\"🇹🇷\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:0;s:10:\"sort_order\";i:11;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:11:\"\0*\0original\";a:11:{s:2:\"id\";i:11;s:4:\"name\";s:7:\"Turkish\";s:4:\"code\";s:2:\"tr\";s:11:\"native_name\";s:8:\"Türkçe\";s:9:\"direction\";s:3:\"ltr\";s:4:\"flag\";s:8:\"🇹🇷\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:0;s:10:\"sort_order\";i:11;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:9:\"is_active\";s:7:\"boolean\";s:10:\"is_default\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:8:{i:0;s:4:\"name\";i:1;s:4:\"code\";i:2;s:11:\"native_name\";i:3;s:9:\"direction\";i:4;s:4:\"flag\";i:5;s:9:\"is_active\";i:6;s:10:\"is_default\";i:7;s:10:\"sort_order\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}i:8;O:19:\"App\\Models\\Language\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"languages\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:11:{s:2:\"id\";i:13;s:4:\"name\";s:7:\"Italian\";s:4:\"code\";s:2:\"it\";s:11:\"native_name\";s:8:\"Italiano\";s:9:\"direction\";s:3:\"ltr\";s:4:\"flag\";s:8:\"🇮🇹\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:0;s:10:\"sort_order\";i:13;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:11:\"\0*\0original\";a:11:{s:2:\"id\";i:13;s:4:\"name\";s:7:\"Italian\";s:4:\"code\";s:2:\"it\";s:11:\"native_name\";s:8:\"Italiano\";s:9:\"direction\";s:3:\"ltr\";s:4:\"flag\";s:8:\"🇮🇹\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:0;s:10:\"sort_order\";i:13;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:9:\"is_active\";s:7:\"boolean\";s:10:\"is_default\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:8:{i:0;s:4:\"name\";i:1;s:4:\"code\";i:2;s:11:\"native_name\";i:3;s:9:\"direction\";i:4;s:4:\"flag\";i:5;s:9:\"is_active\";i:6;s:10:\"is_default\";i:7;s:10:\"sort_order\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}i:9;O:19:\"App\\Models\\Language\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"languages\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:11:{s:2:\"id\";i:15;s:4:\"name\";s:7:\"Bengali\";s:4:\"code\";s:2:\"bn\";s:11:\"native_name\";s:15:\"বাংলা\";s:9:\"direction\";s:3:\"ltr\";s:4:\"flag\";s:8:\"🇧🇩\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:0;s:10:\"sort_order\";i:15;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:11:\"\0*\0original\";a:11:{s:2:\"id\";i:15;s:4:\"name\";s:7:\"Bengali\";s:4:\"code\";s:2:\"bn\";s:11:\"native_name\";s:15:\"বাংলা\";s:9:\"direction\";s:3:\"ltr\";s:4:\"flag\";s:8:\"🇧🇩\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:0;s:10:\"sort_order\";i:15;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:9:\"is_active\";s:7:\"boolean\";s:10:\"is_default\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:8:{i:0;s:4:\"name\";i:1;s:4:\"code\";i:2;s:11:\"native_name\";i:3;s:9:\"direction\";i:4;s:4:\"flag\";i:5;s:9:\"is_active\";i:6;s:10:\"is_default\";i:7;s:10:\"sort_order\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1791211199),
('dahimail-cache-blocked_ip:103.102.159.192', 'b:0;', 1791201630),
('dahimail-cache-blocked_ip:103.102.159.193', 'b:0;', 1791201616),
('dahimail-cache-blocked_ip:103.102.159.194', 'b:0;', 1791201414),
('dahimail-cache-blocked_ip:146.70.194.222', 'b:0;', 1791205268),
('dahimail-cache-blocked_ip:169.58.63.131', 'b:0;', 1791207899),
('dahimail-cache-blocked_ip:39.47.50.103', 'b:0;', 1791204295),
('dahimail-cache-blocked_ip:43.157.174.69', 'b:0;', 1791206003),
('dahimail-cache-blocked_ip:43.165.198.144', 'b:0;', 1791205706),
('dahimail-cache-blocked_ip:49.51.183.15', 'b:0;', 1791202433),
('dahimail-cache-blocked_ip:49.51.233.95', 'b:0;', 1791202396),
('dahimail-cache-blocked_ip:72.1.138.168', 'b:0;', 1791207207),
('dahimail-cache-blocked_ip:94.154.43.180', 'b:0;', 1791200792),
('dahimail-cache-dashboard:checklist:4', 'a:6:{s:15:\"hasEmailAccount\";b:1;s:9:\"hasKbDocs\";b:0;s:14:\"hasSentAiReply\";b:0;s:11:\"hasAiConfig\";b:1;s:11:\"hasChannels\";b:0;s:14:\"hasTeamMembers\";b:0;}', 1791200251),
('dahimail-cache-dashboard:core-stats:4', 'a:4:{s:18:\"conversation_count\";i:9;s:8:\"avg_time\";s:6:\"0.0000\";s:16:\"ai_replies_count\";i:0;s:13:\"contact_count\";i:1;}', 1791199981),
('dahimail-cache-dc9b23fe347cba7bccd19bc4a0a5fd70', 'i:1;', 1791200009),
('dahimail-cache-dc9b23fe347cba7bccd19bc4a0a5fd70:timer', 'i:1791200009;', 1791200009),
('dahimail-cache-de226f3f5dc0c66a464effdc07ca6b1f', 'i:4;', 1791204116),
('dahimail-cache-de226f3f5dc0c66a464effdc07ca6b1f:timer', 'i:1791204116;', 1791204116),
('dahimail-cache-default_language', 'O:19:\"App\\Models\\Language\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"languages\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:11:{s:2:\"id\";i:1;s:4:\"name\";s:7:\"English\";s:4:\"code\";s:2:\"en\";s:11:\"native_name\";s:7:\"English\";s:9:\"direction\";s:3:\"ltr\";s:4:\"flag\";s:8:\"🇺🇸\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:1;s:10:\"sort_order\";i:1;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:11:\"\0*\0original\";a:11:{s:2:\"id\";i:1;s:4:\"name\";s:7:\"English\";s:4:\"code\";s:2:\"en\";s:11:\"native_name\";s:7:\"English\";s:9:\"direction\";s:3:\"ltr\";s:4:\"flag\";s:8:\"🇺🇸\";s:9:\"is_active\";i:1;s:10:\"is_default\";i:1;s:10:\"sort_order\";i:1;s:10:\"created_at\";s:19:\"2026-09-27 10:25:21\";s:10:\"updated_at\";s:19:\"2026-09-27 10:25:21\";}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:9:\"is_active\";s:7:\"boolean\";s:10:\"is_default\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:8:{i:0;s:4:\"name\";i:1;s:4:\"code\";i:2;s:11:\"native_name\";i:3;s:9:\"direction\";i:4;s:4:\"flag\";i:5;s:9:\"is_active\";i:6;s:10:\"is_default\";i:7;s:10:\"sort_order\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}', 1791209303),
('dahimail-cache-friend_candidates:14', 'a:0:{}', 1791203740),
('dahimail-cache-friend-call:14', 'i:1;', 1791203629),
('dahimail-cache-friend-call:14:timer', 'i:1791203629;', 1791203629),
('dahimail-cache-friend-call:3', 'i:2;', 1791203569),
('dahimail-cache-friend-call:3:timer', 'i:1791203569;', 1791203569),
('dahimail-cache-friend-sync:14', 'i:2;', 1791286529),
('dahimail-cache-friend-sync:14:timer', 'i:1791286529;', 1791286529),
('dahimail-cache-presence:14', 'i:1;', 1791204061),
('dahimail-cache-presence:3', 'i:1;', 1791201389),
('dahimail-cache-system_settings_all', 'a:60:{s:9:\"site_name\";s:8:\"Dahimail\";s:12:\"site_tagline\";s:35:\"AI-Powered Communication Automation\";s:16:\"site_description\";s:75:\"Dahimail is a next-generation AI-powered communication automation platform.\";s:16:\"default_language\";s:2:\"en\";s:8:\"timezone\";s:3:\"UTC\";s:16:\"default_currency\";s:3:\"USD\";s:13:\"support_email\";s:20:\"support@dahimail.com\";s:13:\"support_phone\";s:0:\"\";s:11:\"mail_driver\";s:4:\"smtp\";s:9:\"smtp_host\";s:15:\"mail.dahify.com\";s:9:\"smtp_port\";s:3:\"587\";s:13:\"smtp_username\";s:20:\"noreply@dahimail.com\";s:13:\"smtp_password\";s:228:\"eyJpdiI6IjRNbGlmV2lNbDJlYjA5U2lTOFoxckE9PSIsInZhbHVlIjoiQkVzY2RGVkJDd0F2MDN3WHRIaFJNdk80M0g1ZjVBMWdUK0xmUFlXQ2dLUT0iLCJtYWMiOiJmMWIwMWQ1NzdhNGFjMzU4MDcwMzVmNzU1ZjFlN2ZmYzc0NTEwMmFmODQ3YTlkZjgwNjQxNTM4NGJjMTg3NjY3IiwidGFnIjoiIn0=\";s:15:\"smtp_encryption\";s:3:\"tls\";s:17:\"smtp_from_address\";s:20:\"noreply@dahimail.com\";s:14:\"smtp_from_name\";s:8:\"Dahimail\";s:20:\"registration_enabled\";s:4:\"true\";s:20:\"social_login_enabled\";s:5:\"false\";s:26:\"require_email_verification\";s:4:\"true\";s:12:\"default_plan\";s:4:\"free\";s:10:\"trial_days\";s:2:\"14\";s:23:\"track_one_to_one_emails\";s:1:\"1\";s:7:\"favicon\";s:62:\"settings/branding/a4EsTX490KUer7Jclpzm8PK3WUsbMNmRO3FkHkux.png\";s:13:\"primary_color\";s:7:\"#4f46e5\";s:15:\"secondary_color\";s:7:\"#7c3aed\";s:12:\"accent_color\";s:7:\"#06b6d4\";s:18:\"phone_registration\";s:8:\"optional\";s:26:\"phone_verification_enabled\";s:1:\"1\";s:16:\"phone_verify_sms\";s:1:\"0\";s:21:\"phone_verify_whatsapp\";s:1:\"0\";s:19:\"whatsapp_otp_button\";s:1:\"0\";s:21:\"whatsapp_otp_template\";s:0:\"\";s:21:\"whatsapp_otp_language\";s:5:\"en_US\";s:26:\"phone_discovery_unverified\";s:1:\"1\";s:13:\"send_new_days\";s:1:\"7\";s:21:\"send_established_days\";s:2:\"30\";s:14:\"send_new_daily\";s:2:\"50\";s:22:\"send_established_daily\";s:3:\"150\";s:18:\"send_trusted_daily\";s:3:\"250\";s:11:\"send_hourly\";s:2:\"50\";s:11:\"send_weekly\";s:3:\"400\";s:11:\"send_yearly\";s:4:\"5000\";s:13:\"send_ip_daily\";s:3:\"150\";s:17:\"send_device_daily\";s:3:\"200\";s:22:\"friends_call_recording\";s:1:\"0\";s:8:\"rec_mode\";s:1:\"1\";s:20:\"friends_chat_enabled\";s:1:\"1\";s:21:\"friends_files_enabled\";s:1:\"1\";s:21:\"friends_calls_enabled\";s:1:\"1\";s:19:\"rec_consent_seconds\";s:2:\"30\";s:10:\"rec_max_mb\";s:3:\"100\";s:9:\"rec_cfg_1\";s:59:\"{\"button\":\"hidden\",\"icon\":true,\"banner\":true,\"chime\":false}\";s:9:\"rec_cfg_2\";s:55:\"{\"button\":\"all\",\"icon\":true,\"banner\":true,\"chime\":true}\";s:9:\"rec_cfg_3\";s:55:\"{\"button\":\"all\",\"icon\":true,\"banner\":true,\"chime\":true}\";s:9:\"rec_cfg_4\";s:56:\"{\"button\":\"host\",\"icon\":true,\"banner\":true,\"chime\":true}\";s:9:\"rec_cfg_5\";s:56:\"{\"button\":\"all\",\"icon\":true,\"banner\":true,\"chime\":false}\";s:19:\"friends_file_max_mb\";s:2:\"10\";s:16:\"friends_stun_url\";s:28:\"stun:stun.l.google.com:19302\";s:16:\"friends_turn_url\";s:0:\"\";s:17:\"friends_turn_user\";s:0:\"\";}', 1791207659),
('dahimail-cache-tzsync:1', 's:28:\"Asia/Karachi|103.102.159.193\";', 1791201732),
('dahimail-cache-tzsync:14', 's:25:\"Asia/Karachi|39.47.50.103\";', 1791205491),
('dahimail-cache-tzsync:17', 's:28:\"Asia/Karachi|103.102.159.193\";', 1791202083),
('dahimail-cache-tzsync:3', 's:28:\"Asia/Karachi|103.102.159.193\";', 1791201751),
('dahimail-cache-workspace:17:17', 'a:2:{s:9:\"workspace\";O:20:\"App\\Models\\Workspace\":34:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"workspaces\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:16:{s:2:\"id\";i:17;s:4:\"uuid\";s:36:\"bb9b0a8f-4fa8-4679-846a-deeff278dd42\";s:4:\"name\";s:20:\"Rukhsana\'s Workspace\";s:4:\"slug\";s:25:\"rukhsanas-workspace-dspnj\";s:9:\"logo_path\";N;s:8:\"industry\";N;s:9:\"team_size\";N;s:8:\"timezone\";s:3:\"UTC\";s:8:\"settings\";N;s:14:\"business_hours\";N;s:8:\"holidays\";N;s:20:\"onboarding_completed\";i:1;s:15:\"onboarding_step\";i:5;s:10:\"created_at\";s:19:\"2026-10-05 10:05:34\";s:10:\"updated_at\";s:19:\"2026-10-05 10:05:34\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:16:{s:2:\"id\";i:17;s:4:\"uuid\";s:36:\"bb9b0a8f-4fa8-4679-846a-deeff278dd42\";s:4:\"name\";s:20:\"Rukhsana\'s Workspace\";s:4:\"slug\";s:25:\"rukhsanas-workspace-dspnj\";s:9:\"logo_path\";N;s:8:\"industry\";N;s:9:\"team_size\";N;s:8:\"timezone\";s:3:\"UTC\";s:8:\"settings\";N;s:14:\"business_hours\";N;s:8:\"holidays\";N;s:20:\"onboarding_completed\";i:1;s:15:\"onboarding_step\";i:5;s:10:\"created_at\";s:19:\"2026-10-05 10:05:34\";s:10:\"updated_at\";s:19:\"2026-10-05 10:05:34\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:10:\"deleted_at\";s:8:\"datetime\";s:8:\"settings\";s:5:\"array\";s:14:\"business_hours\";s:5:\"array\";s:8:\"holidays\";s:5:\"array\";s:20:\"onboarding_completed\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:11:{i:0;s:4:\"name\";i:1;s:4:\"slug\";i:2;s:9:\"logo_path\";i:3;s:8:\"industry\";i:4;s:9:\"team_size\";i:5;s:8:\"timezone\";i:6;s:8:\"settings\";i:7;s:14:\"business_hours\";i:8;s:8:\"holidays\";i:9;s:20:\"onboarding_completed\";i:10;s:15:\"onboarding_step\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}s:4:\"role\";s:5:\"owner\";}', 1791200693),
('dahimail-cache-workspace:3:4', 'a:2:{s:9:\"workspace\";O:20:\"App\\Models\\Workspace\":34:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"workspaces\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:16:{s:2:\"id\";i:4;s:4:\"uuid\";s:36:\"0fd5b9b8-8e45-41a2-b2fa-e5109aa5fe73\";s:4:\"name\";s:14:\"nb\'s Workspace\";s:4:\"slug\";s:19:\"nbs-workspace-uyzl8\";s:9:\"logo_path\";N;s:8:\"industry\";s:5:\"other\";s:9:\"team_size\";s:1:\"1\";s:8:\"timezone\";s:3:\"UTC\";s:8:\"settings\";N;s:14:\"business_hours\";s:403:\"{\"monday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"tuesday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"wednesday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"thursday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"friday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"saturday\":{\"enabled\":false,\"start\":\"10:00\",\"end\":\"14:00\"},\"sunday\":{\"enabled\":false,\"start\":\"10:00\",\"end\":\"14:00\"}}\";s:8:\"holidays\";N;s:20:\"onboarding_completed\";i:1;s:15:\"onboarding_step\";i:5;s:10:\"created_at\";s:19:\"2026-09-27 14:05:02\";s:10:\"updated_at\";s:19:\"2026-09-27 14:05:55\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:16:{s:2:\"id\";i:4;s:4:\"uuid\";s:36:\"0fd5b9b8-8e45-41a2-b2fa-e5109aa5fe73\";s:4:\"name\";s:14:\"nb\'s Workspace\";s:4:\"slug\";s:19:\"nbs-workspace-uyzl8\";s:9:\"logo_path\";N;s:8:\"industry\";s:5:\"other\";s:9:\"team_size\";s:1:\"1\";s:8:\"timezone\";s:3:\"UTC\";s:8:\"settings\";N;s:14:\"business_hours\";s:403:\"{\"monday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"tuesday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"wednesday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"thursday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"friday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"saturday\":{\"enabled\":false,\"start\":\"10:00\",\"end\":\"14:00\"},\"sunday\":{\"enabled\":false,\"start\":\"10:00\",\"end\":\"14:00\"}}\";s:8:\"holidays\";N;s:20:\"onboarding_completed\";i:1;s:15:\"onboarding_step\";i:5;s:10:\"created_at\";s:19:\"2026-09-27 14:05:02\";s:10:\"updated_at\";s:19:\"2026-09-27 14:05:55\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:10:\"deleted_at\";s:8:\"datetime\";s:8:\"settings\";s:5:\"array\";s:14:\"business_hours\";s:5:\"array\";s:8:\"holidays\";s:5:\"array\";s:20:\"onboarding_completed\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:11:{i:0;s:4:\"name\";i:1;s:4:\"slug\";i:2;s:9:\"logo_path\";i:3;s:8:\"industry\";i:4;s:9:\"team_size\";i:5;s:8:\"timezone\";i:6;s:8:\"settings\";i:7;s:14:\"business_hours\";i:8;s:8:\"holidays\";i:9;s:20:\"onboarding_completed\";i:10;s:15:\"onboarding_step\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}s:4:\"role\";s:5:\"owner\";}', 1791201378),
('dahimail-cache-ws_role:14:14', 's:5:\"owner\";', 1791203701),
('dahimail-cache-ws_role:3:4', 's:5:\"owner\";', 1791199961);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `call_recordings`
--

CREATE TABLE `call_recordings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `call_id` bigint(20) UNSIGNED NOT NULL,
  `uploaded_by` bigint(20) UNSIGNED NOT NULL,
  `message_id` bigint(20) UNSIGNED DEFAULT NULL,
  `has_video` tinyint(1) NOT NULL DEFAULT 0,
  `duration` int(10) UNSIGNED DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_mime` varchar(120) DEFAULT NULL,
  `file_size` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `email_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `from_number` varchar(32) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('regular','ab_test','drip') NOT NULL DEFAULT 'regular',
  `channel` enum('email','sms') NOT NULL DEFAULT 'email',
  `status` enum('draft','scheduled','sending','sent','paused','canceled') NOT NULL DEFAULT 'draft',
  `subject` varchar(255) DEFAULT NULL,
  `body_html` mediumtext DEFAULT NULL,
  `body_text` text DEFAULT NULL,
  `body_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`body_json`)),
  `preview_text` varchar(255) DEFAULT NULL,
  `audience_type` varchar(20) DEFAULT NULL,
  `audience_id` bigint(20) UNSIGNED DEFAULT NULL,
  `audience_meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`audience_meta`)),
  `recipients_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `emails_per_minute` smallint(5) UNSIGNED NOT NULL DEFAULT 60,
  `batch_size` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `batch_delay_seconds` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `sent_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delivered_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `opened_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `clicked_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bounced_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `unsubscribed_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `scheduled_at` timestamp NULL DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_links`
--

CREATE TABLE `campaign_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `original_url` text NOT NULL,
  `tracking_hash` varchar(32) NOT NULL,
  `clicks_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_recipients`
--

CREATE TABLE `campaign_recipients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `status` enum('pending','processing','sent','delivered','opened','clicked','bounced','unsubscribed','failed') NOT NULL DEFAULT 'pending',
  `variant` varchar(1) DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `opened_at` timestamp NULL DEFAULT NULL,
  `clicked_at` timestamp NULL DEFAULT NULL,
  `bounced_at` timestamp NULL DEFAULT NULL,
  `unsubscribed_at` timestamp NULL DEFAULT NULL,
  `error_message` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `canned_responses`
--

CREATE TABLE `canned_responses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `shortcut` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `scope` enum('personal','team') NOT NULL DEFAULT 'personal',
  `category` varchar(255) DEFAULT NULL,
  `channels` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`channels`)),
  `usage_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `channel_integrations`
--

CREATE TABLE `channel_integrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `channel` enum('whatsapp','sms','telegram','slack','chat','salesforce','hubspot','zapier','stripe','google_calendar') NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `credentials` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`credentials`)),
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`config`)),
  `status` enum('active','inactive','error') NOT NULL DEFAULT 'inactive',
  `error_message` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `bot_username` varchar(255) DEFAULT NULL,
  `slack_team_id` varchar(255) DEFAULT NULL,
  `slack_bot_token` varchar(255) DEFAULT NULL,
  `slack_channel_id` varchar(255) DEFAULT NULL,
  `zapier_webhook_token` varchar(64) DEFAULT NULL,
  `zapier_api_token` text DEFAULT NULL,
  `salesforce_instance_url` varchar(255) DEFAULT NULL,
  `token_expires_at` timestamp NULL DEFAULT NULL,
  `refresh_token` text DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `ai_auto_reply` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_widgets`
--

CREATE TABLE `chat_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `public_id` varchar(32) NOT NULL,
  `primary_color` varchar(7) NOT NULL DEFAULT '#4F46E5',
  `position` varchar(20) NOT NULL DEFAULT 'bottom-right',
  `button_icon` varchar(20) NOT NULL DEFAULT 'chat',
  `border_radius` smallint(5) UNSIGNED NOT NULL DEFAULT 12,
  `widget_width` smallint(5) UNSIGNED NOT NULL DEFAULT 380,
  `company_name` varchar(255) DEFAULT NULL,
  `agent_avatar_path` varchar(255) DEFAULT NULL,
  `company_logo_path` varchar(255) DEFAULT NULL,
  `show_branding` tinyint(1) NOT NULL DEFAULT 1,
  `welcome_message` varchar(255) NOT NULL DEFAULT 'Hi there! How can we help you today?',
  `pre_chat_form` varchar(30) NOT NULL DEFAULT 'name_email',
  `pre_chat_required` tinyint(1) NOT NULL DEFAULT 1,
  `offline_mode` varchar(30) NOT NULL DEFAULT 'leave_message',
  `offline_message` varchar(255) DEFAULT NULL,
  `ai_auto_reply` tinyint(1) NOT NULL DEFAULT 1,
  `file_sharing` tinyint(1) NOT NULL DEFAULT 1,
  `typing_indicator` tinyint(1) NOT NULL DEFAULT 1,
  `sound_notification` tinyint(1) NOT NULL DEFAULT 1,
  `chat_rating` tinyint(1) NOT NULL DEFAULT 1,
  `email_transcript` tinyint(1) NOT NULL DEFAULT 1,
  `auto_close_minutes` smallint(5) UNSIGNED NOT NULL DEFAULT 30,
  `operating_hours` varchar(20) NOT NULL DEFAULT 'workspace',
  `custom_hours` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`custom_hours`)),
  `proactive_triggers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`proactive_triggers`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `avatar_path` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `lead_score` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`custom_fields`)),
  `status` enum('active','unsubscribed','bounced','spam') NOT NULL DEFAULT 'active',
  `unsubscribed_at` timestamp NULL DEFAULT NULL,
  `unsubscribe_reason` varchar(255) DEFAULT NULL,
  `last_contacted_at` timestamp NULL DEFAULT NULL,
  `last_seen_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `uuid`, `workspace_id`, `first_name`, `last_name`, `email`, `phone`, `company`, `job_title`, `avatar_path`, `city`, `country`, `timezone`, `lead_score`, `custom_fields`, `status`, `unsubscribed_at`, `unsubscribe_reason`, `last_contacted_at`, `last_seen_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ca560b39-dded-4abf-9561-0f3371680a64', 4, 'Umair', 'Ali', 'umairkheshgi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'active', NULL, NULL, '2026-10-01 13:57:31', NULL, '2026-09-27 12:07:16', '2026-10-01 13:57:31', NULL),
(2, '0187a5ef-c585-41f4-a5e9-a7bf6f12c257', 6, 'Umair', 'Ali', 'umairkheshgi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'active', NULL, NULL, '2026-09-27 13:13:35', NULL, '2026-09-27 13:13:35', '2026-09-27 13:13:35', NULL),
(3, '93544c79-2bd5-4a64-a2ce-495a6bb2eacd', 9, 'Dahimail', NULL, 'noreply@dahimail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'active', NULL, NULL, '2026-09-29 04:49:08', NULL, '2026-09-29 04:49:08', '2026-09-29 04:49:08', '2026-09-30 07:50:41'),
(4, 'd13afa10-35a4-4d12-9d17-9cee94eeaf95', 9, 'noreply@fbr.gov.pk', NULL, 'noreply@fbr.gov.pk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'active', NULL, NULL, '2026-09-29 04:54:03', NULL, '2026-09-29 04:54:03', '2026-09-29 04:54:03', '2026-09-30 07:50:41'),
(5, '1804e595-dfc3-49f1-a7e1-3313afb66156', 11, 'Dahimail', NULL, 'noreply@dahimail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'active', NULL, NULL, '2026-09-30 04:19:14', NULL, '2026-09-30 04:19:14', '2026-09-30 04:19:14', '2026-09-30 07:50:41'),
(6, 'e5ac550e-7a84-4b2c-b545-4cf783b83e5e', 11, 'umairkheshgi', NULL, 'umairkheshgi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'active', NULL, NULL, '2026-09-30 04:19:49', NULL, '2026-09-30 04:19:49', '2026-09-30 04:19:49', NULL),
(7, 'a1023a02-8778-4e7a-924a-044d224cdb7e', 14, 'zulfiqar', NULL, 'zulfiqar@dahimail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'active', NULL, NULL, '2026-10-02 12:39:03', NULL, '2026-10-02 12:38:13', '2026-10-02 12:39:03', NULL),
(8, 'dc9c0bbf-9e78-421c-b2c8-aed6c97a5615', 15, 'Umair', 'Ali', 'umairali@dahimail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'active', NULL, NULL, '2026-10-02 12:38:16', NULL, '2026-10-02 12:38:16', '2026-10-02 12:38:16', NULL),
(9, 'b61eea7a-cb9d-4869-90f4-25a45b98c76f', 17, 'Shah', 'Fahad', 'fahadkheshgi1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'active', NULL, NULL, '2026-10-05 08:12:20', NULL, '2026-10-05 08:12:20', '2026-10-05 08:12:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_lists`
--

CREATE TABLE `contact_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `contacts_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_list_members`
--

CREATE TABLE `contact_list_members` (
  `contact_list_id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` bigint(20) UNSIGNED NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_tag`
--

CREATE TABLE `contact_tag` (
  `contact_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_to` bigint(20) UNSIGNED DEFAULT NULL,
  `channel` varchar(20) DEFAULT 'email',
  `status` enum('open','pending','closed','snoozed','spam') NOT NULL DEFAULT 'open',
  `priority` enum('low','normal','high','urgent') NOT NULL DEFAULT 'normal',
  `subject` varchar(255) DEFAULT NULL,
  `preview` text DEFAULT NULL,
  `sentiment` enum('positive','neutral','negative','angry') DEFAULT NULL,
  `is_starred` tinyint(1) NOT NULL DEFAULT 0,
  `is_pinned` tinyint(1) NOT NULL DEFAULT 0,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `is_ai_handled` tinyint(1) NOT NULL DEFAULT 0,
  `messages_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ai_replies_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `snoozed_until` timestamp NULL DEFAULT NULL,
  `last_message_at` timestamp NULL DEFAULT NULL,
  `first_response_at` timestamp NULL DEFAULT NULL,
  `resolved_at` timestamp NULL DEFAULT NULL,
  `channel_conversation_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `uuid`, `workspace_id`, `contact_id`, `email_account_id`, `assigned_to`, `channel`, `status`, `priority`, `subject`, `preview`, `sentiment`, `is_starred`, `is_pinned`, `is_read`, `is_ai_handled`, `messages_count`, `ai_replies_count`, `tags`, `snoozed_until`, `last_message_at`, `first_response_at`, `resolved_at`, `channel_conversation_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '06bb0cae-69bf-4c8f-8453-1e5c6885c7df', 4, 1, 1, NULL, 'email', 'open', 'normal', 'Accfc', '<p>bhjkbkjbjkbkjbjkbkj </p>', NULL, 0, 0, 1, 0, 7, 0, NULL, NULL, '2026-09-28 04:41:28', '2026-09-27 12:07:31', NULL, NULL, '2026-09-27 12:07:16', '2026-09-28 12:25:53', '2026-09-28 12:25:53'),
(2, 'e3975ba6-8f70-449e-ac72-959a2c511290', 6, 2, 3, NULL, 'email', 'open', 'normal', 'Qdududud', '<p>nsknskcsncns</p>', NULL, 0, 0, 1, 0, 2, 0, NULL, NULL, '2026-09-27 13:17:56', '2026-09-27 13:17:56', NULL, NULL, '2026-09-27 13:13:35', '2026-09-27 13:17:56', NULL),
(3, '9baba4be-d0e1-4015-b117-1fd229b9a906', 4, 1, 1, 3, 'email', 'open', 'normal', 'scsdcsdcscscdsc', 'csdcscdsdcscsdcscscs', NULL, 0, 0, 1, 0, 1, 0, NULL, NULL, '2026-09-28 11:48:34', NULL, NULL, NULL, '2026-09-28 11:48:34', '2026-09-28 12:25:53', '2026-09-28 12:25:53'),
(4, 'd984b5e3-e337-4049-80ea-d60aa484dd6e', 4, 1, 1, 3, 'email', 'open', 'normal', 'cascasca', 'ascascaca', NULL, 0, 0, 1, 0, 1, 0, NULL, NULL, '2026-09-28 12:09:25', NULL, NULL, NULL, '2026-09-28 12:09:25', '2026-09-28 12:25:53', '2026-09-28 12:25:53'),
(5, '4ce07e94-8f09-4b20-b187-a8f735b4f77b', 4, 1, 1, 3, 'email', 'open', 'normal', 'ascacacc', '	ascascacascacasc', NULL, 0, 0, 1, 0, 1, 0, NULL, NULL, '2026-09-28 12:12:19', NULL, NULL, NULL, '2026-09-28 12:12:19', '2026-09-28 12:25:53', '2026-09-28 12:25:53'),
(6, 'd146e43c-6742-48ee-ab0a-95c3d396cb17', 4, 1, 1, 3, 'email', 'open', 'normal', 'aaaaa', 'aaaaaa', NULL, 0, 0, 1, 0, 1, 0, NULL, NULL, '2026-09-28 12:18:56', NULL, NULL, NULL, '2026-09-28 12:18:56', '2026-09-28 12:25:53', '2026-09-28 12:25:53'),
(7, '0f54b35f-951e-4d68-af72-30bb959deb71', 9, 3, 6, NULL, 'email', 'open', 'normal', 'Welcome to Dahimail!', 'Dahimail: https://dahimail.com\r\n\r\n# Hi Shabina,\r\n\r\nWelcome aboard! Your account is ready and we\'re excited to help you automate your communications.\r\n\r\nHere\'s how to get started in under 5 minutes:...', NULL, 0, 0, 1, 0, 1, 0, NULL, NULL, '2026-09-29 04:46:43', NULL, NULL, NULL, '2026-09-29 04:49:08', '2026-09-29 04:49:32', NULL),
(8, '831e068f-fb10-4042-8859-44186c4bd391', 9, 3, 6, NULL, 'email', 'open', 'normal', 'Verify Email Address', 'Dahimail: https://dahimail.com\r\n\r\n# Hello!\r\n\r\nPlease click the button below to verify your email address.\r\n\r\nVerify Email Address: https://dahimail.com/email/verify/9/9866d47455adab498aa2872ed6bfa61cb...', NULL, 0, 0, 1, 0, 1, 0, NULL, NULL, '2026-09-29 04:46:43', NULL, NULL, NULL, '2026-09-29 04:49:08', '2026-09-29 04:49:21', NULL),
(9, 'af6b962e-4795-47a3-b08d-bd1fdd585eaf', 9, 4, 6, NULL, 'email', 'open', 'normal', '(No Subject)', '\n\n\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	Email Template\n	\n	\n	\n\n	\n		body { padding:0 !important; margin:0 auto !important; display:block !important; min-width:100% !important; width:100% !important; background:#f4ecf...', NULL, 0, 0, 1, 0, 1, 0, NULL, NULL, '2026-09-29 04:53:50', NULL, NULL, NULL, '2026-09-29 04:54:03', '2026-09-29 04:54:09', NULL),
(12, '25238da2-2f79-4d99-a8b3-186db95f5885', 4, 1, 1, 3, 'email', 'open', 'normal', 'sjdjddu', 'dididid', NULL, 0, 0, 1, 0, 2, 0, NULL, NULL, '2026-09-29 14:56:40', NULL, NULL, NULL, '2026-09-29 14:55:43', '2026-09-29 14:56:40', NULL),
(13, '5eb0d4aa-26b4-4f7b-a9a8-aa8a0d72b313', 4, 1, 1, 3, 'email', 'open', 'normal', 'ghfd', 'Ssdffff\r\n\r\nOn Tue, 29 Sept 2026, 23:04 nb, <uape@dahimail.com> wrote:\r\n\r\n> gjggfff\r\n>\r\n', NULL, 0, 0, 0, 0, 2, 0, NULL, NULL, '2026-09-30 02:01:00', NULL, NULL, NULL, '2026-09-29 16:04:05', '2026-09-30 03:46:12', NULL),
(14, '340c595e-e375-41cb-84a5-b96ec2c39f3a', 4, 1, 1, NULL, 'email', 'open', 'normal', 'acasc', 'acascacac\r\n', NULL, 0, 0, 1, 0, 1, 0, NULL, NULL, '2026-09-29 14:58:58', NULL, NULL, NULL, '2026-09-29 16:04:12', '2026-10-01 18:04:51', NULL),
(15, 'cad418f0-5bbc-4173-8361-ec6664c97336', 11, 5, 8, NULL, 'email', 'open', 'normal', 'Welcome to Dahimail!', 'Dahimail: https://dahimail.com\r\n\r\n# Hi Qaqa,\r\n\r\nWelcome aboard! Your account is ready and we\'re excited to help you automate your communications.\r\n\r\nHere\'s how to get started in under 5 minutes:\r\n\r\n**...', NULL, 0, 0, 0, 0, 1, 0, NULL, NULL, '2026-09-30 04:18:59', NULL, NULL, NULL, '2026-09-30 04:19:14', '2026-09-30 04:19:14', NULL),
(16, '7379cdb0-3ab3-4b6b-8ad6-6f266dca74cb', 11, 6, 8, 11, 'email', 'open', 'normal', 'sjsjfjfj', 'dududididifid', NULL, 0, 0, 1, 0, 1, 0, NULL, NULL, '2026-09-30 04:19:49', NULL, NULL, NULL, '2026-09-30 04:19:49', '2026-09-30 04:19:49', NULL),
(17, 'c1e9412c-03b8-4cb6-9a9a-830fc38596df', 12, NULL, 9, NULL, 'email', 'open', 'normal', 'Welcome to Dahimail!', 'Dahimail: https://dahimail.com\r\n\r\n# Hi Zubair,\r\n\r\nWelcome aboard! Your account is ready and we\'re excited to help you automate your communications.\r\n\r\nHere\'s how to get started in under 5 minutes:...', NULL, 0, 0, 1, 0, 1, 0, NULL, NULL, '2026-09-30 11:08:48', NULL, NULL, NULL, '2026-09-30 11:14:36', '2026-09-30 11:18:56', NULL),
(18, '2650e1aa-519a-462e-9bea-b0e835431352', 12, NULL, 9, NULL, 'email', 'open', 'normal', '(No Subject)', '\n\n\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	Email Template\n	\n	\n	\n\n	\n		body { padding:0 !important; margin:0 auto !important; display:block !important; min-width:100% !important; width:100% !important; background:#f4ecf...', NULL, 0, 0, 1, 0, 1, 0, NULL, NULL, '2026-09-30 11:47:49', NULL, NULL, NULL, '2026-09-30 11:48:11', '2026-09-30 11:48:15', NULL),
(19, '82ae1d8a-6f21-4872-9b72-afb39cda59d0', 12, NULL, 9, NULL, 'email', 'open', 'normal', '(No Subject)', '\n\n\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	Email Template\n	\n	\n	\n\n	\n		body { padding:0 !important; margin:0 auto !important; display:block !important; min-width:100% !important; width:100% !important; background:#f4ecf...', NULL, 0, 0, 1, 0, 1, 0, NULL, NULL, '2026-09-30 12:02:40', NULL, NULL, NULL, '2026-09-30 12:04:16', '2026-09-30 12:04:20', NULL),
(20, 'cdc1476d-8ef8-4070-96e7-66acaab1eac8', 12, NULL, 9, NULL, 'email', 'open', 'normal', '(No Subject)', '\n\n\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	Email Template\n	\n	\n	\n\n	\n		body { padding:0 !important; margin:0 auto !important; display:block !important; min-width:100% !important; width:100% !important; background:#f4ecf...', NULL, 0, 0, 1, 0, 1, 0, NULL, NULL, '2026-09-30 12:05:38', NULL, NULL, NULL, '2026-09-30 12:06:16', '2026-09-30 12:06:32', NULL),
(21, 'f5b4531d-eea7-4abd-9a26-aceb7e831711', 12, NULL, 9, NULL, 'email', 'open', 'normal', '181 (Order to grant / refuse registration on application)', '\n\n\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	Email Template\n	\n	\n	\n\n	\n		body { padding:0 !important; margin:0 auto !important; display:block !important; min-width:100% !important; width:100% !important; background:#f4ecf...', NULL, 0, 0, 1, 0, 1, 0, NULL, NULL, '2026-09-30 12:09:38', NULL, NULL, NULL, '2026-09-30 12:18:20', '2026-09-30 12:59:03', NULL),
(22, 'ecc947b5-8754-47a3-9fe2-f74d6e88bb00', 12, NULL, 9, NULL, 'email', 'open', 'normal', '181 (Order to grant / refuse registration on application)', '\n\n\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	Email Template\n	\n	\n	\n\n	\n		body { padding:0 !important; margin:0 auto !important; display:block !important; min-width:100% !important; width:100% !important; background:#f4ecf...', NULL, 0, 0, 1, 0, 1, 0, NULL, NULL, '2026-09-30 12:09:41', NULL, NULL, NULL, '2026-09-30 12:18:20', '2026-09-30 12:22:08', NULL),
(23, '2e3b79c3-14aa-485d-a371-f5231c4c6dd3', 13, NULL, 10, NULL, 'email', 'open', 'normal', 'Welcome to Dahimail!', 'Dahimail: https://dahimail.com\r\n\r\n# Hi MUHAMMAD,\r\n\r\nWelcome aboard! Your account is ready and we\'re excited to help you automate your communications.\r\n\r\nHere\'s how to get started in under 5 minutes:...', NULL, 0, 0, 0, 0, 1, 0, NULL, NULL, '2026-10-01 04:40:06', NULL, NULL, NULL, '2026-10-01 04:41:46', '2026-10-01 04:41:47', NULL),
(24, 'bf86e48e-8d44-40a3-a0a1-4c210ee39823', 13, NULL, 10, NULL, 'email', 'open', 'normal', 'Verify Email Address', 'Dahimail: https://dahimail.com\r\n\r\n# Hello!\r\n\r\nPlease click the button below to verify your email address.\r\n\r\nVerify Email Address: https://dahimail.com/email/verify/13/bcd535f7649f0a6d98db079c26c5c3a0...', NULL, 0, 0, 0, 0, 1, 0, NULL, NULL, '2026-10-01 04:40:06', NULL, NULL, NULL, '2026-10-01 04:41:47', '2026-10-01 04:41:47', NULL),
(25, '25d17f9e-e97c-403d-9205-25ca65e8e6c7', 13, NULL, 10, NULL, 'email', 'open', 'normal', '(No Subject)', '\n\n\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	Email Template\n	\n	\n	\n\n	\n		body { padding:0 !important; margin:0 auto !important; display:block !important; min-width:100% !important; width:100% !important; background:#f4ecf...', NULL, 0, 0, 1, 0, 1, 0, NULL, NULL, '2026-10-01 04:41:39', NULL, NULL, NULL, '2026-10-01 04:41:58', '2026-10-01 04:42:04', NULL),
(26, '3223d6f9-1d18-441a-886e-1c85f404daae', 4, 1, 1, 3, 'email', 'open', 'normal', 'eududud', 'dfgfg', NULL, 0, 0, 1, 0, 1, 0, NULL, NULL, '2026-10-01 13:57:31', NULL, NULL, NULL, '2026-10-01 13:57:31', '2026-10-01 13:57:31', NULL),
(27, '58bf48de-71e1-417c-9dee-b5f1504c81f2', 14, NULL, 11, NULL, 'email', 'open', 'normal', 'Welcome to Dahimail!', 'Dahimail: https://dahimail.com\r\n\r\n# Hi Umair,\r\n\r\nWelcome aboard! Your account is ready and we\'re excited to help you automate your communications.\r\n\r\nHere\'s how to get started in under 5 minutes:\r\n\r\n*...', NULL, 0, 0, 1, 0, 1, 0, NULL, NULL, '2026-10-02 12:05:25', NULL, NULL, NULL, '2026-10-02 12:05:29', '2026-10-02 12:40:49', NULL),
(28, '36e777b8-46f4-4413-b068-9f41072ee0be', 15, NULL, 12, NULL, 'email', 'open', 'normal', 'Welcome to Dahimail!', 'Dahimail: https://dahimail.com\r\n\r\n# Hi Sardar,\r\n\r\nWelcome aboard! Your account is ready and we\'re excited to help you automate your communications.\r\n\r\nHere\'s how to get started in under 5 minutes:...', NULL, 0, 0, 0, 0, 1, 0, NULL, NULL, '2026-10-02 12:25:52', NULL, NULL, NULL, '2026-10-02 12:27:31', '2026-10-02 12:27:31', NULL),
(29, '76274398-4488-4be1-8f49-1e36b6a294bb', 14, 7, 11, 14, 'email', 'open', 'normal', 'mail', 'hom hagha dua da stha da para', NULL, 0, 0, 1, 0, 2, 0, NULL, NULL, '2026-10-02 12:38:55', NULL, NULL, NULL, '2026-10-02 12:38:13', '2026-10-02 12:39:08', NULL),
(30, '2fef00a5-a131-43b5-959c-9572437e9a5b', 15, 8, 12, NULL, 'email', 'open', 'normal', 'mail', 'hom hagha dua da stha da para', NULL, 0, 0, 1, 0, 2, 0, NULL, NULL, '2026-10-02 12:38:55', NULL, NULL, NULL, '2026-10-02 12:38:16', '2026-10-02 12:38:55', NULL),
(31, '311cc9b5-c8d4-46eb-89f4-d28f0bdd4cab', 16, NULL, 13, NULL, 'email', 'open', 'normal', 'Welcome to Dahimail!', 'Dahimail: https://dahimail.com\r\n\r\n# Hi Zulfiqar,\r\n\r\nWelcome aboard! Your account is ready and we\'re excited to help you automate your communications.\r\n\r\nHere\'s how to get started in under 5 minutes:...', NULL, 0, 0, 1, 0, 1, 0, NULL, NULL, '2026-10-02 12:53:00', NULL, NULL, NULL, '2026-10-02 12:53:07', '2026-10-02 12:55:55', NULL),
(32, 'ddd46e74-dca7-4b63-846f-552019715882', 17, NULL, 14, NULL, 'email', 'open', 'normal', 'Welcome to Dahimail!', 'Dahimail: https://dahimail.com\r\n\r\n# Hi Rukhsana,\r\n\r\nWelcome aboard! Your account is ready and we\'re excited to help you automate your communications.\r\n\r\nHere\'s how to get started in under 5 minutes:...', NULL, 0, 0, 0, 0, 1, 0, NULL, NULL, '2026-10-05 08:05:35', NULL, NULL, NULL, '2026-10-05 08:12:09', '2026-10-05 08:12:09', NULL),
(33, '72b46dad-d264-4cb7-9583-c41ce3770ced', 17, NULL, 14, NULL, 'email', 'open', 'normal', 'Verify Email Address', 'Dahimail: https://dahimail.com\r\n\r\n# Hello!\r\n\r\nPlease click the button below to verify your email address.\r\n\r\nVerify Email Address: https://dahimail.com/email/verify/17/b496fbbdbaa9b1751d62e8bc659d2845...', NULL, 0, 0, 0, 0, 1, 0, NULL, NULL, '2026-10-05 08:05:35', NULL, NULL, NULL, '2026-10-05 08:12:09', '2026-10-05 08:12:09', NULL),
(34, 'e9a85381-55a0-42c4-8b24-bc523f90690f', 17, 9, 14, NULL, 'email', 'open', 'normal', 'F', 'D\r\n', NULL, 0, 0, 1, 0, 1, 0, NULL, NULL, '2026-10-05 08:11:58', NULL, NULL, NULL, '2026-10-05 08:12:20', '2026-10-05 08:12:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `conversation_tag`
--

CREATE TABLE `conversation_tag` (
  `conversation_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversation_typing`
--

CREATE TABLE `conversation_typing` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversation_viewers`
--

CREATE TABLE `conversation_viewers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED DEFAULT NULL,
  `conversation_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `last_seen_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `stripe_coupon_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(32) NOT NULL DEFAULT 'percent_off',
  `percent_off` decimal(5,2) DEFAULT NULL,
  `amount_off` decimal(10,2) DEFAULT NULL,
  `value` decimal(10,2) DEFAULT NULL,
  `currency` varchar(3) NOT NULL DEFAULT 'usd',
  `duration` varchar(16) NOT NULL DEFAULT 'once',
  `duration_in_months` int(10) UNSIGNED DEFAULT NULL,
  `max_redemptions` int(10) UNSIGNED DEFAULT NULL,
  `times_redeemed` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `max_uses` int(10) UNSIGNED DEFAULT NULL,
  `times_used` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `applicable_plans` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`applicable_plans`)),
  `expires_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(5) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `symbol_position` varchar(10) NOT NULL DEFAULT 'before',
  `decimal_separator` varchar(1) NOT NULL DEFAULT '.',
  `thousand_separator` varchar(1) NOT NULL DEFAULT ',',
  `decimal_digits` int(11) NOT NULL DEFAULT 2,
  `exchange_rate` decimal(12,6) NOT NULL DEFAULT 1.000000,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `symbol_position`, `decimal_separator`, `thousand_separator`, `decimal_digits`, `exchange_rate`, `is_active`, `is_default`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', '$', 'before', '.', ',', 2, 1.000000, 1, 1, 1, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(2, 'Euro', 'EUR', '€', 'before', '.', ',', 2, 0.920000, 1, 0, 2, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(3, 'British Pound', 'GBP', '£', 'before', '.', ',', 2, 0.790000, 1, 0, 3, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(4, 'Indian Rupee', 'INR', '₹', 'before', '.', ',', 2, 83.500000, 1, 0, 4, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(5, 'Brazilian Real', 'BRL', 'R$', 'before', '.', ',', 2, 4.970000, 1, 0, 5, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(6, 'UAE Dirham', 'AED', 'د.إ', 'before', '.', ',', 2, 3.670000, 1, 0, 6, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(7, 'Saudi Riyal', 'SAR', '﷼', 'before', '.', ',', 2, 3.750000, 1, 0, 7, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(8, 'Japanese Yen', 'JPY', '¥', 'before', '.', ',', 0, 150.000000, 0, 0, 8, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(9, 'Chinese Yuan', 'CNY', '¥', 'before', '.', ',', 2, 7.240000, 0, 0, 9, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(10, 'Canadian Dollar', 'CAD', 'C$', 'before', '.', ',', 2, 1.360000, 1, 0, 10, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(11, 'Australian Dollar', 'AUD', 'A$', 'before', '.', ',', 2, 1.530000, 1, 0, 11, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(12, 'Mexican Peso', 'MXN', '$', 'before', '.', ',', 2, 17.150000, 1, 0, 12, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(13, 'Turkish Lira', 'TRY', '₺', 'before', '.', ',', 2, 32.000000, 1, 0, 13, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(14, 'Nigerian Naira', 'NGN', '₦', 'before', '.', ',', 2, 1570.000000, 1, 0, 14, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(15, 'Bangladeshi Taka', 'BDT', '৳', 'before', '.', ',', 2, 110.000000, 1, 0, 15, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(16, 'Indonesian Rupiah', 'IDR', 'Rp', 'before', '.', ',', 0, 15700.000000, 1, 0, 16, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(17, 'Pakistani Rupee', 'PKR', 'Rs', 'before', '.', ',', 2, 278.000000, 1, 0, 17, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(18, 'South African Rand', 'ZAR', 'R', 'before', '.', ',', 2, 18.500000, 1, 0, 18, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(19, 'Polish Zloty', 'PLN', 'zł', 'after', '.', ' ', 2, 3.950000, 0, 0, 19, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(20, 'Kenyan Shilling', 'KES', 'KSh', 'before', '.', ',', 2, 154.000000, 0, 0, 20, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(21, 'Ghanaian Cedi', 'GHS', 'GH₵', 'before', '.', ',', 2, 15.400000, 0, 0, 21, '2026-09-27 08:25:21', '2026-09-27 08:25:21');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `type` enum('text','number','date','dropdown','checkbox','url','email','phone') NOT NULL DEFAULT 'text',
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deals`
--

CREATE TABLE `deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pipeline_id` bigint(20) UNSIGNED NOT NULL,
  `deal_stage_id` bigint(20) UNSIGNED NOT NULL,
  `assigned_to` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(12,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(3) NOT NULL DEFAULT 'usd',
  `expected_close_date` date DEFAULT NULL,
  `status` enum('open','won','lost') NOT NULL DEFAULT 'open',
  `won_at` timestamp NULL DEFAULT NULL,
  `lost_at` timestamp NULL DEFAULT NULL,
  `lost_reason` varchar(255) DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`custom_fields`)),
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_stages`
--

CREATE TABLE `deal_stages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pipeline_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(7) NOT NULL DEFAULT '#6B7280',
  `win_probability` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `device_tokens`
--

CREATE TABLE `device_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(500) NOT NULL,
  `platform` varchar(10) NOT NULL,
  `voip_token` varchar(255) DEFAULT NULL,
  `app_version` varchar(20) DEFAULT NULL,
  `apns_sandbox` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `device_tokens`
--

INSERT INTO `device_tokens` (`id`, `user_id`, `token`, `platform`, `voip_token`, `app_version`, `apns_sandbox`, `created_at`, `updated_at`) VALUES
(1, 14, 'deHTWWN1Q4-DH71v8tmYJx:APA91bEAP7LSB3q8AO31Vq4TzMMIzNdPGzm1zNdfxYqyHRI8g9iRASRXwXFphpaycJgiQS-Mi7NAkWb2dHv_VIZrslr9LRWp_E7VRmuDzSowaVWMJ8hWtto', 'android', NULL, NULL, 0, '2026-10-02 16:16:13', '2026-10-02 16:16:13'),
(2, 14, 'd_Pqj8B8Q-ioBXXihjEMg4:APA91bH1P3fo0yZG8szvPq3_m6OIjGxoUPYwlBNIGZecKYYZRfJsCmcwSQf6iQGZUSgBVZIHtL6MjP2lQYj-0GeOBPxn42--b9P8-XWMAotUNhXy0W0g3nI', 'android', NULL, NULL, 0, '2026-10-03 13:34:14', '2026-10-03 13:34:14'),
(3, 14, 'czKu8VXESFO8CvTRnKP91T:APA91bGA02baMBuKcyHAjiuwpGTgHhjwt9XmgXWmHixHHLwWrlT6ij8a3pQco0ZcYVS-mfPdCCwMSv6e7E7VXNYPYWOX9EBi8VgroLFOnd5IxmiMTIhzuVo', 'android', NULL, '1.0.0', 0, '2026-10-05 09:02:57', '2026-10-05 09:26:13'),
(4, 14, 'd93N4OH4TB6x87Mw1utHhJ:APA91bG6uHkC9GrQBona6oba0WGL0si86nr9cAaS0ygUpkjTR8EFA4owubgCy46Z8G_rCJzDkjhoeTv4YZ7V0jrVCXKzALztYn2rLRoYRKNnuaXKIBE9nJ0', 'android', NULL, '1.0.0', 0, '2026-10-05 09:31:59', '2026-10-05 09:31:59');

-- --------------------------------------------------------

--
-- Table structure for table `drip_enrollments`
--

CREATE TABLE `drip_enrollments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sequence_id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` bigint(20) UNSIGNED NOT NULL,
  `current_step` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `retry_count` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('active','completed','exited','paused') NOT NULL DEFAULT 'active',
  `exit_reason` varchar(255) DEFAULT NULL,
  `next_step_at` timestamp NULL DEFAULT NULL,
  `enrolled_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `exited_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drip_sequences`
--

CREATE TABLE `drip_sequences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('active','paused','completed') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drip_steps`
--

CREATE TABLE `drip_steps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sequence_id` bigint(20) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL,
  `delay_value` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `delay_unit` enum('minutes','hours','days') NOT NULL DEFAULT 'days',
  `action_type` enum('send_email','wait_condition','add_tag','remove_tag','update_field') NOT NULL DEFAULT 'send_email',
  `action_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`action_data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_accounts`
--

CREATE TABLE `email_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `provider` enum('gmail','outlook','imap') NOT NULL DEFAULT 'imap',
  `imap_host` text DEFAULT NULL,
  `imap_port` smallint(5) UNSIGNED DEFAULT NULL,
  `imap_username` text DEFAULT NULL,
  `imap_password` text DEFAULT NULL,
  `imap_encryption` varchar(10) DEFAULT NULL,
  `smtp_host` text DEFAULT NULL,
  `smtp_port` smallint(5) UNSIGNED DEFAULT NULL,
  `smtp_username` text DEFAULT NULL,
  `smtp_password` text DEFAULT NULL,
  `smtp_encryption` varchar(10) DEFAULT NULL,
  `oauth_token` text DEFAULT NULL,
  `oauth_refresh_token` text DEFAULT NULL,
  `oauth_token_expires_at` timestamp NULL DEFAULT NULL,
  `status` enum('connected','disconnected','syncing','error') NOT NULL DEFAULT 'disconnected',
  `error_message` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `ai_auto_reply` tinyint(1) NOT NULL DEFAULT 0,
  `sync_folders` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`sync_folders`)),
  `last_synced_at` timestamp NULL DEFAULT NULL,
  `last_synced_uid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_accounts`
--

INSERT INTO `email_accounts` (`id`, `uuid`, `workspace_id`, `user_id`, `email`, `display_name`, `provider`, `imap_host`, `imap_port`, `imap_username`, `imap_password`, `imap_encryption`, `smtp_host`, `smtp_port`, `smtp_username`, `smtp_password`, `smtp_encryption`, `oauth_token`, `oauth_refresh_token`, `oauth_token_expires_at`, `status`, `error_message`, `is_default`, `ai_auto_reply`, `sync_folders`, `last_synced_at`, `last_synced_uid`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ba086357-3db5-45d3-83af-42a124afc719', 4, 3, 'uape@dahimail.com', 'nb', 'imap', '127.0.0.1', 993, 'eyJpdiI6IkZoMEg4cHY1SXFXdFY4NWdCZnk4TVE9PSIsInZhbHVlIjoiUUMxVlBqaU4wY1JtTUtDS0FGU1hHUWJwWFBoWjJ1MXJNZUw5bWZPT1MyTT0iLCJtYWMiOiJkNDkzNzE2M2UxZGRlODUyOGZhYzI3MmRkYWJiM2U4ODUxNjVlODBhMmJhN2U1Zjk5ZmFkMWZkMTRhMTRlZDU4IiwidGFnIjoiIn0=', 'eyJpdiI6IjFWWU1mK2RHb0RuT1lhaFYrVkdxb0E9PSIsInZhbHVlIjoiamMzYkZmQUVndmdTMWlzbW9KVWJjZz09IiwibWFjIjoiY2M0OTljNzZmNzJhMGU3NTE3Y2IwYWY4YmE5MDZlMTFiZjA2ZmRkM2I5Y2MzNTRiOWJmOTYxNzFiY2JiMmUwOSIsInRhZyI6IiJ9', 'ssl', '127.0.0.1', 587, 'eyJpdiI6ImlwRS80YnhtejBIZ0NnaWc4VFdONmc9PSIsInZhbHVlIjoiT1h0UTdXZDVRZzArTGlMc292QUUwWU0xbzRSQWZ4TEVYR1cvSW8wWVE5bz0iLCJtYWMiOiJhYzFiMWE3ODcwZTkzMjg2ODkzMWEzMmQ1NzYwNWRiZGU3MzA1NThkYTExYjEyOTI5OWI4MWI4NDBjODJhMzg0IiwidGFnIjoiIn0=', 'eyJpdiI6IjBUZmE5cFMvQlJURUIwRkpOVHk3M3c9PSIsInZhbHVlIjoieDh6K2l1V1FoMm9wUXRXS3dYaUU0QT09IiwibWFjIjoiZTdjMTg0MzdjYjUwMTY1ZGRmZjNkMWViOGU4YzM5NzBmY2M3NmM5NTMxZmNlYjllZjk3Njc3MmNiMjM4ZjNkMiIsInRhZyI6IiJ9', 'tls', NULL, NULL, NULL, 'connected', NULL, 1, 1, '{\"INBOX\":{\"last_uid\":3,\"oldest_uid\":1,\"backfill_done\":true},\"Sent\":{\"last_uid\":null}}', '2026-10-05 09:09:45', NULL, '2026-09-27 12:05:02', '2026-10-05 09:09:45', NULL),
(2, 'e568ba40-5a12-43f7-a024-444e5ab0d46d', 5, 5, 'ali1@dahimail.com', 'ali', 'imap', '127.0.0.1', 993, 'eyJpdiI6InBqRkNRelJ0bnhJQXd2UnV4RklBSXc9PSIsInZhbHVlIjoiMm5jMTAzQXBIc05hSjdSZUVIT3BOV2s4aTJBYXU5RHgwUlJpUlZycVVMOD0iLCJtYWMiOiIxZWY1ZDY2YTEyN2U5OTAxZDJjNWRiYTY1YzE3YmQwYzA0NzdlMTNjNWRiYThmYzc3NGY3NGM3MTM2NjY5NDgxIiwidGFnIjoiIn0=', 'eyJpdiI6IjUzdk1yVHpLQTg2YzdGTCtJNWdNeWc9PSIsInZhbHVlIjoianM0ZjhGTk0veitrT3l4bCtLRWNTQT09IiwibWFjIjoiOWYxMzM4MzI3YjdjOWZlMTVmNmNhMWJjMTVlNjJlYmQxODdhMDkzMzY2N2I4YTg5ZjhiOTU3ZjIyZmIyYThmZSIsInRhZyI6IiJ9', 'ssl', '127.0.0.1', 587, 'eyJpdiI6ImFHUkttcGNKdTZHMkRDUG9uN0phNkE9PSIsInZhbHVlIjoidHhQMVZOWEJjTUNuOUdPbXREU0ZXd291QkYwcVpURFJEWk5zZnFIbXVtaz0iLCJtYWMiOiJmOTRlZmUwNGYwNmM1ZjIxZmY2ZjYyMzJjZDcyOWQwMzY1YTBkY2UzYmMxYjFhN2JmMDM2Y2JhOWYyYWMyZWM0IiwidGFnIjoiIn0=', 'eyJpdiI6ImQ5ZDZDbFVDd1RMTjJIaWZxN0l6Umc9PSIsInZhbHVlIjoiV0dtWHZHSDdhWWg2d0JaNE52cURBZz09IiwibWFjIjoiNDkwNGMwNGMwZmM3Yjg2ZmY1ZTkzYmMzNjZhMjViNDUyZWZjMjdhOGQwYzk3YzFkNGYxYWIxNmEyMmU2MWQzNyIsInRhZyI6IiJ9', 'tls', NULL, NULL, NULL, 'connected', NULL, 1, 0, '[\"INBOX\",\"Sent\"]', NULL, NULL, '2026-09-27 12:55:19', '2026-09-27 12:55:19', NULL),
(3, '54750e3b-ecf7-4890-a2f2-d8a3767eae24', 6, 6, 'khan@dahimail.com', 'khan', 'imap', '127.0.0.1', 993, 'eyJpdiI6IkFkYTllOFE4NXg1aG53ZVV0YUY2VUE9PSIsInZhbHVlIjoiU1AxUjVRczA3M0dIVm9hS242STZkNU5YQnE0ZlZWak1JWWtnRDVLWGJVZz0iLCJtYWMiOiJjMzQwYzViMGQwZWY4ZDNlMWQ0MjVhNDBiMjA4NTNjOGZkMDJjM2RlZTU3OGJlYTc2YTlkMjhjMTUzMDZkOThhIiwidGFnIjoiIn0=', 'eyJpdiI6IjVudklYTnNvK3kxNWZjZ3pMSXFrZXc9PSIsInZhbHVlIjoiQkNkWEpqUzNUTmFwaCtrdmR5c1Nodz09IiwibWFjIjoiODBjMjZhNGY2MTcxYTc3NWIyN2QzOGU3NWZhY2FlOWM1YTQ3MzliNzE3ZTEwY2YxMDMyNjc2Yjg1MGViMmM3MiIsInRhZyI6IiJ9', 'ssl', '127.0.0.1', 587, 'eyJpdiI6IjhzSGNJYkVhODc0TGUxVUtHSXY3R0E9PSIsInZhbHVlIjoiU1ZDcGJVUzdWMWZYNzhtMFNsQ2xuaEFGR0NVSEFXODBRWndHdUxoSytqWT0iLCJtYWMiOiIyMjgwYzZiMzYwYmY3YTIwODgzODZkOGJjNDRhMzViOTdlMDRmNzVkZTVhN2YzZmMxZmI1MjEwODQwOGFhNGVlIiwidGFnIjoiIn0=', 'eyJpdiI6Inl3VmFpQStwYWpEMDZDWTdGNC85cEE9PSIsInZhbHVlIjoiNjByVE1NOE5QMUlyZmp5dld6RjlmZz09IiwibWFjIjoiOTQ2ZTRjN2I2NTI3NmVhMjYxNTI5YzFhZjFiNGJiMjcwNzU0NzNiNGI2NmY1OTJhMmM1YmU5NmY4Mjk1NjI3ZiIsInRhZyI6IiJ9', 'tls', NULL, NULL, NULL, 'connected', NULL, 1, 0, '{\"INBOX\":{\"last_uid\":1,\"oldest_uid\":1,\"backfill_done\":true},\"Sent\":{\"last_uid\":null}}', '2026-10-02 16:14:59', NULL, '2026-09-27 13:09:17', '2026-10-02 16:14:59', NULL),
(4, 'a1526476-509f-4963-9cbd-8de2dc3bff70', 7, 7, 'abc@dahimail.com', 'abc', 'imap', '127.0.0.1', 993, 'eyJpdiI6IlZ0cTRLbmkxWTdEY3htMHRCZ1krZ0E9PSIsInZhbHVlIjoia3dFa0RBVlo1cDdoU25wWkpSTm12TzYycXNTSDArYk1xQzRKOCtqMHNxUT0iLCJtYWMiOiJiN2UzMDY3YWEwMmY2YzA2OWM2OTQ0MmE3YWVkOTAyNGZmNmJmODMwNTAxOWM1YTFkODU2M2VmM2E3ZTlhNGI4IiwidGFnIjoiIn0=', 'eyJpdiI6Imx3WE5mZ0Q0UStVTmx2Slp4MnB3UEE9PSIsInZhbHVlIjoiWlo1NHRTNWY4ZmVjZEN6VGxDL3drQT09IiwibWFjIjoiYzQ0MmYxMTVlNWY4YmM0ODU0OGQ1OWU4NzZlMzMzNTNjZmVhNDI2MzhmN2Q0NjgzZmM1NjAzMDExMjgxOWVkMyIsInRhZyI6IiJ9', 'ssl', '127.0.0.1', 587, 'eyJpdiI6InRsUUFTaWx2R0t4RjkyWFVwM0FtWGc9PSIsInZhbHVlIjoiVkxWeWJIUUdFTmNHNVJkSFRwQnRFZUNLUkVBeGEvN2t0MlYzME81a3dYbz0iLCJtYWMiOiJlYjQ3NjI0MWE2NTc1ZTk2MTg0OWNlYWFhYTQzZTk2MzZlYWQ4MjQ1OTViN2Q1YzJkZjQwNDdlNWYwZjQ0OTBkIiwidGFnIjoiIn0=', 'eyJpdiI6InkwVms4aGpBY2U4ZFRPK1VMOXd6RFE9PSIsInZhbHVlIjoiVDM2dklacU43b0oyMFlHUUlHbkxNQT09IiwibWFjIjoiY2Q2NTljMzA3ZjdhMDQxNzNkMzQxNTcyYmE0OGIwMmVhZDlkZTgwYjU1ZmNiZjhlY2VkMmI0NTViYzBjMTZiNCIsInRhZyI6IiJ9', 'tls', NULL, NULL, NULL, 'connected', NULL, 1, 0, '[\"INBOX\",\"Sent\"]', NULL, NULL, '2026-09-27 13:22:34', '2026-09-27 13:22:34', NULL),
(5, '41a75b79-b8b8-4d99-bfdc-5b9ba955f95b', 8, 8, 'aaa@dahimail.com', 'aaa', 'imap', '127.0.0.1', 993, 'eyJpdiI6Ilp2OWFDT0FDaG0xSjBNZjFBVU5SOUE9PSIsInZhbHVlIjoiQ0NtME55VWhPMWtLc1c4ZkFDWkI0UHVSOWs2bXRWUWRicndpZ0NXQ1FIOD0iLCJtYWMiOiJiNTIzMjg4YTQyYjc1OWYwZTZkZTUyYjEzMTk1NmRmNTdkMDM0OWJiYTg3MzdjOGYzN2UxNTQ2NmNlMmVmYTkzIiwidGFnIjoiIn0=', 'eyJpdiI6Ik9JNVZMY0tSQ2x0eml2YTdZOGZKUXc9PSIsInZhbHVlIjoiRk9LQWRBR3AxRElZMFlwek5lai9tZz09IiwibWFjIjoiMDQzZDczZjJiNDRjN2M5ODc0NjJhNmU1NjU0OWJhYTA3ZWFhMGQzOTc2Y2I2YjAwODBhZjlmMGViMjhmNmRkNCIsInRhZyI6IiJ9', 'ssl', '127.0.0.1', 587, 'eyJpdiI6Im1JcXN1Y3ZGUmJGRzlmMzkrL094S0E9PSIsInZhbHVlIjoiclY4aGZnZVZoL3duN0xoaktLV0ovcWM3N1lWcWFPZU9LMVkvaks3a2lvOD0iLCJtYWMiOiIyZGI4NjI5MGMxOWJjYTZlNzg3MjVmNjM1NDYzMmZiZjk4YjliYmMzN2IyNGYwNDhlMGM5NjFlZTdkNDQyZjcxIiwidGFnIjoiIn0=', 'eyJpdiI6IkFIZGk3dFRwWHhzenpqb0Jkd1hCT3c9PSIsInZhbHVlIjoicmxHc2ZtQmo3NDFqMkZ2T0VkTWJUZz09IiwibWFjIjoiZWU0OGMzNWU0YTdjNjI1ODc3NGUzNTRjY2Y0ZWRmYmU4YmMzYzZiMTBmZTk5YTlmNGIwYjJjMmE5YmExYTU0YSIsInRhZyI6IiJ9', 'tls', NULL, NULL, NULL, 'connected', NULL, 1, 0, '[\"INBOX\",\"Sent\"]', NULL, NULL, '2026-09-28 05:15:10', '2026-09-28 05:15:10', NULL),
(6, 'd4a5ad1b-64e3-44b5-b840-5192c8245573', 9, 9, 'shabinafbr@dahimail.com', 'Shabina Amin', 'imap', '127.0.0.1', 993, 'eyJpdiI6IkpEbWwzbzhUSWcySStuMUxWK2RWbmc9PSIsInZhbHVlIjoiQk1PWnZTbUlQODg1VEg5N1p2OGVtUjZ2cFlxT3RKNkJpK1BrOUVydmI3OD0iLCJtYWMiOiJmNmY2YjRhMjljOTNhMjQ5ZWU0YTAyN2I0MzVmODk1ZGRjMTM5MjQwOWIyYTBmZDRiOTI1NTc5ZmQ3MTEyZDhmIiwidGFnIjoiIn0=', 'eyJpdiI6IjZHVllQU2piNmpoVVdoVmkvbWdETkE9PSIsInZhbHVlIjoiVHhTTzRFWG9oNFE0VnBOQ0tRdlVqZz09IiwibWFjIjoiYjBiOWNkMTY4MzBlOWNiM2UxMGZjMzEzNzc3NTZmMDFmMTQzNzUwZWJlNzUxZDY2YzFhMzVmZjJjZjUwMGJkZSIsInRhZyI6IiJ9', 'ssl', '127.0.0.1', 587, 'eyJpdiI6IjdKVHcxQmlaWVN1eDhsOXFjTzFPUVE9PSIsInZhbHVlIjoiaC9wN0c0N1JlYWZFRStYYm9sYkdxS3V6UXR0K21rVWtaNUVldThTUDNVTT0iLCJtYWMiOiI2ZTIyMjk0MzdkMzM5MTM3MDJiNDRjZDMzZDNjNzBhODAwMjkwMDcxOTliYzY3YTI2ZTg4YmE4MGE2Y2Q5N2MxIiwidGFnIjoiIn0=', 'eyJpdiI6IkVtK2JCWmhmMVRIdWgrTTEvcndBVnc9PSIsInZhbHVlIjoiREVGcTNnWmN6NjdJdlNMWWRMTzJsQT09IiwibWFjIjoiNDAzNTJhNzVjNjFiNzdlYTIwZDVlODg5OGQyOGMyMDAxNzE0OTQ0ODU1Y2M5MDAwM2NlMTdiNWMxNzdhYWYwYSIsInRhZyI6IiJ9', 'tls', NULL, NULL, NULL, 'connected', NULL, 1, 0, '{\"INBOX\":{\"last_uid\":3,\"oldest_uid\":1,\"backfill_done\":true},\"Sent\":{\"last_uid\":null}}', '2026-09-29 09:29:31', NULL, '2026-09-29 04:46:43', '2026-09-29 09:29:31', NULL),
(7, '64f099b0-f7ea-43bc-aa96-e45261c59388', 10, 10, 'uape1@dahimail.com', 'Umair Ali', 'imap', '127.0.0.1', 993, 'eyJpdiI6IkhzQkh4bGJLRVFMYys2NUIzcjNFTXc9PSIsInZhbHVlIjoic3pRN1BnWW1BcHN3cko0L1VSUUlBYVlkSWZJNlFGcHY2a3d2SFhUVG05ND0iLCJtYWMiOiIwZTg3ZmE1NDE0YjYxNGE5MGJiMDM5ZTgyNDVkY2QwZTBmZGRjNTE5OTM0OGZkMDg3OTQ2YjE5MmQ5N2RmMTE5IiwidGFnIjoiIn0=', 'eyJpdiI6Illxdm1acDAxWWE4ejRyRXFwYUZlRXc9PSIsInZhbHVlIjoiNHhBazMzSmlCVmpld0ozNkRzL09ldz09IiwibWFjIjoiZDU5OWEwYTJhZDc3MGY4MjczMDE4ODhjNzE5N2EwMGQxZDNmZDY4OTk5OGViNmUwYWI4NzMxYmNhZTc0OGZmNiIsInRhZyI6IiJ9', 'ssl', '127.0.0.1', 587, 'eyJpdiI6IjMwUFJkTytESm5yQlRQYUg2Rmx0OFE9PSIsInZhbHVlIjoiMkc2a1VMNEM3TUdmOFNNenk2dDd4TWU2V2d2K3lWcGFnWFlhQjc4UnU3ST0iLCJtYWMiOiI5ZmQ5ZGMwNjA0OTFhOThiY2VjN2Y0NDNlYmI1OTZiMjExOGI5ZjljNzAxNDE3NGUxMWRmMTVlNzBkNDhhMDE4IiwidGFnIjoiIn0=', 'eyJpdiI6InpCN1UydVhMVGh3cmpjQWlHazdWalE9PSIsInZhbHVlIjoiQ09JTzFPSmpwU3hhbWVyZStobHVOZz09IiwibWFjIjoiMzU1MjI5Mzk4Yzc3OThlM2MwZDgxZDk5NWI3MGIxMzUwMGJiMmU0MTRlZWEwYjRmNjc5NjM1ODhiYmQ2NjcwMiIsInRhZyI6IiJ9', 'tls', NULL, NULL, NULL, 'connected', NULL, 1, 0, '[\"INBOX\",\"Sent\"]', NULL, NULL, '2026-09-30 03:53:32', '2026-09-30 03:53:32', NULL),
(8, '7fd99e85-f8ad-41fe-a7c0-ab60da734ec2', 11, 11, 'qaqa@dahimail.com', 'Qaqa', 'imap', '127.0.0.1', 993, 'eyJpdiI6InhseHNxTXBkQTVSZ0pET0h3S2M1TEE9PSIsInZhbHVlIjoiODUweVgweEtNbitlMWtoZmRVVkQrVk9ZcWZSVk9ZRG1pektEd1orVmRMQT0iLCJtYWMiOiI0ZWI2NmVkYzc0NGQ1ZTk3ODI2N2M5ZjhiNTA2YThkZGUxZGVmODQ2NzdkOTI0MTBiY2RjNmNlZjE3MGNlZTQxIiwidGFnIjoiIn0=', 'eyJpdiI6ImQva25HbFN5enJCa3JYT3BMRElhL3c9PSIsInZhbHVlIjoidjJ3VU4rVW83eFhJUEJKYWdhbmtkUT09IiwibWFjIjoiMjMzMmY0MWEwOTNhNGE4ZGRlZTg1ODIxNjU3YWZjMTdlMzRiNzNhOGRiMmU4M2NhYWJkODRlNzQ4NTQ0YzQ1ZSIsInRhZyI6IiJ9', 'ssl', '127.0.0.1', 587, 'eyJpdiI6IngxbEh6SE96M011ZHpNVndTZDZqVVE9PSIsInZhbHVlIjoiRnZkRUdxQ0V2TjFZWTZ5NDdEWE1iK28zSWtnK1lxUFZiR3NjYWhRRm14QT0iLCJtYWMiOiI4ZTIwZmFhYWY2MjA2MTcwZDE0ZDMzMmU1MjEzNTlmZTk2OTNkNDRjMWJkYTI4NmI3YzVlN2U0N2NkMjgyNDFiIiwidGFnIjoiIn0=', 'eyJpdiI6IkRmV3RnMHF6Z1Z2QUdwN3VTa0dobGc9PSIsInZhbHVlIjoiNDJneTFKT0ptOExLMnRHL3hRd2JYUT09IiwibWFjIjoiZDgzNWI3NjFlMmE4OWRkZjdiNTBjNTk5NWMxYjgzNmY5ODY5NDcwMWE5ODljNWRmN2I1NTg5MzEzMGI0YTFmNyIsInRhZyI6IiJ9', 'tls', NULL, NULL, NULL, 'connected', NULL, 1, 0, '{\"INBOX\":{\"last_uid\":1,\"oldest_uid\":1,\"backfill_done\":true},\"Sent\":{\"last_uid\":null}}', '2026-09-30 08:18:03', NULL, '2026-09-30 04:18:58', '2026-09-30 08:18:03', NULL),
(9, '0509eb76-9e59-4516-88aa-a80cc2891eb8', 12, 12, 'zubairfbr@dahimail.com', 'Zubair Bin Shame', 'imap', '127.0.0.1', 993, 'eyJpdiI6IlJzWmxBTWJkMU5YZElva2E5a2hNOGc9PSIsInZhbHVlIjoibjNMNldwSzZEcnZLaTNJblpxZExXT0ltNklzMWkrWXplOElrcW9TK2RVQT0iLCJtYWMiOiI0NjBlNTMxZjI0NTQ4ZGRkZDM2NmEyZmYzMGZhMDJlMGFmYjlhNTJiYTYxNTg2YTZkYmJiMDExM2E3OTQ4YWM2IiwidGFnIjoiIn0=', 'eyJpdiI6IjdrZmtWRFFRR3pzajY1VmxUb3E0cmc9PSIsInZhbHVlIjoiUzJOL0I3cTMrT0pxbHNMVE5VQUdidz09IiwibWFjIjoiODFhODI4ZTE2NWM5Mzc5MTY1ZGE3MzU2MjUxMWYxYTY1NmNmMDg4YTdkYjc1Njk0ZTg5ZmE2ZGNlZGJkMWIxZiIsInRhZyI6IiJ9', 'ssl', '127.0.0.1', 587, 'eyJpdiI6IjhNNkpPeE5JUzl3bDBETlBXc2ozTlE9PSIsInZhbHVlIjoiR1Z6eEhYYXNCNGRLUXRhbVRHVXFLMThhZnQrcElDSGMram9UOER5eHRQST0iLCJtYWMiOiJjNWI4N2M0NmUxOTkxYWRlODJlOTI5MWU3NDE5NTliM2MxYTY1OGRjMmU5ZGU4YWE4MjdhZGZlYWYyY2RkNTNkIiwidGFnIjoiIn0=', 'eyJpdiI6InAxWmp2TUd6bWMyUE9tZjVmekNuTXc9PSIsInZhbHVlIjoibkVMSktJS21WL2l3S0hFR0NiR0N5UT09IiwibWFjIjoiNDcxNTdjMDZlNmM3N2EzNjY1MWVmZmY1MzAzNjkwMDY2YWEyMTkyNmNhY2I1NGNiYTU3ZjIzNWJhNjFmZjg5OCIsInRhZyI6IiJ9', 'tls', NULL, NULL, NULL, 'connected', NULL, 1, 0, '{\"INBOX\":{\"last_uid\":6,\"oldest_uid\":1,\"backfill_done\":true},\"Sent\":{\"last_uid\":null}}', '2026-09-30 15:01:27', NULL, '2026-09-30 11:08:48', '2026-09-30 15:01:27', NULL),
(10, 'fdb663ba-77ed-4588-a513-30248f01f633', 13, 13, 'nawazfbr@dahimail.com', 'MUHAMMAD NAWAZ', 'imap', '127.0.0.1', 993, 'eyJpdiI6IkV3Y08zbUhOR1ZqdkZDSW5OVk1LMFE9PSIsInZhbHVlIjoiZXlNdXB6VlJWT2RhZFdiQmxXMzhPNkdTYVJDRFd2Zzh6ZmR5UFhqSkRuaz0iLCJtYWMiOiI3M2M4NDg2ODFiNzc3YmRkMzQ5Nzk3NDI5YTJhZmNiNmU3NmE5ZTM0NjE2MjE3NzU3YzY1M2YzNzRhNjNmYzdmIiwidGFnIjoiIn0=', 'eyJpdiI6Ik1kbE82bzBHc1h1WXlVSkZwenFxcWc9PSIsInZhbHVlIjoiRFMrVVQwYlVoQk54UjdiMkZkdVl1Zz09IiwibWFjIjoiYTQ2NTg2NmQwMGIwZmViYjYzMDRmYjY5YzE0MTRhZTQwZjlhMDI0NDM2OWJlYzkyY2JkMTU4ZjRhNjU0NzBjYSIsInRhZyI6IiJ9', 'ssl', '127.0.0.1', 587, 'eyJpdiI6ImI1OFgzM214Ym1KU1NjTHdMM2QwSmc9PSIsInZhbHVlIjoiMnRFWUpxRkJFUzhRQnl3TzlLZ245UjhwbnBGc1FFUjJSaERTT243VWYzcz0iLCJtYWMiOiJmZGJkZDU4Y2Y1MjZkZmRkNDBkNzUxMzAyOTdlOTIxYjc1OWQyZTk1NDVjZGNlODAyMzA1M2IxYmRhNDY0NGZhIiwidGFnIjoiIn0=', 'eyJpdiI6InNkOVd1QTMxSFRLTnExcDNMVHZibVE9PSIsInZhbHVlIjoieFZwRitSd1NCVzJoejVwYzZhU0lkdz09IiwibWFjIjoiYzFkMTdhMzJlZjViYjBiMWZlYTYzNjkzNjYxZGJhOTBjYWFiOTY2MTE2NjgxMGJhOGJkMDIxNjkwYjYwZmVmNCIsInRhZyI6IiJ9', 'tls', NULL, NULL, NULL, 'connected', NULL, 1, 0, '{\"INBOX\":{\"last_uid\":3,\"oldest_uid\":1,\"backfill_done\":true},\"Sent\":{\"last_uid\":null}}', '2026-10-01 05:11:35', NULL, '2026-10-01 04:40:05', '2026-10-01 05:11:35', NULL),
(11, '4ae6ef8e-7e86-4abd-8bb4-c21f374f9189', 14, 14, 'umairali@dahimail.com', 'Umair Ali', 'imap', '127.0.0.1', 993, 'eyJpdiI6IkthOHdTVVRxVkFoSW1zYWNJQW1Qa0E9PSIsInZhbHVlIjoiMW5FTGFEWVNKVmNaK0VhUWVKSitGUEhrQ3h0SDlkSERjMnl3cDBKZ2VPaz0iLCJtYWMiOiJmMGNiZTdiZjhmNTJlZmIzMTQ1ZGNkZjRmY2U3NjllMGY4YmJlZWZjMWUwMjgzMTkyNTViMjVkY2Y4MzgxM2JkIiwidGFnIjoiIn0=', 'eyJpdiI6ImlsUHdCOVpTanJDRWxKMVN6ZHJUM0E9PSIsInZhbHVlIjoiYmpqODZoQnNxTnRielBSQlhjOUtEQT09IiwibWFjIjoiMWQ2OTM5NDFjYWY0Y2ZkYWY1ZmE2MTk5OTljNWU1NzA3OTg2MTUyNmVkYTU4OTBmOWY5MjdmYmZiMmFiZGRkMyIsInRhZyI6IiJ9', 'ssl', '127.0.0.1', 587, 'eyJpdiI6IjE2bjZVTzNUMU81YU5wT25HQlR6UEE9PSIsInZhbHVlIjoiOWc3L05EZjlRb3lMUzh1bVJ4TERpcHNpb0oyeTVFU0RCblhoQlZBcjU2RT0iLCJtYWMiOiI0MGE2N2NmZTYyY2M3YWY1YzVlYzRkNWFjMzI1M2UzOTgzYzExMjllODNiN2JmMmJlZDFlZWY4YWU5ZGUwYWE1IiwidGFnIjoiIn0=', 'eyJpdiI6ImkxT0p2THU2UGd0dXdRdnlrMjF4bnc9PSIsInZhbHVlIjoidkVCeXRsRWx6TjlYaFRvWnUzSE9OQT09IiwibWFjIjoiNjlkOGQyNzZjYjg5YTQyY2ZlMzE5NTllOGY4ODY0OThjYTc2ZDc2YmUyNDlkNDc2ZmM4YmY4MjY2ZWVjOWYzMiIsInRhZyI6IiJ9', 'tls', NULL, NULL, NULL, 'connected', NULL, 1, 0, '{\"INBOX\":{\"last_uid\":2,\"oldest_uid\":1,\"backfill_done\":true},\"Sent\":{\"last_uid\":null}}', '2026-10-05 10:40:44', NULL, '2026-10-02 12:05:25', '2026-10-05 10:40:44', NULL),
(12, '455215a1-6405-4d84-954f-a275472eb713', 15, 15, 'zulfiqar@dahimail.com', 'Sardar Zulfiqar Ali Shah', 'imap', '127.0.0.1', 993, 'eyJpdiI6InhwZFRUUHdINXllSlh6ZDliUkhnSHc9PSIsInZhbHVlIjoiVnNjUS9PRFgrQmNPR1JyYnFqejRzZzBtREJTTE9venorRzllK1grOUR3ST0iLCJtYWMiOiJiNWI3MjZiOGNkYTM3ZWUzZGFjNWZkZTkxNjExNTdiODczMWU0YjRkYTc5ZTk4NDBhZjk5ZGZjNmJlYWNhYzhmIiwidGFnIjoiIn0=', 'eyJpdiI6ImZvQ1QyVUFXdC8zNWhtbUlpZ1R0OVE9PSIsInZhbHVlIjoiTzVlNWNMMGlVVCt0NC9CZDRkM1Fvdz09IiwibWFjIjoiZTA2YmRhNjRlN2I5Y2I2M2E2M2JmMTA2YjMyOTY4MjZmNjViM2FjMmM1ODNhOTA0ZGFiNzhiM2E0YmUxMTA5MiIsInRhZyI6IiJ9', 'ssl', '127.0.0.1', 587, 'eyJpdiI6ImpQU0FLNTYrcmRrWE02MWdMVVpIWEE9PSIsInZhbHVlIjoieWdXdnJPdy9VbzQwZHNWMC9WTkdFc2xhdFFjckwxVncwSjhJSVVQbENNYz0iLCJtYWMiOiI5NWZhMGQyNmI2NWQ3M2Q3NjExYzczNGI5ODgxYjc0OWJkZTM1YjI0ZjI5NGQ2YmIxMDZmODM3MWQ0YzFhMjk5IiwidGFnIjoiIn0=', 'eyJpdiI6InNETGUvTXhGS1hSOEJwRVl3NCtnSWc9PSIsInZhbHVlIjoiMG4wR0FXaitDTUl1QnAzSjVzK2lHQT09IiwibWFjIjoiYWVkNGZiOTgyMDkxZTNiYTdjYjVlMjhlZDVlNzE3NmZjZTJjODA2ODZhYjBkMjIwODEzNzlmZjg0ZTk4NzhhMCIsInRhZyI6IiJ9', 'tls', NULL, NULL, NULL, 'connected', NULL, 1, 0, '{\"INBOX\":{\"last_uid\":2,\"oldest_uid\":1,\"backfill_done\":true},\"Sent\":{\"last_uid\":null}}', '2026-10-02 15:09:50', NULL, '2026-10-02 12:25:51', '2026-10-02 15:09:50', NULL),
(13, 'd99b4614-473b-4e87-bf04-665423f9f601', 16, 16, 'zulfiqar1@dahimail.com', 'Zulfiqar', 'imap', '127.0.0.1', 993, 'eyJpdiI6InVyL2loOE5qS2NFNVZ4dm15YWZhOEE9PSIsInZhbHVlIjoiUm9Xc3UzTWJYZlRXa0lBdExLYzU2Vk5XSENIOW1ObEs1dHFQUkpEdXAraz0iLCJtYWMiOiI4M2Q3NTc2ZTlkZGEzOTYwZDU0NTIxMWRjN2I1NzE2MDgwM2RhN2ZmMDNmY2MzYTc1M2FiMzJjYTUxMzcxMTBiIiwidGFnIjoiIn0=', 'eyJpdiI6InFkbHYweUM4d0cya2xydFpSSEZKN1E9PSIsInZhbHVlIjoiek82TVQ5N1hFYmVkYktjMlVsSmlDdz09IiwibWFjIjoiY2Q5YzYyM2JiYmUyNDk3ZTU1MzliNzU0MTFmZTU5MGI3ZjYxYzdjOTA3NmRkNDBlZDQ0YmExZjllYmY4M2NhYyIsInRhZyI6IiJ9', 'ssl', '127.0.0.1', 587, 'eyJpdiI6IkE5enBPSEdZOFM4ZWtMSTZCN01pcEE9PSIsInZhbHVlIjoiNVY1UHR6eE5UTUJmNmh3TWlCcUtGOWhqbk1NNW5XT2o5RmdrY3ptZkQ1OD0iLCJtYWMiOiI5MjU2ZWM1ZTYyOTlkMWM1OGI0ZmQ1YTZlZDZjZTJmOTg3MDY4NjE3OWU2ZmRjYjZiZGY0YmRlM2Y0MWJiZTBlIiwidGFnIjoiIn0=', 'eyJpdiI6Ik5BOXpaOTlSQjlab1Z6Qys2dEFGb1E9PSIsInZhbHVlIjoiMVp2U0hFTVB3ZXRWd09uQmRlTkJ0dz09IiwibWFjIjoiZDc0NjMxNDM1MGQ4NDA0ODJhZmU1MGFhYTE3NDUwYzcxYzY4MGU0MWE5M2JmZWQ4YzU3MjUyMDAyYWZiM2ZiOSIsInRhZyI6IiJ9', 'tls', NULL, NULL, NULL, 'connected', NULL, 1, 0, '{\"INBOX\":{\"last_uid\":1,\"oldest_uid\":1,\"backfill_done\":true},\"Sent\":{\"last_uid\":null}}', '2026-10-02 15:04:35', NULL, '2026-10-02 12:53:00', '2026-10-02 15:04:35', NULL),
(14, '689cc89c-81d7-4e77-beae-4df60d7ccf8b', 17, 17, 'rukhsanafbr@dahimail.com', 'Rukhsana', 'imap', '127.0.0.1', 993, 'eyJpdiI6IkZyYUpiZzNjakVZdTlraWlOR0dlNEE9PSIsInZhbHVlIjoiMWJCYmMzYWZNbVBXOWZwN0tqMGVCZzZkYWZXcGlYODBmZEJVWnJrNWtJWT0iLCJtYWMiOiJmNWQzY2FhODVkZjM5NmQzNGU5ZTMyYjdlMWM4NGMwMjgwNWM4N2RlMjk5ZjRhNjY3MGNmYWU4MDIyZjczNjExIiwidGFnIjoiIn0=', 'eyJpdiI6IkpnRUc3dEJLdWdvRUp5TERHV0hieGc9PSIsInZhbHVlIjoiR2xLMitLcUlQUytkT3k1bmc3SzdiZz09IiwibWFjIjoiYzNjZTRlOWZhNmJlYTRkMTYzOWFlZjJjNDVjYzk4ZGUzZGVkNWM5NWVjMjlhZWNmY2RmMjEzZGJjMzc2NmNkMSIsInRhZyI6IiJ9', 'ssl', '127.0.0.1', 587, 'eyJpdiI6IlRHaEdyM2crUFUvbXk3bGIzK1lOOGc9PSIsInZhbHVlIjoid3BNR3R1ZnFaUU9HVTRvSGc3a2IzbWJWZit0VVA5MVk1OHZhZnlLNEswZz0iLCJtYWMiOiIzY2NkMDgxYzA4MDZiNjg4OTkyZjk4ODE1ZTVhZTE4OGY3N2YxMThiMzg5OGU1YjdmODk0MjUzM2QxNmJjNTg5IiwidGFnIjoiIn0=', 'eyJpdiI6IkNYRWlEVnNET01ZWWo2dVoyNFpKd2c9PSIsInZhbHVlIjoiRUNkbXZUWmJmNFliV1lhZDNyT25zZz09IiwibWFjIjoiZTdmNmRmN2IwYjQ4MDhhYTI0NTBkMDI3NTFmMThkMDdlNGZkYzYxZTgzMjQyYjcyZTU4M2MzOWI0ODU2Mjg5NiIsInRhZyI6IiJ9', 'tls', NULL, NULL, NULL, 'connected', NULL, 1, 0, '{\"INBOX\":{\"last_uid\":3,\"oldest_uid\":1,\"backfill_done\":true},\"Sent\":{\"last_uid\":null}}', '2026-10-05 09:44:51', NULL, '2026-10-05 08:05:34', '2026-10-05 09:44:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_signatures`
--

CREATE TABLE `email_signatures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email_account_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_html` text NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `append_to_new` tinyint(1) NOT NULL DEFAULT 1,
  `append_to_replies` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_suppressions`
--

CREATE TABLE `email_suppressions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `reason` enum('hard_bounce','spam_complaint','unsubscribe','manual') NOT NULL DEFAULT 'manual',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `blocks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`blocks`)),
  `thumbnail_path` varchar(255) DEFAULT NULL,
  `category` varchar(50) NOT NULL DEFAULT 'general',
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `usage_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `workspace_id`, `name`, `blocks`, `thumbnail_path`, `category`, `is_default`, `usage_count`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'Welcome Email', '[{\"type\":\"header\",\"data\":{\"logo_url\":\"\",\"company_name\":\"{company}\",\"bg_color\":\"#6366F1\"}},{\"type\":\"spacer\",\"data\":{\"height\":\"12\"}},{\"type\":\"text\",\"data\":{\"content\":\"<h2 style=\\\"margin:0 0 16px 0;color:#1E293B;\\\">Welcome aboard, {first_name}!<\\/h2><p style=\\\"margin:0 0 12px 0;color:#475569;\\\">We are thrilled to have you join us. Your account is ready and waiting for you to explore everything we have to offer.<\\/p><p style=\\\"margin:0;color:#475569;\\\">Here is what you can do to get started:<\\/p>\",\"align\":\"left\",\"font_size\":\"16\"}},{\"type\":\"columns\",\"data\":{\"left_content\":\"<p style=\\\"margin:0 0 6px 0;font-weight:700;color:#6366F1;\\\">1. Complete your profile<\\/p><p style=\\\"margin:0;font-size:14px;color:#64748B;\\\">Add your details so your team can find and connect with you easily.<\\/p>\",\"right_content\":\"<p style=\\\"margin:0 0 6px 0;font-weight:700;color:#6366F1;\\\">2. Explore the dashboard<\\/p><p style=\\\"margin:0;font-size:14px;color:#64748B;\\\">Your dashboard gives you a clear view of all your activity at a glance.<\\/p>\"}},{\"type\":\"button\",\"data\":{\"text\":\"Go to Your Dashboard\",\"url\":\"https:\\/\\/example.com\\/dashboard\",\"bg_color\":\"#6366F1\",\"text_color\":\"#FFFFFF\",\"align\":\"center\"}},{\"type\":\"divider\",\"data\":{\"color\":\"#E5E7EB\",\"width\":\"80\",\"style\":\"solid\"}},{\"type\":\"text\",\"data\":{\"content\":\"<p style=\\\"margin:0;font-size:14px;color:#94A3B8;\\\">Need a hand getting started? Reply to this email or reach out to our support team at any time. We are here to help.<\\/p>\",\"align\":\"center\",\"font_size\":\"14\"}},{\"type\":\"footer\",\"data\":{\"text\":\"{company} | 123 Business Street, Suite 100\",\"unsubscribe_text\":\"Unsubscribe from these emails\"}}]', NULL, 'onboarding', 1, 0, '2026-09-27 08:25:22', '2026-09-27 08:25:22', NULL),
(2, NULL, 'Newsletter', '[{\"type\":\"header\",\"data\":{\"logo_url\":\"\",\"company_name\":\"{company} Newsletter\",\"bg_color\":\"#1E293B\"}},{\"type\":\"image\",\"data\":{\"src\":\"https:\\/\\/placehold.co\\/600x250\\/6366F1\\/FFFFFF?text=Featured+Story\",\"alt\":\"Featured story banner\",\"width\":\"100\",\"link_url\":\"\"}},{\"type\":\"text\",\"data\":{\"content\":\"<h2 style=\\\"margin:0 0 12px 0;color:#1E293B;\\\">This Month at {company}<\\/h2><p style=\\\"margin:0 0 8px 0;color:#475569;\\\">Hi {first_name}, here is a roundup of the latest news, tips, and updates from our team. We have been busy building new features and writing guides to help you succeed.<\\/p>\",\"align\":\"left\",\"font_size\":\"16\"}},{\"type\":\"divider\",\"data\":{\"color\":\"#E5E7EB\",\"width\":\"100\",\"style\":\"solid\"}},{\"type\":\"columns\",\"data\":{\"left_content\":\"<h3 style=\\\"margin:0 0 8px 0;color:#6366F1;\\\">Product Update<\\/h3><p style=\\\"margin:0;font-size:14px;color:#64748B;\\\">We launched a brand new dashboard with real-time analytics, custom widgets, and faster reporting tools.<\\/p>\",\"right_content\":\"<h3 style=\\\"margin:0 0 8px 0;color:#6366F1;\\\">Quick Tip<\\/h3><p style=\\\"margin:0;font-size:14px;color:#64748B;\\\">Did you know you can automate your weekly reports? Check out our new scheduling guide to save hours every week.<\\/p>\"}},{\"type\":\"divider\",\"data\":{\"color\":\"#E5E7EB\",\"width\":\"100\",\"style\":\"solid\"}},{\"type\":\"columns\",\"data\":{\"left_content\":\"<h3 style=\\\"margin:0 0 8px 0;color:#6366F1;\\\">From the Blog<\\/h3><p style=\\\"margin:0;font-size:14px;color:#64748B;\\\">Our latest post covers five strategies for improving your open rates by up to 40%. A must-read for marketers.<\\/p>\",\"right_content\":\"<h3 style=\\\"margin:0 0 8px 0;color:#6366F1;\\\">Community Spotlight<\\/h3><p style=\\\"margin:0;font-size:14px;color:#64748B;\\\">See how Acme Corp increased engagement by 3x using our segmentation tools. Read the full case study.<\\/p>\"}},{\"type\":\"button\",\"data\":{\"text\":\"Read More on Our Blog\",\"url\":\"https:\\/\\/example.com\\/blog\",\"bg_color\":\"#6366F1\",\"text_color\":\"#FFFFFF\",\"align\":\"center\"}},{\"type\":\"social\",\"data\":{\"links\":[{\"platform\":\"twitter\",\"url\":\"https:\\/\\/twitter.com\\/example\"},{\"platform\":\"linkedin\",\"url\":\"https:\\/\\/linkedin.com\\/company\\/example\"},{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\\/example\"}]}},{\"type\":\"footer\",\"data\":{\"text\":\"{company} | 123 Business Street, Suite 100\",\"unsubscribe_text\":\"Unsubscribe | Manage Preferences\"}}]', NULL, 'newsletter', 1, 0, '2026-09-27 08:25:22', '2026-09-27 08:25:22', NULL),
(3, NULL, 'Product Announcement', '[{\"type\":\"header\",\"data\":{\"logo_url\":\"\",\"company_name\":\"{company}\",\"bg_color\":\"#6366F1\"}},{\"type\":\"image\",\"data\":{\"src\":\"https:\\/\\/placehold.co\\/600x300\\/6366F1\\/FFFFFF?text=Introducing+Our+Latest+Product\",\"alt\":\"Product announcement hero image\",\"width\":\"100\",\"link_url\":\"\"}},{\"type\":\"text\",\"data\":{\"content\":\"<h2 style=\\\"margin:0 0 16px 0;color:#1E293B;\\\">Introducing something we have been working on<\\/h2><p style=\\\"margin:0 0 12px 0;color:#475569;\\\">Hi {first_name},<\\/p><p style=\\\"margin:0 0 12px 0;color:#475569;\\\">We are excited to share our newest product with you. After months of development and testing with early users, it is finally ready for everyone.<\\/p><p style=\\\"margin:0;color:#475569;\\\">Here is what makes it special:<\\/p>\",\"align\":\"left\",\"font_size\":\"16\"}},{\"type\":\"columns\",\"data\":{\"left_content\":\"<p style=\\\"margin:0 0 6px 0;font-weight:700;color:#6366F1;\\\">Lightning fast<\\/p><p style=\\\"margin:0;font-size:14px;color:#64748B;\\\">Built from the ground up for performance. Load times are up to 10x faster than before.<\\/p>\",\"right_content\":\"<p style=\\\"margin:0 0 6px 0;font-weight:700;color:#6366F1;\\\">Beautifully simple<\\/p><p style=\\\"margin:0;font-size:14px;color:#64748B;\\\">A redesigned interface that puts the most important actions right at your fingertips.<\\/p>\"}},{\"type\":\"columns\",\"data\":{\"left_content\":\"<p style=\\\"margin:0 0 6px 0;font-weight:700;color:#6366F1;\\\">Powerful integrations<\\/p><p style=\\\"margin:0;font-size:14px;color:#64748B;\\\">Connects seamlessly with the tools you already use, from Slack to Salesforce.<\\/p>\",\"right_content\":\"<p style=\\\"margin:0 0 6px 0;font-weight:700;color:#6366F1;\\\">Enterprise ready<\\/p><p style=\\\"margin:0;font-size:14px;color:#64748B;\\\">SOC 2 compliant with SSO, role-based access, and audit logging built in.<\\/p>\"}},{\"type\":\"button\",\"data\":{\"text\":\"See It in Action\",\"url\":\"https:\\/\\/example.com\\/product\\/new\",\"bg_color\":\"#6366F1\",\"text_color\":\"#FFFFFF\",\"align\":\"center\"}},{\"type\":\"footer\",\"data\":{\"text\":\"{company} | 123 Business Street, Suite 100\",\"unsubscribe_text\":\"Unsubscribe from product updates\"}}]', NULL, 'marketing', 1, 0, '2026-09-27 08:25:22', '2026-09-27 08:25:22', NULL),
(4, NULL, 'Flash Sale', '[{\"type\":\"header\",\"data\":{\"logo_url\":\"\",\"company_name\":\"{company}\",\"bg_color\":\"#DC2626\"}},{\"type\":\"image\",\"data\":{\"src\":\"https:\\/\\/placehold.co\\/600x280\\/DC2626\\/FFFFFF?text=FLASH+SALE\",\"alt\":\"Flash sale banner\",\"width\":\"100\",\"link_url\":\"https:\\/\\/example.com\\/sale\"}},{\"type\":\"text\",\"data\":{\"content\":\"<h2 style=\\\"margin:0 0 8px 0;color:#DC2626;text-align:center;\\\">Limited Time: Save Big Today<\\/h2><p style=\\\"margin:0 0 12px 0;color:#475569;text-align:center;\\\">Hey {first_name}, we have an exclusive deal just for you. For the next 48 hours, enjoy significant savings across all plans. This is our biggest discount of the year.<\\/p>\",\"align\":\"center\",\"font_size\":\"16\"}},{\"type\":\"columns\",\"data\":{\"left_content\":\"<div style=\\\"text-align:center;padding:16px;background:#FEF2F2;border-radius:8px;\\\"><p style=\\\"margin:0 0 4px 0;font-size:13px;color:#991B1B;text-transform:uppercase;font-weight:600;\\\">Starter Plan<\\/p><p style=\\\"margin:0;font-size:28px;font-weight:700;color:#DC2626;\\\"><s style=\\\"font-size:18px;color:#94A3B8;\\\">$29<\\/s> $14\\/mo<\\/p><\\/div>\",\"right_content\":\"<div style=\\\"text-align:center;padding:16px;background:#FEF2F2;border-radius:8px;\\\"><p style=\\\"margin:0 0 4px 0;font-size:13px;color:#991B1B;text-transform:uppercase;font-weight:600;\\\">Pro Plan<\\/p><p style=\\\"margin:0;font-size:28px;font-weight:700;color:#DC2626;\\\"><s style=\\\"font-size:18px;color:#94A3B8;\\\">$79<\\/s> $39\\/mo<\\/p><\\/div>\"}},{\"type\":\"button\",\"data\":{\"text\":\"Claim Your Discount Now\",\"url\":\"https:\\/\\/example.com\\/pricing?promo=FLASH\",\"bg_color\":\"#DC2626\",\"text_color\":\"#FFFFFF\",\"align\":\"center\"}},{\"type\":\"text\",\"data\":{\"content\":\"<p style=\\\"margin:0;font-size:13px;color:#94A3B8;text-align:center;\\\">Offer ends in 48 hours. Cannot be combined with other promotions. Terms apply.<\\/p>\",\"align\":\"center\",\"font_size\":\"13\"}},{\"type\":\"footer\",\"data\":{\"text\":\"{company} | 123 Business Street, Suite 100\",\"unsubscribe_text\":\"Unsubscribe from promotional emails\"}}]', NULL, 'marketing', 1, 0, '2026-09-27 08:25:22', '2026-09-27 08:25:22', NULL),
(5, NULL, 'Abandoned Cart', '[{\"type\":\"header\",\"data\":{\"logo_url\":\"\",\"company_name\":\"{company}\",\"bg_color\":\"#6366F1\"}},{\"type\":\"spacer\",\"data\":{\"height\":\"12\"}},{\"type\":\"text\",\"data\":{\"content\":\"<h2 style=\\\"margin:0 0 16px 0;color:#1E293B;text-align:center;\\\">You left something behind<\\/h2><p style=\\\"margin:0 0 12px 0;color:#475569;\\\">Hi {first_name},<\\/p><p style=\\\"margin:0 0 12px 0;color:#475569;\\\">It looks like you started exploring our plans but did not finish. No worries, your selection is still saved and ready for you.<\\/p><p style=\\\"margin:0;color:#475569;\\\">If you had any questions or ran into an issue, we are happy to help. Just reply to this email.<\\/p>\",\"align\":\"left\",\"font_size\":\"16\"}},{\"type\":\"divider\",\"data\":{\"color\":\"#E5E7EB\",\"width\":\"80\",\"style\":\"solid\"}},{\"type\":\"text\",\"data\":{\"content\":\"<table role=\\\"presentation\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" border=\\\"0\\\" width=\\\"100%\\\" style=\\\"background:#F8FAFC;border-radius:8px;padding:0;\\\"><tr><td style=\\\"padding:20px;\\\"><p style=\\\"margin:0 0 4px 0;font-weight:700;color:#1E293B;\\\">Your saved selection<\\/p><p style=\\\"margin:0 0 4px 0;font-size:14px;color:#64748B;\\\">Pro Plan &mdash; Monthly<\\/p><p style=\\\"margin:0;font-size:20px;font-weight:700;color:#6366F1;\\\">$79\\/month<\\/p><\\/td><\\/tr><\\/table>\",\"align\":\"left\",\"font_size\":\"16\"}},{\"type\":\"button\",\"data\":{\"text\":\"Complete Your Purchase\",\"url\":\"https:\\/\\/example.com\\/checkout\\/resume\",\"bg_color\":\"#6366F1\",\"text_color\":\"#FFFFFF\",\"align\":\"center\"}},{\"type\":\"text\",\"data\":{\"content\":\"<p style=\\\"margin:0;font-size:14px;color:#94A3B8;text-align:center;\\\">Your cart will be held for 7 days. After that, you can always start fresh.<\\/p>\",\"align\":\"center\",\"font_size\":\"14\"}},{\"type\":\"footer\",\"data\":{\"text\":\"{company} | 123 Business Street, Suite 100\",\"unsubscribe_text\":\"Unsubscribe from these emails\"}}]', NULL, 'marketing', 1, 0, '2026-09-27 08:25:22', '2026-09-27 08:25:22', NULL),
(6, NULL, 'Thank You', '[{\"type\":\"header\",\"data\":{\"logo_url\":\"\",\"company_name\":\"{company}\",\"bg_color\":\"#059669\"}},{\"type\":\"text\",\"data\":{\"content\":\"<h2 style=\\\"margin:0 0 16px 0;color:#059669;text-align:center;\\\">Thank you for your purchase!<\\/h2><p style=\\\"margin:0 0 12px 0;color:#475569;\\\">Hi {first_name},<\\/p><p style=\\\"margin:0 0 12px 0;color:#475569;\\\">Your order has been confirmed and is being processed. We truly appreciate your business and are committed to delivering the best possible experience.<\\/p>\",\"align\":\"left\",\"font_size\":\"16\"}},{\"type\":\"divider\",\"data\":{\"color\":\"#E5E7EB\",\"width\":\"100\",\"style\":\"solid\"}},{\"type\":\"text\",\"data\":{\"content\":\"<table role=\\\"presentation\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" border=\\\"0\\\" width=\\\"100%\\\" style=\\\"background:#F0FDF4;border-radius:8px;\\\"><tr><td style=\\\"padding:20px;\\\"><p style=\\\"margin:0 0 12px 0;font-weight:700;color:#1E293B;\\\">Order Summary<\\/p><table role=\\\"presentation\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" border=\\\"0\\\" width=\\\"100%\\\"><tr><td style=\\\"padding:4px 0;font-size:14px;color:#475569;\\\">Plan: Pro (Annual)<\\/td><td style=\\\"padding:4px 0;font-size:14px;color:#475569;text-align:right;\\\">$790.00<\\/td><\\/tr><tr><td style=\\\"padding:4px 0;font-size:14px;color:#475569;\\\">Discount<\\/td><td style=\\\"padding:4px 0;font-size:14px;color:#059669;text-align:right;\\\">-$79.00<\\/td><\\/tr><tr><td style=\\\"padding:8px 0 0 0;font-size:16px;font-weight:700;color:#1E293B;border-top:1px solid #D1FAE5;\\\">Total<\\/td><td style=\\\"padding:8px 0 0 0;font-size:16px;font-weight:700;color:#1E293B;text-align:right;border-top:1px solid #D1FAE5;\\\">$711.00<\\/td><\\/tr><\\/table><\\/td><\\/tr><\\/table>\",\"align\":\"left\",\"font_size\":\"16\"}},{\"type\":\"button\",\"data\":{\"text\":\"View Your Account\",\"url\":\"https:\\/\\/example.com\\/account\",\"bg_color\":\"#059669\",\"text_color\":\"#FFFFFF\",\"align\":\"center\"}},{\"type\":\"text\",\"data\":{\"content\":\"<p style=\\\"margin:0;font-size:14px;color:#94A3B8;text-align:center;\\\">Questions about your order? Contact us at support@example.com and we will be happy to help.<\\/p>\",\"align\":\"center\",\"font_size\":\"14\"}},{\"type\":\"footer\",\"data\":{\"text\":\"{company} | 123 Business Street, Suite 100\",\"unsubscribe_text\":\"Unsubscribe from these emails\"}}]', NULL, 'transactional', 1, 0, '2026-09-27 08:25:22', '2026-09-27 08:25:22', NULL),
(7, NULL, 'Feedback Request', '[{\"type\":\"header\",\"data\":{\"logo_url\":\"\",\"company_name\":\"{company}\",\"bg_color\":\"#6366F1\"}},{\"type\":\"spacer\",\"data\":{\"height\":\"12\"}},{\"type\":\"text\",\"data\":{\"content\":\"<h2 style=\\\"margin:0 0 16px 0;color:#1E293B;text-align:center;\\\">How was your experience?<\\/h2><p style=\\\"margin:0 0 12px 0;color:#475569;\\\">Hi {first_name},<\\/p><p style=\\\"margin:0 0 12px 0;color:#475569;\\\">You have been using {company} for a while now, and your opinion matters a lot to us. We would love to hear how things are going and where we can improve.<\\/p><p style=\\\"margin:0;color:#475569;\\\">It takes less than 2 minutes and helps us build a better product for you.<\\/p>\",\"align\":\"left\",\"font_size\":\"16\"}},{\"type\":\"divider\",\"data\":{\"color\":\"#E5E7EB\",\"width\":\"80\",\"style\":\"solid\"}},{\"type\":\"text\",\"data\":{\"content\":\"<p style=\\\"margin:0 0 12px 0;color:#475569;text-align:center;font-weight:600;\\\">On a scale of 0-10, how likely are you to recommend {company} to a colleague?<\\/p><table role=\\\"presentation\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" border=\\\"0\\\" align=\\\"center\\\" style=\\\"margin:0 auto;\\\"><tr><td style=\\\"padding:4px;\\\"><a href=\\\"https:\\/\\/example.com\\/nps?score=0\\\" style=\\\"display:inline-block;width:32px;height:32px;line-height:32px;text-align:center;background:#FEF2F2;color:#DC2626;border-radius:6px;text-decoration:none;font-weight:600;font-size:13px;\\\">0<\\/a><\\/td><td style=\\\"padding:4px;\\\"><a href=\\\"https:\\/\\/example.com\\/nps?score=1\\\" style=\\\"display:inline-block;width:32px;height:32px;line-height:32px;text-align:center;background:#FEF2F2;color:#DC2626;border-radius:6px;text-decoration:none;font-weight:600;font-size:13px;\\\">1<\\/a><\\/td><td style=\\\"padding:4px;\\\"><a href=\\\"https:\\/\\/example.com\\/nps?score=2\\\" style=\\\"display:inline-block;width:32px;height:32px;line-height:32px;text-align:center;background:#FEF2F2;color:#DC2626;border-radius:6px;text-decoration:none;font-weight:600;font-size:13px;\\\">2<\\/a><\\/td><td style=\\\"padding:4px;\\\"><a href=\\\"https:\\/\\/example.com\\/nps?score=3\\\" style=\\\"display:inline-block;width:32px;height:32px;line-height:32px;text-align:center;background:#FEF2F2;color:#DC2626;border-radius:6px;text-decoration:none;font-weight:600;font-size:13px;\\\">3<\\/a><\\/td><td style=\\\"padding:4px;\\\"><a href=\\\"https:\\/\\/example.com\\/nps?score=4\\\" style=\\\"display:inline-block;width:32px;height:32px;line-height:32px;text-align:center;background:#FEF2F2;color:#DC2626;border-radius:6px;text-decoration:none;font-weight:600;font-size:13px;\\\">4<\\/a><\\/td><td style=\\\"padding:4px;\\\"><a href=\\\"https:\\/\\/example.com\\/nps?score=5\\\" style=\\\"display:inline-block;width:32px;height:32px;line-height:32px;text-align:center;background:#FFF7ED;color:#EA580C;border-radius:6px;text-decoration:none;font-weight:600;font-size:13px;\\\">5<\\/a><\\/td><td style=\\\"padding:4px;\\\"><a href=\\\"https:\\/\\/example.com\\/nps?score=6\\\" style=\\\"display:inline-block;width:32px;height:32px;line-height:32px;text-align:center;background:#FFF7ED;color:#EA580C;border-radius:6px;text-decoration:none;font-weight:600;font-size:13px;\\\">6<\\/a><\\/td><td style=\\\"padding:4px;\\\"><a href=\\\"https:\\/\\/example.com\\/nps?score=7\\\" style=\\\"display:inline-block;width:32px;height:32px;line-height:32px;text-align:center;background:#ECFDF5;color:#059669;border-radius:6px;text-decoration:none;font-weight:600;font-size:13px;\\\">7<\\/a><\\/td><td style=\\\"padding:4px;\\\"><a href=\\\"https:\\/\\/example.com\\/nps?score=8\\\" style=\\\"display:inline-block;width:32px;height:32px;line-height:32px;text-align:center;background:#ECFDF5;color:#059669;border-radius:6px;text-decoration:none;font-weight:600;font-size:13px;\\\">8<\\/a><\\/td><td style=\\\"padding:4px;\\\"><a href=\\\"https:\\/\\/example.com\\/nps?score=9\\\" style=\\\"display:inline-block;width:32px;height:32px;line-height:32px;text-align:center;background:#ECFDF5;color:#059669;border-radius:6px;text-decoration:none;font-weight:600;font-size:13px;\\\">9<\\/a><\\/td><td style=\\\"padding:4px;\\\"><a href=\\\"https:\\/\\/example.com\\/nps?score=10\\\" style=\\\"display:inline-block;width:32px;height:32px;line-height:32px;text-align:center;background:#ECFDF5;color:#059669;border-radius:6px;text-decoration:none;font-weight:600;font-size:13px;\\\">10<\\/a><\\/td><\\/tr><\\/table><table role=\\\"presentation\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" border=\\\"0\\\" width=\\\"100%\\\" style=\\\"margin-top:4px;\\\"><tr><td style=\\\"font-size:11px;color:#94A3B8;text-align:left;\\\">Not likely<\\/td><td style=\\\"font-size:11px;color:#94A3B8;text-align:right;\\\">Very likely<\\/td><\\/tr><\\/table>\",\"align\":\"center\",\"font_size\":\"14\"}},{\"type\":\"button\",\"data\":{\"text\":\"Share Detailed Feedback\",\"url\":\"https:\\/\\/example.com\\/feedback\",\"bg_color\":\"#6366F1\",\"text_color\":\"#FFFFFF\",\"align\":\"center\"}},{\"type\":\"footer\",\"data\":{\"text\":\"{company} | 123 Business Street, Suite 100\",\"unsubscribe_text\":\"Unsubscribe from these emails\"}}]', NULL, 'engagement', 1, 0, '2026-09-27 08:25:22', '2026-09-27 08:25:22', NULL),
(8, NULL, 'Re-engagement', '[{\"type\":\"header\",\"data\":{\"logo_url\":\"\",\"company_name\":\"{company}\",\"bg_color\":\"#6366F1\"}},{\"type\":\"spacer\",\"data\":{\"height\":\"12\"}},{\"type\":\"text\",\"data\":{\"content\":\"<h2 style=\\\"margin:0 0 16px 0;color:#1E293B;text-align:center;\\\">We miss you, {first_name}<\\/h2><p style=\\\"margin:0 0 12px 0;color:#475569;\\\">It has been a while since we last saw you, and a lot has changed. We have shipped some exciting updates that we think you will love.<\\/p>\",\"align\":\"left\",\"font_size\":\"16\"}},{\"type\":\"text\",\"data\":{\"content\":\"<table role=\\\"presentation\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" border=\\\"0\\\" width=\\\"100%\\\"><tr><td style=\\\"padding:12px 0;border-bottom:1px solid #F1F5F9;\\\"><table role=\\\"presentation\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" border=\\\"0\\\"><tr><td style=\\\"padding-right:12px;vertical-align:top;font-size:24px;\\\">1<\\/td><td><p style=\\\"margin:0 0 2px 0;font-weight:700;color:#1E293B;\\\">Redesigned dashboard<\\/p><p style=\\\"margin:0;font-size:14px;color:#64748B;\\\">Cleaner layout, faster load times, and customizable widgets.<\\/p><\\/td><\\/tr><\\/table><\\/td><\\/tr><tr><td style=\\\"padding:12px 0;border-bottom:1px solid #F1F5F9;\\\"><table role=\\\"presentation\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" border=\\\"0\\\"><tr><td style=\\\"padding-right:12px;vertical-align:top;font-size:24px;\\\">2<\\/td><td><p style=\\\"margin:0 0 2px 0;font-weight:700;color:#1E293B;\\\">Advanced automation<\\/p><p style=\\\"margin:0;font-size:14px;color:#64748B;\\\">Set up complex workflows in minutes with our visual builder.<\\/p><\\/td><\\/tr><\\/table><\\/td><\\/tr><tr><td style=\\\"padding:12px 0;\\\"><table role=\\\"presentation\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" border=\\\"0\\\"><tr><td style=\\\"padding-right:12px;vertical-align:top;font-size:24px;\\\">3<\\/td><td><p style=\\\"margin:0 0 2px 0;font-weight:700;color:#1E293B;\\\">Better analytics<\\/p><p style=\\\"margin:0;font-size:14px;color:#64748B;\\\">New engagement insights that show what is working and what is not.<\\/p><\\/td><\\/tr><\\/table><\\/td><\\/tr><\\/table>\",\"align\":\"left\",\"font_size\":\"16\"}},{\"type\":\"button\",\"data\":{\"text\":\"Come See What Is New\",\"url\":\"https:\\/\\/example.com\\/dashboard\",\"bg_color\":\"#6366F1\",\"text_color\":\"#FFFFFF\",\"align\":\"center\"}},{\"type\":\"text\",\"data\":{\"content\":\"<p style=\\\"margin:0;font-size:14px;color:#94A3B8;text-align:center;\\\">Not interested anymore? No hard feelings. You can unsubscribe below and we will stop reaching out.<\\/p>\",\"align\":\"center\",\"font_size\":\"14\"}},{\"type\":\"footer\",\"data\":{\"text\":\"{company} | 123 Business Street, Suite 100\",\"unsubscribe_text\":\"Unsubscribe from these emails\"}}]', NULL, 'engagement', 1, 0, '2026-09-27 08:25:22', '2026-09-27 08:25:22', NULL),
(9, NULL, 'Event Invitation', '[{\"type\":\"header\",\"data\":{\"logo_url\":\"\",\"company_name\":\"{company}\",\"bg_color\":\"#7C3AED\"}},{\"type\":\"image\",\"data\":{\"src\":\"https:\\/\\/placehold.co\\/600x280\\/7C3AED\\/FFFFFF?text=You%27re+Invited\",\"alt\":\"Event invitation banner\",\"width\":\"100\",\"link_url\":\"\"}},{\"type\":\"text\",\"data\":{\"content\":\"<h2 style=\\\"margin:0 0 16px 0;color:#1E293B;text-align:center;\\\">You are invited, {first_name}<\\/h2><p style=\\\"margin:0 0 12px 0;color:#475569;\\\">Join us for an exclusive live session where we will showcase our latest innovations, share actionable insights, and answer your questions in real time.<\\/p>\",\"align\":\"left\",\"font_size\":\"16\"}},{\"type\":\"columns\",\"data\":{\"left_content\":\"<table role=\\\"presentation\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" border=\\\"0\\\" width=\\\"100%\\\" style=\\\"background:#F5F3FF;border-radius:8px;\\\"><tr><td style=\\\"padding:16px;text-align:center;\\\"><p style=\\\"margin:0 0 4px 0;font-weight:700;color:#7C3AED;font-size:13px;text-transform:uppercase;\\\">Date & Time<\\/p><p style=\\\"margin:0;font-size:14px;color:#475569;\\\">April 10, 2026<br>2:00 PM - 4:00 PM EST<\\/p><\\/td><\\/tr><\\/table>\",\"right_content\":\"<table role=\\\"presentation\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" border=\\\"0\\\" width=\\\"100%\\\" style=\\\"background:#F5F3FF;border-radius:8px;\\\"><tr><td style=\\\"padding:16px;text-align:center;\\\"><p style=\\\"margin:0 0 4px 0;font-weight:700;color:#7C3AED;font-size:13px;text-transform:uppercase;\\\">Location<\\/p><p style=\\\"margin:0;font-size:14px;color:#475569;\\\">Online Webinar<br>Link sent upon registration<\\/p><\\/td><\\/tr><\\/table>\"}},{\"type\":\"text\",\"data\":{\"content\":\"<p style=\\\"margin:0 0 8px 0;font-weight:700;color:#1E293B;\\\">What you will learn:<\\/p><p style=\\\"margin:0 0 4px 0;font-size:14px;color:#475569;\\\">&#8226; How top teams are using automation to scale faster<\\/p><p style=\\\"margin:0 0 4px 0;font-size:14px;color:#475569;\\\">&#8226; A live demo of our newest features<\\/p><p style=\\\"margin:0;font-size:14px;color:#475569;\\\">&#8226; Q&A with our product and engineering leads<\\/p>\",\"align\":\"left\",\"font_size\":\"16\"}},{\"type\":\"button\",\"data\":{\"text\":\"Reserve Your Spot\",\"url\":\"https:\\/\\/example.com\\/events\\/register\",\"bg_color\":\"#7C3AED\",\"text_color\":\"#FFFFFF\",\"align\":\"center\"}},{\"type\":\"text\",\"data\":{\"content\":\"<p style=\\\"margin:0;font-size:13px;color:#94A3B8;text-align:center;\\\">Spots are limited. Register now to guarantee your seat. A calendar invite and join link will be sent after registration.<\\/p>\",\"align\":\"center\",\"font_size\":\"13\"}},{\"type\":\"social\",\"data\":{\"links\":[{\"platform\":\"twitter\",\"url\":\"https:\\/\\/twitter.com\\/example\"},{\"platform\":\"linkedin\",\"url\":\"https:\\/\\/linkedin.com\\/company\\/example\"},{\"platform\":\"instagram\",\"url\":\"https:\\/\\/instagram.com\\/example\"}]}},{\"type\":\"footer\",\"data\":{\"text\":\"{company} | 123 Business Street, Suite 100\",\"unsubscribe_text\":\"Unsubscribe | View in browser\"}}]', NULL, 'events', 1, 0, '2026-09-27 08:25:22', '2026-09-27 08:25:22', NULL),
(10, NULL, 'Monthly Report', '[{\"type\":\"header\",\"data\":{\"logo_url\":\"\",\"company_name\":\"{company}\",\"bg_color\":\"#1E293B\"}},{\"type\":\"text\",\"data\":{\"content\":\"<h2 style=\\\"margin:0 0 8px 0;color:#1E293B;text-align:center;\\\">Your Monthly Summary<\\/h2><p style=\\\"margin:0;color:#64748B;text-align:center;font-size:14px;\\\">Here is how things went this past month, {first_name}.<\\/p>\",\"align\":\"center\",\"font_size\":\"16\"}},{\"type\":\"columns\",\"data\":{\"left_content\":\"<table role=\\\"presentation\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" border=\\\"0\\\" width=\\\"100%\\\" style=\\\"background:#EEF2FF;border-radius:8px;\\\"><tr><td style=\\\"padding:20px;text-align:center;\\\"><p style=\\\"margin:0;font-size:32px;font-weight:700;color:#6366F1;\\\">12,847<\\/p><p style=\\\"margin:4px 0 0 0;font-size:13px;color:#64748B;text-transform:uppercase;\\\">Emails Sent<\\/p><\\/td><\\/tr><\\/table>\",\"right_content\":\"<table role=\\\"presentation\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" border=\\\"0\\\" width=\\\"100%\\\" style=\\\"background:#ECFDF5;border-radius:8px;\\\"><tr><td style=\\\"padding:20px;text-align:center;\\\"><p style=\\\"margin:0;font-size:32px;font-weight:700;color:#059669;\\\">42.3%<\\/p><p style=\\\"margin:4px 0 0 0;font-size:13px;color:#64748B;text-transform:uppercase;\\\">Open Rate<\\/p><\\/td><\\/tr><\\/table>\"}},{\"type\":\"columns\",\"data\":{\"left_content\":\"<table role=\\\"presentation\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" border=\\\"0\\\" width=\\\"100%\\\" style=\\\"background:#FFF7ED;border-radius:8px;\\\"><tr><td style=\\\"padding:20px;text-align:center;\\\"><p style=\\\"margin:0;font-size:32px;font-weight:700;color:#EA580C;\\\">8.7%<\\/p><p style=\\\"margin:4px 0 0 0;font-size:13px;color:#64748B;text-transform:uppercase;\\\">Click Rate<\\/p><\\/td><\\/tr><\\/table>\",\"right_content\":\"<table role=\\\"presentation\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" border=\\\"0\\\" width=\\\"100%\\\" style=\\\"background:#FEF2F2;border-radius:8px;\\\"><tr><td style=\\\"padding:20px;text-align:center;\\\"><p style=\\\"margin:0;font-size:32px;font-weight:700;color:#DC2626;\\\">0.3%<\\/p><p style=\\\"margin:4px 0 0 0;font-size:13px;color:#64748B;text-transform:uppercase;\\\">Unsubscribe<\\/p><\\/td><\\/tr><\\/table>\"}},{\"type\":\"divider\",\"data\":{\"color\":\"#E5E7EB\",\"width\":\"100\",\"style\":\"solid\"}},{\"type\":\"text\",\"data\":{\"content\":\"<p style=\\\"margin:0 0 8px 0;font-weight:700;color:#1E293B;\\\">Top performing campaign<\\/p><table role=\\\"presentation\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" border=\\\"0\\\" width=\\\"100%\\\" style=\\\"background:#F8FAFC;border-radius:8px;\\\"><tr><td style=\\\"padding:16px;\\\"><p style=\\\"margin:0 0 4px 0;font-weight:600;color:#1E293B;\\\">Spring Product Launch<\\/p><p style=\\\"margin:0;font-size:14px;color:#64748B;\\\">52.1% open rate &middot; 14.3% click rate &middot; 2,341 recipients<\\/p><\\/td><\\/tr><\\/table>\",\"align\":\"left\",\"font_size\":\"16\"}},{\"type\":\"button\",\"data\":{\"text\":\"View Full Report\",\"url\":\"https:\\/\\/example.com\\/reports\\/monthly\",\"bg_color\":\"#6366F1\",\"text_color\":\"#FFFFFF\",\"align\":\"center\"}},{\"type\":\"footer\",\"data\":{\"text\":\"{company} | 123 Business Street, Suite 100\",\"unsubscribe_text\":\"Unsubscribe | Manage Preferences\"}}]', NULL, 'reporting', 1, 0, '2026-09-27 08:25:22', '2026-09-27 08:25:22', NULL),
(11, NULL, 'Feature Update', '[{\"type\":\"header\",\"data\":{\"logo_url\":\"\",\"company_name\":\"{company}\",\"bg_color\":\"#6366F1\"}},{\"type\":\"text\",\"data\":{\"content\":\"<p style=\\\"margin:0 0 4px 0;font-size:13px;color:#6366F1;font-weight:600;text-transform:uppercase;\\\">Product Update<\\/p><h2 style=\\\"margin:0 0 12px 0;color:#1E293B;\\\">What is new this month<\\/h2><p style=\\\"margin:0;color:#475569;\\\">Hi {first_name}, here is a quick look at the improvements and new features we shipped this month.<\\/p>\",\"align\":\"left\",\"font_size\":\"16\"}},{\"type\":\"divider\",\"data\":{\"color\":\"#E5E7EB\",\"width\":\"100\",\"style\":\"solid\"}},{\"type\":\"text\",\"data\":{\"content\":\"<table role=\\\"presentation\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" border=\\\"0\\\" width=\\\"100%\\\"><tr><td style=\\\"padding:16px 0;border-bottom:1px solid #F1F5F9;\\\"><p style=\\\"margin:0 0 2px 0;\\\"><span style=\\\"display:inline-block;padding:2px 8px;background:#ECFDF5;color:#059669;border-radius:4px;font-size:11px;font-weight:600;text-transform:uppercase;\\\">New<\\/span><\\/p><p style=\\\"margin:6px 0 4px 0;font-weight:700;color:#1E293B;\\\">Visual automation builder<\\/p><p style=\\\"margin:0;font-size:14px;color:#64748B;\\\">Create complex email workflows with our new drag-and-drop canvas. Set triggers, conditions, and actions without writing a single line of code.<\\/p><\\/td><\\/tr><tr><td style=\\\"padding:16px 0;border-bottom:1px solid #F1F5F9;\\\"><p style=\\\"margin:0 0 2px 0;\\\"><span style=\\\"display:inline-block;padding:2px 8px;background:#EEF2FF;color:#6366F1;border-radius:4px;font-size:11px;font-weight:600;text-transform:uppercase;\\\">Improved<\\/span><\\/p><p style=\\\"margin:6px 0 4px 0;font-weight:700;color:#1E293B;\\\">Campaign analytics<\\/p><p style=\\\"margin:0;font-size:14px;color:#64748B;\\\">Richer engagement data, heatmap click tracking, and device breakdown reports. See exactly how your audience interacts with every email.<\\/p><\\/td><\\/tr><tr><td style=\\\"padding:16px 0;\\\"><p style=\\\"margin:0 0 2px 0;\\\"><span style=\\\"display:inline-block;padding:2px 8px;background:#FFF7ED;color:#EA580C;border-radius:4px;font-size:11px;font-weight:600;text-transform:uppercase;\\\">Fixed<\\/span><\\/p><p style=\\\"margin:6px 0 4px 0;font-weight:700;color:#1E293B;\\\">Timezone handling in scheduled sends<\\/p><p style=\\\"margin:0;font-size:14px;color:#64748B;\\\">Campaigns now respect the recipient timezone setting correctly, so your emails arrive at the intended local time.<\\/p><\\/td><\\/tr><\\/table>\",\"align\":\"left\",\"font_size\":\"16\"}},{\"type\":\"button\",\"data\":{\"text\":\"Read the Full Changelog\",\"url\":\"https:\\/\\/example.com\\/changelog\",\"bg_color\":\"#6366F1\",\"text_color\":\"#FFFFFF\",\"align\":\"center\"}},{\"type\":\"text\",\"data\":{\"content\":\"<p style=\\\"margin:0;font-size:14px;color:#94A3B8;text-align:center;\\\">Have a feature request? We would love to hear it. Reply to this email or visit our feedback board.<\\/p>\",\"align\":\"center\",\"font_size\":\"14\"}},{\"type\":\"footer\",\"data\":{\"text\":\"{company} | 123 Business Street, Suite 100\",\"unsubscribe_text\":\"Unsubscribe from product updates\"}}]', NULL, 'product', 1, 0, '2026-09-27 08:25:22', '2026-09-27 08:25:22', NULL),
(12, NULL, 'Referral Program', '[{\"type\":\"header\",\"data\":{\"logo_url\":\"\",\"company_name\":\"{company}\",\"bg_color\":\"#6366F1\"}},{\"type\":\"text\",\"data\":{\"content\":\"<h2 style=\\\"margin:0 0 16px 0;color:#1E293B;text-align:center;\\\">Share the love, earn rewards<\\/h2><p style=\\\"margin:0 0 12px 0;color:#475569;\\\">Hi {first_name},<\\/p><p style=\\\"margin:0;color:#475569;\\\">Know someone who would benefit from {company}? Refer them and you both win. For every friend who signs up using your unique link, you will earn a credit toward your next bill.<\\/p>\",\"align\":\"left\",\"font_size\":\"16\"}},{\"type\":\"divider\",\"data\":{\"color\":\"#E5E7EB\",\"width\":\"80\",\"style\":\"solid\"}},{\"type\":\"text\",\"data\":{\"content\":\"<p style=\\\"margin:0 0 16px 0;font-weight:700;color:#1E293B;text-align:center;\\\">How it works<\\/p><table role=\\\"presentation\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" border=\\\"0\\\" width=\\\"100%\\\"><tr><td width=\\\"33%\\\" style=\\\"text-align:center;vertical-align:top;padding:0 8px;\\\"><div style=\\\"width:48px;height:48px;line-height:48px;border-radius:50%;background:#EEF2FF;color:#6366F1;font-weight:700;font-size:20px;display:inline-block;margin-bottom:8px;\\\">1<\\/div><p style=\\\"margin:0 0 4px 0;font-weight:600;color:#1E293B;font-size:14px;\\\">Share your link<\\/p><p style=\\\"margin:0;font-size:13px;color:#64748B;\\\">Copy your unique referral link and send it to friends or colleagues.<\\/p><\\/td><td width=\\\"33%\\\" style=\\\"text-align:center;vertical-align:top;padding:0 8px;\\\"><div style=\\\"width:48px;height:48px;line-height:48px;border-radius:50%;background:#EEF2FF;color:#6366F1;font-weight:700;font-size:20px;display:inline-block;margin-bottom:8px;\\\">2<\\/div><p style=\\\"margin:0 0 4px 0;font-weight:600;color:#1E293B;font-size:14px;\\\">They sign up<\\/p><p style=\\\"margin:0;font-size:13px;color:#64748B;\\\">Your friend creates an account using your link and starts their trial.<\\/p><\\/td><td width=\\\"33%\\\" style=\\\"text-align:center;vertical-align:top;padding:0 8px;\\\"><div style=\\\"width:48px;height:48px;line-height:48px;border-radius:50%;background:#EEF2FF;color:#6366F1;font-weight:700;font-size:20px;display:inline-block;margin-bottom:8px;\\\">3<\\/div><p style=\\\"margin:0 0 4px 0;font-weight:600;color:#1E293B;font-size:14px;\\\">You both earn<\\/p><p style=\\\"margin:0;font-size:13px;color:#64748B;\\\">When they upgrade, you get a $25 credit and they get 20% off their first month.<\\/p><\\/td><\\/tr><\\/table>\",\"align\":\"center\",\"font_size\":\"16\"}},{\"type\":\"text\",\"data\":{\"content\":\"<table role=\\\"presentation\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" border=\\\"0\\\" width=\\\"100%\\\" style=\\\"background:#EEF2FF;border-radius:8px;\\\"><tr><td style=\\\"padding:20px;text-align:center;\\\"><p style=\\\"margin:0 0 8px 0;font-size:13px;color:#64748B;\\\">Your referral link<\\/p><p style=\\\"margin:0;font-size:16px;font-weight:600;color:#6366F1;word-break:break-all;\\\">https:\\/\\/example.com\\/ref\\/{first_name}<\\/p><\\/td><\\/tr><\\/table>\",\"align\":\"center\",\"font_size\":\"16\"}},{\"type\":\"button\",\"data\":{\"text\":\"Start Referring\",\"url\":\"https:\\/\\/example.com\\/referrals\",\"bg_color\":\"#6366F1\",\"text_color\":\"#FFFFFF\",\"align\":\"center\"}},{\"type\":\"text\",\"data\":{\"content\":\"<p style=\\\"margin:0;font-size:13px;color:#94A3B8;text-align:center;\\\">There is no limit to the number of people you can refer. Credits are applied automatically to your next invoice.<\\/p>\",\"align\":\"center\",\"font_size\":\"13\"}},{\"type\":\"footer\",\"data\":{\"text\":\"{company} | 123 Business Street, Suite 100\",\"unsubscribe_text\":\"Unsubscribe from these emails\"}}]', NULL, 'marketing', 1, 0, '2026-09-27 08:25:22', '2026-09-27 08:25:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friendship_events`
--

CREATE TABLE `friendship_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_low_id` bigint(20) UNSIGNED NOT NULL,
  `user_high_id` bigint(20) UNSIGNED NOT NULL,
  `actor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` enum('requested','became_friends','unfriended','declined','blocked') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `friendship_events`
--

INSERT INTO `friendship_events` (`id`, `user_low_id`, `user_high_id`, `actor_id`, `event`, `created_at`) VALUES
(1, 3, 6, 3, 'requested', '2026-10-01 12:55:40'),
(2, 14, 15, 15, 'requested', '2026-10-02 12:30:34'),
(3, 14, 16, 16, 'requested', '2026-10-02 12:55:12'),
(4, 15, 16, 16, 'requested', '2026-10-02 12:55:15'),
(5, 6, 14, 14, 'requested', '2026-10-02 16:10:30'),
(6, 3, 14, 3, 'requested', '2026-10-03 13:33:42'),
(8, 3, 6, 6, 'became_friends', '2026-10-01 12:55:52'),
(9, 14, 15, 14, 'became_friends', '2026-10-02 12:30:48'),
(10, 14, 16, 14, 'became_friends', '2026-10-02 12:55:40'),
(11, 15, 16, 15, 'became_friends', '2026-10-02 14:55:47'),
(12, 6, 14, 6, 'became_friends', '2026-10-02 16:10:42'),
(13, 3, 14, 14, 'became_friends', '2026-10-03 13:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `friend_calls`
--

CREATE TABLE `friend_calls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caller_id` bigint(20) UNSIGNED NOT NULL,
  `callee_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('ringing','active','ended','declined','missed','cancelled') NOT NULL DEFAULT 'ringing',
  `answered_at` timestamp NULL DEFAULT NULL,
  `ended_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `video` tinyint(1) NOT NULL DEFAULT 0,
  `meeting_code` varchar(24) DEFAULT NULL,
  `group_invite` tinyint(1) NOT NULL DEFAULT 0,
  `audio_only` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `friend_calls`
--

INSERT INTO `friend_calls` (`id`, `caller_id`, `callee_id`, `status`, `answered_at`, `ended_at`, `created_at`, `updated_at`, `video`, `meeting_code`, `group_invite`, `audio_only`) VALUES
(1, 3, 6, 'ended', '2026-10-01 12:56:11', '2026-10-01 12:56:11', '2026-10-01 12:55:58', '2026-10-01 12:56:11', 0, NULL, 0, 0),
(2, 3, 6, 'ended', '2026-10-01 12:57:16', '2026-10-01 12:57:16', '2026-10-01 12:56:48', '2026-10-01 12:57:16', 0, NULL, 0, 0),
(3, 3, 6, 'missed', NULL, '2026-10-02 02:20:03', '2026-10-02 02:19:15', '2026-10-02 02:20:03', 1, 'bt7fr97wut', 0, 0),
(4, 3, 6, 'ended', '2026-10-02 04:43:25', '2026-10-02 04:44:09', '2026-10-02 04:43:08', '2026-10-02 04:44:09', 1, 'd28a4mk4w3', 0, 0),
(5, 3, 6, 'ended', '2026-10-02 04:44:40', '2026-10-02 04:44:55', '2026-10-02 04:44:15', '2026-10-02 04:44:55', 1, '63gvargqf6', 0, 1),
(6, 3, 6, 'ended', '2026-10-02 04:45:14', '2026-10-02 04:45:38', '2026-10-02 04:45:00', '2026-10-02 04:45:38', 1, 'mfp7dd8rr3', 0, 1),
(7, 3, 6, 'cancelled', NULL, '2026-10-02 05:18:45', '2026-10-02 05:18:37', '2026-10-02 05:18:45', 1, 'c2ten5pyza', 0, 1),
(8, 15, 14, 'ended', '2026-10-02 12:34:50', '2026-10-02 12:35:51', '2026-10-02 12:34:36', '2026-10-02 12:35:51', 1, 'tcu2k3mbrr', 0, 1),
(9, 15, 14, 'ended', '2026-10-02 12:36:53', '2026-10-02 12:37:41', '2026-10-02 12:36:42', '2026-10-02 12:37:41', 1, 'pcucgj88da', 0, 0),
(10, 16, 14, 'ended', '2026-10-02 12:56:29', '2026-10-02 12:56:50', '2026-10-02 12:56:11', '2026-10-02 12:56:50', 1, '6atchk2afz', 0, 0),
(11, 14, 15, 'cancelled', NULL, '2026-10-02 13:00:43', '2026-10-02 13:00:33', '2026-10-02 13:00:43', 1, 'phaetq7qtj', 0, 0),
(12, 15, 16, 'missed', NULL, '2026-10-02 14:58:54', '2026-10-02 14:58:02', '2026-10-02 14:58:54', 1, 'e9z7xmhjkm', 0, 1),
(13, 15, 16, 'cancelled', NULL, '2026-10-02 14:59:33', '2026-10-02 14:59:11', '2026-10-02 14:59:33', 1, 'jk3eeuy7qz', 0, 1),
(14, 15, 16, 'cancelled', NULL, '2026-10-02 14:59:49', '2026-10-02 14:59:36', '2026-10-02 14:59:49', 1, '7r3su975du', 0, 0),
(15, 16, 15, 'cancelled', NULL, '2026-10-02 15:00:31', '2026-10-02 15:00:20', '2026-10-02 15:00:31', 1, 'cyafx5zybn', 0, 1),
(16, 16, 15, 'cancelled', NULL, '2026-10-02 15:01:58', '2026-10-02 15:01:51', '2026-10-02 15:01:58', 1, '2rff48uqxk', 0, 0),
(17, 6, 14, 'ended', '2026-10-02 16:12:00', '2026-10-02 16:12:11', '2026-10-02 16:11:37', '2026-10-02 16:12:11', 1, 'yk2q5w6xzx', 0, 1),
(18, 6, 14, 'cancelled', NULL, '2026-10-02 16:15:42', '2026-10-02 16:15:17', '2026-10-02 16:15:42', 1, 'm7n2wvnts5', 0, 0),
(19, 6, 3, 'cancelled', NULL, '2026-10-02 16:16:36', '2026-10-02 16:15:56', '2026-10-02 16:16:36', 1, 'u6dgzq7awp', 0, 1),
(20, 6, 3, 'cancelled', NULL, '2026-10-02 16:17:09', '2026-10-02 16:16:47', '2026-10-02 16:17:09', 1, 'urfbfx6wnp', 0, 1),
(21, 6, 14, 'ended', '2026-10-02 16:17:30', '2026-10-02 16:17:37', '2026-10-02 16:17:20', '2026-10-02 16:17:37', 1, 'a9w2afzrp9', 0, 1),
(22, 6, 14, 'cancelled', NULL, '2026-10-02 16:18:01', '2026-10-02 16:17:47', '2026-10-02 16:18:01', 1, 'bbnt97dhjz', 0, 1),
(23, 14, 6, 'cancelled', NULL, '2026-10-03 13:31:02', '2026-10-03 13:30:52', '2026-10-03 13:31:02', 1, 'w9sb2jwwtn', 0, 1),
(24, 14, 6, 'cancelled', NULL, '2026-10-03 13:31:32', '2026-10-03 13:31:05', '2026-10-03 13:31:32', 1, '8w33ar5kc8', 0, 0),
(25, 14, 6, 'cancelled', NULL, '2026-10-03 13:31:45', '2026-10-03 13:31:36', '2026-10-03 13:31:45', 1, 'hgsp7y3hnk', 0, 0),
(26, 3, 14, 'ended', '2026-10-03 13:39:31', '2026-10-03 13:41:35', '2026-10-03 13:38:46', '2026-10-03 13:41:35', 1, '26tqrv5dpf', 0, 1),
(27, 3, 14, 'declined', NULL, '2026-10-05 09:05:16', '2026-10-05 09:04:39', '2026-10-05 09:05:16', 1, 'quvnq585bs', 0, 1),
(28, 3, 14, 'cancelled', NULL, '2026-10-05 09:25:42', '2026-10-05 09:24:07', '2026-10-05 09:25:42', 1, 'zqupy9ypxz', 0, 1),
(29, 3, 14, 'cancelled', NULL, '2026-10-05 09:26:17', '2026-10-05 09:25:57', '2026-10-05 09:26:17', 1, 'nx399vwa66', 0, 1),
(30, 3, 14, 'declined', NULL, '2026-10-05 09:26:52', '2026-10-05 09:26:36', '2026-10-05 09:26:52', 1, 'gpsanxg352', 0, 1),
(31, 3, 14, 'cancelled', NULL, '2026-10-05 09:28:17', '2026-10-05 09:27:48', '2026-10-05 09:28:17', 1, 'uttkx3wbba', 0, 1),
(32, 3, 14, 'missed', NULL, '2026-10-05 09:33:38', '2026-10-05 09:32:49', '2026-10-05 09:33:38', 1, 'qf7gx2zyjx', 0, 1),
(33, 14, 3, 'ended', '2026-10-05 09:34:01', '2026-10-05 09:34:30', '2026-10-05 09:33:49', '2026-10-05 09:34:30', 1, 'v6xj3gcjma', 0, 1),
(34, 3, 14, 'ended', '2026-10-05 09:52:31', '2026-10-05 09:54:50', '2026-10-05 09:52:19', '2026-10-05 09:54:50', 1, 'jhbgd5cet4', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `friend_call_clears`
--

CREATE TABLE `friend_call_clears` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `before_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friend_call_signals`
--

CREATE TABLE `friend_call_signals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `call_id` bigint(20) UNSIGNED NOT NULL,
  `from_user_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('offer','answer','ice') NOT NULL,
  `payload` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friend_chat_clears`
--

CREATE TABLE `friend_chat_clears` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `other_id` bigint(20) UNSIGNED NOT NULL,
  `before_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friend_dismissals`
--

CREATE TABLE `friend_dismissals` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `other_user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friend_match_notices`
--

CREATE TABLE `friend_match_notices` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `other_user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friend_messages`
--

CREATE TABLE `friend_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `recipient_id` bigint(20) UNSIGNED NOT NULL,
  `body` text DEFAULT NULL,
  `reply_to_id` bigint(20) UNSIGNED DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_mime` varchar(120) DEFAULT NULL,
  `file_size` bigint(20) UNSIGNED DEFAULT NULL,
  `duration` smallint(5) UNSIGNED DEFAULT NULL,
  `kind` enum('text','file','voice','call','system') NOT NULL DEFAULT 'text',
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `edited_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `reacted_at` timestamp NULL DEFAULT NULL,
  `forwarded` tinyint(1) NOT NULL DEFAULT 0,
  `call_id` bigint(20) UNSIGNED DEFAULT NULL,
  `visible_to` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `friend_messages`
--

INSERT INTO `friend_messages` (`id`, `sender_id`, `recipient_id`, `body`, `reply_to_id`, `file_path`, `file_name`, `file_mime`, `file_size`, `duration`, `kind`, `read_at`, `created_at`, `updated_at`, `edited_at`, `deleted_at`, `delivered_at`, `reacted_at`, `forwarded`, `call_id`, `visible_to`) VALUES
(1, 3, 6, 'Call · 00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-01 12:57:32', '2026-10-01 12:56:11', '2026-10-01 12:56:11', NULL, NULL, '2026-10-01 12:57:32', NULL, 0, NULL, NULL),
(2, 3, 6, 'Call · 00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-01 12:57:32', '2026-10-01 12:57:16', '2026-10-01 12:57:16', NULL, NULL, '2026-10-01 12:57:32', NULL, 0, NULL, NULL),
(3, 6, 3, 'sdcscdscs', NULL, NULL, NULL, NULL, NULL, NULL, 'text', '2026-10-01 12:57:55', '2026-10-01 12:57:35', '2026-10-01 12:57:35', NULL, NULL, '2026-10-01 12:57:55', NULL, 0, NULL, NULL),
(4, 3, 6, 'Sddd', NULL, NULL, NULL, NULL, NULL, NULL, 'text', '2026-10-01 12:58:02', '2026-10-01 12:57:59', '2026-10-01 12:57:59', NULL, NULL, '2026-10-01 12:58:02', NULL, 0, NULL, NULL),
(5, 6, 3, 'sdvsdvs', NULL, NULL, NULL, NULL, NULL, NULL, 'text', '2026-10-01 12:58:13', '2026-10-01 12:58:10', '2026-10-01 12:58:10', NULL, NULL, '2026-10-01 12:58:13', NULL, 0, NULL, NULL),
(6, 3, 6, 'Dddd', NULL, NULL, NULL, NULL, NULL, NULL, 'text', '2026-10-01 13:10:24', '2026-10-01 13:10:16', '2026-10-01 13:10:16', NULL, NULL, '2026-10-01 13:10:24', NULL, 0, NULL, NULL),
(7, 6, 3, 'jnknj', NULL, NULL, NULL, NULL, NULL, NULL, 'text', '2026-10-01 13:10:34', '2026-10-01 13:10:31', '2026-10-01 13:10:31', NULL, NULL, '2026-10-01 13:10:34', NULL, 0, NULL, NULL),
(8, 6, 3, 'jnkjnjk', NULL, NULL, NULL, NULL, NULL, NULL, 'text', '2026-10-01 13:10:49', '2026-10-01 13:10:47', '2026-10-01 13:10:47', NULL, NULL, '2026-10-01 13:10:49', NULL, 0, NULL, NULL),
(9, 3, 6, 'Missed video call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-02 04:48:11', '2026-10-02 02:20:03', '2026-10-02 02:20:03', NULL, NULL, '2026-10-02 04:48:11', NULL, 0, NULL, NULL),
(10, 3, 6, NULL, NULL, 'friend-files/3-6/5559ef71-6aee-41e7-aca4-dcca72ef3e06.jpg', 'FB_IMG_1790914417910.jpg', 'application/octet-stream', 171665, NULL, 'file', '2026-10-02 04:48:11', '2026-10-02 04:09:37', '2026-10-02 04:09:37', NULL, NULL, '2026-10-02 04:48:11', NULL, 0, NULL, NULL),
(11, 3, 6, NULL, NULL, 'friend-files/3-6/18831769-e945-42ca-b58f-e7d9ffa7b8bd.jpg', 'scaled_127265.jpg', 'application/octet-stream', 216126, NULL, 'file', '2026-10-02 04:48:11', '2026-10-02 04:11:00', '2026-10-02 04:11:00', NULL, NULL, '2026-10-02 04:48:11', NULL, 0, NULL, NULL),
(12, 3, 6, 'Video call · 00:44', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-02 04:48:11', '2026-10-02 04:44:09', '2026-10-02 04:44:09', NULL, NULL, '2026-10-02 04:48:11', NULL, 0, NULL, NULL),
(13, 3, 6, 'Video call · 00:15', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-02 04:48:11', '2026-10-02 04:44:55', '2026-10-02 04:44:55', NULL, NULL, '2026-10-02 04:48:11', NULL, 0, NULL, NULL),
(14, 3, 6, 'Video call · 00:24', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-02 04:48:11', '2026-10-02 04:45:38', '2026-10-02 04:45:38', NULL, NULL, '2026-10-02 04:48:11', NULL, 0, NULL, NULL),
(15, 3, 6, NULL, NULL, 'friend-files/3-6/3a9d7ad6-10aa-44e7-b50e-a42ef145f5cc.jpg', 'scaled_127265.jpg', 'application/octet-stream', 216126, NULL, 'file', '2026-10-02 04:48:11', '2026-10-02 04:45:53', '2026-10-02 04:45:53', NULL, NULL, '2026-10-02 04:48:11', NULL, 0, NULL, NULL),
(16, 3, 6, 'Missed video call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-02 05:18:47', '2026-10-02 05:18:45', '2026-10-02 05:18:45', NULL, NULL, '2026-10-02 05:18:47', NULL, 0, NULL, NULL),
(17, 3, 6, 'Hih', NULL, NULL, NULL, NULL, NULL, NULL, 'text', '2026-10-02 09:01:38', '2026-10-02 09:01:20', '2026-10-02 09:01:20', NULL, NULL, '2026-10-02 09:01:38', NULL, 0, NULL, NULL),
(18, 6, 3, 'hkhk', NULL, NULL, NULL, NULL, NULL, NULL, 'text', '2026-10-02 09:01:47', '2026-10-02 09:01:45', '2026-10-02 09:01:45', NULL, NULL, '2026-10-02 09:01:47', NULL, 0, NULL, NULL),
(19, 6, 3, '111', NULL, NULL, NULL, NULL, NULL, NULL, 'text', '2026-10-02 09:02:27', '2026-10-02 09:02:04', '2026-10-02 09:02:04', NULL, NULL, '2026-10-02 09:02:27', NULL, 0, NULL, NULL),
(20, 15, 14, 'Allah day kamyaab au kamran au Allah Pak pa tola dunya kay da tolo na Pa Aqal au Himmat ziaath ka chay pa tola dunya kay stha noom khor shee', NULL, NULL, NULL, NULL, NULL, NULL, 'text', '2026-10-02 12:34:06', '2026-10-02 12:33:49', '2026-10-02 12:33:49', NULL, NULL, '2026-10-02 12:34:06', '2026-10-02 12:34:27', 0, NULL, NULL),
(21, 15, 14, 'Video call · 01:01', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-02 12:35:54', '2026-10-02 12:35:51', '2026-10-02 12:35:51', NULL, NULL, '2026-10-02 12:35:54', NULL, 0, NULL, NULL),
(22, 15, 14, 'Video call · 00:48', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-02 12:37:46', '2026-10-02 12:37:41', '2026-10-02 12:37:41', NULL, NULL, '2026-10-02 12:37:46', NULL, 0, NULL, NULL),
(23, 16, 14, 'Video call · 00:21', NULL, NULL, NULL, NULL, NULL, NULL, 'call', NULL, '2026-10-02 12:56:50', '2026-10-02 12:56:50', NULL, NULL, '2026-10-02 12:56:51', NULL, 0, NULL, NULL),
(24, 14, 15, 'Missed video call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', NULL, '2026-10-02 13:00:43', '2026-10-02 13:00:43', NULL, NULL, '2026-10-02 13:01:23', NULL, 0, NULL, NULL),
(25, 15, 16, 'Missed video call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-02 15:01:18', '2026-10-02 14:58:54', '2026-10-02 14:58:54', NULL, NULL, '2026-10-02 15:01:18', NULL, 0, NULL, NULL),
(26, 15, 16, 'Missed video call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-02 15:01:18', '2026-10-02 14:59:33', '2026-10-02 14:59:33', NULL, NULL, '2026-10-02 15:01:18', NULL, 0, NULL, NULL),
(27, 15, 16, 'Missed video call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-02 15:01:18', '2026-10-02 14:59:49', '2026-10-02 14:59:49', NULL, NULL, '2026-10-02 15:01:18', NULL, 0, NULL, NULL),
(28, 15, 16, 'Hi', NULL, NULL, NULL, NULL, NULL, NULL, 'text', '2026-10-02 15:01:18', '2026-10-02 14:59:57', '2026-10-02 14:59:57', NULL, NULL, '2026-10-02 15:01:18', NULL, 0, NULL, NULL),
(29, 16, 15, 'Missed video call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-02 15:00:31', '2026-10-02 15:00:31', '2026-10-02 15:00:31', NULL, NULL, '2026-10-02 15:00:31', NULL, 0, NULL, NULL),
(30, 16, 15, 'Missed video call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-02 15:02:01', '2026-10-02 15:01:58', '2026-10-02 15:01:58', NULL, NULL, '2026-10-02 15:02:01', NULL, 0, NULL, NULL),
(31, 6, 3, 'nnnn', NULL, NULL, NULL, NULL, NULL, NULL, 'text', NULL, '2026-10-02 16:09:05', '2026-10-02 16:09:05', NULL, NULL, '2026-10-03 13:33:03', NULL, 0, NULL, NULL),
(32, 6, 3, 'nmnm', NULL, NULL, NULL, NULL, NULL, NULL, 'text', NULL, '2026-10-02 16:09:40', '2026-10-02 16:09:40', NULL, NULL, '2026-10-03 13:33:03', NULL, 0, NULL, NULL),
(33, 6, 14, 'mmm', NULL, NULL, NULL, NULL, NULL, NULL, 'text', '2026-10-02 16:16:25', '2026-10-02 16:11:03', '2026-10-02 16:11:03', NULL, NULL, '2026-10-02 16:16:25', NULL, 0, NULL, NULL),
(34, 6, 14, 'nnn', NULL, NULL, NULL, NULL, NULL, NULL, 'text', '2026-10-02 16:16:25', '2026-10-02 16:11:18', '2026-10-02 16:11:18', NULL, NULL, '2026-10-02 16:16:25', NULL, 0, NULL, NULL),
(35, 6, 14, 'Video call · 00:11', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-02 16:16:25', '2026-10-02 16:12:11', '2026-10-02 16:12:11', NULL, NULL, '2026-10-02 16:16:25', NULL, 0, NULL, NULL),
(36, 6, 14, 'Missed video call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-02 16:16:25', '2026-10-02 16:15:42', '2026-10-02 16:15:42', NULL, NULL, '2026-10-02 16:16:25', NULL, 0, NULL, NULL),
(37, 6, 3, 'Missed video call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', NULL, '2026-10-02 16:16:36', '2026-10-02 16:16:36', NULL, NULL, '2026-10-03 13:33:03', NULL, 0, NULL, NULL),
(38, 6, 3, 'Missed video call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', NULL, '2026-10-02 16:17:09', '2026-10-02 16:17:09', NULL, NULL, '2026-10-03 13:33:03', NULL, 0, NULL, NULL),
(39, 6, 14, 'Video call · 00:07', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-03 13:30:50', '2026-10-02 16:17:37', '2026-10-02 16:17:37', NULL, NULL, '2026-10-03 13:30:50', NULL, 0, NULL, NULL),
(40, 6, 14, 'Missed video call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-03 13:30:50', '2026-10-02 16:18:01', '2026-10-02 16:18:01', NULL, NULL, '2026-10-03 13:30:50', NULL, 0, NULL, NULL),
(41, 14, 6, 'Missed video call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', NULL, '2026-10-03 13:31:02', '2026-10-03 13:31:02', NULL, NULL, NULL, NULL, 0, NULL, NULL),
(42, 14, 6, 'Missed video call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', NULL, '2026-10-03 13:31:32', '2026-10-03 13:31:32', NULL, NULL, NULL, NULL, 0, NULL, NULL),
(43, 14, 6, 'Missed video call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', NULL, '2026-10-03 13:31:45', '2026-10-03 13:31:45', NULL, NULL, NULL, NULL, 0, NULL, NULL),
(44, 3, 14, 'hihihi', NULL, NULL, NULL, NULL, NULL, NULL, 'text', '2026-10-05 09:04:24', '2026-10-03 13:34:40', '2026-10-03 13:34:40', NULL, NULL, '2026-10-05 09:04:24', NULL, 0, NULL, NULL),
(45, 3, 14, 'hhihi', NULL, NULL, NULL, NULL, NULL, NULL, 'text', '2026-10-05 09:04:24', '2026-10-03 13:34:52', '2026-10-03 13:34:52', NULL, NULL, '2026-10-05 09:04:24', NULL, 0, NULL, NULL),
(46, 3, 14, 'Video call · 02:04', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-05 09:04:24', '2026-10-03 13:41:35', '2026-10-03 13:41:35', NULL, NULL, '2026-10-05 09:04:24', NULL, 0, NULL, NULL),
(47, 3, 14, 'Declined call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-05 09:05:18', '2026-10-05 09:05:16', '2026-10-05 09:05:16', NULL, NULL, '2026-10-05 09:05:18', NULL, 0, 27, NULL),
(48, 3, 14, 'nbnnbn', NULL, NULL, NULL, NULL, NULL, NULL, 'text', '2026-10-05 09:10:00', '2026-10-05 09:09:59', '2026-10-05 09:09:59', NULL, NULL, '2026-10-05 09:10:00', NULL, 0, NULL, NULL),
(49, 3, 14, 'bmbm', NULL, NULL, NULL, NULL, NULL, NULL, 'text', '2026-10-05 09:33:43', '2026-10-05 09:10:11', '2026-10-05 09:10:11', NULL, NULL, '2026-10-05 09:33:43', NULL, 0, NULL, NULL),
(50, 3, 14, 'Missed video call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-05 09:33:43', '2026-10-05 09:25:42', '2026-10-05 09:25:42', NULL, NULL, '2026-10-05 09:33:43', NULL, 0, 28, NULL),
(51, 3, 14, 'Missed video call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-05 09:33:43', '2026-10-05 09:26:17', '2026-10-05 09:26:17', NULL, NULL, '2026-10-05 09:33:43', NULL, 0, 29, NULL),
(52, 3, 14, 'Declined call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-05 09:33:43', '2026-10-05 09:26:52', '2026-10-05 09:26:52', NULL, NULL, '2026-10-05 09:33:43', NULL, 0, 30, NULL),
(53, 3, 14, 'Missed video call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-05 09:33:43', '2026-10-05 09:28:17', '2026-10-05 09:28:17', NULL, NULL, '2026-10-05 09:33:43', NULL, 0, 31, NULL),
(54, 3, 14, 'Missed video call', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-05 09:33:43', '2026-10-05 09:33:38', '2026-10-05 09:33:38', NULL, NULL, '2026-10-05 09:33:43', NULL, 0, 32, NULL),
(55, 14, 3, 'Video call · 00:29', NULL, NULL, NULL, NULL, NULL, NULL, 'call', '2026-10-05 09:52:17', '2026-10-05 09:34:30', '2026-10-05 09:34:30', NULL, NULL, '2026-10-05 09:52:17', NULL, 0, 33, NULL),
(56, 3, 14, 'Video call · 02:19', NULL, NULL, NULL, NULL, NULL, NULL, 'call', NULL, '2026-10-05 09:54:50', '2026-10-05 09:54:50', NULL, NULL, '2026-10-05 09:54:51', NULL, 0, 34, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `friend_message_reactions`
--

CREATE TABLE `friend_message_reactions` (
  `message_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `emoji` varchar(32) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `friend_message_reactions`
--

INSERT INTO `friend_message_reactions` (`message_id`, `user_id`, `emoji`, `created_at`) VALUES
(20, 15, '👍', '2026-10-02 12:34:27');

-- --------------------------------------------------------

--
-- Table structure for table `friend_requests`
--

CREATE TABLE `friend_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `requester_id` bigint(20) UNSIGNED NOT NULL,
  `addressee_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','accepted','declined','blocked','unfriended') NOT NULL DEFAULT 'pending',
  `responded_at` timestamp NULL DEFAULT NULL,
  `unfriended_at` timestamp NULL DEFAULT NULL,
  `unfriended_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `friend_requests`
--

INSERT INTO `friend_requests` (`id`, `requester_id`, `addressee_id`, `status`, `responded_at`, `unfriended_at`, `unfriended_by`, `created_at`, `updated_at`) VALUES
(1, 3, 6, 'accepted', '2026-10-01 12:55:52', NULL, NULL, '2026-10-01 12:55:40', '2026-10-01 12:55:52'),
(2, 15, 14, 'accepted', '2026-10-02 12:30:48', NULL, NULL, '2026-10-02 12:30:34', '2026-10-02 12:30:48'),
(3, 16, 14, 'accepted', '2026-10-02 12:55:40', NULL, NULL, '2026-10-02 12:55:12', '2026-10-02 12:55:40'),
(4, 16, 15, 'accepted', '2026-10-02 14:55:47', NULL, NULL, '2026-10-02 12:55:15', '2026-10-02 14:55:47'),
(5, 14, 6, 'accepted', '2026-10-02 16:10:42', NULL, NULL, '2026-10-02 16:10:30', '2026-10-02 16:10:42'),
(6, 3, 14, 'accepted', '2026-10-03 13:34:26', NULL, NULL, '2026-10-03 13:33:42', '2026-10-03 13:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `help_articles`
--

CREATE TABLE `help_articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `excerpt` varchar(500) DEFAULT NULL,
  `category` varchar(50) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  `helpful_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `not_helpful_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `related_feature` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `help_articles`
--

INSERT INTO `help_articles` (`id`, `slug`, `title`, `content`, `excerpt`, `category`, `icon`, `sort_order`, `is_published`, `helpful_count`, `not_helpful_count`, `related_feature`, `created_at`, `updated_at`) VALUES
(1, 'setting-up-your-workspace', 'Setting Up Your Workspace', 'Welcome to Dahimail! Your workspace is the central hub where your team collaborates on email outreach, manages contacts, and tracks deals. Setting it up correctly from the start will save you time and help your team work more efficiently.\n\nTo get started, head to Settings > Workspace from the sidebar. Here you can set your workspace name, upload your company logo, and configure your default timezone. These settings apply to all team members and affect how dates, times, and branding appear across the platform.\n\nNext, invite your team members by going to Settings > Team. You can send email invitations and assign roles like Admin, Manager, or Member. Each role has different permission levels, so choose carefully based on what each person needs to access.\n\nFinally, connect your first email account under Settings > Email. Dahimail supports Gmail, Outlook, and custom IMAP/SMTP servers. Once connected, you can start sending and receiving emails directly from the platform.\n\nTip: Complete the onboarding wizard that appears when you first sign in. It walks you through each of these steps and helps you get up and running in under 5 minutes.', 'Learn how to configure your Dahimail workspace for your team and start collaborating.', 'getting-started', NULL, 1, 1, 0, 0, 'onboarding', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(2, 'connecting-your-first-email-account', 'Connecting Your First Email Account', 'Connecting your email account allows you to send and receive messages directly within Dahimail, track opens and clicks, and keep your communication history organized alongside your contacts and deals.\n\nDahimail supports three types of email connections: Gmail (via OAuth), Microsoft Outlook (via OAuth), and custom IMAP/SMTP servers. For Gmail and Outlook, the process is straightforward. Navigate to Settings > Email and click \"Add Email Account.\" Select your provider and authorize Dahimail to access your account. No passwords are stored on our servers.\n\nFor custom IMAP/SMTP connections, you will need your incoming mail server address and port (usually 993 for IMAP with SSL), your outgoing mail server address and port (usually 587 for SMTP with TLS), and your email username and password. Enter these details in the connection form and click \"Test Connection\" to verify everything works before saving.\n\nOnce connected, Dahimail will begin syncing your recent emails. This initial sync may take a few minutes depending on the size of your mailbox. Going forward, new emails are synced in real time.\n\nImportant: Make sure your email provider allows third-party app access. For Gmail, you may need to enable \"Less secure app access\" or generate an App Password if you have 2FA enabled and are using IMAP directly.', 'Step-by-step guide to connecting Gmail, Outlook, or custom email accounts to Dahimail.', 'getting-started', NULL, 2, 1, 0, 0, 'email', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(3, 'understanding-the-dashboard', 'Understanding the Dashboard', 'The dashboard is the first thing you see when you log into Dahimail. It gives you a real-time overview of your email performance, contact activity, deal progress, and campaign results all in one place.\n\nAt the top, you will find key performance indicators (KPIs) like total emails sent, open rate, reply rate, and active deals value. These numbers update throughout the day and reflect your activity over the selected time period, which you can adjust using the date filter in the top right corner.\n\nBelow the KPIs, you will see activity charts showing your email volume and engagement trends over time. These help you spot patterns, such as which days of the week get the best response rates, or whether your outreach volume is trending up or down.\n\nThe Recent Activity feed shows the latest actions taken by you and your team, such as new contacts added, deals moved to a new stage, or campaigns launched. This keeps everyone aligned without needing to check each section individually.\n\nFinally, the Quick Actions section at the bottom provides shortcuts to common tasks like composing a new email, creating a campaign, or importing contacts. Use these to jump straight into your workflow without navigating through the sidebar.', 'A tour of the Dahimail dashboard and what each metric means for your business.', 'getting-started', NULL, 3, 1, 0, 0, 'dashboard', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(4, 'sending-your-first-email', 'Sending Your First Email', 'Sending an email from Dahimail is simple and gives you powerful tracking capabilities that regular email clients do not offer. Every email you send can be tracked for opens, clicks, and replies, giving you visibility into engagement.\n\nTo compose a new email, click the \"Compose\" button in the Inbox section, or use the keyboard shortcut C. The compose window will open with fields for the recipient, subject line, and message body. You can type an email address directly or start typing a contact name to search your contact list.\n\nThe email editor supports rich text formatting including bold, italic, bullet lists, links, and attachments. You can also insert email templates if you have created any, which is great for sending consistent follow-ups or introductions.\n\nBefore sending, you will notice tracking options at the bottom of the compose window. Open tracking adds a tiny invisible pixel to your email that lets you know when the recipient opens it. Click tracking wraps your links so you can see when they are clicked. Both are enabled by default but can be toggled off for individual emails.\n\nOnce you hit Send, the email goes out through your connected email account. It will appear in both Dahimail and your regular email client, so your sent folder stays in sync. You can monitor the email status in the Inbox view, where a small icon will show whether it has been opened or clicked.', 'How to compose and send an email from Dahimail with tracking enabled.', 'email', NULL, 10, 1, 0, 0, 'inbox', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(5, 'managing-email-accounts', 'Managing Email Accounts', 'Dahimail allows you to connect multiple email accounts to a single workspace. This is useful for teams where different members use different email addresses, or when you want to separate outreach for different brands or purposes.\n\nTo manage your email accounts, go to Settings > Email. Here you will see a list of all connected accounts with their sync status, last sync time, and daily sending limits. You can add new accounts, remove existing ones, or edit connection settings.\n\nEach email account has its own settings for signature, daily sending limit, and warm-up schedule. The daily sending limit helps protect your email reputation by preventing you from sending too many emails in a short period. We recommend starting with 50 emails per day for new accounts and gradually increasing as your sender reputation builds.\n\nEmail signatures can be customized per account. Go to the account settings and scroll to the Signature section to set up HTML signatures that will be automatically appended to your outgoing emails.\n\nIf an account shows a sync error, it usually means the connection has expired or your credentials have changed. Click \"Reconnect\" to re-authorize the account. For OAuth connections like Gmail and Outlook, this is just a one-click process.', 'Add, remove, and configure multiple email accounts in your workspace.', 'email', NULL, 11, 1, 0, 0, 'email', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(6, 'email-tracking-explained', 'Email Tracking Explained', 'Email tracking in Dahimail gives you visibility into how recipients interact with your emails. There are three types of tracking available: open tracking, click tracking, and reply detection.\n\nOpen tracking works by embedding a tiny, invisible 1x1 pixel image in your email. When the recipient opens the email and their email client loads images, the pixel is downloaded from our servers, recording the open event. Keep in mind that some email clients block images by default, so open tracking is not 100% accurate, but it gives you a reliable directional signal.\n\nClick tracking works by routing your email links through our tracking servers. When a recipient clicks a tracked link, the click is recorded and the recipient is immediately redirected to the original destination. This happens in milliseconds, so the experience is seamless for the recipient.\n\nReply detection is automatic. When someone replies to an email you sent through Dahimail, the reply is detected and logged against the contact record. This helps you track response rates across campaigns and individual outreach.\n\nYou can view tracking data at the individual email level in the conversation view, or in aggregate through the Analytics section. Tracking data is retained for the lifetime of your account and can be exported at any time.\n\nPrivacy note: All tracking complies with email best practices. Recipients can opt out of tracking by unsubscribing, and you can disable tracking on any individual email before sending.', 'Understand how open tracking, click tracking, and reply detection work.', 'email', NULL, 12, 1, 0, 0, 'inbox', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(7, 'importing-contacts-from-a-file', 'Importing Contacts from a File', 'Dahimail makes it easy to bring your existing contacts into the platform. You can import contacts from CSV or Excel files, and the import wizard will guide you through mapping your file columns to Dahimail contact fields.\n\nTo start an import, go to Contacts and click the \"Import\" button. Select your file (CSV or XLSX format) and upload it. On the next screen, you will see a preview of your data and a mapping interface where you can match each column in your file to the corresponding Dahimail field such as First Name, Last Name, Email, Company, Phone, and any custom fields you have created.\n\nDahimail will automatically detect and suggest mappings for common column names. For example, a column named \"Email Address\" will automatically map to the Email field. Review the suggested mappings and adjust any that are incorrect.\n\nDuring import, Dahimail checks for duplicate contacts based on email address. If a contact with the same email already exists, you can choose to skip duplicates, update existing records with new data, or create duplicates. We recommend choosing \"Update existing\" to keep your data fresh without creating duplicate entries.\n\nAfter the import completes, you will see a summary showing how many contacts were created, updated, and skipped. Any rows with errors (such as invalid email formats) will be listed so you can fix and re-import them. There is no limit on the number of contacts you can import at once, but very large files (over 100,000 rows) may take a few minutes to process.', 'Import your existing contacts into Dahimail using CSV or Excel files.', 'contacts', NULL, 20, 1, 0, 0, 'contacts', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(8, 'using-tags-and-segments', 'Using Tags and Segments', 'Tags and segments are two powerful ways to organize your contacts in Dahimail. While they serve similar purposes, they work differently and are best used for different scenarios.\n\nTags are simple labels you attach to contacts manually or via automation. For example, you might tag contacts as \"VIP\", \"Conference Lead\", or \"Churned Customer\". To add a tag, open a contact record and click the tag icon, then type a new tag name or select from existing tags. You can also bulk-tag contacts by selecting multiple contacts from the list and choosing \"Add Tag\" from the bulk actions menu.\n\nSegments are dynamic groups defined by rules and conditions. Unlike tags, segments update automatically as contact data changes. For example, you can create a segment for \"Contacts who opened an email in the last 30 days\" or \"Contacts in the Technology industry with more than 50 employees.\" To create a segment, go to Contacts and click \"New Segment.\" Build your rules using the condition builder, which supports filters on any contact field, activity data, and tag membership.\n\nBoth tags and segments can be used as audience targets for campaigns. When creating a campaign, you can select one or more tags or segments as your recipient list. Segments are particularly powerful here because they ensure your campaign always targets the most up-to-date group of contacts matching your criteria.\n\nBest practice: Use tags for permanent or semi-permanent categorizations (like lead source or customer tier), and use segments for dynamic, behavior-based groupings (like engagement level or purchase history).', 'Organize your contacts with tags and create dynamic segments for targeted outreach.', 'contacts', NULL, 21, 1, 0, 0, 'contacts', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(9, 'managing-contact-lists', 'Managing Contact Lists', 'A clean, well-organized contact database is the foundation of effective email outreach. Dahimail provides several tools to help you maintain data quality and keep your contact lists in order.\n\nThe Contacts page shows all your contacts in a sortable, filterable table. You can filter by any field, search by name or email, and sort by date added, last activity, or any custom field. Use the column selector to customize which fields are visible in the table.\n\nDuplicate detection and merging is available under Contacts > Merge Duplicates. Dahimail scans your database for contacts that share the same email address, phone number, or name, and presents them as potential duplicates. You can review each pair and choose which record to keep, merging the data from both into a single clean record.\n\nBulk operations let you perform actions on many contacts at once. Select contacts using the checkboxes and choose from bulk actions like Add Tag, Remove Tag, Delete, or Export. This is useful for cleaning up after an import or reorganizing your database.\n\nData enrichment automatically fills in missing contact information when possible. When you add a new contact with just an email address, Dahimail can look up additional details like company name, job title, and social profiles. This feature can be enabled in Settings > Contacts.\n\nRegular maintenance tip: Review your contacts quarterly. Archive or remove contacts who have bounced, unsubscribed, or shown no engagement in the past 6 months. This keeps your sending reputation healthy and your metrics accurate.', 'Keep your contact database clean and organized with list management tools.', 'contacts', NULL, 22, 1, 0, 0, 'contacts', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(10, 'creating-your-first-campaign', 'Creating Your First Campaign', 'Campaigns in Dahimail let you send personalized emails to many contacts at once while tracking performance across the entire send. Whether you are announcing a product launch, sharing a newsletter, or running a cold outreach sequence, campaigns make it efficient and measurable.\n\nTo create a campaign, go to Campaigns and click \"New Campaign.\" You will walk through four steps: naming your campaign, selecting your audience, composing your email, and reviewing before launch.\n\nIn the Audience step, choose who receives your campaign. You can select a tag, segment, or manually pick contacts. Dahimail will show you the estimated reach and automatically exclude any contacts who have unsubscribed or bounced in the past.\n\nThe Compose step is where you write your email. Use the drag-and-drop editor to build visually appealing emails, or switch to the plain text editor for simpler messages. Personalization variables like the contact first name and company name can be inserted using double curly braces. Preview your email to see how it looks with real contact data.\n\nBefore launching, the Review step shows you a summary of everything: recipient count, email preview, tracking settings, and sending schedule. You can choose to send immediately or schedule for a future date and time. For large campaigns, Dahimail automatically throttles sending to protect your email reputation.\n\nAfter your campaign is sent, the Campaign Report page shows real-time metrics including delivery rate, open rate, click rate, reply rate, and unsubscribe rate. Use these insights to refine your messaging and targeting for future campaigns.', 'Build and launch your first email campaign to reach your audience at scale.', 'campaigns', NULL, 30, 1, 0, 0, 'campaigns', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(11, 'understanding-ab-testing', 'Understanding A/B Testing', 'A/B testing (also called split testing) lets you compare two versions of your email to see which performs better. This is one of the most effective ways to improve your open rates and engagement over time.\n\nWhen creating a campaign, you can enable A/B testing in the Compose step. Dahimail supports testing different subject lines, email content, or sender names. The most common test is subject line testing, which helps you discover what language and tone drives the most opens.\n\nHere is how it works: You create two (or more) variants of your email, each with a different element you want to test. Dahimail sends each variant to a small, equal portion of your audience (the test group, typically 10-20% each). After a waiting period you choose (usually 2-4 hours), Dahimail measures the results and automatically sends the winning variant to the remaining audience.\n\nThe winning variant is determined by the metric you select: open rate for subject line tests, click rate for content tests, or reply rate for more advanced optimization. You can also choose to select the winner manually if you prefer to review the results yourself.\n\nBest practices for A/B testing: Test only one variable at a time so you know exactly what caused the difference. Make sure your test group is large enough to produce statistically meaningful results, ideally at least 200 recipients per variant. Run tests consistently over time to build up insights about what works for your specific audience.\n\nAfter the campaign completes, the report will show detailed results for each variant so you can apply your learnings to future campaigns.', 'Test different subject lines and content to find what resonates with your audience.', 'campaigns', NULL, 31, 1, 0, 0, 'campaigns', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(12, 'setting-up-drip-sequences', 'Setting Up Drip Sequences', 'Drip sequences are automated email series that send follow-up messages at scheduled intervals. They are perfect for onboarding new subscribers, nurturing leads, or following up after a meeting without manually remembering to send each email.\n\nTo create a drip sequence, go to Campaigns and click \"New Campaign,\" then select the \"Drip Sequence\" type. You will build a sequence of emails, each with its own content, delay, and conditions.\n\nStart by creating your first email in the sequence. This is the email that goes out immediately (or at your chosen start time) when a contact enters the sequence. Then add follow-up steps with delays between them. For example, you might send Email 1 on Day 0, Email 2 on Day 3, and Email 3 on Day 7.\n\nEach step in the sequence can have conditions that determine whether the email sends. Common conditions include: send only if the previous email was not replied to, send only if the contact has not unsubscribed, or send only if the contact has opened a previous email. These conditions help you avoid annoying contacts who have already engaged.\n\nContacts can enter the drip sequence in several ways: manually by adding them from the contact list, automatically via a workflow trigger (for example, when a new contact is created), or through a campaign audience selection.\n\nMonitor your drip sequence performance in the Campaign Report. You will see metrics for each step individually, plus an overall funnel view showing how contacts move through the sequence. Pause or modify the sequence at any time without affecting contacts who have already received earlier steps.', 'Create automated multi-step email sequences that send over days or weeks.', 'campaigns', NULL, 32, 1, 0, 0, 'campaigns', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(13, 'what-are-workflows', 'What Are Workflows?', 'Workflows are automated sequences of actions that run in response to triggers. Think of them as \"if this happens, then do that\" rules that work around the clock so you do not have to perform repetitive tasks manually.\n\nFor example, you can create a workflow that automatically tags a contact as \"Hot Lead\" when they open three or more of your emails, then assigns them to a sales rep, and sends a Slack notification to your team. All of this happens without any manual intervention.\n\nWorkflows consist of three main building blocks: Triggers are events that start the workflow, such as \"Contact created,\" \"Email opened,\" \"Deal stage changed,\" or \"Form submitted.\" Conditions are rules that decide whether the workflow should continue, like \"If contact industry equals Technology\" or \"If deal value is greater than $10,000.\" Actions are the tasks the workflow performs, such as \"Send email,\" \"Add tag,\" \"Create deal,\" \"Wait 2 days,\" or \"Send webhook.\"\n\nYou build workflows visually using the drag-and-drop Workflow Builder. Connect triggers, conditions, and actions by dragging lines between them. The visual interface makes it easy to understand the logic at a glance and share workflows with team members.\n\nWorkflows run automatically once activated. You can monitor their execution in the Workflow Logs, where you will see each instance of the workflow running, which contacts it processed, and whether each step succeeded or failed. If a step fails, the workflow pauses and notifies you so you can investigate and fix the issue.', 'Learn how workflows automate repetitive tasks and save your team hours every week.', 'workflows', NULL, 40, 1, 0, 0, 'workflows', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(14, 'creating-your-first-automation', 'Creating Your First Automation', 'Building your first workflow is straightforward with Dahimail\'s visual builder. Let us walk through creating a common automation: automatically following up with new contacts who do not reply to your initial email.\n\nGo to Workflows and click \"Create Workflow.\" Give it a name like \"New Contact Follow-up\" and click \"Open Builder.\" You will see a blank canvas with a Start node.\n\nFirst, add a trigger by clicking the plus icon on the Start node. Select \"Email Sent\" as the trigger type. This means the workflow will start whenever you send an email to a contact. You can add filter conditions on the trigger, such as only triggering for emails with a specific tag or from a specific email account.\n\nNext, add a \"Wait\" action and set the delay to 3 days. This gives the recipient time to see and respond to your email before the follow-up kicks in.\n\nAfter the wait, add a \"Condition\" node to check whether the contact has replied. Select \"Has replied\" as the condition. If yes, the workflow ends (the contact engaged and does not need a follow-up). If no, the workflow continues to the next step.\n\nOn the \"No\" branch, add a \"Send Email\" action. Compose your follow-up email here. You might say something like \"Just checking in on my previous email\" with a brief reminder of your original message.\n\nSave and activate the workflow. From now on, every email you send will automatically get a follow-up after 3 days if the contact has not replied. You can view the results in Workflow Logs to see how many contacts received follow-ups and whether engagement improved.\n\nTip: Start simple and iterate. Once you are comfortable with basic workflows, explore more advanced features like multi-branch conditions, webhook integrations, and nested workflows.', 'Step-by-step guide to building a simple workflow automation.', 'workflows', NULL, 41, 1, 0, 0, 'workflows', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(15, 'setting-up-your-sales-pipeline', 'Setting Up Your Sales Pipeline', 'The Deals section in Dahimail provides a visual pipeline (Kanban board) for tracking your sales opportunities from first contact to closed deal. Before you start using it, you will want to configure the stages to match your specific sales process.\n\nTo set up your pipeline, go to Deals and click the gear icon. Here you can create, rename, reorder, and delete deal stages. The default stages are Lead, Qualified, Proposal, Negotiation, and Closed Won / Closed Lost, but you should customize these to match how your team actually sells.\n\nKeep your pipeline stages simple and actionable. Each stage should represent a clear milestone in your sales process. Avoid having too many stages (5-7 is ideal) as it makes the board harder to manage. Each stage should answer the question \"What needs to happen before this deal moves to the next stage?\"\n\nWhen creating a new deal, you will fill in the contact or company name, deal value, expected close date, and assign it to a team member. The deal will appear as a card on your pipeline board. Drag and drop cards between stages as deals progress.\n\nEach deal card shows key information at a glance: the deal name, value, contact name, and how long it has been in the current stage. Click a deal to open its detail view, where you can see the full history of activities, emails, notes, and stage changes.\n\nFor teams with multiple sales processes (for example, new business vs. renewals), you can create separate pipelines. Each pipeline has its own stages and can be filtered independently. Use the pipeline selector at the top of the Deals page to switch between them.', 'Configure deal stages and pipelines to match your sales process.', 'deals', NULL, 50, 1, 0, 0, 'deals', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(16, 'managing-deals', 'Managing Deals', 'Once your pipeline is set up, managing deals day-to-day is about keeping your pipeline accurate and up-to-date so you can forecast revenue and prioritize your time effectively.\n\nThe deal board gives you a visual overview of your entire pipeline. Deals are displayed as cards in their current stage, and you can drag them between stages as they progress. The total value of deals in each stage is shown at the top of each column, giving you an instant snapshot of your pipeline health.\n\nTo update a deal, click on it to open the detail view. Here you can change the deal value, update the expected close date, add notes about your latest conversation, and log activities like calls, meetings, or emails. All of these updates are timestamped and visible to your team.\n\nDeals are linked to contacts, so all email conversations and activity with the associated contact are visible in the deal view. This means you never lose context when following up. If a deal involves multiple contacts (for example, a champion and a decision maker), you can associate multiple contacts with a single deal.\n\nUse filters and sorting to focus your attention. Filter deals by stage, owner, value range, or expected close date. Sort by value to focus on your biggest opportunities, or by age to identify deals that are stuck and need attention.\n\nWhen a deal is won or lost, move it to the appropriate final stage. Dahimail will prompt you to record a reason for the outcome, which builds up valuable data over time about why you win and lose deals. This information appears in the Analytics section to help you improve your sales process.', 'Track deal progress, add notes, and close deals effectively.', 'deals', NULL, 51, 1, 0, 0, 'deals', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(17, 'configuring-ai-responses', 'Configuring AI Responses', 'Dahimail\'s AI assistant helps you write better emails faster by drafting replies, suggesting follow-ups, and improving your existing copy. To get the most out of it, you should configure it to understand your communication style and business context.\n\nGo to Settings > AI to access the AI configuration panel. The first thing to set up is your AI provider. Dahimail supports multiple AI providers including OpenAI, Anthropic, and Google. Enter your API key for your preferred provider and select the model you want to use. More powerful models produce better results but consume more tokens.\n\nThe Tone and Style settings let you tell the AI how you communicate. Options include Professional, Friendly, Casual, and Formal. You can also provide custom instructions like \"Always mention our free trial\" or \"Keep emails under 150 words.\" These instructions apply to all AI-generated content across your workspace.\n\nThe AI assistant appears in several places throughout Dahimail: in the email composer (click the AI icon to generate a draft or improve your writing), in the inbox (suggested replies appear below incoming emails), and in the campaign editor (use AI to generate subject lines, body copy, or A/B test variants).\n\nYou can control how much the AI assists by toggling individual features on or off. Some teams prefer to use AI only for reply suggestions, while others use it for everything from drafting outreach to generating campaign content.\n\nUsage tracking shows your monthly token consumption and helps you stay within budget. Set a monthly token limit to prevent unexpected charges from your AI provider.', 'Set up and customize the AI assistant to draft emails and suggest replies.', 'ai', NULL, 60, 1, 0, 0, 'ai', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(18, 'training-ai-with-knowledge-base', 'Training Your AI with Knowledge Base', 'The Knowledge Base in Dahimail serves as the AI\'s training data. By uploading your company documents, product guides, FAQs, and other reference materials, you give the AI the context it needs to generate accurate, brand-consistent responses.\n\nTo add documents, go to Knowledge Base from the sidebar. Click \"Upload Document\" and select a file. Supported formats include PDF, Word documents, text files, and Markdown. You can also paste content directly using the \"Add from Text\" option.\n\nOnce uploaded, Dahimail processes the document by breaking it into smaller chunks and creating searchable embeddings. This process takes a few seconds to a couple of minutes depending on the document length. When complete, the AI can reference this information when generating replies and drafts.\n\nOrganize your documents with categories and tags to keep things manageable. Common categories include Product Information, Pricing, FAQs, Company Policies, and Competitor Comparisons. Well-organized knowledge base content leads to more relevant and accurate AI responses.\n\nThe AI uses the knowledge base contextually. When someone asks about pricing in an email, the AI will search your knowledge base for pricing-related documents and use that information to draft a response. It will not make up information; if the answer is not in the knowledge base, the AI will indicate that it does not have enough information.\n\nKeep your knowledge base up to date. Whenever your products, pricing, or policies change, update the relevant documents. Outdated information leads to outdated AI responses, which can confuse customers and damage trust.', 'Upload documents to the Knowledge Base so the AI gives accurate, on-brand answers.', 'ai', NULL, 61, 1, 0, 0, 'knowledge-base', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(19, 'understanding-ai-settings', 'Understanding AI Settings', 'Dahimail\'s AI configuration has several settings that control how the assistant behaves. Here is what each one does in plain language so you can tune it for your needs.\n\nCreativity Level (Temperature) controls how creative versus predictable the AI responses are. A lower value (around 0.3) produces consistent, safe responses that closely follow your knowledge base. A higher value (around 0.8 or above) produces more varied and creative responses. For business emails, we recommend a value between 0.5 and 0.7.\n\nMaximum Response Length sets how long the AI replies can be. Short responses are a few sentences, medium is one or two paragraphs, and long allows detailed multi-paragraph answers. Match this to your typical email style. If your team writes concise emails, keep this on Short or Medium.\n\nConfidence Threshold determines how sure the AI needs to be before taking action in automatic mode. At 80%, the AI only sends replies when it is very confident the response is correct. At 50%, it sends more frequently but may occasionally miss the mark. Start with a high threshold and lower it as you build trust in the AI.\n\nSend Mode controls the level of automation. \"Suggestions Only\" shows AI-drafted responses that you copy and paste. \"Review Before Sending\" queues drafts for your approval. \"Fully Automatic\" lets the AI send responses on its own when confidence is above your threshold.\n\nBusiness Hours restricts AI activity to your configured working hours. Outside of business hours, the AI can optionally send a custom out-of-office message instead of a full reply. Configure your business hours in Settings > Workspace.', 'A plain-language explanation of each AI setting and what it controls.', 'ai', NULL, 62, 1, 0, 0, 'ai', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(20, 'managing-your-subscription', 'Managing Your Subscription', 'Dahimail offers several subscription plans to fit teams of different sizes and needs. You can manage your subscription at any time from Settings > Billing.\n\nThe Billing page shows your current plan, billing cycle (monthly or annual), next payment date, and payment method on file. You can see a breakdown of what is included in your plan, such as the number of email accounts, contacts, monthly emails, and AI tokens.\n\nTo upgrade your plan, click \"Change Plan\" and select a higher tier. Upgrades take effect immediately, and you will be charged a prorated amount for the remainder of your current billing period. All your data and settings are preserved when you upgrade.\n\nDowngrading works similarly but takes effect at the end of your current billing period. This means you continue to enjoy your current plan features until the period ends, then switch to the lower plan. If your current usage exceeds the limits of the lower plan (for example, more connected email accounts than allowed), you will need to adjust before the downgrade takes effect.\n\nTo update your payment method, click \"Update Payment Method\" and enter your new card details. Dahimail supports all major credit and debit cards, as well as several regional payment methods depending on your location.\n\nInvoices are available for download in the Billing History section. Each invoice includes all the details you need for expense reporting or tax purposes. If you need a custom invoice with specific billing information (like a VAT number or purchase order), you can configure these details in the Billing Settings.', 'Upgrade, downgrade, or cancel your plan and manage payment methods.', 'billing', NULL, 70, 1, 0, 0, 'billing', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(21, 'understanding-plan-limits', 'Understanding Plan Limits', 'Each Dahimail plan comes with specific limits on features like connected email accounts, total contacts, monthly email sends, AI tokens, and team members. Understanding these limits helps you choose the right plan and avoid unexpected interruptions.\n\nYour current usage vs. plan limits is displayed on the Dashboard and in Settings > Billing. A usage bar shows how close you are to each limit. When you reach 80% of any limit, Dahimail will display a notification suggesting you review your plan.\n\nWhen you hit a limit, Dahimail does not immediately cut off access. Instead, the behavior depends on the limit type. For email sending limits, additional sends are queued and will go out when the limit resets (monthly). For contact limits, you can still view and email existing contacts but cannot add new ones. For AI token limits, AI features are temporarily disabled until the next billing cycle or until you upgrade.\n\nIf you consistently hit your limits, consider upgrading to the next plan tier. Annual billing offers a significant discount compared to monthly billing, so switching to annual can offset the cost of an upgrade.\n\nFor teams with unique needs that do not fit standard plans, contact our sales team to discuss custom enterprise pricing. Enterprise plans offer custom limits, dedicated support, SLA guarantees, and additional features like SSO and audit logging.\n\nTip: Monitor the Usage section in your Dashboard regularly. This helps you anticipate when you might hit a limit and take action proactively, whether that means cleaning up your contact list, optimizing your campaign frequency, or upgrading your plan.', 'Know what is included in your plan and what happens when you reach a limit.', 'billing', NULL, 71, 1, 0, 0, 'billing', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(22, 'connecting-integrations', 'Connecting Integrations', 'Dahimail integrates with popular business tools to streamline your workflow and keep your data in sync across platforms. Available integrations include Slack, Salesforce, Google Calendar, Zapier, and more.\n\nTo connect an integration, go to Settings > Integrations. You will see a grid of available integrations, each with a brief description of what it does. Click \"Connect\" on the integration you want to set up.\n\nSlack integration sends real-time notifications to your Slack channels when important events happen in Dahimail, such as new deals created, campaigns completed, or high-value emails opened. You can customize which events trigger notifications and which channel receives them.\n\nSalesforce integration syncs your contacts, deals, and activity data between Dahimail and Salesforce. This is a two-way sync, so changes in either platform are reflected in the other. Set up field mapping to control exactly which fields sync and in which direction.\n\nGoogle Calendar integration shows your upcoming meetings in the Dahimail sidebar and lets you schedule meetings directly from contact records. When you create a meeting, it automatically appears on your Google Calendar with all relevant details.\n\nZapier integration opens up connections to thousands of other apps. Create Zaps that trigger Dahimail actions based on events in other apps, or send Dahimail data to external services. Common use cases include syncing form submissions to Dahimail contacts, creating deals from CRM events, and logging activity to spreadsheets.\n\nEach integration can be disconnected at any time without losing your Dahimail data. Go to Settings > Integrations, find the connected integration, and click \"Disconnect.\"', 'Connect Dahimail to Slack, Salesforce, Google Calendar, and other tools.', 'integrations', NULL, 80, 1, 0, 0, 'integrations', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(23, 'email-not-syncing', 'Email Not Syncing?', 'If your emails are not syncing between Dahimail and your email provider, there are several common causes and solutions to try.\n\nFirst, check your email account status in Settings > Email. If the account shows a red error indicator, click on it to see the specific error message. The most common issue is an expired OAuth token, which can be fixed by clicking \"Reconnect\" and re-authorizing Dahimail with your email provider.\n\nFor Gmail accounts, make sure you have not revoked Dahimail\'s access. Go to your Google Account settings (myaccount.google.com), navigate to Security > Third-party apps with account access, and verify that Dahimail is listed. If it was removed, reconnect from Settings > Email in Dahimail.\n\nFor Outlook accounts, check that your Microsoft 365 admin has not disabled third-party app access. If your organization uses conditional access policies, Dahimail may need to be whitelisted by your IT administrator.\n\nFor IMAP/SMTP accounts, verify that your server credentials have not changed. If your email provider requires an app-specific password (common when 2FA is enabled), make sure you are using the app password and not your regular account password.\n\nIf the account shows as connected but emails are still not appearing, try these steps: click the \"Force Sync\" button on the account settings page to trigger an immediate sync, check if your email provider is experiencing an outage (check their status page), and verify that your mailbox is not full, as some providers stop syncing when storage is exceeded.\n\nIf none of these solutions work, contact our support team with your account email and the error message you are seeing. We can check the server-side logs to identify the exact issue.', 'Fix common email sync issues and get your inbox back up and running.', 'troubleshooting', NULL, 90, 1, 0, 0, 'email', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(24, 'campaign-not-sending', 'Campaign Not Sending?', 'If your campaign appears stuck or recipients are not receiving your emails, here are the most common causes and how to fix them.\n\nFirst, check the campaign status on the Campaigns page. A campaign can be in several states: Draft (not yet launched), Scheduled (waiting for the scheduled send time), Sending (actively delivering), Paused (manually paused or auto-paused due to an issue), and Completed (all emails sent). If your campaign is in Draft or Scheduled status, it has not started sending yet.\n\nIf the campaign shows as \"Sending\" but progress seems slow, this is likely due to sending throttling. Dahimail automatically limits sending speed to protect your email reputation. For new email accounts, the default is 50 emails per hour. You can adjust this in Settings > Email under the account\'s sending limits, but we recommend increasing gradually.\n\nIf the campaign is \"Paused,\" click on it to see why. Common auto-pause reasons include a high bounce rate (more than 5% of emails bounced, indicating a list quality issue), the connected email account becoming disconnected, or hitting your plan\'s daily sending limit. Address the underlying issue and click \"Resume\" to continue sending.\n\nCheck the campaign report for delivery details. The report shows how many emails were sent, delivered, bounced, and deferred. High bounce rates usually mean your contact list needs cleaning. Remove invalid email addresses and re-verify your list before resuming.\n\nIf recipients say they are not seeing your emails, ask them to check their spam or promotions folder. Email deliverability depends on many factors including your sender reputation, email content, and the recipient\'s email provider. Make sure your sending domain has proper SPF, DKIM, and DMARC records configured. You can verify this in Settings > Email > Deliverability Check.\n\nFor campaigns using a drip sequence, check that the conditions between steps are not filtering out all recipients. A common mistake is setting a condition like \"If not replied\" when no one has replied yet, causing the workflow to wait indefinitely.', 'Troubleshoot campaigns that are stuck, paused, or not delivering to recipients.', 'troubleshooting', NULL, 91, 1, 0, 0, 'campaigns', '2026-09-27 08:25:22', '2026-09-27 08:25:22');

-- --------------------------------------------------------

--
-- Table structure for table `invites`
--

CREATE TABLE `invites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `invited_by` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('admin','agent','viewer') NOT NULL DEFAULT 'agent',
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `token` varchar(64) NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `accepted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'integrations', '{\"uuid\":\"7a5ad5a2-7374-4742-b4da-d9849cb350a6\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:20:\\\"handleContactCreated\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\ContactCreated\\\":1:{s:7:\\\"contact\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Contact\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790518036,\"delay\":null}', 0, NULL, 1790518036, 1790518036),
(2, 'integrations', '{\"uuid\":\"de36e920-3537-4999-b2aa-064b2c42f0c9\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:20:\\\"handleContactCreated\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\ContactCreated\\\":1:{s:7:\\\"contact\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Contact\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790518036,\"delay\":null}', 0, NULL, 1790518036, 1790518036),
(3, 'default', '{\"uuid\":\"e441c5ea-1948-4663-9b40-487ec4ae8311\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790518037,\"delay\":null}', 0, NULL, 1790518037, 1790518037),
(4, 'integrations', '{\"uuid\":\"e8b9cd16-f189-4336-90c1-916a9626fadc\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790518037,\"delay\":null}', 0, NULL, 1790518037, 1790518037),
(5, 'integrations', '{\"uuid\":\"f4d58c62-e834-48c9-8ee7-44a1003626cf\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790518037,\"delay\":null}', 0, NULL, 1790518037, 1790518037),
(6, 'integrations', '{\"uuid\":\"86b3fdc2-c5d7-4ee8-8f46-50db4de63f67\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:20:\\\"handleContactCreated\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\ContactCreated\\\":1:{s:7:\\\"contact\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Contact\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790522015,\"delay\":null}', 0, NULL, 1790522015, 1790522015),
(7, 'integrations', '{\"uuid\":\"2befde05-06e6-41a8-bdfc-1c9509e7883a\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:20:\\\"handleContactCreated\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\ContactCreated\\\":1:{s:7:\\\"contact\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Contact\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790522015,\"delay\":null}', 0, NULL, 1790522015, 1790522015),
(8, 'default', '{\"uuid\":\"965fc350-6c1f-4d25-8a2a-5f82b0b70f00\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790522015,\"delay\":null}', 0, NULL, 1790522015, 1790522015),
(9, 'integrations', '{\"uuid\":\"ffd0bbcb-e2be-4ada-890f-1f38fea43055\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790522015,\"delay\":null}', 0, NULL, 1790522015, 1790522015),
(10, 'integrations', '{\"uuid\":\"f55a5430-39af-4cfa-8ee1-13b44b987954\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790522015,\"delay\":null}', 0, NULL, 1790522015, 1790522015),
(11, 'integrations', '{\"uuid\":\"681b3573-90aa-4bca-8816-69a6e3e7b6d5\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:20:\\\"handleContactCreated\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\ContactCreated\\\":1:{s:7:\\\"contact\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Contact\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790664548,\"delay\":null}', 0, NULL, 1790664548, 1790664548),
(12, 'integrations', '{\"uuid\":\"7f5bf030-9e92-49f7-83b8-4208bcc5294f\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:20:\\\"handleContactCreated\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\ContactCreated\\\":1:{s:7:\\\"contact\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Contact\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790664548,\"delay\":null}', 0, NULL, 1790664548, 1790664548),
(13, 'default', '{\"uuid\":\"b456d501-dfc1-48f3-823c-8bad56fd7b3e\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790664548,\"delay\":null}', 0, NULL, 1790664548, 1790664548),
(14, 'integrations', '{\"uuid\":\"7139b2a5-0a48-466c-84eb-8208b69f6ca7\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790664548,\"delay\":null}', 0, NULL, 1790664548, 1790664548),
(15, 'integrations', '{\"uuid\":\"e0b8c9b1-62bc-4d66-8dc9-f26d6cba17c5\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790664548,\"delay\":null}', 0, NULL, 1790664548, 1790664548),
(16, 'default', '{\"uuid\":\"bd4d04d5-4327-4e45-81eb-df88a268cb5a\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:8;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790664548,\"delay\":null}', 0, NULL, 1790664548, 1790664548),
(17, 'integrations', '{\"uuid\":\"cbdaa11d-7ed4-4f24-ba9f-d3bac51e205e\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:8;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790664548,\"delay\":null}', 0, NULL, 1790664548, 1790664548),
(18, 'integrations', '{\"uuid\":\"1fc67c08-4f41-42ca-98cf-b5de1054add4\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:8;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790664548,\"delay\":null}', 0, NULL, 1790664548, 1790664548),
(19, 'integrations', '{\"uuid\":\"9c105f5f-2caa-4223-b04f-11189dd26269\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:20:\\\"handleContactCreated\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\ContactCreated\\\":1:{s:7:\\\"contact\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Contact\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790664843,\"delay\":null}', 0, NULL, 1790664843, 1790664843),
(20, 'integrations', '{\"uuid\":\"9639c973-01db-4c46-9356-7c8f5b7b710d\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:20:\\\"handleContactCreated\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\ContactCreated\\\":1:{s:7:\\\"contact\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Contact\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790664843,\"delay\":null}', 0, NULL, 1790664843, 1790664843),
(21, 'default', '{\"uuid\":\"bffffabe-24e5-48bf-a412-f92bc344fd2c\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:16;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:9;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790664844,\"delay\":null}', 0, NULL, 1790664844, 1790664844),
(22, 'integrations', '{\"uuid\":\"2137ef2d-f863-4faf-92b3-d27d0a05da13\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:16;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:9;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790664844,\"delay\":null}', 0, NULL, 1790664844, 1790664844),
(23, 'integrations', '{\"uuid\":\"03f4fb73-f77c-42f5-853d-79821eef5a74\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:16;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:9;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790664844,\"delay\":null}', 0, NULL, 1790664844, 1790664844),
(24, 'default', '{\"uuid\":\"4c170aca-f56a-4548-ae15-c19c17173663\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:20;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790705053,\"delay\":null}', 0, NULL, 1790705053, 1790705053),
(25, 'integrations', '{\"uuid\":\"5963c959-8822-4dd4-ad67-9ce890917de6\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:20;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790705053,\"delay\":null}', 0, NULL, 1790705053, 1790705053),
(26, 'integrations', '{\"uuid\":\"71a0afd7-05d8-4e88-8952-2c979125b3e3\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:20;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790705053,\"delay\":null}', 0, NULL, 1790705053, 1790705053),
(27, 'default', '{\"uuid\":\"f8cd6324-87f5-4dd9-8aed-f375cf8b0fef\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:21;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790747172,\"delay\":null}', 0, NULL, 1790747172, 1790747172);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(28, 'integrations', '{\"uuid\":\"a5701755-1161-4989-b4cf-6f9ca911fc4b\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:21;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790747172,\"delay\":null}', 0, NULL, 1790747172, 1790747172),
(29, 'integrations', '{\"uuid\":\"bb403f9d-df6d-4249-86b8-2cfc11287604\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:21;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790747172,\"delay\":null}', 0, NULL, 1790747172, 1790747172),
(30, 'integrations', '{\"uuid\":\"a6a5a39a-bc08-4102-a6c7-6bdf51233e46\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:20:\\\"handleContactCreated\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\ContactCreated\\\":1:{s:7:\\\"contact\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Contact\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790749154,\"delay\":null}', 0, NULL, 1790749154, 1790749154),
(31, 'integrations', '{\"uuid\":\"7fcffc35-b2e9-4d7d-b387-01a5f115241a\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:20:\\\"handleContactCreated\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\ContactCreated\\\":1:{s:7:\\\"contact\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Contact\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790749154,\"delay\":null}', 0, NULL, 1790749154, 1790749154),
(32, 'default', '{\"uuid\":\"4c7a28dd-8122-4b6a-ac84-dc0df989b436\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:22;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790749155,\"delay\":null}', 0, NULL, 1790749155, 1790749155),
(33, 'integrations', '{\"uuid\":\"21a619dc-a67f-4549-aba8-453a8c228d4a\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:22;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790749155,\"delay\":null}', 0, NULL, 1790749155, 1790749155),
(34, 'integrations', '{\"uuid\":\"badccd67-401b-486e-bceb-83591e59f807\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:22;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790749155,\"delay\":null}', 0, NULL, 1790749155, 1790749155),
(35, 'integrations', '{\"uuid\":\"262810d5-11de-4559-9d8c-21e4518a0bc2\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:20:\\\"handleContactCreated\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\ContactCreated\\\":1:{s:7:\\\"contact\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Contact\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790749189,\"delay\":null}', 0, NULL, 1790749189, 1790749189),
(36, 'integrations', '{\"uuid\":\"6c5e4953-4048-482c-90cd-91ca763f8e99\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:20:\\\"handleContactCreated\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\ContactCreated\\\":1:{s:7:\\\"contact\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Contact\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790749189,\"delay\":null}', 0, NULL, 1790749189, 1790749189),
(37, 'default', '{\"uuid\":\"e7c4bb81-1e67-4ae9-b5fb-fb46f02e22ab\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:24;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:17;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790774076,\"delay\":null}', 0, NULL, 1790774076, 1790774076),
(38, 'integrations', '{\"uuid\":\"4c66bcab-74d3-4ff5-80fe-302294cb427d\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:24;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:17;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790774076,\"delay\":null}', 0, NULL, 1790774076, 1790774076),
(39, 'integrations', '{\"uuid\":\"023925f4-18db-4f5c-9bd6-ae27c6f158f5\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:24;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:17;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790774076,\"delay\":null}', 0, NULL, 1790774076, 1790774076),
(40, 'default', '{\"uuid\":\"429abe6c-11e6-4dd7-9404-db379aa68725\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:25;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:18;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790776091,\"delay\":null}', 0, NULL, 1790776091, 1790776091),
(41, 'integrations', '{\"uuid\":\"a3ff8c02-72bf-4166-924c-d6bc2287c357\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:25;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:18;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790776092,\"delay\":null}', 0, NULL, 1790776092, 1790776092),
(42, 'integrations', '{\"uuid\":\"5b517841-3840-42d8-acd7-ce0c24b8c0b5\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:25;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:18;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790776092,\"delay\":null}', 0, NULL, 1790776092, 1790776092),
(43, 'default', '{\"uuid\":\"0cc1fba5-445f-469a-b86b-f6a6fc5e987f\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:26;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:19;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790777057,\"delay\":null}', 0, NULL, 1790777057, 1790777057),
(44, 'integrations', '{\"uuid\":\"02f57c3e-f2a3-408e-9452-b0278f97c666\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:26;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:19;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790777057,\"delay\":null}', 0, NULL, 1790777057, 1790777057),
(45, 'integrations', '{\"uuid\":\"fbb12097-e3d8-486b-984b-d15bc4a13a43\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:26;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:19;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790777057,\"delay\":null}', 0, NULL, 1790777057, 1790777057),
(46, 'default', '{\"uuid\":\"1af152f4-b62b-419a-a7e3-f60d415fa382\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:27;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:20;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790777176,\"delay\":null}', 0, NULL, 1790777176, 1790777176),
(47, 'integrations', '{\"uuid\":\"d4854193-c935-4d6f-8ff8-c9a0183fb4d5\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:27;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:20;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790777176,\"delay\":null}', 0, NULL, 1790777176, 1790777176),
(48, 'integrations', '{\"uuid\":\"e618e053-e1fc-451a-b420-330a001bbf8c\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:27;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:20;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790777176,\"delay\":null}', 0, NULL, 1790777176, 1790777176),
(49, 'default', '{\"uuid\":\"2dafd364-5421-4c76-85c2-2eefab8a135c\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:28;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:21;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790777901,\"delay\":null}', 0, NULL, 1790777901, 1790777901),
(50, 'integrations', '{\"uuid\":\"74528b18-f745-4226-a2ce-e53ad56dbc16\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:28;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:21;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790777901,\"delay\":null}', 0, NULL, 1790777901, 1790777901),
(51, 'integrations', '{\"uuid\":\"45cb79e7-cf78-4e20-a63c-8219d6939658\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:28;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:21;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790777901,\"delay\":null}', 0, NULL, 1790777901, 1790777901),
(52, 'default', '{\"uuid\":\"45d05a2c-4615-448f-8e12-b784dccf5882\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:29;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:22;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790777901,\"delay\":null}', 0, NULL, 1790777901, 1790777901),
(53, 'integrations', '{\"uuid\":\"de5c3009-874d-41be-b394-34ae767ba56e\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:29;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:22;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790777901,\"delay\":null}', 0, NULL, 1790777901, 1790777901);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(54, 'integrations', '{\"uuid\":\"5a071d5e-bbb7-4647-a129-26d604c5ac9f\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:29;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:22;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790777901,\"delay\":null}', 0, NULL, 1790777901, 1790777901),
(55, 'default', '{\"uuid\":\"3a6d98ff-80a2-4f96-8bb6-49cb975ec07c\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:30;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:23;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790836907,\"delay\":null}', 0, NULL, 1790836907, 1790836907),
(56, 'integrations', '{\"uuid\":\"0c1d1828-a487-4e6a-ac56-274d528fb653\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:30;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:23;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790836907,\"delay\":null}', 0, NULL, 1790836907, 1790836907),
(57, 'integrations', '{\"uuid\":\"7db1e5df-c5b2-4573-a75e-be8aa3dd62ba\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:30;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:23;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790836907,\"delay\":null}', 0, NULL, 1790836907, 1790836907),
(58, 'default', '{\"uuid\":\"5f560d04-6526-4fe4-8a05-b50abf3d716f\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:31;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:24;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790836907,\"delay\":null}', 0, NULL, 1790836907, 1790836907),
(59, 'integrations', '{\"uuid\":\"e7bf6ee1-c05d-4061-8ac8-21c977ab1a6a\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:31;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:24;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790836907,\"delay\":null}', 0, NULL, 1790836907, 1790836907),
(60, 'integrations', '{\"uuid\":\"5a6c170d-43ff-4786-983e-d5c43a6c874d\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:31;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:24;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790836907,\"delay\":null}', 0, NULL, 1790836907, 1790836907),
(61, 'default', '{\"uuid\":\"1e711fe1-256c-44a0-85be-2caaff77f8f7\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:32;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:25;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790836918,\"delay\":null}', 0, NULL, 1790836918, 1790836918),
(62, 'integrations', '{\"uuid\":\"e8fc6957-b447-4657-b686-ef502b0d2e3a\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:32;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:25;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790836918,\"delay\":null}', 0, NULL, 1790836918, 1790836918),
(63, 'integrations', '{\"uuid\":\"d3cf0af3-67db-405d-aff2-8ef2dbe1bb05\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:32;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:25;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790836918,\"delay\":null}', 0, NULL, 1790836918, 1790836918),
(64, 'default', '{\"uuid\":\"0856eda1-36e9-4608-a7bd-971fa469d0c8\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:34;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:27;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790949930,\"delay\":null}', 0, NULL, 1790949930, 1790949930),
(65, 'integrations', '{\"uuid\":\"cb8dd69d-e186-461d-ac1b-a04ae67ea545\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:34;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:27;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790949930,\"delay\":null}', 0, NULL, 1790949930, 1790949930),
(66, 'integrations', '{\"uuid\":\"280ca98b-1276-49b2-b8d1-919d48be96a9\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:34;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:27;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790949930,\"delay\":null}', 0, NULL, 1790949930, 1790949930),
(67, 'default', '{\"uuid\":\"6ad30c64-68ac-4283-8d77-e8dd6e3a5026\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:35;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:28;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790951251,\"delay\":null}', 0, NULL, 1790951251, 1790951251),
(68, 'integrations', '{\"uuid\":\"1cc01e68-a610-4212-8ec6-6acc67f7857b\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:35;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:28;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790951251,\"delay\":null}', 0, NULL, 1790951251, 1790951251),
(69, 'integrations', '{\"uuid\":\"84c172b8-aaa7-4cf4-92ef-4728c0b89ef6\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:35;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:28;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790951251,\"delay\":null}', 0, NULL, 1790951251, 1790951251),
(70, 'integrations', '{\"uuid\":\"5f618f7d-284c-46e7-bceb-cf50d97c6c20\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:20:\\\"handleContactCreated\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\ContactCreated\\\":1:{s:7:\\\"contact\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Contact\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790951893,\"delay\":null}', 0, NULL, 1790951893, 1790951893),
(71, 'integrations', '{\"uuid\":\"99115c14-bcc3-4b76-b674-bbad58baf970\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:20:\\\"handleContactCreated\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\ContactCreated\\\":1:{s:7:\\\"contact\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Contact\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790951893,\"delay\":null}', 0, NULL, 1790951893, 1790951893),
(72, 'integrations', '{\"uuid\":\"1ad81ad4-496b-41e4-b4d7-1d3ed6281dae\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:20:\\\"handleContactCreated\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\ContactCreated\\\":1:{s:7:\\\"contact\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Contact\\\";s:2:\\\"id\\\";i:8;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790951896,\"delay\":null}', 0, NULL, 1790951896, 1790951896),
(73, 'integrations', '{\"uuid\":\"35212f72-a6dd-49fb-aed7-24f9c65e2d44\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:20:\\\"handleContactCreated\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\ContactCreated\\\":1:{s:7:\\\"contact\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Contact\\\";s:2:\\\"id\\\";i:8;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790951896,\"delay\":null}', 0, NULL, 1790951896, 1790951896),
(74, 'default', '{\"uuid\":\"e80988c3-19d0-4048-a955-816fdda976bf\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:37;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:30;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790951896,\"delay\":null}', 0, NULL, 1790951896, 1790951896),
(75, 'integrations', '{\"uuid\":\"0a2eeeb8-edbe-477e-8284-e9f3ee490ad7\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:37;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:30;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790951896,\"delay\":null}', 0, NULL, 1790951896, 1790951896),
(76, 'integrations', '{\"uuid\":\"fc54bcf7-67da-4904-9a62-ca141b92f383\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:37;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:30;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790951896,\"delay\":null}', 0, NULL, 1790951896, 1790951896),
(77, 'default', '{\"uuid\":\"32a7bf5c-a8ac-4086-86df-f923c12c6a81\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:39;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:29;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790951943,\"delay\":null}', 0, NULL, 1790951943, 1790951943),
(78, 'integrations', '{\"uuid\":\"fefd7939-3560-4b81-b234-521fd07b989a\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:39;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:29;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790951943,\"delay\":null}', 0, NULL, 1790951943, 1790951943),
(79, 'integrations', '{\"uuid\":\"76d5a7c8-ceb9-416f-a3ee-ccb81b4f1a70\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:39;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:29;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790951943,\"delay\":null}', 0, NULL, 1790951943, 1790951943),
(80, 'default', '{\"uuid\":\"e0598d10-b96b-421a-8381-ca28bd89e8f8\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:40;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:31;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790952787,\"delay\":null}', 0, NULL, 1790952787, 1790952787);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(81, 'integrations', '{\"uuid\":\"6a1308ca-f38c-4935-846d-96e9fcc81feb\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:40;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:31;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790952787,\"delay\":null}', 0, NULL, 1790952787, 1790952787),
(82, 'integrations', '{\"uuid\":\"c601607c-9581-4e9d-8b6e-0417541112bc\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:40;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:31;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790952787,\"delay\":null}', 0, NULL, 1790952787, 1790952787),
(83, 'default', '{\"uuid\":\"3118159a-409f-4d60-89ba-d3b7c3a88f7a\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:41;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:32;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1791195129,\"delay\":null}', 0, NULL, 1791195129, 1791195129),
(84, 'integrations', '{\"uuid\":\"8aeef89f-1d7b-4df7-851f-c6e2de75eff1\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:41;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:32;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1791195129,\"delay\":null}', 0, NULL, 1791195129, 1791195129),
(85, 'integrations', '{\"uuid\":\"9f2fabff-ec00-4b2b-95aa-7073bb71259c\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:41;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:32;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1791195129,\"delay\":null}', 0, NULL, 1791195129, 1791195129),
(86, 'default', '{\"uuid\":\"ee6c8b8a-3d1a-4bc0-8028-fa7d761aec2a\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:42;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:33;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1791195129,\"delay\":null}', 0, NULL, 1791195129, 1791195129),
(87, 'integrations', '{\"uuid\":\"852c4c94-1f9d-4195-b075-d1b3bf8ffb6c\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:42;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:33;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1791195129,\"delay\":null}', 0, NULL, 1791195129, 1791195129),
(88, 'integrations', '{\"uuid\":\"97cca60f-099a-4430-a51c-52fa28bdda26\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:42;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:33;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1791195129,\"delay\":null}', 0, NULL, 1791195129, 1791195129),
(89, 'integrations', '{\"uuid\":\"d1e2c855-5fa8-48de-a5fc-0e881823d776\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:20:\\\"handleContactCreated\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\ContactCreated\\\":1:{s:7:\\\"contact\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Contact\\\";s:2:\\\"id\\\";i:9;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1791195140,\"delay\":null}', 0, NULL, 1791195140, 1791195140),
(90, 'integrations', '{\"uuid\":\"a480b7f6-3ff5-4f15-a2fe-8be368090602\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:20:\\\"handleContactCreated\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\ContactCreated\\\":1:{s:7:\\\"contact\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Contact\\\";s:2:\\\"id\\\";i:9;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1791195140,\"delay\":null}', 0, NULL, 1791195140, 1791195140),
(91, 'default', '{\"uuid\":\"a7212df9-642e-453e-8e15-11cdbca2be1c\",\"displayName\":\"App\\\\Events\\\\MessageReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:43;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:34;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1791195140,\"delay\":null}', 0, NULL, 1791195140, 1791195140),
(92, 'integrations', '{\"uuid\":\"05af96b3-4e18-43d7-81cf-27f47622773d\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:43;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:34;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1791195140,\"delay\":null}', 0, NULL, 1791195140, 1791195140),
(93, 'integrations', '{\"uuid\":\"30865767-9c22-468f-b161-6ea9dc168009\",\"displayName\":\"App\\\\Listeners\\\\IntegrationNotificationListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":2,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":26:{s:5:\\\"class\\\";s:45:\\\"App\\\\Listeners\\\\IntegrationNotificationListener\\\";s:6:\\\"method\\\";s:21:\\\"handleMessageReceived\\\";s:4:\\\"data\\\";a:1:{i:0;O:26:\\\"App\\\\Events\\\\MessageReceived\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:43;s:9:\\\"relations\\\";a:1:{i:0;s:12:\\\"conversation\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"conversation\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Conversation\\\";s:2:\\\"id\\\";i:34;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";i:2;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";i:10;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:14:\\\"shouldBeUnique\\\";b:0;s:29:\\\"shouldBeUniqueUntilProcessing\\\";b:0;s:8:\\\"uniqueId\\\";N;s:9:\\\"uniqueFor\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1791195140,\"delay\":null}', 0, NULL, 1791195140, 1791195140);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kb_chunks`
--

CREATE TABLE `kb_chunks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `chunk_index` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vector_id` varchar(255) DEFAULT NULL,
  `usage_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kb_documents`
--

CREATE TABLE `kb_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('document','website','qa') NOT NULL DEFAULT 'document',
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `content_hash` varchar(64) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `is_priority` tinyint(1) NOT NULL DEFAULT 0,
  `file_path` varchar(255) DEFAULT NULL,
  `file_type` varchar(10) DEFAULT NULL,
  `file_size` bigint(20) UNSIGNED DEFAULT NULL,
  `source_url` varchar(255) DEFAULT NULL,
  `status` enum('uploading','extracting','chunking','embedding','ready','failed','paused') NOT NULL DEFAULT 'uploading',
  `error_message` varchar(255) DEFAULT NULL,
  `chunks_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `usage_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kb_websites`
--

CREATE TABLE `kb_websites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `scrape_depth` varchar(20) NOT NULL DEFAULT 'single',
  `max_pages` int(10) UNSIGNED NOT NULL DEFAULT 50,
  `include_patterns` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`include_patterns`)),
  `exclude_patterns` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`exclude_patterns`)),
  `rescrape_schedule` varchar(20) NOT NULL DEFAULT 'never',
  `pages_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('active','paused','error') NOT NULL DEFAULT 'active',
  `last_scraped_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `native_name` varchar(50) DEFAULT NULL,
  `direction` varchar(3) NOT NULL DEFAULT 'ltr',
  `flag` varchar(10) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `native_name`, `direction`, `flag`, `is_active`, `is_default`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'English', 'ltr', '🇺🇸', 1, 1, 1, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(2, 'Spanish', 'es', 'Español', 'ltr', '🇪🇸', 1, 0, 2, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(3, 'French', 'fr', 'Français', 'ltr', '🇫🇷', 1, 0, 3, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(4, 'German', 'de', 'Deutsch', 'ltr', '🇩🇪', 1, 0, 4, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(5, 'Portuguese', 'pt', 'Português', 'ltr', '🇧🇷', 1, 0, 5, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(6, 'Arabic', 'ar', 'العربية', 'rtl', '🇸🇦', 1, 0, 6, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(7, 'Hindi', 'hi', 'हिन्दी', 'ltr', '🇮🇳', 1, 0, 7, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(8, 'Chinese', 'zh', '中文', 'ltr', '🇨🇳', 0, 0, 8, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(9, 'Japanese', 'ja', '日本語', 'ltr', '🇯🇵', 0, 0, 9, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(10, 'Korean', 'ko', '한국어', 'ltr', '🇰🇷', 0, 0, 10, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(11, 'Turkish', 'tr', 'Türkçe', 'ltr', '🇹🇷', 1, 0, 11, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(12, 'Russian', 'ru', 'Русский', 'ltr', '🇷🇺', 0, 0, 12, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(13, 'Italian', 'it', 'Italiano', 'ltr', '🇮🇹', 1, 0, 13, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(14, 'Dutch', 'nl', 'Nederlands', 'ltr', '🇳🇱', 0, 0, 14, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(15, 'Bengali', 'bn', 'বাংলা', 'ltr', '🇧🇩', 1, 0, 15, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(16, 'Indonesian', 'id', 'Bahasa', 'ltr', '🇮🇩', 0, 0, 16, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(17, 'Hebrew', 'he', 'עברית', 'rtl', '🇮🇱', 0, 0, 17, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(18, 'Urdu', 'ur', 'اردو', 'rtl', '🇵🇰', 0, 0, 18, '2026-09-27 08:25:21', '2026-09-27 08:25:21');

-- --------------------------------------------------------

--
-- Table structure for table `lead_scoring_rules`
--

CREATE TABLE `lead_scoring_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `event` varchar(255) NOT NULL,
  `points` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `magic_links`
--

CREATE TABLE `magic_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(24) NOT NULL,
  `host_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `scheduled_at` timestamp NULL DEFAULT NULL,
  `duration_min` smallint(5) UNSIGNED NOT NULL DEFAULT 60,
  `status` varchar(12) NOT NULL DEFAULT 'scheduled',
  `kind` varchar(8) NOT NULL DEFAULT 'meeting',
  `waiting_room` tinyint(1) NOT NULL DEFAULT 1,
  `allow_guests` tinyint(1) NOT NULL DEFAULT 1,
  `mute_on_entry` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `started_at` timestamp NULL DEFAULT NULL,
  `ended_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meetings`
--

INSERT INTO `meetings` (`id`, `code`, `host_id`, `title`, `description`, `scheduled_at`, `duration_min`, `status`, `kind`, `waiting_room`, `allow_guests`, `mute_on_entry`, `locked`, `started_at`, `ended_at`, `created_at`, `updated_at`) VALUES
(1, 'bt7fr97wut', 3, 'Video call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, NULL, '2026-10-02 02:20:03', '2026-10-02 02:19:15', '2026-10-02 02:20:03'),
(2, 'd28a4mk4w3', 3, 'Video call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-02 04:43:12', '2026-10-02 04:44:09', '2026-10-02 04:43:08', '2026-10-02 04:44:09'),
(3, '63gvargqf6', 3, 'Video call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-02 04:44:16', '2026-10-02 04:44:55', '2026-10-02 04:44:15', '2026-10-02 04:44:55'),
(4, 'mfp7dd8rr3', 3, 'Video call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-02 04:45:01', '2026-10-02 04:45:38', '2026-10-02 04:45:00', '2026-10-02 04:45:38'),
(5, 'c2ten5pyza', 3, 'Audio call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-02 05:18:39', '2026-10-02 05:18:45', '2026-10-02 05:18:37', '2026-10-02 05:18:45'),
(6, 'tcu2k3mbrr', 15, 'Audio call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-02 12:34:43', '2026-10-02 12:35:51', '2026-10-02 12:34:36', '2026-10-02 12:35:51'),
(7, 'pcucgj88da', 15, 'Video call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-02 12:36:46', '2026-10-02 12:37:41', '2026-10-02 12:36:42', '2026-10-02 12:37:41'),
(8, '6atchk2afz', 16, 'Video call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-02 12:56:15', '2026-10-02 12:56:50', '2026-10-02 12:56:11', '2026-10-02 12:56:50'),
(9, 'phaetq7qtj', 14, 'Video call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-02 13:00:34', '2026-10-02 13:00:43', '2026-10-02 13:00:33', '2026-10-02 13:00:43'),
(10, 'e9z7xmhjkm', 15, 'Audio call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-02 14:58:03', '2026-10-02 14:58:54', '2026-10-02 14:58:02', '2026-10-02 14:58:54'),
(11, 'jk3eeuy7qz', 15, 'Audio call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-02 14:59:12', '2026-10-02 14:59:33', '2026-10-02 14:59:11', '2026-10-02 14:59:33'),
(12, '7r3su975du', 15, 'Video call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-02 14:59:38', '2026-10-02 14:59:49', '2026-10-02 14:59:36', '2026-10-02 14:59:49'),
(13, 'cyafx5zybn', 16, 'Audio call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-02 15:00:21', '2026-10-02 15:00:31', '2026-10-02 15:00:20', '2026-10-02 15:00:31'),
(14, '2rff48uqxk', 16, 'Video call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-02 15:01:53', '2026-10-02 15:01:58', '2026-10-02 15:01:51', '2026-10-02 15:01:58'),
(15, 'yk2q5w6xzx', 6, 'Audio call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-02 16:11:42', '2026-10-02 16:12:11', '2026-10-02 16:11:37', '2026-10-02 16:12:11'),
(16, 'm7n2wvnts5', 6, 'Video call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-02 16:15:18', '2026-10-02 16:15:42', '2026-10-02 16:15:17', '2026-10-02 16:15:42'),
(17, 'u6dgzq7awp', 6, 'Audio call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-02 16:15:57', '2026-10-02 16:16:36', '2026-10-02 16:15:56', '2026-10-02 16:16:36'),
(18, 'urfbfx6wnp', 6, 'Audio call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-02 16:16:48', '2026-10-02 16:17:09', '2026-10-02 16:16:47', '2026-10-02 16:17:09'),
(19, 'a9w2afzrp9', 6, 'Audio call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-02 16:17:21', '2026-10-02 16:17:37', '2026-10-02 16:17:20', '2026-10-02 16:17:37'),
(20, 'bbnt97dhjz', 6, 'Audio call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-02 16:17:48', '2026-10-02 16:18:01', '2026-10-02 16:17:47', '2026-10-02 16:18:01'),
(21, 'w9sb2jwwtn', 14, 'Audio call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-03 13:30:53', '2026-10-03 13:31:02', '2026-10-03 13:30:52', '2026-10-03 13:31:02'),
(22, '8w33ar5kc8', 14, 'Video call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-03 13:31:06', '2026-10-03 13:31:32', '2026-10-03 13:31:05', '2026-10-03 13:31:32'),
(23, 'hgsp7y3hnk', 14, 'Video call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-03 13:31:37', '2026-10-03 13:31:45', '2026-10-03 13:31:36', '2026-10-03 13:31:45'),
(24, '26tqrv5dpf', 3, 'Audio call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-03 13:38:50', '2026-10-03 13:41:35', '2026-10-03 13:38:46', '2026-10-03 13:41:35'),
(25, 'quvnq585bs', 3, 'Audio call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-05 09:04:43', '2026-10-05 09:05:16', '2026-10-05 09:04:39', '2026-10-05 09:05:16'),
(26, 'zqupy9ypxz', 3, 'Audio call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-05 09:24:08', '2026-10-05 09:25:42', '2026-10-05 09:24:07', '2026-10-05 09:25:42'),
(27, 'nx399vwa66', 3, 'Audio call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-05 09:25:58', '2026-10-05 09:26:17', '2026-10-05 09:25:57', '2026-10-05 09:26:17'),
(28, 'gpsanxg352', 3, 'Audio call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-05 09:26:37', '2026-10-05 09:26:52', '2026-10-05 09:26:36', '2026-10-05 09:26:52'),
(29, 'uttkx3wbba', 3, 'Audio call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-05 09:27:50', '2026-10-05 09:28:17', '2026-10-05 09:27:48', '2026-10-05 09:28:17'),
(30, 'qf7gx2zyjx', 3, 'Audio call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-05 09:32:50', '2026-10-05 09:33:38', '2026-10-05 09:32:49', '2026-10-05 09:33:38'),
(31, 'v6xj3gcjma', 14, 'Audio call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-05 09:33:54', '2026-10-05 09:34:30', '2026-10-05 09:33:49', '2026-10-05 09:34:30'),
(32, 'jhbgd5cet4', 3, 'Video call', NULL, NULL, 60, 'ended', 'call', 0, 0, 0, 0, '2026-10-05 09:52:20', '2026-10-05 09:54:50', '2026-10-05 09:52:19', '2026-10-05 09:54:50');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_invitees`
--

CREATE TABLE `meeting_invitees` (
  `meeting_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meeting_invitees`
--

INSERT INTO `meeting_invitees` (`meeting_id`, `user_id`) VALUES
(1, 6),
(2, 6),
(3, 6),
(4, 6),
(5, 6),
(6, 14),
(7, 14),
(8, 14),
(9, 15),
(10, 16),
(11, 16),
(12, 16),
(13, 15),
(14, 15),
(15, 14),
(16, 14),
(17, 3),
(18, 3),
(19, 14),
(20, 14),
(21, 6),
(22, 6),
(23, 6),
(24, 14),
(25, 14),
(26, 14),
(27, 14),
(28, 14),
(29, 14),
(30, 14),
(31, 3),
(32, 14);

-- --------------------------------------------------------

--
-- Table structure for table `meeting_messages`
--

CREATE TABLE `meeting_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meeting_id` bigint(20) UNSIGNED NOT NULL,
  `pid` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meeting_participants`
--

CREATE TABLE `meeting_participants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meeting_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `guest_name` varchar(80) DEFAULT NULL,
  `guest_token` varchar(64) DEFAULT NULL,
  `name` varchar(120) NOT NULL,
  `role` varchar(16) NOT NULL DEFAULT 'participant',
  `status` varchar(10) NOT NULL DEFAULT 'waiting',
  `audio_on` tinyint(1) NOT NULL DEFAULT 1,
  `video_on` tinyint(1) NOT NULL DEFAULT 1,
  `hand` tinyint(1) NOT NULL DEFAULT 0,
  `sharing` tinyint(1) NOT NULL DEFAULT 0,
  `force_mute` tinyint(1) NOT NULL DEFAULT 0,
  `joined_at` timestamp NULL DEFAULT NULL,
  `left_at` timestamp NULL DEFAULT NULL,
  `last_seen_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meeting_participants`
--

INSERT INTO `meeting_participants` (`id`, `meeting_id`, `user_id`, `guest_name`, `guest_token`, `name`, `role`, `status`, `audio_on`, `video_on`, `hand`, `sharing`, `force_mute`, `joined_at`, `left_at`, `last_seen_at`, `created_at`, `updated_at`) VALUES
(1, 2, 3, NULL, NULL, 'nb', 'host', 'left', 1, 1, 1, 0, 0, '2026-10-02 04:43:12', '2026-10-02 04:44:09', '2026-10-02 04:44:09', '2026-10-02 04:43:12', '2026-10-02 04:44:09'),
(2, 2, 6, NULL, NULL, 'khan', 'participant', 'left', 1, 0, 0, 0, 0, '2026-10-02 04:43:29', '2026-10-02 04:43:52', '2026-10-02 04:43:51', '2026-10-02 04:43:29', '2026-10-02 04:43:52'),
(3, 3, 3, NULL, NULL, 'nb', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-02 04:44:16', '2026-10-02 04:44:55', '2026-10-02 04:44:55', '2026-10-02 04:44:16', '2026-10-02 04:44:55'),
(4, 3, 6, NULL, NULL, 'khan', 'participant', 'left', 1, 0, 0, 0, 0, '2026-10-02 04:44:42', '2026-10-02 04:44:55', '2026-10-02 04:44:55', '2026-10-02 04:44:42', '2026-10-02 04:44:55'),
(5, 4, 3, NULL, NULL, 'nb', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-02 04:45:01', '2026-10-02 04:45:38', '2026-10-02 04:45:39', '2026-10-02 04:45:01', '2026-10-02 04:45:38'),
(6, 4, 6, NULL, NULL, 'khan', 'participant', 'left', 1, 0, 0, 0, 0, '2026-10-02 04:45:15', '2026-10-02 04:45:38', '2026-10-02 04:45:39', '2026-10-02 04:45:15', '2026-10-02 04:45:38'),
(7, 5, 3, NULL, NULL, 'nb', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-02 05:18:39', '2026-10-02 05:18:45', '2026-10-02 05:18:46', '2026-10-02 05:18:39', '2026-10-02 05:18:45'),
(8, 6, 15, NULL, NULL, 'Sardar Zulfiqar Ali Shah', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-02 12:34:43', '2026-10-02 12:35:15', '2026-10-02 12:35:15', '2026-10-02 12:34:43', '2026-10-02 12:35:15'),
(9, 6, 14, NULL, NULL, 'Umair Ali', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-02 12:34:52', '2026-10-02 12:35:51', '2026-10-02 12:35:52', '2026-10-02 12:34:52', '2026-10-02 12:35:51'),
(10, 7, 15, NULL, NULL, 'Sardar Zulfiqar Ali Shah', 'host', 'left', 1, 1, 0, 0, 0, '2026-10-02 12:36:46', '2026-10-02 12:37:41', '2026-10-02 12:37:41', '2026-10-02 12:36:46', '2026-10-02 12:37:41'),
(11, 7, 14, NULL, NULL, 'Umair Ali', 'participant', 'left', 1, 1, 1, 0, 0, '2026-10-02 12:36:55', '2026-10-02 12:37:28', '2026-10-02 12:37:29', '2026-10-02 12:36:55', '2026-10-02 12:37:28'),
(12, 8, 16, NULL, NULL, 'Zulfiqar', 'host', 'left', 1, 1, 0, 0, 0, '2026-10-02 12:56:15', '2026-10-02 12:56:50', '2026-10-02 12:56:51', '2026-10-02 12:56:15', '2026-10-02 12:56:50'),
(13, 8, 14, NULL, NULL, 'Umair Ali', 'participant', 'left', 1, 1, 0, 0, 0, '2026-10-02 12:56:30', '2026-10-02 12:56:50', '2026-10-02 12:56:51', '2026-10-02 12:56:30', '2026-10-02 12:56:50'),
(14, 9, 14, NULL, NULL, 'Umair Ali', 'host', 'left', 1, 1, 0, 0, 0, '2026-10-02 13:00:34', '2026-10-02 13:00:43', '2026-10-02 13:00:44', '2026-10-02 13:00:34', '2026-10-02 13:00:43'),
(15, 10, 15, NULL, NULL, 'Sardar Zulfiqar Ali Shah', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-02 14:58:03', '2026-10-02 14:58:54', '2026-10-02 14:58:22', '2026-10-02 14:58:03', '2026-10-02 14:58:54'),
(16, 11, 15, NULL, NULL, 'Sardar Zulfiqar Ali Shah', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-02 14:59:12', '2026-10-02 14:59:33', '2026-10-02 14:59:33', '2026-10-02 14:59:12', '2026-10-02 14:59:33'),
(17, 12, 15, NULL, NULL, 'Sardar Zulfiqar Ali Shah', 'host', 'left', 1, 1, 0, 0, 0, '2026-10-02 14:59:38', '2026-10-02 14:59:49', '2026-10-02 14:59:49', '2026-10-02 14:59:38', '2026-10-02 14:59:49'),
(18, 13, 16, NULL, NULL, 'Zulfiqar', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-02 15:00:21', '2026-10-02 15:00:31', '2026-10-02 15:00:31', '2026-10-02 15:00:21', '2026-10-02 15:00:31'),
(19, 14, 16, NULL, NULL, 'Zulfiqar', 'host', 'left', 1, 1, 0, 0, 0, '2026-10-02 15:01:53', '2026-10-02 15:01:58', '2026-10-02 15:01:59', '2026-10-02 15:01:53', '2026-10-02 15:01:58'),
(20, 15, 6, NULL, NULL, 'khan', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-02 16:11:42', '2026-10-02 16:12:11', '2026-10-02 16:12:11', '2026-10-02 16:11:42', '2026-10-02 16:12:11'),
(21, 15, 14, NULL, NULL, 'Umair Ali', 'participant', 'left', 1, 0, 0, 0, 0, '2026-10-02 16:12:01', '2026-10-02 16:12:06', '2026-10-02 16:12:06', '2026-10-02 16:12:01', '2026-10-02 16:12:06'),
(22, 16, 6, NULL, NULL, 'khan', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-02 16:15:18', '2026-10-02 16:15:42', '2026-10-02 16:15:42', '2026-10-02 16:15:18', '2026-10-02 16:15:42'),
(23, 17, 6, NULL, NULL, 'khan', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-02 16:15:57', '2026-10-02 16:16:36', '2026-10-02 16:16:35', '2026-10-02 16:15:57', '2026-10-02 16:16:36'),
(24, 18, 6, NULL, NULL, 'khan', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-02 16:16:48', '2026-10-02 16:17:09', '2026-10-02 16:17:08', '2026-10-02 16:16:48', '2026-10-02 16:17:09'),
(25, 19, 6, NULL, NULL, 'khan', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-02 16:17:21', '2026-10-02 16:17:37', '2026-10-02 16:17:37', '2026-10-02 16:17:21', '2026-10-02 16:17:37'),
(26, 19, 14, NULL, NULL, 'Umair Ali', 'participant', 'left', 1, 0, 0, 0, 0, '2026-10-02 16:17:31', '2026-10-02 16:17:32', '2026-10-02 16:17:31', '2026-10-02 16:17:31', '2026-10-02 16:17:32'),
(27, 20, 6, NULL, NULL, 'khan', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-02 16:17:48', '2026-10-02 16:18:01', '2026-10-02 16:18:00', '2026-10-02 16:17:48', '2026-10-02 16:18:01'),
(28, 21, 14, NULL, NULL, 'Umair Ali', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-03 13:30:53', '2026-10-03 13:31:02', '2026-10-03 13:31:03', '2026-10-03 13:30:53', '2026-10-03 13:31:02'),
(29, 22, 14, NULL, NULL, 'Umair Ali', 'host', 'left', 1, 1, 0, 0, 0, '2026-10-03 13:31:06', '2026-10-03 13:31:32', '2026-10-03 13:31:32', '2026-10-03 13:31:06', '2026-10-03 13:31:32'),
(30, 23, 14, NULL, NULL, 'Umair Ali', 'host', 'left', 1, 1, 0, 0, 0, '2026-10-03 13:31:37', '2026-10-03 13:31:45', '2026-10-03 13:31:46', '2026-10-03 13:31:37', '2026-10-03 13:31:45'),
(31, 24, 3, NULL, NULL, 'nb', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-03 13:38:50', '2026-10-03 13:41:35', '2026-10-03 13:41:35', '2026-10-03 13:38:50', '2026-10-03 13:41:35'),
(32, 24, 14, NULL, NULL, 'Umair Ali', 'participant', 'left', 1, 0, 0, 0, 0, '2026-10-03 13:39:32', '2026-10-03 13:39:39', '2026-10-03 13:39:39', '2026-10-03 13:39:32', '2026-10-03 13:39:39'),
(33, 25, 3, NULL, NULL, 'nb', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-05 09:04:43', '2026-10-05 09:05:16', '2026-10-05 09:05:16', '2026-10-05 09:04:43', '2026-10-05 09:05:16'),
(34, 26, 3, NULL, NULL, 'nb', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-05 09:24:08', '2026-10-05 09:25:42', '2026-10-05 09:25:41', '2026-10-05 09:24:08', '2026-10-05 09:25:42'),
(35, 27, 3, NULL, NULL, 'nb', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-05 09:25:58', '2026-10-05 09:26:17', '2026-10-05 09:26:17', '2026-10-05 09:25:58', '2026-10-05 09:26:17'),
(36, 28, 3, NULL, NULL, 'nb', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-05 09:26:37', '2026-10-05 09:26:52', '2026-10-05 09:26:53', '2026-10-05 09:26:37', '2026-10-05 09:26:52'),
(37, 29, 3, NULL, NULL, 'nb', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-05 09:27:50', '2026-10-05 09:28:17', '2026-10-05 09:28:17', '2026-10-05 09:27:50', '2026-10-05 09:28:17'),
(38, 30, 3, NULL, NULL, 'nb', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-05 09:32:50', '2026-10-05 09:33:38', '2026-10-05 09:33:39', '2026-10-05 09:32:50', '2026-10-05 09:33:38'),
(39, 31, 14, NULL, NULL, 'Umair Ali', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-05 09:33:54', '2026-10-05 09:34:30', '2026-10-05 09:34:31', '2026-10-05 09:33:54', '2026-10-05 09:34:30'),
(40, 31, 3, NULL, NULL, 'nb', 'participant', 'left', 1, 0, 0, 0, 0, '2026-10-05 09:34:02', '2026-10-05 09:34:30', '2026-10-05 09:34:31', '2026-10-05 09:34:02', '2026-10-05 09:34:30'),
(41, 32, 3, NULL, NULL, 'nb', 'host', 'left', 1, 0, 0, 0, 0, '2026-10-05 09:52:20', '2026-10-05 09:54:50', '2026-10-05 09:54:49', '2026-10-05 09:52:20', '2026-10-05 09:54:50'),
(42, 32, 14, NULL, NULL, 'Umair Ali', 'participant', 'left', 1, 1, 0, 0, 0, '2026-10-05 09:52:35', '2026-10-05 09:52:59', '2026-10-05 09:53:00', '2026-10-05 09:52:35', '2026-10-05 09:52:59');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_signals`
--

CREATE TABLE `meeting_signals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meeting_id` bigint(20) UNSIGNED NOT NULL,
  `from_pid` bigint(20) UNSIGNED NOT NULL,
  `to_pid` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(8) NOT NULL,
  `payload` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `conversation_id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `direction` enum('inbound','outbound') NOT NULL DEFAULT 'inbound',
  `sender_type` enum('contact','agent','ai','system') NOT NULL DEFAULT 'contact',
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('message','note','ai_draft','system_event') NOT NULL DEFAULT 'message',
  `body_html` mediumtext DEFAULT NULL,
  `body_text` mediumtext DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `from_email` varchar(255) DEFAULT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `to_emails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`to_emails`)),
  `cc_emails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`cc_emails`)),
  `bcc_emails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`bcc_emails`)),
  `message_id_header` varchar(255) DEFAULT NULL,
  `in_reply_to` varchar(255) DEFAULT NULL,
  `references_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`references_header`)),
  `ai_confidence` tinyint(3) UNSIGNED DEFAULT NULL,
  `ai_model` varchar(255) DEFAULT NULL,
  `ai_provider` varchar(255) DEFAULT NULL,
  `ai_tokens_in` int(10) UNSIGNED DEFAULT NULL,
  `ai_tokens_out` int(10) UNSIGNED DEFAULT NULL,
  `ai_cost` decimal(8,5) DEFAULT NULL,
  `ai_response_time_ms` int(10) UNSIGNED DEFAULT NULL,
  `ai_sources_used` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`ai_sources_used`)),
  `ai_status` enum('draft','approved','sent','rejected','edited') DEFAULT NULL,
  `sentiment` enum('positive','neutral','negative','angry') DEFAULT NULL,
  `detected_language` varchar(10) DEFAULT NULL,
  `delivery_status` enum('queued','sent','delivered','failed','bounced') DEFAULT NULL,
  `delivery_error` varchar(255) DEFAULT NULL,
  `opens_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `clicks_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sent_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `opened_at` timestamp NULL DEFAULT NULL,
  `clicked_at` timestamp NULL DEFAULT NULL,
  `bounced_at` timestamp NULL DEFAULT NULL,
  `bounce_type` varchar(255) DEFAULT NULL,
  `scheduled_at` timestamp NULL DEFAULT NULL,
  `schedule_status` enum('pending','sent','cancelled','failed') DEFAULT NULL,
  `channel_message_id` varchar(255) DEFAULT NULL,
  `imap_uid` int(10) UNSIGNED DEFAULT NULL,
  `imap_folder` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `uuid`, `conversation_id`, `workspace_id`, `direction`, `sender_type`, `sender_id`, `type`, `body_html`, `body_text`, `subject`, `from_email`, `from_name`, `to_emails`, `cc_emails`, `bcc_emails`, `message_id_header`, `in_reply_to`, `references_header`, `ai_confidence`, `ai_model`, `ai_provider`, `ai_tokens_in`, `ai_tokens_out`, `ai_cost`, `ai_response_time_ms`, `ai_sources_used`, `ai_status`, `sentiment`, `detected_language`, `delivery_status`, `delivery_error`, `opens_count`, `clicks_count`, `sent_at`, `delivered_at`, `opened_at`, `clicked_at`, `bounced_at`, `bounce_type`, `scheduled_at`, `schedule_status`, `channel_message_id`, `imap_uid`, `imap_folder`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '203c5f7e-2978-44df-9ddb-21b1b59258ce', 1, 4, 'inbound', 'contact', NULL, 'message', '<div dir=\"auto\">Cccfcc</div>\r\n', 'Cccfcc\r\n', 'Accfc', 'umairkheshgi@gmail.com', 'Umair Ali', '[\"uape@dahimail.com\"]', '[]', '[]', '<CAN6y5pwtABCv4N8p6h1j9Ue+NLi_4xdGQ-_GX146UXZUP8G6ew@mail.gmail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-09-27 12:06:50', '2026-09-27 12:06:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'INBOX', '2026-09-27 12:07:16', '2026-09-27 12:07:16', NULL),
(2, '38b322d6-8ef1-4c68-869d-605ccff1c336', 1, 4, 'outbound', 'agent', 3, 'message', '<p>bjbjbjn</p>', 'bjbjbjn', 'Re: Accfc', 'uape@dahimail.com', 'nb', '[\"umairkheshgi@gmail.com\"]', NULL, NULL, NULL, '<CAN6y5pwtABCv4N8p6h1j9Ue+NLi_4xdGQ-_GX146UXZUP8G6ew@mail.gmail.com>', '[\"<CAN6y5pwtABCv4N8p6h1j9Ue+NLi_4xdGQ-_GX146UXZUP8G6ew@mail.gmail.com>\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'queued', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-27 12:07:41', 'pending', NULL, NULL, NULL, '2026-09-27 12:07:31', '2026-09-27 12:07:31', NULL),
(3, '9e18fe86-d9f8-4670-a7f7-991d88268d8b', 1, 4, 'outbound', 'agent', 3, 'message', '<p>nknkjnknknk</p>', 'nknkjnknknk', 'Re: Accfc', 'uape@dahimail.com', 'nb', '[\"umairkheshgi@gmail.com\"]', NULL, NULL, NULL, '<CAN6y5pwtABCv4N8p6h1j9Ue+NLi_4xdGQ-_GX146UXZUP8G6ew@mail.gmail.com>', '[\"<CAN6y5pwtABCv4N8p6h1j9Ue+NLi_4xdGQ-_GX146UXZUP8G6ew@mail.gmail.com>\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'failed', 'Unable to connect with STARTTLS: stream_socket_enable_crypto(): Peer certificate CN=`mail.dahify.com\' did not match expected CN=`127.0.0.1\'', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-27 12:13:58', 'pending', NULL, NULL, NULL, '2026-09-27 12:13:48', '2026-09-27 12:13:59', NULL),
(4, 'e773d682-c819-476c-badf-a7fecb2d9132', 1, 4, 'outbound', 'agent', 3, 'message', '<p>nkkjnknknk</p>', 'nkkjnknknk', 'Re: Accfc', 'uape@dahimail.com', 'nb', '[\"umairkheshgi@gmail.com\"]', NULL, NULL, NULL, '<CAN6y5pwtABCv4N8p6h1j9Ue+NLi_4xdGQ-_GX146UXZUP8G6ew@mail.gmail.com>', '[\"<CAN6y5pwtABCv4N8p6h1j9Ue+NLi_4xdGQ-_GX146UXZUP8G6ew@mail.gmail.com>\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'failed', 'Unable to connect with STARTTLS: stream_socket_enable_crypto(): Peer certificate CN=`mail.dahify.com\' did not match expected CN=`127.0.0.1\'', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-27 12:14:52', 'pending', NULL, NULL, NULL, '2026-09-27 12:14:42', '2026-09-27 12:14:53', NULL),
(5, '1fc96030-512a-40e1-82c4-84b1e5964536', 1, 4, 'outbound', 'agent', 3, 'message', '<p>jnjknknjnkjnk</p>', 'jnjknknjnkjnk', 'Re: Accfc', 'uape@dahimail.com', 'nb', '[\"umairkheshgi@gmail.com\"]', NULL, NULL, NULL, '<CAN6y5pwtABCv4N8p6h1j9Ue+NLi_4xdGQ-_GX146UXZUP8G6ew@mail.gmail.com>', '[\"<CAN6y5pwtABCv4N8p6h1j9Ue+NLi_4xdGQ-_GX146UXZUP8G6ew@mail.gmail.com>\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sent', NULL, 0, 0, '2026-09-27 12:36:03', NULL, NULL, NULL, NULL, NULL, '2026-09-27 12:36:02', 'sent', NULL, NULL, NULL, '2026-09-27 12:35:52', '2026-09-27 12:36:03', NULL),
(6, '6b2efb77-cb3f-4a03-a801-dd457cfe8ead', 2, 6, 'inbound', 'contact', NULL, 'message', '<div dir=\"auto\">Fjsifjfjdu</div>\r\n', 'Fjsifjfjdu\r\n', 'Qdududud', 'umairkheshgi@gmail.com', 'Umair Ali', '[\"khan@dahimail.com\"]', '[]', '[]', '<CAN6y5px28XBjmbJgxi465F53qRVMAjgs656Xip80nji+4mCqFw@mail.gmail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-09-27 13:13:04', '2026-09-27 13:13:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'INBOX', '2026-09-27 13:13:35', '2026-09-27 13:13:35', NULL),
(7, 'd82a8fc9-58f6-4f52-b156-647d53a29d15', 2, 6, 'outbound', 'agent', 6, 'message', '<p>nsknskcsncns</p>', 'nsknskcsncns', 'Re: Qdududud', 'khan@dahimail.com', 'khan', '[\"umairkheshgi@gmail.com\"]', NULL, NULL, NULL, '<CAN6y5px28XBjmbJgxi465F53qRVMAjgs656Xip80nji+4mCqFw@mail.gmail.com>', '[\"<CAN6y5px28XBjmbJgxi465F53qRVMAjgs656Xip80nji+4mCqFw@mail.gmail.com>\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sent', NULL, 0, 0, '2026-09-27 13:18:08', NULL, NULL, NULL, NULL, NULL, '2026-09-27 13:18:06', 'sent', NULL, NULL, NULL, '2026-09-27 13:17:56', '2026-09-27 13:18:08', NULL),
(8, '83f2ff26-bf8e-4574-aef8-e58f56851e91', 1, 4, 'outbound', 'agent', 3, 'message', '<p>nknknknknk</p>', 'nknknknknk', 'Re: Accfc', 'uape@dahimail.com', 'nb', '[\"umairkheshgi@gmail.com\"]', NULL, NULL, NULL, '<CAN6y5pwtABCv4N8p6h1j9Ue+NLi_4xdGQ-_GX146UXZUP8G6ew@mail.gmail.com>', '[\"<CAN6y5pwtABCv4N8p6h1j9Ue+NLi_4xdGQ-_GX146UXZUP8G6ew@mail.gmail.com>\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sent', NULL, 1, 0, '2026-09-27 14:18:05', NULL, '2026-09-27 14:18:08', NULL, NULL, NULL, '2026-09-27 14:18:04', 'sent', NULL, NULL, NULL, '2026-09-27 14:17:54', '2026-09-27 14:18:08', NULL),
(9, '0187ac2a-ffed-4ee0-b29f-f261b57a1883', 1, 4, 'outbound', 'agent', 3, 'message', '<p>bhjkbkjbjkbkjbjkbkj </p>', 'bhjkbkjbjkbkjbjkbkj', 'Re: Accfc', 'uape@dahimail.com', 'nb', '[\"umairkheshgi@gmail.com\"]', NULL, NULL, NULL, '<CAN6y5pwtABCv4N8p6h1j9Ue+NLi_4xdGQ-_GX146UXZUP8G6ew@mail.gmail.com>', '[\"<CAN6y5pwtABCv4N8p6h1j9Ue+NLi_4xdGQ-_GX146UXZUP8G6ew@mail.gmail.com>\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sent', NULL, 1, 0, '2026-09-28 04:41:39', NULL, '2026-09-28 04:41:42', NULL, NULL, NULL, '2026-09-28 04:41:38', 'sent', NULL, NULL, NULL, '2026-09-28 04:41:28', '2026-09-28 04:41:42', NULL),
(10, 'aa2cacac-ab61-4228-bfb4-5c9f9049ead6', 3, 4, 'outbound', 'agent', 3, 'message', '<p>csdcscdsdcscsdcscscs</p>', 'csdcscdsdcscsdcscscs', 'scsdcsdcscscdsc', 'uape@dahimail.com', 'nb', '[\"umairkheshgi@gmail.com\"]', NULL, NULL, '<ed814c35-ae9c-4786-990b-a4b15bb40b74@dahimail.com>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sent', NULL, 1, 0, '2026-09-28 11:48:45', NULL, '2026-09-28 11:48:48', NULL, NULL, NULL, '2026-09-28 11:48:44', 'sent', NULL, NULL, NULL, '2026-09-28 11:48:34', '2026-09-28 11:48:48', NULL),
(11, '6636e56c-72ab-42a6-9828-7f19c23eeca7', 4, 4, 'outbound', 'agent', 3, 'message', '<p>ascascaca</p>', 'ascascaca', 'cascasca', 'uape@dahimail.com', 'nb', '[\"umairkheshgi@gmail.com\"]', NULL, NULL, '<ed7cc5cf-6215-4d8a-bf37-2ba0cfba5de3@dahimail.com>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sent', NULL, 1, 0, '2026-09-28 12:09:36', NULL, '2026-09-28 12:09:39', NULL, NULL, NULL, '2026-09-28 12:09:35', 'sent', NULL, NULL, NULL, '2026-09-28 12:09:25', '2026-09-28 12:09:39', NULL),
(12, '4eeb9550-8d50-4001-855e-f617718c69ab', 5, 4, 'outbound', 'agent', 3, 'message', '<p>	ascascacascacasc</p>', '	ascascacascacasc', 'ascacacc', 'uape@dahimail.com', 'nb', '[\"umairkheshgi@gmail.com\"]', NULL, NULL, '<acc2cb5e-305d-497b-bd03-789b05aafc82@dahimail.com>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sent', NULL, 1, 0, '2026-09-28 12:12:30', NULL, '2026-09-28 12:12:32', NULL, NULL, NULL, '2026-09-28 12:12:29', 'sent', NULL, NULL, NULL, '2026-09-28 12:12:19', '2026-09-28 12:12:32', NULL),
(13, 'd09d8ec8-f049-4c51-a38a-f637545df7ac', 6, 4, 'outbound', 'agent', 3, 'message', '<p>aaaaaa</p>', 'aaaaaa', 'aaaaa', 'uape@dahimail.com', 'nb', '[\"umairkheshgi@gmail.com\"]', NULL, NULL, '<82997073-c4d6-497e-b1d5-5c9e95049f06@dahimail.com>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sent', NULL, 1, 0, '2026-09-28 12:19:07', NULL, '2026-09-28 12:19:09', NULL, NULL, NULL, '2026-09-28 12:19:06', 'sent', NULL, NULL, NULL, '2026-09-28 12:18:56', '2026-09-28 12:19:09', NULL),
(14, '4e7d669a-8e2e-4470-b1d0-61a5b5539641', 7, 9, 'inbound', 'contact', NULL, 'message', '\r\n\r\n\r\n\r\n<table class=\"wrapper\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td class=\"header\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; padding: 25px 0; text-align: center;\">\r\n<a href=\"https://dahimail.com\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 19px; font-weight: bold; text-decoration: none; display: inline-block;\" rel=\"noopener noreferrer\">\r\nDahimail\r\n</a>\r\n</td>\r\n</tr>\r\n\r\n\r\n<tr>\r\n<td class=\"body\" width=\"100%\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; border-bottom: 1px solid #fafafa; border-top: 1px solid #fafafa; margin: 0; padding: 0; width: 100%; border: hidden !important;\">\r\n<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; background-color: #ffffff; border-color: #e4e4e7; border-radius: 4px; border-width: 1px; box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px -1px rgba(0, 0, 0, 0.1); margin: 0 auto; padding: 0; width: 570px;\">\r\n\r\n<tr>\r\n<td class=\"content-cell\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<h1 style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 18px; font-weight: bold; margin-top: 0; text-align: start;\">Hi Shabina,</h1>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Welcome aboard! Your account is ready and we\'re excited to help you automate your communications.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Here\'s how to get started in under 5 minutes:</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">1. Connect your email</strong> — Link Gmail or Outlook with one click.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">2. Train your AI</strong> — Upload a document or FAQ so replies match your voice.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">3. Set up auto-reply</strong> — Choose when and how AI responds for you.</p>\r\n<table class=\"action\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 30px auto; padding: 0; text-align: center; width: 100%; float: unset;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<a href=\"https://dahimail.com/onboarding/step/1\" class=\"button button-primary\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -webkit-text-size-adjust: none; border-radius: 4px; color: #fff; display: inline-block; overflow: hidden; text-decoration: none; background-color: #18181b; border-bottom: 8px solid #18181b; border-left: 18px solid #18181b; border-right: 18px solid #18181b; border-top: 8px solid #18181b; word-break: break-all;\">Start Setup</a>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Questions? Just reply to this email — a real person reads every message.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">— The Dahimail Team</p>\r\n\r\n\r\n<table class=\"subcopy\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; border-top: 1px solid #e4e4e7; margin-top: 25px; padding-top: 25px;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; text-align: left; font-size: 14px;\">If you\'re having trouble clicking the \"Start Setup\" button, copy and paste the URL below\r\ninto your web browser: <span class=\"break-all\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; word-break: break-all;\"><a href=\"https://dahimail.com/onboarding/step/1\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; word-break: break-all;\" rel=\"noopener noreferrer\">https://dahimail.com/onboarding/step/1</a></span></p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"footer\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; margin: 0 auto; padding: 0; text-align: center; width: 570px;\">\r\n<tr>\r\n<td class=\"content-cell\" align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; color: #a1a1aa; font-size: 12px; text-align: center;\">© 2026 Dahimail. All rights reserved.</p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n\r\n', 'Dahimail: https://dahimail.com\r\n\r\n# Hi Shabina,\r\n\r\nWelcome aboard! Your account is ready and we\'re excited to help you automate your communications.\r\n\r\nHere\'s how to get started in under 5 minutes:\r\n\r\n**1. Connect your email** — Link Gmail or Outlook with one click.\r\n\r\n**2. Train your AI** — Upload a document or FAQ so replies match your voice.\r\n\r\n**3. Set up auto-reply** — Choose when and how AI responds for you.\r\n\r\nStart Setup: https://dahimail.com/onboarding/step/1\r\n\r\nQuestions? Just reply to this email — a real person reads every message.\r\n\r\n— The Dahimail Team\r\n\r\nIf you\'re having trouble clicking the \"Start Setup\" button, copy and paste the URL below\r\ninto your web browser: [https://dahimail.com/onboarding/step/1](https://dahimail.com/onboarding/step/1)\r\n\r\n© 2026 Dahimail. All rights reserved.\r\n', 'Welcome to Dahimail!', 'noreply@dahimail.com', 'Dahimail', '[\"shabinafbr@dahimail.com\"]', '[]', '[]', '<ad0bf80cddd17c57452bbcaf18aa3190@dahimail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-09-29 04:46:43', '2026-09-29 04:46:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'INBOX', '2026-09-29 04:49:08', '2026-09-29 04:49:08', NULL),
(15, 'cb212a26-38fa-41f6-abad-ffc2bdddd20c', 8, 9, 'inbound', 'contact', NULL, 'message', '\r\n\r\n\r\n\r\n<table class=\"wrapper\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td class=\"header\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; padding: 25px 0; text-align: center;\">\r\n<a href=\"https://dahimail.com\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 19px; font-weight: bold; text-decoration: none; display: inline-block;\" rel=\"noopener noreferrer\">\r\nDahimail\r\n</a>\r\n</td>\r\n</tr>\r\n\r\n\r\n<tr>\r\n<td class=\"body\" width=\"100%\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; border-bottom: 1px solid #fafafa; border-top: 1px solid #fafafa; margin: 0; padding: 0; width: 100%; border: hidden !important;\">\r\n<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; background-color: #ffffff; border-color: #e4e4e7; border-radius: 4px; border-width: 1px; box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px -1px rgba(0, 0, 0, 0.1); margin: 0 auto; padding: 0; width: 570px;\">\r\n\r\n<tr>\r\n<td class=\"content-cell\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<h1 style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 18px; font-weight: bold; margin-top: 0; text-align: start;\">Hello!</h1>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Please click the button below to verify your email address.</p>\r\n<table class=\"action\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 30px auto; padding: 0; text-align: center; width: 100%; float: unset;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<a href=\"https://dahimail.com/email/verify/9/9866d47455adab498aa2872ed6bfa61cb47bf192?expires=1790668003&amp;signature=705b453ddf9d690198c1cc6491f433f0719ae65272239b3b2f2c86ddf5681d2e\" class=\"button button-primary\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -webkit-text-size-adjust: none; border-radius: 4px; color: #fff; display: inline-block; overflow: hidden; text-decoration: none; background-color: #18181b; border-bottom: 8px solid #18181b; border-left: 18px solid #18181b; border-right: 18px solid #18181b; border-top: 8px solid #18181b; word-break: break-all;\">Verify Email Address</a>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">If you did not create an account, no further action is required.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Regards,<br>\r\nDahimail</p>\r\n\r\n\r\n<table class=\"subcopy\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; border-top: 1px solid #e4e4e7; margin-top: 25px; padding-top: 25px;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; text-align: left; font-size: 14px;\">If you\'re having trouble clicking the \"Verify Email Address\" button, copy and paste the URL below\r\ninto your web browser: <span class=\"break-all\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; word-break: break-all;\"><a href=\"https://dahimail.com/email/verify/9/9866d47455adab498aa2872ed6bfa61cb47bf192?expires=1790668003&amp;signature=705b453ddf9d690198c1cc6491f433f0719ae65272239b3b2f2c86ddf5681d2e\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; word-break: break-all;\" rel=\"noopener noreferrer\">https://dahimail.com/email/verify/9/9866d47455adab498aa2872ed6bfa61cb47bf192?expires=1790668003&amp;signature=705b453ddf9d690198c1cc6491f433f0719ae65272239b3b2f2c86ddf5681d2e</a></span></p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"footer\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; margin: 0 auto; padding: 0; text-align: center; width: 570px;\">\r\n<tr>\r\n<td class=\"content-cell\" align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; color: #a1a1aa; font-size: 12px; text-align: center;\">© 2026 Dahimail. All rights reserved.</p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n\r\n', 'Dahimail: https://dahimail.com\r\n\r\n# Hello!\r\n\r\nPlease click the button below to verify your email address.\r\n\r\nVerify Email Address: https://dahimail.com/email/verify/9/9866d47455adab498aa2872ed6bfa61cb47bf192?expires=1790668003&signature=705b453ddf9d690198c1cc6491f433f0719ae65272239b3b2f2c86ddf5681d2e\r\n\r\nIf you did not create an account, no further action is required.\r\n\r\nRegards,\r\nDahimail\r\n\r\nIf you\'re having trouble clicking the \"Verify Email Address\" button, copy and paste the URL below\r\ninto your web browser: [https://dahimail.com/email/verify/9/9866d47455adab498aa2872ed6bfa61cb47bf192?expires=1790668003&signature=705b453ddf9d690198c1cc6491f433f0719ae65272239b3b2f2c86ddf5681d2e](https://dahimail.com/email/verify/9/9866d47455adab498aa2872ed6bfa61cb47bf192?expires=1790668003&signature=705b453ddf9d690198c1cc6491f433f0719ae65272239b3b2f2c86ddf5681d2e)\r\n\r\n© 2026 Dahimail. All rights reserved.\r\n', 'Verify Email Address', 'noreply@dahimail.com', 'Dahimail', '[\"shabinafbr@dahimail.com\"]', '[]', '[]', '<d7c0f6d73278e16ae8a2e0230558cf12@dahimail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-09-29 04:46:43', '2026-09-29 04:46:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'INBOX', '2026-09-29 04:49:08', '2026-09-29 04:49:08', NULL);
INSERT INTO `messages` (`id`, `uuid`, `conversation_id`, `workspace_id`, `direction`, `sender_type`, `sender_id`, `type`, `body_html`, `body_text`, `subject`, `from_email`, `from_name`, `to_emails`, `cc_emails`, `bcc_emails`, `message_id_header`, `in_reply_to`, `references_header`, `ai_confidence`, `ai_model`, `ai_provider`, `ai_tokens_in`, `ai_tokens_out`, `ai_cost`, `ai_response_time_ms`, `ai_sources_used`, `ai_status`, `sentiment`, `detected_language`, `delivery_status`, `delivery_error`, `opens_count`, `clicks_count`, `sent_at`, `delivered_at`, `opened_at`, `clicked_at`, `bounced_at`, `bounce_type`, `scheduled_at`, `schedule_status`, `channel_message_id`, `imap_uid`, `imap_folder`, `created_at`, `updated_at`, `deleted_at`) VALUES
(16, '937b02a3-a414-48f1-bf85-9b8b648101ae', 9, 9, 'inbound', 'contact', NULL, 'message', '\n\n\n	<center>\n		<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin: 0; padding: 0; width: 100%; height: 100%;\" bgcolor=\"#f4ecfa\" class=\"gwfw\">\n			<tr>\n				<td style=\"margin: 0; padding: 0; width: 100%; height: 100%;\" align=\"center\" valign=\"top\">\n					<table width=\"600\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"m-shell\">\n						<tr>\n							<td class=\"td\" style=\"width:600px; min-width:600px; font-size:0pt; line-height:0pt; padding:0; margin:0; font-weight:normal;\">\n								<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n									<tr>\n										<td class=\"mpx-10\">\n											\n											\n													\n														\n															\n														\n													\n															\n												 \n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n												<tr>\n													<td class=\"gradient pt-10\" style=\"border-radius: 10px 10px 0 0; padding-top: 10px;\" bgcolor=\"#f3189e\">\n														<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n															<tr>\n																<td style=\"border-radius: 10px 10px 0 0;\" bgcolor=\"#ffffff\">\n																	\n																	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#162330\">\n																		<tr>\n																			<td class=\"img-center p-30 px-15\" style=\"font-size:0pt; line-height:0pt; text-align:left; padding: 30px; padding-left: 15px; padding-right: 15px;\">\n																				<a href=\"https://www.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/fbr_logo.png\" width=\"100\" alt=\"\"></a>\n																			</td>\n																			<td class=\"img-center p-30 px-15\" style=\"font-size:0pt; line-height:0pt; text-align:right; padding: 30px; padding-left: 15px; padding-right: 15px;\">\n																				<a href=\"https://www.iris.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/iris_logo.png\" width=\"120\" alt=\"\"></a>\n																			</td>\n																		</tr>\n																	</table>\n																	\n											\n																	\n																	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																		<tr>\n																			<td class=\"px-50 mpx-15\" style=\"padding-left: 50px; padding-right: 50px;\">\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-50\" style=\"padding-bottom: 30px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"fluid-img img-center pb-30\" style=\"font-size:0pt; line-height:0pt; text-align:left; padding-bottom: 10px; padding-top: 10px\">\n																										<img src=\"https://e.fbr.gov.pk/images/email/mail_icon.png\" width=\"283\" alt=\"\">\n																									</td>\n																								</tr>\n																								\n																									\n																										\n																									\n																								\n																							\n																								<tr>\n																									<td class=\"text-16 lh-26 a-center pb-25\" style=\"font-size:16px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 26px; text-align:left; padding-bottom: 25px;\">\n																										<strong>Dear Sir/Madam,</strong>\n																										<br>\n																										 Verification Code: 251373\nFBR, GoP\n																										\n																									</td>\n																								</tr>\n																								\n																									\n																										\n																											\n																												\n																													\n																												\n																											\n																								\n																									<td align=\"left\">\n																										\n																										<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"max-width: 200px; margin-top: 20px;\">\n																											<tr>\n																												<td class=\"btn-16 c-white l-white\" bgcolor=\"#20a77d\" style=\"font-size:16px; line-height:20px; mso-padding-alt:15px 35px; font-family:\'PT Sans\', Arial, sans-serif; text-align:center; font-weight:bold; text-transform:uppercase; border-radius:25px; min-width:auto !important; color:#ffffff;\">\n																													<a href=\"https://iris.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"display: block; padding: 15px 35px; text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\">\n																														<span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">LOGIN TO IRIS</span>\n																													</a>\n																												</td>\n																											</tr>\n																											\n																										</table>\n																										\n																									</td>\n																								\n																											<tr>\n																									\n																										\n																									\n																								</tr>\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n											\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-50\" style=\"padding-bottom: 50px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"img\" height=\"1\" bgcolor=\"#ebebeb\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> </td>\n																								</tr>\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n											\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-15\" style=\"padding-bottom: 15px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\" min-width:auto !important; text-align:center; padding-bottom: 35px;\">\n																										<img src=\"https://e.fbr.gov.pk/images/email/taxasaan.png?no-proxy\">\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\"font-size:26px; line-height:30px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; text-align:left; padding-bottom: 35px;\">\n																										<strong>Tax Asaan Mobile Application</strong>\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"pb-35\" style=\"padding-bottom: 35px;\">\n																										<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																											<tr>\n																												\n																												<td valign=\"top\">\n																													<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																														<tr>\n																															<td class=\"title-20 pb-5\" style=\"font-size:16px; line-height:24px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; text-align:left; min-width:auto !important; padding-bottom: 5px;\">You may download our mobile application \"Tax Asaan\" for Android and Apple\'s iOS. \n\nThis application provides taxpayers an alternate way to connect with Iris through your mobile and perform following actions:<br><br>\n																																<strong>• New Registration for Income Tax and Sales Tax</strong><br><strong>• Filing of Salaried and Simplified Return</strong><br><strong>• View Assets (FBR Maloomat) </strong><br><strong>• More Services</strong>\n																															</td>\n																														</tr>\n																													\n																													</table>\n																												</td>\n																											</tr>\n																										</table>\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\"font-size:26px; line-height:30px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; text-align:left; padding-bottom: 35px;\">\n																										<a href=\"https://play.google.com/store/apps/details?id=com.pral.fbr_varification_system&amp;hl=en&amp;gl=US\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/googleplay_btn.png\" alt=\"Google Play\" title=\"Download TaxAsaan from Google Play Store\"></a> <a href=\"https://apps.apple.com/pk/app/tax-asaan/id1475081010\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/applestore_btn.png\" alt=\"Play Store\" title=\"Download TaxAsaan from App Store\"></a>\n																									</td>\n																								</tr>\n																								\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n																			</td>\n																		</tr>\n																	</table>\n																	\n																</td>\n															</tr>\n														</table>\n													</td>\n												</tr>\n											</table>\n											\n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tr>\n														<td class=\"p-50 mpx-15\" bgcolor=\"#162330\" style=\"border-radius: 0 0 10px 10px; padding: 50px;\">\n															<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																<tr>\n																	<td align=\"center\" class=\"pb-20\" style=\"padding-bottom: 20px;\">\n																		\n																		<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																			<tr>\n																					<td class=\"img\" width=\"117\" style=\"font-size:0pt; line-height:0pt; text-align:left;\">\n																					<a href=\"https://www.iris.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/iris_logo.png\" width=\"150\" alt=\"\"></a>\n																				</td>\n																				\n																			</tr>\n																		</table>\n																		\n																	</td>\n																</tr>\n																<tr>\n																	<td class=\"text-14 lh-24 a-center c-white l-white pb-20\" style=\"font-size:14px; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 24px; text-align:center; color:#ffffff; padding-bottom: 20px;\">\n																		To know about IRIS 2.0 published release and upcoming features please visit\n																		<br><a href=\"https://help.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#20a77d;\">help.fbr.gov.pk</span></a><br>\n																		<a href=\"tel:+92%2051%20111%20772%20772\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">Helpline: +92 51 111 772 772</span></a>\n																		<br>\n																		<a href=\"mailto:ihelpline@fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">helpline@fbr.gov.pk</span></a> - <a href=\"https://www.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">www.fbr.gov.pk</span></a>\n																	</td>\n																</tr>\n																<tr>\n																	<td align=\"center\"> \n																		 \n																		<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																		<tr> \n																		<td class=\"img\" width=\"30\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> \n																		<a href=\"https://www.facebook.com/people/Federal-Board-of-Revenue/100064688588666/\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/facebook_ico.png\" width=\"20\" alt=\"\"></a> \n																		</td> \n																				\n																		<td class=\"img\" width=\"30\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> \n																		<a href=\"https://www.youtube.com/channel/UCN_cl3qHp3t3SxdRZ3r2ZeQ?view_as=subscriber\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/youtube_ico.png\" width=\"20\" alt=\"\"></a> \n																		</td>\n																		</tr>\n																		</table>\n																		 \n																	</td> \n																</tr>\n															</table>\n														</td>\n													</tr>\n												</table>											\n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tr>\n														<td class=\"text-12 lh-22 a-center c-grey- l-grey py-20\" style=\"font-size:12px; color:#FFF; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 22px; text-align:center; padding-top: 20px; padding-bottom: 20px;\">\n															<a href=\"https://www.pral.com.pk\" target=\"_blank\" class=\"link c-grey\" style=\"text-decoration:none; color:#6e6e6e;\" rel=\"noopener noreferrer\"><span class=\"link c-grey\" style=\"white-space: nowrap; text-decoration:none; color:#fff;\">© All Rights Reserved.</span></a>  |  <a href=\"https://www.pral.com.pk\" target=\"_blank\" class=\"link c-grey\" style=\"text-decoration:none; color:#6e6e6e;\" rel=\"noopener noreferrer\"><span class=\"link c-grey\" style=\"white-space: nowrap; text-decoration:none; color:#FFF;\">Powered By: <img src=\"https://e.fbr.gov.pk/images/email/PRAL_logo.png\" width=\"18\"></span></a>\n														</td>\n													</tr>\n												</table>											\n										</td>\n									</tr>\n								</table>\n							</td>\n						</tr>\n					</table>\n				</td>\n			</tr>\n		</table>\n	</center>\n\n\n', NULL, '(No Subject)', 'noreply@fbr.gov.pk', 'noreply@fbr.gov.pk', '[\"shabinafbr@dahimail.com\"]', '[]', '[]', '<77FC6D91D5804EAD95BFC8496DA6EDBF.MAI@fbrmail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-09-29 04:53:50', '2026-09-29 04:53:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'INBOX', '2026-09-29 04:54:03', '2026-09-29 04:54:03', NULL),
(17, '59b6dd2b-8b28-4a8a-93ee-409fc96b4a2c', 12, 4, 'outbound', 'agent', 3, 'message', 'djdjjfjfjf', 'djdjjfjfjf', 'sjdjddu', 'uape@dahimail.com', 'nb', '[\"umairkheshgi@gmail.com\"]', NULL, NULL, '<34389676-535e-4bb4-96c5-7819a67a11b4@dahimail.com>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'queued', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-29 14:55:53', 'pending', NULL, NULL, NULL, '2026-09-29 14:55:43', '2026-09-29 14:55:43', NULL),
(18, '08457485-cdbe-40e4-a9f0-12e5c4977931', 12, 4, 'outbound', 'agent', 3, 'message', 'dididid', 'dididid', 'Re: sjdjddu', 'uape@dahimail.com', 'nb', '[\"umairkheshgi@gmail.com\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'queued', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-29 14:56:50', 'pending', NULL, NULL, NULL, '2026-09-29 14:56:40', '2026-09-29 14:56:40', NULL),
(19, '7f7c47e8-683d-485e-9794-23c24bf3a6cb', 13, 4, 'outbound', 'agent', 3, 'message', '<p>gjggfff</p>', 'gjggfff', 'ghfd', 'uape@dahimail.com', 'nb', '[\"umairkheshgi@gmail.com\"]', NULL, NULL, '<e8f19760-9c4b-452a-8cab-bf54f10801be@dahimail.com>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sent', NULL, 1, 0, '2026-09-29 16:04:05', NULL, '2026-09-29 16:04:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-29 16:04:05', '2026-09-29 16:04:08', NULL),
(20, '38039d5e-b1a1-453a-a436-9f0a327f22f4', 14, 4, 'inbound', 'contact', NULL, 'message', '<div dir=\"ltr\">acascacac<div><br></div></div>\r\n', 'acascacac\r\n', 'acasc', 'umairkheshgi@gmail.com', 'Umair Ali', '[\"uape@dahimail.com\"]', '[]', '[]', '<CAN6y5pwYxCFhkn2yPmoOk=DrqHZowi8VwQG6=0kDqTVxXaP+xw@mail.gmail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-09-29 14:58:58', '2026-09-29 14:58:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'INBOX', '2026-09-29 16:04:12', '2026-09-29 16:04:12', NULL),
(21, 'd9c822f6-fcf9-47f7-a740-cf9822313207', 13, 4, 'inbound', 'contact', NULL, 'message', '<div dir=\"auto\">Ssdffff</div><br><div class=\"gmail_quote gmail_quote_container\"><div dir=\"ltr\" class=\"gmail_attr\">On Tue, 29 Sept 2026, 23:04 nb, &lt;<a href=\"mailto:uape@dahimail.com\" rel=\"noopener noreferrer\">uape@dahimail.com</a>&gt; wrote:<br></div><blockquote class=\"gmail_quote\" style=\"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex\"><p>gjggfff</p><img width=\"1\" height=\"1\" style=\"display:none\" alt=\"\"></blockquote></div>\r\n', 'Ssdffff\r\n\r\nOn Tue, 29 Sept 2026, 23:04 nb, <uape@dahimail.com> wrote:\r\n\r\n> gjggfff\r\n>\r\n', 'Re: ghfd', 'umairkheshgi@gmail.com', 'Umair Ali', '[\"uape@dahimail.com\"]', '[]', '[]', '<CAN6y5px_VMqea7p8c=2RfRvZNbpk=BRcF9cCbCU1y747mBgV0A@mail.gmail.com>', '<183593c2bd59857c04b9a2836eb76c2d@dahimail.com>', '[\"<183593c2bd59857c04b9a2836eb76c2d@dahimail.com>\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-09-30 02:01:00', '2026-09-30 02:01:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'INBOX', '2026-09-30 03:46:12', '2026-09-30 03:46:12', NULL),
(22, '59f9fab0-79a0-48ab-a10b-a339bfdda5e7', 15, 11, 'inbound', 'contact', NULL, 'message', '\r\n\r\n\r\n\r\n<table class=\"wrapper\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td class=\"header\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; padding: 25px 0; text-align: center;\">\r\n<a href=\"https://dahimail.com\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 19px; font-weight: bold; text-decoration: none; display: inline-block;\" rel=\"noopener noreferrer\">\r\nDahimail\r\n</a>\r\n</td>\r\n</tr>\r\n\r\n\r\n<tr>\r\n<td class=\"body\" width=\"100%\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; border-bottom: 1px solid #fafafa; border-top: 1px solid #fafafa; margin: 0; padding: 0; width: 100%; border: hidden !important;\">\r\n<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; background-color: #ffffff; border-color: #e4e4e7; border-radius: 4px; border-width: 1px; box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px -1px rgba(0, 0, 0, 0.1); margin: 0 auto; padding: 0; width: 570px;\">\r\n\r\n<tr>\r\n<td class=\"content-cell\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<h1 style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 18px; font-weight: bold; margin-top: 0; text-align: start;\">Hi Qaqa,</h1>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Welcome aboard! Your account is ready and we\'re excited to help you automate your communications.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Here\'s how to get started in under 5 minutes:</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">1. Connect your email</strong> — Link Gmail or Outlook with one click.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">2. Train your AI</strong> — Upload a document or FAQ so replies match your voice.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">3. Set up auto-reply</strong> — Choose when and how AI responds for you.</p>\r\n<table class=\"action\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 30px auto; padding: 0; text-align: center; width: 100%; float: unset;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<a href=\"https://dahimail.com/onboarding/step/1\" class=\"button button-primary\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -webkit-text-size-adjust: none; border-radius: 4px; color: #fff; display: inline-block; overflow: hidden; text-decoration: none; background-color: #18181b; border-bottom: 8px solid #18181b; border-left: 18px solid #18181b; border-right: 18px solid #18181b; border-top: 8px solid #18181b; word-break: break-all;\">Start Setup</a>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Questions? Just reply to this email — a real person reads every message.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">— The Dahimail Team</p>\r\n\r\n\r\n<table class=\"subcopy\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; border-top: 1px solid #e4e4e7; margin-top: 25px; padding-top: 25px;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; text-align: left; font-size: 14px;\">If you\'re having trouble clicking the \"Start Setup\" button, copy and paste the URL below\r\ninto your web browser: <span class=\"break-all\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; word-break: break-all;\"><a href=\"https://dahimail.com/onboarding/step/1\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; word-break: break-all;\" rel=\"noopener noreferrer\">https://dahimail.com/onboarding/step/1</a></span></p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"footer\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; margin: 0 auto; padding: 0; text-align: center; width: 570px;\">\r\n<tr>\r\n<td class=\"content-cell\" align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; color: #a1a1aa; font-size: 12px; text-align: center;\">© 2026 Dahimail. All rights reserved.</p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n\r\n', 'Dahimail: https://dahimail.com\r\n\r\n# Hi Qaqa,\r\n\r\nWelcome aboard! Your account is ready and we\'re excited to help you automate your communications.\r\n\r\nHere\'s how to get started in under 5 minutes:\r\n\r\n**1. Connect your email** — Link Gmail or Outlook with one click.\r\n\r\n**2. Train your AI** — Upload a document or FAQ so replies match your voice.\r\n\r\n**3. Set up auto-reply** — Choose when and how AI responds for you.\r\n\r\nStart Setup: https://dahimail.com/onboarding/step/1\r\n\r\nQuestions? Just reply to this email — a real person reads every message.\r\n\r\n— The Dahimail Team\r\n\r\nIf you\'re having trouble clicking the \"Start Setup\" button, copy and paste the URL below\r\ninto your web browser: [https://dahimail.com/onboarding/step/1](https://dahimail.com/onboarding/step/1)\r\n\r\n© 2026 Dahimail. All rights reserved.\r\n', 'Welcome to Dahimail!', 'noreply@dahimail.com', 'Dahimail', '[\"qaqa@dahimail.com\"]', '[]', '[]', '<cc5a2d14f7a6fdda5438ebb2ed232d3e@dahimail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-09-30 04:18:59', '2026-09-30 04:18:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'INBOX', '2026-09-30 04:19:14', '2026-09-30 04:19:14', NULL),
(23, '9f858c63-0dfd-4ca7-8a82-e286f1d1ce41', 16, 11, 'outbound', 'agent', 11, 'message', '<p>dududididifid</p>', 'dududididifid', 'sjsjfjfj', 'qaqa@dahimail.com', 'Qaqa', '[\"umairkheshgi@gmail.com\"]', NULL, NULL, '<756db1d8-ad95-42d9-832c-1b08899d3b41@dahimail.com>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sent', NULL, 1, 0, '2026-09-30 04:19:49', NULL, '2026-09-30 04:19:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-30 04:19:49', '2026-09-30 04:19:52', NULL),
(24, '1a9f1fde-edbb-41cd-86f5-19fce117e609', 17, 12, 'inbound', 'contact', NULL, 'message', '\r\n\r\n\r\n\r\n<table class=\"wrapper\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td class=\"header\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; padding: 25px 0; text-align: center;\">\r\n<a href=\"https://dahimail.com\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 19px; font-weight: bold; text-decoration: none; display: inline-block;\" rel=\"noopener noreferrer\">\r\nDahimail\r\n</a>\r\n</td>\r\n</tr>\r\n\r\n\r\n<tr>\r\n<td class=\"body\" width=\"100%\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; border-bottom: 1px solid #fafafa; border-top: 1px solid #fafafa; margin: 0; padding: 0; width: 100%; border: hidden !important;\">\r\n<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; background-color: #ffffff; border-color: #e4e4e7; border-radius: 4px; border-width: 1px; box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px -1px rgba(0, 0, 0, 0.1); margin: 0 auto; padding: 0; width: 570px;\">\r\n\r\n<tr>\r\n<td class=\"content-cell\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<h1 style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 18px; font-weight: bold; margin-top: 0; text-align: start;\">Hi Zubair,</h1>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Welcome aboard! Your account is ready and we\'re excited to help you automate your communications.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Here\'s how to get started in under 5 minutes:</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">1. Connect your email</strong> — Link Gmail or Outlook with one click.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">2. Train your AI</strong> — Upload a document or FAQ so replies match your voice.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">3. Set up auto-reply</strong> — Choose when and how AI responds for you.</p>\r\n<table class=\"action\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 30px auto; padding: 0; text-align: center; width: 100%; float: unset;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<a href=\"https://dahimail.com/onboarding/step/1\" class=\"button button-primary\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -webkit-text-size-adjust: none; border-radius: 4px; color: #fff; display: inline-block; overflow: hidden; text-decoration: none; background-color: #18181b; border-bottom: 8px solid #18181b; border-left: 18px solid #18181b; border-right: 18px solid #18181b; border-top: 8px solid #18181b; word-break: break-all;\">Start Setup</a>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Questions? Just reply to this email — a real person reads every message.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">— The Dahimail Team</p>\r\n\r\n\r\n<table class=\"subcopy\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; border-top: 1px solid #e4e4e7; margin-top: 25px; padding-top: 25px;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; text-align: left; font-size: 14px;\">If you\'re having trouble clicking the \"Start Setup\" button, copy and paste the URL below\r\ninto your web browser: <span class=\"break-all\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; word-break: break-all;\"><a href=\"https://dahimail.com/onboarding/step/1\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; word-break: break-all;\" rel=\"noopener noreferrer\">https://dahimail.com/onboarding/step/1</a></span></p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"footer\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; margin: 0 auto; padding: 0; text-align: center; width: 570px;\">\r\n<tr>\r\n<td class=\"content-cell\" align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; color: #a1a1aa; font-size: 12px; text-align: center;\">© 2026 Dahimail. All rights reserved.</p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n\r\n', 'Dahimail: https://dahimail.com\r\n\r\n# Hi Zubair,\r\n\r\nWelcome aboard! Your account is ready and we\'re excited to help you automate your communications.\r\n\r\nHere\'s how to get started in under 5 minutes:\r\n\r\n**1. Connect your email** — Link Gmail or Outlook with one click.\r\n\r\n**2. Train your AI** — Upload a document or FAQ so replies match your voice.\r\n\r\n**3. Set up auto-reply** — Choose when and how AI responds for you.\r\n\r\nStart Setup: https://dahimail.com/onboarding/step/1\r\n\r\nQuestions? Just reply to this email — a real person reads every message.\r\n\r\n— The Dahimail Team\r\n\r\nIf you\'re having trouble clicking the \"Start Setup\" button, copy and paste the URL below\r\ninto your web browser: [https://dahimail.com/onboarding/step/1](https://dahimail.com/onboarding/step/1)\r\n\r\n© 2026 Dahimail. All rights reserved.\r\n', 'Welcome to Dahimail!', 'noreply@dahimail.com', 'Dahimail', '[\"zubairfbr@dahimail.com\"]', '[]', '[]', '<fdacc95bd0f9c2507f52f64b9f2ba1cc@dahimail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-09-30 11:08:48', '2026-09-30 11:08:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'INBOX', '2026-09-30 11:14:36', '2026-09-30 11:14:36', NULL);
INSERT INTO `messages` (`id`, `uuid`, `conversation_id`, `workspace_id`, `direction`, `sender_type`, `sender_id`, `type`, `body_html`, `body_text`, `subject`, `from_email`, `from_name`, `to_emails`, `cc_emails`, `bcc_emails`, `message_id_header`, `in_reply_to`, `references_header`, `ai_confidence`, `ai_model`, `ai_provider`, `ai_tokens_in`, `ai_tokens_out`, `ai_cost`, `ai_response_time_ms`, `ai_sources_used`, `ai_status`, `sentiment`, `detected_language`, `delivery_status`, `delivery_error`, `opens_count`, `clicks_count`, `sent_at`, `delivered_at`, `opened_at`, `clicked_at`, `bounced_at`, `bounce_type`, `scheduled_at`, `schedule_status`, `channel_message_id`, `imap_uid`, `imap_folder`, `created_at`, `updated_at`, `deleted_at`) VALUES
(25, '4dfbec03-9a23-455c-9eba-b4dd207dc39d', 18, 12, 'inbound', 'contact', NULL, 'message', '\n\n\n	<center>\n		<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin: 0; padding: 0; width: 100%; height: 100%;\" bgcolor=\"#f4ecfa\" class=\"gwfw\">\n			<tr>\n				<td style=\"margin: 0; padding: 0; width: 100%; height: 100%;\" align=\"center\" valign=\"top\">\n					<table width=\"600\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"m-shell\">\n						<tr>\n							<td class=\"td\" style=\"width:600px; min-width:600px; font-size:0pt; line-height:0pt; padding:0; margin:0; font-weight:normal;\">\n								<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n									<tr>\n										<td class=\"mpx-10\">\n											\n											\n													\n														\n															\n														\n													\n															\n												 \n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n												<tr>\n													<td class=\"gradient pt-10\" style=\"border-radius: 10px 10px 0 0; padding-top: 10px;\" bgcolor=\"#f3189e\">\n														<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n															<tr>\n																<td style=\"border-radius: 10px 10px 0 0;\" bgcolor=\"#ffffff\">\n																	\n																	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#162330\">\n																		<tr>\n																			<td class=\"img-center p-30 px-15\" style=\"font-size:0pt; line-height:0pt; text-align:left; padding: 30px; padding-left: 15px; padding-right: 15px;\">\n																				<a href=\"https://www.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/fbr_logo.png\" width=\"100\" alt=\"\"></a>\n																			</td>\n																			<td class=\"img-center p-30 px-15\" style=\"font-size:0pt; line-height:0pt; text-align:right; padding: 30px; padding-left: 15px; padding-right: 15px;\">\n																				<a href=\"https://www.iris.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/iris_logo.png\" width=\"120\" alt=\"\"></a>\n																			</td>\n																		</tr>\n																	</table>\n																	\n											\n																	\n																	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																		<tr>\n																			<td class=\"px-50 mpx-15\" style=\"padding-left: 50px; padding-right: 50px;\">\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-50\" style=\"padding-bottom: 30px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"fluid-img img-center pb-30\" style=\"font-size:0pt; line-height:0pt; text-align:left; padding-bottom: 10px; padding-top: 10px\">\n																										<img src=\"https://e.fbr.gov.pk/images/email/mail_icon.png\" width=\"283\" alt=\"\">\n																									</td>\n																								</tr>\n																								\n																									\n																										\n																									\n																								\n																							\n																								<tr>\n																									<td class=\"text-16 lh-26 a-center pb-25\" style=\"font-size:16px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 26px; text-align:left; padding-bottom: 25px;\">\n																										<strong>Dear Sir/Madam,</strong>\n																										<br>\n																										 Verification Code: 734780\nFBR, GoP\n																										\n																									</td>\n																								</tr>\n																								\n																									\n																										\n																											\n																												\n																													\n																												\n																											\n																								\n																									<td align=\"left\">\n																										\n																										<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"max-width: 200px; margin-top: 20px;\">\n																											<tr>\n																												<td class=\"btn-16 c-white l-white\" bgcolor=\"#20a77d\" style=\"font-size:16px; line-height:20px; mso-padding-alt:15px 35px; font-family:\'PT Sans\', Arial, sans-serif; text-align:center; font-weight:bold; text-transform:uppercase; border-radius:25px; min-width:auto !important; color:#ffffff;\">\n																													<a href=\"https://iris.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"display: block; padding: 15px 35px; text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\">\n																														<span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">LOGIN TO IRIS</span>\n																													</a>\n																												</td>\n																											</tr>\n																											\n																										</table>\n																										\n																									</td>\n																								\n																											<tr>\n																									\n																										\n																									\n																								</tr>\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n											\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-50\" style=\"padding-bottom: 50px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"img\" height=\"1\" bgcolor=\"#ebebeb\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> </td>\n																								</tr>\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n											\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-15\" style=\"padding-bottom: 15px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\" min-width:auto !important; text-align:center; padding-bottom: 35px;\">\n																										<img src=\"https://e.fbr.gov.pk/images/email/taxasaan.png?no-proxy\">\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\"font-size:26px; line-height:30px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; text-align:left; padding-bottom: 35px;\">\n																										<strong>Tax Asaan Mobile Application</strong>\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"pb-35\" style=\"padding-bottom: 35px;\">\n																										<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																											<tr>\n																												\n																												<td valign=\"top\">\n																													<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																														<tr>\n																															<td class=\"title-20 pb-5\" style=\"font-size:16px; line-height:24px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; text-align:left; min-width:auto !important; padding-bottom: 5px;\">You may download our mobile application \"Tax Asaan\" for Android and Apple\'s iOS. \n\nThis application provides taxpayers an alternate way to connect with Iris through your mobile and perform following actions:<br><br>\n																																<strong>• New Registration for Income Tax and Sales Tax</strong><br><strong>• Filing of Salaried and Simplified Return</strong><br><strong>• View Assets (FBR Maloomat) </strong><br><strong>• More Services</strong>\n																															</td>\n																														</tr>\n																													\n																													</table>\n																												</td>\n																											</tr>\n																										</table>\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\"font-size:26px; line-height:30px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; text-align:left; padding-bottom: 35px;\">\n																										<a href=\"https://play.google.com/store/apps/details?id=com.pral.fbr_varification_system&amp;hl=en&amp;gl=US\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/googleplay_btn.png\" alt=\"Google Play\" title=\"Download TaxAsaan from Google Play Store\"></a> <a href=\"https://apps.apple.com/pk/app/tax-asaan/id1475081010\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/applestore_btn.png\" alt=\"Play Store\" title=\"Download TaxAsaan from App Store\"></a>\n																									</td>\n																								</tr>\n																								\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n																			</td>\n																		</tr>\n																	</table>\n																	\n																</td>\n															</tr>\n														</table>\n													</td>\n												</tr>\n											</table>\n											\n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tr>\n														<td class=\"p-50 mpx-15\" bgcolor=\"#162330\" style=\"border-radius: 0 0 10px 10px; padding: 50px;\">\n															<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																<tr>\n																	<td align=\"center\" class=\"pb-20\" style=\"padding-bottom: 20px;\">\n																		\n																		<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																			<tr>\n																					<td class=\"img\" width=\"117\" style=\"font-size:0pt; line-height:0pt; text-align:left;\">\n																					<a href=\"https://www.iris.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/iris_logo.png\" width=\"150\" alt=\"\"></a>\n																				</td>\n																				\n																			</tr>\n																		</table>\n																		\n																	</td>\n																</tr>\n																<tr>\n																	<td class=\"text-14 lh-24 a-center c-white l-white pb-20\" style=\"font-size:14px; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 24px; text-align:center; color:#ffffff; padding-bottom: 20px;\">\n																		To know about IRIS 2.0 published release and upcoming features please visit\n																		<br><a href=\"https://help.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#20a77d;\">help.fbr.gov.pk</span></a><br>\n																		<a href=\"tel:+92%2051%20111%20772%20772\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">Helpline: +92 51 111 772 772</span></a>\n																		<br>\n																		<a href=\"mailto:ihelpline@fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">helpline@fbr.gov.pk</span></a> - <a href=\"https://www.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">www.fbr.gov.pk</span></a>\n																	</td>\n																</tr>\n																<tr>\n																	<td align=\"center\"> \n																		 \n																		<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																		<tr> \n																		<td class=\"img\" width=\"30\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> \n																		<a href=\"https://www.facebook.com/people/Federal-Board-of-Revenue/100064688588666/\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/facebook_ico.png\" width=\"20\" alt=\"\"></a> \n																		</td> \n																				\n																		<td class=\"img\" width=\"30\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> \n																		<a href=\"https://www.youtube.com/channel/UCN_cl3qHp3t3SxdRZ3r2ZeQ?view_as=subscriber\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/youtube_ico.png\" width=\"20\" alt=\"\"></a> \n																		</td>\n																		</tr>\n																		</table>\n																		 \n																	</td> \n																</tr>\n															</table>\n														</td>\n													</tr>\n												</table>											\n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tr>\n														<td class=\"text-12 lh-22 a-center c-grey- l-grey py-20\" style=\"font-size:12px; color:#FFF; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 22px; text-align:center; padding-top: 20px; padding-bottom: 20px;\">\n															<a href=\"https://www.pral.com.pk\" target=\"_blank\" class=\"link c-grey\" style=\"text-decoration:none; color:#6e6e6e;\" rel=\"noopener noreferrer\"><span class=\"link c-grey\" style=\"white-space: nowrap; text-decoration:none; color:#fff;\">© All Rights Reserved.</span></a>  |  <a href=\"https://www.pral.com.pk\" target=\"_blank\" class=\"link c-grey\" style=\"text-decoration:none; color:#6e6e6e;\" rel=\"noopener noreferrer\"><span class=\"link c-grey\" style=\"white-space: nowrap; text-decoration:none; color:#FFF;\">Powered By: <img src=\"https://e.fbr.gov.pk/images/email/PRAL_logo.png\" width=\"18\"></span></a>\n														</td>\n													</tr>\n												</table>											\n										</td>\n									</tr>\n								</table>\n							</td>\n						</tr>\n					</table>\n				</td>\n			</tr>\n		</table>\n	</center>\n\n\n', NULL, '(No Subject)', 'noreply@fbr.gov.pk', 'noreply@fbr.gov.pk', '[\"zubairfbr@dahimail.com\"]', '[]', '[]', '<740AA53628454BDA9BA4D7E98B29FE0D.MAI@fbrmail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-09-30 11:47:49', '2026-09-30 11:47:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'INBOX', '2026-09-30 11:48:11', '2026-09-30 11:48:11', NULL),
(26, 'a5cdb609-3e8e-4ec9-95a9-c5c3307a1839', 19, 12, 'inbound', 'contact', NULL, 'message', '\n\n\n	<center>\n		<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin: 0; padding: 0; width: 100%; height: 100%;\" bgcolor=\"#f4ecfa\" class=\"gwfw\">\n			<tr>\n				<td style=\"margin: 0; padding: 0; width: 100%; height: 100%;\" align=\"center\" valign=\"top\">\n					<table width=\"600\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"m-shell\">\n						<tr>\n							<td class=\"td\" style=\"width:600px; min-width:600px; font-size:0pt; line-height:0pt; padding:0; margin:0; font-weight:normal;\">\n								<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n									<tr>\n										<td class=\"mpx-10\">\n											\n											\n													\n														\n															\n														\n													\n															\n												 \n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n												<tr>\n													<td class=\"gradient pt-10\" style=\"border-radius: 10px 10px 0 0; padding-top: 10px;\" bgcolor=\"#f3189e\">\n														<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n															<tr>\n																<td style=\"border-radius: 10px 10px 0 0;\" bgcolor=\"#ffffff\">\n																	\n																	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#162330\">\n																		<tr>\n																			<td class=\"img-center p-30 px-15\" style=\"font-size:0pt; line-height:0pt; text-align:left; padding: 30px; padding-left: 15px; padding-right: 15px;\">\n																				<a href=\"https://www.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/fbr_logo.png\" width=\"100\" alt=\"\"></a>\n																			</td>\n																			<td class=\"img-center p-30 px-15\" style=\"font-size:0pt; line-height:0pt; text-align:right; padding: 30px; padding-left: 15px; padding-right: 15px;\">\n																				<a href=\"https://www.iris.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/iris_logo.png\" width=\"120\" alt=\"\"></a>\n																			</td>\n																		</tr>\n																	</table>\n																	\n											\n																	\n																	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																		<tr>\n																			<td class=\"px-50 mpx-15\" style=\"padding-left: 50px; padding-right: 50px;\">\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-50\" style=\"padding-bottom: 30px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"fluid-img img-center pb-30\" style=\"font-size:0pt; line-height:0pt; text-align:left; padding-bottom: 10px; padding-top: 10px\">\n																										<img src=\"https://e.fbr.gov.pk/images/email/mail_icon.png\" width=\"283\" alt=\"\">\n																									</td>\n																								</tr>\n																								\n																									\n																										\n																									\n																								\n																							\n																								<tr>\n																									<td class=\"text-16 lh-26 a-center pb-25\" style=\"font-size:16px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 26px; text-align:left; padding-bottom: 25px;\">\n																										<strong>Dear Sir/Madam,</strong>\n																										<br>\n																										 Verification Code: 452136\nFBR, GoP\n																										\n																									</td>\n																								</tr>\n																								\n																									\n																										\n																											\n																												\n																													\n																												\n																											\n																								\n																									<td align=\"left\">\n																										\n																										<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"max-width: 200px; margin-top: 20px;\">\n																											<tr>\n																												<td class=\"btn-16 c-white l-white\" bgcolor=\"#20a77d\" style=\"font-size:16px; line-height:20px; mso-padding-alt:15px 35px; font-family:\'PT Sans\', Arial, sans-serif; text-align:center; font-weight:bold; text-transform:uppercase; border-radius:25px; min-width:auto !important; color:#ffffff;\">\n																													<a href=\"https://iris.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"display: block; padding: 15px 35px; text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\">\n																														<span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">LOGIN TO IRIS</span>\n																													</a>\n																												</td>\n																											</tr>\n																											\n																										</table>\n																										\n																									</td>\n																								\n																											<tr>\n																									\n																										\n																									\n																								</tr>\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n											\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-50\" style=\"padding-bottom: 50px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"img\" height=\"1\" bgcolor=\"#ebebeb\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> </td>\n																								</tr>\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n											\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-15\" style=\"padding-bottom: 15px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\" min-width:auto !important; text-align:center; padding-bottom: 35px;\">\n																										<img src=\"https://e.fbr.gov.pk/images/email/taxasaan.png?no-proxy\">\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\"font-size:26px; line-height:30px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; text-align:left; padding-bottom: 35px;\">\n																										<strong>Tax Asaan Mobile Application</strong>\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"pb-35\" style=\"padding-bottom: 35px;\">\n																										<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																											<tr>\n																												\n																												<td valign=\"top\">\n																													<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																														<tr>\n																															<td class=\"title-20 pb-5\" style=\"font-size:16px; line-height:24px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; text-align:left; min-width:auto !important; padding-bottom: 5px;\">You may download our mobile application \"Tax Asaan\" for Android and Apple\'s iOS. \n\nThis application provides taxpayers an alternate way to connect with Iris through your mobile and perform following actions:<br><br>\n																																<strong>• New Registration for Income Tax and Sales Tax</strong><br><strong>• Filing of Salaried and Simplified Return</strong><br><strong>• View Assets (FBR Maloomat) </strong><br><strong>• More Services</strong>\n																															</td>\n																														</tr>\n																													\n																													</table>\n																												</td>\n																											</tr>\n																										</table>\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\"font-size:26px; line-height:30px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; text-align:left; padding-bottom: 35px;\">\n																										<a href=\"https://play.google.com/store/apps/details?id=com.pral.fbr_varification_system&amp;hl=en&amp;gl=US\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/googleplay_btn.png\" alt=\"Google Play\" title=\"Download TaxAsaan from Google Play Store\"></a> <a href=\"https://apps.apple.com/pk/app/tax-asaan/id1475081010\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/applestore_btn.png\" alt=\"Play Store\" title=\"Download TaxAsaan from App Store\"></a>\n																									</td>\n																								</tr>\n																								\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n																			</td>\n																		</tr>\n																	</table>\n																	\n																</td>\n															</tr>\n														</table>\n													</td>\n												</tr>\n											</table>\n											\n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tr>\n														<td class=\"p-50 mpx-15\" bgcolor=\"#162330\" style=\"border-radius: 0 0 10px 10px; padding: 50px;\">\n															<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																<tr>\n																	<td align=\"center\" class=\"pb-20\" style=\"padding-bottom: 20px;\">\n																		\n																		<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																			<tr>\n																					<td class=\"img\" width=\"117\" style=\"font-size:0pt; line-height:0pt; text-align:left;\">\n																					<a href=\"https://www.iris.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/iris_logo.png\" width=\"150\" alt=\"\"></a>\n																				</td>\n																				\n																			</tr>\n																		</table>\n																		\n																	</td>\n																</tr>\n																<tr>\n																	<td class=\"text-14 lh-24 a-center c-white l-white pb-20\" style=\"font-size:14px; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 24px; text-align:center; color:#ffffff; padding-bottom: 20px;\">\n																		To know about IRIS 2.0 published release and upcoming features please visit\n																		<br><a href=\"https://help.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#20a77d;\">help.fbr.gov.pk</span></a><br>\n																		<a href=\"tel:+92%2051%20111%20772%20772\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">Helpline: +92 51 111 772 772</span></a>\n																		<br>\n																		<a href=\"mailto:ihelpline@fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">helpline@fbr.gov.pk</span></a> - <a href=\"https://www.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">www.fbr.gov.pk</span></a>\n																	</td>\n																</tr>\n																<tr>\n																	<td align=\"center\"> \n																		 \n																		<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																		<tr> \n																		<td class=\"img\" width=\"30\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> \n																		<a href=\"https://www.facebook.com/people/Federal-Board-of-Revenue/100064688588666/\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/facebook_ico.png\" width=\"20\" alt=\"\"></a> \n																		</td> \n																				\n																		<td class=\"img\" width=\"30\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> \n																		<a href=\"https://www.youtube.com/channel/UCN_cl3qHp3t3SxdRZ3r2ZeQ?view_as=subscriber\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/youtube_ico.png\" width=\"20\" alt=\"\"></a> \n																		</td>\n																		</tr>\n																		</table>\n																		 \n																	</td> \n																</tr>\n															</table>\n														</td>\n													</tr>\n												</table>											\n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tr>\n														<td class=\"text-12 lh-22 a-center c-grey- l-grey py-20\" style=\"font-size:12px; color:#FFF; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 22px; text-align:center; padding-top: 20px; padding-bottom: 20px;\">\n															<a href=\"https://www.pral.com.pk\" target=\"_blank\" class=\"link c-grey\" style=\"text-decoration:none; color:#6e6e6e;\" rel=\"noopener noreferrer\"><span class=\"link c-grey\" style=\"white-space: nowrap; text-decoration:none; color:#fff;\">© All Rights Reserved.</span></a>  |  <a href=\"https://www.pral.com.pk\" target=\"_blank\" class=\"link c-grey\" style=\"text-decoration:none; color:#6e6e6e;\" rel=\"noopener noreferrer\"><span class=\"link c-grey\" style=\"white-space: nowrap; text-decoration:none; color:#FFF;\">Powered By: <img src=\"https://e.fbr.gov.pk/images/email/PRAL_logo.png\" width=\"18\"></span></a>\n														</td>\n													</tr>\n												</table>											\n										</td>\n									</tr>\n								</table>\n							</td>\n						</tr>\n					</table>\n				</td>\n			</tr>\n		</table>\n	</center>\n\n\n', NULL, '(No Subject)', 'noreply@fbr.gov.pk', 'noreply@fbr.gov.pk', '[\"zubairfbr@dahimail.com\"]', '[]', '[]', '<ED6026E310564F4380D8E7A3FAA4EE7D.MAI@fbrmail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-09-30 12:02:40', '2026-09-30 12:02:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'INBOX', '2026-09-30 12:04:16', '2026-09-30 12:04:16', NULL),
(27, '1f78e95a-3535-44b9-9f3b-0763d2b7f950', 20, 12, 'inbound', 'contact', NULL, 'message', '\n\n\n	<center>\n		<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin: 0; padding: 0; width: 100%; height: 100%;\" bgcolor=\"#f4ecfa\" class=\"gwfw\">\n			<tr>\n				<td style=\"margin: 0; padding: 0; width: 100%; height: 100%;\" align=\"center\" valign=\"top\">\n					<table width=\"600\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"m-shell\">\n						<tr>\n							<td class=\"td\" style=\"width:600px; min-width:600px; font-size:0pt; line-height:0pt; padding:0; margin:0; font-weight:normal;\">\n								<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n									<tr>\n										<td class=\"mpx-10\">\n											\n											\n													\n														\n															\n														\n													\n															\n												 \n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n												<tr>\n													<td class=\"gradient pt-10\" style=\"border-radius: 10px 10px 0 0; padding-top: 10px;\" bgcolor=\"#f3189e\">\n														<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n															<tr>\n																<td style=\"border-radius: 10px 10px 0 0;\" bgcolor=\"#ffffff\">\n																	\n																	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#162330\">\n																		<tr>\n																			<td class=\"img-center p-30 px-15\" style=\"font-size:0pt; line-height:0pt; text-align:left; padding: 30px; padding-left: 15px; padding-right: 15px;\">\n																				<a href=\"https://www.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/fbr_logo.png\" width=\"100\" alt=\"\"></a>\n																			</td>\n																			<td class=\"img-center p-30 px-15\" style=\"font-size:0pt; line-height:0pt; text-align:right; padding: 30px; padding-left: 15px; padding-right: 15px;\">\n																				<a href=\"https://www.iris.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/iris_logo.png\" width=\"120\" alt=\"\"></a>\n																			</td>\n																		</tr>\n																	</table>\n																	\n											\n																	\n																	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																		<tr>\n																			<td class=\"px-50 mpx-15\" style=\"padding-left: 50px; padding-right: 50px;\">\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-50\" style=\"padding-bottom: 30px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"fluid-img img-center pb-30\" style=\"font-size:0pt; line-height:0pt; text-align:left; padding-bottom: 10px; padding-top: 10px\">\n																										<img src=\"https://e.fbr.gov.pk/images/email/mail_icon.png\" width=\"283\" alt=\"\">\n																									</td>\n																								</tr>\n																								\n																									\n																										\n																									\n																								\n																							\n																								<tr>\n																									<td class=\"text-16 lh-26 a-center pb-25\" style=\"font-size:16px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 26px; text-align:left; padding-bottom: 25px;\">\n																										<strong>Dear Sir/Madam,</strong>\n																										<br>\n																										 Verification Code: 773045\nFBR, GoP\n																										\n																									</td>\n																								</tr>\n																								\n																									\n																										\n																											\n																												\n																													\n																												\n																											\n																								\n																									<td align=\"left\">\n																										\n																										<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"max-width: 200px; margin-top: 20px;\">\n																											<tr>\n																												<td class=\"btn-16 c-white l-white\" bgcolor=\"#20a77d\" style=\"font-size:16px; line-height:20px; mso-padding-alt:15px 35px; font-family:\'PT Sans\', Arial, sans-serif; text-align:center; font-weight:bold; text-transform:uppercase; border-radius:25px; min-width:auto !important; color:#ffffff;\">\n																													<a href=\"https://iris.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"display: block; padding: 15px 35px; text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\">\n																														<span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">LOGIN TO IRIS</span>\n																													</a>\n																												</td>\n																											</tr>\n																											\n																										</table>\n																										\n																									</td>\n																								\n																											<tr>\n																									\n																										\n																									\n																								</tr>\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n											\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-50\" style=\"padding-bottom: 50px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"img\" height=\"1\" bgcolor=\"#ebebeb\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> </td>\n																								</tr>\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n											\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-15\" style=\"padding-bottom: 15px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\" min-width:auto !important; text-align:center; padding-bottom: 35px;\">\n																										<img src=\"https://e.fbr.gov.pk/images/email/taxasaan.png?no-proxy\">\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\"font-size:26px; line-height:30px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; text-align:left; padding-bottom: 35px;\">\n																										<strong>Tax Asaan Mobile Application</strong>\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"pb-35\" style=\"padding-bottom: 35px;\">\n																										<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																											<tr>\n																												\n																												<td valign=\"top\">\n																													<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																														<tr>\n																															<td class=\"title-20 pb-5\" style=\"font-size:16px; line-height:24px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; text-align:left; min-width:auto !important; padding-bottom: 5px;\">You may download our mobile application \"Tax Asaan\" for Android and Apple\'s iOS. \n\nThis application provides taxpayers an alternate way to connect with Iris through your mobile and perform following actions:<br><br>\n																																<strong>• New Registration for Income Tax and Sales Tax</strong><br><strong>• Filing of Salaried and Simplified Return</strong><br><strong>• View Assets (FBR Maloomat) </strong><br><strong>• More Services</strong>\n																															</td>\n																														</tr>\n																													\n																													</table>\n																												</td>\n																											</tr>\n																										</table>\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\"font-size:26px; line-height:30px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; text-align:left; padding-bottom: 35px;\">\n																										<a href=\"https://play.google.com/store/apps/details?id=com.pral.fbr_varification_system&amp;hl=en&amp;gl=US\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/googleplay_btn.png\" alt=\"Google Play\" title=\"Download TaxAsaan from Google Play Store\"></a> <a href=\"https://apps.apple.com/pk/app/tax-asaan/id1475081010\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/applestore_btn.png\" alt=\"Play Store\" title=\"Download TaxAsaan from App Store\"></a>\n																									</td>\n																								</tr>\n																								\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n																			</td>\n																		</tr>\n																	</table>\n																	\n																</td>\n															</tr>\n														</table>\n													</td>\n												</tr>\n											</table>\n											\n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tr>\n														<td class=\"p-50 mpx-15\" bgcolor=\"#162330\" style=\"border-radius: 0 0 10px 10px; padding: 50px;\">\n															<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																<tr>\n																	<td align=\"center\" class=\"pb-20\" style=\"padding-bottom: 20px;\">\n																		\n																		<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																			<tr>\n																					<td class=\"img\" width=\"117\" style=\"font-size:0pt; line-height:0pt; text-align:left;\">\n																					<a href=\"https://www.iris.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/iris_logo.png\" width=\"150\" alt=\"\"></a>\n																				</td>\n																				\n																			</tr>\n																		</table>\n																		\n																	</td>\n																</tr>\n																<tr>\n																	<td class=\"text-14 lh-24 a-center c-white l-white pb-20\" style=\"font-size:14px; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 24px; text-align:center; color:#ffffff; padding-bottom: 20px;\">\n																		To know about IRIS 2.0 published release and upcoming features please visit\n																		<br><a href=\"https://help.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#20a77d;\">help.fbr.gov.pk</span></a><br>\n																		<a href=\"tel:+92%2051%20111%20772%20772\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">Helpline: +92 51 111 772 772</span></a>\n																		<br>\n																		<a href=\"mailto:ihelpline@fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">helpline@fbr.gov.pk</span></a> - <a href=\"https://www.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">www.fbr.gov.pk</span></a>\n																	</td>\n																</tr>\n																<tr>\n																	<td align=\"center\"> \n																		 \n																		<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																		<tr> \n																		<td class=\"img\" width=\"30\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> \n																		<a href=\"https://www.facebook.com/people/Federal-Board-of-Revenue/100064688588666/\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/facebook_ico.png\" width=\"20\" alt=\"\"></a> \n																		</td> \n																				\n																		<td class=\"img\" width=\"30\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> \n																		<a href=\"https://www.youtube.com/channel/UCN_cl3qHp3t3SxdRZ3r2ZeQ?view_as=subscriber\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/youtube_ico.png\" width=\"20\" alt=\"\"></a> \n																		</td>\n																		</tr>\n																		</table>\n																		 \n																	</td> \n																</tr>\n															</table>\n														</td>\n													</tr>\n												</table>											\n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tr>\n														<td class=\"text-12 lh-22 a-center c-grey- l-grey py-20\" style=\"font-size:12px; color:#FFF; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 22px; text-align:center; padding-top: 20px; padding-bottom: 20px;\">\n															<a href=\"https://www.pral.com.pk\" target=\"_blank\" class=\"link c-grey\" style=\"text-decoration:none; color:#6e6e6e;\" rel=\"noopener noreferrer\"><span class=\"link c-grey\" style=\"white-space: nowrap; text-decoration:none; color:#fff;\">© All Rights Reserved.</span></a>  |  <a href=\"https://www.pral.com.pk\" target=\"_blank\" class=\"link c-grey\" style=\"text-decoration:none; color:#6e6e6e;\" rel=\"noopener noreferrer\"><span class=\"link c-grey\" style=\"white-space: nowrap; text-decoration:none; color:#FFF;\">Powered By: <img src=\"https://e.fbr.gov.pk/images/email/PRAL_logo.png\" width=\"18\"></span></a>\n														</td>\n													</tr>\n												</table>											\n										</td>\n									</tr>\n								</table>\n							</td>\n						</tr>\n					</table>\n				</td>\n			</tr>\n		</table>\n	</center>\n\n\n', NULL, '(No Subject)', 'noreply@fbr.gov.pk', 'noreply@fbr.gov.pk', '[\"zubairfbr@dahimail.com\"]', '[]', '[]', '<BF70C142592C4AD48BC4A55D513796D9.MAI@fbrmail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-09-30 12:05:38', '2026-09-30 12:05:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'INBOX', '2026-09-30 12:06:16', '2026-09-30 12:06:16', NULL);
INSERT INTO `messages` (`id`, `uuid`, `conversation_id`, `workspace_id`, `direction`, `sender_type`, `sender_id`, `type`, `body_html`, `body_text`, `subject`, `from_email`, `from_name`, `to_emails`, `cc_emails`, `bcc_emails`, `message_id_header`, `in_reply_to`, `references_header`, `ai_confidence`, `ai_model`, `ai_provider`, `ai_tokens_in`, `ai_tokens_out`, `ai_cost`, `ai_response_time_ms`, `ai_sources_used`, `ai_status`, `sentiment`, `detected_language`, `delivery_status`, `delivery_error`, `opens_count`, `clicks_count`, `sent_at`, `delivered_at`, `opened_at`, `clicked_at`, `bounced_at`, `bounce_type`, `scheduled_at`, `schedule_status`, `channel_message_id`, `imap_uid`, `imap_folder`, `created_at`, `updated_at`, `deleted_at`) VALUES
(28, 'd3584264-8e99-4d21-8a32-106735f211f7', 21, 12, 'inbound', 'contact', NULL, 'message', '\n\n\n	<center>\n		<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin: 0; padding: 0; width: 100%; height: 100%;\" bgcolor=\"#f4ecfa\" class=\"gwfw\">\n			<tr>\n				<td style=\"margin: 0; padding: 0; width: 100%; height: 100%;\" align=\"center\" valign=\"top\">\n					<table width=\"600\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"m-shell\">\n						<tr>\n							<td class=\"td\" style=\"width:600px; min-width:600px; font-size:0pt; line-height:0pt; padding:0; margin:0; font-weight:normal;\">\n								<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n									<tr>\n										<td class=\"mpx-10\">\n											\n											\n													\n														\n															\n														\n													\n															\n												 \n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n												<tr>\n													<td class=\"gradient pt-10\" style=\"border-radius: 10px 10px 0 0; padding-top: 10px;\" bgcolor=\"#f3189e\">\n														<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n															<tr>\n																<td style=\"border-radius: 10px 10px 0 0;\" bgcolor=\"#ffffff\">\n																	\n																	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#162330\">\n																		<tr>\n																			<td class=\"img-center p-30 px-15\" style=\"font-size:0pt; line-height:0pt; text-align:left; padding: 30px; padding-left: 15px; padding-right: 15px;\">\n																				<a href=\"https://www.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/fbr_logo.png\" width=\"100\" alt=\"\"></a>\n																			</td>\n																			<td class=\"img-center p-30 px-15\" style=\"font-size:0pt; line-height:0pt; text-align:right; padding: 30px; padding-left: 15px; padding-right: 15px;\">\n																				<a href=\"https://www.iris.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/iris_logo.png\" width=\"120\" alt=\"\"></a>\n																			</td>\n																		</tr>\n																	</table>\n																	\n											\n																	\n																	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																		<tr>\n																			<td class=\"px-50 mpx-15\" style=\"padding-left: 50px; padding-right: 50px;\">\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-50\" style=\"padding-bottom: 30px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"fluid-img img-center pb-30\" style=\"font-size:0pt; line-height:0pt; text-align:left; padding-bottom: 10px; padding-top: 10px\">\n																										<img src=\"https://e.fbr.gov.pk/images/email/mail_icon.png\" width=\"283\" alt=\"\">\n																									</td>\n																								</tr>\n																								\n																									\n																										\n																									\n																								\n																							\n																								<tr>\n																									<td class=\"text-16 lh-26 a-center pb-25\" style=\"font-size:16px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 26px; text-align:left; padding-bottom: 25px;\">\n																										<strong>Dear Sir/Madam,</strong>\n																										<br>\n																										 <p>Dear ZUBAIR BIN SHAMS,</p>\n<p>Inland Revenue Service congratulates you on successful registration with FBR portal. Looking forward to your role in the progress of the country by paying due taxes. For any query please contact your respective tax office.</p>\n<p style=\"text-align: left;\">(IRS)</p>\n<p style=\"text-align: right;\">,ZUBAIR BIN SHAMS محترم</p>\n<p style=\"text-align: right;\">ان لینڈ ریونیو سروس آئی آر ایس آپ کو ایف بی آر میں اندراج پر مبارکباد پیش کرتا ہے اور یہ امید کرتاہے کہ آپ کے واجب الادا ٹیکسز ملک کی ترقی میں معاون ثابت ہوں گے ۔ کسی بھی قسم کی مدد کے لئے اپنے متعلقہ ٹیکس دفتر رجوع فرمائیں</p>\n<p>ان لینڈ ریونیو سروس (آئی آر ایس)</p>\n																										\n																									</td>\n																								</tr>\n																								\n																									\n																										\n																											\n																												\n																													\n																												\n																											\n																								\n																									<td align=\"left\">\n																										\n																										<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"max-width: 200px; margin-top: 20px;\">\n																											<tr>\n																												<td class=\"btn-16 c-white l-white\" bgcolor=\"#20a77d\" style=\"font-size:16px; line-height:20px; mso-padding-alt:15px 35px; font-family:\'PT Sans\', Arial, sans-serif; text-align:center; font-weight:bold; text-transform:uppercase; border-radius:25px; min-width:auto !important; color:#ffffff;\">\n																													<a href=\"https://iris.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"display: block; padding: 15px 35px; text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\">\n																														<span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">LOGIN TO IRIS</span>\n																													</a>\n																												</td>\n																											</tr>\n																											\n																										</table>\n																										\n																									</td>\n																								\n																											<tr>\n																									\n																										\n																									\n																								</tr>\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n											\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-50\" style=\"padding-bottom: 50px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"img\" height=\"1\" bgcolor=\"#ebebeb\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> </td>\n																								</tr>\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n											\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-15\" style=\"padding-bottom: 15px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\" min-width:auto !important; text-align:center; padding-bottom: 35px;\">\n																										<img src=\"https://e.fbr.gov.pk/images/email/taxasaan.png?no-proxy\">\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\"font-size:26px; line-height:30px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; text-align:left; padding-bottom: 35px;\">\n																										<strong>Tax Asaan Mobile Application</strong>\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"pb-35\" style=\"padding-bottom: 35px;\">\n																										<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																											<tr>\n																												\n																												<td valign=\"top\">\n																													<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																														<tr>\n																															<td class=\"title-20 pb-5\" style=\"font-size:16px; line-height:24px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; text-align:left; min-width:auto !important; padding-bottom: 5px;\">You may download our mobile application \"Tax Asaan\" for Android and Apple\'s iOS. \n\nThis application provides taxpayers an alternate way to connect with Iris through your mobile and perform following actions:<br><br>\n																																<strong>• New Registration for Income Tax and Sales Tax</strong><br><strong>• Filing of Salaried and Simplified Return</strong><br><strong>• View Assets (FBR Maloomat) </strong><br><strong>• More Services</strong>\n																															</td>\n																														</tr>\n																													\n																													</table>\n																												</td>\n																											</tr>\n																										</table>\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\"font-size:26px; line-height:30px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; text-align:left; padding-bottom: 35px;\">\n																										<a href=\"https://play.google.com/store/apps/details?id=com.pral.fbr_varification_system&amp;hl=en&amp;gl=US\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/googleplay_btn.png\" alt=\"Google Play\" title=\"Download TaxAsaan from Google Play Store\"></a> <a href=\"https://apps.apple.com/pk/app/tax-asaan/id1475081010\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/applestore_btn.png\" alt=\"Play Store\" title=\"Download TaxAsaan from App Store\"></a>\n																									</td>\n																								</tr>\n																								\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n																			</td>\n																		</tr>\n																	</table>\n																	\n																</td>\n															</tr>\n														</table>\n													</td>\n												</tr>\n											</table>\n											\n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tr>\n														<td class=\"p-50 mpx-15\" bgcolor=\"#162330\" style=\"border-radius: 0 0 10px 10px; padding: 50px;\">\n															<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																<tr>\n																	<td align=\"center\" class=\"pb-20\" style=\"padding-bottom: 20px;\">\n																		\n																		<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																			<tr>\n																					<td class=\"img\" width=\"117\" style=\"font-size:0pt; line-height:0pt; text-align:left;\">\n																					<a href=\"https://www.iris.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/iris_logo.png\" width=\"150\" alt=\"\"></a>\n																				</td>\n																				\n																			</tr>\n																		</table>\n																		\n																	</td>\n																</tr>\n																<tr>\n																	<td class=\"text-14 lh-24 a-center c-white l-white pb-20\" style=\"font-size:14px; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 24px; text-align:center; color:#ffffff; padding-bottom: 20px;\">\n																		To know about IRIS 2.0 published release and upcoming features please visit\n																		<br><a href=\"https://help.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#20a77d;\">help.fbr.gov.pk</span></a><br>\n																		<a href=\"tel:+92%2051%20111%20772%20772\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">Helpline: +92 51 111 772 772</span></a>\n																		<br>\n																		<a href=\"mailto:ihelpline@fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">helpline@fbr.gov.pk</span></a> - <a href=\"https://www.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">www.fbr.gov.pk</span></a>\n																	</td>\n																</tr>\n																<tr>\n																	<td align=\"center\"> \n																		 \n																		<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																		<tr> \n																		<td class=\"img\" width=\"30\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> \n																		<a href=\"https://www.facebook.com/people/Federal-Board-of-Revenue/100064688588666/\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/facebook_ico.png\" width=\"20\" alt=\"\"></a> \n																		</td> \n																				\n																		<td class=\"img\" width=\"30\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> \n																		<a href=\"https://www.youtube.com/channel/UCN_cl3qHp3t3SxdRZ3r2ZeQ?view_as=subscriber\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/youtube_ico.png\" width=\"20\" alt=\"\"></a> \n																		</td>\n																		</tr>\n																		</table>\n																		 \n																	</td> \n																</tr>\n															</table>\n														</td>\n													</tr>\n												</table>											\n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tr>\n														<td class=\"text-12 lh-22 a-center c-grey- l-grey py-20\" style=\"font-size:12px; color:#FFF; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 22px; text-align:center; padding-top: 20px; padding-bottom: 20px;\">\n															<a href=\"https://www.pral.com.pk\" target=\"_blank\" class=\"link c-grey\" style=\"text-decoration:none; color:#6e6e6e;\" rel=\"noopener noreferrer\"><span class=\"link c-grey\" style=\"white-space: nowrap; text-decoration:none; color:#fff;\">© All Rights Reserved.</span></a>  |  <a href=\"https://www.pral.com.pk\" target=\"_blank\" class=\"link c-grey\" style=\"text-decoration:none; color:#6e6e6e;\" rel=\"noopener noreferrer\"><span class=\"link c-grey\" style=\"white-space: nowrap; text-decoration:none; color:#FFF;\">Powered By: <img src=\"https://e.fbr.gov.pk/images/email/PRAL_logo.png\" width=\"18\"></span></a>\n														</td>\n													</tr>\n												</table>											\n										</td>\n									</tr>\n								</table>\n							</td>\n						</tr>\n					</table>\n				</td>\n			</tr>\n		</table>\n	</center>\n\n\n', NULL, '181 (Order to grant / refuse registration on application)', 'noreply@fbr.gov.pk', 'noreply@fbr.gov.pk', '[\"zubairfbr@dahimail.com\"]', '[]', '[]', '<7809789392D64AB7BBD11040492E9897.MAI@mailx.fbrmail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-09-30 12:09:38', '2026-09-30 12:09:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 'INBOX', '2026-09-30 12:18:20', '2026-09-30 12:18:20', NULL),
(29, '9a39d0d9-aec7-47e0-9871-117dacc97a48', 22, 12, 'inbound', 'contact', NULL, 'message', '\n\n\n	<center>\n		<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin: 0; padding: 0; width: 100%; height: 100%;\" bgcolor=\"#f4ecfa\" class=\"gwfw\">\n			<tr>\n				<td style=\"margin: 0; padding: 0; width: 100%; height: 100%;\" align=\"center\" valign=\"top\">\n					<table width=\"600\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"m-shell\">\n						<tr>\n							<td class=\"td\" style=\"width:600px; min-width:600px; font-size:0pt; line-height:0pt; padding:0; margin:0; font-weight:normal;\">\n								<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n									<tr>\n										<td class=\"mpx-10\">\n											\n											\n													\n														\n															\n														\n													\n															\n												 \n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n												<tr>\n													<td class=\"gradient pt-10\" style=\"border-radius: 10px 10px 0 0; padding-top: 10px;\" bgcolor=\"#f3189e\">\n														<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n															<tr>\n																<td style=\"border-radius: 10px 10px 0 0;\" bgcolor=\"#ffffff\">\n																	\n																	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#162330\">\n																		<tr>\n																			<td class=\"img-center p-30 px-15\" style=\"font-size:0pt; line-height:0pt; text-align:left; padding: 30px; padding-left: 15px; padding-right: 15px;\">\n																				<a href=\"https://www.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/fbr_logo.png\" width=\"100\" alt=\"\"></a>\n																			</td>\n																			<td class=\"img-center p-30 px-15\" style=\"font-size:0pt; line-height:0pt; text-align:right; padding: 30px; padding-left: 15px; padding-right: 15px;\">\n																				<a href=\"https://www.iris.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/iris_logo.png\" width=\"120\" alt=\"\"></a>\n																			</td>\n																		</tr>\n																	</table>\n																	\n											\n																	\n																	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																		<tr>\n																			<td class=\"px-50 mpx-15\" style=\"padding-left: 50px; padding-right: 50px;\">\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-50\" style=\"padding-bottom: 30px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"fluid-img img-center pb-30\" style=\"font-size:0pt; line-height:0pt; text-align:left; padding-bottom: 10px; padding-top: 10px\">\n																										<img src=\"https://e.fbr.gov.pk/images/email/mail_icon.png\" width=\"283\" alt=\"\">\n																									</td>\n																								</tr>\n																								\n																									\n																										\n																									\n																								\n																							\n																								<tr>\n																									<td class=\"text-16 lh-26 a-center pb-25\" style=\"font-size:16px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 26px; text-align:left; padding-bottom: 25px;\">\n																										<strong>Dear Sir/Madam,</strong>\n																										<br>\n																										 <p>Dear ZUBAIR BIN SHAMS,</p>\n<p>Inland Revenue Service congratulates you on successful registration with FBR portal. Looking forward to your role in the progress of the country by paying due taxes. For any query please contact your respective tax office.</p>\n<p style=\"text-align: left;\">(IRS)</p>\n<p style=\"text-align: right;\">,ZUBAIR BIN SHAMS محترم</p>\n<p style=\"text-align: right;\">ان لینڈ ریونیو سروس آئی آر ایس آپ کو ایف بی آر میں اندراج پر مبارکباد پیش کرتا ہے اور یہ امید کرتاہے کہ آپ کے واجب الادا ٹیکسز ملک کی ترقی میں معاون ثابت ہوں گے ۔ کسی بھی قسم کی مدد کے لئے اپنے متعلقہ ٹیکس دفتر رجوع فرمائیں</p>\n<p>ان لینڈ ریونیو سروس (آئی آر ایس)</p>\n																										\n																									</td>\n																								</tr>\n																								\n																									\n																										\n																											\n																												\n																													\n																												\n																											\n																								\n																									<td align=\"left\">\n																										\n																										<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"max-width: 200px; margin-top: 20px;\">\n																											<tr>\n																												<td class=\"btn-16 c-white l-white\" bgcolor=\"#20a77d\" style=\"font-size:16px; line-height:20px; mso-padding-alt:15px 35px; font-family:\'PT Sans\', Arial, sans-serif; text-align:center; font-weight:bold; text-transform:uppercase; border-radius:25px; min-width:auto !important; color:#ffffff;\">\n																													<a href=\"https://www.iris.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"display: block; padding: 15px 35px; text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\">\n																														<span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">LOGIN TO IRIS</span>\n																													</a>\n																												</td>\n																											</tr>\n																											\n																										</table>\n																										\n																									</td>\n																								\n																											<tr>\n																									\n																										\n																									\n																								</tr>\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n											\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-50\" style=\"padding-bottom: 50px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"img\" height=\"1\" bgcolor=\"#ebebeb\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> </td>\n																								</tr>\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n											\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-15\" style=\"padding-bottom: 15px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\" min-width:auto !important; text-align:center; padding-bottom: 35px;\">\n																										<img src=\"https://e.fbr.gov.pk/images/email/taxasaan.png?no-proxy\">\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\"font-size:26px; line-height:30px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; text-align:left; padding-bottom: 35px;\">\n																										<strong>Tax Asaan Mobile Application</strong>\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"pb-35\" style=\"padding-bottom: 35px;\">\n																										<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																											<tr>\n																												\n																												<td valign=\"top\">\n																													<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																														<tr>\n																															<td class=\"title-20 pb-5\" style=\"font-size:16px; line-height:24px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; text-align:left; min-width:auto !important; padding-bottom: 5px;\">You may download our mobile application \"Tax Asaan\" for Android and Apple\'s iOS. \n\nThis application provides taxpayers an alternate way to connect with Iris through your mobile and perform following actions:<br><br>\n																																<strong>• New Registration for Income Tax and Sales Tax</strong><br><strong>• Filing of Salaried and Simplified Return</strong><br><strong>• View Assets (FBR Maloomat) </strong><br><strong>• More Services</strong>\n																															</td>\n																														</tr>\n																													\n																													</table>\n																												</td>\n																											</tr>\n																										</table>\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\"font-size:26px; line-height:30px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; text-align:left; padding-bottom: 35px;\">\n																										<a href=\"https://play.google.com/store/apps/details?id=com.pral.fbr_varification_system&amp;hl=en&amp;gl=US\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/googleplay_btn.png\" alt=\"Google Play\" title=\"Download TaxAsaan from Google Play Store\"></a> <a href=\"https://apps.apple.com/pk/app/tax-asaan/id1475081010\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/applestore_btn.png\" alt=\"Play Store\" title=\"Download TaxAsaan from App Store\"></a>\n																									</td>\n																								</tr>\n																								\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n																			</td>\n																		</tr>\n																	</table>\n																	\n																</td>\n															</tr>\n														</table>\n													</td>\n												</tr>\n											</table>\n											\n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tr>\n														<td class=\"p-50 mpx-15\" bgcolor=\"#162330\" style=\"border-radius: 0 0 10px 10px; padding: 50px;\">\n															<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																<tr>\n																	<td align=\"center\" class=\"pb-20\" style=\"padding-bottom: 20px;\">\n																		\n																		<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																			<tr>\n																					<td class=\"img\" width=\"117\" style=\"font-size:0pt; line-height:0pt; text-align:left;\">\n																					<a href=\"https://www.iris.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/iris_logo.png\" width=\"150\" alt=\"\"></a>\n																				</td>\n																				\n																			</tr>\n																		</table>\n																		\n																	</td>\n																</tr>\n																<tr>\n																	<td class=\"text-14 lh-24 a-center c-white l-white pb-20\" style=\"font-size:14px; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 24px; text-align:center; color:#ffffff; padding-bottom: 20px;\">\n																		To know about IRIS 2.0 published release and upcoming features please visit\n																		<br><a href=\"https://help.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#20a77d;\">help.fbr.gov.pk</span></a><br>\n																		<a href=\"tel:+92%2051%20111%20772%20772\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">Helpline: +92 51 111 772 772</span></a>\n																		<br>\n																		<a href=\"mailto:ihelpline@fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">helpline@fbr.gov.pk</span></a> - <a href=\"https://www.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">www.fbr.gov.pk</span></a>\n																	</td>\n																</tr>\n																<tr>\n																	<td align=\"center\"> \n																		 \n																		<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																		<tr> \n																		<td class=\"img\" width=\"30\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> \n																		<a href=\"https://www.facebook.com/people/Federal-Board-of-Revenue/100064688588666/\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/facebook_ico.png\" width=\"20\" alt=\"\"></a> \n																		</td> \n																				\n																		<td class=\"img\" width=\"30\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> \n																		<a href=\"https://www.youtube.com/channel/UCN_cl3qHp3t3SxdRZ3r2ZeQ?view_as=subscriber\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/youtube_ico.png\" width=\"20\" alt=\"\"></a> \n																		</td>\n																		</tr>\n																		</table>\n																		 \n																	</td> \n																</tr>\n															</table>\n														</td>\n													</tr>\n												</table>											\n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tr>\n														<td class=\"text-12 lh-22 a-center c-grey- l-grey py-20\" style=\"font-size:12px; color:#FFF; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 22px; text-align:center; padding-top: 20px; padding-bottom: 20px;\">\n															<a href=\"https://www.pral.com.pk\" target=\"_blank\" class=\"link c-grey\" style=\"text-decoration:none; color:#6e6e6e;\" rel=\"noopener noreferrer\"><span class=\"link c-grey\" style=\"white-space: nowrap; text-decoration:none; color:#fff;\">© All Rights Reserved.</span></a>  |  <a href=\"https://www.pral.com.pk\" target=\"_blank\" class=\"link c-grey\" style=\"text-decoration:none; color:#6e6e6e;\" rel=\"noopener noreferrer\"><span class=\"link c-grey\" style=\"white-space: nowrap; text-decoration:none; color:#FFF;\">Powered By: <img src=\"https://e.fbr.gov.pk/images/email/PRAL_logo.png\" width=\"18\"></span></a>\n														</td>\n													</tr>\n												</table>											\n										</td>\n									</tr>\n								</table>\n							</td>\n						</tr>\n					</table>\n				</td>\n			</tr>\n		</table>\n	</center>\n\n\n', NULL, '181 (Order to grant / refuse registration on application)', 'noreply@fbr.gov.pk', 'noreply@fbr.gov.pk', '[\"zubairfbr@dahimail.com\"]', '[]', '[]', '<638F1D8FB6D543899C7BBD28C3B20657.MAI@mailx.fbrmail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-09-30 12:09:41', '2026-09-30 12:09:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 'INBOX', '2026-09-30 12:18:20', '2026-09-30 12:18:20', NULL),
(30, 'ede83844-8742-4e1f-b43a-1bb9b0a138ba', 23, 13, 'inbound', 'contact', NULL, 'message', '\r\n\r\n\r\n\r\n<table class=\"wrapper\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td class=\"header\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; padding: 25px 0; text-align: center;\">\r\n<a href=\"https://dahimail.com\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 19px; font-weight: bold; text-decoration: none; display: inline-block;\" rel=\"noopener noreferrer\">\r\nDahimail\r\n</a>\r\n</td>\r\n</tr>\r\n\r\n\r\n<tr>\r\n<td class=\"body\" width=\"100%\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; border-bottom: 1px solid #fafafa; border-top: 1px solid #fafafa; margin: 0; padding: 0; width: 100%; border: hidden !important;\">\r\n<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; background-color: #ffffff; border-color: #e4e4e7; border-radius: 4px; border-width: 1px; box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px -1px rgba(0, 0, 0, 0.1); margin: 0 auto; padding: 0; width: 570px;\">\r\n\r\n<tr>\r\n<td class=\"content-cell\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<h1 style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 18px; font-weight: bold; margin-top: 0; text-align: start;\">Hi MUHAMMAD,</h1>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Welcome aboard! Your account is ready and we\'re excited to help you automate your communications.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Here\'s how to get started in under 5 minutes:</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">1. Connect your email</strong> — Link Gmail or Outlook with one click.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">2. Train your AI</strong> — Upload a document or FAQ so replies match your voice.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">3. Set up auto-reply</strong> — Choose when and how AI responds for you.</p>\r\n<table class=\"action\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 30px auto; padding: 0; text-align: center; width: 100%; float: unset;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<a href=\"https://dahimail.com/onboarding/step/1\" class=\"button button-primary\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -webkit-text-size-adjust: none; border-radius: 4px; color: #fff; display: inline-block; overflow: hidden; text-decoration: none; background-color: #18181b; border-bottom: 8px solid #18181b; border-left: 18px solid #18181b; border-right: 18px solid #18181b; border-top: 8px solid #18181b; word-break: break-all;\">Start Setup</a>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Questions? Just reply to this email — a real person reads every message.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">— The Dahimail Team</p>\r\n\r\n\r\n<table class=\"subcopy\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; border-top: 1px solid #e4e4e7; margin-top: 25px; padding-top: 25px;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; text-align: left; font-size: 14px;\">If you\'re having trouble clicking the \"Start Setup\" button, copy and paste the URL below\r\ninto your web browser: <span class=\"break-all\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; word-break: break-all;\"><a href=\"https://dahimail.com/onboarding/step/1\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; word-break: break-all;\" rel=\"noopener noreferrer\">https://dahimail.com/onboarding/step/1</a></span></p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"footer\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; margin: 0 auto; padding: 0; text-align: center; width: 570px;\">\r\n<tr>\r\n<td class=\"content-cell\" align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; color: #a1a1aa; font-size: 12px; text-align: center;\">© 2026 Dahimail. All rights reserved.</p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n\r\n', 'Dahimail: https://dahimail.com\r\n\r\n# Hi MUHAMMAD,\r\n\r\nWelcome aboard! Your account is ready and we\'re excited to help you automate your communications.\r\n\r\nHere\'s how to get started in under 5 minutes:\r\n\r\n**1. Connect your email** — Link Gmail or Outlook with one click.\r\n\r\n**2. Train your AI** — Upload a document or FAQ so replies match your voice.\r\n\r\n**3. Set up auto-reply** — Choose when and how AI responds for you.\r\n\r\nStart Setup: https://dahimail.com/onboarding/step/1\r\n\r\nQuestions? Just reply to this email — a real person reads every message.\r\n\r\n— The Dahimail Team\r\n\r\nIf you\'re having trouble clicking the \"Start Setup\" button, copy and paste the URL below\r\ninto your web browser: [https://dahimail.com/onboarding/step/1](https://dahimail.com/onboarding/step/1)\r\n\r\n© 2026 Dahimail. All rights reserved.\r\n', 'Welcome to Dahimail!', 'noreply@dahimail.com', 'Dahimail', '[\"nawazfbr@dahimail.com\"]', '[]', '[]', '<91d4dfdca4704d27f51603a830c9f938@dahimail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-10-01 04:40:06', '2026-10-01 04:40:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'INBOX', '2026-10-01 04:41:46', '2026-10-01 04:41:47', NULL);
INSERT INTO `messages` (`id`, `uuid`, `conversation_id`, `workspace_id`, `direction`, `sender_type`, `sender_id`, `type`, `body_html`, `body_text`, `subject`, `from_email`, `from_name`, `to_emails`, `cc_emails`, `bcc_emails`, `message_id_header`, `in_reply_to`, `references_header`, `ai_confidence`, `ai_model`, `ai_provider`, `ai_tokens_in`, `ai_tokens_out`, `ai_cost`, `ai_response_time_ms`, `ai_sources_used`, `ai_status`, `sentiment`, `detected_language`, `delivery_status`, `delivery_error`, `opens_count`, `clicks_count`, `sent_at`, `delivered_at`, `opened_at`, `clicked_at`, `bounced_at`, `bounce_type`, `scheduled_at`, `schedule_status`, `channel_message_id`, `imap_uid`, `imap_folder`, `created_at`, `updated_at`, `deleted_at`) VALUES
(31, '270d01c6-9fbe-4a1d-8032-119dfbe2c73a', 24, 13, 'inbound', 'contact', NULL, 'message', '\r\n\r\n\r\n\r\n<table class=\"wrapper\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td class=\"header\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; padding: 25px 0; text-align: center;\">\r\n<a href=\"https://dahimail.com\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 19px; font-weight: bold; text-decoration: none; display: inline-block;\" rel=\"noopener noreferrer\">\r\nDahimail\r\n</a>\r\n</td>\r\n</tr>\r\n\r\n\r\n<tr>\r\n<td class=\"body\" width=\"100%\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; border-bottom: 1px solid #fafafa; border-top: 1px solid #fafafa; margin: 0; padding: 0; width: 100%; border: hidden !important;\">\r\n<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; background-color: #ffffff; border-color: #e4e4e7; border-radius: 4px; border-width: 1px; box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px -1px rgba(0, 0, 0, 0.1); margin: 0 auto; padding: 0; width: 570px;\">\r\n\r\n<tr>\r\n<td class=\"content-cell\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<h1 style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 18px; font-weight: bold; margin-top: 0; text-align: start;\">Hello!</h1>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Please click the button below to verify your email address.</p>\r\n<table class=\"action\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 30px auto; padding: 0; text-align: center; width: 100%; float: unset;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<a href=\"https://dahimail.com/email/verify/13/bcd535f7649f0a6d98db079c26c5c3a0153679cf?expires=1790840406&amp;signature=312bdfa370e8a995070c45dc38fff7c7df442cfe4ccd581cf6bcc4df1cc06cb9\" class=\"button button-primary\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -webkit-text-size-adjust: none; border-radius: 4px; color: #fff; display: inline-block; overflow: hidden; text-decoration: none; background-color: #18181b; border-bottom: 8px solid #18181b; border-left: 18px solid #18181b; border-right: 18px solid #18181b; border-top: 8px solid #18181b; word-break: break-all;\">Verify Email Address</a>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">If you did not create an account, no further action is required.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Regards,<br>\r\nDahimail</p>\r\n\r\n\r\n<table class=\"subcopy\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; border-top: 1px solid #e4e4e7; margin-top: 25px; padding-top: 25px;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; text-align: left; font-size: 14px;\">If you\'re having trouble clicking the \"Verify Email Address\" button, copy and paste the URL below\r\ninto your web browser: <span class=\"break-all\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; word-break: break-all;\"><a href=\"https://dahimail.com/email/verify/13/bcd535f7649f0a6d98db079c26c5c3a0153679cf?expires=1790840406&amp;signature=312bdfa370e8a995070c45dc38fff7c7df442cfe4ccd581cf6bcc4df1cc06cb9\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; word-break: break-all;\" rel=\"noopener noreferrer\">https://dahimail.com/email/verify/13/bcd535f7649f0a6d98db079c26c5c3a0153679cf?expires=1790840406&amp;signature=312bdfa370e8a995070c45dc38fff7c7df442cfe4ccd581cf6bcc4df1cc06cb9</a></span></p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"footer\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; margin: 0 auto; padding: 0; text-align: center; width: 570px;\">\r\n<tr>\r\n<td class=\"content-cell\" align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; color: #a1a1aa; font-size: 12px; text-align: center;\">© 2026 Dahimail. All rights reserved.</p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n\r\n', 'Dahimail: https://dahimail.com\r\n\r\n# Hello!\r\n\r\nPlease click the button below to verify your email address.\r\n\r\nVerify Email Address: https://dahimail.com/email/verify/13/bcd535f7649f0a6d98db079c26c5c3a0153679cf?expires=1790840406&signature=312bdfa370e8a995070c45dc38fff7c7df442cfe4ccd581cf6bcc4df1cc06cb9\r\n\r\nIf you did not create an account, no further action is required.\r\n\r\nRegards,\r\nDahimail\r\n\r\nIf you\'re having trouble clicking the \"Verify Email Address\" button, copy and paste the URL below\r\ninto your web browser: [https://dahimail.com/email/verify/13/bcd535f7649f0a6d98db079c26c5c3a0153679cf?expires=1790840406&signature=312bdfa370e8a995070c45dc38fff7c7df442cfe4ccd581cf6bcc4df1cc06cb9](https://dahimail.com/email/verify/13/bcd535f7649f0a6d98db079c26c5c3a0153679cf?expires=1790840406&signature=312bdfa370e8a995070c45dc38fff7c7df442cfe4ccd581cf6bcc4df1cc06cb9)\r\n\r\n© 2026 Dahimail. All rights reserved.\r\n', 'Verify Email Address', 'noreply@dahimail.com', 'Dahimail', '[\"nawazfbr@dahimail.com\"]', '[]', '[]', '<f6927095c36a134a10082b419e659972@dahimail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-10-01 04:40:06', '2026-10-01 04:40:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'INBOX', '2026-10-01 04:41:47', '2026-10-01 04:41:47', NULL),
(32, 'af9768e6-75b4-49eb-be61-3d6362df330b', 25, 13, 'inbound', 'contact', NULL, 'message', '\n\n\n	<center>\n		<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin: 0; padding: 0; width: 100%; height: 100%;\" bgcolor=\"#f4ecfa\" class=\"gwfw\">\n			<tr>\n				<td style=\"margin: 0; padding: 0; width: 100%; height: 100%;\" align=\"center\" valign=\"top\">\n					<table width=\"600\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"m-shell\">\n						<tr>\n							<td class=\"td\" style=\"width:600px; min-width:600px; font-size:0pt; line-height:0pt; padding:0; margin:0; font-weight:normal;\">\n								<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n									<tr>\n										<td class=\"mpx-10\">\n											\n											\n													\n														\n															\n														\n													\n															\n												 \n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n												<tr>\n													<td class=\"gradient pt-10\" style=\"border-radius: 10px 10px 0 0; padding-top: 10px;\" bgcolor=\"#f3189e\">\n														<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n															<tr>\n																<td style=\"border-radius: 10px 10px 0 0;\" bgcolor=\"#ffffff\">\n																	\n																	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#162330\">\n																		<tr>\n																			<td class=\"img-center p-30 px-15\" style=\"font-size:0pt; line-height:0pt; text-align:left; padding: 30px; padding-left: 15px; padding-right: 15px;\">\n																				<a href=\"https://www.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/fbr_logo.png\" width=\"100\" alt=\"\"></a>\n																			</td>\n																			<td class=\"img-center p-30 px-15\" style=\"font-size:0pt; line-height:0pt; text-align:right; padding: 30px; padding-left: 15px; padding-right: 15px;\">\n																				<a href=\"https://www.iris.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/iris_logo.png\" width=\"120\" alt=\"\"></a>\n																			</td>\n																		</tr>\n																	</table>\n																	\n											\n																	\n																	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																		<tr>\n																			<td class=\"px-50 mpx-15\" style=\"padding-left: 50px; padding-right: 50px;\">\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-50\" style=\"padding-bottom: 30px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"fluid-img img-center pb-30\" style=\"font-size:0pt; line-height:0pt; text-align:left; padding-bottom: 10px; padding-top: 10px\">\n																										<img src=\"https://e.fbr.gov.pk/images/email/mail_icon.png\" width=\"283\" alt=\"\">\n																									</td>\n																								</tr>\n																								\n																									\n																										\n																									\n																								\n																							\n																								<tr>\n																									<td class=\"text-16 lh-26 a-center pb-25\" style=\"font-size:16px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 26px; text-align:left; padding-bottom: 25px;\">\n																										<strong>Dear Sir/Madam,</strong>\n																										<br>\n																										 Verification Code: 758180\nFBR, GoP\n																										\n																									</td>\n																								</tr>\n																								\n																									\n																										\n																											\n																												\n																													\n																												\n																											\n																								\n																									<td align=\"left\">\n																										\n																										<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"max-width: 200px; margin-top: 20px;\">\n																											<tr>\n																												<td class=\"btn-16 c-white l-white\" bgcolor=\"#20a77d\" style=\"font-size:16px; line-height:20px; mso-padding-alt:15px 35px; font-family:\'PT Sans\', Arial, sans-serif; text-align:center; font-weight:bold; text-transform:uppercase; border-radius:25px; min-width:auto !important; color:#ffffff;\">\n																													<a href=\"https://iris.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"display: block; padding: 15px 35px; text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\">\n																														<span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">LOGIN TO IRIS</span>\n																													</a>\n																												</td>\n																											</tr>\n																											\n																										</table>\n																										\n																									</td>\n																								\n																											<tr>\n																									\n																										\n																									\n																								</tr>\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n											\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-50\" style=\"padding-bottom: 50px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"img\" height=\"1\" bgcolor=\"#ebebeb\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> </td>\n																								</tr>\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n											\n																				\n																				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																					<tr>\n																						<td class=\"pb-15\" style=\"padding-bottom: 15px;\">\n																							<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\" min-width:auto !important; text-align:center; padding-bottom: 35px;\">\n																										<img src=\"https://e.fbr.gov.pk/images/email/taxasaan.png?no-proxy\">\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\"font-size:26px; line-height:30px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; text-align:left; padding-bottom: 35px;\">\n																										<strong>Tax Asaan Mobile Application</strong>\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"pb-35\" style=\"padding-bottom: 35px;\">\n																										<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																											<tr>\n																												\n																												<td valign=\"top\">\n																													<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																														<tr>\n																															<td class=\"title-20 pb-5\" style=\"font-size:16px; line-height:24px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; text-align:left; min-width:auto !important; padding-bottom: 5px;\">You may download our mobile application \"Tax Asaan\" for Android and Apple\'s iOS. \n\nThis application provides taxpayers an alternate way to connect with Iris through your mobile and perform following actions:<br><br>\n																																<strong>• New Registration for Income Tax and Sales Tax</strong><br><strong>• Filing of Salaried and Simplified Return</strong><br><strong>• View Assets (FBR Maloomat) </strong><br><strong>• More Services</strong>\n																															</td>\n																														</tr>\n																													\n																													</table>\n																												</td>\n																											</tr>\n																										</table>\n																									</td>\n																								</tr>\n																								<tr>\n																									<td class=\"title-26 a-center pb-35\" style=\"font-size:26px; line-height:30px; color:#282828; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; text-align:left; padding-bottom: 35px;\">\n																										<a href=\"https://play.google.com/store/apps/details?id=com.pral.fbr_varification_system&amp;hl=en&amp;gl=US\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/googleplay_btn.png\" alt=\"Google Play\" title=\"Download TaxAsaan from Google Play Store\"></a> <a href=\"https://apps.apple.com/pk/app/tax-asaan/id1475081010\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/applestore_btn.png\" alt=\"Play Store\" title=\"Download TaxAsaan from App Store\"></a>\n																									</td>\n																								</tr>\n																								\n																							</table>\n																						</td>\n																					</tr>\n																				</table>\n																				\n																			</td>\n																		</tr>\n																	</table>\n																	\n																</td>\n															</tr>\n														</table>\n													</td>\n												</tr>\n											</table>\n											\n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tr>\n														<td class=\"p-50 mpx-15\" bgcolor=\"#162330\" style=\"border-radius: 0 0 10px 10px; padding: 50px;\">\n															<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																<tr>\n																	<td align=\"center\" class=\"pb-20\" style=\"padding-bottom: 20px;\">\n																		\n																		<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																			<tr>\n																					<td class=\"img\" width=\"117\" style=\"font-size:0pt; line-height:0pt; text-align:left;\">\n																					<a href=\"https://www.iris.fbr.gov.pk\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/iris_logo.png\" width=\"150\" alt=\"\"></a>\n																				</td>\n																				\n																			</tr>\n																		</table>\n																		\n																	</td>\n																</tr>\n																<tr>\n																	<td class=\"text-14 lh-24 a-center c-white l-white pb-20\" style=\"font-size:14px; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 24px; text-align:center; color:#ffffff; padding-bottom: 20px;\">\n																		To know about IRIS 2.0 published release and upcoming features please visit\n																		<br><a href=\"https://help.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#20a77d;\">help.fbr.gov.pk</span></a><br>\n																		<a href=\"tel:+92%2051%20111%20772%20772\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">Helpline: +92 51 111 772 772</span></a>\n																		<br>\n																		<a href=\"mailto:ihelpline@fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">helpline@fbr.gov.pk</span></a> - <a href=\"https://www.fbr.gov.pk\" target=\"_blank\" class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\" rel=\"noopener noreferrer\"><span class=\"link c-white\" style=\"text-decoration:none; color:#ffffff;\">www.fbr.gov.pk</span></a>\n																	</td>\n																</tr>\n																<tr>\n																	<td align=\"center\"> \n																		 \n																		<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n																		<tr> \n																		<td class=\"img\" width=\"30\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> \n																		<a href=\"https://www.facebook.com/people/Federal-Board-of-Revenue/100064688588666/\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/facebook_ico.png\" width=\"20\" alt=\"\"></a> \n																		</td> \n																				\n																		<td class=\"img\" width=\"30\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"> \n																		<a href=\"https://www.youtube.com/channel/UCN_cl3qHp3t3SxdRZ3r2ZeQ?view_as=subscriber\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://e.fbr.gov.pk/images/email/youtube_ico.png\" width=\"20\" alt=\"\"></a> \n																		</td>\n																		</tr>\n																		</table>\n																		 \n																	</td> \n																</tr>\n															</table>\n														</td>\n													</tr>\n												</table>											\n											\n											\n											<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tr>\n														<td class=\"text-12 lh-22 a-center c-grey- l-grey py-20\" style=\"font-size:12px; color:#FFF; font-family:\'PT Sans\', Arial, sans-serif; min-width:auto !important; line-height: 22px; text-align:center; padding-top: 20px; padding-bottom: 20px;\">\n															<a href=\"https://www.pral.com.pk\" target=\"_blank\" class=\"link c-grey\" style=\"text-decoration:none; color:#6e6e6e;\" rel=\"noopener noreferrer\"><span class=\"link c-grey\" style=\"white-space: nowrap; text-decoration:none; color:#fff;\">© All Rights Reserved.</span></a>  |  <a href=\"https://www.pral.com.pk\" target=\"_blank\" class=\"link c-grey\" style=\"text-decoration:none; color:#6e6e6e;\" rel=\"noopener noreferrer\"><span class=\"link c-grey\" style=\"white-space: nowrap; text-decoration:none; color:#FFF;\">Powered By: <img src=\"https://e.fbr.gov.pk/images/email/PRAL_logo.png\" width=\"18\"></span></a>\n														</td>\n													</tr>\n												</table>											\n										</td>\n									</tr>\n								</table>\n							</td>\n						</tr>\n					</table>\n				</td>\n			</tr>\n		</table>\n	</center>\n\n\n', NULL, '(No Subject)', 'noreply@fbr.gov.pk', 'noreply@fbr.gov.pk', '[\"nawazfbr@dahimail.com\"]', '[]', '[]', '<A6BF414F5E3C4376906A65CA13E9E717.MAI@fbrmail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-10-01 04:41:39', '2026-10-01 04:41:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'INBOX', '2026-10-01 04:41:58', '2026-10-01 04:41:58', NULL),
(33, 'd4860203-d0ba-4cdc-b144-f520f734c29c', 26, 4, 'outbound', 'agent', 3, 'message', '<p>dfgfg</p>', 'dfgfg', 'eududud', 'uape@dahimail.com', 'nb', '[\"umairkheshgi@gmail.com\"]', NULL, NULL, '<4618ebfe-0a7f-4548-823e-c6c1a537a8d6@dahimail.com>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sent', NULL, 1, 0, '2026-10-01 13:57:32', NULL, '2026-10-01 13:57:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-10-01 13:57:31', '2026-10-01 13:57:34', NULL),
(34, '0e674bc5-4c4e-4576-9c8b-10528ab5bee9', 27, 14, 'inbound', 'contact', NULL, 'message', '\r\n\r\n\r\n\r\n<table class=\"wrapper\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td class=\"header\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; padding: 25px 0; text-align: center;\">\r\n<a href=\"https://dahimail.com\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 19px; font-weight: bold; text-decoration: none; display: inline-block;\" rel=\"noopener noreferrer\">\r\nDahimail\r\n</a>\r\n</td>\r\n</tr>\r\n\r\n\r\n<tr>\r\n<td class=\"body\" width=\"100%\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; border-bottom: 1px solid #fafafa; border-top: 1px solid #fafafa; margin: 0; padding: 0; width: 100%; border: hidden !important;\">\r\n<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; background-color: #ffffff; border-color: #e4e4e7; border-radius: 4px; border-width: 1px; box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px -1px rgba(0, 0, 0, 0.1); margin: 0 auto; padding: 0; width: 570px;\">\r\n\r\n<tr>\r\n<td class=\"content-cell\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<h1 style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 18px; font-weight: bold; margin-top: 0; text-align: start;\">Hi Umair,</h1>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Welcome aboard! Your account is ready and we\'re excited to help you automate your communications.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Here\'s how to get started in under 5 minutes:</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">1. Connect your email</strong> — Link Gmail or Outlook with one click.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">2. Train your AI</strong> — Upload a document or FAQ so replies match your voice.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">3. Set up auto-reply</strong> — Choose when and how AI responds for you.</p>\r\n<table class=\"action\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 30px auto; padding: 0; text-align: center; width: 100%; float: unset;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<a href=\"https://dahimail.com/onboarding/step/1\" class=\"button button-primary\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -webkit-text-size-adjust: none; border-radius: 4px; color: #fff; display: inline-block; overflow: hidden; text-decoration: none; background-color: #18181b; border-bottom: 8px solid #18181b; border-left: 18px solid #18181b; border-right: 18px solid #18181b; border-top: 8px solid #18181b; word-break: break-all;\">Start Setup</a>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Questions? Just reply to this email — a real person reads every message.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">— The Dahimail Team</p>\r\n\r\n\r\n<table class=\"subcopy\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; border-top: 1px solid #e4e4e7; margin-top: 25px; padding-top: 25px;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; text-align: left; font-size: 14px;\">If you\'re having trouble clicking the \"Start Setup\" button, copy and paste the URL below\r\ninto your web browser: <span class=\"break-all\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; word-break: break-all;\"><a href=\"https://dahimail.com/onboarding/step/1\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; word-break: break-all;\" rel=\"noopener noreferrer\">https://dahimail.com/onboarding/step/1</a></span></p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"footer\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; margin: 0 auto; padding: 0; text-align: center; width: 570px;\">\r\n<tr>\r\n<td class=\"content-cell\" align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; color: #a1a1aa; font-size: 12px; text-align: center;\">© 2026 Dahimail. All rights reserved.</p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n\r\n', 'Dahimail: https://dahimail.com\r\n\r\n# Hi Umair,\r\n\r\nWelcome aboard! Your account is ready and we\'re excited to help you automate your communications.\r\n\r\nHere\'s how to get started in under 5 minutes:\r\n\r\n**1. Connect your email** — Link Gmail or Outlook with one click.\r\n\r\n**2. Train your AI** — Upload a document or FAQ so replies match your voice.\r\n\r\n**3. Set up auto-reply** — Choose when and how AI responds for you.\r\n\r\nStart Setup: https://dahimail.com/onboarding/step/1\r\n\r\nQuestions? Just reply to this email — a real person reads every message.\r\n\r\n— The Dahimail Team\r\n\r\nIf you\'re having trouble clicking the \"Start Setup\" button, copy and paste the URL below\r\ninto your web browser: [https://dahimail.com/onboarding/step/1](https://dahimail.com/onboarding/step/1)\r\n\r\n© 2026 Dahimail. All rights reserved.\r\n', 'Welcome to Dahimail!', 'noreply@dahimail.com', 'Dahimail', '[\"umairali@dahimail.com\"]', '[]', '[]', '<a6873fc9df7da88294fb72be25ceff1f@dahimail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-10-02 12:05:25', '2026-10-02 12:05:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'INBOX', '2026-10-02 12:05:29', '2026-10-02 12:05:29', NULL);
INSERT INTO `messages` (`id`, `uuid`, `conversation_id`, `workspace_id`, `direction`, `sender_type`, `sender_id`, `type`, `body_html`, `body_text`, `subject`, `from_email`, `from_name`, `to_emails`, `cc_emails`, `bcc_emails`, `message_id_header`, `in_reply_to`, `references_header`, `ai_confidence`, `ai_model`, `ai_provider`, `ai_tokens_in`, `ai_tokens_out`, `ai_cost`, `ai_response_time_ms`, `ai_sources_used`, `ai_status`, `sentiment`, `detected_language`, `delivery_status`, `delivery_error`, `opens_count`, `clicks_count`, `sent_at`, `delivered_at`, `opened_at`, `clicked_at`, `bounced_at`, `bounce_type`, `scheduled_at`, `schedule_status`, `channel_message_id`, `imap_uid`, `imap_folder`, `created_at`, `updated_at`, `deleted_at`) VALUES
(35, '4f006ba1-5da4-46cf-8df0-16de33cd752e', 28, 15, 'inbound', 'contact', NULL, 'message', '\r\n\r\n\r\n\r\n<table class=\"wrapper\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td class=\"header\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; padding: 25px 0; text-align: center;\">\r\n<a href=\"https://dahimail.com\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 19px; font-weight: bold; text-decoration: none; display: inline-block;\" rel=\"noopener noreferrer\">\r\nDahimail\r\n</a>\r\n</td>\r\n</tr>\r\n\r\n\r\n<tr>\r\n<td class=\"body\" width=\"100%\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; border-bottom: 1px solid #fafafa; border-top: 1px solid #fafafa; margin: 0; padding: 0; width: 100%; border: hidden !important;\">\r\n<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; background-color: #ffffff; border-color: #e4e4e7; border-radius: 4px; border-width: 1px; box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px -1px rgba(0, 0, 0, 0.1); margin: 0 auto; padding: 0; width: 570px;\">\r\n\r\n<tr>\r\n<td class=\"content-cell\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<h1 style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 18px; font-weight: bold; margin-top: 0; text-align: start;\">Hi Sardar,</h1>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Welcome aboard! Your account is ready and we\'re excited to help you automate your communications.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Here\'s how to get started in under 5 minutes:</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">1. Connect your email</strong> — Link Gmail or Outlook with one click.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">2. Train your AI</strong> — Upload a document or FAQ so replies match your voice.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">3. Set up auto-reply</strong> — Choose when and how AI responds for you.</p>\r\n<table class=\"action\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 30px auto; padding: 0; text-align: center; width: 100%; float: unset;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<a href=\"https://dahimail.com/onboarding/step/1\" class=\"button button-primary\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -webkit-text-size-adjust: none; border-radius: 4px; color: #fff; display: inline-block; overflow: hidden; text-decoration: none; background-color: #18181b; border-bottom: 8px solid #18181b; border-left: 18px solid #18181b; border-right: 18px solid #18181b; border-top: 8px solid #18181b; word-break: break-all;\">Start Setup</a>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Questions? Just reply to this email — a real person reads every message.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">— The Dahimail Team</p>\r\n\r\n\r\n<table class=\"subcopy\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; border-top: 1px solid #e4e4e7; margin-top: 25px; padding-top: 25px;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; text-align: left; font-size: 14px;\">If you\'re having trouble clicking the \"Start Setup\" button, copy and paste the URL below\r\ninto your web browser: <span class=\"break-all\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; word-break: break-all;\"><a href=\"https://dahimail.com/onboarding/step/1\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; word-break: break-all;\" rel=\"noopener noreferrer\">https://dahimail.com/onboarding/step/1</a></span></p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"footer\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; margin: 0 auto; padding: 0; text-align: center; width: 570px;\">\r\n<tr>\r\n<td class=\"content-cell\" align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; color: #a1a1aa; font-size: 12px; text-align: center;\">© 2026 Dahimail. All rights reserved.</p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n\r\n', 'Dahimail: https://dahimail.com\r\n\r\n# Hi Sardar,\r\n\r\nWelcome aboard! Your account is ready and we\'re excited to help you automate your communications.\r\n\r\nHere\'s how to get started in under 5 minutes:\r\n\r\n**1. Connect your email** — Link Gmail or Outlook with one click.\r\n\r\n**2. Train your AI** — Upload a document or FAQ so replies match your voice.\r\n\r\n**3. Set up auto-reply** — Choose when and how AI responds for you.\r\n\r\nStart Setup: https://dahimail.com/onboarding/step/1\r\n\r\nQuestions? Just reply to this email — a real person reads every message.\r\n\r\n— The Dahimail Team\r\n\r\nIf you\'re having trouble clicking the \"Start Setup\" button, copy and paste the URL below\r\ninto your web browser: [https://dahimail.com/onboarding/step/1](https://dahimail.com/onboarding/step/1)\r\n\r\n© 2026 Dahimail. All rights reserved.\r\n', 'Welcome to Dahimail!', 'noreply@dahimail.com', 'Dahimail', '[\"zulfiqar@dahimail.com\"]', '[]', '[]', '<eae66584891bd32645d0e3f7a2d10d4f@dahimail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-10-02 12:25:52', '2026-10-02 12:25:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'INBOX', '2026-10-02 12:27:31', '2026-10-02 12:27:31', NULL),
(36, 'f058e76c-1a24-42d3-bdcc-582489d68420', 29, 14, 'outbound', 'agent', 14, 'message', '<p>hello</p>', 'hello', 'mail', 'umairali@dahimail.com', 'Umair Ali', '[\"zulfiqar@dahimail.com\"]', NULL, NULL, '<5d4d2da7-d2be-490b-9404-89a4fd714368@dahimail.com>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sent', NULL, 1, 0, '2026-10-02 12:38:13', NULL, '2026-10-02 12:38:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-10-02 12:38:13', '2026-10-02 12:38:35', NULL),
(37, 'e7532822-8b6b-4ca2-b791-ac1b1383cd9c', 30, 15, 'inbound', 'contact', NULL, 'message', '<p>hello</p><img src=\"https://dahimail.com/api/track/open/f058e76c-1a24-42d3-bdcc-582489d68420\" width=\"1\" height=\"1\" style=\"display:none;\" alt=\"\">', 'hello', 'mail', 'umairali@dahimail.com', 'Umair Ali', '[\"zulfiqar@dahimail.com\"]', '[]', '[]', '<2238594097b5c5aa4b5a9038f9ee864d@dahimail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-10-02 12:38:13', '2026-10-02 12:38:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'INBOX', '2026-10-02 12:38:16', '2026-10-02 12:38:16', NULL),
(38, 'ba5b462b-4f47-4cf2-a28a-19a1aa9b2b14', 30, 15, 'outbound', 'agent', 15, 'message', '<p>hom hagha dua da stha da para</p>', 'hom hagha dua da stha da para', 'Re: mail', 'zulfiqar@dahimail.com', 'Sardar Zulfiqar Ali Shah', '[\"umairali@dahimail.com\"]', NULL, NULL, NULL, '<2238594097b5c5aa4b5a9038f9ee864d@dahimail.com>', '[\"<2238594097b5c5aa4b5a9038f9ee864d@dahimail.com>\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sent', NULL, 1, 0, '2026-10-02 12:38:55', NULL, '2026-10-02 12:39:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-10-02 12:38:55', '2026-10-02 12:39:10', NULL),
(39, 'aa159a90-837b-48f3-a98d-6d6ac335d4d8', 29, 14, 'inbound', 'contact', NULL, 'message', '<p>hom hagha dua da stha da para</p><img src=\"https://dahimail.com/api/track/open/ba5b462b-4f47-4cf2-a28a-19a1aa9b2b14\" width=\"1\" height=\"1\" style=\"display:none;\" alt=\"\">', 'hom hagha dua da stha da para', 'Re: mail', 'zulfiqar@dahimail.com', 'Sardar Zulfiqar Ali Shah', '[\"umairali@dahimail.com\"]', '[]', '[]', '<d0ae94a2a837c0cb3259da2107c59698@dahimail.com>', '<2238594097b5c5aa4b5a9038f9ee864d@dahimail.com>', '[\"<2238594097b5c5aa4b5a9038f9ee864d@dahimail.com>\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-10-02 12:38:55', '2026-10-02 12:38:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'INBOX', '2026-10-02 12:39:03', '2026-10-02 12:39:03', NULL),
(40, '795f1fc9-b986-4564-833e-400daba128bc', 31, 16, 'inbound', 'contact', NULL, 'message', '\r\n\r\n\r\n\r\n<table class=\"wrapper\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td class=\"header\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; padding: 25px 0; text-align: center;\">\r\n<a href=\"https://dahimail.com\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 19px; font-weight: bold; text-decoration: none; display: inline-block;\" rel=\"noopener noreferrer\">\r\nDahimail\r\n</a>\r\n</td>\r\n</tr>\r\n\r\n\r\n<tr>\r\n<td class=\"body\" width=\"100%\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; border-bottom: 1px solid #fafafa; border-top: 1px solid #fafafa; margin: 0; padding: 0; width: 100%; border: hidden !important;\">\r\n<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; background-color: #ffffff; border-color: #e4e4e7; border-radius: 4px; border-width: 1px; box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px -1px rgba(0, 0, 0, 0.1); margin: 0 auto; padding: 0; width: 570px;\">\r\n\r\n<tr>\r\n<td class=\"content-cell\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<h1 style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 18px; font-weight: bold; margin-top: 0; text-align: start;\">Hi Zulfiqar,</h1>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Welcome aboard! Your account is ready and we\'re excited to help you automate your communications.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Here\'s how to get started in under 5 minutes:</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">1. Connect your email</strong> — Link Gmail or Outlook with one click.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">2. Train your AI</strong> — Upload a document or FAQ so replies match your voice.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">3. Set up auto-reply</strong> — Choose when and how AI responds for you.</p>\r\n<table class=\"action\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 30px auto; padding: 0; text-align: center; width: 100%; float: unset;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<a href=\"https://dahimail.com/onboarding/step/1\" class=\"button button-primary\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -webkit-text-size-adjust: none; border-radius: 4px; color: #fff; display: inline-block; overflow: hidden; text-decoration: none; background-color: #18181b; border-bottom: 8px solid #18181b; border-left: 18px solid #18181b; border-right: 18px solid #18181b; border-top: 8px solid #18181b; word-break: break-all;\">Start Setup</a>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Questions? Just reply to this email — a real person reads every message.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">— The Dahimail Team</p>\r\n\r\n\r\n<table class=\"subcopy\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; border-top: 1px solid #e4e4e7; margin-top: 25px; padding-top: 25px;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; text-align: left; font-size: 14px;\">If you\'re having trouble clicking the \"Start Setup\" button, copy and paste the URL below\r\ninto your web browser: <span class=\"break-all\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; word-break: break-all;\"><a href=\"https://dahimail.com/onboarding/step/1\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; word-break: break-all;\" rel=\"noopener noreferrer\">https://dahimail.com/onboarding/step/1</a></span></p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"footer\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; margin: 0 auto; padding: 0; text-align: center; width: 570px;\">\r\n<tr>\r\n<td class=\"content-cell\" align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; color: #a1a1aa; font-size: 12px; text-align: center;\">© 2026 Dahimail. All rights reserved.</p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n\r\n', 'Dahimail: https://dahimail.com\r\n\r\n# Hi Zulfiqar,\r\n\r\nWelcome aboard! Your account is ready and we\'re excited to help you automate your communications.\r\n\r\nHere\'s how to get started in under 5 minutes:\r\n\r\n**1. Connect your email** — Link Gmail or Outlook with one click.\r\n\r\n**2. Train your AI** — Upload a document or FAQ so replies match your voice.\r\n\r\n**3. Set up auto-reply** — Choose when and how AI responds for you.\r\n\r\nStart Setup: https://dahimail.com/onboarding/step/1\r\n\r\nQuestions? Just reply to this email — a real person reads every message.\r\n\r\n— The Dahimail Team\r\n\r\nIf you\'re having trouble clicking the \"Start Setup\" button, copy and paste the URL below\r\ninto your web browser: [https://dahimail.com/onboarding/step/1](https://dahimail.com/onboarding/step/1)\r\n\r\n© 2026 Dahimail. All rights reserved.\r\n', 'Welcome to Dahimail!', 'noreply@dahimail.com', 'Dahimail', '[\"zulfiqar1@dahimail.com\"]', '[]', '[]', '<890147f3fec1d022618d6031ffb56cd0@dahimail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-10-02 12:53:00', '2026-10-02 12:53:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'INBOX', '2026-10-02 12:53:07', '2026-10-02 12:53:07', NULL),
(41, '06737ebc-8522-48be-94cf-86cf3a3841fb', 32, 17, 'inbound', 'contact', NULL, 'message', '\r\n\r\n\r\n\r\n<table class=\"wrapper\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td class=\"header\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; padding: 25px 0; text-align: center;\">\r\n<a href=\"https://dahimail.com\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 19px; font-weight: bold; text-decoration: none; display: inline-block;\" rel=\"noopener noreferrer\">\r\nDahimail\r\n</a>\r\n</td>\r\n</tr>\r\n\r\n\r\n<tr>\r\n<td class=\"body\" width=\"100%\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; border-bottom: 1px solid #fafafa; border-top: 1px solid #fafafa; margin: 0; padding: 0; width: 100%; border: hidden !important;\">\r\n<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; background-color: #ffffff; border-color: #e4e4e7; border-radius: 4px; border-width: 1px; box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px -1px rgba(0, 0, 0, 0.1); margin: 0 auto; padding: 0; width: 570px;\">\r\n\r\n<tr>\r\n<td class=\"content-cell\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<h1 style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 18px; font-weight: bold; margin-top: 0; text-align: start;\">Hi Rukhsana,</h1>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Welcome aboard! Your account is ready and we\'re excited to help you automate your communications.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Here\'s how to get started in under 5 minutes:</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">1. Connect your email</strong> — Link Gmail or Outlook with one click.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">2. Train your AI</strong> — Upload a document or FAQ so replies match your voice.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\"><strong style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">3. Set up auto-reply</strong> — Choose when and how AI responds for you.</p>\r\n<table class=\"action\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 30px auto; padding: 0; text-align: center; width: 100%; float: unset;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<a href=\"https://dahimail.com/onboarding/step/1\" class=\"button button-primary\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -webkit-text-size-adjust: none; border-radius: 4px; color: #fff; display: inline-block; overflow: hidden; text-decoration: none; background-color: #18181b; border-bottom: 8px solid #18181b; border-left: 18px solid #18181b; border-right: 18px solid #18181b; border-top: 8px solid #18181b; word-break: break-all;\">Start Setup</a>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Questions? Just reply to this email — a real person reads every message.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">— The Dahimail Team</p>\r\n\r\n\r\n<table class=\"subcopy\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; border-top: 1px solid #e4e4e7; margin-top: 25px; padding-top: 25px;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; text-align: left; font-size: 14px;\">If you\'re having trouble clicking the \"Start Setup\" button, copy and paste the URL below\r\ninto your web browser: <span class=\"break-all\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; word-break: break-all;\"><a href=\"https://dahimail.com/onboarding/step/1\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; word-break: break-all;\" rel=\"noopener noreferrer\">https://dahimail.com/onboarding/step/1</a></span></p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"footer\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; margin: 0 auto; padding: 0; text-align: center; width: 570px;\">\r\n<tr>\r\n<td class=\"content-cell\" align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; color: #a1a1aa; font-size: 12px; text-align: center;\">© 2026 Dahimail. All rights reserved.</p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n\r\n', 'Dahimail: https://dahimail.com\r\n\r\n# Hi Rukhsana,\r\n\r\nWelcome aboard! Your account is ready and we\'re excited to help you automate your communications.\r\n\r\nHere\'s how to get started in under 5 minutes:\r\n\r\n**1. Connect your email** — Link Gmail or Outlook with one click.\r\n\r\n**2. Train your AI** — Upload a document or FAQ so replies match your voice.\r\n\r\n**3. Set up auto-reply** — Choose when and how AI responds for you.\r\n\r\nStart Setup: https://dahimail.com/onboarding/step/1\r\n\r\nQuestions? Just reply to this email — a real person reads every message.\r\n\r\n— The Dahimail Team\r\n\r\nIf you\'re having trouble clicking the \"Start Setup\" button, copy and paste the URL below\r\ninto your web browser: [https://dahimail.com/onboarding/step/1](https://dahimail.com/onboarding/step/1)\r\n\r\n© 2026 Dahimail. All rights reserved.\r\n', 'Welcome to Dahimail!', 'noreply@dahimail.com', 'Dahimail', '[\"rukhsanafbr@dahimail.com\"]', '[]', '[]', '<46c599684b4e458dd45c4241339fc0f4@dahimail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-10-05 08:05:35', '2026-10-05 08:05:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'INBOX', '2026-10-05 08:12:09', '2026-10-05 08:12:09', NULL);
INSERT INTO `messages` (`id`, `uuid`, `conversation_id`, `workspace_id`, `direction`, `sender_type`, `sender_id`, `type`, `body_html`, `body_text`, `subject`, `from_email`, `from_name`, `to_emails`, `cc_emails`, `bcc_emails`, `message_id_header`, `in_reply_to`, `references_header`, `ai_confidence`, `ai_model`, `ai_provider`, `ai_tokens_in`, `ai_tokens_out`, `ai_cost`, `ai_response_time_ms`, `ai_sources_used`, `ai_status`, `sentiment`, `detected_language`, `delivery_status`, `delivery_error`, `opens_count`, `clicks_count`, `sent_at`, `delivered_at`, `opened_at`, `clicked_at`, `bounced_at`, `bounce_type`, `scheduled_at`, `schedule_status`, `channel_message_id`, `imap_uid`, `imap_folder`, `created_at`, `updated_at`, `deleted_at`) VALUES
(42, '7217c889-5f1c-472d-bbc9-d7a320e91503', 33, 17, 'inbound', 'contact', NULL, 'message', '\r\n\r\n\r\n\r\n<table class=\"wrapper\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 0; padding: 0; width: 100%;\">\r\n<tr>\r\n<td class=\"header\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; padding: 25px 0; text-align: center;\">\r\n<a href=\"https://dahimail.com\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 19px; font-weight: bold; text-decoration: none; display: inline-block;\" rel=\"noopener noreferrer\">\r\nDahimail\r\n</a>\r\n</td>\r\n</tr>\r\n\r\n\r\n<tr>\r\n<td class=\"body\" width=\"100%\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; background-color: #fafafa; border-bottom: 1px solid #fafafa; border-top: 1px solid #fafafa; margin: 0; padding: 0; width: 100%; border: hidden !important;\">\r\n<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; background-color: #ffffff; border-color: #e4e4e7; border-radius: 4px; border-width: 1px; box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px -1px rgba(0, 0, 0, 0.1); margin: 0 auto; padding: 0; width: 570px;\">\r\n\r\n<tr>\r\n<td class=\"content-cell\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<h1 style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; font-size: 18px; font-weight: bold; margin-top: 0; text-align: start;\">Hello!</h1>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Please click the button below to verify your email address.</p>\r\n<table class=\"action\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 100%; margin: 30px auto; padding: 0; text-align: center; width: 100%; float: unset;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<a href=\"https://dahimail.com/email/verify/17/b496fbbdbaa9b1751d62e8bc659d2845f340edb1?expires=1791198335&amp;signature=b78ec88285982dd397f0a481fd7a96c4eedd71a7bb20c7ebd45b4d73bf1a7559\" class=\"button button-primary\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -webkit-text-size-adjust: none; border-radius: 4px; color: #fff; display: inline-block; overflow: hidden; text-decoration: none; background-color: #18181b; border-bottom: 8px solid #18181b; border-left: 18px solid #18181b; border-right: 18px solid #18181b; border-top: 8px solid #18181b; word-break: break-all;\">Verify Email Address</a>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">If you did not create an account, no further action is required.</p>\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;\">Regards,<br>\r\nDahimail</p>\r\n\r\n\r\n<table class=\"subcopy\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; border-top: 1px solid #e4e4e7; margin-top: 25px; padding-top: 25px;\">\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; text-align: left; font-size: 14px;\">If you\'re having trouble clicking the \"Verify Email Address\" button, copy and paste the URL below\r\ninto your web browser: <span class=\"break-all\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; word-break: break-all;\"><a href=\"https://dahimail.com/email/verify/17/b496fbbdbaa9b1751d62e8bc659d2845f340edb1?expires=1791198335&amp;signature=b78ec88285982dd397f0a481fd7a96c4eedd71a7bb20c7ebd45b4d73bf1a7559\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; color: #18181b; word-break: break-all;\" rel=\"noopener noreferrer\">https://dahimail.com/email/verify/17/b496fbbdbaa9b1751d62e8bc659d2845f340edb1?expires=1791198335&amp;signature=b78ec88285982dd397f0a481fd7a96c4eedd71a7bb20c7ebd45b4d73bf1a7559</a></span></p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n\r\n<tr>\r\n<td style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative;\">\r\n<table class=\"footer\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; -premailer-cellpadding: 0; -premailer-cellspacing: 0; -premailer-width: 570px; margin: 0 auto; padding: 0; text-align: center; width: 570px;\">\r\n<tr>\r\n<td class=\"content-cell\" align=\"center\" style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; max-width: 100vw; padding: 32px;\">\r\n<p style=\"box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; position: relative; line-height: 1.5em; margin-top: 0; color: #a1a1aa; font-size: 12px; text-align: center;\">© 2026 Dahimail. All rights reserved.</p>\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</table>\r\n\r\n', 'Dahimail: https://dahimail.com\r\n\r\n# Hello!\r\n\r\nPlease click the button below to verify your email address.\r\n\r\nVerify Email Address: https://dahimail.com/email/verify/17/b496fbbdbaa9b1751d62e8bc659d2845f340edb1?expires=1791198335&signature=b78ec88285982dd397f0a481fd7a96c4eedd71a7bb20c7ebd45b4d73bf1a7559\r\n\r\nIf you did not create an account, no further action is required.\r\n\r\nRegards,\r\nDahimail\r\n\r\nIf you\'re having trouble clicking the \"Verify Email Address\" button, copy and paste the URL below\r\ninto your web browser: [https://dahimail.com/email/verify/17/b496fbbdbaa9b1751d62e8bc659d2845f340edb1?expires=1791198335&signature=b78ec88285982dd397f0a481fd7a96c4eedd71a7bb20c7ebd45b4d73bf1a7559](https://dahimail.com/email/verify/17/b496fbbdbaa9b1751d62e8bc659d2845f340edb1?expires=1791198335&signature=b78ec88285982dd397f0a481fd7a96c4eedd71a7bb20c7ebd45b4d73bf1a7559)\r\n\r\n© 2026 Dahimail. All rights reserved.\r\n', 'Verify Email Address', 'noreply@dahimail.com', 'Dahimail', '[\"rukhsanafbr@dahimail.com\"]', '[]', '[]', '<5bbf71ccd9b4958c2e56b4d1e7c58e21@dahimail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-10-05 08:05:35', '2026-10-05 08:05:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'INBOX', '2026-10-05 08:12:09', '2026-10-05 08:12:09', NULL),
(43, '50d70ce9-d56b-4ac7-bdc5-9c5a45aafc57', 34, 17, 'inbound', 'contact', NULL, 'message', 'D\r\n', 'D\r\n', 'F', 'fahadkheshgi1@gmail.com', 'Shah Fahad', '[\"rukhsanafbr@dahimail.com\"]', '[]', '[]', '<CALww9u6A7uKz8qW+YrAfE74XGhd9Wx61N90c9VUTYirpEYjLkQ@mail.gmail.com>', NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', NULL, 0, 0, '2026-10-05 08:11:58', '2026-10-05 08:11:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'INBOX', '2026-10-05 08:12:20', '2026-10-05 08:12:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_core_tables', 1),
(2, '0001_01_01_000002_create_users_table', 1),
(3, '0001_01_01_000003_create_workspaces_table', 1),
(4, '0001_01_01_000004_create_plans_and_subscriptions_table', 1),
(5, '0001_01_01_000005_create_email_accounts_table', 1),
(6, '0001_01_01_000006_create_contacts_and_crm_tables', 1),
(7, '0001_01_01_000007_create_conversations_and_messages_tables', 1),
(8, '0001_01_01_000008_create_ai_and_knowledge_base_tables', 1),
(9, '0001_01_01_000009_create_campaigns_and_workflows_tables', 1),
(10, '0001_01_01_000010_create_channels_and_admin_tables', 1),
(11, '2026_03_16_084512_create_personal_access_tokens_table', 1),
(12, '2026_03_16_150000_add_uuid_to_campaign_recipients', 1),
(13, '2026_03_16_200000_create_payment_gateways_table', 1),
(14, '2026_03_16_200001_add_gateway_fields_to_payments_table', 1),
(15, '2026_03_17_000001_add_admin_fields_to_users_table', 1),
(16, '2026_03_17_000002_add_performance_indexes', 1),
(17, '2026_03_17_100000_add_critical_unique_constraints', 1),
(18, '2026_03_17_300000_add_security_enhancements', 1),
(19, '2026_03_17_400000_add_status_to_invites_and_email_to_campaign_recipients', 1),
(20, '2026_03_18_000001_add_inbox_performance_indexes', 1),
(21, '2026_03_18_000002_add_contact_email_unique_constraint', 1),
(22, '2026_03_18_100000_add_retry_count_to_drip_enrollments', 1),
(23, '2026_03_18_200000_add_campaign_audience_indexes', 1),
(24, '2026_03_18_200001_add_two_factor_attempts_and_impersonation', 1),
(25, '2026_03_18_300000_create_email_templates_table', 1),
(26, '2026_03_18_400000_expand_channel_integrations_for_third_party', 1),
(27, '2026_03_20_000001_add_performance_optimization_indexes', 1),
(28, '2026_03_20_000002_create_auto_reply_rules_table', 1),
(29, '2026_03_20_100001_add_two_factor_confirmed_at_to_users_table', 1),
(30, '2026_03_20_200000_create_blocked_ips_table', 1),
(31, '2026_03_20_300000_add_inbox_performance_indexes', 1),
(32, '2026_03_21_000001_add_missing_audit_indexes', 1),
(33, '2026_03_21_000002_create_help_articles_table', 1),
(34, '2026_03_21_100001_add_email_scheduling_fields', 1),
(35, '2026_03_21_100002_add_scope_to_canned_responses_table', 1),
(36, '2026_03_22_000001_add_performance_indexes', 1),
(37, '2026_03_22_000002_create_webhook_logs_table', 1),
(38, '2026_03_22_073102_create_activity_log_table', 1),
(39, '2026_03_22_073103_add_event_column_to_activity_log_table', 1),
(40, '2026_03_22_073104_add_batch_uuid_column_to_activity_log_table', 1),
(41, '2026_03_24_000001_add_nuclear_audit_performance_indexes', 1),
(42, '2026_03_24_000002_add_ai_spending_cap', 1),
(43, '2026_03_24_000003_add_conversation_snooze', 1),
(44, '2026_03_24_090611_add_notification_preferences_to_users_table', 1),
(45, '2026_03_27_000001_nuclear_audit_fixes', 1),
(46, '2026_03_27_000002_add_metadata_to_payments_table', 1),
(47, '2026_03_31_000001_add_unique_constraint_and_soft_deletes', 1),
(48, '2026_03_31_000001_create_permission_tables', 1),
(49, '2026_03_31_000002_create_security_audit_logs_table', 1),
(50, '2026_03_31_000003_create_blocked_locations_table', 1),
(51, '2026_03_31_000004_add_exit_reason_to_drip_enrollments', 1),
(52, '2026_03_31_000005_add_content_hash_to_kb_documents', 1),
(53, '2026_03_31_100001_add_category_to_payment_gateways', 1),
(54, '2026_03_31_100002_create_languages_table', 1),
(55, '2026_03_31_100003_create_currencies_table', 1),
(56, '2026_03_31_100004_add_locale_fields_to_users', 1),
(57, '2026_04_01_000001_create_temp_mail_tables', 1),
(58, '2026_04_01_100001_add_coupon_fields_to_payments', 1),
(59, '2026_04_02_000001_change_pages_type_to_varchar', 1),
(60, '2026_04_02_000002_create_testimonials_table', 1),
(61, '2026_04_02_155304_add_soft_deletes_to_deal_stages_table', 1),
(62, '2026_04_03_000001_create_workspace_invites_table', 1),
(63, '2026_04_05_000001_change_body_columns_to_mediumtext', 1),
(64, '2026_04_17_000001_add_audience_meta_to_campaigns', 1),
(65, '2026_04_18_000001_add_throttle_columns_to_campaigns', 1),
(66, '2026_04_18_000002_add_processing_to_campaign_recipients_status', 1),
(67, '2026_04_27_100000_add_stripe_compatible_fields_to_coupons', 1),
(68, '2026_04_27_110000_make_ticket_user_id_nullable', 1),
(69, '2026_04_30_120000_add_ai_escalation_to_ai_configs', 1),
(70, '2026_04_30_140000_add_sms_support_to_campaigns', 1),
(71, '2026_04_30_150000_create_ai_channel_configs_table', 1),
(72, '2026_04_30_160000_add_premium_feature_flags_to_plans', 1),
(73, '2026_05_05_120000_migrate_legacy_ai_config_keys', 1),
(74, '2026_10_10_000000_add_username_and_mailbox_fields_to_users_table', 2),
(75, '2026_10_10_000001_create_reserved_usernames_table', 3),
(76, '2026_10_12_000000_add_emails_per_month_to_free_plan', 4),
(77, '2026_05_05_140000_create_email_signatures_table', 4),
(78, '2026_09_29_000001_create_device_tokens_table', 5),
(79, '2026_09_29_000002_allow_failed_message_schedule_status', 6),
(80, '2026_10_02_000001_add_last_login_ip_to_users', 7);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0505b1c6-e353-45a6-9f20-0cb7009d19da', 'App\\Notifications\\InAppNotification', 'App\\Models\\User', 14, '{\"type\":\"security_alert\",\"title\":\"New sign-in to your account\",\"body\":\"Signed in on Dahimail mobile app from IP 39.47.50.103. Not you? Change your password.\",\"action_url\":\"\\/settings\\/security\",\"icon\":\"shield\"}', '2026-10-05 09:03:06', '2026-10-03 13:30:26', '2026-10-05 09:03:06'),
('1b3db2c5-edaf-4086-9007-0e4b7849da77', 'App\\Notifications\\FriendNotification', 'App\\Models\\User', 14, '{\"type\":\"friend_accepted\",\"title\":\"khan accepted your friend request\",\"body\":\"You can now message each other.\",\"action_url\":\"\\/friends\",\"icon\":\"users\"}', '2026-10-02 16:13:22', '2026-10-02 16:10:42', '2026-10-02 16:13:22'),
('2b1fb19f-ea06-4118-b2fc-13053b97ec45', 'App\\Notifications\\NewEmailReceived', 'App\\Models\\User', 17, '{\"type\":\"new_email\",\"title\":\"New email from Dahimail\",\"body\":\"Verify Email Address\",\"action_url\":\"\\/inbox?conversation=33\",\"icon\":\"mail\"}', NULL, '2026-10-05 08:12:09', '2026-10-05 08:12:09'),
('33f50ec9-7ac1-44e5-a8cb-b550dc888e21', 'App\\Notifications\\FriendNotification', 'App\\Models\\User', 3, '{\"type\":\"friend_accepted\",\"title\":\"Umair Ali accepted your friend request\",\"body\":\"You can now message each other.\",\"action_url\":\"\\/friends\",\"icon\":\"users\"}', NULL, '2026-10-03 13:34:26', '2026-10-03 13:34:26'),
('488ccf8e-efef-42bc-9241-906337b5d34c', 'App\\Notifications\\FriendNotification', 'App\\Models\\User', 14, '{\"type\":\"friend_request\",\"title\":\"nb sent you a friend request\",\"body\":\"Open Friends to accept or decline.\",\"action_url\":\"\\/friends\",\"icon\":\"users\"}', '2026-10-03 13:34:19', '2026-10-03 13:33:42', '2026-10-03 13:34:19'),
('6d6e7a5f-f56e-4686-9181-938872c6cd05', 'App\\Notifications\\FriendNotification', 'App\\Models\\User', 14, '{\"type\":\"friend_request\",\"title\":\"Sardar Zulfiqar Ali Shah sent you a friend request\",\"body\":\"Open Friends to accept or decline.\",\"action_url\":\"\\/friends\",\"icon\":\"users\"}', '2026-10-02 12:40:38', '2026-10-02 12:30:34', '2026-10-02 12:40:38'),
('76d4c8b9-f272-42a2-802b-a86bfcf5dc88', 'App\\Notifications\\FriendNotification', 'App\\Models\\User', 14, '{\"type\":\"friend_request\",\"title\":\"Zulfiqar sent you a friend request\",\"body\":\"Open Friends to accept or decline.\",\"action_url\":\"\\/friends\",\"icon\":\"users\"}', '2026-10-02 12:55:35', '2026-10-02 12:55:12', '2026-10-02 12:55:35'),
('7984666e-ab54-4cef-86ee-58a03826946b', 'App\\Notifications\\NewEmailReceived', 'App\\Models\\User', 17, '{\"type\":\"new_email\",\"title\":\"New email from Shah Fahad\",\"body\":\"F\",\"action_url\":\"\\/inbox?conversation=34\",\"icon\":\"mail\"}', NULL, '2026-10-05 08:12:20', '2026-10-05 08:12:20'),
('7a9ada38-9a96-40ac-be68-6a76b608ea96', 'App\\Notifications\\FriendNotification', 'App\\Models\\User', 16, '{\"type\":\"friend_accepted\",\"title\":\"Sardar Zulfiqar Ali Shah accepted your friend request\",\"body\":\"You can now message each other.\",\"action_url\":\"\\/friends\",\"icon\":\"users\"}', NULL, '2026-10-02 14:55:47', '2026-10-02 14:55:47'),
('96cec480-d6b4-4adf-a161-1bc2e5752ad1', 'App\\Notifications\\NewEmailReceived', 'App\\Models\\User', 17, '{\"type\":\"new_email\",\"title\":\"New email from Dahimail\",\"body\":\"Welcome to Dahimail!\",\"action_url\":\"\\/inbox?conversation=32\",\"icon\":\"mail\"}', NULL, '2026-10-05 08:12:09', '2026-10-05 08:12:09'),
('a54e573a-40c4-4c1f-8c9b-274b5e0721ca', 'App\\Notifications\\FriendNotification', 'App\\Models\\User', 6, '{\"type\":\"friend_request\",\"title\":\"Umair Ali sent you a friend request\",\"body\":\"Open Friends to accept or decline.\",\"action_url\":\"\\/friends\",\"icon\":\"users\"}', NULL, '2026-10-02 16:10:30', '2026-10-02 16:10:30'),
('adc2908c-b94b-400e-b11a-5a2a2dbd74cb', 'App\\Notifications\\FriendNotification', 'App\\Models\\User', 6, '{\"type\":\"friend_request\",\"title\":\"nb sent you a friend request\",\"body\":\"Open Friends to accept or decline.\",\"action_url\":\"\\/friends\",\"icon\":\"users\"}', NULL, '2026-10-01 12:55:40', '2026-10-01 12:55:40'),
('c2f93b5b-d831-4c8a-93d7-7685ac7373d4', 'App\\Notifications\\FriendNotification', 'App\\Models\\User', 15, '{\"type\":\"friend_accepted\",\"title\":\"Umair Ali accepted your friend request\",\"body\":\"You can now message each other.\",\"action_url\":\"\\/friends\",\"icon\":\"users\"}', '2026-10-02 12:36:34', '2026-10-02 12:30:48', '2026-10-02 12:36:34'),
('e243f612-2af3-4fde-9fb2-faa84d4fc089', 'App\\Notifications\\FriendNotification', 'App\\Models\\User', 3, '{\"type\":\"friend_accepted\",\"title\":\"khan accepted your friend request\",\"body\":\"You can now message each other.\",\"action_url\":\"\\/friends\",\"icon\":\"users\"}', '2026-10-01 13:00:31', '2026-10-01 12:55:52', '2026-10-01 13:00:31'),
('e98d8076-f33a-4ce5-92fb-0afd43672169', 'App\\Notifications\\FriendNotification', 'App\\Models\\User', 16, '{\"type\":\"friend_accepted\",\"title\":\"Umair Ali accepted your friend request\",\"body\":\"You can now message each other.\",\"action_url\":\"\\/friends\",\"icon\":\"users\"}', NULL, '2026-10-02 12:55:40', '2026-10-02 12:55:40'),
('f00be578-17ed-4aa4-b8a7-cc8f7ac6f833', 'App\\Notifications\\FriendNotification', 'App\\Models\\User', 15, '{\"type\":\"friend_request\",\"title\":\"Zulfiqar sent you a friend request\",\"body\":\"Open Friends to accept or decline.\",\"action_url\":\"\\/friends\",\"icon\":\"users\"}', NULL, '2026-10-02 12:55:15', '2026-10-02 12:55:15');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `sections` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`sections`)),
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_image` varchar(255) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(50) NOT NULL DEFAULT 'static',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `content`, `sections`, `meta_title`, `meta_description`, `meta_image`, `is_published`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Footer', 'footer', '{\"description\":\"AI-powered email automation, CRM, and multi-channel communication platform for modern teams.\",\"twitter_url\":\"\",\"github_url\":\"\",\"linkedin_url\":\"\",\"facebook_url\":\"\",\"instagram_url\":\"\",\"newsletter_enabled\":\"true\",\"newsletter_title\":\"Stay Updated\",\"newsletter_subtitle\":\"Get the latest updates on features, tips, and product news.\",\"copyright\":\"\\u00a9 2026 Dahimail. All rights reserved.\"}', NULL, NULL, NULL, NULL, 1, 'footer', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(2, 'About Us', 'about', '{\"title\":\"About\",\"subtitle\":\"We\'re building the future of business communication \\u2014 one AI-powered reply at a time.\",\"story\":\"Dahimail was born from a simple frustration: businesses spend too much time managing scattered inboxes across email, WhatsApp, Slack, and SMS. We built a unified platform that brings every conversation into one place, with AI that actually understands your business and drafts replies in your voice.\",\"mission\":\"Our mission is to help every team \\u2014 from solo founders to enterprise organizations \\u2014 communicate faster, smarter, and more personally at scale. We believe AI should amplify human connection, not replace it.\",\"stats\":[{\"value\":\"10K+\",\"label\":\"Active Teams\"},{\"value\":\"50M+\",\"label\":\"Emails Processed\"},{\"value\":\"99.9%\",\"label\":\"Uptime\"},{\"value\":\"24\\/7\",\"label\":\"AI Support\"}]}', NULL, NULL, NULL, NULL, 1, 'about', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(3, 'Why Us', 'why-us', '{\"title\":\"Why Choose\",\"subtitle\":\"Here\'s what sets us apart from every other email tool on the market.\",\"reasons\":[{\"title\":\"Self-Hosted & Secure\",\"desc\":\"Your data stays on your server. No third-party cloud dependency. Full control over your communication data.\"},{\"title\":\"AI That Learns Your Voice\",\"desc\":\"Train the AI on your knowledge base, past replies, and FAQs. It drafts responses that sound like you, not a robot.\"},{\"title\":\"Truly Unified Inbox\",\"desc\":\"Email, WhatsApp, SMS, Slack, Telegram, and live chat \\u2014 all in one view with smart routing and assignment.\"},{\"title\":\"No Recurring SaaS Fees\",\"desc\":\"One-time purchase. Host on your own server. No monthly charges eating into your margins.\"},{\"title\":\"Built for Teams\",\"desc\":\"Workspaces, role-based access, team assignment, collision detection, and shared templates out of the box.\"},{\"title\":\"Developer Friendly\",\"desc\":\"REST API, webhooks, Zapier integration, and clean documentation. Build custom workflows on top of the platform.\"}]}', NULL, NULL, NULL, NULL, 1, 'why_us', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(4, 'Hero Section', 'landing-hero', '{\"badge\":\"Now with GPT-4o & Claude 4 Support\",\"title_line1\":\"Achieve flawless email delivery\",\"title_highlight\":\"AI-powered\",\"title_line2\":\"automation.\",\"subtitle\":\"Optimize email performance, manage multi-channel conversations, and scale your business communication with AI that actually knows your business.\",\"cta_text\":\"Get Started Free\",\"cta_url\":\"\\/register\",\"cta2_text\":\"See Features\",\"cta2_url\":\"#features\"}', NULL, NULL, NULL, NULL, 1, 'hero', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(5, 'Features Section', 'landing-features', '{\"badge\":\"Features\",\"title\":\"Everything you need in one platform\",\"subtitle\":\"Powerful tools for email, CRM, automation, and multi-channel communication.\",\"items\":[{\"title\":\"Unified Inbox\",\"desc\":\"Email, WhatsApp, SMS, Slack, and Telegram \\u2014 all in one inbox.\"},{\"title\":\"AI-Powered Replies\",\"desc\":\"Context-aware AI drafts replies using your knowledge base.\"},{\"title\":\"Email Campaigns\",\"desc\":\"Drag-and-drop editor, A\\/B testing, drip sequences.\"},{\"title\":\"CRM & Deals\",\"desc\":\"Track contacts, manage deal pipelines, score leads.\"},{\"title\":\"Workflow Automation\",\"desc\":\"Visual no-code builder with triggers and conditions.\"},{\"title\":\"Analytics Dashboard\",\"desc\":\"Track open rates, clicks, bounces across all channels.\"}]}', NULL, NULL, NULL, NULL, 1, 'features', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(6, 'Testimonials', 'landing-testimonials', '{\"title\":\"Loved by teams\"}', NULL, NULL, NULL, NULL, 1, 'testimonials', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(7, 'FAQ Section', 'landing-faq', '{\"title\":\"Frequently Asked Questions\",\"items\":[{\"question\":\"Is Dahimail truly self-hosted?\",\"answer\":\"Yes. Install on your own server. Your data never leaves your infrastructure.\"},{\"question\":\"What AI providers are supported?\",\"answer\":\"OpenAI (GPT-4o), Anthropic (Claude), Google (Gemini), and Mistral. Bring your own API key.\"},{\"question\":\"Can I connect multiple email accounts?\",\"answer\":\"Yes \\u2014 unlimited Gmail, Outlook, and custom IMAP\\/SMTP accounts.\"},{\"question\":\"Is there a free plan?\",\"answer\":\"Yes. Free plan includes basic inbox, limited contacts, and essential features.\"},{\"question\":\"How does the one-time payment work?\",\"answer\":\"Pay once for the license and host on your server. No recurring SaaS fees.\"}]}', NULL, NULL, NULL, NULL, 1, 'faq', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(8, 'CTA Section', 'landing-cta', '{\"badge\":\"2,000+ teams already onboard\",\"title\":\"Your inbox is waiting to get smarter.\",\"subtitle\":\"Stop drowning in emails. Let AI handle the replies, automate the workflows, and grow your revenue on autopilot.\",\"cta_text\":\"Start Free \\u2014 No Credit Card\",\"cta_url\":\"\\/register\",\"note\":\"No credit card required. Setup in minutes.\"}', NULL, NULL, NULL, NULL, 1, 'cta', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(9, 'Terms of Service', 'terms', '{\"last_updated\":\"January 1, 2026\",\"sections\":[{\"title\":\"Acceptance of Terms\",\"content\":\"By accessing or using Dahimail, you agree to be bound by these Terms of Service.\"},{\"title\":\"User Accounts\",\"content\":\"You must create an account with accurate information. You are responsible for all activities under your account.\"},{\"title\":\"Subscriptions & Billing\",\"content\":\"Paid features require a subscription billed monthly or annually via Stripe. We may change pricing with 30 days notice.\"},{\"title\":\"Data Processing\",\"content\":\"The Service processes email and communication data you connect. AI features may send data to third-party providers solely to generate responses.\"},{\"title\":\"Acceptable Use\",\"content\":\"You agree not to send spam, upload unlawful content, attempt unauthorized access, reverse engineer the Service, or exceed usage limits.\"},{\"title\":\"Intellectual Property\",\"content\":\"The Service is the property of Dahimail. You retain ownership of your content. AI-generated content becomes yours once accepted.\"},{\"title\":\"Limitation of Liability\",\"content\":\"The Service is provided \\\"as is\\\". Total liability is limited to amounts paid in the preceding 12 months.\"},{\"title\":\"Termination\",\"content\":\"You may terminate anytime. Data is retained 30 days after termination, then permanently deleted.\"},{\"title\":\"Changes to Terms\",\"content\":\"We may update these Terms with at least 14 days notice. Continued use constitutes acceptance.\"},{\"title\":\"Governing Law\",\"content\":\"These Terms are governed by the laws of the jurisdiction where the Company is incorporated.\"}]}', NULL, NULL, NULL, NULL, 1, 'terms', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(10, 'Privacy Policy', 'privacy', '{\"last_updated\":\"January 1, 2026\",\"subtitle\":\"How Dahimail protects your data.\",\"sections\":[{\"title\":\"Information We Collect\",\"content\":\"We collect information you provide: name, email, billing info, and communication content.\"},{\"title\":\"How We Use Your Information\",\"content\":\"We use your data to provide the Service, process payments, and improve your experience.\"},{\"title\":\"AI Data Processing\",\"content\":\"AI features may send data to third-party providers. Your data is not used to train shared AI models.\"},{\"title\":\"Data Sharing\",\"content\":\"We do not sell your data. We share only with payment processors and AI providers.\"},{\"title\":\"Data Security\",\"content\":\"We use encryption at rest and in transit, secure authentication, and regular security audits.\"},{\"title\":\"Your Rights (GDPR)\",\"content\":\"EU\\/EEA users have rights to access, rectify, delete, restrict, port, and object.\"},{\"title\":\"Data Retention\",\"content\":\"Data is retained while your account is active. Removed within 30 days after deletion.\"},{\"title\":\"Cookies\",\"content\":\"We use essential cookies for authentication and analytics cookies for usage insights.\"}],\"bottom_text\":\"For privacy inquiries, contact us through our Contact page.\"}', NULL, NULL, NULL, NULL, 1, 'privacy', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(11, 'Refund Policy', 'refund-policy', '{\"last_updated\":\"January 1, 2026\",\"sections\":[{\"title\":\"Satisfaction Guarantee\",\"content\":\"14-day money-back guarantee on all new paid subscriptions.\"},{\"title\":\"Eligibility\",\"content\":\"Refunds available within 14 days of initial subscription, for first-time subscriptions only.\"},{\"title\":\"Non-Refundable Items\",\"content\":\"Renewals, add-ons, terminated accounts, and partial unused time are not refundable.\"},{\"title\":\"How to Request\",\"content\":\"Contact support with your account email. Processed within 5-10 business days.\"},{\"title\":\"Cancellation\",\"content\":\"Cancel anytime from account settings. Keep access until end of billing period.\"}]}', NULL, NULL, NULL, NULL, 1, 'refund', '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(12, 'Contact Us', 'contact', '{\"subtitle\":\"Have a question? We\'d love to hear from you.\",\"support_email_label\":\"Email Support\",\"response_time\":\"24-48 hours\",\"support_channels\":\"Email support, in-app help center, and priority support for paid plans.\"}', NULL, NULL, NULL, NULL, 1, 'contact', '2026-09-27 08:25:22', '2026-09-27 08:25:22');

-- --------------------------------------------------------

--
-- Table structure for table `password_histories`
--

CREATE TABLE `password_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('umairkheshgi@gmail.com', '$2y$12$xqj8Ssrhq1Zpr8ZBTewhlu5JWyD1RKKpLKpVBbxt.gjxvIeAr/cOq', '2026-09-28 13:07:36');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED DEFAULT NULL,
  `stripe_payment_id` varchar(255) DEFAULT NULL,
  `stripe_invoice_id` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(3) NOT NULL DEFAULT 'usd',
  `status` enum('succeeded','failed','pending','refunded','partially_refunded') NOT NULL DEFAULT 'pending',
  `gateway_transaction_id` varchar(255) DEFAULT NULL,
  `gateway_slug` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `original_amount` decimal(10,2) DEFAULT NULL,
  `failure_reason` varchar(255) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `refund_amount` decimal(10,2) DEFAULT NULL,
  `refunded_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `workspace_id`, `subscription_id`, `stripe_payment_id`, `stripe_invoice_id`, `amount`, `currency`, `status`, `gateway_transaction_id`, `gateway_slug`, `description`, `coupon_code`, `discount_amount`, `original_amount`, `failure_reason`, `metadata`, `refund_amount`, `refunded_at`, `created_at`, `updated_at`) VALUES
(1, 4, 8, NULL, NULL, 1.00, 'USD', 'succeeded', NULL, 'bank_transfer', 'Bank transfer confirmed by admin', NULL, NULL, NULL, NULL, '{\"plan_id\":5,\"billing_cycle\":\"monthly\",\"user_id\":3}', NULL, NULL, '2026-09-28 05:10:55', '2026-09-28 11:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL DEFAULT 'other',
  `logo` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `credentials` text DEFAULT NULL COMMENT 'Encrypted JSON',
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_sandbox` tinyint(1) NOT NULL DEFAULT 1,
  `supported_currencies` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`supported_currencies`)),
  `min_amount` decimal(12,2) DEFAULT NULL,
  `max_amount` decimal(12,2) DEFAULT NULL,
  `processing_fee` decimal(8,2) NOT NULL DEFAULT 0.00,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `slug`, `category`, `logo`, `description`, `credentials`, `is_active`, `is_sandbox`, `supported_currencies`, `min_amount`, `max_amount`, `processing_fee`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Stripe', 'stripe', 'popular', NULL, 'Accept credit/debit cards via Stripe Checkout.', NULL, 0, 1, '[\"USD\",\"EUR\",\"GBP\",\"INR\",\"AUD\",\"CAD\",\"SGD\",\"JPY\",\"BRL\",\"MXN\",\"CHF\"]', NULL, NULL, 0.00, 1, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(2, 'PayPal', 'paypal', 'popular', NULL, 'Accept payments via PayPal Checkout.', NULL, 0, 1, '[\"USD\",\"EUR\",\"GBP\",\"AUD\",\"CAD\",\"JPY\",\"BRL\",\"MXN\",\"CHF\",\"HKD\"]', NULL, NULL, 0.00, 2, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(3, 'Razorpay', 'razorpay', 'popular', NULL, 'Accept payments in India via Razorpay.', NULL, 0, 1, '[\"INR\",\"USD\",\"EUR\",\"GBP\",\"SGD\"]', NULL, NULL, 0.00, 3, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(4, 'Mollie', 'mollie', 'popular', NULL, 'European payment gateway supporting iDEAL, Bancontact, cards.', NULL, 0, 1, '[\"EUR\",\"USD\",\"GBP\",\"CHF\",\"SEK\",\"NOK\",\"DKK\"]', NULL, NULL, 0.00, 4, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(5, 'Paystack', 'paystack', 'popular', NULL, 'Accept payments in Africa via Paystack.', NULL, 0, 1, '[\"NGN\",\"GHS\",\"ZAR\",\"USD\"]', NULL, NULL, 0.00, 5, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(6, 'Flutterwave', 'flutterwave', 'regional', NULL, 'Accept payments across Africa via Flutterwave (Rave).', NULL, 0, 1, '[\"NGN\",\"GHS\",\"KES\",\"ZAR\",\"USD\",\"EUR\",\"GBP\"]', NULL, NULL, 0.00, 6, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(7, 'Paytm', 'paytm', 'regional', NULL, 'Accept payments in India via Paytm Business.', NULL, 0, 1, '[\"INR\"]', NULL, NULL, 0.00, 7, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(8, 'Square', 'square', 'regional', NULL, 'Accept card payments via Square Checkout.', NULL, 0, 1, '[\"USD\",\"CAD\",\"AUD\",\"GBP\",\"EUR\",\"JPY\"]', NULL, NULL, 0.00, 8, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(9, 'Braintree', 'braintree', 'regional', NULL, 'Accept card payments via Braintree (PayPal).', NULL, 0, 1, '[\"USD\",\"EUR\",\"GBP\",\"AUD\",\"CAD\"]', NULL, NULL, 0.00, 9, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(10, '2Checkout', 'twocheckout', 'regional', NULL, 'Accept payments via 2Checkout (Verifone).', NULL, 0, 1, '[\"USD\",\"EUR\",\"GBP\",\"BRL\",\"ARS\",\"MXN\"]', NULL, NULL, 0.00, 10, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(11, 'Coinbase (Legacy)', 'coinbase', 'crypto', NULL, 'Accept crypto payments via Coinbase Commerce (legacy driver).', NULL, 0, 1, '[\"USD\",\"EUR\",\"GBP\",\"BTC\",\"ETH\"]', NULL, NULL, 0.00, 11, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(12, 'Mercado Pago', 'mercadopago', 'regional', NULL, 'Accept payments in Latin America via Mercado Pago.', NULL, 0, 1, '[\"BRL\",\"ARS\",\"MXN\",\"CLP\",\"COP\",\"PEN\",\"UYU\"]', NULL, NULL, 0.00, 12, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(13, 'iyzico', 'iyzico', 'regional', NULL, 'Accept payments in Turkey via iyzico.', NULL, 0, 1, '[\"TRY\",\"EUR\",\"USD\",\"GBP\"]', NULL, NULL, 0.00, 13, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(14, 'Paddle', 'paddle', 'regional', NULL, 'Accept payments via Paddle (MoR).', NULL, 0, 1, '[\"USD\",\"EUR\",\"GBP\",\"AUD\",\"CAD\"]', NULL, NULL, 0.00, 14, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(15, 'Authorize.Net', 'authorize_net', 'regional', NULL, 'Accept card payments via Authorize.Net.', NULL, 0, 1, '[\"USD\",\"CAD\",\"GBP\",\"EUR\",\"AUD\"]', NULL, NULL, 0.00, 15, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(16, 'SSLCommerz', 'sslcommerz', 'regional', NULL, 'Accept payments in Bangladesh via SSLCommerz.', NULL, 0, 1, '[\"BDT\"]', NULL, NULL, 0.00, 16, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(17, 'Instamojo', 'instamojo', 'regional', NULL, 'Accept payments in India via Instamojo.', NULL, 0, 1, '[\"INR\"]', NULL, NULL, 0.00, 17, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(18, 'PhonePe', 'phonepe', 'regional', NULL, 'Accept UPI/card payments in India via PhonePe.', NULL, 0, 1, '[\"INR\"]', NULL, NULL, 0.00, 18, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(19, 'Cashfree', 'cashfree', 'regional', NULL, 'Accept payments in India via Cashfree.', NULL, 0, 1, '[\"INR\"]', NULL, NULL, 0.00, 19, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(20, 'PayU', 'payu', 'regional', NULL, 'Accept payments in India/LatAm via PayU.', NULL, 0, 1, '[\"INR\",\"BRL\",\"MXN\",\"ARS\",\"CLP\",\"COP\"]', NULL, NULL, 0.00, 20, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(21, 'Midtrans', 'midtrans', 'regional', NULL, 'Accept payments in Indonesia via Midtrans.', NULL, 0, 1, '[\"IDR\"]', NULL, NULL, 0.00, 21, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(22, 'Xendit', 'xendit', 'regional', NULL, 'Accept payments in Southeast Asia via Xendit.', NULL, 0, 1, '[\"IDR\",\"PHP\",\"THB\",\"VND\",\"MYR\"]', NULL, NULL, 0.00, 22, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(23, 'Tap Payments', 'tap', 'regional', NULL, 'Accept payments in Middle East via Tap.', NULL, 0, 1, '[\"KWD\",\"BHD\",\"SAR\",\"AED\",\"QAR\",\"OMR\",\"EGP\",\"JOD\"]', NULL, NULL, 0.00, 23, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(24, 'HyperPay', 'hyperpay', 'regional', NULL, 'Accept payments in MENA via HyperPay (ACI).', NULL, 0, 1, '[\"SAR\",\"AED\",\"BHD\",\"EGP\",\"JOD\",\"KWD\",\"OMR\",\"QAR\"]', NULL, NULL, 0.00, 24, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(25, 'PayTR', 'paytr', 'regional', NULL, 'Accept payments in Turkey via PayTR.', NULL, 0, 1, '[\"TRY\",\"USD\",\"EUR\",\"GBP\"]', NULL, NULL, 0.00, 25, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(26, 'Fondy', 'fondy', 'regional', NULL, 'Accept payments in Eastern Europe via Fondy (CloudIPSP).', NULL, 0, 1, '[\"UAH\",\"USD\",\"EUR\",\"GBP\",\"RUB\"]', NULL, NULL, 0.00, 26, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(27, 'Skrill', 'skrill', 'regional', NULL, 'Accept payments via Skrill (Moneybookers).', NULL, 0, 1, '[\"USD\",\"EUR\",\"GBP\",\"CHF\",\"CAD\",\"AUD\"]', NULL, NULL, 0.00, 27, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(28, 'CinetPay', 'cinetpay', 'regional', NULL, 'Accept mobile money payments in West Africa via CinetPay.', NULL, 0, 1, '[\"XOF\",\"XAF\",\"GNF\",\"CDF\"]', NULL, NULL, 0.00, 28, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(29, 'Bank Transfer', 'bank_transfer', 'other', NULL, 'Accept manual bank transfer payments.', 'eyJpdiI6Ik54c3NabXUvdmNXU0QySWcraTd2SFE9PSIsInZhbHVlIjoiRDQxR2k1SVd0TXdlMjhkbGtORXAydjBwRHEvTXQrUmRXVEJzZFhRWG5pVUMvNDd0WHRlWDIvN3Q4bDVQNkFNRGRUYkk2L3dGTGx5SWZqYnp5ZmR5U1FPTVI0WjNqRDhLQmVNNDBkcGtlUThsTFp0STVVTHZ4RFBzU3dYaDVROHlUdEhmYXBMeE1VVFFXbGd2MnE1aU9kcmtNbUtER1M1eEtkUEcvaTZ2K1VHMndsZXpiMU5EYk1YdUtRbi9mWmMyIiwibWFjIjoiNWRkOTYxMmE4NDk2OTJhMGQ0ZDRmMTQ5MzY3OTdkNzU2YTYwZWE2YzhmYzFkYzIyODBkODVhNzRjNzhkZTYzNyIsInRhZyI6IiJ9', 1, 1, '[\"USD\",\"EUR\",\"GBP\",\"INR\",\"AUD\",\"CAD\"]', NULL, NULL, 0.00, 29, '2026-09-27 08:25:21', '2026-09-28 05:10:16'),
(30, 'Offline Payment', 'offline', 'other', NULL, 'Accept offline/manual payments (cash, cheque, etc.).', NULL, 0, 1, '[\"USD\",\"EUR\",\"GBP\",\"INR\"]', NULL, NULL, 0.00, 30, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(31, 'Coinbase Commerce', 'coinbase_commerce', 'crypto', NULL, 'Accept crypto payments via Coinbase Commerce (BTC, ETH, LTC, etc.).', NULL, 0, 1, '[\"USD\",\"EUR\",\"GBP\",\"BTC\",\"ETH\",\"LTC\",\"USDC\",\"DAI\"]', NULL, NULL, 0.00, 31, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(32, 'CoinPayments', 'coinpayments', 'crypto', NULL, 'Accept 2000+ cryptocurrencies via CoinPayments.', NULL, 0, 1, '[\"USD\",\"EUR\",\"GBP\",\"BTC\",\"ETH\",\"LTC\",\"XRP\",\"DOGE\",\"USDT\"]', NULL, NULL, 0.00, 32, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(33, 'NOWPayments', 'nowpayments', 'crypto', NULL, 'Accept 150+ cryptocurrencies via NOWPayments.', NULL, 0, 1, '[\"USD\",\"EUR\",\"GBP\",\"BTC\",\"ETH\",\"XRP\",\"USDT\",\"USDC\",\"BNB\"]', NULL, NULL, 0.00, 33, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(34, 'BitPay', 'bitpay', 'crypto', NULL, 'Accept Bitcoin and crypto payments via BitPay.', NULL, 0, 1, '[\"USD\",\"EUR\",\"GBP\",\"BTC\",\"BCH\",\"ETH\",\"XRP\",\"DOGE\"]', NULL, NULL, 0.00, 34, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(35, 'Cryptomus', 'cryptomus', 'crypto', NULL, 'Accept crypto payments via Cryptomus gateway.', NULL, 0, 1, '[\"USD\",\"EUR\",\"BTC\",\"ETH\",\"USDT\",\"TRX\",\"BNB\",\"LTC\"]', NULL, NULL, 0.00, 35, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(36, 'Plisio', 'plisio', 'crypto', NULL, 'Accept crypto payments with low fees via Plisio.', NULL, 0, 1, '[\"USD\",\"EUR\",\"BTC\",\"ETH\",\"LTC\",\"DASH\",\"DOGE\",\"XMR\",\"USDT\"]', NULL, NULL, 0.00, 36, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(37, 'CoinGate', 'coingate', 'crypto', NULL, 'Accept 70+ cryptocurrencies via CoinGate.', NULL, 0, 1, '[\"USD\",\"EUR\",\"GBP\",\"BTC\",\"ETH\",\"LTC\",\"XRP\",\"USDT\"]', NULL, NULL, 0.00, 37, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(38, 'Blockonomics', 'blockonomics', 'crypto', NULL, 'Accept Bitcoin payments directly to your wallet via Blockonomics.', NULL, 0, 1, '[\"USD\",\"EUR\",\"GBP\",\"BTC\"]', NULL, NULL, 0.00, 38, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(39, 'Triple-A', 'triple_a', 'crypto', NULL, 'Accept crypto payments with instant settlement via Triple-A.', NULL, 0, 1, '[\"USD\",\"EUR\",\"SGD\",\"BTC\",\"ETH\",\"USDT\",\"USDC\",\"BNB\"]', NULL, NULL, 0.00, 39, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(40, 'OxaPay', 'oxapay', 'crypto', NULL, 'Accept crypto payments with auto-conversion via OxaPay.', NULL, 0, 1, '[\"USD\",\"EUR\",\"BTC\",\"ETH\",\"USDT\",\"TRX\",\"BNB\",\"LTC\",\"DOGE\"]', NULL, NULL, 0.00, 40, '2026-09-27 08:25:21', '2026-09-27 08:25:21');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'users.view', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(2, 'users.create', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(3, 'users.update', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(4, 'users.delete', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(5, 'users.export', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(6, 'users.import', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(7, 'roles.view', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(8, 'roles.create', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(9, 'roles.update', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(10, 'roles.delete', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(11, 'roles.export', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(12, 'roles.import', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(13, 'permissions.view', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(14, 'permissions.create', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(15, 'permissions.update', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(16, 'permissions.delete', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(17, 'permissions.export', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(18, 'permissions.import', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(19, 'plans.view', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(20, 'plans.create', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(21, 'plans.update', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(22, 'plans.delete', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(23, 'plans.export', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(24, 'plans.import', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(25, 'payments.view', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(26, 'payments.export', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(27, 'payments.import', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(28, 'payments.refund', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(29, 'coupons.view', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(30, 'coupons.create', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(31, 'coupons.update', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(32, 'coupons.delete', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(33, 'coupons.export', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(34, 'coupons.import', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(35, 'tickets.view', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(36, 'tickets.create', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(37, 'tickets.update', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(38, 'tickets.delete', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(39, 'tickets.export', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(40, 'tickets.import', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(41, 'audit-logs.view', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(42, 'audit-logs.export', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(43, 'security-audit-logs.view', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(44, 'security-audit-logs.create', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(45, 'security-audit-logs.delete', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(46, 'security-audit-logs.export', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(47, 'blocked-ips.view', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(48, 'blocked-ips.create', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(49, 'blocked-ips.delete', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(50, 'blocked-ips.export', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(51, 'blocked-ips.import', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(52, 'blocked-locations.view', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(53, 'blocked-locations.create', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(54, 'blocked-locations.update', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(55, 'blocked-locations.delete', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(56, 'blocked-locations.export', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(57, 'blocked-locations.import', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(58, 'settings.view', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(59, 'settings.update', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(60, 'security-settings.view', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(61, 'security-settings.update', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(62, 'system-settings.view', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(63, 'system-settings.update', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(64, 'payment-gateways.view', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(65, 'payment-gateways.update', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(66, 'ai-providers.view', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(67, 'ai-providers.update', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(68, 'ai-usage.view', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(69, 'ai-usage.export', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(70, 'email-deliverability.view', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(71, 'cms.view', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(72, 'cms.update', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(73, 'notifications.view', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(74, 'system.view', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(75, 'frontend-settings.view', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(76, 'frontend-settings.update', 'web', '2026-09-27 08:25:21', '2026-09-27 08:25:21');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'mobile', 'fe320378e026a6f92c20ea07949414924f4406e05a72c85421654eddc9cbd953', '[\"*\"]', '2026-09-29 03:13:04', NULL, '2026-09-29 03:12:50', '2026-09-29 03:13:04'),
(2, 'App\\Models\\User', 3, 'debug', '364fe4c0b4a6790a6f19205f752929057ae1df5a109ee8f87114f8e6a37d05da', '[\"*\"]', '2026-09-29 03:58:17', NULL, '2026-09-29 03:38:41', '2026-09-29 03:58:17'),
(3, 'App\\Models\\User', 3, 'mobile', '960c1abdd4d76904b0f38c638fa4a8b61712b3a292a8f60a3267cf22d5d9ce55', '[\"*\"]', '2026-09-29 03:59:24', NULL, '2026-09-29 03:59:16', '2026-09-29 03:59:24'),
(4, 'App\\Models\\User', 3, 'mobile', '847c11c32ea7606cbf80e14b85596968e4fe0d18ccbbbd60a451747e7df3755a', '[\"*\"]', NULL, NULL, '2026-09-29 14:25:51', '2026-09-29 14:25:51'),
(5, 'App\\Models\\User', 3, 'mobile', '2d1c1cff1587ada8a12932d4a7d3f4e97a43721b65bc75f070581c6275ca4f18', '[\"*\"]', NULL, NULL, '2026-09-29 14:26:01', '2026-09-29 14:26:01'),
(6, 'App\\Models\\User', 3, 'DahiMail mobile app', '296b6111cd7ce3f877b77fbc9ec2945096d239cdf47d4809ae6d3f23cd569303', '[\"*\"]', '2026-09-29 15:34:26', NULL, '2026-09-29 14:26:06', '2026-09-29 15:34:26'),
(7, 'App\\Models\\User', 3, 'DahiMail mobile app', '6adc1a9099e5787730752c02a5444458aabb9abf155c9529fffad15d4d6f75d2', '[\"*\"]', '2026-09-29 17:20:07', NULL, '2026-09-29 16:03:15', '2026-09-29 17:20:07'),
(9, 'App\\Models\\User', 11, 'mobile', '8df7cbcd8fcf5eb332b3d476dcfbf84a8b9d0a3770076371866d4e7aead78686', '[\"*\"]', '2026-09-30 08:18:57', NULL, '2026-09-30 04:19:00', '2026-09-30 08:18:57'),
(11, 'App\\Models\\User', 12, 'mobile', '137d7ecf690b16ae797f5830054ec7b3a8e2c0590a2fc0c22314ac1704fd07ff', '[\"*\"]', '2026-09-30 15:08:13', NULL, '2026-09-30 11:08:48', '2026-09-30 15:08:13'),
(12, 'App\\Models\\User', 3, 'DahiMail mobile app', '94db8e26a316ce08f0d1a5f3f28ebdf81c6ae787c2274db2abffba08401687fd', '[\"*\"]', '2026-09-30 20:21:18', NULL, '2026-09-30 17:22:19', '2026-09-30 20:21:18'),
(13, 'App\\Models\\User', 3, 'DahiMail mobile app', 'e3e5c003aec74ef25b495bde93fc46d4f72beba23d3acfb5aa1dc973987342d2', '[\"*\"]', '2026-10-01 06:02:31', NULL, '2026-10-01 02:26:04', '2026-10-01 06:02:31'),
(14, 'App\\Models\\User', 3, 'Dahimail mobile app', '88ef9bbbf1430b7397e6309383ed01203b8ac3e3d8e493d41562db1f31583db9', '[\"*\"]', '2026-10-01 15:04:23', NULL, '2026-10-01 12:23:48', '2026-10-01 15:04:23'),
(15, 'App\\Models\\User', 3, 'Dahimail mobile app', 'd8bcd701600c9fd5b4f220b694e134acf8fe17cce6fefb8cf06440e922c6267d', '[\"*\"]', '2026-10-01 18:23:28', NULL, '2026-10-01 17:51:52', '2026-10-01 18:23:28'),
(17, 'App\\Models\\User', 3, 'Dahimail mobile app', '782402bfa13415967697475a32ea4e934283a0c63f40e29badc68fe6db4d9d49', '[\"*\"]', '2026-10-02 04:42:00', NULL, '2026-10-02 03:49:32', '2026-10-02 04:42:00'),
(18, 'App\\Models\\User', 3, 'Dahimail mobile app', '11b7ec6adf5572d78b44975a7219fc6e2445d3d8ae6a7f13cb070a19f2c82270', '[\"*\"]', '2026-10-02 08:42:51', NULL, '2026-10-02 04:42:52', '2026-10-02 08:42:51'),
(19, 'App\\Models\\User', 3, 'Dahimail mobile app', '35d5e2b817afa0cd7c1f7b237061974373a13af96d0b0b41f621aa4f354af4d8', '[\"*\"]', '2026-10-02 10:09:50', NULL, '2026-10-02 09:01:08', '2026-10-02 10:09:50'),
(20, 'App\\Models\\User', 14, 'mobile', '81643b22c1444f720801def3e7439498d28799100c4046752ae2d06eff162b69', '[\"*\"]', '2026-10-02 15:34:50', NULL, '2026-10-02 12:05:26', '2026-10-02 15:34:50'),
(21, 'App\\Models\\User', 15, 'mobile', '5538552fa65d4da45486502f3407d02f6018c65fcac2687eeeebe1e78e68508b', '[\"*\"]', '2026-10-02 15:09:56', NULL, '2026-10-02 12:25:52', '2026-10-02 15:09:56'),
(22, 'App\\Models\\User', 16, 'mobile', '5048c3b61a960d8a3d2ab19f24f2dc2dee446aadfde842fb0182de6d4ee34f9f', '[\"*\"]', '2026-10-02 15:05:20', NULL, '2026-10-02 12:53:00', '2026-10-02 15:05:20'),
(23, 'App\\Models\\User', 14, 'Dahimail mobile app', 'c7d4979d3ecfca78576d91428b8ac8d2756068d07550919a519b1dbe2c8570d7', '[\"*\"]', '2026-10-02 16:51:57', NULL, '2026-10-02 16:07:51', '2026-10-02 16:51:57'),
(24, 'App\\Models\\User', 14, 'Dahimail mobile app', 'e7d820133d2200ea2faedbd2600afce1688d8e879f29c320f5a48a969f58db4d', '[\"*\"]', '2026-10-03 14:39:42', NULL, '2026-10-03 13:30:26', '2026-10-03 14:39:42'),
(25, 'App\\Models\\User', 14, 'Dahimail mobile app', 'abb62b58583fb279bcac96895343d731da76e8837a8e2e112e05f264047870ec', '[\"*\"]', '2026-10-05 09:30:32', NULL, '2026-10-05 09:02:55', '2026-10-05 09:30:32'),
(26, 'App\\Models\\User', 14, 'Dahimail mobile app', '76fc6102f7e6dc593433589691fb9b613579cbdc8731016075423367515c9bb5', '[\"*\"]', '2026-10-05 10:40:58', NULL, '2026-10-05 09:31:56', '2026-10-05 10:40:58');

-- --------------------------------------------------------

--
-- Table structure for table `pipelines`
--

CREATE TABLE `pipelines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `stripe_monthly_price_id` varchar(255) DEFAULT NULL,
  `stripe_yearly_price_id` varchar(255) DEFAULT NULL,
  `monthly_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `yearly_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`features`)),
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_popular` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `slug`, `stripe_monthly_price_id`, `stripe_yearly_price_id`, `monthly_price`, `yearly_price`, `description`, `features`, `is_active`, `is_popular`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Free', 'free', NULL, NULL, 0.00, 0.00, 'Get started with AI-powered email management', '[\"1 email account\",\"50 AI replies\\/month\",\"100 contacts\",\"Basic inbox\",\"Email support\"]', 1, 0, 1, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(2, 'Starter', 'starter', NULL, NULL, 19.00, 190.00, 'For small teams getting serious about AI communication', '[\"3 email accounts\",\"500 AI replies\\/month\",\"2,500 contacts\",\"3 team members\",\"WhatsApp & Telegram\",\"5 workflows\",\"Basic analytics\",\"Email & chat support\"]', 1, 0, 2, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(3, 'Pro', 'pro', NULL, NULL, 49.00, 490.00, 'For growing businesses with advanced automation needs', '[\"10 email accounts\",\"5,000 AI replies\\/month\",\"25,000 contacts\",\"10 team members\",\"All channels (WhatsApp, SMS, Telegram, Slack, Chat)\",\"Unlimited workflows\",\"Deal pipeline & CRM\",\"A\\/B testing\",\"Advanced analytics\",\"API access\",\"Priority support\"]', 1, 1, 3, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(4, 'Enterprise', 'enterprise', NULL, NULL, 199.00, 1990.00, 'For large teams and agencies with unlimited needs', '[\"Unlimited email accounts\",\"Unlimited AI replies\",\"Unlimited contacts\",\"Unlimited team members\",\"All channels\",\"Dedicated account manager\",\"SLA guarantee\",\"Custom integrations\"]', 1, 0, 4, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(5, 'Free1', 'free1', NULL, NULL, 1.00, 1.00, NULL, '[]', 1, 1, 0, '2026-09-27 08:42:49', '2026-09-28 05:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `plan_features`
--

CREATE TABLE `plan_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `feature_key` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `limit` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan_features`
--

INSERT INTO `plan_features` (`id`, `plan_id`, `feature_key`, `enabled`, `limit`, `created_at`, `updated_at`) VALUES
(1, 1, 'email_accounts', 1, 1, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(2, 1, 'ai_replies', 1, 50, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(3, 1, 'contacts', 1, 100, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(4, 1, 'team_members', 1, 1, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(5, 1, 'storage_mb', 1, 100, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(6, 1, 'campaigns_per_month', 1, 1, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(7, 1, 'workflows', 1, 1, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(8, 1, 'kb_documents', 1, 5, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(9, 1, 'kb_file_size_mb', 1, 5, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(10, 1, 'knowledge_base', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(11, 1, 'campaigns', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(12, 1, 'deal_pipeline', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(13, 1, 'analytics', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(14, 1, 'whatsapp', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(15, 1, 'sms', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(16, 1, 'telegram', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(17, 1, 'slack', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(18, 1, 'live_chat', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(19, 1, 'custom_roles', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(20, 1, 'api_access', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(21, 1, 'white_label', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(22, 1, 'priority_support', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(23, 1, 'sso_saml', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(24, 1, 'temp_mail', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(25, 2, 'email_accounts', 1, 3, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(26, 2, 'ai_replies', 1, 500, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(27, 2, 'contacts', 1, 2500, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(28, 2, 'team_members', 1, 3, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(29, 2, 'storage_mb', 1, 1000, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(30, 2, 'campaigns_per_month', 1, 10, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(31, 2, 'workflows', 1, 5, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(32, 2, 'kb_documents', 1, 25, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(33, 2, 'kb_file_size_mb', 1, 10, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(34, 2, 'knowledge_base', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(35, 2, 'campaigns', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(36, 2, 'deal_pipeline', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(37, 2, 'analytics', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(38, 2, 'whatsapp', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(39, 2, 'sms', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(40, 2, 'telegram', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(41, 2, 'slack', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(42, 2, 'live_chat', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(43, 2, 'custom_roles', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(44, 2, 'api_access', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(45, 2, 'white_label', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(46, 2, 'priority_support', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(47, 2, 'sso_saml', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(48, 2, 'temp_mail', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(49, 3, 'email_accounts', 1, 10, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(50, 3, 'ai_replies', 1, 5000, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(51, 3, 'contacts', 1, 25000, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(52, 3, 'team_members', 1, 10, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(53, 3, 'storage_mb', 1, 10000, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(54, 3, 'campaigns_per_month', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(55, 3, 'workflows', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(56, 3, 'kb_documents', 1, 100, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(57, 3, 'kb_file_size_mb', 1, 25, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(58, 3, 'knowledge_base', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(59, 3, 'campaigns', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(60, 3, 'deal_pipeline', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(61, 3, 'analytics', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(62, 3, 'whatsapp', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(63, 3, 'sms', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(64, 3, 'telegram', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(65, 3, 'slack', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(66, 3, 'live_chat', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(67, 3, 'custom_roles', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(68, 3, 'api_access', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(69, 3, 'white_label', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(70, 3, 'priority_support', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(71, 3, 'sso_saml', 0, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(72, 3, 'temp_mail', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(73, 4, 'email_accounts', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(74, 4, 'ai_replies', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(75, 4, 'contacts', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(76, 4, 'team_members', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(77, 4, 'storage_mb', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(78, 4, 'campaigns_per_month', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(79, 4, 'workflows', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(80, 4, 'kb_documents', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(81, 4, 'kb_file_size_mb', 1, 50, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(82, 4, 'knowledge_base', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(83, 4, 'campaigns', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(84, 4, 'deal_pipeline', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(85, 4, 'analytics', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(86, 4, 'whatsapp', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(87, 4, 'sms', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(88, 4, 'telegram', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(89, 4, 'slack', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(90, 4, 'live_chat', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(91, 4, 'custom_roles', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(92, 4, 'api_access', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(93, 4, 'white_label', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(94, 4, 'priority_support', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(95, 4, 'sso_saml', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(96, 4, 'temp_mail', 1, NULL, '2026-09-27 08:25:21', '2026-09-27 08:25:21'),
(161, 5, 'email_accounts', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(162, 5, 'ai_replies', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(163, 5, 'contacts', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(164, 5, 'team_members', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(165, 5, 'storage_mb', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(166, 5, 'campaigns_per_month', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(167, 5, 'workflows', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(168, 5, 'kb_documents', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(169, 5, 'kb_file_size_mb', 1, 2000000, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(170, 5, 'temp_mail_addresses', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(171, 5, 'temp_mail_lifetime_hours', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(172, 5, 'knowledge_base', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(173, 5, 'campaigns', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(174, 5, 'deal_pipeline', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(175, 5, 'analytics', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(176, 5, 'whatsapp', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(177, 5, 'sms', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(178, 5, 'telegram', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(179, 5, 'slack', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(180, 5, 'live_chat', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(181, 5, 'api_access', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(182, 5, 'priority_support', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(183, 5, 'custom_roles', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(184, 5, 'white_label', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(185, 5, 'sso_saml', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(186, 5, 'temp_mail', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(187, 5, 'ai_own_key', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(188, 5, 'ai_per_channel', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(189, 5, 'ai_auto_escalation', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(190, 5, 'sms_campaigns', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(191, 5, 'email_templates', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(192, 5, 'workflow_in_app_notify', 1, NULL, '2026-09-28 05:16:43', '2026-09-28 05:16:43'),
(193, 1, 'emails_per_month', 1, 100, '2026-09-28 11:44:42', '2026-09-28 11:44:42');

-- --------------------------------------------------------

--
-- Table structure for table `recording_consents`
--

CREATE TABLE `recording_consents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `pid` bigint(20) UNSIGNED NOT NULL,
  `response` enum('pending','accepted','declined') NOT NULL DEFAULT 'pending',
  `responded_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recording_files`
--

CREATE TABLE `recording_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `meeting_id` bigint(20) UNSIGNED NOT NULL,
  `uploaded_by` bigint(20) UNSIGNED DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_mime` varchar(120) DEFAULT NULL,
  `file_size` bigint(20) UNSIGNED DEFAULT NULL,
  `duration` int(10) UNSIGNED DEFAULT NULL,
  `has_video` tinyint(1) NOT NULL DEFAULT 0,
  `audience` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recording_sessions`
--

CREATE TABLE `recording_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meeting_id` bigint(20) UNSIGNED NOT NULL,
  `mode` tinyint(3) UNSIGNED NOT NULL,
  `status` enum('pending','recording','stopped','declined','expired','failed') NOT NULL DEFAULT 'recording',
  `reason` varchar(40) DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT 0,
  `started_by_pid` bigint(20) UNSIGNED DEFAULT NULL,
  `started_by_user` bigint(20) UNSIGNED DEFAULT NULL,
  `recorder_pid` bigint(20) UNSIGNED DEFAULT NULL,
  `recorder_user` bigint(20) UNSIGNED DEFAULT NULL,
  `requested_at` timestamp NULL DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `stopped_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recording_sessions`
--

INSERT INTO `recording_sessions` (`id`, `meeting_id`, `mode`, `status`, `reason`, `private`, `started_by_pid`, `started_by_user`, `recorder_pid`, `recorder_user`, `requested_at`, `started_at`, `stopped_at`, `created_at`, `updated_at`) VALUES
(1, 31, 1, 'recording', NULL, 0, 39, 14, 40, 3, '2026-10-05 09:34:03', '2026-10-05 09:34:03', NULL, '2026-10-05 09:34:03', '2026-10-05 09:34:03'),
(2, 32, 1, 'recording', NULL, 0, 41, 3, 41, 3, '2026-10-05 09:52:36', '2026-10-05 09:52:36', NULL, '2026-10-05 09:52:36', '2026-10-05 09:52:37');

-- --------------------------------------------------------

--
-- Table structure for table `reserved_usernames`
--

CREATE TABLE `reserved_usernames` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `match` varchar(10) NOT NULL DEFAULT 'exact',
  `note` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(2, 'Admin', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(3, 'Moderator', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(4, 'Support', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20'),
(5, 'User', 'web', '2026-09-27 08:25:20', '2026-09-27 08:25:20');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(19, 3),
(20, 1),
(20, 2),
(21, 1),
(21, 2),
(22, 1),
(22, 2),
(23, 1),
(23, 2),
(24, 1),
(24, 2),
(25, 1),
(25, 2),
(25, 3),
(26, 1),
(26, 2),
(27, 1),
(27, 2),
(28, 1),
(28, 2),
(29, 1),
(29, 2),
(30, 1),
(30, 2),
(31, 1),
(31, 2),
(32, 1),
(32, 2),
(33, 1),
(33, 2),
(34, 1),
(34, 2),
(35, 1),
(35, 2),
(35, 3),
(35, 4),
(36, 1),
(36, 2),
(36, 3),
(36, 4),
(37, 1),
(37, 2),
(37, 3),
(37, 4),
(38, 1),
(38, 2),
(39, 1),
(39, 2),
(40, 1),
(40, 2),
(41, 1),
(41, 2),
(41, 3),
(42, 1),
(42, 2),
(43, 1),
(43, 2),
(44, 1),
(44, 2),
(45, 1),
(45, 2),
(46, 1),
(46, 2),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 1),
(50, 2),
(51, 1),
(51, 2),
(52, 1),
(52, 2),
(53, 1),
(53, 2),
(54, 1),
(54, 2),
(55, 1),
(55, 2),
(56, 1),
(56, 2),
(57, 1),
(57, 2),
(58, 1),
(58, 2),
(59, 1),
(59, 2),
(60, 1),
(60, 2),
(61, 1),
(62, 1),
(62, 2),
(63, 1),
(64, 1),
(64, 2),
(65, 1),
(65, 2),
(66, 1),
(66, 2),
(67, 1),
(67, 2),
(68, 1),
(68, 2),
(68, 3),
(69, 1),
(69, 2),
(70, 1),
(70, 2),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(73, 3),
(73, 4),
(74, 1),
(75, 1),
(75, 2),
(76, 1),
(76, 2);

-- --------------------------------------------------------

--
-- Table structure for table `security_audit_logs`
--

CREATE TABLE `security_audit_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event_type` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `user_agent` text DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `logged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `segments`
--

CREATE TABLE `segments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `rules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`rules`)),
  `is_dynamic` tinyint(1) NOT NULL DEFAULT 1,
  `contacts_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sent_messages`
--

CREATE TABLE `sent_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `recipients` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `ip_address` varchar(64) DEFAULT NULL,
  `device_hash` varchar(64) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1l4EFNXgrLA9OEpi0hl9UQCsXNu1NPHZiqXp66ez', NULL, '43.164.3.182', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOG5SS0hGZDZFckNvRmNNYmdhRjhmSXFPUkRpeFdzVkxXUkIwWERHZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly9kYWhpbWFpbC5jb20iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1791194622),
('1tep7EvVa5YK2iy0A8cZ59LSpD8H54bA9k2dZBO5', NULL, '169.58.63.131', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDdnTml6UWRNS1IxOHpqSlFWTXRFY2VhdndCTkRiaXhSOEEzT2lENiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vZGFoaW1haWwuY29tIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1791207599),
('3oNmhdd07MPwJKNTo51hWH31BR3FhuWyTe6g4WMt', NULL, '43.157.174.69', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEpFeUxNY2NTMElUSjVUTDRRT0pHZEN1bFk4YWticmhoUEg4dlh6NSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjM6Imh0dHA6Ly93d3cuZGFoaW1haWwuY29tIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1791205703),
('5juiUalESlgsZ0NBKy2pdjj8AC1i4JG0zHqaztTU', NULL, '72.1.138.168', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODNqcnpRTW9wNjE4M0VPWlpOOUdkM3VhcE01OVd1VHF3U0cxNnZIUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZGFoaW1haWwuY29tL3doeS11cyI7czo1OiJyb3V0ZSI7czo2OiJ3aHktdXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1791206974),
('6H1wCGCPy3h3t0rsRajCP3sjKMcP96boiuEj0O4G', NULL, '94.154.43.180', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2FXcWVsZnZVOUdLZ1R3aERyeWRzWkVwUjNHTmlDeEh6UFlFdUNGbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vZGFoaW1haWwuY29tIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1791200492),
('E86mABhBNwrhNhjHGWygjzzukHs3SmPyyOMVK6aO', NULL, '8.208.71.132', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZlRPdlVMa281RkxhbWpkZDkzSmlJUHVTb2ZVMjBWUGhlNFNVV1FDRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly9kYWhpbWFpbC5jb20iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1791198290),
('eILBzY7wVNFT1UBm0xhhaWey3U2CnxUn3NGzCBW1', 17, '103.102.159.193', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZTM3UElKajBYTVhyNmx5bThzeGhIR0JxZkVVaTFINUJrUHJqZWN2NiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vZGFoaW1haWwuY29tL2luYm94IjtzOjU6InJvdXRlIjtzOjU6ImluYm94Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo3OiJtYWlsYm94IjthOjE6e3M6Njoic2VjcmV0IjtzOjIwMDoiZXlKcGRpSTZJa1pGWjFReU5qSmpLMUZ5UlRkVU1uQmxaMUZoT0hjOVBTSXNJblpoYkhWbElqb2lSV2RQZEU1emVHaG1WRFpCVkRFNU0yMHdURFEyVVQwOUlpd2liV0ZqSWpvaU5XTXdNVGc1WWpRMU9EWTJZekJoWkdWbE1qbGpNek15WWpsaE56TmhaVFJrWkdNeVlXRXhOR0ZsTldFeE1EazFaRFkyWWpVMlpHSmxOVFE0Tm1FeFppSXNJblJoWnlJNklpSjkiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxNzt9', 1791200691),
('FIyPqb1KG2b5yi8XjTxXoWivS09HGNWUZxd8TJL0', NULL, '162.14.66.219', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicFVxSlgwcDlRZ3Y1VUc3YmJqZTVYV1Y2dGd5R01aeDlEeGY4N0FWQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjM6Imh0dHA6Ly93d3cuZGFoaW1haWwuY29tIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1791197912),
('HiZQras29UTDLKrTrpYYJrndGBVDqYCUtsjmalBM', NULL, '169.58.63.131', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWcydUltWks0VUVUcHJKT0MyQVN4YVM2cWI4a2wxS29pRXNGejZ1OCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vZGFoaW1haWwuY29tIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1791202743),
('mi68kLtIRERIXui4NHrEO63OvaX30ILO02I36Xw8', NULL, '49.51.183.15', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHY3SnNMVEVWNzRpZUppOEg1bGY1b21SaU5XYkxiTzFGdTBYeDl6MyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjM6Imh0dHA6Ly93d3cuZGFoaW1haWwuY29tIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1791202133),
('ojm8CBIoMF48RznQOqYSNQAUTlCZDh31Q2PwfCoA', NULL, '167.71.209.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnlSWkN1a0w0WXhKSzJKTkd5NkN6dUtpU3lwSEVpb3V3VTRkQzRLbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly9kYWhpbWFpbC5jb20iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1791196123),
('POBzHo7fSJ9rT3IuEJ0IFO3kANGzdb3hGRTZHE5H', NULL, '66.249.93.98', 'Google-Lens', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTk1S1JVV29ncGs4T25YUHdEOUJBd1Mxd1Fod2xiS0l0eGRBYnpiMyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly9kYWhpbWFpbC5jb20iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1791194572),
('QKlVVHEFuRz7UcQAKvAFgasAZFGIyaF7fNVPVasp', NULL, '2001:4860:7:161b::fd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVjNRanRxTWxBTFR3SEtUUW1yM1FOZVBGanRlRnE3VVdHb21ad0dBTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vZGFoaW1haWwuY29tL2xvZ2luIjtzOjU6InJvdXRlIjtzOjU6ImxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1791194573),
('qZtc8lKyRaWgYkEWzI2lPnHKdt92faAbieADObSF', NULL, '43.135.115.233', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVG03S0pweW9GS0JnbjMzZUs3ODZqUjUyeVRsd2ZkUHVlbUpXOEZkcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjM6Imh0dHA6Ly93d3cuZGFoaW1haWwuY29tIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1791194946),
('r13XJGXgLuTQROZX62O6iZ6zvLRzE8alxjzsUgjU', 3, '103.102.159.193', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMzRGZk5wM0tzaU9qMnFhQVhKY2JMWkFwMk5MU1ZEWDkwTEw0TWdXRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTM6Imh0dHBzOi8vZGFoaW1haWwuY29tL2ZyaWVuZHMvYXBpL21lc3NhZ2VzLzE0P2FmdGVyPTU2JnNpbmNlPTIwMjYtMTAtMDVUMTElM0E1NiUzQTEyJTJCMDAlM0EwMCI7czo1OiJyb3V0ZSI7Tjt9czo3OiJtYWlsYm94IjthOjE6e3M6Njoic2VjcmV0IjtzOjIwMDoiZXlKcGRpSTZJa05oVHpOaGEwOUdReTkwYkRVNFJsb3dUMEZvWlhjOVBTSXNJblpoYkhWbElqb2lNVzUxZW1keGVUaDBUVGR1UmtaRllXZDNPRGhWUVQwOUlpd2liV0ZqSWpvaU9HTTVabU00TTJReVlXSm1aRE16T1dFM00ySTBNbVpoTW1Oak1EQmtNMk0xTldFMU5XVmhNR1F6TW1Fd1pUTTJNak5sWWpNeU5tVmlNREpoWWprek1TSXNJblJoWnlJNklpSjkiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO30=', 1791201375),
('Rla5Hr4PJG83NEOFW9GbWQHzfu4L22nVHrSFyX0P', NULL, '103.102.159.193', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREM1amhuZE9oV1d3RlRDZHUwNkJydEIwbkxhSDFqYmo1T0J5ZngydCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vZGFoaW1haWwuY29tL3JlZ2lzdGVyIjtzOjU6InJvdXRlIjtzOjg6InJlZ2lzdGVyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1791194666),
('s1mEL2cvcBpmuamfe8vkcKqwHK3W9UtKy4xCaONy', NULL, '103.92.46.36', 'Mozilla/5.0 (compatible; Googlebot/2.1 +http://www.googlebot.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTBwWktiRk1pM2NpNzJibmpxMGM4c3VCaHJkVnRNQUpBQTY1MTh1aSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly9kYWhpbWFpbC5jb20iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1791197099),
('uDMmr3IK6jLw2FNZypTCekwKNZjS1QsiKhPvUB3v', NULL, '43.165.198.144', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEFGMll3amtRREVYY05OYkFLV29tNGQ0UWpaQTFPU0VtMnhEQjNoUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly9kYWhpbWFpbC5jb20iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1791205406),
('vE9hVPrVxYvdJzf3lnxkRbo5KgOTKz4NJ3HYFqKU', NULL, '2001:4860:7:1622::fa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWN5MTNhcHEzT3dMTVJxSENkczFMM1dUZ0RLYW54RmVGUk1tZjlJTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vd3d3LmRhaGltYWlsLmNvbSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1791194573),
('VxjSsunYEVmjtwxUxEra81sJs3LYZGawNbiY2yJP', NULL, '49.51.233.95', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkhDTXNtSGQ0RlhJZVlqRVU4enBFbXliNTVZUTRtUHhINXpFZVNtZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjM6Imh0dHA6Ly93d3cuZGFoaW1haWwuY29tIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1791202096),
('VzKsP38rPeIaciRkMymERssdn6go3ULOdUjvZe8H', NULL, '66.249.93.96', 'Google-Lens', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTElxWWR4T1dxNzdRbFlnMzBUeFFBRHV6czlmNWxTNllYRUxXU2tvQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly9kYWhpbWFpbC5jb20iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1791194573),
('wCjlaDEm7NmK42uPyVP74YDN7gApg48L6tcFEfXJ', NULL, '169.58.63.131', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoick92RG5Wa3JRUDRVUUpmY3NMMUJZb3Z0U0pVaFozMlpZcWoxVmxtayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vZGFoaW1haWwuY29tIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1791206689),
('wzah0GbBBVqIdCVmdIsv4UvzHVefhczYtkXGhKZW', NULL, '146.70.194.222', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1NxaGZ6bXozZE9sV0cwUGZ2cm95VlhibHVuaTRrQmxTQlV1TUZIUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly9kYWhpbWFpbC5jb20iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1791204969),
('xFea50R7zPMCIVjWgH4GeGvv0HQaKdYy1c7NS9Gu', NULL, '169.58.63.131', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEMyR1dZdjBKSWFCSTVCbGZhc0N2UXFGUEltYWdvaGZQRXNLbEwwSCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vZGFoaW1haWwuY29tIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1791205790),
('ycRDzvjZitGfQpavI6rX2zPUMx76T8r7IHW1E0zG', NULL, '169.58.63.131', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRFdJcXNCZzMxYm1IVFJZODZ3M2taZmlUMDRDQ2hMT0JGUkRQaFJxUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vZGFoaW1haWwuY29tIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1791203831),
('ycwyBLXwXfw7z23tDlmmgZjZmcIsC1XKoTfnb8Fi', NULL, '49.51.166.228', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVpCTVY1QXRTd1BnMVdyTDBlYWJXRDBWU0FxZWIxbTNzWUVrVTI1USI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly9kYWhpbWFpbC5jb20iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1791199592);

-- --------------------------------------------------------

--
-- Table structure for table `social_accounts`
--

CREATE TABLE `social_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `provider` varchar(20) NOT NULL,
  `provider_id` varchar(255) NOT NULL,
  `token` text DEFAULT NULL,
  `refresh_token` text DEFAULT NULL,
  `token_expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_subscription_id` varchar(255) DEFAULT NULL,
  `stripe_customer_id` varchar(255) DEFAULT NULL,
  `status` enum('active','trialing','past_due','canceled','incomplete','paused') NOT NULL DEFAULT 'active',
  `billing_cycle` enum('monthly','yearly') NOT NULL DEFAULT 'monthly',
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `current_period_start` timestamp NULL DEFAULT NULL,
  `current_period_end` timestamp NULL DEFAULT NULL,
  `canceled_at` timestamp NULL DEFAULT NULL,
  `grace_period_ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `workspace_id`, `plan_id`, `stripe_subscription_id`, `stripe_customer_id`, `status`, `billing_cycle`, `trial_ends_at`, `current_period_start`, `current_period_end`, `canceled_at`, `grace_period_ends_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, NULL, NULL, 'trialing', 'monthly', '2026-10-11 08:44:33', '2026-09-27 08:44:33', '2026-10-27 09:44:33', NULL, NULL, '2026-09-27 08:44:33', '2026-09-27 08:44:33', NULL),
(2, 3, 1, NULL, NULL, 'trialing', 'monthly', '2026-10-11 08:45:22', '2026-09-27 08:45:22', '2026-10-27 09:45:22', NULL, NULL, '2026-09-27 08:45:22', '2026-09-27 08:45:22', NULL),
(3, 4, 1, NULL, NULL, 'canceled', 'monthly', '2026-10-11 12:05:02', '2026-09-27 12:05:02', '2026-10-27 13:05:02', '2026-09-28 11:47:49', NULL, '2026-09-27 12:05:02', '2026-09-28 11:47:49', NULL),
(4, 5, 1, NULL, NULL, 'trialing', 'monthly', '2026-10-11 12:55:19', '2026-09-27 12:55:19', '2026-10-27 13:55:19', NULL, NULL, '2026-09-27 12:55:19', '2026-09-27 12:55:19', NULL),
(5, 6, 1, NULL, NULL, 'trialing', 'monthly', '2026-10-11 13:09:17', '2026-09-27 13:09:17', '2026-10-27 14:09:17', NULL, NULL, '2026-09-27 13:09:17', '2026-09-27 13:09:17', NULL),
(6, 7, 1, NULL, NULL, 'trialing', 'monthly', '2026-10-11 13:22:34', '2026-09-27 13:22:34', '2026-10-27 14:22:34', NULL, NULL, '2026-09-27 13:22:34', '2026-09-27 13:22:34', NULL),
(7, 8, 1, NULL, NULL, 'trialing', 'monthly', '2026-10-12 05:15:10', '2026-09-28 05:15:10', '2026-10-28 06:15:10', NULL, NULL, '2026-09-28 05:15:10', '2026-09-28 05:15:10', NULL),
(8, 4, 5, NULL, NULL, 'active', 'monthly', NULL, '2026-09-28 11:47:49', '2026-10-28 12:47:49', NULL, NULL, '2026-09-28 11:47:49', '2026-09-28 11:47:49', NULL),
(9, 9, 1, NULL, NULL, 'trialing', 'monthly', '2026-10-13 04:46:43', '2026-09-29 04:46:43', '2026-10-29 05:46:43', NULL, NULL, '2026-09-29 04:46:43', '2026-09-29 04:46:43', NULL),
(10, 10, 1, NULL, NULL, 'trialing', 'monthly', '2026-10-14 03:53:32', '2026-09-30 03:53:32', '2026-10-30 04:53:32', NULL, NULL, '2026-09-30 03:53:32', '2026-09-30 03:53:32', NULL),
(11, 11, 1, NULL, NULL, 'trialing', 'monthly', '2026-10-14 04:18:58', '2026-09-30 04:18:58', '2026-10-30 05:18:58', NULL, NULL, '2026-09-30 04:18:58', '2026-09-30 04:18:58', NULL),
(12, 12, 1, NULL, NULL, 'trialing', 'monthly', '2026-10-14 11:08:48', '2026-09-30 11:08:48', '2026-10-30 12:08:48', NULL, NULL, '2026-09-30 11:08:48', '2026-09-30 11:08:48', NULL),
(13, 13, 1, NULL, NULL, 'trialing', 'monthly', '2026-10-15 04:40:05', '2026-10-01 04:40:05', '2026-11-01 05:40:05', NULL, NULL, '2026-10-01 04:40:05', '2026-10-01 04:40:05', NULL),
(14, 14, 1, NULL, NULL, 'trialing', 'monthly', '2026-10-16 12:05:25', '2026-10-02 12:05:25', '2026-11-02 13:05:25', NULL, NULL, '2026-10-02 12:05:25', '2026-10-02 12:05:25', NULL),
(15, 15, 1, NULL, NULL, 'trialing', 'monthly', '2026-10-16 12:25:51', '2026-10-02 12:25:51', '2026-11-02 13:25:51', NULL, NULL, '2026-10-02 12:25:51', '2026-10-02 12:25:51', NULL),
(16, 16, 1, NULL, NULL, 'trialing', 'monthly', '2026-10-16 12:53:00', '2026-10-02 12:53:00', '2026-11-02 13:53:00', NULL, NULL, '2026-10-02 12:53:00', '2026-10-02 12:53:00', NULL),
(17, 17, 1, NULL, NULL, 'trialing', 'monthly', '2026-10-19 08:05:34', '2026-10-05 08:05:34', '2026-11-05 09:05:34', NULL, NULL, '2026-10-05 08:05:34', '2026-10-05 08:05:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `group` varchar(255) NOT NULL DEFAULT 'general',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `key`, `value`, `group`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'Dahimail', 'general', NULL, '2026-09-27 08:26:46'),
(2, 'site_tagline', 'AI-Powered Communication Automation', 'general', NULL, '2026-09-27 08:26:46'),
(3, 'site_description', 'Dahimail is a next-generation AI-powered communication automation platform.', 'general', NULL, '2026-09-27 08:26:46'),
(4, 'default_language', 'en', 'general', NULL, '2026-09-27 08:26:46'),
(5, 'timezone', 'UTC', 'general', NULL, '2026-09-27 08:26:46'),
(6, 'default_currency', 'USD', 'general', NULL, '2026-09-27 08:26:46'),
(7, 'support_email', 'support@dahimail.com', 'general', NULL, '2026-09-27 08:26:46'),
(8, 'support_phone', '', 'general', NULL, '2026-09-27 08:26:46'),
(9, 'mail_driver', 'smtp', 'email', NULL, '2026-09-27 08:38:12'),
(10, 'smtp_host', 'mail.dahify.com', 'email', NULL, '2026-09-27 08:38:12'),
(11, 'smtp_port', '587', 'email', NULL, '2026-09-27 08:38:12'),
(12, 'smtp_username', 'noreply@dahimail.com', 'email', NULL, '2026-09-27 08:38:12'),
(13, 'smtp_password', 'eyJpdiI6IjRNbGlmV2lNbDJlYjA5U2lTOFoxckE9PSIsInZhbHVlIjoiQkVzY2RGVkJDd0F2MDN3WHRIaFJNdk80M0g1ZjVBMWdUK0xmUFlXQ2dLUT0iLCJtYWMiOiJmMWIwMWQ1NzdhNGFjMzU4MDcwMzVmNzU1ZjFlN2ZmYzc0NTEwMmFmODQ3YTlkZjgwNjQxNTM4NGJjMTg3NjY3IiwidGFnIjoiIn0=', 'email', NULL, '2026-09-27 08:38:12'),
(14, 'smtp_encryption', 'tls', 'email', NULL, '2026-09-27 08:38:12'),
(15, 'smtp_from_address', 'noreply@dahimail.com', 'email', NULL, '2026-09-27 08:38:12'),
(16, 'smtp_from_name', 'Dahimail', 'email', NULL, '2026-09-27 08:38:12'),
(17, 'registration_enabled', 'true', 'auth', NULL, '2026-09-27 08:27:56'),
(18, 'social_login_enabled', 'false', 'auth', NULL, '2026-09-27 08:27:56'),
(19, 'require_email_verification', 'true', 'auth', NULL, '2026-09-27 08:27:56'),
(20, 'default_plan', 'free', 'auth', NULL, '2026-09-27 08:27:56'),
(21, 'trial_days', '14', 'auth', NULL, '2026-09-27 08:27:56'),
(22, 'track_one_to_one_emails', '1', 'general', NULL, '2026-09-28 12:11:58'),
(23, 'favicon', 'settings/branding/a4EsTX490KUer7Jclpzm8PK3WUsbMNmRO3FkHkux.png', 'branding', NULL, '2026-10-01 05:22:13'),
(24, 'primary_color', '#4f46e5', 'branding', NULL, '2026-10-01 05:22:13'),
(25, 'secondary_color', '#7c3aed', 'branding', NULL, '2026-10-01 05:22:13'),
(26, 'accent_color', '#06b6d4', 'branding', NULL, '2026-10-01 05:22:13'),
(27, 'phone_registration', 'optional', 'phone', NULL, '2026-10-01 12:42:56'),
(28, 'phone_verification_enabled', '1', 'phone', NULL, '2026-10-01 12:42:56'),
(29, 'phone_verify_sms', '0', 'phone', NULL, '2026-10-01 12:42:56'),
(30, 'phone_verify_whatsapp', '0', 'phone', NULL, '2026-10-01 12:42:56'),
(31, 'whatsapp_otp_button', '0', 'phone', NULL, '2026-10-01 12:42:56'),
(32, 'whatsapp_otp_template', '', 'phone', NULL, '2026-10-01 12:42:56'),
(33, 'whatsapp_otp_language', 'en_US', 'phone', NULL, '2026-10-01 12:42:56'),
(34, 'phone_discovery_unverified', '1', 'phone', NULL, '2026-10-01 12:42:56'),
(35, 'send_new_days', '7', 'sending', NULL, '2026-10-02 03:55:17'),
(36, 'send_established_days', '30', 'sending', NULL, '2026-10-02 03:55:17'),
(37, 'send_new_daily', '50', 'sending', NULL, '2026-10-02 03:55:17'),
(38, 'send_established_daily', '150', 'sending', NULL, '2026-10-02 03:55:17'),
(39, 'send_trusted_daily', '250', 'sending', NULL, '2026-10-02 03:55:17'),
(40, 'send_hourly', '50', 'sending', NULL, '2026-10-02 03:55:17'),
(41, 'send_weekly', '400', 'sending', NULL, '2026-10-02 03:55:17'),
(42, 'send_yearly', '5000', 'sending', NULL, '2026-10-02 03:55:17'),
(43, 'send_ip_daily', '150', 'sending', NULL, '2026-10-02 03:55:17'),
(44, 'send_device_daily', '200', 'sending', NULL, '2026-10-02 03:55:17'),
(45, 'friends_call_recording', '0', 'friends', '2026-10-05 10:11:48', '2026-10-05 10:11:48'),
(46, 'rec_mode', '1', 'friends', '2026-10-05 10:11:55', '2026-10-05 09:29:47'),
(47, 'friends_chat_enabled', '1', 'friends', NULL, '2026-10-05 09:29:47'),
(48, 'friends_files_enabled', '1', 'friends', NULL, '2026-10-05 09:29:47'),
(49, 'friends_calls_enabled', '1', 'friends', NULL, '2026-10-05 09:29:47'),
(50, 'rec_consent_seconds', '30', 'friends', NULL, '2026-10-05 09:29:47'),
(51, 'rec_max_mb', '100', 'friends', NULL, '2026-10-05 09:29:47'),
(52, 'rec_cfg_1', '{\"button\":\"hidden\",\"icon\":true,\"banner\":true,\"chime\":false}', 'friends', NULL, '2026-10-05 09:29:47'),
(53, 'rec_cfg_2', '{\"button\":\"all\",\"icon\":true,\"banner\":true,\"chime\":true}', 'friends', NULL, '2026-10-05 09:29:47'),
(54, 'rec_cfg_3', '{\"button\":\"all\",\"icon\":true,\"banner\":true,\"chime\":true}', 'friends', NULL, '2026-10-05 09:29:47'),
(55, 'rec_cfg_4', '{\"button\":\"host\",\"icon\":true,\"banner\":true,\"chime\":true}', 'friends', NULL, '2026-10-05 09:29:47'),
(56, 'rec_cfg_5', '{\"button\":\"all\",\"icon\":true,\"banner\":true,\"chime\":false}', 'friends', NULL, '2026-10-05 09:29:47'),
(57, 'friends_file_max_mb', '10', 'friends', NULL, '2026-10-05 09:29:47'),
(58, 'friends_stun_url', 'stun:stun.l.google.com:19302', 'friends', NULL, '2026-10-05 09:29:47'),
(59, 'friends_turn_url', '', 'friends', NULL, '2026-10-05 09:29:47'),
(60, 'friends_turn_user', '', 'friends', NULL, '2026-10-05 09:29:47');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(7) NOT NULL DEFAULT '#6B7280',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_mail_addresses`
--

CREATE TABLE `temp_mail_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `temp_mail_domain_id` bigint(20) UNSIGNED NOT NULL,
  `local_part` varchar(64) NOT NULL,
  `full_address` varchar(320) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `messages_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `conversation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expires_at` timestamp NOT NULL,
  `last_received_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_mail_domains`
--

CREATE TABLE `temp_mail_domains` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `imap_host` text DEFAULT NULL,
  `imap_port` smallint(5) UNSIGNED NOT NULL DEFAULT 993,
  `imap_username` text DEFAULT NULL,
  `imap_password` text DEFAULT NULL,
  `imap_encryption` varchar(10) NOT NULL DEFAULT 'ssl',
  `status` enum('active','inactive','error') NOT NULL DEFAULT 'inactive',
  `error_message` varchar(500) DEFAULT NULL,
  `max_addresses` int(10) UNSIGNED DEFAULT NULL,
  `default_lifetime_hours` int(10) UNSIGNED NOT NULL DEFAULT 24,
  `blocked_patterns` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`blocked_patterns`)),
  `allowed_patterns` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`allowed_patterns`)),
  `last_synced_at` timestamp NULL DEFAULT NULL,
  `last_synced_uid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_name` varchar(150) NOT NULL,
  `client_image` varchar(255) DEFAULT NULL,
  `client_position` varchar(150) DEFAULT NULL,
  `review` text NOT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `client_name`, `client_image`, `client_position`, `review`, `rating`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Sarah Chen', NULL, 'Head of Customer Success, TechFlow', 'Dahimail cut our response time from hours to minutes. The AI suggestions are eerily accurate — it feels like having a senior support rep available 24/7.', 5, 1, NULL, '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(2, 'Marcus Rivera', NULL, 'CEO & Founder, GrowthStack', 'We switched from three different tools to Dahimail. The unified inbox alone saved us 15 hours per week. The workflow automation is the cherry on top.', 5, 1, NULL, '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(3, 'Emily Watson', NULL, 'Marketing Director, Vertex Labs', 'The campaign builder is miles ahead. A/B testing with AI-optimized subject lines increased our open rates by 34% in the first month.', 5, 1, NULL, '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(4, 'Raj Patel', NULL, 'Lead Engineer, CloudNine', 'As a developer, I appreciate the clean API and webhook system. Integration took less than a day. The documentation is excellent.', 5, 1, NULL, '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(5, 'Amanda Foster', NULL, 'VP of Sales, Horizon SaaS', 'Our sales team lives in Dahimail now. CRM integration with email tracking and lead scoring helped us close 28% more deals this quarter.', 5, 1, NULL, '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(6, 'Kenji Nakamura', NULL, 'Operations Manager, Nexus Digital', 'Managing WhatsApp, email, and Telegram from one place — with AI-drafted replies — is pure magic.', 5, 1, NULL, '2026-09-27 08:25:22', '2026-09-27 08:25:22');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `workspace_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `status` enum('open','in_progress','waiting','resolved','closed') NOT NULL DEFAULT 'open',
  `priority` enum('low','normal','high','urgent') NOT NULL DEFAULT 'normal',
  `category` varchar(255) DEFAULT NULL,
  `assigned_to` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `body` text NOT NULL,
  `is_admin_reply` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tracking_events`
--

CREATE TABLE `tracking_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('open','click','bounce','unsubscribe','spam_complaint') NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  `email_client` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tracking_events`
--

INSERT INTO `tracking_events` (`id`, `message_id`, `type`, `url`, `ip_address`, `user_agent`, `device`, `email_client`, `city`, `country`, `created_at`, `updated_at`) VALUES
(1, 8, 'open', NULL, '66.249.87.194', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246 Mozilla/5.0', 'desktop', 'Edge', NULL, NULL, '2026-09-27 14:18:07', '2026-09-27 14:18:07'),
(2, 9, 'open', NULL, '66.249.87.193', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246 Mozilla/5.0', 'desktop', 'Edge', NULL, NULL, '2026-09-28 04:41:42', '2026-09-28 04:41:42'),
(3, 10, 'open', NULL, '66.249.87.193', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246 Mozilla/5.0', 'desktop', 'Edge', NULL, NULL, '2026-09-28 11:48:48', '2026-09-28 11:48:48'),
(4, 11, 'open', NULL, '66.249.87.193', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246 Mozilla/5.0', 'desktop', 'Edge', NULL, NULL, '2026-09-28 12:09:39', '2026-09-28 12:09:39'),
(5, 12, 'open', NULL, '66.249.87.194', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246 Mozilla/5.0', 'desktop', 'Edge', NULL, NULL, '2026-09-28 12:12:32', '2026-09-28 12:12:32'),
(6, 13, 'open', NULL, '66.249.87.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246 Mozilla/5.0', 'desktop', 'Edge', NULL, NULL, '2026-09-28 12:19:09', '2026-09-28 12:19:09'),
(7, 19, 'open', NULL, '66.249.87.194', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246 Mozilla/5.0', 'desktop', 'Edge', NULL, NULL, '2026-09-29 16:04:08', '2026-09-29 16:04:08'),
(8, 23, 'open', NULL, '66.249.87.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246 Mozilla/5.0', 'desktop', 'Edge', NULL, NULL, '2026-09-30 04:19:52', '2026-09-30 04:19:52'),
(9, 33, 'open', NULL, '66.249.91.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246 Mozilla/5.0', 'desktop', 'Edge', NULL, NULL, '2026-10-01 13:57:34', '2026-10-01 13:57:34'),
(10, 36, 'open', NULL, '2a02:c206:2238:2644::1', 'Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0 Mobile Safari/537.36', 'mobile', 'Chrome', NULL, NULL, '2026-10-02 12:38:35', '2026-10-02 12:38:35'),
(11, 38, 'open', NULL, '2a02:c206:2238:2644::1', 'Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0 Mobile Safari/537.36', 'mobile', 'Chrome', NULL, NULL, '2026-10-02 12:39:10', '2026-10-02 12:39:10');

-- --------------------------------------------------------

--
-- Table structure for table `two_factor_attempts`
--

CREATE TABLE `two_factor_attempts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `locked_until` timestamp NULL DEFAULT NULL,
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usage_records`
--

CREATE TABLE `usage_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `feature_key` varchar(255) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `period` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usage_records`
--

INSERT INTO `usage_records` (`id`, `workspace_id`, `feature_key`, `quantity`, `period`, `created_at`, `updated_at`) VALUES
(1, 4, 'emails_sent', 11, '2026-09', '2026-09-27 12:36:03', '2026-09-29 16:04:05'),
(2, 6, 'emails_sent', 2, '2026-09', '2026-09-27 13:18:08', '2026-09-27 13:18:08'),
(3, 11, 'emails_sent', 1, '2026-09', '2026-09-30 04:19:49', '2026-09-30 04:19:49'),
(4, 12, 'ai_replies', 1, '2026-09', '2026-09-30 12:01:18', '2026-09-30 12:01:18'),
(5, 4, 'emails_sent', 1, '2026-10', '2026-10-01 13:57:32', '2026-10-01 13:57:32'),
(6, 14, 'emails_sent', 1, '2026-10', '2026-10-02 12:38:13', '2026-10-02 12:38:13'),
(7, 15, 'emails_sent', 1, '2026-10', '2026-10-02 12:38:55', '2026-10-02 12:38:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `recovery_phrase_hash` text DEFAULT NULL,
  `signup_ip` varchar(45) DEFAULT NULL,
  `last_login_ip` varchar(45) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `phone_key` varchar(16) DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `discoverable` tinyint(1) NOT NULL DEFAULT 0,
  `avatar_path` varchar(255) DEFAULT NULL,
  `timezone` varchar(50) NOT NULL DEFAULT 'UTC',
  `locale` varchar(10) NOT NULL DEFAULT 'en',
  `language` varchar(10) NOT NULL DEFAULT 'en',
  `currency_code` varchar(5) NOT NULL DEFAULT 'USD',
  `notification_preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`notification_preferences`)),
  `status` enum('active','suspended','banned','pending_deletion') NOT NULL DEFAULT 'active',
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `admin_role` enum('super_admin','admin','support') DEFAULT NULL,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `suspension_reason` varchar(255) DEFAULT NULL,
  `deletion_requested_at` timestamp NULL DEFAULT NULL,
  `referral_code` varchar(20) DEFAULT NULL,
  `referred_by` varchar(20) DEFAULT NULL,
  `two_factor_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `two_factor_secret` varchar(255) DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_method` enum('totp','sms') DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `active_workspace_id` bigint(20) UNSIGNED DEFAULT NULL,
  `force_password_reset` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `name`, `email`, `username`, `email_verified_at`, `password`, `recovery_phrase_hash`, `signup_ip`, `last_login_ip`, `phone`, `phone_key`, `phone_verified_at`, `discoverable`, `avatar_path`, `timezone`, `locale`, `language`, `currency_code`, `notification_preferences`, `status`, `is_admin`, `admin_role`, `suspended_at`, `suspension_reason`, `deletion_requested_at`, `referral_code`, `referred_by`, `two_factor_enabled`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_method`, `two_factor_confirmed_at`, `active_workspace_id`, `force_password_reset`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '9857dbed-ddab-4a52-a2b2-08060f3c5c3a', 'Umair Ali', 'umairkheshgi@gmail.com', NULL, '2026-09-27 08:26:03', '$2y$12$DFMWRkELpVsbDYL4zu1wa.DMfsgj74f9.FUxgLRKDvQKRrKDJg.Ei', NULL, NULL, '103.102.159.193', NULL, NULL, NULL, 0, NULL, 'Asia/Karachi', 'en', 'en', 'USD', NULL, 'active', 1, 'super_admin', NULL, NULL, NULL, '4TBFJV6A', NULL, 0, NULL, NULL, NULL, NULL, 1, 0, NULL, '2026-09-27 08:25:22', '2026-10-05 09:28:36'),
(2, 'f26dd022-fc09-45de-8ac3-90fcf5c51fe6', 'Umair Ali', 'uape00@gmail.com', NULL, '2026-09-27 08:44:16', '$2y$12$jqhg15Bau6G9PuTtSPma4uwA7XOzqTmPtL6ejeIxm3Cw3p/QT63Be', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'Asia/Karachi', 'en', 'en', 'USD', NULL, 'active', 0, NULL, NULL, NULL, NULL, 'ICLLOW6IHOWMGMJL', NULL, 0, NULL, NULL, NULL, NULL, 3, 0, NULL, '2026-09-27 08:44:16', '2026-09-27 08:46:03'),
(3, 'c0b78771-aa29-48f1-9029-ea8abdbb0e3e', 'nb', 'uape@dahimail.com', 'uape', '2026-09-27 12:04:31', '$2y$12$xxlJmRWVUM9yvhZISUU/Leg8i1qAtNxz/4aVCk6fQC1zzTyxYSNQa', '$2y$12$dH1gjF4GKQCNDqdbqrHFQeVtqIKsn4nwx7fYRU1iMzAoWGzbkEtya', '39.60.73.170', '103.102.159.193', '+923480233673', '3480233673', NULL, 1, NULL, 'Asia/Karachi', 'en', 'en', 'USD', NULL, 'active', 0, NULL, NULL, NULL, NULL, 'ABMSN2YGU6QNQ2OM', NULL, 0, NULL, NULL, NULL, NULL, 4, 0, NULL, '2026-09-27 12:04:30', '2026-10-05 09:18:06'),
(4, '1d6b7a8c-e3e1-4581-8082-e684cd103f6a', 'Ali', 'ali@dahimail.com', 'ali', '2026-09-27 12:53:37', '$2y$12$k5F7x9wvePCkkOqvMCZYf.ZUQBkMdUozHgua9xrU2Xs2HTdl7DRK2', '$2y$12$sMJ5M5GglgUaJyculsZFluxx9VCkcp99bLPeWbYrhA6a2nXQApl0C', '39.60.73.170', NULL, NULL, NULL, NULL, 0, NULL, 'UTC', 'en', 'en', 'USD', NULL, 'active', 0, NULL, NULL, NULL, NULL, 'GL4TCDEJQXUN99RG', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2026-09-27 12:53:37', '2026-09-27 12:53:37'),
(5, 'c47a3daf-8dff-47ef-8194-1b7fe34016f3', 'ali', 'ali1@dahimail.com', 'ali1', '2026-09-27 12:55:19', '$2y$12$SjNiLHQU.hzo3PnmhWi6WuBKVcI/aUoc9.9ww5o2JBOnql1Oub7Hi', '$2y$12$NKH8vNAhOmH/z3yh2c07juHHC7Vq40L2zROhfdvoZgOYW6SrTWLKy', '39.60.73.170', NULL, NULL, NULL, NULL, 0, NULL, 'UTC', 'en', 'en', 'USD', NULL, 'active', 0, NULL, NULL, NULL, NULL, 'FDCWVYULTQA43VZW', NULL, 0, NULL, NULL, NULL, NULL, 5, 0, NULL, '2026-09-27 12:55:19', '2026-09-27 12:55:19'),
(6, '62ee82a7-13e5-41dc-8d42-7fbb215f28ad', 'khan', 'khan@dahimail.com', 'khan', '2026-09-27 13:09:17', '$2y$12$tYE10Miuzpw8rIrVj6yW8uBwfRRfnIQphEOp6F3z9r6oXMIxb5g92', '$2y$12$WgIbUMbls7XP5viWb4h.S.XEL8QBtPjEGuaftuR2/BJAZj3VgZ0cu', '39.60.73.170', NULL, '+923137640100', '3137640100', NULL, 1, NULL, 'Asia/Karachi', 'en', 'en', 'USD', NULL, 'active', 0, NULL, NULL, NULL, NULL, '8O5UOHSWUUCQJOT8', NULL, 0, NULL, NULL, NULL, NULL, 6, 0, NULL, '2026-09-27 13:09:17', '2026-10-01 12:44:23'),
(7, '6e54ceda-f167-4084-abd3-5be6b3c28cce', 'abc', 'abc@dahimail.com', 'abc', '2026-09-27 13:22:34', '$2y$12$1hV8ZaDSEoYxK9M4Eexj9uyqVe90RmeaYBqIs2MbqqvDt5yLRwh66', '$2y$12$FOL2W8hoDFLzPkHM.mOd4Ozp/o8dg1kVPDUlngxxZHAxKSU0e3XsC', '39.60.73.170', NULL, NULL, NULL, NULL, 0, NULL, 'Asia/Karachi', 'en', 'en', 'USD', NULL, 'active', 0, NULL, NULL, NULL, NULL, 'RITWHMUCWJZM9O1Z', NULL, 0, NULL, NULL, NULL, NULL, 7, 0, NULL, '2026-09-27 13:22:34', '2026-09-27 13:25:11'),
(8, '085c63ae-26ad-4a84-bdc6-fea34f448e4d', 'aaa', 'aaa@dahimail.com', 'aaa', '2026-09-28 05:15:10', '$2y$12$ax5nDkLl0R7goK2T6bDMq.r2Efx/TVxgQiuyioO0sBeVtr4gqPdpm', '$2y$12$B1Wi7w5UCNDQ72ehWrq6i.ub29ITgKyEGWFMgUMz9V9PDwrWLx5xW', '103.102.159.195', NULL, NULL, NULL, NULL, 0, NULL, 'UTC', 'en', 'en', 'USD', NULL, 'active', 0, NULL, NULL, NULL, NULL, 'IJA6LH1YCFUI8Z3U', NULL, 0, NULL, NULL, NULL, NULL, 8, 0, NULL, '2026-09-28 05:15:10', '2026-09-28 05:15:10'),
(9, '2986090f-d5f3-4e07-8e86-43b1328458b7', 'Shabina Amin', 'shabinafbr@dahimail.com', 'shabinafbr', '2026-09-29 04:49:04', '$2y$12$zyRg5i11pg7L0S4pLrx2/eAvzaDYxGGILZwgX/YPWWe0yTUWTkOmu', '$2y$12$JNWBtTXdkXBLyjzjWAj9auVDd6B8oUoy5h2zJSjtXKtyXIp0H9wLq', '103.102.159.194', NULL, NULL, NULL, NULL, 0, NULL, 'Asia/Karachi', 'en', 'en', 'USD', NULL, 'active', 0, NULL, NULL, NULL, NULL, 'RUP0ZYO5XPJGOPIM', NULL, 0, NULL, NULL, NULL, NULL, 9, 0, NULL, '2026-09-29 04:46:42', '2026-09-29 04:49:08'),
(10, 'eda17fa1-4e24-4b90-b975-443cb8589616', 'Umair Ali', 'uape1@dahimail.com', 'uape1', NULL, '$2y$12$ykg8VnwCLVmESw/o3keGXu61mFH7OB1Xsx3c1JYVqA8TFRhS88bHq', '$2y$12$JiGZgqWtpefZl6wrUJjtpuHO9W40SVSmndr74JrhXzqz7wXsqtW9i', '103.102.159.192', NULL, NULL, NULL, NULL, 0, NULL, 'UTC', 'en', 'en', 'USD', NULL, 'active', 0, NULL, NULL, NULL, NULL, 'T68FY700C3T16Z0P', NULL, 0, NULL, NULL, NULL, NULL, 10, 0, NULL, '2026-09-30 03:53:32', '2026-09-30 03:53:32'),
(11, '458adc6b-9f04-438b-9f36-2d023f675675', 'Qaqa', 'qaqa@dahimail.com', 'qaqa', NULL, '$2y$12$INKz1xzk2jfnM/5Rledje./iRqlqgX3gl9UIYByrNBiU0qsip2/LC', '$2y$12$ssJYe8XK7UE894ZpORosYuZqeTW1fHE4QkPdMFE6DqMpuyU8ykXIq', '103.102.159.192', NULL, NULL, NULL, NULL, 0, NULL, 'UTC', 'en', 'en', 'USD', NULL, 'active', 0, NULL, NULL, NULL, NULL, '0JN8URGBO3YJOC9S', NULL, 0, NULL, NULL, NULL, NULL, 11, 0, NULL, '2026-09-30 04:18:58', '2026-09-30 04:18:58'),
(12, '4ffa4593-9302-4ee0-8945-4d64b12f2af9', 'Zubair Bin Shame', 'zubairfbr@dahimail.com', 'zubairfbr', NULL, '$2y$12$WPfitQkddUkroKrFxQtjnu8SJCm7gfb21v01rdkM6JsvU.RESKKI6', '$2y$12$LZRg24afIe9DRxlXx4k7IOdRUi2SQ3ozBfHpYhA8RElCT/LY9Bdku', '39.60.73.170', NULL, NULL, NULL, NULL, 0, NULL, 'UTC', 'en', 'en', 'USD', NULL, 'active', 0, NULL, NULL, NULL, NULL, 'FSGY8ARZTOB9DXZJ', NULL, 0, NULL, NULL, NULL, NULL, 12, 0, NULL, '2026-09-30 11:08:48', '2026-09-30 11:08:48'),
(13, '8a948dc8-a337-4c3a-997e-30c2d5f0f709', 'MUHAMMAD NAWAZ', 'nawazfbr@dahimail.com', 'nawazfbr', '2026-10-01 04:41:43', '$2y$12$OazYKRbOY0DYzxsyHYkypu9Rd0h8ftQYfr48Gl544jRI1PrWASVEG', '$2y$12$6U.csZs56j0sZvsmxnzDzuSsQUWTx8.6sMxtAqQ0zxtSfjlTCY/Hi', '103.102.159.195', NULL, NULL, NULL, NULL, 0, NULL, 'UTC', 'en', 'en', 'USD', NULL, 'active', 0, NULL, NULL, NULL, NULL, 'RX5SI6K7MGTZNEKC', NULL, 0, NULL, NULL, NULL, NULL, 13, 0, NULL, '2026-10-01 04:40:05', '2026-10-01 04:41:43'),
(14, 'daaf44ab-0458-4149-9a0d-369c9d882378', 'Umair Ali', 'umairali@dahimail.com', 'umairali', NULL, '$2y$12$zPpiCif6EhRDdaY0cl1nuuM.EQAXIMFbUMTKn0LVnB4aA.ckxibjW', '$2y$12$we1Xvo1ZmmrNyfHYHHBK7Oe9p6biYt9hI13DETuRDJhmmQ2D7ofiy', '39.47.50.103', '39.47.50.103', '+923480233673', '3480233673', NULL, 1, NULL, 'Asia/Karachi', 'en', 'en', 'USD', '{\"emailNotifs\":true,\"inAppNotifs\":true,\"slackNotifs\":true,\"events\":{\"newConversation\":{\"email\":true,\"inApp\":true,\"slack\":true},\"assignment\":{\"email\":true,\"inApp\":true,\"slack\":true},\"aiDraftReady\":{\"email\":true,\"inApp\":true,\"slack\":true},\"teamMention\":{\"email\":true,\"inApp\":true,\"slack\":true},\"contactReply\":{\"email\":true,\"inApp\":true,\"slack\":true},\"campaignComplete\":{\"email\":true,\"inApp\":true,\"slack\":true},\"weeklyDigest\":{\"email\":true,\"inApp\":true,\"slack\":true},\"billingAlerts\":{\"email\":true,\"inApp\":true,\"slack\":true}}}', 'active', 0, NULL, NULL, NULL, NULL, '6KEYFU7IB3RUCBXB', NULL, 0, NULL, NULL, NULL, NULL, 14, 0, NULL, '2026-10-02 12:05:25', '2026-10-05 10:34:51'),
(15, '50967b53-8f60-4b86-ab84-a8e1584f1156', 'Sardar Zulfiqar Ali Shah', 'zulfiqar@dahimail.com', 'zulfiqar', NULL, '$2y$12$2l2HmHrWuHWkE2D9XdlDU.6KolvHvoDIWXNV9E7iysugs9rw4ZC2G', '$2y$12$TbgtPwm3m2kJhnAzJy5d3.2SMAaHQOVfltR7POz133efEF40EL5HW', '39.47.50.103', NULL, '+923139038053', '3139038053', NULL, 1, NULL, 'UTC', 'en', 'en', 'USD', NULL, 'active', 0, NULL, NULL, NULL, NULL, 'CCZJ1PEUTJMOOZ8F', NULL, 0, NULL, NULL, NULL, NULL, 15, 0, NULL, '2026-10-02 12:25:51', '2026-10-02 12:28:56'),
(16, 'b7f26f87-53f1-4fcd-af79-1925b6b916b6', 'Mohabat Bi Bi', 'zulfiqar1@dahimail.com', 'zulfiqar1', NULL, '$2y$12$YtEW3NDORtUt1JlFsSKVs.4Ao08G5/RFYECTHI1Yr86l0GfLAn46u', '$2y$12$XPLRMTeRbR0zML7nQ4CdceR9irqDPwziSzDNumounIy0EksYJMRyW', '39.47.50.103', NULL, '+923288552946', '3288552946', NULL, 1, NULL, 'UTC', 'en', 'en', 'USD', NULL, 'active', 0, NULL, NULL, NULL, NULL, 'NUX4EO3CEAH1VUKO', NULL, 0, NULL, NULL, NULL, NULL, 16, 0, NULL, '2026-10-02 12:53:00', '2026-10-02 15:03:35'),
(17, '714d3992-3e4a-43f4-ac3c-e0875e2140a5', 'Rukhsana', 'rukhsanafbr@dahimail.com', 'rukhsanafbr', '2026-10-05 08:05:49', '$2y$12$y6jFKXX7wrEL7hpcjdve/eE/zS/O3wAkvGVS5hu8Uu.Z.yDKibf0m', '$2y$12$slyUB1xj78tuqtvfM1yQNueNSXdvM0b/V5Su.knWav5H7sCo.QUQC', '103.102.159.192', '103.102.159.193', NULL, NULL, NULL, 0, NULL, 'Asia/Karachi', 'en', 'en', 'USD', NULL, 'active', 0, NULL, NULL, NULL, NULL, 'KOSBQQRRKYI84BEA', NULL, 0, NULL, NULL, NULL, NULL, 17, 0, NULL, '2026-10-05 08:05:34', '2026-10-05 09:38:03');

-- --------------------------------------------------------

--
-- Table structure for table `user_presence`
--

CREATE TABLE `user_presence` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `last_seen_at` timestamp NULL DEFAULT NULL,
  `show_presence` tinyint(1) NOT NULL DEFAULT 1,
  `read_receipts` tinyint(1) NOT NULL DEFAULT 1,
  `findable` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_presence`
--

INSERT INTO `user_presence` (`user_id`, `last_seen_at`, `show_presence`, `read_receipts`, `findable`) VALUES
(3, '2026-10-05 09:56:09', 1, 1, 1),
(6, '2026-10-02 16:35:04', 1, 1, 1),
(14, '2026-10-05 10:40:41', 1, 1, 1),
(15, '2026-10-02 15:09:50', 1, 1, 1),
(16, '2026-10-02 15:05:16', 1, 1, 1),
(17, '2026-10-05 08:12:16', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `device` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  `is_current` tinyint(1) NOT NULL DEFAULT 0,
  `last_active_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `webhook_logs`
--

CREATE TABLE `webhook_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `direction` varchar(10) NOT NULL DEFAULT 'outbound',
  `url` varchar(2048) NOT NULL,
  `method` varchar(10) NOT NULL DEFAULT 'POST',
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headers`)),
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payload`)),
  `response_status` smallint(5) UNSIGNED DEFAULT NULL,
  `response_body` text DEFAULT NULL,
  `duration_ms` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `attempts` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `max_attempts` tinyint(3) UNSIGNED NOT NULL DEFAULT 3,
  `last_attempted_at` timestamp NULL DEFAULT NULL,
  `next_retry_at` timestamp NULL DEFAULT NULL,
  `error_message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `whatsapp_templates`
--

CREATE TABLE `whatsapp_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` enum('marketing','utility','authentication') NOT NULL,
  `language` varchar(10) NOT NULL DEFAULT 'en',
  `header_type` varchar(20) DEFAULT NULL,
  `header_content` text DEFAULT NULL,
  `body` text NOT NULL,
  `footer` varchar(255) DEFAULT NULL,
  `buttons` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`buttons`)),
  `sample_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`sample_values`)),
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `rejection_reason` varchar(255) DEFAULT NULL,
  `meta_template_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflows`
--

CREATE TABLE `workflows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('draft','active','paused') NOT NULL DEFAULT 'draft',
  `canvas_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`canvas_data`)),
  `version` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `executions_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `webhook_token` varchar(64) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_edges`
--

CREATE TABLE `workflow_edges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workflow_id` bigint(20) UNSIGNED NOT NULL,
  `from_node_id` bigint(20) UNSIGNED NOT NULL,
  `to_node_id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_executions`
--

CREATE TABLE `workflow_executions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workflow_id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('running','completed','failed','waiting','canceled') NOT NULL DEFAULT 'running',
  `trigger_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`trigger_data`)),
  `started_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_nodes`
--

CREATE TABLE `workflow_nodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workflow_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('trigger','condition','action') NOT NULL,
  `subtype` varchar(255) NOT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`config`)),
  `position_x` double NOT NULL DEFAULT 0,
  `position_y` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_step_logs`
--

CREATE TABLE `workflow_step_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `execution_id` bigint(20) UNSIGNED NOT NULL,
  `node_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('success','failed','skipped','waiting') NOT NULL DEFAULT 'success',
  `input_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`input_data`)),
  `output_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`output_data`)),
  `error_message` text DEFAULT NULL,
  `duration_ms` int(10) UNSIGNED DEFAULT NULL,
  `executed_at` timestamp NULL DEFAULT NULL,
  `resume_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workspaces`
--

CREATE TABLE `workspaces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `logo_path` varchar(255) DEFAULT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `team_size` varchar(20) DEFAULT NULL,
  `timezone` varchar(50) NOT NULL DEFAULT 'UTC',
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  `business_hours` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`business_hours`)),
  `holidays` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`holidays`)),
  `onboarding_completed` tinyint(1) NOT NULL DEFAULT 0,
  `onboarding_step` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workspaces`
--

INSERT INTO `workspaces` (`id`, `uuid`, `name`, `slug`, `logo_path`, `industry`, `team_size`, `timezone`, `settings`, `business_hours`, `holidays`, `onboarding_completed`, `onboarding_step`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2a914b23-7aab-435f-9ba3-b4b7fbbb8eb4', 'Umair Ali\'s Workspace', 'umair-alis-workspace-tgirl', NULL, 'SaaS / Technology', '2-5', 'UTC', NULL, NULL, NULL, 1, 5, '2026-09-27 08:25:22', '2026-09-27 08:25:22', NULL),
(2, 'd811171b-42c3-472e-ac44-347da2dde3ee', 'Umair Ali\'s Workspace', 'umair-alis-workspace-zwod3', NULL, 'other', '1', 'UTC', NULL, '{\"monday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"tuesday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"wednesday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"thursday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"friday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"saturday\":{\"enabled\":false,\"start\":\"10:00\",\"end\":\"14:00\"},\"sunday\":{\"enabled\":false,\"start\":\"10:00\",\"end\":\"14:00\"}}', NULL, 0, 5, '2026-09-27 08:44:33', '2026-09-27 08:44:56', NULL),
(3, '3a107e3e-15c6-4f69-ae99-1a977d897ec0', 'Umair Ali\'s Workspace', 'umair-alis-workspace-zcqps', NULL, 'nonprofit', '2-5', 'UTC', NULL, '{\"monday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"tuesday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"wednesday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"thursday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"friday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"saturday\":{\"enabled\":false,\"start\":\"10:00\",\"end\":\"14:00\"},\"sunday\":{\"enabled\":false,\"start\":\"10:00\",\"end\":\"14:00\"}}', NULL, 0, 5, '2026-09-27 08:45:22', '2026-09-27 08:45:36', NULL),
(4, '0fd5b9b8-8e45-41a2-b2fa-e5109aa5fe73', 'nb\'s Workspace', 'nbs-workspace-uyzl8', NULL, 'other', '1', 'UTC', NULL, '{\"monday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"tuesday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"wednesday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"thursday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"friday\":{\"enabled\":true,\"start\":\"09:00\",\"end\":\"17:00\"},\"saturday\":{\"enabled\":false,\"start\":\"10:00\",\"end\":\"14:00\"},\"sunday\":{\"enabled\":false,\"start\":\"10:00\",\"end\":\"14:00\"}}', NULL, 1, 5, '2026-09-27 12:05:02', '2026-09-27 12:05:55', NULL),
(5, '499dd325-f624-4b8d-9509-b90172bd04c0', 'ali\'s Workspace', 'alis-workspace-6symv', NULL, NULL, NULL, 'UTC', NULL, NULL, NULL, 1, 5, '2026-09-27 12:55:19', '2026-09-27 12:55:19', NULL),
(6, '32a89933-8a4b-4c5a-83bb-1c906475ac0d', 'khan\'s Workspace', 'khans-workspace-knccd', NULL, NULL, NULL, 'UTC', NULL, NULL, NULL, 1, 5, '2026-09-27 13:09:17', '2026-09-27 13:09:17', NULL),
(7, 'd379944a-b990-4173-bd84-9f4957103452', 'abc\'s Workspace', 'abcs-workspace-fxgzm', NULL, NULL, NULL, 'UTC', NULL, NULL, NULL, 1, 5, '2026-09-27 13:22:34', '2026-09-27 13:22:34', NULL),
(8, '88b26371-d9e7-47ac-972a-f1a593d2f903', 'aaa\'s Workspace', 'aaas-workspace-2q2ro', NULL, NULL, NULL, 'UTC', NULL, NULL, NULL, 1, 5, '2026-09-28 05:15:10', '2026-09-28 05:15:10', NULL),
(9, 'b99dfcf1-1d69-40f0-b602-f932175ee06c', 'Shabina Amin\'s Workspace', 'shabina-amins-workspace-fy27j', NULL, NULL, NULL, 'UTC', NULL, NULL, NULL, 1, 5, '2026-09-29 04:46:42', '2026-09-29 04:46:42', NULL),
(10, '8d41427e-75d1-4cc6-b1bc-66bb9690262d', 'Umair Ali\'s Workspace', 'umair-alis-workspace-1ooq8', NULL, NULL, NULL, 'UTC', NULL, NULL, NULL, 1, 5, '2026-09-30 03:53:32', '2026-09-30 03:53:32', NULL),
(11, 'ed572418-5f0c-4a9e-ac9a-c73e1fdd1dd6', 'Qaqa\'s Workspace', 'qaqas-workspace-ddgcb', NULL, NULL, NULL, 'UTC', NULL, NULL, NULL, 1, 5, '2026-09-30 04:18:58', '2026-09-30 04:18:58', NULL),
(12, 'e38961ef-f561-4e2b-ae5e-d33da0a8aed8', 'Zubair Bin Shame\'s Workspace', 'zubair-bin-shames-workspace-fdvd6', NULL, NULL, NULL, 'UTC', NULL, NULL, NULL, 1, 5, '2026-09-30 11:08:48', '2026-09-30 11:08:48', NULL),
(13, '2c42d4d0-2b40-4428-b38b-fe376ca5a35b', 'MUHAMMAD NAWAZ\'s Workspace', 'muhammad-nawazs-workspace-tait1', NULL, NULL, NULL, 'UTC', NULL, NULL, NULL, 1, 5, '2026-10-01 04:40:05', '2026-10-01 04:40:05', NULL),
(14, '9581aac6-9497-4526-841a-bc3d034ec8b2', 'Umair Ali\'s Workspace', 'umair-alis-workspace-mxlis', NULL, NULL, NULL, 'UTC', NULL, NULL, NULL, 1, 5, '2026-10-02 12:05:25', '2026-10-02 12:05:25', NULL),
(15, '3e65d031-66f3-4bd9-889d-bcd208512d18', 'Sardar Zulfiqar Ali Shah\'s Workspace', 'sardar-zulfiqar-ali-shahs-workspace-abitt', NULL, NULL, NULL, 'UTC', NULL, NULL, NULL, 1, 5, '2026-10-02 12:25:51', '2026-10-02 12:25:51', NULL),
(16, 'eae5c8f7-f7d3-477e-9cca-13b0fcef606e', 'Zulfiqar\'s Workspace', 'zulfiqars-workspace-vothe', NULL, NULL, NULL, 'UTC', NULL, NULL, NULL, 1, 5, '2026-10-02 12:53:00', '2026-10-02 12:53:00', NULL),
(17, 'bb9b0a8f-4fa8-4679-846a-deeff278dd42', 'Rukhsana\'s Workspace', 'rukhsanas-workspace-dspnj', NULL, NULL, NULL, 'UTC', NULL, NULL, NULL, 1, 5, '2026-10-05 08:05:34', '2026-10-05 08:05:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `workspace_invites`
--

CREATE TABLE `workspace_invites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'member',
  `token` varchar(64) NOT NULL,
  `invited_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('pending','accepted','expired','cancelled') NOT NULL DEFAULT 'pending',
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workspace_members`
--

CREATE TABLE `workspace_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workspace_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` enum('owner','admin','agent','viewer') NOT NULL DEFAULT 'agent',
  `status` enum('active','online','away','offline','vacation') NOT NULL DEFAULT 'active',
  `available_for_assignment` tinyint(1) NOT NULL DEFAULT 1,
  `max_concurrent_conversations` int(10) UNSIGNED NOT NULL DEFAULT 20,
  `assigned_channels` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`assigned_channels`)),
  `skill_tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`skill_tags`)),
  `business_hours_override` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`business_hours_override`)),
  `vacation_until` timestamp NULL DEFAULT NULL,
  `vacation_reassign_to` varchar(255) DEFAULT NULL,
  `last_active_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workspace_members`
--

INSERT INTO `workspace_members` (`id`, `workspace_id`, `user_id`, `role`, `status`, `available_for_assignment`, `max_concurrent_conversations`, `assigned_channels`, `skill_tags`, `business_hours_override`, `vacation_until`, `vacation_reassign_to`, `last_active_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'owner', 'offline', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-27 08:25:22', '2026-09-27 08:25:22'),
(2, 2, 2, 'owner', 'online', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-27 08:44:33', '2026-09-27 08:44:33'),
(3, 3, 2, 'owner', 'online', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-27 08:45:22', '2026-09-27 08:45:22'),
(4, 4, 3, 'owner', 'online', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-27 12:05:02', '2026-09-27 12:05:02'),
(5, 5, 5, 'owner', 'online', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-27 12:55:19', '2026-09-27 12:55:19'),
(6, 6, 6, 'owner', 'online', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-27 13:09:17', '2026-09-27 13:09:17'),
(7, 7, 7, 'owner', 'online', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-27 13:22:34', '2026-09-27 13:22:34'),
(8, 8, 8, 'owner', 'online', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-28 05:15:10', '2026-09-28 05:15:10'),
(9, 9, 9, 'owner', 'online', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-29 04:46:42', '2026-09-29 04:46:42'),
(10, 10, 10, 'owner', 'online', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-30 03:53:32', '2026-09-30 03:53:32'),
(11, 11, 11, 'owner', 'online', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-30 04:18:58', '2026-09-30 04:18:58'),
(12, 12, 12, 'owner', 'online', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-30 11:08:48', '2026-09-30 11:08:48'),
(13, 13, 13, 'owner', 'online', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, '2026-10-01 04:40:05', '2026-10-01 04:40:05'),
(14, 14, 14, 'owner', 'online', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, '2026-10-02 12:05:25', '2026-10-02 12:05:25'),
(15, 15, 15, 'owner', 'online', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, '2026-10-02 12:25:51', '2026-10-02 12:25:51'),
(16, 16, 16, 'owner', 'online', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, '2026-10-02 12:53:00', '2026-10-02 12:53:00'),
(17, 17, 17, 'owner', 'online', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, '2026-10-05 08:05:34', '2026-10-05 08:05:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ab_test_variants`
--
ALTER TABLE `ab_test_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ab_test_variants_campaign_variant_unique` (`campaign_id`,`variant`),
  ADD KEY `ab_test_variants_campaign_id_index` (`campaign_id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_impersonations`
--
ALTER TABLE `admin_impersonations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_impersonations_admin_id_foreign` (`admin_id`),
  ADD KEY `admin_impersonations_user_id_foreign` (`user_id`),
  ADD KEY `admin_impersonations_session_id_expires_at_index` (`session_id`,`expires_at`);

--
-- Indexes for table `ai_channel_configs`
--
ALTER TABLE `ai_channel_configs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ai_channel_workspace_unique` (`workspace_id`,`channel`),
  ADD KEY `ai_channel_configs_channel_index` (`channel`);

--
-- Indexes for table `ai_configs`
--
ALTER TABLE `ai_configs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ai_configs_workspace_id_unique` (`workspace_id`);

--
-- Indexes for table `ai_exclusions`
--
ALTER TABLE `ai_exclusions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ai_exclusions_workspace_id_type_index` (`workspace_id`,`type`);

--
-- Indexes for table `ai_exclusion_rules`
--
ALTER TABLE `ai_exclusion_rules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ai_exclusion_rules_workspace_id_rule_key_unique` (`workspace_id`,`rule_key`);

--
-- Indexes for table `ai_usage_logs`
--
ALTER TABLE `ai_usage_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ai_usage_logs_workspace_id_created_at_index` (`workspace_id`,`created_at`),
  ADD KEY `ai_usage_logs_workspace_id_type_index` (`workspace_id`,`type`),
  ADD KEY `idx_ai_usage_ws_created` (`workspace_id`,`created_at`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attachments_message_mime_idx` (`message_id`,`mime_type`),
  ADD KEY `attachments_workspace_id_index` (`workspace_id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_logs_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  ADD KEY `audit_logs_actor_type_actor_id_index` (`actor_type`,`actor_id`),
  ADD KEY `audit_logs_event_index` (`event`),
  ADD KEY `audit_logs_created_at_index` (`created_at`);

--
-- Indexes for table `auto_reply_rules`
--
ALTER TABLE `auto_reply_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auto_reply_rules_workspace_id_is_active_index` (`workspace_id`,`is_active`);

--
-- Indexes for table `blocked_ips`
--
ALTER TABLE `blocked_ips`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blocked_ips_ip_address_unique` (`ip_address`),
  ADD KEY `blocked_ips_blocked_until_index` (`blocked_until`);

--
-- Indexes for table `blocked_locations`
--
ALTER TABLE `blocked_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blocked_locations_created_by_foreign` (`created_by`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `call_recordings`
--
ALTER TABLE `call_recordings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `call_recordings_call_unique` (`call_id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `campaigns_uuid_unique` (`uuid`),
  ADD KEY `campaigns_created_by_foreign` (`created_by`),
  ADD KEY `campaigns_email_account_id_foreign` (`email_account_id`),
  ADD KEY `campaigns_workspace_id_status_index` (`workspace_id`,`status`),
  ADD KEY `campaigns_type_index` (`type`),
  ADD KEY `campaigns_channel_index` (`channel`);

--
-- Indexes for table `campaign_links`
--
ALTER TABLE `campaign_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `campaign_links_tracking_hash_unique` (`tracking_hash`),
  ADD KEY `campaign_links_campaign_id_foreign` (`campaign_id`);

--
-- Indexes for table `campaign_recipients`
--
ALTER TABLE `campaign_recipients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `campaign_recipients_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `campaign_recipients_campaign_contact_unique` (`campaign_id`,`contact_id`),
  ADD KEY `campaign_recipients_contact_id_foreign` (`contact_id`),
  ADD KEY `campaign_recipients_campaign_id_status_index` (`campaign_id`,`status`),
  ADD KEY `idx_camp_recip_campaign_status` (`campaign_id`,`status`),
  ADD KEY `idx_camp_recip_campaign_variant` (`campaign_id`,`variant`),
  ADD KEY `campaign_recipients_campaign_created_idx` (`campaign_id`,`created_at`),
  ADD KEY `campaign_recipients_phone_index` (`phone`);

--
-- Indexes for table `canned_responses`
--
ALTER TABLE `canned_responses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `canned_responses_ws_shortcut_unique` (`workspace_id`,`shortcut`),
  ADD KEY `canned_responses_user_id_foreign` (`user_id`),
  ADD KEY `canned_responses_workspace_id_category_index` (`workspace_id`,`category`);

--
-- Indexes for table `channel_integrations`
--
ALTER TABLE `channel_integrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `channel_integrations_workspace_id_channel_unique` (`workspace_id`,`channel`),
  ADD KEY `channel_integrations_channel_status_idx` (`channel`,`status`);

--
-- Indexes for table `chat_widgets`
--
ALTER TABLE `chat_widgets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chat_widgets_workspace_id_unique` (`workspace_id`),
  ADD UNIQUE KEY `chat_widgets_public_id_unique` (`public_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contacts_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `contacts_ws_email_unique` (`workspace_id`,`email`),
  ADD KEY `contacts_workspace_id_lead_score_index` (`workspace_id`,`lead_score`),
  ADD KEY `contacts_workspace_id_status_index` (`workspace_id`,`status`),
  ADD KEY `contacts_ws_phone_idx` (`workspace_id`,`phone`),
  ADD KEY `contacts_status_unsubscribed_index` (`workspace_id`,`status`,`unsubscribed_at`);
ALTER TABLE `contacts` ADD FULLTEXT KEY `contacts_first_name_last_name_email_company_fulltext` (`first_name`,`last_name`,`email`,`company`);

--
-- Indexes for table `contact_lists`
--
ALTER TABLE `contact_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_lists_workspace_id_foreign` (`workspace_id`);

--
-- Indexes for table `contact_list_members`
--
ALTER TABLE `contact_list_members`
  ADD PRIMARY KEY (`contact_list_id`,`contact_id`),
  ADD KEY `contact_list_members_contact_id_foreign` (`contact_id`);

--
-- Indexes for table `contact_tag`
--
ALTER TABLE `contact_tag`
  ADD PRIMARY KEY (`contact_id`,`tag_id`),
  ADD KEY `contact_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `conversations_uuid_unique` (`uuid`),
  ADD KEY `conversations_assigned_to_foreign` (`assigned_to`),
  ADD KEY `conversations_workspace_id_status_index` (`workspace_id`,`status`),
  ADD KEY `conversations_workspace_id_channel_index` (`workspace_id`,`channel`),
  ADD KEY `conversations_workspace_id_assigned_to_index` (`workspace_id`,`assigned_to`),
  ADD KEY `conversations_workspace_id_priority_index` (`workspace_id`,`priority`),
  ADD KEY `conversations_workspace_id_last_message_at_index` (`workspace_id`,`last_message_at`),
  ADD KEY `conversations_workspace_id_is_read_index` (`workspace_id`,`is_read`),
  ADD KEY `conversations_ws_status_last_msg_idx` (`workspace_id`,`status`,`last_message_at`),
  ADD KEY `conversations_ws_read_status_idx` (`workspace_id`,`is_read`,`status`),
  ADD KEY `conversations_ws_starred_idx` (`workspace_id`,`is_starred`),
  ADD KEY `conversations_ws_assigned_status_idx` (`workspace_id`,`assigned_to`,`status`),
  ADD KEY `idx_conv_ws_status_lastmsg` (`workspace_id`,`status`,`last_message_at`),
  ADD KEY `idx_conv_ws_starred` (`workspace_id`,`is_starred`),
  ADD KEY `idx_conv_ws_created` (`workspace_id`,`created_at`),
  ADD KEY `idx_conv_threading` (`workspace_id`,`contact_id`,`email_account_id`,`last_message_at`),
  ADD KEY `idx_conv_unread_counts` (`workspace_id`,`is_read`,`status`,`channel`),
  ADD KEY `conversations_contact_ws_channel_idx` (`contact_id`,`workspace_id`,`channel`),
  ADD KEY `conversations_ws_channel_created_index` (`workspace_id`,`channel`,`created_at`),
  ADD KEY `conversations_email_account_created_index` (`email_account_id`,`created_at`),
  ADD KEY `conversations_ws_starred_lastmsg_index` (`workspace_id`,`is_starred`,`last_message_at`);
ALTER TABLE `conversations` ADD FULLTEXT KEY `conversations_subject_fulltext` (`subject`);

--
-- Indexes for table `conversation_tag`
--
ALTER TABLE `conversation_tag`
  ADD PRIMARY KEY (`conversation_id`,`tag_id`),
  ADD KEY `conversation_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `conversation_typing`
--
ALTER TABLE `conversation_typing`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `conversation_typing_conversation_id_user_id_unique` (`conversation_id`,`user_id`),
  ADD KEY `conversation_typing_user_id_foreign` (`user_id`);

--
-- Indexes for table `conversation_viewers`
--
ALTER TABLE `conversation_viewers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `conversation_viewers_conversation_id_user_id_unique` (`conversation_id`,`user_id`),
  ADD KEY `conversation_viewers_user_id_foreign` (`user_id`),
  ADD KEY `conversation_viewers_workspace_id_index` (`workspace_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_code_unique` (`code`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `custom_fields_workspace_id_key_unique` (`workspace_id`,`key`);

--
-- Indexes for table `deals`
--
ALTER TABLE `deals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deals_uuid_unique` (`uuid`),
  ADD KEY `deals_contact_id_foreign` (`contact_id`),
  ADD KEY `deals_pipeline_id_foreign` (`pipeline_id`),
  ADD KEY `deals_deal_stage_id_foreign` (`deal_stage_id`),
  ADD KEY `deals_assigned_to_foreign` (`assigned_to`),
  ADD KEY `deals_workspace_id_status_index` (`workspace_id`,`status`),
  ADD KEY `deals_workspace_id_deal_stage_id_index` (`workspace_id`,`deal_stage_id`);

--
-- Indexes for table `deal_stages`
--
ALTER TABLE `deal_stages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deal_stages_pipeline_sort_order_index` (`pipeline_id`,`sort_order`),
  ADD KEY `deal_stages_pipeline_sort_index` (`pipeline_id`,`sort_order`);

--
-- Indexes for table `device_tokens`
--
ALTER TABLE `device_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `device_tokens_token_unique` (`token`),
  ADD KEY `device_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `drip_enrollments`
--
ALTER TABLE `drip_enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `drip_enrollments_sequence_contact_status_unique` (`sequence_id`,`contact_id`,`status`),
  ADD KEY `drip_enrollments_sequence_id_status_index` (`sequence_id`,`status`),
  ADD KEY `drip_enrollments_next_step_at_index` (`next_step_at`),
  ADD KEY `idx_drip_enroll_status_nextstep` (`status`,`next_step_at`),
  ADD KEY `drip_enrollments_contact_sequence_idx` (`contact_id`,`sequence_id`);

--
-- Indexes for table `drip_sequences`
--
ALTER TABLE `drip_sequences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drip_sequences_campaign_id_foreign` (`campaign_id`);

--
-- Indexes for table `drip_steps`
--
ALTER TABLE `drip_steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drip_steps_sequence_id_foreign` (`sequence_id`);

--
-- Indexes for table `email_accounts`
--
ALTER TABLE `email_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_accounts_uuid_unique` (`uuid`),
  ADD KEY `email_accounts_user_id_foreign` (`user_id`),
  ADD KEY `email_accounts_workspace_id_status_index` (`workspace_id`,`status`),
  ADD KEY `email_accounts_workspace_id_is_default_index` (`workspace_id`,`is_default`),
  ADD KEY `email_accounts_workspace_status_synced_index` (`workspace_id`,`status`,`last_synced_at`),
  ADD KEY `email_accounts_email_index` (`email`);

--
-- Indexes for table `email_signatures`
--
ALTER TABLE `email_signatures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_signatures_email_account_id_foreign` (`email_account_id`);

--
-- Indexes for table `email_suppressions`
--
ALTER TABLE `email_suppressions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_suppressions_workspace_id_email_unique` (`workspace_id`,`email`),
  ADD KEY `email_suppressions_email_index` (`email`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_templates_workspace_id_category_index` (`workspace_id`,`category`),
  ADD KEY `email_templates_is_default_index` (`is_default`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `friendship_events`
--
ALTER TABLE `friendship_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `friendship_events_pair` (`user_low_id`,`user_high_id`,`id`),
  ADD KEY `fe_high_fk` (`user_high_id`);

--
-- Indexes for table `friend_calls`
--
ALTER TABLE `friend_calls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `friend_calls_callee_id_status_index` (`callee_id`,`status`),
  ADD KEY `friend_calls_caller_id_status_index` (`caller_id`,`status`);

--
-- Indexes for table `friend_call_clears`
--
ALTER TABLE `friend_call_clears`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `friend_call_signals`
--
ALTER TABLE `friend_call_signals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `friend_call_signals_from_user_id_foreign` (`from_user_id`),
  ADD KEY `friend_call_signals_call_id_id_index` (`call_id`,`id`);

--
-- Indexes for table `friend_chat_clears`
--
ALTER TABLE `friend_chat_clears`
  ADD PRIMARY KEY (`user_id`,`other_id`),
  ADD KEY `friend_chat_clears_other_id_foreign` (`other_id`);

--
-- Indexes for table `friend_dismissals`
--
ALTER TABLE `friend_dismissals`
  ADD PRIMARY KEY (`user_id`,`other_user_id`),
  ADD KEY `fd_other_fk` (`other_user_id`);

--
-- Indexes for table `friend_match_notices`
--
ALTER TABLE `friend_match_notices`
  ADD PRIMARY KEY (`user_id`,`other_user_id`),
  ADD KEY `fmn_other_fk` (`other_user_id`);

--
-- Indexes for table `friend_messages`
--
ALTER TABLE `friend_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `friend_messages_sender_id_recipient_id_id_index` (`sender_id`,`recipient_id`,`id`),
  ADD KEY `friend_messages_recipient_id_read_at_index` (`recipient_id`,`read_at`),
  ADD KEY `friend_messages_call_id` (`call_id`),
  ADD KEY `friend_messages_visible_to` (`visible_to`);

--
-- Indexes for table `friend_message_reactions`
--
ALTER TABLE `friend_message_reactions`
  ADD PRIMARY KEY (`message_id`,`user_id`),
  ADD KEY `friend_message_reactions_message_id_index` (`message_id`);

--
-- Indexes for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `friend_requests_pair` (`requester_id`,`addressee_id`),
  ADD KEY `friend_requests_addressee_status` (`addressee_id`,`status`);

--
-- Indexes for table `help_articles`
--
ALTER TABLE `help_articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `help_articles_slug_unique` (`slug`),
  ADD KEY `help_articles_category_index` (`category`),
  ADD KEY `help_articles_is_published_index` (`is_published`);

--
-- Indexes for table `invites`
--
ALTER TABLE `invites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invites_token_unique` (`token`),
  ADD UNIQUE KEY `invites_workspace_email_status_unique` (`workspace_id`,`email`,`status`),
  ADD KEY `invites_invited_by_foreign` (`invited_by`),
  ADD KEY `invites_workspace_id_email_index` (`workspace_id`,`email`),
  ADD KEY `invites_token_index` (`token`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kb_chunks`
--
ALTER TABLE `kb_chunks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kb_chunks_document_id_foreign` (`document_id`),
  ADD KEY `kb_chunks_workspace_id_index` (`workspace_id`);
ALTER TABLE `kb_chunks` ADD FULLTEXT KEY `kb_chunks_content_fulltext` (`content`);

--
-- Indexes for table `kb_documents`
--
ALTER TABLE `kb_documents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kb_documents_uuid_unique` (`uuid`),
  ADD KEY `kb_documents_workspace_id_type_index` (`workspace_id`,`type`),
  ADD KEY `kb_documents_workspace_id_status_index` (`workspace_id`,`status`),
  ADD KEY `kb_documents_workspace_id_category_index` (`workspace_id`,`category`),
  ADD KEY `kb_documents_workspace_id_content_hash_index` (`workspace_id`,`content_hash`);

--
-- Indexes for table `kb_websites`
--
ALTER TABLE `kb_websites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kb_websites_workspace_id_index` (`workspace_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_code_unique` (`code`);

--
-- Indexes for table `lead_scoring_rules`
--
ALTER TABLE `lead_scoring_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_scoring_rules_workspace_id_foreign` (`workspace_id`);

--
-- Indexes for table `magic_links`
--
ALTER TABLE `magic_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `magic_links_token_unique` (`token`),
  ADD KEY `magic_links_email_index` (`email`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `meetings_code_unique` (`code`),
  ADD KEY `meetings_host_id_foreign` (`host_id`);

--
-- Indexes for table `meeting_invitees`
--
ALTER TABLE `meeting_invitees`
  ADD PRIMARY KEY (`meeting_id`,`user_id`),
  ADD KEY `meeting_invitees_user_id_foreign` (`user_id`);

--
-- Indexes for table `meeting_messages`
--
ALTER TABLE `meeting_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meeting_messages_meeting_id_id_index` (`meeting_id`,`id`);

--
-- Indexes for table `meeting_participants`
--
ALTER TABLE `meeting_participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mp_meeting_status` (`meeting_id`,`status`),
  ADD KEY `mp_user` (`user_id`);

--
-- Indexes for table `meeting_signals`
--
ALTER TABLE `meeting_signals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meeting_signals_meeting_id_to_pid_id_index` (`meeting_id`,`to_pid`,`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `messages_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `messages_workspace_message_id_header_unique` (`workspace_id`,`message_id_header`),
  ADD KEY `messages_sender_id_foreign` (`sender_id`),
  ADD KEY `messages_conversation_id_created_at_index` (`conversation_id`,`created_at`),
  ADD KEY `messages_workspace_id_ai_status_index` (`workspace_id`,`ai_status`),
  ADD KEY `messages_workspace_id_type_index` (`workspace_id`,`type`),
  ADD KEY `messages_ws_sender_type_idx` (`workspace_id`,`sender_type`),
  ADD KEY `messages_ws_delivery_status_idx` (`workspace_id`,`delivery_status`),
  ADD KEY `messages_conv_direction_idx` (`conversation_id`,`direction`),
  ADD KEY `idx_messages_conv_direction_created` (`conversation_id`,`direction`,`created_at`),
  ADD KEY `idx_messages_ws_msgid_header` (`workspace_id`,`message_id_header`),
  ADD KEY `idx_messages_ws_direction_created` (`workspace_id`,`direction`,`created_at`),
  ADD KEY `idx_messages_conv_listing` (`conversation_id`,`created_at`),
  ADD KEY `idx_messages_conv_latest` (`conversation_id`,`id`),
  ADD KEY `idx_messages_schedule` (`schedule_status`,`scheduled_at`),
  ADD KEY `messages_ws_created_idx` (`workspace_id`,`created_at`),
  ADD KEY `messages_ws_ai_status_created_index` (`workspace_id`,`ai_status`,`created_at`);
ALTER TABLE `messages` ADD FULLTEXT KEY `messages_body_text_fulltext` (`body_text`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_histories`
--
ALTER TABLE `password_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_histories_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_stripe_invoice_id_unique` (`stripe_invoice_id`),
  ADD KEY `payments_subscription_id_foreign` (`subscription_id`),
  ADD KEY `payments_workspace_id_status_index` (`workspace_id`,`status`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_gateways_slug_unique` (`slug`),
  ADD KEY `payment_gateways_category_index` (`category`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `pipelines`
--
ALTER TABLE `pipelines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pipelines_workspace_id_foreign` (`workspace_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plans_slug_unique` (`slug`);

--
-- Indexes for table `plan_features`
--
ALTER TABLE `plan_features`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plan_features_plan_id_feature_key_unique` (`plan_id`,`feature_key`);

--
-- Indexes for table `recording_consents`
--
ALTER TABLE `recording_consents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rc_unique` (`session_id`,`pid`);

--
-- Indexes for table `recording_files`
--
ALTER TABLE `recording_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rf_session_unique` (`session_id`),
  ADD KEY `rf_meeting` (`meeting_id`);

--
-- Indexes for table `recording_sessions`
--
ALTER TABLE `recording_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rs_meeting_status` (`meeting_id`,`status`);

--
-- Indexes for table `reserved_usernames`
--
ALTER TABLE `reserved_usernames`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reserved_usernames_name_unique` (`name`),
  ADD KEY `reserved_usernames_created_by_foreign` (`created_by`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `security_audit_logs`
--
ALTER TABLE `security_audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `security_audit_logs_user_id_foreign` (`user_id`),
  ADD KEY `security_audit_logs_event_type_index` (`event_type`),
  ADD KEY `security_audit_logs_status_index` (`status`);

--
-- Indexes for table `segments`
--
ALTER TABLE `segments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `segments_workspace_id_foreign` (`workspace_id`);

--
-- Indexes for table `sent_messages`
--
ALTER TABLE `sent_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sent_messages_user_id_index` (`user_id`),
  ADD KEY `sent_messages_ip_address_index` (`ip_address`),
  ADD KEY `sent_messages_device_hash_index` (`device_hash`),
  ADD KEY `sent_messages_created_at_index` (`created_at`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `social_accounts_provider_provider_id_unique` (`provider`,`provider_id`),
  ADD KEY `social_accounts_user_id_provider_index` (`user_id`,`provider`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_stripe_subscription_id_unique` (`stripe_subscription_id`),
  ADD KEY `subscriptions_plan_id_foreign` (`plan_id`),
  ADD KEY `subscriptions_workspace_id_index` (`workspace_id`),
  ADD KEY `subscriptions_status_index` (`status`),
  ADD KEY `idx_sub_ws_status` (`workspace_id`,`status`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `system_settings_key_unique` (`key`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_workspace_id_name_unique` (`workspace_id`,`name`);

--
-- Indexes for table `temp_mail_addresses`
--
ALTER TABLE `temp_mail_addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `temp_mail_addresses_temp_mail_domain_id_local_part_unique` (`temp_mail_domain_id`,`local_part`),
  ADD UNIQUE KEY `temp_mail_addresses_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `temp_mail_addresses_full_address_unique` (`full_address`),
  ADD KEY `temp_mail_addresses_user_id_foreign` (`user_id`),
  ADD KEY `temp_mail_addresses_conversation_id_foreign` (`conversation_id`),
  ADD KEY `temp_mail_addresses_workspace_id_is_active_index` (`workspace_id`,`is_active`),
  ADD KEY `temp_mail_addresses_full_address_index` (`full_address`),
  ADD KEY `temp_mail_addresses_expires_at_index` (`expires_at`);

--
-- Indexes for table `temp_mail_domains`
--
ALTER TABLE `temp_mail_domains`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `temp_mail_domains_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `temp_mail_domains_domain_unique` (`domain`),
  ADD KEY `temp_mail_domains_status_index` (`status`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testimonials_created_by_foreign` (`created_by`),
  ADD KEY `testimonials_is_active_rating_index` (`is_active`,`rating`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_user_id_foreign` (`user_id`),
  ADD KEY `tickets_workspace_id_foreign` (`workspace_id`),
  ADD KEY `tickets_assigned_to_foreign` (`assigned_to`),
  ADD KEY `tickets_status_index` (`status`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_replies_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_replies_user_id_foreign` (`user_id`);

--
-- Indexes for table `tracking_events`
--
ALTER TABLE `tracking_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tracking_events_message_id_type_index` (`message_id`,`type`);

--
-- Indexes for table `two_factor_attempts`
--
ALTER TABLE `two_factor_attempts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `two_factor_attempts_user_id_ip_address_unique` (`user_id`,`ip_address`);

--
-- Indexes for table `usage_records`
--
ALTER TABLE `usage_records`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usage_records_workspace_id_feature_key_period_unique` (`workspace_id`,`feature_key`,`period`),
  ADD KEY `idx_usage_ws_feature_period` (`workspace_id`,`feature_key`,`period`),
  ADD KEY `idx_usage_ws_period` (`workspace_id`,`period`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_referral_code_unique` (`referral_code`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_status_index` (`status`),
  ADD KEY `users_active_workspace_id_foreign` (`active_workspace_id`),
  ADD KEY `users_referral_code_index` (`referral_code`),
  ADD KEY `users_phone_key_index` (`phone_key`);

--
-- Indexes for table `user_presence`
--
ALTER TABLE `user_presence`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_sessions_user_id_foreign` (`user_id`),
  ADD KEY `user_sessions_session_id_index` (`session_id`);

--
-- Indexes for table `webhook_logs`
--
ALTER TABLE `webhook_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `webhook_logs_workspace_id_status_created_at_index` (`workspace_id`,`status`,`created_at`),
  ADD KEY `webhook_logs_status_next_retry_at_index` (`status`,`next_retry_at`);

--
-- Indexes for table `whatsapp_templates`
--
ALTER TABLE `whatsapp_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `whatsapp_templates_workspace_id_status_index` (`workspace_id`,`status`);

--
-- Indexes for table `workflows`
--
ALTER TABLE `workflows`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `workflows_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `workflows_webhook_token_unique` (`webhook_token`),
  ADD KEY `workflows_created_by_foreign` (`created_by`),
  ADD KEY `workflows_workspace_id_status_index` (`workspace_id`,`status`),
  ADD KEY `workflows_webhook_token_index` (`webhook_token`);

--
-- Indexes for table `workflow_edges`
--
ALTER TABLE `workflow_edges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workflow_edges_workflow_id_foreign` (`workflow_id`),
  ADD KEY `workflow_edges_from_node_id_foreign` (`from_node_id`),
  ADD KEY `workflow_edges_to_node_id_foreign` (`to_node_id`);

--
-- Indexes for table `workflow_executions`
--
ALTER TABLE `workflow_executions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workflow_executions_workflow_id_status_index` (`workflow_id`,`status`),
  ADD KEY `workflow_exec_contact_wf_status_created_idx` (`contact_id`,`workflow_id`,`status`,`created_at`);

--
-- Indexes for table `workflow_nodes`
--
ALTER TABLE `workflow_nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workflow_nodes_workflow_id_foreign` (`workflow_id`);

--
-- Indexes for table `workflow_step_logs`
--
ALTER TABLE `workflow_step_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workflow_step_logs_execution_id_foreign` (`execution_id`),
  ADD KEY `workflow_step_logs_node_id_foreign` (`node_id`);

--
-- Indexes for table `workspaces`
--
ALTER TABLE `workspaces`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `workspaces_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `workspaces_slug_unique` (`slug`),
  ADD KEY `workspaces_slug_index` (`slug`);

--
-- Indexes for table `workspace_invites`
--
ALTER TABLE `workspace_invites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `workspace_invites_workspace_id_email_unique` (`workspace_id`,`email`),
  ADD UNIQUE KEY `workspace_invites_token_unique` (`token`),
  ADD KEY `workspace_invites_invited_by_foreign` (`invited_by`),
  ADD KEY `workspace_invites_token_status_index` (`token`,`status`);

--
-- Indexes for table `workspace_members`
--
ALTER TABLE `workspace_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `workspace_members_workspace_id_user_id_unique` (`workspace_id`,`user_id`),
  ADD KEY `workspace_members_user_id_foreign` (`user_id`),
  ADD KEY `workspace_members_workspace_id_role_index` (`workspace_id`,`role`),
  ADD KEY `workspace_members_workspace_id_status_index` (`workspace_id`,`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ab_test_variants`
--
ALTER TABLE `ab_test_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_impersonations`
--
ALTER TABLE `admin_impersonations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ai_channel_configs`
--
ALTER TABLE `ai_channel_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ai_configs`
--
ALTER TABLE `ai_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ai_exclusions`
--
ALTER TABLE `ai_exclusions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ai_exclusion_rules`
--
ALTER TABLE `ai_exclusion_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ai_usage_logs`
--
ALTER TABLE `ai_usage_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auto_reply_rules`
--
ALTER TABLE `auto_reply_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blocked_ips`
--
ALTER TABLE `blocked_ips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blocked_locations`
--
ALTER TABLE `blocked_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `call_recordings`
--
ALTER TABLE `call_recordings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_links`
--
ALTER TABLE `campaign_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_recipients`
--
ALTER TABLE `campaign_recipients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `canned_responses`
--
ALTER TABLE `canned_responses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `channel_integrations`
--
ALTER TABLE `channel_integrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_widgets`
--
ALTER TABLE `chat_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `contact_lists`
--
ALTER TABLE `contact_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `conversation_typing`
--
ALTER TABLE `conversation_typing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversation_viewers`
--
ALTER TABLE `conversation_viewers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deals`
--
ALTER TABLE `deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_stages`
--
ALTER TABLE `deal_stages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `device_tokens`
--
ALTER TABLE `device_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `drip_enrollments`
--
ALTER TABLE `drip_enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drip_sequences`
--
ALTER TABLE `drip_sequences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drip_steps`
--
ALTER TABLE `drip_steps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_accounts`
--
ALTER TABLE `email_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `email_signatures`
--
ALTER TABLE `email_signatures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_suppressions`
--
ALTER TABLE `email_suppressions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `friendship_events`
--
ALTER TABLE `friendship_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `friend_calls`
--
ALTER TABLE `friend_calls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `friend_call_signals`
--
ALTER TABLE `friend_call_signals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `friend_messages`
--
ALTER TABLE `friend_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `friend_requests`
--
ALTER TABLE `friend_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `help_articles`
--
ALTER TABLE `help_articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `invites`
--
ALTER TABLE `invites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `kb_chunks`
--
ALTER TABLE `kb_chunks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kb_documents`
--
ALTER TABLE `kb_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kb_websites`
--
ALTER TABLE `kb_websites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `lead_scoring_rules`
--
ALTER TABLE `lead_scoring_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `magic_links`
--
ALTER TABLE `magic_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `meeting_messages`
--
ALTER TABLE `meeting_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meeting_participants`
--
ALTER TABLE `meeting_participants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `meeting_signals`
--
ALTER TABLE `meeting_signals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `password_histories`
--
ALTER TABLE `password_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `pipelines`
--
ALTER TABLE `pipelines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `plan_features`
--
ALTER TABLE `plan_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `recording_consents`
--
ALTER TABLE `recording_consents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recording_files`
--
ALTER TABLE `recording_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recording_sessions`
--
ALTER TABLE `recording_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reserved_usernames`
--
ALTER TABLE `reserved_usernames`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `security_audit_logs`
--
ALTER TABLE `security_audit_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `segments`
--
ALTER TABLE `segments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sent_messages`
--
ALTER TABLE `sent_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_accounts`
--
ALTER TABLE `social_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_mail_addresses`
--
ALTER TABLE `temp_mail_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_mail_domains`
--
ALTER TABLE `temp_mail_domains`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tracking_events`
--
ALTER TABLE `tracking_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `two_factor_attempts`
--
ALTER TABLE `two_factor_attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usage_records`
--
ALTER TABLE `usage_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `webhook_logs`
--
ALTER TABLE `webhook_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `whatsapp_templates`
--
ALTER TABLE `whatsapp_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflows`
--
ALTER TABLE `workflows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow_edges`
--
ALTER TABLE `workflow_edges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow_executions`
--
ALTER TABLE `workflow_executions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow_nodes`
--
ALTER TABLE `workflow_nodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow_step_logs`
--
ALTER TABLE `workflow_step_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workspaces`
--
ALTER TABLE `workspaces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `workspace_invites`
--
ALTER TABLE `workspace_invites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workspace_members`
--
ALTER TABLE `workspace_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ab_test_variants`
--
ALTER TABLE `ab_test_variants`
  ADD CONSTRAINT `ab_test_variants_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_impersonations`
--
ALTER TABLE `admin_impersonations`
  ADD CONSTRAINT `admin_impersonations_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_impersonations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ai_channel_configs`
--
ALTER TABLE `ai_channel_configs`
  ADD CONSTRAINT `ai_channel_configs_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ai_configs`
--
ALTER TABLE `ai_configs`
  ADD CONSTRAINT `ai_configs_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ai_exclusions`
--
ALTER TABLE `ai_exclusions`
  ADD CONSTRAINT `ai_exclusions_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ai_exclusion_rules`
--
ALTER TABLE `ai_exclusion_rules`
  ADD CONSTRAINT `ai_exclusion_rules_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ai_usage_logs`
--
ALTER TABLE `ai_usage_logs`
  ADD CONSTRAINT `ai_usage_logs_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `attachments_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attachments_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auto_reply_rules`
--
ALTER TABLE `auto_reply_rules`
  ADD CONSTRAINT `auto_reply_rules_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blocked_locations`
--
ALTER TABLE `blocked_locations`
  ADD CONSTRAINT `blocked_locations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `call_recordings`
--
ALTER TABLE `call_recordings`
  ADD CONSTRAINT `cr_call_fk` FOREIGN KEY (`call_id`) REFERENCES `friend_calls` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD CONSTRAINT `campaigns_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `campaigns_email_account_id_foreign` FOREIGN KEY (`email_account_id`) REFERENCES `email_accounts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `campaigns_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `campaign_links`
--
ALTER TABLE `campaign_links`
  ADD CONSTRAINT `campaign_links_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `campaign_recipients`
--
ALTER TABLE `campaign_recipients`
  ADD CONSTRAINT `campaign_recipients_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `campaign_recipients_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `canned_responses`
--
ALTER TABLE `canned_responses`
  ADD CONSTRAINT `canned_responses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `canned_responses_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channel_integrations`
--
ALTER TABLE `channel_integrations`
  ADD CONSTRAINT `channel_integrations_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_widgets`
--
ALTER TABLE `chat_widgets`
  ADD CONSTRAINT `chat_widgets_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contact_lists`
--
ALTER TABLE `contact_lists`
  ADD CONSTRAINT `contact_lists_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contact_list_members`
--
ALTER TABLE `contact_list_members`
  ADD CONSTRAINT `contact_list_members_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contact_list_members_contact_list_id_foreign` FOREIGN KEY (`contact_list_id`) REFERENCES `contact_lists` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contact_tag`
--
ALTER TABLE `contact_tag`
  ADD CONSTRAINT `contact_tag_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contact_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `conversations_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `conversations_email_account_id_foreign` FOREIGN KEY (`email_account_id`) REFERENCES `email_accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conversations_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `conversation_tag`
--
ALTER TABLE `conversation_tag`
  ADD CONSTRAINT `conversation_tag_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conversation_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `conversation_typing`
--
ALTER TABLE `conversation_typing`
  ADD CONSTRAINT `conversation_typing_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conversation_typing_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `conversation_viewers`
--
ALTER TABLE `conversation_viewers`
  ADD CONSTRAINT `conversation_viewers_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conversation_viewers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conversation_viewers_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD CONSTRAINT `custom_fields_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deals`
--
ALTER TABLE `deals`
  ADD CONSTRAINT `deals_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `deals_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `deals_deal_stage_id_foreign` FOREIGN KEY (`deal_stage_id`) REFERENCES `deal_stages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `deals_pipeline_id_foreign` FOREIGN KEY (`pipeline_id`) REFERENCES `pipelines` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `deals_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deal_stages`
--
ALTER TABLE `deal_stages`
  ADD CONSTRAINT `deal_stages_pipeline_id_foreign` FOREIGN KEY (`pipeline_id`) REFERENCES `pipelines` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `device_tokens`
--
ALTER TABLE `device_tokens`
  ADD CONSTRAINT `device_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drip_enrollments`
--
ALTER TABLE `drip_enrollments`
  ADD CONSTRAINT `drip_enrollments_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `drip_enrollments_sequence_id_foreign` FOREIGN KEY (`sequence_id`) REFERENCES `drip_sequences` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drip_sequences`
--
ALTER TABLE `drip_sequences`
  ADD CONSTRAINT `drip_sequences_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drip_steps`
--
ALTER TABLE `drip_steps`
  ADD CONSTRAINT `drip_steps_sequence_id_foreign` FOREIGN KEY (`sequence_id`) REFERENCES `drip_sequences` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `email_accounts`
--
ALTER TABLE `email_accounts`
  ADD CONSTRAINT `email_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `email_accounts_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `email_signatures`
--
ALTER TABLE `email_signatures`
  ADD CONSTRAINT `email_signatures_email_account_id_foreign` FOREIGN KEY (`email_account_id`) REFERENCES `email_accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `email_suppressions`
--
ALTER TABLE `email_suppressions`
  ADD CONSTRAINT `email_suppressions_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD CONSTRAINT `email_templates_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `friendship_events`
--
ALTER TABLE `friendship_events`
  ADD CONSTRAINT `fe_high_fk` FOREIGN KEY (`user_high_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fe_low_fk` FOREIGN KEY (`user_low_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `friend_calls`
--
ALTER TABLE `friend_calls`
  ADD CONSTRAINT `friend_calls_callee_id_foreign` FOREIGN KEY (`callee_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friend_calls_caller_id_foreign` FOREIGN KEY (`caller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `friend_call_signals`
--
ALTER TABLE `friend_call_signals`
  ADD CONSTRAINT `friend_call_signals_call_id_foreign` FOREIGN KEY (`call_id`) REFERENCES `friend_calls` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friend_call_signals_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `friend_chat_clears`
--
ALTER TABLE `friend_chat_clears`
  ADD CONSTRAINT `friend_chat_clears_other_id_foreign` FOREIGN KEY (`other_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friend_chat_clears_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `friend_dismissals`
--
ALTER TABLE `friend_dismissals`
  ADD CONSTRAINT `fd_other_fk` FOREIGN KEY (`other_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fd_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `friend_match_notices`
--
ALTER TABLE `friend_match_notices`
  ADD CONSTRAINT `fmn_other_fk` FOREIGN KEY (`other_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fmn_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `friend_messages`
--
ALTER TABLE `friend_messages`
  ADD CONSTRAINT `friend_messages_recipient_id_foreign` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friend_messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD CONSTRAINT `fr_addressee_fk` FOREIGN KEY (`addressee_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fr_requester_fk` FOREIGN KEY (`requester_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invites`
--
ALTER TABLE `invites`
  ADD CONSTRAINT `invites_invited_by_foreign` FOREIGN KEY (`invited_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invites_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kb_chunks`
--
ALTER TABLE `kb_chunks`
  ADD CONSTRAINT `kb_chunks_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `kb_documents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kb_chunks_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kb_documents`
--
ALTER TABLE `kb_documents`
  ADD CONSTRAINT `kb_documents_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kb_websites`
--
ALTER TABLE `kb_websites`
  ADD CONSTRAINT `kb_websites_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lead_scoring_rules`
--
ALTER TABLE `lead_scoring_rules`
  ADD CONSTRAINT `lead_scoring_rules_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `meetings`
--
ALTER TABLE `meetings`
  ADD CONSTRAINT `meetings_host_id_foreign` FOREIGN KEY (`host_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `meeting_invitees`
--
ALTER TABLE `meeting_invitees`
  ADD CONSTRAINT `meeting_invitees_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `meeting_invitees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `meeting_messages`
--
ALTER TABLE `meeting_messages`
  ADD CONSTRAINT `meeting_messages_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `meeting_signals`
--
ALTER TABLE `meeting_signals`
  ADD CONSTRAINT `meeting_signals_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `messages_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `password_histories`
--
ALTER TABLE `password_histories`
  ADD CONSTRAINT `password_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `payments_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pipelines`
--
ALTER TABLE `pipelines`
  ADD CONSTRAINT `pipelines_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `plan_features`
--
ALTER TABLE `plan_features`
  ADD CONSTRAINT `plan_features_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recording_consents`
--
ALTER TABLE `recording_consents`
  ADD CONSTRAINT `rc_session_fk` FOREIGN KEY (`session_id`) REFERENCES `recording_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recording_files`
--
ALTER TABLE `recording_files`
  ADD CONSTRAINT `rf_session_fk` FOREIGN KEY (`session_id`) REFERENCES `recording_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recording_sessions`
--
ALTER TABLE `recording_sessions`
  ADD CONSTRAINT `rs_meeting_fk` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reserved_usernames`
--
ALTER TABLE `reserved_usernames`
  ADD CONSTRAINT `reserved_usernames_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `security_audit_logs`
--
ALTER TABLE `security_audit_logs`
  ADD CONSTRAINT `security_audit_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `segments`
--
ALTER TABLE `segments`
  ADD CONSTRAINT `segments_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD CONSTRAINT `social_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`),
  ADD CONSTRAINT `subscriptions_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `temp_mail_addresses`
--
ALTER TABLE `temp_mail_addresses`
  ADD CONSTRAINT `temp_mail_addresses_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `temp_mail_addresses_temp_mail_domain_id_foreign` FOREIGN KEY (`temp_mail_domain_id`) REFERENCES `temp_mail_domains` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `temp_mail_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `temp_mail_addresses_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD CONSTRAINT `testimonials_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD CONSTRAINT `ticket_replies_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticket_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tracking_events`
--
ALTER TABLE `tracking_events`
  ADD CONSTRAINT `tracking_events_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `two_factor_attempts`
--
ALTER TABLE `two_factor_attempts`
  ADD CONSTRAINT `two_factor_attempts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `usage_records`
--
ALTER TABLE `usage_records`
  ADD CONSTRAINT `usage_records_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_active_workspace_id_foreign` FOREIGN KEY (`active_workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `user_sessions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `webhook_logs`
--
ALTER TABLE `webhook_logs`
  ADD CONSTRAINT `webhook_logs_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `whatsapp_templates`
--
ALTER TABLE `whatsapp_templates`
  ADD CONSTRAINT `whatsapp_templates_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `workflows`
--
ALTER TABLE `workflows`
  ADD CONSTRAINT `workflows_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `workflows_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `workflow_edges`
--
ALTER TABLE `workflow_edges`
  ADD CONSTRAINT `workflow_edges_from_node_id_foreign` FOREIGN KEY (`from_node_id`) REFERENCES `workflow_nodes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `workflow_edges_to_node_id_foreign` FOREIGN KEY (`to_node_id`) REFERENCES `workflow_nodes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `workflow_edges_workflow_id_foreign` FOREIGN KEY (`workflow_id`) REFERENCES `workflows` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `workflow_executions`
--
ALTER TABLE `workflow_executions`
  ADD CONSTRAINT `workflow_executions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `workflow_executions_workflow_id_foreign` FOREIGN KEY (`workflow_id`) REFERENCES `workflows` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `workflow_nodes`
--
ALTER TABLE `workflow_nodes`
  ADD CONSTRAINT `workflow_nodes_workflow_id_foreign` FOREIGN KEY (`workflow_id`) REFERENCES `workflows` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `workflow_step_logs`
--
ALTER TABLE `workflow_step_logs`
  ADD CONSTRAINT `workflow_step_logs_execution_id_foreign` FOREIGN KEY (`execution_id`) REFERENCES `workflow_executions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `workflow_step_logs_node_id_foreign` FOREIGN KEY (`node_id`) REFERENCES `workflow_nodes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `workspace_invites`
--
ALTER TABLE `workspace_invites`
  ADD CONSTRAINT `workspace_invites_invited_by_foreign` FOREIGN KEY (`invited_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `workspace_invites_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `workspace_members`
--
ALTER TABLE `workspace_members`
  ADD CONSTRAINT `workspace_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `workspace_members_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
