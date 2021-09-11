/*
Navicat MySQL Data Transfer

Source Server         : hlj
Source Server Version : 80025
Source Host           : localhost:3306
Source Database       : ordersystem

Target Server Type    : MYSQL
Target Server Version : 80025
File Encoding         : 65001

Date: 2021-09-11 09:28:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(11) DEFAULT NULL,
  `password` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin1', '123123');

-- ----------------------------
-- Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `flavor` varchar(11) DEFAULT NULL,
  `tid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  CONSTRAINT `t_menu_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `t_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', '香酥鸡', '39', '五香', '4');
INSERT INTO `t_menu` VALUES ('2', '烧椒扣肉', '46', '微辣', '1');
INSERT INTO `t_menu` VALUES ('3', '栗子三杯鸡', '56', '五香', '1');
INSERT INTO `t_menu` VALUES ('5', '菠菜拌粉丝', '22', '五香', '2');
INSERT INTO `t_menu` VALUES ('6', '凉拌豆腐皮', '19', '微辣', '2');
INSERT INTO `t_menu` VALUES ('7', '酱牛肉', '36', '麻辣', '2');
INSERT INTO `t_menu` VALUES ('8', '鱼头豆腐汤', '32', '五香', '3');
INSERT INTO `t_menu` VALUES ('9', '瘦肉鸡蛋白菜汤', '32', '五香', '3');
INSERT INTO `t_menu` VALUES ('10', '西葫芦虾仁蒸饺', '26', '五香', '4');
INSERT INTO `t_menu` VALUES ('11', '蛋炒饭', '18', '五香', '4');
INSERT INTO `t_menu` VALUES ('12', '酥粒椰蓉面包', '12', '香甜', '5');
INSERT INTO `t_menu` VALUES ('28', '哈哈', '56', '微辣', '1');
INSERT INTO `t_menu` VALUES ('29', '哈哈', '56', '微辣', '1');
INSERT INTO `t_menu` VALUES ('30', '小猴子', '99', '变态辣', '4');

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `mid` int DEFAULT NULL,
  `aid` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `state` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `mid` (`mid`),
  KEY `aid` (`aid`),
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `t_menu` (`id`),
  CONSTRAINT `t_order_ibfk_3` FOREIGN KEY (`aid`) REFERENCES `t_admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', '1', '7', '1', '2019-02-06', '1');
INSERT INTO `t_order` VALUES ('2', '1', '2', '1', '2019-02-06', '1');
INSERT INTO `t_order` VALUES ('5', '1', '5', '1', '2019-02-06', '1');
INSERT INTO `t_order` VALUES ('6', '1', '9', '1', '2019-02-06', '1');
INSERT INTO `t_order` VALUES ('10', '1', '10', '1', '2019-02-06', '1');
INSERT INTO `t_order` VALUES ('11', '1', '10', null, '2019-02-06', '0');
INSERT INTO `t_order` VALUES ('12', '1', '10', '1', '2019-02-06', '1');
INSERT INTO `t_order` VALUES ('14', '1', '6', '1', '2019-02-06', '1');
INSERT INTO `t_order` VALUES ('16', '1', '10', '1', '2019-02-06', '1');
INSERT INTO `t_order` VALUES ('19', '1', '7', '1', '2019-02-07', '1');
INSERT INTO `t_order` VALUES ('26', '2', '8', null, '2019-02-08', '0');
INSERT INTO `t_order` VALUES ('27', '2', '12', null, '2019-02-08', '0');
INSERT INTO `t_order` VALUES ('28', '1', '30', null, '2021-09-11', '0');
INSERT INTO `t_order` VALUES ('29', '1', '11', '1', '2021-09-11', '1');

-- ----------------------------
-- Table structure for `t_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES ('1', '热菜');
INSERT INTO `t_type` VALUES ('2', '凉菜');
INSERT INTO `t_type` VALUES ('3', '汤羹');
INSERT INTO `t_type` VALUES ('4', '主食');
INSERT INTO `t_type` VALUES ('5', '烘焙');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(11) DEFAULT NULL,
  `password` varchar(11) DEFAULT NULL,
  `nickname` varchar(11) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `registerdate` date DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'zhangsan', '123123', '张三', '男', '13576765678', '2019-02-03', '科技路');
INSERT INTO `t_user` VALUES ('2', 'lisi', '123123', '李四', '女', '18678987676', '2019-02-03', '科技路');
INSERT INTO `t_user` VALUES ('7', '小猴子', '123', 'xiaohouzi', '女', '18745678945', '2021-09-10', '犀浦');
INSERT INTO `t_user` VALUES ('8', '猴猴', '123', 'houhou', '男', '18346213278', '2021-09-11', '犀浦2');
