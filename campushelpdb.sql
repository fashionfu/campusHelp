/*
Navicat MySQL Data Transfer

Source Server         : Distance
Source Server Version : 50718
Source Host           : 140.143.181.108:10028
Source Database       : campushelpdb

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2022-04-26 20:01:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(6) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '123456',
  `name` varchar(255) NOT NULL DEFAULT 'name',
  `addtime` datetime(6) NOT NULL,
  `state` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('10', 'admin', '123456', 'name', '2020-02-06 23:12:37.000000', '0');
-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '鱼香肉丝', 'yu.png', '35');
INSERT INTO `product` VALUES ('2', '番茄鸡蛋', 'fan.png', '22');
INSERT INTO `product` VALUES ('3', '外婆菜', 'wai.png', '35');
INSERT INTO `product` VALUES ('4', '手撕包菜', 'shou.png', '15');
INSERT INTO `product` VALUES ('7', '刀拍黄瓜', 'dao.png', '16');
INSERT INTO `product` VALUES ('9', '粉蒸肉', 'fen.png', '88');

-- ----------------------------
-- Table structure for school
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `schoolid` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT 'schoolname',
  `addtime` datetime(6) NOT NULL,
  `state` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`schoolid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES ('9', '武大', '2020-02-06 23:24:45.000000', '0');
INSERT INTO `school` VALUES ('10', '华科', '2020-02-07 11:02:59.000000', '0');
INSERT INTO `school` VALUES ('11', '北大', '2020-02-07 11:37:38.000000', '0');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `taskid` int(8) NOT NULL AUTO_INCREMENT,
  `publish_user_id` varchar(255) NOT NULL COMMENT '发布用户学号',
  `publish_user_name` varchar(255) NOT NULL,
  `publish_school_id` int(6) NOT NULL COMMENT '发布用户学校ID',
  `accept_user_id` int(11) NOT NULL DEFAULT '0',
  `reward` double(30,0) NOT NULL DEFAULT '0' COMMENT '任务奖励',
  `addtime` datetime(6) NOT NULL COMMENT '发布时间',
  `endtime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `taskname` varchar(255) NOT NULL COMMENT '任务名称',
  `taskcontext` varchar(255) NOT NULL COMMENT '任务描述',
  `state` int(2) NOT NULL DEFAULT '0' COMMENT '任务状态',
  PRIMARY KEY (`taskid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('37', '7', '李飞', '9', '8', '10', '2020-02-07 11:25:43.000000', '2020-02-07 11:25:43', '代取一个快递', '去学校快递出取一个快递', '3');
INSERT INTO `task` VALUES ('38', '9', '柳树', '11', '7', '2', '2020-02-07 11:40:10.000000', '2020-02-07 11:40:10', '7栋宿舍买个早点', '帮买早餐', '3');
INSERT INTO `task` VALUES ('39', '7', '李飞', '9', '0', '5', '2022-04-26 19:52:50.000000', '2022-04-26 19:52:50', '商品:鱼香肉丝', '单价:35', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `stuid` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` varchar(20) NOT NULL DEFAULT '' COMMENT '学号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `schoolid` int(6) NOT NULL,
  `sex` int(2) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT 'name',
  `registertime` datetime(6) NOT NULL COMMENT '注册时间',
  `money` double(20,0) NOT NULL DEFAULT '0',
  `state` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stuid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('7', '13037', '123456', '9', '0', '李飞', '2020-02-06 23:25:30.000000', '87', '0');
INSERT INTO `user` VALUES ('8', '13038', '123456', '10', '0', '王刚', '2020-02-07 11:29:09.000000', '60', '0');
INSERT INTO `user` VALUES ('9', '13039', '123456', '11', '1', '柳树', '2020-02-07 11:38:35.000000', '98', '0');
