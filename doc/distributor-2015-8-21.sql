/*
SQLyog Ultimate v8.32 
MySQL - 5.1.68-community : Database - distributor
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
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

insert  into `category`(`id`,`name`,`parent_id`) values (7,'摄影配件',2);
insert  into `category`(`id`,`name`,`parent_id`) values (8,'手机',4);
insert  into `category`(`id`,`name`,`parent_id`) values (9,'对讲机',4);
insert  into `category`(`id`,`name`,`parent_id`) values (631022846341504,'床上用品',NULL);
insert  into `category`(`id`,`name`,`parent_id`) values (631022923059584,'汽车美容',NULL);
insert  into `category`(`id`,`name`,`parent_id`) values (631026877337984,'家庭电器',NULL);

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

insert  into `commodity`(`id`,`name`,`brand`,`price`,`vip_vip`,`vip_gold`,`vip_diamond`,`gold_gold`,`gold_diamond`,`diamond_diamond`,`description`,`status`,`category_id`) values (11111,'洗面奶','旁氏',2400,0,0,0,0,0,0,'专为你设计',2,5);
insert  into `commodity`(`id`,`name`,`brand`,`price`,`vip_vip`,`vip_gold`,`vip_diamond`,`gold_gold`,`gold_diamond`,`diamond_diamond`,`description`,`status`,`category_id`) values (631713438519680,'餐巾纸','清风',123100,0,0,0,0,0,0,'生活常备',1,4);
insert  into `commodity`(`id`,`name`,`brand`,`price`,`vip_vip`,`vip_gold`,`vip_diamond`,`gold_gold`,`gold_diamond`,`diamond_diamond`,`description`,`status`,`category_id`) values (631713522045312,'马桶','九阳',232100,0,0,0,0,0,0,'',1,4);
insert  into `commodity`(`id`,`name`,`brand`,`price`,`vip_vip`,`vip_gold`,`vip_diamond`,`gold_gold`,`gold_diamond`,`diamond_diamond`,`description`,`status`,`category_id`) values (631713584533888,'抽水机','九阳',321400,0,0,0,0,0,0,'',1,4);
insert  into `commodity`(`id`,`name`,`brand`,`price`,`vip_vip`,`vip_gold`,`vip_diamond`,`gold_gold`,`gold_diamond`,`diamond_diamond`,`description`,`status`,`category_id`) values (631713641304448,'手机','三星',321400,0,0,0,0,0,0,'',1,4);
insert  into `commodity`(`id`,`name`,`brand`,`price`,`vip_vip`,`vip_gold`,`vip_diamond`,`gold_gold`,`gold_diamond`,`diamond_diamond`,`description`,`status`,`category_id`) values (631713703694720,'电风扇','华立',42300,0,0,0,0,0,0,'',1,4);
insert  into `commodity`(`id`,`name`,`brand`,`price`,`vip_vip`,`vip_gold`,`vip_diamond`,`gold_gold`,`gold_diamond`,`diamond_diamond`,`description`,`status`,`category_id`) values (631713751839104,'空调','格力',32142100,0,0,0,0,0,0,'',1,4);
insert  into `commodity`(`id`,`name`,`brand`,`price`,`vip_vip`,`vip_gold`,`vip_diamond`,`gold_gold`,`gold_diamond`,`diamond_diamond`,`description`,`status`,`category_id`) values (631713872826752,'钥匙','三金',321400,0,0,0,0,0,0,'',1,4);
insert  into `commodity`(`id`,`name`,`brand`,`price`,`vip_vip`,`vip_gold`,`vip_diamond`,`gold_gold`,`gold_diamond`,`diamond_diamond`,`description`,`status`,`category_id`) values (631721876173184,'水表','罗西尼',2455,0,0,0,0,0,0,'',1,4);
insert  into `commodity`(`id`,`name`,`brand`,`price`,`vip_vip`,`vip_gold`,`vip_diamond`,`gold_gold`,`gold_diamond`,`diamond_diamond`,`description`,`status`,`category_id`) values (631766036353408,'电吹风','九三',3121300,0,0,0,0,0,0,'',2,4);
insert  into `commodity`(`id`,`name`,`brand`,`price`,`vip_vip`,`vip_gold`,`vip_diamond`,`gold_gold`,`gold_diamond`,`diamond_diamond`,`description`,`status`,`category_id`) values (637993097482624,'电饭锅','九阳',2300,0,0,0,0,0,0,'',2,8);
insert  into `commodity`(`id`,`name`,`brand`,`price`,`vip_vip`,`vip_gold`,`vip_diamond`,`gold_gold`,`gold_diamond`,`diamond_diamond`,`description`,`status`,`category_id`) values (638033042633088,'雨伞','天堂',2300,0,0,0,0,0,0,'家庭必备用品',1,631026877337984);

/*Table structure for table `distributor` */

