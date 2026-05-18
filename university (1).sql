-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Трв 18 2026 р., 13:05
-- Версія сервера: 10.4.32-MariaDB
-- Версія PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `university`
--

-- --------------------------------------------------------

--
-- Структура таблиці `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` enum('present','absent','late') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `attendance`
--

INSERT INTO `attendance` (`id`, `student_id`, `date`, `status`) VALUES
(1, 1, '2026-05-01', 'present'),
(2, 1, '2026-05-02', 'late'),
(3, 2, '2026-05-01', 'absent'),
(4, 2, '2026-05-02', 'present'),
(5, NULL, '2026-05-01', 'present'),
(6, NULL, '2026-05-02', 'present'),
(7, 4, '2026-05-01', 'late'),
(8, 4, '2026-05-02', 'present'),
(9, 5, '2026-05-01', 'present'),
(10, 5, '2026-05-02', 'absent');

-- --------------------------------------------------------

--
-- Структура таблиці `grades`
--

CREATE TABLE `grades` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `grades`
--

INSERT INTO `grades` (`id`, `student_id`, `subject`, `grade`) VALUES
(1, 1, 'Math', 95),
(2, 1, 'Physics', 99),
(3, 2, 'Math', 76),
(4, 2, 'Physics', 81),
(7, 4, 'Math', 85),
(8, 4, 'Physics', 79),
(9, 5, 'Math', 100),
(10, 5, 'Physics', 98);

-- --------------------------------------------------------

--
-- Структура таблиці `scholarships`
--

CREATE TABLE `scholarships` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `scholarships`
--

INSERT INTO `scholarships` (`id`, `student_id`, `amount`, `type`) VALUES
(1, 1, 2500.00, 'Academic'),
(2, NULL, 3000.00, 'Merit'),
(3, 5, 2800.00, 'Social');

-- --------------------------------------------------------

--
-- Структура таблиці `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `group_name` varchar(20) DEFAULT NULL,
  `birth_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `students`
--

INSERT INTO `students` (`id`, `first_name`, `last_name`, `group_name`, `birth_date`) VALUES
(1, 'Ілля', 'Басалик', 'A1', '2007-05-10'),
(2, 'Олександр', 'Петренко', 'A1', '2006-11-22'),
(4, 'Анна', 'Ткаченко', 'B2', '2006-08-30'),
(5, 'Дмитро', 'Сидоренко', 'A1', '2007-01-12');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Індекси таблиці `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Індекси таблиці `scholarships`
--
ALTER TABLE `scholarships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Індекси таблиці `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблиці `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблиці `scholarships`
--
ALTER TABLE `scholarships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE SET NULL;

--
-- Обмеження зовнішнього ключа таблиці `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `scholarships`
--
ALTER TABLE `scholarships`
  ADD CONSTRAINT `scholarships_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
