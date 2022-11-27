# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_cache`;
CREATE TABLE `_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) NOT NULL COMMENT '用户Id',
  `content` longtext COMMENT '缓存数据',
  `recordStatus` varchar(255) DEFAULT 'active',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '缓存表';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _constant
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_constant`;
CREATE TABLE `_constant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `constantKey` varchar(255) DEFAULT NULL,
  `constantType` varchar(255) DEFAULT NULL COMMENT '常量类型; object, array',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `constantValue` text COMMENT '常量内容; object, array',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '常量表; 软删除未启用;';






# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_group`;
CREATE TABLE `_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` varchar(255) NOT NULL COMMENT 'groupId',
  `groupName` varchar(255) DEFAULT NULL COMMENT '群组名',
  `groupDesc` varchar(255) DEFAULT NULL COMMENT '群组描述',
  `groupAvatar` varchar(255) DEFAULT NULL COMMENT '群logo',
  `groupExtend` varchar(1024) DEFAULT '{}' COMMENT '拓展字段; { groupNotice: ''xx'' }',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`),
  KEY `groupId_index` (`groupId`) USING BTREE
) ENGINE = InnoDB COMMENT = '群组表; 软删除未启用;';






# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_page`;
CREATE TABLE `_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` varchar(255) DEFAULT NULL COMMENT 'pageId',
  `pageFile` varchar(255) DEFAULT NULL COMMENT 'page文件指定; 默认使用pageId.html',
  `pageName` varchar(255) DEFAULT NULL COMMENT 'page name',
  `pageType` varchar(255) DEFAULT NULL COMMENT '页面类型; showInMenu, dynamicInMenu',
  `sort` varchar(255) DEFAULT NULL,
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 46 COMMENT = '页面表; 软删除未启用;';



INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'help','helpV3','帮助','dynamicInMenu','11','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (4,'login','loginV3','登陆','','','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (38,'createInvoice',NULL,'createInvoice【测试页面】','','3','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (39,'customerDetail',NULL,'Customer【测试页面】','','4','insert','vscode','vscode','2022-08-16T15:59:14+08:00');
INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (40,'periodManagement',NULL,'会计期间','showInMenu','5','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (41,'subjectManagement',NULL,'科目设置','showInMenu','5','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (42,'voucherManagement',NULL,'录入凭证','showInMenu','5','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (43,'accountDetailsManagement',NULL,'账目明细','showInMenu','5','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (44,'generalLedgerManagement',NULL,'总账','showInMenu','5','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (45,'assetsAndLiabilitiesManagement',NULL,'资产负债','showInMenu','6','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _record_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_record_history`;
CREATE TABLE `_record_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(255) DEFAULT NULL COMMENT '表',
  `recordId` int(11) DEFAULT NULL COMMENT '数据在table中的主键id; recordContent.id',
  `recordContent` text NOT NULL COMMENT '数据',
  `packageContent` text NOT NULL COMMENT '当时请求的 package JSON',
  `operation` varchar(255) DEFAULT NULL COMMENT '操作; jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId; recordContent.operationByUserId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名; recordContent.operationByUser',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; recordContent.operationAt; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`),
  KEY `index_record_id` (`recordId`),
  KEY `index_table_action` (`table`, `operation`)
) ENGINE = InnoDB AUTO_INCREMENT = 12 COMMENT = '数据历史表';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_resource`;
CREATE TABLE `_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accessControlTable` varchar(255) DEFAULT NULL COMMENT '数据规则控制表',
  `resourceHook` text COMMENT '[ "before": {"service": "xx", "serviceFunction": "xxx"}, "after": [] }',
  `pageId` varchar(255) DEFAULT NULL COMMENT 'page id; E.g: index',
  `actionId` varchar(255) DEFAULT NULL COMMENT 'action id; E.g: selectXXXByXXX',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `resourceType` varchar(255) DEFAULT NULL COMMENT 'resource 类型; E.g: auth service sql',
  `appDataSchema` text COMMENT 'appData 参数校验',
  `resourceData` text COMMENT 'resource 数据; { "service": "auth", "serviceFunction": "passwordLogin" } or  { "table": "${tableName}", "action": "select", "whereCondition": ".where(function() {this.whereNot( { recordStatus: \\"active\\" })})" }',
  `requestDemo` text COMMENT '请求Demo',
  `responseDemo` text COMMENT '响应Demo',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 378 COMMENT = '请求资源表; 软删除未启用; resourceId=`${appId}.${pageId}.${actionId}`';



INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (231,NULL,NULL,'login','passwordLogin','✅登陆','service','{}','{\"service\": \"user\", \"serviceFunction\": \"passwordLogin\"}','','','update',NULL,NULL,'2022-04-27T15:32:57+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (251,NULL,NULL,'allPage','logout','✅登出','service','{}','{\"service\": \"user\", \"serviceFunction\": \"logout\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (253,NULL,NULL,'allPage','userInfo','✅获取用户信息','service','{}','{\"service\": \"user\", \"serviceFunction\": \"userInfo\"}','','','update',NULL,NULL,'2022-04-27T15:37:21+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (258,NULL,NULL,'allPage','getConstantList','✅查询常量','sql','{}','{\"table\": \"_constant\", \"operation\": \"select\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (293,NULL,NULL,'protocolDemo','selectItemList','✅应用协议-查询列表','sql','{}','{\"table\": \"student\", \"operation\": \"select\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (294,NULL,NULL,'protocolDemo','insertItem','✅应用协议-添加成员','sql','{}','{\"table\": \"student\", \"operation\": \"insert\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (295,NULL,NULL,'protocolDemo','updateItem','✅应用协议-更新成员','sql','{}','{\"table\": \"student\", \"operation\": \"jhUpdate\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (296,NULL,NULL,'protocolDemo','deleteItem','✅应用协议-删除信息','sql','{}','{\"table\": \"student\", \"operation\": \"jhDelete\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (309,NULL,NULL,'frontendDemo01','selectItemList','✅前端对接-查询列表','sql','{}','{\"table\": \"student\", \"operation\": \"select\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (310,NULL,NULL,'frontendDemo01','insertItem','✅前端对接-添加成员','sql','{}','{\"table\": \"student\", \"operation\": \"insert\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (311,NULL,NULL,'frontendDemo01','updateItem','✅前端对接-更新成员','sql','{}','{\"table\": \"student\", \"operation\": \"jhUpdate\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (312,NULL,NULL,'frontendDemo01','deleteItem','✅前端对接-删除信息','sql','{}','{\"table\": \"student\", \"operation\": \"jhDelete\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (313,NULL,NULL,'frontendDemo02','selectItemList','✅前端优化-查询列表','sql','{}','{\"table\": \"student\", \"operation\": \"select\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (314,NULL,NULL,'frontendDemo02','insertItem','✅前端优化-添加成员','sql','{}','{\"table\": \"student\", \"operation\": \"jhInsert\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (315,NULL,NULL,'frontendDemo02','updateItem','✅前端优化-更新成员','sql','{}','{\"table\": \"student\", \"operation\": \"jhUpdate\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (316,NULL,NULL,'frontendDemo02','deleteItem','✅前端优化-删除信息','sql','{}','{\"table\": \"student\", \"operation\": \"jhDelete\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (317,NULL,NULL,'resourceHook','selectItemList','✅前端对接-业务ID-查询列表','sql','{}','{\"table\": \"student\", \"operation\": \"select\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (318,NULL,'{\"after\": [], \"before\": [{\"service\": \"student\", \"serviceFunction\": \"beforHookForGenerateStudentId\"}]}','resourceHook','insertItem','✅前端对接-业务ID-添加成员','sql','{\"type\": \"object\", \"required\": [\"actionData\"], \"properties\": {\"actionData\": {\"type\": \"object\", \"required\": [\"classId\", \"name\", \"level\", \"gender\", \"dateOfBirth\"], \"properties\": {\"name\": {\"type\": \"string\"}, \"level\": {\"anyOf\": [{\"type\": \"string\"}, {\"type\": \"number\"}]}, \"gender\": {\"type\": \"string\"}, \"classId\": {\"type\": \"string\"}, \"dateOfBirth\": {\"type\": \"string\", \"format\": \"date\"}}, \"additionalProperties\": true}}, \"additionalProperties\": true}','{\"table\": \"student\", \"operation\": \"jhInsert\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (319,NULL,NULL,'resourceHook','updateItem','✅前端对接-业务ID-更新成员','sql','{}','{\"table\": \"student\", \"operation\": \"jhUpdate\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (320,NULL,NULL,'resourceHook','deleteItem','✅前端对接-业务ID-删除信息','sql','{}','{\"table\": \"student\", \"operation\": \"jhDelete\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (325,NULL,NULL,'uiAction','selectItemList','✅前端规范-查询列表','sql','{}','{\"table\": \"student\", \"operation\": \"select\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (326,NULL,NULL,'uiAction','createItem','✅前端规范-添加成员','sql','{}','{\"table\": \"student\", \"operation\": \"jhInsert\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (327,NULL,NULL,'uiAction','updateItem','✅前端规范-更新成员','sql','{}','{\"table\": \"student\", \"operation\": \"jhUpdate\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (328,NULL,NULL,'uiAction','deleteItem','✅前端规范-删除信息','sql','{}','{\"table\": \"student\", \"operation\": \"jhDelete\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (331,NULL,NULL,'uiActionComponent','selectItemList','✅前端规范-组件通信-查询列表','sql','{}','{\"table\": \"student\", \"operation\": \"select\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (332,NULL,NULL,'uiActionComponent','insertItem','✅前端规范-组件通信-添加成员','sql','{}','{\"table\": \"student\", \"operation\": \"jhInsert\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (333,NULL,NULL,'uiActionComponent','updateItem','✅前端规范-组件通信-更新成员','sql','{}','{\"table\": \"student\", \"operation\": \"jhUpdate\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (334,NULL,NULL,'uiActionComponent','deleteItem','✅前端规范-组件通信-删除信息','sql','{}','{\"table\": \"student\", \"operation\": \"jhDelete\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (341,'access_control_student',NULL,'backendSearchDemo','selectItemList','✅服务端查询-查询列表','sql','{}','{\"table\": \"student\", \"operation\": \"select\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (342,NULL,NULL,'backendSearchDemo','insertItem','✅服务端查询-添加成员','sql','{}','{\"table\": \"student\", \"operation\": \"insert\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (343,NULL,NULL,'backendSearchDemo','updateItem','✅服务端查询-更新成员','sql','{}','{\"table\": \"student\", \"operation\": \"jhUpdate\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (350,NULL,NULL,'backendSearchDemo','deleteItem','✅服务端查询-删除信息','sql','{}','{\"table\": \"student\", \"operation\": \"jhDelete\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (352,NULL,NULL,'dataAccessRight','insertItem','✅数据权限-添加成员','sql','{}','{\"table\": \"student\", \"operation\": \"insert\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (353,NULL,NULL,'dataAccessRight','updateItem','✅数据权限-更新成员','sql','{}','{\"table\": \"student\", \"operation\": \"jhUpdate\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (354,NULL,NULL,'dataAccessRight','deleteItem','✅数据权限-删除信息','sql','{}','{\"table\": \"student\", \"operation\": \"jhDelete\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (355,NULL,NULL,'dataAccessRight','selectItemListByService','✅数据权限-查询列表','service','{}','{\"service\": \"student\", \"serviceFunction\": \"selectStudentList\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (356,NULL,'','dataAccessRight','selectItemListByDynamicData','✅数据权限-查询列表','sql','{}','{\"table\": \"student\", \"where\": {\"classId\": \"ctx.userInfo.studentInfo.classId\"}, \"operation\": \"select\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (357,NULL,NULL,'periodManagement','selectItemList','✅查询列表','sql','{}','{ \"table\": \"period\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (358,NULL,NULL,'periodManagement','insertItem','✅添加','sql','{}','{ \"table\": \"period\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (359,NULL,NULL,'periodManagement','updateItem','✅更新','sql','{}','{ \"table\": \"period\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (360,NULL,NULL,'periodManagement','deleteItem','✅删除','sql','{}','{ \"table\": \"period\", \"operation\": \"jhDelete\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (361,NULL,'','subjectManagement','selectItemList','✅查询列表','sql','{}','{ \"table\": \"subject\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (362,NULL,'{\"after\": [{\"service\": \"subject\", \"serviceFunction\": \"addPeriodStartBalance\"}], \"before\": [{\"service\": \"subject\", \"serviceFunction\": \"fillInsertItemParamsBeforeHook\"}]}','subjectManagement','insertItem','✅添加','sql','{}','{ \"table\": \"subject\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (363,NULL,NULL,'subjectManagement','updateItem','✅更新','sql','{}','{ \"table\": \"subject\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (364,NULL,NULL,'subjectManagement','deleteItem','✅删除','sql','{}','{ \"table\": \"subject\", \"operation\": \"jhDelete\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (365,NULL,NULL,'voucherManagement','selectItemList','✅查询列表','sql','{}','{ \"table\": \"view01_voucher_entry\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (366,NULL,'','voucherManagement','insertItem','✅添加','sql','{}','{ \"table\": \"voucher\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (367,NULL,NULL,'voucherManagement','updateItem','✅更新','sql','{}','{ \"table\": \"voucher\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (368,NULL,NULL,'voucherManagement','deleteItem','✅删除','sql','{}','{ \"table\": \"voucher\", \"operation\": \"jhDelete\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (369,NULL,NULL,'voucherManagement','selectPeriodList','✅查询会计期间列表','sql','{}','{ \"table\": \"period\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (370,NULL,'','voucherManagement','selectSubjectList','✅查询科目列表','sql','{}','{ \"table\": \"subject\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (371,NULL,NULL,'voucherManagement','insertVoucherEntryItem','✅添加凭证条目','sql','{}','{ \"table\": \"voucher_entry\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (372,NULL,NULL,'voucherManagement','createVoucherAndVoucherEntry','✅添加凭证和条目','service','{}','{\"service\": \"voucher\", \"serviceFunction\": \"createVoucherAndVoucherEntry\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (373,NULL,'','accountDetailsManagement','selectSubjectList','✅查询科目列表','sql','{}','{ \"table\": \"subject\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (374,NULL,NULL,'accountDetailsManagement','selectVoucherEntryList','✅添加凭证条目列表','sql','{}','{ \"table\": \"view01_voucher_entry\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (375,NULL,NULL,'generalLedgerManagement','selectItemList','✅查询总账','sql','{}','{ \"table\": \"view01_voucher_entry\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (376,NULL,NULL,'assetsAndLiabilitiesManagement','selectItemList','✅查询资产负债列表','sql','{}','{ \"table\": \"balance_sheet\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (377,NULL,NULL,'assetsAndLiabilitiesManagement','selectSubjectList','✅查询科目列表','sql','{}','{ \"table\": \"subject\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_role`;
CREATE TABLE `_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` varchar(255) DEFAULT NULL COMMENT 'roleId',
  `roleName` varchar(255) DEFAULT NULL COMMENT 'role name',
  `roleDesc` varchar(255) DEFAULT NULL COMMENT 'role desc',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 COMMENT = '角色表; 软删除未启用;';



INSERT INTO `_role` (`id`,`roleId`,`roleName`,`roleDesc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'administrator','系统管理员','','insert',NULL,NULL,NULL);
INSERT INTO `_role` (`id`,`roleId`,`roleName`,`roleDesc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (6,'boss','掌门','','insert',NULL,NULL,NULL);
INSERT INTO `_role` (`id`,`roleId`,`roleName`,`roleDesc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (7,'disciple','门徒','','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _test_case
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_test_case`;
CREATE TABLE `_test_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` varchar(255) DEFAULT NULL COMMENT '页面Id',
  `testId` varchar(255) DEFAULT NULL COMMENT '测试用例Id; 10000 ++',
  `testName` varchar(255) DEFAULT NULL COMMENT '测试用例名',
  `uiActionIdList` varchar(255) DEFAULT NULL COMMENT 'uiAction列表; 一个测试用例对应多个uiActionId',
  `testOpeartion` text COMMENT '测试用例步骤;',
  `expectedResult` text COMMENT '期望结果',
  `operation` varchar(255) DEFAULT NULL COMMENT '操作; jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId; recordContent.operationByUserId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名; recordContent.operationByUser',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; recordContent.operationAt; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 197 COMMENT = '测试用例表';






# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _ui
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_ui`;
CREATE TABLE `_ui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` varchar(255) DEFAULT NULL COMMENT 'page id; E.g: index',
  `uiActionType` varchar(255) DEFAULT NULL COMMENT 'ui 动作类型，如：fetchData, postData, changeUi',
  `uiActionId` varchar(255) DEFAULT NULL COMMENT 'action id; E.g: selectXXXByXXX',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `uiActionConfig` text COMMENT 'ui 动作数据',
  `appDataSchema` text COMMENT 'ui 校验数据',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = 'ui 施工方案';






# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user`;
CREATE TABLE `_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSequence` varchar(255) DEFAULT NULL COMMENT '自增id; 用于生成userId',
  `userId` varchar(255) DEFAULT NULL COMMENT '主键id',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名(登陆)',
  `clearTextPassword` varchar(255) DEFAULT NULL COMMENT '明文密码',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `md5Salt` varchar(255) DEFAULT NULL COMMENT 'md5Salt',
  `userStatus` varchar(255) DEFAULT 'active' COMMENT '用户账号状态：活跃或关闭',
  `userType` varchar(255) DEFAULT NULL COMMENT '用户类型; staff, student.',
  `config` mediumtext COMMENT '配置信息',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_index` (`username`),
  UNIQUE KEY `userId_index` (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 COMMENT = '用户表';



INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (42,NULL,'admin','系统管理员','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (43,NULL,'W00001','张三丰','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (44,NULL,'W00002','张无忌','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (45,NULL,'G00001','洪七公','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (46,NULL,'G00002','郭靖','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (47,NULL,'H00001','岳不群','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (48,NULL,'H00002','令狐冲','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active',NULL,NULL,'insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _user_group_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user_group_role`;
CREATE TABLE `_user_group_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) NOT NULL COMMENT '用户id',
  `groupId` varchar(255) NOT NULL COMMENT '群组Id',
  `roleId` varchar(255) DEFAULT NULL COMMENT '角色Id',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`),
  KEY `groupId_index` (`groupId`),
  KEY `userId_index` (`userId`)
) ENGINE = InnoDB AUTO_INCREMENT = 579 COMMENT = '用户群组角色关联表; 软删除未启用;';



INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (568,'admin','adminGroup','administrator','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (569,'W00001','wudang','boss','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (570,'W00002','wudang','disciple','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (573,'G00001','gaibang','boss','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (574,'G00002','gaibang','disciple','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (577,'H00001','huashan','boss','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (578,'H00002','huashan','disciple','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _user_group_role_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user_group_role_page`;
CREATE TABLE `_user_group_role_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL COMMENT 'userId 或者 通配符; 通配符: *',
  `group` varchar(255) DEFAULT NULL COMMENT 'groupId 或者 通配符; 通配符: *',
  `role` varchar(255) DEFAULT NULL COMMENT 'roleId 或者 通配符; 通配符: *',
  `page` varchar(255) DEFAULT NULL COMMENT 'pageId id',
  `allowOrDeny` varchar(255) DEFAULT NULL COMMENT '用户群组角色 匹配后 执行动作; allow、deny',
  `desc` varchar(255) DEFAULT NULL COMMENT '映射描述',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 COMMENT = '用户群组角色 - 页面 映射表; 软删除未启用;';



INSERT INTO `_user_group_role_page` (`id`,`user`,`group`,`role`,`page`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,'*','public','*','login','allow','登陆页面; 开放所有用户;','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role_page` (`id`,`user`,`group`,`role`,`page`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'*','login','*','help,manual','allow','工具页; 开放给登陆用户;','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role_page` (`id`,`user`,`group`,`role`,`page`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'*','login','*','*','allow','所有页面; 开放给登陆用户;','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _user_group_role_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user_group_role_resource`;
CREATE TABLE `_user_group_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL COMMENT 'userId 或者 通配符; 通配符: *',
  `group` varchar(255) DEFAULT NULL COMMENT 'groupId 或者 通配符; 通配符: *',
  `role` varchar(255) DEFAULT NULL COMMENT 'roleId 或者 通配符; 通配符: *',
  `resource` varchar(255) DEFAULT NULL COMMENT 'resourceId 或者 通配符; 通配符: *, !resourceId',
  `allowOrDeny` varchar(255) DEFAULT NULL COMMENT '用户群组角色 匹配后 执行动作; allow、deny',
  `desc` varchar(255) DEFAULT NULL COMMENT '映射描述',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 COMMENT = '用户群组角色 - 请求资源 映射表; 软删除未启用;';



INSERT INTO `_user_group_role_resource` (`id`,`user`,`group`,`role`,`resource`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,'*','public','*','login.passwordLogin','allow','登陆resource, 开放给所有用户','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role_resource` (`id`,`user`,`group`,`role`,`resource`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'*','login','*','allPage.*','allow','工具类resource, 开放给所有登陆成功的用户','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role_resource` (`id`,`user`,`group`,`role`,`resource`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'*','login','*','*','allow','所有resource, 开放给所有登陆成功的用户','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _user_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user_session`;
CREATE TABLE `_user_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) DEFAULT NULL COMMENT '用户id',
  `userIp` varchar(255) DEFAULT NULL COMMENT '用户ip',
  `userIpRegion` varchar(255) DEFAULT NULL COMMENT '用户Ip区域',
  `userAgent` text COMMENT '请求的 agent',
  `deviceId` varchar(255) DEFAULT NULL COMMENT '设备id',
  `deviceType` varchar(255) DEFAULT 'web' COMMENT '设备类型; flutter, web, bot_databot, bot_chatbot, bot_xiaochengxu',
  `socketStatus` varchar(255) DEFAULT 'offline' COMMENT 'socket状态',
  `authToken` varchar(255) DEFAULT NULL COMMENT 'auth token',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`),
  KEY `userId_index` (`userId`),
  KEY `userId_deviceId_index` (`userId`, `deviceId`) USING BTREE,
  KEY `authToken_index` (`authToken`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 COMMENT = '用户session表; deviceId 维度;软删除未启用;';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: balance_sheet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `balance_sheet`;
CREATE TABLE `balance_sheet` (
  `criteria` int(11) NOT NULL COMMENT '会计制度',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `item` varchar(100) DEFAULT '' COMMENT '项目',
  `row` varchar(100) DEFAULT '' COMMENT '行次',
  `level` int(11) DEFAULT NULL COMMENT '层级',
  `count` int(11) DEFAULT '0' COMMENT '计算',
  `direction` varchar(10) DEFAULT NULL COMMENT '方向',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 65 COMMENT = '资产负债表';



INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,2,'货币资金','1',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,3,'短期投资','2',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,4,'应收票据','3',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,5,'应收账款','4',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,6,'预付账款','5',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,7,'应收股利','6',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,8,'应收利息','7',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,9,'其他应收款','8',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,10,'存货','9',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,11,'其中：原材料','10',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,12,'在产品','11',2,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,13,'库存商品','12',2,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,14,'周转材料','13',3,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,15,'其他流动资产','14',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,16,'流动资产合计','15',0,0,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,17,'非流动资产','57',0,0,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,18,'长期债券投资','16',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,19,'长期股权投资','17',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,20,'固定资产原价','18',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,21,'减：累计折旧','19',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,22,'固定资产账面价值','20',1,0,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,23,'在建工程','21',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,24,'工程物资','22',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,25,'固定资产清理','23',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,26,'生产性生物资产','24',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,27,'无形资产','25',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,28,'开发支出','26',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,29,'长期待摊费用','27',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,30,'其他非流动资产','28',1,1,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,31,'非流动资产合计','29',2,0,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,32,'资产总计','30',0,0,'借');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,34,'短期借款','31',1,1,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,35,'应付票据','32',1,1,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,36,'应付账款','33',1,1,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,37,'预收账款','34',1,1,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,38,'应付职工薪酬','35',1,1,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,39,'应交税费','36',1,1,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,40,'应付利息','37',1,1,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,41,'应付利润','38',1,1,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,42,'其他应付款','39',1,1,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,43,'其他流动负债','40',1,1,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,45,'非流动负债：','54',0,0,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,46,'长期借款','42',1,1,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,47,'长期应付款','43',1,1,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,48,'递延收益','44',1,1,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,49,'其他非流动负债','45',1,1,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,50,'非流动负债合计','46',2,0,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,51,'负债合计','47',3,0,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,58,'所有者权益（或股东权益）：','55',0,0,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,59,'实收资本（或股本）','48',1,1,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,60,'资本公积','49',1,1,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,61,'盈余公积','50',1,1,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,62,'未分配利润','51',1,1,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,63,'所有者权益（或股东权益）合计','52',2,0,'贷');
INSERT INTO `balance_sheet` (`criteria`,`id`,`item`,`row`,`level`,`count`,`direction`) VALUES (1,64,'负债和所有者权益（或股东权益）总计','53',0,0,'贷');



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: period
# ------------------------------------------------------------

DROP TABLE IF EXISTS `period`;
CREATE TABLE `period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `periodId` varchar(255) DEFAULT NULL COMMENT '会计区间Id; 月份维度 E.g: 2023-03',
  `isCheckout` varchar(255) DEFAULT NULL COMMENT '是否结算;',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 COMMENT = '会计区间表';



INSERT INTO `period` (`id`,`periodId`,`isCheckout`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,'2022-11',NULL,'insert','admin','系统管理员','2022-11-25T21:26:40+08:00');
INSERT INTO `period` (`id`,`periodId`,`isCheckout`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'2022-10',NULL,'insert','admin','系统管理员','2022-11-25T21:27:57+08:00');
INSERT INTO `period` (`id`,`periodId`,`isCheckout`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'2022-09',NULL,'insert','admin','系统管理员','2022-11-25T21:28:15+08:00');



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: profit_formula
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profit_formula`;
CREATE TABLE `profit_formula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` varchar(255) DEFAULT NULL COMMENT '科目编码;',
  `countDirection` tinyint(1) NOT NULL COMMENT '运算符号; +、-',
  `accessRule` varchar(20) NOT NULL DEFAULT '' COMMENT '取数规则; 余额、借方余额、贷房余额、科目借方余额、科目贷方余额',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '资产负债计算规则';






# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: subject
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` varchar(255) DEFAULT NULL COMMENT '科目编码; 资产类 1001++, 负债类2001++..',
  `subjectName` varchar(255) DEFAULT NULL COMMENT '科目名称;',
  `subjectCategory` varchar(255) DEFAULT NULL COMMENT '科目分类;资产, 负债, 权益, 成本, 损益',
  `subjectBalanceDirection` varchar(4) NOT NULL COMMENT '科目余额方向; 借、贷',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 COMMENT = '科目表';



INSERT INTO `subject` (`id`,`subjectId`,`subjectName`,`subjectCategory`,`subjectBalanceDirection`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'1000','库存现金','资产','借','insert','admin','系统管理员','2022-11-25T22:03:14+08:00');
INSERT INTO `subject` (`id`,`subjectId`,`subjectName`,`subjectCategory`,`subjectBalanceDirection`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (5,'2000','短期借款','负债','贷','insert','admin','系统管理员','2022-11-25T22:09:20+08:00');
INSERT INTO `subject` (`id`,`subjectId`,`subjectName`,`subjectCategory`,`subjectBalanceDirection`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (6,'3000','实收资本','权益','贷','insert','admin','系统管理员','2022-11-25T22:09:41+08:00');
INSERT INTO `subject` (`id`,`subjectId`,`subjectName`,`subjectCategory`,`subjectBalanceDirection`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (7,'1001','银行存款','资产','借','insert','admin','系统管理员','2022-11-25T22:10:19+08:00');
INSERT INTO `subject` (`id`,`subjectId`,`subjectName`,`subjectCategory`,`subjectBalanceDirection`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (8,'2001','应付票据','负债','贷','insert','admin','系统管理员','2022-11-25T22:10:47+08:00');
INSERT INTO `subject` (`id`,`subjectId`,`subjectName`,`subjectCategory`,`subjectBalanceDirection`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (9,'1002','固定资产','资产','借','insert','admin','系统管理员','2022-11-26T15:18:09+08:00');
INSERT INTO `subject` (`id`,`subjectId`,`subjectName`,`subjectCategory`,`subjectBalanceDirection`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (10,'2002','应收票据','负债','借','insert','admin','系统管理员','2022-11-26T15:18:46+08:00');



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: subject_balance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subject_balance`;
CREATE TABLE `subject_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `periodId` varchar(255) DEFAULT NULL COMMENT '会计区间; E.g: 2023-03',
  `subjectId` varchar(255) DEFAULT NULL COMMENT '科目编码;',
  `debit` decimal(14, 2) NOT NULL DEFAULT '0.00' COMMENT '借方余额',
  `credit` decimal(14, 2) NOT NULL DEFAULT '0.00' COMMENT '贷方余额',
  `occurDebit` decimal(14, 2) NOT NULL DEFAULT '0.00' COMMENT '借方发生额',
  `occurCredit` decimal(14, 2) NOT NULL DEFAULT '0.00' COMMENT '贷方发生额',
  `occurAmount` decimal(14, 2) NOT NULL DEFAULT '0.00' COMMENT '实际损益发生额;（年中账套）',
  `periodStartBalance` decimal(14, 2) NOT NULL COMMENT '期初余额;',
  `isPeriodStart` varchar(255) NOT NULL DEFAULT '否' COMMENT '是否期初',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 COMMENT = '科目余额表-会计区间维度';



INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,'2022-09','1002',3000.00,0.00,0.00,0.00,0.00,0.00,'否','insert',NULL,NULL,'2022-11-26T15:19:37+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'2022-09','1001',0.00,3000.00,0.00,0.00,0.00,0.00,'否','insert',NULL,NULL,'2022-11-26T15:19:37+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'2022-09','2002',50000.00,0.00,0.00,0.00,0.00,0.00,'否','insert',NULL,NULL,'2022-11-26T15:23:17+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (4,'2022-09','2001',0.00,50000.00,0.00,0.00,0.00,0.00,'否','insert',NULL,NULL,'2022-11-26T15:23:17+08:00');



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: voucher
# ------------------------------------------------------------

DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucherName` varchar(255) DEFAULT NULL COMMENT '凭证字; 记2022',
  `voucherNumber` int(11) DEFAULT NULL COMMENT '凭证号; 1001',
  `voucherId` varchar(255) DEFAULT NULL COMMENT '凭证Id; voucherName + voucherNumber',
  `periodId` varchar(255) DEFAULT NULL COMMENT '会计区间; E.g: 2023-03',
  `voucherCreator` varchar(255) DEFAULT '' COMMENT '制单人',
  `voucherAccountant` varchar(255) DEFAULT '' COMMENT '记账人',
  `voucherAudit` varchar(255) DEFAULT '' COMMENT '审核人; 预留字段',
  `voucherCreateAt` varchar(255) DEFAULT NULL COMMENT '凭证创建时间; E.g: 2021-05-28T10:24:54+08:00',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 15 COMMENT = '凭证表';



INSERT INTO `voucher` (`id`,`voucherName`,`voucherNumber`,`voucherId`,`periodId`,`voucherCreator`,`voucherAccountant`,`voucherAudit`,`voucherCreateAt`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (13,'记2022',10000,'记202210000','2022-09','','系统管理员','','2022-11-26','insert',NULL,NULL,'2022-11-26T15:19:37+08:00');
INSERT INTO `voucher` (`id`,`voucherName`,`voucherNumber`,`voucherId`,`periodId`,`voucherCreator`,`voucherAccountant`,`voucherAudit`,`voucherCreateAt`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (14,'记2022',10001,'记202210001','2022-09','','系统管理员','','2022-11-25','insert',NULL,NULL,'2022-11-26T15:23:17+08:00');



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: voucher_entry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `voucher_entry`;
CREATE TABLE `voucher_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucherId` varchar(255) DEFAULT NULL COMMENT '凭证Id;',
  `subjectId` varchar(255) DEFAULT NULL COMMENT '科目id;',
  `entryAbstract` varchar(255) NOT NULL COMMENT '摘要',
  `debit` decimal(14, 2) NOT NULL DEFAULT '0.00' COMMENT '借方金额',
  `credit` decimal(14, 2) NOT NULL DEFAULT '0.00' COMMENT '贷方金额',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 13 COMMENT = '凭证条目表';



INSERT INTO `voucher_entry` (`id`,`voucherId`,`subjectId`,`entryAbstract`,`debit`,`credit`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (9,'记202210000','1002','购打印机',3000.00,0.00,'insert',NULL,NULL,'2022-11-26T15:19:37+08:00');
INSERT INTO `voucher_entry` (`id`,`voucherId`,`subjectId`,`entryAbstract`,`debit`,`credit`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (10,'记202210000','1001','银行存款',0.00,3000.00,'insert',NULL,NULL,'2022-11-26T15:19:37+08:00');
INSERT INTO `voucher_entry` (`id`,`voucherId`,`subjectId`,`entryAbstract`,`debit`,`credit`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (11,'记202210001','2002','提现',50000.00,0.00,'insert',NULL,NULL,'2022-11-26T15:23:17+08:00');
INSERT INTO `voucher_entry` (`id`,`voucherId`,`subjectId`,`entryAbstract`,`debit`,`credit`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (12,'记202210001','2001','提现',0.00,50000.00,'insert',NULL,NULL,'2022-11-26T15:23:17+08:00');



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _view01_user
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `_view01_user` AS
select
  `_user`.`id` AS `id`,
  `_user`.`idSequence` AS `idSequence`,
  `_user`.`userId` AS `userId`,
  `_user`.`username` AS `username`,
  `_user`.`clearTextPassword` AS `clearTextPassword`,
  `_user`.`password` AS `password`,
  `_user`.`md5Salt` AS `md5Salt`,
  `_user`.`userStatus` AS `userStatus`,
  `_user`.`userType` AS `userType`,
  `_user`.`config` AS `config`,
  `_user`.`operation` AS `operation`,
  `_user`.`operationByUserId` AS `operationByUserId`,
  `_user`.`operationByUser` AS `operationByUser`,
  `_user`.`operationAt` AS `operationAt`
from
  `_user`;





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view01_voucher_entry
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_voucher_entry` AS
select
  `voucher_entry`.`id` AS `id`,
  `voucher_entry`.`voucherId` AS `voucherId`,
  `voucher_entry`.`subjectId` AS `subjectId`,
  `voucher_entry`.`entryAbstract` AS `entryAbstract`,
  `voucher_entry`.`debit` AS `debit`,
  `voucher_entry`.`credit` AS `credit`,
  `voucher_entry`.`operation` AS `operation`,
  `voucher_entry`.`operationByUserId` AS `operationByUserId`,
  `voucher_entry`.`operationByUser` AS `operationByUser`,
  `voucher_entry`.`operationAt` AS `operationAt`,
  `subject`.`subjectName` AS `subjectName`,
  `subject`.`subjectCategory` AS `subjectCategory`,
  `voucher`.`voucherName` AS `voucherName`,
  `voucher`.`periodId` AS `periodId`,
  `voucher`.`voucherCreateAt` AS `voucherCreateAt`,
  `subject`.`subjectBalanceDirection` AS `subjectBalanceDirection`
from
  (
  (
    `voucher_entry`
    join `subject` on(
    (
      `voucher_entry`.`subjectId` = `subject`.`subjectId`
    )
    )
  )
  join `voucher` on(
    (
    `voucher_entry`.`voucherId` = `voucher`.`voucherId`
    )
  )
  );





