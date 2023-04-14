SELECT cities.name, regions.name AS region_name
FROM cities, regions
WHERE cities.region = regions.uuid AND cities.population > 350000;

SELECT cities.name
FROM cities
INNER JOIN regions ON cities.region = regions.uuid
WHERE regions.name = 'Nord';

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `metro_cities`;
CREATE TABLE `metro_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `metro_cities` (`id`, `name`) VALUES
(1,	'Харків'),
(2,	'Київ'),
(3,	'Лондон');

DROP TABLE IF EXISTS `metro_elements`;
CREATE TABLE `metro_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `line_id` (`line_id`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `metro_elements_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `metro_cities` (`id`),
  CONSTRAINT `metro_elements_ibfk_2` FOREIGN KEY (`line_id`) REFERENCES `metro_lines` (`id`),
  CONSTRAINT `metro_elements_ibfk_3` FOREIGN KEY (`station_id`) REFERENCES `metro_stations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `metro_elements` (`id`, `city_id`, `line_id`, `station_id`, `name`, `type`) VALUES
(1,	1,	1,	3,	'Перехід зі станції Майдан Конституції на станцію Історичний музей',	'stairs');

DROP TABLE IF EXISTS `metro_lines`;
CREATE TABLE `metro_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `metro_lines_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `metro_cities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `metro_lines` (`id`, `city_id`, `name`, `color`, `start_date`) VALUES
(1,	1,	'Салтівська лінія',	'blue',	'1984-03-05'),
(2,	1,	'Олексіївська лінія',	'green',	'1995-03-05'),
(3,	3,	'Central',	'red',	'1900-03-05');

DROP TABLE IF EXISTS `metro_stations`;
CREATE TABLE `metro_stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `line_id` (`line_id`),
  CONSTRAINT `metro_stations_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `metro_cities` (`id`),
  CONSTRAINT `metro_stations_ibfk_2` FOREIGN KEY (`line_id`) REFERENCES `metro_lines` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `metro_stations` (`id`, `city_id`, `line_id`, `name`) VALUES
(1,	1,	1,	'Індустріальна'),
(2,	3,	3,	'Greenford'),
(3,	1,	1,	'Майдан Конституції');