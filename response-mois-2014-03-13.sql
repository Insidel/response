-- --------------------------------------------------------
-- Hostitel:                     127.0.0.1
-- Verze serveru:                5.5.27 - MySQL Community Server (GPL)
-- OS serveru:                   Win32
-- HeidiSQL Verze:               8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Exportování struktury databáze pro
CREATE DATABASE IF NOT EXISTS `response-mois` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `response-mois`;


-- Exportování struktury pro tabulka response-mois.answer
CREATE TABLE IF NOT EXISTS `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `isCorrect` bit(1) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK735D33BED1CFBA45` (`question_id`),
  CONSTRAINT `FK735D33BED1CFBA45` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- Exportování dat pro tabulku response-mois.answer: ~76 rows (přibližně)
DELETE FROM `answer`;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` (`id`, `name`, `isCorrect`, `question_id`) VALUES
	(1, 'savec', b'0', 1),
	(2, 'plaz', b'1', 1),
	(3, 'plž', b'0', 1),
	(4, 'mlž', b'0', 1),
	(5, 'mléko', b'1', 2),
	(6, 'sůl', b'0', 2),
	(7, 'cukr', b'0', 2),
	(8, 'pivo', b'0', 2),
	(9, 'CO2->O2', b'1', 3),
	(10, 'O2->CO2', b'0', 3),
	(11, 'CO3->CO2', b'0', 3),
	(12, 'CO2->CO3', b'0', 3),
	(13, 'Had', b'0', 4),
	(14, 'Ještěrka', b'1', 4),
	(15, 'Želva', b'0', 4),
	(16, 'štír', b'0', 4),
	(17, 'ryba', b'0', 5),
	(18, 'paryba', b'1', 5),
	(19, 'savec', b'0', 5),
	(20, 'mořský had', b'0', 5),
	(21, '1', b'0', 6),
	(22, '2', b'1', 6),
	(23, '3', b'0', 6),
	(24, '4', b'0', 6),
	(29, '1', b'0', 8),
	(30, '2', b'0', 8),
	(31, '3', b'1', 8),
	(32, '4', b'0', 8),
	(33, '1', b'0', 9),
	(34, '2', b'0', 9),
	(35, '3', b'0', 9),
	(36, '4', b'1', 9),
	(37, '3', b'0', 10),
	(38, '4', b'0', 10),
	(39, '5', b'1', 10),
	(40, '6', b'0', 10),
	(41, '42,195', b'1', 11),
	(42, '43,1', b'0', 11),
	(43, '20', b'0', 11),
	(44, '22,195', b'0', 11),
	(45, 'Jak se mas?', b'1', 12),
	(46, 'Kolik je hodin?', b'0', 12),
	(47, 'Kdo jsi?', b'0', 12),
	(48, 'Co je za den?', b'0', 12),
	(49, 'Jak se mas?', b'0', 13),
	(50, 'Kolik je hodin?', b'0', 13),
	(51, 'Kolik ti je?', b'1', 13),
	(52, 'Kdo jsi?', b'0', 13),
	(53, 'Kočka je černá', b'1', 14),
	(54, 'Pes je černý', b'0', 14),
	(55, 'Kočka je hnědá', b'0', 14),
	(56, 'Kočka je šedá', b'0', 14),
	(57, 'ahoj', b'1', 15),
	(58, 'Ne', b'0', 15),
	(59, 'jídlo', b'0', 15),
	(60, 'kdo', b'0', 15),
	(61, 'cow', b'0', 16),
	(62, 'snake', b'1', 16),
	(63, 'pig', b'0', 16),
	(64, 'dog', b'0', 16),
	(65, 'tabule', b'0', 17),
	(66, 'klíčenka', b'0', 17),
	(67, 'kabelka', b'0', 17),
	(68, 'klávesnice', b'1', 17),
	(69, 'red', b'1', 18),
	(70, 'ring', b'0', 18),
	(71, 'ping', b'0', 18),
	(72, 'yellow', b'0', 18),
	(77, 'a', b'1', 20),
	(78, 'b', b'0', 20),
	(79, 'c', b'0', 20),
	(80, 'd', b'0', 20),
	(81, 'Zeman', b'1', 21),
	(82, 'Klaus', b'0', 21),
	(83, 'Gotvald', b'0', 21),
	(84, 'Havel', b'0', 21);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;


-- Exportování struktury pro tabulka response-mois.complete_tests
CREATE TABLE IF NOT EXISTS `complete_tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `score_cache` varchar(50) DEFAULT NULL COMMENT 'hodnoceni testu',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA6E4B7B525C2DAC` (`student_id`),
  KEY `FK_complete_tests_test` (`test_id`),
  KEY `FK_complete_tests_course` (`course_id`),
  CONSTRAINT `FKA6E4B7B525C2DAC` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_complete_tests_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_complete_tests_test` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- Exportování dat pro tabulku response-mois.complete_tests: ~4 rows (přibližně)
