-- --------------------------------------------------------
-- Hostiteľ:                     127.0.0.1
-- Verze serveru:                10.4.22-MariaDB - mariadb.org binary distribution
-- OS serveru:                   Win64
-- HeidiSQL Verzia:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Exportování struktury pro tabulka eshop.merchants
CREATE TABLE IF NOT EXISTS `merchants` (
  `id` int(11) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `merchant_name` varchar(50) DEFAULT NULL,
  `created at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportování dat pro tabulku eshop.merchants: ~10 rows (přibližně)
/*!40000 ALTER TABLE `merchants` DISABLE KEYS */;
INSERT INTO `merchants` (`id`, `country`, `merchant_name`, `created at`) VALUES
	(1, 'Ukrajina', 'Nay', '2012-01-07'),
	(2, 'Slovakia', 'Alza', '2012-01-01'),
	(3, 'Poland', 'Datart', '2014-02-11'),
	(4, 'Slovakia', 'Datart', '2016-05-08'),
	(5, 'England', 'Alza', '2013-10-13'),
	(6, 'Slovakia', 'Nay', '2019-01-15'),
	(7, 'Poland', 'Alza', '2011-06-11'),
	(8, 'England', 'Nay', '2021-03-11'),
	(9, 'England', 'Datart', '2019-01-05'),
	(10, 'Ukrajina', 'Alza', '2015-11-11');
/*!40000 ALTER TABLE `merchants` ENABLE KEYS */;

-- Exportování struktury pro tabulka eshop.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_orders_users` (`user_id`),
  CONSTRAINT `FK_orders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportování dat pro tabulku eshop.orders: ~10 rows (přibližně)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `user_id`, `created_at`) VALUES
	(1, 11, '2022-01-11'),
	(2, 12, '2022-01-11'),
	(3, 12, '2022-01-11'),
	(4, 12, '2022-01-11'),
	(5, 15, '2022-01-11'),
	(6, 15, '2022-01-11'),
	(7, 13, '2022-01-11'),
	(8, 14, '2022-01-11'),
	(9, 14, '2022-01-11'),
	(10, 12, '2022-01-11');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Exportování struktury pro tabulka eshop.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_order_items_products` (`product_id`),
  KEY `FK_order_items_orders` (`order_id`),
  CONSTRAINT `FK_order_items_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_order_items_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportování dat pro tabulku eshop.order_items: ~15 rows (přibližně)
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`) VALUES
	(1, 1, 6, 1),
	(2, 2, 6, 1),
	(3, 3, 6, 32),
	(4, 4, 6, 3),
	(5, 4, 5, 1),
	(6, 5, 1, 3),
	(7, 5, 2, 2),
	(8, 7, 8, 1),
	(9, 8, 10, 2),
	(10, 9, 7, 3),
	(11, 6, 3, 1),
	(12, 10, 6, 2),
	(13, 1, 4, 2),
	(14, 2, 2, 2),
	(15, 10, 1, 2);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;

-- Exportování struktury pro tabulka eshop.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `merchant_id` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created at` date DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_products_merchants` (`merchant_id`),
  CONSTRAINT `FK_products_merchants` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportování dat pro tabulku eshop.products: ~10 rows (přibližně)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name`, `merchant_id`, `price`, `status`, `created at`, `description`) VALUES
	(1, 'Phone', 6, 100, 'In', '2015-01-11', 'A mobile phone is a wireless handheld device that '),
	(2, 'Phone', 8, 120, 'In', '2017-01-16', 'Later, mobile phones belonging to the Global Syste'),
	(3, 'Phone', 2, 110, 'Out', '2015-09-11', 'The first mobile phones, as mentioned, were only u'),
	(4, 'Laptop', 7, 500, 'In', '2017-11-11', 'A laptop, laptop computer, or notebook computer is'),
	(5, 'Laptop', 5, 550, 'In', '2016-04-11', ' a small, portable personal computer (PC) with a s'),
	(6, 'Laptop', 10, 520, 'Out', '2019-04-11', 'Today, laptops are used in a variety of settings, '),
	(7, 'Tevision', 3, 350, 'In', '2020-01-13', 'an electronic system of transmitting transient ima'),
	(8, 'Television', 1, 320, 'In', '2020-01-21', 'fixed or moving objects together with sound over a'),
	(9, 'Television', 4, 280, 'In', '2021-08-11', 'Television, sometimes shortened to TV or telly, is'),
	(10, 'Television', 9, 370, 'Out', '2019-09-09', 'television show, or the medium of television trans');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Exportování struktury pro tabulka eshop.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users_merchants` (`admin_id`),
  CONSTRAINT `FK_users_merchants` FOREIGN KEY (`admin_id`) REFERENCES `merchants` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportování dat pro tabulku eshop.users: ~15 rows (přibližně)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `admin_id`, `country`, `email`, `phone_number`) VALUES
	(1, 'Liam', 5, 'Slovak', 'liam@gmail.com', 6226426468),
	(2, 'Noah', 9, 'Poland', 'noah@gmail.com', 2144236836),
	(3, 'Oliver', 8, 'Poland', 'oliver@gmail.com', 2753574837),
	(4, 'Elijah', 7, 'Poland', 'elijah@gmail.com', 2573757368),
	(5, 'William', 6, 'Slovak', 'william@gmail.com', 2722372737),
	(6, 'James', 2, 'Slovak', 'james@gmail.com', 7867864684),
	(7, 'Benjamin', 4, 'Ukrajine', 'benjamin@gmail.com', 4687643536),
	(8, 'Lucas', 1, 'Ukrajine', 'lucas@gmail.com', 7864564648),
	(9, 'Henry', 10, 'Ukrajine', 'henry@gmail.com', 4686464586),
	(10, 'Alexander', 3, 'Slovak', 'alex@gmail.com', 4864564867),
	(11, 'Olivia', NULL, 'England', 'olivia@gmail.com', 4786786487),
	(12, 'Emma', NULL, 'Poland', 'emma@gmail.com', 5578563755),
	(13, 'Ava', NULL, 'Ukrajine', 'ava@gmail.com', 7864564856),
	(14, 'Mia', NULL, 'Slovak', 'mia@gmail.com', 4864864855),
	(15, 'Evelyn', NULL, 'Slovak', 'eve@gmail.com', 4864564868);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
