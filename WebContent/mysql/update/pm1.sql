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
  `id` int(11) NOT NULL auto_increment,
  `guid` varchar(36) default NULL,
  `name` varchar(10) default NULL,
  `password` varchar(15) default NULL,
  `isdelete` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '4ea30a40-08d3-11e7-82ca-71fea84e8cd3', 'xiaxuan', '3', null);
INSERT INTO `admin` VALUES ('2', '4eb18f3d-08d3-11e7-82ca-71fea84e8cd3', '8u8u8', '8', null);
INSERT INTO `admin` VALUES ('3', '4ec20c16-08d3-11e7-82ca-71fea84e8cd3', 'yyy', '66', null);
INSERT INTO `admin` VALUES ('4', '4ed0cc5f-08d3-11e7-82ca-71fea84e8cd3', 'yt60', '1', null);

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
  `balance` double default NULL,
  `isdelete` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dorm
-- ----------------------------
INSERT INTO `dorm` VALUES ('4ef63892-08d3-11e7-82ca-71fea84e8cd3', 'A311', 'A', '311', 'Lin', '13423455533', '0', null);
INSERT INTO `dorm` VALUES ('4ef63d14-08d3-11e7-82ca-71fea84e8cd3', 'B322', 'B', '322', 'Jack', '15323347853', '1.1', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meter_reader
-- ----------------------------
INSERT INTO `meter_reader` VALUES ('1', '4f1e4492-08d3-11e7-82ca-71fea84e8cd3', '小夏', '1', '15113991910', null);

-- ----------------------------
-- Table structure for meter_reading_problem
-- ----------------------------
DROP TABLE IF EXISTS `meter_reading_problem`;
CREATE TABLE `meter_reading_problem` (
  `id` int(11) NOT NULL auto_increment,
  `guid` varchar(36) default NULL,
  `dorm_id` varchar(15) default NULL,
  `mreader_id` int(11) default NULL,
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
  `last_read_date` date default NULL,
  `this_read_date` date default NULL,
  `is_exception` tinyint(1) default '0',
  `is_read` tinyint(1) default '0',
  `mreader_id` int(11) default NULL,
  `isdelete` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `dorm_id` (`dorm_id`),
  KEY `mreader_id` (`mreader_id`),
  CONSTRAINT `meter_reading_result_ibfk_1` FOREIGN KEY (`dorm_id`) REFERENCES `dorm` (`id`),
  CONSTRAINT `meter_reading_result_ibfk_2` FOREIGN KEY (`mreader_id`) REFERENCES `meter_reader` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meter_reading_result
-- ----------------------------

-- ----------------------------
-- Table structure for meter_reading_task
-- ----------------------------
DROP TABLE IF EXISTS `meter_reading_task`;
CREATE TABLE `meter_reading_task` (
  `id` int(11) NOT NULL auto_increment,
  `guid` varchar(36) default NULL,
  `dorm_id` varchar(15) default NULL,
  `mread_month` date default NULL,
  `mreader_id` int(11) default NULL,
  `isdelete` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `dorm_id` (`dorm_id`),
  KEY `mreader_id` (`mreader_id`),
  CONSTRAINT `meter_reading_task_ibfk_1` FOREIGN KEY (`dorm_id`) REFERENCES `dorm` (`id`),
  CONSTRAINT `meter_reading_task_ibfk_2` FOREIGN KEY (`mreader_id`) REFERENCES `meter_reader` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meter_reading_task
-- ----------------------------

-- ----------------------------
-- Table structure for power_toll
-- ----------------------------
DROP TABLE IF EXISTS `power_toll`;
CREATE TABLE `power_toll` (
  `id` int(11) NOT NULL auto_increment,
  `guid` varchar(36) default NULL,
  `dorm_id` varchar(15) default NULL,
  `account_date` date default NULL,
  `pay_date` date default NULL,
  `should_pay` double default NULL,
  `actual_pay` double default NULL,
  `pay_state` tinyint(1) default '0',
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
  `mread_date` date default NULL,
  `basic_power` double default NULL,
  `power_read` double default NULL,
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
  `issue_date` date default NULL,
  `unit_price` double default NULL,
  `isdelete` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of traiff_param
-- ----------------------------
