-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 20, 2022 at 12:48 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
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
(25, 'Can add customers detials model', 7, 'add_customersdetialsmodel'),
(26, 'Can change customers detials model', 7, 'change_customersdetialsmodel'),
(27, 'Can delete customers detials model', 7, 'delete_customersdetialsmodel'),
(28, 'Can view customers detials model', 7, 'view_customersdetialsmodel'),
(29, 'Can add menu detials model', 8, 'add_menudetialsmodel'),
(30, 'Can change menu detials model', 8, 'change_menudetialsmodel'),
(31, 'Can delete menu detials model', 8, 'delete_menudetialsmodel'),
(32, 'Can view menu detials model', 8, 'view_menudetialsmodel'),
(33, 'Can add customer feed back model', 9, 'add_customerfeedbackmodel'),
(34, 'Can change customer feed back model', 9, 'change_customerfeedbackmodel'),
(35, 'Can delete customer feed back model', 9, 'delete_customerfeedbackmodel'),
(36, 'Can view customer feed back model', 9, 'view_customerfeedbackmodel'),
(37, 'Can add customer my booking', 10, 'add_customermybooking'),
(38, 'Can change customer my booking', 10, 'change_customermybooking'),
(39, 'Can delete customer my booking', 10, 'delete_customermybooking'),
(40, 'Can view customer my booking', 10, 'view_customermybooking');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customers_details`
--

DROP TABLE IF EXISTS `customers_details`;
CREATE TABLE IF NOT EXISTS `customers_details` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `customer_ph_number` bigint(20) NOT NULL,
  `customer_password` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers_details`
--

INSERT INTO `customers_details` (`customer_id`, `customer_name`, `customer_ph_number`, `customer_password`) VALUES
(12, 'rajesh', 9980983568, 'Rajesh123'),
(11, 'manikanta', 7013752377, 'Mani@123'),
(6, 'haritha', 9980983568, NULL),
(7, 'haritha', 9980983568, NULL),
(8, 'krishna', 1234567890, NULL),
(9, 'vanitha', 2343423333, NULL),
(10, 'krishna', 9491906288, 'Kanna123');

-- --------------------------------------------------------

--
-- Table structure for table `customer_booking`
--

DROP TABLE IF EXISTS `customer_booking`;
CREATE TABLE IF NOT EXISTS `customer_booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_date` date DEFAULT NULL,
  `menu_details_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `customer_booking_booking_creator_id_409220e8` (`menu_details_id`),
  KEY `customer_booking_customer_id_622c38ea` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_booking`
--

