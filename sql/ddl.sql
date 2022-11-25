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
  `is_checkout` varchar(255) DEFAULT NULL COMMENT '科目名称;',
  `subjectCategory` varchar(255) DEFAULT NULL COMMENT '科目分类;资产, 负债, 权益, 成本, 损益',
  `parentSubjectId` varchar(255) DEFAULT NULL COMMENT '父级科目id;',
  `balanceDirection` varchar(255) DEFAULT NULL COMMENT '余额方向;借, 贷',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT = '会计区间表';

DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` varchar(255) DEFAULT NULL COMMENT '科目编码;',
  `subjectName` varchar(255) DEFAULT NULL COMMENT '科目名称;',
  `subjectCategory` varchar(255) DEFAULT NULL COMMENT '科目分类;资产, 负债, 权益, 成本, 损益',
  `parentSubjectId` varchar(255) DEFAULT NULL COMMENT '父级科目id;',
  `balanceDirection` varchar(255) DEFAULT NULL COMMENT '余额方向;借, 贷',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT = '科目表';

DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucherId` varchar(255) DEFAULT NULL COMMENT '凭证id;',
  `voucherName` varchar(255) DEFAULT NULL COMMENT '凭证字号;',
  `subjectId` int(11) DEFAULT NULL COMMENT '科目id;',
  `voucherExplain` varchar(255) DEFAULT NULL COMMENT '凭证摘要;',
  `debtorPrice` decimal(10,2) DEFAULT NULL COMMENT '借方金额;',
  `creditPrice` decimal(10,2) DEFAULT NULL COMMENT '贷方金额;',
  `voucherCreateAt` varchar(255) DEFAULT NULL COMMENT '凭证创建日期;',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT = '凭证表';