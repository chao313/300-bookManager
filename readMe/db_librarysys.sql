/*
Navicat MySQL Data Transfer

Source Server         : zsh
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : db_librarysys

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-05-17 12:36:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_bookcase
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookcase`;
CREATE TABLE `tb_bookcase` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_bookcase
-- ----------------------------
INSERT INTO `tb_bookcase` VALUES ('4', 'LA-1');
INSERT INTO `tb_bookcase` VALUES ('5', 'LA-2');
INSERT INTO `tb_bookcase` VALUES ('29', 'LA-3');
INSERT INTO `tb_bookcase` VALUES ('30', 'LA-4');

-- ----------------------------
-- Table structure for tb_bookinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookinfo`;
CREATE TABLE `tb_bookinfo` (
  `barcode` varchar(30) DEFAULT NULL,
  `bookname` varchar(70) DEFAULT NULL,
  `typeid` int(10) unsigned DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `translator` varchar(30) DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `price` float(8,2) DEFAULT NULL,
  `page` int(10) unsigned DEFAULT NULL,
  `bookcase` int(10) unsigned DEFAULT NULL,
  `inTime` date DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `del` tinyint(1) DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_bookinfo
-- ----------------------------
INSERT INTO `tb_bookinfo` VALUES ('9787302210337', 'Java Web开发实战宝典', '4', '王国辉', '', '302', '89.00', '834', '5', '2011-02-24', 'mr', '0', '7');
INSERT INTO `tb_bookinfo` VALUES ('9787115195975', 'Java Web开发典型模块大全', '4', '王国辉、王毅、王殊宇', '', '115', '89.00', '752', '5', '2011-02-24', 'mr', '0', '8');
INSERT INTO `tb_bookinfo` VALUES ('9787302265580', 'JavaEE简明教程', '4', '张燕', '', '302', '25.00', '222', '4', '2016-01-13', 'mr', '0', '13');
INSERT INTO `tb_bookinfo` VALUES ('1', '1', '4', '1', '1', '111', '1.00', '1', '4', '2016-02-17', 'null', '1', '21');
INSERT INTO `tb_bookinfo` VALUES ('9787302147511', '数据结构', '7', '吴伟民', '', '115', '35.00', '334', '4', '2016-01-09', 'mr', '0', '12');
INSERT INTO `tb_bookinfo` VALUES ('9787302147512', '计算机网络', '4', '谢希仁', '', '302', '49.00', '377', '5', '2016-04-05', 'null', '0', '22');

-- ----------------------------
-- Table structure for tb_booktype
-- ----------------------------
DROP TABLE IF EXISTS `tb_booktype`;
CREATE TABLE `tb_booktype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(30) DEFAULT NULL,
  `days` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_booktype
-- ----------------------------
INSERT INTO `tb_booktype` VALUES ('4', '网络编程', '20');
INSERT INTO `tb_booktype` VALUES ('5', '数据库开发', '15');
INSERT INTO `tb_booktype` VALUES ('7', '编程语言', '30');

-- ----------------------------
-- Table structure for tb_borrow
-- ----------------------------
DROP TABLE IF EXISTS `tb_borrow`;
CREATE TABLE `tb_borrow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `readerid` int(10) unsigned DEFAULT NULL,
  `bookid` int(10) DEFAULT NULL,
  `borrowTime` date DEFAULT NULL,
  `backTime` date DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `ifback` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_borrow
-- ----------------------------
INSERT INTO `tb_borrow` VALUES ('7', '4', '7', '2011-02-24', '2011-03-16', 'mr', '1');
INSERT INTO `tb_borrow` VALUES ('8', '4', '7', '2011-02-24', '2011-03-16', 'mr', '1');
INSERT INTO `tb_borrow` VALUES ('9', '5', '8', '2011-02-24', '2011-04-05', 'mr', '1');
INSERT INTO `tb_borrow` VALUES ('10', '8', '12', '2016-01-09', '2016-01-12', 'mr', '1');
INSERT INTO `tb_borrow` VALUES ('11', '4', '12', '2016-01-09', '2016-01-12', 'mr', '1');
INSERT INTO `tb_borrow` VALUES ('12', '5', '12', '2016-01-09', '2016-01-12', 'mr', '1');
INSERT INTO `tb_borrow` VALUES ('13', '5', '12', '2016-01-09', '2016-01-12', 'mr', '1');
INSERT INTO `tb_borrow` VALUES ('14', '8', '7', '2016-01-09', '2016-01-29', 'mr', '1');
INSERT INTO `tb_borrow` VALUES ('15', '5', '12', '2016-01-09', '2016-02-17', 'mr', '1');
INSERT INTO `tb_borrow` VALUES ('16', '5', '12', '2016-01-09', '2016-02-17', 'mr', '1');
INSERT INTO `tb_borrow` VALUES ('17', '5', '12', '2016-01-09', '2016-02-08', 'mr', '0');
INSERT INTO `tb_borrow` VALUES ('18', '8', '13', '2016-01-13', '2016-02-02', 'mr', '1');
INSERT INTO `tb_borrow` VALUES ('19', '8', '13', '2016-01-13', '2016-02-02', 'mr', '1');
INSERT INTO `tb_borrow` VALUES ('20', '8', '12', '2016-02-17', '2016-03-18', 'null', '1');
INSERT INTO `tb_borrow` VALUES ('21', '8', '8', '2016-02-17', '2016-03-08', 'null', '1');
INSERT INTO `tb_borrow` VALUES ('22', '8', '12', '2016-02-17', '2016-03-18', 'null', '0');
INSERT INTO `tb_borrow` VALUES ('23', '8', '13', '2016-02-17', '2016-03-08', 'null', '1');
INSERT INTO `tb_borrow` VALUES ('24', '8', '22', '2016-04-05', '2016-04-25', 'null', '1');
INSERT INTO `tb_borrow` VALUES ('25', '8', '22', '2016-05-14', '2016-06-03', 'null', '1');
INSERT INTO `tb_borrow` VALUES ('26', '4', '22', '2016-05-15', '2016-06-04', 'null', '1');

-- ----------------------------
-- Table structure for tb_giveback
-- ----------------------------
DROP TABLE IF EXISTS `tb_giveback`;
CREATE TABLE `tb_giveback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `readerid` int(11) DEFAULT NULL,
  `bookid` int(11) DEFAULT NULL,
  `backTime` date DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_giveback
-- ----------------------------
INSERT INTO `tb_giveback` VALUES ('3', '4', '7', '2011-02-24', 'mr');
INSERT INTO `tb_giveback` VALUES ('4', '4', '7', '2015-12-23', 'mr');
INSERT INTO `tb_giveback` VALUES ('5', '5', '8', '2015-12-23', 'mr');
INSERT INTO `tb_giveback` VALUES ('6', '5', '12', '2016-01-09', 'mr');
INSERT INTO `tb_giveback` VALUES ('7', '5', '12', '2016-01-09', 'mr');
INSERT INTO `tb_giveback` VALUES ('8', '5', '12', '2016-01-09', 'mr');
INSERT INTO `tb_giveback` VALUES ('9', '5', '12', '2016-01-09', 'mr');
INSERT INTO `tb_giveback` VALUES ('10', '8', '12', '2016-01-13', 'mr');
INSERT INTO `tb_giveback` VALUES ('11', '8', '13', '2016-02-17', 'mr');
INSERT INTO `tb_giveback` VALUES ('12', '8', '12', '2016-02-17', 'mr');
INSERT INTO `tb_giveback` VALUES ('13', '8', '13', '2016-02-17', 'mr');
INSERT INTO `tb_giveback` VALUES ('14', '8', '8', '2016-02-17', 'null');
INSERT INTO `tb_giveback` VALUES ('15', '8', '22', '2016-04-05', 'null');
INSERT INTO `tb_giveback` VALUES ('16', '8', '13', '2016-04-06', 'null');
INSERT INTO `tb_giveback` VALUES ('17', '8', '7', '2016-04-06', 'null');
INSERT INTO `tb_giveback` VALUES ('18', '8', '22', '2016-05-14', 'null');
INSERT INTO `tb_giveback` VALUES ('19', '4', '22', '2016-05-15', 'null');
INSERT INTO `tb_giveback` VALUES ('20', '4', '12', '2016-05-15', 'null');

-- ----------------------------
-- Table structure for tb_library
-- ----------------------------
DROP TABLE IF EXISTS `tb_library`;
CREATE TABLE `tb_library` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `libraryname` varchar(50) DEFAULT NULL,
  `curator` varchar(10) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `introduce` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_library
-- ----------------------------
INSERT INTO `tb_library` VALUES ('1', 'Niit图书馆', 'mr', '0431-84978981', '长春市东盛大街89', 'mingrisoft@mingsoft.com', 'http://www.zsh.com', '1999-12-12', '本市拥有计算机类图书最多的图书馆。张世烩!~！wewe');

-- ----------------------------
-- Table structure for tb_manager
-- ----------------------------
DROP TABLE IF EXISTS `tb_manager`;
CREATE TABLE `tb_manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `PWD` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_manager
-- ----------------------------
INSERT INTO `tb_manager` VALUES ('1', 'mr', 'mrsoft');
INSERT INTO `tb_manager` VALUES ('7', 'wgh', '111');
INSERT INTO `tb_manager` VALUES ('9', 'admin', '111');
INSERT INTO `tb_manager` VALUES ('10', 'zsh', 'zsh');
INSERT INTO `tb_manager` VALUES ('11', '张世烩', 'zsh');
INSERT INTO `tb_manager` VALUES ('16', '张晓峰', 'zxf');

-- ----------------------------
-- Table structure for tb_parameter
-- ----------------------------
DROP TABLE IF EXISTS `tb_parameter`;
CREATE TABLE `tb_parameter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cost` int(10) unsigned DEFAULT NULL,
  `validity` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_parameter
-- ----------------------------
INSERT INTO `tb_parameter` VALUES ('1', '40', '8');

-- ----------------------------
-- Table structure for tb_publishing
-- ----------------------------
DROP TABLE IF EXISTS `tb_publishing`;
CREATE TABLE `tb_publishing` (
  `ISBN` varchar(20) NOT NULL COMMENT 'ISBN号',
  `pubname` varchar(30) DEFAULT NULL COMMENT '出版社名称',
  PRIMARY KEY (`ISBN`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_publishing
-- ----------------------------
INSERT INTO `tb_publishing` VALUES ('111', '机械工业出版社');
INSERT INTO `tb_publishing` VALUES ('115', '人民邮电出版社');
INSERT INTO `tb_publishing` VALUES ('302', '清华大学出版社');

-- ----------------------------
-- Table structure for tb_purview
-- ----------------------------
DROP TABLE IF EXISTS `tb_purview`;
CREATE TABLE `tb_purview` (
  `id` int(11) NOT NULL,
  `sysset` tinyint(1) DEFAULT '0',
  `readerset` tinyint(1) DEFAULT '0',
  `bookset` tinyint(1) DEFAULT '0',
  `borrowback` tinyint(1) DEFAULT '0',
  `sysquery` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_purview
-- ----------------------------
INSERT INTO `tb_purview` VALUES ('1', '1', '1', '1', '1', '1');
INSERT INTO `tb_purview` VALUES ('7', '1', '1', '1', '1', '0');
INSERT INTO `tb_purview` VALUES ('9', '1', '1', '1', '0', '0');
INSERT INTO `tb_purview` VALUES ('10', '1', '1', '0', '0', '0');
INSERT INTO `tb_purview` VALUES ('11', '1', '1', '1', '1', '1');
INSERT INTO `tb_purview` VALUES ('16', '1', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for tb_reader
-- ----------------------------
DROP TABLE IF EXISTS `tb_reader`;
CREATE TABLE `tb_reader` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `barcode` varchar(30) DEFAULT NULL,
  `vocation` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `paperType` varchar(10) DEFAULT NULL,
  `paperNO` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `remark` text,
  `typeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_reader
-- ----------------------------
INSERT INTO `tb_reader` VALUES ('4', '琦琦', '女', '20110224000001', '学生', '2010-07-10', '身份证', '220104201007100001', '84978981', 'wgh717@sohu.com', '2011-02-24', 'mr', '没有', '4');
INSERT INTO `tb_reader` VALUES ('5', 'wgh', '女', '20110224000002', '程序员', '1980-07-10', '工作证', '20010228', '84978981', 'wgh717@sohu.com', '2011-02-24', 'mr', '无', '4');
INSERT INTO `tb_reader` VALUES ('8', '张世烩', '男', '20160109000001', '工程师', '1993-08-23', '学生证', '1209200155', '15751155335', '1367251002@qq.com', '2016-01-09', 'mr', '热爱java', '7');
INSERT INTO `tb_reader` VALUES ('9', '张晓峰', '男', '20160109000002', 'java工程师', '1993-08-02', '身份证', '364426199308084585', '15751168683', '165448988@qq.com', '2016-01-13', 'mr', '很帅！', '4');
INSERT INTO `tb_reader` VALUES ('10', '张子锐', '男', '20160109000003', 'java工程师', '1993-08-02', '学生证', '1209200157', '15751155556', '1367251003@qq.com', '2016-02-16', 'null', '瘦瘦的，黑黑的！', '4');
INSERT INTO `tb_reader` VALUES ('11', '袁弘', '男', '20160109000004', 'IT', '1993-06-09', '身份证', '350426199209281202', '15751158926', '128940550@qq.com', '2016-04-05', 'null', '很不爱跟人讲话。', '4');

-- ----------------------------
-- Table structure for tb_readertype
-- ----------------------------
DROP TABLE IF EXISTS `tb_readertype`;
CREATE TABLE `tb_readertype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `number` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_readertype
-- ----------------------------
INSERT INTO `tb_readertype` VALUES ('4', '学生', '3');
INSERT INTO `tb_readertype` VALUES ('6', '老师', '6');
INSERT INTO `tb_readertype` VALUES ('7', 'VIP', '12');
