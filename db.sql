-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2013 at 01:55 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `safari`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_trail`
--

CREATE TABLE IF NOT EXISTS `audit_trail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `old_value` text NOT NULL,
  `new_value` text NOT NULL,
  `action` varchar(20) NOT NULL,
  `model` varchar(255) NOT NULL,
  `field` varchar(64) NOT NULL,
  `created` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `model_id` varchar(65) NOT NULL,
  `audit_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_model_id` (`model_id`),
  KEY `idx_model` (`model`),
  KEY `idx_field` (`field`),
  KEY `idx_action` (`action`),
  KEY `page_trail_id` (`audit_id`),
  KEY `created` (`created`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `audit_trail`
--

INSERT INTO `audit_trail` (`id`, `old_value`, `new_value`, `action`, `model`, `field`, `created`, `user_id`, `model_id`, `audit_id`) VALUES
(1, '2013-12-25 23:29:34', 'NOW()', 'UPDATE', 'User', 'updated', '2013-12-25 13:01:03', 1, '1', 0),
(2, '', '$2a$08$vt.bVY8gGijXzMZ.UYNCOu7ds/aM7Z0FxRdls93J.hyoI1BYDoqjq', 'UPDATE', 'User', 'password', '2013-12-25 13:05:07', 1, '1', 0),
(3, '2013-12-25 23:31:03', 'NOW()', 'UPDATE', 'User', 'updated', '2013-12-25 13:05:07', 1, '1', 0),
(4, '', '2013-12-25 13:17:03', 'UPDATE', 'Menu', 'deleted', '2013-12-25 13:17:03', 1, '24', 0),
(5, '', '2013-12-25 13:17:43', 'UPDATE', 'Menu', 'deleted', '2013-12-25 13:17:43', 1, '294', 0),
(6, '', '2013-12-25 13:17:57', 'UPDATE', 'Menu', 'deleted', '2013-12-25 13:17:57', 1, '289', 0),
(7, '', '2013-12-25 13:19:50', 'UPDATE', 'Menu', 'deleted', '2013-12-25 13:19:50', 1, '2', 0),
(8, '$2a$08$vt.bVY8gGijXzMZ.UYNCOu7ds/aM7Z0Fx', '$2a$08$BJY3BEqk4qQiXBbpRVAJ5uDSFlnccT9n1qKrkZCh4YziIZZdqodtC', 'UPDATE', 'User', 'password', '2013-12-25 13:25:49', 1, '1', 0),
(9, '2013-12-25 23:35:07', 'NOW()', 'UPDATE', 'User', 'updated', '2013-12-25 13:25:49', 1, '1', 0),
(10, '$2a$08$BJY3BEqk4qQiXBbpRVAJ5uDSFlnccT9n1', '$2a$08$ZAYqrab6TFNiVTx2fx50eu.vBGEPLcnxEvXkCYc8m7r5qhoQLiO.u', 'UPDATE', 'User', 'password', '2013-12-25 13:36:07', 1, '1', 0),
(11, '2013-12-25 23:55:49', 'NOW()', 'UPDATE', 'User', 'updated', '2013-12-25 13:36:07', 1, '1', 0),
(12, '$2a$08$ZAYqrab6TFNiVTx2fx50eu.vBGEPLcnxE', '$2a$08$RMFCzaO.BetBzlYdR88MCOHEHCdbvwPBfN.qZliwIovh1gzsxwcMi', 'UPDATE', 'User', 'password', '2013-12-25 13:36:47', 1, '1', 0),
(13, '2013-12-26 00:06:07', 'NOW()', 'UPDATE', 'User', 'updated', '2013-12-25 13:36:47', 1, '1', 0),
(14, '$2a$08$RMFCzaO.BetBzlYdR88MCOHEHCdbvwPBf', 'c4fa7d0a0d62a7e4aed1f9bbfdb555f39d74', 'UPDATE', 'User', 'password', '2013-12-25 14:26:18', 1, '1', 0),
(15, '2013-12-26 00:06:47', 'NOW()', 'UPDATE', 'User', 'updated', '2013-12-25 14:26:18', 1, '1', 0),
(16, 'c4fa7d0a0d62a7e4aed1f9bbfdb555f39d74', '2b7ba3f748c961989234f7a626afa17bfd98', 'UPDATE', 'User', 'password', '2013-12-25 14:26:27', 1, '1', 0),
(17, '2013-12-26 00:56:18', 'NOW()', 'UPDATE', 'User', 'updated', '2013-12-25 14:26:27', 1, '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `model_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `created` datetime DEFAULT NULL,
  `audit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `model` (`model`,`model_id`),
  KEY `created` (`created`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4494 ;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `ip`, `user_id`, `model`, `model_id`, `message`, `details`, `created`, `audit_id`) VALUES
(4473, '127.0.0.1', 0, 'UserIdentity', 1, 'authenticate', 'a:2:{s:8:"username";s:12:"zainengineer";s:9:"errorCode";i:1;}', '2013-12-25 12:13:04', NULL),
(4474, '127.0.0.1', 0, 'UserIdentity', 0, 'authenticate', 'a:2:{s:8:"username";s:4:"zain";s:9:"errorCode";i:0;}', '2013-12-25 12:25:06', NULL),
(4475, '127.0.0.1', 0, 'UserIdentity', 0, 'authenticate', 'a:2:{s:8:"username";s:4:"zain";s:9:"errorCode";i:0;}', '2013-12-25 12:25:07', NULL),
(4476, '127.0.0.1', 0, 'UserIdentity', 2, 'authenticate', 'a:2:{s:8:"username";s:4:"zain";s:9:"errorCode";i:2;}', '2013-12-25 13:23:00', NULL),
(4477, '127.0.0.1', 0, 'UserIdentity', 2, 'authenticate', 'a:2:{s:8:"username";s:4:"zain";s:9:"errorCode";i:2;}', '2013-12-25 13:23:09', NULL),
(4478, '127.0.0.1', 0, 'UserIdentity', 0, 'authenticate', 'a:2:{s:8:"username";s:4:"zain";s:9:"errorCode";i:0;}', '2013-12-25 13:23:47', NULL),
(4479, '127.0.0.1', 0, 'UserIdentity', 0, 'authenticate', 'a:2:{s:8:"username";s:4:"zain";s:9:"errorCode";i:0;}', '2013-12-25 13:23:47', NULL),
(4480, '127.0.0.1', 0, 'UserIdentity', 0, 'authenticate', 'a:2:{s:8:"username";s:4:"zain";s:9:"errorCode";i:0;}', '2013-12-25 13:30:44', NULL),
(4481, '127.0.0.1', 0, 'UserIdentity', 0, 'authenticate', 'a:2:{s:8:"username";s:4:"zain";s:9:"errorCode";i:0;}', '2013-12-25 13:30:44', NULL),
(4482, '127.0.0.1', 0, 'UserIdentity', 2, 'authenticate', 'a:2:{s:8:"username";s:4:"zain";s:9:"errorCode";i:2;}', '2013-12-25 13:32:04', NULL),
(4483, '127.0.0.1', 0, 'UserIdentity', 2, 'authenticate', 'a:2:{s:8:"username";s:4:"zain";s:9:"errorCode";i:2;}', '2013-12-25 13:32:13', NULL),
(4484, '127.0.0.1', 0, 'UserIdentity', 0, 'authenticate', 'a:2:{s:8:"username";s:4:"zain";s:9:"errorCode";i:0;}', '2013-12-25 13:32:23', NULL),
(4485, '127.0.0.1', 0, 'UserIdentity', 0, 'authenticate', 'a:2:{s:8:"username";s:4:"zain";s:9:"errorCode";i:0;}', '2013-12-25 13:32:23', NULL),
(4486, '127.0.0.1', 0, 'UserIdentity', 0, 'authenticate', 'a:2:{s:8:"username";s:4:"zain";s:9:"errorCode";i:0;}', '2013-12-25 14:24:49', NULL),
(4487, '127.0.0.1', 0, 'UserIdentity', 0, 'authenticate', 'a:2:{s:8:"username";s:4:"zain";s:9:"errorCode";i:0;}', '2013-12-25 14:24:49', NULL),
(4488, '127.0.0.1', 0, 'UserIdentity', 0, 'authenticate', 'a:2:{s:8:"username";s:4:"zain";s:9:"errorCode";i:0;}', '2013-12-25 14:26:57', NULL),
(4489, '127.0.0.1', 0, 'UserIdentity', 0, 'authenticate', 'a:2:{s:8:"username";s:4:"zain";s:9:"errorCode";i:0;}', '2013-12-25 14:26:57', NULL),
(4490, '127.0.0.1', 0, 'UserIdentity', 2, 'authenticate', 'a:2:{s:8:"username";s:4:"zain";s:9:"errorCode";i:2;}', '2013-12-25 14:27:32', NULL),
(4491, '127.0.0.1', 0, 'UserIdentity', 2, 'authenticate', 'a:2:{s:8:"username";s:4:"zain";s:9:"errorCode";i:2;}', '2013-12-25 14:27:39', NULL),
(4492, '127.0.0.1', 0, 'UserIdentity', 0, 'authenticate', 'a:2:{s:8:"username";s:4:"zain";s:9:"errorCode";i:0;}', '2013-12-25 14:27:45', NULL),
(4493, '127.0.0.1', 0, 'UserIdentity', 0, 'authenticate', 'a:2:{s:8:"username";s:4:"zain";s:9:"errorCode";i:0;}', '2013-12-25 14:27:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `url_params` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `access_role` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  `enabled` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu_item_menu_item1` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=320 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `parent_id`, `label`, `icon`, `url`, `url_params`, `target`, `access_role`, `sort_order`, `enabled`, `created`, `deleted`) VALUES
(1, 0, 'System', '', '', '', '', NULL, 0, 0, '2013-08-14 06:28:34', NULL),
(3, 0, 'User', '', '', '', '', NULL, 0, 0, '2013-08-14 06:28:34', NULL),
(4, 0, 'Help', '', '', '', '', NULL, 0, 0, '2013-08-14 06:28:34', NULL),
(5, 301, 'Logs', '', '/log/index', '', '', 'admin', 5, 1, '2013-08-14 06:28:34', NULL),
(6, 303, 'Users', '', '/user/index', '', '', 'admin', 5, 1, '2013-08-14 06:28:34', NULL),
(7, 300, 'Clear Cache', '', '/tool/clearCache', 'returnUrl={returnUrl}', '', 'admin', 0, 1, '2013-08-14 06:28:34', NULL),
(8, 300, 'Generate Properties', '', '/tool/generateProperties', '', '', 'admin', 15, 1, '2013-08-14 06:28:34', NULL),
(9, 1, 'Lookups', '', '/lookup/index', '', '', 'admin', 11, 1, '2013-08-14 06:28:34', NULL),
(10, 302, 'Email Templates', '', '/emailTemplate/index', '', '', 'admin', 9, 1, '2013-08-14 06:28:34', NULL),
(11, 301, 'Audit Trails', '', '/auditTrail/index', '', '', 'admin', 4, 1, '2013-08-14 06:28:34', NULL),
(12, 301, 'Audits', '', '/audit/index', '', '', 'admin', 3, 1, '2013-08-14 06:28:34', NULL),
(13, 301, 'Email Spool', '', '/emailSpool/index', '', '', 'admin', 6, 1, '2013-08-14 06:28:34', NULL),
(14, 302, 'Settings', '', '/setting/index', '', '', 'admin', 2, 1, '2013-08-14 06:28:34', NULL),
(15, 302, 'Menus', '', '/menu/index', '', '', 'admin', 10, 1, '2013-08-14 06:28:34', NULL),
(16, 300, 'Clear Asset', '', '/tool/clearAsset', 'returnUrl={returnUrl}', '', 'admin', 1, 1, '2013-08-14 06:28:34', NULL),
(17, 3, 'Account', '', '/account/index', '', '', '@', 3, 1, '2013-08-14 06:28:34', NULL),
(18, 3, 'Update', '', '/account/update', '', '', '@', 4, 1, '2013-08-14 06:28:34', NULL),
(19, 3, 'Password', '', '/account/password', '', '', '@', 5, 1, '2013-08-14 06:28:34', NULL),
(20, 3, 'Logout', '', '/account/logout', '', '', '@', 10, 1, '2013-08-14 06:28:34', NULL),
(21, 3, 'Login', '', '/account/login', '', '', '?', 0, 1, '2013-08-14 06:28:34', NULL),
(23, 3, 'Lost Password', '', '/account/recover', '', '', '?', 1, 1, '2013-08-14 06:28:34', NULL),
(25, 4, 'Help', '', '/site/page', 'view=help', '', NULL, 0, 1, '2013-08-14 06:28:34', NULL),
(275, 1, 'Attachments', '', '/attachment/index', '', '', 'admin', 8, 1, '2013-08-14 06:28:34', NULL),
(276, 1, 'Notes', '', '/note/index', '', '', 'admin', 12, 1, '2013-08-14 06:28:34', NULL),
(277, 300, 'Generate Code', '', '/gii', '', '', 'admin', 14, 1, '2013-08-14 06:28:34', NULL),
(278, 301, 'Errors', '', '/error/index', '', '', 'admin', 7, 1, '2013-08-14 06:28:34', NULL),
(299, 3, 'Admin Tools', '', '/tool/index', '', '', 'admin', 9, 1, '2013-08-21 00:14:04', NULL),
(300, 0, 'Tool', '', '', '', '', 'admin', 0, 0, '2013-08-21 00:14:04', NULL),
(301, 0, 'Log', '', '', '', '', 'admin', 0, 0, '2013-08-21 00:14:04', NULL),
(302, 0, 'Setting', '', '', '', '', 'admin', 0, 0, '2013-08-21 00:14:04', NULL),
(303, 0, 'Admin', '', '', '', '', NULL, 1, 1, '2013-08-21 10:08:36', NULL),
(305, 303, 'Roles', '', '/role/index', '', '', 'admin', 6, 1, '2013-08-21 17:37:53', NULL),
(310, 301, 'Contact Us', '', '/ContactUs/index', '', '', 'admin', 0, 1, '2013-09-12 06:43:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `model_cache`
--

CREATE TABLE IF NOT EXISTS `model_cache` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `model` varchar(255) NOT NULL,
  `model_id` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `cache` longtext NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `model_name` (`model`),
  KEY `model_value` (`key`),
  KEY `created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2008-03-17 12:37:08', '2013-08-19 11:03:29');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `country_state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `terms` tinyint(1) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `password_reset_code` varchar(40) DEFAULT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `remember_token_expires_at` datetime DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `activated_at` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT 'passive',
  `deleted` datetime DEFAULT NULL,
  `subscribed` tinyint(1) DEFAULT '0',
  `timezone` varchar(255) DEFAULT NULL,
  `web_status` int(11) DEFAULT NULL,
  `api_key` varchar(255) DEFAULT NULL,
  `api_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `name`, `company`, `job`, `phone`, `mobile`, `mailing_address`, `country_state`, `country`, `terms`, `password`, `password_reset_code`, `salt`, `created`, `updated`, `remember_token`, `remember_token_expires_at`, `activation_code`, `activated_at`, `state`, `deleted`, `subscribed`, `timezone`, `web_status`, `api_key`, `api_status`) VALUES
(1, 'zain', 'zainengineer@gmail.com', 'Zain', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2b7ba3f748c961989234f7a626afa17bfd98', NULL, NULL, NULL, '2013-12-26 00:56:27', NULL, NULL, NULL, NULL, 'passive', NULL, 0, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_eav`
--

CREATE TABLE IF NOT EXISTS `user_eav` (
  `entity` int(11) unsigned NOT NULL,
  `attribute` varchar(64) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`entity`,`attribute`),
  KEY `value` (`value`(32)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_to_role`
--

CREATE TABLE IF NOT EXISTS `user_to_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_role` (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `user_to_role`
--

INSERT INTO `user_to_role` (`id`, `user_id`, `role_id`) VALUES
(8, 1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
