SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `publication_date` date NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `news` (`id`, `category`, `text`, `publication_date`, `author`) VALUES
(1,	'Суспільне',	'Президенти всіх країн привітали громадян з новим роком',	'2023-05-05',	'Олексій Іванов'),
(2,	'Кримінальні',	'В Києві сталося пограбування магазина',	'2023-05-05',	'Ігор Мартинюк');

DROP TABLE IF EXISTS `news_comments`;
CREATE TABLE `news_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`),
  CONSTRAINT `news_comments_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `news` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `news_comments` (`id`, `article_id`, `text`, `date`, `author`) VALUES
(1,	1,	'З новим роком!',	'2023-05-05',	'user_nickname'),
(2,	2,	'Який жах',	'2023-05-05',	'user1_nickname');

DROP TABLE IF EXISTS `news_ratings`;
CREATE TABLE `news_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`),
  CONSTRAINT `news_ratings_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `news` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `news_ratings` (`id`, `article_id`, `rating`, `ip`) VALUES
(1,	1,	5,	'193.20.160.46'),
(2,	2,	3,	'133.135.134.92');