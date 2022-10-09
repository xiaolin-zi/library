/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50729
Source Host           : localhost:3306
Source Database       : library

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2022-10-09 20:17:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `is_super` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'lxg', '123456', '1');
INSERT INTO `t_admin` VALUES ('2', 'yzz', '123456', '1');
INSERT INTO `t_admin` VALUES ('3', 'zk', '123456', '0');
INSERT INTO `t_admin` VALUES ('4', 'lx', '123456', '0');
INSERT INTO `t_admin` VALUES ('5', 'xsn', '123456', '0');
INSERT INTO `t_admin` VALUES ('6', 'zj', '123456', '0');

-- ----------------------------
-- Table structure for `t_book`
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `style` varchar(30) DEFAULT NULL,
  `loan` int(11) DEFAULT NULL,
  `img_path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_book
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `sno` varchar(30) DEFAULT NULL,
  `grade` varchar(30) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'lxg', '20251104260', '20软二', 'xiaolin', '123456', 'xiaolin@qq.com');
INSERT INTO `t_user` VALUES ('2', null, null, null, '111111', '111111', '1849569695@qq.com');
INSERT INTO `t_user` VALUES ('3', null, '20251104261', null, 'liangxinzhu', '123456', 'lxz@qq.com');
INSERT INTO `t_user` VALUES ('4', null, '20251104262', null, '1111112', '111111', '623718aa@gmail.com');
INSERT INTO `t_user` VALUES ('5', null, '20251104263', null, '1111113', '111111', '11@qq.com');
