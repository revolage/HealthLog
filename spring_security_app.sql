-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 19 2018 г., 02:18
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
  `isVisited` tinyint(1) DEFAULT NULL,
  `isCanceled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `appointment`
--

INSERT INTO `appointment` (`id`, `id_patient`, `id_doctor`, `date`, `symptoms`, `diagnosis`, `medication`, `notes`, `isVisited`, `isCanceled`) VALUES
(1, 2, 1, '2018-03-16', 'Сильні головні болі', 'Підвищений артеріальний тиск', 'Діуретик \"Верошпирон\" 1т х 3рази на день [Курс 7 днів]', 'Можливий прийом аналогічних препаратів тієї ж лікарскої групи', 1, NULL),
(2, 2, 3, '2018-03-20', 'Запаморочення', NULL, NULL, NULL, 0, NULL),
(3, 6, 1, '2018-03-17', 'Загальна втома. Біль в районі нирок', NULL, NULL, NULL, NULL, NULL),
(4, 2, 2, '2018-03-22', 'Біль у горлі', NULL, NULL, NULL, 0, NULL),
(6, 2, 4, '2018-03-30', 'Сухий кашель', NULL, NULL, NULL, 0, NULL);

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
(1, 'jd@gmail.com', '$2a$11$xo89w3t7A91OUmLulGIy2u5hsUgyvhH6Ye499QWr0cF.BRfuIDKGS', 'Jhon', 'Dorian', 'JD', 1, '1990-03-01', '099-090-10-10', NULL, 1),
(2, 'eliot-r@gmail.com', '$2a$11$xo89w3t7A91OUmLulGIy2u5hsUgyvhH6Ye499QWr0cF.BRfuIDKGS', 'Еліот', 'Рід', ' ', 0, '1980-09-11', '097-090-10-10', NULL, 1),
(3, 'turk@gmail.com', '$2a$11$xo89w3t7A91OUmLulGIy2u5hsUgyvhH6Ye499QWr0cF.BRfuIDKGS', 'Кріс', 'Тьорк', 'Данкен', 1, '1978-05-22', '097-090-10-10', NULL, 2),
(4, 'celso@gmail.com', '$2a$11$xo89w3t7A91OUmLulGIy2u5hsUgyvhH6Ye499QWr0cF.BRfuIDKGS', 'Роберт', 'Келсо', ' ', 1, '1970-05-12', '097-090-10-10', NULL, 3);

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
(2, 'revolage', '$2a$11$1bO/gCKv.0mcVHxKqHg/kuM1ltHz0ZaKo5JY.H0d5lHtVUHkr8yai', 'revolage@gmail.com', 'Владислав', 'Качур', 'Сергійович', 1, '1992-03-26', '096-738-2006', 'Гайморит', 'Арахіс; Фундук', 'O(I) Rh(+)', NULL, NULL),
(3, 'testuser', '$2a$11$iMejy40lh.CBHeH84D.LbuCgC4QW.9CRejoeYSSPmPTy/xtZyS.8W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'deleteUser', '$2a$11$xh04cYFaZFaSIxMBnSl68.paSq74WDV8B3qVfigtoE4jLN7SqSLAi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'starikov', '$2a$11$iiz.W1qeVopjNlOYgfpqIeZ17XO85FQnAYzccX1XXmSHKyYQ8BOvO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'user1111', '$2a$11$xo89w3t7A91OUmLulGIy2u5hsUgyvhH6Ye499QWr0cF.BRfuIDKGS', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'ROLE_USER'),
(2, 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Структура таблицы `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 2),
(2, 1),
(3, 1),
(4, 2),
(5, 1),
(6, 1);

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
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD UNIQUE KEY `user_id` (`user_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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

--
-- Ограничения внешнего ключа таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
