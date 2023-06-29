-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2023 at 06:07 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `maycake`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('9osdof9bu2a8mcum7e6i0gu9f35bjg73', '::1', 1688054227, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638383035343134343b7265646972656374696f6e7c4e3b5f5f4143544956455f53455353494f4e5f444154417c733a3235363a2231636532613237633363306265363035376537613733633738336638383830313637633439353239616561663462343630646638306430313563633939383931396139343763363032653030653963383139643631396366303139316261643138363065323037373538643464363036653563396436356630326430316536316678706a58644b4f41334856506d466a693050364d553939643345645a42493942724f7a794879596565724c487050434f7232694e4966434e3051305554626e71774861397a53514a714e64564e65546933674772506942476663717a54494958787335626f534e693873536a46464b6c64304263595a64786c4e5a6e38394f223b);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) NOT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `subject` varchar(128) DEFAULT NULL,
  `email` varchar(64) NOT NULL,
  `message` mediumtext NOT NULL,
  `contact_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `reply_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(32) NOT NULL,
  `credit` decimal(8,2) NOT NULL,
  `start_date` date NOT NULL,
  `expired_date` date NOT NULL,
  `is_active` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `code`, `credit`, `start_date`, `expired_date`, `is_active`) VALUES
(4, 'BELANJADARIRUMAH', '#DIRUMAHAJA', '15000.00', '2020-10-12', '2020-10-31', 1),
(5, 'BAYARTANPABERSENTUHAN', '#TRANSFERPAY', '35000.00', '2020-10-12', '2020-11-30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `phone_number` varchar(32) DEFAULT NULL,
  `address` varchar(191) NOT NULL,
  `profile_picture` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `name`, `phone_number`, `address`, `profile_picture`) VALUES
(7, 8, 'sindi ovtapiani', '0831100200200', 'astana anyar', NULL),
(8, 9, 'arnold', '089100200', 'tanah abang jakarta', 'admin1.png'),
(9, 10, 'Chef juna', '0877777123', 'Bintaro Jakarta', 'juna1.jpg'),
(10, 11, 'Megawati', '0813444334', 'tanah abang jakarta', '1111.png'),
(11, 12, 'Muhammad Alfian Nugroho', '082187261070', 'jl.mawar srengseng sawah', NULL),
(12, 13, 'Maycake', '082188881213', 'jl.margonda raya', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_id` bigint(20) DEFAULT NULL,
  `order_number` varchar(16) NOT NULL,
  `order_status` enum('1','2','3','4','5') DEFAULT '1',
  `order_date` datetime NOT NULL,
  `total_price` decimal(8,2) DEFAULT NULL,
  `total_items` int(10) DEFAULT NULL,
  `payment_method` int(11) DEFAULT 1,
  `delivery_data` text DEFAULT NULL,
  `delivered_date` datetime DEFAULT NULL,
  `finish_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `coupon_id`, `order_number`, `order_status`, `order_date`, `total_price`, `total_items`, `payment_method`, `delivery_data`, `delivered_date`, `finish_date`) VALUES
