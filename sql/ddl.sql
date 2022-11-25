-- period: 会计区间表
-- subject: 科目表; 科目分类、余额方向
    -- subject_balance: 科目-期余额
-- voucher: 凭证表; 
    -- voucher_entry: 凭证条目====》科目ID、借方金额、贷方金额
-- profit: 资产负债配置
    -- profit_formula: 资产负债计算规则

DROP TABLE IF EXISTS `period`;
CREATE TABLE `period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `periodId` varchar(255) DEFAULT NULL COMMENT '会计区间Id; 月份维度 E.g: 2023-03',
  `isCheckout` varchar(255) DEFAULT NULL COMMENT '是否结算;',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT = '会计区间表';

DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` varchar(255) DEFAULT NULL COMMENT '科目编码; 资产类 11001++, 负债类12001++..',
  `subjectName` varchar(255) DEFAULT NULL COMMENT '科目名称;',
  `subjectCategory` varchar(255) DEFAULT NULL COMMENT '科目分类;资产, 负债, 权益, 成本, 损益',
  `subjectBalanceDirection` varchar(4) NOT NULL COMMENT '科目余额方向; 借、贷',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT = '科目表';

DROP TABLE IF EXISTS `subject_balance`;
CREATE TABLE `subject_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `periodId` varchar(255) DEFAULT NULL COMMENT '会计区间; E.g: 2023-03',
  `subjectId` varchar(255) DEFAULT NULL COMMENT '科目编码;',
  `debit` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '借方余额',
  `credit` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '贷方余额',
  `occurDebit` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '借方发生额',
  `occurCredit` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '贷方发生额',
  `occurAmount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '实际损益发生额;（年中账套）',
  `isPeriodStart` varchar(255) NOT NULL DEFAULT '否' COMMENT '是否期初',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT = '科目余额表-会计区间维度';

-- voucher: 凭证表; 
    -- voucher_entry: 凭证条目====》科目ID、借方金额、贷方金额
DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucherName` varchar(255) DEFAULT NULL COMMENT '凭证字; 记2022',
  `voucherNumber` int(11) DEFAULT NULL COMMENT '凭证号; 1001',
  `voucherId` varchar(255) DEFAULT NULL COMMENT '凭证Id; voucherName + voucherNumber',
  `periodId` varchar(255) DEFAULT NULL COMMENT '会计区间; E.g: 2023-03',
  `voucherCreator` varchar(255) DEFAULT NULL DEFAULT '' COMMENT '制单人',
  `voucherAccountant` varchar(255) DEFAULT NULL DEFAULT '' COMMENT '记账人',
  `voucherAudit` varchar(255) DEFAULT NULL DEFAULT '' COMMENT '审核人; 预留字段',
  `voucherCreateAt` varchar(255) DEFAULT NULL COMMENT '凭证创建时间; E.g: 2021-05-28T10:24:54+08:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT = '凭证表';

DROP TABLE IF EXISTS `voucher_entry`;
CREATE TABLE `voucher_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucherId` varchar(255) DEFAULT NULL COMMENT '凭证Id;',
  `entryAbstract` varchar(255) NOT NULL COMMENT '摘要',
  `debit` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '借方金额',
  `credit` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '贷方金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT = '凭证条目表';


DROP TABLE IF EXISTS `voucher_entry`;
CREATE TABLE `voucher_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucherId` varchar(255) DEFAULT NULL COMMENT '凭证Id;',
  `entryAbstract` varchar(255) NOT NULL COMMENT '摘要',
  `debit` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '借方金额',
  `credit` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '贷方金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT = '凭证条目表';

-- profit: 资产负债配置 ===> 我们这里 不做这张表, 直接把 所有的 subject.class = 资产 查出来当作 profit
    -- profit_formula: 资产负债计算规则

DROP TABLE IF EXISTS `profit_formula`;
CREATE TABLE `profit_formula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` varchar(255) DEFAULT NULL COMMENT '科目编码;',
  `countDirection` tinyint(1) NOT NULL COMMENT '运算符号; +、-',
  `accessRule` varchar(20) NOT NULL DEFAULT '' COMMENT '取数规则; 余额、借方余额、贷房余额、科目借方余额、科目贷方余额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT = '资产负债计算规则';    
