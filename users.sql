# Host: localhost  (Version: 5.5.40)
# Date: 2017-11-20 17:40:44
# Generator: MySQL-Front 5.3  (Build 4.120)

/*!40101 SET NAMES utf8 */;

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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

#
# Data for table "users"
#

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (30,'18316576340','NJgzeKxhviBJi15QuFemICi6.jpg','Michael','c8837b23ff8aaa8a2dde915473ce0991',0,''),(31,'13544339312','','','c8837b23ff8aaa8a2dde915473ce0991',0,''),(33,'18316576342','','','c8837b23ff8aaa8a2dde915473ce0991',0,''),(34,'13544339313','','','c8837b23ff8aaa8a2dde915473ce0991',0,''),(35,'18316576344','','','c8837b23ff8aaa8a2dde915473ce0991',0,''),(36,'18316576345','','','c8837b23ff8aaa8a2dde915473ce0991',0,'');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
