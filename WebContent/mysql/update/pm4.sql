/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50087
Source Host           : 127.0.0.1:3306
Source Database       : pm

Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001

Date: 2017-05-25 00:35:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL auto_increment,
  `guid` varchar(36) default NULL,
  `name` varchar(10) default NULL,
  `password` varchar(15) default NULL,
  `isdelete` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'febac0ca-263f-11e7-b607-3c1cd7e5f41a', 'xiaxuan', '67', null);
INSERT INTO `admin` VALUES ('2', '7869734f-2ce9-11e7-9861-c5a6f0c1f589', 'liwei', '2', null);

-- ----------------------------
-- Table structure for dorm
-- ----------------------------
DROP TABLE IF EXISTS `dorm`;
CREATE TABLE `dorm` (
  `guid` varchar(36) default NULL,
  `id` varchar(15) NOT NULL,
  `building` char(1) default NULL,
  `num_id` int(11) default NULL,
  `name` varchar(15) default NULL,
  `phone` varchar(15) default NULL,
  `remain_power` double default NULL,
  `isdelete` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dorm
-- ----------------------------
INSERT INTO `dorm` VALUES ('7f02d5b0-2bd9-11e7-9861-c5a6f0c1f589', 'A102', 'A', '102', 'Yu', '12923344332', '0', null);
INSERT INTO `dorm` VALUES ('fee3e9be-263f-11e7-b607-3c1cd7e5f41a', 'A311', 'A', '311', 'Lin', '13423455533', '0', null);
INSERT INTO `dorm` VALUES ('fee3ecc7-263f-11e7-b607-3c1cd7e5f41a', 'B322', 'B', '322', 'Jack', '15323347853', '1.1', null);
INSERT INTO `dorm` VALUES ('1d11d2bf-2d81-11e7-9861-c5a6f0c1f589', 'B404', 'B', '404', 'Alex', '21923433299', '0', null);

-- ----------------------------
-- Table structure for meter_reader
-- ----------------------------
DROP TABLE IF EXISTS `meter_reader`;
CREATE TABLE `meter_reader` (
  `id` int(11) NOT NULL auto_increment,
  `guid` varchar(36) default NULL,
  `name` varchar(10) default NULL,
  `password` varchar(15) default NULL,
  `phone` varchar(15) default NULL,
  `isdelete` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meter_reader
-- ----------------------------
INSERT INTO `meter_reader` VALUES ('1', 'ff088043-263f-11e7-b607-3c1cd7e5f41a', 'CXX', '32', '15113991911', null);
INSERT INTO `meter_reader` VALUES ('2', '2ab5f249-2ceb-11e7-9861-c5a6f0c1f589', 'LLW', '2345', '15222322233', null);

-- ----------------------------
-- Table structure for meter_reading_problem
-- ----------------------------
DROP TABLE IF EXISTS `meter_reading_problem`;
CREATE TABLE `meter_reading_problem` (
  `id` int(11) NOT NULL auto_increment,
  `guid` varchar(36) default NULL,
  `dorm_id` varchar(15) default NULL,
  `mreader_id` int(11) default NULL,
  `mread_month` varchar(12) default NULL,
  `problem` varchar(50) default NULL,
  `isdelete` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `dorm_id` (`dorm_id`),
  KEY `mreader_id` (`mreader_id`),
  CONSTRAINT `meter_reading_problem_ibfk_1` FOREIGN KEY (`dorm_id`) REFERENCES `dorm` (`id`),
  CONSTRAINT `meter_reading_problem_ibfk_2` FOREIGN KEY (`mreader_id`) REFERENCES `meter_reader` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meter_reading_problem
-- ----------------------------

-- ----------------------------
-- Table structure for meter_reading_result
-- ----------------------------
DROP TABLE IF EXISTS `meter_reading_result`;
CREATE TABLE `meter_reading_result` (
  `id` int(11) NOT NULL auto_increment,
  `guid` varchar(36) default NULL,
  `dorm_id` varchar(15) default NULL,
  `mreader_id` int(11) default NULL,
  `mread_month` varchar(12) default NULL,
  `power_read` double(11,2) default NULL,
  `is_exception` tinyint(1) default '0',
  `isdelete` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `dorm_id` (`dorm_id`),
  KEY `mreader_id` (`mreader_id`),
  CONSTRAINT `meter_reading_result_ibfk_1` FOREIGN KEY (`dorm_id`) REFERENCES `dorm` (`id`),
  CONSTRAINT `meter_reading_result_ibfk_2` FOREIGN KEY (`mreader_id`) REFERENCES `meter_reader` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meter_reading_result
-- ----------------------------
INSERT INTO `meter_reading_result` VALUES ('9', 'cfbd6839-345b-11e7-936a-b213472e0ebf', 'A311', '1', '2016-12', '10.33', '0', null);
INSERT INTO `meter_reading_result` VALUES ('10', 'ddf2bb75-345b-11e7-936a-b213472e0ebf', 'A311', '1', '2017-1', '20.42', '0', null);
INSERT INTO `meter_reading_result` VALUES ('11', 'f55ebc88-345b-11e7-936a-b213472e0ebf', 'B322', '1', '2017-1', '21.57', '0', null);
INSERT INTO `meter_reading_result` VALUES ('12', 'fb1c05fa-345b-11e7-936a-b213472e0ebf', 'A102', '1', '2017-1', '22.99', '0', null);
INSERT INTO `meter_reading_result` VALUES ('13', '18502f0e-345c-11e7-936a-b213472e0ebf', 'B404', '2', '2017-1', '24.10', '0', null);
INSERT INTO `meter_reading_result` VALUES ('14', '1fc13e34-345c-11e7-936a-b213472e0ebf', 'B322', '2', '2016-12', '20.09', '0', null);

-- ----------------------------
-- Table structure for meter_reading_task
-- ----------------------------
DROP TABLE IF EXISTS `meter_reading_task`;
CREATE TABLE `meter_reading_task` (
  `id` int(11) NOT NULL auto_increment,
  `guid` varchar(36) default NULL,
  `dorm_id` varchar(15) default NULL,
  `mread_month` varchar(12) default NULL,
  `mreader_id` int(11) default NULL,
  `is_read` tinyint(1) default '0',
  `isdelete` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `dorm_id` (`dorm_id`),
  KEY `mreader_id` (`mreader_id`),
  CONSTRAINT `meter_reading_task_ibfk_1` FOREIGN KEY (`dorm_id`) REFERENCES `dorm` (`id`),
  CONSTRAINT `meter_reading_task_ibfk_2` FOREIGN KEY (`mreader_id`) REFERENCES `meter_reader` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meter_reading_task
-- ----------------------------
INSERT INTO `meter_reading_task` VALUES ('1', '638467af-288a-11e7-b607-3c1cd7e5f41a', 'A311', '2017-1', '1', '1', null);
INSERT INTO `meter_reading_task` VALUES ('2', '82186cb5-2b13-11e7-9861-c5a6f0c1f589', 'B322', '2017-1', '1', '1', null);
INSERT INTO `meter_reading_task` VALUES ('3', '8cc2272d-2bd9-11e7-9861-c5a6f0c1f589', 'A102', '2017-1', '1', '1', null);
INSERT INTO `meter_reading_task` VALUES ('4', '2b28fb0b-2d81-11e7-9861-c5a6f0c1f589', 'B404', '2017-1', '2', '1', null);
INSERT INTO `meter_reading_task` VALUES ('5', 'f51cfde6-340b-11e7-936a-b213472e0ebf', 'A311', '2016-12', '1', '1', null);
INSERT INTO `meter_reading_task` VALUES ('6', 'bc6647c7-3411-11e7-936a-b213472e0ebf', 'B322', '2016-12', '2', '1', null);

-- ----------------------------
-- Table structure for power_toll
-- ----------------------------
DROP TABLE IF EXISTS `power_toll`;
CREATE TABLE `power_toll` (
  `id` int(11) NOT NULL auto_increment,
  `guid` varchar(36) default NULL,
  `dorm_id` varchar(15) default NULL,
  `pay_date` varchar(12) default NULL,
  `actual_pay` double default NULL,
  `power_state` tinyint(1) default '0',
  `isdelete` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `dorm_id` (`dorm_id`),
  CONSTRAINT `power_toll_ibfk_1` FOREIGN KEY (`dorm_id`) REFERENCES `dorm` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of power_toll
-- ----------------------------

-- ----------------------------
-- Table structure for power_used
-- ----------------------------
DROP TABLE IF EXISTS `power_used`;
CREATE TABLE `power_used` (
  `id` int(11) NOT NULL auto_increment,
  `guid` varchar(36) default NULL,
  `dorm_id` varchar(15) default NULL,
  `mread_month` varchar(12) default NULL,
  `last_power_read` double default NULL,
  `this_power_read` double default NULL,
  `power_use` double default NULL,
  `isdelete` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `dorm_id` (`dorm_id`),
  CONSTRAINT `power_used_ibfk_1` FOREIGN KEY (`dorm_id`) REFERENCES `dorm` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of power_used
-- ----------------------------

-- ----------------------------
-- Table structure for traiff_param
-- ----------------------------
DROP TABLE IF EXISTS `traiff_param`;
CREATE TABLE `traiff_param` (
  `id` int(11) NOT NULL auto_increment,
  `guid` varchar(36) default NULL,
  `issue_month` varchar(12) default NULL,
  `unit_price` double default NULL,
  `basic_power` double default NULL,
  `isdelete` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of traiff_param
-- ----------------------------
INSERT INTO `traiff_param` VALUES ('1', '8ad5348c-3486-11e7-936a-b213472e0ebf', null, '1.5', '16', null);
