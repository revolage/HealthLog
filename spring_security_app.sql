-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 13 2018 г., 23:43
-- Версия сервера: 10.1.21-MariaDB
-- Версия PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `spring_security_app`
--

-- --------------------------------------------------------

--
-- Структура таблицы `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `id_patient` int(11) NOT NULL,
  `id_doctor` int(11) NOT NULL,
  `date` date NOT NULL,
  `symptoms` varchar(255) DEFAULT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  `medication` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `isVisited` tinyint(1) NOT NULL DEFAULT '0',
  `isCanceled` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `appointment`
--

INSERT INTO `appointment` (`id`, `id_patient`, `id_doctor`, `date`, `symptoms`, `diagnosis`, `medication`, `notes`, `isVisited`, `isCanceled`) VALUES
(1, 2, 1, '2018-03-16', 'Сильні головні болі', 'Підвищений артеріальний тиск', 'Діуретик \"Верошпирон\" 1т х 3рази на день [Курс 7 днів]', 'Можливий прийом аналогічних препаратів тієї ж лікарскої групи', 1, 0),
(3, 2, 1, '2018-03-17', 'Загальна втома. Біль в районі нирок', 'ограв\'', 'іваіва', 'іваіва', 1, 0),
(7, 2, 2, '2018-03-17', 'Гострий біль в животі', 'Даагноз не придумався', '4 чашки чаю 3 рази надень', '', 0, 0),
(26, 2, 1, '2018-03-23', 'Загальна слабкість', 'орва', 'брл', 'р', 1, 0),
(27, 2, 1, '2018-03-31', 'Біль в спині', 'OJcm', 'fsfddsf', 'sdfsdf', 0, 0),
(28, 2, 1, '2018-03-30', 'Запаморочення', 'Нестача сну', 'Сон по 8 годин', '', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `department`
--

INSERT INTO `department` (`id`, `name`) VALUES
(1, 'ТЕРАПІЇ'),
(2, 'ХІРУРГІЇ'),
(3, 'ПЕДАТРІЇ'),
(4, 'СТОМАТОЛОГІЇ'),
(5, 'ДЕРМАТОЛОГІЇ'),
(6, 'ТРАВМАТОЛОГІЇ'),
(7, 'НЕВРОЛОГІЇ'),
(8, 'ОТОЛАРИНГОЛОГІЇ');

-- --------------------------------------------------------

--
-- Структура таблицы `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `fathername` varchar(100) NOT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `birthday` date NOT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `id_department` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `doctors`
--

