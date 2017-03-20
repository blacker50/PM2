/*
Navicat MySQL Data Transfer
Source Server         : 127.0.0.1_3306
Source Server Version : 50087
Source Host           : 127.0.0.1:3306
Source Database       : pm
Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001
Date: 2017-03-23 12:00:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(10) default NULL,
  `password` varchar(15) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('2', 'xiaxuan', '3');
INSERT INTO `admin` VALUES ('5', '8u8u8', '8');
INSERT INTO `admin` VALUES ('6', 'yyy', '66');
INSERT INTO `admin` VALUES ('7', 'yt60', '1');

-- ----------------------------
-- Table structure for dorm
-- ----------------------------
DROP TABLE IF EXISTS `dorm`;
CREATE TABLE `dorm` (
  `dormId` varchar(7) NOT NULL,
  `area` varchar(3) default NULL,
  `building` varchar(3) default NULL,
  `numberId` varchar(7) default NULL,
  `phone` varchar(15) default NULL,
  `balance` double default NULL,
  PRIMARY KEY  (`dormId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dorm
-- ----------------------------
INSERT INTO `dorm` VALUES ('AA101', 'A', 'A', '', '13423455533', '0');
INSERT INTO `dorm` VALUES ('BC211', 'B', 'C', '', '15323347853', '1.1');

-- ----------------------------
-- Table structure for meter_reader
-- ----------------------------
DROP TABLE IF EXISTS `meter_reader`;
CREATE TABLE `meter_reader` (
  `id` int(11) NOT NULL,
  `name` varchar(10) default NULL,
  `password` varchar(15) default NULL,
  `task_num` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meter_reader
-- ----------------------------
INSERT INTO `meter_reader` VALUES ('101', 'п║од', '1', '0');

-- ----------------------------
-- Table structure for meter_reading_problem
-- ----------------------------
DROP TABLE IF EXISTS `meter_reading_problem`;
CREATE TABLE `meter_reading_problem` (
  `error_id` int(11) NOT NULL,
  `dorm_id` varchar(7) default NULL,
  `mreader_id` int(11) default NULL,
  `problem` varchar(50) default NULL,
  PRIMARY KEY  (`error_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meter_reading_problem
-- ----------------------------

-- ----------------------------
-- Table structure for meter_reading_result
-- ----------------------------
DROP TABLE IF EXISTS `meter_reading_result`;
CREATE TABLE `meter_reading_result` (
  `result_id` int(11) NOT NULL,
  `dorm_id` varchar(7) default NULL,
  `last_read_date` date default NULL,
  `this_read_date` date default NULL,
  `is_exception` tinyint(1) default '0',
  `is_read` tinyint(1) default '0',
  `mreader_id` int(11) default NULL,
  PRIMARY KEY  (`result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meter_reading_result
-- ----------------------------

-- ----------------------------
-- Table structure for meter_reading_task
-- ----------------------------
DROP TABLE IF EXISTS `meter_reading_task`;
CREATE TABLE `meter_reading_task` (
  `task_id` int(11) NOT NULL,
  `dorm_id` varchar(7) default NULL,
  `mread_month` int(11) default NULL,
  `mreader_id` int(11) default NULL,
  PRIMARY KEY  (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meter_reading_task
-- ----------------------------

-- ----------------------------
-- Table structure for power_toll
-- ----------------------------
DROP TABLE IF EXISTS `power_toll`;
CREATE TABLE `power_toll` (
  `dorm_id` varchar(7) default NULL,
  `account_date` date default NULL,
  `pay_date` date default NULL,
  `should_pay` double default NULL,
  `actual_pay` double default NULL,
  `pay_state` tinyint(1) default '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of power_toll
-- ----------------------------

-- ----------------------------
-- Table structure for power_used
-- ----------------------------
DROP TABLE IF EXISTS `power_used`;
CREATE TABLE `power_used` (
  `dorm_id` varchar(7) default NULL,
  `mread_date` date default NULL,
  `basic_power` double default NULL,
  `power_read` double default NULL,
  `power_used` double default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of power_used
-- ----------------------------

-- ----------------------------
-- Table structure for traiff_param
-- ----------------------------
DROP TABLE IF EXISTS `traiff_param`;
CREATE TABLE `traiff_param` (
  `issue_date` date default NULL,
  `Unit_Price` double default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of traiff_param
-- ----------------------------