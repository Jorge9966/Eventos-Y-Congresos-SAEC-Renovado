-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 18-11-2025 a las 08:30:32
-- Versión del servidor: 8.0.41
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `saec`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(3, 'Administrador'),
(4, 'Administradores_Congresos'),
(1, 'Instructores'),
(2, 'Participantes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add password reset code', 7, 'add_passwordresetcode'),
(26, 'Can change password reset code', 7, 'change_passwordresetcode'),
(27, 'Can delete password reset code', 7, 'delete_passwordresetcode'),
(28, 'Can view password reset code', 7, 'view_passwordresetcode'),
(29, 'Can add allowed email domain', 8, 'add_allowedemaildomain'),
(30, 'Can change allowed email domain', 8, 'change_allowedemaildomain'),
(31, 'Can delete allowed email domain', 8, 'delete_allowedemaildomain'),
(32, 'Can view allowed email domain', 8, 'view_allowedemaildomain'),
(33, 'Can add congreso', 9, 'add_congreso'),
(34, 'Can change congreso', 9, 'change_congreso'),
(35, 'Can delete congreso', 9, 'delete_congreso'),
(36, 'Can view congreso', 9, 'view_congreso'),
(37, 'Can add performance level', 10, 'add_performancelevel'),
(38, 'Can change performance level', 10, 'change_performancelevel'),
(39, 'Can delete performance level', 10, 'delete_performancelevel'),
(40, 'Can view performance level', 10, 'view_performancelevel'),
(41, 'Can add user congreso membership', 11, 'add_usercongresomembership'),
(42, 'Can change user congreso membership', 11, 'change_usercongresomembership'),
(43, 'Can delete user congreso membership', 11, 'delete_usercongresomembership'),
(44, 'Can view user congreso membership', 11, 'view_usercongresomembership'),
(45, 'Can add conferencia', 12, 'add_conferencia'),
(46, 'Can change conferencia', 12, 'change_conferencia'),
(47, 'Can delete conferencia', 12, 'delete_conferencia'),
(48, 'Can view conferencia', 12, 'view_conferencia'),
(49, 'Can add taller', 13, 'add_taller'),
(50, 'Can change taller', 13, 'change_taller'),
(51, 'Can delete taller', 13, 'delete_taller'),
(52, 'Can view taller', 13, 'view_taller'),
(53, 'Can add concurso', 14, 'add_concurso'),
(54, 'Can change concurso', 14, 'change_concurso'),
(55, 'Can delete concurso', 14, 'delete_concurso'),
(56, 'Can view concurso', 14, 'view_concurso'),
(57, 'Can add taller inscripcion', 15, 'add_tallerinscripcion'),
(58, 'Can change taller inscripcion', 15, 'change_tallerinscripcion'),
(59, 'Can delete taller inscripcion', 15, 'delete_tallerinscripcion'),
(60, 'Can view taller inscripcion', 15, 'view_tallerinscripcion'),
(61, 'Can add concurso inscripcion', 16, 'add_concursoinscripcion'),
(62, 'Can change concurso inscripcion', 16, 'change_concursoinscripcion'),
(63, 'Can delete concurso inscripcion', 16, 'delete_concursoinscripcion'),
(64, 'Can view concurso inscripcion', 16, 'view_concursoinscripcion'),
(65, 'Can add conferencia inscripcion', 17, 'add_conferenciainscripcion'),
(66, 'Can change conferencia inscripcion', 17, 'change_conferenciainscripcion'),
(67, 'Can delete conferencia inscripcion', 17, 'delete_conferenciainscripcion'),
(68, 'Can view conferencia inscripcion', 17, 'view_conferenciainscripcion'),
(69, 'Can add aviso', 18, 'add_aviso'),
(70, 'Can change aviso', 18, 'change_aviso'),
(71, 'Can delete aviso', 18, 'delete_aviso'),
(72, 'Can view aviso', 18, 'view_aviso'),
(73, 'Can add user extra field value', 19, 'add_userextrafieldvalue'),
(74, 'Can change user extra field value', 19, 'change_userextrafieldvalue'),
(75, 'Can delete user extra field value', 19, 'delete_userextrafieldvalue'),
(76, 'Can view user extra field value', 19, 'view_userextrafieldvalue'),
(77, 'Can add extra field', 20, 'add_extrafield'),
(78, 'Can change extra field', 20, 'change_extrafield'),
(79, 'Can delete extra field', 20, 'delete_extrafield'),
(80, 'Can view extra field', 20, 'view_extrafield'),
(81, 'Can add congreso admin scope', 21, 'add_congresoadminscope'),
(82, 'Can change congreso admin scope', 21, 'change_congresoadminscope'),
(83, 'Can delete congreso admin scope', 21, 'delete_congresoadminscope'),
(84, 'Can view congreso admin scope', 21, 'view_congresoadminscope'),
(85, 'Can add concurso equipo', 22, 'add_concursoequipo'),
(86, 'Can change concurso equipo', 22, 'change_concursoequipo'),
(87, 'Can delete concurso equipo', 22, 'delete_concursoequipo'),
(88, 'Can view concurso equipo', 22, 'view_concursoequipo'),
(89, 'Can add concurso equipo miembro', 23, 'add_concursoequipomiembro'),
(90, 'Can change concurso equipo miembro', 23, 'change_concursoequipomiembro'),
(91, 'Can delete concurso equipo miembro', 23, 'delete_concursoequipomiembro'),
(92, 'Can view concurso equipo miembro', 23, 'view_concursoequipomiembro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(2, 'pbkdf2_sha256$1000000$9qDquGFQXSHiZ4p5gKI4nN$GDZSq3Y9dUGBMJ9JWcrKy8wSpgRRpLxZ1FibDqB21ho=', '2025-11-18 08:07:11.920334', 1, 'Jorge', '', '', 'l21070039@valladolid.tecnm.mx', 1, 1, '2025-10-20 20:17:42.000000'),
(12, 'pbkdf2_sha256$1000000$hgFtbIucyyzkkhPVfr6deN$f9gd5JoptFXfLZJUoviZiVDnLJTOR7kMA5UroFAG43A=', '2025-11-07 23:35:14.967445', 0, 'Tadeo', 'Tadeo Solis Lopez Cardenaz', '', '', 0, 1, '2025-10-28 11:56:17.965639'),
(20, 'pbkdf2_sha256$1000000$DaZYBaKOh7qQBCklqiYbYy$ZibCLteLB5aQPHTjwQQZHZSeGH/1ya/IfTMTcKDN+sM=', '2025-11-04 16:22:35.530770', 0, 'genny.cm@valladolid.tecnm.mx', 'Yesenia', 'Cetina Marrufo', 'genny.cm@valladolid.tecnm.mx', 0, 1, '2025-11-04 16:21:48.675885'),
(34, 'pbkdf2_sha256$1000000$AXJ2FwvBnW3s3wdRk0JplL$9qptjgMgS6MdqJ3k/U1ZePdcbA4FUhbNmK5wBVMgMUM=', NULL, 0, 'eduardo.cupul@valladolid.tecnm.mx', 'Eduardo', 'Cupul .', 'eduardo.cupul@valladolid.tecnm.mx', 0, 1, '2025-11-18 08:03:49.859508'),
(35, 'pbkdf2_sha256$1000000$f3uLvcc9ULI2tg8znO35si$liNaRocTRWTyhBE599hHyMW/wwHLuydaaPG9wM2pwmU=', NULL, 0, 'anibal.caballero@valladolid.tecnm.mx', 'Anibal', 'Caballero .', 'anibal.caballero@valladolid.tecnm.mx', 0, 1, '2025-11-18 08:05:10.179638'),
(36, 'pbkdf2_sha256$1000000$w3qvWgLbAP5qZKHxQrBNGG$gPPqd8M6r88S2QdYwpdoZOmhzGatqvm3+Y4r8XWP7Go=', '2025-11-18 08:07:00.442892', 0, 'leonardo.maldonado@valladolid.tecnm.mx', 'Leonardo', 'Maldonado .', 'leonardo.maldonado@valladolid.tecnm.mx', 0, 1, '2025-11-18 08:06:16.527310'),
(37, 'pbkdf2_sha256$1000000$yhY1ZinzWG4lExVwr4mvXq$PSiwqZDcvMwTtkB1LH+ab8N5+0kTDe8zrImrtVQ0fDA=', NULL, 0, 'carlos.morin@valladolid.tecnm.mx', 'Carlos', 'Morin .', 'carlos.morin@valladolid.tecnm.mx', 0, 1, '2025-11-18 08:08:28.360720'),
(38, 'pbkdf2_sha256$1000000$eu5dw1Ib4NrmScw4Bwgn7T$HPPgyv1kglDk55lGKKemjVsdzEPzGxUzoynPJbUKJWw=', NULL, 0, 'rafael.reyes@valladolid.tecnm.mx', 'Rafael', 'Reyes Zamudio', 'rafael.reyes@valladolid.tecnm.mx', 0, 1, '2025-11-18 08:11:42.909172'),
(39, 'pbkdf2_sha256$1000000$YOUvEHnLIoEA5UC4Zjt5Dv$jkD/MJXrWm5S3vC1J/l4b3sUUw0uDuw9EZiKy/6Gx7Y=', NULL, 0, 'miguel.cupul@valladolid.tecnm.mx', 'Miguel', 'Cupul .', 'miguel.cupul@valladolid.tecnm.mx', 0, 1, '2025-11-18 08:13:16.396168'),
(40, 'pbkdf2_sha256$1000000$2e8WT3VH9gMv2agIpLcGdP$Wb/0mQF/LBnK9K0CAOQv0CfBPtfSzsHMRtvyRzMotmw=', NULL, 0, 'fernando.pech@valladolid.tecnm.mx', 'Fernando', 'Pech May', 'fernando.pech@valladolid.tecnm.mx', 0, 1, '2025-11-18 08:14:30.598815'),
(41, 'pbkdf2_sha256$1000000$GEUcTu9FvMZSPmGVVFUVap$O1w7mJSCeb4d2x6CzgBFa24uPtO9CSv7HLpq7ukHGUU=', NULL, 0, 'edgar.poot@valladolid.tecnm.mx', 'Edgar', 'Poot Ku', 'edgar.poot@valladolid.tecnm.mx', 0, 1, '2025-11-18 08:17:14.259215'),
(42, 'pbkdf2_sha256$1000000$3a6XV4SXWf64SC3oBRTlv4$+CkL4lDKkNTNcSS9jdNho99FKqhgOvpipTA4hcFuhR4=', NULL, 0, 'cecilio.cauich@valladolid.tecnm.mx', 'Cecilio Gaspar', 'Cahuich Tun', 'cecilio.cauich@valladolid.tecnm.mx', 0, 1, '2025-11-18 08:22:19.131270');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(5, 2, 3),
(6, 12, 4),
(15, 20, 1),
(25, 34, 1),
(26, 35, 1),
(27, 36, 1),
(28, 37, 1),
(29, 38, 1),
(30, 39, 1),
(31, 40, 1),
(32, 41, 1),
(33, 42, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_allowedemaildomain`
--

DROP TABLE IF EXISTS `base_allowedemaildomain`;
CREATE TABLE IF NOT EXISTS `base_allowedemaildomain` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `congreso_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_allowedemaildomain_congreso_id_domain_a7a3929a_uniq` (`congreso_id`,`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `base_allowedemaildomain`
--

INSERT INTO `base_allowedemaildomain` (`id`, `domain`, `created_at`, `congreso_id`) VALUES
(14, '@correo.uady.mx', '2025-11-02 01:24:39.899143', 4),
(15, '@hotmail.com', '2025-11-02 01:24:59.213183', 4),
(16, '@valladolid.tecnm.mx', '2025-11-02 01:25:25.004640', 4),
(17, '@uacam.mx', '2025-11-02 01:25:43.864250', 4),
(18, '@itsva.edu.mx', '2025-11-02 01:25:56.017817', 4),
(20, '@gmail.com', '2025-11-07 03:21:15.847451', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_aviso`
--

DROP TABLE IF EXISTS `base_aviso`;
CREATE TABLE IF NOT EXISTS `base_aviso` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `congreso_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_aviso_congreso_id_7751196a_fk_base_congreso_id` (`congreso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `base_aviso`
--

INSERT INTO `base_aviso` (`id`, `content`, `created_at`, `congreso_id`) VALUES
(1, '¡Buenos días estudiantes!', '2025-11-03 11:51:02.246692', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_concurso`
--

DROP TABLE IF EXISTS `base_concurso`;
CREATE TABLE IF NOT EXISTS `base_concurso` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(300) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lugar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cupo_maximo` int UNSIGNED DEFAULT NULL,
  `numero_equipos` int UNSIGNED DEFAULT NULL,
  `max_por_equipo` int UNSIGNED DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `congreso_id` bigint NOT NULL,
  `instructor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_concurso_congreso_id_title_52d3d8cb_uniq` (`congreso_id`,`title`),
  KEY `base_concurso_instructor_id_79b33649_fk_auth_user_id` (`instructor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `base_concurso`
--

INSERT INTO `base_concurso` (`id`, `type`, `title`, `image`, `lugar`, `description`, `cupo_maximo`, `numero_equipos`, `max_por_equipo`, `created_at`, `congreso_id`, `instructor_id`) VALUES
(6, 'grupal', 'Torneo de configuración de redes de datos 2025', 'concursos/imagen_2025-11-18_005950688.png', 'Moodle', '<p><span style=\"font-size:16px\">El Instituto Tecnol&oacute;gico Superior de Valladolid imparte servicios educativos de calidad para formar de manera integral profesionistas competitivos que contribuyan al desarrollo socioecon&oacute;mico y tecnol&oacute;gico del pa&iacute;s, con el objetivo de fortalecer las competencias en temas de redes de computadoras para dise&ntilde;ar, configurar, enrutar y segmentar una red para que sea operable, segura y escalable para la comunicaci&oacute;n de datos.</span></p>\r\n\r\n<p align=\"center\"><br />\r\n<span style=\"font-size:24px\"><strong>&ldquo;Torneo de configuraci&oacute;n de redes de datos 2025&rdquo;</strong></span></p>\r\n\r\n<p><span style=\"font-size:16px\">El Instituto Tecnol&oacute;gico Superior de Valladolid imparte servicios educativos de calidad para formar de manera integral profesionistas competitivos que contribuyan al desarrollo socioecon&oacute;mico y tecnol&oacute;gico del pa&iacute;s, con el objetivo de fortalecer las competencias en temas de redes de computadoras para dise&ntilde;ar, configurar, enrutar y segmentar una red para que sea operable, segura y escalable para la comunicaci&oacute;n de datos, se</span></p>\r\n\r\n<p align=\"center\"><span style=\"font-size:24px\"><strong>Convoca:</strong></span></p>\r\n\r\n<p><span style=\"font-size:16px\">A todo el alumnado del plan de estudios a participar en el &ldquo;<strong>Torneo de configuraci&oacute;n de redes de datos&rdquo;</strong> en el marco de las actividades de la jornada acad&eacute;mica 2025 de ingenier&iacute;a en sistemas computacionales, que se llevar&aacute; a cabo el d&iacute;a lunes 24 de noviembre en horario de 17:00 a 20:00 hrs. En la plataforma Moodle, bajo las sigues</span></p>\r\n\r\n<p align=\"center\"><span style=\"font-size:24px\"><strong>Bases:</strong></span></p>\r\n\r\n<ol>\r\n	<li><span style=\"font-size:16px\">La participaci&oacute;n podr&aacute; ser de manera individual o en binas.</span></li>\r\n	<li><span style=\"font-size:16px\">Cupo m&aacute;ximo para 15 equipos o binas.</span></li>\r\n	<li><span style=\"font-size:16px\">Se deber&aacute;n inscribir con los datos siguientes: nombres, matricula, grupo y grado, podr&aacute;n realizarse v&iacute;a correo electr&oacute;nico:&nbsp; <a href=\"mailto:marvin.aa@valladolid.tecnm.mx\">marvin.aa@valladolid.tecnm.mx</a>, <a href=\"mailto:pastor.ad@valladolid.tecnm.mx\">pastor.ad@valladolid.tecnm.mx</a></span></li>\r\n	<li><span style=\"font-size:16px\">El concurso se realizar&aacute; de manera simulada con la herramienta Packet Tracer Versi&oacute;n 8.0 o superior.</span></li>\r\n	<li><span style=\"font-size:16px\">Los temas que deben dominar los participantes para el concurso son: subneting (VLSM), enrutamiento est&aacute;tico y/o enrutamiento din&aacute;mico (RIPv.2, EIGRP, OSPF), configuraci&oacute;n b&aacute;sica, configuraci&oacute;n de interfaces gigabitethertnet y serial, DHCP, direccionamiento IPv4 e IPv6.</span></li>\r\n	<li><span style=\"font-size:16px\">Indispensable traer una Laptop con el programa simulador de red instalado y conexi&oacute;n a internet.</span></li>\r\n	<li><span style=\"font-size:16px\">Los equipos participantes trav&eacute;s de su cuenta activa de la plataforma <a href=\"https://moodle.valladolid.tecnm.mx\">https://moodle.valladolid.tecnm.mx</a>, se auto-incribiran&nbsp; que contendr&aacute; la actividad.</span></li>\r\n	<li><span style=\"font-size:16px\">El escenario a resolver ser&aacute; habilitado en la plataforma Moodle del Tecnol&oacute;gico Superior de Valladolid el d&iacute;a 24 de noviembre a las 17:00 hrs. y ser&aacute; cerrado a las 20:00 hrs. para descargar y cargar el archivo de la actividad.</span></li>\r\n	<li><span style=\"font-size:16px\">Se subir&aacute; la actividad del proyecto en formato <strong><em>nombres_participantes.pkt</em></strong></span></li>\r\n	<li><span style=\"font-size:16px\">Los puntos a calificar son: funcionalidad, configuraci&oacute;n, dise&ntilde;o, organizaci&oacute;n de los dispositivos, tiempo de finalizaci&oacute;n.</span></li>\r\n	<li><span style=\"font-size:16px\">El viernes 28 de noviembre en la ceremonia de clausura de la jornada acad&eacute;mica se emitir&aacute; los resultados de los nombres de los equipos ganadores y se proceder&aacute; a la premiaci&oacute;n de los mismos.</span></li>\r\n</ol>\r\n\r\n<p align=\"center\"><span style=\"font-size:24px\"><strong>Premiaci&oacute;n:</strong></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:16px\">Se otorgar&aacute; un reconocimiento para los dos primeros lugares.</span></li>\r\n	<li><span style=\"font-size:16px\">Se premiar&aacute; al primer lugar, con un bono en efectivo de $2,000.</span></li>\r\n	<li><span style=\"font-size:16px\">Se premiar&aacute; al segundo lugar, con un bono en efectivo de $1000.</span></li>\r\n	<li><span style=\"font-size:16px\"><strong><em>El veredicto del jurado calificador ser&aacute; inapelable.&nbsp; </em></strong></span></li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:16px\">Dudas contactar al coordinador del evento Ing. Marvin Alejandro Arceo Alcocer al correo: <a href=\"mailto:marvin.arceo@itsva.edu.mx\">marvin.arceo@itsva.edu.mx</a> o al cel.: 9851014128</span></p>', NULL, 15, 2, '2025-11-18 07:02:26.551832', 4, NULL),
(7, 'grupal', 'Competencia: Carrera de autos a control remoto con Arduino o ESP32 2025', 'concursos/imagen_2025-11-18_010613592.png', '', '<p><span style=\"font-size:16px\">El Instituto Tecnol&oacute;gico Superior de Valladolid imparte servicios educativos de calidad para formar de manera integral profesionistas competitivos que contribuyan al desarrollo socioecon&oacute;mico y tecnol&oacute;gico del pa&iacute;s, con el objetivo de fomentar el desarrollo de habilidades en electr&oacute;nica, programaci&oacute;n y control de sistemas embebidos mediante el dise&ntilde;o y construcci&oacute;n de carritos a control remoto utilizando placas Arduino o ESP32, los participantes deber&aacute;n aplicar principios de rob&oacute;tica, control, e innovaci&oacute;n tecnol&oacute;gica.</span></p>\r\n\r\n<p align=\"center\"><span style=\"font-size:24px\"><strong>Convoca:</strong></span></p>\r\n\r\n<p><span style=\"font-size:16px\">A todo el alumnado del plan de estudios a participar en la &ldquo;<strong>carreras de carritos electr&oacute;nicos&rdquo;</strong> en el marco de las actividades de la jornada acad&eacute;mica 2025 de ingenier&iacute;a en sistemas computacionales, que se llevar&aacute; a cabo el d&iacute;a martes de 25 de noviembre en horario de 17:00 a 20:00 hrs. En la explanada principal del ITSVA bajo las siguientes.</span></p>\r\n\r\n<p align=\"center\"><span style=\"font-size:24px\"><strong>Bases:</strong></span></p>\r\n\r\n<ol>\r\n	<li><span style=\"font-size:16px\">Podr&aacute;n participar todos los estudiantes inscritos en el Instituto Tecnol&oacute;gico Superior de Valladolid del plan de estudios de ISC.</span></li>\r\n	<li><span style=\"font-size:16px\">Cupo limitado de participaci&oacute;n de carritos electr&oacute;nicos.</span></li>\r\n	<li><span style=\"font-size:16px\">La participaci&oacute;n podr&aacute; ser individual o en equipos de m&aacute;ximo 5 integrantes.</span></li>\r\n	<li><span style=\"font-size:16px\">Cada equipo deber&aacute; registrar un nombre a su carrito y designar un representante quien conducir&aacute; el carrito.</span></li>\r\n	<li><span style=\"font-size:16px\">Modalidad de la competencia: ser&aacute; por eliminaci&oacute;n directa cada ronda de carrera de dos carritos electr&oacute;nicos, el cual deber&aacute; ser capaz de recorrer una pista con diversos giros, rectas y una serie de obst&aacute;culos en zig-zag en el menor tiempo posible. &nbsp;</span></li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p align=\"center\"><span style=\"font-size:24px\"><strong>Requisitos t&eacute;cnicos</strong></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><strong>Hardware</strong></span></p>\r\n\r\n<ol>\r\n	<li><span style=\"font-size:16px\">Controlador principal: Arduino UNO/Nano/Mega o ESP32.</span></li>\r\n	<li><span style=\"font-size:16px\">Alimentaci&oacute;n aut&oacute;noma (bater&iacute;as recargables, no conexi&oacute;n directa a PC).</span></li>\r\n	<li><span style=\"font-size:16px\">Sistema de tracci&oacute;n con al menos dos motores DC o motores con engranajes.</span></li>\r\n	<li><span style=\"font-size:16px\">Sistema de control remoto (puede ser Bluetooth, Wi-Fi, RF o control f&iacute;sico).</span></li>\r\n	<li><span style=\"font-size:16px\">Estructura f&iacute;sica estable, segura y debe ser fabricado por el estudiante (sin bordes filosos ni piezas sueltas).</span></li>\r\n</ol>\r\n\r\n<p><span style=\"font-size:16px\"><strong>Software</strong></span></p>\r\n\r\n<ol>\r\n	<li><span style=\"font-size:16px\">El programa deber&aacute; estar desarrollado en Arduino IDE o compatible.</span></li>\r\n	<li><span style=\"font-size:16px\">Se evaluar&aacute; la originalidad, funcionalidad y eficiencia del c&oacute;digo.</span></li>\r\n	<li><span style=\"font-size:16px\">Deber&aacute; poder arrancar, detenerse y girar a ambos lados.</span></li>\r\n</ol>\r\n\r\n<p align=\"center\"><span style=\"font-size:24px\"><strong>Normas generales:</strong></span></p>\r\n\r\n<ol>\r\n	<li><span style=\"font-size:16px\">Los proyectos deben ser originales y construidos por los participantes.</span></li>\r\n	<li><span style=\"font-size:16px\">No se permiten kits armados comercialmente (salvo componentes individuales).</span></li>\r\n	<li><span style=\"font-size:16px\">Cualquier incumplimiento de las reglas podr&aacute; resultar en la descalificaci&oacute;n.</span></li>\r\n</ol>\r\n\r\n<p align=\"center\"><span style=\"font-size:24px\"><strong>Premiaci&oacute;n:</strong></span></p>\r\n\r\n<p><span style=\"font-size:16px\">La premiaci&oacute;n se realizar&aacute; el d&iacute;a de la clausura de la jornada academia 25B</span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:16px\">Se otorgar&aacute; un reconocimiento para los dos primeros lugares.</span></li>\r\n	<li><span style=\"font-size:16px\">Se premiar&aacute; al primer lugar, con un bono en efectivo de $2,000.</span></li>\r\n	<li><span style=\"font-size:16px\">Se premiar&aacute; al segundo lugar, con un bono en efectivo de $1000.</span></li>\r\n	<li><span style=\"font-size:16px\">El veredicto del jurado calificador ser&aacute; inapelable.&nbsp;</span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:16px\"><strong>Dudas contactar al coordinador del evento Ing. Carlos Cen Castro al correo:</strong> <a href=\"mailto:carlos.cc@valladolid.tecnm.mx\"><strong>carlos.cc@valladolid.tecnm.mx</strong></a><strong> o al cel.: 9851126716</strong></span></p>', NULL, 32, 5, '2025-11-18 07:07:25.804307', 4, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_concursoequipo`
--

DROP TABLE IF EXISTS `base_concursoequipo`;
CREATE TABLE IF NOT EXISTS `base_concursoequipo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `concurso_id` bigint NOT NULL,
  `congreso_id` bigint NOT NULL,
  `lider_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_concursoequipo_concurso_id_nombre_df3fad72_uniq` (`concurso_id`,`nombre`),
  KEY `base_concursoequipo_congreso_id_392beb52_fk_base_congreso_id` (`congreso_id`),
  KEY `base_concursoequipo_lider_id_0ed7b2d1_fk_auth_user_id` (`lider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_concursoequipomiembro`
--

DROP TABLE IF EXISTS `base_concursoequipomiembro`;
CREATE TABLE IF NOT EXISTS `base_concursoequipomiembro` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `equipo_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_concursoequipomiembro_equipo_id_user_id_dc13292a_uniq` (`equipo_id`,`user_id`),
  KEY `base_concursoequipomiembro_user_id_a1a75372_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_concursoinscripcion`
--

DROP TABLE IF EXISTS `base_concursoinscripcion`;
CREATE TABLE IF NOT EXISTS `base_concursoinscripcion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `congreso_id` bigint NOT NULL,
  `concurso_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `performance_level_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_concursoinscripcion_concurso_id_user_id_c9d4fdfb_uniq` (`concurso_id`,`user_id`),
  KEY `base_concursoinscripcion_user_id_eb49172f_fk_auth_user_id` (`user_id`),
  KEY `base_concursoinscrip_performance_level_id_9032d265_fk_base_perf` (`performance_level_id`),
  KEY `base_concur_congres_856b54_idx` (`congreso_id`,`concurso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_conferencia`
--

DROP TABLE IF EXISTS `base_conferencia`;
CREATE TABLE IF NOT EXISTS `base_conferencia` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lugar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `congreso_id` bigint NOT NULL,
  `instructor_id` int DEFAULT NULL,
  `cupo_maximo` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_conferencia_congreso_id_title_b95eb0cf_uniq` (`congreso_id`,`title`),
  KEY `base_conferencia_instructor_id_b5f86250_fk_auth_user_id` (`instructor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_conferenciainscripcion`
--

DROP TABLE IF EXISTS `base_conferenciainscripcion`;
CREATE TABLE IF NOT EXISTS `base_conferenciainscripcion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `congreso_id` bigint NOT NULL,
  `conferencia_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `performance_level_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_conferenciainscripcion_conferencia_id_user_id_5a8886ed_uniq` (`conferencia_id`,`user_id`),
  KEY `base_conferenciainscripcion_user_id_5aa4156c_fk_auth_user_id` (`user_id`),
  KEY `base_conferenciainsc_performance_level_id_24c68bba_fk_base_perf` (`performance_level_id`),
  KEY `base_confer_congres_7c6e0d_idx` (`congreso_id`,`conferencia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_congreso`
--

DROP TABLE IF EXISTS `base_congreso`;
CREATE TABLE IF NOT EXISTS `base_congreso` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `logo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` int DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `access_password_hash` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restrict_group_admin_scope` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  KEY `base_congreso_admin_user_id_a7b1fbf9_fk_auth_user_id` (`admin_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `base_congreso`
--

INSERT INTO `base_congreso` (`id`, `name`, `slug`, `created_at`, `logo`, `admin_user_id`, `description`, `access_password_hash`, `restrict_group_admin_scope`) VALUES
(4, 'Tecnologías emergentes  y desarrollo de software con IA', 'tecnologias-emergentes-y-desarrollo-de-software-con-ia-2', '2025-11-01 08:50:44.700872', 'logos/Logo_PEISC_5PWr0nd.png', 12, '<p>Buenas tardes a todos</p>', 'pbkdf2_sha256$1000000$YHaXNDdMnoR9GZSJ0R1Cw0$iuWFVhjKh4gjUHJU8HPXBvH72r8hXcHhGjaCoF5JiPE=', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_congresoadminscope`
--

DROP TABLE IF EXISTS `base_congresoadminscope`;
CREATE TABLE IF NOT EXISTS `base_congresoadminscope` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `congreso_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `base_congresoadminscope_user_id_congreso_id_ff51b7a6_uniq` (`user_id`,`congreso_id`),
  KEY `base_congresoadminscope_congreso_id_3f99f02b_fk_base_congreso_id` (`congreso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `base_congresoadminscope`
--

INSERT INTO `base_congresoadminscope` (`id`, `created_at`, `congreso_id`, `user_id`) VALUES
(1, '2025-11-07 22:33:31.283990', 4, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_extrafield`
--

DROP TABLE IF EXISTS `base_extrafield`;
CREATE TABLE IF NOT EXISTS `base_extrafield` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `order` int UNSIGNED NOT NULL,
  `choices_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `congreso_id` bigint DEFAULT NULL,
  `role_scope` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `section` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unique_value` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_extrafield_congreso_id_code_32bf5b71_uniq` (`congreso_id`,`code`),
  KEY `base_extrafield_code_3b076a44` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `base_extrafield`
--

INSERT INTO `base_extrafield` (`id`, `name`, `code`, `field_type`, `required`, `active`, `order`, `choices_text`, `created_at`, `congreso_id`, `role_scope`, `section`, `unique_value`) VALUES
(1, 'Matrícula', 'matricula', 'text', 1, 1, 0, 'Blue label', '2025-11-06 23:23:30.328625', 4, 'participante', 'registro', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_passwordresetcode`
--

DROP TABLE IF EXISTS `base_passwordresetcode`;
CREATE TABLE IF NOT EXISTS `base_passwordresetcode` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `expires_at` datetime(6) NOT NULL,
  `is_used` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_passwordresetcode_user_id_c53f92b9_fk_auth_user_id` (`user_id`),
  KEY `base_passwordresetcode_code_beb4c591` (`code`),
  KEY `base_passwo_code_33b032_idx` (`code`,`expires_at`,`is_used`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `base_passwordresetcode`
--

INSERT INTO `base_passwordresetcode` (`id`, `code`, `created_at`, `expires_at`, `is_used`, `user_id`) VALUES
(5, '2723', '2025-10-28 09:23:40.130457', '2025-10-28 09:43:40.130457', 1, 2),
(6, '2501', '2025-10-28 16:06:25.737651', '2025-10-28 16:36:25.737651', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_performancelevel`
--

DROP TABLE IF EXISTS `base_performancelevel`;
CREATE TABLE IF NOT EXISTS `base_performancelevel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `congreso_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_performancelevel_congreso_id_name_a15bb95e_uniq` (`congreso_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `base_performancelevel`
--

INSERT INTO `base_performancelevel` (`id`, `name`, `created_at`, `congreso_id`) VALUES
(2, '1° Semestre A', '2025-11-02 00:44:05.945931', 4),
(3, '1° Semestre B', '2025-11-02 00:45:03.314894', 4),
(4, '1° Semestre C', '2025-11-02 00:45:35.779554', 4),
(5, '3° Semestre A', '2025-11-02 00:46:15.240407', 4),
(6, '3° Semestre B', '2025-11-02 00:46:33.147237', 4),
(7, '5° Semestre A', '2025-11-02 00:46:57.053724', 4),
(8, '7° Semestre A', '2025-11-02 00:47:11.262894', 4),
(9, '7° Semestre B', '2025-11-02 00:47:23.062138', 4),
(10, '9° Semestre TI', '2025-11-02 00:48:15.611114', 4),
(11, '9° Semestre DS', '2025-11-02 00:48:42.064350', 4),
(12, 'Docente', '2025-11-02 00:49:17.816825', 4),
(13, '3° Semestre C', '2025-11-02 01:04:08.700669', 4),
(14, '5° Semestre B', '2025-11-02 01:04:53.818152', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_taller`
--

DROP TABLE IF EXISTS `base_taller`;
CREATE TABLE IF NOT EXISTS `base_taller` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lugar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cupo_maximo` int UNSIGNED DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `congreso_id` bigint NOT NULL,
  `instructor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_taller_congreso_id_title_6d27b8a5_uniq` (`congreso_id`,`title`),
  KEY `base_taller_instructor_id_9fcb18ac_fk_auth_user_id` (`instructor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `base_taller`
--

INSERT INTO `base_taller` (`id`, `title`, `image`, `lugar`, `cupo_maximo`, `description`, `created_at`, `congreso_id`, `instructor_id`) VALUES
(2, 'Taller 1. Introducción a la Inteligencia Artificial  y Herramientas para desarrollo - Turno Matutino / Dirigido a 1er Semestre y 3er semestre', 'talleres/IA.avif', 'CC3', 35, '<p style=\"text-align:center\"><strong><em>Comprender los fundamentos de la Inteligencia Artificial (IA) y aprender a utilizar herramientas gratuitas que potencien la productividad en el desarrollo de software.</em></strong></p>\r\n\r\n<hr />\r\n<p style=\"text-align:center\"><span style=\"font-size:24px\"><strong><em>Taller 1. Introducci&oacute;n a la Inteligencia Artificial &nbsp;y Herramientas para desarrollo - Turno Matutino / Dirigido a 1er Semestre y 3er semestre</em></strong></span></p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><strong>INTRODUCCI&Oacute;N A LA INTELIGENCIA ARTIFICIAL Y HERRAMIENTAS PARA EL DESARROLLO.</strong><br />\r\nObjetivo general<br />\r\nComprender los fundamentos de la Inteligencia Artificial (IA) y aprender a utilizar herramientas gratuitas que<br />\r\npotencien la productividad en el desarrollo de software.</p>\r\n\r\n<p><strong>Instructor:&nbsp;</strong>Ing. Eduardo Cupul</p>\r\n\r\n<p><strong>Lugar: </strong>CC3</p>\r\n\r\n<p><strong>Numero Maximo de participantes:</strong> 35</p>\r\n\r\n<p><strong>Turno: </strong>Matutino</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:22px\"><strong>Contenido del Curso</strong></span></p>\r\n\r\n<p><strong>Fundamentos de IA</strong><br />\r\n&bull; Qu&eacute; es la Inteligencia Artificial: conceptos b&aacute;sicos, tipos y aplicaciones reales.<br />\r\n&bull; Diferencia entre Machine Learning, Deep Learning e IA generativa.<br />\r\n&bull; C&oacute;mo funcionan los modelos de lenguaje (LLMs) como ChatGPT o Gemini.<br />\r\n&bull; Primeros pasos con ChatGPT, Gemini, Claude (Anthropic).<br />\r\n&bull; Comparativa entre los diferentes asistentes de IA</p>\r\n\r\n<p><br />\r\n<strong>Configuraci&oacute;n inicial de la IA</strong><br />\r\n&bull; Configuraci&oacute;n de entorno: instalaci&oacute;n de Codeium o Continue.dev en VS Code.<br />\r\n&bull; Pr&aacute;ctica guiada: autocompletar y explicar c&oacute;digo con IA.<br />\r\n&bull; Tarea: escribir y documentar un script simple con ayuda de IA.</p>\r\n\r\n<p><br />\r\n<strong>Aplicaciones pr&aacute;cticas en desarrollo</strong><br />\r\n&bull; C&oacute;mo usar IA para depurar c&oacute;digo y entender errores.<br />\r\n&bull; Generar documentaci&oacute;n autom&aacute;tica (README, comentarios, docstrings).<br />\r\n&bull; Generar y explicar pruebas unitarias con IA.<br />\r\n&bull; Convertir c&oacute;digo entre lenguajes (ej. JS &harr; .NET).<br />\r\n&bull; Pr&aacute;ctica guiada: refactorizar un m&oacute;dulo completo con IA.<br />\r\n&bull; Tarea: preparar un mini proyecto b&aacute;sico asistido (ej. API o script funcional).</p>\r\n\r\n<p><br />\r\n<strong>Automatizaci&oacute;n y proyectos con IA</strong><br />\r\n&bull; Conectar APIs gratuitas de IA (ej. Gemini API).<br />\r\n&bull; Crear un asistente simple en JavaScript o C# que procese preguntas.<br />\r\n&bull; Buenas pr&aacute;cticas: seguridad, privacidad y l&iacute;mites del uso de IA.<br />\r\n&bull; C&oacute;mo integrar IA en proyectos existentes.<br />\r\n&bull; Proyecto final: asistente de desarrollo que explique o genere c&oacute;digo<br />\r\n&bull; autom&aacute;ticamente.<br />\r\n&bull; Cierre: evaluaci&oacute;n, discusi&oacute;n y pr&oacute;ximos pasos para profundizar.</p>\r\n\r\n<p><br />\r\n<strong>Requisitos:</strong></p>\r\n\r\n<p><strong><em>Navegador Google Chrome con la &uacute;ltima versi&oacute;n.<br />\r\nVisual Studio Code 1.105.X o con la &uacute;ltima versi&oacute;n.<br />\r\nVisual Studio Community 2022 17.14.X o con la &uacute;ltima versi&oacute;n.<br />\r\nGit 2.51.X o con la &uacute;ltima versi&oacute;n.<br />\r\nNode Js LTS 24.11.X o con la &uacute;ltima versi&oacute;n<br />\r\nInternet m&iacute;nimo 5 Mbps.</em></strong></p>', '2025-11-14 12:49:49.801959', 4, 34),
(3, 'Taller 2. Taller de Videojuegos - Turno Matutino / Dirigido a 1er Semestre y 3er semestre', 'talleres/imagen_2025-11-14_065808536.png', 'CC1', 35, '<p align=\"center\"><strong><em>Desarrollar las habilidades necesarias para dise&ntilde;ar, crear y publicar videojuegos interactivos mediante el uso de motores de desarrollo como Unity, integrando conceptos de programaci&oacute;n, arte digital, dise&ntilde;o de niveles y experiencia de usuario.</em></strong></p>\r\n\r\n<hr />\r\n<p align=\"center\"><span style=\"font-size:24px\"><strong><em>Taller 2. Taller de Videojuegos - Turno Matutino / Dirigido a 1er Semestre y 3er semestre</em></strong></span></p>\r\n\r\n<hr />\r\n<p align=\"center\">&nbsp;</p>\r\n\r\n<p align=\"center\">&nbsp;</p>\r\n\r\n<p align=\"center\"><strong>Objetivo:</strong></p>\r\n\r\n<p><strong>Desarrollar las habilidades necesarias para dise&ntilde;ar, crear y publicar videojuegos interactivos mediante el uso de motores de desarrollo como Unity, integrando conceptos de programaci&oacute;n, arte digital, dise&ntilde;o de niveles y experiencia de usuario.</strong><br />\r\n<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Instructor: </strong>Mtro. Anibal Caballero</p>\r\n\r\n<p><strong>Lugar:</strong> CC1</p>\r\n\r\n<p><strong>N&uacute;mero m&aacute;ximo de participantes:</strong> 35</p>\r\n\r\n<p><strong>Turno: </strong>Matutino</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Contenido:<br />\r\n<strong>M&oacute;dulo 1: Introducci&oacute;n al desarrollo de videojuegos</strong></p>\r\n\r\n<ul>\r\n	<li>Historia y g&eacute;neros de videojuegos</li>\r\n	<li>Etapas de producci&oacute;n (preproducci&oacute;n, desarrollo, postproducci&oacute;n)</li>\r\n	<li>Roles en un equipo de desarrollo</li>\r\n</ul>\r\n\r\n<p><strong>M&oacute;dulo 2: Fundamentos del dise&ntilde;o de videojuegos</strong></p>\r\n\r\n<ul>\r\n	<li>Mec&aacute;nicas, din&aacute;micas y est&eacute;tica (modelo MDA)</li>\r\n	<li>Dise&ntilde;o de niveles y flujo de juego</li>\r\n	<li>Narrativa interactiva y guionizaci&oacute;n</li>\r\n</ul>\r\n\r\n<p><strong>M&oacute;dulo 3: Arte y recursos visuales</strong></p>\r\n\r\n<ul>\r\n	<li>Principios de arte 2D y 3D</li>\r\n	<li>Creaci&oacute;n y optimizaci&oacute;n de sprites, modelos y animaciones</li>\r\n	<li>Uso de herramientas: Photoshop, Blender, etc.</li>\r\n</ul>\r\n\r\n<p><strong>M&oacute;dulo 4: Programaci&oacute;n para videojuegos</strong></p>\r\n\r\n<ul>\r\n	<li>L&oacute;gica y scripting en C# (Unity)</li>\r\n	<li>Control de personajes, f&iacute;sicas y colisiones</li>\r\n	<li>Interfaz de usuario (UI/UX) y gesti&oacute;n de eventos</li>\r\n</ul>\r\n\r\n<p><strong>M&oacute;dulo 5: Desarrollo en motor de videojuegos (Unity)</strong></p>\r\n\r\n<ul>\r\n	<li>Interfaz, escenas y prefabs</li>\r\n	<li>Iluminaci&oacute;n, materiales y c&aacute;mara&nbsp;</li>\r\n	<li>Sonido, part&iacute;culas y efectos</li>\r\n</ul>\r\n\r\n<p><strong>Requisitos:</strong></p>\r\n\r\n<ul>\r\n	<li><strong><em>Adobe illustrator</em></strong></li>\r\n	<li><strong><em>Unity</em></strong></li>\r\n	<li><strong><em>Blender</em></strong></li>\r\n</ul>', '2025-11-14 12:52:05.185603', 4, 35),
(4, 'Taller 3. Aprendizaje de Programación con Inteligencia Artificial (Copilot como tutor) - Turno Matutino / Dirigido a 1er Semestre y 3er semestre', 'talleres/imagen_2025-11-14_065913220.png', 'CC2', 35, '<p align=\"center\"><strong><em>El participante desarrollar&aacute; las bases de la l&oacute;gica de programaci&oacute;n utilizandovherramientas de Inteligencia Artificial como asistente (GitHub Copilot u opciones equivalentes).</em></strong></p>\r\n\r\n<hr />\r\n<p align=\"center\"><span style=\"font-size:24px\"><strong><em>Taller 3. Aprendizaje de Programaci&oacute;n con Inteligencia Artificial (Copilot como tutor) - Turno Matutino / Dirigido a 1er Semestre y 3er semestre</em></strong></span></p>\r\n\r\n<hr />\r\n<p align=\"center\">&nbsp;</p>\r\n\r\n<p align=\"center\"><br />\r\n<strong>Objetivo del Taller:<br />\r\nEl participante desarrollar&aacute; las bases de la l&oacute;gica de programaci&oacute;n utilizando herramientas de Inteligencia Artificial como asistente (GitHub Copilot u opciones<br />\r\nequivalentes).</strong></p>\r\n\r\n<p><br />\r\n<strong>Al finalizar, ser&aacute; capaz de:</strong></p>\r\n\r\n<ul>\r\n	<li>Comprender conceptos fundamentales de programaci&oacute;n.</li>\r\n	<li>Utilizar IA como soporte para generar, mejorar y documentar c&oacute;digo.</li>\r\n	<li>Desarrollar peque&ntilde;os programas funcionales.</li>\r\n	<li>Construir un proyecto final guiado utilizando buenas pr&aacute;cticas.</li>\r\n</ul>\r\n\r\n<p><strong>D&iacute;a 1 &ndash; Introducci&oacute;n a la IA en Programaci&oacute;n</strong></p>\r\n\r\n<ul>\r\n	<li>Definici&oacute;n de la Inteligencia Artificial (IA) y su aplicaci&oacute;n en el &aacute;mbito de la programaci&oacute;n.</li>\r\n	<li>Instalaci&oacute;n y configuraci&oacute;n de GitHub Copilot o alternativas gratuitas disponibles.</li>\r\n	<li>Ejemplos iniciales en VS Code: Creaci&oacute;n de un programa &quot;Hola Mundo&quot; asistido por IA.</li>\r\n	<li>Ejercicios pr&aacute;cticos: Realizaci&oacute;n de c&aacute;lculos elementales y manipulaci&oacute;n de cadenas de texto.</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>D&iacute;a 2 &ndash; L&oacute;gica de Programaci&oacute;n Asistida por IA</strong></p>\r\n\r\n<ul>\r\n	<li>Estudio de estructuras de control fundamentales: condicionales (&#39;if&#39;), bucles &#39;while&#39; y bucles &#39;for&#39;.</li>\r\n	<li>Ejercicios pr&aacute;cticos con la asistencia de Copilot:</li>\r\n	<li>Desarrollo de una calculadora b&aacute;sica.</li>\r\n	<li>Implementaci&oacute;n de un conversor de unidades.</li>\r\n	<li>Desaf&iacute;o en parejas: Creaci&oacute;n de un men&uacute; interactivo en la consola.</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>D&iacute;a 3 &ndash; Funciones y Organizaci&oacute;n del C&oacute;digo</strong></p>\r\n\r\n<ul>\r\n	<li>An&aacute;lisis de las funciones y el rol de la IA en su generaci&oacute;n autom&aacute;tica.</li>\r\n	<li>Ejercicios pr&aacute;cticos:</li>\r\n	<li>Desarrollo de una funci&oacute;n para verificar si una palabra es un pal&iacute;ndromo.</li>\r\n	<li>Creaci&oacute;n de una funci&oacute;n para el c&aacute;lculo de &aacute;reas y vol&uacute;menes.</li>\r\n	<li>Implementaci&oacute;n de buenas pr&aacute;cticas en la colaboraci&oacute;n con herramientas de IA.</li>\r\n</ul>\r\n\r\n<p><strong>D&iacute;a 4 &ndash; Proyecto Final</strong></p>\r\n\r\n<ul>\r\n	<li>Desarrollo guiado de un proyecto: Un gestor de tareas en consola con funcionalidades de a&ntilde;adir, listar y eliminar.</li>\r\n	<li>Generaci&oacute;n de documentaci&oacute;n asistida por Copilot para el proyecto.</li>\r\n	<li>Presentaci&oacute;n de proyectos por equipos.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:14px\"><strong>Requisitos de Software:</strong></span></p>\r\n\r\n<ul>\r\n	<li>Computadora personal (Windows, Linux o macOS).</li>\r\n	<li>Conexi&oacute;n a Internet.</li>\r\n	<li>Software instalado:</li>\r\n	<li>Visual Studio Code (VS Code)</li>\r\n	<li>Extensi&oacute;n de GitHub Copilot</li>\r\n	<li>(opcional: Tabnine, Codeium o alternativas gratuitas)</li>\r\n	<li>Git</li>\r\n	<li>JavaScript</li>\r\n</ul>\r\n\r\n<p><strong>En caso de no contar con licencia de GitHub Copilot, se ofrecer&aacute;n alternativas gratuitas.</strong></p>', '2025-11-14 13:01:37.635032', 4, 36),
(5, 'Taller 4. Aprendizaje de Programación con Inteligencia Artificial (Copilot como tutor) - Turno Vespertino / Dirigido a 1er Semestre y 3er semestre', 'talleres/imagen_2025-11-14_070407942.png', 'CC2', 35, '<p><strong><em>El participante aplicar&aacute; conceptos intermedios de programaci&oacute;n orientada a objetos (POO), integrando herramientas de Inteligencia Artificial y consumo de APIs reales.</em></strong></p>\r\n\r\n<hr />\r\n<p align=\"center\"><span style=\"font-size:24px\"><strong><em>Taller 4. Aprendizaje de Programaci&oacute;n con Inteligencia Artificial (Copilot como tutor) - Turno Vespertino / Dirigido a 1er Semestre y 3er semestre</em></strong></span></p>\r\n\r\n<hr />\r\n<p align=\"center\">&nbsp;</p>\r\n\r\n<p align=\"center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><br />\r\n<strong>Objetivo del Taller</strong></p>\r\n\r\n<p><strong>El participante aplicar&aacute; conceptos intermedios de programaci&oacute;n orientada a objetos (POO), integrando herramientas de Inteligencia Artificial y consumo de APIs reales.</strong></p>\r\n\r\n<p><strong>Instructor:</strong>&nbsp;&nbsp;Ing. Leonardo Maldonado</p>\r\n\r\n<p><strong>Lugar:</strong> CC2</p>\r\n\r\n<p><strong>N&uacute;mero m&aacute;ximo de participantes:</strong> 35</p>\r\n\r\n<p><strong>Turno: </strong>Vespertino</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Al finalizar ser&aacute; capaz de:</strong></p>\r\n\r\n<ul>\r\n	<li>Crear y usar clases, objetos y herencia.</li>\r\n	<li>Generar y mejorar c&oacute;digo utilizando IA (GitHub Copilot o alternativas).</li>\r\n	<li>Consumir APIs externas para obtener y procesar datos.</li>\r\n	<li>Aplicar los conocimientos en un proyecto funcional con exportaci&oacute;n de datos.</li>\r\n</ul>\r\n\r\n<p><strong>Contenido:</strong></p>\r\n\r\n<p><strong>D&iacute;a 1 &ndash; Copilot y Programaci&oacute;n Orientada a Objetos</strong></p>\r\n\r\n<p><strong>Repaso de fundamentos de POO:</strong></p>\r\n\r\n<ul>\r\n	<li>Clases y objetos</li>\r\n	<li>Atributos y m&eacute;todos</li>\r\n	<li>Herencia</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Uso de Copilot como asistente para:</strong></p>\r\n\r\n<ul>\r\n	<li>Generar clases autom&aacute;ticamente</li>\r\n	<li>Crear m&eacute;todos b&aacute;sicos</li>\r\n	<li>Documentar c&oacute;digo</li>\r\n	<li>Ejercicio guiado:</li>\r\n	<li>Construcci&oacute;n de clases simples (ej. Persona, Producto)</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>D&iacute;a 2 &ndash; Consumo de APIs</strong></p>\r\n\r\n<p><strong>● Introducci&oacute;n:</strong></p>\r\n\r\n<ul>\r\n	<li>&iquest;Qu&eacute; es una API?</li>\r\n	<li>Formatos de respuesta: JSON</li>\r\n	<li>Endpoints y m&eacute;todos HTTP (GET, POST)</li>\r\n</ul>\r\n\r\n<p><strong>● Ejercicios pr&aacute;cticos:</strong></p>\r\n\r\n<ul>\r\n	<li>Consumo de una API de clima: mostrar temperatura de una ciudad</li>\r\n	<li>Consumo de una API de noticias: mostrar titulares en consola</li>\r\n</ul>\r\n\r\n<p><strong>● Buenas pr&aacute;cticas:</strong></p>\r\n\r\n<ul>\r\n	<li>Manejo b&aacute;sico de errores</li>\r\n	<li>Validaci&oacute;n de datos recibidos</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>D&iacute;a 3 &ndash; Proyecto Integrado (POO + API)</strong></p>\r\n\r\n<p><strong>● Desarrollo de una mini agenda utilizando clases</strong></p>\r\n\r\n<ul>\r\n	<li>Alta, consulta y eliminaci&oacute;n b&aacute;sica de registros</li>\r\n</ul>\r\n\r\n<p><strong>● Integraci&oacute;n de API real</strong></p>\r\n\r\n<ul>\r\n	<li>Ejemplo: datos de usuarios o clima</li>\r\n</ul>\r\n\r\n<p><strong>● Persistencia:</strong></p>\r\n\r\n<ul>\r\n	<li>Guardar y exportar datos en formato JSON</li>\r\n</ul>\r\n\r\n<p><strong>● Organizaci&oacute;n del c&oacute;digo:</strong></p>\r\n\r\n<ul>\r\n	<li>Separaci&oacute;n por m&oacute;dulos</li>\r\n	<li>Documentaci&oacute;n asistida por IA</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>D&iacute;a 4 &ndash; Proyecto Final</strong></p>\r\n\r\n<p>● Mini app por equipos</p>\r\n\r\n<p><strong>Ejemplos:</strong></p>\r\n\r\n<ul>\r\n	<li>Gestor de alumnos integrado con API de clima o noticias</li>\r\n	<li>Agenda inteligente con datos externos</li>\r\n</ul>\r\n\r\n<p><strong>● Entregables:</strong></p>\r\n\r\n<ul>\r\n	<li>C&oacute;digo funcional</li>\r\n	<li>Exportaci&oacute;n de datos</li>\r\n	<li>Documentaci&oacute;n generada con apoyo de IA</li>\r\n</ul>\r\n\r\n<p><strong>● Presentaci&oacute;n del proyecto</strong></p>\r\n\r\n<p><strong>Requisitos de Software</strong></p>\r\n\r\n<ul>\r\n	<li>Computadora personal (Windows, Linux o macOS)</li>\r\n	<li>Conexi&oacute;n a Internet</li>\r\n	<li>Software instalado:</li>\r\n	<li>Visual Studio Code (VS Code)</li>\r\n	<li>GitHub Copilot (o alternativas: Codeium, Tabnine)</li>\r\n	<li>Git</li>\r\n	<li>Lenguaje de programaci&oacute;n sugerido:</li>\r\n	<li>JavaScript</li>\r\n	<li>Extensi&oacute;n REST Client o herramienta equivalente (Postman opcional)</li>\r\n</ul>', '2025-11-14 13:03:53.122702', 4, 36),
(6, 'Taller 5. Máquinas que Piensan: de Turing a ChatGPT - Turno Matutino / Dirigido a 5to semestre, 7mo semestre y 9no semestre', 'talleres/imagen_2025-11-18_001101668.png', 'CC4', 35, '<p align=\"center\"><strong><em>Pendiente</em></strong></p>\r\n\r\n<hr />\r\n<p align=\"center\"><span style=\"font-size:24px\"><strong><em>Taller 5. M&aacute;quinas que Piensan: de Turing a ChatGPT - Turno Matutino / Dirigido a 5to semestre, 7mo semestre y 9no semestre</em></strong></span></p>\r\n\r\n<hr />\r\n<p align=\"center\">&nbsp;</p>\r\n\r\n<p><strong>Requisitos:</strong></p>\r\n\r\n<p><strong><em>-</em></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:20px\"><strong>Temario Propuesto</strong></span></p>\r\n\r\n<p><strong>1. Fundamentos de la Computaci&oacute;n y el Pensamiento Autom&aacute;tico</strong><br />\r\n1.1. Alan Turing y la idea de la m&aacute;quina universal<br />\r\n1.2. Aut&oacute;matas y lenguajes formales (vinculaci&oacute;n con sus materias)<br />\r\n1.3. El concepto de &ldquo;pensar&rdquo; en una m&aacute;quina: de la teor&iacute;a al software<br />\r\n1.4. Ejercicio pr&aacute;ctico: simulaci&oacute;n simple de aut&oacute;mata (M&aacute;quina de Turing)</p>\r\n\r\n<p><strong>2. M&aacute;quinas que Aprenden: Perceptrones y Redes Neuronales</strong><br />\r\n2.1. El perceptr&oacute;n de Rosenblatt y su importancia hist&oacute;rica<br />\r\n2.2. Limitaciones (el problema de XOR) y el &ldquo;invierno de la IA&rdquo;<br />\r\n2.3. Renacimiento con el algoritmo de retropropagaci&oacute;n<br />\r\n2.4. Ejercicio pr&aacute;ctico: implementaci&oacute;n de perceptr&oacute;n y red neuronal peque&ntilde;a en Python</p>\r\n\r\n<p><strong>3. La Era de los Datos y el Escalamiento</strong><br />\r\n3.1. De los sistemas expertos a la estad&iacute;stica y el aprendizaje autom&aacute;tico<br />\r\n3.2. El papel de los GPUs y el &ldquo;Big Data&rdquo; en la revoluci&oacute;n moderna<br />\r\n3.3. Modelos de clasificaci&oacute;n y regresi&oacute;n aplicados a conjuntos de datos reales<br />\r\n3.4. Ejercicio pr&aacute;ctico: an&aacute;lisis de datos en un entorno empresarial o de investigaci&oacute;n</p>\r\n\r\n<p><strong>4. Reconocimiento de Informaci&oacute;n y el Aprendizaje</strong><br />\r\n4.1. Explorando conjuntos de datos y agrupaci&oacute;n<br />\r\n4.2. Descubriendo los fundamentos de la visi&oacute;n computacional<br />\r\n4.3. La ubiquidad del reconocimiento de patrones artificial<br />\r\n4.4. Ejercicio pr&aacute;ctico: clasificador de d&iacute;gitos o texto con librer&iacute;as modernas</p>\r\n\r\n<p><strong>5. Transformers y Modelos Generativos</strong><br />\r\n5.1. El descubrimiento de la atenci&oacute;n: el paper Attention is All You Need (2017)<br />\r\n5.2. &iquest;C&oacute;mo entienden el contexto los modelos modernos?<br />\r\n5.3. De BERT a GPT: el salto hacia los modelos de lenguaje grandes (LLMs)<br />\r\n5.4. Ejercicio pr&aacute;ctico: implementaci&oacute;n de un mecanismo de atenci&oacute;n y entrenamiento de un<br />\r\nmodelo peque&ntilde;o generador de texto.</p>\r\n\r\n<p><strong>6. Filosof&iacute;a, Sociedad y Futuro de la IA</strong><br />\r\n6.1. El Test de Turing y la Habitaci&oacute;n China<br />\r\n6.2. &iquest;Inteligencia o simulaci&oacute;n? El debate contempor&aacute;neo<br />\r\n6.3. Usos responsables de la IA: sesgos, transparencia, &eacute;tica profesional<br />\r\n6.4. Discusi&oacute;n grupal: &iquest;qu&eacute; aplicaciones de IA sue&ntilde;an construir ustedes&rdquo;?</p>\r\n\r\n<p><strong>&bull; Se planea distribuir los temas por d&iacute;a seg&uacute;n sea conveniente.<br />\r\n&bull; Los ejercicios pr&aacute;cticos incluyen presentaci&oacute;n de un ejemplo y tarea.</strong></p>', '2025-11-14 13:07:48.897120', 4, 37),
(7, 'Taller 6. Máquinas que Piensan: de Turing a ChatGPT- Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre', 'talleres/imagen_2025-11-18_001114378.png', 'CC4', 35, '<p align=\"center\"><strong><em>Pendiente</em></strong></p>\r\n\r\n<hr />\r\n<p align=\"center\"><span style=\"font-size:24px\"><strong><em>Taller 6. M&aacute;quinas que Piensan: de Turing a ChatGPT- Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre</em></strong></span></p>\r\n\r\n<hr />\r\n<p align=\"center\">&nbsp;</p>\r\n\r\n<p><strong>Requisitos:</strong></p>\r\n\r\n<p><strong><em>-</em></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:20px\"><strong>Temario Propuesto</strong></span></p>\r\n\r\n<p><strong>1. Fundamentos de la Computaci&oacute;n y el Pensamiento Autom&aacute;tico</strong><br />\r\n1.1. Alan Turing y la idea de la m&aacute;quina universal<br />\r\n1.2. Aut&oacute;matas y lenguajes formales (vinculaci&oacute;n con sus materias)<br />\r\n1.3. El concepto de &ldquo;pensar&rdquo; en una m&aacute;quina: de la teor&iacute;a al software<br />\r\n1.4. Ejercicio pr&aacute;ctico: simulaci&oacute;n simple de aut&oacute;mata (M&aacute;quina de Turing)</p>\r\n\r\n<p><strong>2. M&aacute;quinas que Aprenden: Perceptrones y Redes Neuronales</strong><br />\r\n2.1. El perceptr&oacute;n de Rosenblatt y su importancia hist&oacute;rica<br />\r\n2.2. Limitaciones (el problema de XOR) y el &ldquo;invierno de la IA&rdquo;<br />\r\n2.3. Renacimiento con el algoritmo de retropropagaci&oacute;n<br />\r\n2.4. Ejercicio pr&aacute;ctico: implementaci&oacute;n de perceptr&oacute;n y red neuronal peque&ntilde;a en Python</p>\r\n\r\n<p><strong>3. La Era de los Datos y el Escalamiento</strong><br />\r\n3.1. De los sistemas expertos a la estad&iacute;stica y el aprendizaje autom&aacute;tico<br />\r\n3.2. El papel de los GPUs y el &ldquo;Big Data&rdquo; en la revoluci&oacute;n moderna<br />\r\n3.3. Modelos de clasificaci&oacute;n y regresi&oacute;n aplicados a conjuntos de datos reales<br />\r\n3.4. Ejercicio pr&aacute;ctico: an&aacute;lisis de datos en un entorno empresarial o de investigaci&oacute;n</p>\r\n\r\n<p><strong>4. Reconocimiento de Informaci&oacute;n y el Aprendizaje</strong><br />\r\n4.1. Explorando conjuntos de datos y agrupaci&oacute;n<br />\r\n4.2. Descubriendo los fundamentos de la visi&oacute;n computacional<br />\r\n4.3. La ubiquidad del reconocimiento de patrones artificial<br />\r\n4.4. Ejercicio pr&aacute;ctico: clasificador de d&iacute;gitos o texto con librer&iacute;as modernas</p>\r\n\r\n<p><strong>5. Transformers y Modelos Generativos</strong><br />\r\n5.1. El descubrimiento de la atenci&oacute;n: el paper Attention is All You Need (2017)<br />\r\n5.2. &iquest;C&oacute;mo entienden el contexto los modelos modernos?<br />\r\n5.3. De BERT a GPT: el salto hacia los modelos de lenguaje grandes (LLMs)<br />\r\n5.4. Ejercicio pr&aacute;ctico: implementaci&oacute;n de un mecanismo de atenci&oacute;n y entrenamiento de un<br />\r\nmodelo peque&ntilde;o generador de texto.</p>\r\n\r\n<p><strong>6. Filosof&iacute;a, Sociedad y Futuro de la IA</strong><br />\r\n6.1. El Test de Turing y la Habitaci&oacute;n China<br />\r\n6.2. &iquest;Inteligencia o simulaci&oacute;n? El debate contempor&aacute;neo<br />\r\n6.3. Usos responsables de la IA: sesgos, transparencia, &eacute;tica profesional<br />\r\n6.4. Discusi&oacute;n grupal: &iquest;qu&eacute; aplicaciones de IA sue&ntilde;an construir ustedes&rdquo;?</p>\r\n\r\n<p><strong>&bull; Se planea distribuir los temas por d&iacute;a seg&uacute;n sea conveniente.<br />\r\n&bull; Los ejercicios pr&aacute;cticos incluyen presentaci&oacute;n de un ejemplo y tarea.</strong></p>', '2025-11-14 13:11:33.379315', 4, 37),
(8, 'Taller 7. Taller de ciencia de Datos y Aprendizaje Automático - Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre', 'talleres/imagen_2025-11-14_071533362.png', 'CC3', 35, '<p align=\"center\"><strong><em>Desarrollar en el estudiante las competencias necesarias para comprender, analizar y aplicar los fundamentos de la Ciencia de Datos y el Aprendizaje Autom&aacute;tico (Machine Learning), mediante el uso de herramientas computacionales de vanguardia, que permitan procesar, analizar y modelar informaci&oacute;n para la toma de decisiones en contextos reales.</em></strong></p>\r\n\r\n<hr />\r\n<p align=\"center\"><span style=\"font-size:24px\"><strong><em>Taller 7. Taller de ciencia de Datos y Aprendizaje Autom&aacute;tico - Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre</em></strong></span></p>\r\n\r\n<hr />\r\n<p align=\"center\">&nbsp;</p>\r\n\r\n<p><strong>Requisitos:</strong></p>\r\n\r\n<p><strong><em>▪ Lenguaje: Python 3.x<br />\r\n▪ Entorno: Jupyter Notebook (Anaconda)<br />\r\n▪ Librer&iacute;as: pandas, NumPy, scikit-learn, matplotlib, seaborn<br />\r\n▪ Fuentes de datos: INEGI, datos.gob.mx, Kaggle</em></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>✓ Dirigido a: </strong>Estudiantes de Ingenier&iacute;a en Sistemas Computacionales<br />\r\n<strong>✓ Duraci&oacute;n total: </strong>30 horas (18 presenciales + 12 as&iacute;ncronas)<br />\r\n<strong>✓ Modalidad: </strong>Mixta<br />\r\n<strong>✓ Nivel: </strong>Intermedio<br />\r\n<strong>✓ Requisitos previos: </strong>Conocimientos b&aacute;sicos de programaci&oacute;n y fundamentos de<br />\r\nestad&iacute;stica.</p>\r\n\r\n<p><strong>Justificaci&oacute;n:</strong><br />\r\nLa Ingenier&iacute;a en Sistemas Computacionales enfrenta el reto de transformar grandes<br />\r\nvol&uacute;menes de informaci&oacute;n en conocimiento &uacute;til para la soluci&oacute;n de problemas t&eacute;cnicos,<br />\r\ncient&iacute;ficos y sociales. El auge del Machine Learning y la Ciencia de Datos est&aacute; redefiniendo el<br />\r\ncampo de la ingenier&iacute;a, impulsando el desarrollo de sistemas inteligentes, an&aacute;lisis<br />\r\npredictivo y automatizaci&oacute;n de procesos. Este taller proporciona a los estudiantes los<br />\r\nfundamentos conceptuales y pr&aacute;cticos para iniciarse en estas &aacute;reas, fortaleciendo su perfil<br />\r\nprofesional y su capacidad de an&aacute;lisis mediante la implementaci&oacute;n de modelos<br />\r\ncomputacionales con Python.</p>\r\n\r\n<p><span style=\"font-size:16px\"><strong>Temario:</strong></span></p>\r\n\r\n<p><strong><span style=\"color:#3498db\">M&oacute;dulo 1. Introducci&oacute;n a la Ciencia de Datos:</span><br />\r\n&bull; Conceptos fundamentales:</strong> datos, informaci&oacute;n y conocimiento.<br />\r\n<strong>&bull; El ciclo de vida de los datos.<br />\r\n&bull; Roles en la ciencia de datos.<br />\r\n&bull; Herramientas y entornos de trabajo: </strong>Python, Jupyter Notebook, Anaconda.<br />\r\n<strong>&bull; Actividad as&iacute;ncrona: </strong>Instalaci&oacute;n del entorno y ejecuci&oacute;n de notebooks<br />\r\nintroductorios.</p>\r\n\r\n<p><span style=\"color:#3498db\"><strong>M&oacute;dulo 2. Adquisici&oacute;n, limpieza y exploraci&oacute;n de datos</strong></span><br />\r\n&bull; Fuentes de datos: archivos, APIs y portales de datos abiertos mexicanos (INEGI,<br />\r\ndatos.gob.mx).<br />\r\n&bull; Procesamiento y limpieza de datos con pandas.<br />\r\n&bull; Manejo de valores faltantes y tipos de datos.<br />\r\n&bull; An&aacute;lisis exploratorio y visualizaci&oacute;n con matplotlib y seaborn.<br />\r\n&bull; Actividad as&iacute;ncrona: An&aacute;lisis exploratorio de un dataset.</p>\r\n\r\n<p><span style=\"color:#3498db\"><strong>M&oacute;dulo 3. Fundamentos del Aprendizaje Autom&aacute;tico</strong></span><br />\r\n&bull; Concepto y tipos de aprendizaje: supervisado, no supervisado y por refuerzo.&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &bull; Flujo general de un modelo de machine learning.<br />\r\n&bull; Divisi&oacute;n de datos (entrenamiento, validaci&oacute;n y prueba).<br />\r\n&bull; M&eacute;tricas de evaluaci&oacute;n y validaci&oacute;n cruzada.<br />\r\n&bull; Actividad as&iacute;ncrona: Lectura y an&aacute;lisis de un caso real de ML aplicado en M&eacute;xico.</p>\r\n\r\n<p><span style=\"color:#3498db\"><strong>M&oacute;dulo 4. Modelos supervisados</strong></span><br />\r\n&bull; Regresi&oacute;n lineal y regresi&oacute;n log&iacute;stica.<br />\r\n&bull; &Aacute;rboles de decisi&oacute;n y bosques aleatorios.<br />\r\n&bull; Entrenamiento y evaluaci&oacute;n de modelos con scikit-learn.<br />\r\n&bull; Actividad as&iacute;ncrona: Pr&aacute;ctica de predicci&oacute;n o clasificaci&oacute;n binaria.</p>\r\n\r\n<p><span style=\"color:#3498db\"><strong>M&oacute;dulo 5. Modelos no supervisados y reducci&oacute;n de datos</strong></span><br />\r\n&bull; Algoritmos de agrupamiento: K-means, DBSCAN.<br />\r\n&bull; Reducci&oacute;n de dimensionalidad con PCA.<br />\r\n&bull; Interpretaci&oacute;n visual y an&aacute;lisis de resultados.<br />\r\n&bull; Actividad as&iacute;ncrona: Proyecto de segmentaci&oacute;n o agrupamiento de registros reales.</p>\r\n\r\n<p><span style=\"color:#3498db\"><strong>M&oacute;dulo 6. Proyecto integrador</strong></span><br />\r\n&bull; Formulaci&oacute;n de un problema aplicado.<br />\r\n&bull; Preparaci&oacute;n, limpieza y modelado de datos.<br />\r\n&bull; Entrenamiento y evaluaci&oacute;n de modelos.<br />\r\n&bull; Comunicaci&oacute;n y visualizaci&oacute;n de resultados.<br />\r\n&bull; Entrega final: Notebook documentado con presentaci&oacute;n oral o escrita del proyecto.</p>\r\n\r\n<p><strong>Competencias a Desarrollar:</strong></p>\r\n\r\n<p>▪ Comprende el ciclo completo del an&aacute;lisis de datos.<br />\r\n▪ Implementa modelos b&aacute;sicos de aprendizaje autom&aacute;tico.<br />\r\n▪ Utiliza Python y librer&iacute;as especializadas en an&aacute;lisis de datos.<br />\r\n▪ Interpreta resultados y comunica hallazgos t&eacute;cnicos.<br />\r\n▪ Aplica pensamiento anal&iacute;tico para la soluci&oacute;n de problemas reales.</p>\r\n\r\n<p><strong>Actividades de Aprendizaje:</strong></p>\r\n\r\n<p>✓ Ejercicios guiados en notebooks de Python.<br />\r\n✓ An&aacute;lisis y discusi&oacute;n de casos pr&aacute;cticos.<br />\r\n✓ Mini-proyectos de modelado predictivo.<br />\r\n✓ Lecturas t&eacute;cnicas.<br />\r\n✓ Presentaci&oacute;n y defensa del proyecto final.</p>', '2025-11-14 13:14:52.351310', 4, 38),
(9, 'Taller 8. Desarrollo de Asistentes de IA - Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre', 'talleres/imagen_2025-11-14_071753925.png', 'SALÓN B1', 35, '<p align=\"center\"><strong><em>Desarrollar una aplicaci&oacute;n web interactiva con Blazor que integre el modelo de lenguaje de IA, desplegada en contenedores mediante Docker, con el prop&oacute;sito de implementar un chat inteligente que asista a los estudiantes en sus actividades acad&eacute;micas, aplicando t&eacute;cnicas modernas de inteligencia artificial y procesamiento del lenguaje natural (NLP).</em></strong></p>\r\n\r\n<hr />\r\n<p align=\"center\"><span style=\"font-size:24px\"><strong><em>Taller 8. Desarrollo de Asistentes de IA - Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre</em></strong></span></p>\r\n\r\n<hr />\r\n<p align=\"center\">&nbsp;</p>\r\n\r\n<p><strong>Requisitos:</strong></p>\r\n\r\n<p><strong><em>1. .NET 9 SDK<br />\r\n2. Visual Studio 2022<br />\r\n3. Docker Desktop</em></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Contenido del Curso:</strong></p>\r\n\r\n<p><span style=\"font-size:14px\"><strong>M&oacute;dulo 1: Introducci&oacute;n al desarrollo de IA con .NET<br />\r\nTemas:</strong></span><br />\r\n1. Panorama actual de la IA generativa en .NET<br />\r\n2. Introducci&oacute;n a modelos locales (Llama, Mistral, Phi, etc.)<br />\r\n3. Instalaci&oacute;n de .NET SDK, Docker y el modelo de IA.<br />\r\n4. Creaci&oacute;n de un proyecto base con la plantilla .NET AI<br />\r\n5. Estructura del proyecto y componentes clave</p>\r\n\r\n<p><span style=\"font-size:14px\"><strong>M&oacute;dulo 2: Integraci&oacute;n de Blazor como interfaz conversacional</strong><br />\r\n<strong>Temas:</strong></span><br />\r\n1. Conceptos fundamentales de Blazor Server y WebAssembly<br />\r\n2. Creaci&oacute;n de la interfaz del chat (entrada, historial, respuestas)<br />\r\n3. Comunicaci&oacute;n en tiempo real con la IA<br />\r\n4. Manejo de contexto y estado de conversaci&oacute;n</p>\r\n\r\n<p><span style=\"font-size:14px\"><strong>M&oacute;dulo 3: Conexi&oacute;n de fuentes de datos personalizadas<br />\r\nTemas:</strong></span><br />\r\n1. Lectura de archivos locales (TXT, PDF, CSV) como fuentes de conocimiento<br />\r\n2. Incorporaci&oacute;n de contexto a las respuestas del modelo<br />\r\n3. Estrategias para embeddings o b&uacute;squeda sem&aacute;ntica (introducci&oacute;n)</p>\r\n\r\n<p><span style=\"font-size:14px\"><strong>M&oacute;dulo 4: Creaci&oacute;n de herramientas y funciones personalizadas<br />\r\nTemas:</strong></span><br />\r\n1. Concepto de &ldquo;functions&rdquo; o &ldquo;tools&rdquo; en la IA de .NET<br />\r\n2. Creaci&oacute;n de m&eacute;todos invocables por el modelo<br />\r\n3. Ejemplo: c&aacute;lculo, consultas, validaciones o respuestas personalizadas<br />\r\n4. Registro e invocaci&oacute;n de funciones en tiempo de ejecuci&oacute;n</p>\r\n\r\n<p><span style=\"font-size:14px\"><strong>M&oacute;dulo 5: Contenerizaci&oacute;n y ejecuci&oacute;n local<br />\r\nTemas:</strong></span><br />\r\n1. Integraci&oacute;n de Ollama y Blazor en contenedores</p>', '2025-11-14 13:19:38.328613', 4, 39),
(10, 'Taller 9. Uso de Google Earth Engine e Inteligencia Artificial - Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre', 'talleres/imagen_2025-11-14_072416208.png', 'SALÓN B2', 35, '<p align=\"center\"><strong><em>Analizar el potencial y uso de t&eacute;cnicas y herramientas de inteligencia artificial y percepci&oacute;n remoto para la gesti&oacute;n de problemas de impacto medioambiental, la prevenci&oacute;n de desastres naturales y el monitoreo ambiental.</em></strong></p>\r\n\r\n<hr />\r\n<p align=\"center\"><span style=\"font-size:24px\"><strong><em>Taller 9. Uso de Google Earth Engine e Inteligencia Artificial - Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre</em></strong></span></p>\r\n\r\n<hr />\r\n<p align=\"center\">&nbsp;</p>\r\n\r\n<p><span style=\"font-size:12px\"><strong>Requisitos:</strong></span></p>\r\n\r\n<p><span style=\"font-size:12px\"><strong><em>&bull; Conexi&oacute;n estable a Internet<br />\r\n&bull; Cuenta de Gmail<br />\r\n&bull; Cuenta de Google Earth Engine activa<br />\r\n&bull; IDE de python Jupyter Notebook</em></strong></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:12px\"><strong>Taller: </strong>Uso de Google Earth Engine e Inteligencia Artificial para el monitoreo ambiental&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<strong>Duraci&oacute;n: </strong>18 horas s&iacute;ncronas y 12 horas as&iacute;ncronas<br />\r\n<strong>Facilitador: </strong>Dr. Fernando Pech May</span></p>\r\n\r\n<p><span style=\"font-size:12px\"><strong>Resumen:</strong><br />\r\nGoogle Earth Engine (GEE) es una plataforma gratuita basada en la nube que combina petabytes de im&aacute;genes<br />\r\nsatelitales y conjuntos de datos geoespaciales con la infraestructura computacional de Google. Permite a los<br />\r\nusuarios analizar y visualizar im&aacute;genes satelitales del planeta Tierra obtenidas a trav&eacute;s de t&eacute;cnicas de Percepci&oacute;n<br />\r\nRemota (PR).</span></p>\r\n\r\n<p><br />\r\n<span style=\"font-size:12px\">Por otro lado, el creciente avance de la inteligencia artificial, junto con la gran cantidad de datos satelitales<br />\r\nabiertos disponibles, han facilitado el desarrollo de modelos de mapeo para el monitoreo ambiental y la gesti&oacute;n de<br />\r\ndistintos desastres naturales. Los algoritmos de aprendizaje autom&aacute;tico se utilizan en teledetecci&oacute;n para el<br />\r\nan&aacute;lisis de datos satelitales. Los algoritmos de aprendizaje profundo (DL) han adquirido una gran importancia<br />\r\ngracias a su capacidad para discriminar esos datos, automatizar y mejorar la precisi&oacute;n de tareas como la<br />\r\nclasificaci&oacute;n de im&aacute;genes, la detecci&oacute;n de caracter&iacute;sticas y la generaci&oacute;n de representaciones cartogr&aacute;ficas<br />\r\ntem&aacute;ticas.</span></p>\r\n\r\n<p><span style=\"font-size:12px\"><strong>Resultados de aprendizaje</strong><br />\r\nLos participantes podr&aacute;n familiarizarse en la plataforma geoespacial Google Earth Engine (GEE), el uso y an&aacute;lisis<br />\r\ny preprocesamiento de im&aacute;genes satelitales &oacute;pticas y radar para el monitoreo ambiental. Tambi&eacute;n explorar&aacute;<br />\r\nfunciones de GEE as&iacute; como codificaci&oacute;n en python para creaci&oacute;n de mosaicos y series de tiempo. Se usar&aacute;n<br />\r\ndistintos algoritmos de aprendizaje autom&aacute;tico (Random Fores, CRF, SVM, etc.) para realizar sistemas de<br />\r\npredicci&oacute;n para la segmentaci&oacute;n y mapeo para los distintos tipos de uso de suelo.</span></p>', '2025-11-14 13:24:51.213313', 4, 40),
(11, 'Taller 10. Desarrollo de aplicaciones empresariales. BACKEND con Python y MySQL. Rumbo al campo laboral de desarrollo de Software - Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre', 'talleres/imagen_2025-11-14_072748272_OKa2JMh.png', 'CC1', 40, '<p align=\"center\"><strong><em>Formar a los alumnos en el desarrollo de aplicaciones web avanzadas utilizando Django, enfoc&aacute;ndose en la autenticaci&oacute;n de usuarios, gesti&oacute;n de perfiles, &aacute;reas protegidas, sistemas de mensajer&iacute;a privada y la integraci&oacute;n de modelos de Inteligencia Artificial (Regresi&oacute;n Lineal) para simulaci&oacute;n de ventas, preparando proyectos listos para entornos reales.</em></strong></p>\r\n\r\n<hr />\r\n<p align=\"center\"><span style=\"font-size:24px\"><strong><em>Taller 10. Desarrollo de aplicaciones empresariales. BACKEND con Python y MySQL. Rumbo al campo laboral de desarrollo de Software - Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre</em></strong></span></p>\r\n\r\n<hr />\r\n<p align=\"center\"><strong>Objetivo del Taller:</strong></p>\r\n\r\n<p align=\"center\"><strong>Formar a los alumnos en el desarrollo de aplicaciones web avanzadas utilizando Django, enfoc&aacute;ndose en la autenticaci&oacute;n de usuarios, gesti&oacute;n de perfiles, &aacute;reas protegidas, sistemas de mensajer&iacute;a privada y la integraci&oacute;n de modelos de Inteligencia Artificial (Regresi&oacute;n Lineal) para simulaci&oacute;n de ventas, preparando proyectos listos para entornos reales.</strong></p>\r\n\r\n<p align=\"center\">&nbsp;</p>\r\n\r\n<p><strong>Instructor:&nbsp;</strong>Ing. Edgar &nbsp;poot Ku</p>\r\n\r\n<p><strong>Lugar: </strong>CC1</p>\r\n\r\n<p><strong>N&uacute;mero m&aacute;ximo de participantes: </strong>40</p>\r\n\r\n<p><strong>Turno: V</strong>espertino</p>\r\n\r\n<p><br />\r\n<strong>Objetivos espec&iacute;ficos:</strong><br />\r\nAl finalizar el curso, el alumno ser&aacute; capaz de:</p>\r\n\r\n<ul>\r\n	<li>Configurar y estructurar proyectos Django avanzados.</li>\r\n	<li>Implementar autenticaci&oacute;n y registro de usuarios con perfiles personalizados.</li>\r\n	<li>Proteger secciones internas mediante autenticaci&oacute;n y permisos.</li>\r\n	<li>Construir un sistema funcional de mensajer&iacute;a privada entre usuarios.</li>\r\n	<li>Crear y consumir APIs seguras con Django REST Framework.</li>\r\n	<li>Integrar un modelo simple de IA (Regresi&oacute;n Lineal) al backend para realizar predicciones.</li>\r\n	<li>Preparar un proyecto Django para despliegue en un entorno de producci&oacute;n.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Calendario y distribuci&oacute;n de contenido</strong><br />\r\n<strong>Dia 1<br />\r\nM&oacute;dulo 1: Fundamentos de Django<br />\r\nM&oacute;dulo 2: Perfiles y Secciones Internas</strong></p>\r\n\r\n<ul>\r\n	<li>Configuraci&oacute;n del entorno y proyecto Django.</li>\r\n	<li>Autenticaci&oacute;n y registro de usuarios.</li>\r\n	<li>Creaci&oacute;n de perfiles personalizados.</li>\r\n	<li>Restricci&oacute;n de secciones internas mediante login.</li>\r\n	<li>Duraci&oacute;n 6 Horas</li>\r\n</ul>\r\n\r\n<p><strong>D&iacute;a 2<br />\r\nM&oacute;dulo 3: Sistema de Mensajer&iacute;a Privada<br />\r\nM&oacute;dulo 4: APIs y Seguridad Backend</strong></p>\r\n\r\n<ul>\r\n	<li>Modelos de conversaciones y mensajes.</li>\r\n	<li>Control de acceso y notificaciones b&aacute;sicas.</li>\r\n	<li>Creaci&oacute;n de APIs con DRF.</li>\r\n	<li>Seguridad y autenticaci&oacute;n con tokens/JWT.</li>\r\n	<li>Duraci&oacute;n: 6 horas</li>\r\n</ul>\r\n\r\n<p><strong>D&iacute;as 3<br />\r\nM&oacute;dulo 5: Despliegue y Pruebas Finales<br />\r\nM&oacute;dulo 6: IA con Regresi&oacute;n Lineal.</strong></p>\r\n\r\n<ul>\r\n	<li>Ajustes de producci&oacute;n y manejo de secretos.</li>\r\n	<li>Pruebas unitarias e integraci&oacute;n.</li>\r\n	<li>Generaci&oacute;n de datos simulados.</li>\r\n	<li>Entrenamiento e integraci&oacute;n de un modelo de regresi&oacute;n lineal.</li>\r\n	<li>Endpoint de predicci&oacute;n y visualizaci&oacute;n de resultados.</li>\r\n	<li>Duraci&oacute;n 6 horas.</li>\r\n</ul>\r\n\r\n<p align=\"center\">&nbsp;</p>\r\n\r\n<p><strong>Requisitos:</strong></p>\r\n\r\n<p><strong><em>Microsoft Visual Studio.<br />\r\n.NET SDK 7 o posteriores<br />\r\nSql Server Motor de base de datos (Express<br />\r\nEdition)<br />\r\nSQL Server Management Studio (SSMS)</em></strong></p>', '2025-11-14 13:32:59.346239', 4, 41),
(12, 'Taller 11. Automatización Inteligente con .NET: De Web Scraping a Bots con IA - Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre', 'talleres/imagen_2025-11-14_074009898.png', 'SALA DE JUNTAS', 30, '<p align=\"center\"><strong><em>Desarrollar soluciones de automatizaci&oacute;n inteligentes combinando t&eacute;cnicas de Web Scraping, RPA e Inteligencia Artificial con tecnolog&iacute;as .NET. Al finalizar, ser&aacute; capaz de crear bots que extraen informaci&oacute;n de la web, la procesan y generan res&uacute;menes o reportes autom&aacute;ticos mediante modelos de lenguaje.</em></strong></p>\r\n\r\n<hr />\r\n<p align=\"center\"><span style=\"font-size:24px\"><strong><em>Taller 11. Automatizaci&oacute;n Inteligente con .NET: De Web Scraping a Bots con IA - Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre</em></strong></span></p>\r\n\r\n<hr />\r\n<p align=\"center\"><br />\r\n<strong>Objetivo del curso</strong><br />\r\nQue el alumno aprenda a desarrollar soluciones de automatizaci&oacute;n inteligentes combinando t&eacute;cnicas de Web Scraping, RPA e Inteligencia Artificial con tecnolog&iacute;as .NET. Al finalizar, ser&aacute; capaz de crear bots que extraen informaci&oacute;n de la web, la procesan y generan res&uacute;menes o reportes autom&aacute;ticos mediante modelos de lenguaje.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Instructor: </strong>Ing. Cecilio Gaspar Cauich Tun</p>\r\n\r\n<p><strong>Lugar:</strong> Sala de Juntas 1</p>\r\n\r\n<p><strong>N&uacute;mero m&aacute;ximo de participantes: </strong>30</p>\r\n\r\n<p><strong>Turno: </strong>Vespertino</p>\r\n\r\n<p><span style=\"font-size:22px\"><strong>Temario</strong></span><br />\r\n<strong>Introducci&oacute;n al Web Scraping con .NET</strong><br />\r\n- Introducci&oacute;n al Web Scraping con Selenium.<br />\r\n- Web Scraping de sitio web.</p>\r\n\r\n<p><br />\r\n<strong>Conectando Web Scraping con IA</strong></p>\r\n\r\n<ul>\r\n	<li>Introducci&oacute;n a Prompt Engineering.</li>\r\n	<li>Transmisi&oacute;n de datos de Web Scraping a IA.</li>\r\n	<li>Recepci&oacute;n de datos procesados y generaci&oacute;n de reporte.</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Automatizando procesos con Agentes Aut&oacute;nomos</strong></p>\r\n\r\n<ul>\r\n	<li>Introducci&oacute;n a Worker Services de Windows.</li>\r\n	<li>Creaci&oacute;n de agente.</li>\r\n	<li>Creaci&oacute;n de proceso para envi&oacute; del reporte por correo.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Requisitos:</strong></p>\r\n\r\n<p><strong><em>Microsoft Visual Studio 2022: https://visualstudio.microsoft.com/downloads/</em></strong></p>\r\n\r\n<p><strong><em>Entorno de ejecuci&oacute;n de .NET : https://dotnet.microsoft.com/es-es/download/dotnet/8.0</em></strong></p>', '2025-11-14 13:41:19.650439', 4, 42);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_tallerinscripcion`
--

DROP TABLE IF EXISTS `base_tallerinscripcion`;
CREATE TABLE IF NOT EXISTS `base_tallerinscripcion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `congreso_id` bigint NOT NULL,
  `taller_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `performance_level_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_tallerinscripcion_taller_id_user_id_c057d0f5_uniq` (`taller_id`,`user_id`),
  KEY `base_tallerinscripcion_user_id_99209a63_fk_auth_user_id` (`user_id`),
  KEY `base_tallerinscripci_performance_level_id_a38a0a22_fk_base_perf` (`performance_level_id`),
  KEY `base_taller_congres_321127_idx` (`congreso_id`,`taller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_usercongresomembership`
--

DROP TABLE IF EXISTS `base_usercongresomembership`;
CREATE TABLE IF NOT EXISTS `base_usercongresomembership` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `decided_at` datetime(6) DEFAULT NULL,
  `congreso_id` bigint NOT NULL,
  `decided_by_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `performance_level_id` bigint DEFAULT NULL,
  `email_normalized` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_usercongresomembers_user_id_congreso_id_role_a7f9c27b_uniq` (`user_id`,`congreso_id`,`role`),
  UNIQUE KEY `uniq_membership_congreso_emailnorm` (`congreso_id`,`email_normalized`),
  KEY `base_userco_congres_db9174_idx` (`congreso_id`,`status`),
  KEY `base_usercongresomem_decided_by_id_ade5b16a_fk_auth_user` (`decided_by_id`),
  KEY `base_usercongresomembership_status_be1b4790` (`status`),
  KEY `base_usercongresomem_performance_level_id_540df8ae_fk_base_perf` (`performance_level_id`),
  KEY `base_usercongresomembership_email_normalized_fa0c5842` (`email_normalized`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `base_usercongresomembership`
--

INSERT INTO `base_usercongresomembership` (`id`, `role`, `status`, `created_at`, `decided_at`, `congreso_id`, `decided_by_id`, `user_id`, `performance_level_id`, `email_normalized`) VALUES
(6, 'instructor', 'approved', '2025-11-04 16:21:54.505179', '2025-11-07 05:32:25.993862', 4, 2, 20, NULL, 'genny.cm@valladolid.tecnm.mx'),
(25, 'instructor', 'approved', '2025-11-18 08:03:50.447102', '2025-11-18 08:03:50.445597', 4, 2, 34, NULL, 'eduardo.cupul@valladolid.tecnm.mx'),
(26, 'instructor', 'approved', '2025-11-18 08:05:10.754481', '2025-11-18 08:05:10.753369', 4, 2, 35, NULL, 'anibal.caballero@valladolid.tecnm.mx'),
(27, 'instructor', 'approved', '2025-11-18 08:06:17.114973', '2025-11-18 08:06:17.112400', 4, 2, 36, NULL, 'leonardo.maldonado@valladolid.tecnm.mx'),
(28, 'instructor', 'approved', '2025-11-18 08:08:28.958800', '2025-11-18 08:08:28.956783', 4, 2, 37, NULL, 'carlos.morin@valladolid.tecnm.mx'),
(29, 'instructor', 'approved', '2025-11-18 08:11:43.654193', '2025-11-18 08:11:43.652154', 4, 2, 38, NULL, 'rafael.reyes@valladolid.tecnm.mx'),
(30, 'instructor', 'approved', '2025-11-18 08:13:17.000420', '2025-11-18 08:13:16.998340', 4, 2, 39, NULL, 'miguel.cupul@valladolid.tecnm.mx'),
(31, 'instructor', 'approved', '2025-11-18 08:14:31.287748', '2025-11-18 08:14:31.286729', 4, 2, 40, NULL, 'fernando.pech@valladolid.tecnm.mx'),
(32, 'instructor', 'approved', '2025-11-18 08:17:15.018456', '2025-11-18 08:17:15.016425', 4, 2, 41, NULL, 'edgar.poot@valladolid.tecnm.mx'),
(33, 'instructor', 'approved', '2025-11-18 08:22:19.789871', '2025-11-18 08:22:19.788578', 4, 2, 42, NULL, 'cecilio.cauich@valladolid.tecnm.mx');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_userextrafieldvalue`
--

DROP TABLE IF EXISTS `base_userextrafieldvalue`;
CREATE TABLE IF NOT EXISTS `base_userextrafieldvalue` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `congreso_id` bigint DEFAULT NULL,
  `field_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_userextrafieldvalue_user_id_congreso_id_fiel_1ef8d4ce_uniq` (`user_id`,`congreso_id`,`field_id`),
  KEY `base_userextrafieldv_congreso_id_e4e0d2f1_fk_base_cong` (`congreso_id`),
  KEY `base_userextrafieldvalue_field_id_e5a38ff9_fk_base_extrafield_id` (`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-10-20 20:18:30.588271', '1', 'Instructores', 1, '[{\"added\": {}}]', 3, 2),
(2, '2025-10-20 20:18:37.659661', '2', 'Participantes', 1, '[{\"added\": {}}]', 3, 2),
(3, '2025-10-20 20:19:23.519812', '1', 'Instructores', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 2),
(4, '2025-10-20 20:19:42.996005', '1', 'Instructores', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 2),
(5, '2025-10-21 00:51:26.161322', '3', 'jorge996650@gmail.com', 3, '', 4, 2),
(6, '2025-10-21 02:49:19.351290', '4', 'jorge@gmail.com', 3, '', 4, 2),
(7, '2025-10-21 02:49:30.519314', '8', 'jorge1@gmail.com', 3, '', 4, 2),
(8, '2025-10-21 02:49:36.331861', '9', 'jorge2@gmail.com', 3, '', 4, 2),
(9, '2025-10-21 02:59:39.724653', '10', 'jorge@gmail.com', 3, '', 4, 2),
(10, '2025-10-21 05:27:22.031703', '3', 'administrador', 1, '[{\"added\": {}}]', 3, 2),
(11, '2025-10-21 05:27:38.071080', '2', 'Jorge', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 2),
(12, '2025-10-21 05:59:05.715387', '3', 'Administrador', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 3, 2),
(13, '2025-10-22 09:14:43.511821', '2', 'Jorge', 2, '[{\"changed\": {\"fields\": [\"First name\"]}}]', 4, 2),
(14, '2025-10-28 03:52:23.676203', '4', 'Administradores_Congresos', 1, '[{\"added\": {}}]', 3, 2),
(15, '2025-11-02 21:12:03.656159', '13', 'Eduardo', 3, '', 4, 2),
(16, '2025-11-02 21:12:28.064822', '14', 'jorge965500@gmail.com', 3, '', 4, 2),
(17, '2025-11-02 21:12:32.850477', '11', 'jorge996650@gmail.com', 3, '', 4, 2),
(18, '2025-11-02 21:49:48.669546', '16', 'l21070039@valladolid.tecnm.mx', 3, '', 4, 2),
(19, '2025-11-02 22:13:27.010160', '17', 'l21070039@valladolid.tecnm.mx', 3, '', 4, 2),
(20, '2025-11-03 08:26:41.010495', '18', 'l21070063@valladolid.tecnm.mx', 3, '', 4, 2),
(21, '2025-11-08 21:09:06.823936', '19', 'jorge965500@gmail.com', 3, '', 4, 2),
(22, '2025-11-11 07:41:01.497770', '15', 'jorge996650@gmail.com', 3, '', 4, 2),
(23, '2025-11-14 08:26:24.075980', '24', 'jorge996650@gmail.com', 3, '', 4, 2),
(24, '2025-11-14 08:39:20.923396', '25', 'jorge996650@gmail.com', 3, '', 4, 2),
(25, '2025-11-17 19:16:03.242755', '26', 'jorge996650@gmail.com', 3, '', 4, 2),
(26, '2025-11-17 21:00:25.795706', '22', 'Juan', 3, '', 4, 2),
(27, '2025-11-18 06:03:40.210015', '30', 'part_demo_2', 3, '', 4, 2),
(28, '2025-11-18 06:03:44.146191', '31', 'part_demo_3', 3, '', 4, 2),
(29, '2025-11-18 06:03:51.535664', '29', 'part.demo1@gmail.com', 3, '', 4, 2),
(30, '2025-11-18 06:03:56.389322', '33', 'part_demo_5', 3, '', 4, 2),
(31, '2025-11-18 06:04:00.369485', '32', 'part_demo_4', 3, '', 4, 2),
(32, '2025-11-18 06:04:15.985768', '28', 'jorge965500@gmail.com', 3, '', 4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(8, 'base', 'allowedemaildomain'),
(18, 'base', 'aviso'),
(14, 'base', 'concurso'),
(22, 'base', 'concursoequipo'),
(23, 'base', 'concursoequipomiembro'),
(16, 'base', 'concursoinscripcion'),
(12, 'base', 'conferencia'),
(17, 'base', 'conferenciainscripcion'),
(9, 'base', 'congreso'),
(21, 'base', 'congresoadminscope'),
(20, 'base', 'extrafield'),
(7, 'base', 'passwordresetcode'),
(10, 'base', 'performancelevel'),
(13, 'base', 'taller'),
(15, 'base', 'tallerinscripcion'),
(11, 'base', 'usercongresomembership'),
(19, 'base', 'userextrafieldvalue'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-10-20 20:07:47.372859'),
(2, 'auth', '0001_initial', '2025-10-20 20:07:47.723477'),
(3, 'admin', '0001_initial', '2025-10-20 20:07:47.817175'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-10-20 20:07:47.824228'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-10-20 20:07:47.843083'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-10-20 20:07:47.913211'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-10-20 20:07:47.954994'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-10-20 20:07:47.979269'),
(9, 'auth', '0004_alter_user_username_opts', '2025-10-20 20:07:47.986845'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-10-20 20:07:48.032543'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-10-20 20:07:48.035621'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-10-20 20:07:48.043989'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-10-20 20:07:48.107366'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-10-20 20:07:48.158676'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-10-20 20:07:48.179479'),
(16, 'auth', '0011_update_proxy_permissions', '2025-10-20 20:07:48.187480'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-10-20 20:07:48.240024'),
(18, 'sessions', '0001_initial', '2025-10-20 20:07:48.278232'),
(19, 'base', '0001_initial', '2025-10-28 06:20:37.792547'),
(20, 'base', '0002_congreso_allowedemaildomain', '2025-10-28 10:10:11.069176'),
(21, 'base', '0003_performancelevel', '2025-10-28 11:04:34.331384'),
(22, 'base', '0004_alter_performancelevel_options_and_more', '2025-10-28 11:14:52.686262'),
(23, 'base', '0005_congreso_logo', '2025-10-28 11:37:02.915178'),
(24, 'base', '0006_congreso_admin_user', '2025-10-28 12:45:48.658087'),
(25, 'base', '0007_congreso_description', '2025-11-01 08:49:34.338534'),
(26, 'base', '0008_usercongresomembership', '2025-11-02 09:07:18.873519'),
(27, 'base', '0009_rename_base_userco_congres_efca7e_idx_base_userco_congres_db9174_idx', '2025-11-02 09:07:18.892221'),
(28, 'base', '0010_congreso_access_password_hash_and_more', '2025-11-02 09:28:16.585489'),
(29, 'base', '0011_usercongresomembership_email_normalized_and_more', '2025-11-02 21:55:55.800464'),
(30, 'base', '0012_conferencia_taller', '2025-11-03 03:03:10.856812'),
(31, 'base', '0013_concurso', '2025-11-03 09:25:03.527353'),
(32, 'base', '0014_enrollments', '2025-11-03 10:52:41.889052'),
(33, 'base', '0015_aviso', '2025-11-03 11:48:55.898768'),
(34, 'base', '0016_extra_fields', '2025-11-06 23:02:47.935553'),
(35, 'base', '0017_extrafield_rolesection', '2025-11-06 23:39:24.242948'),
(36, 'base', '0016_congreso_admin_scope', '2025-11-07 06:13:00.809471'),
(37, 'base', '0018_merge_20251107_0010', '2025-11-07 06:13:00.811552'),
(38, 'base', '0019_remove_congresoadminscope_uniq_scope_user_congreso_and_more', '2025-11-09 01:13:22.536425'),
(39, 'base', '0020_set_utf8mb4_unicode_ci', '2025-11-11 17:48:01.367182'),
(40, 'base', '0021_concursoequipo_concursoequipomiembro', '2025-11-14 02:38:25.650238'),
(41, 'base', '0022_extrafield_unique_value', '2025-11-14 12:29:25.383368'),
(42, 'base', '0023_alter_concurso_title_alter_conferencia_title_and_more', '2025-11-14 13:32:32.088976');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0e4e94lvxgn8qlor507f0sbdy1uqc31j', '.eJxVjkEOwiAURO_StSFQPrS4dO8ZyAc-bdVAAtSN8e62pgvdzrx5mVdncW2zXSsVu4Tu3PWyO_2GDv2d0t6EG6YpM59TK4tjO8KOtrJrDvS4HOyfYMY6b2vgUnIZtYygCXtBDsLAMZpgDIcA44hKBAfekBqU4n0EobQgrz24Ac0mXVJtZfUtF4u-LU-y25epUM3f6_D-ADxYRKg:1vJdBo:ev9q45o6jfNPthNx5lLkb_aLRw8ZZ90dEcuIR3qhaBU', '2025-11-27 19:41:04.235603'),
('a7z02v1gffneotgusbxm0jiblyzh0s99', '.eJxVjLEOAiEQRP-F2hAgCy6W9n4DAXaRUwPJcVcZ_9275Aptppj3Zt4ixHWpYR08h4nERWgjTr9livnJbSf0iO3eZe5tmackd0UedMhbJ35dD_fvoMZRtzWjcmAyq3IukAxw8aDcFuQzJga2pBE8a2c9o1eWEvtsAF0pgJTF5wsOTzhm:1vHVaO:htm2QW1nikWGukHBZ_M3Cimw-KWDtPL8Sp_YV-q0bJo', '2025-11-21 23:09:40.855924'),
('phc49nybowi6s3616lsvyoz93857dgel', '.eJxVjkEOwiAURO_StSFQPrS4dO8ZyAc-bdVAAtSN8e62pgvdzrx5mVdncW2zXSsVu4Tu3PWyO_2GDv2d0t6EG6YpM59TK4tjO8KOtrJrDvS4HOyfYMY6b2vgUnIZtYygCXtBDsLAMZpgDIcA44hKBAfekBqU4n0EobQgrz24Ac0mXVJtZfUtF4u-LU-y25epUM3f6_D-ADxYRKg:1vHtmQ:o3-k28o5w7CWnFk_ySoxCIlkeOkql5tmkJqcbV-n6JY', '2025-11-23 00:59:42.213000'),
('qf61joa2subx4yfeauvp8pnde8xn04au', '.eJxVjM0OwiAQhN-FsyEsEGQ9evcZyC4_UjWQlPZkfHfbpAed43zfzFsEWpca1pHnMCVxEVqcfjum-MxtB-lB7d5l7G2ZJ5a7Ig865K2n_Loe7t9BpVG3NYCOqAkZIWLGxGzUFkCLtjjgosgb8FY5TZmYVIxk4eyNcbkUVcTnC897N7Q:1vHv9B:lfvFlS0BHmLGWnCD9hbTg30QGQ0auLUmTenoeRssB2w', '2025-11-23 02:27:17.043075'),
('ybbzs42cmtpunpr42p7x96ypu2lnfaxp', '.eJxVjM0OwiAQhN-FsyEsEGQ9evcZyC4_UjWQlPZkfHfbpAed43zfzFsEWpca1pHnMCVxEVqcfjum-MxtB-lB7d5l7G2ZJ5a7Ig865K2n_Loe7t9BpVG3NYCOqAkZIWLGxGzUFkCLtjjgosgb8FY5TZmYVIxk4eyNcbkUVcTnC897N7Q:1vLGk3:KzBvXRX8IMZOsQlB7lj-RvDpQnv1hUYZXogXCoxmJcY', '2025-12-02 08:07:11.923373');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `base_allowedemaildomain`
--
ALTER TABLE `base_allowedemaildomain`
  ADD CONSTRAINT `base_allowedemaildomain_congreso_id_6faaf65b_fk_base_congreso_id` FOREIGN KEY (`congreso_id`) REFERENCES `base_congreso` (`id`);

--
-- Filtros para la tabla `base_aviso`
--
ALTER TABLE `base_aviso`
  ADD CONSTRAINT `base_aviso_congreso_id_7751196a_fk_base_congreso_id` FOREIGN KEY (`congreso_id`) REFERENCES `base_congreso` (`id`);

--
-- Filtros para la tabla `base_concurso`
--
ALTER TABLE `base_concurso`
  ADD CONSTRAINT `base_concurso_congreso_id_ee0a8f60_fk_base_congreso_id` FOREIGN KEY (`congreso_id`) REFERENCES `base_congreso` (`id`),
  ADD CONSTRAINT `base_concurso_instructor_id_79b33649_fk_auth_user_id` FOREIGN KEY (`instructor_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `base_concursoequipo`
--
ALTER TABLE `base_concursoequipo`
  ADD CONSTRAINT `base_concursoequipo_concurso_id_90341416_fk_base_concurso_id` FOREIGN KEY (`concurso_id`) REFERENCES `base_concurso` (`id`),
  ADD CONSTRAINT `base_concursoequipo_congreso_id_392beb52_fk_base_congreso_id` FOREIGN KEY (`congreso_id`) REFERENCES `base_congreso` (`id`),
  ADD CONSTRAINT `base_concursoequipo_lider_id_0ed7b2d1_fk_auth_user_id` FOREIGN KEY (`lider_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `base_concursoequipomiembro`
--
ALTER TABLE `base_concursoequipomiembro`
  ADD CONSTRAINT `base_concursoequipom_equipo_id_49795b62_fk_base_conc` FOREIGN KEY (`equipo_id`) REFERENCES `base_concursoequipo` (`id`),
  ADD CONSTRAINT `base_concursoequipomiembro_user_id_a1a75372_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `base_concursoinscripcion`
--
ALTER TABLE `base_concursoinscripcion`
  ADD CONSTRAINT `base_concursoinscrip_concurso_id_20d48d5f_fk_base_conc` FOREIGN KEY (`concurso_id`) REFERENCES `base_concurso` (`id`),
  ADD CONSTRAINT `base_concursoinscrip_congreso_id_e73f45a7_fk_base_cong` FOREIGN KEY (`congreso_id`) REFERENCES `base_congreso` (`id`),
  ADD CONSTRAINT `base_concursoinscrip_performance_level_id_9032d265_fk_base_perf` FOREIGN KEY (`performance_level_id`) REFERENCES `base_performancelevel` (`id`),
  ADD CONSTRAINT `base_concursoinscripcion_user_id_eb49172f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `base_conferencia`
--
ALTER TABLE `base_conferencia`
  ADD CONSTRAINT `base_conferencia_congreso_id_cb7ede91_fk_base_congreso_id` FOREIGN KEY (`congreso_id`) REFERENCES `base_congreso` (`id`),
  ADD CONSTRAINT `base_conferencia_instructor_id_b5f86250_fk_auth_user_id` FOREIGN KEY (`instructor_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `base_conferenciainscripcion`
--
ALTER TABLE `base_conferenciainscripcion`
  ADD CONSTRAINT `base_conferenciainsc_conferencia_id_d52f0fed_fk_base_conf` FOREIGN KEY (`conferencia_id`) REFERENCES `base_conferencia` (`id`),
  ADD CONSTRAINT `base_conferenciainsc_congreso_id_91bb570c_fk_base_cong` FOREIGN KEY (`congreso_id`) REFERENCES `base_congreso` (`id`),
  ADD CONSTRAINT `base_conferenciainsc_performance_level_id_24c68bba_fk_base_perf` FOREIGN KEY (`performance_level_id`) REFERENCES `base_performancelevel` (`id`),
  ADD CONSTRAINT `base_conferenciainscripcion_user_id_5aa4156c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `base_congreso`
--
ALTER TABLE `base_congreso`
  ADD CONSTRAINT `base_congreso_admin_user_id_a7b1fbf9_fk_auth_user_id` FOREIGN KEY (`admin_user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `base_congresoadminscope`
--
ALTER TABLE `base_congresoadminscope`
  ADD CONSTRAINT `base_congresoadminscope_congreso_id_3f99f02b_fk_base_congreso_id` FOREIGN KEY (`congreso_id`) REFERENCES `base_congreso` (`id`),
  ADD CONSTRAINT `base_congresoadminscope_user_id_694930f2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `base_extrafield`
--
ALTER TABLE `base_extrafield`
  ADD CONSTRAINT `base_extrafield_congreso_id_747f2f36_fk_base_congreso_id` FOREIGN KEY (`congreso_id`) REFERENCES `base_congreso` (`id`);

--
-- Filtros para la tabla `base_passwordresetcode`
--
ALTER TABLE `base_passwordresetcode`
  ADD CONSTRAINT `base_passwordresetcode_user_id_c53f92b9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `base_performancelevel`
--
ALTER TABLE `base_performancelevel`
  ADD CONSTRAINT `base_performancelevel_congreso_id_754081ca_fk_base_congreso_id` FOREIGN KEY (`congreso_id`) REFERENCES `base_congreso` (`id`);

--
-- Filtros para la tabla `base_taller`
--
ALTER TABLE `base_taller`
  ADD CONSTRAINT `base_taller_congreso_id_6e0db479_fk_base_congreso_id` FOREIGN KEY (`congreso_id`) REFERENCES `base_congreso` (`id`),
  ADD CONSTRAINT `base_taller_instructor_id_9fcb18ac_fk_auth_user_id` FOREIGN KEY (`instructor_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `base_tallerinscripcion`
--
ALTER TABLE `base_tallerinscripcion`
  ADD CONSTRAINT `base_tallerinscripci_performance_level_id_a38a0a22_fk_base_perf` FOREIGN KEY (`performance_level_id`) REFERENCES `base_performancelevel` (`id`),
  ADD CONSTRAINT `base_tallerinscripcion_congreso_id_9d629ec2_fk_base_congreso_id` FOREIGN KEY (`congreso_id`) REFERENCES `base_congreso` (`id`),
  ADD CONSTRAINT `base_tallerinscripcion_taller_id_06efeae9_fk_base_taller_id` FOREIGN KEY (`taller_id`) REFERENCES `base_taller` (`id`),
  ADD CONSTRAINT `base_tallerinscripcion_user_id_99209a63_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `base_usercongresomembership`
--
ALTER TABLE `base_usercongresomembership`
  ADD CONSTRAINT `base_usercongresomem_congreso_id_16275d6e_fk_base_cong` FOREIGN KEY (`congreso_id`) REFERENCES `base_congreso` (`id`),
  ADD CONSTRAINT `base_usercongresomem_decided_by_id_ade5b16a_fk_auth_user` FOREIGN KEY (`decided_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `base_usercongresomem_performance_level_id_540df8ae_fk_base_perf` FOREIGN KEY (`performance_level_id`) REFERENCES `base_performancelevel` (`id`),
  ADD CONSTRAINT `base_usercongresomembership_user_id_c7e2b57c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `base_userextrafieldvalue`
--
ALTER TABLE `base_userextrafieldvalue`
  ADD CONSTRAINT `base_userextrafieldv_congreso_id_e4e0d2f1_fk_base_cong` FOREIGN KEY (`congreso_id`) REFERENCES `base_congreso` (`id`),
  ADD CONSTRAINT `base_userextrafieldvalue_field_id_e5a38ff9_fk_base_extrafield_id` FOREIGN KEY (`field_id`) REFERENCES `base_extrafield` (`id`),
  ADD CONSTRAINT `base_userextrafieldvalue_user_id_5e1d4bcf_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
