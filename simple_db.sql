-- 校园帮助系统数据库脚本
SET FOREIGN_KEY_CHECKS=0;

-- 管理员表
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(6) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '123456',
  `name` varchar(255) NOT NULL DEFAULT 'name',
  `addtime` datetime NOT NULL,
  `state` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 用户表
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `stuid` int(6) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `schoolid` int(6) NOT NULL,
  `money` double(10,2) NOT NULL DEFAULT '0.00',
  `addtime` datetime NOT NULL,
  `state` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 学校表
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `schoolid` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `addtime` datetime NOT NULL,
  `state` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`schoolid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 任务表
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `tid` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `price` double(10,2) NOT NULL,
  `publish_user_id` int(6) NOT NULL,
  `accept_user_id` int(6) DEFAULT NULL,
  `schoolid` int(6) NOT NULL,
  `state` int(2) NOT NULL DEFAULT '0',
  `addtime` datetime NOT NULL,
  `finishtime` datetime DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 商品表
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 插入默认数据
INSERT INTO `admin` VALUES (10, 'admin', '123456', 'name', '2020-02-06 23:12:37', 0);

SET FOREIGN_KEY_CHECKS=1;