DELETE FROM `complete_tests`;
/*!40000 ALTER TABLE `complete_tests` DISABLE KEYS */;
INSERT INTO `complete_tests` (`id`, `test_id`, `student_id`, `course_id`, `score_cache`, `date`) VALUES
	(1, 1, 10, 2, '0', '2014-02-01 10:34:45'),
	(2, 2, 10, 1, '60', '2014-02-01 10:36:44'),
	(84, 4, 10, 3, '100', '2014-02-10 12:04:08'),
	(85, 3, 10, 3, '12.5', '2014-02-08 10:57:21');
/*!40000 ALTER TABLE `complete_tests` ENABLE KEYS */;


-- Exportování struktury pro tabulka response-mois.complete_tests_questions
CREATE TABLE IF NOT EXISTS `complete_tests_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_complete_tests` int(11) NOT NULL,
  `id_question` int(11) NOT NULL COMMENT 'id otazky z testu',
  `id_answer` int(11) DEFAULT NULL COMMENT 'id odpovedi z testu a,b,c,d radio butt',
  `text_answer` text COMMENT 'textova odpoved',
  `num_answer` float DEFAULT NULL COMMENT 'ciselna odpoved',
  `score_cache` varchar(50) DEFAULT NULL COMMENT 'hodnoceni otazky 0- spatne 1-dobre',
  PRIMARY KEY (`id`),
  KEY `FK_complete_tests_questions_complete_tests` (`id_complete_tests`),
  CONSTRAINT `FK_complete_tests_questions_complete_tests` FOREIGN KEY (`id_complete_tests`) REFERENCES `complete_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

-- Exportování dat pro tabulku response-mois.complete_tests_questions: ~19 rows (přibližně)
DELETE FROM `complete_tests_questions`;
/*!40000 ALTER TABLE `complete_tests_questions` DISABLE KEYS */;
INSERT INTO `complete_tests_questions` (`id`, `id_complete_tests`, `id_question`, `id_answer`, `text_answer`, `num_answer`, `score_cache`) VALUES
	(1, 1, 1, 3, NULL, NULL, '0'),
	(2, 1, 2, 8, NULL, NULL, '0'),
	(3, 1, 3, 12, NULL, NULL, '0'),
	(4, 1, 4, 15, NULL, NULL, '0'),
	(5, 1, 5, 17, NULL, NULL, '0'),
	(6, 2, 6, 22, NULL, NULL, '1'),
	(7, 2, 8, 31, NULL, NULL, '1'),
	(8, 2, 9, 36, NULL, NULL, '1'),
	(9, 2, 10, 40, NULL, NULL, '0'),
	(10, 2, 11, 43, NULL, NULL, '0'),
	(169, 84, 20, 77, NULL, NULL, '1'),
	(170, 85, 12, 45, NULL, NULL, '1'),
	(171, 85, 13, 50, NULL, NULL, '0'),
	(172, 85, 14, 54, NULL, NULL, '0'),
	(173, 85, 15, 58, NULL, NULL, '0'),
	(174, 85, 16, 64, NULL, NULL, '0'),
	(175, 85, 17, 66, NULL, NULL, '0'),
	(176, 85, 18, 70, NULL, NULL, '0'),
	(177, 85, 19, 76, NULL, NULL, '0');
/*!40000 ALTER TABLE `complete_tests_questions` ENABLE KEYS */;


-- Exportování struktury pro tabulka response-mois.course
CREATE TABLE IF NOT EXISTS `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `schoolYear` int(4) DEFAULT NULL,
  `meetingTime` time DEFAULT NULL,
  `note` text COMMENT 'pozn ke kurzu',
  PRIMARY KEY (`id`),
  KEY `FK76D5D41BB48ABECF` (`teacher_id`),
  CONSTRAINT `FK_course_users` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Exportování dat pro tabulku response-mois.course: ~4 rows (přibližně)
