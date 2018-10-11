/*
Navicat MySQL Data Transfer

Source Server         : lyq
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : secondhandmarket

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-05-12 16:47:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) DEFAULT NULL COMMENT '账号',
  `phone` bigint(25) NOT NULL,
  `password` varchar(25) NOT NULL COMMENT '密码',
  `userRole` varchar(25) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '靓仔', '123456', '123456', '超级管理员');

-- ----------------------------
-- Table structure for `catelog`
-- ----------------------------
DROP TABLE IF EXISTS `catelog`;
CREATE TABLE `catelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) DEFAULT NULL COMMENT '分类名',
  `number` int(11) DEFAULT '0' COMMENT '该分类下的商品数量',
  `status` tinyint(10) DEFAULT '0' COMMENT '分类状态，0正常，1暂用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catelog
-- ----------------------------
INSERT INTO `catelog` VALUES ('1', '闲置数码', '12', '1');
INSERT INTO `catelog` VALUES ('2', '校园代步', '3', '1');
INSERT INTO `catelog` VALUES ('3', '电器日用', '5', '1');
INSERT INTO `catelog` VALUES ('4', '图书教材', '4', '1');
INSERT INTO `catelog` VALUES ('5', '美妆衣物', '6', '1');
INSERT INTO `catelog` VALUES ('6', '运动棋牌', '4', '1');
INSERT INTO `catelog` VALUES ('7', '票券小物', '4', '1');

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品，外键',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `create_at` varchar(250) DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('120', '8', '97', '厉害厉害~', '2018-04-17 04:36:10');
INSERT INTO `comments` VALUES ('121', '3', '77', '1212', '2018-04-18 12:02:27');
INSERT INTO `comments` VALUES ('122', '6', '90', '111', '2018-04-20 11:37:45');
INSERT INTO `comments` VALUES ('123', '23', '102', '453543', '2018-04-23 06:00:53');
INSERT INTO `comments` VALUES ('124', '23', '102', '666', '2018-04-23 06:00:57');
INSERT INTO `comments` VALUES ('125', '26', '87', '好像不错哦', '2018-05-10 05:50:11');
INSERT INTO `comments` VALUES ('126', '27', '109', '这个怎么样呀', '2018-05-10 06:07:03');
INSERT INTO `comments` VALUES ('127', '27', '109', '应该还可以吧？', '2018-05-10 06:07:12');
INSERT INTO `comments` VALUES ('128', '27', '110', '自行车', '2018-05-11 09:49:11');
INSERT INTO `comments` VALUES ('129', '26', '20', '二手笔记本', '2018-05-11 10:02:59');
INSERT INTO `comments` VALUES ('130', '26', '20', '测试003', '2018-05-11 10:03:13');

-- ----------------------------
-- Table structure for `focus`
-- ----------------------------
DROP TABLE IF EXISTS `focus`;
CREATE TABLE `focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT '外键 商品id',
  `user_id` int(11) DEFAULT NULL COMMENT '外键 用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of focus
-- ----------------------------
INSERT INTO `focus` VALUES ('8', '90', '9');
INSERT INTO `focus` VALUES ('9', '102', '23');
INSERT INTO `focus` VALUES ('16', '100', '3');
INSERT INTO `focus` VALUES ('18', '87', '26');
INSERT INTO `focus` VALUES ('19', '109', '27');
INSERT INTO `focus` VALUES ('25', '12', '27');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品主键',
  `catelog_id` int(11) DEFAULT NULL COMMENT '商品分类，外键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户外键',
  `name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `price` float(11,2) DEFAULT NULL COMMENT '出售价格',
  `real_price` float(11,2) DEFAULT NULL COMMENT '真实价格',
  `start_time` varchar(25) DEFAULT NULL COMMENT '发布时间',
  `polish_time` varchar(30) DEFAULT NULL COMMENT '擦亮时间，按该时间进行查询，精确到时分秒',
  `end_time` varchar(25) DEFAULT NULL COMMENT '下架时间',
  `describle` text COMMENT '详细信息',
  `status` int(11) DEFAULT '1' COMMENT '状态 上架1 下架0',
  PRIMARY KEY (`id`),
  KEY `catelog_id` (`catelog_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '6', '1', '精美吉他', '130.00', '160.00', '2017-05-13', '2017-05-13', '2017-05-23', '自用二手吉他，9成新，低价出售，有意者联系。', '1');
INSERT INTO `goods` VALUES ('2', '2', '1', '山地车', '1520.00', '890.00', '2017-05-13', '2017-05-13', '2017-05-23', '八成新山地车，无损坏，喜欢Call我。', '1');
INSERT INTO `goods` VALUES ('3', '3', '1', '无线鼠标', '23.00', '48.00', '2017-05-13', '2017-05-13', '2017-05-23', '罗技无线鼠标，自用一个月，9成新，手感好，反应灵敏。', '1');
INSERT INTO `goods` VALUES ('5', '1', '2', '数码相机', '580.00', '1350.00', '2017-05-14', '2017-05-14', '2017-05-24', '自用的数码相机，一年前购买，非常爱好，无磕碰。可议价。', '1');
INSERT INTO `goods` VALUES ('6', '1', '2', '笔记本电脑', '690.00', '2300.00', '2017-05-14', '2017-05-14', '2017-05-24', '7成新14寸笔记本电脑，商务本，适合办公，2G内存。', '1');
INSERT INTO `goods` VALUES ('7', '3', '2', '收纳盒', '15.00', '36.00', '2017-05-14', '2017-05-14', '2017-05-24', '3层塑料物品收纳盒，毕业了，低价出售。', '0');
INSERT INTO `goods` VALUES ('8', '3', '1', '台灯', '32.00', '58.00', '2017-05-14', '2017-05-14', '2017-05-24', '考研时购买的台灯，可插USB接口。', '1');
INSERT INTO `goods` VALUES ('9', '5', '2', '女鞋', '35.00', '86.00', '2017-05-14', '2017-05-14', '2017-05-24', '学生女鞋', '1');
INSERT INTO `goods` VALUES ('11', '1', '3', '无线传呼机', '230.00', '370.00', '2017-05-14', '2018-04-14', '2017-05-24', '一对无线传呼机，带有充电器，可以传呼2公里。', '1');
INSERT INTO `goods` VALUES ('12', '1', '3', '手提女包', '36.00', '89.00', '2017-05-14', '2018-04-27', '2018-05-07', '手提女包，自用了几天。', '1');
INSERT INTO `goods` VALUES ('13', '5', '1', '手提包', '15.00', '23.00', '2017-05-14', '2017-05-14', '2017-05-24', '自用手提包，8成新，便宜出。', '1');
INSERT INTO `goods` VALUES ('16', '6', '2', '耐克运动书包', '56.00', '198.00', '2017-05-14', '2017-05-14', '2017-05-24', '去年年底购买的耐克书包，8成新，无损坏，可以装电脑，很漂亮，有意者联系。', '1');
INSERT INTO `goods` VALUES ('17', '4', '2', '二手小说', '10.00', '65.00', '2017-05-14', '2017-05-14', '2017-05-24', '毕业季，一书架小说，便宜出售。', '1');
INSERT INTO `goods` VALUES ('18', '4', '2', '公务员考试资料', '35.00', '79.00', '2017-05-14', '2017-05-14', '2017-05-24', '刚刚考完公务员的复习资料。淘宝购买，低价出售。', '1');
INSERT INTO `goods` VALUES ('20', '1', '4', 'Thinkpad笔记本', '1600.00', '2300.00', '2017-05-14', '2018-04-24', '2018-05-04', '京东购买的Thinkpad笔记本电脑，九成新。', '1');
INSERT INTO `goods` VALUES ('77', '1', '3', '2', '1.00', '11.00', '2018-04-15', '2018-04-10', '2018-04-18', '111111111', '1');
INSERT INTO `goods` VALUES ('78', '1', '3', '大学生用计算器。', '10.00', '15.00', '2018-04-14', '2018-04-14', '2018-04-24', '用一两次过，但没怎么用过。基本全新的', '0');
INSERT INTO `goods` VALUES ('79', '1', '3', '出HTC M9ET 3+32G', '1500.00', '2888.00', '2018-04-14', '2018-04-14', '2018-04-24', '自用，自认为九成新，除了边角磕碰，其他都好，无暗病', '1');
INSERT INTO `goods` VALUES ('80', '1', '4', '二手苹果iphone6 6s', '2488.00', '4888.00', '2018-04-14', '2018-04-14', '2018-04-24', '无锁 支持三网4G 成色9-99新 优先下单优先挑选靓成色发货 主板无限 无暗病 功能全部正常 诚信经营 以上均64G 需其他机型联系我', '1');
INSERT INTO `goods` VALUES ('81', '2', '4', '168元出售全新自行车', '168.00', '899.00', '2018-04-14', '2018-04-24', '2018-05-04', '要毕业了，低价出手吧 要得给我打电话', '1');
INSERT INTO `goods` VALUES ('82', '2', '5', '二手 电动车', '1700.00', '2580.00', '2018-04-14', '2018-04-14', '2018-04-24', '羽铃电动车，购于2017年9月，个人原因想出，原价2850，现在二手出1700可刀，证牌齐全自用车，左后方车轮防护板断裂(如图)，车前头购买的时候就有划痕因为不影响使用就没叫老板换新的，一切破损不影响使用。', '0');
INSERT INTO `goods` VALUES ('83', '2', '6', '全新山地车特价：现价380元，原价498元，21速碟刹加厚铝合金轮子', '398.00', '498.00', '2018-04-14', '2018-04-14', '2018-04-24', '自身原因起不了。全新山地车特价：现价380元，原价498元，21速碟刹加厚铝合金轮子', '1');
INSERT INTO `goods` VALUES ('84', '3', '7', '毕业离校，低价出售空调，', '800.00', '1846.00', '2018-04-14', '2018-04-14', '2018-04-24', '13年购入的长虹空调，加了2米铜管，1匹冷暖型', '1');
INSERT INTO `goods` VALUES ('85', '1', '7', '头发剪了，出手吹风机', '15.00', '35.00', '2018-04-14', '2018-04-14', '2018-04-24', '头发剪短了，现在不需要了，低价出售', '1');
INSERT INTO `goods` VALUES ('86', '7', '7', '单板吉他', '688.00', '1200.00', '2018-04-14', '2018-04-14', '2018-04-24', '单板原价1200，买了两年了，弹过一个多月就搁置，毕业季出了。赠书三月通（30），赠一套弦（30）.', '1');
INSERT INTO `goods` VALUES ('87', '1', '8', '20出手辉柏嘉48色水溶性彩色铅笔一套', '20.00', '188.00', '2018-04-14', '2018-05-02', '2018-05-03', '德国进口彩铅辉柏嘉，48色淘宝在60左右，我的买过来画了几张画就闲置了，彩票效果相当好，黑色用得比较快还剩一半多了', '1');
INSERT INTO `goods` VALUES ('88', '6', '9', '九成新仰卧板 便宜出售', '50.00', '150.00', '2018-04-14', '2018-04-14', '2018-04-24', '没用多少次 带不走便宜卖了', '1');
INSERT INTO `goods` VALUES ('89', '4', '9', '艺乐杨幂刊', '20.00', '68.00', '2018-04-14', '2018-04-14', '2018-04-24', '艺乐杂志 杨幂专刊 走进偶像 了解偶像背后的故事', '1');
INSERT INTO `goods` VALUES ('90', '1', '10', '傲慢与偏见', '28.00', '58.00', '2018-04-14', '2018-04-18', '2018-04-24', '傲慢与偏见 百词斩阅读计划，全英文小说，词汇量2401-3200 正版全新 用百词斩软件扫描书内二维码可获取书籍配套全英文音频以及书籍配套词汇', '1');
INSERT INTO `goods` VALUES ('91', '4', '10', '刘语熙《我遇见我》', '25.00', '55.00', '2018-04-14', '2018-04-14', '2018-04-24', '“乌贼刘”刘语熙自传我遇见我 讲述追梦历程', '1');
INSERT INTO `goods` VALUES ('92', '5', '10', '灰色短袖', '12.00', '30.00', '2018-04-14', '2018-04-14', '2018-04-24', '刚买的，全新 全新 全新', '1');
INSERT INTO `goods` VALUES ('93', '5', '10', '帽子', '10.00', '25.00', '2018-04-14', '2018-04-14', '2018-04-24', '买戴过', '1');
INSERT INTO `goods` VALUES ('94', '3', '1', '烧水壶', '22.00', '50.00', '2018-04-14', '2018-04-14', '2018-04-24', '烧水壶功能一切都好，请放心使用', '1');
INSERT INTO `goods` VALUES ('95', '3', '1', '桌面吸尘器', '28.00', '59.00', '2018-04-14', '2018-04-14', '2018-04-24', '桌面吸尘器，可以清洁键盘、吸纸屑、头发、灰尘，有蓝色和白色两款', '1');
INSERT INTO `goods` VALUES ('96', '7', '3', '纯手工绘画，来图定制，提供绘画过程图，追女友神器', '108.00', null, '2018-04-14', '2018-04-14', '2018-04-24', '纯手工绘画，来图定制，提供绘画过程，实木相框装裱，A4大小与12寸，64801606', '1');
INSERT INTO `goods` VALUES ('97', '1', '11', '笔记本电脑 用了一年', '1220.00', '1322.00', '2018-04-16', '2018-04-16', '2018-04-26', '还很新的电脑', '1');
INSERT INTO `goods` VALUES ('98', '5', '13', '韩国the saem得鲜口红', '49.90', '97.00', '2018-04-17', '2018-04-17', '2018-04-27', '口红不脱色咬唇妆哑光豆沙色唇膏大红姨妈色雾面', '1');
INSERT INTO `goods` VALUES ('99', '5', '13', '雅漾喷雾300ml', '38.00', '79.00', '2018-04-17', '2018-04-17', '2018-04-27', '雅漾喷雾300ml正品定妆香港爽肤水大舒护活泉水清爽保湿补水avene', '1');
INSERT INTO `goods` VALUES ('100', '7', '10', '纯种哈士奇犬 蓝眼三火哈士奇幼犬 雪橇犬哈士奇活体宠物狗', '888.00', '1000.00', '2018-04-18', '2018-04-24', '018-05-04', '为阻止小主人被叫起床，拼命看住被子笑坏众网友！', '1');
INSERT INTO `goods` VALUES ('106', '1', '4', 'test001', '1.00', '2.00', '2018-04-24', '2018-04-24', '018-05-04', '1', '0');
INSERT INTO `goods` VALUES ('107', '1', '3', 'test002', '2.00', '2.00', '2018-04-24', '2018-04-27', '2018-05-07', '测试002', '1');
INSERT INTO `goods` VALUES ('108', '3', '9', 'test003', '456.00', '989.00', '2018-04-27', '2018-04-27', '2018-05-07', '测试', '1');
INSERT INTO `goods` VALUES ('109', '1', '26', '测试01', '120.00', '300.00', '2018-05-10', '2018-05-10', '', '九阳 K17-F65电热水壶自动断电保温烧水壶304不锈钢家用', '0');
INSERT INTO `goods` VALUES ('110', '1', '26', '测试03', '10.00', '12.00', '2018-05-11', null, null, '测试003', '1');

-- ----------------------------
-- Table structure for `image`
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片主键',
  `goods_id` int(11) NOT NULL COMMENT '商品外键',
  `img_url` text NOT NULL COMMENT '图片链接',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', '1', 'nopic1.png');
INSERT INTO `image` VALUES ('2', '2', 'nopic2.png');
INSERT INTO `image` VALUES ('3', '3', 'nopic3.png');
INSERT INTO `image` VALUES ('4', '4', 'nopic4.png');
INSERT INTO `image` VALUES ('5', '5', 'nopic5.png');
INSERT INTO `image` VALUES ('6', '6', 'nopic6.png');
INSERT INTO `image` VALUES ('7', '7', 'nopic7.png');
INSERT INTO `image` VALUES ('8', '8', 'nopic8.png');
INSERT INTO `image` VALUES ('9', '9', 'nopic9.png');
INSERT INTO `image` VALUES ('11', '11', 'nopic11.png');
INSERT INTO `image` VALUES ('12', '12', 'nopic12.png');
INSERT INTO `image` VALUES ('13', '13', 'nopic13.png');
INSERT INTO `image` VALUES ('16', '16', 'nopic16.png');
INSERT INTO `image` VALUES ('17', '17', 'nopic17.png');
INSERT INTO `image` VALUES ('18', '18', 'nopic18.png');
INSERT INTO `image` VALUES ('20', '20', 'nopic20.png');
INSERT INTO `image` VALUES ('21', '77', '4f320b75-427a-484e-b725-a2f5d066af6f.jpg');
INSERT INTO `image` VALUES ('78', '78', '599629aa-9440-435c-8185-42e34a862470.jpg');
INSERT INTO `image` VALUES ('79', '79', '266abea1-a202-47f2-b5c4-095e96c10473.jpg');
INSERT INTO `image` VALUES ('80', '80', '4d472617-d430-4540-a510-f7606861dde0.jpg');
INSERT INTO `image` VALUES ('81', '81', 'e62acc43-8122-421a-940b-a68e6aeadd30.jpg');
INSERT INTO `image` VALUES ('82', '82', '67a5f2ee-a09a-488d-9e7a-87ac6d8ab9c4.jpg');
INSERT INTO `image` VALUES ('83', '83', '110456d4-cc20-4fe2-b0a6-217b023d7dd6.jpg');
INSERT INTO `image` VALUES ('84', '84', '499afa59-53bc-4d23-99ef-5d0f9d60de69.jpg');
INSERT INTO `image` VALUES ('85', '85', '23f242e3-6dbf-4d46-a1b2-a620918908d9.jpg');
INSERT INTO `image` VALUES ('86', '86', 'ae1097a5-736d-4850-9552-b5901ad6d84b.jpg');
INSERT INTO `image` VALUES ('87', '87', '95daa308-8011-4e0c-b5bd-8cd151830c32.jpg');
INSERT INTO `image` VALUES ('88', '88', '5c212d57-d8a4-4cc0-8853-dba957fba3d5.jpg');
INSERT INTO `image` VALUES ('89', '89', 'ec5369f6-7c87-43db-98aa-112efa91c8c6.JPG');
INSERT INTO `image` VALUES ('90', '90', 'fd680315-9ac8-4268-803e-7da7b492e8b0.JPG');
INSERT INTO `image` VALUES ('91', '91', '455e9ee5-92a7-4c7c-aa94-55f4373a16ee.JPG');
INSERT INTO `image` VALUES ('92', '92', '33434fa2-8bf3-4fbc-b1d9-d1e67202e2f2.jpg');
INSERT INTO `image` VALUES ('93', '93', 'dc4f9591-bd1a-4eac-b1ea-be6412296fb6.png');
INSERT INTO `image` VALUES ('94', '94', '7eb89aaa-56c0-4283-893f-bd5718301d80.jpg');
INSERT INTO `image` VALUES ('95', '95', '6664b320-87d4-4d37-b14f-fc5dba41f529.PNG');
INSERT INTO `image` VALUES ('96', '96', '451c3aa2-529d-449d-b69f-b8771af1d806.jpg');
INSERT INTO `image` VALUES ('97', '97', 'ee6e735c-6479-40bb-b45f-69888c42862e.jpg');
INSERT INTO `image` VALUES ('98', '98', '2f92136b-af5b-45f4-902d-7bb1d0ad0809.png');
INSERT INTO `image` VALUES ('99', '99', '022fe88a-5328-4b42-8333-10b782d39373.png');
INSERT INTO `image` VALUES ('100', '100', 'a1f11b39-490b-42ef-a8e1-44285c4a80d4.png');
INSERT INTO `image` VALUES ('101', '101', '0f022547-b2cb-45fe-ab86-fb8b6d70adbc.jpg');
INSERT INTO `image` VALUES ('102', '102', 'c31b3316-3606-4909-9d17-2a25cf0359dc.jpg');
INSERT INTO `image` VALUES ('103', '103', 'dbe01788-3c65-44d9-806e-eaf264d31022.jpg');
INSERT INTO `image` VALUES ('104', '104', 'f5923a9f-1a03-4c92-bfe6-4e00e138829a.jpg');
INSERT INTO `image` VALUES ('105', '105', '8858e9fb-8d3f-4a1c-85e7-7175f5716b24.jpg');
INSERT INTO `image` VALUES ('106', '106', 'c44fe7b1-62b3-450f-9bed-3042a9c854c1.jpg');
INSERT INTO `image` VALUES ('107', '107', 'd8543c59-974e-4811-a8f9-6b0c8ec26882.jpg');
INSERT INTO `image` VALUES ('108', '108', 'fe6d1a48-fa3e-483b-b47e-bd0daab66d10.jpg');
INSERT INTO `image` VALUES ('109', '109', 'cebf819b-4da5-4e36-b157-5bb5c4b1bf21.jpg');
INSERT INTO `image` VALUES ('110', '110', '5db8712e-8864-4df4-a811-0b7f5772f279.jpg');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统信息主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `context` text COMMENT '信息内容',
  `create_at` varchar(25) DEFAULT NULL COMMENT '推送信息时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态，0未读，1已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '1', '啦啦啦', '2018-04-18 04:36:10', '0');
INSERT INTO `notice` VALUES ('2', '3', '发地方大幅度', '2018-04-17 04:36:10', '0');
INSERT INTO `notice` VALUES ('3', '11', '是该公司给', '2018-04-17 05:36:10', '0');
INSERT INTO `notice` VALUES ('4', '21', '光伏发电', '2018-04-20 10:49:55', '1');
INSERT INTO `notice` VALUES ('5', '12', '大师傅', '2018-04-20 10:50:17', '1');
INSERT INTO `notice` VALUES ('6', '2', '打开来', '2018-04-20 10:50:29', '0');
INSERT INTO `notice` VALUES ('7', '2', '2018-4-2045434', '2018-04-20 10:50:40', '0');
INSERT INTO `notice` VALUES ('8', '2', 'dafsjklfdalsj', '2018-04-20 10:50:54', '0');
INSERT INTO `notice` VALUES ('9', '3', '453', '2018-04-20 17:10:40', '0');
INSERT INTO `notice` VALUES ('10', '6', '453534354', '2018-04-20 17:52:31', '0');
INSERT INTO `notice` VALUES ('11', '6', '645654', '2018-04-20 18:02:24', '0');
INSERT INTO `notice` VALUES ('12', '8', '546456456', '2018-04-20 18:05:31', '0');
INSERT INTO `notice` VALUES ('13', '8', '啦啦啦啦', '2018-04-20 18:05:40', '0');
INSERT INTO `notice` VALUES ('14', '8', '可以了 交流吧 分页先不搞了', '2018-04-20 18:06:04', '0');
INSERT INTO `notice` VALUES ('15', '9', '88888888888888', '2018-04-23 15:52:20', '0');
INSERT INTO `notice` VALUES ('16', '9', '999999999', '2018-04-23 15:52:25', '0');
INSERT INTO `notice` VALUES ('17', '9', '稳的~', '2018-04-23 17:58:03', '0');
INSERT INTO `notice` VALUES ('63', '6', '回收冰箱电脑洗衣机~', '2018-05-02 11:21:26', '0');
INSERT INTO `notice` VALUES ('64', '27', '有没有卖二手自行车的？有的加我qq哈', '2018-05-10 18:47:54', '0');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单表id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `order_num` bigint(25) DEFAULT NULL COMMENT '订单编号',
  `order_price` float(11,0) DEFAULT NULL COMMENT '订单价格',
  `order_state` int(11) DEFAULT '1' COMMENT '订单状态 1待发货 2待收货 3已完成',
  `order_information` varchar(50) DEFAULT NULL,
  `order_date` varchar(50) DEFAULT NULL COMMENT '下单时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '11', '78', '85970353', '10', '1', '买买买', '2018-04-16 05:06:41');
INSERT INTO `orders` VALUES ('2', '5', '7', '30356746', '15', '3', '早点发货', '2018-04-23 09:09:00');
INSERT INTO `orders` VALUES ('6', '3', '106', '23536014', '1', '1', '645', '2018-04-24 10:51:31');
INSERT INTO `orders` VALUES ('7', '3', '106', '56480826', '1', '1', '34432', '2018-04-13 11:45:08');
INSERT INTO `orders` VALUES ('8', '27', '109', '59720848', '120', '3', '测试', '2018-05-10 06:09:05');
INSERT INTO `orders` VALUES ('9', '27', '110', '75590106', '10', '3', '测试003', '2018-05-11 09:49:48');

-- ----------------------------
-- Table structure for `purse`
-- ----------------------------
DROP TABLE IF EXISTS `purse`;
CREATE TABLE `purse` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '钱包id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `balance` float(11,0) unsigned zerofill DEFAULT '00000000000' COMMENT '总钱数',
  `recharge` float(11,0) DEFAULT NULL COMMENT '充值钱数',
  `withdrawals` float(11,0) DEFAULT NULL COMMENT '提现钱数',
  `state` int(11) DEFAULT NULL COMMENT '状态 0未审核   已审核（1不通过 2通过）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purse
-- ----------------------------
INSERT INTO `purse` VALUES ('1', '1', '00000000888', null, null, '2');
INSERT INTO `purse` VALUES ('2', '2', '00000001163', null, null, null);
INSERT INTO `purse` VALUES ('3', '3', '00000001796', '1000', null, '0');
INSERT INTO `purse` VALUES ('4', '4', '00000006857', null, null, null);
INSERT INTO `purse` VALUES ('5', '5', '00000005593', null, null, null);
INSERT INTO `purse` VALUES ('6', '11', '00000001005', null, null, null);
INSERT INTO `purse` VALUES ('7', '12', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('8', '13', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('9', '14', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('10', '15', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('11', '16', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('12', '17', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('13', '18', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('14', '19', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('15', '20', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('16', '21', '00000000000', '1000', null, '0');
INSERT INTO `purse` VALUES ('17', '22', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('18', '23', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('19', '24', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('20', '25', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('21', '26', '00000000130', null, null, null);
INSERT INTO `purse` VALUES ('22', '27', '00000000870', null, null, null);

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论回复主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `atuser_id` int(11) DEFAULT NULL,
  `commet_id` int(11) DEFAULT NULL COMMENT '评论，外键',
  `content` text COMMENT '回复内容',
  `create_at` varchar(25) DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` char(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '登录使用的手机号',
  `username` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `QQ` varchar(12) CHARACTER SET utf8 DEFAULT NULL COMMENT '即时通讯',
  `create_at` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建时间',
  `goods_num` int(11) DEFAULT '0' COMMENT '发布过的物品数量',
  `power` int(10) unsigned zerofill DEFAULT '0000000100' COMMENT '信用分，普通用户默认为100',
  `last_login` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '最近一次登陆时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '账号是否冻结，默认0未冻结',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '17862821996', 'lduldj', 'C4CA4238A0B923820DCC509A6F75849B', '421330323', '2017-05-09 02:15', '7', '0000000100', null, '1');
INSERT INTO `user` VALUES ('2', '15552201622', '策马奔腾hly', 'C4CA4238A0B923820DCC509A6F75849B', '782697347', '2017-05-15 12:29', '6', '0000000100', null, '1');
INSERT INTO `user` VALUES ('3', '15880330000', '靓仔', 'C4CA4238A0B923820DCC509A6F75849B', '546546546564', '2017-05-17 10:35', '2', '0000000100', null, '1');
INSERT INTO `user` VALUES ('4', '15880331111', 'user1', 'C4CA4238A0B923820DCC509A6F75849B', '554625458', '2018-02-14 17:35', '3', '0000000100', '', '1');
INSERT INTO `user` VALUES ('5', '15880332222', 'user2', 'C4CA4238A0B923820DCC509A6F75849B', '10564654', '2018-02-23 17:12', '0', '0000000100', null, '1');
INSERT INTO `user` VALUES ('6', '15880333333', 'user3', 'C4CA4238A0B923820DCC509A6F75849B', '356456456', '2018-02-14 17:35', '1', '0000000100', null, '1');
INSERT INTO `user` VALUES ('7', '15880334444', 'user4', 'C4CA4238A0B923820DCC509A6F75849B', '245534351', '2018-02-14 17:48', '3', '0000000100', null, '1');
INSERT INTO `user` VALUES ('8', '15880335555', 'user5', 'C4CA4238A0B923820DCC509A6F75849B', '3145654664', '2018-02-14 17:35', '1', '0000000100', null, '1');
INSERT INTO `user` VALUES ('9', '15880336666', 'user6', 'C4CA4238A0B923820DCC509A6F75849B', '554625458', '2018-02-23 17:12', '3', '0000000100', null, '1');
INSERT INTO `user` VALUES ('10', '15880337777', 'user7', 'C4CA4238A0B923820DCC509A6F75849B', '95785588', '2017-05-09 02:15', '5', '0000000100', null, '1');
INSERT INTO `user` VALUES ('11', '15859512853', 'parent', 'E10ADC3949BA59ABBE56E057F20F883E', '', '2018-04-16 17:01', '1', '0000000100', null, '1');
INSERT INTO `user` VALUES ('12', '15880338888', '15880338888', 'C4CA4238A0B923820DCC509A6F75849B', '2564645456', '2018-04-16 17:37', '0', '0000000100', null, '1');
INSERT INTO `user` VALUES ('13', '15880330001', '15880330001', 'C4CA4238A0B923820DCC509A6F75849B', null, '2018-04-17 14:41', '2', '0000000100', null, '1');
INSERT INTO `user` VALUES ('14', '15880330002', '15880330002', 'C4CA4238A0B923820DCC509A6F75849B', null, '2018-04-17 14:56', '0', '0000000100', null, '1');
INSERT INTO `user` VALUES ('15', '15880330003', 'fdas', 'D41D8CD98F00B204E9800998ECF8427E', null, '2018-04-19 11:16', '0', '0000000100', null, '1');
INSERT INTO `user` VALUES ('16', '12345654654', '1', 'C4CA4238A0B923820DCC509A6F75849B', null, '2018-04-19 12:01', '0', '0000000100', null, '1');
INSERT INTO `user` VALUES ('17', '15880335556', '66', '657DDF7370B0D5EFF54A335127A66282', null, '2018-04-19 12:06', '0', '0000000100', null, '1');
INSERT INTO `user` VALUES ('18', '15555555555', '58', '5B1B68A9ABF4D2CD155C81A9225FD158', null, '2018-04-19 12:07', '0', '0000000100', null, '1');
INSERT INTO `user` VALUES ('19', '15353535355', '1', 'C4CA4238A0B923820DCC509A6F75849B', null, '2018-04-19 13:09', '0', '0000000100', null, '1');
INSERT INTO `user` VALUES ('20', '15880330005', '123', 'C4CA4238A0B923820DCC509A6F75849B', '156454654', '2018-04-20 08:54', '0', '0000000100', null, '1');
INSERT INTO `user` VALUES ('21', '15880336667', '1545654', 'C4CA4238A0B923820DCC509A6F75849B', null, '2018-04-20 11:53', '0', '0000000100', null, '1');
INSERT INTO `user` VALUES ('22', '15880335558', '564645', 'C4CA4238A0B923820DCC509A6F75849B', null, '2018-04-23 14:19', '0', '0000000100', null, '1');
INSERT INTO `user` VALUES ('23', '15880332525', '546546546', 'C4CA4238A0B923820DCC509A6F75849B', null, '2018-04-23 17:59', '0', '0000000100', null, '1');
INSERT INTO `user` VALUES ('24', '11111111111', '我是啦啦啦啦啦', 'C4CA4238A0B923820DCC509A6F75849B', null, '2018-04-23 22:08', '0', '0000000100', null, '1');
INSERT INTO `user` VALUES ('25', '15880336668', '68', 'C4CA4238A0B923820DCC509A6F75849B', null, '2018-04-27 09:25', '0', '0000000100', null, '1');
INSERT INTO `user` VALUES ('26', '15880330101', '测试01', 'C4CA4238A0B923820DCC509A6F75849B', '', '2018-05-10 17:49', '0', '0000000100', null, '1');
INSERT INTO `user` VALUES ('27', '15880330202', '测试02', 'C4CA4238A0B923820DCC509A6F75849B', '5555465465', '2018-05-10 17:56', '0', '0000000100', null, '1');
