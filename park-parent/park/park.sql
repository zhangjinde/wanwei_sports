/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 60011
Source Host           : 127.0.0.1:3306
Source Database       : park

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2016-12-10 19:04:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for good_info
-- ----------------------------
DROP TABLE IF EXISTS `good_info`;
CREATE TABLE `good_info` (
  `goodId` int(11) NOT NULL AUTO_INCREMENT,
  `goodNo` varchar(32) NOT NULL COMMENT '商品编号',
  `goodName` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `goodPic` varchar(255) DEFAULT NULL COMMENT '商品图片地址',
  `goodTypeId` int(11) DEFAULT NULL COMMENT '商品类型id',
  `goodMoneyType` varchar(1) DEFAULT NULL COMMENT '计费方式（1. 计次收费  2. 计时收费）',
  `goodPrice` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goodDiscount` varchar(16) DEFAULT NULL COMMENT '商品折扣	1：无折扣，2：会员折扣',
  `goodStatus` varchar(1) DEFAULT NULL COMMENT '商品状态	1：在售，2：预售，3：下架',
  `goodCount` int(11) DEFAULT NULL COMMENT '商品库存量',
  `goodRemark` varchar(255) DEFAULT NULL COMMENT '商品备注',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`goodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of good_info
-- ----------------------------

-- ----------------------------
-- Table structure for good_inventory_log
-- ----------------------------
DROP TABLE IF EXISTS `good_inventory_log`;
CREATE TABLE `good_inventory_log` (
  `inventoryId` int(11) NOT NULL AUTO_INCREMENT,
  `goodId` int(11) DEFAULT NULL COMMENT '商品id',
  `countChange` int(11) DEFAULT NULL COMMENT '数量变化',
  `opType` varchar(1) DEFAULT NULL COMMENT '操作类型',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`inventoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存日志';

-- ----------------------------
-- Records of good_inventory_log
-- ----------------------------

-- ----------------------------
-- Table structure for good_shopping
-- ----------------------------
DROP TABLE IF EXISTS `good_shopping`;
CREATE TABLE `good_shopping` (
  `shoppingId` int(11) NOT NULL AUTO_INCREMENT,
  `goodId` int(11) DEFAULT NULL COMMENT '商品id',
  `shoppingName` varchar(32) DEFAULT NULL COMMENT '商品名称',
  `shoppingGoodAmount` int(6) DEFAULT NULL COMMENT '商品数量',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`shoppingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
-- Records of good_shopping
-- ----------------------------

-- ----------------------------
-- Table structure for good_type
-- ----------------------------
DROP TABLE IF EXISTS `good_type`;
CREATE TABLE `good_type` (
  `goodTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品类型id',
  `goodTypeName` varchar(32) DEFAULT NULL COMMENT '类型名称',
  `goodTypeDescribe` varchar(255) DEFAULT NULL COMMENT '类型描述',
  `goodTypeStatus` varchar(1) DEFAULT NULL COMMENT '类型状态（1：有效  2：无效）',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`goodTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类型表';

-- ----------------------------
-- Records of good_type
-- ----------------------------

-- ----------------------------
-- Table structure for member_card
-- ----------------------------
DROP TABLE IF EXISTS `member_card`;
CREATE TABLE `member_card` (
  `cardId` int(11) NOT NULL AUTO_INCREMENT,
  `memberId` int(11) DEFAULT NULL COMMENT '会员id',
  `cardNo` varchar(32) DEFAULT NULL COMMENT '会员卡编号	唯一的',
  `cardBalance` decimal(10,2) DEFAULT NULL COMMENT '会员卡余额',
  `cardDeadline` varchar(32) DEFAULT NULL COMMENT '会员卡截止日期 0：无限制',
  `cardStatus` varchar(1) NOT NULL DEFAULT '1' COMMENT '1：有效，2：失效',
  `cardTypeId` int(11) NOT NULL COMMENT '会员卡类型ID',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `cardRemark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  `cardDeposit` decimal(10,2) DEFAULT NULL COMMENT '当时办卡的押金',
  PRIMARY KEY (`cardId`),
  UNIQUE KEY `cardNo_Unique` (`cardNo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='会员卡信息表';

-- ----------------------------
-- Records of member_card
-- ----------------------------
INSERT INTO `member_card` VALUES ('1', '1', '593089', '0.00', '0', '1', '2', '2016-11-21 15:35:50', null, '', '1', null);
INSERT INTO `member_card` VALUES ('5', '1', '5930891', '0.00', '0', '1', '2', '2016-11-21 15:35:50', '', '', '1', null);
INSERT INTO `member_card` VALUES ('7', '1', '5930892', '0.00', '0', '1', '2', '2016-11-21 15:35:50', '', '', '1', null);

-- ----------------------------
-- Table structure for member_card_type
-- ----------------------------
DROP TABLE IF EXISTS `member_card_type`;
CREATE TABLE `member_card_type` (
  `cardTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `cardTypeName` varchar(16) NOT NULL COMMENT '类型名称	至尊卡，金卡',
  `cardType` varchar(1) NOT NULL COMMENT '会员卡支付类型（1.预付类型   2.记账类型）',
  `cardTypeStatus` varchar(1) NOT NULL DEFAULT '1' COMMENT '类型状态	1：可用，2：锁定',
  `cardTypeMonth` varchar(32) DEFAULT NULL COMMENT '类别周期月限制（月）	0：不限制',
  `cardTypeWeek` varchar(32) DEFAULT NULL COMMENT '1-7：周一~周日',
  `cardTypeTimeStart` varchar(64) DEFAULT NULL COMMENT '类别开始时间许可',
  `cardTypeTimeEnd` varchar(64) DEFAULT NULL COMMENT '类别结束时间许可',
  `cardTypeAhead` int(11) DEFAULT NULL COMMENT '可提前预订的时间',
  `cardTypeMoney` decimal(10,2) NOT NULL COMMENT '类别价格（会费）',
  `cardTypeCredit` decimal(10,2) DEFAULT NULL COMMENT '信用额度		可以抵账的额度',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  `cardDeposit` decimal(10,2) DEFAULT NULL COMMENT '卡押金',
  `cardTypeDiscount` int(11) DEFAULT NULL COMMENT '类别折扣	0-100',
  PRIMARY KEY (`cardTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='会员卡类型表';

-- ----------------------------
-- Records of member_card_type
-- ----------------------------
INSERT INTO `member_card_type` VALUES ('1', '教师卡', '1', '1', '0', '1,2,3,4,5,6,7', '06:00', '23:00', '0', '0.00', null, null, null, null, null, '100');
INSERT INTO `member_card_type` VALUES ('2', '团体会员卡', '1', '1', '0', '1,2,3,4,5,6,7', '06:00', '23:00', '0', '0.00', null, '', '', null, null, '100');
INSERT INTO `member_card_type` VALUES ('3', '学生卡', '1', '1', '0', '1,2,3,4,5,6,7', '06:00', '23:00', '0', '0.00', null, '', '', null, null, '100');

-- ----------------------------
-- Table structure for member_receivable
-- ----------------------------
DROP TABLE IF EXISTS `member_receivable`;
CREATE TABLE `member_receivable` (
  `receivableId` int(11) NOT NULL AUTO_INCREMENT COMMENT '应收款id',
  `memberId` int(11) DEFAULT NULL COMMENT '会员id',
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`receivableId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='应收款表';

-- ----------------------------
-- Records of member_receivable
-- ----------------------------
INSERT INTO `member_receivable` VALUES ('5', '1', '7', '2016-12-03 15:00:13', null, '1');
INSERT INTO `member_receivable` VALUES ('6', '1', '8', '2016-12-03 15:05:55', null, '1');

-- ----------------------------
-- Table structure for member_site_sign
-- ----------------------------
DROP TABLE IF EXISTS `member_site_sign`;
CREATE TABLE `member_site_sign` (
  `signId` int(11) NOT NULL AUTO_INCREMENT,
  `signMemberCardNo` varchar(32) DEFAULT NULL COMMENT '签到的会员卡号',
  `signName` varchar(32) DEFAULT NULL COMMENT '签到人',
  `signMobile` varchar(16) DEFAULT NULL COMMENT '签到人手机',
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  `signType` varchar(1) DEFAULT NULL COMMENT '签到类型（1：会员  2：散客）',
  `reserveTimeId` int(11) DEFAULT NULL COMMENT '场地预定时间id（不能重复签到）',
  `signDate` varchar(20) DEFAULT NULL COMMENT '签到日期(年月日)',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`signId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='会员场地签到表';

-- ----------------------------
-- Records of member_site_sign
-- ----------------------------

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `orderDetailId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  `itemId` int(11) DEFAULT NULL COMMENT '商品id',
  `itemName` varchar(32) DEFAULT NULL COMMENT '商品名称',
  `itemPrice` decimal(10,2) DEFAULT NULL COMMENT '商品支付价格',
  `itemStartTime` varchar(20) DEFAULT NULL COMMENT '商品开始时间',
  `itemEndTime` varchar(20) DEFAULT NULL COMMENT '商品结束时间',
  `itemAmount` int(11) DEFAULT NULL COMMENT '商品数量',
  `itemRemark` text COMMENT '商品描述',
  `itemMoneyType` varchar(1) DEFAULT NULL COMMENT '当时的计费方式（1. 计次收费  2. 计时收费）',
  `itemDiscount` int(11) DEFAULT NULL COMMENT '当时的商品折扣（0-100）',
  `orderDetailStatus` varchar(1) DEFAULT NULL COMMENT '订单详情状态（1：已完成  2：未完成  3：进行中）',
  PRIMARY KEY (`orderDetailId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('10', '7', '30', '【测试场地】', null, '2016-12-3 09:00', '2016-12-3 15:00', '1', null, '2', null, '2');
INSERT INTO `order_detail` VALUES ('11', '8', '31', '【测试场地】', null, '2016-12-5 09:00', '2016-12-13 15:00', '1', null, '2', null, '2');

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(32) DEFAULT NULL COMMENT '订单号',
  `operatorId` varchar(32) DEFAULT NULL COMMENT '登录帐号',
  `memberId` int(11) DEFAULT NULL COMMENT '会员id（0为散客）',
  `orderServiceType` varchar(10) DEFAULT NULL COMMENT '订单业务类型（1. 场地   2. 商品   3.包场）',
  `orderStatus` varchar(1) DEFAULT NULL COMMENT '订单状态（1：已全部完成 2：未完成 3：已取消）',
  `payStatus` varchar(1) DEFAULT NULL COMMENT '支付状态（1：已支付  2：未支付  3：部分支付）',
  `payType` varchar(1) DEFAULT NULL COMMENT '支付类型',
  `payTime` varchar(20) DEFAULT NULL COMMENT '支付时间',
  `orderSumPrice` decimal(10,2) DEFAULT NULL COMMENT '订单应付总价',
  `paySumPrice` decimal(10,2) DEFAULT NULL COMMENT '支付总价',
  `subAmount` decimal(10,2) DEFAULT NULL COMMENT '优惠金额(元)',
  `additionalPrice` decimal(10,2) DEFAULT NULL COMMENT '附加费用',
  `checkNo` varchar(64) DEFAULT NULL COMMENT '支票号',
  `orderRemark` text COMMENT '订单描述',
  `sumCount` int(11) DEFAULT NULL COMMENT '总次数',
  `payCount` int(11) DEFAULT NULL COMMENT '支付次数',
  `useCount` int(11) DEFAULT NULL COMMENT '已使用次数',
  `orderSumCount` int(11) DEFAULT NULL COMMENT '子订单商品数量的合计数量',
  `orderDiscount` int(11) DEFAULT NULL COMMENT '当时的商品折扣（0-100）',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES ('7', '20161203145853', null, '1', '200', '2', '1', '2', '2016-12-03 15:00:13', '300.00', '200.00', '100.00', '100.00', '11111', 'èå¸æº', '6', '2', '104', null, null, '2016-12-03 14:58:53', '2016-12-03 15:00:13', '1');
INSERT INTO `order_info` VALUES ('8', '20161203150540', null, '1', '200', '2', '1', '2', '2016-12-03 15:05:55', '300.00', '200.00', '100.00', '100.00', '11111', 'èå¸æº', '54', '20', '0', null, null, '2016-12-03 15:05:40', '2016-12-03 15:05:55', '1');

-- ----------------------------
-- Table structure for other_balance
-- ----------------------------
DROP TABLE IF EXISTS `other_balance`;
CREATE TABLE `other_balance` (
  `balanceId` int(11) NOT NULL AUTO_INCREMENT,
  `balanceNo` varchar(32) NOT NULL COMMENT '流水号',
  `balanceServiceType` varchar(16) NOT NULL COMMENT '业务类型',
  `balanceServiceId` int(11) NOT NULL COMMENT '业务标识',
  `balanceServiceName` varchar(100) DEFAULT NULL COMMENT '业务项名称',
  `balanceType` varchar(1) DEFAULT NULL COMMENT '类型 1：充值  2：消费  3：其他',
  `balanceStyle` varchar(1) DEFAULT NULL COMMENT '支付方式 1：现金  2：支付宝  3：微信',
  `oldAmount` decimal(10,2) DEFAULT NULL COMMENT '原始金额（充值金额|升级金额|补办金额）',
  `realAmount` decimal(10,2) DEFAULT NULL COMMENT '实际价格（最终支付金额）',
  `subAmount` decimal(10,2) DEFAULT NULL COMMENT '优惠金额',
  `givingAmount` decimal(10,2) DEFAULT NULL COMMENT '赠送金额',
  `divBalance` decimal(10,2) DEFAULT '0.00' COMMENT '剩余未付金额',
  `balanceStatus` varchar(1) DEFAULT NULL COMMENT '订单状态 (充值)1：已收全款  2：未付款  3：部分收款  (消费)1：已支付  2：未支付',
  `serviceDate` varchar(20) DEFAULT NULL COMMENT '业务日期',
  `changeAmount` decimal(10,0) DEFAULT NULL COMMENT '金额变化',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`balanceId`),
  UNIQUE KEY `balanceNo_Unique` (`balanceNo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='收支流水表';

-- ----------------------------
-- Records of other_balance
-- ----------------------------
INSERT INTO `other_balance` VALUES ('1', '20161121153550', '10', '1', null, '3', '1', '1000.00', '10001.00', '0.00', '0.00', null, '1', '2016-11-21 15:35:50', null, '2016-11-21 15:35:50', null, '2', null);
INSERT INTO `other_balance` VALUES ('2', '20161203121933', '100', '5', null, '3', '1', '250.00', '250.00', '0.00', null, null, '1', '2016-12-03 12:19:33', null, '2016-12-03 12:19:33', null, '1', null);
INSERT INTO `other_balance` VALUES ('3', '20161203150013', '200', '7', null, '3', '2', '300.00', '200.00', '100.00', null, null, '1', '2016-12-03 15:00:13', null, '2016-12-03 15:00:13', null, '1', null);
INSERT INTO `other_balance` VALUES ('4', '20161203150555', '200', '8', null, '3', '3', '300.00', '200.00', '100.00', null, null, '1', '2016-12-03 15:05:55', null, '2016-12-03 15:05:55', null, '1', null);
INSERT INTO `other_balance` VALUES ('5', '20161121153551', '10', '1', '', '3', '1', '1000.00', '800.00', '0.00', '0.00', null, '1', '2016-11-21 15:35:50', null, '2016-11-21 15:35:50', '', '2', '');

-- ----------------------------
-- Table structure for other_invoice
-- ----------------------------
DROP TABLE IF EXISTS `other_invoice`;
CREATE TABLE `other_invoice` (
  `invoiceId` int(11) NOT NULL AUTO_INCREMENT,
  `invoiceNo` varchar(32) DEFAULT NULL COMMENT '流水号（和订单流水相同）',
  `invoiceServiceType` varchar(16) NOT NULL COMMENT '发票业务类型',
  `invoiceServiceId` int(11) NOT NULL COMMENT '发票业务标识',
  `invoiceHeader` varchar(100) DEFAULT NULL COMMENT '发票抬头	公司或者个人名称',
  `invoiceContent` text COMMENT '发票内容',
  `invoiceMoney` decimal(10,2) DEFAULT NULL COMMENT '发票金额',
  `invoiceRemark` varchar(255) DEFAULT NULL COMMENT '发票内容备注',
  `invoiceState` varchar(1) DEFAULT NULL COMMENT '领取状态	1：已领取，2：未领取',
  `createTime` varchar(20) DEFAULT NULL COMMENT '登记时间',
  `printTime` varchar(20) DEFAULT NULL COMMENT '打印时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`invoiceId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='发票登记表';

-- ----------------------------
-- Records of other_invoice
-- ----------------------------
INSERT INTO `other_invoice` VALUES ('1', '20161121153550', '10', '1', null, null, null, null, '2', '2016-11-21 15:35:50', null, '2');

-- ----------------------------
-- Table structure for other_resource
-- ----------------------------
DROP TABLE IF EXISTS `other_resource`;
CREATE TABLE `other_resource` (
  `resourceId` bigint(20) NOT NULL AUTO_INCREMENT,
  `resourceServiceId` int(9) NOT NULL,
  `resourceServiceType` varchar(16) NOT NULL,
  `resourceSeq` int(9) DEFAULT NULL,
  `resourceType` varchar(16) DEFAULT NULL,
  `resourceName` varchar(64) DEFAULT NULL,
  `resourceOriginal` varchar(64) DEFAULT NULL,
  `resourcePath` text,
  `fileSize` int(9) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`resourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of other_resource
-- ----------------------------

-- ----------------------------
-- Table structure for park_business
-- ----------------------------
DROP TABLE IF EXISTS `park_business`;
CREATE TABLE `park_business` (
  `businessId` int(11) NOT NULL AUTO_INCREMENT,
  `businessStartTime` varchar(20) DEFAULT NULL COMMENT '营业开始时间',
  `businessEndTime` varchar(20) DEFAULT NULL COMMENT '营业结束时间',
  `businessTimePeriod` varchar(20) DEFAULT NULL COMMENT '营业时间段',
  `businessName` varchar(255) DEFAULT NULL COMMENT '场馆名称',
  `businessAreaName` varchar(512) DEFAULT NULL COMMENT '所在省市',
  `businessContact` varchar(32) DEFAULT NULL COMMENT '联系人',
  `businessPhone` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `businessAddress` varchar(1024) DEFAULT NULL COMMENT '详细地址',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  `points` int(11) DEFAULT NULL COMMENT '安装点数（限制能创建几个员工）',
  PRIMARY KEY (`businessId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='场馆表';

-- ----------------------------
-- Records of park_business
-- ----------------------------
INSERT INTO `park_business` VALUES ('1', '09:00', '19:00', null, '万维场馆', null, null, null, null, '2016-11-21 11:33:03', null, null, '0');

-- ----------------------------
-- Table structure for park_business_period
-- ----------------------------
DROP TABLE IF EXISTS `park_business_period`;
CREATE TABLE `park_business_period` (
  `businessPeriodId` int(11) NOT NULL AUTO_INCREMENT,
  `businessId` int(11) DEFAULT NULL COMMENT '营业时间id',
  `periodStartTime` varchar(20) DEFAULT NULL COMMENT '时间段开始时间',
  `periodEndTime` varchar(20) DEFAULT NULL COMMENT '时间段结束时间',
  PRIMARY KEY (`businessPeriodId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='营业时间段表';

-- ----------------------------
-- Records of park_business_period
-- ----------------------------
INSERT INTO `park_business_period` VALUES ('1', '1', '08:00', '09:00');
INSERT INTO `park_business_period` VALUES ('2', '1', '09:00', '10:00');
INSERT INTO `park_business_period` VALUES ('3', '1', '11:00', '12:00');
INSERT INTO `park_business_period` VALUES ('4', '1', '12:00', '13:00');

-- ----------------------------
-- Table structure for site_info
-- ----------------------------
DROP TABLE IF EXISTS `site_info`;
CREATE TABLE `site_info` (
  `siteId` int(11) NOT NULL AUTO_INCREMENT COMMENT '场地id',
  `siteName` varchar(32) DEFAULT NULL COMMENT '场地名称',
  `siteNo` varchar(32) DEFAULT NULL COMMENT '场地编号	标注唯一',
  `siteRemark` varchar(255) DEFAULT NULL COMMENT '场地备注',
  `siteType` int(11) DEFAULT NULL COMMENT '场地类型ID',
  `siteStatus` varchar(1) DEFAULT NULL COMMENT '场地状态   1：开放   2：关闭',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`siteId`),
  UNIQUE KEY `siteNo_Unique` (`siteNo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='场地表';

-- ----------------------------
-- Records of site_info
-- ----------------------------
INSERT INTO `site_info` VALUES ('1', '万维场地', '656047', '', '1', '1', '2016-11-21 11:35:03', null, '1');

-- ----------------------------
-- Table structure for site_meal_info
-- ----------------------------
DROP TABLE IF EXISTS `site_meal_info`;
CREATE TABLE `site_meal_info` (
  `mealId` int(11) NOT NULL AUTO_INCREMENT,
  `mealType` varchar(32) DEFAULT NULL COMMENT '订餐类型（现在就一种）',
  `mealCount` int(11) DEFAULT NULL COMMENT '点餐份数',
  `mealDate` varchar(20) DEFAULT NULL COMMENT '点餐时间(与场地时间表有关系)',
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  `memberId` int(11) DEFAULT NULL COMMENT '会员老师id',
  `mealOpName` varchar(32) DEFAULT NULL COMMENT '订餐人',
  `mealOpMobile` varchar(16) DEFAULT NULL COMMENT '订餐手机号',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`mealId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='点餐信息';

-- ----------------------------
-- Records of site_meal_info
-- ----------------------------

-- ----------------------------
-- Table structure for site_order
-- ----------------------------
DROP TABLE IF EXISTS `site_order`;
CREATE TABLE `site_order` (
  `orderId` int(11) NOT NULL,
  `orderNo` varchar(32) NOT NULL COMMENT '订单编号',
  `orderStatus` varchar(1) DEFAULT NULL COMMENT '订单状态',
  `siteId` int(11) DEFAULT NULL COMMENT '预订的场地编号',
  `orderDate` varchar(20) DEFAULT NULL COMMENT '订单日期',
  `startTime` varchar(20) DEFAULT NULL COMMENT '开始时间',
  `endTime` varchar(20) DEFAULT NULL COMMENT '结束时间',
  `operatorId` varchar(32) DEFAULT NULL COMMENT '用户帐号',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of site_order
-- ----------------------------

-- ----------------------------
-- Table structure for site_reserve_basic
-- ----------------------------
DROP TABLE IF EXISTS `site_reserve_basic`;
CREATE TABLE `site_reserve_basic` (
  `siteReserveId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '预订者姓名',
  `mobile` varchar(11) DEFAULT NULL COMMENT '预订者手机号',
  `opType` varchar(1) DEFAULT NULL COMMENT '预定者身份（1：会员  2：散客）',
  `siteReserveStatus` varchar(1) DEFAULT NULL COMMENT '场地当前状态（1.已付款  2.未付款   3.已锁定   4.不可预订  5.可预订）',
  `reserveType` varchar(1) DEFAULT NULL COMMENT '预定类型（1：PC  2：手机网页  3：打电话）',
  `reserveModel` varchar(1) DEFAULT NULL COMMENT '预定模式（1：普通  2：批量）',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  `memberId` int(11) DEFAULT NULL COMMENT '会员id',
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`siteReserveId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='场地序列图表';

-- ----------------------------
-- Records of site_reserve_basic
-- ----------------------------
INSERT INTO `site_reserve_basic` VALUES ('21', '团体', '13111111111', '1', '1', null, null, '2016-12-03 14:58:53', null, '1', '1', '7');
INSERT INTO `site_reserve_basic` VALUES ('22', '团体', '13111111111', '1', '1', null, null, '2016-12-03 15:05:40', null, '1', '1', '8');

-- ----------------------------
-- Table structure for site_reserve_date
-- ----------------------------
DROP TABLE IF EXISTS `site_reserve_date`;
CREATE TABLE `site_reserve_date` (
  `reserveDateId` int(11) NOT NULL AUTO_INCREMENT,
  `siteReserveId` int(11) DEFAULT NULL COMMENT '基础表id',
  `reserveStartDate` varchar(20) DEFAULT NULL COMMENT '预定开始日期',
  `reserveEndDate` varchar(20) DEFAULT NULL COMMENT '预定结束日期',
  `reserveWeek` varchar(20) DEFAULT NULL COMMENT '预定时间范围内的哪些周（多个逗号分隔）',
  PRIMARY KEY (`reserveDateId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='场地预定日期表';

-- ----------------------------
-- Records of site_reserve_date
-- ----------------------------
INSERT INTO `site_reserve_date` VALUES ('21', '21', '2016-12-2', '2016-12-5', '1,2,3,4,5,6,7');
INSERT INTO `site_reserve_date` VALUES ('22', '22', '2016-12-3', '2016-12-13', '1,2,3,4,5,6,7');

-- ----------------------------
-- Table structure for site_reserve_time
-- ----------------------------
DROP TABLE IF EXISTS `site_reserve_time`;
CREATE TABLE `site_reserve_time` (
  `reserveTimeId` int(11) NOT NULL AUTO_INCREMENT,
  `reserveDateId` int(11) DEFAULT NULL COMMENT '预定日期id',
  `siteId` int(11) DEFAULT NULL COMMENT '场地id',
  `siteStartTime` varchar(20) DEFAULT NULL COMMENT '开始时间',
  `siteEndTime` varchar(20) DEFAULT NULL COMMENT '结束时间',
  `isUse` varchar(1) DEFAULT '2' COMMENT '使用情况（1：已使用  2：未使用）',
  PRIMARY KEY (`reserveTimeId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='场地预定时间表';

-- ----------------------------
-- Records of site_reserve_time
-- ----------------------------
INSERT INTO `site_reserve_time` VALUES ('30', '21', '1', '09:00', '18:00', '2');
INSERT INTO `site_reserve_time` VALUES ('31', '22', '1', '16:00', '17:00', '2');

-- ----------------------------
-- Table structure for site_sport
-- ----------------------------
DROP TABLE IF EXISTS `site_sport`;
CREATE TABLE `site_sport` (
  `sportId` int(11) NOT NULL AUTO_INCREMENT COMMENT '场地类型id',
  `sportName` varchar(32) DEFAULT NULL COMMENT '类型名称	羽毛球场，篮球场。。。',
  `sportMoney` decimal(10,2) DEFAULT NULL COMMENT '类型价格，单价	元',
  `sportDeposit` decimal(10,2) DEFAULT NULL COMMENT '类型预订押金	元',
  `startTime` varchar(20) DEFAULT NULL COMMENT '开始时间',
  `endTime` varchar(20) DEFAULT NULL COMMENT '结束时间',
  `sportStatus` varchar(1) DEFAULT NULL COMMENT '场地类型状态  1：开放   2：关闭',
  `sportCustom` varchar(1) DEFAULT NULL COMMENT '可细化时间设置单价（1：是   2：否）',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`sportId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='场地类型表';

-- ----------------------------
-- Records of site_sport
-- ----------------------------
INSERT INTO `site_sport` VALUES ('1', '测试场地', '50.00', '100.00', '06:00', '23:00', '1', null, '2016-11-21 11:34:49', null, '1');

-- ----------------------------
-- Table structure for system_dict
-- ----------------------------
DROP TABLE IF EXISTS `system_dict`;
CREATE TABLE `system_dict` (
  `dictId` int(9) NOT NULL AUTO_INCREMENT,
  `parentDictId` int(9) DEFAULT NULL,
  `dictName` varchar(32) NOT NULL,
  `dictKey` varchar(16) NOT NULL,
  `dictValue` varchar(32) NOT NULL,
  `dictAdditional` text,
  PRIMARY KEY (`dictId`),
  KEY `AK_Key_2` (`dictName`,`dictKey`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_dict
-- ----------------------------
INSERT INTO `system_dict` VALUES ('1', null, 'BALANCE_SERVICE_TYPE', '10', '注册会员', null);
INSERT INTO `system_dict` VALUES ('2', null, 'BALANCE_SERVICE_TYPE', '11', '会员充值', null);
INSERT INTO `system_dict` VALUES ('3', null, 'BALANCE_SERVICE_TYPE', '12', '升级会员卡', null);
INSERT INTO `system_dict` VALUES ('4', null, 'BALANCE_SERVICE_TYPE', '13', '补办会员卡', null);
INSERT INTO `system_dict` VALUES ('20', null, 'BALANCE_STATUS', '1', '已付全款', null);
INSERT INTO `system_dict` VALUES ('21', null, 'BALANCE_STATUS', '2', '未付款', null);
INSERT INTO `system_dict` VALUES ('22', null, 'BALANCE_STATUS', '3', '部分付款', null);
INSERT INTO `system_dict` VALUES ('30', null, 'STATUS', '1', '有效', null);
INSERT INTO `system_dict` VALUES ('31', null, 'STATUS', '2', '无效', null);
INSERT INTO `system_dict` VALUES ('40', null, 'SEX', '1', '男', null);
INSERT INTO `system_dict` VALUES ('41', null, 'SEX', '2', '女', null);
INSERT INTO `system_dict` VALUES ('50', null, 'BALANCE_STYLE', '1', '现金', null);
INSERT INTO `system_dict` VALUES ('51', null, 'BALANCE_STYLE', '2', '支付宝', null);
INSERT INTO `system_dict` VALUES ('52', null, 'BALANCE_STYLE', '3', '微信', null);
INSERT INTO `system_dict` VALUES ('53', null, 'BALANCE_STYLE', '4', '银联', null);
INSERT INTO `system_dict` VALUES ('54', null, 'BALANCE_STYLE', '5', '支票', null);
INSERT INTO `system_dict` VALUES ('55', null, 'BALANCE_SERVICE_TYPE', '20', '教师补办会员卡', null);
INSERT INTO `system_dict` VALUES ('56', null, 'BALANCE_SERVICE_TYPE', '30', '学生补办会员卡', null);
INSERT INTO `system_dict` VALUES ('57', null, 'BALANCE_SERVICE_TYPE', '100', '场地预订', null);
INSERT INTO `system_dict` VALUES ('58', null, 'BALANCE_SERVICE_TYPE', '200', '包场预订', null);
INSERT INTO `system_dict` VALUES ('59', null, 'BALANCE_SERVICE_TYPE', '220', '应收款', null);
INSERT INTO `system_dict` VALUES ('60', null, 'BALANCE_SERVICE_TYPE', '300', '商品消费', null);
INSERT INTO `system_dict` VALUES ('61', null, 'INVENTORY_OP_TYPE', '1', '新加', null);
INSERT INTO `system_dict` VALUES ('62', null, 'INVENTORY_OP_TYPE', '2', '入库', null);
INSERT INTO `system_dict` VALUES ('63', null, 'INVENTORY_OP_TYPE', '3', '销售', null);

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单标识',
  `parentMenuId` int(11) DEFAULT NULL COMMENT '父菜单标识',
  `menuName` varchar(32) NOT NULL COMMENT '菜单名称',
  `menuCode` varchar(32) DEFAULT NULL COMMENT '菜单代码',
  `menuURL` text NOT NULL COMMENT '菜单链接',
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES ('1', '0', '会员管理', null, '');
INSERT INTO `system_menu` VALUES ('2', '1', '新会员办理', null, '');
INSERT INTO `system_menu` VALUES ('3', '1', '会员查询', null, '');
INSERT INTO `system_menu` VALUES ('4', '1', '会员卡充值', null, '');
INSERT INTO `system_menu` VALUES ('5', '1', '会员卡升级', null, '');
INSERT INTO `system_menu` VALUES ('6', '1', '会员卡补办', null, '');
INSERT INTO `system_menu` VALUES ('7', '1', '应收款管理', null, '');
INSERT INTO `system_menu` VALUES ('8', '1', '发票登记查询', null, '');
INSERT INTO `system_menu` VALUES ('9', '1', '会员类型设置', null, '');
INSERT INTO `system_menu` VALUES ('10', '0', '预定管理', null, '');
INSERT INTO `system_menu` VALUES ('11', '10', '场地预定', null, '');
INSERT INTO `system_menu` VALUES ('12', '10', '批量预定', null, '');
INSERT INTO `system_menu` VALUES ('13', '10', '批量预定订单查询', null, '');
INSERT INTO `system_menu` VALUES ('14', '10', '场地热点分析', null, '');
INSERT INTO `system_menu` VALUES ('15', '10', '场地设置', null, '');
INSERT INTO `system_menu` VALUES ('16', '10', '场地类型设置', null, '');
INSERT INTO `system_menu` VALUES ('17', '0', '商品管理', null, '');
INSERT INTO `system_menu` VALUES ('18', '17', '商品设置', null, '');
INSERT INTO `system_menu` VALUES ('19', '17', '进销存管理', null, '');
INSERT INTO `system_menu` VALUES ('20', '17', '商品销售', null, '');
INSERT INTO `system_menu` VALUES ('21', '17', '库存明细日志', null, '');
INSERT INTO `system_menu` VALUES ('22', '0', '数据统计', null, '');
INSERT INTO `system_menu` VALUES ('23', '22', '会员办理统计', null, '');
INSERT INTO `system_menu` VALUES ('24', '22', '营业收支统计', null, '');
INSERT INTO `system_menu` VALUES ('25', '22', '场地使用率', null, '');
INSERT INTO `system_menu` VALUES ('26', '22', '签到记录', null, '');
INSERT INTO `system_menu` VALUES ('27', '0', '系统设置', null, '');
INSERT INTO `system_menu` VALUES ('28', '27', '基础设置', null, '');
INSERT INTO `system_menu` VALUES ('29', '27', '员工信息设置', null, '');
INSERT INTO `system_menu` VALUES ('30', '27', '员工权限设置', null, '');
INSERT INTO `system_menu` VALUES ('31', '27', '通知管理', null, '');
INSERT INTO `system_menu` VALUES ('32', '27', '数据库操作', null, '');
INSERT INTO `system_menu` VALUES ('33', '27', '系统日志', null, '');

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色标识',
  `roleName` varchar(32) NOT NULL COMMENT '角色名称',
  `roleStatus` varchar(16) NOT NULL COMMENT '角色状态',
  `readOnly` varchar(16) NOT NULL COMMENT '只读',
  `roleDescribe` varchar(255) DEFAULT NULL COMMENT '角色说明',
  `roleLevel` int(11) DEFAULT NULL COMMENT '显示优先级',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES ('1', '超级管理员', '1', '1', null, null, '2016-10-13 10:00:00', null, null);
INSERT INTO `system_role` VALUES ('2', '会员', '1', '1', null, null, '2016-10-13 10:00:00', null, null);
INSERT INTO `system_role` VALUES ('3', '普通用户', '1', '1', null, null, '2016-10-13 10:00:00', null, null);

-- ----------------------------
-- Table structure for system_role_function
-- ----------------------------
DROP TABLE IF EXISTS `system_role_function`;
CREATE TABLE `system_role_function` (
  `roleId` int(11) NOT NULL COMMENT '角色标识',
  `functionId` varchar(16) NOT NULL COMMENT '功能标识',
  PRIMARY KEY (`roleId`,`functionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色功能';

-- ----------------------------
-- Records of system_role_function
-- ----------------------------

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu`;
CREATE TABLE `system_role_menu` (
  `roleId` int(11) NOT NULL COMMENT '角色标识',
  `menuId` int(11) NOT NULL COMMENT '菜单标识',
  PRIMARY KEY (`roleId`,`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限菜单';

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for system_role_operator
-- ----------------------------
DROP TABLE IF EXISTS `system_role_operator`;
CREATE TABLE `system_role_operator` (
  `roleId` int(11) NOT NULL COMMENT '角色标识',
  `operatorId` varchar(64) NOT NULL COMMENT '登录账号标识',
  PRIMARY KEY (`roleId`,`operatorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of system_role_operator
-- ----------------------------
INSERT INTO `system_role_operator` VALUES ('1', 'admin');
INSERT INTO `system_role_operator` VALUES ('2', '593089');

-- ----------------------------
-- Table structure for user_member
-- ----------------------------
DROP TABLE IF EXISTS `user_member`;
CREATE TABLE `user_member` (
  `memberId` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `operationId` varchar(32) DEFAULT NULL COMMENT '用户帐号',
  `parentMemberId` int(11) DEFAULT NULL COMMENT '父会员id',
  `memberName` varchar(16) DEFAULT NULL COMMENT '会员名称	汉字',
  `memberType` varchar(1) DEFAULT '1' COMMENT '支付类型 1.预付类型   2.记账类型',
  `memberMobile` varchar(16) DEFAULT NULL COMMENT '会员手机号	11位手机号',
  `memberMobile2` varchar(16) DEFAULT NULL COMMENT '会员备用手机号',
  `memberSex` varchar(1) DEFAULT '1' COMMENT '会员性别	1：男，2：女',
  `memberIdcard` varchar(22) DEFAULT NULL COMMENT '会员身份证号	18位身份证号',
  `memberBirthday` varchar(11) DEFAULT NULL COMMENT '会员生日',
  `memberPayPassword` varchar(32) DEFAULT NULL COMMENT '支付密码',
  `memberStatus` varchar(1) DEFAULT '1' COMMENT '会员状态	1：有效，2：锁定',
  `memberAddress` varchar(255) DEFAULT NULL COMMENT '会员联系地址',
  `memberRemark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  `tempCardNo` varchar(32) DEFAULT NULL COMMENT '临时会员卡号（第一次注册未绑卡使用）',
  PRIMARY KEY (`memberId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会员信息表';

-- ----------------------------
-- Records of user_member
-- ----------------------------
INSERT INTO `user_member` VALUES ('1', '593089', null, '团体', '1', '13111111111', null, '1', '510603199007307988', '2016-11-21', null, null, '额外we额外', '第三方', '2016-11-21 14:25:42', null, '2', null);
INSERT INTO `user_member` VALUES ('3', null, '1', '李思', null, '13000000012', null, null, null, null, null, null, null, null, '2016-11-21 15:23:11', '2016-11-21 15:23:11', null, null);
INSERT INTO `user_member` VALUES ('4', null, '1', '王武', null, '13000000013', null, null, null, null, null, null, null, null, '2016-11-21 15:23:22', '2016-11-21 15:23:22', null, null);

-- ----------------------------
-- Table structure for user_notifications
-- ----------------------------
DROP TABLE IF EXISTS `user_notifications`;
CREATE TABLE `user_notifications` (
  `noteId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `noteTitle` varchar(200) DEFAULT NULL COMMENT '通知标题',
  `noteContent` text COMMENT '通知内容',
  `noteSender` int(11) DEFAULT NULL COMMENT '通知发送人',
  `noteReceiver` int(11) DEFAULT NULL COMMENT '通知接收人',
  `noteAttachments` text COMMENT '通知附件',
  `noteStatus` varchar(1) DEFAULT NULL COMMENT '通知状态；1，未读；2，已读；3，未发送',
  `noteCreateTime` varchar(20) DEFAULT NULL COMMENT '通知创建时间',
  `noteReadTime` varchar(20) DEFAULT NULL COMMENT '通知阅读时间',
  `noteUpdateTime` varchar(20) DEFAULT NULL COMMENT '通知更新时间',
  PRIMARY KEY (`noteId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_notifications
-- ----------------------------
INSERT INTO `user_notifications` VALUES ('1', '关于2016年场馆建设意见', '关于2016年场馆建设意见关于2016年场馆建设意见关于2016年场馆建设意见关于2016年场馆建设意见关于2016年场馆建设意见', '13', '14', null, '2', '2016-11-22 00:41:23', null, null);
INSERT INTO `user_notifications` VALUES ('2', '关于2016年场馆建设意见', '关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见。', '13', null, null, '3', '2016-11-22 00:57:23', null, null);
INSERT INTO `user_notifications` VALUES ('3', '关于2016年场馆建设意见', '关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见。关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见。关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见。关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见。', '13', '15', null, '1', '2016-11-22 01:10:23', '2016-11-22 01:11:23', null);

-- ----------------------------
-- Table structure for user_operator
-- ----------------------------
DROP TABLE IF EXISTS `user_operator`;
CREATE TABLE `user_operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operatorId` varchar(32) NOT NULL COMMENT '登录帐号',
  `operatorName` varchar(32) DEFAULT NULL COMMENT '用户名称',
  `operatorPwd` varchar(32) DEFAULT NULL COMMENT '登录密码',
  `operatorMobile` varchar(16) DEFAULT NULL COMMENT '用户手机号',
  `status` varchar(1) DEFAULT '1' COMMENT '状态 1：有效   2：锁定',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `lastLoginTime` varchar(20) DEFAULT NULL COMMENT '最后一次登录时间',
  `operatorNo` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `operatorEffectDate` varchar(20) DEFAULT NULL COMMENT '生效日期',
  `operatorEndDate` varchar(20) DEFAULT NULL COMMENT '截止日期',
  `operatorBirthday` varchar(20) DEFAULT NULL COMMENT '用户生日',
  `operatorContact` varchar(32) DEFAULT NULL COMMENT '联系人',
  `operatorAddress` varchar(512) DEFAULT NULL COMMENT '用户联系地址',
  `operatorSex` varchar(1) DEFAULT NULL COMMENT '用户性别（1：男  2：女）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `operatorId_Unique` (`operatorId`),
  KEY `operatorId_Normal` (`operatorId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='登录用户表';

-- ----------------------------
-- Records of user_operator
-- ----------------------------
INSERT INTO `user_operator` VALUES ('1', 'admin', null, 'a123456', null, '1', '2016-11-21 11:33:03', null, '2016-12-10 17:25:42', '1', null, null, null, null, null, null);
INSERT INTO `user_operator` VALUES ('3', '593089', '团体', '123456', '13111111111', '1', '2016-11-21 14:25:43', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for user_operator_card
-- ----------------------------
DROP TABLE IF EXISTS `user_operator_card`;
CREATE TABLE `user_operator_card` (
  `operatorId` varchar(32) NOT NULL COMMENT '登录帐号',
  `cardNo` varchar(32) DEFAULT NULL COMMENT '会员卡编号	唯一的',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`operatorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员卡绑定多个用户';

-- ----------------------------
-- Records of user_operator_card
-- ----------------------------

-- ----------------------------
-- Table structure for user_scheduling
-- ----------------------------
DROP TABLE IF EXISTS `user_scheduling`;
CREATE TABLE `user_scheduling` (
  `schedulingId` int(11) NOT NULL AUTO_INCREMENT,
  `operatorId` varchar(32) DEFAULT NULL COMMENT '登录帐号',
  `date` varchar(20) DEFAULT NULL COMMENT '排班日期',
  `startTime` varchar(20) DEFAULT NULL COMMENT '开始时间',
  `endTime` varchar(20) DEFAULT NULL COMMENT '结束时间',
  `schedulingJob` varchar(255) DEFAULT NULL COMMENT '工作内容',
  `createTime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `salesId` int(11) DEFAULT NULL COMMENT '销售员ID',
  PRIMARY KEY (`schedulingId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='排班表';

-- ----------------------------
-- Records of user_scheduling
-- ----------------------------
