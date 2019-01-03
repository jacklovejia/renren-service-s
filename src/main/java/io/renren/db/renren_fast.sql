/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : renren_fast

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2018-12-21 14:54:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for channelapilog
-- ----------------------------
DROP TABLE IF EXISTS `channelapilog`;
CREATE TABLE `channelapilog` (
  `serialno` int(32) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `url` varchar(128) DEFAULT NULL COMMENT '接口名称',
  `request` mediumtext COMMENT '请求内容',
  `response` mediumtext COMMENT '返回内容',
  `reqTime` varchar(32) DEFAULT NULL COMMENT '请求时间',
  `respTime` varchar(32) DEFAULT NULL COMMENT '响应时间',
  PRIMARY KEY (`serialno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of channelapilog
-- ----------------------------
INSERT INTO `channelapilog` VALUES ('2', 'http://222.92.218.142:8888/tianji/wujiang/baihe/v1/loanPutoutNotify', '{\"loanReqNo\":\"2018121900000004\",\"sign\":\"WTAqI02KL+4uwsRFYfoKJtZzHPo2IihS4cWPwlsXd1YvVWuIrRzekXLTTlzunVxiEqDK/YrHml7hzS4Xry2L3TsVsImkI9WmCnN77rfgedmcQ7iagglIdhoL41jbzjmM1NSc4PxgDIAlK4hDOdv06Fo6nXgFKNGbJWfNT57PCl7m3+ebkKi1vPSPHd0wzrQm/Tmjm4VP9nD9BGCBNy4YuPg/ZB6K865Hs/Qy/qWI422cJraUxaVViJlIXwOAqYdj7XTENyXrxscfIDfCO5uPMSK1HkrAgvOtcuh2MHaDkiSyMu+ATAlIPitqwldlJhv0H548zG+SsaPkTogrzUSuKA==\",\"sourceCode\":\"JY\"}', '{result={\"status\":\"03\",\"loanResultDesc\":\"重复请求不受理\",\"trdLoanReqNo\":null},httpCode=200}', '2018/12/19 17:45:15', '2018/12/19 17:45:15');
INSERT INTO `channelapilog` VALUES ('3', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for cms_withhold_request
-- ----------------------------
DROP TABLE IF EXISTS `cms_withhold_request`;
CREATE TABLE `cms_withhold_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `api_name` char(32) NOT NULL COMMENT '接口名称',
  `contract_no` char(32) NOT NULL COMMENT '信贷系统的合同号',
  `request_no` bigint(20) NOT NULL COMMENT '客户端发送来的请求流水号，唯一',
  `user_id` bigint(20) NOT NULL COMMENT 'P2P 平台用户ID',
  `project_id` bigint(20) NOT NULL COMMENT 'P2P 标的ID',
  `plan_step` int(11) NOT NULL COMMENT 'P2P 对应的还款期数',
  `bank_code` char(32) NOT NULL COMMENT '银行编码',
  `total_amount` decimal(12,2) NOT NULL COMMENT '代扣总金额，本金 + 佣金，以元为单位',
  `recharge_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '已充值总金额，以元为单位',
  `overdue_flag` int(11) NOT NULL DEFAULT '0' COMMENT '逾期标记：0 未逾期；1 已逾期',
  `income_free` int(11) NOT NULL DEFAULT '0' COMMENT '收息免息标志：0 免息；1 收息',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态：0 代扣处理中；1 代扣已取消；2 代扣成功；3 计费中心预处理中；4 计费中心预处理失败；5 计费中心预处理成功；6 商户代偿预处理中；7 商户代偿预处理失败；8 商户代偿预处理成功；9 P2P预处理通知失败；10 P2P预处理通知成功；11 清分处理中；12 清分失败；13 清分成功；',
  `phase` int(11) NOT NULL DEFAULT '0' COMMENT '阶段：0 受理阶段；1 代扣；2 计费中心代偿预处理；3 计费中心商户代偿预处理; 4 P2P预处理通知；5 代偿确认；999 完成',
  `type` int(4) NOT NULL DEFAULT '0' COMMENT '是否客户主动还款数据, 0:否, 1:是',
  `req_time` bigint(20) NOT NULL COMMENT '请求时间，以毫秒为单位',
  `res_time` bigint(20) DEFAULT NULL COMMENT '应答时间，以毫秒为单位',
  `end_time` bigint(20) DEFAULT NULL COMMENT '完成时间，以毫秒为单位',
  PRIMARY KEY (`id`),
  UNIQUE KEY `request_no` (`request_no`),
  KEY `user_id` (`user_id`,`status`,`phase`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='代扣-代扣请求表（不包含查询接口）';

-- ----------------------------
-- Records of cms_withhold_request
-- ----------------------------
INSERT INTO `cms_withhold_request` VALUES ('1', 'withhold', '2018032100000022', '2018032100011297', '244618210', '38890', '1', 'PCBC', '2308.59', '2308.59', '1', '0', '4', '999', '0', '1526559909317', '1528360207', '1528360207');
INSERT INTO `cms_withhold_request` VALUES ('2', 'withhold', '2018032100000022', '2018032100011298', '244618210', '38890', '2', 'PCBC', '2308.59', '2308.59', '1', '0', '13', '999', '0', '1526559909317', null, '1528360207');
INSERT INTO `cms_withhold_request` VALUES ('3', 'withhold', '2018032100000022', '2018032100011245', '244618210', '38890', '2', 'PCBC', '2308.59', '2308.59', '1', '0', '13', '999', '0', '1526259909317', null, '1528360207');
INSERT INTO `cms_withhold_request` VALUES ('4', 'withhold', '2018032100000022', '232211245', '244618210', '38890', '2', 'PCBC', '2308.59', '2308.00', '1', '0', '13', '999', '0', '1521259909317', null, '1528360207');
INSERT INTO `cms_withhold_request` VALUES ('5', 'withhold', '2018032100000022', '22222222222222222', '244618210', '38890', '2', 'PCBC', '2308.59', '2308.59', '1', '0', '13', '999', '0', '1521259909317', null, '1528360207');
INSERT INTO `cms_withhold_request` VALUES ('6', 'withhold', '2018032100000022', '222222222222222224', '244618210', '38890', '2', 'PCBC', '2308.59', '2308.59', '1', '0', '13', '999', '0', '1521259909317', null, '1528360207');

-- ----------------------------
-- Table structure for fundschannel
-- ----------------------------
DROP TABLE IF EXISTS `fundschannel`;
CREATE TABLE `fundschannel` (
  `serialno` int(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `contractNo` varchar(32) DEFAULT NULL COMMENT '合同号',
  `saleOrder` varchar(32) DEFAULT NULL COMMENT '单号',
  `statusForWJ` int(4) DEFAULT '0' COMMENT '吴江审核结果0:初始化, 1:通过,2:处理中,3:拒绝, 4:异常,5:审核超时',
  `statusForKS` int(4) DEFAULT '0' COMMENT '客商审核结果0:初始化, 1:通过,2:处理中,3:拒绝, 4:异常,5:审核超时',
  `statusForP2P` int(4) DEFAULT '0' COMMENT 'P2P审核结果0:初始化, 1:通过,2:处理中,3:拒绝, 4:异常,5:审核超时',
  `WJBusinessType` varchar(10) DEFAULT NULL COMMENT '吴江关联产品',
  `KSbusinessType` varchar(10) DEFAULT NULL COMMENT '客商关联产品',
  `P2PbusinessType` varchar(10) DEFAULT NULL COMMENT 'P2P关联产品',
  `firstChannel` varchar(20) DEFAULT NULL COMMENT '首选默认渠道',
  `channels` varchar(32) DEFAULT NULL COMMENT '渠道顺序, 逗号分隔',
  `isRunning` int(1) DEFAULT NULL COMMENT '执行状态 0:未执行, 1: 正在执行',
  `addTime` varchar(32) DEFAULT NULL COMMENT '添加时间',
  `updateTime` varchar(32) DEFAULT NULL COMMENT '最后一次执行时间',
  PRIMARY KEY (`serialno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fundschannel
-- ----------------------------
INSERT INTO `fundschannel` VALUES ('1', '2018121900000002', 'NewBH_2018061100001', '1', '0', '0', '1019', '1019', '1019', 'WJ_BANK', 'WJ_BANK,P2P,KS', '0', '2018/12/19 16:16:48', '2018/12/19 16:21:36');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', null, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', null, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'PC-2018012417371545363848263', '1545375124891', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1545186600000', '-1', '5', 'PAUSED', 'CRON', '1545185940000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1545186600000', '-1', '5', 'PAUSED', 'CRON', '1545185940000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'test', 'renren', '0 0/30 * * * ?', '1', '有参数测试', '2016-12-01 23:16:46');
INSERT INTO `schedule_job` VALUES ('2', 'testTask', 'test2', null, '0 0/30 * * * ?', '1', '无参数测试', '2016-12-03 14:55:56');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'test', 'renren', '0', null, '1040', '2018-12-19 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'testTask', 'test', 'renren', '0', null, '1157', '2018-12-19 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'testTask', 'test', 'renren', '0', null, '1043', '2018-12-19 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('4', '1', 'testTask', 'test', 'renren', '0', null, '1048', '2018-12-19 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'testTask', 'test', 'renren', '0', null, '1016', '2018-12-19 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('6', '1', 'testTask', 'test', 'renren', '0', null, '1092', '2018-12-19 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('7', '1', 'testTask', 'test', 'renren', '0', null, '1160', '2018-12-19 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('8', '1', 'testTask', 'test', 'renren', '0', null, '1016', '2018-12-19 17:00:00');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('1', 'acbgn', '2018-12-19 12:37:18');
INSERT INTO `sys_captcha` VALUES ('5667', 'g4367', '2018-12-19 18:30:52');
INSERT INTO `sys_captcha` VALUES ('7393a01f-5ebc-489d-8fbb-7127acfd05cc', 'dxx56', '2018-12-21 11:08:06');
INSERT INTO `sys_captcha` VALUES ('7bbb8804-03be-4c2d-8924-d8d6216a6caa', 'wnggx', '2018-12-21 14:56:59');
INSERT INTO `sys_captcha` VALUES ('9879830e-4701-433c-8daa-8f9d0c1a4065', '3w2pw', '2018-12-20 18:12:36');
INSERT INTO `sys_captcha` VALUES ('9b962716-dda9-4f8a-892c-be2952d3e747', '3nnc6', '2018-12-19 16:30:02');
INSERT INTO `sys_captcha` VALUES ('b7cec54c-2b4e-4c83-8ce5-6cf98d1da969', '7wwnf', '2018-12-19 12:42:15');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"1\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,-666666],\"createTime\":\"Dec 19, 2018 12:37:25 PM\"}]', '337', '0:0:0:0:0:0:0:1', '2018-12-19 12:37:26');
INSERT INTO `sys_log` VALUES ('2', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"root\",\"remark\":\"root\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,-666666]}]', '98', '0:0:0:0:0:0:0:1', '2018-12-19 12:38:51');
INSERT INTO `sys_log` VALUES ('3', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', '152', '0:0:0:0:0:0:0:1', '2018-12-19 12:39:03');
INSERT INTO `sys_log` VALUES ('4', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":2,\"roleName\":\"leder\",\"remark\":\"下属\",\"createUserId\":1,\"menuIdList\":[15,16,19,5,6,7,8,9,10,11,12,13,14,-666666,1,2,3],\"createTime\":\"Dec 19, 2018 12:41:49 PM\"}]', '96', '0:0:0:0:0:0:0:1', '2018-12-19 12:41:49');
INSERT INTO `sys_log` VALUES ('5', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":2,\"username\":\"jack\",\"password\":\"442f610f68a59c7596150a10265f92553df877a44a1a9e716782723f56129fd5\",\"salt\":\"bF9hyt8Q9NRGhLCQhUZM\",\"email\":\"1109273127@qq.com\",\"mobile\":\"16711632334\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Dec 19, 2018 12:42:18 PM\"}]', '67', '0:0:0:0:0:0:0:1', '2018-12-19 12:42:19');
INSERT INTO `sys_log` VALUES ('6', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"leder\",\"remark\":\"下属\",\"createUserId\":1,\"menuIdList\":[15,16,19,5,6,7,8,9,10,11,12,13,14,-666666,1,2,3]}]', '58', '127.0.0.1', '2018-12-19 12:45:06');
INSERT INTO `sys_log` VALUES ('7', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"leder\",\"remark\":\"下属\",\"createUserId\":1,\"menuIdList\":[15,16,3,19,20,21,22,5,6,7,8,9,10,11,12,13,14,-666666,1,2]}]', '72', '127.0.0.1', '2018-12-19 12:49:27');
INSERT INTO `sys_log` VALUES ('8', 'jack', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":4,\"roleName\":\"111\",\"remark\":\"\",\"createUserId\":2,\"menuIdList\":[15,-666666,1,2],\"createTime\":\"Dec 19, 2018 12:50:19 PM\"}]', '66', '0:0:0:0:0:0:0:1', '2018-12-19 12:50:19');
INSERT INTO `sys_log` VALUES ('9', 'jack', '删除角色', 'io.renren.modules.sys.controller.SysRoleController.delete()', '[[4]]', '44', '0:0:0:0:0:0:0:1', '2018-12-19 12:50:53');
INSERT INTO `sys_log` VALUES ('10', 'admin', '暂停定时任务', 'io.renren.modules.job.controller.ScheduleJobController.pause()', '[[1,2]]', '147', '0:0:0:0:0:0:0:1', '2018-12-19 17:06:41');
INSERT INTO `sys_log` VALUES ('11', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":46,\"parentId\":1,\"name\":\"wjbank\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"zhedie\",\"orderNum\":0}]', '34', '0:0:0:0:0:0:0:1', '2018-12-19 17:28:55');
INSERT INTO `sys_log` VALUES ('12', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":46,\"name\":\"接口日志\",\"url\":\"wjbank/channelapilog\",\"perms\":\"wjApiLog\",\"type\":1,\"icon\":\"pinglun\",\"orderNum\":6}]', '19', '0:0:0:0:0:0:0:1', '2018-12-19 17:29:54');
INSERT INTO `sys_log` VALUES ('13', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":36,\"parentId\":46,\"name\":\"渠道主表\",\"url\":\"wjbank/fundschannel\",\"perms\":\"fundschannel:list\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":6}]', '23', '0:0:0:0:0:0:0:1', '2018-12-19 17:40:29');
INSERT INTO `sys_log` VALUES ('14', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":41,\"parentId\":46,\"name\":\"吴江申请记录\",\"url\":\"wjbank/wjapply\",\"perms\":\"wjapply:list\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":6}]', '10', '0:0:0:0:0:0:0:1', '2018-12-19 17:41:20');
INSERT INTO `sys_log` VALUES ('15', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":46,\"parentId\":1,\"name\":\"吴江银行\",\"type\":0,\"icon\":\"mudedi\",\"orderNum\":0}]', '52', '0:0:0:0:0:0:0:1', '2018-12-19 17:57:14');
INSERT INTO `sys_log` VALUES ('16', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":46,\"parentId\":1,\"name\":\"吴江银行\",\"type\":0,\"icon\":\"mudedi\",\"orderNum\":0}]', '43', '0:0:0:0:0:0:0:1', '2018-12-19 17:57:16');
INSERT INTO `sys_log` VALUES ('17', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":52,\"parentId\":1,\"name\":\"代扣\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"log\",\"orderNum\":0}]', '62', '0:0:0:0:0:0:0:1', '2018-12-20 13:46:45');
INSERT INTO `sys_log` VALUES ('18', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":47,\"parentId\":52,\"name\":\"代扣-代扣请求表（不包含查询接口）\",\"url\":\"wjbank/cmswithholdrequest\",\"perms\":\"cmswithholdrequest:list\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', '76', '0:0:0:0:0:0:0:1', '2018-12-20 13:47:20');
INSERT INTO `sys_log` VALUES ('19', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":47,\"parentId\":52,\"name\":\"代扣主表\",\"url\":\"wjbank/cmswithholdrequest\",\"perms\":\"cmswithholdrequest:list\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', '28', '0:0:0:0:0:0:0:1', '2018-12-20 14:01:23');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'system', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'sys/user', null, '1', 'admin', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role', null, '1', 'role', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu', null, '1', 'menu', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', null, '1', 'sql', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'job/schedule', null, '1', 'job', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'sys/log', 'sys:log:list', '1', 'log', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'oss/oss', 'sys:oss:all', '1', 'oss', '6');
INSERT INTO `sys_menu` VALUES ('31', '46', '接口日志', 'wjbank/channelapilog', 'wjApiLog', '1', 'pinglun', '6');
INSERT INTO `sys_menu` VALUES ('32', '31', '查看', null, 'wjbank:channelapilog:list,wjbank:channelapilog:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('33', '31', '新增', null, 'wjbank:channelapilog:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('34', '31', '修改', null, 'wjbank:channelapilog:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('35', '31', '删除', null, 'wjbank:channelapilog:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('36', '46', '渠道主表', 'wjbank/fundschannel', 'fundschannel:list', '1', 'mudedi', '6');
INSERT INTO `sys_menu` VALUES ('37', '36', '查看', null, 'wjbank:fundschannel:list,wjbank:fundschannel:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('38', '36', '新增', null, 'wjbank:fundschannel:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('39', '36', '修改', null, 'wjbank:fundschannel:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('40', '36', '删除', null, 'wjbank:fundschannel:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('41', '46', '吴江申请记录', 'wjbank/wjapply', 'wjapply:list', '1', 'mudedi', '6');
INSERT INTO `sys_menu` VALUES ('42', '41', '查看', null, 'wjbank:wjapply:list,wjbank:wjapply:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('43', '41', '新增', null, 'wjbank:wjapply:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('44', '41', '修改', null, 'wjbank:wjapply:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('45', '41', '删除', null, 'wjbank:wjapply:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('46', '1', '吴江银行', null, null, '0', 'mudedi', '0');
INSERT INTO `sys_menu` VALUES ('47', '52', '代扣主表', 'wjbank/cmswithholdrequest', 'cmswithholdrequest:list', '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('48', '47', '查看', null, 'wjbank:cmswithholdrequest:list,wjbank:cmswithholdrequest:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('49', '47', '新增', null, 'wjbank:cmswithholdrequest:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('50', '47', '修改', null, 'wjbank:cmswithholdrequest:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('51', '47', '删除', null, 'wjbank:cmswithholdrequest:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('52', '1', '代扣', null, null, '0', 'log', '0');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'root', 'root', '1', '2018-12-19 12:37:26');
INSERT INTO `sys_role` VALUES ('2', 'leder', '下属', '1', '2018-12-19 12:41:49');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('31', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('32', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('33', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('34', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('35', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('36', '1', '18');
INSERT INTO `sys_role_menu` VALUES ('37', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('38', '1', '19');
INSERT INTO `sys_role_menu` VALUES ('39', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('40', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('41', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('42', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('43', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('44', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('45', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('46', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('47', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('48', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('49', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('50', '1', '8');
INSERT INTO `sys_role_menu` VALUES ('51', '1', '9');
INSERT INTO `sys_role_menu` VALUES ('52', '1', '10');
INSERT INTO `sys_role_menu` VALUES ('53', '1', '11');
INSERT INTO `sys_role_menu` VALUES ('54', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('55', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('56', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('57', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('58', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('59', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('60', '1', '-666666');
INSERT INTO `sys_role_menu` VALUES ('95', '2', '15');
INSERT INTO `sys_role_menu` VALUES ('96', '2', '16');
INSERT INTO `sys_role_menu` VALUES ('97', '2', '3');
INSERT INTO `sys_role_menu` VALUES ('98', '2', '19');
INSERT INTO `sys_role_menu` VALUES ('99', '2', '20');
INSERT INTO `sys_role_menu` VALUES ('100', '2', '21');
INSERT INTO `sys_role_menu` VALUES ('101', '2', '22');
INSERT INTO `sys_role_menu` VALUES ('102', '2', '5');
INSERT INTO `sys_role_menu` VALUES ('103', '2', '6');
INSERT INTO `sys_role_menu` VALUES ('104', '2', '7');
INSERT INTO `sys_role_menu` VALUES ('105', '2', '8');
INSERT INTO `sys_role_menu` VALUES ('106', '2', '9');
INSERT INTO `sys_role_menu` VALUES ('107', '2', '10');
INSERT INTO `sys_role_menu` VALUES ('108', '2', '11');
INSERT INTO `sys_role_menu` VALUES ('109', '2', '12');
INSERT INTO `sys_role_menu` VALUES ('110', '2', '13');
INSERT INTO `sys_role_menu` VALUES ('111', '2', '14');
INSERT INTO `sys_role_menu` VALUES ('112', '2', '-666666');
INSERT INTO `sys_role_menu` VALUES ('113', '2', '1');
INSERT INTO `sys_role_menu` VALUES ('114', '2', '2');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', '1', '1', '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES ('2', 'jack', '442f610f68a59c7596150a10265f92553df877a44a1a9e716782723f56129fd5', 'bF9hyt8Q9NRGhLCQhUZM', '1109273127@qq.com', '16711632334', '1', '1', '2018-12-19 12:42:19');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2', '2');

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', '84a1623405f03f833074c879b21b76f3', '2018-12-22 02:18:33', '2018-12-21 14:18:33');
INSERT INTO `sys_user_token` VALUES ('2', 'e710a7a38689c3c94e1e05d1e8067e97', '2018-12-20 06:11:57', '2018-12-19 18:11:57');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

-- ----------------------------
-- Table structure for wj_apply
-- ----------------------------
DROP TABLE IF EXISTS `wj_apply`;
CREATE TABLE `wj_apply` (
  `serialno` int(32) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `contractNo` varchar(32) DEFAULT NULL COMMENT '合同号',
  `wjContractNo` varchar(32) DEFAULT NULL COMMENT '吴江放款流水号',
  `status` int(2) DEFAULT NULL COMMENT ' 1:审核通过,2:审核处理中,3:审核拒绝, 4:异常,5:审核超时,6:放款处理中,7:放款成功,8:放款失败,9:出账失败,10:出账成功',
  `isRunning` tinyint(2) DEFAULT '0' COMMENT '是否执行1: 正在执行, 0: 未执行',
  `add_time` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`serialno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wj_apply
-- ----------------------------
