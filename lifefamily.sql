# Host: localhost  (Version: 5.5.40)
# Date: 2017-11-15 17:40:36
# Generator: MySQL-Front 5.3  (Build 4.120)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "banner"
#

DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `href` varchar(128) NOT NULL,
  `cid` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "banner"
#

/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (1,'厨电','http://10.161.18.113:3000/assets/00c5bf77-a9e0-48fd-b8c8-36caaf0960a2.jpg','https://www.baidu.com/',0),(2,'置业','http://10.161.18.113:3000/assets/3e9d0522-8d15-4a96-8df8-851751b3d036.jpg','https://www.baidu.com/',0),(3,'电器','http://10.161.18.113:3000/assets/587f5612-8a2d-4384-92bd-726314671738.jpg','https://www.baidu.com/',0),(4,'空调','http://10.161.18.113:3000/assets/85162766-091e-44db-bc90-905ae89cb1b9.jpg','https://www.baidu.com/',0),(5,'冰箱','http://10.161.18.113:3000/assets/eb32f5ea-47e7-414f-a7a6-9fc63974f703.jpg','https://www.baidu.com/',0),(6,'高记饭店','http://10.161.18.113:3000/assets/8a56fc07-3397-4f12-bfd3-8f5499835394.jpg','https://www.baidu.com/',1),(7,'丝博养生管','http://10.161.18.113:3000/assets/e231c3ae-0280-4533-b5b6-d02ec6db35e7.jpg','https://www.baidu.com/',1),(8,'家世界','http://10.161.18.113:3000/assets/fb28b953-8850-4df3-a03b-ae252c0c0798.jpg','https://www.baidu.com/',1),(9,'茶餐厅','http://10.161.18.113:3000/assets/4d2ed21a-78a6-4168-a384-3287b6e8612b.jpg','https://www.baidu.com/',1),(10,'一口得','http://10.161.18.113:3000/assets/9c3fb582-c5f3-4f6e-adf8-ada0609e7bb2.jpg','https://www.baidu.com/',1),(11,'饼干','http://10.161.18.113:3000/assets/5d3d7b04-94c1-41e4-9cdf-25206d3deb44.jpg','https://www.baidu.com/',2),(12,'奶粉','http://10.161.18.113:3000/assets/c65cdffe-533e-4108-bccb-f8c528603092.jpg','https://www.baidu.com/',2),(13,'鸡蛋','http://10.161.18.113:3000/assets/6b7d96db-6429-4cca-a5f7-ace6609c46ea.jpg','https://www.baidu.com/',2),(14,'苹果手机','http://10.161.18.113:3000/assets/59f14aa4Na76589ff.jpg','https://www.baidu.com/',5),(15,'纸巾','http://10.161.18.113:3000/assets/59f17858N0d6f9c8d.jpg','https://www.baidu.com/',5);
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;

#
# Structure for table "evaluate"
#

DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "evaluate"
#

/*!40000 ALTER TABLE `evaluate` DISABLE KEYS */;
INSERT INTO `evaluate` VALUES (1,'104','2017-10-05','1','不错不错','小球'),(2,'104','2017-10-15','4','还好','Michael');
/*!40000 ALTER TABLE `evaluate` ENABLE KEYS */;

#
# Structure for table "fdetail"
#

