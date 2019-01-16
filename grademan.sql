/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : grademan

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-01-16 10:27:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(255) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('2', '山东理工大学西校区3#202');
INSERT INTO `address` VALUES ('3', '山东理工大学西校区3#201');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL COMMENT '0为超级管理员，1为管理员',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin', '0');
INSERT INTO `admin` VALUES ('3', 'pp', '740209', '1');

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `time_begin` datetime NOT NULL,
  `time_end` datetime NOT NULL,
  `introduce` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `all_num` int(11) NOT NULL DEFAULT '0' COMMENT '报名人数',
  `sign_num` int(11) NOT NULL DEFAULT '0' COMMENT '报名成功人数',
  `admin_id` int(11) NOT NULL,
  PRIMARY KEY (`exam_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('1', '教师资格证笔试', '2019-03-08 08:00:00', '2019-01-16 08:00:00', '2019-01-20 08:00:00', '教师资格证笔试的介绍', '报名未开始', '0', '0', '3');
INSERT INTO `exam` VALUES ('2', '六级考试', '2019-02-13 00:00:00', '2019-01-16 00:00:00', '2019-01-23 00:00:00', '六级考试的介绍', '考试结束', '1', '2', '3');
INSERT INTO `exam` VALUES ('3', '我也是管理员发布的考试', '2019-01-31 08:00:00', '2019-01-17 00:00:00', '2019-01-24 00:00:00', '这是介绍', '报名结束待考试', '1', '0', '3');
INSERT INTO `exam` VALUES ('4', '我是超级管理员发布的考试', '2019-01-23 08:00:00', '2019-01-16 00:00:00', '2019-01-20 00:00:00', '我是考试介绍', '报名未开始', '0', '0', '1');
INSERT INTO `exam` VALUES ('5', '我是超级管理员发布的报名结束的考试', '2019-01-31 09:00:00', '2019-01-18 00:00:00', '2019-01-23 00:00:00', '结束介绍介绍', '报名结束待考试', '0', '0', '1');
INSERT INTO `exam` VALUES ('6', '我是管理员发布的考试4', '2019-01-25 08:00:00', '2019-01-17 00:00:00', '2019-01-19 00:00:00', '介绍', '报名未开始', '0', '0', '3');

-- ----------------------------
-- Table structure for exam_room
-- ----------------------------
DROP TABLE IF EXISTS `exam_room`;
CREATE TABLE `exam_room` (
  `exam_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(255) NOT NULL,
  `room_address` varchar(255) NOT NULL,
  `exam_room_num` int(11) NOT NULL,
  PRIMARY KEY (`room_id`),
  KEY `exam_id` (`exam_id`) USING BTREE,
  CONSTRAINT `exam_room_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_room
-- ----------------------------
INSERT INTO `exam_room` VALUES ('5', '1', 'abc', '山东理工大学西校区3#202', '1');
INSERT INTO `exam_room` VALUES ('2', '2', 'def', '山东理工大学西校区3#202', '4');

-- ----------------------------
-- Table structure for signup
-- ----------------------------
DROP TABLE IF EXISTS `signup`;
CREATE TABLE `signup` (
  `user_id` int(11) NOT NULL,
  `examcard_number` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT '待审核' COMMENT '待审核；通过；不通过',
  `room_id` int(11) DEFAULT '0',
  `seat_num` int(11) DEFAULT '0',
  `score` double(11,0) DEFAULT '-1',
  PRIMARY KEY (`examcard_number`),
  KEY `FKR` (`room_id`),
  KEY `FKE` (`exam_id`),
  KEY `FKU` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of signup
-- ----------------------------
INSERT INTO `signup` VALUES ('2', '13', '2', '通过', '2', '1', '99');
INSERT INTO `signup` VALUES ('2', '14', '3', '不通过', '0', '0', '-1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `identify` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '逢考必过', '740209', '11', '221', '122', null);
INSERT INTO `user` VALUES ('2', 'pp', '740209', '1006770131@qq.com', '盖鑫', '370702199804115440', '男');
INSERT INTO `user` VALUES ('3', 'xpp', '740209', '1006770131@qq.com', '嘻屁', '370702199804115442', '女');
