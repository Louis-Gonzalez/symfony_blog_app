-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 05 sep. 2024 à 09:23
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blog_app`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `modified_at` datetime NOT NULL,
  `is_hidden` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `post_id`, `description`, `created_at`, `modified_at`, `is_hidden`) VALUES
(23, 103, 2963, 'kzjùpzefj', '2024-04-10 11:00:41', '2024-09-02 18:14:23', 1),
(24, 103, 2963, 'dededd', '2024-04-10 11:02:52', '2024-09-02 18:14:23', 1),
(25, 105, 2963, 'dededgtgthyh', '2024-04-10 11:14:36', '2024-09-02 18:14:23', 1),
(26, 104, 2963, 'test comment editor', '2024-05-14 15:51:56', '2024-09-02 18:14:23', 1),
(27, 105, 3062, 'Quel beau dragon sur le rocher !', '2024-05-15 10:51:02', '2024-09-02 18:14:23', 1),
(28, 105, 2968, 'commentaire d\'un user', '2024-05-21 11:23:10', '2024-09-02 18:14:23', 1),
(31, 104, 3069, 'commentaire d\'un éditor', '2024-05-21 14:08:53', '2024-09-02 18:14:23', 0),
(33, 103, 2963, 'commentaire admin', '2024-05-21 14:41:30', '2024-09-02 18:14:23', 1),
(39, 105, 3069, 'comment d\'un user', '2024-09-02 15:26:58', '2024-09-02 18:14:23', 1);

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `mail` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `user_id`, `title`, `description`, `mail`, `status`, `created_at`, `updated_at`) VALUES
(13, 105, 'test message user', 'fùkdjfkmlzdjfmldsjksdqjmfùlqmùf', 'user@user.com', 'normal', '2024-05-21 12:05:38', '2024-05-21 12:05:38'),
(14, 104, 'test message editor', 'jkvgjdsmljùmlksjlkfqjmslk', 'editor@editor.com', 'low', '2024-05-21 12:06:32', '2024-05-21 12:06:32'),
(15, 103, 'test message admin', 'rjigjdpjsgkljgklsqjgùmd', 'admin@admin.com', 'low', '2024-05-21 12:07:31', '2024-05-21 12:07:31'),
(16, 113, 'test message anonymous', 'ljgkjefpksgjùfsmlg,ml', 'machin@truc.com', 'normal', '2024-05-21 12:08:18', '2024-05-21 12:08:18'),
(18, 104, 'message modifé', 'nklgnjkldsvnlkvml,s', 'editor@editor.com', 'low', '2024-05-21 14:32:35', '2024-05-21 14:32:35'),
(19, 103, 'message admin édité', 'fndkflkdjfmùljfùkjmlk,ms!', 'admin@admin.com', 'urgent', '2024-05-21 14:44:45', '2024-05-21 14:44:45'),
(21, 114, 'new message', 'fhdjkfjdsmùlfjdmslk', 'newuser@user.com', 'urgent', '2024-05-21 15:31:30', '2024-05-21 15:31:30');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240402125639', '2024-04-02 14:56:45', 7),
('DoctrineMigrations\\Version20240403074712', '2024-04-03 09:47:36', 53),
('DoctrineMigrations\\Version20240403075304', '2024-04-03 09:54:17', 8),
('DoctrineMigrations\\Version20240403080849', '2024-04-03 10:09:41', 55),
('DoctrineMigrations\\Version20240403094708', '2024-04-03 11:47:39', 62),
('DoctrineMigrations\\Version20240403141750', '2024-04-03 16:19:01', 20),
('DoctrineMigrations\\Version20240404113714', '2024-04-04 13:38:35', 31),
('DoctrineMigrations\\Version20240409122611', '2024-04-09 14:26:50', 72),
('DoctrineMigrations\\Version20240515094414', '2024-05-15 11:45:30', 91),
('DoctrineMigrations\\Version20240516085250', '2024-05-16 10:54:19', 32),
('DoctrineMigrations\\Version20240517141945', '2024-05-17 16:21:07', 101),
('DoctrineMigrations\\Version20240517142951', '2024-05-17 16:30:23', 39),
('DoctrineMigrations\\Version20240905072001', '2024-09-05 09:22:23', 38);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
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

--
-- Déchargement des données de la table `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(20, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"hello@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"you@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-04-10 13:01:46', '2024-04-10 13:01:46', NULL),
(21, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"bincontactlg@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"bincontactlg@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-04-10 13:07:12', '2024-04-10 13:07:12', NULL),
(22, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"bincontactlg@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"bincontactlg@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-04-10 14:59:18', '2024-04-10 14:59:18', NULL),
(23, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:165:\\\"http://127.0.0.1:8000/verify/email?expires=1715677037&signature=Db1fP2jH0h3Njg1fWfVFqACDAwRlwogTJelXQ%2BeYTFI%3D&token=8E3kR0YRyGesdaOQRSznASVroIHe4sEDiJ1d2rZHLNk%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:23:\\\"surikatstudio@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:14:\\\"Surikat Studio\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:14:\\\"null@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-05-14 07:57:18', '2024-05-14 07:57:18', NULL),
(24, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:177:\\\"http://127.0.0.1:8000/verify/email?expires=1715684237&signature=KGwGgZTLFX%2BJN3te%2Fv3mqPx8RGtN%2Bk0x0QcV%2F6%2BYpOQ%3D&token=b3uXsJ%2FdSzLJdQvszkPkmYLvaEEy4y%2FkRo3y9GJcEVM%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"gonzalezlouis1981@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:12:\\\"Adamas Tools\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:13:\\\"test@test.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-05-14 09:57:20', '2024-05-14 09:57:20', NULL),
(25, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:165:\\\"http://127.0.0.1:8000/verify/email?expires=1715684465&signature=X39fxtyvGebuJQUlp%2BJOvlWeAP9ZfiCGoF3mPVpukZU%3D&token=FtxfWrudufNYLEFyzj4nlI6htp5HzEPLPSOfDbG1n3E%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"gonzalezlouis1981@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:12:\\\"Adamas Tools\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:13:\\\"test@test.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-05-14 10:01:05', '2024-05-14 10:01:05', NULL),
(26, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:167:\\\"http://127.0.0.1:8000/verify/email?expires=1715685304&signature=5beqo9X5Va22fqSYS92VIhfUZBB1eInee5jwEmVhN9I%3D&token=DdB6%2Fyt5e6d%2FSV2GqNUzDHqteaSpycmXeXP49n0AnH4%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"gonzalezlouis1981@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:12:\\\"Adamas Tools\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"totototo@toto.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-05-14 10:15:04', '2024-05-14 10:15:04', NULL),
(27, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:171:\\\"http://127.0.0.1:8000/verify/email?expires=1715693532&signature=jBHKogRAqr9Q7NDG2Uqydh3a5lO9gyvAVSZcns%2F7rko%3D&token=LYyOb%2FFfmnzFKUDv%2FKkOY%2BaNPZlNUzSbKfliMZHYtpk%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"gonzalezlouis1981@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:12:\\\"Adamas Tools\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:25:\\\"jeanmichel@jeanmichel.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-05-14 12:32:12', '2024-05-14 12:32:12', NULL),
(28, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:167:\\\"http://127.0.0.1:8000/verify/email?expires=1716208104&signature=Ipcm%2FWDc762vwijgkMV4LUqoQF71hS0zlaVmgTpX1%2FA%3D&token=mDXWIbiOldiRGib4Yc34dExQJ5IbY4we3jTw8P85dLM%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"gonzalezlouis1981@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:12:\\\"Adamas Tools\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:23:\\\"anonymous@anonymous.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-05-20 11:28:25', '2024-05-20 11:28:25', NULL),
(29, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:165:\\\"http://127.0.0.1:8000/verify/email?expires=1716299628&signature=c7SwvrhK%2BIZgega9tBCpQxxuXVhGXtKG3QLeiFxNFxg%3D&token=WT6jBhPQd0Lux0xRthyM7K8kYOyBHvd9wkvzSUi5gMo%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"gonzalezlouis1981@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:12:\\\"Adamas Tools\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:16:\\\"newuser@user.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-05-21 12:53:49', '2024-05-21 12:53:49', NULL),
(30, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:169:\\\"http://127.0.0.1:8000/verify/email?expires=1722249175&signature=GCZAjo%2Bk5avg49xKY%2FV0au7fD0v2SMTNYjNw%2FW54XQM%3D&token=iGQFYpTr21T9tgZhoY4dMopV8DFBNGEKqClXMzpxVb8%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"gonzalezlouis1981@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:12:\\\"Adamas Tools\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:20:\\\"eraseUser1@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-07-29 09:32:56', '2024-07-29 09:32:56', NULL),
(31, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:165:\\\"http://127.0.0.1:8000/verify/email?expires=1722249292&signature=xXHeLsNUURHiTk7JWAJBGpM2VUOchvPdwPYXqpZvXh4%3D&token=QuNLhFsjFPnP2dUPfbkJfCUI0PSy0xYI%2FKUPSmt1AtU%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"gonzalezlouis1981@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:12:\\\"Adamas Tools\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:20:\\\"eraseUser2@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-07-29 09:34:52', '2024-07-29 09:34:52', NULL),
(32, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:167:\\\"http://127.0.0.1:8000/verify/email?expires=1722257845&signature=GDYGYjqtuowj%2FBwYOthyt16K8pcU7M7BtYrm6DH5jug%3D&token=dD6BinlTfN3LBgSOGx8P9lgh15H%2FWWskYFFe1n63NYQ%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"gonzalezlouis1981@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:12:\\\"Adamas Tools\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:14:\\\"both@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-07-29 11:57:25', '2024-07-29 11:57:25', NULL);
INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(33, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:169:\\\"http://127.0.0.1:8000/verify/email?expires=1722258496&signature=4zRgbdKYmMlM%2FM5pWIkib6SDKgL1s1o7R0JM%2FMzEpUc%3D&token=mH3DxTTlok8q%2BMoRDNE6dWb4BfuAvfpfqproVs0qzms%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"gonzalezlouis1981@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:12:\\\"Adamas Tools\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:7:\\\"de@dede\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-07-29 12:08:16', '2024-07-29 12:08:16', NULL),
(34, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:169:\\\"http://127.0.0.1:8000/verify/email?expires=1722260865&signature=YSXgEyq4F5kcO%2FSrdbBAmPFyIZ8icgW5kd3ekByBFd0%3D&token=U%2BQSxSlT3eQAk3vvOxH9Fihov54Jep%2FVL3noZk3nwc8%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"gonzalezlouis1981@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:12:\\\"Adamas Tools\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:20:\\\"eraseUser1@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-07-29 12:47:45', '2024-07-29 12:47:45', NULL),
(35, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:165:\\\"http://127.0.0.1:8000/verify/email?expires=1722260904&signature=%2Fzh5z9JbG7dcNQYl2UpsqCoiLOAdHf2OUeFT9ZGaL6s%3D&token=LhRQ8SmobwKaEypUcUAYWEliflblfBQCENyD59cbJrM%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"gonzalezlouis1981@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:12:\\\"Adamas Tools\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:20:\\\"eraseUser2@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-07-29 12:48:24', '2024-07-29 12:48:24', NULL),
(36, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:169:\\\"http://127.0.0.1:8000/verify/email?expires=1725284942&signature=r%2B7uYcCosDxP2hwOzQlOzMSUlkFazJjrpxxN%2BI10GdM%3D&token=dqm%2FJaZVucelq0PXX6JefxuKjNbbtMUdU7KdtecLdRs%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"gonzalezlouis1981@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:12:\\\"Adamas Tools\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:20:\\\"eraseUser1@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-09-02 12:49:02', '2024-09-02 12:49:02', NULL),
(37, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:169:\\\"http://127.0.0.1:8000/verify/email?expires=1725285001&signature=OxU63OZ1JcpbLhPr1IR9TucOWsXylVQDhXYdk9LxHZ8%3D&token=oG5i%2BZX3W%2F%2BoEQdfh3iW3qULKFgGHBEl4fJSb5RBMGI%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"gonzalezlouis1981@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:12:\\\"Adamas Tools\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:20:\\\"eraseUser2@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-09-02 12:50:01', '2024-09-02 12:50:01', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `published` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `modified_at` datetime NOT NULL,
  `slug` varchar(255) NOT NULL,
  `img_id` int(11) DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `author_id`, `title`, `content`, `published`, `created_at`, `modified_at`, `slug`, `img_id`, `is_hidden`) VALUES
(2963, 103, 'WiqpgIxPAH', 'TdgaUniNbtFmlZBpCoqx', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'WiqpgIxPAH', 3042, 0),
(2967, 103, 'pvsuNIrwkQ', 'wUTzmMSuAtHhxlReBgpG', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'pvsuNIrwkQ', 3046, 1),
(2968, 103, 'HoPjyNngxc', 'AFEUrxlDnVTayLRvdfhS', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'HoPjyNngxc', 3047, 1),
(2969, 103, 'mSqOpUfkgN', 'sTQajOcbfPvxICNrXdtW', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'mSqOpUfkgN', 3048, 0),
(2970, 103, 'pEGBbliwjP', 'qgjSpURNbXCfvkxuPWel', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'pEGBbliwjP', 3173, 0),
(2971, 103, 'TwJEVaivFh', 'NDRKscvQzOhUdPCHVgrt', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'TwJEVaivFh', 3050, 0),
(2972, 103, 'eUtwYFpSgh', 'cBLxkqhnMPtwHNRlmQaK', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'eUtwYFpSgh', 3051, 0),
(2973, 103, 'zEXxOWpjsq', 'VQXAauiNMERJsofbLnHC', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'zEXxOWpjsq', 3052, 0),
(2974, 103, 'VISzgOvHcN', 'blnxAyDEQRqWXmzFwHoj', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'VISzgOvHcN', 3053, 0),
(2976, 103, 'RNEczMbtfB', 'vcgwWqulPmCAjrHMLtVk', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'RNEczMbtfB', 3055, 0),
(2977, 103, 'lCckBFYsUr', 'uYzZoDIGfltwpTyNsQrX', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'lCckBFYsUr', 3056, 0),
(2978, 103, 'YpOAfWZDgG', 'poOAUemqWtwdifnGaTyL', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'YpOAfWZDgG', 3057, 0),
(2979, 103, 'JkpGRXjDdu', 'YMRbzdTiScUqluZVFvgH', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'JkpGRXjDdu', 3058, 0),
(2980, 103, 'kRBlmdYKSe', 'KTExruVNywAhMlsaCQoz', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'kRBlmdYKSe', 3059, 0),
(2981, 103, 'bTlKmdDjPA', 'aUwrhbDykjZNBmIYpQdS', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'bTlKmdDjPA', 3060, 0),
(2982, 103, 'bIRTHmzJnl', 'fGNBuepwiEmUtShKzXxn', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'bIRTHmzJnl', 3061, 0),
(2983, 103, 'UoZmtFXyBx', 'ZvpkgFSNlnsJzijcmLUI', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'UoZmtFXyBx', 3062, 0),
(2984, 103, 'gPUvIVLNhB', 'jnSYqArZGPtdxmEozLuC', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'gPUvIVLNhB', 3063, 0),
(2985, 103, 'pKDemuGJRt', 'JiHXUGfBWSKjQrYLPesg', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'pKDemuGJRt', 3064, 0),
(2986, 103, 'zmUPeKfTNI', 'ouPnQczXOqatvWZUwkEs', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'zmUPeKfTNI', 3065, 0),
(2987, 103, 'qzahVOonJi', 'wkzdOiCfqYuhKUSgcZTE', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'qzahVOonJi', 3066, 0),
(2988, 103, 'VqlaBPFnWA', 'tAmkYygNlWfswpJhFRBo', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'VqlaBPFnWA', 3067, 0),
(2989, 103, 'IQkVzriSqx', 'eJBhxoMTrybLvfDiUtcK', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'IQkVzriSqx', 3068, 0),
(2990, 103, 'ouIXCptWFE', 'CimtonXkzAugZBTfQYwW', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'ouIXCptWFE', 3069, 0),
(2991, 103, 'SyfgUuoYzJ', 'oaSdMhrfvqRsHiJxQGEY', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'SyfgUuoYzJ', 3070, 0),
(2992, 103, 'HVbdZohGet', 'xwRtqbFkIBSfszuWThCE', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'HVbdZohGet', 3071, 0),
(2993, 103, 'sGZHVKaAjL', 'ZHMsiBxgLtEuRaPIdcpq', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'sGZHVKaAjL', 3072, 0),
(2994, 103, 'ZIcguWMEvl', 'wmYVfRNjhiLvWaGrdcqb', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'ZIcguWMEvl', 3073, 0),
(2995, 103, 'HJuIqyPmxW', 'bKCczmrUGOANESLtfdRP', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'HJuIqyPmxW', 3074, 0),
(2996, 103, 'CsNrjDWkVO', 'KLZbnAfNuIzCvihYtBOm', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'CsNrjDWkVO', 3075, 0),
(2997, 103, 'MuRsoIycJU', 'PbLYRnQKwFXSIugoEzpH', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'MuRsoIycJU', 3076, 0),
(2998, 103, 'wQNbsVBOcr', 'waSdYhbepCGxnoyLkslN', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'wQNbsVBOcr', 3077, 0),
(2999, 103, 'AxKztfFRhY', 'HcxMEezYjgpWfQlOhUIF', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'AxKztfFRhY', 3078, 0),
(3000, 103, 'aNMIpuFODf', 'qdesXNjhMnTGJxAKklbz', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'aNMIpuFODf', 3079, 0),
(3001, 103, 'rmzvFTMQas', 'njFwvEipqlAsXMQPJBtx', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'rmzvFTMQas', 3080, 0),
(3002, 103, 'YAyFDNcPxv', 'rNlASWugeZHowqvYUBGC', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'YAyFDNcPxv', 3081, 0),
(3003, 103, 'NkYtsSKFqc', 'zdWMwDQXlgGNpsaxKrcT', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'NkYtsSKFqc', 3082, 0),
(3004, 103, 'TvOSrfAiRg', 'bipgZJXkAQtOWrGCRxFa', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'TvOSrfAiRg', 3083, 0),
(3005, 103, 'AlbHTgiRhJ', 'ChKcfMgdBswXValHxJQj', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'AlbHTgiRhJ', 3084, 0),
(3006, 103, 'wLHePIAgDC', 'NWYsLQfcbgVdktSweAHx', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'wLHePIAgDC', 3085, 0),
(3007, 103, 'dHUNrxkhCe', 'nQfxvMureAXlIzBCacOo', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'dHUNrxkhCe', 3086, 0),
(3008, 103, 'EZaMvInrDe', 'nODtFoXTdlWMiBYHUAQZ', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'EZaMvInrDe', 3087, 0),
(3009, 103, 'IBCUAgsVRY', 'pbyGViScFBEZgatqfuTO', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'IBCUAgsVRY', 3088, 0),
(3010, 103, 'sVWzvNGhJe', 'cxIFqUoaesNdSYuwgTKr', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'sVWzvNGhJe', 3089, 0),
(3011, 103, 'lPyAnboBgh', 'ZfjNpkLYQPcEeuBIMRys', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'lPyAnboBgh', 3090, 0),
(3012, 103, 'jMWpwamTZB', 'jiITRMpFEorSGWztKJHZ', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'jMWpwamTZB', 3091, 0),
(3013, 103, 'jdeVKirhWg', 'pHlrOhdkIPRmKZijnUqw', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'jdeVKirhWg', 3092, 0),
(3014, 103, 'XhaRipQDmw', 'wNxOUPybFaZJeGpjHYkf', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'XhaRipQDmw', 3093, 0),
(3015, 103, 'arDGbSiPfw', 'HNeaksRMiAlELcSfyFnp', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'arDGbSiPfw', 3094, 0),
(3016, 103, 'QvLpjNgCPM', 'WTbPfsyaDOUBgpNARLFi', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'QvLpjNgCPM', 3095, 0),
(3017, 103, 'cIkwFxRolS', 'GzjVtQvBlaukqXKODUpb', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'cIkwFxRolS', 3096, 0),
(3018, 103, 'kJnaLTimuH', 'bjkVsKetCRfQFXZnBUaI', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'kJnaLTimuH', 3097, 0),
(3019, 103, 'ZYTxiKfQeH', 'HIgOPkzTQRvNBqLCSdtZ', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'ZYTxiKfQeH', 3098, 0),
(3020, 103, 'TvoDmZpYSM', 'WYHEkvsGPCTxQJjiMnSd', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'TvoDmZpYSM', 3099, 0),
(3021, 103, 'NMCVXqWFZo', 'YljXaOgpKhBDkQVnZetC', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'NMCVXqWFZo', 3100, 0),
(3022, 103, 'qTFIdbXPyC', 'siBPlwCxdESJeOkpLmoc', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'qTFIdbXPyC', 3101, 0),
(3023, 103, 'KTBjHaeIXv', 'wKdUxyAkfbBevlmsSCLX', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'KTBjHaeIXv', 3102, 0),
(3024, 103, 'dcDHjyGrFb', 'lBmXYosCLZaTPEWfntgv', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'dcDHjyGrFb', 3103, 0),
(3025, 103, 'EHRJZiTuGx', 'eUoVLzZDWIsQgjKXqREx', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'EHRJZiTuGx', 3104, 0),
(3026, 103, 'oPCxeZdNOG', 'DKdJGjimxcVPaHfwqvSz', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'oPCxeZdNOG', 3105, 0),
(3027, 103, 'wjBmuKpHbZ', 'iqxkbrzjlEMJOuDAhaKQ', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'wjBmuKpHbZ', 3106, 0),
(3028, 103, 'qGpeBZrJvT', 'ukNQHIzAZiPSBvwJLjYG', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'qGpeBZrJvT', 3107, 0),
(3029, 103, 'SkJHifFzeA', 'qlNsZXrUytbPBkvDxdHA', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'SkJHifFzeA', 3108, 0),
(3030, 103, 'EboQApKhtu', 'fexEQlTmpOuirzGSdJUk', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'EboQApKhtu', 3109, 0),
(3031, 103, 'SUzXcHRfiP', 'kjIzYySfKDbQXruAFUgV', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'SUzXcHRfiP', 3110, 0),
(3032, 103, 'hYVDpXqWIz', 'xwNubTiCcfhzdmPOjEWy', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'hYVDpXqWIz', 3111, 0),
(3033, 103, 'ULykCmaPIr', 'hBmcHjQSzdMFvqoJnWiK', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'ULykCmaPIr', 3112, 0),
(3034, 103, 'DRoELQWSmT', 'CxSBucGDfFwvmVXNqWER', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'DRoELQWSmT', 3113, 0),
(3035, 103, 'AaBCicQvzp', 'jaETrHgAcCyLzbulkpXD', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'AaBCicQvzp', 3114, 0),
(3036, 103, 'KgXiLJzRAS', 'HtFshKBQWpakdbjMTNPC', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'KgXiLJzRAS', 3115, 0),
(3037, 103, 'RYHjnkMSep', 'nVmorpiHUstvDGZaOycb', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'RYHjnkMSep', 3116, 0),
(3038, 103, 'LxrpuIXijC', 'VsUcuAfHdRSQrhpFWqzZ', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'LxrpuIXijC', 3117, 0),
(3039, 103, 'dOgXvMVrpQ', 'TDXPsERtiavcZLfAwlnx', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'dOgXvMVrpQ', 3118, 0),
(3040, 103, 'goRUuhmWbX', 'RYLuJWqmHEtlKUgbNjxh', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'goRUuhmWbX', 3119, 0),
(3041, 103, 'trXHjLewmp', 'FGOvAmRalCfUVqiEWyYn', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'trXHjLewmp', 3120, 0),
(3042, 103, 'NOoJmEtTKj', 'zaOICAfvbgBpckDmZQql', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'NOoJmEtTKj', 3121, 0),
(3043, 103, 'fEpvcQMyqS', 'whAFNUbclPGDVfrCYXjp', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'fEpvcQMyqS', 3122, 0),
(3044, 103, 'krmPWFnQTv', 'SoYQnkrbezqDRwGMPVOC', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'krmPWFnQTv', 3123, 0),
(3045, 103, 'hqfyUPnpCH', 'IANJrwhZzaHdSmbosRKW', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'hqfyUPnpCH', 3124, 0),
(3046, 103, 'KwiPGVZLNf', 'JZeXytVEnkzMQFSbwdrW', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'KwiPGVZLNf', 3125, 0),
(3047, 103, 'MTnFNbXfRz', 'IqxJCzvrZyQFgUkpWRBj', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'MTnFNbXfRz', 3126, 0),
(3048, 103, 'FxEHOrgWCu', 'takOJAxoEnujTHzrhZqW', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'FxEHOrgWCu', 3127, 0),
(3049, 103, 'GWqrtSUpua', 'NcobrAfWSqeUFVlOsuaH', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'GWqrtSUpua', 3128, 0),
(3050, 103, 'uDZxPSUEQL', 'pJgfCFwveRNoKhqyAlOV', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'uDZxPSUEQL', 3129, 0),
(3051, 103, 'CLtaWusXBN', 'fjbZiBJERTGuIFLwPdQW', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'CLtaWusXBN', 3130, 0),
(3052, 103, 'AnpMuNBjEw', 'YwLNQGUlPSWDmiqCbHuZ', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'AnpMuNBjEw', 3131, 0),
(3053, 103, 'ceSnPHXwDR', 'FWoTPrktauqXYcwpDKgR', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'ceSnPHXwDR', 3132, 0),
(3054, 103, 'IqVlZxrgbR', 'mPWNLoDyqczFBrVfMxXg', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'IqVlZxrgbR', 3133, 0),
(3055, 103, 'bIflDcuExP', 'LkacBYyWdjMUGsFRKpeJ', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'bIflDcuExP', 3134, 0),
(3056, 103, 'pNqWaxcXCE', 'gzbKXuHenWomRhOsdqCZ', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'pNqWaxcXCE', 3135, 0),
(3057, 103, 'LEHSGBzngN', 'AJNIsmMPacBSXqyLWHGF', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'LEHSGBzngN', 3136, 0),
(3058, 103, 'fvIMOdEKkq', 'UjiAsgfbaGFtJDhOoYNH', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'fvIMOdEKkq', 3137, 0),
(3059, 103, 'JcxEuLfYVH', 'grQKSvdLMRyCxcOfAbti', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'JcxEuLfYVH', 3138, 0),
(3060, 103, 'sunYcdOPgw', 'DwdPJWIbTjyZkixKLqom', 1, '2024-04-04 16:49:02', '2024-09-02 14:47:29', 'sunYcdOPgw', 3139, 0),
(3062, 105, 'post albert', 'hyhyhy', 1, '2024-04-10 10:18:12', '2024-09-02 14:47:29', 'post-albert', 3174, 0),
(3063, 105, 'titotototototo', 'hyhyhyjkkilolo', 1, '2024-04-10 10:19:02', '2024-09-02 15:52:33', 'titotototototo', 3189, 0),
(3064, 104, 'dededede', 'dededefrfrgtgthyhyj', 1, '2024-04-10 10:19:33', '2024-09-02 14:47:29', 'dededede', 3143, 0),
(3069, 104, 'new post editor exemple', 'fjiokdjfpodjfpodjsqùpjùdlvùs', 1, '2024-05-21 14:05:04', '2024-09-02 18:05:36', 'new-post-editor-exemple', 3168, 1);

-- --------------------------------------------------------

--
-- Structure de la table `upload_file`
--

CREATE TABLE `upload_file` (
  `id` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `modified_at` datetime NOT NULL,
  `is_private` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `upload_file`
--

INSERT INTO `upload_file` (`id`, `img`, `created_at`, `modified_at`, `is_private`) VALUES
(3042, 'pexels-photo-18749703.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3043, 'free-photo-of-mode-homme-graffiti-rochers.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3044, 'free-photo-of-bois-mer-route-paysage.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3045, 'free-photo-of-ville-maisons-eau-batiments.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3046, 'pexels-photo-13289844.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3047, 'pexels-photo-7088756.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3048, 'pexels-photo-15625357.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3049, 'pexels-photo-20609660.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3050, 'pexels-photo-10122254.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3051, 'free-photo-of-route-paysage-homme-gens.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3052, 'free-photo-of-bois-route-aube-paysage.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3053, 'free-photo-of-soleil-couchant-coucher-de-soleil-coucher-du-soleil-homme.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3054, 'pexels-photo-19889816.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3055, 'pexels-photo-19791355.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3056, 'free-photo-of-femme-cafe-tasse-boire.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3057, 'pexels-photo-3974517.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3058, 'free-photo-of-sain-nature-mode-femme.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3059, 'free-photo-of-fleurs-paques-oeufs-fete.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3060, 'pexels-photo-20211133.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3061, 'free-photo-of-mer-femme-detente-relaxation.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3062, 'free-photo-of-bois-route-paysage-eau.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3063, 'free-photo-of-nature-jardin-parc-feuille.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3064, 'pexels-photo-20520466.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3065, 'free-photo-of-de-haut-en-bas-vers-l-est-de-new-york.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3066, 'pexels-photo-4200287.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3067, 'pexels-photo-10874333.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3068, 'plage-660d2ec3948de.jpg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3069, 'pexels-photo-6679623.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3070, 'pexels-photo-19960599.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3071, 'pexels-photo-19109865.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3072, 'free-photo-of-bois-ville-paysage-vacances.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3073, 'pexels-photo-6966616.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3074, 'free-photo-of-homme-dehors-promenade-promenade-en-bois.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3075, 'pexels-photo-20582699.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3076, 'pexels-photo-14261217.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3077, 'pexels-photo-20720452.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3078, 'pexels-photo-20574181.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3079, 'dragon3.jpg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3080, 'free-photo-of-bois-lumineux-leger-paysage.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3081, 'free-photo-of-explosion-de-couleur-expressionnisme-abstrait-des-couleurs-vives-tourbillons-abstraits.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3082, 'pexels-photo-19967332.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3083, 'pexels-photo-11823968.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3084, 'pexels-photo-4733657.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3085, 'pexels-photo-14632859.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3086, 'free-photo-of-jambes-detente-relaxation-chaussures.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3087, 'mountain.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3088, 'pexels-photo-16774962.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3089, 'pexels-photo-20211127.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3090, 'free-photo-of-animal-campagne-brun-marron.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3091, 'free-photo-of-ville-gens-personnes-individus.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3092, 'free-photo-of-detente-relaxation-clairiere-terrain.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3093, 'free-photo-of-noir-et-blanc-ville-art-rue.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3094, 'plage.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3095, 'pexels-photo-3996242.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3096, 'free-photo-of-lumineux-leger-noir-et-blanc-ville2.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3097, 'free-photo-of-en-regardant-la-mer.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3098, 'free-photo-of-ensoleille-soleil-clairiere-terrain.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3099, 'pexels-photo-20598967.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3100, 'pexels-photo-14602293.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3101, 'free-photo-of-sable-monument-desert-ciel-bleu.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3102, 'free-photo-of-nature-branches-tronc-centrale.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3103, 'free-photo-of-mentir-danger-se-reposer-exotique.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3104, 'pexels-photo-5546102.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3105, 'free-photo-of-femme-verre-robe-fenetres.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3106, 'pexels-photo-11962503.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3107, 'pexels-photo-6991569.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3108, 'post.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3109, 'mountain-660d2eb55edaa.jpg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3110, 'free-photo-of-ville-monument-pont-italie.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3111, 'pexels-photo-20722851.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3112, 'pexels-photo-14288495.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3113, 'pexels-photo-8408541.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3114, 'dragon1.jpg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3115, 'pexels-photo-14132917.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3116, 'free-photo-of-mer-aube-soleil-couchant-coucher-de-soleil.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3117, 'pexels-photo-11113558.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3118, 'pexels-photo-20354065.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3119, 'pexels-photo-20284640.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3120, 'free-photo-of-mer-plage-art-eau.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3121, 'free-photo-of-lumineux-leger-noir-et-blanc-ville.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3122, 'free-photo-of-aube-paysage-clairiere-terrain.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3123, 'pexels-photo-2210192.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3124, 'pexels-photo-19126536.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3125, 'free-photo-of-mer-plage-rochers-cailloux.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3126, 'free-photo-of-mer-ville-eau-building.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3127, 'dragon4.jpg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3128, 'free-photo-of-tournesol.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3129, 'dragon2.jpg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3130, 'pexels-photo-20801057.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3131, 'pexels-photo-14733525.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3132, 'free-photo-of-lumineux-leger-noir-et-blanc-ville3.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3133, 'free-photo-of-bois-ville-route-gens.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3134, 'pexels-photo-14608971.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3135, 'free-photo-of-ville-building-batiment-immeuble.jpg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3136, 'pexels-photo-7381200.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3137, 'free-photo-of-mer-noir-et-blanc-paysage-plage.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3138, 'free-photo-of-mer-nature-plage-vacances.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3139, 'free-photo-of-vacances-femme-detente-relaxation.jpeg', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3140, 'pexels-photo-20548064.webp', '2024-04-04 16:49:01', '2024-04-04 16:49:01', 0),
(3141, 'dragon1-66164b44ed332.jpg', '2024-04-10 10:18:12', '2024-04-10 10:18:12', 0),
(3142, 'free-photo-of-animal-campagne-brun-marron-66164b762b20e.jpg', '2024-04-10 10:19:02', '2024-04-10 10:19:02', 0),
(3143, 'free-photo-of-bois-ville-route-gens-66164b95c5713.jpg', '2024-04-10 10:19:33', '2024-04-10 10:19:33', 0),
(3144, 'pexels-photo-14261217-66164bb3cb171.webp', '2024-04-10 10:20:03', '2024-04-10 10:20:03', 0),
(3145, 'dragon4-661791f799310.jpg', '2024-04-11 09:32:07', '2024-04-11 09:32:07', 0),
(3146, 'free-photo-of-animal-campagne-brun-marron-661792a2b32ca.jpg', '2024-04-11 09:34:58', '2024-04-11 09:34:58', 1),
(3147, 'Group-1-664319285807c.png', '2024-05-14 09:56:26', '2024-05-14 09:56:26', 0),
(3149, 'hakiahabara-6643357c0f266.png', '2024-05-14 11:57:16', '2024-05-14 11:57:16', 0),
(3151, 'LEGO-logo-svg-664339a7b59dd.png', '2024-05-14 12:15:04', '2024-05-14 12:15:04', 1),
(3154, 'heldivers2-66436b33379c9.jpg', '2024-05-14 15:46:27', '2024-05-14 15:46:27', 1),
(3155, 'user-66436b68e0917.png', '2024-05-14 15:47:20', '2024-05-14 15:47:20', 1),
(3156, 'editor-66436b8ab5706.png', '2024-05-14 15:47:54', '2024-05-14 15:47:54', 0),
(3157, 'admin-66436bb913c1a.png', '2024-05-14 15:48:41', '2024-05-14 15:48:41', 0),
(3158, 'user-664b33d717e7d.png', '2024-05-20 13:28:23', '2024-05-20 13:28:23', 1),
(3160, 'heldivers2-664c7876b1f90.jpg', '2024-05-21 12:33:26', '2024-05-21 12:33:26', 0),
(3161, 'LEGO-logo-svg-664c8b8c9e3e7.png', '2024-05-21 13:54:52', '2024-05-21 13:54:52', 0),
(3162, 'comments-664c8b9882f66.jpg', '2024-05-21 13:55:04', '2024-05-21 13:55:04', 0),
(3163, 'LEGO-logo-svg-664c8bb43f5a9.png', '2024-05-21 13:55:32', '2024-05-21 13:55:32', 1),
(3164, 'LEGO-logo-svg-664c8bef2d969.png', '2024-05-21 13:56:31', '2024-05-21 13:56:31', 1),
(3165, 'utilisateurs-664c8c799a8cf.png', '2024-05-21 13:58:49', '2024-05-21 13:58:49', 0),
(3166, 'posts-664c8cdd9172d.png', '2024-05-21 14:00:29', '2024-05-21 14:00:29', 0),
(3167, 'logo-fb-664c8cf6b6394.png', '2024-05-21 14:00:54', '2024-05-21 14:00:54', 0),
(3168, 'free-photo-of-pain-nourriture-aliments-bois-664c8df047282.jpg', '2024-05-21 14:05:04', '2024-05-21 14:05:04', 0),
(3169, 'logo-fb-664c94962752b.png', '2024-05-21 14:33:26', '2024-05-21 14:33:26', 0),
(3172, 'user-664c995b54dbe.png', '2024-05-21 14:53:48', '2024-05-21 14:53:48', 1),
(3173, 'heldivers2-664c9ae09714d.jpg', '2024-05-21 15:00:16', '2024-05-21 15:00:16', 0),
(3174, 'Capture-d-ecran-2024-07-23-152502-66a3b1266ec21.png', '2024-07-26 16:22:30', '2024-07-26 16:22:30', 0),
(3178, 'Capture-d-ecran-2024-07-06-105240-66a763924c6a6.png', '2024-07-29 11:40:34', '2024-07-29 11:40:34', 0),
(3183, 'about-me-66d57fdd0b6fb.png', '2024-09-02 11:05:33', '2024-09-02 11:05:33', 0),
(3186, 'IMG-20240513-WA0005-66d5c001ae933.jpg', '2024-09-02 15:39:13', '2024-09-02 15:39:13', 0),
(3187, 'IMG-20240513-WA0005-66d5c2d5b2495.jpg', '2024-09-02 15:51:17', '2024-09-02 15:51:17', 0),
(3188, 'entraide-66d5c30f92b60.png', '2024-09-02 15:52:15', '2024-09-02 15:52:15', 0),
(3189, 'Capture-d-ecran-2024-07-06-105240-66d5c321d05cf.png', '2024-09-02 15:52:33', '2024-09-02 15:52:33', 0),
(3190, 'Capture-d-ecran-2024-04-24-205757-66d5e20dbc461.png', '2024-09-02 18:04:29', '2024-09-02 18:04:29', 0);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `avatar_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `roles`, `password`, `is_verified`, `avatar_id`) VALUES
(103, 'admin', 'admin@admin.com', '[\"ROLE_ADMIN\"]', '$2y$13$r8TM4T5a/3o.TlSRnHKiWuZtHJZbradhTEt6.3J2Ud8KUY9LXUATW', 1, 3157),
(104, 'editor', 'editor@editor.com', '[\"ROLE_EDITOR\"]', '$2y$13$YUpdxyYx7DRNaeOpOFP/2u0tvADLE1xtfrz6TfMJpZrx2kpsbcER6', 1, 3156),
(105, 'user', 'user@user.com', '[\"ROLE_USER\"]', '$2y$13$Vqu7dnaBSukU3WMHNy9OAuQwk/s7lxPMdy6WGi7W75cZ5MoriVNUq', 1, 3155),
(106, 'leboss', 'leboss@leboss.com', '[\"ROLE_ADMIN\"]', '$2y$13$ymYfkQ1nlAE6JWGmOutE6eoocNh4CJj5YlbVslJRomZRc0R.J/TNC', 1, 3154),
(108, 'null', 'null@gmail.com', '[]', '$2y$13$T/44OUhsE1b1WFZY3oLMg.1gneqm5SoLOpOiKXDS3hG0MQ9CR1fA.', 1, 3178),
(111, 'toto', 'totototo@toto.com', '[]', '$2y$13$6LZ.v0/ij9MXu5dWM0EQ2emWUSWXOcIH.lo4RcKseAIefON1tJUZG', 0, 3151),
(113, 'anonymous', 'anonymous@anonymous.com', '[]', '$2y$13$BIst9L75ppXC5nDGh5F9ZeUn2NWj57DrxNIaJW/jyjoOWrvD/QlrS', 0, 3158),
(114, 'newuser1', 'newuser@user.com', '[]', '$2y$13$8Wd6RClU1a/FBeB89r3XC.4T3aCK7JhPcEwb6Iz0Bp5JeAmKfvpk.', 0, 3172);

-- --------------------------------------------------------

--
-- Structure de la table `user_archive`
--

CREATE TABLE `user_archive` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `avatar_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526CA76ED395` (`user_id`),
  ADD KEY `IDX_9474526C4B89032C` (`post_id`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4C62E638A76ED395` (`user_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_5A8A6C8D989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_5A8A6C8D2B36786B` (`title`),
  ADD UNIQUE KEY `UNIQ_5A8A6C8DC06A9F55` (`img_id`),
  ADD KEY `IDX_5A8A6C8DF675F31B` (`author_id`);

--
-- Index pour la table `upload_file`
--
ALTER TABLE `upload_file`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`),
  ADD UNIQUE KEY `UNIQ_8D93D64986383B10` (`avatar_id`);

--
-- Index pour la table `user_archive`
--
ALTER TABLE `user_archive`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3074;

--
-- AUTO_INCREMENT pour la table `upload_file`
--
ALTER TABLE `upload_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3191;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT pour la table `user_archive`
--
ALTER TABLE `user_archive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C4B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `FK_4C62E638A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_5A8A6C8DC06A9F55` FOREIGN KEY (`img_id`) REFERENCES `upload_file` (`id`),
  ADD CONSTRAINT `FK_5A8A6C8DF675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D64986383B10` FOREIGN KEY (`avatar_id`) REFERENCES `upload_file` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