(5, 7, NULL, 'TJL2932027019', '2', '2020-03-29 08:14:50', '271000.00', 2, 1, '{\"customer\":{\"name\":\"Agung Tri Saputra\",\"phone_number\":\"081328907767\",\"address\":\"Kost Indah Jaya Belakang No. 19, Jl. Medan Baru VI, Kandang Limun, Bengkulu\"},\"note\":\"\"}', NULL, NULL),
(6, 7, NULL, 'JQZ2932017914', '1', '2020-03-29 08:15:13', '350000.00', 1, 2, '{\"customer\":{\"name\":\"Agung Tri Saputra\",\"phone_number\":\"081328907767\",\"address\":\"Kost Indah Jaya Belakang No. 19, Jl. Medan Baru VI, Kandang Limun, Bengkulu\"},\"note\":\"\"}', NULL, NULL),
(7, 7, NULL, 'TIB3032037078', '2', '2020-03-30 08:49:42', '78000.00', 3, 1, '{\"customer\":{\"name\":\"Agung Tri Saputra\",\"phone_number\":\"081328907767\",\"address\":\"Kost Indah Jaya Belakang No. 19, Jl. Medan Baru VI, Kandang Limun, Bengkulu\"},\"note\":\"\"}', NULL, NULL),
(8, 7, NULL, 'GPS3032027749', '1', '2020-03-30 09:14:27', '360000.00', 2, 1, '{\"customer\":{\"name\":\"Agung Tri Saputra\",\"phone_number\":\"081328907767\",\"address\":\"Kost Indah Jaya Belakang No. 19, Jl. Medan Baru VI, Kandang Limun, Bengkulu\"},\"note\":\"\"}', NULL, NULL),
(9, 8, NULL, 'JQF12102018078', '1', '2020-10-12 05:17:25', '20000.00', 1, 1, '{\"customer\":{\"name\":\"sindi ovtapiani\",\"phone_number\":\"0831100200200\",\"address\":\"astana anyar\"},\"note\":\"\"}', NULL, NULL),
(10, 8, NULL, 'CRW12102018715', '1', '2020-10-12 05:18:26', '40000.00', 1, 2, '{\"customer\":{\"name\":\"sindi ovtapiani\",\"phone_number\":\"0831100200200\",\"address\":\"astana anyar\"},\"note\":\"\"}', NULL, NULL),
(11, 8, NULL, 'JWM12102018321', '4', '2020-10-12 11:53:53', '65000.00', 1, 2, '{\"customer\":{\"name\":\"sindi ovtapiani\",\"phone_number\":\"0831100200200\",\"address\":\"astana anyar\"},\"note\":\"\"}', NULL, NULL),
(12, 9, NULL, 'PMH13102039301', '3', '2020-10-13 18:36:20', '79000.00', 3, 2, '{\"customer\":{\"name\":\"arnold\",\"phone_number\":\"089100200\",\"address\":\"tanah abang jakarta\"},\"note\":\"\"}', NULL, NULL),
(13, 10, NULL, 'IHL131020110286', '5', '2020-10-13 18:53:05', '125000.00', 1, 1, '{\"customer\":{\"name\":\"Chef juna\",\"phone_number\":\"0877777123\",\"address\":\"Bintaro Jakarta\"},\"note\":\"\"}', NULL, NULL),
(14, 10, NULL, 'IJW131020110045', '3', '2020-10-13 18:55:01', '125000.00', 1, 2, '{\"customer\":{\"name\":\"Chef juna\",\"phone_number\":\"0877777123\",\"address\":\"Bintaro Jakarta\"},\"note\":\"\"}', NULL, NULL),
(15, 11, NULL, 'JWK131020211843', '3', '2020-10-13 19:02:43', '53000.00', 2, 2, '{\"customer\":{\"name\":\"Megawati\",\"phone_number\":\"0813444334\",\"address\":\"tanah abang jakarta\"},\"note\":\"\"}', NULL, NULL),
(16, 10, NULL, 'QMH131020110750', '5', '2020-10-13 19:24:50', '130000.00', 1, 1, '{\"customer\":{\"name\":\"Chef juna\",\"phone_number\":\"0877777123\",\"address\":\"Bintaro Jakarta\"},\"note\":\"\"}', NULL, NULL),
(17, 12, NULL, 'XYI5623112102', '2', '2023-06-05 05:54:56', '80000.00', 1, 1, '{\"customer\":{\"name\":\"Muhammad Alfian Nugroho\",\"phone_number\":\"082187261070\",\"address\":\"jl.mawar srengseng sawah\"},\"note\":\"\"}', NULL, NULL),
(18, 13, NULL, 'XKX5623113389', '1', '2023-06-05 06:11:12', '84000.00', 1, 2, '{\"customer\":{\"name\":\"Maycake\",\"phone_number\":\"082188881213\",\"address\":\"jl.margonda raya\"},\"note\":\"\"}', NULL, NULL),
(19, 12, NULL, 'VKU5623112650', '1', '2023-06-05 06:11:54', '84000.00', 1, 2, '{\"customer\":{\"name\":\"Muhammad Alfian Nugroho\",\"phone_number\":\"082187261070\",\"address\":\"jl.mawar srengseng sawah\"},\"note\":\"\"}', NULL, NULL),
(20, 12, NULL, 'AHL27623112698', '1', '2023-06-27 16:01:20', '80000.00', 1, 1, '{\"customer\":{\"name\":\"Muhammad Alfian Nugroho\",\"phone_number\":\"082187261070\",\"address\":\"jl.mawar srengseng sawah\"},\"note\":\"\"}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `order_qty` int(10) NOT NULL,
  `order_price` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`id`, `order_id`, `product_id`, `order_qty`, `order_price`) VALUES
