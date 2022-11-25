CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` varchar(255) DEFAULT NULL COMMENT '科目编码;',
  `subjectName` varchar(255) DEFAULT NULL COMMENT '科目名称;',
  `subjectCategory` varchar(255) DEFAULT NULL COMMENT '科目分类;资产, 负债, 权益, 成本, 损益',
  `parentSubjectId` varchar(255) DEFAULT NULL COMMENT '父级科目id;',
  `balanceDirection` varchar(255) DEFAULT NULL COMMENT '余额方向;借, 贷',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT = '科目表';


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