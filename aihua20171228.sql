/*
Navicat MySQL Data Transfer

Source Server         : 爱华
Source Server Version : 50628
Source Host           : 211.149.247.87:3306
Source Database       : aihua

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2017-12-28 05:58:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sl_admin`
-- ----------------------------
DROP TABLE IF EXISTS `sl_admin`;
CREATE TABLE `sl_admin` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `email` varchar(50) NOT NULL COMMENT '电子邮件',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `verify` varchar(32) DEFAULT NULL COMMENT '验证串',
  `isadmin` tinyint(1) unsigned DEFAULT '0' COMMENT '是否为管理员',
  `last_login_time` int(11) unsigned DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` varchar(15) DEFAULT NULL COMMENT '最后登录ip',
  `login_count` mediumint(8) unsigned DEFAULT '0' COMMENT '登录统计',
  `create_time` int(11) unsigned NOT NULL COMMENT '记录创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '记录更新时间',
  `pic` varchar(100) DEFAULT NULL COMMENT '头像',
  `group_id` int(11) DEFAULT NULL,
  `id` int(10) unsigned zerofill DEFAULT NULL,
  `cun_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_index` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sl_admin
-- ----------------------------
INSERT INTO `sl_admin` VALUES ('23', 'cdsile', '01ac3d95a020811609ceef9ed8336e2e', '', 'cdsile', null, '1', null, '0', '1514355313', '125.68.125.67', '0', '1509730011', '0', 'public/uploads/20171104/2017110402173459fcb2be68e77.png', '1', null, '0');
INSERT INTO `sl_admin` VALUES ('24', 'hjljun', '82fd608cf5ba110175be550635fec367', '', '混之龙', null, '1', null, '0', '1514277988', '125.68.125.67', '0', '1514276675', '0', '', '1', null, '0');

-- ----------------------------
-- Table structure for `sl_banben`
-- ----------------------------
DROP TABLE IF EXISTS `sl_banben`;
CREATE TABLE `sl_banben` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `banbenmingcheng` char(100) DEFAULT NULL COMMENT '版本名称',
  `banbenhao` char(100) DEFAULT NULL COMMENT '版本号',
  `shifouqiangzhishengji` varchar(250) DEFAULT '是\r\n否' COMMENT '是否强制升级',
  `xiazaidizhi` char(100) DEFAULT NULL COMMENT '下载地址',
  `gengxinshujuleixing` varchar(250) DEFAULT '全新安装\r\n增量升级' COMMENT '更新数据类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sl_banben模型主表';

-- ----------------------------
-- Records of sl_banben
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_canshu`
-- ----------------------------
DROP TABLE IF EXISTS `sl_canshu`;
CREATE TABLE `sl_canshu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classid` varchar(10) CHARACTER SET utf8 DEFAULT '0' COMMENT '上级ID',
  `u1` varchar(50) CHARACTER SET utf8 DEFAULT ' ' COMMENT '参数说明',
  `u2` varchar(50) CHARACTER SET utf8 DEFAULT ' ' COMMENT '参数',
  `u3` varchar(50) CHARACTER SET utf8 DEFAULT ' ' COMMENT '图标',
  `u4` varchar(50) CHARACTER SET utf8 DEFAULT ' ' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sl_canshu
-- ----------------------------
INSERT INTO `sl_canshu` VALUES ('1', '0', '模型类型', ' ', ' ', ' ');
INSERT INTO `sl_canshu` VALUES ('2', '1', '表单模型', '/index.php?p=admin&c=biaodan&a=index', '', '');
INSERT INTO `sl_canshu` VALUES ('3', '1', '文章模型', ' /index.php?p=admin&c=wenzhang&a=index', ' ', ' ');
INSERT INTO `sl_canshu` VALUES ('4', '0', '字段类型', ' ', ' ', ' ');
INSERT INTO `sl_canshu` VALUES ('6', '4', '文本框', 'char', ' ', ' ');
INSERT INTO `sl_canshu` VALUES ('7', '4', '文本编辑器', 'mediumtext', ' ', ' ');
INSERT INTO `sl_canshu` VALUES ('8', '4', '文本域', 'varchar', ' ', ' ');
INSERT INTO `sl_canshu` VALUES ('9', '4', '时间框', 'timestamp', ' ', ' ');
INSERT INTO `sl_canshu` VALUES ('10', '4', '单选', 'varchar', ' ', ' ');
INSERT INTO `sl_canshu` VALUES ('11', '4', '多选', 'varchar', ' ', ' ');
INSERT INTO `sl_canshu` VALUES ('12', '4', '图片', 'varchar', ' ', ' ');
INSERT INTO `sl_canshu` VALUES ('13', '4', '组图', 'text', ' ', ' ');
INSERT INTO `sl_canshu` VALUES ('14', '4', '数字', 'int', ' ', ' ');
INSERT INTO `sl_canshu` VALUES ('15', '4', '文件', 'varchar', ' ', ' ');
INSERT INTO `sl_canshu` VALUES ('16', '4', '密码', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('17', '0', '地址', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('18', '1', '用户模型', '/index.php?p=admin&c=yonghumoxing&a=index', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('19', '17', '四川省', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('20', '19', '成都市', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('21', '20', '龙泉驿区', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('22', '21', '大面镇', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('23', '22', '村1', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('24', '22', '村2', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('25', '22', '村3', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('26', '23', '小组1', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('27', '23', '小组2', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('29', '28', '户籍录入', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('30', '28', '人员录入', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('31', '29', '户籍类型', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('32', '29', '房屋类型', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('33', '29', '房屋用途', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('34', '29', '产权性质', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('35', '29', '建筑结构', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('36', '31', '一般户', ' 5', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('37', '31', '放心户', '1', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('38', '31', '贫困户', '20', ' ', '2');
INSERT INTO `sl_canshu` VALUES ('39', '31', '重点户', '1', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('40', '31', '其他', ' 8', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('41', '32', '平房', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('42', '32', '楼房', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('43', '32', '其他', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('44', '33', '居住', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('45', '33', '经商', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('46', '33', '商住两用', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('47', '33', '出租', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('48', '33', '其他', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('49', '34', '农权房', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('50', '34', '商品房', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('51', '34', '自建房', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('52', '34', '其他', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('53', '35', '砖混', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('54', '35', '砖木', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('55', '35', '土木', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('56', '35', '框架', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('57', '35', '其他', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('58', '4', '联动', ' varchar', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('59', '17', '北京市', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('60', '19', '宜宾市', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('61', '0', '状态', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('62', '61', '待审', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('63', '61', '终审', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('64', '61', '回收站', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('65', '30', '居住情况', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('66', '30', '民族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('67', '30', '人员类别', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('68', '30', '重点类别', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('69', '30', '文化程度', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('70', '30', '婚姻状况', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('71', '30', '政治面貌', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('72', '30', '宗教信仰', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('73', '30', '兵役情况', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('74', '30', '职业', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('75', '30', '户口类别', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('76', '30', '户口性质', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('77', '30', '血型', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('78', '65', '常住', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('79', '65', '暂住', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('80', '65', '人户分离', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('81', '65', '寄住', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('82', '65', '未上户人员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('83', '65', '已去世，未销户', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('84', '67', '普通人员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('85', '67', '重点人员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('86', '67', '贫困人员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('87', '67', '放心人员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('88', '67', '党员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('89', '68', '危安类刑满释放人员及其家属', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('90', '68', '野阿訇', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('91', '68', '野阿吉', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('92', '68', '涉“六条线”人员的徒子徒孙', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('93', '68', '本地持“瓦哈比”思想传承人员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('94', '68', '曾被教育转化的人员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('95', '68', '境外“回流”人员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('96', '68', '被判处死刑、被击毙、自爆身亡人员的亲属', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('97', '68', '国保三、四、五类人员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('98', '68', '长期外出务工突然返乡人员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('99', '68', '严打以来曾被判处管制、拘役纳入社区矫治的人员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('100', '68', '涉“7.5”“7.6”案件刑释解教、解脱人员及其家属', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('101', '68', '过去使用智能手机，现在突然不用手机或改用非智能手机的人员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('102', '68', '不与左邻右舍来往，平时很少走正门、行为诡秘的人员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('103', '68', '过去热衷于向清真寺捐钱捐物或替清真寺收钱收物的人员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('104', '68', '无正当理由突然变卖家产外出特别是举家外出人员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('105', '68', '家庭用电异常的人员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('106', '68', '违反计划生育，超生的人员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('107', '68', '懂电焊、制爆技术的人员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('108', '68', '无正当理由不愿享受各类惠民政策、不参加基础组织安排的各类活动', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('109', '69', '高中', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('110', '69', '中专', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('111', '69', '大专', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('112', '69', '大学本科', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('113', '69', '研究生', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('114', '69', '初中以下', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('115', '69', '文盲或半文盲', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('116', '70', '已婚', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('117', '70', '未婚', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('118', '70', '离异', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('119', '70', '其他', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('120', '71', '群众', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('121', '71', '党员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('122', '71', '团员', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('123', '71', '民主党派', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('124', '72', '无宗教信仰', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('125', '72', '佛教', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('126', '72', '伊斯兰教', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('127', '72', '其他', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('128', '73', '未服兵役', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('129', '73', '退役', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('130', '73', '现役', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('131', '73', '军官预备役', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('132', '73', '士兵预备役', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('133', '73', '其他', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('134', '74', '务农', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('135', '74', '公职', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('136', '74', '经商', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('137', '74', '务工', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('138', '74', '上学', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('139', '74', '退休', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('140', '74', '宗教教职', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('141', '75', '家庭户', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('142', '75', '集体户', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('143', '75', '其他', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('144', '76', '农业户口', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('145', '76', '非农业户口', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('146', '76', '其他', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('147', '77', 'A', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('148', '77', 'B', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('149', '77', 'AB', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('150', '77', 'O', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('151', '66', '汉族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('152', '66', '维吾尔族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('153', '66', '回族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('154', '66', '哈萨克族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('155', '66', '蒙古族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('156', '66', '柯尔克孜族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('157', '66', '乌兹别克族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('158', '66', '俄罗斯族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('159', '66', '锡伯族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('160', '66', '藏族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('161', '66', '布依族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('162', '66', '侗族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('163', '66', '瑶族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('164', '66', '朝鲜族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('165', '66', '白族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('166', '66', '哈尼族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('167', '66', '满族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('168', '66', '黎族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('169', '66', '傣族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('170', '66', '畲族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('171', '66', '傈僳族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('172', '66', '仡佬族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('173', '66', '东乡族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('174', '66', '高山族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('175', '66', '拉祜族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('176', '66', '水族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('177', '66', '佤族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('178', '66', '纳西族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('179', '66', '羌族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('180', '66', '土族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('181', '66', '仫佬族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('182', '66', '苗族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('183', '66', '壮族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('184', '66', '达斡尔族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('185', '66', '景颇族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('186', '66', '毛南族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('187', '66', '撒拉族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('188', '66', '布朗族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('189', '66', '塔吉克族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('190', '66', '阿昌族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('191', '66', '普米族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('192', '66', '鄂温克族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('193', '66', '怒族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('194', '66', '京族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('195', '66', '基诺族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('196', '66', '德昂族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('197', '66', '保安族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('198', '66', '彝族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('199', '66', '裕固族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('200', '66', '土家族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('201', '66', '门巴族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('202', '66', '鄂伦春族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('203', '66', '独龙族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('204', '66', '塔塔尔族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('205', '66', '赫哲族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('206', '66', '珞巴族', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('207', '17', '新疆', ' ', ' ', '65');
INSERT INTO `sl_canshu` VALUES ('209', '208', 'web_url', 'http://fhj.cdweni.com', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('210', '207', '吐鲁番', ' ', ' ', '6521');
INSERT INTO `sl_canshu` VALUES ('211', '210', '鄯善县', ' ', ' ', '652123');
INSERT INTO `sl_canshu` VALUES ('212', '211', '栏杆村', ' ', ' ', '65212301');
INSERT INTO `sl_canshu` VALUES ('213', '212', '一组', ' ', ' ', '1');
INSERT INTO `sl_canshu` VALUES ('216', '212', '二组', ' ', ' ', '2');
INSERT INTO `sl_canshu` VALUES ('217', '212', '三组', ' ', ' ', '3');
INSERT INTO `sl_canshu` VALUES ('218', '212', '四组', ' ', ' ', '4');
INSERT INTO `sl_canshu` VALUES ('219', '207', '乌鲁木齐', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('220', '219', '新市区', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('221', '220', '石油新村', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('222', '221', '组1', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('223', '221', '组2', ' ', ' ', '4');
INSERT INTO `sl_canshu` VALUES ('224', '221', '组3', ' ', ' ', '2');
INSERT INTO `sl_canshu` VALUES ('227', '61', '测试状态', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('228', '17', '河南', ' ', ' ', '1');
INSERT INTO `sl_canshu` VALUES ('229', '228', '郑姆斯特丹', ' ', ' ', '222');
INSERT INTO `sl_canshu` VALUES ('230', '229', '狭村', ' ', ' ', '333');
INSERT INTO `sl_canshu` VALUES ('231', '230', '狭村一组', ' ', ' ', '444');
INSERT INTO `sl_canshu` VALUES ('232', '230', '狭村二组', ' ', ' ', '555');
INSERT INTO `sl_canshu` VALUES ('233', '213', 'xx', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('236', '215', '1', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('239', '22', '天山堡村', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('240', '239', '六组', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('241', '239', '五组', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('242', '4', '下拉框', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('243', '4', '金额', 'double', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('244', '0', '商品分类', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('245', '244', '杀虫剂', ' ', ' ', '1');
INSERT INTO `sl_canshu` VALUES ('246', '244', '杀介杀螨', ' ', ' ', '2');
INSERT INTO `sl_canshu` VALUES ('247', '244', '杀菌剂', ' ', ' ', '3');
INSERT INTO `sl_canshu` VALUES ('248', '244', '除草剂', ' ', ' ', '4');
INSERT INTO `sl_canshu` VALUES ('249', '244', '叶面肥，调节剂', ' ', ' ', '5');
INSERT INTO `sl_canshu` VALUES ('250', '244', '肥料', ' ', ' ', '6');
INSERT INTO `sl_canshu` VALUES ('251', '244', '其他', ' ', ' ', '7');
INSERT INTO `sl_canshu` VALUES ('252', '4', '多条记录', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('253', '0', '订单状态', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('254', '253', '未支付', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('255', '253', '已支付', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('256', '253', '待发货', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('257', '253', '待收货', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('258', '253', '订单完成', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('259', '253', '退货', ' ', ' ', '0');
INSERT INTO `sl_canshu` VALUES ('260', '253', '其他', ' ', ' ', '0');

-- ----------------------------
-- Table structure for `sl_column`
-- ----------------------------
DROP TABLE IF EXISTS `sl_column`;
CREATE TABLE `sl_column` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classid` varchar(50) CHARACTER SET utf8 DEFAULT '0' COMMENT '上一级的ID',
  `u1` varchar(250) CHARACTER SET utf8 DEFAULT '栏目名',
  `u2` varchar(250) CHARACTER SET utf8 DEFAULT '0' COMMENT '排序',
  `u3` varchar(250) CHARACTER SET utf8 DEFAULT NULL COMMENT 'url连接地址',
  `u4` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '显示状态',
  `laiyuan` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '添加人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=993 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sl_column
-- ----------------------------
INSERT INTO `sl_column` VALUES ('8', '0', '内容管理', '1', '', '显示', '系统');
INSERT INTO `sl_column` VALUES ('10', '0', '用户管理', '2', '', '显示', '系统');
INSERT INTO `sl_column` VALUES ('12', '0', '系统管理', '4', '', '显示', '系统');
INSERT INTO `sl_column` VALUES ('14', '12', '系统日志', '2', '/index.php?p=admin&amp;c=system&amp;a=index', '显示', '系统');
INSERT INTO `sl_column` VALUES ('15', '12', '网站配置', '1', '/index.php?p=admin&amp;c=peizhi&amp;a=index', '显示', '系统');
INSERT INTO `sl_column` VALUES ('16', '12', '模型管理', '3', '/index.php?p=admin&amp;c=moxing&amp;a=index', '显示', '系统');
INSERT INTO `sl_column` VALUES ('17', '12', '栏目管理', '4', '/index.php?p=admin&amp;c=lanmu&amp;a=index', '显示', '系统');
INSERT INTO `sl_column` VALUES ('19', '10', '管理员管理', '0', '/index.php?p=admin&c=yonghu&a=index', '显示', '系统');
INSERT INTO `sl_column` VALUES ('857', '12', '参数管理', '0', '/index.php?p=admin&amp;c=canshu&amp;a=index', '显示', null);
INSERT INTO `sl_column` VALUES ('881', '0', '功能拓展', '5', '', '显示', '系统');
INSERT INTO `sl_column` VALUES ('946', '941', '集团上市公司解决方案', '1', 'index.php?p=admin&amp;c=sort&amp;a=index&amp;model_id=53&amp;sort_id=66', '显示', null);
INSERT INTO `sl_column` VALUES ('947', '941', '服装网站解决方案', '1', 'index.php?p=admin&amp;c=sort&amp;a=index&amp;model_id=53&amp;sort_id=65', '显示', null);
INSERT INTO `sl_column` VALUES ('948', '941', '外贸网站解决方案', '1', 'index.php?p=admin&amp;c=sort&amp;a=index&amp;model_id=53&amp;sort_id=64', '显示', null);
INSERT INTO `sl_column` VALUES ('949', '941', '商城网站解决方案', '1', 'index.php?p=admin&amp;c=sort&amp;a=index&amp;model_id=53&amp;sort_id=48', '显示', null);
INSERT INTO `sl_column` VALUES ('950', '941', '手机网站解决方案', '1', 'index.php?p=admin&amp;c=sort&amp;a=index&amp;model_id=53&amp;sort_id=47', '显示', null);
INSERT INTO `sl_column` VALUES ('951', '941', '旅游网站解决方案', '1', 'index.php?p=admin&amp;c=sort&amp;a=index&amp;model_id=53&amp;sort_id=46', '显示', null);
INSERT INTO `sl_column` VALUES ('952', '941', '企业网站解决方案', '1', 'index.php?p=admin&amp;c=sort&amp;a=index&amp;model_id=53&amp;sort_id=45', '显示', null);
INSERT INTO `sl_column` VALUES ('960', '8', '用户反馈', '6', 'index.php?p=admin&amp;c=autotable&amp;a=index&amp;model_id=68', '显示', null);
INSERT INTO `sl_column` VALUES ('973', '8', '用户管理', '3', 'index.php?p=admin&amp;c=yuangong&amp;a=index&amp;model_id=60', '显示', null);
INSERT INTO `sl_column` VALUES ('974', '8', '关于我们', '11', 'index.php?p=admin&amp;c=autotable&amp;a=edit&amp;model_id=76&amp;id=1', '显示', null);
INSERT INTO `sl_column` VALUES ('975', '881', '版本升级', '0', 'index.php?p=admin&amp;c=autotable&amp;a=index&amp;model_id=73', '显示', null);
INSERT INTO `sl_column` VALUES ('976', '10', '管理员权限', '2', 'index.php?p=admin&amp;c=Group', '显示', null);
INSERT INTO `sl_column` VALUES ('977', '8', '解决方案', '7', 'index.php?p=admin&amp;c=sort&amp;a=index&amp;model_id=77&amp;sort_id=73', '显示', null);
INSERT INTO `sl_column` VALUES ('978', '8', '精华贴', '6', 'index.php?p=admin&amp;c=sort&amp;a=index&amp;model_id=77&amp;sort_id=72', '显示', null);
INSERT INTO `sl_column` VALUES ('979', '8', '用户提问', '5', 'index.php?p=admin&amp;c=autotable&amp;a=index&amp;model_id=80', '显示', null);
INSERT INTO `sl_column` VALUES ('980', '8', '专家团队', '4', 'index.php?p=admin&amp;c=autotable&amp;a=index&amp;model_id=79', '显示', null);
INSERT INTO `sl_column` VALUES ('981', '8', '自动回复', '8', 'index.php?p=admin&amp;c=autotable&amp;a=index&amp;model_id=82', '显示', null);
INSERT INTO `sl_column` VALUES ('982', '8', '供需管理', '9', '/index.php?p=admin&amp;c=autotable&amp;a=index&amp;model_id=84', '显示', null);
INSERT INTO `sl_column` VALUES ('983', '8', '注册会员', '12', 'index.php?p=admin&amp;c=yonghumoxing&amp;a=index&amp;model_id=60', '显示', null);
INSERT INTO `sl_column` VALUES ('984', '8', '专家回答', '13', '/index.php?p=admin&amp;c=autotable&amp;a=index&amp;model_id=81', '显示', null);
INSERT INTO `sl_column` VALUES ('985', '0', '商城管理', '0', '', '显示', null);
INSERT INTO `sl_column` VALUES ('986', '985', '商品管理', '1', '/index.php?p=admin&amp;c=autotable&amp;a=index&amp;model_id=85', '显示', null);
INSERT INTO `sl_column` VALUES ('987', '985', '商城通知', '2', '/index.php?p=admin&amp;c=autotable&amp;a=index&amp;model_id=86', '显示', null);
INSERT INTO `sl_column` VALUES ('988', '985', '精品推荐', '3', '/index.php?p=admin&amp;c=autotable&amp;a=index&amp;model_id=87', '显示', null);
INSERT INTO `sl_column` VALUES ('990', '985', '商品分类', '4', '/index.php?p=admin&amp;c=canshu&amp;classid=244', '显示', null);
INSERT INTO `sl_column` VALUES ('991', '985', '订单管理', '5', '/index.php?p=admin&amp;c=autotable&amp;a=index&amp;model_id=90', '显示', null);
INSERT INTO `sl_column` VALUES ('992', '985', '收货地址', '6', '/index.php?p=admin&amp;c=autotable&amp;a=index&amp;model_id=89', '显示', null);

-- ----------------------------
-- Table structure for `sl_column_group`
-- ----------------------------
DROP TABLE IF EXISTS `sl_column_group`;
CREATE TABLE `sl_column_group` (
  `id` int(10) unsigned NOT NULL,
  `classid` varchar(50) CHARACTER SET utf8 DEFAULT '0' COMMENT '上一级的ID',
  `u1` varchar(250) CHARACTER SET utf8 DEFAULT '栏目名',
  `u2` varchar(250) CHARACTER SET utf8 DEFAULT '0' COMMENT '排序',
  `u3` varchar(250) CHARACTER SET utf8 DEFAULT NULL COMMENT 'url连接地址',
  `u4` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '显示状态',
  `group_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `controller` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '控制器',
  `laiyuan` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '添加人',
  `col_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`col_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1218 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sl_column_group
-- ----------------------------
INSERT INTO `sl_column_group` VALUES ('985', '0', '商城管理', '0', '', '显示', '1', '', 'cdsile', '1188');
INSERT INTO `sl_column_group` VALUES ('986', '985', '商品管理', '1', '/index.php?p=admin&c=autotable&a=index&model_id=85', '显示', '1', 'autotable', 'cdsile', '1189');
INSERT INTO `sl_column_group` VALUES ('987', '985', '商城通知', '2', '/index.php?p=admin&c=autotable&a=index&model_id=86', '显示', '1', 'autotable', 'cdsile', '1190');
INSERT INTO `sl_column_group` VALUES ('988', '985', '精品推荐', '3', '/index.php?p=admin&c=autotable&a=index&model_id=87', '显示', '1', 'autotable', 'cdsile', '1191');
INSERT INTO `sl_column_group` VALUES ('990', '985', '商品分类', '4', '/index.php?p=admin&c=canshu&classid=244', '显示', '1', 'canshu', 'cdsile', '1192');
INSERT INTO `sl_column_group` VALUES ('991', '985', '订单管理', '5', '/index.php?p=admin&c=autotable&a=index&model_id=90', '显示', '1', 'autotable', 'cdsile', '1193');
INSERT INTO `sl_column_group` VALUES ('992', '985', '收货地址', '6', '/index.php?p=admin&c=autotable&a=index&model_id=89', '显示', '1', 'autotable', 'cdsile', '1194');
INSERT INTO `sl_column_group` VALUES ('8', '0', '内容管理', '1', '', '显示', '1', '', 'cdsile', '1195');
INSERT INTO `sl_column_group` VALUES ('974', '8', '关于我们', '11', 'index.php?p=admin&c=autotable&a=edit&model_id=76&id=1', '显示', '1', 'autotable', 'cdsile', '1196');
INSERT INTO `sl_column_group` VALUES ('983', '8', '注册会员', '12', 'index.php?p=admin&c=yonghumoxing&a=index&model_id=60', '显示', '1', 'yonghumoxing', 'cdsile', '1197');
INSERT INTO `sl_column_group` VALUES ('984', '8', '专家回答', '13', '/index.php?p=admin&c=autotable&a=index&model_id=81', '显示', '1', 'autotable', 'cdsile', '1198');
INSERT INTO `sl_column_group` VALUES ('973', '8', '用户管理', '3', 'index.php?p=admin&c=yuangong&a=index&model_id=60', '显示', '1', 'yuangong', 'cdsile', '1199');
INSERT INTO `sl_column_group` VALUES ('980', '8', '专家团队', '4', 'index.php?p=admin&c=autotable&a=index&model_id=79', '显示', '1', 'autotable', 'cdsile', '1200');
INSERT INTO `sl_column_group` VALUES ('979', '8', '用户提问', '5', 'index.php?p=admin&c=autotable&a=index&model_id=80', '显示', '1', 'autotable', 'cdsile', '1201');
INSERT INTO `sl_column_group` VALUES ('978', '8', '精华贴', '6', 'index.php?p=admin&c=sort&a=index&model_id=77&sort_id=72', '显示', '1', 'sort', 'cdsile', '1202');
INSERT INTO `sl_column_group` VALUES ('960', '8', '用户反馈', '6', 'index.php?p=admin&c=autotable&a=index&model_id=68', '显示', '1', 'autotable', 'cdsile', '1203');
INSERT INTO `sl_column_group` VALUES ('977', '8', '解决方案', '7', 'index.php?p=admin&c=sort&a=index&model_id=77&sort_id=73', '显示', '1', 'sort', 'cdsile', '1204');
INSERT INTO `sl_column_group` VALUES ('981', '8', '自动回复', '8', 'index.php?p=admin&c=autotable&a=index&model_id=82', '显示', '1', 'autotable', 'cdsile', '1205');
INSERT INTO `sl_column_group` VALUES ('982', '8', '供需管理', '9', '/index.php?p=admin&c=autotable&a=index&model_id=84', '显示', '1', 'autotable', 'cdsile', '1206');
INSERT INTO `sl_column_group` VALUES ('10', '0', '用户管理', '2', '', '显示', '1', '', 'cdsile', '1207');
INSERT INTO `sl_column_group` VALUES ('19', '10', '管理员管理', '0', '/index.php?p=admin&c=yonghu&a=index', '显示', '1', 'yonghu', 'cdsile', '1208');
INSERT INTO `sl_column_group` VALUES ('976', '10', '管理员权限', '2', 'index.php?p=admin&c=Group', '显示', '1', 'Group', 'cdsile', '1209');
INSERT INTO `sl_column_group` VALUES ('12', '0', '系统管理', '4', '', '显示', '1', '', 'cdsile', '1210');
INSERT INTO `sl_column_group` VALUES ('857', '12', '参数管理', '0', '/index.php?p=admin&c=canshu&a=index', '显示', '1', 'canshu', 'cdsile', '1211');
INSERT INTO `sl_column_group` VALUES ('15', '12', '网站配置', '1', '/index.php?p=admin&c=peizhi&a=index', '显示', '1', 'peizhi', 'cdsile', '1212');
INSERT INTO `sl_column_group` VALUES ('14', '12', '系统日志', '2', '/index.php?p=admin&c=system&a=index', '显示', '1', 'system', 'cdsile', '1213');
INSERT INTO `sl_column_group` VALUES ('16', '12', '模型管理', '3', '/index.php?p=admin&c=moxing&a=index', '显示', '1', 'moxing', 'cdsile', '1214');
INSERT INTO `sl_column_group` VALUES ('17', '12', '栏目管理', '4', '/index.php?p=admin&c=lanmu&a=index', '显示', '1', 'lanmu', 'cdsile', '1215');
INSERT INTO `sl_column_group` VALUES ('881', '0', '功能拓展', '5', '', '显示', '1', '', 'cdsile', '1216');
INSERT INTO `sl_column_group` VALUES ('975', '881', '版本升级', '0', 'index.php?p=admin&c=autotable&a=index&model_id=73', '显示', '1', 'autotable', 'cdsile', '1217');

-- ----------------------------
-- Table structure for `sl_dingdan`
-- ----------------------------
DROP TABLE IF EXISTS `sl_dingdan`;
CREATE TABLE `sl_dingdan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `yonghuming` char(100) DEFAULT NULL COMMENT '用户名',
  `shouhuodizhi` char(100) DEFAULT '89|id' COMMENT '收货地址',
  `dingdanzhuangtai` char(100) DEFAULT 'sql{sl_canshu|where classid=253 |order by id desc|u1,u1}' COMMENT '订单状态',
  `jiage` char(100) DEFAULT NULL COMMENT '价格',
  `beizhu` varchar(250) DEFAULT NULL COMMENT '备注',
  `shangpin` char(100) DEFAULT '88|id' COMMENT '商品',
  `dingdanhao` char(100) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='sl_dingdan模型主表';

-- ----------------------------
-- Records of sl_dingdan
-- ----------------------------
INSERT INTO `sl_dingdan` VALUES ('55', '2017-12-28 05:38:55', '18782140263', '23', '未支付', '20', null, '99', '2017122857319');

-- ----------------------------
-- Table structure for `sl_fankui`
-- ----------------------------
DROP TABLE IF EXISTS `sl_fankui`;
CREATE TABLE `sl_fankui` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dtime` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `lianxifangshi` char(100) DEFAULT NULL COMMENT '联系方式',
  `fankuineirong` varchar(250) DEFAULT NULL COMMENT '反馈内容',
  `yonghuming` char(100) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='sl_fankui模型主表';

-- ----------------------------
-- Records of sl_fankui
-- ----------------------------
INSERT INTO `sl_fankui` VALUES ('29', '2017-10-31 11:18:55', '18382489345', '大家', '员工测试1');

-- ----------------------------
-- Table structure for `sl_filed`
-- ----------------------------
DROP TABLE IF EXISTS `sl_filed`;
CREATE TABLE `sl_filed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` varchar(50) DEFAULT ' ' COMMENT '模型id',
  `u1` varchar(50) DEFAULT ' ' COMMENT '数据库字段名',
  `u2` varchar(50) DEFAULT ' ' COMMENT '字段名称',
  `u3` varchar(50) DEFAULT ' ' COMMENT '字段提示',
  `u4` varchar(10) DEFAULT '否' COMMENT '是否必填',
  `u5` varchar(10) DEFAULT '否' COMMENT '是否显示',
  `u6` varchar(10) DEFAULT '否' COMMENT '是否检索',
  `u7` varchar(50) DEFAULT '文本框' COMMENT '字段类型',
  `u8` varchar(250) DEFAULT ' ' COMMENT '默认值',
  `u9` varchar(50) DEFAULT '10%' COMMENT '列表CSS',
  `u10` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=641 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_filed
-- ----------------------------
INSERT INTO `sl_filed` VALUES ('326', '60', 'dtime', '添加时间', '', '否', '否', '否', '时间框', 'CURRENT_TIMESTAMP', '10%', '2');
INSERT INTO `sl_filed` VALUES ('327', '60', 'yonghuming', '用户名', ' ', '否', '是', '是', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('328', '60', 'mima', '密码', ' ', '否', '否', '否', '密码', ' ', '10%', '1');
INSERT INTO `sl_filed` VALUES ('429', '60', 'xingming', '姓名', ' ', '否', '是', '是', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('433', '68', 'dtime', '添加时间', '', '否', '是', '否', '时间框', 'CURRENT_TIMESTAMP', '15%', '0');
INSERT INTO `sl_filed` VALUES ('434', '68', 'lianxifangshi', '联系方式', ' ', '否', '是', '是', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('435', '68', 'fankuineirong', '反馈内容', ' ', '否', '是', '是', '文本域', ' ', '30%', '0');
INSERT INTO `sl_filed` VALUES ('436', '68', 'yonghuming', '用户名', ' ', '否', '是', '是', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('492', '73', 'dtime', '添加时间', '', '否', '否', '否', '时间框', 'CURRENT_TIMESTAMP', '10%', '2');
INSERT INTO `sl_filed` VALUES ('493', '73', 'banbenmingcheng', '版本名称', ' ', '否', '是', '是', '文本框', ' ', '15%', '0');
INSERT INTO `sl_filed` VALUES ('494', '73', 'banbenhao', '版本号', ' ', '否', '是', '是', '文本框', ' ', '15%', '0');
INSERT INTO `sl_filed` VALUES ('495', '73', 'shifouqiangzhishengji', '是否强制升级', ' ', '否', '是', '否', '单选', '是\r\n否', '10%', '0');
INSERT INTO `sl_filed` VALUES ('496', '73', 'xiazaidizhi', '下载地址', ' ', '否', '是', '否', '文件', ' ', '20%', '0');
INSERT INTO `sl_filed` VALUES ('497', '60', 'touxiang', '头像', ' ', '否', '是', '否', '图片', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('507', '73', 'gengxinshujuleixing', '更新数据类型', ' ', '否', '是', '否', '单选', '全新安装\r\n增量升级', '10%', '0');
INSERT INTO `sl_filed` VALUES ('509', '76', 'dtime', '添加时间', '', '否', '否', '否', '时间框', 'CURRENT_TIMESTAMP', '10%', '2');
INSERT INTO `sl_filed` VALUES ('510', '76', 'neirong', '内容', ' ', '否', '是', '是', '文本编辑器', ' ', '80%', '0');
INSERT INTO `sl_filed` VALUES ('511', '76', 'biaoti', '标题', ' ', '否', '是', '是', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('512', '77', 'biaoti', '标题', '', '是', '是', '是', '文本框', ' ', '10%', '3');
INSERT INTO `sl_filed` VALUES ('513', '77', 'laiyuan', '来源', '', '否', '否', '否', '文本框', '', '10%', '4');
INSERT INTO `sl_filed` VALUES ('514', '77', 'status', '状态：待审,终审,回收站', '', '否', '否', '否', '文本框', '终审', '10%', '5');
INSERT INTO `sl_filed` VALUES ('515', '77', 'paixu', '排序', '', '否', '否', '否', '数字', '1', '10%', '6');
INSERT INTO `sl_filed` VALUES ('517', '77', 'suolutu', '缩略图', '', '否', '是', '否', '图片', ' ', '10%', '8');
INSERT INTO `sl_filed` VALUES ('519', '77', 'jianjie', '简介', '', '否', '否', '是', '文本域', ' ', '30%', '50');
INSERT INTO `sl_filed` VALUES ('523', '77', 'yonghuming', '用户名', '', '否', '是', '是', '文本框', ' ', '10%', '14');
INSERT INTO `sl_filed` VALUES ('525', '77', 'dtime', '添加时间', '', '否', '是', '否', '时间框', 'CURRENT_TIMESTAMP', '10%', '16');
INSERT INTO `sl_filed` VALUES ('529', '79', 'dtime', '添加时间', '', '否', '否', '否', '时间框', 'CURRENT_TIMESTAMP', '10%', '2');
INSERT INTO `sl_filed` VALUES ('530', '79', 'xingming', '姓名', ' ', '否', '是', '是', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('531', '79', 'touxiang', '头像', ' ', '否', '是', '是', '图片', ' ', '10%', '1');
INSERT INTO `sl_filed` VALUES ('532', '79', 'xingyelingyu', '行业领域', ' ', '否', '是', '是', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('533', '79', 'zhicheng', '职称', ' ', '否', '是', '是', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('534', '79', 'zhuanjiajingyan', '专家经验', ' ', '否', '是', '是', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('535', '79', 'shanchangzhenduan', '擅长诊断', ' ', '否', '否', '否', '多选', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('536', '79', 'suozaidiqu', '所在地区', ' ', '否', '否', '否', '文本框', ' ', '10%', '10');
INSERT INTO `sl_filed` VALUES ('537', '79', 'gerenjianjie', '个人简介', ' ', '否', '否', '是', '文本域', ' ', '10%', '5');
INSERT INTO `sl_filed` VALUES ('538', '79', 'huojiangrongyu', '获奖荣誉', ' ', '否', '否', '否', '文本编辑器', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('539', '80', 'dtime', '添加时间', '', '否', '是', '否', '时间框', ' ', '10%', '10');
INSERT INTO `sl_filed` VALUES ('541', '80', 'zutu', '组图', ' ', '否', '否', '否', '组图', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('542', '80', 'neirong', '内容', ' ', '否', '是', '是', '文本域', ' ', '30%', '0');
INSERT INTO `sl_filed` VALUES ('543', '80', 'yonghuming', '用户名', ' ', '否', '是', '否', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('544', '80', 'zan', '赞', ' ', '否', '是', '否', '数字', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('545', '80', 'leibie', '类别', ' ', '否', '是', '否', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('546', '77', 'neirong', '内容', ' ', '否', '否', '否', '文本编辑器', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('547', '79', 'paixu', '排序', ' ', '否', '否', '否', '数字', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('549', '81', 'dtime', '添加时间', '', '否', '否', '否', '时间框', 'CURRENT_TIMESTAMP', '10%', '2');
INSERT INTO `sl_filed` VALUES ('550', '79', 'bianhao', '编号', ' ', '否', '否', '否', '文本框', ' ', '10%', '11');
INSERT INTO `sl_filed` VALUES ('551', '81', 'yonghuming', '专家姓名', ' ', '否', '是', '是', '下拉框', 'sql{sl_zhuanjia|where 1=1|order by id desc|id,xingming}', '10%', '0');
INSERT INTO `sl_filed` VALUES ('552', '81', 'neirong', '内容', ' ', '否', '否', '是', '文本编辑器', ' ', '10%', '5');
INSERT INTO `sl_filed` VALUES ('553', '81', 'laiyuanbianhao', '问题标题', ' ', '否', '是', '否', '下拉框', 'sql{sl_wenti|where 1=1|order by id desc|id,neirong}', '10%', '3');
INSERT INTO `sl_filed` VALUES ('554', '80', 'leixing', '类型', ' ', '否', '是', '是', '单选', '普通帖\r\n精品帖', '10%', '0');
INSERT INTO `sl_filed` VALUES ('555', '82', 'dtime', '添加时间', '', '否', '否', '否', '时间框', 'CURRENT_TIMESTAMP', '10%', '2');
INSERT INTO `sl_filed` VALUES ('556', '82', 'wenti', '问题', ' ', '否', '是', '是', '文本域', ' ', '30%', '0');
INSERT INTO `sl_filed` VALUES ('557', '82', 'daan', '答案', ' ', '否', '否', '是', '文本编辑器', ' ', '30%', '1');
INSERT INTO `sl_filed` VALUES ('559', '82', 'zhuanjia', '专家', ' ', '否', '是', '否', '下拉框', ' sql{sl_zhuanjia|where 1=1|order by id desc|id,xingming}', '10%', '2');
INSERT INTO `sl_filed` VALUES ('560', '84', 'dtime', '添加时间', '', '否', '否', '否', '时间框', 'CURRENT_TIMESTAMP', '10%', '2');
INSERT INTO `sl_filed` VALUES ('561', '84', 'biaoti', '标题', ' ', '是', '是', '否', '文本框', ' ', '15%', '0');
INSERT INTO `sl_filed` VALUES ('562', '84', 'neirong', '内容', ' ', '否', '否', '是', '文本编辑器', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('563', '84', 'yonghuming', '用户名', ' ', '否', '是', '是', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('564', '84', 'zutu', '组图', ' ', '否', '否', '否', '组图', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('565', '84', 'weizhi', '位置', ' ', '否', '是', '是', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('566', '84', 'renqi', '人气', ' ', '否', '是', '否', '数字', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('568', '84', 'chanpinleibie', '产品类别', ' ', '否', '是', '否', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('569', '84', 'gongxuleixing', '供需类型', ' ', '否', '是', '否', '单选', '买\r\n卖', '10%', '0');
INSERT INTO `sl_filed` VALUES ('570', '60', 'xingbie', '性别', ' ', '否', '否', '否', '单选', '保密\r\n男\r\n女', '10%', '0');
INSERT INTO `sl_filed` VALUES ('571', '60', 'diqu', '地区', ' ', '否', '否', '否', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('572', '60', 'gexingqianming', '个性签名', ' ', '否', '否', '否', '文本域', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('573', '60', 'shenfen', '身份', ' ', '否', '否', '否', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('574', '60', 'zhongzhimianji', '种植面积', ' ', '否', '否', '否', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('575', '60', 'zhongzhizuowu', '种植作物', ' ', '否', '否', '否', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('576', '60', 'jianjie', '简介', ' ', '否', '否', '否', '文本域', ' 未填写', '10%', '0');
INSERT INTO `sl_filed` VALUES ('577', '85', 'dtime', '添加时间', '', '否', '否', '否', '时间框', 'CURRENT_TIMESTAMP', '10%', '2');
INSERT INTO `sl_filed` VALUES ('578', '85', 'mingcheng', '名称', ' ', '否', '是', '是', '文本框', ' ', '15%', '1');
INSERT INTO `sl_filed` VALUES ('579', '85', 'jiage', '价格', ' ', '否', '是', '是', '金额', '0', '10%', '5');
INSERT INTO `sl_filed` VALUES ('580', '85', 'zutu', '组图', '  (分辨率：674*449)', '否', '否', '否', '组图', ' ', '10%', '3');
INSERT INTO `sl_filed` VALUES ('581', '85', 'suoluetu', '缩略图', ' (分辨率：342*342)', '否', '是', '否', '图片', ' ', '10%', '2');
INSERT INTO `sl_filed` VALUES ('582', '85', 'xiangqing', '详情', ' ', '否', '否', '是', '文本编辑器', ' ', '10%', '6');
INSERT INTO `sl_filed` VALUES ('583', '85', 'danwei', '单位', ' （瓶，箱，件）', '否', '是', '否', '文本框', ' ', '10%', '7');
INSERT INTO `sl_filed` VALUES ('584', '85', 'lianxidianhua', '联系电话', ' ', '否', '否', '否', '文本框', ' ', '10%', '7');
INSERT INTO `sl_filed` VALUES ('585', '86', 'dtime', '添加时间', '', '否', '否', '否', '时间框', 'CURRENT_TIMESTAMP', '10%', '2');
INSERT INTO `sl_filed` VALUES ('586', '86', 'suoluetu', '缩略图', ' (分辨率：750*377)', '否', '是', '否', '图片', ' ', '20%', '0');
INSERT INTO `sl_filed` VALUES ('587', '86', 'biaoti', '标题', ' ', '是', '是', '否', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('588', '86', 'shouyexianshi', '首页显示', ' ', '否', '是', '否', '单选', '是\r\n否', '10%', '0');
INSERT INTO `sl_filed` VALUES ('589', '86', 'paixu', '排序', ' ', '否', '否', '否', '数字', '0', '10%', '0');
INSERT INTO `sl_filed` VALUES ('590', '86', 'neirong', '内容', ' ', '否', '否', '否', '文本编辑器', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('591', '87', 'dtime', '添加时间', '', '否', '否', '否', '时间框', 'CURRENT_TIMESTAMP', '10%', '2');
INSERT INTO `sl_filed` VALUES ('592', '87', 'laiyuanbianhao', '推荐商品', ' ', '否', '是', '否', '下拉框', 'sql{sl_shangpin|where 1=1|order by id desc|id,mingcheng}', '30%', '0');
INSERT INTO `sl_filed` VALUES ('593', '87', 'paixu', '排序', ' ', '否', '是', '否', '数字', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('594', '87', 'suoluetu', '缩略图', ' ', '否', '是', '否', '图片', ' ', '15%', '0');
INSERT INTO `sl_filed` VALUES ('595', '85', 'shangpinfenlei', '商品分类', ' ', '否', '是', '是', '下拉框', 'sql{sl_canshu|where classid=244|order by id desc|u1,u1}', '10%', '9');
INSERT INTO `sl_filed` VALUES ('596', '88', 'dtime', '添加时间', '', '否', '否', '否', '时间框', 'CURRENT_TIMESTAMP', '10%', '2');
INSERT INTO `sl_filed` VALUES ('597', '88', 'laiyuanbianhao', '商品', ' ', '否', '是', '否', '下拉框', 'sql{sl_shangpin|where 1=1|order by id desc|id,mingcheng}', '20%', '1');
INSERT INTO `sl_filed` VALUES ('598', '88', 'yonghuming', '用户名', ' ', '否', '否', '是', '文本框', ' ', '10%', '2');
INSERT INTO `sl_filed` VALUES ('599', '88', 'shuliang', '数量', ' ', '否', '是', '否', '数字', '0', '5%', '3');
INSERT INTO `sl_filed` VALUES ('601', '89', 'dtime', '添加时间', '', '否', '否', '否', '时间框', 'CURRENT_TIMESTAMP', '10%', '2');
INSERT INTO `sl_filed` VALUES ('602', '89', 'yonghuming', '用户名', ' ', '否', '是', '是', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('603', '89', 'sheng', '省', ' ', '否', '是', '是', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('604', '89', 'shi', '市', ' ', '否', '是', '是', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('605', '89', 'xian', '县', ' ', '否', '是', '是', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('606', '89', 'shouhuoren', '收货人', ' ', '否', '是', '是', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('607', '89', 'shouhuorenshoujihao', '收货人手机号', ' ', '否', '是', '是', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('608', '89', 'shifoumoren', '是否默认', ' ', '否', '否', '否', '单选', '否\r\n是', '10%', '0');
INSERT INTO `sl_filed` VALUES ('609', '89', 'xiangxidizhi', '详细地址', ' ', '否', '是', '是', '文本域', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('610', '90', 'dtime', '添加时间', '', '否', '否', '否', '时间框', 'CURRENT_TIMESTAMP', '10%', '2');
INSERT INTO `sl_filed` VALUES ('611', '90', 'yonghuming', '用户名', ' ', '否', '是', '是', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('612', '90', 'shouhuodizhi', '收货地址', ' ', '否', '否', '否', '多条记录', '89|id', '20%', '0');
INSERT INTO `sl_filed` VALUES ('613', '90', 'dingdanzhuangtai', '订单状态', ' ', '否', '是', '是', '下拉框', 'sql{sl_canshu|where classid=253 |order by id desc|u1,u1}', '10%', '0');
INSERT INTO `sl_filed` VALUES ('614', '90', 'jiage', '价格', ' ', '否', '是', '否', '金额', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('615', '90', 'beizhu', '备注', ' ', '否', '是', '否', '文本域', ' ', '20%', '0');
INSERT INTO `sl_filed` VALUES ('616', '90', 'shangpin', '商品', ' ', '否', '否', '否', '多条记录', '88|id', '10%', '0');
INSERT INTO `sl_filed` VALUES ('617', '90', 'dingdanhao', '订单号', ' ', '否', '是', '是', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('619', '88', 'dingdanhao', '订单号', ' ', '否', '否', '是', '文本框', ' ', '10%', '4');
INSERT INTO `sl_filed` VALUES ('634', '92', 'dtime', '添加时间', '', '否', '否', '否', '时间框', 'CURRENT_TIMESTAMP', '10%', '2');
INSERT INTO `sl_filed` VALUES ('635', '92', 'yonghuming', '用户名', ' ', '否', '是', '是', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('636', '92', 'laiyuanbianhao', '来源编号', ' ', '否', '是', '否', '文本框', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('637', '92', 'leixing', '类型', ' ', '否', '是', '是', '单选', '商品收藏\r\n点赞\r\n文章收藏\r\n问答收藏', '10%', '0');
INSERT INTO `sl_filed` VALUES ('638', '88', 'suoluetu', '缩略图', ' ', '否', '是', '否', '图片', ' ', '10%', '0');
INSERT INTO `sl_filed` VALUES ('639', '88', 'jiage', '价格', ' ', '否', '是', '否', '金额', '0', '10%', '0');
INSERT INTO `sl_filed` VALUES ('640', '88', 'danwei', '单位', ' ', '否', '是', '否', '文本框', ' ', '10%', '0');

-- ----------------------------
-- Table structure for `sl_gongxu`
-- ----------------------------
DROP TABLE IF EXISTS `sl_gongxu`;
CREATE TABLE `sl_gongxu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `biaoti` char(100) NOT NULL COMMENT '标题',
  `neirong` mediumtext COMMENT '内容',
  `yonghuming` char(100) DEFAULT NULL COMMENT '用户名',
  `zutu` varchar(250) DEFAULT NULL COMMENT '组图',
  `weizhi` char(100) DEFAULT NULL COMMENT '位置',
  `renqi` char(100) DEFAULT NULL COMMENT '人气',
  `chanpinleibie` char(100) DEFAULT NULL COMMENT '产品类别',
  `gongxuleixing` varchar(250) DEFAULT '买\r\n卖' COMMENT '供需类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='sl_gongxu模型主表';

-- ----------------------------
-- Records of sl_gongxu
-- ----------------------------
INSERT INTO `sl_gongxu` VALUES ('1', '2017-11-27 16:02:21', '葡萄', '这是葡萄详情', '18782140263', 'public/app/uploads/fromApp151176974036.jpeg{title}{next}public/app/uploads/fromApp151176974069.jpeg{title}', '四川省成都市龙泉驿区龙溪路', '21', '葡萄', '卖');
INSERT INTO `sl_gongxu` VALUES ('2', '2017-11-27 16:03:20', '草莓', '我要买草莓草莓', '18782140263', null, '四川省成都市龙泉驿区龙溪路', '12', '草莓', '买');
INSERT INTO `sl_gongxu` VALUES ('3', '2017-11-27 18:18:05', '我要买李子', '李子要大要甜', '18782140263', null, '四川省成都市龙泉驿区龙溪路', '18', '李子', '买');
INSERT INTO `sl_gongxu` VALUES ('4', '2017-11-27 18:40:32', '姜', '12345铁路局路途遥远我浓郁三十如狼', '18782140263', 'public/app/uploads/fromApp151177923198.jpeg{title}{next}public/app/uploads/fromApp151177923181.jpeg{title}', '四川省成都市龙泉驿区龙溪路', '50', '姜', '卖');
INSERT INTO `sl_gongxu` VALUES ('5', '2017-11-28 00:59:03', '宁夏大西瓜', '我们的西瓜又甜又沙', '18782140263', 'public/app/uploads/fromApp151180194343.jpeg{title}', '四川省成都市龙泉驿区龙城大道', '38', '西瓜', '卖');
INSERT INTO `sl_gongxu` VALUES ('6', '2017-11-29 12:40:18', '番茄求够', '怎么购西瓜', '15386501342', null, '四川省乐山市市中区肖坝路', '5', '番茄', '买');
INSERT INTO `sl_gongxu` VALUES ('7', '2017-11-29 12:40:50', '买西瓜', '买西瓜', '15386501342', null, '四川省乐山市市中区肖坝路', '5', '西瓜', '买');
INSERT INTO `sl_gongxu` VALUES ('8', '2017-11-30 09:55:37', '卖葡萄苗子', '卖葡萄苗子', '18981365082', null, '四川省乐山市五通桥区建设街1079', '1', '其它', '卖');
INSERT INTO `sl_gongxu` VALUES ('9', '2017-11-30 09:56:17', '柑橘', '求购新品种柑橘苗', '18981365082', null, '四川省乐山市五通桥区建设街1079', '3', '柑橘', '买');
INSERT INTO `sl_gongxu` VALUES ('10', '2017-12-01 16:18:38', '出售葡萄', '出售巨峰葡萄', '15386501342', null, '四川省乐山市市中区肖坝路', '2', '葡萄', '卖');
INSERT INTO `sl_gongxu` VALUES ('11', '2017-12-02 10:54:23', '出售葡萄', '出售葡萄100斤', '15386501342', null, '四川省乐山市市中区肖坝路', '4', '葡萄', '卖');
INSERT INTO `sl_gongxu` VALUES ('12', '2017-12-02 10:55:08', '卖葡萄', '500斤', '15386501342', null, '四川省乐山市市中区肖坝路', '9', '葡萄', '卖');

-- ----------------------------
-- Table structure for `sl_gouwuche`
-- ----------------------------
DROP TABLE IF EXISTS `sl_gouwuche`;
CREATE TABLE `sl_gouwuche` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `laiyuanbianhao` char(100) DEFAULT 'sql{sl_shangpin|where 1=1|order by id desc|id,mingcheng}' COMMENT '商品',
  `yonghuming` char(100) DEFAULT NULL COMMENT '用户名',
  `shuliang` char(100) DEFAULT '0' COMMENT '数量',
  `dingdanhao` char(100) DEFAULT NULL COMMENT '订单号',
  `suoluetu` varchar(250) DEFAULT NULL COMMENT '缩略图',
  `jiage` char(100) DEFAULT '0' COMMENT '价格',
  `danwei` char(100) DEFAULT NULL COMMENT '单位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='sl_gouwuche模型主表';

-- ----------------------------
-- Records of sl_gouwuche
-- ----------------------------
INSERT INTO `sl_gouwuche` VALUES ('99', '2017-12-28 05:38:55', '3', '18782140263', '1', '2017122857319', 'public/uploads/20171226/201712260101515a412effc65d4.jpg', '20', '箱');

-- ----------------------------
-- Table structure for `sl_group`
-- ----------------------------
DROP TABLE IF EXISTS `sl_group`;
CREATE TABLE `sl_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zuming` varchar(250) CHARACTER SET utf8 DEFAULT NULL COMMENT '组名',
  `rand` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sl_group
-- ----------------------------
INSERT INTO `sl_group` VALUES ('1', '超级管理员', '2058');

-- ----------------------------
-- Table structure for `sl_guanyuwomen`
-- ----------------------------
DROP TABLE IF EXISTS `sl_guanyuwomen`;
CREATE TABLE `sl_guanyuwomen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `neirong` mediumtext COMMENT '内容',
  `biaoti` char(100) DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='sl_guanyuwomen模型主表';

-- ----------------------------
-- Records of sl_guanyuwomen
-- ----------------------------
INSERT INTO `sl_guanyuwomen` VALUES ('1', '2017-11-04 01:37:09', '&lt;p style=&quot;white-space: normal; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 36px;&quot;&gt;&lt;strong&gt;爱华植保&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 24px;&quot;&gt;&lt;strong&gt;&lt;br/&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;text-align: right; color: rgb(255, 255, 255); font-size: 20px; background-color: rgb(0, 176, 240);&quot;&gt;爱华植保&lt;/span&gt;&lt;span style=&quot;font-size: 20px;&quot;&gt;&lt;span style=&quot;text-align: right; color: rgb(255, 255, 255); background-color: rgb(0, 176, 240);&quot;&gt;&lt;strong style=&quot;font-size: 36px; text-align: center;&quot;&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;text-align: right; color: rgb(255, 255, 255); font-size: 20px; background-color: rgb(0, 176, 240);&quot;&gt;客户端&lt;/span&gt;&lt;strong style=&quot;text-align: right;&quot;&gt;&lt;span style=&quot;font-size: 36px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;版本号：1.0&lt;/p&gt;&lt;p class=&quot;p1&quot; style=&quot;white-space: normal;&quot;&gt;爱华植保APP归爱华农业开发有限公司所有。&lt;/p&gt;&lt;p class=&quot;p1&quot; style=&quot;white-space: normal;&quot;&gt;感谢爱华植保所有的贡献者！&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 20px; background-color: rgb(0, 176, 240); color: rgb(255, 255, 255);&quot;&gt;关于中国.爱华植保&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p class=&quot;p1&quot; style=&quot;white-space: normal;&quot;&gt;&amp;nbsp; &amp;nbsp;爱华农业开发有限公司诞生于2008年8月，公司聚合了多名从事农业科技的专业人士——其中有获得国务院政府津贴的农业专家龚海东老师；有专门从事农业技术推广的冯德美教授等。公司团队成员均有20年以上的项目经验,能够把握最本质的植保理念，结合互联网信息技术所带来的创新思维，致力于农作物和土壤的健康。&lt;br/&gt;&amp;nbsp; &amp;nbsp;我们为种植者提供免费的专业的植保技术服务；提供免费的农产品购销平台；提供优质价廉的农化产品。&lt;/p&gt;&lt;p class=&quot;p1&quot; style=&quot;white-space: normal;&quot;&gt;&amp;nbsp; &amp;nbsp;爱华农业开发有限公司已服务于除台湾地区以外的中国大陆3000余家种植专业合作社、基地、农场，并留下了较好的口碑。&lt;/p&gt;&lt;p class=&quot;p1&quot; style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p class=&quot;p1&quot; style=&quot;white-space: normal;&quot;&gt;&lt;embed type=&quot;application/x-shockwave-flash&quot; class=&quot;edui-faked-video&quot; pluginspage=&quot;http://www.macromedia.com/go/getflashplayer&quot; src=&quot;https://v.qq.com/x/page/q0375ep5j9k.html?ptag=qqbrowser&quot; width=&quot;420&quot; height=&quot;280&quot; wmode=&quot;transparent&quot; play=&quot;true&quot; loop=&quot;false&quot; menu=&quot;false&quot; allowscriptaccess=&quot;never&quot; allowfullscreen=&quot;true&quot;/&gt;&lt;/p&gt;', '关于我们');

-- ----------------------------
-- Table structure for `sl_huida`
-- ----------------------------
DROP TABLE IF EXISTS `sl_huida`;
CREATE TABLE `sl_huida` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `yonghuming` char(100) DEFAULT 'sql{sl_zhuanjia|where 1=1|order by id desc|id,xingming}' COMMENT '专家姓名',
  `neirong` mediumtext COMMENT '内容',
  `laiyuanbianhao` char(100) DEFAULT 'sql{sl_wenti|where 1=1|order by id desc|id,neirong}' COMMENT '问题标题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='sl_huida模型主表';

-- ----------------------------
-- Records of sl_huida
-- ----------------------------
INSERT INTO `sl_huida` VALUES ('31', '2017-12-25 15:54:29', '6', '&lt;p&gt;你好，我们是爱华，有什么可以帮到您？&lt;/p&gt;', '60');
INSERT INTO `sl_huida` VALUES ('32', '2017-12-25 15:54:29', '5', '&lt;p&gt;&lt;img src=&quot;application/views/admin/upload/ueditor/images/20171127/1511762406116220.png&quot; title=&quot;1511762406116220.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;application/views/admin/upload/ueditor/images/20171127/1511762407121293.png&quot; title=&quot;1511762407121293.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '60');
INSERT INTO `sl_huida` VALUES ('33', '2017-12-25 15:54:29', '6', '&lt;p&gt;阿斯顿发生大法上的&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/application/views/admin/upload/ueditor/images/20171127/1511762407121293.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/application/views/admin/upload/ueditor/images/20171127/1511762406116220.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/application/views/admin/upload/ueditor/images/20161112/1478954866672672.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/application/views/admin/upload/ueditor/images/20161112/1478954170767730.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/application/views/admin/upload/ueditor/images/20161112/1478954170542329.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/application/views/admin/upload/ueditor/images/20161112/1478954170376872.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/application/views/admin/upload/ueditor/images/20161112/1478954170293476.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '60');

-- ----------------------------
-- Table structure for `sl_jilu`
-- ----------------------------
DROP TABLE IF EXISTS `sl_jilu`;
CREATE TABLE `sl_jilu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `yonghuming` char(100) DEFAULT NULL COMMENT '用户名',
  `laiyuanbianhao` char(100) DEFAULT NULL COMMENT '来源编号',
  `leixing` varchar(250) DEFAULT '商品收藏\r\n点赞\r\n文章收藏\r\n问答收藏' COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sl_jilu模型主表';

-- ----------------------------
-- Records of sl_jilu
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_moxing`
-- ----------------------------
DROP TABLE IF EXISTS `sl_moxing`;
CREATE TABLE `sl_moxing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `u1` varchar(50) CHARACTER SET utf8 DEFAULT ' ' COMMENT '数据库表名',
  `u2` varchar(50) CHARACTER SET utf8 DEFAULT ' ' COMMENT '模型中文名',
  `u3` varchar(50) CHARACTER SET utf8 DEFAULT ' ' COMMENT '模型类型',
  `u4` varchar(50) CHARACTER SET utf8 DEFAULT ' ' COMMENT '栏目列表模版',
  `u5` varchar(50) CHARACTER SET utf8 DEFAULT ' ' COMMENT '栏目内容模版',
  `u6` varchar(250) CHARACTER SET utf8 DEFAULT '/' COMMENT '栏目路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sl_moxing
-- ----------------------------
INSERT INTO `sl_moxing` VALUES ('60', 'sl_user', '用户', '用户模型', ' ', '0', '/');
INSERT INTO `sl_moxing` VALUES ('68', 'sl_fankui', '意见反馈', '表单模型', ' ', '0', '/');
INSERT INTO `sl_moxing` VALUES ('73', 'sl_banben', '版本升级', '表单模型', ' ', '0', '/');
INSERT INTO `sl_moxing` VALUES ('76', 'sl_guanyuwomen', '关于我们', '表单模型', ' ', '0', '/');
INSERT INTO `sl_moxing` VALUES ('77', 'sl_wenda', '问答', '文章模型', ' ', '0', '/');
INSERT INTO `sl_moxing` VALUES ('79', 'sl_zhuanjia', '专家团队', '表单模型', ' ', '0', '/');
INSERT INTO `sl_moxing` VALUES ('80', 'sl_wenti', '用户提问', '表单模型', ' ', '0', '/');
INSERT INTO `sl_moxing` VALUES ('81', 'sl_huida', '专家回答', '表单模型', ' ', '0', '/');
INSERT INTO `sl_moxing` VALUES ('82', 'sl_zidonghuida', '自动回答', '表单模型', ' ', '0', '/');
INSERT INTO `sl_moxing` VALUES ('84', 'sl_gongxu', '供需', '表单模型', ' ', '0', '/');
INSERT INTO `sl_moxing` VALUES ('85', 'sl_shangpin', '商品', '表单模型', ' ', '0', '/');
INSERT INTO `sl_moxing` VALUES ('86', 'sl_tongzhi', '商城通知', '表单模型', ' ', '0', '/');
INSERT INTO `sl_moxing` VALUES ('87', 'sl_tuijian', '精品推荐', '表单模型', ' ', '0', '/');
INSERT INTO `sl_moxing` VALUES ('88', 'sl_gouwuche', '购物车', '表单模型', ' ', '0', '/');
INSERT INTO `sl_moxing` VALUES ('89', 'sl_shouhuodizhi', '收货地址', '表单模型', ' ', '0', '/');
INSERT INTO `sl_moxing` VALUES ('90', 'sl_dingdan', '订单', '表单模型', ' ', '0', '/');
INSERT INTO `sl_moxing` VALUES ('92', 'sl_jilu', '记录', '表单模型', ' ', '0', '/');

-- ----------------------------
-- Table structure for `sl_shangpin`
-- ----------------------------
DROP TABLE IF EXISTS `sl_shangpin`;
CREATE TABLE `sl_shangpin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `mingcheng` char(100) DEFAULT NULL COMMENT '名称',
  `jiage` char(100) DEFAULT '0' COMMENT '价格',
  `zutu` varchar(250) DEFAULT NULL COMMENT '组图',
  `suoluetu` varchar(250) DEFAULT NULL COMMENT '缩略图',
  `xiangqing` mediumtext COMMENT '详情',
  `danwei` char(100) DEFAULT NULL COMMENT '单位',
  `lianxidianhua` char(100) DEFAULT NULL COMMENT '联系电话',
  `shangpinfenlei` char(100) DEFAULT 'sql{sl_canshu|where classid=244|order by id desc|u1,u1}' COMMENT '商品分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='sl_shangpin模型主表';

-- ----------------------------
-- Records of sl_shangpin
-- ----------------------------
INSERT INTO `sl_shangpin` VALUES ('1', '2017-12-25 23:42:06', '商品1', '10', 'public/webuploader/upload/fruit-3.jpg{title}{next}public/webuploader/upload/banner.jpg{title}{next}public/webuploader/upload/fruit-2.jpg{title}{next}public/webuploader/upload/fruit-1.jpg{title}', 'public/uploads/20171225/201712252342065a411c4e16e36.jpg', '&lt;p&gt;&lt;img src=&quot;application/views/admin/upload/ueditor/images/20171225/1514216522745912.png&quot; title=&quot;1514216522745912.png&quot; alt=&quot;detail-1.png&quot;/&gt;&lt;/p&gt;', '箱', '18782140262', '杀介杀螨');
INSERT INTO `sl_shangpin` VALUES ('2', '2017-12-25 23:57:24', '商品2', '110', 'public/webuploader/upload/fruit-3.jpg{title}{next}public/webuploader/upload/banner.jpg{title}{next}public/webuploader/upload/fruit-2.jpg{title}{next}public/webuploader/upload/fruit-1.jpg{title}', 'public/uploads/20171226/201712260103185a412f5603d09.jpg', '&lt;p&gt;&lt;img src=&quot;application/views/admin/upload/ueditor/images/20171225/1514216522745912.png&quot; title=&quot;1514216522745912.png&quot; alt=&quot;detail-1.png&quot;/&gt;&lt;/p&gt;', '箱', '18782140262', '肥料');
INSERT INTO `sl_shangpin` VALUES ('3', '2017-12-26 01:01:51', '商品3', '20', 'public/webuploader/upload/hot-1.jpg{title}{next}public/webuploader/upload/sale-2.jpg{title}{next}public/webuploader/upload/sale-1.jpg{title}', 'public/uploads/20171226/201712260101515a412effc65d4.jpg', '&lt;p&gt;&lt;img src=&quot;/application/views/admin/upload/ueditor/images/20171225/1514216522745912.png&quot; alt=&quot;1514216522745912.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/application/views/admin/upload/ueditor/images/20171127/1511762406116220.png&quot; alt=&quot;1511762406116220.png&quot;/&gt;&lt;/p&gt;', '箱', '13320668037', '除草剂');

-- ----------------------------
-- Table structure for `sl_shouhuodizhi`
-- ----------------------------
DROP TABLE IF EXISTS `sl_shouhuodizhi`;
CREATE TABLE `sl_shouhuodizhi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `yonghuming` char(100) DEFAULT NULL COMMENT '用户名',
  `sheng` char(100) DEFAULT NULL COMMENT '省',
  `shi` char(100) DEFAULT NULL COMMENT '市',
  `xian` char(100) DEFAULT NULL COMMENT '县',
  `shouhuoren` char(100) DEFAULT NULL COMMENT '收货人',
  `shouhuorenshoujihao` char(100) DEFAULT NULL COMMENT '收货人手机号',
  `shifoumoren` varchar(250) DEFAULT '否\r\n是' COMMENT '是否默认',
  `xiangxidizhi` varchar(250) DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='sl_shouhuodizhi模型主表';

-- ----------------------------
-- Records of sl_shouhuodizhi
-- ----------------------------
INSERT INTO `sl_shouhuodizhi` VALUES ('23', '2017-12-28 02:02:40', '18782140263', '北京市', '北京市', '东城区', '哈哈', '18785214026', '是', '考虑天空');

-- ----------------------------
-- Table structure for `sl_sort`
-- ----------------------------
DROP TABLE IF EXISTS `sl_sort`;
CREATE TABLE `sl_sort` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int(10) unsigned DEFAULT '0' COMMENT '模型id',
  `paixu` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `sort_id` int(10) unsigned DEFAULT '0' COMMENT '所属父级id',
  `url` varchar(250) DEFAULT '#' COMMENT '栏目链接',
  `u1` varchar(250) DEFAULT NULL,
  `u2` varchar(250) DEFAULT NULL,
  `u3` varchar(250) DEFAULT NULL,
  `u4` varchar(250) DEFAULT NULL,
  `u5` varchar(250) DEFAULT ' ' COMMENT '栏目封面',
  `u6` varchar(500) DEFAULT ' ' COMMENT '栏目介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='sl_sort';

-- ----------------------------
-- Records of sl_sort
-- ----------------------------
INSERT INTO `sl_sort` VALUES ('23', '53', '0', '18', '#', '成功案例', 'list.html', 'goods.html', '/', ' ', ' ');
INSERT INTO `sl_sort` VALUES ('24', '53', '0', '23', '#', 'wap站点', 'list.html', 'goods.html', '/', ' ', ' ');
INSERT INTO `sl_sort` VALUES ('37', '53', '1', '25', '#', '品牌官网设计', 'service.html', 'service.html', '/', 'public/uploads/20161214/201612141411095850e27d24f56.jpg', '<dd>策划、设计、前端、程序开发全方位一条龙服务</dd>\r\n								<dd>充分了解企业文化、行业特点，体现企业特色</dd>\r\n								<dd>设计师一对一沟通，充分了解你的需求和想法</dd>\r\n								<dd>时刻掌握最新技术动向，打造高品质网站</dd>');
INSERT INTO `sl_sort` VALUES ('38', '53', '2', '25', '#', '商城网站开发', 'service.html', 'service.html', '/', 'public/uploads/20161214/201612141415155850e373d7b27.jpg', '<dd>专业量身定制设计、定制功能、定制后台开发</dd>\r\n								<dd>拥有资深开发团队，追求质量同时保证速度</dd>\r\n								<dd>追求完美，不断提升系统响应速度和稳定性</dd>\r\n								<dd>完善的测试流程，在上线之前解决问题</dd>');
INSERT INTO `sl_sort` VALUES ('39', '53', '3', '25', '#', '手机网站建设', 'service.html', 'service.html', '/', 'public/uploads/20161214/201612141415505850e396e2323.jpg', '<dd>个性设计，独一无二，用设计风格体现企业文化</dd>\r\n								<dd>精简代码、追求速度，兼容主流手机浏览器</dd>\r\n								<dd>和PC端数据同步，管理方便，全方位网络营销</dd>\r\n								<dd>零成本增加微信网站</dd>');
INSERT INTO `sl_sort` VALUES ('40', '53', '4', '25', '#', '平面设计、摄影', 'service.html', 'service.html', '/', 'public/uploads/20161214/201612141416245850e3b87be1c.jpg', '<dd>平面：画册设计，包装设计，标志设计</dd>\r\n								<dd>摄影：凭着多年的摄影经验为客户量身定做最适合的</dd>\r\n								<dd>摄影服务,对每一个项目都深入的研究，深刻洞察</dd>\r\n								<dd>每一个细节,立志成为行业的推动者和缔造者</dd>');
INSERT INTO `sl_sort` VALUES ('41', '53', '1', '27', '#', '手机网站', 'cases.html', 'articledetail.html', '/', ' ', ' ');
INSERT INTO `sl_sort` VALUES ('42', '53', '2', '27', '#', '企业案例', 'cases.html', 'articledetail.html', '/', '', ' ');
INSERT INTO `sl_sort` VALUES ('43', '53', '3', '27', '#', '购物商城', 'cases.html', 'articledetail.html', '/', ' ', ' ');
INSERT INTO `sl_sort` VALUES ('45', '53', '0', '29', '#', '企业网站解决方案', 'solutions.html', 'articledetail.html', '/', ' ', '企业网站作为一个公司的网络名片，最主要的作用是展示公司形象和宣传公司的服务或产品，所...');
INSERT INTO `sl_sort` VALUES ('46', '53', '1', '29', '#', '旅游网站解决方案', 'solutions.html', 'articledetail.html', '/', ' ', '随着互联网的迅速，越多越多人，尤其是上班白领，都喜欢在网上查看旅游相关信息，然后再网上直...');
INSERT INTO `sl_sort` VALUES ('47', '53', '2', '29', '#', '手机网站解决方案', 'solutions.html', 'articledetail.html', '/', ' ', '着智能手机的迅速发展，移动互联网时代已经到来，这带给我们是一个机遇还是危机？全取决于...');
INSERT INTO `sl_sort` VALUES ('48', '53', '3', '29', '#', '商城网站解决方案', 'solutions.html', 'articledetail.html', '/', ' ', '商城网站需要强大的后台管理系统、良好的用户购物体验、安全稳定的服务器空间，商城网站...\r\n');
INSERT INTO `sl_sort` VALUES ('49', '53', '5', '25', '#', '微信网站建设', 'service.html', 'service.html', '/', ' ', ' ');
INSERT INTO `sl_sort` VALUES ('50', '53', '6', '25', '#', '其他网站建设', 'service.html', 'service.html', '/', ' ', ' ');
INSERT INTO `sl_sort` VALUES ('64', '53', '4', '29', '#', '外贸网站解决方案', 'solutions.html', 'articledetail.html', '/', ' ', '外贸网站的面向用户主要为国外客户，所以除了文字采用英文外，风格设计、页面编码、操作习惯都要适应国外客户需...');
INSERT INTO `sl_sort` VALUES ('65', '53', '5', '29', '#', '服装网站解决方案', 'solutions.html', 'articledetail.html', '/', ' ', '风格上清新明快，符合最新审美观，制作精细，有积极开放的感觉；使用流行的大区块划分概念，配合使用大广告条，突出宣传...');
INSERT INTO `sl_sort` VALUES ('66', '53', '6', '29', '#', '集团上市公司解决方案', 'solutions.html', 'articledetail.html', '/', ' ', '随着集团上市公司的不断壮大，集团企业、上市公司的信息需要采用各种途径公众于媒体、上级领导、内部员工、投...');
INSERT INTO `sl_sort` VALUES ('67', '53', '7', '29', '#', '酒店网站解决方案', 'solutions.html', 'articledetail.html', '/', ' ', '在建设酒店网站时我们要充分考虑“酒店”的经营服务特色，因此我们在制作方案时会注重系统的实用性、可靠性、...');
INSERT INTO `sl_sort` VALUES ('68', '53', '4', '29', '8', '门户网站解决方案', 'solutions.html', 'articledetail.html', '/', ' ', '门户网站不是简单的内容管理，而是新闻内容的聚合，做好门户网站，需要管理好网站的内容，同时...');
INSERT INTO `sl_sort` VALUES ('69', '53', '8', '29', '#', '搜索引擎优化解决方案', 'solutions.html', 'articledetail.html', '/', ' ', '今天我们谈提高网站的价值，那么什么是网站的价值呢？很简单，网站的价值就是访客觉得有用，提高网站的价值，就是让更...');
INSERT INTO `sl_sort` VALUES ('70', '53', '9', '29', '9', '教育培训网站解决方案', 'solutions.html', 'articledetail.html', '/', ' ', '维尼开发的视频教学系统在视频教课程学行领域处在领先技术优势，给许多客户带了丰厚的盈利、扩大了市场的占有...');
INSERT INTO `sl_sort` VALUES ('71', '53', '0', '0', '#', '关于我们', '.DS_Store', '.DS_Store', '/', ' ', ' ');
INSERT INTO `sl_sort` VALUES ('73', '77', '0', '0', '#', '解决方案', null, null, '/', ' ', ' ');

-- ----------------------------
-- Table structure for `sl_system`
-- ----------------------------
DROP TABLE IF EXISTS `sl_system`;
CREATE TABLE `sl_system` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `u1` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `u2` varchar(250) CHARACTER SET utf8 DEFAULT NULL COMMENT '日志说明',
  `u3` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '访问ip',
  `u4` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '日志类型',
  `dtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `yonghuming` char(100) DEFAULT NULL,
  `sql` text COMMENT '执行的sql语句',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8313 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sl_system
-- ----------------------------
INSERT INTO `sl_system` VALUES ('8081', 'admin', 'admin:登录失败，用户名或密码错误。操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '125.70.22.90', '管理员登录', '2017-11-04 02:15:36', null, null);
INSERT INTO `sl_system` VALUES ('8082', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '125.70.22.90', '管理员登录', '2017-11-04 02:15:45', null, null);
INSERT INTO `sl_system` VALUES ('8083', 'cdsile', 'cdsile:更改用户信息：成功。操作页面:kf.cdsile.com/index.php?p=admin&amp;c=yonghu&amp;a=update', '125.70.22.90', '用户管理', '2017-11-04 02:17:34', null, null);
INSERT INTO `sl_system` VALUES ('8084', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '125.70.22.90', '管理员登录', '2017-11-04 02:17:47', null, null);
INSERT INTO `sl_system` VALUES ('8085', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '125.70.22.90', '管理员登录', '2017-11-04 08:11:34', null, null);
INSERT INTO `sl_system` VALUES ('8086', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '125.70.22.90', '管理员登录', '2017-11-04 15:24:44', null, null);
INSERT INTO `sl_system` VALUES ('8087', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '125.70.22.90', '管理员登录', '2017-11-04 16:10:07', null, null);
INSERT INTO `sl_system` VALUES ('8088', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '125.70.22.90', '管理员登录', '2017-11-05 21:52:40', null, null);
INSERT INTO `sl_system` VALUES ('8089', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '125.70.22.90', '管理员登录', '2017-11-06 03:56:10', null, null);
INSERT INTO `sl_system` VALUES ('8090', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '125.70.22.90', '用户登录', '2017-11-06 06:37:39', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8091', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '125.70.22.90', '用户登录', '2017-11-06 06:44:13', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8092', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '125.70.22.90', '用户登录', '2017-11-06 06:47:02', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8093', '123', '123:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=123&mima=123', '125.70.22.90', '用户登录', '2017-11-06 10:49:31', '123', null);
INSERT INTO `sl_system` VALUES ('8094', '1234', '1234:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=1234&mima=1234', '125.70.22.90', '用户登录', '2017-11-06 10:50:18', '1234', null);
INSERT INTO `sl_system` VALUES ('8095', '1234', '1234:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=1234&mima=12344', '125.70.22.90', '用户登录', '2017-11-06 10:51:50', '1234', null);
INSERT INTO `sl_system` VALUES ('8096', '123456', '123456:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=123456&mima=123456', '125.70.22.90', '用户登录', '2017-11-06 10:52:49', '123456', null);
INSERT INTO `sl_system` VALUES ('8097', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '125.68.114.162', '管理员登录', '2017-11-06 16:41:56', null, null);
INSERT INTO `sl_system` VALUES ('8098', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '125.68.114.162', '管理员登录', '2017-11-07 08:19:24', null, null);
INSERT INTO `sl_system` VALUES ('8099', 'cdsiLe', 'cdsiLe(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '118.124.245.117', '管理员登录', '2017-11-07 09:26:19', null, null);
INSERT INTO `sl_system` VALUES ('8100', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=197032', '118.124.245.117', '用户登录', '2017-11-07 12:47:33', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8101', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=197032', '118.124.245.117', '用户登录', '2017-11-07 12:47:37', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8102', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=197032', '118.124.245.117', '用户登录', '2017-11-07 12:47:39', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8103', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=197032', '118.124.245.117', '用户登录', '2017-11-07 12:47:54', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8104', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=197032', '118.124.245.117', '用户登录', '2017-11-07 12:47:58', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8105', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=197032', '118.124.245.117', '用户登录', '2017-11-07 12:48:12', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8106', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=197032', '118.124.245.117', '用户登录', '2017-11-07 12:48:14', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8107', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=197032', '118.124.245.117', '用户登录', '2017-11-07 12:48:21', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8108', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=197032', '118.124.245.117', '用户登录', '2017-11-07 12:48:29', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8109', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=197032', '118.124.245.117', '用户登录', '2017-11-07 12:49:00', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8110', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=197032', '118.124.245.117', '用户登录', '2017-11-07 12:49:10', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8111', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=197032', '118.124.245.117', '用户登录', '2017-11-07 12:49:12', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8112', '45328667913', '45328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=45328667913&mima=197032', '118.124.245.117', '用户登录', '2017-11-07 12:49:30', '45328667913', null);
INSERT INTO `sl_system` VALUES ('8113', '45328667913', '45328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=45328667913&mima=197032', '118.124.245.117', '用户登录', '2017-11-07 12:49:39', '45328667913', null);
INSERT INTO `sl_system` VALUES ('8114', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=19732', '118.124.245.117', '用户登录', '2017-11-07 12:51:26', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8115', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=197032', '118.124.245.117', '用户登录', '2017-11-07 12:51:36', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8116', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=197032', '118.124.245.117', '用户登录', '2017-11-07 12:51:38', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8117', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '125.68.114.162', '管理员登录', '2017-11-10 08:34:23', null, null);
INSERT INTO `sl_system` VALUES ('8118', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '125.68.115.47', '管理员登录', '2017-11-12 21:12:22', null, null);
INSERT INTO `sl_system` VALUES ('8119', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '222.209.51.80', '用户登录', '2017-11-25 16:12:57', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8120', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '222.209.51.80', '用户登录', '2017-11-25 16:18:36', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8121', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '222.209.51.80', '用户登录', '2017-11-25 16:19:45', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8122', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '222.209.51.80', '用户登录', '2017-11-25 16:34:38', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8123', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '222.209.51.80', '管理员登录', '2017-11-25 16:53:57', null, null);
INSERT INTO `sl_system` VALUES ('8124', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '222.209.62.206', '管理员登录', '2017-11-27 11:41:27', null, null);
INSERT INTO `sl_system` VALUES ('8125', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '222.196.195.206', '管理员登录', '2017-11-27 12:51:33', null, null);
INSERT INTO `sl_system` VALUES ('8126', '15386501342', '15386501342:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '125.68.125.151', '用户登录', '2017-11-29 12:02:48', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8127', '15386501342', '15386501342:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3161322', '125.68.125.151', '用户登录', '2017-11-29 12:02:56', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8128', '15686501342', '15686501342:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15686501342&mima=3352984', '125.68.125.151', '用户登录', '2017-11-29 12:06:51', '15686501342', null);
INSERT INTO `sl_system` VALUES ('8129', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '125.68.125.151', '用户登录', '2017-11-29 12:06:59', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8130', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '125.68.125.151', '用户登录', '2017-11-29 12:19:42', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8131', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '175.6.232.41', '用户登录', '2017-11-29 12:20:17', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8132', '18981365082', '18981365082:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18981365082&mima=3352984', '110.189.64.249', '用户登录', '2017-11-29 12:34:34', '18981365082', null);
INSERT INTO `sl_system` VALUES ('8133', '18981365082', '18981365082:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18981365082&mima=3352984', '110.189.64.249', '用户登录', '2017-11-29 12:35:11', '18981365082', null);
INSERT INTO `sl_system` VALUES ('8134', '18981365082', '18981365082:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=18981365082&mima=12345678', '110.189.64.249', '用户登录', '2017-11-29 12:35:22', '18981365082', null);
INSERT INTO `sl_system` VALUES ('8135', '18981365082', '18981365082:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18981365082&mima=3352984', '110.189.64.249', '用户登录', '2017-11-29 12:35:30', '18981365082', null);
INSERT INTO `sl_system` VALUES ('8136', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '125.68.125.151', '用户登录', '2017-11-29 12:38:13', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8137', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '125.68.125.151', '用户登录', '2017-11-29 12:58:09', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8138', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '125.68.125.151', '用户登录', '2017-11-29 12:58:24', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8139', '18981365082', '18981365082:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18981365082&mima=3352984', '110.189.64.249', '用户登录', '2017-11-30 09:56:51', '18981365082', null);
INSERT INTO `sl_system` VALUES ('8140', '18981365082', '18981365082:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18981365082&mima=3352984', '110.189.64.249', '用户登录', '2017-11-30 09:57:19', '18981365082', null);
INSERT INTO `sl_system` VALUES ('8141', '153286667913', '153286667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=153286667913&mima=197032', '110.189.64.249', '用户登录', '2017-11-30 10:44:44', '153286667913', null);
INSERT INTO `sl_system` VALUES ('8142', '153286667913', '153286667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=153286667913&mima=197032', '110.189.64.249', '用户登录', '2017-11-30 10:44:49', '153286667913', null);
INSERT INTO `sl_system` VALUES ('8143', '153286667913', '153286667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=153286667913&mima=19700323', '110.189.64.249', '用户登录', '2017-11-30 10:44:58', '153286667913', null);
INSERT INTO `sl_system` VALUES ('8144', '153286667913', '153286667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=153286667913&mima=19700323', '110.189.64.249', '用户登录', '2017-11-30 10:45:04', '153286667913', null);
INSERT INTO `sl_system` VALUES ('8145', '153286667913', '153286667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=153286667913&mima=z197032', '110.189.64.249', '用户登录', '2017-11-30 10:45:40', '153286667913', null);
INSERT INTO `sl_system` VALUES ('8146', '153286667913', '153286667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=153286667913&mima=z19700323', '110.189.64.249', '用户登录', '2017-11-30 10:45:51', '153286667913', null);
INSERT INTO `sl_system` VALUES ('8147', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=197032', '110.189.64.249', '用户登录', '2017-11-30 10:46:09', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8148', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=19700323', '110.189.64.249', '用户登录', '2017-11-30 10:46:20', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8149', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=z197032', '110.189.64.249', '用户登录', '2017-11-30 10:46:30', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8150', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=z19700323', '110.189.64.249', '用户登录', '2017-11-30 10:46:40', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8151', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=3352984', '110.189.64.249', '用户登录', '2017-11-30 10:46:49', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8152', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=2301789', '110.189.64.249', '用户登录', '2017-11-30 10:47:02', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8153', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=3352984', '125.68.125.151', '用户登录', '2017-12-01 09:16:50', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8154', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '125.68.125.151', '用户登录', '2017-12-01 09:17:06', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8155', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '125.68.125.151', '用户登录', '2017-12-01 09:17:20', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8156', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=3352984', '218.29.186.44', '用户登录', '2017-12-01 09:17:45', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8157', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '125.68.125.151', '用户登录', '2017-12-01 09:17:59', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8158', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '125.68.125.151', '用户登录', '2017-12-01 09:22:59', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8159', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=3352984', '118.124.236.208', '用户登录', '2017-12-02 10:01:49', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8160', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=2301789', '118.124.236.208', '用户登录', '2017-12-02 10:02:00', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8161', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=19700323', '118.124.236.208', '用户登录', '2017-12-02 10:08:36', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8162', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '118.124.236.208', '用户登录', '2017-12-02 10:11:40', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8163', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '118.124.236.208', '用户登录', '2017-12-02 10:17:26', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8164', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '14.215.176.146', '用户登录', '2017-12-02 11:06:00', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8165', '15328667913', '15328667913:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=15328667913&mima=19700323', '222.88.92.250', '用户登录', '2017-12-02 17:23:46', '15328667913', null);
INSERT INTO `sl_system` VALUES ('8166', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '118.116.113.17', '管理员登录', '2017-12-05 13:57:31', null, null);
INSERT INTO `sl_system` VALUES ('8167', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 14:58:01', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8168', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:09:51', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8169', '18782140263', '18782140263:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=e10adc3949ba59abbe56e057f20f883e', '118.113.44.2', '用户登录', '2017-12-09 15:12:44', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8170', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:12:50', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8171', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:12:58', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8172', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:13:09', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8173', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:16:11', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8174', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:16:28', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8175', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:16:43', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8176', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:16:54', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8177', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:17:27', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8178', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:17:30', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8179', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:17:46', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8180', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:17:51', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8181', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:18:11', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8182', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:19:46', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8183', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:20:02', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8184', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:20:39', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8185', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:21:04', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8186', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:21:14', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8187', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:21:21', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8188', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:23:36', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8189', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:24:20', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8190', '18782140263', '18782140263:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=e10adc3949ba59abbe56e057f20f883e', '118.113.44.2', '用户登录', '2017-12-09 15:25:57', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8191', '18782140263', '18782140263:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=e10adc3949ba59abbe56e057f20f883e', '118.113.44.2', '用户登录', '2017-12-09 15:26:07', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8192', '18782140263', '18782140263:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263', '118.113.44.2', '用户登录', '2017-12-09 15:26:44', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8193', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:27:51', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8194', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:27:57', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8195', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:28:08', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8196', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:28:28', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8197', '18782140263', '18782140263:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=e10adc3949ba59abbe56e057f20f883e', '118.113.44.2', '用户登录', '2017-12-09 15:28:32', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8198', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:28:37', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8199', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:32:03', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8200', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:32:28', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8201', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:32:31', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8202', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:32:33', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8203', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:32:36', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8204', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:33:06', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8205', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:33:17', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8206', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:33:21', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8207', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:34:10', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8208', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 15:34:19', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8209', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:35:44', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8210', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:36:03', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8211', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:36:32', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8212', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:36:48', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8213', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:38:08', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8214', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:39:49', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8215', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 15:39:53', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8216', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '118.113.44.2', '管理员登录', '2017-12-09 15:45:15', null, null);
INSERT INTO `sl_system` VALUES ('8217', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 16:04:48', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8218', 'undefined', 'undefined:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=undefined&mima=undefined', '118.113.44.2', '用户登录', '2017-12-09 16:05:41', 'undefined', null);
INSERT INTO `sl_system` VALUES ('8219', '18782140262', '18782140262:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140262&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 16:17:28', '18782140262', null);
INSERT INTO `sl_system` VALUES ('8220', '18782140262', '18782140262:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140262&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 16:18:21', '18782140262', null);
INSERT INTO `sl_system` VALUES ('8221', '18782140262', '18782140262:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140262&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 16:18:32', '18782140262', null);
INSERT INTO `sl_system` VALUES ('8222', '18782140262', '18782140262:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140262&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 16:18:56', '18782140262', null);
INSERT INTO `sl_system` VALUES ('8223', '18782140262', '18782140262:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140262&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 16:23:25', '18782140262', null);
INSERT INTO `sl_system` VALUES ('8224', '18782140261', '18782140261:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140261&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 16:30:46', '18782140261', null);
INSERT INTO `sl_system` VALUES ('8225', '18782140261', '18782140261:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140261&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 16:31:07', '18782140261', null);
INSERT INTO `sl_system` VALUES ('8226', '18782140261', '18782140261:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140261&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 16:31:12', '18782140261', null);
INSERT INTO `sl_system` VALUES ('8227', '18782140261', '18782140261:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140261&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 16:54:52', '18782140261', null);
INSERT INTO `sl_system` VALUES ('8228', '18782140261', '18782140261:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140261&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 17:02:43', '18782140261', null);
INSERT INTO `sl_system` VALUES ('8229', '18782140261', '18782140261:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140261&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 17:03:44', '18782140261', null);
INSERT INTO `sl_system` VALUES ('8230', '18782140261', '18782140261:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140261&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 17:05:13', '18782140261', null);
INSERT INTO `sl_system` VALUES ('8231', '18782140261', '18782140261:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140261&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 17:05:32', '18782140261', null);
INSERT INTO `sl_system` VALUES ('8232', '18782140261', '18782140261:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140261&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 17:07:13', '18782140261', null);
INSERT INTO `sl_system` VALUES ('8233', '18782140261', '18782140261:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140261&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 17:08:35', '18782140261', null);
INSERT INTO `sl_system` VALUES ('8234', '18782140261', '18782140261:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140261&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 17:08:48', '18782140261', null);
INSERT INTO `sl_system` VALUES ('8235', '18782140261', '18782140261:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140261&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 17:09:07', '18782140261', null);
INSERT INTO `sl_system` VALUES ('8236', '18782140261', '18782140261:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140261&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 17:11:35', '18782140261', null);
INSERT INTO `sl_system` VALUES ('8237', '18782140261', '18782140261:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140261&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 17:11:49', '18782140261', null);
INSERT INTO `sl_system` VALUES ('8238', '18782140261', '18782140261:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140261&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 17:12:09', '18782140261', null);
INSERT INTO `sl_system` VALUES ('8239', '18782140261', '18782140261:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140261&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 17:12:29', '18782140261', null);
INSERT INTO `sl_system` VALUES ('8240', '18782140261', '18782140261:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140261&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 17:14:35', '18782140261', null);
INSERT INTO `sl_system` VALUES ('8241', '18782140261', '18782140261:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140261&mima=123456', '118.113.44.2', '用户登录', '2017-12-09 17:24:05', '18782140261', null);
INSERT INTO `sl_system` VALUES ('8242', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '222.209.63.38', '用户登录', '2017-12-12 23:06:32', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8243', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '117.173.86.10', '管理员登录', '2017-12-14 15:20:00', null, null);
INSERT INTO `sl_system` VALUES ('8244', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '118.116.115.29', '管理员登录', '2017-12-16 22:01:11', null, null);
INSERT INTO `sl_system` VALUES ('8245', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '221.236.99.240', '管理员登录', '2017-12-16 22:01:56', null, null);
INSERT INTO `sl_system` VALUES ('8246', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '125.70.176.48', '管理员登录', '2017-12-16 22:02:00', null, null);
INSERT INTO `sl_system` VALUES ('8247', '18990607768', '18990607768:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=18990607768&mima=cai196833', '14.215.176.10', '用户登录', '2017-12-23 16:12:11', '18990607768', null);
INSERT INTO `sl_system` VALUES ('8248', '18990607768', '18990607768:登录失败，用户名或密码错误。kf.cdsile.com/index.php?type=login&t=user&yonghuming=18990607768&mima=lihaojun', '14.215.176.14', '用户登录', '2017-12-23 16:25:56', '18990607768', null);
INSERT INTO `sl_system` VALUES ('8249', '18990607768', '18990607768:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18990607768&mima=cai196833', '119.5.181.122', '用户登录', '2017-12-24 09:42:52', '18990607768', null);
INSERT INTO `sl_system` VALUES ('8250', '18990607768', '18990607768:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18990607768&mima=cai196833', '119.5.181.122', '用户登录', '2017-12-24 09:43:11', '18990607768', null);
INSERT INTO `sl_system` VALUES ('8251', '18990607768', '18990607768:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18990607768&mima=cai196833', '119.5.181.122', '用户登录', '2017-12-24 09:43:16', '18990607768', null);
INSERT INTO `sl_system` VALUES ('8252', '18990607768', '18990607768:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18990607768&mima=cai196833', '119.5.181.122', '用户登录', '2017-12-24 09:43:18', '18990607768', null);
INSERT INTO `sl_system` VALUES ('8253', '18990607768', '18990607768:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18990607768&mima=cai196833', '119.5.181.122', '用户登录', '2017-12-24 09:43:21', '18990607768', null);
INSERT INTO `sl_system` VALUES ('8254', '18990607768', '18990607768:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18990607768&mima=cai196833', '119.5.181.122', '用户登录', '2017-12-24 09:43:24', '18990607768', null);
INSERT INTO `sl_system` VALUES ('8255', '18990607768', '18990607768:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18990607768&mima=cai196833', '119.5.181.122', '用户登录', '2017-12-24 09:43:26', '18990607768', null);
INSERT INTO `sl_system` VALUES ('8256', '18990607768', '18990607768:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18990607768&mima=cai196833', '119.5.181.122', '用户登录', '2017-12-24 09:45:35', '18990607768', null);
INSERT INTO `sl_system` VALUES ('8257', '18981365082', '18981365082:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18981365082&mima=3352984', '125.68.125.200', '用户登录', '2017-12-24 14:04:26', '18981365082', null);
INSERT INTO `sl_system` VALUES ('8258', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '125.68.125.200', '用户登录', '2017-12-24 14:16:30', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8259', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '125.68.125.200', '用户登录', '2017-12-24 14:16:41', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8260', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '125.68.125.200', '用户登录', '2017-12-24 14:17:03', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8261', '18981365082', '18981365082:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18981365082&mima=3352984', '125.68.125.200', '用户登录', '2017-12-24 14:17:05', '18981365082', null);
INSERT INTO `sl_system` VALUES ('8262', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '125.68.125.200', '用户登录', '2017-12-24 14:17:08', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8263', '18981365082', '18981365082:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18981365082&mima=3352984', '125.68.125.200', '用户登录', '2017-12-24 14:17:15', '18981365082', null);
INSERT INTO `sl_system` VALUES ('8264', '18981365082', '18981365082:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18981365082&mima=3352984', '125.68.125.200', '用户登录', '2017-12-24 14:17:18', '18981365082', null);
INSERT INTO `sl_system` VALUES ('8265', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '125.68.125.200', '用户登录', '2017-12-24 14:17:20', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8266', '18981365082', '18981365082:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18981365082&mima=3352984', '125.68.125.200', '用户登录', '2017-12-24 14:17:21', '18981365082', null);
INSERT INTO `sl_system` VALUES ('8267', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '125.68.125.200', '用户登录', '2017-12-24 14:17:22', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8268', '18981365082', '18981365082:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18981365082&mima=3352984', '125.68.125.200', '用户登录', '2017-12-24 14:17:29', '18981365082', null);
INSERT INTO `sl_system` VALUES ('8269', '18981365082', '18981365082:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18981365082&mima=3352984', '125.68.125.200', '用户登录', '2017-12-24 14:17:41', '18981365082', null);
INSERT INTO `sl_system` VALUES ('8270', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '125.68.125.200', '用户登录', '2017-12-24 14:17:42', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8271', '18981365082', '18981365082:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18981365082&mima=3352984', '125.68.125.200', '用户登录', '2017-12-24 14:25:18', '18981365082', null);
INSERT INTO `sl_system` VALUES ('8272', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '222.209.35.243', '管理员登录', '2017-12-24 20:59:03', null, null);
INSERT INTO `sl_system` VALUES ('8273', '18981365082', '18981365082:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18981365082&mima=3352984', '218.6.154.17', '用户登录', '2017-12-24 21:55:33', '18981365082', null);
INSERT INTO `sl_system` VALUES ('8274', '15386501342', '15386501342:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=15386501342&mima=3352984', '111.206.36.12', '用户登录', '2017-12-24 22:18:24', '15386501342', null);
INSERT INTO `sl_system` VALUES ('8275', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:localhost:8081/index.php?p=admin&amp;c=login&amp;a=signin', '::1', '管理员登录', '2017-12-25 14:27:56', null, null);
INSERT INTO `sl_system` VALUES ('8276', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '125.70.20.23', '管理员登录', '2017-12-25 16:58:23', null, null);
INSERT INTO `sl_system` VALUES ('8277', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '125.70.20.23', '用户登录', '2017-12-25 18:58:57', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8278', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '125.70.20.23', '用户登录', '2017-12-25 18:59:01', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8279', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '125.70.20.23', '用户登录', '2017-12-26 02:12:48', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8280', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '125.70.20.23', '用户登录', '2017-12-26 02:13:04', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8281', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '125.70.20.23', '用户登录', '2017-12-26 02:13:50', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8282', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '125.70.20.23', '用户登录', '2017-12-26 02:13:52', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8283', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '125.68.125.67', '管理员登录', '2017-12-26 16:18:54', null, null);
INSERT INTO `sl_system` VALUES ('8284', 'cdsile', 'cdsile:增加用户信息：成功。操作页面:kf.cdsile.com/index.php?p=admin&amp;c=yonghu&amp;a=insert', '125.68.125.67', '用户管理', '2017-12-26 16:24:35', null, null);
INSERT INTO `sl_system` VALUES ('8285', 'hjljun', 'hjljun(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '125.68.125.67', '管理员登录', '2017-12-26 16:24:57', null, null);
INSERT INTO `sl_system` VALUES ('8286', '18990607768', '18990607768:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18990607768&mima=cai196833', '171.210.218.231', '用户登录', '2017-12-26 16:26:31', '18990607768', null);
INSERT INTO `sl_system` VALUES ('8287', '18990607768', '18990607768:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18990607768&mima=cai196833', '171.210.218.231', '用户登录', '2017-12-26 16:26:58', '18990607768', null);
INSERT INTO `sl_system` VALUES ('8288', '13678945612', '13678945612:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=13678945612&mima=123456', '171.210.218.231', '用户登录', '2017-12-26 16:27:17', '13678945612', null);
INSERT INTO `sl_system` VALUES ('8289', '', ':登录失败，用户名或密码错误。操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '118.124.247.44', '管理员登录', '2017-12-26 16:34:09', null, null);
INSERT INTO `sl_system` VALUES ('8290', '', ':登录失败，用户名或密码错误。操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '118.124.247.44', '管理员登录', '2017-12-26 16:35:31', null, null);
INSERT INTO `sl_system` VALUES ('8291', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '118.124.247.44', '管理员登录', '2017-12-26 16:37:12', null, null);
INSERT INTO `sl_system` VALUES ('8292', 'hjljun', 'hjljun(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '125.68.125.67', '管理员登录', '2017-12-26 16:46:28', null, null);
INSERT INTO `sl_system` VALUES ('8293', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '125.70.20.23', '用户登录', '2017-12-26 18:10:35', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8294', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '125.70.20.23', '用户登录', '2017-12-26 18:28:55', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8295', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '125.70.20.23', '用户登录', '2017-12-26 18:54:46', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8296', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '125.70.20.23', '用户登录', '2017-12-26 19:18:44', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8297', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '125.70.20.23', '用户登录', '2017-12-26 19:26:52', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8298', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '125.70.20.23', '用户登录', '2017-12-26 19:28:03', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8299', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '125.70.20.23', '用户登录', '2017-12-26 20:57:27', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8300', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '125.70.20.23', '用户登录', '2017-12-26 23:19:13', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8301', 'cdsile', 'cdsile(超级管理员):登录成功,操作页面:kf.cdsile.com/index.php?p=admin&amp;c=login&amp;a=signin', '125.68.125.67', '管理员登录', '2017-12-27 14:15:13', null, null);
INSERT INTO `sl_system` VALUES ('8302', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '222.209.60.240', '用户登录', '2017-12-27 18:48:14', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8303', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '222.209.60.240', '用户登录', '2017-12-27 18:48:26', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8304', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '222.209.60.240', '用户登录', '2017-12-27 19:37:29', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8305', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '222.209.60.240', '用户登录', '2017-12-27 19:38:37', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8306', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '222.209.60.240', '用户登录', '2017-12-27 19:38:46', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8307', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '222.209.60.240', '用户登录', '2017-12-28 00:22:47', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8308', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '222.209.60.240', '用户登录', '2017-12-28 03:36:33', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8309', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '222.209.60.240', '用户登录', '2017-12-28 03:36:36', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8310', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '222.209.60.240', '用户登录', '2017-12-28 03:57:05', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8311', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '222.209.60.240', '用户登录', '2017-12-28 03:57:36', '18782140263', null);
INSERT INTO `sl_system` VALUES ('8312', '18782140263', '18782140263:登录成功。 kf.cdsile.com/index.php?type=login&t=user&yonghuming=18782140263&mima=123456', '222.209.60.240', '用户登录', '2017-12-28 04:38:39', '18782140263', null);

-- ----------------------------
-- Table structure for `sl_tongzhi`
-- ----------------------------
DROP TABLE IF EXISTS `sl_tongzhi`;
CREATE TABLE `sl_tongzhi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `suoluetu` varchar(250) DEFAULT NULL COMMENT '缩略图',
  `biaoti` char(100) NOT NULL COMMENT '标题',
  `shouyexianshi` varchar(250) DEFAULT '是\r\n否' COMMENT '首页显示',
  `paixu` char(100) DEFAULT '0' COMMENT '排序',
  `neirong` mediumtext COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='sl_tongzhi模型主表';

-- ----------------------------
-- Records of sl_tongzhi
-- ----------------------------
INSERT INTO `sl_tongzhi` VALUES ('1', '2017-12-26 01:11:27', 'public/uploads/20171226/201712260111275a41313f22551.png', '元旦活动', '是', '0', '&lt;p&gt;&lt;img src=&quot;/application/views/admin/upload/ueditor/images/20171127/1511762407121293.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/application/views/admin/upload/ueditor/images/20161112/1478954866672672.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/application/views/admin/upload/ueditor/images/20161112/1478954170376872.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `sl_tongzhi` VALUES ('2', '2017-12-26 01:13:29', 'public/uploads/20171226/201712260113295a4131b989544.jpg', '双十二活动', '是', '0', '&lt;p&gt;&lt;img src=&quot;/application/views/admin/upload/ueditor/images/20171225/1514216522745912.png&quot; alt=&quot;1514216522745912.png&quot;/&gt;&lt;/p&gt;');

-- ----------------------------
-- Table structure for `sl_tuijian`
-- ----------------------------
DROP TABLE IF EXISTS `sl_tuijian`;
CREATE TABLE `sl_tuijian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `laiyuanbianhao` char(100) DEFAULT 'sql{sl_shangpin|where 1=1|order by id desc|id,mingcheng}' COMMENT '推荐商品',
  `paixu` char(100) DEFAULT NULL COMMENT '排序',
  `suoluetu` varchar(250) DEFAULT NULL COMMENT '缩略图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='sl_tuijian模型主表';

-- ----------------------------
-- Records of sl_tuijian
-- ----------------------------
INSERT INTO `sl_tuijian` VALUES ('1', '2017-12-26 01:37:33', '1', '1', 'public/uploads/20171226/201712260137335a41375d487ab.jpg');
INSERT INTO `sl_tuijian` VALUES ('2', '2017-12-26 01:37:55', '2', '2', 'public/uploads/20171226/201712260137555a413773a037a.jpg');
INSERT INTO `sl_tuijian` VALUES ('3', '2017-12-26 01:38:11', '3', '3', 'public/uploads/20171226/201712260138115a4137834c4b4.jpg');

-- ----------------------------
-- Table structure for `sl_user`
-- ----------------------------
DROP TABLE IF EXISTS `sl_user`;
CREATE TABLE `sl_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `yonghuming` char(100) DEFAULT NULL COMMENT '用户名',
  `mima` varchar(250) DEFAULT NULL COMMENT '密码',
  `xingming` char(100) DEFAULT NULL COMMENT '姓名',
  `touxiang` varchar(250) DEFAULT NULL COMMENT '头像',
  `xingbie` varchar(250) DEFAULT '保密\r\n男\r\n女' COMMENT '性别',
  `diqu` char(100) DEFAULT NULL COMMENT '地区',
  `gexingqianming` varchar(250) DEFAULT NULL COMMENT '个性签名',
  `shenfen` char(100) DEFAULT NULL COMMENT '身份',
  `zhongzhimianji` char(100) DEFAULT NULL COMMENT '种植面积',
  `zhongzhizuowu` char(100) DEFAULT NULL COMMENT '种植作物',
  `jianjie` varchar(250) DEFAULT ' 未填写' COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COMMENT='sl_user模型主表';

-- ----------------------------
-- Records of sl_user
-- ----------------------------
INSERT INTO `sl_user` VALUES ('132', '2017-11-06 06:34:17', '18782140263', 'e10adc3949ba59abbe56e057f20f883e', '思乐测试', 'public/app/uploads/fromApp151440465271.jpeg', '保密\r\n男\r\n女', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `sl_wenda`
-- ----------------------------
DROP TABLE IF EXISTS `sl_wenda`;
CREATE TABLE `sl_wenda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_id` char(100) DEFAULT '0' COMMENT '分类id',
  `biaoti` char(100) NOT NULL COMMENT '标题',
  `laiyuan` char(100) DEFAULT '' COMMENT '来源',
  `status` char(100) DEFAULT '终审' COMMENT '状态：待审,终审,回收站',
  `paixu` int(10) unsigned DEFAULT '1' COMMENT '排序',
  `suolutu` varchar(250) DEFAULT NULL COMMENT '缩略图',
  `jianjie` varchar(250) DEFAULT NULL COMMENT '简介',
  `yonghuming` char(100) DEFAULT NULL COMMENT '用户名',
  `dtime` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `neirong` mediumtext COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='sl_wenda模型主表';

-- ----------------------------
-- Records of sl_wenda
-- ----------------------------
INSERT INTO `sl_wenda` VALUES ('1', '72', '精华帖1', '龚华尧', '终审', '1', 'public/uploads/20171104/2017110408203059fd07ce1c9c3.png', '支持(0)反对(0)\r\n刷新评论刷新页面返回顶部\r\n注册用户登录后才能发表评论，请 登录 或 注册，访问网站首页。\r\n【推荐】50万行VC++源码: 大型组态工控、电力仿真CAD与GIS源码库\r\n【活动】阿里云双11活动开始预热 云服务器限时2折起\r\n【调查】有奖调研即刻参与，你竟然是酱紫程序猿！\r\n【推荐】Vue.js 2.x 快速入门，大量高效实战示例', null, '2017-11-04 08:20:30', '&lt;p&gt;&lt;a class=&quot;comment_digg&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; color: gray; border-bottom-style: none;&quot;&gt;支持(0)&lt;/a&gt;&lt;a class=&quot;comment_bury&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; color: gray; border-bottom-style: none;&quot;&gt;反对(0)&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&lt;a style=&quot;margin: 0px; padding: 0px; color: rgb(57, 154, 178);&quot;&gt;&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;/span&gt;&lt;a style=&quot;margin: 0px; padding: 0px 0px 0px 10px; color: rgb(57, 154, 178);&quot;&gt;刷新评论&lt;/a&gt;&lt;a href=&quot;http://www.cnblogs.com/wanggd/archive/2013/07/17/3195755.html#&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; text-decoration: none; color: rgb(57, 154, 178);&quot;&gt;刷新页面&lt;/a&gt;&lt;a href=&quot;http://www.cnblogs.com/wanggd/archive/2013/07/17/3195755.html#top&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; text-decoration: none; color: rgb(57, 154, 178);&quot;&gt;返回顶部&lt;/a&gt;&lt;/p&gt;&lt;p&gt;注册用户登录后才能发表评论，请&amp;nbsp;&lt;a class=&quot;underline&quot; style=&quot;margin: 0px; padding: 0px; text-decoration: underline !important; color: rgb(57, 154, 178);&quot;&gt;登录&lt;/a&gt;&amp;nbsp;或&amp;nbsp;&lt;a class=&quot;underline&quot; style=&quot;margin: 0px; padding: 0px; text-decoration: underline !important; color: rgb(57, 154, 178);&quot;&gt;注册&lt;/a&gt;，&lt;a href=&quot;http://www.cnblogs.com/&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(57, 154, 178);&quot;&gt;访问&lt;/a&gt;网站首页。&lt;/p&gt;&lt;p&gt;&lt;a href=&quot;http://www.ucancode.com/index.htm&quot; target=&quot;_blank&quot; style=&quot;margin: 0px 10px 0px 0px; padding: 0px; text-decoration: none; color: rgb(57, 154, 178);&quot;&gt;【推荐】50万行VC++源码: 大型组态工控、电力仿真CAD与GIS源码库&lt;/a&gt;&lt;br/&gt;&lt;a href=&quot;https://group.cnblogs.com/topic/77995.html&quot; target=&quot;_blank&quot; style=&quot;margin: 0px 10px 0px 0px; padding: 0px; text-decoration: none; color: rgb(57, 154, 178);&quot;&gt;【活动】阿里云双11活动开始预热 云服务器限时2折起&lt;/a&gt;&lt;br/&gt;&lt;a href=&quot;http://click.aliyun.com/m/33696/&quot; target=&quot;_blank&quot; style=&quot;margin: 0px 10px 0px 0px; padding: 0px; text-decoration: none; color: rgb(57, 154, 178);&quot;&gt;【调查】有奖调研即刻参与，你竟然是酱紫程序猿！&lt;/a&gt;&lt;br/&gt;&lt;a href=&quot;http://xc.hubwiz.com/course/592ee9b2b343f27b0ae1ba99?affid=cnblogs&quot; target=&quot;_blank&quot; style=&quot;margin: 0px 10px 0px 0px; padding: 0px; text-decoration: none; color: rgb(57, 154, 178);&quot;&gt;【推荐】Vue.js 2.x 快速入门，大量高效实战示例&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `sl_wenda` VALUES ('2', '72', '精华帖2', '', '终审', '1', 'public/uploads/20171104/2017110408473659fd0e2892dda.jpg', '\r\n 5+ App开发入门指南\r\n\r\n... 点击后将打开新页面加载“&lt;http://m.csdn.net/&amp; ... 信息，请尝试“终止”后重新启动真机运行！` 启动 ... 体验系列之三 流畅下拉刷新](http://ask.dcloud.net.cn/ ...\r\n\r\n文章  32 个回复	 • 522932 次查看', null, '2017-11-04 08:47:36', '&lt;p class=&quot;aw-title&quot; style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(102, 102, 102); font-family: &amp;#39;Helvetica Neue&amp;#39;, Helvetica, Arial, &amp;#39;Microsoft YaHei&amp;#39;, sans-serif; font-size: 14.399999618530273px; line-height: 22.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;a href=&quot;http://ask.dcloud.net.cn/article/89&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; color: rgb(66, 139, 202); text-decoration: none; cursor: pointer; background: 0px 0px;&quot;&gt;5+ App开发入门指南&lt;/a&gt;&lt;/p&gt;&lt;p class=&quot;aw-search-body&quot; style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: arial; color: rgb(102, 102, 102); font-size: 14.399999618530273px; line-height: 22.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;... 点击后将打开新页面&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;加&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;载&lt;/span&gt;“&amp;lt;http://m.csdn.net/&amp;amp; ... 信息，请尝试“终止”后&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;重新&lt;/span&gt;启动真机运行！` 启动 ... 体验系列之三 流畅&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;下&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;拉&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;刷新&lt;/span&gt;](http://ask.dcloud.net.cn/ ...&lt;/p&gt;&lt;p class=&quot;aw-hide-text aw-text-color-666&quot; style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(102, 102, 102); font-size: 12px; font-family: &amp;#39;Helvetica Neue&amp;#39;, Helvetica, Arial, &amp;#39;Microsoft YaHei&amp;#39;, sans-serif; line-height: 22.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;a class=&quot;aw-search-result-tags&quot; style=&quot;box-sizing: border-box; color: rgb(153, 153, 153); cursor: pointer; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; display: inline-block; padding: 0px 2px; background: rgb(240, 240, 240);&quot;&gt;文章&lt;/a&gt;&amp;nbsp;32 个回复	 • 522932 次查看&lt;/p&gt;&lt;p class=&quot;aw-title&quot; style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(102, 102, 102); font-family: &amp;#39;Helvetica Neue&amp;#39;, Helvetica, Arial, &amp;#39;Microsoft YaHei&amp;#39;, sans-serif; font-size: 14.399999618530273px; line-height: 22.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;a href=&quot;http://ask.dcloud.net.cn/article/89&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; color: rgb(66, 139, 202); text-decoration: none; cursor: pointer; background: 0px 0px;&quot;&gt;5+ App开发入门指南&lt;/a&gt;&lt;/p&gt;&lt;p class=&quot;aw-search-body&quot; style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: arial; color: rgb(102, 102, 102); font-size: 14.399999618530273px; line-height: 22.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;... 点击后将打开新页面&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;加&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;载&lt;/span&gt;“&amp;lt;http://m.csdn.net/&amp;amp; ... 信息，请尝试“终止”后&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;重新&lt;/span&gt;启动真机运行！` 启动 ... 体验系列之三 流畅&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;下&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;拉&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;刷新&lt;/span&gt;](http://ask.dcloud.net.cn/ ...&lt;/p&gt;&lt;p class=&quot;aw-hide-text aw-text-color-666&quot; style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(102, 102, 102); font-size: 12px; font-family: &amp;#39;Helvetica Neue&amp;#39;, Helvetica, Arial, &amp;#39;Microsoft YaHei&amp;#39;, sans-serif; line-height: 22.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;a class=&quot;aw-search-result-tags&quot; style=&quot;box-sizing: border-box; color: rgb(153, 153, 153); cursor: pointer; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; display: inline-block; padding: 0px 2px; background: rgb(240, 240, 240);&quot;&gt;文章&lt;/a&gt;&amp;nbsp;32 个回复	 • 522932 次查看&lt;/p&gt;&lt;p class=&quot;aw-title&quot; style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(102, 102, 102); font-family: &amp;#39;Helvetica Neue&amp;#39;, Helvetica, Arial, &amp;#39;Microsoft YaHei&amp;#39;, sans-serif; font-size: 14.399999618530273px; line-height: 22.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;a href=&quot;http://ask.dcloud.net.cn/article/89&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; color: rgb(66, 139, 202); text-decoration: none; cursor: pointer; background: 0px 0px;&quot;&gt;5+ App开发入门指南&lt;/a&gt;&lt;/p&gt;&lt;p class=&quot;aw-search-body&quot; style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: arial; color: rgb(102, 102, 102); font-size: 14.399999618530273px; line-height: 22.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;... 点击后将打开新页面&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;加&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;载&lt;/span&gt;“&amp;lt;http://m.csdn.net/&amp;amp; ... 信息，请尝试“终止”后&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;重新&lt;/span&gt;启动真机运行！` 启动 ... 体验系列之三 流畅&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;下&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;拉&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;刷新&lt;/span&gt;](http://ask.dcloud.net.cn/ ...&lt;/p&gt;&lt;p class=&quot;aw-hide-text aw-text-color-666&quot; style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(102, 102, 102); font-size: 12px; font-family: &amp;#39;Helvetica Neue&amp;#39;, Helvetica, Arial, &amp;#39;Microsoft YaHei&amp;#39;, sans-serif; line-height: 22.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;a class=&quot;aw-search-result-tags&quot; style=&quot;box-sizing: border-box; color: rgb(153, 153, 153); cursor: pointer; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; display: inline-block; padding: 0px 2px; background: rgb(240, 240, 240);&quot;&gt;文章&lt;/a&gt;&amp;nbsp;32 个回复	 • 522932 次查看&lt;/p&gt;&lt;p class=&quot;aw-title&quot; style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(102, 102, 102); font-family: &amp;#39;Helvetica Neue&amp;#39;, Helvetica, Arial, &amp;#39;Microsoft YaHei&amp;#39;, sans-serif; font-size: 14.399999618530273px; line-height: 22.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;a href=&quot;http://ask.dcloud.net.cn/article/89&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; color: rgb(66, 139, 202); text-decoration: none; cursor: pointer; background: 0px 0px;&quot;&gt;5+ App开发入门指南&lt;/a&gt;&lt;/p&gt;&lt;p class=&quot;aw-search-body&quot; style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: arial; color: rgb(102, 102, 102); font-size: 14.399999618530273px; line-height: 22.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;... 点击后将打开新页面&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;加&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;载&lt;/span&gt;“&amp;lt;http://m.csdn.net/&amp;amp; ... 信息，请尝试“终止”后&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;重新&lt;/span&gt;启动真机运行！` 启动 ... 体验系列之三 流畅&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;下&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;拉&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: bold; color: red;&quot;&gt;刷新&lt;/span&gt;](http://ask.dcloud.net.cn/ ...&lt;/p&gt;&lt;p class=&quot;aw-hide-text aw-text-color-666&quot; style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(102, 102, 102); font-size: 12px; font-family: &amp;#39;Helvetica Neue&amp;#39;, Helvetica, Arial, &amp;#39;Microsoft YaHei&amp;#39;, sans-serif; line-height: 22.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;a class=&quot;aw-search-result-tags&quot; style=&quot;box-sizing: border-box; color: rgb(153, 153, 153); cursor: pointer; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; display: inline-block; padding: 0px 2px; background: rgb(240, 240, 240);&quot;&gt;文章&lt;/a&gt;&amp;nbsp;32 个回复	 • 522932 次查看&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `sl_wenda` VALUES ('3', '72', '精华帖3', '', '终审', '1', 'public/uploads/20171104/2017110415253559fd6b6f839b6.jpg', '刷新评论刷新页面返回顶部\r\n注册用户登录后才能发表评论，请 登录 或 注册，访问网站首页。\r\n【推荐】50万行VC++源码: 大型组态工控、电力仿真CAD与GIS源码库\r\n【活动】阿里云双11活动开始预热 云服务器限时2折起\r\n【调查】有奖调研即刻参与，你竟然是酱紫程序猿！\r\n【推荐】Vue.js 2.x 快速入门，大量高效实战示例', null, '2017-11-04 15:25:35', '&lt;p&gt;&lt;a style=&quot;margin: 0px; padding: 0px 0px 0px 10px;&quot;&gt;刷新评论&lt;/a&gt;&lt;a href=&quot;http://www.cnblogs.com/taidou/p/6003045.html#&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; color: black; text-decoration: none;&quot;&gt;刷新页面&lt;/a&gt;&lt;a href=&quot;http://www.cnblogs.com/taidou/p/6003045.html#top&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; color: black; text-decoration: none;&quot;&gt;返回顶部&lt;/a&gt;&lt;/p&gt;&lt;p&gt;注册用户登录后才能发表评论，请&amp;nbsp;&lt;a class=&quot;underline&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;登录&lt;/a&gt;&amp;nbsp;或&amp;nbsp;&lt;a class=&quot;underline&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;注册&lt;/a&gt;，&lt;a href=&quot;http://www.cnblogs.com/&quot; style=&quot;margin: 0px; padding: 0px; text-decoration: none; color: black;&quot;&gt;访问&lt;/a&gt;网站首页。&lt;/p&gt;&lt;p&gt;&lt;a href=&quot;http://www.ucancode.com/index.htm&quot; target=&quot;_blank&quot; style=&quot;margin: 0px 10px 0px 0px; padding: 0px; color: black; text-decoration: none;&quot;&gt;【推荐】50万行VC++源码: 大型组态工控、电力仿真CAD与GIS源码库&lt;/a&gt;&lt;br/&gt;&lt;a href=&quot;https://group.cnblogs.com/topic/77995.html&quot; target=&quot;_blank&quot; style=&quot;margin: 0px 10px 0px 0px; padding: 0px; color: black; text-decoration: none;&quot;&gt;【活动】阿里云双11活动开始预热 云服务器限时2折起&lt;/a&gt;&lt;br/&gt;&lt;a href=&quot;http://click.aliyun.com/m/33696/&quot; target=&quot;_blank&quot; style=&quot;margin: 0px 10px 0px 0px; padding: 0px; color: black; text-decoration: none;&quot;&gt;【调查】有奖调研即刻参与，你竟然是酱紫程序猿！&lt;/a&gt;&lt;br/&gt;&lt;a href=&quot;http://xc.hubwiz.com/course/592ee9b2b343f27b0ae1ba99?affid=cnblogs&quot; target=&quot;_blank&quot; style=&quot;margin: 0px 10px 0px 0px; padding: 0px; color: black; text-decoration: none;&quot;&gt;【推荐】Vue.js 2.x 快速入门，大量高效实战示例&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `sl_wenda` VALUES ('4', '73', '解决方案1', '来源', '终审', '1', 'public/uploads/20171104/2017110417473159fd8cb37bfa4.jpg', '解决方案1解决方案1解决方案1解决方案1解决方案1解决方案1', null, '2017-11-04 17:47:31', '&lt;p&gt;解决方案1解决方案1解决方案1解决方案1解决方案1解决方案1解决方案1解决方案1&lt;/p&gt;');
INSERT INTO `sl_wenda` VALUES ('5', '73', '解决方案2', '管理员', '终审', '1', 'public/uploads/20171104/2017110417502259fd8d5e42c1d.jpg', 'e-wrap	保留空白符序列，但是正常地进行换行。 \r\n  pre-line	合并空白符序列，但是保留换行符。 \r\n  inherit	规定应该从父元素继承 white-space 属性的值 ', null, '2017-11-04 17:49:41', '&lt;p&gt;&lt;span style=&quot;font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 25.200000762939453px; background-color: rgb(255, 255, 255);&quot;&gt;e-wrap	保留空白符序列，但是正常地进行换行。&amp;nbsp;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 25.200000762939453px; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp; pre-line	合并空白符序列，但是保留换行符。&amp;nbsp;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 25.200000762939453px; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp; inherit	规定应该从父元素继承 white-space 属性的值&amp;nbsp;&lt;/span&gt;&lt;/p&gt;');
INSERT INTO `sl_wenda` VALUES ('6', '73', '《葡萄的健康管理方案》', '——爱华农业开发有限公司 技术支持部', '终审', '1', 'public/uploads/20171107/201711071034375a011bbd9a7ec.jpg', '   爱华农业开发有限公司诞生于2008年8月，公司聚合了多名从事农业科技的专业人士——其中有获得国务院政府津贴的农业专家龚海东老师；有专门从事农业技术推广的冯德美教授等。公司团队成员均有20年以上的项目经验,能够把握最本质的植保理念，结合互联网信息技术所带来的创新思维，致力于农作物和土壤的健康。\r\n   我们为种植者提供免费的专业的植保技术服务；提供免费的农产品购销平台；提供优质价廉的农化产品。   爱华农业开发有限公司已服务于除台湾地区以外的中国大陆3000余家种植专业合作社、基地、农场，并', '简丹', '2017-11-07 10:34:37', '&lt;p&gt;&lt;embed type=&quot;application/x-shockwave-flash&quot; class=&quot;edui-faked-video&quot; pluginspage=&quot;http://www.macromedia.com/go/getflashplayer&quot; src=&quot;v.qq.com/x/page/m0375yiq6jg.html&quot; width=&quot;420&quot; height=&quot;280&quot; style=&quot;float: left&quot; wmode=&quot;transparent&quot; play=&quot;true&quot; loop=&quot;false&quot; menu=&quot;false&quot; allowscriptaccess=&quot;never&quot; allowfullscreen=&quot;true&quot;/&gt;&lt;/p&gt;');

-- ----------------------------
-- Table structure for `sl_wenti`
-- ----------------------------
DROP TABLE IF EXISTS `sl_wenti`;
CREATE TABLE `sl_wenti` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `zutu` varchar(250) DEFAULT NULL COMMENT '组图',
  `neirong` varchar(250) DEFAULT NULL COMMENT '内容',
  `yonghuming` char(100) DEFAULT NULL COMMENT '用户名',
  `zan` smallint(100) DEFAULT '0' COMMENT '赞',
  `leibie` char(100) DEFAULT NULL COMMENT '类别',
  `leixing` varchar(250) DEFAULT '普通帖\r\n精品帖' COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='sl_wenti模型主表';

-- ----------------------------
-- Records of sl_wenti
-- ----------------------------
INSERT INTO `sl_wenti` VALUES ('40', '2017-11-27 13:55:09', 'public/app/uploads/fromApp151176210934.jpeg{title}', '你好', '18782140263', '0', '葡萄', '普通帖');
INSERT INTO `sl_wenti` VALUES ('41', '2017-11-27 14:00:41', 'public/app/uploads/fromApp151176244117.jpeg{title}', '你好', '18782140263', '0', '草莓', '普通帖');
INSERT INTO `sl_wenti` VALUES ('42', '2017-11-27 14:02:09', null, '你好', '18782140263', '0', '枣子', '普通帖');
INSERT INTO `sl_wenti` VALUES ('43', '2017-11-27 14:02:43', 'public/app/uploads/fromApp151176256379.jpeg{title}', '你好', '18782140263', '0', '番茄', '精品帖');
INSERT INTO `sl_wenti` VALUES ('44', '2017-11-29 12:07:18', null, '葡萄怎么增甜', '15386501342', '0', '葡萄', '普通帖');
INSERT INTO `sl_wenti` VALUES ('45', '2017-11-29 12:35:46', null, '草莓白粉病', '18981365082', '0', '草莓', '普通帖');
INSERT INTO `sl_wenti` VALUES ('46', '2017-11-29 12:36:29', 'public/app/uploads/fromApp15119301897.jpeg{title}', '草莓幼果期管理', '18981365082', '0', '草莓', '普通帖');
INSERT INTO `sl_wenti` VALUES ('47', '2017-11-30 09:54:10', null, '草莓', '18981365082', '0', '葡萄', '普通帖');
INSERT INTO `sl_wenti` VALUES ('48', '2017-11-30 13:40:31', 'public/app/uploads/fromApp151202043039.jpeg{title}', '无筋豆红蜘蛛', 'undefined', '0', '其它', '普通帖\r\n精品帖');
INSERT INTO `sl_wenti` VALUES ('49', '2017-12-09 17:09:24', 'public/app/uploads/fromApp151281056482.jpeg{title}', '手机具体', '18782140261', '0', '葡萄', '普通帖');
INSERT INTO `sl_wenti` VALUES ('50', '2017-12-09 17:11:59', null, '天冷了兔兔', '18782140261', '0', '葡萄', '普通帖');
INSERT INTO `sl_wenti` VALUES ('51', '2017-12-24 09:41:37', 'public/app/uploads/fromApp151407969791.jpeg{title}', '如何解决', '18990607768', '0', '草莓', '普通帖');
INSERT INTO `sl_wenti` VALUES ('52', '2017-12-24 14:05:11', null, '草莓烂果', '18981365082', '0', '草莓', '普通帖');
INSERT INTO `sl_wenti` VALUES ('53', '2017-12-25 15:38:12', null, '你好', '18782140263', '0', '葡萄', '普通帖');
INSERT INTO `sl_wenti` VALUES ('54', '2017-12-25 15:45:38', null, '你好', '18782140263', '0', '葡萄', '普通帖');
INSERT INTO `sl_wenti` VALUES ('55', '2017-12-25 15:46:20', null, '你好', '18782140263', '0', '葡萄', '普通帖');
INSERT INTO `sl_wenti` VALUES ('56', '2017-12-25 15:46:45', null, '你好', '18782140263', '0', '葡萄', '普通帖');
INSERT INTO `sl_wenti` VALUES ('57', '2017-12-25 15:46:50', null, '你好', '18782140263', '0', '葡萄', '普通帖');
INSERT INTO `sl_wenti` VALUES ('58', '2017-12-25 15:47:35', null, '你好', '18782140263', '0', '葡萄', '普通帖');
INSERT INTO `sl_wenti` VALUES ('59', '2017-12-25 15:48:04', null, '你好', '18782140263', '0', '葡萄', '普通帖');
INSERT INTO `sl_wenti` VALUES ('60', '2017-12-25 15:54:29', null, '你好', '18782140263', '0', '葡萄', '普通帖');

-- ----------------------------
-- Table structure for `sl_zhuanjia`
-- ----------------------------
DROP TABLE IF EXISTS `sl_zhuanjia`;
CREATE TABLE `sl_zhuanjia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `xingming` char(100) DEFAULT NULL COMMENT '姓名',
  `touxiang` varchar(250) DEFAULT NULL COMMENT '头像',
  `xingyelingyu` char(100) DEFAULT NULL COMMENT '行业领域',
  `zhicheng` char(100) DEFAULT NULL COMMENT '职称',
  `zhuanjiajingyan` char(100) DEFAULT NULL COMMENT '专家经验',
  `shanchangzhenduan` varchar(250) DEFAULT NULL COMMENT '擅长诊断',
  `suozaidiqu` varchar(250) DEFAULT NULL COMMENT '所在地区',
  `gerenjianjie` varchar(250) DEFAULT NULL COMMENT '个人简介',
  `huojiangrongyu` mediumtext COMMENT '获奖荣誉',
  `paixu` char(100) DEFAULT NULL COMMENT '排序',
  `bianhao` char(100) DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='sl_zhuanjia模型主表';

-- ----------------------------
-- Records of sl_zhuanjia
-- ----------------------------
INSERT INTO `sl_zhuanjia` VALUES ('1', '2017-11-04 16:13:19', '姓名	', 'public/uploads/20171104/2017110416131959fd769f7bfa4.jpg', '行业领域	行业领域	行业领域	', '职职', '专家经验', '擅长诊断', '所在地区	', '设计、程序、域名、空间一条龙服务，提供基于WEB的系统开发. 服务项目涵盖了网页设计、网站程序开发、主流域名注册、国内外空间申请、WEB系统开发、微信二次开发、手机网站开发等网站方面', '&lt;table class=&quot;tablesty&quot; width=&quot;755&quot;&gt;&lt;tbody style=&quot;font-size: 14px; margin: 0px; padding: 0px;&quot;&gt;&lt;tr style=&quot;font-size: 14px; margin: 0px; padding: 0px;&quot; class=&quot;firstRow&quot;&gt;&lt;td class=&quot;td_1&quot; style=&quot;font-size: 14px; margin: 0px; padding-top: 7px; padding-right: 0px; padding-bottom: 7px;&quot; width=&quot;330&quot;&gt;世界500强企业第86位&lt;/td&gt;&lt;td class=&quot;td_2&quot; style=&quot;font-size: 14px; margin: 0px; padding: 7px 0px 7px 30px;&quot; width=&quot;220&quot;&gt;华润集团&lt;/td&gt;&lt;td class=&quot;td_3&quot; style=&quot;font-size: 14px; margin: 0px; padding-top: 7px; padding-right: 0px; padding-bottom: 7px;&quot; width=&quot;220&quot;&gt;《财富》杂志&lt;/td&gt;&lt;/tr&gt;&lt;tr class=&quot;trbg&quot; style=&quot;font-size: 14px; margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;td class=&quot;td_1&quot; style=&quot;font-size: 14px; margin: 0px; padding-top: 7px; padding-right: 0px; padding-bottom: 7px;&quot; width=&quot;330&quot;&gt;业绩优秀企业&lt;/td&gt;&lt;td class=&quot;td_2&quot; style=&quot;font-size: 14px; margin: 0px; padding: 7px 0px 7px 30px;&quot; width=&quot;220&quot;&gt;华润集团&lt;/td&gt;&lt;td class=&quot;td_3&quot; style=&quot;font-size: 14px; margin: 0px; padding-top: 7px; padding-right: 0px; padding-bottom: 7px;&quot; width=&quot;220&quot;&gt;国务院国资委&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;font-size: 14px; margin: 0px; padding: 0px;&quot;&gt;&lt;td class=&quot;td_1&quot; style=&quot;font-size: 14px; margin: 0px; padding-top: 7px; padding-right: 0px; padding-bottom: 7px;&quot; width=&quot;330&quot;&gt;中央企业法制工作年度考评A级&lt;/td&gt;&lt;td class=&quot;td_2&quot; style=&quot;font-size: 14px; margin: 0px; padding: 7px 0px 7px 30px;&quot; width=&quot;220&quot;&gt;华润集团&lt;/td&gt;&lt;td class=&quot;td_3&quot; style=&quot;font-size: 14px; margin: 0px; padding-top: 7px; padding-right: 0px; padding-bottom: 7px;&quot; width=&quot;220&quot;&gt;国务院国资委&lt;/td&gt;&lt;/tr&gt;&lt;tr class=&quot;trbg&quot; style=&quot;font-size: 14px; margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;td class=&quot;td_1&quot; style=&quot;font-size: 14px; margin: 0px; padding-top: 7px; padding-right: 0px; padding-bottom: 7px;&quot; width=&quot;330&quot;&gt;中国社会责任卓越企业&lt;/td&gt;&lt;td class=&quot;td_2&quot; style=&quot;font-size: 14px; margin: 0px; padding: 7px 0px 7px 30px;&quot; width=&quot;220&quot;&gt;华润集团&lt;/td&gt;&lt;td class=&quot;td_3&quot; style=&quot;font-size: 14px; margin: 0px; padding-top: 7px; padding-right: 0px; padding-bottom: 7px;&quot; width=&quot;220&quot;&gt;中国社科院&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;font-size: 14px; margin: 0px; padding: 0px;&quot;&gt;&lt;td class=&quot;td_1&quot; style=&quot;font-size: 14px; margin: 0px; padding-top: 7px; padding-right: 0px; padding-bottom: 7px;&quot; width=&quot;330&quot;&gt;五星级社会责任报告&lt;/td&gt;&lt;td class=&quot;td_2&quot; style=&quot;font-size: 14px; margin: 0px; padding: 7px 0px 7px 30px;&quot; width=&quot;220&quot;&gt;华润集团&lt;/td&gt;&lt;td class=&quot;td_3&quot; style=&quot;font-size: 14px; margin: 0px; padding-top: 7px; padding-right: 0px; padding-bottom: 7px;&quot; width=&quot;220&quot;&gt;中国社科院中国企业社会责任报告峰会&lt;/td&gt;&lt;/tr&gt;&lt;tr class=&quot;trbg&quot; style=&quot;font-size: 14px; margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;td class=&quot;td_1&quot; style=&quot;font-size: 14px; margin: 0px; padding-top: 7px; padding-right: 0px; padding-bottom: 7px;&quot; width=&quot;330&quot;&gt;社会责任报告领袖奖&lt;/td&gt;&lt;td class=&quot;td_2&quot; style=&quot;font-size: 14px; margin: 0px; padding: 7px 0px 7px 30px;&quot; width=&quot;220&quot;&gt;华润集团&lt;/td&gt;&lt;td class=&quot;td_3&quot; style=&quot;font-size: 14px; margin: 0px; padding-top: 7px; padding-right: 0px; padding-bottom: 7px;&quot; width=&quot;220&quot;&gt;金蜜蜂2016优秀企业社会责任报告排行榜&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', null, null);
INSERT INTO `sl_zhuanjia` VALUES ('5', '2017-11-04 16:13:19', '张凤琼', 'public/uploads/20171110/201711101004525a050944cfe6a.jpg', '植保', '中教三级', '专家经验：20年相关从业经验积累，为', '擅长诊断:农作物病虫害综合', '所在地区	四川省乐山市', '乐山师范学院毕业。1998年起，从事农业基础技术服务。', '&lt;h5 class=&quot;ft_16&quot; style=&quot;white-space: normal; box-sizing: border-box; margin: 10px 0px; padding: 0px; list-style: none; border: none; font-family: &amp;#39;microsoft yahei&amp;#39;; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); font-size: 1.33em; background-color: rgb(255, 255, 255);&quot;&gt;优势：扎实的农业技术实践和服务，积累了丰富的植保经验。&lt;/h5&gt;&lt;p class=&quot;pad_10_0&quot; style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; box-sizing: border-box; padding: 10px 0px; list-style: none; border: none; color: rgb(119, 119, 119); font-family: &amp;#39;microsoft yahei&amp;#39;; font-size: 12px; line-height: 21.600000381469727px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;h5 class=&quot;ft_16&quot; style=&quot;white-space: normal; box-sizing: border-box; margin: 10px 0px; padding: 0px; list-style: none; border: none; font-family: &amp;#39;microsoft yahei&amp;#39;; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); font-size: 1.33em; background-color: rgb(255, 255, 255);&quot;&gt;理念：&lt;/h5&gt;&lt;p class=&quot;pad_10_0&quot; style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; box-sizing: border-box; padding: 10px 0px; list-style: none; border: none; color: rgb(119, 119, 119); font-family: &amp;#39;microsoft yahei&amp;#39;; font-size: 12px; line-height: 21.600000381469727px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p class=&quot;pad_10_0&quot; style=&quot;margin-top: 0px; margin-bottom: 10px; white-space: normal; box-sizing: border-box; padding: 10px 0px; list-style: none; border: none; color: rgb(119, 119, 119); font-family: &amp;#39;microsoft yahei&amp;#39;; font-size: 12px; line-height: 21.600000381469727px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', null, '001');
INSERT INTO `sl_zhuanjia` VALUES ('6', '2017-11-04 16:13:19', '龚海东', 'public/uploads/20171107/201711070916545a0109869a7ec.jpg', '植物保护	', '高级工程师', '从事农业种植技术工作40余年。', '大田作物、经济作物', '所在地区	', '成都思乐科技有限公司诞生于2010年，公司聚集了多名从事界面设计和交互设计的 ', '&lt;h5 class=&quot;ft_16&quot; style=&quot;box-sizing: border-box; margin: 10px 0px; padding: 0px; list-style: none; border: none; font-family: &amp;#39;microsoft yahei&amp;#39;; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); font-size: 1.33em; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;优势&lt;/h5&gt;&lt;p class=&quot;pad_10_0&quot; style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 10px 0px; list-style: none; border: none; color: rgb(119, 119, 119); font-family: &amp;#39;microsoft yahei&amp;#39;; font-size: 12px; line-height: 21.600000381469727px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;提供全方位网站建立+数字化营销服务，2010年至今已经服务1000余家客户。 我们可以完成优质网站建设的同时，更可为您提供增值的数字化营销服务。思乐科技对客户和作品永远坚持宁缺毋滥的原则, 没有把网站纳入到企业战略高度的客户我们拒绝承接！&lt;/p&gt;&lt;h5 class=&quot;ft_16&quot; style=&quot;box-sizing: border-box; margin: 10px 0px; padding: 0px; list-style: none; border: none; font-family: &amp;#39;microsoft yahei&amp;#39;; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); font-size: 1.33em; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;理念&lt;/h5&gt;&lt;p class=&quot;pad_10_0&quot; style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 10px 0px; list-style: none; border: none; color: rgb(119, 119, 119); font-family: &amp;#39;microsoft yahei&amp;#39;; font-size: 12px; line-height: 21.600000381469727px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;我们致力于用户体验的持续提升，以用户为中心，力求视觉设计与交互设计的完美契合。并且我们以科学规范的流程，勤奋专注的态度，为客户提供全方位的设计服务。专注UI设计，以设计驱动企业价值的持续增长，实现您的商业目标！&lt;/p&gt;&lt;h5 class=&quot;ft_16&quot; style=&quot;box-sizing: border-box; margin: 10px 0px; padding: 0px; list-style: none; border: none; font-family: &amp;#39;microsoft yahei&amp;#39;; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); font-size: 1.33em; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;团队&lt;/h5&gt;&lt;p class=&quot;pad_10_0&quot; style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 10px 0px; list-style: none; border: none; color: rgb(119, 119, 119); font-family: &amp;#39;microsoft yahei&amp;#39;; font-size: 12px; line-height: 21.600000381469727px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;我们的团队成员由资深设计师、资深前端工程师及技术负责人、开发工程师等组成。团队成员均有在大型互联网工作经验。我们是追求品质与力求不断超越自己的团队，我们尊重每次合作的机会与挑战，力求完美。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', null, '001');

-- ----------------------------
-- Table structure for `sl_zidonghuida`
-- ----------------------------
DROP TABLE IF EXISTS `sl_zidonghuida`;
CREATE TABLE `sl_zidonghuida` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `wenti` varchar(250) DEFAULT NULL COMMENT '问题',
  `daan` mediumtext COMMENT '答案',
  `zhuanjia` char(100) DEFAULT ' sql{sl_zhuanjia|where 1=1|order by id desc|id,xingming}' COMMENT '专家',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='sl_zidonghuida模型主表';

-- ----------------------------
-- Records of sl_zidonghuida
-- ----------------------------
INSERT INTO `sl_zidonghuida` VALUES ('1', '2017-11-27 13:22:11', '你好', '&lt;p&gt;你好，我们是爱华，有什么可以帮到您？&lt;/p&gt;', '6');
INSERT INTO `sl_zidonghuida` VALUES ('2', '2017-11-27 14:00:10', '你好', '&lt;p&gt;&lt;img src=&quot;application/views/admin/upload/ueditor/images/20171127/1511762406116220.png&quot; title=&quot;1511762406116220.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;application/views/admin/upload/ueditor/images/20171127/1511762407121293.png&quot; title=&quot;1511762407121293.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '5');
INSERT INTO `sl_zidonghuida` VALUES ('3', '2017-12-25 15:52:57', '你好', '&lt;p&gt;阿斯顿发生大法上的&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/application/views/admin/upload/ueditor/images/20171127/1511762407121293.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/application/views/admin/upload/ueditor/images/20171127/1511762406116220.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/application/views/admin/upload/ueditor/images/20161112/1478954866672672.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/application/views/admin/upload/ueditor/images/20161112/1478954170767730.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/application/views/admin/upload/ueditor/images/20161112/1478954170542329.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/application/views/admin/upload/ueditor/images/20161112/1478954170376872.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/application/views/admin/upload/ueditor/images/20161112/1478954170293476.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '6');
