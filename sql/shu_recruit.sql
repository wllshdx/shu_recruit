drop database if exists `shu_recruit`;
create database if not exists `shu_recruit`;
use `shu_recruit`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`
(
    `id`         int(8) NOT NULL AUTO_INCREMENT,
    `username`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `password`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `createDate` date                                                    DEFAULT NULL,
    `realName`   varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `descri`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `username` (`username`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin`
VALUES (1, 'admin', 'admin', '2020-03-11', '总管理员', '总管理员');
INSERT INTO `admin`
VALUES (2, 'admin2', 'admin2', '2020-03-11', 'admin2', 'admin2');
INSERT INTO `admin`
VALUES (3, 'admin3', 'admin3', '2020-03-11', 'admin3', 'admin3');
INSERT INTO `admin`
VALUES (4, 'admin4', 'admin4', '2020-03-11', 'admin4', 'admin4');
INSERT INTO `admin`
VALUES (5, 'admin5', 'admin5', '2020-03-11', 'admin5', 'admin5');
INSERT INTO `admin`
VALUES (6, 'admin6', 'admin6', '2020-03-11', 'admin6', 'admin6');

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`
(
    `cid`          int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    `code`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `mail`         varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `password`     varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `registerTime` date                                                   DEFAULT NULL,
    `state`        char(1) CHARACTER SET utf8 COLLATE utf8_general_ci     DEFAULT NULL,
    PRIMARY KEY (`cid`) USING BTREE,
    UNIQUE INDEX `account` (`mail`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company`
VALUES (00000001, NULL, 'test1@163.com', '123456', '2016-08-16', '3');
INSERT INTO `company`
VALUES (00000002, '', 'test2@163com', '123456', '2016-08-08', '3');
INSERT INTO `company`
VALUES (00000003, '1c6d6ecae0dea46024ac9efaee1ca5b3', 'test3@163.com', '123456', '2016-09-01', '3');
INSERT INTO `company`
VALUES (00000004, 'cd40fa2d7b6bf5dc0b048752e6522ebb', 'test4@163.com', '123456', '2016-09-01', '3');
INSERT INTO `company`
VALUES (00000005, '5ba67f68cd39a14af723307785f1d8ae', 'test5@163.com', '123456', '2020-03-25', '3');

