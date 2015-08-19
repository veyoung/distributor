/*
SQLyog Ultimate v8.32 
MySQL - 5.6.22 : Database - distributor
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

create database `distributor`;
USE `distributor`;

/*Table structure for table `category` */

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

CREATE TABLE `distributor` (
  `id` bigint(20) NOT NULL,
  `name` varchar(15) NOT NULL,
  `level` int(11) NOT NULL COMMENT '等级：1、钻石会员，2、金牌会员，3、VIP会员',
  `balance` int(11) NOT NULL DEFAULT '0' COMMENT '账户余额',
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

/*Table structure for table `distributor_balance` */

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

/*Table structure for table `distributor_include` */

CREATE TABLE `distributor_include` (
  `id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `child_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `distributor_include` */

insert  into `distributor_include`(`id`,`parent_id`,`child_id`) values (637923441447296,628245496934784,628250401878400);
insert  into `distributor_include`(`id`,`parent_id`,`child_id`) values (637924856721792,628245496934784,637834825118080);

/*Table structure for table `order_commodity_include` */

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
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635273618289024,638782727360896,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635273694794112,638782727360896,631713438519680,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635274645303680,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635274708971904,638782727360896,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635274750882176,638782727360896,631713438519680,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635276090380672,635339487900032,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635276139860352,638782727360896,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635276194304384,638782727360896,631713438519680,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635276239344000,NULL,631713641304448,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635276735107456,638782727360896,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635276783833472,NULL,631713641304448,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635287452610944,635339487900032,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635287549784448,638782727360896,631713751839104,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635291336143232,635339487900032,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635293951324544,635339487900032,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635294042730880,638782727360896,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635294963380608,635339487900032,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635295069491584,638782727360896,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635295148454272,NULL,631713522045312,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635295325639040,638782727360896,631721876173184,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635296209539456,638782727360896,631766036353408,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635312365121920,638782727360896,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635312415314304,638782727360896,631713522045312,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635313797280128,638782727360896,631713438519680,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635313849250176,638782727360896,631721876173184,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635317208674688,638782727360896,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635317346283904,638782727360896,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635318762492288,638782727360896,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635320287531392,638782727360896,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635330810352000,638782727360896,631713438519680,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (635339409396096,638782727360896,631713438519680,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (637968555127168,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638129401876864,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638129887293824,638782727360896,631713438519680,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638129951199616,638782727360896,631713522045312,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638130003194240,638782727360896,631713584533888,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638130056065408,638782727360896,631713641304448,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638130131554688,638782727360896,631713703694720,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638130217922944,638782727360896,631713751839104,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638130304061824,638782727360896,631713815056768,1,2);
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
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638830882296192,NULL,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638831366910336,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638831424811392,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638831490290048,NULL,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638831795114368,NULL,11111,1,3);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638831836516736,NULL,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638832590270848,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638832886059392,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638833405071744,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638833808421248,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638834366353792,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638834738532736,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638836263604608,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638836642599296,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638836887835008,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638837114204544,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638837187555712,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638837287399808,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638837323248000,NULL,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638837455221120,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638837485236608,NULL,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638837758431616,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638838000030080,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638838112383360,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638838198219136,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638838308704640,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638838447509888,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638838548353408,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638838683668864,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638838908580224,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638839085502848,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638839353020800,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638839951987072,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638840069296512,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638840395837824,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638840727622016,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638856112615808,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638869293969792,NULL,11111,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638869332136320,NULL,631056900116864,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638869464822144,NULL,631713522045312,1,2);
insert  into `order_commodity_include`(`id`,`order_id`,`commodity_id`,`commodity_count`,`status`) values (638872065315200,NULL,11111,1,2);

/*Table structure for table `order_record` */

CREATE TABLE `order_record` (
  `id` bigint(20) NOT NULL,
  `distributor_id` bigint(20) NOT NULL COMMENT '所属经销商',
  `money` int(11) NOT NULL COMMENT '订单金额',
  `commission` int(11) NOT NULL COMMENT '上级分销商所获提成',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_record` */

insert  into `order_record`(`id`,`distributor_id`,`money`,`commission`,`create_time`) values (635339487900032,628245496934784,123100,0,'2015-08-12 00:17:11');
insert  into `order_record`(`id`,`distributor_id`,`money`,`commission`,`create_time`) values (638134920843648,628245496934784,2400,0,'2015-08-15 23:04:31');
insert  into `order_record`(`id`,`distributor_id`,`money`,`commission`,`create_time`) values (638138398241152,628245496934784,2400,0,'2015-08-15 23:11:35');
insert  into `order_record`(`id`,`distributor_id`,`money`,`commission`,`create_time`) values (638174635340160,628250401878400,2400,264,'2015-08-16 00:25:21');

/*Table structure for table `system_log` */

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