INSERT INTO `doctors` (`id`, `email`, `password`, `name`, `surname`, `fathername`, `gender`, `birthday`, `phone`, `photo`, `id_department`) VALUES
(1, 'jd@gmail.com', '$2a$11$xo89w3t7A91OUmLulGIy2u5hsUgyvhH6Ye499QWr0cF.BRfuIDKGS', 'Jhon', 'Dorian', 'JD', 1, '1990-03-01', '099-090-10-10', 'resources\\img\\jd.jpg', 1),
(2, 'eliot-r@gmail.com', '$2a$11$xo89w3t7A91OUmLulGIy2u5hsUgyvhH6Ye499QWr0cF.BRfuIDKGS', 'Еліот', 'Рід', ' ', 0, '1980-09-11', '097-090-10-10', 'resources\\img\\eliot.jpg', 1),
(3, 'turk@gmail.com', '$2a$11$xo89w3t7A91OUmLulGIy2u5hsUgyvhH6Ye499QWr0cF.BRfuIDKGS', 'Кріс', 'Тьорк', 'Данкен', 1, '1978-05-22', '097-090-10-10', 'resources\\img\\turk.png', 2),
(4, 'celso@gmail.com', '$2a$11$xo89w3t7A91OUmLulGIy2u5hsUgyvhH6Ye499QWr0cF.BRfuIDKGS', 'Роберт', 'Келсо', ' ', 1, '1970-05-12', '097-090-10-10', 'resources\\img\\kelso.jpg', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `surname` varchar(64) DEFAULT NULL,
  `fathername` varchar(64) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `chronic_diseases` varchar(255) DEFAULT NULL,
  `allergies` varchar(255) DEFAULT NULL,
  `blood_type` varchar(255) DEFAULT NULL,
  `special_notes` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `patients`
--

INSERT INTO `patients` (`id`, `username`, `password`, `email`, `name`, `surname`, `fathername`, `gender`, `birthday`, `phone`, `chronic_diseases`, `allergies`, `blood_type`, `special_notes`, `photo`) VALUES
(1, 'vlad', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5rluwFu7HgtRn3dcXG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'revolage', '$2a$11$1bO/gCKv.0mcVHxKqHg/kuM1ltHz0ZaKo5JY.H0d5lHtVUHkr8yai', 'revolage@gmail.com', 'Владислав', 'Качур', 'Сергійович', 1, '1992-03-26', '096-738-2006', 'Гайморит', 'Арахіс; Фундук', 'O(I) Rh(+)', NULL, 'resources\\userPhoto\\vlad.jpg'),
(3, 'testuser', '$2a$11$iMejy40lh.CBHeH84D.LbuCgC4QW.9CRejoeYSSPmPTy/xtZyS.8W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'deleteUser', '$2a$11$xh04cYFaZFaSIxMBnSl68.paSq74WDV8B3qVfigtoE4jLN7SqSLAi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'starikov', '$2a$11$iiz.W1qeVopjNlOYgfpqIeZ17XO85FQnAYzccX1XXmSHKyYQ8BOvO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'user1111', '$2a$11$xo89w3t7A91OUmLulGIy2u5hsUgyvhH6Ye499QWr0cF.BRfuIDKGS', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'newUser', '$2a$10$wC4VCTcZyx597ARdDclpiuGLiCJeLfMwWytjZMbrD7tTfcqxad6sy', NULL, 'Ð§ÐµÐ»Ð¾Ð²ÐµÐº', 'Ð§ÐµÐ»Ð¾Ð²ÐµÐº', 'Ð§ÐµÐ»Ð¾Ð²ÐµÐº', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'newNewUser', '$2a$10$szUem.W/AkSM/0nViSalMORo0aKFmUTdQD1s.VA8BoDTVZYDK8/o6', NULL, '', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'vlad.kach', '$2a$10$JcKEm5Od9sRZfMTkBdVFuecdnXfENgMWEcfPWTRGtHOXpd.xoW21a', NULL, 'ÐÐ»Ð°Ð´', 'ÐÐ°ÑÑÑ', 'Ð¡ÐµÑÐ³ÑÐ¹Ð¾Ð²Ð¸Ñ', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'username', '$2a$10$2bFsWkNdmLW/hGU4Zh7Dmuh.zpBX9vNeTwmJ5yZ8czy29CwIxq6q.', 'f@sdf.c', 'dsf', 'dsf', 'sdfg', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'username0202', '$2a$10$CH2hbup4rNxO6tUbOSUw3esh5j5Dt21vglRyR1rRYQwWSEZCfaKJ6', 'ref@jj.c', 'name', 'name', 'name', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'username03', '$2a$10$ikr40inYayCxhsGY3O8PVuFO/JW/yOSgBbTPyl8dSKp7e2fuh3wv6', 'ref@fsdf.c', 'sdfsdf', 'dsfdsf', 'sdfsdfsdf', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'qwerty', '$2a$10$.yf3sqU9r.BN4S8G8jPfG.yJ0PhFG5B5HwWQRelTXfEOcglBOAzvO', 'qwerty@g.com', 'The', 'Waking', 'Deamon', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_patient` (`id_patient`),
  ADD KEY `id_doctor` (`id_doctor`);

--
-- Индексы таблицы `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_department` (`id_department`);

--
-- Индексы таблицы `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT для таблицы `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`id_patient`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`id_doctor`) REFERENCES `doctors` (`id`);

--
-- Ограничения внешнего ключа таблицы `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`id_department`) REFERENCES `department` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
