-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2015 at 04:28 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `node`
--

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE IF NOT EXISTS `channels` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `expiration` int(11) NOT NULL,
  `created_at` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`id`, `name`, `expiration`, `created_at`) VALUES
(32, 'ba', 1, 'Thu Nov 12 '),
(33, '123', 1231, 'Thu Nov 12 2015 13:44:16 GMT+0500'),
(34, 'asdasd', 1, 'Thu Nov 12 2015 15:04:07 GMT+0500');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `created_at` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `comment`, `channel_id`, `created_at`) VALUES
(1, 'pst 1', 32, 'Thu Nov 12 2015 18:32:37 GMT+0500'),
(2, 'Post 2', 32, 'Thu Nov 12 2015 18:33:43 GMT+0500'),
(3, 'Post 3', 34, 'Thu Nov 12 2015 18:34:52 GMT+0500'),
(4, 'alksdja', 32, 'Thu Nov 12 2015 18:36:07 GMT+0500'),
(5, 'asjdlkjsa', 32, 'Thu Nov 12 2015 18:36:37 GMT+0500'),
(6, 'adas', 32, 'Thu Nov 12 2015 18:36:59 GMT+0500'),
(7, 'asdasaaa', 32, 'Thu Nov 12 2015 18:37:06 GMT+0500'),
(8, 'adsa', 32, 'Thu Nov 12 2015 18:57:32 GMT+0500'),
(9, 'asda', 32, 'Thu Nov 12 2015 18:59:39 GMT+0500'),
(10, 'asdas', 32, 'Thu Nov 12 2015 19:00:51 GMT+0500'),
(11, 'ada', 32, 'Thu Nov 12 2015 19:20:10 GMT+0500'),
(12, 'ada', 32, 'Thu Nov 12 2015 19:20:22 GMT+0500'),
(13, 'asda', 32, 'Thu Nov 12 2015 19:20:25 GMT+0500'),
(14, 'asda', 32, 'Thu Nov 12 2015 19:22:37 GMT+0500'),
(15, 'asdad', 32, 'Thu Nov 12 2015 19:23:18 GMT+0500'),
(16, 'adasd', 32, 'Thu Nov 12 2015 19:25:16 GMT+0500'),
(17, 'asdasd', 32, 'Thu Nov 12 2015 19:27:56 GMT+0500'),
(18, 'asda', 32, 'Thu Nov 12 2015 19:28:52 GMT+0500'),
(19, 'ada', 32, 'Thu Nov 12 2015 19:33:09 GMT+0500'),
(20, 'asdas', 32, 'Thu Nov 12 2015 19:34:05 GMT+0500'),
(21, 'sdads', 32, 'Thu Nov 12 2015 19:34:15 GMT+0500'),
(22, 'asd', 32, 'Thu Nov 12 2015 19:35:30 GMT+0500'),
(23, 'adsas', 32, 'Thu Nov 12 2015 19:38:47 GMT+0500'),
(24, 'ada', 32, 'Thu Nov 12 2015 19:39:31 GMT+0500'),
(25, 'asda', 32, 'Thu Nov 12 2015 19:41:57 GMT+0500'),
(26, 'asd', 32, 'Thu Nov 12 2015 19:43:35 GMT+0500'),
(27, 'ads', 32, 'Thu Nov 12 2015 19:44:19 GMT+0500'),
(28, 'asda', 32, 'Thu Nov 12 2015 19:46:49 GMT+0500'),
(29, 'asda', 32, 'Thu Nov 12 2015 19:48:17 GMT+0500'),
(30, 'asdad', 32, 'Thu Nov 12 2015 19:52:37 GMT+0500'),
(31, 'dasda', 32, 'Thu Nov 12 2015 19:53:17 GMT+0500'),
(32, 'asdasd', 32, 'Thu Nov 12 2015 19:54:43 GMT+0500'),
(33, 'asdasd', 34, 'Thu Nov 12 2015 19:55:34 GMT+0500'),
(34, 'adas', 32, 'Thu Nov 12 2015 19:58:39 GMT+0500'),
(35, 'asdasd', 32, 'Thu Nov 12 2015 19:58:46 GMT+0500'),
(36, 'ba message', 32, 'Thu Nov 12 2015 20:05:54 GMT+0500'),
(37, 'adasd', 32, 'Thu Nov 12 2015 20:06:04 GMT+0500'),
(38, 'asd', 32, 'Thu Nov 12 2015 20:07:11 GMT+0500'),
(39, 'as', 32, 'Thu Nov 12 2015 20:07:27 GMT+0500'),
(40, 'a', 32, 'Thu Nov 12 2015 20:07:41 GMT+0500'),
(41, '1', 32, 'Thu Nov 12 2015 20:08:01 GMT+0500'),
(42, 'asdasd', 32, 'Thu Nov 12 2015 20:10:58 GMT+0500'),
(43, 'ba message', 32, 'Thu Nov 12 2015 20:16:12 GMT+0500'),
(44, '123 hello', 33, 'Thu Nov 12 2015 20:16:26 GMT+0500'),
(45, 'asdas', 32, 'Thu Nov 12 2015 20:16:33 GMT+0500'),
(46, 'hi', 34, 'Thu Nov 12 2015 20:22:07 GMT+0500');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `channel_id`, `user_id`, `created_at`) VALUES
(1, 33, 1, 'Thu Nov 12 2015 16:28:54 GMT+0500'),
(2, 34, 1, 'Thu Nov 12 2015 16:31:17 GMT+0500'),
(3, 33, 8, 'Thu Nov 12 2015 17:54:50 GMT+0500'),
(4, 33, 8, 'Thu Nov 12 2015 17:55:59 GMT+0500');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `password`, `created_at`) VALUES
(1, 'awais', 'mushtaq', 'superadmin@fmt.com', 'sup_fmt#123', 'Thu Nov 12 2015 14:27:48 GMT+0500'),
(8, 'Awais', 'Mushtaq', 'abc@gmail.com', '12345678', 'Thu Nov 12 2015 17:06:58 GMT+0500');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `channels`
--
ALTER TABLE `channels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
