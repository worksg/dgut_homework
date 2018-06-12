/*
Navicat MySQL Data Transfer
Source Host     : localhost:3306
Source Database : eims
Target Host     : localhost:3306
Target Database : eims
Date: 2012-10-21 17:48:32
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `clientName` varchar(255) default NULL,
  `clientTelephone` varchar(255) default NULL,
  `clientAddress` varchar(255) default NULL,
  `clientEmail` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('李想', '56567788', '北京', '5566@163.com');
INSERT INTO `client` VALUES ('孟想', '65656655', '北京', '6565@163.com');

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `clientName` varchar(255) default NULL,
  `contactName` varchar(255) default NULL,
  `contactContents` varchar(255) default NULL,
  `contactStart` varchar(255) default NULL,
  `contactEnd` varchar(255) default NULL,
  `StaffName` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES ('李想', '笔记本购买', '购买50台笔记本', '2012年12月1日', '10年', '小李');
INSERT INTO `contact` VALUES ('孟想', '台式机', '订台式机100台', '2012年12月26日', '10年', '小李');

-- ----------------------------
-- Table structure for cs
-- ----------------------------
DROP TABLE IF EXISTS `cs`;
CREATE TABLE `cs` (
  `clientName` varchar(255) default NULL,
  `clientOpinion` varchar(255) default NULL,
  `StaffName` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of cs
-- ----------------------------
INSERT INTO `cs` VALUES ('李想', '电脑经常死机郁闷中...', '小李');
INSERT INTO `cs` VALUES ('', '', '');
INSERT INTO `cs` VALUES ('', '', '');
INSERT INTO `cs` VALUES ('', '', '');
INSERT INTO `cs` VALUES ('', '', '');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productName` varchar(255) default NULL,
  `productModel` varchar(255) default NULL,
  `productNumber` varchar(255) default NULL,
  `productPrice` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('联想笔记本', 'lx6600', '2000', '3600元');
INSERT INTO `product` VALUES ('中国龙台式机', 'China6600', '8000', '5000元');

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `staffName` varchar(255) default NULL,
  `staffSex` varchar(255) default NULL,
  `staffAge` varchar(255) default NULL,
  `staffEducation` varchar(255) default NULL,
  `staffDepartment` varchar(255) default NULL,
  `staffDate` varchar(255) default NULL,
  `staffDuty` varchar(255) default NULL,
  `staffWage` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('小李', '女', '36', '硕士', '市场部', '2000年5月16日', '市场部销售主管', '12000');
INSERT INTO `staff` VALUES ('', '', '', '', '', '', '', '');
INSERT INTO `staff` VALUES ('', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userName` varchar(255) default NULL,
  `password` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('zzf', '123');