(3, 4, 2, 1, '31000.00'),
(4, 4, 8, 13, '20000.00'),
(5, 5, 2, 1, '31000.00'),
(6, 5, 13, 12, '20000.00'),
(7, 6, 9, 10, '35000.00'),
(8, 7, 10, 1, '12000.00'),
(9, 7, 9, 1, '35000.00'),
(10, 7, 2, 1, '31000.00'),
(11, 8, 9, 1, '35000.00'),
(12, 8, 1, 5, '65000.00'),
(13, 9, 13, 1, '20000.00'),
(14, 10, 8, 2, '20000.00'),
(15, 11, 1, 1, '65000.00'),
(16, 12, 15, 1, '19000.00'),
(17, 12, 28, 1, '25000.00'),
(18, 12, 9, 1, '35000.00'),
(19, 13, 24, 5, '25000.00'),
(20, 14, 24, 5, '25000.00'),
(21, 15, 30, 1, '5000.00'),
(22, 15, 31, 1, '48000.00'),
(23, 16, 1, 2, '65000.00'),
(24, 17, 1, 1, '80000.00'),
(25, 18, 2, 1, '84000.00'),
(26, 19, 2, 1, '84000.00'),
(27, 20, 1, 1, '80000.00');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_price` decimal(8,2) DEFAULT NULL,
  `payment_date` datetime NOT NULL,
  `picture_name` varchar(191) DEFAULT NULL,
  `payment_status` enum('1','2','3') DEFAULT '1',
  `confirmed_date` datetime DEFAULT NULL,
  `payment_data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `payment_price`, `payment_date`, `picture_name`, `payment_status`, `confirmed_date`, `payment_data`) VALUES
(4, 5, '271000.00', '2020-03-29 08:20:39', 'category-1.jpg', '1', NULL, '{\"transfer_to\":\"bri\",\"source\":{\"bank\":\"Bank BRI\",\"name\":\"Agung Tri Saputra\",\"number\":\"12-345-678-9\"}}'),
(5, 7, '78000.00', '2020-03-30 08:51:08', 'html5.jpg', '2', NULL, '{\"transfer_to\":\"btn\",\"source\":{\"bank\":\"BANK BCA\",\"name\":\"MMS\",\"number\":\"123-456\"}}'),
(6, 17, '80000.00', '2023-06-05 05:57:44', 'celerates.jpg', '1', NULL, '{\"transfer_to\":\"bca\",\"source\":{\"bank\":\"mandiri\",\"name\":\"alfian\",\"number\":\"10310813\"}}');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `category_id` int(10) DEFAULT NULL,
  `sku` varchar(32) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `picture_name` varchar(191) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `current_discount` decimal(8,2) DEFAULT 0.00,
  `stock` int(10) NOT NULL,
  `product_unit` varchar(32) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT 1,
  `add_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sku`, `name`, `description`, `picture_name`, `price`, `current_discount`, `stock`, `product_unit`, `is_available`, `add_date`) VALUES