DELETE FROM `course`;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` (`id`, `name`, `teacher_id`, `schoolYear`, `meetingTime`, `note`) VALUES
	(1, 'TV1 PZ', 20, 2014, '05:29:00', 'Ukázka poznámky pro kurz.'),
	(2, 'PRI PZ', 20, 2014, '22:18:00', NULL),
	(3, 'OA1', 11, 2014, '11:27:00', NULL),
	(4, 'Obcanka1', 20, 2014, '00:00:00', NULL);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;


-- Exportování struktury pro tabulka response-mois.course_students
CREATE TABLE IF NOT EXISTS `course_students` (
  `courses_id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL,
  `note` text,
  KEY `FKA214813C6DDB97B2` (`students_id`),
  KEY `FKA214813CB1C3A428` (`courses_id`),
  CONSTRAINT `FKA214813C6DDB97B2` FOREIGN KEY (`students_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKA214813CB1C3A428` FOREIGN KEY (`courses_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportování dat pro tabulku response-mois.course_students: ~10 rows (přibližně)
DELETE FROM `course_students`;
/*!40000 ALTER TABLE `course_students` DISABLE KEYS */;
INSERT INTO `course_students` (`courses_id`, `students_id`, `note`) VALUES
	(1, 10, NULL),
	(1, 14, NULL),
	(1, 15, NULL),
	(2, 10, NULL),
	(4, 10, NULL),
	(3, 15, NULL),
	(3, 16, NULL),
	(3, 14, NULL),
	(3, 1, NULL),
	(3, 10, NULL);
/*!40000 ALTER TABLE `course_students` ENABLE KEYS */;


-- Exportování struktury pro tabulka response-mois.course_test
CREATE TABLE IF NOT EXISTS `course_test` (
  `tests_id` int(11) NOT NULL,
  `courses_id` int(11) DEFAULT NULL,
  `isActive` bit(1) DEFAULT b'0',
  KEY `FK7D237A36EEA42056` (`tests_id`),
  KEY `FK7D237A36B1C3A428` (`courses_id`),
  CONSTRAINT `FK7D237A36B1C3A428` FOREIGN KEY (`courses_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK7D237A36EEA42056` FOREIGN KEY (`tests_id`) REFERENCES `test` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportování dat pro tabulku response-mois.course_test: ~7 rows (přibližně)
DELETE FROM `course_test`;
/*!40000 ALTER TABLE `course_test` DISABLE KEYS */;
INSERT INTO `course_test` (`tests_id`, `courses_id`, `isActive`) VALUES
	(2, 1, b'1'),
	(1, 2, b'1'),
	(3, 3, b'1'),
	(4, 3, b'1'),
	(5, 4, b'1'),
	(5, 2, b'1'),
	(6, 3, b'1');
/*!40000 ALTER TABLE `course_test` ENABLE KEYS */;


-- Exportování struktury pro tabulka response-mois.fileupload
CREATE TABLE IF NOT EXISTS `fileupload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `file` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportování dat pro tabulku response-mois.fileupload: ~0 rows (přibližně)
DELETE FROM `fileupload`;
/*!40000 ALTER TABLE `fileupload` DISABLE KEYS */;
/*!40000 ALTER TABLE `fileupload` ENABLE KEYS */;


-- Exportování struktury pro tabulka response-mois.question
CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE9282BE6DE27C845` (`test_id`),
  CONSTRAINT `FKE9282BE6DE27C845` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Exportování dat pro tabulku response-mois.question: ~19 rows (přibližně)
DELETE FROM `question`;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` (`id`, `name`, `desc`, `test_id`) VALUES
	(1, 'OT1', 'Zmije je?', 1),
	(2, 'OT2', 'Kráva nám dává:', 1),
	(3, 'OT3', 'Fotosyntéza je?', 1),
	(4, 'OT4', 'Slepíš je:', 1),
	(5, 'OT5', 'Žralok je:', 1),
	(6, 'OT1', 'Na kolik částí se hraje fotbal?', 2),
	(8, 'OT2', 'Na kolik částí se hraje hokej?', 2),
	(9, 'OT3', 'Na kolik částí se hraje basketbal?', 2),
	(10, 'OT4', 'Kolik kruhů má znak OH?', 2),
	(11, 'OT5', 'Na km se běží maraton?', 2),
	(12, 'ot1', 'How are you?', 3),
	(13, 'ot2', 'How old are you?', 3),
	(14, 'ot3', 'Cat is black.', 3),
	(15, 'ot4', 'Hello', 3),
	(16, 'ot5', 'přeložte slovo had:', 3),
	(17, 'ot6', 'Keyboard znamena:', 3),
	(18, 'ot7', 'Přeložte: červená', 3),
	(20, 'ot1', 'test o 1 otazce a je spravne.', 4),
	(21, 'OT1', 'Kdo je nas prezident?', 5);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;


-- Exportování struktury pro tabulka response-mois.test
CREATE TABLE IF NOT EXISTS `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `author` varchar(50) NOT NULL,
  `visibility_type` int(11) NOT NULL DEFAULT '1' COMMENT 'viditelnost testu, 1- autor, 2-skola, 3-vsichni',
  `dateOfCreate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Exportování dat pro tabulku response-mois.test: ~6 rows (přibližně)
DELETE FROM `test`;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` (`id`, `name`, `desc`, `author`, `visibility_type`, `dateOfCreate`) VALUES
	(1, 'Přírodopis PZ 1', 'Kurz přírodopisu vedený Petrem Zmítkem T. ', '20', 1, '2014-02-01'),
	(2, 'Tělesná výchova teorie PZ 1', 'Kurz tělesné výchovy vedené Petrem Zmítkem. T', '20', 1, '2014-02-01'),
	(3, 'Test anglictina', 'Popis testu anglictina. Testujeme prekladove znalosit.', '11', 1, '2014-02-06'),
	(4, 'Test OA2', 'pokus', '11', 1, '2014-02-06'),
	(5, 'Test pro obcanka1', 'popis testiku OB1', '20', 1, '2014-02-06'),
	(6, 'Test OA opakovani', 'Opakovaci test', '11', 1, '2014-02-18');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;


-- Exportování struktury pro tabulka response-mois.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` varchar(50) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `sex` varchar(40) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postNumber` varchar(30) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telephoneParent` int(11) DEFAULT NULL COMMENT 'V případě že se jedná o studenta je zde uvdeno číslo na rodiče.',
  `emailParent` varchar(50) DEFAULT NULL COMMENT 'V případě studenta je zde uvedeno číslo na rodiče.',
  `class_teacher_id` int(11) DEFAULT NULL COMMENT 'Id ucetele ktery vlozil sutdenta (třídní učitel, lektor kurzu) do db',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- Exportování dat pro tabulku response-mois.users: ~10 rows (přibližně)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `userName`, `password`, `role`, `firstName`, `lastName`, `birthDate`, `sex`, `address`, `city`, `postNumber`, `telephone`, `email`, `telephoneParent`, `emailParent`, `class_teacher_id`) VALUES
	(1, 'Insidel', '54669547a225ff20cba8b75a4adca540eef25858', 'student', 'Martin', 'Zmitko', '0000-00-00', 'zena', 'Rybalkova 937', 'Jaromer', NULL, 732, 'mujemail@email.cz', NULL, NULL, NULL),
	(10, 'student', '54669547a225ff20cba8b75a4adca540eef25858', 'student', 'MartinSt', 'ZmitkoSt', '0000-00-00', 'zena', 'Rybalkova 937', 'Jaromer', NULL, 732, NULL, NULL, NULL, NULL),
	(11, 'teacher', '54669547a225ff20cba8b75a4adca540eef25858', 'teacher', 'Martinte', 'Zmitkote', '0000-00-00', 'zena', 'Rybalkova 937', 'Jaromer', NULL, 732, 'email@email.cz', NULL, NULL, NULL),
	(12, 'admin', '54669547a225ff20cba8b75a4adca540eef25858', 'administrator', 'Martinadm', 'Zmitkoadm', '0000-00-00', 'zena', 'Rybalkova 937', 'Jaromer', NULL, 732, NULL, NULL, NULL, NULL),
	(14, 'OtovaAnicka1', '54669547a225ff20cba8b75a4adca540eef25858', 'student', 'Anicka', 'Otova', '0000-00-00', 'zena', '', '', '', 0, '', 0, '', 11),
	(15, 'valentafilip1', '54669547a225ff20cba8b75a4adca540eef25858', 'student', 'Filip', 'Valenta', '2019-12-17', '1', 'bydlis', 'jarr', '8899', 999888777, 'val.fil8@uhk.cz', 111111111, 'emailrodic@ss.cz', 11),
	(16, 'testtest1', '54669547a225ff20cba8b75a4adca540eef25858', 'student', 'test', 'test', '1990-12-17', 'muz', '', '', '', 0, '', 0, '', 11),
	(18, 'ppaa1', '54669547a225ff20cba8b75a4adca540eef25858', 'student', 'AA', 'PP', '1936-03-03', '0', '', '', '', 0, '', 0, '', 11),
	(19, 'asdasd1', '54669547a225ff20cba8b75a4adca540eef25858', 'student', 'ASD', 'ASD', '0000-00-00', '0', 'ASD', 'AD', 'ASD', 0, 'ADS', 0, 'ASD', 11),
	(20, 'teacher2', '54669547a225ff20cba8b75a4adca540eef25858', 'teacher', 'PetrTe', 'ZmitkoTe', '2014-01-28', 'muz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