DROP TABLE IF EXISTS `distributor`;

CREATE TABLE `distributor` (
  `id` bigint(20) NOT NULL,
  `name` varchar(15) NOT NULL,
  `level` int(11) NOT NULL COMMENT '等级：1、钻石会员，2、金牌会员，3、VIP会员',
  `balance` int(11) DEFAULT '0' COMMENT '账户余额',
  `mobile` varchar(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1' COMMENT '状态：1、正常，2、删除',
  `description` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `distributor` */

insert  into `distributor`(`id`,`name`,`level`,`balance`,`mobile`,`status`,`description`) values (628245496934784,'余扬',1,11,'13518198865',1,NULL);
insert  into `distributor`(`id`,`name`,`level`,`balance`,`mobile`,`status`,`description`) values (628250021368192,'刘奇葆',2,34,'18825231556',1,NULL);
insert  into `distributor`(`id`,`name`,`level`,`balance`,`mobile`,`status`,`description`) values (628250401878400,'于世仁',3,23,'13324232132',1,NULL);
insert  into `distributor`(`id`,`name`,`level`,`balance`,`mobile`,`status`,`description`) values (637750685544832,'李时珍',1,12,'13324232132',1,NULL);
insert  into `distributor`(`id`,`name`,`level`,`balance`,`mobile`,`status`,`description`) values (637816164086144,'张四周',2,23,'13518198865',1,NULL);
insert  into `distributor`(`id`,`name`,`level`,`balance`,`mobile`,`status`,`description`) values (637834343346560,'李仁巴',3,12,'13518198865',1,NULL);
insert  into `distributor`(`id`,`name`,`level`,`balance`,`mobile`,`status`,`description`) values (637834825118080,'张生贵',3,22,'18825231556',1,NULL);
insert  into `distributor`(`id`,`name`,`level`,`balance`,`mobile`,`status`,`description`) values (637854064300416,'王二小',3,22,'18825231556',2,NULL);
insert  into `distributor`(`id`,`name`,`level`,`balance`,`mobile`,`status`,`description`) values (640695911331616,'???',1,NULL,'15050561032',2,NULL);
insert  into `distributor`(`id`,`name`,`level`,`balance`,`mobile`,`status`,`description`) values (640695998535456,'???',1,NULL,'15050561032',2,NULL);
insert  into `distributor`(`id`,`name`,`level`,`balance`,`mobile`,`status`,`description`) values (640697608541984,'胡金涛',1,NULL,'15050561032',1,NULL);
insert  into `distributor`(`id`,`name`,`level`,`balance`,`mobile`,`status`,`description`) values (640700950624032,'胡扬封',3,NULL,'15050561032',1,NULL);

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

insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (638174677070208,628245496934784,638174635340160,264,0,'2015-08-12 00:17:11',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (640673453504288,628245496934784,640673345902368,0,0,'2015-08-19 13:09:19',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (640674105693984,628245496934784,640674104923936,0,0,'2015-08-19 13:10:30',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (640674470180640,628245496934784,640674469508896,0,0,'2015-08-19 13:11:14',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (640675935442720,628245496934784,640675935139616,0,0,'2015-08-19 13:14:13',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (640677181323040,628245496934784,640677180864288,0,0,'2015-08-19 13:16:45',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (640677411477280,628245496934784,640677410617120,0,0,'2015-08-19 13:17:13',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (640677876348704,628245496934784,640677875562272,1,0,'2015-08-19 13:18:10',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (640678123444000,628245496934784,640678087972640,0,0,'2015-08-19 13:18:45',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (640680568772384,628245496934784,640680567273248,0,0,'2015-08-19 13:23:39',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (640681262028576,628245496934784,640681261487904,0,0,'2015-08-19 13:25:03',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (640685026293536,628245496934784,640685025892128,0,0,'2015-08-19 13:32:43',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (640685163288352,628245496934784,640685162518304,0,0,'2015-08-19 13:32:59',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (640685458609952,628245496934784,640685456906016,0,0,'2015-08-19 13:33:35',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (640686206375712,628245496934784,640686205908768,0,0,'2015-08-19 13:35:07',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (640690622248736,628245496934784,640690621429536,0,0,'2015-08-19 13:44:06',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (640693257402144,628245496934784,640693256705824,0,0,'2015-08-19 13:49:27',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (640693287065376,628245496934784,640693286549280,0,0,'2015-08-19 13:49:31',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (640695353358112,628245496934784,640695352792864,0,0,'2015-08-19 13:53:43',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (640707435222816,628245496934784,640707434460960,0,0,'2015-08-19 14:18:18',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641541664110368,637834825118080,641541663602464,0,0,'2015-08-20 18:35:33',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641541664552736,628245496934784,641541663602464,0,0,'2015-08-20 18:35:33',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641541664765728,637834825118080,641541663602464,0,0,'2015-08-20 18:35:33',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641541664929568,628245496934784,641541663602464,0,0,'2015-08-20 18:35:33',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641541665158944,637834825118080,641541663602464,0,0,'2015-08-20 18:35:33',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641541665363744,628245496934784,641541663602464,0,0,'2015-08-20 18:35:33',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641541958686496,637834825118080,641541958465312,0,0,'2015-08-20 18:36:09',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641541958842144,628245496934784,641541958465312,0,0,'2015-08-20 18:36:09',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641541959030560,637834825118080,641541958465312,0,0,'2015-08-20 18:36:09',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641541959186208,628245496934784,641541958465312,0,0,'2015-08-20 18:36:09',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641541959382816,637834825118080,641541958465312,0,0,'2015-08-20 18:36:09',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641541959530272,628245496934784,641541958465312,0,0,'2015-08-20 18:36:09',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641542046398240,637834825118080,641542046111520,0,0,'2015-08-20 18:36:19',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641542046562080,628245496934784,641542046111520,0,0,'2015-08-20 18:36:19',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641542046783264,637834825118080,641542046111520,0,0,'2015-08-20 18:36:19',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641542046996256,628245496934784,641542046111520,0,0,'2015-08-20 18:36:19',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641542047135520,637834825118080,641542046111520,0,0,'2015-08-20 18:36:20',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641542047389472,628245496934784,641542046111520,0,0,'2015-08-20 18:36:20',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641542808532768,637834825118080,641542808147744,0,0,'2015-08-20 18:37:52',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641542808655648,628245496934784,641542808147744,0,0,'2015-08-20 18:37:52',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641542809007904,637834825118080,641542808147744,0,0,'2015-08-20 18:37:53',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641542809188128,628245496934784,641542808147744,0,0,'2015-08-20 18:37:53',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641542809433888,637834825118080,641542808147744,0,0,'2015-08-20 18:37:53',NULL);
insert  into `distributor_commission`(`id`,`distributor_id`,`order_id`,`commission`,`totalCommission`,`create_time`,`status`) values (641542809614112,628245496934784,641542808147744,0,0,'2015-08-20 18:37:53',NULL);

/*Table structure for table `distributor_commission_commodity` */

DROP TABLE IF EXISTS `distributor_commission_commodity`;

CREATE TABLE `distributor_commission_commodity` (
  `id` bigint(20) NOT NULL,
  `commodity_name` varchar(32) CHARACTER SET latin1 NOT NULL,
  `commodity_count` int(11) NOT NULL DEFAULT '1',
  `commodity_commission` int(11) NOT NULL DEFAULT '0',
  `distributor_commission_id` bigint(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `distributor_commission_commodity` */

/*Table structure for table `distributor_include` */

DROP TABLE IF EXISTS `distributor_include`;

CREATE TABLE `distributor_include` (
  `id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `child_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `distributor_include` */

insert  into `distributor_include`(`id`,`parent_id`,`child_id`) values (637923441447296,628245496934784,628250401878400);
insert  into `distributor_include`(`id`,`parent_id`,`child_id`) values (637924856721792,628245496934784,637834825118080);
insert  into `distributor_include`(`id`,`parent_id`,`child_id`) values (640700951205664,628245496934784,640700950624032);

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

insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635268733686144,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635273561944448,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635273618289024,641542808147744,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635273694794112,641542808147744,631713438519680,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635274645303680,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635274708971904,641542808147744,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635274750882176,641542808147744,631713438519680,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635276090380672,635339487900032,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635276139860352,641542808147744,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635276194304384,641542808147744,631713438519680,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635276239344000,NULL,631713641304448,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635276735107456,641542808147744,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635276783833472,NULL,631713641304448,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635287452610944,635339487900032,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635287549784448,641542808147744,631713751839104,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635291336143232,635339487900032,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635293951324544,635339487900032,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635294042730880,641542808147744,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635294963380608,635339487900032,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635295069491584,641542808147744,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635295148454272,NULL,631713522045312,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635295325639040,641542808147744,631721876173184,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635296209539456,641542808147744,631766036353408,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635312365121920,641542808147744,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635312415314304,641542808147744,631713522045312,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635313797280128,641542808147744,631713438519680,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635313849250176,641542808147744,631721876173184,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635317208674688,641542808147744,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635317346283904,641542808147744,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635318762492288,641542808147744,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635320287531392,641542808147744,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635330810352000,641542808147744,631713438519680,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635339409396096,641542808147744,631713438519680,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (637968555127168,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638129401876864,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638129887293824,641542808147744,631713438519680,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638129951199616,641542808147744,631713522045312,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638130003194240,641542808147744,631713584533888,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638130056065408,641542808147744,631713641304448,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638130131554688,641542808147744,631713703694720,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638130217922944,641542808147744,631713751839104,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638130304061824,641542808147744,631713815056768,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638130369319296,NULL,631713872826752,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638131740578176,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638134636507520,638174635340160,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638138310136192,638174635340160,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638170225078656,638174635340160,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638172832346496,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638665731928448,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638741521183104,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638764474896768,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638771967103360,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638772366045568,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638772472975744,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638772967592320,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638773107503488,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638774285963648,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638781664686464,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638785214214528,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638789336224128,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638789459489152,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638830882296192,641542808147744,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638831366910336,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638831424811392,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638831490290048,641542808147744,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638831795114368,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638831836516736,641542808147744,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638832590270848,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638832886059392,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638833405071744,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638833808421248,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638834366353792,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638834738532736,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638836263604608,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638836642599296,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638836887835008,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638837114204544,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638837187555712,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638837287399808,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638837323248000,641542808147744,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638837455221120,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638837485236608,641542808147744,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638837758431616,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638838000030080,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638838112383360,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638838198219136,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638838308704640,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638838447509888,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638838548353408,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638838683668864,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638838908580224,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638839085502848,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638839353020800,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638839951987072,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638840069296512,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638840395837824,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638840727622016,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638856112615808,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638869293969792,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638869332136320,641542808147744,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638869464822144,641542808147744,631713522045312,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638872065315200,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (640665624409888,641542808147744,11111,2,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (640667333302048,641542808147744,11111,3,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (640669745821472,641542808147744,11111,3,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (640673214322464,641542808147744,11111,2,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (640673820415776,641542808147744,631713438519680,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (640680371107616,641542808147744,11111,2,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (640681153812256,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (640684863600416,641542808147744,11111,2,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (640686107399968,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (640690522502944,641542808147744,11111,3,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (640693167970080,641542808147744,11111,2,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (640695256307488,641542808147744,11111,2,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (640707333871392,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (641270692058912,641542808147744,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (641536202495776,NULL,631713438519680,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (641536260134688,NULL,638033042633088,0,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (641536764114720,NULL,631713522045312,0,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (641548926088992,NULL,631713438519680,1,1);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (641548941383456,NULL,631713522045312,1,1);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (641548955186976,NULL,631713584533888,1,1);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (641548975003424,NULL,631713703694720,1,1);

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

insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (635339487900032,628245496934784,123100,1,'2015-08-12 00:17:11');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (638134920843648,628245496934784,2400,1,'2015-08-15 23:04:31');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (638138398241152,628245496934784,2400,1,'2015-08-15 23:11:35');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (638174635340160,628250401878400,2400,1,'2015-08-16 00:25:21');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640665129178912,637750685544832,32860,1,'2015-08-19 12:52:14');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640665845356320,637750685544832,480,1,'2015-08-19 12:53:42');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640667494487840,628250021368192,720,1,'2015-08-19 12:57:03');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640669907187488,628250021368192,720,1,'2015-08-19 13:01:59');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640673345902368,628245496934784,480,1,'2015-08-19 13:08:58');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640674104923936,628245496934784,12310,1,'2015-08-19 13:10:30');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640674469508896,628245496934784,12310,1,'2015-08-19 13:11:14');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640675935139616,628245496934784,12310,1,'2015-08-19 13:14:13');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640677180864288,628245496934784,12310,1,'2015-08-19 13:16:45');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640677410617120,628245496934784,12310,1,'2015-08-19 13:17:13');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640677875562272,628245496934784,12310,1,'2015-08-19 13:18:10');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640678087972640,628245496934784,12310,1,'2015-08-19 13:18:37');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640680567273248,628245496934784,480,1,'2015-08-19 13:23:38');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640681261487904,628245496934784,240,1,'2015-08-19 13:25:03');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640685025892128,628245496934784,240,1,'2015-08-19 13:32:43');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640685162518304,628245496934784,480,1,'2015-08-19 13:32:59');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640685456906016,628245496934784,480,1,'2015-08-19 13:33:35');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640686205908768,628245496934784,240,1,'2015-08-19 13:35:07');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640690621429536,628245496934784,720,1,'2015-08-19 13:44:06');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640693256705824,628245496934784,480,1,'2015-08-19 13:49:27');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640693286549280,628245496934784,480,1,'2015-08-19 13:49:31');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640695352792864,628245496934784,480,1,'2015-08-19 13:53:43');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (640707434460960,628245496934784,240,1,'2015-08-19 14:18:18');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (641541663602464,637834825118080,357500,1,'2015-08-20 18:35:33');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (641541958465312,637834825118080,357500,1,'2015-08-20 18:36:09');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (641542046111520,637834825118080,357500,1,'2015-08-20 18:36:19');
insert  into `order_record`(`id`,`distributor_id`,`money`,`status`,`create_time`) values (641542808147744,637834825118080,357500,1,'2015-08-20 18:37:52');

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

insert  into `system_log`(`id`,`content`,`use_id`,`create_time`) values (1111111,'为\"余扬\"执行一次\"订单操作\",\"订单号\"为\"2312321\"',2323,'2015-08-16 11:11:18');
insert  into `system_log`(`id`,`content`,`use_id`,`create_time`) values (3121312,'为\"余扬\"执行一次\"订单操作\",\"订单号\"为\"2312321\"',13121,'2015-08-16 11:12:10');

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

insert  into `user`(`id`,`name`,`role`,`password`,`mobile`,`status`,`details`,`create_time`) values (638077936488830,'admin',1,'admin','13518198078',2,NULL,'2015-08-15 21:10:21');
insert  into `user`(`id`,`name`,`role`,`password`,`mobile`,`status`,`details`,`create_time`) values (638077936488832,'店小二',2,'123','13518198078',1,NULL,'2015-08-15 21:10:21');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
