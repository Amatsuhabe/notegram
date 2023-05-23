-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 23 2023 г., 23:01
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
(3, 2, 6, 'sdfgdfg', '2023-05-23 00:00:00'),
(4, 2, 6, 'fgdsgdfs', '2023-05-23 22:43:25');

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
  `readability` varchar(15) NOT NULL,
  `create_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `header`, `content`, `difficulty`, `readability`, `create_date`) VALUES
(1, 2, '', '\n                <div class=\"editor-header\" data-empty=\"Zagłówek\">dfgd</div>\n                \n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">dfgdf</div>\n            ', '', '', '2023-05-22'),
(2, 2, '', '<div class=\"editor-header\" data-empty=\"Zagłówek\">dfgd</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">dfgdf</div>', '', '', '2023-05-22'),
(3, 2, '', '<div class=\"post-header\" data-empty=\"Zagłówek\">sdfsdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">sdfsdfasdfdsf</div>', '', '', '2023-05-22'),
(4, 2, '[object HTMLDivElement]', '<div class=\"post-header\" data-empty=\"Zagłówek\">sdf</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">sdfdsafsdf</div>', '', '', '2023-05-22'),
(5, 2, 'dfd', '<div class=\"post-header\" data-empty=\"Zagłówek\">dfd</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">afdfsd</div>', '', '', '2023-05-22'),
(6, 2, 'xfvcxbv', '<div class=\"post-header\" data-empty=\"Zagłówek\">xfvcxbv</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">cvcbxvcb</div><div class=\"list-wrapper\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"><ul class=\"list-container\">\r\n                <li class=\"list-item\">asdfasd</li><li class=\"list-item\">fadsfasdf:<ol class=\"list-container\">\r\n                <li class=\"list-item\">sdfadf</li><li class=\"list-item\">adfadsf</li><li class=\"list-item\">dsfadsfas:<ul class=\"list-container\">\r\n                <li class=\"list-item\">asd</li><li class=\"list-item\">asdas</li><li class=\"list-item\">d</li><li class=\"list-item\">sa</li><li class=\"list-item\">d</li><li class=\"list-item\">a</li>\r\n        </ul></li>\r\n        </ol></li><li class=\"list-item\">asdsad</li><li class=\"list-item\">a</li>\r\n        </ul></div><div class=\"table-wrapper\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">\r\n            \r\n        \r\n        <table class=\"table\">\r\n            <colgroup>\r\n                <col>\r\n                <col><col><col>\r\n                <col>\r\n            </colgroup>\r\n            <tbody><tr class=\"table-item\">\r\n                <td class=\"table-data\">dsafds</td>\r\n                <td class=\"table-data\">fsddsf</td><td class=\"table-data\">adsfdsf</td><td class=\"table-data\">fsf</td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n            <tr class=\"table-item\"><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\">dsfdsf</td><td class=\"table-data\"></td></tr><tr class=\"table-item\"><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td></tr><tr class=\"table-item\">\r\n                <td class=\"table-data\">asdf</td>\r\n                <td class=\"table-data\">fadsfsd</td><td class=\"table-data\"></td><td class=\"table-data\">adsfds</td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n            <tr class=\"table-item\">\r\n                <td class=\"table-data\">fasdf</td>\r\n                <td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n        </tbody></table>\r\n    </div><div class=\"paragraph is-empty\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"></div>', '', '', '2023-05-23'),
(7, 2, 'xfvcxbv', '<div class=\"post-header\" data-empty=\"Zagłówek\">xfvcxbv</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">cvcbxvcb</div><div class=\"list-wrapper\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"><ul class=\"list-container\">\r\n                <li class=\"list-item\">asdfasd</li><li class=\"list-item\">fadsfasdf:<ol class=\"list-container\">\r\n                <li class=\"list-item\">sdfadf</li><li class=\"list-item\">adfadsf</li><li class=\"list-item\">dsfadsfas:<ul class=\"list-container\">\r\n                <li class=\"list-item\">asd</li><li class=\"list-item\">asdas</li><li class=\"list-item\">d</li><li class=\"list-item\">sa</li><li class=\"list-item\">d</li><li class=\"list-item\">a</li>\r\n        </ul></li>\r\n        </ol></li><li class=\"list-item\">asdsad</li><li class=\"list-item\">a</li>\r\n        </ul></div><div class=\"table-wrapper\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">\r\n            \r\n        \r\n        <table class=\"table\">\r\n            <colgroup>\r\n                <col>\r\n                <col><col><col>\r\n                <col>\r\n            </colgroup>\r\n            <tbody><tr class=\"table-item\">\r\n                <td class=\"table-data\">dsafds</td>\r\n                <td class=\"table-data\">fsddsf</td><td class=\"table-data\">adsfdsf</td><td class=\"table-data\">fsf</td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n            <tr class=\"table-item\"><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\">dsfdsf</td><td class=\"table-data\"></td></tr><tr class=\"table-item\"><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td></tr><tr class=\"table-item\">\r\n                <td class=\"table-data\">asdf</td>\r\n                <td class=\"table-data\">fadsfsd</td><td class=\"table-data\"></td><td class=\"table-data\">adsfds</td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n            <tr class=\"table-item\">\r\n                <td class=\"table-data\">fasdf</td>\r\n                <td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n        </tbody></table>\r\n    </div><div class=\"paragraph is-empty\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"></div>', '', '', '2023-05-23'),
(8, 2, 'xfvcxbv', '<div class=\"post-header\" data-empty=\"Zagłówek\">xfvcxbv</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">cvcbxvcb</div><div class=\"list-wrapper\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"><ul class=\"list-container\">\r\n                <li class=\"list-item\">asdfasd</li><li class=\"list-item\">fadsfasdf:<ol class=\"list-container\">\r\n                <li class=\"list-item\">sdfadf</li><li class=\"list-item\">adfadsf</li><li class=\"list-item\">dsfadsfas:<ul class=\"list-container\">\r\n                <li class=\"list-item\">asd</li><li class=\"list-item\">asdas</li><li class=\"list-item\">d</li><li class=\"list-item\">sa</li><li class=\"list-item\">d</li><li class=\"list-item\">a</li>\r\n        </ul></li>\r\n        </ol></li><li class=\"list-item\">asdsad</li><li class=\"list-item\">a</li>\r\n        </ul></div><div class=\"table-wrapper\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">\r\n            \r\n        \r\n        <table class=\"table\">\r\n            <colgroup>\r\n                <col>\r\n                <col><col><col>\r\n                <col>\r\n            </colgroup>\r\n            <tbody><tr class=\"table-item\">\r\n                <td class=\"table-data\">dsafds</td>\r\n                <td class=\"table-data\">fsddsf</td><td class=\"table-data\">adsfdsf</td><td class=\"table-data\">fsf</td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n            <tr class=\"table-item\"><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\">dsfdsf</td><td class=\"table-data\"></td></tr><tr class=\"table-item\"><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td></tr><tr class=\"table-item\">\r\n                <td class=\"table-data\">asdf</td>\r\n                <td class=\"table-data\">fadsfsd</td><td class=\"table-data\"></td><td class=\"table-data\">adsfds</td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n            <tr class=\"table-item\">\r\n                <td class=\"table-data\">fasdf</td>\r\n                <td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n        </tbody></table>\r\n    </div><div class=\"paragraph is-empty\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"></div>', '', '', '2023-05-23'),
(9, 2, 'xfvcxbv', '<div class=\"post-header\" data-empty=\"Zagłówek\">xfvcxbv</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">cvcbxvcb</div><div class=\"list-wrapper\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"><ul class=\"list-container\">\r\n                <li class=\"list-item\">asdfasd</li><li class=\"list-item\">fadsfasdf:<ol class=\"list-container\">\r\n                <li class=\"list-item\">sdfadf</li><li class=\"list-item\">adfadsf</li><li class=\"list-item\">dsfadsfas:<ul class=\"list-container\">\r\n                <li class=\"list-item\">asd</li><li class=\"list-item\">asdas</li><li class=\"list-item\">d</li><li class=\"list-item\">sa</li><li class=\"list-item\">d</li><li class=\"list-item\">a</li>\r\n        </ul></li>\r\n        </ol></li><li class=\"list-item\">asdsad</li><li class=\"list-item\">a</li>\r\n        </ul></div><div class=\"table-wrapper\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">\r\n            \r\n        \r\n        <table class=\"table\">\r\n            <colgroup>\r\n                <col>\r\n                <col><col><col>\r\n                <col>\r\n            </colgroup>\r\n            <tbody><tr class=\"table-item\">\r\n                <td class=\"table-data\">dsafds</td>\r\n                <td class=\"table-data\">fsddsf</td><td class=\"table-data\">adsfdsf</td><td class=\"table-data\">fsf</td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n            <tr class=\"table-item\"><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\">dsfdsf</td><td class=\"table-data\"></td></tr><tr class=\"table-item\"><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td></tr><tr class=\"table-item\">\r\n                <td class=\"table-data\">asdf</td>\r\n                <td class=\"table-data\">fadsfsd</td><td class=\"table-data\"></td><td class=\"table-data\">adsfds</td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n            <tr class=\"table-item\">\r\n                <td class=\"table-data\">fasdf</td>\r\n                <td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n        </tbody></table>\r\n    </div><div class=\"paragraph is-empty\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"></div>', '', '', '2023-05-23'),
(10, 2, 'xfvcxbv', '<div class=\"post-header\" data-empty=\"Zagłówek\">xfvcxbv</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">cvcbxvcb</div><div class=\"list-wrapper\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"><ul class=\"list-container\">\r\n                <li class=\"list-item\">asdfasd</li><li class=\"list-item\">fadsfasdf:<ol class=\"list-container\">\r\n                <li class=\"list-item\">sdfadf</li><li class=\"list-item\">adfadsf</li><li class=\"list-item\">dsfadsfas:<ul class=\"list-container\">\r\n                <li class=\"list-item\">asd</li><li class=\"list-item\">asdas</li><li class=\"list-item\">d</li><li class=\"list-item\">sa</li><li class=\"list-item\">d</li><li class=\"list-item\">a</li>\r\n        </ul></li>\r\n        </ol></li><li class=\"list-item\">asdsad</li><li class=\"list-item\">a</li>\r\n        </ul></div><div class=\"table-wrapper\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">\r\n            \r\n        \r\n        <table class=\"table\">\r\n            <colgroup>\r\n                <col>\r\n                <col><col><col>\r\n                <col>\r\n            </colgroup>\r\n            <tbody><tr class=\"table-item\">\r\n                <td class=\"table-data\">dsafds</td>\r\n                <td class=\"table-data\">fsddsf</td><td class=\"table-data\">adsfdsf</td><td class=\"table-data\">fsf</td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n            <tr class=\"table-item\"><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\">dsfdsf</td><td class=\"table-data\"></td></tr><tr class=\"table-item\"><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td></tr><tr class=\"table-item\">\r\n                <td class=\"table-data\">asdf</td>\r\n                <td class=\"table-data\">fadsfsd</td><td class=\"table-data\"></td><td class=\"table-data\">adsfds</td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n            <tr class=\"table-item\">\r\n                <td class=\"table-data\">fasdf</td>\r\n                <td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n        </tbody></table>\r\n    </div><div class=\"paragraph is-empty\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"></div>', '', '', '2023-05-23'),
(11, 2, 'xfvcxbv', '<div class=\"post-header\" data-empty=\"Zagłówek\">xfvcxbv</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">cvcbxvcb</div><div class=\"list-wrapper\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"><ul class=\"list-container\">\r\n                <li class=\"list-item\">asdfasd</li><li class=\"list-item\">fadsfasdf:<ol class=\"list-container\">\r\n                <li class=\"list-item\">sdfadf</li><li class=\"list-item\">adfadsf</li><li class=\"list-item\">dsfadsfas:<ul class=\"list-container\">\r\n                <li class=\"list-item\">asd</li><li class=\"list-item\">asdas</li><li class=\"list-item\">d</li><li class=\"list-item\">sa</li><li class=\"list-item\">d</li><li class=\"list-item\">a</li>\r\n        </ul></li>\r\n        </ol></li><li class=\"list-item\">asdsad</li><li class=\"list-item\">a</li>\r\n        </ul></div><div class=\"table-wrapper\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">\r\n            \r\n        \r\n        <table class=\"table\">\r\n            <colgroup>\r\n                <col>\r\n                <col><col><col>\r\n                <col>\r\n            </colgroup>\r\n            <tbody><tr class=\"table-item\">\r\n                <td class=\"table-data\">dsafds</td>\r\n                <td class=\"table-data\">fsddsf</td><td class=\"table-data\">adsfdsf</td><td class=\"table-data\">fsf</td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n            <tr class=\"table-item\"><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\">dsfdsf</td><td class=\"table-data\"></td></tr><tr class=\"table-item\"><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td></tr><tr class=\"table-item\">\r\n                <td class=\"table-data\">asdf</td>\r\n                <td class=\"table-data\">fadsfsd</td><td class=\"table-data\"></td><td class=\"table-data\">adsfds</td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n            <tr class=\"table-item\">\r\n                <td class=\"table-data\">fasdf</td>\r\n                <td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n        </tbody></table>\r\n    </div><div class=\"paragraph is-empty\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"></div>', '', '', '2023-05-23'),
(12, 2, 'xfvcxbv', '<div class=\"post-header\" data-empty=\"Zagłówek\">xfvcxbv</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">cvcbxvcb</div><div class=\"list-wrapper\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"><ul class=\"list-container\">\r\n                <li class=\"list-item\">asdfasd</li><li class=\"list-item\">fadsfasdf:<ol class=\"list-container\">\r\n                <li class=\"list-item\">sdfadf</li><li class=\"list-item\">adfadsf</li><li class=\"list-item\">dsfadsfas:<ul class=\"list-container\">\r\n                <li class=\"list-item\">asd</li><li class=\"list-item\">asdas</li><li class=\"list-item\">d</li><li class=\"list-item\">sa</li><li class=\"list-item\">d</li><li class=\"list-item\">a</li>\r\n        </ul></li>\r\n        </ol></li><li class=\"list-item\">asdsad</li><li class=\"list-item\">a</li>\r\n        </ul></div><div class=\"table-wrapper\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">\r\n            \r\n        \r\n        <table class=\"table\">\r\n            <colgroup>\r\n                <col>\r\n                <col><col><col>\r\n                <col>\r\n            </colgroup>\r\n            <tbody><tr class=\"table-item\">\r\n                <td class=\"table-data\">dsafds</td>\r\n                <td class=\"table-data\">fsddsf</td><td class=\"table-data\">adsfdsf</td><td class=\"table-data\">fsf</td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n            <tr class=\"table-item\"><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\">dsfdsf</td><td class=\"table-data\"></td></tr><tr class=\"table-item\"><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td></tr><tr class=\"table-item\">\r\n                <td class=\"table-data\">asdf</td>\r\n                <td class=\"table-data\">fadsfsd</td><td class=\"table-data\"></td><td class=\"table-data\">adsfds</td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n            <tr class=\"table-item\">\r\n                <td class=\"table-data\">fasdf</td>\r\n                <td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n        </tbody></table>\r\n    </div><div class=\"paragraph is-empty\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"></div>', '', '', '2023-05-23'),
(13, 2, 'xfvcxbv', '<div class=\"post-header\" data-empty=\"Zagłówek\">xfvcxbv</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">cvcbxvcb</div><div class=\"list-wrapper\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"><ul class=\"list-container\">\r\n                <li class=\"list-item\">asdfasd</li><li class=\"list-item\">fadsfasdf:<ol class=\"list-container\">\r\n                <li class=\"list-item\">sdfadf</li><li class=\"list-item\">adfadsf</li><li class=\"list-item\">dsfadsfas:<ul class=\"list-container\">\r\n                <li class=\"list-item\">asd</li><li class=\"list-item\">asdas</li><li class=\"list-item\">d</li><li class=\"list-item\">sa</li><li class=\"list-item\">d</li><li class=\"list-item\">a</li>\r\n        </ul></li>\r\n        </ol></li><li class=\"list-item\">asdsad</li><li class=\"list-item\">a</li>\r\n        </ul></div><div class=\"table-wrapper\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">\r\n            \r\n        \r\n        <table class=\"table\">\r\n            <colgroup>\r\n                <col>\r\n                <col><col><col>\r\n                <col>\r\n            </colgroup>\r\n            <tbody><tr class=\"table-item\">\r\n                <td class=\"table-data\">dsafds</td>\r\n                <td class=\"table-data\">fsddsf</td><td class=\"table-data\">adsfdsf</td><td class=\"table-data\">fsf</td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n            <tr class=\"table-item\"><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\">dsfdsf</td><td class=\"table-data\"></td></tr><tr class=\"table-item\"><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td></tr><tr class=\"table-item\">\r\n                <td class=\"table-data\">asdf</td>\r\n                <td class=\"table-data\">fadsfsd</td><td class=\"table-data\"></td><td class=\"table-data\">adsfds</td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n            <tr class=\"table-item\">\r\n                <td class=\"table-data\">fasdf</td>\r\n                <td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n        </tbody></table>\r\n    </div><div class=\"paragraph is-empty\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"></div>', '', '', '2023-05-23'),
(14, 2, 'xfvcxbv', '<div class=\"post-header\" data-empty=\"Zagłówek\">xfvcxbv</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">cvcbxvcb</div><div class=\"list-wrapper\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"><ul class=\"list-container\">\r\n                <li class=\"list-item\">asdfasd</li><li class=\"list-item\">fadsfasdf:<ol class=\"list-container\">\r\n                <li class=\"list-item\">sdfadf</li><li class=\"list-item\">adfadsf</li><li class=\"list-item\">dsfadsfas:<ul class=\"list-container\">\r\n                <li class=\"list-item\">asd</li><li class=\"list-item\">asdas</li><li class=\"list-item\">d</li><li class=\"list-item\">sa</li><li class=\"list-item\">d</li><li class=\"list-item\">a</li>\r\n        </ul></li>\r\n        </ol></li><li class=\"list-item\">asdsad</li><li class=\"list-item\">a</li>\r\n        </ul></div><div class=\"table-wrapper\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">\r\n            \r\n        \r\n        <table class=\"table\">\r\n            <colgroup>\r\n                <col>\r\n                <col><col><col>\r\n                <col>\r\n            </colgroup>\r\n            <tbody><tr class=\"table-item\">\r\n                <td class=\"table-data\">dsafds</td>\r\n                <td class=\"table-data\">fsddsf</td><td class=\"table-data\">adsfdsf</td><td class=\"table-data\">fsf</td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n            <tr class=\"table-item\"><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\">dsfdsf</td><td class=\"table-data\"></td></tr><tr class=\"table-item\"><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td></tr><tr class=\"table-item\">\r\n                <td class=\"table-data\">asdf</td>\r\n                <td class=\"table-data\">fadsfsd</td><td class=\"table-data\"></td><td class=\"table-data\">adsfds</td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n            <tr class=\"table-item\">\r\n                <td class=\"table-data\">fasdf</td>\r\n                <td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n        </tbody></table>\r\n    </div><div class=\"paragraph is-empty\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"></div>', '', '', '2023-05-23'),
(15, 2, 'xfvcxbv', '<div class=\"post-header\" data-empty=\"Zagłówek\">xfvcxbv</div>\r\n                \r\n                <div class=\"paragraph\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">cvcbxvcb</div><div class=\"list-wrapper\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"><ul class=\"list-container\">\r\n                <li class=\"list-item\">asdfasd</li><li class=\"list-item\">fadsfasdf:<ol class=\"list-container\">\r\n                <li class=\"list-item\">sdfadf</li><li class=\"list-item\">adfadsf</li><li class=\"list-item\">dsfadsfas:<ul class=\"list-container\">\r\n                <li class=\"list-item\">asd</li><li class=\"list-item\">asdas</li><li class=\"list-item\">d</li><li class=\"list-item\">sa</li><li class=\"list-item\">d</li><li class=\"list-item\">a</li>\r\n        </ul></li>\r\n        </ol></li><li class=\"list-item\">asdsad</li><li class=\"list-item\">a</li>\r\n        </ul></div><div class=\"table-wrapper\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\">\r\n            \r\n        \r\n        <table class=\"table\">\r\n            <colgroup>\r\n                <col>\r\n                <col><col><col>\r\n                <col>\r\n            </colgroup>\r\n            <tbody><tr class=\"table-item\">\r\n                <td class=\"table-data\">dsafds</td>\r\n                <td class=\"table-data\">fsddsf</td><td class=\"table-data\">adsfdsf</td><td class=\"table-data\">fsf</td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n            <tr class=\"table-item\"><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\">dsfdsf</td><td class=\"table-data\"></td></tr><tr class=\"table-item\"><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td></tr><tr class=\"table-item\">\r\n                <td class=\"table-data\">asdf</td>\r\n                <td class=\"table-data\">fadsfsd</td><td class=\"table-data\"></td><td class=\"table-data\">adsfds</td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n            <tr class=\"table-item\">\r\n                <td class=\"table-data\">fasdf</td>\r\n                <td class=\"table-data\"></td><td class=\"table-data\"></td><td class=\"table-data\"></td>\r\n                <td class=\"table-data\"></td>\r\n            </tr>\r\n        </tbody></table>\r\n    </div><div class=\"paragraph is-empty\" data-empty=\"Wpisz &quot;/&quot;, aby otworzyć menu\"></div>', '', '', '2023-05-23');

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