(1, 2, 'SB750372', 'barbie', NULL, 'kartun11.jpeg', '85000.00', '5000.00', 50, 'Pcs', 1, '2020-03-26 15:02:52'),
(2, 1, 'BS350420', 'superman', NULL, 'kartun2.jpeg', '86000.00', '2000.00', 50, 'Pcs', 1, '2020-03-26 15:03:40'),
(4, 1, 'TS120790', 'Batman', NULL, 'kartun3.jpeg', '85000.00', '3000.00', 50, 'Pcs', 1, '2020-03-26 19:36:30'),
(5, 1, 'WS120811', 'Rapunzel', NULL, 'kartun4.jpeg', '87000.00', '0.00', 50, 'Pcs', 1, '2020-03-26 19:36:51'),
(8, 1, 'PS220885', 'Naruto', NULL, 'kartun5.jpeg', '83000.00', '2000.00', 50, 'Pcs', 1, '2020-03-26 19:38:05'),
(9, 2, 'AB450163', 'Mobile Legend', NULL, 'kartun6.jpg', '77000.00', '5000.00', 50, 'Pcs', 1, '2020-03-26 19:42:43'),
(10, 1, 'BMS120283', 'Tayo', NULL, 'kartun7.jpeg', '82000.00', '3000.00', 50, 'Pcs', 1, '2020-03-26 19:44:42'),
(11, 1, 'URS13301', 'One piece', NULL, 'Kartun8.jpeg', '84000.00', '3000.00', 50, 'Pcs', 1, '2020-03-26 19:45:01'),
(12, 1, 'BPS15347', 'Putri Salju', NULL, 'Kartun9.jpeg', '83000.00', '2500.00', 50, 'Pcs', 1, '2020-03-26 19:45:47'),
(13, 1, 'KPS223370', 'sepongebob', NULL, 'Kartun10.jpg', '87000.00', '4500.00', 50, 'Pcs', 1, '2020-03-26 19:46:10'),
(14, 1, 'CMS410424', 'Doraemon', NULL, 'Kartun11.jpg', '75000.00', '3000.00', 50, 'Pcs', 1, '2020-03-26 19:47:04'),
(15, 2, 'PB1100727', 'Hellokitty', NULL, 'Kartun12.jpg', '80000.00', '4000.00', 50, 'Pcs', 1, '2020-10-13 12:42:07'),
(16, 10, 'DAD450873', 'Upin-Ipin', NULL, 'kartun13.jpg', '42000.00', '5000.00', 50, 'Pcs', 1, '2020-10-13 12:44:33'),
(17, 10, 'DSD1100936', 'Love Cake', NULL, 'TIM BG.jpg', '110000.00', '2000.00', 50, 'Pcs', 1, '2020-10-13 12:45:36'),
(18, 10, 'ISD240104', 'White forest cake', NULL, 'TIM_(1).jpg', '125000.00', '2500.00', 50, 'Pcs', 1, '2020-10-13 12:48:24'),
(19, 11, 'BMS1100160', 'Bakiava Cake', NULL, 'TIM_(2).jpg', '135000.00', '2500.00', 50, 'Pcs', 1, '2020-10-13 12:49:20'),
(20, 11, 'BMS1100524', 'postre Chaja', NULL, 'TIM_(3).jpg', '145000.00', '3500.00', 50, 'Pcs', 1, '2020-10-13 18:12:04'),
(21, 11, 'BSRS1200571', 'Pribcesstarta Cake', NULL, 'TIM_(4).jpg', '13500.00', '3400.00', 50, 'Pcs', 1, '2020-10-13 18:12:51'),
(22, 11, 'TSBS170617', 'Pavlova Cake', NULL, 'TIM_(5).jpg', '11000.00', '4500.00', 50, 'Pcs', 1, '2020-10-13 18:13:37'),
(23, 11, 'TTPS150647', 'Madeleines Cake', NULL, 'TIM_(7).jpg', '145000.00', '2600.00', 50, 'Pcs', 1, '2020-10-13 18:14:07'),
(24, 11, 'B2LS21000728', 'Tres Leches Cake', NULL, 'TIM_(8).jpg', '125000.00', '2500.00', 50, 'pcs', 1, '2020-10-13 18:15:28'),
(25, 11, 'T2LS21000750', 'Black Forest cake', NULL, 'TIM_(11).jpg', '17500.00', '3500.00', 50, 'pcs', 1, '2020-10-13 18:15:50'),
(26, 11, 'ISS550806', 'Tiramisu cake', NULL, 'TIM_(8)1.jpg', '157000.00', '3500.00', 50, 'Pcs', 1, '2020-10-13 18:16:46');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int(10) NOT NULL,
  `name` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `name`) VALUES