-- ----------------------------
-- Table structure for companyinfo
-- ----------------------------
DROP TABLE IF EXISTS `companyinfo`;
CREATE TABLE `companyinfo`
(
    `ciid`               int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    `companyname`        varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `location`           varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `address`            varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `industry`           char(20) CHARACTER SET utf8 COLLATE utf8_general_ci     DEFAULT NULL,
    `contacts`           varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `sex`                char(4) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT NULL,
    `phone`              char(11) CHARACTER SET utf8 COLLATE utf8_general_ci     DEFAULT NULL,
    `telephone`          varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `companyinstruction` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `logo`               varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    PRIMARY KEY (`ciid`) USING BTREE,
    INDEX `sys_ci_id_to_c_id` (`ciid`) USING BTREE,
    CONSTRAINT `companyinfo_ibfk_1` FOREIGN KEY (`ciid`) REFERENCES `company` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of companyinfo
-- ----------------------------
INSERT INTO `companyinfo`
VALUES (00000001, '字节跳动', '上海', '科学城', '算法推荐', '李天一', '男', '13222222222', '020-62910283', '短视频',
        '3ffd0133-becd-4c35-a23d-ef6cff10abef.png');
INSERT INTO `companyinfo`
VALUES (00000002, '腾讯视频', '上海', '天河科韵路', '通信', '陈冠希', '男', '13222222222', '020-62428123', '视频',
        '3ffd0133-becd-4c35-a23d-ef6cff10abef.png');
INSERT INTO `companyinfo`
VALUES (00000003, '阿里巴巴', '杭州', '东华大厦', '电商', '梁家伟', '男', '13515151544', '020-64321234', '全行业',
        '99138183-d960-4431-8a7c-51f206036afe.jpg');
INSERT INTO `companyinfo`
VALUES (00000004, '华为', '上海', '上海宝山区', '互联网', '陈晓阳', '男', '13515151515', '020-60987654', '华为全行业',
        '3396f488-8f6c-4851-8218-9a07ccc5d14f.jpg');
INSERT INTO `companyinfo`
VALUES (00000005, '百度', '北京', '北京五道口', '互联网', '史凡唐', '男', '15934462135', '020-60298721', '搜索引擎',
        'f6591821-5b6c-4d6f-8631-d5ee437061a2.JPG');

-- ----------------------------
-- Table structure for education_experience
-- ----------------------------
DROP TABLE IF EXISTS `education_experience`;
CREATE TABLE `education_experience`
(
    `eid`       int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    `uid`       int(8) UNSIGNED ZEROFILL                                DEFAULT NULL,
    `school`    varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `college`   varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `major`     varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `education` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `stime`     date                                                    DEFAULT NULL,
    `etime`     date                                                    DEFAULT NULL,
    `statement` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    PRIMARY KEY (`eid`) USING BTREE,
    INDEX `sys_eid` (`eid`) USING BTREE,
    INDEX `uid` (`uid`) USING BTREE,
    CONSTRAINT `education_experience_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 20
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of education_experience
-- ----------------------------
INSERT INTO `education_experience`
VALUES (00000001, 00000001, '上海大学', '计科', '计科', '硕士', '2016-08-17', '2016-08-31', '好');
INSERT INTO `education_experience`
VALUES (00000002, 00000002, '上海交通大学', '智科', '智科', '本科', '2016-08-30', '2016-09-06', '好');
INSERT INTO `education_experience`
VALUES (00000003, 00000003, '上海交通大学', '智科', '智科', '本科', '2016-08-30', '2016-09-06', '好');
INSERT INTO `education_experience`
VALUES (00000004, 00000004, '上海交通大学', '智科', '智科', '本科', '2016-08-30', '2016-09-06', '好');
INSERT INTO `education_experience`
VALUES (00000005, 00000005, '上海大学', '计科', '计科', '硕士', '2016-08-17', '2016-08-31', '好');
INSERT INTO `education_experience`
VALUES (00000006, 00000006, '上海大学', '智科', '智科', '本科', '2016-08-30', '2016-09-06', '好');
INSERT INTO `education_experience`
VALUES (00000007, 00000007, '复旦', '计科', '计科', '硕士', '2016-08-17', '2016-08-31', '好');
INSERT INTO `education_experience`
VALUES (00000008, 00000008, '上海交通大学', '智科', '智科', '本科', '2016-08-30', '2016-09-06', '好');
INSERT INTO `education_experience`
VALUES (00000009, 00000009, '上海大学', '计科', '计科', '硕士', '2016-08-17', '2016-08-31', '好');
INSERT INTO `education_experience`
VALUES (00000010, 00000010, '上海大学', '智科', '智科', '本科', '2016-08-30', '2016-09-06', '好');
INSERT INTO `education_experience`
VALUES (00000011, 00000011, '复旦', '计科', '计科', '硕士', '2016-08-17', '2016-08-31', '好');
INSERT INTO `education_experience`
VALUES (00000012, 00000012, '上海交通大学', '智科', '智科', '本科', '2016-08-30', '2016-09-06', '好');
INSERT INTO `education_experience`
VALUES (00000013, 00000013, '上海大学', '计科', '计科', '硕士', '2016-08-17', '2016-08-31', '好');
INSERT INTO `education_experience`
VALUES (00000014, 00000014, '上海大学', '智科', '智科', '本科', '2016-08-30', '2016-09-06', '好');
INSERT INTO `education_experience`
VALUES (00000015, 00000015, '复旦', '计科', '计科', '硕士', '2016-08-17', '2016-08-31', '好');
INSERT INTO `education_experience`
VALUES (00000016, 00000016, '上海交通大学', '智科', '智科', '本科', '2016-08-30', '2016-09-06', '好');
INSERT INTO `education_experience`
VALUES (00000017, 00000017, '复旦', '计科', '计科', '硕士', '2016-08-17', '2016-08-31', '好');
INSERT INTO `education_experience`
VALUES (00000018, 00000018, '上海交通大学', '智科', '智科', '本科', '2016-08-30', '2016-09-06', '好');

-- ----------------------------
-- Table structure for major_skill
-- ----------------------------
DROP TABLE IF EXISTS `major_skill`;
CREATE TABLE `major_skill`
(
    `mid`   int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    `uid`   int(8) UNSIGNED ZEROFILL                               DEFAULT NULL,
    `skill` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    PRIMARY KEY (`mid`) USING BTREE,
    INDEX `sys_mid` (`mid`) USING BTREE,
    INDEX `uid` (`uid`) USING BTREE,
    CONSTRAINT `major_skill_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 58
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major_skill
-- ----------------------------
INSERT INTO `major_skill`
VALUES (00000001, 00000001, 'java');
INSERT INTO `major_skill`
VALUES (00000002, 00000001, 'springboot');
INSERT INTO `major_skill`
VALUES (00000003, 00000001, 'springcloud');
INSERT INTO `major_skill`
VALUES (00000004, 00000002, 'java');
INSERT INTO `major_skill`
VALUES (00000005, 00000002, 'springboot');
INSERT INTO `major_skill`
VALUES (00000006, 00000002, 'jsp');
INSERT INTO `major_skill`
VALUES (00000007, 00000003, 'java');
INSERT INTO `major_skill`
VALUES (00000008, 00000003, 'springcloud');
INSERT INTO `major_skill`
VALUES (00000009, 00000003, 'springcloud');
INSERT INTO `major_skill`
VALUES (00000010, 00000004, 'java');
INSERT INTO `major_skill`
VALUES (00000011, 00000004, 'php');
INSERT INTO `major_skill`
VALUES (00000012, 00000004, 'springboot');
INSERT INTO `major_skill`
VALUES (00000013, 00000005, 'java');
INSERT INTO `major_skill`
VALUES (00000014, 00000005, 'springcloud');
INSERT INTO `major_skill`
VALUES (00000015, 00000005, 'jsp');
INSERT INTO `major_skill`
VALUES (00000016, 00000006, 'java');
INSERT INTO `major_skill`
VALUES (00000017, 00000006, 'springcloud');
INSERT INTO `major_skill`
VALUES (00000018, 00000006, 'jsp');
INSERT INTO `major_skill`
VALUES (00000019, 00000007, 'java');
INSERT INTO `major_skill`
VALUES (00000020, 00000007, 'php');
INSERT INTO `major_skill`
VALUES (00000021, 00000007, 'springboot');
INSERT INTO `major_skill`
VALUES (00000022, 00000008, 'java');
INSERT INTO `major_skill`
VALUES (00000023, 00000008, 'php');
INSERT INTO `major_skill`
VALUES (00000024, 00000008, 'springcloud');
INSERT INTO `major_skill`
VALUES (00000025, 00000009, 'java');
INSERT INTO `major_skill`
VALUES (00000026, 00000009, 'vue');
INSERT INTO `major_skill`
VALUES (00000027, 00000009, 'springboot');
INSERT INTO `major_skill`
VALUES (00000028, 00000010, 'vue');
INSERT INTO `major_skill`
VALUES (00000029, 00000010, 'springcloud');
INSERT INTO `major_skill`
VALUES (00000030, 00000010, 'jsp');
INSERT INTO `major_skill`
VALUES (00000031, 00000011, 'java');
INSERT INTO `major_skill`
VALUES (00000032, 00000011, 'springboot');
INSERT INTO `major_skill`
VALUES (00000033, 00000011, 'vue');
INSERT INTO `major_skill`
VALUES (00000034, 00000012, 'java');
INSERT INTO `major_skill`
VALUES (00000035, 00000012, 'springcloud');
INSERT INTO `major_skill`
VALUES (00000036, 00000012, 'jsp');
INSERT INTO `major_skill`
VALUES (00000037, 00000013, 'java');
INSERT INTO `major_skill`
VALUES (00000038, 00000013, 'php');
INSERT INTO `major_skill`
VALUES (00000039, 00000013, 'jsp');
INSERT INTO `major_skill`
VALUES (00000040, 00000014, 'springcloud');
INSERT INTO `major_skill`
VALUES (00000041, 00000014, 'vue');
INSERT INTO `major_skill`
VALUES (00000042, 00000014, 'jsp');
INSERT INTO `major_skill`
VALUES (00000043, 00000015, 'springcloud');
INSERT INTO `major_skill`
VALUES (00000044, 00000015, 'vue');
INSERT INTO `major_skill`
VALUES (00000045, 00000015, 'jsp');
INSERT INTO `major_skill`
VALUES (00000046, 00000016, 'springcloud');
INSERT INTO `major_skill`
VALUES (00000047, 00000016, 'php');
INSERT INTO `major_skill`
VALUES (00000048, 00000016, 'jsp');
INSERT INTO `major_skill`
VALUES (00000049, 00000017, 'vue');
INSERT INTO `major_skill`
VALUES (00000050, 00000017, 'php');
INSERT INTO `major_skill`
VALUES (00000051, 00000017, 'springcloud');
INSERT INTO `major_skill`
VALUES (00000052, 00000018, 'java');
INSERT INTO `major_skill`
VALUES (00000053, 00000018, 'php');
INSERT INTO `major_skill`
VALUES (00000054, 00000018, 'java');
INSERT INTO `major_skill`
VALUES (00000055, 00000032, 'vue');
INSERT INTO `major_skill`
VALUES (00000056, 00000032, 'springboot');
INSERT INTO `major_skill`
VALUES (00000057, 00000032, 'springcloud');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`
(
    `pid`            int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    `cid`            int(8) UNSIGNED ZEROFILL                                DEFAULT NULL,
    `position`       varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `workplace`      varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `classification` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `department`     varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `salary`         char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT NULL,
    `eduRequest`     char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT NULL,
    `experience`     char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT NULL,
    `statement`      varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `email`          varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `browsingnumber` int(8)                                                  DEFAULT NULL,
    `releasedate`    date                                                    DEFAULT NULL,
    `state`          char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT NULL,
    `deadline`       date                                                    DEFAULT NULL,
    PRIMARY KEY (`pid`) USING BTREE,
    INDEX `sys_pid_to_c_id` (`pid`) USING BTREE,
    INDEX `position_ibfk_1` (`cid`) USING BTREE,
    CONSTRAINT `position_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `company` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 87
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position`
VALUES (00000001, 00000001, '测试员', '上海', '计科', '测试', '1', '1', '1', '运维开发', 'wllshdx_789@163.com', 1233, '2016-07-11',
        '1', '2016-07-23');
INSERT INTO `position`
VALUES (00000002, 00000001, '测试工程师', '深圳', '计科', '测试', '1', '1', '1', '运维开发', 'wllshdx_789@163.com', 1233, '2016-07-27',
        '2', '2016-07-21');
INSERT INTO `position`
VALUES (00000003, 00000001, 'php开发', '上海', '计科', '研发', '1', '1', '1', '运维开发', 'wllshdx_789@163.com', 1233, '2016-07-11',
        '2', '2016-07-23');
INSERT INTO `position`
VALUES (00000004, 00000001, 'java开发', '上海', '计科', '开发', '1', '1', '1', '运维开发', 'wllshdx_789@163.com', 1233,
        '2016-07-11', '1', '2016-07-23');
INSERT INTO `position`
VALUES (00000005, 00000001, '前端工程师', '上海', '计科', '研发', '1', '1', '1', '运维开发', 'wllshdx_789@163.com', 1233, '2016-07-11',
        '2', '2016-07-23');
INSERT INTO `position`
VALUES (00000006, 00000001, 'c++开发', '上海', '计科', '开发', '1', '1', '1', '运维开发', 'wllshdx_789@163.com', 1233, '2016-07-11',
        '1', '2016-07-23');
INSERT INTO `position`
VALUES (00000007, 00000001, 'ios开发', '深圳', '计科', '开发', '1', '1', '1', '运维开发', 'wllshdx_789@163.com', 1233, '2016-07-27',
        '1', '2016-07-21');
INSERT INTO `position`
VALUES (00000008, 00000001, 'c#开发', '深圳', '计科', '开发', '1', '1', '1', '运维开发', 'wllshdx_789@163.com', 1233, '2016-07-27',
        '2', '2016-07-21');
INSERT INTO `position`
VALUES (00000009, 00000001, 'Android开发', '上海', '计科', '开发', '1', '1', '1', '运维开发', 'wllshdx_789@163.com', 1233,
        '2016-07-11', '2', '2016-07-23');
INSERT INTO `position`
VALUES (00000010, 00000001, 'UI设计', '上海', '计科', '开发', '1', '1', '1', '运维开发', 'wllshdx_789@163.com', 1233, '2016-07-11',
        '2', '2016-07-23');
INSERT INTO `position`
VALUES (00000011, 00000001, '财务管理', '深圳', '计科', '财务', '1', '1', '1', '运维开发', 'wllshdx_789@163.com', 1233, '2016-07-27',
        '1', '2016-07-21');
INSERT INTO `position`
VALUES (00000012, 00000001, '财务总监', '深圳', '计科', '财务', '1', '1', '1', '运维开发', 'wllshdx_789@163.com', 1233, '2016-07-27',
        '1', '2016-07-21');
INSERT INTO `position`
VALUES (00000013, 00000003, '人力招聘', '上海', '区域销售经理/主管', '财务', '2', '1', '1', '运维开发', 'wllshdx_789@163.com', 546,
        '2016-08-26', '1', '2016-08-16');
INSERT INTO `position`
VALUES (00000014, 00000003, '测试员', '上海', '技术或工艺设计经理', '开发', '1', '1', '1', '运维开发', 'wllshdx_789@163.com', 456,
        '2016-09-01', '1', '2016-09-14');
INSERT INTO `position`
VALUES (00000015, 00000003, '测试工程师', '上海', '网络/在线销售', '开发', '1', '2', '1', '运维开发', 'wllshdx_789@163.com', 456,
        '2016-09-01', '1', '2016-09-04');
INSERT INTO `position`
VALUES (00000016, 00000003, 'php开发', '上海', '财务总监', '开发', '2', '2', '2', '运维开发', 'wllshdx_789@163.com', 456,
        '2016-09-01', '1', '2016-09-03');
INSERT INTO `position`
VALUES (00000017, 00000003, 'java开发', '上海', '材料工程师', '开发', '1', '1', '1', '运维开发', 'wllshdx_789@163.com', 7,
        '2016-09-01', '2', '2016-09-14');
INSERT INTO `position`
VALUES (00000018, 00000003, '前端工程师', '上海', '区域销售经理/主管', '开发', '2', '1', '1', '运维开发', 'wllshdx_789@163.com', 4,
        '2016-08-26', '1', '2016-08-16');
INSERT INTO `position`
VALUES (00000019, 00000003, 'c++开发', '上海', '区域销售经理/主管', '开发', '2', '1', '1', '运维开发', 'wllshdx_789@163.com', 44,
        '2016-08-26', '2', '2016-08-16');
INSERT INTO `position`
VALUES (00000020, 00000003, 'ios开发', '上海', '区域销售经理/主管', '开发', '2', '1', '1', '运维开发', 'wllshdx_789@163.com', 8,
        '2016-08-26', '1', '2016-08-16');
INSERT INTO `position`
VALUES (00000021, 00000003, 'c#开发', '上海', '区域销售经理/主管', '开发', '2', '1', '1', '运维开发', 'wllshdx_789@163.com', 6,
        '2016-08-26', '1', '2016-08-16');
INSERT INTO `position`
VALUES (00000022, 00000003, 'Android开发', '上海', '区域销售经理/主管', '开发', '2', '1', '1', '运维开发', 'wllshdx_789@163.com', 4,
        '2016-08-26', '2', '2016-08-16');
INSERT INTO `position`
VALUES (00000023, 00000003, 'UI设计', '上海', '区域销售经理/主管', '开发', '2', '1', '1', '运维开发', 'wllshdx_789@163.com', 4,
        '2016-08-26', '1', '2016-08-16');
INSERT INTO `position`
VALUES (00000024, 00000003, '财务管理', '上海', '区域销售经理/主管', '开发', '2', '1', '1', '运维开发', 'wllshdx_789@163.com', 8,
        '2016-08-26', '2', '2016-08-16');
INSERT INTO `position`
VALUES (00000025, 00000003, '财务总监', '上海', '区域销售经理/主管', '开发', '2', '1', '1', '运维开发', 'wllshdx_789@163.com', 4,
        '2016-08-26', '1', '2016-08-16');
INSERT INTO `position`
VALUES (00000026, 00000003, '实验室管理员', '上海', '区域销售经理/主管', '开发', '2', '1', '1', '运维开发', 'wllshdx_789@163.com', 3,
        '2016-08-26', '2', '2016-08-16');
INSERT INTO `position`
VALUES (00000027, 00000003, '招生委员', '上海', '区域销售经理/主管', '开发', '2', '1', '1', '运维开发', 'wllshdx_789@163.com', 1,
        '2016-08-26', '1', '2016-08-16');
INSERT INTO `position`
VALUES (00000028, 00000003, '清洁工', '重庆', '高级计科工程师', '开发', '1', '1', '1', 'java公司', 'wllshdx_789@163.com', 7,
        '2016-09-01', '2', '2016-09-25');
INSERT INTO `position`
VALUES (00000029, 00000004, '实验室管理员', '上海', '高级计科工程师', '教育部', '4', '3', '3', '负责实验室管理', '1055693834@qq.com', 1,
        '2016-09-02', '1', '2016-09-29');
INSERT INTO `position`
VALUES (00000030, 00000004, '招生委员', '上海', '人力资源总监', '人事部', '1', '2', '3', '负责学校招生信息', '1055693834@qq.com', 1, '2016-09-02',
        '1', '2016-09-24');
INSERT INTO `position`
VALUES (00000031, 00000004, '清洁工', '上海', '后勤/总务', '后勤部', '1', '1', '6', '负责清洁工作', '1055693834@qq.com', 0, '2016-09-02', '2',
        '2016-09-14');
INSERT INTO `position`
VALUES (00000032, 00000002, '清洁工', '重庆', '高级计科工程师', '开发', '1', '1', '1', 'java公司', 'wllshdx_789@163.com', 7,
        '2016-09-01', '1', '2016-09-25');
INSERT INTO `position`
VALUES (00000033, 00000002, '实验室管理员', '上海', '高级计科工程师', '教育部', '4', '3', '3', '负责实验室管理', '1055693834@qq.com', 1,
        '2016-09-02', '1', '2016-09-29');
INSERT INTO `position`
VALUES (00000034, 00000002, '招生委员', '上海', '人力资源总监', '人事部', '1', '2', '3', '负责学校招生信息', '1055693834@qq.com', 1, '2016-09-02',
        '1', '2016-09-24');
INSERT INTO `position`
VALUES (00000085, 00000004, '搬运工', '上海', '集装箱业务', '搬运', '1', '1', '1', '搬运货物', '1055693834@qq.com', 0, '2016-09-02', '1',
        '2016-09-12');
INSERT INTO `position`
VALUES (00000086, 00000005, '前端工程师', '北京', '计科工程师', '项目研发部', '4', '1', '1', '未定',
        '1055693834@qq.com', 0, '2020-03-25', '1', '2020-04-18');

-- ----------------------------
-- Table structure for position_resume
-- ----------------------------
DROP TABLE IF EXISTS `position_resume`;
CREATE TABLE `position_resume`
(
    `pid`          int(8) UNSIGNED ZEROFILL                           NOT NULL,
    `uid`          int(8) UNSIGNED ZEROFILL                           NOT NULL,
    `deliverydate` date                                               NOT NULL,
    `state`        char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    INDEX `pr_pid_to_c_id` (`pid`) USING BTREE,
    INDEX `pr_rid_to_u_id` (`uid`) USING BTREE,
    CONSTRAINT `position_resume_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `position_resume_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `position` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position_resume
-- ----------------------------
INSERT INTO `position_resume`
VALUES (00000001, 00000014, '2016-08-10', 'e');
INSERT INTO `position_resume`
VALUES (00000001, 00000015, '2016-08-26', 'e');
INSERT INTO `position_resume`
VALUES (00000001, 00000016, '2016-08-26', 'r');
INSERT INTO `position_resume`
VALUES (00000001, 00000018, '2016-09-02', 'w');
INSERT INTO `position_resume`
VALUES (00000002, 00000001, '2016-08-26', 'w');
INSERT INTO `position_resume`
VALUES (00000002, 00000002, '2016-08-18', 'w');
INSERT INTO `position_resume`
VALUES (00000002, 00000004, '2016-08-27', 'w');
INSERT INTO `position_resume`
VALUES (00000002, 00000005, '2016-08-18', 'w');
INSERT INTO `position_resume`
VALUES (00000002, 00000006, '2016-08-25', 's');
INSERT INTO `position_resume`
VALUES (00000002, 00000009, '2016-08-26', 's');
INSERT INTO `position_resume`
VALUES (00000002, 00000005, '2016-08-26', 's');
INSERT INTO `position_resume`
VALUES (00000002, 00000008, '2016-08-26', 's');
INSERT INTO `position_resume`
VALUES (00000002, 00000003, '2016-08-26', 'w');
INSERT INTO `position_resume`
VALUES (00000003, 00000011, '2016-08-26', 's');
INSERT INTO `position_resume`
VALUES (00000004, 00000007, '2016-08-26', 'w');
INSERT INTO `position_resume`
VALUES (00000005, 00000016, '2016-08-26', 'r');
INSERT INTO `position_resume`
VALUES (00000005, 00000012, '2016-08-26', 's');
INSERT INTO `position_resume`
VALUES (00000009, 00000010, '2016-08-26', 's');
INSERT INTO `position_resume`
VALUES (00000010, 00000013, '2016-08-26', 's');
INSERT INTO `position_resume`
VALUES (00000010, 00000015, '2016-08-26', 'w');
INSERT INTO `position_resume`
VALUES (00000013, 00000001, '2016-08-26', 's');
INSERT INTO `position_resume`
VALUES (00000013, 00000002, '2016-08-18', 's');
INSERT INTO `position_resume`
VALUES (00000013, 00000004, '2016-08-27', 's');
INSERT INTO `position_resume`
VALUES (00000013, 00000003, '2016-08-26', 'r');
INSERT INTO `position_resume`
VALUES (00000013, 00000009, '2016-08-26', 'w');
INSERT INTO `position_resume`
VALUES (00000013, 00000005, '2016-08-26', 's');
INSERT INTO `position_resume`
VALUES (00000013, 00000006, '2016-08-25', 's');
INSERT INTO `position_resume`
VALUES (00000013, 00000007, '2016-08-26', 'w');
INSERT INTO `position_resume`
VALUES (00000013, 00000008, '2016-08-26', 'w');
INSERT INTO `position_resume`
VALUES (00000013, 00000010, '2016-08-26', 'w');
INSERT INTO `position_resume`
VALUES (00000013, 00000011, '2016-08-26', 's');
INSERT INTO `position_resume`
VALUES (00000013, 00000012, '2016-08-26', 's');
INSERT INTO `position_resume`
VALUES (00000013, 00000013, '2016-08-26', 's');
INSERT INTO `position_resume`
VALUES (00000013, 00000014, '2016-08-10', 'r');
INSERT INTO `position_resume`
VALUES (00000029, 00000018, '2016-09-02', 's');
INSERT INTO `position_resume`
VALUES (00000029, 00000032, '2020-03-22', 'w');
INSERT INTO `position_resume`
VALUES (00000086, 00000032, '2020-03-30', 'w');

-- ----------------------------
-- Table structure for practical_experience
-- ----------------------------
DROP TABLE IF EXISTS `practical_experience`;
CREATE TABLE `practical_experience`
(
    `peid`     int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    `uid`      int(8) UNSIGNED ZEROFILL                               DEFAULT NULL,
    `company`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `position` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `stime`    date                                                   DEFAULT NULL,
    `etime`    date                                                   DEFAULT NULL,
    PRIMARY KEY (`peid`) USING BTREE,
    INDEX `sys_peid` (`peid`) USING BTREE,
    INDEX `uid` (`uid`) USING BTREE,
    CONSTRAINT `pratical_experience_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 20
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of practical_experience
-- ----------------------------
INSERT INTO `practical_experience`
VALUES (00000001, 00000001, '阿里', '后台', '2016-08-16', '2016-08-16');
INSERT INTO `practical_experience`
VALUES (00000002, 00000002, '工商', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience`
VALUES (00000003, 00000003, '工商', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience`
VALUES (00000004, 00000004, '工商', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience`
VALUES (00000005, 00000005, '阿里', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience`
VALUES (00000006, 00000006, '微软', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience`
VALUES (00000007, 00000007, '东华', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience`
VALUES (00000008, 00000008, '工商', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience`
VALUES (00000009, 00000009, '阿里', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience`
VALUES (00000010, 00000010, '微软', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience`
VALUES (00000011, 00000011, '东华', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience`
VALUES (00000012, 00000012, '工商', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience`
VALUES (00000013, 00000013, '阿里', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience`
VALUES (00000014, 00000014, '微软', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience`
VALUES (00000015, 00000015, '东华', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience`
VALUES (00000016, 00000016, '工商', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience`
VALUES (00000017, 00000017, '东华', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience`
VALUES (00000018, 00000018, '东华', '后台', '2016-08-31', '2016-08-31');
INSERT INTO `practical_experience`
VALUES (00000019, 00000032, '阿里', '后台', '2020-03-12', '2020-03-12');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`
(
    `pid`       int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    `uid`       int(8) UNSIGNED ZEROFILL                                DEFAULT NULL,
    `project`   varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `position`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `stime`     date                                                    DEFAULT NULL,
    `etime`     date                                                    DEFAULT NULL,
    `statement` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    PRIMARY KEY (`pid`) USING BTREE,
    INDEX `sys_pid` (`pid`) USING BTREE,
    INDEX `uid` (`uid`) USING BTREE,
    CONSTRAINT `project_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 39
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project`
VALUES (00000001, 00000001, '前端开发', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project`
VALUES (00000002, 00000001, '后端开发', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project`
VALUES (00000003, 00000002, '深度学习', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project`
VALUES (00000004, 00000002, '算法训练', '后端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project`
VALUES (00000005, 00000003, '前端开发', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project`
VALUES (00000006, 00000003, '后端开发', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project`
VALUES (00000007, 00000004, '深度学习', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project`
VALUES (00000008, 00000004, '算法训练', '后端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project`
VALUES (00000009, 00000005, '前端开发', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project`
VALUES (00000010, 00000005, '后端开发', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project`
VALUES (00000011, 00000006, '深度学习', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project`
VALUES (00000012, 00000006, '算法训练', '后端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project`
VALUES (00000013, 00000007, '前端开发', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project`
VALUES (00000014, 00000007, '后端开发', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project`
VALUES (00000015, 00000008, '深度学习', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project`
VALUES (00000016, 00000008, '算法训练', '后端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project`
VALUES (00000017, 00000009, '前端开发', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project`
VALUES (00000018, 00000009, '后端开发', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project`
VALUES (00000019, 00000010, '深度学习', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project`
VALUES (00000020, 00000010, '算法训练', '后端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project`
VALUES (00000021, 00000011, '前端开发', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project`
VALUES (00000022, 00000011, '后端开发', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project`
VALUES (00000023, 00000012, '深度学习', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project`
VALUES (00000024, 00000012, '算法训练', '后端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project`
VALUES (00000025, 00000013, '前端开发', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project`
VALUES (00000026, 00000013, '后端开发', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project`
VALUES (00000027, 00000014, '深度学习', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project`
VALUES (00000028, 00000014, '算法训练', '后端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project`
VALUES (00000029, 00000015, '前端开发', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project`
VALUES (00000030, 00000015, '后端开发', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project`
VALUES (00000031, 00000016, '深度学习', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project`
VALUES (00000032, 00000016, '算法训练', '后端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project`
VALUES (00000033, 00000017, '前端开发', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project`
VALUES (00000034, 00000017, '后端开发', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project`
VALUES (00000035, 00000018, '深度学习', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project`
VALUES (00000036, 00000018, '算法训练', '后端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project`
VALUES (00000037, 00000032, '算法训练', '后端', '2020-03-18', '2020-03-17', '123');
INSERT INTO `project`
VALUES (00000038, 00000032, '深度学习', '后台', '2020-03-17', '2020-03-08', '123');

-- ----------------------------
-- Table structure for qquser
-- ----------------------------
DROP TABLE IF EXISTS `qquser`;
CREATE TABLE `qquser`
(
    `openId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `id`     int(8)                                                  NOT NULL,
    `type`   varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL,
    PRIMARY KEY (`openId`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qquser
-- ----------------------------
INSERT INTO `qquser`
VALUES ('B808C3D27C40D253E8F8CE086633B39F', 28, '0');

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume`
(
    `uid`             int(8) UNSIGNED ZEROFILL                                NOT NULL,
    `name`            varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `sex`             char(2) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL COMMENT '0-男 \r\n1-女\r\n 2-其他',
    `nativePlace`     varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `birthday`        date                                                    NOT NULL,
    `education`       char(4) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL,
    `workYear`        char(4) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL,
    `phone`           char(16) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL,
    `idCard`          char(18) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL,
    `mail`            varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `city`            varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `personPic`       varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `introduction`    varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `positionApplied` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `exceptedCity`    varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `exceptedSalary`  double(10, 2)                                           DEFAULT NULL,
    `postscript`      varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    INDEX `uid` (`uid`) USING BTREE,
    CONSTRAINT `resume_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resume
-- ----------------------------
INSERT INTO `resume`
VALUES (00000003, '詹三', '男', '上海', '1991-08-26', '3', '3', '13923039420', '441542455632326532', '601647957@qq.com',
        '天津', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', '测试工程师', '天津', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume`
VALUES (00000002, '张违', '男', '上海', '1991-08-26', '4', '2', '13923039420', '441542455632326532', '601647957@qq.com',
        '上海', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'java工程师', '上海', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume`
VALUES (00000004, '铝管', '男', '上海', '1986-09-01', '2', '2', '13923039420', '441542455632326532', '601647957@qq.com',
        '上海', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'java工程师', '上海', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume`
VALUES (00000005, '温地', '女', '上海', '1991-08-26', '2', '4', '13923039420', '441542455632326532', '601647957@qq.com',
        '上海', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', '前端工程师', '上海', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume`
VALUES (00000006, '张小', '女', '上海', '1991-08-14', '2', '2', '13923039420', '441542455632326532', '601647957@qq.com',
        '上海', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'java工程师', '上海', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume`
VALUES (00000007, '张凡', '男', '上海', '1991-08-26', '2', '5', '13923039420', '441542455632326532', '601647957@qq.com',
        '上海', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', '前端工程师', '上海', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume`
VALUES (00000008, '赵高', '男', '上海', '1991-08-26', '1', '2', '13923039420', '441542455632326532', '601647957@qq.com',
        '深圳', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', '前端工程师', '深圳', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume`
VALUES (00000009, '乔峰', '男', '上海', '1991-08-26', '2', '2', '13923039420', '441542455632326532', '601647957@qq.com',
        '上海', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'java工程师', '上海', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume`
VALUES (00000010, '碧瑶', '女', '上海', '1991-08-26', '2', '3', '13923039420', '441542455632326532', '601647957@qq.com',
        '梅州', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', '前端工程师', '梅州', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume`
VALUES (00000011, '雪琪', '女', '上海', '1991-08-26', '4', '1', '13923039420', '441542455632326532', '601647957@qq.com',
        '上海', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'java工程师', '上海', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume`
VALUES (00000012, '叶帆', '男', '上海', '1991-08-26', '3', '1', '13923039420', '441542455632326532', '601647957@qq.com',
        '上海', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'php工程师', '上海', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume`
VALUES (00000013, '刘迪', '女', '上海', '1991-08-26', '2', '3', '13923039420', '441542455632326532', '601647957@qq.com',
        '天津', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'java工程师', '天津', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume`
VALUES (00000014, '刘德法', '男', '上海', '1991-08-26', '3', '4', '13923039420', '441542455632326532', '601647957@qq.com',
        '上海', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'php工程师', '上海', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume`
VALUES (00000015, '张从', '女', '上海', '1991-08-26', '1', '2', '13923039420', '441542455632326532', '601647957@qq.com',
        '北京', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'java工程师', '北京', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume`
VALUES (00000016, '张具', '男', '上海', '1991-08-26', '4', '3', '13923039420', '441542455632326532', '601647957@qq.com',
        '上海', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'php工程师', '上海', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume`
VALUES (00000001, '张小凡', '男', '上海', '1991-08-26', '4', '1', '13923039420', '441542455632326532', '601647957@qq.com',
        '上海', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', '厨师', '上海', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume`
VALUES (00000017, '李四', '男', '北京', '1974-06-06', '2', '3', '13515151515', '545646456546', '60164795467@qq.com', '哈尔滨',
        '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', '医生', '北京', 5463.00, '色不一样的烟火');
INSERT INTO `resume`
VALUES (00000018, '张三', '男', '北京', '2016-09-12', '2', '3', '13515151515', '545646456546', '60164795467@qq.com', '哈尔滨',
        '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'php工程师', '北京', 4534.00, '色不一样的烟火');
INSERT INTO `resume`
VALUES (00000032, '葫芦', '男', '江西', '2020-03-10', '1', '1', '15934462135', '121212', '1178452896@qq.com',
        '??', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', '律师', '上海', 1111.00, '不一样的烟火');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `uid`          int(8) UNSIGNED ZEROFILL                               NOT NULL AUTO_INCREMENT,
    `username`     varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `password`     varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `state`        char(1) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL,
    `mail`         varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `code`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `registerTime` date                                                   DEFAULT NULL,
    `sno`          varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '学号',
    PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 33
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user`
VALUES (00000001, 'user1', '123', '3', '1@qq.com', '123', '2016-08-01', '1');
INSERT INTO `user`
VALUES (00000002, 'user2', '123', '3', '2@qq.com', '123', '2016-08-01', '2');
INSERT INTO `user`
VALUES (00000003, 'user3', '123', '3', '3@qq.com', '123', '2016-08-01', '3');
INSERT INTO `user`
VALUES (00000004, 'user4', '123', '3', '4@qq.com', '123', '2016-08-01', '4');
INSERT INTO `user`
VALUES (00000005, 'user5', '123', '3', '5@qq.com', '123', '2016-08-01', '5');
INSERT INTO `user`
VALUES (00000006, 'user6', '123', '3', '6@qq.com', '123', '2016-08-01', '6');
INSERT INTO `user`
VALUES (00000007, '123', '123', '3', '7@qq.com', '123', '2016-08-01', '7');
INSERT INTO `user`
VALUES (00000008, '123', '123', '3', '8@qq.com', '123', '2016-08-01', '8');
INSERT INTO `user`
VALUES (00000009, '123', '123', '3', '9@qq.com', '123', '2016-08-01', '9');
INSERT INTO `user`
VALUES (00000010, '123', '123', '3', '10@qq.com', '123', '2016-08-01', '10');
INSERT INTO `user`
VALUES (00000011, '123', '123', '3', '11@qq.com', '123', '2016-08-01', '11');
INSERT INTO `user`
VALUES (00000012, '123', '123', '3', '12@qq.com', '123', '2016-08-01', '12');
INSERT INTO `user`
VALUES (00000013, '123', '123', '3', '13@qq.com', '123', '2016-08-01', '13');
INSERT INTO `user`
VALUES (00000014, '123', '123', '3', '14@qq.com', '123', '2016-08-01', '14');
INSERT INTO `user`
VALUES (00000015, '123', '123', '3', '15@qq.com', '123', '2016-08-01', '15');
INSERT INTO `user`
VALUES (00000016, '123', '123', '3', '16@qq.com', '123', '2016-08-01', '16');
INSERT INTO `user`
VALUES (00000017, '123', '123', '3', '17@qq.com', '123', '2016-08-01', '17');
INSERT INTO `user`
VALUES (00000018, '123', '123', '3', '18@qq.com', '123', '2016-08-01', '18');
INSERT INTO `user`
VALUES (00000019, NULL, '123', '2', '19@qq.com', '123', '2016-09-02', '28');
INSERT INTO `user`
VALUES (00000020, NULL, '123', '3', '20@qq.com', '123', '2020-03-21', '32');

SET FOREIGN_KEY_CHECKS = 1;

alter table position_resume
    ADD comment varchar(30)
