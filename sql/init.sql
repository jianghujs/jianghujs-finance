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
) ENGINE = InnoDB AUTO_INCREMENT = 47 COMMENT = '页面表; 软删除未启用;';



INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'help','helpV3','帮助','dynamicInMenu','11','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (4,'login','loginV3','登陆','','','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (38,'createInvoice',NULL,'createInvoice【测试页面】','','3','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (39,'customerDetail',NULL,'Customer【测试页面】','','4','insert','vscode','vscode','2022-08-16T15:59:14+08:00');
INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (40,'periodManagement',NULL,'会计期间','showInMenu','5','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (41,'subjectManagement',NULL,'科目设置','showInMenu','5','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (42,'voucherManagement',NULL,'凭证管理','showInMenu','5','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (43,'accountDetailsManagement',NULL,'科目账目明细','showInMenu','5','insert',NULL,NULL,NULL);
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
) ENGINE = InnoDB AUTO_INCREMENT = 21 COMMENT = '数据历史表';




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
) ENGINE = InnoDB AUTO_INCREMENT = 386 COMMENT = '请求资源表; 软删除未启用; resourceId=`${appId}.${pageId}.${actionId}`';



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
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (368,NULL,NULL,'voucherManagement','selectNextVoucherNumber','✅查询下一个凭证号','service','{}','{\"service\": \"voucher\", \"serviceFunction\": \"selectNextVoucherNumber\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (369,NULL,NULL,'voucherManagement','selectPeriodList','✅查询会计期间列表','sql','{}','{ \"table\": \"period\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (370,NULL,'','voucherManagement','selectSubjectList','✅查询科目列表','sql','{}','{ \"table\": \"subject\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (371,NULL,NULL,'voucherManagement','insertVoucherEntryItem','✅添加凭证条目','sql','{}','{ \"table\": \"voucher_entry\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (372,NULL,NULL,'voucherManagement','createVoucherAndVoucherEntry','✅添加凭证和条目','service','{}','{\"service\": \"voucher\", \"serviceFunction\": \"createVoucherAndVoucherEntry\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (373,NULL,'','accountDetailsManagement','selectSubjectList','✅查询科目列表','sql','{}','{ \"table\": \"subject\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (374,NULL,NULL,'accountDetailsManagement','selectVoucherEntryList','✅添加凭证条目列表','sql','{}','{ \"table\": \"view01_voucher_entry\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (375,NULL,'{\"after\": [{\"service\": \"subject\", \"serviceFunction\": \"countSubjectGeneralLedger\"}]}','generalLedgerManagement','selectItemList','✅查询总账','sql','{}','{ \"table\": \"view01_subject_balance\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (376,NULL,'','assetsAndLiabilitiesManagement','selectItemList','✅查询资产负债列表','sql','{}','{ \"table\": \"view01_balance_sheet\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (377,NULL,NULL,'assetsAndLiabilitiesManagement','selectSubjectList','✅查询科目列表','sql','{}','{ \"table\": \"subject\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (378,NULL,NULL,'accountDetailsManagement','selectPeriodList','✅查询会计期间列表','sql','{}','{ \"table\": \"period\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (379,NULL,NULL,'subjectManagement','countSubjectBalance','✅重新计算科目余额','service','{}','{\"service\": \"subject\", \"serviceFunction\": \"countSubjectBalance\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (380,NULL,NULL,'assetsAndLiabilitiesManagement','selectFormulaList','✅获取公式列表','sql','{}','{ \"table\": \"profit_formula\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (381,NULL,NULL,'assetsAndLiabilitiesManagement','insertFormulaItem','✅创建公式','sql','{}','{ \"table\": \"profit_formula\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (382,NULL,NULL,'assetsAndLiabilitiesManagement','deleteFormulaItem','✅删除公式','sql','{}','{ \"table\": \"profit_formula\", \"operation\": \"delete\" }','','','insert',NULL,NULL,NULL);



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
) ENGINE = InnoDB AUTO_INCREMENT = 5 COMMENT = '用户session表; deviceId 维度;软删除未启用;';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: balance_sheet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `balance_sheet`;
CREATE TABLE `balance_sheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balanceSheetId` varchar(255) DEFAULT NULL COMMENT '项目;',
  `direction` varchar(255) DEFAULT NULL COMMENT '方向; 借、贷',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 65 COMMENT = '资产负债表';



INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'短期投资','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (4,'应收票据','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (5,'应收账款','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (6,'预付账款','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (7,'应收股利','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (8,'应收利息','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (9,'其他应收款','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (10,'存货','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (12,'在产品','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (13,'库存商品','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (14,'周转材料','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (15,'其他流动资产','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (16,'流动资产合计','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (17,'非流动资产','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (18,'长期债券投资','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (19,'长期股权投资','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (20,'固定资产原价','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (21,'减：累计折旧','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (22,'固定资产账面价值','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (23,'在建工程','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (24,'工程物资','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (25,'固定资产清理','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (26,'生产性生物资产','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (27,'无形资产','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (28,'开发支出','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (29,'长期待摊费用','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (30,'其他非流动资产','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (31,'非流动资产合计','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (32,'资产总计','借','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (34,'短期借款','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (35,'应付票据','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (36,'应付账款','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (37,'预收账款','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (38,'应付职工薪酬','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (39,'应交税费','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (40,'应付利息','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (41,'应付利润','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (42,'其他应付款','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (43,'其他流动负债','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (45,'非流动负债：','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (46,'长期借款','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (47,'长期应付款','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (48,'递延收益','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (49,'其他非流动负债','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (50,'非流动负债合计','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (51,'负债合计','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (59,'实收资本（或股本）','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (60,'资本公积','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (61,'盈余公积','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (62,'未分配利润','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (63,'所有者权益（或股东权益）合计','贷','insert',NULL,NULL,NULL);
INSERT INTO `balance_sheet` (`id`,`balanceSheetId`,`direction`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (64,'负债和所有者权益（或股东权益）总计','贷','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: period
# ------------------------------------------------------------

DROP TABLE IF EXISTS `period`;
CREATE TABLE `period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `periodId` varchar(255) DEFAULT NULL COMMENT '会计期间; 月份维度 E.g: 2023-03',
  `isCheckout` varchar(255) DEFAULT NULL COMMENT '是否结算;',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 COMMENT = '会计区间表';



INSERT INTO `period` (`id`,`periodId`,`isCheckout`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,'2022-11',NULL,'insert','admin','系统管理员','2022-11-25T21:26:40+08:00');
INSERT INTO `period` (`id`,`periodId`,`isCheckout`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'2022-10',NULL,'insert','admin','系统管理员','2022-11-25T21:27:57+08:00');
INSERT INTO `period` (`id`,`periodId`,`isCheckout`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'2022-09',NULL,'insert','admin','系统管理员','2022-11-25T21:28:15+08:00');
INSERT INTO `period` (`id`,`periodId`,`isCheckout`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (4,'2022-08',NULL,'insert','admin','系统管理员','2022-11-29T23:04:33+08:00');



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: profit_formula
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profit_formula`;
CREATE TABLE `profit_formula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` varchar(255) DEFAULT NULL COMMENT '科目编码;',
  `balanceSheetId` varchar(255) DEFAULT NULL COMMENT '资产负债id;',
  `countDirection` varchar(1) NOT NULL COMMENT '运算符号; +、-',
  `accessRule` varchar(20) NOT NULL DEFAULT '' COMMENT '取数规则; 余额、借方余额、贷房余额、科目借方余额、科目贷方余额',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 25 COMMENT = '资产负债计算规则';



INSERT INTO `profit_formula` (`id`,`subjectId`,`balanceSheetId`,`countDirection`,`accessRule`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (15,'2002','短期投资','+','余额','insert','admin','系统管理员','2022-11-29T14:41:53+08:00');
INSERT INTO `profit_formula` (`id`,`subjectId`,`balanceSheetId`,`countDirection`,`accessRule`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (16,'1001','短期投资','+','余额','insert','admin','系统管理员','2022-11-29T14:41:57+08:00');
INSERT INTO `profit_formula` (`id`,`subjectId`,`balanceSheetId`,`countDirection`,`accessRule`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (17,'1001','应收票据','+','余额','insert','admin','系统管理员','2022-11-29T14:44:07+08:00');
INSERT INTO `profit_formula` (`id`,`subjectId`,`balanceSheetId`,`countDirection`,`accessRule`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (18,'3000','应收票据','+','余额','insert','admin','系统管理员','2022-11-29T14:44:07+08:00');
INSERT INTO `profit_formula` (`id`,`subjectId`,`balanceSheetId`,`countDirection`,`accessRule`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (19,'1002','应收票据','+','余额','insert','admin','系统管理员','2022-11-29T14:44:07+08:00');
INSERT INTO `profit_formula` (`id`,`subjectId`,`balanceSheetId`,`countDirection`,`accessRule`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (20,'3000','应收账款','+','余额','insert','admin','系统管理员','2022-11-29T20:48:03+08:00');
INSERT INTO `profit_formula` (`id`,`subjectId`,`balanceSheetId`,`countDirection`,`accessRule`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (21,'1000','其他应付款','+','余额','insert','admin','系统管理员','2022-11-29T22:28:08+08:00');
INSERT INTO `profit_formula` (`id`,`subjectId`,`balanceSheetId`,`countDirection`,`accessRule`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (23,'1002','其他应收款','+','余额','insert','admin','系统管理员','2022-11-29T22:29:15+08:00');
INSERT INTO `profit_formula` (`id`,`subjectId`,`balanceSheetId`,`countDirection`,`accessRule`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (24,'2002','其他应收款','+','余额','insert','admin','系统管理员','2022-11-29T23:24:11+08:00');



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: question_bank
# ------------------------------------------------------------

DROP TABLE IF EXISTS `question_bank`;
CREATE TABLE `question_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topicType` varchar(255) DEFAULT NULL COMMENT '题目类型;',
  `topicTitle` varchar(1000) DEFAULT NULL COMMENT '题目标题;',
  `topicAnswer` text COMMENT '题目答案;',
  `answerKeyword` varchar(255) DEFAULT NULL COMMENT '答案关键词;',
  `answerParse` varchar(255) DEFAULT NULL COMMENT '答案解析;',
  `topicScore` varchar(255) DEFAULT NULL COMMENT '题目评分;',
  `optionA` varchar(255) DEFAULT NULL COMMENT '选项A',
  `optionB` varchar(255) DEFAULT NULL COMMENT '选项B',
  `optionC` varchar(255) DEFAULT NULL COMMENT '选项C',
  `optionD` varchar(255) DEFAULT NULL COMMENT '选项D',
  `optionE` varchar(255) DEFAULT NULL COMMENT '选项E',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 350;



INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (170,'单选题','截止到12月31日，厂家系统中已确认但未使用的返利，允不允许计入当年的考核业绩。','A',NULL,'截止到12月31日，厂家系统中已确认但未使用的返利，允许计入当年的考核业绩，但在次年使用后要进行剔除。',NULL,'允许','不允许',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (171,'单选题','银行余额调节表是根据（）填写的？','C',NULL,'无',NULL,'银行对账单余额','银行日记账余额','未达账项','银行流水',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (172,'多选题','企业在人才招选上的障碍有哪些','ABC',NULL,NULL,NULL,'不重视','不投入时间和精力','不参与','不喜欢',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (173,'单选题','截止到12月31日，厂家系统中已确认但未使用的返利，允不允许计入当年的考核业绩。','A',NULL,'截止到12月31日，厂家系统中已确认但未使用的返利，允许计入当年的考核业绩，但在次年使用后要进行剔除。',NULL,'允许','不允许',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (174,'问答题','您觉得所属公司在招聘工作上有哪些点来吸引人才，以此改善招聘成功率','无','[]',NULL,'S',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (175,'单选题','除劳动密集型企业以外 选错人的成本是他工资的（）倍?','B',NULL,NULL,NULL,'2倍','3倍','4倍','5倍',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (176,'单选题','除劳动密集型企业以外 选错人的成本是他工资的（）倍?','B',NULL,NULL,NULL,'2倍','3倍','4倍','5倍',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (177,'填空题','挑果岭球痕的价值：传承高尔夫精神和_____，让果岭球痕快速______。','礼仪,恢复',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (178,'多选题','以下哪些是索赔业务存在的退回、拒赔和倒扣问题的主观原因？','CD',NULL,NULL,NULL,'索赔业务存在的退回、拒赔和倒扣问题由来已久，与生俱来','普遍性。几乎覆盖了所有的4S店售后索赔业务','索赔员更换频繁、没有系统培训、没有师承出现断层','售后人员不熟悉DMS系统的索赔模块、索赔员不熟悉索赔模块、财务人员更不熟悉索赔模块',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (179,'填空题','总裁强调了______是公司的宝贵资产；并提出______的教育，______的纪律 团队管理要求','人,爱,铁',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (180,'填空题','在公司运营管理工作中，总裁强调了______是公司的宝贵资产','人',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (181,'单选题','企业内最大的人力成本是什么？','B',NULL,NULL,NULL,'招聘成本','不合格的员工','合格的员工','工资成本',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (182,'单选题','稽核对象涉及的部门不包括下面哪项？','C',NULL,NULL,NULL,'高球部','市场部','总经办','餐厅',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (183,'单选题','课程中心上传的视频可以在哪里下载？','B',NULL,NULL,NULL,'知识库','素材库','课程设置','课程中心',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (184,'填空题','原则上使用期限超过______年的房屋、建筑物、机械、运输工具及其他与生产经营有关的设备、器具、工具等列为公司固定资产。非生产经营主要设备的物品单位价值在______元以上，并且使用期限超过______年的，也应作为固定资产','一|1,2000|两千,两|2',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (185,'问答题','说明：答题前，请认真阅读案例《总经理助理候选人小明-面试记录》（详见“金牌面试官培训”企业微信群），以下5题均须结合此案例进行回答；\n\n\n一、请给总经理助理候选人小明的面试表现，对其胜任力进行评估。\n\n1、请按照顺序依次打分，比如：责任心7分，主动性7分；\n2、以下10个胜任力能力，每项满分10分，保留1位小数点；\n3、任一单项胜任力指标分数低于4.5者，谨慎推荐，较高风险；\n4、分值含义：分值<6不推荐；6=<分值<6.6谨慎推荐，较高风险；6.6=<分值<7.1可考虑较为一般；7.1=<分值<7.5可推荐，尚可； 7.5=<分值<8推荐：良好 ；8=<分值<8.5优秀 ；分值>=8.5杰出\n\n①责任心（ ）分，②主动性（ ）分，\n③成就导向（ ）分，④系统思维（ ）分，\n⑤创新思维（ ）分，⑥沟通协调（ ）分，\n⑦影响力（ ）分，⑧团队管理（ ）分，\n⑨统筹规划（ ）分，⑩决策能力（ ）分。\n⑪总经理助理候选人小明面试评估综合得分（ ）分。（取以上10项平均分）\n','责任心7.2；\n主动性6.8；\n成就导向6.7；\n系统思维5.8；\n创新思维6.5；\n沟通协调6.7；\n影响力7.4；\n团队管理6；\n统筹规划7.2；\n决策能力6.1；\n综合6.6分：谨慎推荐，较高风险      ','责任心,主动性,成就导向,系统思维,创新思维,沟通协调',NULL,'S',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (186,'问答题','行为事件面试（BEI）的核心假设与原理是什么？\n举一个提问候选人案例挖掘的完整问题示例？','无','[]',NULL,'S',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (187,'填空题','所有的费用开支纳入（      ）管理，按照（           ）规定的审批节点进行审批；','预算,授权审批制度',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (188,'单选题','系统交车后，DMS 系统会在（）日后自动上传新车准备单','C',NULL,'系统交车后，DMS 系统会在 7 日后自动上传新车准备单',NULL,'3 日后','5 日后','7 日后','1 日后',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (189,'单选题','收集的油水类商品，例如机油、刹车油、变速箱油等，每月盘点后，列出清单，经售后经理、财务经理和总经理签名后，按照相同产品的成本价入库，财务上视同盘盈，作为（）进行损益，同时调增配件库存。','C',NULL,'收集的油水类商品，例如机油、刹车油、变速箱油等，每月盘点后，列出清单，经售后经理、财务经理和总经理签名后，按照相同产品的成本价入库，财务上视同盘盈，作为营业外收入进行损益，同时调增配件库存。',NULL,'主营业务收入','其他业务收入','营业外收入',NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (190,'单选题','劳动密集型企业 选错人的成本是他工资的（）倍?','D',NULL,NULL,NULL,'3倍','4倍','5倍','6倍',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (191,'单选题','收集的油水类商品，例如机油、刹车油、变速箱油等，每月盘点后，列出清单，经售后经理、财务经理和总经理签名后，按照相同产品的成本价入库，财务上视同盘盈，作为（）进行损益，同时调增配件库存。','C',NULL,'收集的油水类商品，例如机油、刹车油、变速箱油等，每月盘点后，列出清单，经售后经理、财务经理和总经理签名后，按照相同产品的成本价入库，财务上视同盘盈，作为营业外收入进行损益，同时调增配件库存。',NULL,'主营业务收入','其他业务收入','营业外收入',NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (192,'填空题','球痕是球手进攻果岭时被击起的圆形高尔夫球在高空以抛物线轨迹飞行，最后斜落下砸在果岭草坪表面上造成的______和______。','凹陷,斑点',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (193,'多选题','东风日产其他(精品等业务)新E3S_S用户手册包括（）等','ABCD',NULL,NULL,NULL,'02_东风日产新E3S-S_免费保养流程操作手册','03_东风日产新E3S-S_保修申请流程操作手册','04_东风日产新E3S-S_保修鉴定流程操作手册','12_东风日产新E3S-S_召回专案流程操作手册',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (194,'单选题','劳动密集型企业 选错人的成本是他工资的（）倍?','D',NULL,NULL,NULL,'3倍','4倍','5倍','6倍',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (195,'填空题','熊总监带领着团队制定了部门共同愿景，目的是让_____的目标成为_____的目标，统一思想、凝心聚力。','公司,大家',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (196,'单选题','支票日期10月20日的正确填写规范是（）？','B',NULL,'无',NULL,'拾月贰拾日','零壹拾月零贰拾日','壹拾月贰拾日','壹拾月零贰拾日',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (197,'多选题','民营企业通常企业出现的四大病症','ABCD',NULL,NULL,NULL,'近亲繁殖','有腿就要','一马当先','拔苗助长',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (198,'多选题','招选前要做哪些工作','ABC',NULL,NULL,NULL,'规划','匹配','吸引','培育',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (199,'单选题','现代管理的核心是？','B',NULL,NULL,NULL,'人才','培训','练习','指导',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (200,'填空题','熊总监推行了_____方法，统一了员工的思想，进一步增强了团队凝聚力','用制度管人',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (201,'单选题','知识库如何使用？','A',NULL,NULL,NULL,'管理员可上传文件提供给学员下载','不可以上传文件','完全免费使用','学员不可上传文件',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (202,'问答题','请列出对一位校招候选人面试最为完整的提问清单（请尽量完整、充分，根据完整与充分度打分，不低于7个问题）？','无','[]',NULL,'S',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (203,'多选题','单据审核后的状态有：（）\n；（）；（）','ABC',NULL,'单据审核后的状态有：\n“通过”：暂时单据无误，审核通过；\n“退回”：可修改后再上传；\n“拒绝”：当月不可再上传。',NULL,'“通过”：暂时单据无误，审核通过','“退回”：可修改后再上传','“拒绝”：当月不可再上传。',NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (204,'问答题','二、请结合第1题总经理助理候选人小明的胜任力评估结果，总结其优势有哪些？并请详细说明？\n\n\n示例：责任心：有组织性、自律性，把工作放在第一位，以认真、审慎和坚忍的态度，尽心尽力完成各项工作；对工作高度负责；逻辑思维能力：能通过较强的分析、归纳、演绎等能力发现问题、解决问题，能敏感的感受到事物的变化及变化规律，从而更透彻的理解问题、解决问题；能在复杂的情境中分析出关键问题，看到问题的本质。\n','1、责任心尚可，能按照上级要求执行计划，完成工作任务尚可。 \n2、计划能力尚可：紧跟计划节点，提前预警，让项目紧跟计划进度。\n3、影响力尚可：工作中有较强的影响他人的意识，当不同的观点碰撞时，有时表现固执和强硬，有一定的推动力，尽管可能是因为她本身直属总经理管辖的身份。     ','责任心,计划能力,影响力,统筹规划',NULL,'S',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (205,'单选题','会计稽核的依据不包括下面哪项？','B',NULL,NULL,NULL,'会计制度','税收规定','公司章程','公司制度',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (206,'填空题','经过______后仍不能______的，可申请报废处理','修理,正常使用',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (207,'填空题','所有的费用开支遵循（           ）原则；','2、\t权责发生制',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (208,'单选题','低值易耗品是指单位价值低于（）元的实物资产，在购入时一次性进行摊销。必须根据各部门实际需要进行预算。','B',NULL,'低值易耗品是指单位价值低于2000元的实物资产，在购入时一次性进行摊销。必须根据各部门实际需要进行预算。',NULL,'1000','2000','3000',NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (209,'多选题','招不到人的解决方法有（）？','AB',NULL,NULL,NULL,'流程优化','重新分工','劳务外包','业务外包',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (210,'填空题','打出的球痕需要_____或者_____在离开果岭的时候进行修复','球员,球童',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (211,'单选题','低值易耗品是指单位价值低于（）元的实物资产，在购入时一次性进行摊销。必须根据各部门实际需要进行预算。','B',NULL,'低值易耗品是指单位价值低于2000元的实物资产，在购入时一次性进行摊销。必须根据各部门实际需要进行预算。',NULL,'1000','2000','3000',NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (212,'填空题','高球运作团队一直秉承着_____的事情坚持做的工作理念，实现了“广佛标杆球会“的目标','正确',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (213,'单选题','每日现金余额原则上不得超过（）万元？','D',NULL,'无',NULL,'10','5','3','2',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (214,'单选题','企业支付一个员工1000元，而企业实际上的人力成本在（ ）倍','C',NULL,NULL,NULL,'10倍','5倍','8倍',NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (215,'判断题','索赔业务操作培训的对象仅是索赔员','B',NULL,'索赔业务操作培训的对象不仅是索赔员。包括车间主管、前台主管和售后经理',NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (216,'多选题','招不到人的解决方法有（）？','AB',NULL,NULL,NULL,'流程优化','重新分工','劳务外包','业务外包',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (217,'填空题','熊总监在高尔夫俱乐部运作服务品牌打造上，践行了_____、_____、_____的方法论','学习,思考,创新',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (218,'问答题','下列能力素质指标中，请任选1个进行 行为释义（即此指标应该要有哪些核心的子行为来支撑）？ 针对选出的行为指标（如成就动机）， 做一份针对此能力指标的完整的行为事件面试（BEI）访谈提纲？ 附件:图片.png','无','[]',NULL,'S',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (219,'单选题','企业与企业之间的核心竞争是什么？\n','A',NULL,NULL,NULL,'人才','模式','产品','营销',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (220,'单选题','如果课件比较机密，想做独立存储，建议使用？','B',NULL,NULL,NULL,'素材库','MSOSS','知识库','私有云',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (221,'判断题','新车准备与系统交车时间有关，与“预交车”无关。','A',NULL,'新车准备与系统交车时间有关，与“预交车”无关。',NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (222,'多选题','面谈时常见的问题（）？','ABCD',NULL,NULL,NULL,'面谈变质询','轻易给予薪酬/福利承诺','不做面谈记录','匆忙结束面谈',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (223,'填空题','费用票据首选（            ）发票；如是个人代开发票，发票上需（             ）；如是定额发票，发票上需（                    ），并进行（             ）。','增值税专用,代开个人签名摁手印,公司名称及费用名称,真伪查询',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (224,'问答题','三、请结合第1题总经理助理候选人小明的胜任力评估结果，总结其风险/可提升点有哪些？并请详细说明？\n\n\n示例：主动性：工作中竞争意识和紧迫感不强，可能略显被动，倾向于温和、宽容、放松；喜欢用慢节奏及较为轻松的工作方式来完成工作；创新能力：喜欢用传统的既定方法行事，和大多数人相比，很少尝试新的做法，对新事物、新观念的敏感性不强；做事较为保守和谨慎，且喜欢依赖过去的经验和规则，没有积极创新的意识，不希望承担改革的风险。\n','1、系统思维较弱：自己的工作未形成系统的思路，分析、归纳、演绎等能力较弱，不太能敏感的感受到事物的变化及变化规律，逻辑思维能力、理解能力一般。面试官在询问一些关于组织结构相关的问题时，回答的内容比较杂乱，需要面试官再次追问拉回主题。 \n2、总体的决策能力偏弱：因为系统思维能力较弱，目标性不强，不太能独立对事件做出自己的判断，较难做出有效的高质量决策，尽管是总经理助理岗位，但并没有真正学习到上级领导做出决策的底层逻辑。自我认知不清晰：在职业选择上，摇摆不定，左思右想，以拖待定，不太能正确抉择；在短期利益上斤斤计较且不切实际，并不是特别清楚当前最重要的是给自己历练的机会，在涉及自己职业发展的大是大非方面不够智慧、明白。\n3、团队管理较弱，没有团队管理经验，在与别人的合作中， 有时不太能尊重员工，而是以比较强硬的方式进行任务督办，不太懂得提升团队能力与士气，属于压迫式沟通，虽对员工产生了推动影响，但长期来看，对团队的氛围极有可能产生较为负面的影响。\n4、主动性、成就导向、创新能力一般：在岗位上接触业务后，不但没有努力去学习适应，在岗位上还产生了迷茫而离职。在从人力资源岗位转岗到助理后，总体习惯做一些简单的助理工作，没有主动去学习相关专业的知识且不断精进进取，总体的成就动机、创新性、主动性有限。','系统思维,统筹规划,决策能力,团队管理,主动性,成就导向',NULL,'S',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (225,'单选题','会计流程中，哪个目标是每一个步骤都涉及的','A',NULL,NULL,NULL,'准确','完整 ','及时','高效',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (226,'填空题','对不能使用的固定资产，应由______及时提出办理报废手续，进行报废和处置','使用部门',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (227,'判断题','核销码属于特殊返利','B',NULL,'核销码随车核算返利，不属于特殊返利（特殊返利指的是除了固定返利外的其他返利，一般指的是不以提交车考核为前提的返利。如新建店返利，广宣费返利。）',NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (228,'填空题','如果球痕没有及时修复，会影响果岭表面均一、平滑的品质，减慢果岭的速度 ，会影响后组客人的_____。','推杆',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (229,'问答题','请根据熊总监分享的团队打造成功案例，结合所在公司或部门团队管理情况来思考，如何加强团队建设和管理？至少写3点以上并可以有效落地','无','[]',NULL,'S',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (230,'判断题','核销码属于特殊返利','B',NULL,'核销码随车核算返利，不属于特殊返利（特殊返利指的是除了固定返利外的其他返利，一般指的是不以提交车考核为前提的返利。如新建店返利，广宣费返利。）',NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (231,'多选题','设置出纳岗位的目的？','ABC',NULL,'无',NULL,'货币资金合理流动','货币资金安全完整','货币资金准确核算','货币资金及时收付',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (232,'判断题','操作手册只是指导如何操作厂家的DMS系统。但索赔业务的技术性辅导，车间主管、前台主管和售后经理必须担起责任。','A',NULL,NULL,NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (233,'判断题','营销做的好的公司是因为培训做的好。','A',NULL,NULL,NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (234,'问答题','请根据熊总监分享的团队打造成功案例，结合所在公司或部门团队管理情况来思考，如何加强团队建设和管理？至少写3点以上并可以有效落地','无','[]',NULL,'S',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (235,'多选题','面谈时常见的问题（）？','ABCD',NULL,NULL,NULL,'角色互换','封闭式的问话','面谈者本身不当的情绪反应','过度渲染工作以吸引应征者',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (236,'判断题','积分可以兑换勋章','A',NULL,NULL,NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (237,'多选题','面谈时常见的问题（）？','ABCD',NULL,NULL,NULL,'角色互换','封闭式的问话','面谈者本身不当的情绪反应','过度渲染工作以吸引应征者',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (238,'填空题','固定资产报废流程分为5步执行：1）______，2）______，3）______，4）______，5）______、销卡。','部门申请,评审,审批,资产报废处置,资产销账',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (239,'判断题','系统交车 30 天后，新车准备将无法再上传通过','A',NULL,'系统交车 30 天后，新车准备将无法再上传通过',NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (240,'填空题','业务部门按照（              ）计算业绩提成，严禁超出（           ）核算工资；','审批通过的绩效考核方案,绩效考核方案范围',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (241,'问答题','听完这堂课后，您觉得怎样提升所在公司的运营管理能力？请阐述观点','无','[]',NULL,'S',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (242,'判断题','2022年受疫情影响的区域，2023年设定预算目标时，可以适当考虑不可抗力因素。','B',NULL,'2022年受疫情影响的区域，2023年要按照正常经营情况设定预算目标，不对不可抗力等或许存在的因素进行估计。',NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (243,'填空题','被砸出的凹陷下面土壤变得紧实，影响排水和透气，凹陷容易积水，再加上凹陷里面有脱落的草屑，这些问题都导致滋生_____，球痕恢复缓慢。','青苔',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (244,'问答题','四、根据总经理助理候选人小明的面试表现，结合风神集团价值观（学习、思考、创新；务实、前瞻、超越；感恩、敬畏、和谐；），对匹配情况进行说明？','1、学习、思考与创新：总体来说不太能对事物进行深层次的分析和判断，思考力更多是浅藏辄止，流于表面，进而更谈不上创新。 如其在不熟悉的高新企业工作，因为自己不懂、不专业，工作不到一年就轻易放弃，这说明对未知领域的学习、思考、创新能力较为一般。\n \n2、务实、前瞻、超越：不太务实、脚踏实地，有些好高骛远，谈不上务实、前瞻与超越。自己喜欢的女装品牌工作了不到1年，因为企业文化和管理方式的不认同而放弃，这种态度反映出1）初入职场完全以个人的好恶来武断的评价企业的经营和管理能力，在性格上体现出好高骛远，不能脚踏实地的踏踏实实的工作。2）遇到心中的困惑和困难时，无法用正确的态度，采取积极向上的方式去面对和解决，而是采取消极、逃避的方式处理，放弃自己进一步成长的机会。 去ABC公司，该公司业态较多，学习机会较多，但其从刚入职的运营管理部-----助理-----计划岗位，整个工作的各个岗位的内容描述相当的混乱，工作三年对组织架构、人员管理等等都不是很了解，在公司内也没有体现出带团队的管理经验，也没有凸显出专业的管理水平。在谈薪资时，在自己职业规划不清晰，沉淀有限的情况下，一定要谈一个有些不切实际的薪资，否则就放弃这个工作机会，总体比较好高骛远，想得多，朝想的方向去的时候很多关键时候就选择退缩。\n\n3、感恩、敬畏、和谐：在面试过程中更多的强调自己在工作中发现的问题，而未曾体现出上述三家公司给自己成长机会的感恩之心，敬畏之心，和谐方面总体比较自私，对组织氛围的正向影响较弱，需谨慎考虑。    ','学习,思考,创新,务实,前瞻,超越',NULL,'S',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (245,'单选题','流程与制度缺失的责任主体是','C',NULL,NULL,NULL,'部门负责人','财务经理','总经理','稽核对象',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (246,'判断题','2022年受疫情影响的区域，2023年设定预算目标时，可以适当考虑不可抗力因素。','B',NULL,'2022年受疫情影响的区域，2023年要按照正常经营情况设定预算目标，不对不可抗力等或许存在的因素进行估计。',NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (247,'多选题','出纳的职能（）？','ABCD',NULL,'无',NULL,'收付职能','反映职能','监督职能','管理职能',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (248,'判断题','暂估收入与营业日报表中保修配件成本是匹配的','A',NULL,NULL,NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (249,'判断题','培训不是最好的投资。','B',NULL,NULL,NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (250,'问答题','听完这堂课后，您觉得怎样提升所在公司的运营管理能力？请阐述观点','无','[]',NULL,'S',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (251,'多选题','面谈时常见的问题（）？','ABC',NULL,NULL,NULL,'疏于准备，不了解工作内容','任用资格过高者，而不是选择最合适的人 选','强求提“隐私性”问题',NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (252,'判断题','积分可以设置每日上限','A',NULL,NULL,NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (253,'填空题','市场活动涉及的礼品由（         ）、（         ）相关人员共同询价后采购，礼品盘点表每月（     ）日前上交；','市场部,综管部,5',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (254,'填空题','《报废申请单》上要详细填写______，______，______，______，等，并附上所报废的固定资产______。','资产编码,名称,规格型号,报废原因,近照',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (255,'判断题','线上税控开票的，如在线上作废，可马上在线上重新开票；如线下作废，则马上对当月发票重新线上税控开票；','B',NULL,'线上税控开票的，如在线上作废，可马上在线上重新开票；如线下作废，则无法对当月发票重新线上税控开票；',NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (256,'填空题','挑球痕步骤1、轻轻刮起并拿走凹陷里面脱落的_____。','草屑',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (257,'问答题','为什么要打造公司的服务品牌？如果你要为所在公司打造服务品牌来提高公司的影响力，会从哪些方面进行着手？','无','[]',NULL,'S',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (258,'判断题','2023年权责分析报表定义为管理报表，按照配比原则，确认各项收入对应的成本。新车按照开票确认该车的提交车返利，不考虑预交车的交车返利。','A',NULL,'2023年权责分析报表定义为管理报表，按照配比原则，确认各项收入对应的成本。新车按照开票确认该车的提交车返利，不考虑预交车的交车返利。',NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (259,'问答题','五、请结合第1-4题总经理助理候选人小明的面试表现，给出您的面试结论？\n\n\n示例：责任心强，有组织性、自律性，把工作放在第一位，以认真、审慎和坚忍的态度，尽心尽力完成各项工作。能从全局出发，配合组织工作的需要而调整工作内容，能独立思考及判断，不受他人影响。进取心不强，习惯按部就班的工作，可以承受一定的工作压力，贡献度较高。性格内向，不善于沟通合作，倾向于可独立处理的个人任务，无团队领导经验，领导力展现不足。\n','谨慎推荐，较高风险，培养价值及其发展潜力不高。      \n总体：候选人（较低层面）责任心强，能够完成自己的工作任务，有一定的督办、计划监控经验。系统思维与高质量决策能力较弱，主动性、成就导向、创新能力一般，强势压迫式沟通，无团队领导经验，与公司价值观总体匹配度不高。','谨慎推荐,较高风险,价值观',NULL,'S',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (260,'单选题','核对训练中心系统结算单与纸质账单有无差异，相应时间为','C',NULL,NULL,NULL,'1日','2日','3日','1周',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (261,'判断题','2023年权责分析报表定义为管理报表，按照配比原则，确认各项收入对应的成本。新车按照开票确认该车的提交车返利，不考虑预交车的交车返利。','A',NULL,'2023年权责分析报表定义为管理报表，按照配比原则，确认各项收入对应的成本。新车按照开票确认该车的提交车返利，不考虑预交车的交车返利。',NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (262,'判断题','支票大小写金额填写可以不一致。','B',NULL,'支票大小写金额填写要一致。',NULL,'对','错',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (263,'判断题','未经厂家确认可以赔付的保修收入，作为收入在当月确认','B',NULL,'未经厂家确认可以赔付的保修收入，都不能作为收入在当月确认',NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (264,'判断题','招聘人才比培养人才更重要。','A',NULL,NULL,NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (265,'多选题','面谈时常见的问题（）？','ABC',NULL,NULL,NULL,'重视与工作无关的因素，询问与工作无关 的问题 (“脱线风筝”现象)','偏见：对曾经的行业，职业等有偏见','受对方容貌或非语言行为左右',NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (266,'填空题','市场活动费用报销附件（      ）、（       ）、（       ）、（       ），如有礼品赠送，外加（          ） ；','费用报销单,发票,活动申请,活动总结,礼品出入库单据',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (267,'判断题','积分清零后可以恢复','B',NULL,NULL,NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (268,'问答题','为什么要打造公司的服务品牌？如果你要为所在公司打造服务品牌来提高公司的影响力，会从哪些方面进行着手？','无','[]',NULL,'S',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (269,'填空题','固定资产确需报废的查明______，分清______，如是______或丢失，根据相关条款要追究______的经济责任','原因,责任,人为损坏,当事人',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (270,'填空题','首二保保修发票也是评定保修级别的一部分，如开错发票一次扣分_分，所以大家一定要注意。','5',NULL,'首二保保修发票也是评定保修级别的一部分，如开错发票一次扣分5分，所以大家一定要注意。','Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (271,'填空题','挑球痕步骤2、使用工具从球痕两边（进攻方向的左右两边）斜插下去后以适当的力度将凹陷下面被打紧的_____轻轻撬松。','土壤',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (272,'多选题','熊总监入职后带着总裁的期望，通过哪些举措，打造了一支“有爱”、有“战斗力”、有“奉献精神”和职业自豪感的团队？','ABCDEF',NULL,NULL,NULL,'制定部门共同愿景','提前预判矛盾，提前预防做好预案','熟悉团队，了解团队，发现问题，着手进行团队改造','制定管理制度和工作标准（SOP）','树立标杆，保持学习，持续精进 ');
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (273,'判断题','计入固定资产的投入，视金额大小有的当期全部费用化，有的以长摊和折旧的形式逐年费用化。','B',NULL,'凡计入固定资产的投入，不能当期全部费用化，要以长摊和折旧的形式逐年费用化。',NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (274,'判断题','出纳人员应每日填写现金日记账及银行日记账，并核对余额。','A',NULL,'无',NULL,'对','错',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (275,'填空题','稽核是??和??的简称?','稽查,复核',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (276,'判断题','计入固定资产的投入，视金额大小有的当期全部费用化，有的以长摊和折旧的形式逐年费用化。','B',NULL,'凡计入固定资产的投入，不能当期全部费用化，要以长摊和折旧的形式逐年费用化。',NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (277,'判断题','企业的竞争就是人才的竞争，也是培训的竞争。','A',NULL,NULL,NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (278,'填空题','厂家确认期间是每月的_,号到次月的_日','26,25',NULL,'厂家确认期间每月的26号到次月的25日','Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (279,'判断题','过度渲染工作以吸引应征者,可以嘛？','B',NULL,NULL,NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (280,'判断题','魔学院后台管理员人数只能设置3个','B',NULL,NULL,NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (281,'填空题','车辆油费报销附件（       ）、（       ）、（        ）；','费用报销单,发票,车辆用油明细',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (282,'多选题','熊总监入职后带着总裁的期望，通过哪些举措，打造了一支“有爱”、有“战斗力”、有“奉献精神”和职业自豪感的团队？','IHGFEDCBA',NULL,NULL,NULL,'部门共同愿景','明确的目标','工作职责、工作流程、工作标准的优化','管理机制的建立','骨干培训 ');
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (283,'填空题','挑球痕步骤3、从球痕四边斜插并将周边_____挤向球痕中间以填补凹陷。','草坪',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (284,'问答题','线上开票开 10 月保修发票自动开了 3 张，其中一张有问题需要作废，是一起作废 3 张，还是只作废错的 1 张？','（1）如果是通过系统开的就要三张作废，因为三张是一起生成的；','作废','线上开票开 10 月保修发票自动开了 3 张，其中一张有问题需要作废，是一起作废 3 张，还是只作废错的 1 张？\n（1）如果是通过系统开的就要三张作废，因为三张是一起生成的；\n（2）也可以只作废一张，线下重新开，再使用线下开票的方法选择并登记发票号。','Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (285,'判断题','预算是按照商务政策归属期计算的返利，预算分权责和收付，预算利润目标，即是责任人的考核目标；','B',NULL,'预算是按照商务政策归属期计算的返利，预算只有原则，不分权责和收付，预算利润目标，即是责任人的考核目标；',NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (286,'判断题','不合格的员工会损害公司的同事利益','A',NULL,NULL,NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (287,'填空题','《报废申请单》审批通过后，由______负责人牵头，会同______和______共同参与固定资产报废处置','人事行政部,使用部门,财务部',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (288,'填空题','《稽核岗位日常工作流程》的行文单位???','集团财管中心|集团财务管理中心',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (289,'判断题','预算是按照商务政策归属期计算的返利，预算分权责和收付，预算利润目标，即是责任人的考核目标；','B',NULL,'预算是按照商务政策归属期计算的返利，预算只有原则，不分权责和收付，预算利润目标，即是责任人的考核目标；',NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (290,'填空题','无法在账面上披露DMS系统已结算的保修收入和_确认开票的差异','厂家',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (291,'填空题','节日福利报销附件（       ）、（       ）、（        ）、（         ）、（         ）；','费用报销单,发票,节日福利申请,领取明细表,部门费用分摊表',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (292,'判断题','面试过程可以轻易承诺薪酬福利嘛？','B',NULL,NULL,NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (293,'判断题','积分兑换商品只能自提','B',NULL,NULL,NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (294,'填空题','挑球痕步骤4、使用_____或者_____，将挑松了的、挤向凹陷中间的草坪打紧、打平，一定要与周边原有的果岭草坪高度_____。','鞋底,推杆,一致',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (295,'判断题','A06水平预算。交车数量包含内部调拨和外部调拨车辆。','B',NULL,'A06水平预算，交车数量不包含内部调拨和外部调拨车辆，原来是包含内部调拨和外部调拨车辆。2023 年A06水平预算更改了口径，交车数量取数是我们的展厅加上二网。',NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (296,'填空题','责任担当中规定：超过??次以上直属上司承担连带责任?','三|3',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (297,'多选题','不合格的员工会伤害公司哪些利益？','ABCD',NULL,NULL,NULL,'伤害客户','伤害同事','伤害领导','伤害企业形象','伤害自己');
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (298,'填空题','参加厂家培训结束后（    ）内完成转训；','15',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (299,'判断题','A06水平预算。交车数量包含内部调拨和外部调拨车辆。','B',NULL,'A06水平预算，交车数量不包含内部调拨和外部调拨车辆，原来是包含内部调拨和外部调拨车辆。2023 年A06水平预算更改了口径，交车数量取数是我们的展厅加上二网。',NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (300,'填空题','资产处置残值金额超过______元以上的，需寻找______家以上购买商比价，由______最终批准','1000|一千,3|三,总经理',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (301,'单选题','选择（）的候选人？','B',NULL,NULL,NULL,'最优秀的','最合适的',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (302,'填空题','如果挑高隆起的球痕草坪没有经鞋底或者推杆打平，隆起的草坪会在次天_____的时候被修剪掉，导致更大、更难恢复的球斑','果岭修剪',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (303,'多选题','轮播图可以添加哪些内容？','ABCD',NULL,NULL,NULL,'可添加活动','可链接课程','可添加培训','可添加外部链接',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (304,'填空题','财务稽核是按照稽核程序，以会计制度、？？？？、公司制度为依据，对公司发生的各种经营收入，所进行的一种以？？？？性、？？？？性、？？？？性和？？？？性为要求的监督和检查活动。','公司章程,真实,准确,及时,完整',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (305,'多选题','传统管理是指哪些？','ABCE',NULL,NULL,NULL,'监督','指挥','命令','培训','考核');
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (306,'判断题','参加厂家的新车上市或厂家认证培训费属于差旅费','B',NULL,'参加厂家的新车上市或者是厂家的认证培训都是属于培训费。不能属于差旅费了。',NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (307,'填空题','员工借款遵循（                ）的原则；预借差旅费，借款归还时间为（                ）。','上次不清下次不借,出差结束后7日内',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (308,'判断题','参加厂家的新车上市或厂家认证培训费属于差旅费','B',NULL,'参加厂家的新车上市或者是厂家的认证培训都是属于培训费。不能属于差旅费了。',NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (309,'填空题','编制内的固定资产因报废而再______情况，需走报废流程，审批后，才可______，______后须附上已审批的报废单','新购,新购,申购单',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (310,'单选题','面试过程中，谁发言更多比较好？','B',NULL,NULL,NULL,'面试官','候选人',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (311,'多选题','个性化设置可以有哪些内容？','ABCD',NULL,NULL,NULL,'模块','图标','APP底部导航','PC导航',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (312,'填空题','变动性费用与收入、数量成正相关的，绝对值可以增长，但_（即费用率）必须下调','占比',NULL,'变动性费用与收入、数量成正相关的，绝对值可以增长，但占比（即费用率）必须下调','Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (313,'多选题','现代化管理是指哪些？','ACDE',NULL,NULL,NULL,'帮助','监督','指导','激励','训练');
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (314,'填空题','违反各项费用管理要求中的任意一条，除按规定整改外，对经办人罚款（  ）元/次，部门负责人连带（    ）。','50,50%',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (315,'填空题','变动性费用与收入、数量成正相关的，绝对值可以增长，但_（即费用率）必须下调','占比',NULL,'变动性费用与收入、数量成正相关的，绝对值可以增长，但占比（即费用率）必须下调','Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (316,'多选题','招聘理念（）？','ABC',NULL,NULL,NULL,'有超高的人才密度吸引人才','让招聘部门成为业务部门','优秀人才是免费的',NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (317,'多选题','魔学院可以对接哪些第三方？','ABCD',NULL,NULL,NULL,'企微','钉钉','飞书','泛微',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (318,'填空题','遇人事行政部资产管理员缺岗的情况，由______代理','人事行政部负责人',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (319,'填空题','自2022预算年度开始，向集团拆借的运营资金必须费用化，执行年化_%利率，按年复利计息。','9',NULL,'自2022预算年度开始，向集团拆借的运营资金必须费用化，执行年化9%利率，按年复利计息。','Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (320,'问答题','费用报销单填写要求','1、使用黑色签字笔书写，不允许涂改，大小写必须一致；\n2、要素填写齐全，附件使用胶水粘贴整齐，不得使用订书针、大头钉和回形针；\n3、按业务类别分门别类填写报销单，不能混合填写；\n','黑色,涂改,大小写,不能混合,业务类别,不得使用',NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (321,'多选题','企业与企业之间主要有哪些竞争？','BCD',NULL,NULL,NULL,'营销','模式','产品','人才',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (322,'单选题','人力资源策略来源于（）？','A',NULL,NULL,NULL,'公司业务策略','人力资源策略','财务策略','运营策略',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (323,'多选题','培训计划中可以添加哪些？','ABCD',NULL,NULL,NULL,'考试','课程','活动','评估',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (324,'填空题','自2022预算年度开始，向集团拆借的运营资金必须费用化，执行年化_%利率，按年复利计息。','9',NULL,'自2022预算年度开始，向集团拆借的运营资金必须费用化，执行年化9%利率，按年复利计息。','Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (325,'填空题','小额维修必须进行_。升级改造，厂家有支持的，厂家支持计入当期业绩，升级改造费用按5年摊销，计入当期实绩。','预算',NULL,'小额维修必须进行预算。升级改造，厂家有支持的，厂家支持计入当期业绩，升级改造费用按5年摊销，计入当期实绩。','Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (326,'填空题','培训很贵，但_更贵。','不培训',NULL,NULL,'S',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (327,'单选题','招聘策略来源于（）？','B',NULL,NULL,NULL,'公司业务策略','人力资源策略','财务策略','运营策略',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (328,'多选题','调查问卷有哪些题型？','ABCD',NULL,NULL,NULL,'单选','多选','描述','打分',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (329,'填空题','小额维修必须进行_。升级改造，厂家有支持的，厂家支持计入当期业绩，升级改造费用按5年摊销，计入当期实绩。','预算',NULL,'小额维修必须进行预算。升级改造，厂家有支持的，厂家支持计入当期业绩，升级改造费用按5年摊销，计入当期实绩。','Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (330,'填空题','各单位在预算执行过程中，双月考核利润指标完成率最低的单位，回集团进行述职。同一单位_次以上述职，扣除店总经理当年绩效。','两|2',NULL,'各单位在预算执行过程中，双月考核利润指标完成率最低的单位，回集团进行述职。同一单位两次以上述职，扣除店总经理当年绩效。','Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (331,'填空题','对外招聘人才与对内发掘人才成本代价更小的是____','对内发掘',NULL,NULL,'S',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (332,'多选题','招聘策略包括（）？','ABC',NULL,NULL,NULL,'人员预算','招聘计划','招聘渠道','招聘流程',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (333,'填空题','勋章分为_和_','日常勋章,限量勋章',NULL,NULL,'Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (334,'问答题','企业为什么要培训？有什么作用？','成本、培训',NULL,NULL,'S',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (335,'填空题','各单位在预算执行过程中，双月考核利润指标完成率最低的单位，回集团进行述职。同一单位_次以上述职，扣除店总经理当年绩效。','两|2',NULL,'各单位在预算执行过程中，双月考核利润指标完成率最低的单位，回集团进行述职。同一单位两次以上述职，扣除店总经理当年绩效。','Z',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (336,'单选题','招聘流程的第1步是？','D',NULL,NULL,NULL,'简历筛选','面试环节','面试评估','职位发布',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (337,'问答题','魔学院对接企业微信的意义是什么？','可以实现免登录，消息同步和组织架构同步，企业微信管理后台的人员变动，可以实时同步到魔学院后台，帮助管理员节省时间，提高效率','免登录,消息同步,组织架构同步',NULL,'S',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (338,'问答题','企业内的人力成本有哪些？最大的人力成本是什么？','对内挖掘、不合格的员工',NULL,NULL,'S',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (339,'单选题','招聘流程的第5步是？','D',NULL,NULL,NULL,'简历筛选','入职管理','面试评估','录用通知',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (340,'单选题','招聘流程的最后1步是？','C',NULL,NULL,NULL,'签订劳动合同','入职管理','试用期管理','录用通知',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (341,'判断题','招聘是否等于面试？','B',NULL,NULL,NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (342,'单选题','培养与选择哪个更重要？','B',NULL,NULL,NULL,'培养','选择',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (343,'判断题','选择比培养更重要？','A',NULL,NULL,NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (344,'判断题','培养比选择更重要？','B',NULL,NULL,NULL,'正确','错误',NULL,NULL,NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (345,'多选题','内部招聘的优点？','ABCD',NULL,NULL,NULL,'了解全面，准确性高','可鼓舞士气，激励员工','可更快适应工作','选择费用低',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (346,'多选题','内部招聘的优点？','BD',NULL,NULL,NULL,'平息或缓和内部竞争者间的矛盾','使组织培训投资得到回报','人才现成，节省培训投资','可鼓舞士气，激励员工',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (347,'多选题','内部招聘的缺点？','ABD',NULL,NULL,NULL,'来源局限、水平有限','“近亲繁殖”','可能影响内部员工积极性','可能造成内部矛盾',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (348,'多选题','外部招聘的优点？','ABCD',NULL,NULL,NULL,'来源广、余地大，引入一流人才','人才现成，节省培训投资','平息或缓和内部竞争者间的矛盾','带来新思想、新方法',NULL);
INSERT INTO `question_bank` (`id`,`topicType`,`topicTitle`,`topicAnswer`,`answerKeyword`,`answerParse`,`topicScore`,`optionA`,`optionB`,`optionC`,`optionD`,`optionE`) VALUES (349,'多选题','外部招聘的缺点？','ACD',NULL,NULL,NULL,'进入角色慢','可能造成内部矛盾','可能影响内部员工积极性','了解少',NULL);



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
) ENGINE = InnoDB AUTO_INCREMENT = 13 COMMENT = '科目表';



INSERT INTO `subject` (`id`,`subjectId`,`subjectName`,`subjectCategory`,`subjectBalanceDirection`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'1000','库存现金','资产','借','insert','admin','系统管理员','2022-11-25T22:03:14+08:00');
INSERT INTO `subject` (`id`,`subjectId`,`subjectName`,`subjectCategory`,`subjectBalanceDirection`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (5,'2000','短期借款','负债','贷','insert','admin','系统管理员','2022-11-25T22:09:20+08:00');
INSERT INTO `subject` (`id`,`subjectId`,`subjectName`,`subjectCategory`,`subjectBalanceDirection`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (6,'3000','实收资本','权益','贷','insert','admin','系统管理员','2022-11-25T22:09:41+08:00');
INSERT INTO `subject` (`id`,`subjectId`,`subjectName`,`subjectCategory`,`subjectBalanceDirection`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (7,'1001','银行存款','资产','借','insert','admin','系统管理员','2022-11-25T22:10:19+08:00');
INSERT INTO `subject` (`id`,`subjectId`,`subjectName`,`subjectCategory`,`subjectBalanceDirection`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (8,'2001','应付票据','负债','贷','insert','admin','系统管理员','2022-11-25T22:10:47+08:00');
INSERT INTO `subject` (`id`,`subjectId`,`subjectName`,`subjectCategory`,`subjectBalanceDirection`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (9,'1002','固定资产','资产','借','insert','admin','系统管理员','2022-11-26T15:18:09+08:00');
INSERT INTO `subject` (`id`,`subjectId`,`subjectName`,`subjectCategory`,`subjectBalanceDirection`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (10,'2002','应收票据','负债','借','insert','admin','系统管理员','2022-11-26T15:18:46+08:00');
INSERT INTO `subject` (`id`,`subjectId`,`subjectName`,`subjectCategory`,`subjectBalanceDirection`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (11,'2003','应交税金','负债','贷','insert','admin','系统管理员','2022-11-30T21:19:41+08:00');
INSERT INTO `subject` (`id`,`subjectId`,`subjectName`,`subjectCategory`,`subjectBalanceDirection`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (12,'1003','物质采购','资产','借','insert','admin','系统管理员','2022-11-30T21:20:05+08:00');



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: subject_balance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subject_balance`;
CREATE TABLE `subject_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `periodId` varchar(255) DEFAULT NULL COMMENT '会计期间; E.g: 2023-03',
  `subjectId` varchar(255) DEFAULT NULL COMMENT '科目编码;',
  `debit` decimal(14, 2) DEFAULT NULL COMMENT '借方余额',
  `credit` decimal(14, 2) DEFAULT NULL COMMENT '贷方余额',
  `occurDebit` decimal(14, 2) DEFAULT NULL COMMENT '借方发生额',
  `occurCredit` decimal(14, 2) DEFAULT NULL COMMENT '贷方发生额',
  `occurAmount` decimal(14, 2) DEFAULT NULL COMMENT '实际损益发生额;（年中账套）',
  `periodStartBalance` decimal(14, 2) DEFAULT NULL COMMENT '期初余额;',
  `isPeriodStart` varchar(255) DEFAULT '否' COMMENT '是否期初',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 92 COMMENT = '科目余额表-会计期间维度';



INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (56,'2022-11','1000',0.00,56500.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:07+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (57,'2022-11','2000',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:08+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (58,'2022-11','3000',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:08+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (59,'2022-11','1001',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:09+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (60,'2022-11','2001',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:09+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (61,'2022-11','1002',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:10+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (62,'2022-11','2002',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:11+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (63,'2022-11','2003',3500.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:12+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (64,'2022-11','1003',53000.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:13+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (65,'2022-10','1000',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:13+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (66,'2022-10','2000',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:14+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (67,'2022-10','3000',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:15+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (68,'2022-10','1001',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:16+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (69,'2022-10','2001',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:17+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (70,'2022-10','1002',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:18+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (71,'2022-10','2002',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:18+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (72,'2022-10','2003',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:19+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (73,'2022-10','1003',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:20+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (74,'2022-09','1000',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:21+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (75,'2022-09','2000',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:22+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (76,'2022-09','3000',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:23+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (77,'2022-09','1001',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:23+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (78,'2022-09','2001',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:24+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (79,'2022-09','1002',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:25+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (80,'2022-09','2002',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:25+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (81,'2022-09','2003',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:26+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (82,'2022-09','1003',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:26+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (83,'2022-08','1000',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:27+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (84,'2022-08','2000',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:28+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (85,'2022-08','3000',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:28+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (86,'2022-08','1001',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:29+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (87,'2022-08','2001',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:30+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (88,'2022-08','1002',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:31+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (89,'2022-08','2002',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:31+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (90,'2022-08','2003',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:32+08:00');
INSERT INTO `subject_balance` (`id`,`periodId`,`subjectId`,`debit`,`credit`,`occurDebit`,`occurCredit`,`occurAmount`,`periodStartBalance`,`isPeriodStart`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (91,'2022-08','1003',0.00,0.00,NULL,NULL,NULL,NULL,'否','update','admin','系统管理员','2022-11-30T22:07:33+08:00');



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: voucher
# ------------------------------------------------------------

DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucherName` varchar(255) DEFAULT NULL COMMENT '凭证字; 记2022',
  `voucherNumber` int(11) DEFAULT NULL COMMENT '凭证号; 1001',
  `voucherId` varchar(255) DEFAULT NULL COMMENT '凭证字号; voucherName + voucherNumber',
  `periodId` varchar(255) DEFAULT NULL COMMENT '会计期间; E.g: 2023-03',
  `voucherCreator` varchar(255) DEFAULT '' COMMENT '制单人',
  `voucherAccountant` varchar(255) DEFAULT '' COMMENT '记账人',
  `voucherAudit` varchar(255) DEFAULT '' COMMENT '审核人; 预留字段',
  `voucherAt` varchar(255) DEFAULT NULL COMMENT '凭证时间; E.g: 2021-05-28',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 24 COMMENT = '凭证表';



INSERT INTO `voucher` (`id`,`voucherName`,`voucherNumber`,`voucherId`,`periodId`,`voucherCreator`,`voucherAccountant`,`voucherAudit`,`voucherAt`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (22,'记5432',1,'记5432-1','2022-11','','系统管理员','','2022-11-30','insert',NULL,NULL,NULL);
INSERT INTO `voucher` (`id`,`voucherName`,`voucherNumber`,`voucherId`,`periodId`,`voucherCreator`,`voucherAccountant`,`voucherAudit`,`voucherAt`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (23,'记5432',2,'记5432-2','2022-11','','系统管理员','','2022-11-30','insert',NULL,NULL,NULL);



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
  `balance` varchar(255) DEFAULT NULL COMMENT '余额;用于查明细时显示',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 31 COMMENT = '凭证条目表';



INSERT INTO `voucher_entry` (`id`,`voucherId`,`subjectId`,`entryAbstract`,`debit`,`credit`,`balance`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (25,'记5432-1','1003','购入A材料',50000.00,0.00,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `voucher_entry` (`id`,`voucherId`,`subjectId`,`entryAbstract`,`debit`,`credit`,`balance`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (26,'记5432-1','2003','购入A材料',3500.00,0.00,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `voucher_entry` (`id`,`voucherId`,`subjectId`,`entryAbstract`,`debit`,`credit`,`balance`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (27,'记5432-1','1000','购入A材料',0.00,53500.00,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `voucher_entry` (`id`,`voucherId`,`subjectId`,`entryAbstract`,`debit`,`credit`,`balance`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (28,'记5432-2','1003','采购商品B',1000.00,0.00,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `voucher_entry` (`id`,`voucherId`,`subjectId`,`entryAbstract`,`debit`,`credit`,`balance`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (29,'记5432-2','1003','采购商品C',2000.00,0.00,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `voucher_entry` (`id`,`voucherId`,`subjectId`,`entryAbstract`,`debit`,`credit`,`balance`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (30,'记5432-2','1000','采购商品',0.00,3000.00,NULL,'insert',NULL,NULL,NULL);



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
# SCHEMA DUMP FOR TABLE: view01_balance_sheet
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_balance_sheet` AS
select
  (
  sum(`pfv`.`voucherEntryDebit`) - sum(`pfv`.`voucherEntryCredit`)
  ) AS `endOfTermBalance`,
  count(distinct `pfv`.`id`) AS `profitFormulaCount`,
  `balance_sheet`.`direction` AS `direction`,
  `balance_sheet`.`operation` AS `operation`,
  `balance_sheet`.`balanceSheetId` AS `balanceSheetId`,
  `balance_sheet`.`id` AS `id`,
  `balance_sheet`.`operationByUserId` AS `operationByUserId`,
  `balance_sheet`.`operationByUser` AS `operationByUser`,
  `balance_sheet`.`operationAt` AS `operationAt`
from
  (
  `balance_sheet`
  left join `view01_profit_formula_voucherentryid` `pfv` on(
    (
    `balance_sheet`.`balanceSheetId` = `pfv`.`balanceSheetId`
    )
  )
  )
group by
  `balance_sheet`.`balanceSheetId`;





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view01_profit_formula_voucherentryid
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_profit_formula_voucherentryid` AS
select
  `profit_formula`.`id` AS `id`,
  `profit_formula`.`subjectId` AS `subjectId`,
  `profit_formula`.`balanceSheetId` AS `balanceSheetId`,
  `profit_formula`.`countDirection` AS `countDirection`,
  `profit_formula`.`accessRule` AS `accessRule`,
  `profit_formula`.`operation` AS `operation`,
  `profit_formula`.`operationByUserId` AS `operationByUserId`,
  `profit_formula`.`operationByUser` AS `operationByUser`,
  `profit_formula`.`operationAt` AS `operationAt`,
  `voucher_entry`.`id` AS `voucherEntryId`,
  `voucher_entry`.`voucherId` AS `voucherId`,
  `voucher_entry`.`debit` AS `voucherEntryDebit`,
  `voucher_entry`.`credit` AS `voucherEntryCredit`
from
  (
  `profit_formula`
  left join `voucher_entry` on(
    (
    `profit_formula`.`subjectId` = `voucher_entry`.`subjectId`
    )
  )
  );





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view01_subject_balance
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_subject_balance` AS
select
  `subject_balance`.`id` AS `id`,
  `subject_balance`.`periodId` AS `periodId`,
  `subject_balance`.`subjectId` AS `subjectId`,
  `subject_balance`.`debit` AS `debit`,
  `subject_balance`.`credit` AS `credit`,
  `subject_balance`.`occurDebit` AS `occurDebit`,
  `subject_balance`.`occurCredit` AS `occurCredit`,
  `subject_balance`.`occurAmount` AS `occurAmount`,
  `subject_balance`.`periodStartBalance` AS `periodStartBalance`,
  `subject_balance`.`isPeriodStart` AS `isPeriodStart`,
  `subject_balance`.`operation` AS `operation`,
  `subject_balance`.`operationByUserId` AS `operationByUserId`,
  `subject_balance`.`operationByUser` AS `operationByUser`,
  `subject_balance`.`operationAt` AS `operationAt`,
  `subject`.`subjectName` AS `subjectName`,
  `subject`.`subjectCategory` AS `subjectCategory`,
  `subject`.`subjectBalanceDirection` AS `subjectBalanceDirection`
from
  (
  `subject_balance`
  left join `subject` on(
    (
    `subject_balance`.`subjectId` = `subject`.`subjectId`
    )
  )
  );





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
  `voucher`.`voucherAt` AS `voucherAt`,
  `subject`.`subjectBalanceDirection` AS `subjectBalanceDirection`,(
  `voucher_entry`.`debit` - `voucher_entry`.`credit`
  ) AS `balance`
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