(1, 'Cartoon Cake'),
(2, 'Birthday cake');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `review_text` mediumtext NOT NULL,
  `review_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `order_id`, `title`, `review_text`, `review_date`, `status`) VALUES
(2, 7, 6, 'Sangat puas', 'Pengiriman cepat dan sayur segar', '2020-03-30 08:31:31', 1),
(3, 7, 5, 'Buah segar', 'Buah segar dan kualitasnya sangat bagus', '2020-03-30 08:33:10', 1),
(4, 9, 12, 'Cocok ', 'Memudahkan saya dalam berbelanja keperluan masak tanpa keluar rumah', '2020-10-13 18:38:15', 1),
(5, 10, 14, 'Solusi Di Masa Pandemi', 'Pengiriman secepat kilat, jadi gaperlu repot repot antri ke pasar', '2020-10-13 18:57:08', 1),
(6, 11, 15, 'good', 'menawarkan kemudahan transaksi bagi penyedia barang ataupun pembeli', '2020-10-13 19:04:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) NOT NULL,
  `role_name` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) NOT NULL,
  `key` varchar(32) NOT NULL,
  `content` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `content`) VALUES
(1, 'current_theme_name', 'vegefoods'),
(2, 'store_name', 'MayCake'),
(3, 'store_phone_number', '085777150913'),
(4, 'store_email', 'maycake@gmail.com'),
(5, 'store_tagline', 'Belanja Kue ya Di MayCake'),
(6, 'store_logo', 'Logo.png'),
(7, 'max_product_image_size', '20000'),
(8, 'store_description', 'Belanja Kue dengan murah, mudah dan cepat'),
(9, 'store_address', 'Citayam Raya No 12'),
(10, 'min_shop_to_free_shipping_cost', '20000'),
(11, 'shipping_cost', '3000'),
(12, 'payment_banks', '{\"bca\":{\"bank\":\"Mandiri\",\"number\":\"1570006759899\",\"name\":\"Muhammad Alfian Nugroho \"}}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `username` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_picture` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(10) DEFAULT 0,
  `register_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `username`, `password`, `profile_picture`, `role_id`, `register_date`) VALUES
(1, 'Wildan Firdaus', 'mochammadwildanf@gmail.com', NULL, 'wfirdaus', '$2y$10$kK8XUQh/icjpfn5MAeb5r.oQbhNDKvr/GZAfaoV7zvZzwc7O9oe4K', 'IMG_20180510_170514_HDR.jpg', 1, NULL),
(7, NULL, 'agungtri@gmail.com', NULL, 'agungtria', '$2y$10$tin9aX4Uz.wlBhZYuD4Fju9q1.O07BwUKxp6yvveTeIrrsa46fqDC', NULL, 2, '2020-03-29 08:14:30'),
(8, NULL, 'sindi@demo.com', NULL, 'sindi', '$2y$10$oqxGsv1cutiF9ge4aLdppu4EEpdgHLW.E.cEY1.N7Ro95W9navViC', NULL, 2, '2020-10-12 05:16:28'),
(9, NULL, 'arnold@demo.com', NULL, 'Arnold', '$2y$10$jgxPQoXYTQektORTTsZ.ee64KYd03zNkgk1UQZGRIpmJ2qKOov2Vu', NULL, 2, '2020-10-13 18:35:22'),
(10, NULL, 'juna@demo.com', NULL, 'Juna', '$2y$10$EIgeRurDwWYlzxdg15IHo.p9LP8A1tA8HvJRAneuOO9ilp92JfyCW', NULL, 2, '2020-10-13 18:52:14'),
(11, NULL, 'megawati@demo.com', NULL, 'Megawati', '$2y$10$8rBxmWX78lzg2ihJsytFKOlfD/Bl8vIkCz/zkyFQHk5kKyEgmu5G2', NULL, 2, '2020-10-13 19:01:55'),
(12, NULL, 'alfiannugroho95@gmail.com', NULL, 'fianngr_', '$2y$10$uUvUxsE9kbNnVCe7GGZlL./LXeV1C.s.nVDarVaXPDOfezGgU4TFi', NULL, 2, '2023-05-26 14:55:45'),
(13, NULL, 'Maycake@gmail.com', NULL, 'maycake', '$2y$10$WqNTWnaYSTFQA5ia6JDC8OsogFEIugdgRTARvjEvRC1VdgbJorCO2', NULL, 1, '2023-05-26 14:56:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_contacts_contacts` (`parent_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_customers_users` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_orders_users` (`user_id`),
  ADD KEY `FK_orders_coupons` (`coupon_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_products_product_category` (`category_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_reviews_users` (`user_id`),
  ADD KEY `FK_reviews_orders` (`order_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE,
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `FK_contacts_contacts` FOREIGN KEY (`parent_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `FK_customers_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_orders_coupons` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_orders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `FK_payments_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