INSERT INTO `customer_booking` (`booking_id`, `booking_date`, `menu_details_id`, `customer_id`, `status`) VALUES
(11, '2022-10-08', 46, 2, 'reject'),
(2, '2022-10-04', 49, 2, 'reject'),
(3, '2022-10-04', 44, 2, 'Accept'),
(4, '2022-10-04', 44, 2, 'Accept'),
(5, '2022-10-04', 44, 2, 'reject'),
(6, '2022-10-04', 49, 2, 'Accept'),
(34, '2022-10-20', 83, 12, 'Accept'),
(8, '2022-10-04', 48, 2, 'Accept'),
(9, '2022-10-08', 42, 2, 'Accept'),
(36, '2022-10-20', 43, 12, 'Accept'),
(12, '2022-10-08', 44, 2, 'Accept'),
(13, '2022-10-08', 45, 2, 'Accept'),
(14, '2022-10-08', 44, 1, 'Accept'),
(35, '2022-10-20', 49, 12, 'Accept'),
(33, '2022-10-20', 82, 12, 'Accept'),
(32, '2022-10-20', 82, 12, 'Accept'),
(18, '2022-10-17', 49, 10, 'reject'),
(19, '2022-10-17', 44, 10, 'Accept'),
(20, '2022-10-17', 48, 11, 'Accept'),
(21, '2022-10-17', 43, 11, 'Accept'),
(22, '2022-10-17', 49, 11, 'Accept'),
(23, '2022-10-17', 42, 12, 'Accept'),
(24, '2022-10-17', 45, 10, 'Accept'),
(25, '2022-10-18', 36, 10, 'Accept'),
(26, '2022-10-18', 43, 10, 'Accept'),
(31, '2022-10-20', 63, 12, 'Accept'),
(28, '2022-10-19', 50, 12, 'Accept'),
(30, '2022-10-20', 49, 10, 'Accept'),
(37, '2022-10-20', 42, 12, 'Accept'),
(38, '2022-10-20', 43, 10, 'Pending'),
(39, '2022-10-20', 44, 10, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `customer_feedback_details`
--

DROP TABLE IF EXISTS `customer_feedback_details`;
CREATE TABLE IF NOT EXISTS `customer_feedback_details` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `taste_feedback` int(11) DEFAULT NULL,
  `price_feedback` int(11) DEFAULT NULL,
  `service_feedback` int(11) DEFAULT NULL,
  `overview` varchar(100) DEFAULT NULL,
  `sentiment` varchar(100) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `customer_feedback_details_customer_id_6541986c` (`customer_id`),
  KEY `customer_feedback_details_item_id_0bacf0d0` (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_feedback_details`
--

INSERT INTO `customer_feedback_details` (`feedback_id`, `taste_feedback`, `price_feedback`, `service_feedback`, `overview`, `sentiment`, `customer_id`, `item_id`) VALUES
(10, 5, 5, 5, 'very happy', 'Very Positive', 11, 20),
(13, 3, 3, 1, 'average taste', 'Negative', 10, 24),
(14, 2, 2, 2, 'very good taste', 'Very Positive', 10, 25),
(12, 4, 3, 3, 'not good service bad', 'Very Negative', 12, 23),
(7, 1, 1, 1, 'very bad taste', 'Very Negative', 11, 20),
(11, 3, 3, 4, 'not bad okey', 'Positive', 11, 21),
(15, 4, 4, 4, 'satisfied', 'Very Positive', 10, 26),
(16, 3, 3, 4, 'okey', 'Neutral', 10, 26),
(28, 1, 1, 1, 'bad taste', 'Very Negative', 12, 37),
(27, 3, 3, 4, 'good taste', 'Very Positive', 12, 36),
(26, 1, 1, 1, 'bad taste', 'Very Negative', 12, 33),
(25, 3, 4, 4, 'nice food', 'Very Positive', 12, 35);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'customerapp', 'customersdetialsmodel'),
(8, 'restaurantapp', 'menudetialsmodel'),
(9, 'customerapp', 'customerfeedbackmodel'),
(10, 'customerapp', 'customermybooking');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-09-28 06:50:51.065575'),
(2, 'auth', '0001_initial', '2022-09-28 06:50:53.120518'),
(3, 'admin', '0001_initial', '2022-09-28 06:50:53.583505'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-09-28 06:50:53.621505'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-09-28 06:50:53.656502'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-09-28 06:50:53.876497'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-09-28 06:50:53.987497'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-09-28 06:50:54.069491'),
(9, 'auth', '0004_alter_user_username_opts', '2022-09-28 06:50:54.091493'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-09-28 06:50:54.186488'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-09-28 06:50:54.193489'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-09-28 06:50:54.216488'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-09-28 06:50:54.311486'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-09-28 06:50:54.414486'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-09-28 06:50:54.527508'),
(16, 'auth', '0011_update_proxy_permissions', '2022-09-28 06:50:54.544481'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-09-28 06:50:54.635515'),
(18, 'sessions', '0001_initial', '2022-09-28 06:50:54.779475'),
(19, 'customerapp', '0001_initial', '2022-09-28 06:51:05.384215'),
(20, 'restaurantapp', '0001_initial', '2022-09-28 06:51:15.658963'),
(21, 'customerapp', '0002_alter_customersdetialsmodel_customer_ph_number', '2022-09-28 07:02:25.115373'),
(22, 'customerapp', '0003_alter_customersdetialsmodel_customer_ph_number', '2022-09-28 07:03:26.258879'),
(23, 'restaurantapp', '0002_alter_menudetialsmodel_item_offer_zone', '2022-09-28 07:21:53.924400'),
(24, 'restaurantapp', '0003_alter_menudetialsmodel_item_image', '2022-09-29 09:53:06.401059'),
(25, 'customerapp', '0004_customerfeedbackmodel', '2022-09-30 10:00:43.757623'),
(26, 'customerapp', '0005_alter_customersdetialsmodel_customer_ph_number', '2022-09-30 12:29:26.181763'),
(27, 'customerapp', '0006_customerfeedbackmodel_customer', '2022-10-01 07:01:40.848772'),
(28, 'restaurantapp', '0004_menudetialsmodel_item_type', '2022-10-01 11:47:38.080616'),
(29, 'customerapp', '0007_customermybooking', '2022-10-04 06:05:57.105919'),
(30, 'customerapp', '0008_alter_customermybooking_booking_date', '2022-10-04 06:28:50.818896'),
(31, 'customerapp', '0009_rename_booking_creator_customermybooking_menu_details_and_more', '2022-10-04 12:23:24.749971'),
(32, 'customerapp', '0010_alter_customermybooking_booking_date', '2022-10-04 13:12:32.444770'),
(33, 'customerapp', '0011_customermybooking_status', '2022-10-04 13:53:37.379095'),
(34, 'customerapp', '0012_remove_customersdetialsmodel_custome_password_and_more', '2022-10-17 05:45:09.956867'),
(35, 'customerapp', '0013_customerfeedbackmodel_item', '2022-10-17 10:07:54.139965');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('wurfntqm4ybjfp0sibx2ozy2f3my7pf4', 'eyJjdXN0b21lcl9pZCI6Mn0:1odRqT:RnAvg97TPpIjgV7PyvIC3m4wh9KXY_9tGfR-0rPmmr8', '2022-10-12 07:51:05.427327'),
('0djanan7pr7cjhmsbtou7lzdu2xfww97', 'eyJjdXN0b21lcl9pZCI6Mn0:1odnKY:MtMHyA-weF323mQOdpVs28HkJh1msA8qX83yvlYCmGs', '2022-10-13 06:47:34.099357'),
('wx3qijvl11hzshgmyo14x87w60az5yn8', 'eyJjdXN0b21lcl9pZCI6Mn0:1oebbc:aNjv67O1gQO_wNwrUiO03UwKTqW3E5fV69qg9KgkD5o', '2022-10-15 12:28:32.524076'),
('sib5jphaiq3ro29023s6857o6q6skuz2', 'eyJjdXN0b21lcl9pZCI6MTB9:1olUnj:TDdS9FxqBzrEFNsKiFgBCX5XE-t-xUOq5xDYLsSEzwk', '2022-11-03 12:37:31.717834'),
('kqpp6v7rnqxo584os8vvpgmlljyhnad2', 'eyJjdXN0b21lcl9pZCI6MTJ9:1olQLG:uPhKmQCl9jPhvZR1aZgfs2Ov9lYb-Rrm9yYOPStdaNk', '2022-11-03 07:51:50.793699');

-- --------------------------------------------------------

--
-- Table structure for table `menu_details`
--

DROP TABLE IF EXISTS `menu_details`;
CREATE TABLE IF NOT EXISTS `menu_details` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL,
  `item_price` int(11) NOT NULL,
  `item_offer_zone` varchar(100) NOT NULL,
  `item_description` longtext NOT NULL,
  `item_image` varchar(100) DEFAULT NULL,
  `item_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_details`
--

INSERT INTO `menu_details` (`item_id`, `item_name`, `item_price`, `item_offer_zone`, `item_description`, `item_image`, `item_type`) VALUES
(49, 'shak', 10, '10%', 'Breakfast', 'images/milkshake_mdl7sVo.jpg', 'Dinner'),
(83, 'hyd biryani', 450, '20%', 'spicy', 'images/about-4_RM7MVKG.jpg', 'Launch'),
(46, 'Lemon Rice', 180, '10%', 'tangy & rich', 'images/tigerrice.jpg', 'Dinner'),
(36, 'meals', 350, '30%', 'sdfsa', 'images/chiken_biryani_mpreYFP.jpg', 'Launch'),
(50, 'Hyderabad special biryani', 500, '20%', 'family pack', 'images/menu-5.jpg', 'Dinner'),
(42, 'Mashed potatoes.', 850, '20%', 'Sauces are sweet, sour, bitter, tangy, rich, or fruity.', 'images/potato.jpg', 'Launch'),
(43, 'Indian Dosa', 120, '10%', 'Vegetables can range between fresh, earthy, and zesty.\r\n', 'images/dosa.jpg', 'Breakfast'),
(44, 'Palal vada', 100, '10%', ' sweet, sour, bitter', 'images/vada.jpg', 'Breakfast'),
(45, 'Sabudana Vada', 150, '20%', 'tangy, rich, or fruity.', 'images/vada1.jpg', 'Breakfast'),
(48, 'Panner Rice', 280, '20%', 'tangy, rich, or fruity.', 'images/panner_1.jpg', 'Dinner'),
(51, 'Grill Chicken', 350, '60%', 'hot', 'images/bg-hero_q6GLyq4.jpg', 'Launch'),
(81, 'butter naun', 350, '40%', 'sdfsdf', 'images/bun_tbls3AL.jpg', 'Dinner'),
(63, 'sambar edly', 350, '20%', 'dfd', 'images/chiken_biryani_HUQTthF.jpg', 'Breakfast'),
(80, 'chiken biryani', 230, '30%', 'ddd', 'images/dosa_gSgIsOx.jpg', 'Breakfast'),
(82, 'butter naun', 350, '40%', 'sdfsdf', 'images/bun_yRqKBvO.jpg', 'Dinner');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
