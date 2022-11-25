 -- 资产负债表
 -- a_balance_sheet  balance_sheet_formula_1
 select 
    id,
    item,
    item_str,
    `row`,
    `level`,
    count,
    direction,
    SUM(if(direction = subject_direction, period_end, -period_end)) period_end,
    SUM(if(direction = subject_direction, year_start, -year_start)) year_start
from (
    select 
        bs.id,
        bs.item,
        concat('<span style="padding-left:', 20*bs.level + 5, 'px">', bs.item, '</span>') item_str,
        bs.row,
        bs.level,
        bs.count,
        bs.direction,
        ast.direction subject_direction,
        (
            select
                CASE
                    when bsf.access_rule = '余额' and ast.direction = '借' then SUM(debit - credit + occur_debit - occur_credit)
                    when bsf.access_rule = '余额' and ast.direction = '贷' then SUM(credit - debit + occur_credit - occur_debit)
                    when bsf.access_rule = '借方余额' and ast.direction = '借' then SUM(debit + occur_debit - occur_credit)
                    when bsf.access_rule = '借方余额' and ast.direction = '贷' then 0
                    when bsf.access_rule = '贷方余额' and ast.direction = '借' then 0
                    when bsf.access_rule = '贷方余额' and ast.direction = '贷' then SUM(credit + occur_credit - occur_debit)
                    when bsf.access_rule = '科目借方余额' and ast.direction = '借' then SUM(debit - credit + occur_debit - occur_credit)
                    when bsf.access_rule = '科目借方余额' and ast.direction = '贷' then 0
                    when bsf.access_rule = '科目贷方余额' and ast.direction = '借' then 0
                    when bsf.access_rule = '科目贷方余额' and ast.direction = '贷' then SUM(credit - debit + occur_credit - occur_debit)
                END period_end
            from
                account_balance_1
            where
                date = ? and
                is_period_start = 0 and
                id like concat(ast.id, '%')
        ) period_end,
        (
            select
                CASE
                    when bsf.access_rule = '余额' and ast.direction = '借' then SUM(debit - credit)
                    when bsf.access_rule = '余额' and ast.direction = '贷' then SUM(credit - debit)
                    when bsf.access_rule = '借方余额' and ast.direction = '借' then SUM(debit - credit)
                    when bsf.access_rule = '借方余额' and ast.direction = '贷' then 0
                    when bsf.access_rule = '贷方余额' and ast.direction = '借' then 0
                    when bsf.access_rule = '贷方余额' and ast.direction = '贷' then SUM(credit - debit)
                    when bsf.access_rule = '科目借方余额' and ast.direction = '借' then SUM(debit - credit)
                    when bsf.access_rule = '科目借方余额' and ast.direction = '贷' then 0
                    when bsf.access_rule = '科目贷方余额' and ast.direction = '借' then 0
                    when bsf.access_rule = '科目贷方余额' and ast.direction = '贷' then SUM(credit - debit)
                END year_start
            from
                account_balance_1
            where
                date = ? and
                is_period_start = 1 and
                id like concat(ast.id, '%')
        ) year_start
    from
        A_BALANCE_SHEET bs
    left join
        balance_sheet_formula_1 bsf
    on
        bs.criteria = 1 and
        bs.row = bsf.bs_row
    left join
        account_subject_1 ast
    on
        ast.id = bsf.subject_id
) t
group by id
order by id






CREATE TABLE `a_balance_sheet` (
  `criteria` int NOT NULL COMMENT '会计制度',
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `item` varchar(100) DEFAULT '' COMMENT '项目',
  `row` varchar(100) DEFAULT '' COMMENT '行次',
  `level` int DEFAULT NULL COMMENT '层级',
  `count` int DEFAULT '0' COMMENT '计算',
  `direction` varchar(10) DEFAULT NULL COMMENT '方向',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 COMMENT='资产负债表';
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 1, '流动资产：', '', 0, 0, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 2, '货币资金', '1', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 3, '短期投资', '2', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 4, '应收票据', '3', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 5, '应收账款', '4', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 6, '预付账款', '5', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 7, '应收股利', '6', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 8, '应收利息', '7', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 9, '其他应收款', '8', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 10, '存货', '9', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 11, '其中：原材料', '10', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 12, '在产品', '11', 2, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 13, '库存商品', '12', 2, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 14, '周转材料', '13', 3, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 15, '其他流动资产', '14', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 16, '流动资产合计', '15', 0, 0, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 17, '非流动资产', '', 0, 0, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 18, '长期债券投资', '16', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 19, '长期股权投资', '17', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 20, '固定资产原价', '18', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 21, '减：累计折旧', '19', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 22, '固定资产账面价值', '20', 1, 0, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 23, '在建工程', '21', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 24, '工程物资', '22', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 25, '固定资产清理', '23', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 26, '生产性生物资产', '24', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 27, '无形资产', '25', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 28, '开发支出', '26', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 29, '长期待摊费用', '27', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 30, '其他非流动资产', '28', 1, 1, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 31, '非流动资产合计', '29', 2, 0, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 32, '资产总计', '30', 0, 0, '借');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 33, '流动负债：', '', 0, 0, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 34, '短期借款', '31', 1, 1, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 35, '应付票据', '32', 1, 1, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 36, '应付账款', '33', 1, 1, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 37, '预收账款', '34', 1, 1, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 38, '应付职工薪酬', '35', 1, 1, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 39, '应交税费', '36', 1, 1, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 40, '应付利息', '37', 1, 1, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 41, '应付利润', '38', 1, 1, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 42, '其他应付款', '39', 1, 1, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 43, '其他流动负债', '40', 1, 1, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 44, '流动负债合计：', '41', 2, 0, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 45, '非流动负债：', '', 0, 0, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 46, '长期借款', '42', 1, 1, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 47, '长期应付款', '43', 1, 1, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 48, '递延收益', '44', 1, 1, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 49, '其他非流动负债', '45', 1, 1, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 50, '非流动负债合计', '46', 2, 0, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 51, '负债合计', '47', 3, 0, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 52, '', '', 0, 0, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 53, '', '', 0, 0, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 54, '', '', 0, 0, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 55, '', '', 0, 0, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 56, '', '', 0, 0, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 57, '', '', 0, 0, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 58, '所有者权益（或股东权益）：', '', 0, 0, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 59, '实收资本（或股本）', '48', 1, 1, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 60, '资本公积', '49', 1, 1, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 61, '盈余公积', '50', 1, 1, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 62, '未分配利润', '51', 1, 1, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 63, '所有者权益（或股东权益）合计', '52', 2, 0, '贷');
INSERT INTO `a_balance_sheet` (`criteria`, `id`, `item`, `row`, `level`, `count`, `direction`) VALUES (1, 64, '负债和所有者权益（或股东权益）总计', '53', 0, 0, '贷');
