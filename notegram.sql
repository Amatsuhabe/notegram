-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 29 2023 г., 23:17
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
  `parent_comment_id` int(11) UNSIGNED DEFAULT 0,
  `content` text NOT NULL,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `parent_comment_id`, `content`, `create_date`) VALUES
(101, 9, 69, NULL, 'Airplane engines, also known as aircraft engines, are the power units that propel airplanes through the air. They are specifically designed to provide the necessary thrust required to overcome the aerodynamic drag and lift the aircraft off the ground. There are several types of airplane engines, including:', '2023-05-26 20:16:23'),
(102, 9, 69, 101, 'asdfsdfsdfdsafsdfsadsfasdfsadf', '2023-05-26 20:22:05'),
(103, 2, 69, NULL, 'sasdasaddsaasads', '2023-05-26 20:24:06'),
(104, 2, 69, 101, 'asdasdadsasdasd', '2023-05-26 20:24:13'),
(105, 2, 69, 102, 'asasdadssdsadads', '2023-05-26 20:24:16'),
(106, 9, 69, 104, 'asdfsdfsdf', '2023-05-26 20:37:24'),
(107, 9, 69, 103, 'asdfasdfadfs', '2023-05-26 20:37:26'),
(108, 9, 69, 103, 'asdasdasdasd', '2023-05-27 12:26:48'),
(109, 9, 69, 108, 'asdasdad', '2023-05-27 12:26:51');

-- --------------------------------------------------------

--
-- Структура таблицы `comment_likes`
--

CREATE TABLE `comment_likes` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `post_id` int(11) UNSIGNED NOT NULL,
  `comment_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `comment_likes`
--

INSERT INTO `comment_likes` (`id`, `user_id`, `post_id`, `comment_id`) VALUES
(6, 2, 69, 103),
(5, 2, 69, 107),
(7, 9, 69, 103),
(8, 9, 69, 104),
(13, 9, 69, 109);

-- --------------------------------------------------------

--
-- Структура таблицы `keywords`
--

CREATE TABLE `keywords` (
  `id` int(11) UNSIGNED NOT NULL,
  `post_id` int(11) UNSIGNED NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `keywords`
--

INSERT INTO `keywords` (`id`, `post_id`, `keyword`) VALUES
(22, 69, 'airplane'),
(23, 69, 'airport'),
(24, 69, 'airlines'),
(25, 70, 'snake'),
(26, 70, 'cobra'),
(27, 70, 'monkey');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `theme_id` int(11) UNSIGNED NOT NULL,
  `header` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `first_paragraph` varchar(255) NOT NULL,
  `difficulty` varchar(15) NOT NULL,
  `cover` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `theme_id`, `header`, `content`, `first_paragraph`, `difficulty`, `cover`, `create_date`) VALUES
(69, 2, 1, 'Airplane', '<div class=\"post-header\" data-empty=\"Zagłówek\">Airplane</div><div class=\"paragraph is-empty\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">Airplane engines, also known as aircraft engines, are the power units that propel airplanes through the air. They are specifically designed to provide the necessary thrust required to overcome the aerodynamic drag and lift the aircraft off the ground. There are several types of airplane engines, including:</div><div class=\"paragraph is-empty\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"><span style=\"white-space: pre-wrap; background-color: rgb(247, 247, 248);\">as</span></div>', 'Airplane engines, also known as aircraft engines, are the power units that propel airplanes through the air. They are specifically designed to provide the necessary thrust required to overcome the aerodynamic drag and lift the aircraft off the ground. The', 'Trudny', 'GettyImages-1131335393-e16500306866871685121854.jpeg', '2023-05-26 19:24:14'),
(70, 9, 8, 'Snakes', '<div class=\"post-header\" data-empty=\"Zagłówek\">Snakes</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">The snake is a type of reptile characterized by its long, cylindrical body and absence of limbs. Snakes belong to the suborder Serpentes and are found in various habitats around the world, excluding Antarctica. They exhibit incredible diversity in terms of size, color, pattern, and behavior, with over 3,500 known species</div>', 'The snake is a type of reptile characterized by its long, cylindrical body and absence of limbs. Snakes belong to the suborder Serpentes and are found in various habitats around the world, excluding Antarctica. They exhibit incredible diversity in terms o', 'Łatwy', 'deadliest-snakes1685122861.jpeg', '2023-05-26 19:41:01');

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
(2, 'ss', 'ss', 'ss', 'ss', 'ss@s.s', 'male', 'default_male.jfif'),
(9, 'mamba', 'muhmed', 'nabar', 'qwerty', 'muhtar@gmail.com', 'female', 'default_female.jfif'),
(10, 'sss', 'www', 'www', 'sss', 'ss@s.ss', 'male', 'default_male.jfif');

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
  ADD KEY `post_id` (`post_id`),
  ADD KEY `parent_comment_id` (`parent_comment_id`);

--
-- Индексы таблицы `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`post_id`,`comment_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Индексы таблицы `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `theme_id` (`theme_id`);

--
-- Индексы таблицы `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id` (`id`);

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT для таблицы `comment_likes`
--
ALTER TABLE `comment_likes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `keywords`
--
ALTER TABLE `keywords`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT для таблицы `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`parent_comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD CONSTRAINT `comment_likes_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `comment_likes_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `comment_likes_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `keywords`
--
ALTER TABLE `keywords`
  ADD CONSTRAINT `keywords_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
