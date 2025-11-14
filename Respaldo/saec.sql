-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 14-11-2025 a las 19:45:20
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(2, 'pbkdf2_sha256$1000000$9qDquGFQXSHiZ4p5gKI4nN$GDZSq3Y9dUGBMJ9JWcrKy8wSpgRRpLxZ1FibDqB21ho=', '2025-11-14 12:32:57.377723', 1, 'Jorge', '', '', 'l21070039@valladolid.tecnm.mx', 1, 1, '2025-10-20 20:17:42.000000'),
(12, 'pbkdf2_sha256$1000000$hgFtbIucyyzkkhPVfr6deN$f9gd5JoptFXfLZJUoviZiVDnLJTOR7kMA5UroFAG43A=', '2025-11-07 23:35:14.967445', 0, 'Tadeo', 'Tadeo Solis Lopez Cardenaz', '', '', 0, 1, '2025-10-28 11:56:17.965639'),
(20, 'pbkdf2_sha256$1000000$DaZYBaKOh7qQBCklqiYbYy$ZibCLteLB5aQPHTjwQQZHZSeGH/1ya/IfTMTcKDN+sM=', '2025-11-04 16:22:35.530770', 0, 'genny.cm@valladolid.tecnm.mx', 'Yesenia', 'Cetina Marrufo', 'genny.cm@valladolid.tecnm.mx', 0, 1, '2025-11-04 16:21:48.675885'),
(21, 'pbkdf2_sha256$1000000$nahW5HYnqpi6NfatVhTH1I$EK/ctxzzoo1E44+MCbB37YlRWqZBS4ZNtucjbTvb9wg=', '2025-11-14 13:41:46.454792', 0, 'pootpereztadeoalonso2110@gmail.com', 'Juan', 'Ruiz Matier', 'pootpereztadeoalonso2110@gmail.com', 0, 1, '2025-11-07 04:03:52.319600'),
(22, 'pbkdf2_sha256$1000000$xQog7dL55bluzsUtIZnGKx$deyc9moFhA7UXxKB1b+vTuIc9u9wThpAuCWvnB27od8=', NULL, 0, 'Juan', 'Juan Escutia', '', '', 0, 1, '2025-11-07 23:20:32.710113'),
(23, 'pbkdf2_sha256$1000000$NSZw7YHJcoDAGYjjZEuU2l$EWQgYqIH7KzKcxElIqcGZxNI4+vcLix3/orptuExUw0=', '2025-11-14 12:04:32.557856', 0, 'jorge965500@gmail.com', 'Miguel Eduardo', 'Ruiz Matier', 'jorge965500@gmail.com', 0, 1, '2025-11-08 21:30:11.395270'),
(26, 'pbkdf2_sha256$1000000$mY5w2k1AlBMTalLv0C4aF9$mmDx+FkNq++DRFtnSyL8iUFq0zflb0pcbY1P6EB0bwk=', '2025-11-14 08:41:02.575843', 0, 'jorge996650@gmail.com', 'Ana Paula', 'Ruiz Nico', 'jorge996650@gmail.com', 0, 1, '2025-11-14 08:40:55.964439');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(5, 2, 3),
(6, 12, 4),
(15, 20, 1),
(17, 21, 2),
(18, 22, 4),
(19, 23, 1),
(22, 26, 2);

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
(1, '¡Buenos días estudiantes!', '2025-11-03 11:51:02.246692', 4),
(2, '¡Buenas tardes!!! El proceso de inscripciones para la jornada académica de sistemas 2022 será de la siguiente manera: • Se les envía a los jefes de grupo el manual de inscripción para que todos los alumnos se registren. • Es importante saber que, tendrán que usar su correo institucional y aunque se registren no podrán elegir su taller hasta que yo los active y eso será cuando pase a los grupos de manera personal y me entreguen la lista de los que ya pagaron completo y habilitarlos en orden en ese momento para que ellos puedan elegir su taller. • En el sistema están especificados que talleres se están ofertando y a que semestre están dirigidos, solo podrán seleccionar el taller que les corresponda de acuerdo a su semestre, en caso que seleccionen otro los eliminaré de la lista ya que se les explicó que en academia se determinaron cuales se tomarían.', '2025-11-03 11:51:59.408021', 4);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `base_taller`
--

