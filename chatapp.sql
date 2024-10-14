-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Sep 30, 2024 at 04:59 AM
-- Server version: 8.0.38
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `invitations`
--

CREATE TABLE `invitations` (
  `id` int NOT NULL,
  `invitedUser` varchar(255) NOT NULL,
  `invitedBy` varchar(255) NOT NULL,
  `roomId` int NOT NULL,
  `roomName` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `invitations`
--

INSERT INTO `invitations` (`id`, `invitedUser`, `invitedBy`, `roomId`, `roomName`, `password`, `sent_at`, `active`) VALUES
(18, 'elmaddin8', 'elmaddin8', 20, 'pin room 3', '$2y$10$mHmWOwteYjw.beqsXDAsQOXQIY8dGpvdW2sHkjD9ted2zbw7PbV6m', '2024-08-26 04:16:03', 0),
(19, 'elmaddin3', 'elmaddin8', 20, 'pin room 3', '$2y$10$mHmWOwteYjw.beqsXDAsQOXQIY8dGpvdW2sHkjD9ted2zbw7PbV6m', '2024-08-26 07:38:51', 1),
(20, 'elmaddin8', 'elmaddin8', 20, 'pin room 3', '$2y$10$mHmWOwteYjw.beqsXDAsQOXQIY8dGpvdW2sHkjD9ted2zbw7PbV6m', '2024-08-26 07:49:20', 0),
(21, 'elmaddin11', 'elmaddin8', 20, 'pin room 3', '$2y$10$mHmWOwteYjw.beqsXDAsQOXQIY8dGpvdW2sHkjD9ted2zbw7PbV6m', '2024-09-01 07:35:43', 0),
(22, 'elmaddin*', 'elmaddin8', 20, 'pin room 3', '$2y$10$mHmWOwteYjw.beqsXDAsQOXQIY8dGpvdW2sHkjD9ted2zbw7PbV6m', '2024-09-08 20:46:56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `user` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `room_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user`, `message`, `room_id`, `created_at`, `image_url`) VALUES
(1, 'User991', 'message1', 2, '2024-07-26 05:27:28', NULL),
(2, 'User991', 'message2', 2, '2024-07-26 05:31:30', NULL),
(3, 'User991', 'hello', 3, '2024-07-26 05:32:11', NULL),
(4, 'User139', 'message3', 2, '2024-07-26 14:18:11', NULL),
(90, 'elmaddin8', 'hey man', 20, '2024-09-03 05:53:06', NULL),
(91, 'elmaddin8', 'all is good with you?', 20, '2024-09-03 05:53:13', NULL),
(92, 'elmaddin8', 'hello', 20, '2024-09-03 06:48:13', NULL),
(93, 'elmaddin8', 'hey man', 20, '2024-09-03 07:01:04', NULL),
(100, 'elmaddin4', 'heyyyy', 20, '2024-09-04 05:32:48', NULL),
(104, 'elmaddin4', 'adasf', 20, '2024-09-04 06:00:51', NULL),
(108, 'elmaddin4', 'salam', 20, '2024-09-04 07:57:31', NULL),
(110, 'elmaddin4', 'hey hey ', 20, '2024-09-05 04:18:21', NULL),
(114, 'elmaddin4', 'salam menim qaqasim, menim sene bir vacib sualim var ', 20, '2024-09-05 04:37:34', NULL),
(116, 'elmaddin4', 'hey hey \r\n\r\nI am writing this message to you, bro', 20, '2024-09-05 04:44:25', NULL),
(118, 'elmaddin*', 'heyy', 2, '2024-09-17 11:47:38', NULL),
(119, 'elmaddin*', 'salam', 2, '2024-09-18 21:22:50', NULL),
(123, 'elmaddin*', 'hey', 2, '2024-09-19 04:03:47', NULL),
(128, 'elmaddin*', 'nece gedir', 2, '2024-09-20 06:11:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '1',
  `createdBy` varchar(255) NOT NULL,
  `pin` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `password`, `isPublic`, `createdBy`, `pin`) VALUES
(1, 'dfff', NULL, 1, '', NULL),
(2, 'room1', NULL, 1, '', NULL),
(3, 'private room 1', 'salam', 0, '', NULL),
(10, 'private room 2', NULL, 0, '', NULL),
(14, 'private room 6', 'salam', 0, '', NULL),
(15, 'public room 9', NULL, 1, '', NULL),
(16, 'public room 11', NULL, 1, 'decoy user', NULL),
(17, 'elmaddin15', 'salam', 0, 'decoy user', NULL),
(18, 'private pin room', '$2y$10$6U9xUXAwgUHdvZ2YwUYi.ujworWBSyx1V7dQh3hI69XIkHgs1NF0G', 0, 'elmaddin8', '1234'),
(19, 'private pin room 2', '$2y$10$soG95Fxyh5mskUTk5T7hxOFQywC3R.HeDQ7dO505g.yh.t7LIDwK2', 0, 'elmaddin8', '1234'),
(20, 'pin room 3', '$2y$10$VCAUEEahlGOc83HvMdYaO.f7KZ5oU87RX4gCjhTARotesDIz26lnG', 0, 'elmaddin4', '1234'),
(21, 'new private room', '$2y$10$GkTDW6GafwkGqhy1t3RGAeNcRjGY7yYYG5iiNB0YT2fqaxy74BR2C', 0, 'elmaddin4', '1234'),
(22, '', NULL, 1, 'elmaddin8', NULL),
(23, 'work stress', '$2y$10$1f9HmRwTgi0MYbxI8P7geODqN33xR8zGh7EXk7d.FCzvZnxjMYk4W', 0, 'elmaddin4', '1234'),
(24, 'work', NULL, 1, 'elmaddin4', NULL),
(25, 'workful day', '$2y$10$P8HdHhNuo3j/Mpdl/g4z5uDDUy6LQSdF2OOKtTMRo2t.vmA1HpZdC', 0, 'elmaddin4', '1234'),
(26, 'work stress 2', '$2y$10$OLt4vNe5bTle187n7AWx4OdPQLCGszqVAbzmeAlY72U1R91oTcoqa', 0, 'elmaddin4', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'elmaddin', '$2y$10$KRMX55GlM4/oPY58vKcYf.SYpzMNopcMel47o7KgU1Qk9qlHF9tXm'),
(3, 'elmaddin2', 'salam'),
(4, 'elmaddin3', '$2y$10$TRaJV/RFJQIept/48Vw3xutpaKsgZ6s/sHtxTYqvq5CZXKalytYei'),
(5, 'elmaddin4', '$2y$10$FB5ROb8xzSH1ezdI79IpyulBBxEEkTYavxE1u7/LFvzUkvoAJbr1.'),
(6, 'elmaddin6', '$2y$10$B.ni/5sEjhIbR7yCSay7vOHlolGVraxIRtuLzqiI0/ijRd276fN72'),
(7, 'elmaddin8', '$2y$10$Rv0bVZLOUG.ZDZzaoyRBHuUn3P51NnogwhX1ZHoi2F2KGoVE8mgOu'),
(8, 'elmaddin11', '$2y$10$fbx2UaWrbCTDcOYrGRwceeDj6WANoEwpvcADdbMkN4xJ3DVtMnFHy'),
(9, 'elmaddin*', '$2y$10$ksW8jpfa9rZNjD0VE8om6.spfuSet7MPHuDmyezSYwOgh0qs7uzKW');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `invitations`
--
ALTER TABLE `invitations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `invitations`
--
ALTER TABLE `invitations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
