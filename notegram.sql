-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 24 2023 г., 23:27
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `notegram`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `post_id` int(11) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `content`, `create_date`) VALUES
(14, 2, 19, 'dfgdgdafg', '2023-05-24 23:11:47'),
(15, 2, 20, 'sdfadsf', '2023-05-24 23:24:42'),
(16, 2, 20, 'asdasdf', '2023-05-24 23:25:38'),
(17, 2, 20, 'asdfasdfdsf', '2023-05-24 23:25:41'),
(18, 2, 20, 'sdadfs', '2023-05-24 23:25:49'),
(19, 2, 20, 'sdfsdfaasdfsdaf', '2023-05-24 23:25:55'),
(20, 2, 20, 'fgdfg', '2023-05-24 23:26:55');

-- --------------------------------------------------------

--
-- Структура таблицы `keywords`
--

CREATE TABLE `keywords` (
  `id` int(11) UNSIGNED NOT NULL,
  `post_id` int(11) UNSIGNED NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `likes`
--

CREATE TABLE `likes` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `post_id` int(11) UNSIGNED NOT NULL,
  `create_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `header` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `difficulty` varchar(15) NOT NULL,
  `cover` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `header`, `content`, `difficulty`, `cover`, `create_date`) VALUES
(19, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684959999.jpeg', '2023-05-24 00:00:00'),
(20, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684959999.jpeg', '2023-05-24 00:00:00'),
(21, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(22, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(23, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(24, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(25, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(26, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(27, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(28, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(29, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(30, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(31, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(32, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(33, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(34, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(35, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(36, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(37, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(38, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(39, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(40, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(41, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(42, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(43, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(44, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(45, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(46, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(47, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(48, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(49, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(50, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(51, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(52, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(53, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(54, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(55, 2, 'asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf', '<div class=\"post-header\" data-empty=\"Zagłówek\">asdfasdfdasdfasdfsadfadsafdsfsdfsdfsdfsdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">asdf</div>', 'Nie wybrany', 'logo_IMG_60291684960000.jpeg', '2023-05-24 00:00:00'),
(56, 2, 'sdfafsdfsadfadf', '<div class=\"post-header\" data-empty=\"Zagłówek\">sdfafsdfsadfadf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">sadfasdf</div>', 'Nie wybrany', 'logo_IMG_60291684960111.jpeg', '2023-05-24 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `themes`
--

CREATE TABLE `themes` (
  `id` int(11) UNSIGNED NOT NULL,
  `theme` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `themes`
--

INSERT INTO `themes` (`id`, `theme`) VALUES
(1, 'IT'),
(2, 'Sport'),
(3, 'Kulinaria'),
(4, 'Zdrowie'),
(5, 'Sztuka'),
(6, 'Turystyka'),
(7, 'Nauka'),
(8, 'Edukacja');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `surname`, `password`, `email`, `gender`, `avatar`) VALUES
(1, 'test', '', '', '', '', '', 'default_male.jfif'),
(2, 'ss', 'ss', 'ss', 'ss', 'ss@s.s', 'male', 'default_male.jfif'),
(3, 'ss', 'sss', 'ss', 'ss', 'ss@s.s', 'male', 'default_male.jfif'),
(4, 'sss', 'ss', 'ss', 'ss', 'ss@s.s', 'male', 'default_male.jfif'),
(5, 'ssss', 'ss', 'ss', 'ss', 's@s.s', 'male', 'default_male.jfif'),
(6, 'asdf', 'dfgsdfsg', 'fdgsgfds', 'asdf', 'asdf@dsf.fhj', 'male', 'default_male.jfif'),
(7, 'dscfd', 'dscfd', 'dscfd', '123', 'dscfd@dsfdscfd.dscfd', 'male', 'default_male.jfif'),
(8, 'ssssss', 'ssssss', 'ssssss', '123', 'ssssss@sad.dgf', 'male', 'default_male.jfif');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`,`post_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Индексы таблицы `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Индексы таблицы `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`,`post_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `keywords`
--
ALTER TABLE `keywords`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT для таблицы `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `keywords`
--
ALTER TABLE `keywords`
  ADD CONSTRAINT `keywords_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