INSERT INTO `base_taller` (`id`, `title`, `image`, `lugar`, `cupo_maximo`, `description`, `created_at`, `congreso_id`, `instructor_id`) VALUES
(2, 'Taller 1. Introducción a la Inteligencia Artificial  y Herramientas para desarrollo - Turno Matutino / Dirigido a 1er Semestre y 3er semestre', 'talleres/IA.avif', 'Edificio B', 35, '<p style=\"text-align:center\"><strong><em>Comprender los fundamentos de la Inteligencia Artificial (IA) y aprender a utilizar herramientas gratuitas que<br />\r\npotencien la productividad en el desarrollo de software.</em></strong></p>\r\n\r\n<hr />\r\n<p style=\"text-align:center\"><span style=\"font-size:24px\"><strong><em>Taller 1. Introducci&oacute;n a la Inteligencia Artificial &nbsp;y Herramientas para desarrollo - Turno Matutino / Dirigido a 1er Semestre y 3er semestre</em></strong></span></p>\r\n\r\n<hr />\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>Requisitos:</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong><span style=\"font-size:12px\"><em>Navegador Google Chrome con la &uacute;ltima versi&oacute;n.<br />\r\nVisual Studio Code 1.105.X o con la &uacute;ltima versi&oacute;n.<br />\r\nVisual Studio Community 2022 17.14.X o con la &uacute;ltima versi&oacute;n.<br />\r\nGit 2.51.X o con la &uacute;ltima versi&oacute;n.<br />\r\nNode Js LTS 24.11.X o con la &uacute;ltima versi&oacute;n<br />\r\nInternet m&iacute;nimo 5 Mbps.</em></span></strong></p>', '2025-11-14 12:49:49.801959', 4, NULL),
(3, 'Taller 2. Taller de Videojuegos - Turno Matutino / Dirigido a 1er Semestre y 3er semestre', 'talleres/imagen_2025-11-14_065808536.png', 'Edificio B', 35, '<p align=\"center\" style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Desarrollar las habilidades necesarias para dise&ntilde;ar, crear y publicar videojuegos interactivos mediante el uso de motores de desarrollo como Unity, integrando conceptos de programaci&oacute;n, arte digital, dise&ntilde;o de niveles y experiencia de usuario.</span></span></em></strong></span></span></span></p>\r\n\r\n<div style=\"text-align:center\">\r\n<hr /></div>\r\n\r\n<p align=\"center\" style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:18.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Taller 2. Taller de Videojuegos - Turno Matutino / Dirigido a 1er Semestre y 3er semestre</span></span></em></strong></span></span></span></p>\r\n\r\n<div style=\"text-align:center\">\r\n<hr /></div>\r\n\r\n<p align=\"center\" style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Requisitos:</span></span></strong></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:9.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Adobe illustrator<br />\r\nUnity<br />\r\nBlender</span></span></em></strong></span></span></span></p>', '2025-11-14 12:52:05.185603', 4, NULL),
(4, 'Taller 3. Aprendizaje de Programación con Inteligencia Artificial (Copilot como tutor) - Turno Matutino / Dirigido a 1er Semestre y 3er semestre', 'talleres/imagen_2025-11-14_065913220.png', 'Edificio B', 35, '<p align=\"center\" style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Sin objetivo.</span></span></em></strong></span></span></span></p>\r\n\r\n<div style=\"text-align:center\">\r\n<hr /></div>\r\n\r\n<p align=\"center\" style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:18.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Taller 3. Aprendizaje de Programaci&oacute;n con Inteligencia Artificial (Copilot como tutor) - Turno Matutino / Dirigido a 1er Semestre y 3er semestre</span></span></em></strong></span></span></span></p>\r\n\r\n<div style=\"text-align:center\">\r\n<hr /></div>\r\n\r\n<p align=\"center\" style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Requisitos:</span></span></strong></span></span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman, serif\"><span style=\"font-size:12px\"><strong><em>-</em></strong></span></span></p>', '2025-11-14 13:01:37.635032', 4, NULL),
(5, 'Taller 4. Aprendizaje de Programación con Inteligencia Artificial (Copilot como tutor) - Turno Vespertino / Dirigido a 1er Semestre y 3er semestre', 'talleres/imagen_2025-11-14_070407942.png', 'Edificio B', 35, '<p style=\"text-align:center\"><span style=\"font-family:Times New Roman,serif\"><span style=\"font-size:16px\"><strong><em>Sin objetivo.</em></strong></span></span></p>\r\n\r\n<div style=\"text-align:center\">\r\n<hr /></div>\r\n\r\n<p align=\"center\" style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:18.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Taller 4. Aprendizaje de Programaci&oacute;n con Inteligencia Artificial (Copilot como tutor) - Turno Vespertino / Dirigido a 1er Semestre y 3er semestre</span></span></em></strong></span></span></span></p>\r\n\r\n<div style=\"text-align:center\">\r\n<hr /></div>\r\n\r\n<p align=\"center\" style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Requisitos:</span></span></strong></span></span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,serif\"><span style=\"font-size:12px\"><strong><em>-</em></strong></span></span></p>', '2025-11-14 13:03:53.122702', 4, NULL),
(6, 'Taller 5. Máquinas que Piensan: de Turing a ChatGPT - Turno Matutino / Dirigido a 5to semestre, 7mo semestre y 9no semestre', 'talleres/imagen_2025-11-14_070853244.png', 'Edificio B', 35, '<p align=\"center\" style=\"text-align:center\"><span style=\"font-family:Times New Roman,serif\"><span style=\"font-size:16px\"><strong><em>Sin objetivo.</em></strong></span></span></p>\r\n\r\n<div style=\"text-align:center\">\r\n<hr /></div>\r\n\r\n<p align=\"center\" style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:18.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Taller 5. M&aacute;quinas que Piensan: de Turing a ChatGPT - Turno Matutino / Dirigido a 5to semestre, 7mo semestre y 9no semestre</span></span></em></strong></span></span></span></p>\r\n\r\n<div style=\"text-align:center\">\r\n<hr /></div>\r\n\r\n<p align=\"center\" style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Requisitos:</span></span></strong></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-family:Times New Roman,serif\"><span style=\"font-size:12px\"><strong><em>-</em></strong></span></span></p>', '2025-11-14 13:07:48.897120', 4, NULL),
(7, 'Taller 6. Máquinas que Piensan: de Turing a ChatGPT- Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre', 'talleres/imagen_2025-11-14_070906658.png', '', NULL, '<p align=\"center\" style=\"text-align:center\"><span style=\"font-family:Times New Roman, serif\"><span style=\"font-size:16px\"><strong><em>Sin objetivo.</em></strong></span></span></p>\r\n\r\n<div style=\"text-align:center\">\r\n<hr /></div>\r\n\r\n<p align=\"center\" style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:18.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Taller 6. M&aacute;quinas que Piensan: de Turing a ChatGPT- Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre</span></span></em></strong></span></span></span></p>\r\n\r\n<div style=\"text-align:center\">\r\n<hr /></div>\r\n\r\n<p align=\"center\" style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Requisitos:</span></span></strong></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-family:Times New Roman, serif\"><span style=\"font-size:12px\"><strong><em>-</em></strong></span></span></p>', '2025-11-14 13:11:33.379315', 4, NULL),
(8, 'Taller 7. Taller de ciencia de Datos y Aprendizaje Automático - Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre', 'talleres/imagen_2025-11-14_071533362.png', 'Edificio B', 35, '<p align=\"center\" style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Desarrollar en el estudiante las competencias necesarias para comprender, analizar y aplicar los fundamentos de la Ciencia de Datos y el Aprendizaje Autom&aacute;tico (Machine Learning), mediante el uso de herramientas computacionales de vanguardia, que permitan procesar, analizar y modelar informaci&oacute;n para la toma de decisiones en contextos reales.</span></span></em></strong></span></span></span></p>\r\n\r\n<div style=\"text-align:center\">\r\n<hr /></div>\r\n\r\n<p align=\"center\" style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:18.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Taller 7. Taller de ciencia de Datos y Aprendizaje Autom&aacute;tico - Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre</span></span></em></strong></span></span></span></p>\r\n\r\n<div style=\"text-align:center\">\r\n<hr /></div>\r\n\r\n<p align=\"center\" style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Requisitos:</span></span></strong></span></span></span></p>\r\n\r\n<p><strong><em><span style=\"font-size:9.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">▪ Lenguaje: Python 3.x<br />\r\n▪ Entorno: Jupyter Notebook (Anaconda)<br />\r\n▪ Librer&iacute;as: pandas, NumPy, scikit-learn, matplotlib, seaborn<br />\r\n▪ Fuentes de datos: INEGI, datos.gob.mx, Kaggle</span></span></span></em></strong></p>', '2025-11-14 13:14:52.351310', 4, NULL),
(9, 'Taller 8. Desarrollo de Asistentes de IA - Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre', 'talleres/imagen_2025-11-14_071753925.png', 'Edificio B', 35, '<p align=\"center\" style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Desarrollar una aplicaci&oacute;n web interactiva con Blazor que integre el modelo de lenguaje de IA, desplegada en contenedores mediante Docker, con el prop&oacute;sito de implementar un chat inteligente que asista a los estudiantes en sus actividades acad&eacute;micas, aplicando t&eacute;cnicas modernas de inteligencia artificial y procesamiento del lenguaje natural (NLP).</span></span></em></strong></span></span></span></p>\r\n\r\n<div style=\"text-align:center\">\r\n<hr /></div>\r\n\r\n<p align=\"center\" style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:18.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Taller 8. Desarrollo de Asistentes de IA - Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre</span></span></em></strong></span></span></span></p>\r\n\r\n<div style=\"text-align:center\">\r\n<hr /></div>\r\n\r\n<p align=\"center\" style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Requisitos:</span></span></strong></span></span></span></p>\r\n\r\n<p><strong><em><span style=\"font-size:9.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">1. .NET 9 SDK<br />\r\n2. Visual Studio 2022<br />\r\n3. Docker Desktop</span></span></span></em></strong></p>', '2025-11-14 13:19:38.328613', 4, NULL),
(10, 'Taller 9. Uso de Google Earth Engine e Inteligencia Artificial - Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre', 'talleres/imagen_2025-11-14_072416208.png', 'Edificio B', 35, '<p align=\"center\" style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Analizar el potencial y uso de t&eacute;cnicas y herramientas de inteligencia artificial y percepci&oacute;n remoto para la gesti&oacute;n de problemas de impacto medioambiental, la prevenci&oacute;n de desastres naturales y el monitoreo ambiental.</span></span></em></strong></span></span></span></p>\r\n\r\n<div style=\"text-align:center\">\r\n<hr /></div>\r\n\r\n<p align=\"center\" style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:18.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Taller 9. Uso de Google Earth Engine e Inteligencia Artificial - Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre</span></span></em></strong></span></span></span></p>\r\n\r\n<div style=\"text-align:center\">\r\n<hr /></div>\r\n\r\n<p align=\"center\" style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Requisitos:</span></span></strong></span></span></span></p>\r\n\r\n<p><strong><em><span style=\"font-size:9.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&bull; Conexi&oacute;n estable a Internet<br />\r\n&bull; Cuenta de Gmail<br />\r\n&bull; Cuenta de Google Earth Engine activa<br />\r\n&bull; IDE de python Jupyter Notebook</span></span></span></em></strong></p>', '2025-11-14 13:24:51.213313', 4, NULL),
(11, 'Taller 10. Desarrollo de aplicaciones empresariales. BACKEND con Python y MySQL. Rumbo al campo laboral de desarrollo de Software - Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre', 'talleres/imagen_2025-11-14_072748272_OKa2JMh.png', 'Edificio B', 40, '<p align=\"center\" style=\"text-align:center\"><span style=\"font-family:Times New Roman, serif\"><span style=\"font-size:16px\"><strong><em>Sin objetivo.</em></strong></span></span></p>\r\n\r\n<div style=\"text-align:center\">\r\n<hr /></div>\r\n\r\n<p align=\"center\" style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:18.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Taller 10. Desarrollo de aplicaciones empresariales. BACKEND con Python y MySQL. Rumbo al campo laboral de desarrollo de Software - Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre</span></span></em></strong></span></span></span></p>\r\n\r\n<div style=\"text-align:center\">\r\n<hr /></div>\r\n\r\n<p align=\"center\" style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Requisitos:</span></span></strong></span></span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman, serif\"><span style=\"font-size:12px\"><strong><em>-</em></strong></span></span></p>', '2025-11-14 13:32:59.346239', 4, NULL),
(12, 'Taller 11. Automatización Inteligente con .NET: De Web Scraping a Bots con IA - Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre', 'talleres/imagen_2025-11-14_074009898.png', 'Edificio B', 30, '<p align=\"center\" style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Que el alumno aprenda a desarrollar soluciones de automatizaci&oacute;n inteligentes combinando t&eacute;cnicas de Web Scraping, RPA e Inteligencia Artificial con tecnolog&iacute;as .NET. Al finalizar, ser&aacute; capaz de crear bots que extraen informaci&oacute;n de la web, la procesan y generan res&uacute;menes o reportes autom&aacute;ticos mediante modelos de lenguaje.</span></span></em></strong></span></span></span></p>\r\n\r\n<div style=\"text-align:center\">\r\n<hr /></div>\r\n\r\n<p align=\"center\" style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:18.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Taller 11. Automatizaci&oacute;n Inteligente con .NET: De Web Scraping a Bots con IA - Turno Vespertino / Dirigido a 5to semestre, 7mo semestre y 9no semestre</span></span></em></strong></span></span></span></p>\r\n\r\n<div style=\"text-align:center\">\r\n<hr /></div>\r\n\r\n<p align=\"center\" style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Requisitos:</span></span></strong></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:9.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Microsoft Visual Studio 2022: https://visualstudio.microsoft.com/downloads/</span></span></em></strong></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:9.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Entorno de ejecuci&oacute;n de .NET : https://dotnet.microsoft.com/es-es/download/dotnet/8.0</span></span></em></strong></span></span></span></p>', '2025-11-14 13:41:19.650439', 4, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `base_usercongresomembership`
--

INSERT INTO `base_usercongresomembership` (`id`, `role`, `status`, `created_at`, `decided_at`, `congreso_id`, `decided_by_id`, `user_id`, `performance_level_id`, `email_normalized`) VALUES
(6, 'instructor', 'approved', '2025-11-04 16:21:54.505179', '2025-11-07 05:32:25.993862', 4, 2, 20, NULL, 'genny.cm@valladolid.tecnm.mx'),
(8, 'participante', 'approved', '2025-11-07 04:03:53.041736', '2025-11-07 04:04:24.851060', 4, 2, 21, 10, 'pootpereztadeoalonso2110@gmail.com'),
(9, 'instructor', 'approved', '2025-11-08 21:30:12.029295', '2025-11-08 21:30:27.352388', 4, 2, 23, NULL, 'jorge965500@gmail.com'),
(12, 'participante', 'rejected', '2025-11-14 08:40:56.600394', '2025-11-14 12:33:06.671775', 4, 2, 26, 3, 'jorge996650@gmail.com');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `base_userextrafieldvalue`
--

INSERT INTO `base_userextrafieldvalue` (`id`, `value`, `created_at`, `congreso_id`, `field_id`, `user_id`) VALUES
(2, '21070039', '2025-11-07 04:03:53.044737', 4, 1, 21),
(6, '21070049', '2025-11-14 08:40:56.603394', 4, 1, 26);

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(24, '2025-11-14 08:39:20.923396', '25', 'jorge996650@gmail.com', 3, '', 4, 2);

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
('1gdz4g9424s4u6p2xnrnd9th6gnfbcvw', '.eJxVjssOwiAURP-FtSFcXoJL934D4XGxqIGmpW6M_25rutDtzJmTeRHnlz64ZcbJlUROhAM5_IbBxzvWrUk3X6-Nxlb7VALdELq3M720hI_zzv4JBj8P61pGLRMDpmwCGzIPVkHQyNBAVkYYVFFjYADZBpEhZ5BCq6O0hgvGs1-lo596iWX0tTsfe3miW89cJ5zb97t8fwB50US4:1vJu3e:EebhbO5scg5pYnQQk4UYxdqnAm4Cq6c3Yi3M7I5My-4', '2025-11-28 13:41:46.457833'),
('a7z02v1gffneotgusbxm0jiblyzh0s99', '.eJxVjLEOAiEQRP-F2hAgCy6W9n4DAXaRUwPJcVcZ_9275Aptppj3Zt4ixHWpYR08h4nERWgjTr9livnJbSf0iO3eZe5tmackd0UedMhbJ35dD_fvoMZRtzWjcmAyq3IukAxw8aDcFuQzJga2pBE8a2c9o1eWEvtsAF0pgJTF5wsOTzhm:1vHVaO:htm2QW1nikWGukHBZ_M3Cimw-KWDtPL8Sp_YV-q0bJo', '2025-11-21 23:09:40.855924'),
('phc49nybowi6s3616lsvyoz93857dgel', '.eJxVjkEOwiAURO_StSFQPrS4dO8ZyAc-bdVAAtSN8e62pgvdzrx5mVdncW2zXSsVu4Tu3PWyO_2GDv2d0t6EG6YpM59TK4tjO8KOtrJrDvS4HOyfYMY6b2vgUnIZtYygCXtBDsLAMZpgDIcA44hKBAfekBqU4n0EobQgrz24Ac0mXVJtZfUtF4u-LU-y25epUM3f6_D-ADxYRKg:1vHtmQ:o3-k28o5w7CWnFk_ySoxCIlkeOkql5tmkJqcbV-n6JY', '2025-11-23 00:59:42.213000'),
('qf61joa2subx4yfeauvp8pnde8xn04au', '.eJxVjM0OwiAQhN-FsyEsEGQ9evcZyC4_UjWQlPZkfHfbpAed43zfzFsEWpca1pHnMCVxEVqcfjum-MxtB-lB7d5l7G2ZJ5a7Ig865K2n_Loe7t9BpVG3NYCOqAkZIWLGxGzUFkCLtjjgosgb8FY5TZmYVIxk4eyNcbkUVcTnC897N7Q:1vHv9B:lfvFlS0BHmLGWnCD9hbTg30QGQ0auLUmTenoeRssB2w', '2025-11-23 02:27:17.043075');

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
