
# ------------------------------------------------------------
# ============================================================================================================
# ========================fs_finance
# ============================================================================================================
# ------------------------------------------------------------
Use fs_finance;

CREATE OR REPLACE VIEW `_dr__user_account_staff` AS
select `u`.* from `data_repository`.`dr__user_account_staff` `u`;

CREATE OR REPLACE VIEW `_dr__user_app` AS
select `ua`.* from `data_repository`.`dr__user_app` `ua`;

CREATE OR REPLACE VIEW `_dr__app` AS
select `app`.* from `data_repository`.`dr__app` `app`;

CREATE OR REPLACE VIEW `_view01_user` AS
select `u`.* from `_dr__user_account_staff` `u`
where `u`.`userStatus` = 'active';

CREATE OR REPLACE VIEW `_view02_user_app` AS
select
  `_app`.`appId` AS `appId`,
  `_app`.`appName` AS `appName`,
  `_user`.`userId` AS `userId`,
  `_user`.`username` AS `username`,
  `_user`.`userStatus` AS `userStatus`,
  `_user`.`userType` AS `userType`
from
    `_dr__user_app` `_user_app`
    left join `_dr__user_account_staff` `_user` on `_user_app`.`userId` = `_user`.`userId`
    left join `_dr__app` `_app` on `_user_app`.`appId` = `_app`.`appId`
where `_user_app`.`accountStatus` = 'issued';


Delete from _page where pageId='userManagement';
