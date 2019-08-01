-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 16 2019 г., 21:38
-- Версия сервера: 5.7.23
-- Версия PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `cat_name` varchar(45) NOT NULL,
  `browser_name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `cat_name`, `browser_name`) VALUES
(1, 'sets', 'Сеты'),
(2, 'sushi', 'Суши'),
(3, 'rolls', 'Роллы');

-- --------------------------------------------------------

--
-- Структура таблицы `good`
--

CREATE TABLE `good` (
  `id` int(11) NOT NULL,
  `category` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `composition` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `link_name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';

--
-- Дамп данных таблицы `good`
--

INSERT INTO `good` (`id`, `category`, `name`, `composition`, `price`, `descr`, `img`, `link_name`) VALUES
(1, 'sets', 'Сет Запеченный', 'запеченные роллы', 800, 'lorem', 'baked.jpg', 'baked_set'),
(2, 'sets', 'Сет Филамикс', 'три разных ролла Филадельфия', 950, 'lorem', 'philaset.jpg', 'phila_set'),
(3, 'rolls', 'Ролл Филадельфия', 'лосось, сливочный сыр', 300, 'lorem', 'phila.jpg', 'phila'),
(4, 'rolls', 'Ролл Калифорния', 'краб, огурец, масаго', 200, 'lorem', 'california.jpg', 'california'),
(5, 'sushi', 'Суши Лосось', 'лосось, рис', 100, 'lorem', 'salmon.jpg', 'salmon'),
(6, 'sushi', 'Суши Угорь', 'угорь, рис', 110, 'lorem', 'eel.jpg', 'eel');

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `sum` int(11) NOT NULL,
  `status` enum('Новый','Завершен') NOT NULL DEFAULT 'Новый'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `date`, `name`, `email`, `phone`, `address`, `sum`, `status`) VALUES
(13, '2019-01-20 16:51:52', 'Василий', 'vasickru@mail.ru', '+79518190825', 'Школьная 1/32', 4710, 'Завершен'),
(38, '2019-01-21 06:51:16', '123', 'vasickru@mail.ru', '+79518190825', 'Свердловский Тракт ү', 100, 'Новый'),
(39, '2019-01-28 08:20:29', 'Василий', '1@1.ru', '+79518190825', 'Свердловский Тракт ү', 1900, 'Новый'),
(40, '2019-01-28 08:38:19', '123', 'vasickru@mail.ru', '+79518190825', 'Свердловский Тракт ү', 1250, 'Новый');

-- --------------------------------------------------------

--
-- Структура таблицы `order_good`
--

CREATE TABLE `order_good` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `sum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_good`
--

INSERT INTO `order_good` (`id`, `order_id`, `product_id`, `name`, `price`, `quantity`, `sum`) VALUES
(1, 12, 1, 'Сет Запеченный', 800, 1, 800),
(2, 12, 2, 'Сет Филамикс', 950, 1, 950),
(3, 12, 3, 'Ролл Филадельфия', 300, 2, 600),
(4, 13, 4, 'Ролл Калифорния', 200, 2, 400),
(5, 13, 2, 'Сет Филамикс', 950, 2, 1900),
(6, 13, 6, 'Суши Угорь', 110, 1, 110),
(7, 13, 1, 'Сет Запеченный', 800, 1, 800),
(8, 13, 3, 'Ролл Филадельфия', 300, 5, 1500),
(9, 14, 2, 'Сет Филамикс', 950, 1, 950),
(10, 14, 3, 'Ролл Филадельфия', 300, 2, 600),
(11, 15, 5, 'Суши Лосось', 100, 1, 100),
(12, 15, 6, 'Суши Угорь', 110, 2, 220),
(13, 16, 2, 'Сет Филамикс', 950, 1, 950),
(14, 17, 2, 'Сет Филамикс', 950, 1, 950),
(15, 17, 3, 'Ролл Филадельфия', 300, 1, 300),
(16, 18, 2, 'Сет Филамикс', 950, 1, 950),
(17, 19, 2, 'Сет Филамикс', 950, 1, 950),
(18, 20, 3, 'Ролл Филадельфия', 300, 1, 300),
(19, 21, 3, 'Ролл Филадельфия', 300, 1, 300),
(20, 22, 2, 'Сет Филамикс', 950, 1, 950),
(21, 23, 3, 'Ролл Филадельфия', 300, 1, 300),
(22, 23, 2, 'Сет Филамикс', 950, 1, 950),
(23, 24, 2, 'Сет Филамикс', 950, 1, 950),
(24, 25, 3, 'Ролл Филадельфия', 300, 1, 300),
(25, 26, 3, 'Ролл Филадельфия', 300, 1, 300),
(26, 27, 2, 'Сет Филамикс', 950, 1, 950),
(27, 28, 3, 'Ролл Филадельфия', 300, 1, 300),
(28, 29, 2, 'Сет Филамикс', 950, 1, 950),
(29, 30, 1, 'Сет Запеченный', 800, 2, 1600),
(30, 31, 2, 'Сет Филамикс', 950, 1, 950),
(31, 32, 2, 'Сет Филамикс', 950, 1, 950),
(32, 33, 1, 'Сет Запеченный', 800, 1, 800),
(33, 34, 2, 'Сет Филамикс', 950, 1, 950),
(34, 35, 3, 'Ролл Филадельфия', 300, 1, 300),
(35, 36, 2, 'Сет Филамикс', 950, 1, 950),
(36, 37, 1, 'Сет Запеченный', 800, 1, 800),
(37, 38, 5, 'Суши Лосось', 100, 1, 100),
(38, 39, 1, 'Сет Запеченный', 800, 2, 1600),
(39, 39, 3, 'Ролл Филадельфия', 300, 1, 300),
(40, 40, 2, 'Сет Филамикс', 950, 1, 950),
(41, 40, 3, 'Ролл Филадельфия', 300, 1, 300);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `auth_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `auth_key`) VALUES
(1, 'admin', '$2y$13$OzahBu2mo8152R9lQdvagOXmQ3r26TENt42QjSDJFS2mReC16oUrC', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `good`
--
ALTER TABLE `good`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_good`
--
ALTER TABLE `order_good`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT для таблицы `order_good`
--
ALTER TABLE `order_good`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
