-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 25 avr. 2022 à 04:51
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `upmtalk`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `full_name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `password_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `full_name`, `email`, `password`, `password_text`) VALUES
(1, 'admin upmtalk', 'admin@upmtalk.com', 'c68710d3fe56fc88f7905cb15f06cf5c', '14271427');

-- --------------------------------------------------------

--
-- Structure de la table `block_list`
--

CREATE TABLE `block_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `blocked_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `comment`, `created_at`) VALUES
(49, 16, 15, 'hhhhhh', '2022-04-04 03:13:15'),
(50, 19, 17, 'test', '2022-04-25 02:02:14'),
(51, 19, 15, 'test2', '2022-04-25 02:02:57');

-- --------------------------------------------------------

--
-- Structure de la table `follow_list`
--

CREATE TABLE `follow_list` (
  `id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `follow_list`
--

INSERT INTO `follow_list` (`id`, `follower_id`, `user_id`) VALUES
(87, 14, 13),
(88, 15, 13),
(89, 15, 14),
(90, 13, 14),
(91, 13, 15),
(92, 14, 15),
(93, 17, 13),
(94, 17, 15),
(95, 15, 17);

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `likes`
--

INSERT INTO `likes` (`id`, `post_id`, `user_id`) VALUES
(96, 17, 15),
(97, 16, 15),
(98, 16, 13),
(99, 17, 13),
(100, 18, 13),
(103, 18, 14),
(104, 18, 17),
(105, 19, 15);

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `msg` text NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `msg`, `read_status`, `created_at`) VALUES
(50, 17, 14, 'salut', 1, '2022-04-25 01:35:48');

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_user_id` int(11) NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT 0,
  `post_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `notifications`
--

INSERT INTO `notifications` (`id`, `to_user_id`, `message`, `created_at`, `from_user_id`, `read_status`, `post_id`) VALUES
(116, 13, 'started following you !', '2022-04-04 02:38:41', 14, 1, '0'),
(117, 13, 'started following you !', '2022-04-04 03:11:55', 15, 1, '0'),
(118, 14, 'started following you !', '2022-04-04 03:11:55', 15, 1, '0'),
(119, 14, 'liked your post !', '2022-04-04 03:13:01', 15, 2, '17'),
(120, 14, 'liked your post !', '2022-04-04 03:13:04', 15, 2, '16'),
(121, 14, 'commented on your post', '2022-04-04 03:13:15', 15, 2, '16'),
(122, 14, 'started following you !', '2022-04-04 03:14:48', 13, 1, '0'),
(123, 15, 'started following you !', '2022-04-04 03:14:49', 13, 1, '0'),
(124, 14, 'liked your post !', '2022-04-04 03:15:02', 13, 2, '16'),
(125, 14, 'liked your post !', '2022-04-04 03:15:04', 13, 2, '17'),
(126, 15, 'liked your post !', '2022-04-04 03:15:08', 13, 1, '18'),
(127, 15, 'started following you !', '2022-04-04 03:18:05', 14, 1, '0'),
(128, 15, 'liked your post !', '2022-04-04 03:18:29', 14, 1, '18'),
(129, 13, 'started following you !', '2022-04-25 00:37:36', 17, 0, '0'),
(130, 15, 'started following you !', '2022-04-25 00:37:37', 17, 1, '0'),
(131, 17, 'started following you !', '2022-04-25 00:41:33', 15, 1, '0'),
(132, 14, 'blocked you', '2022-04-25 01:59:11', 17, 0, '0'),
(133, 14, 'Unblocked you !', '2022-04-25 01:59:20', 17, 0, '0'),
(134, 15, 'liked your post !', '2022-04-25 02:00:19', 17, 0, '18'),
(135, 17, 'commented on your post', '2022-04-25 02:02:57', 15, 0, '19'),
(136, 17, 'liked your post !', '2022-04-25 02:03:00', 15, 0, '19');

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_img` text NOT NULL,
  `post_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `post_img`, `post_text`, `created_at`) VALUES
(18, 15, '1649041973UPM.png', 'upm', '2022-04-04 03:12:53'),
(19, 17, '1650850003upmtalk.png', 'UPMtalk', '2022-04-25 01:26:43'),
(20, 14, '1650851376WhatsApp Image 2022-04-24 at 20.01.12 (1).jpeg', 'moi', '2022-04-25 01:49:36'),
(22, 14, '1650851834WhatsApp Image 2022-01-31 at 6.21.08 PM.jpeg', 'test', '2022-04-25 01:57:14');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `profile_pic` text NOT NULL DEFAULT 'default_profile.jpg',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ac_status` int(11) NOT NULL COMMENT '0=not verified,1=active,2=blocked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `gender`, `email`, `username`, `password`, `profile_pic`, `created_at`, `updated_at`, `ac_status`) VALUES
(13, 'oussama', 'elhaid', 1, 'oussamaelhaid@gmail.com', 'oussamaelhaid', 'c68710d3fe56fc88f7905cb15f06cf5c', '1649030797photo.jpeg', '2022-04-04 00:03:50', '2022-04-24 16:46:25', 1),
(14, 'aya', 'kharbouch', 1, 'oussamaelhaid7@gmail.com', 'ayakharbouch', 'c68710d3fe56fc88f7905cb15f06cf5c', '1650843676WhatsApp Image 2022-04-24 at 20.01.12 (1).jpeg', '2022-04-04 02:31:40', '2022-04-25 01:39:07', 1),
(15, 'Omaima', 'AIT ZAOUIT', 2, 'lucasbegue23@gmail.com', 'oumaimaaitzawit', 'c68710d3fe56fc88f7905cb15f06cf5c', '1650843707WhatsApp Image 2022-04-24 at 20.01.12.jpeg', '2022-04-04 03:10:31', '2022-04-25 00:12:51', 1),
(17, 'test', 'upm', 1, 'test@gmail.com', 'test.upm', 'c68710d3fe56fc88f7905cb15f06cf5c', 'default_profile.jpg', '2022-04-24 23:57:38', '2022-04-25 02:35:55', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `block_list`
--
ALTER TABLE `block_list`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `follow_list`
--
ALTER TABLE `follow_list`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `block_list`
--
ALTER TABLE `block_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT pour la table `follow_list`
--
ALTER TABLE `follow_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT pour la table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