DROP TABLE IF EXISTS `fdetail`;
CREATE TABLE `fdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `dprice` float(11,2) DEFAULT NULL,
  `oprice` float(11,2) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `salevolume` int(11) DEFAULT NULL,
  `deadline` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `content` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "fdetail"
#

/*!40000 ALTER TABLE `fdetail` DISABLE KEYS */;
INSERT INTO `fdetail` VALUES (1,'http://10.161.18.113:3000/assets/tea.jpg','态合堂 野生石斛花野生红滇红茶400g 野生石斛花银针滇红茶300g',2,10,860.00,990.00,'104',18,'2017/11/11','250','内内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容容');
/*!40000 ALTER TABLE `fdetail` ENABLE KEYS */;

#
# Structure for table "menu"
#

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `distance` varchar(255) DEFAULT NULL,
  `oprice` float(10,2) DEFAULT NULL,
  `dprice` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "menu"
#

/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'【生活一家会员专享：二手房成交享9折优惠，专车接送看房】\r\n家世界置业有限公司，简称“家世界置业”，成立于2014年11月20日，注册资本1000万。是一家致力于打造房地产顶级综合服务平台的企业，总部设在甲级写字楼惠州华贸大厦。业务范围涉及一手房代理、二手房买卖、金融按揭、写字楼租赁、装修装饰等。',0,'http://10.161.18.113:3000/assets/zhiye.jpg','家世界置业有限公司(名流印象分行)','/pdetail','101.7KM',NULL,NULL),(2,'【生活一家会员专享： 下订2000抵3000，5000千抵7000送海康科技监控一个（我们是智能装饰，全房可以用手机控制电源）】',1,'http://10.161.18.113:3000/assets/honghui.jpg','洪辉装饰（罗阳）','/pdetail','101.7KM',NULL,NULL),(3,NULL,9,'http://10.161.18.113:3000/assets/shipin.jpg','德国原装进口啤酒 柏龙Paulaner酵母型黑、白小麦啤酒500ml*20瓶','/fdetail',NULL,228.00,180.00),(4,NULL,10,'http://10.161.18.113:3000/assets/eb562814-076f-4ad7-a25a-be8aa01a5f45.jpg','态合堂 野生石斛花野生红滇红茶400g 野生石斛花银针滇红茶300g','/fdetail',NULL,990.00,860.00);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

#
# Structure for table "nav"
#

DROP TABLE IF EXISTS `nav`;
CREATE TABLE `nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "nav"
#

/*!40000 ALTER TABLE `nav` DISABLE KEYS */;
INSERT INTO `nav` VALUES (0,'地产',1),(1,'装饰家居',1),(2,'汽车',1),(3,'金融财税',1),(4,'酒店',1),(5,'餐饮',1),(6,'夜生活',1),(7,'美体休闲',1),(8,'专卖',1),(9,'中外名酒',2),(10,'茗茶月饼',2);
/*!40000 ALTER TABLE `nav` ENABLE KEYS */;

#
# Structure for table "pdetail"
#

DROP TABLE IF EXISTS `pdetail`;
CREATE TABLE `pdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `content` varchar(3000) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "pdetail"
#

/*!40000 ALTER TABLE `pdetail` DISABLE KEYS */;
INSERT INTO `pdetail` VALUES (0,1,0,'01','http://10.161.18.113:3000/assets/348b8b29-e22e-4a66-8d47-cb8f2cfbeff8.jpg','【生活一家会员专享： 下订2000抵3000，5000千抵7000送海康科技监控一个（我们是智能装饰，全房可以用手机控制电源）】','东莞市市辖区大运龙平南路9号名流印象花园7号楼会所一楼3号','0752692833','13126302565','http://apis.map.qq.com/tools/poimarker?type=0&marker=coord:22.721659739870915,114.19633123715957;title:家世界置业有限公司(名流印象分行);addr:东莞市市辖区大运龙平南路9号名流印象花园7号楼会所一楼3号&referer=shyj&key=QN2BZ-FUXCO-J7NWS-SVH7H-MDT6S-LYBDS','容容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内','家世界置业有限公司(名流印象分行)'),(1,1,1,'12','http://10.161.18.113:3000/assets/1ecd2b9c-6fe6-46cf-a94a-8eeb42378394.jpg','【生活一家会员专享： 下订2000抵3000，5000千抵7000送海康科技监控一个（我们是智能装饰，全房可以用手机控制电源）】','博罗县罗阳镇佳兆业东江新城3期高层9号商铺洪辉装饰','07526928333','13126305265','http://apis.map.qq.com/tools/poimarker?type=0&marker=coord:23.150293890546788,114.28145243040909;title:洪辉装饰（罗阳）;addr:博罗县罗阳镇佳兆业东江新城3期高层9号商铺洪辉装饰&referer=shyj&key=QN2BZ-FUXCO-J7NWS-SVH7H-MDT6S-LYBDS','我们是智能装饰，全房可以用手机控制电源','洪辉装饰（罗阳）');
/*!40000 ALTER TABLE `pdetail` ENABLE KEYS */;

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `psd` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `pay` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

#
# Data for table "users"
#

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (30,'18316576340','','','c8837b23ff8aaa8a2dde915473ce0991',0,''),(31,'13544339312','','','c8837b23ff8aaa8a2dde915473ce0991',0,''),(33,'18316576342','','','c8837b23ff8aaa8a2dde915473ce0991',0,'');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
