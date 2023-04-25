SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `metro_lines`;
CREATE TABLE `metro_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `metro_lines` (`id`, `name`, `color`, `start_date`) VALUES
(1,	'Заводська лінія',	'red',	'1984-03-05'),
(2,	'Олексіївська лінія',	'green',	'1995-03-05');

DROP TABLE IF EXISTS `metro_stations`;
CREATE TABLE `metro_stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_number` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `line_id` (`line_id`),
  CONSTRAINT `metro_stations_ibfk_2` FOREIGN KEY (`line_id`) REFERENCES `metro_lines` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `metro_stations` (`id`, `station_number`, `line_id`, `name`) VALUES
(1,	1,	1,	'Індустріальна'),
(3,	8,	1,	'Спортивна'),
(4,	1,	2,	'Метробудівників');

DROP TABLE IF EXISTS `metro_transitions`;
CREATE TABLE `metro_transitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line_id` int(11) NOT NULL,
  `from_station_id` int(11) NOT NULL,
  `to_station_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `line_id` (`line_id`),
  KEY `from_station_id` (`from_station_id`),
  KEY `to_station_id` (`to_station_id`),
  CONSTRAINT `metro_transitions_ibfk_2` FOREIGN KEY (`line_id`) REFERENCES `metro_lines` (`id`),
  CONSTRAINT `metro_transitions_ibfk_3` FOREIGN KEY (`from_station_id`) REFERENCES `metro_stations` (`id`),
  CONSTRAINT `metro_transitions_ibfk_4` FOREIGN KEY (`to_station_id`) REFERENCES `metro_stations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `metro_transitions` (`id`, `line_id`, `from_station_id`, `to_station_id`, `name`, `type`) VALUES
(3,	1,	3,	4,	'Перехід зі станції Спортивна на станцію Метробудівників',	'stairs');