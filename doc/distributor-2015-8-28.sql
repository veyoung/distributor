/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.21-log : Database - distributor
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`distributor` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `distributor`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父类目ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`name`,`parent_id`) values (642380331069824,'生活必备',NULL),(642380466303360,'数码产品',NULL);

/*Table structure for table `commodity` */

DROP TABLE IF EXISTS `commodity`;

CREATE TABLE `commodity` (
  `id` bigint(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `vip_vip` int(11) NOT NULL DEFAULT '0' COMMENT 'vip会员消费，vip会员自身的提成金额',
  `vip_gold` int(11) NOT NULL DEFAULT '0' COMMENT 'vip会员消费，金牌上级的提成金额',
  `vip_diamond` int(11) NOT NULL DEFAULT '0' COMMENT 'vip会员消费，钻石上级的提成金额',
  `gold_gold` int(11) NOT NULL DEFAULT '0' COMMENT '金牌会员消费，金牌会员自身的提成金额',
  `gold_diamond` int(11) NOT NULL DEFAULT '0' COMMENT '金牌会员消费，钻石上级的提成金额',
  `diamond_diamond` int(11) NOT NULL DEFAULT '0' COMMENT '钻石会员消费，钻石会员自身的提成金额',
  `description` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态：1、上线，2、下线',
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `commodity` */

insert  into `commodity`(`id`,`name`,`brand`,`price`,`vip_vip`,`vip_gold`,`vip_diamond`,`gold_gold`,`gold_diamond`,`diamond_diamond`,`description`,`status`,`category_id`) values (11111,'洗面奶','旁氏',2400,0,0,0,0,0,0,'专为你设计',2,5),(631713438519680,'餐巾纸','清风',123100,0,0,0,0,0,0,'生活常备',2,4),(631713522045312,'马桶','九阳',232100,0,0,0,0,0,0,'',2,4),(631713584533888,'抽水机','九阳',321400,0,0,0,0,0,0,'',2,4),(631713641304448,'手机','三星',321400,0,0,0,0,0,0,'',2,4),(631713703694720,'电风扇','华立',42300,0,0,0,0,0,0,'',2,4),(631713751839104,'空调','格力',32142100,0,0,0,0,0,0,'',2,4),(631713872826752,'钥匙','三金',321400,0,0,0,0,0,0,'',2,4),(631721876173184,'水表','罗西尼',2455,0,0,0,0,0,0,'',2,4),(631766036353408,'电吹风','九三',3121300,0,0,0,0,0,0,'',2,4),(637993097482624,'电饭锅','九阳',2300,0,0,0,0,0,0,'',2,8),(638033042633088,'雨伞','天堂',2300,0,0,0,0,0,0,'家庭必备用品',2,631026877337984),(642380724793728,'纸巾','清风',1250,100,200,300,400,500,550,'纸巾',1,642380331069824),(642421186253184,'豆浆机','九阳',1230,1200,1300,1400,1500,1600,1700,'',1,642380466303360);

/*Table structure for table `distributor` */

DROP TABLE IF EXISTS `distributor`;

CREATE TABLE `distributor` (
  `id` bigint(20) NOT NULL,
  `name` varchar(15) NOT NULL,
  `level` int(11) NOT NULL COMMENT '等级：1、钻石会员，2、金牌会员，3、VIP会员',
  `balance` int(11) DEFAULT '0' COMMENT '账户余额',
  `commission` int(11) DEFAULT '0' COMMENT '账户积分',
  `mobile` varchar(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1' COMMENT '状态：1、正常，2、删除',
  `description` varchar(30) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `distributor` */

insert  into `distributor`(`id`,`name`,`level`,`balance`,`commission`,`mobile`,`status`,`description`,`create_time`) values (628245496934784,'余扬',1,0,2100,'13518198865',1,NULL,NULL),(628250021368192,'刘奇葆',2,0,0,'18825231556',1,NULL,NULL),(628250401878400,'于世仁',3,0,0,'13324232132',1,NULL,NULL),(637750685544832,'李时珍',1,0,0,'13324232132',1,NULL,NULL),(637816164086144,'张四周',2,0,1500,'13518198865',1,NULL,NULL),(637834343346560,'李仁巴',3,0,0,'13518198865',1,NULL,NULL),(637834825118080,'张生贵',3,8520,300,'18825231556',1,NULL,NULL),(643002604982656,'陈文涛',1,0,0,'13518198865',1,NULL,NULL),(643004670513536,'徐欢',1,0,0,'13324232132',1,NULL,NULL),(643004776173952,'徐童',2,0,0,'13324232132',1,NULL,NULL),(643004842512768,'陈晓婷',1,0,0,'13324232132',1,NULL,NULL),(643547346080128,'刘奇葆',1,0,0,'13518198865',2,NULL,NULL);

/*Table structure for table `distributor_balance` */

DROP TABLE IF EXISTS `distributor_balance`;

CREATE TABLE `distributor_balance` (
  `id` bigint(20) NOT NULL,
  `distributor_id` bigint(20) NOT NULL,
  `balance_change` int(11) DEFAULT NULL COMMENT '变动金额：缴费就是正数，扣费是负数',
  `balance` int(11) DEFAULT NULL COMMENT '变动后的当前账户余额',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `distributor_balance` */

insert  into `distributor_balance`(`id`,`distributor_id`,`balance_change`,`balance`,`create_time`) values (642377325400448,628245496934784,0,111,'2015-08-21 22:55:42'),(642425202651520,637834825118080,0,22,'2015-08-22 00:33:07'),(642432150925696,637834825118080,0,122,'2015-08-22 00:47:15'),(642432205574528,637834825118080,1000,1122,'2015-08-22 00:47:21'),(642440635765120,637834825118080,100000,100000,'2015-08-22 01:04:30'),(642440635912576,637834825118080,100000,200000,'2015-08-22 01:04:31'),(642441695269248,637834825118080,-13200,186800,'2015-08-22 01:06:40'),(643004153246080,643002604982656,10000,10000,'2015-08-22 20:10:59'),(643011049861504,637834825118080,-2480,184320,'2015-08-22 20:25:01'),(643013414973824,643002604982656,-1250,8750,'2015-08-22 20:29:50'),(643013774414208,643002604982656,-2480,6270,'2015-08-22 20:30:34'),(643014117495168,628245496934784,10000,10000,'2015-08-22 20:31:16'),(643014247682432,628245496934784,-2480,7520,'2015-08-22 20:31:31'),(643014529487232,628245496934784,-2480,5040,'2015-08-22 20:32:06'),(643020832174464,643002604982656,-1250,5020,'2015-08-22 20:44:55'),(643020956176768,643002604982656,-1230,3790,'2015-08-22 20:45:10'),(643021084561792,643002604982656,-1250,2540,'2015-08-22 20:45:26'),(643021210595712,643002604982656,-1250,1290,'2015-08-22 20:45:41'),(643021374820736,643002604982656,-1250,40,'2015-08-22 20:46:01'),(643439744815488,628245496934784,-2480,2560,'2015-08-23 10:57:12'),(643442863853952,643004842512768,10000,10000,'2015-08-23 11:03:33'),(643442993279360,643004842512768,20000,30000,'2015-08-23 11:03:49'),(643559162524032,628250021368192,25000,25000,'2015-08-23 15:00:09'),(643569568493952,637834825118080,8900,193220,'2015-08-23 15:21:20'),(643569706234240,637834343346560,90000,90000,'2015-08-23 15:21:36'),(643569812181376,637834343346560,90000,180000,'2015-08-23 15:21:49'),(646652581245312,637834825118080,10000,10000,'2015-08-27 23:53:44'),(646652858249600,637834825118080,-2480,7520,'2015-08-27 23:54:18');

/*Table structure for table `distributor_commission` */

DROP TABLE IF EXISTS `distributor_commission`;

CREATE TABLE `distributor_commission` (
  `id` bigint(20) NOT NULL,
  `distributor_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `commission` int(11) DEFAULT NULL COMMENT '本次获得的提成',
  `totalCommission` int(11) DEFAULT NULL COMMENT '提成总数',
  `create_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `distributor_commission` */

insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (646652858003840,637834825118080,646652857962880,1300,1300,'2015-08-27 23:54:18',NULL),(646652858093952,637816164086144,646652857962880,1500,1500,'2015-08-27 23:54:18',NULL),(646652858184064,628245496934784,646652857962880,2100,2100,'2015-08-27 23:54:18',NULL);

/*Table structure for table `distributor_commission_commodity` */

DROP TABLE IF EXISTS `distributor_commission_commodity`;

CREATE TABLE `distributor_commission_commodity` (
  `id` bigint(20) NOT NULL,
  `commodity_name` varchar(32) NOT NULL,
  `commodity_count` int(11) NOT NULL DEFAULT '1',
  `commodity_commission` int(11) NOT NULL DEFAULT '0',
  `distributor_commission_id` bigint(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `distributor_commission_commodity` */

insert  into `distributor_commission_commodity`(`id`,`commodity_name`,`commodity_count`,`commodity_commission`,`distributor_commission_id`,`create_time`) values (646652858012032,'纸巾',1,100,646652858003840,'2015-08-27 23:54:18'),(646652858036608,'豆浆机',1,1200,646652858003840,'2015-08-27 23:54:18'),(646652858102144,'纸巾',1,200,646652858093952,'2015-08-27 23:54:18'),(646652858118528,'豆浆机',1,1300,646652858093952,'2015-08-27 23:54:18'),(646652858192256,'纸巾',1,500,646652858184064,'2015-08-27 23:54:18'),(646652858208640,'豆浆机',1,1600,646652858184064,'2015-08-27 23:54:18');

/*Table structure for table `distributor_include` */

DROP TABLE IF EXISTS `distributor_include`;

CREATE TABLE `distributor_include` (
  `id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `child_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `distributor_include` */

insert  into `distributor_include`(`id`,`parent_id`,`child_id`) values (642421467337088,637816164086144,637834825118080),(642421545521536,628245496934784,637816164086144);

/*Table structure for table `order_commodity_include` */

DROP TABLE IF EXISTS `order_commodity_include`;

CREATE TABLE `order_commodity_include` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单编号',
  `commodity_id` bigint(20) NOT NULL COMMENT '订单包含商品',
  `commodity_count` int(11) NOT NULL COMMENT '订单包含商品数量',
  `status` int(11) NOT NULL COMMENT '状态：1、最新，2、历史，3、删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_commodity_include` */

insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (646652297146752,646652857962880,642380724793728,1,2),(646652315431296,646652857962880,642421186253184,1,2);

/*Table structure for table `order_record` */

DROP TABLE IF EXISTS `order_record`;

CREATE TABLE `order_record` (
  `id` bigint(20) NOT NULL,
  `distributor_id` bigint(20) NOT NULL COMMENT '所属经销商',
  `money` int(11) NOT NULL COMMENT '订单金额',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1：最新  2：删除',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_record` */

insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (646652857962880,637834825118080,2480,1,'2015-08-27 23:54:18');

/*Table structure for table `system_log` */

DROP TABLE IF EXISTS `system_log`;

CREATE TABLE `system_log` (
  `id` bigint(20) NOT NULL,
  `content` varchar(256) NOT NULL,
  `use_id` bigint(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `system_log` */

insert  into `system_log`(`id`,`content`,`use_id`,`create_time`) values (1111111,'为\"余扬\"执行一次\"订单操作\",\"订单号\"为\"2312321\"',2323,'2015-08-16 11:11:18'),(3121312,'为\"余扬\"执行一次\"订单操作\",\"订单号\"为\"2312321\"',13121,'2015-08-16 11:12:10');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `role` int(11) NOT NULL COMMENT '角色：1、超级管理员，2、普通操作员',
  `password` varchar(50) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '状态：1、新建，2、审核通过，3、审核拒绝',
  `details` varchar(50) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`role`,`password`,`mobile`,`status`,`details`,`create_time`) values (638077936488830,'admin',1,'admin','13518198078',2,NULL,'2015-08-15 21:10:21'),(638077936488832,'店小二',2,'123','13518198078',1,NULL,'2015-08-15 21:10:21'),(638077936488899,'young',2,'young','13518198078',1,NULL,'2015-08-15 21:10:21'),(643684324003040,'余扬',2,'123','13518198865',1,NULL,'2015-08-23 19:14:48'),(643693551807712,'余沧海',2,'123','13324232132',1,NULL,'2015-08-23 19:33:34');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
