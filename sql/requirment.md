# 需求

## 页面

- 基础设置
    - 科目管理 页面
- 记账
    - 录凭证 页面
    - 凭证列表 页面
- 查账
    - 账目明细 页面: 科目维度 
    - 总账 页面: 期初余额-本期合计-本年累计
- 报表
    - 资产负债表: 通过公式配置 将 凭证算出 资产负债

## 表

- subject: 科目表; 
    - subjectId: "科目编号"
    - subjectClass: "科目分类" 
    - subjectClass: "科目分类" 

    
  `pid` varchar(20) NOT NULL DEFAULT '0' COMMENT '父科目编号',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '科目名称',
  `direction` varchar(4) NOT NULL COMMENT '余额方向',
  `is_leaf` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否叶子节点',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '科目状态',
  `is_cash_account` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否现金科目',
  `level` tinyint(1) NOT NULL COMMENT '科目级别',
- 

## 财务的 核心是

- 记账：不同科目的计帐
    - 科目
    - 
- 查账/对账:  审计部门, 汇总/统计 帐目信息
- 付款 & 合同