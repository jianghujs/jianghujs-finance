# 需求

## 页面

- 基础设置
    - 会计期间 页面: period crud;
    - 科目管理 页面: subject subject_balance
- 记账
    - 录凭证 页面: voucher voucher_entry subject_balance
    - 凭证列表 页面: voucher voucher_entry subject
- 查账
    - 账目明细 页面: 科目维度 voucher voucher_entry subject
    - 总账 页面: 本期合计 subject subject_balance
- 报表
    - 资产负债表: 通过公式配置 将 科目余额 算出 资产负债: 
        - subject(资产的科目) profit_formula subject_balance

## 表

- period: 会计区间
- subject: 科目表; 科目分类、余额方向
    - subject_balance: 科目-期余额
- voucher: 凭证表; 
    - voucher_entry: 凭证条目====》科目ID、借方金额、贷方金额
- profit_formula: 资产负债计算规则
