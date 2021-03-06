/*
 Navicat Premium Data Transfer

 Source Server         : localhost3306
 Source Server Type    : MySQL
 Source Server Version : 100411
 Source Host           : localhost:3306
 Source Schema         : o2o

 Target Server Type    : MySQL
 Target Server Version : 100411
 File Encoding         : 65001

 Date: 08/06/2021 20:26:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_area
-- ----------------------------
DROP TABLE IF EXISTS `tb_area`;
CREATE TABLE `tb_area`  (
  `area_id` int NOT NULL AUTO_INCREMENT,
  `area_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `area_desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int NOT NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`area_id`) USING BTREE,
  UNIQUE INDEX `UK_AREA`(`area_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_area
-- ----------------------------
INSERT INTO `tb_area` VALUES (3, '东苑', '东苑', 12, '2017-06-04 19:12:58', '2017-06-04 19:12:58');
INSERT INTO `tb_area` VALUES (4, '南苑', '南苑', 10, '2017-06-04 19:13:09', '2017-06-04 19:13:09');
INSERT INTO `tb_area` VALUES (5, '西苑', '西苑', 9, '2017-06-04 19:13:18', '2017-06-04 19:13:18');
INSERT INTO `tb_area` VALUES (6, '北苑', '北苑', 7, '2017-06-04 19:13:29', '2017-06-04 19:13:29');

-- ----------------------------
-- Table structure for tb_head_line
-- ----------------------------
DROP TABLE IF EXISTS `tb_head_line`;
CREATE TABLE `tb_head_line`  (
  `line_id` int NOT NULL AUTO_INCREMENT,
  `line_name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `line_link` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `line_img` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `priority` int NULL DEFAULT NULL,
  `enable_status` int NOT NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`line_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_head_line
-- ----------------------------
INSERT INTO `tb_head_line` VALUES (1, '1', '', '\\upload\\item\\headtitle\\2017061320315746624.jpg', 1, 1, '2021-06-07 20:51:55', '2021-06-07 20:51:59');
INSERT INTO `tb_head_line` VALUES (2, '2', '', '\\upload\\item\\headtitle\\2017061320371786788.jpg', 2, 1, '2021-06-07 20:52:37', '2021-06-07 20:52:39');
INSERT INTO `tb_head_line` VALUES (3, '3', '', '\\upload\\item\\headtitle\\2017061320393452772.jpg', 3, 1, '2021-06-07 20:53:59', '2021-06-07 20:54:01');
INSERT INTO `tb_head_line` VALUES (4, '4', '', '\\upload\\item\\headtitle\\2017061320400198256.jpg', 4, 1, '2021-06-07 20:54:13', '2021-06-07 20:54:17');

-- ----------------------------
-- Table structure for tb_local_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_local_auth`;
CREATE TABLE `tb_local_auth`  (
  `local_auth_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `username` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`local_auth_id`) USING BTREE,
  UNIQUE INDEX `uk_local_profile`(`username`) USING BTREE,
  INDEX `fk_local_profile`(`user_id`) USING BTREE,
  CONSTRAINT `fk_local_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_local_auth
-- ----------------------------

-- ----------------------------
-- Table structure for tb_person_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_person_info`;
CREATE TABLE `tb_person_info`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `profile_img` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  `enable_status` int NOT NULL DEFAULT 0,
  `user_type` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_person_info
-- ----------------------------
INSERT INTO `tb_person_info` VALUES (8, '李翔', '123', '1', NULL, 'http://wx.qlogo.cn/mmopen/XZumId0qMA815ApfWI2zibDnRMahic6SU0wHib2HgGJj5narL2ymRaI4Kn2Tx2Q8UfkicibvjVicu3De6fDYRMfo0uGW0SGicibxVnJ9/0', '2017-06-04 19:01:09', '2017-06-04 19:01:09', 1, 1);
INSERT INTO `tb_person_info` VALUES (9, '龙州一条街客服', '123', '1', NULL, 'http://wx.qlogo.cn/mmopen/icF4iau8Sj7b0FiakC6ibBoTPmkvLpIX9YhWkNyEIGYfzYyqBiag2M3q2rnxSlXAh95UDHdWgywvEW5bN5FBzFPFazxBzqHTRqNwn/0', '2017-06-04 21:20:43', '2017-06-04 21:20:43', 1, 1);
INSERT INTO `tb_person_info` VALUES (10, 'king', '123', '2', NULL, 'http://wx.qlogo.cn/mmopen/XZumId0qMA815ApfWI2zibDLckaAaV6QgcBJP0saJSDTuicZBd35HzPXUebLPSlexCIPJsLs3w6lG0xmwn3EZNicj04dJh4We7C/0', '2017-06-07 01:36:16', '2017-06-07 01:36:16', 1, 1);
INSERT INTO `tb_person_info` VALUES (11, '音策', '123', '2', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKCWfIBicEwS3U0legxxQd5XFpZibBXVPyz0wphvvtaXqiblzQF2GqE28c7j8FGpuYqBCg1QRJThEzuw/0', '2017-09-18 23:39:38', '2017-09-18 23:39:38', 1, 1);

-- ----------------------------
-- Table structure for tb_product
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product`  (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img_addr` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `normal_price` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_price` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int NOT NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  `enable_status` int NOT NULL DEFAULT 0,
  `product_category_id` int NULL DEFAULT NULL,
  `shop_id` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `fk_product_procate`(`product_category_id`) USING BTREE,
  INDEX `fk_product_shop`(`shop_id`) USING BTREE,
  CONSTRAINT `fk_product_procate` FOREIGN KEY (`product_category_id`) REFERENCES `tb_product_category` (`product_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_product
-- ----------------------------
INSERT INTO `tb_product` VALUES (4, '美式咖啡', '一丝醇香，流连忘返', '/upload/item/shop/15/2017060523302118864.jpg', '12', '11', 12, '2017-06-05 23:30:21', '2021-06-08 23:49:34', 1, NULL, 15);
INSERT INTO `tb_product` VALUES (5, '转让八成新XX牌小车', '诚心转让八成新XX牌小车，有意者请连续8866666', '/upload/item/shop/15/2017060523485289817.jpg', '100000', '60000', 100, '2017-06-05 23:48:52', '2021-06-08 17:56:32', 1, 9, 15);
INSERT INTO `tb_product` VALUES (6, '转让电瓶车一辆', '转让电瓶车一辆，可当面看车，电话：1111222', '/upload/item/shop/15/2017060608490188656.jpg', '3000', '1200', 99, '2017-06-06 08:49:01', '2021-06-08 08:50:57', 1, 9, 15);
INSERT INTO `tb_product` VALUES (7, '转让半新旧男装摩托车一辆', '转让半新旧男装摩托车一辆，当面验车，电话：3333666', '/upload/item/shop/15/2017060608502085437.jpg', '8000', '3000', 98, '2017-06-06 08:50:20', '2021-06-08 08:51:19', 1, 9, 15);
INSERT INTO `tb_product` VALUES (8, '大量二手书籍转让', '大量二手书籍转让，电话详谈，或上门看书。联系电话：5556666   地址：东苑XX楼', '/upload/item/shop/16/2017060608574074561.jpg', '0', '0', 100, '2017-06-06 08:57:40', '2021-06-08 08:57:40', 1, 10, 16);
INSERT INTO `tb_product` VALUES (9, '<十万个为什么>', '出手一本《十万个为什么》，8成新，想要的可以联系：9998886', '/upload/item/shop/16/2017060609025850665.png', '25', '10', 98, '2017-06-06 09:02:58', '2021-06-08 09:02:58', 1, 10, 16);
INSERT INTO `tb_product` VALUES (10, '珍珠奶茶', '珍珠奶茶，弹性十足，香甜美味。', '/upload/item/shop/20/2017060620114126875.jpg', '10', '8', 100, '2017-06-06 20:11:41', '2021-06-08 19:13:18', 1, 11, 20);
INSERT INTO `tb_product` VALUES (11, '红豆奶茶', '红豆和奶茶的完美结合，夏天不错的选择。', '/upload/item/shop/20/2017060620363014331.jpg', '10', '8', 99, '2017-06-06 20:36:30', '2021-06-08 20:36:30', 1, 11, 20);
INSERT INTO `tb_product` VALUES (12, '绿豆冰', '清热解毒。', '/upload/item/shop/20/2017060620384620536.jpg', '8', '7', 98, '2017-06-06 20:38:46', '2021-06-08 20:38:46', 1, 11, 20);
INSERT INTO `tb_product` VALUES (13, '芒果冰沙', '新鲜芒果制作。', '/upload/item/shop/20/2017060620472125629.jpg', '15', '13', 95, '2017-06-06 20:47:21', '2021-06-08 20:47:21', 1, 11, 20);
INSERT INTO `tb_product` VALUES (14, '鲜榨芒果汁', '新鲜芒果新鲜榨，香甜可口，解暑降温。', '/upload/item/shop/20/2017060620492297296.jpg', '8', '8', 93, '2017-06-06 20:49:22', '2021-06-08 20:49:22', 1, 11, 20);
INSERT INTO `tb_product` VALUES (15, '鲜榨西瓜汁', '每一杯都是鲜榨的，现榨现卖。', '/upload/item/shop/20/2017060621052824735.jpg', '8', '8', 90, '2017-06-06 21:05:28', '2021-06-08 21:05:28', 1, 11, 20);
INSERT INTO `tb_product` VALUES (28, '小茗同学', '非常好喝', '\\upload\\item\\shop\\20\\2021060817592526822.jpg', '5', '4', 20, '2021-06-08 17:59:25', '2021-06-08 17:59:25', 1, 15, 20);

-- ----------------------------
-- Table structure for tb_product_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_category`;
CREATE TABLE `tb_product_category`  (
  `product_category_id` int NOT NULL AUTO_INCREMENT,
  `product_category_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `priority` int NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `shop_id` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_category_id`) USING BTREE,
  INDEX `fk_procate_shop`(`shop_id`) USING BTREE,
  CONSTRAINT `fk_procate_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_product_category
-- ----------------------------
INSERT INTO `tb_product_category` VALUES (9, '二手车', 100, NULL, 15);
INSERT INTO `tb_product_category` VALUES (10, '二手书籍', 100, NULL, 16);
INSERT INTO `tb_product_category` VALUES (11, '奶茶', 100, NULL, 20);
INSERT INTO `tb_product_category` VALUES (12, '咖啡', 50, NULL, 20);
INSERT INTO `tb_product_category` VALUES (13, '甜品', 30, NULL, 20);
INSERT INTO `tb_product_category` VALUES (14, '小吃', 20, NULL, 20);
INSERT INTO `tb_product_category` VALUES (15, '茗茶', 10, NULL, 20);

-- ----------------------------
-- Table structure for tb_product_img
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_img`;
CREATE TABLE `tb_product_img`  (
  `product_img_id` int NOT NULL AUTO_INCREMENT,
  `img_addr` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img_desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`product_img_id`) USING BTREE,
  INDEX `fk_proimg_product`(`product_id`) USING BTREE,
  CONSTRAINT `fk_proimg_product` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_product_img
-- ----------------------------
INSERT INTO `tb_product_img` VALUES (19, '/upload/item/shop/15/20170605233021865310.jpg', NULL, NULL, '2017-06-05 23:30:22', 4);
INSERT INTO `tb_product_img` VALUES (20, '/upload/item/shop/15/20170605233022618071.jpg', NULL, NULL, '2017-06-05 23:30:22', 4);
INSERT INTO `tb_product_img` VALUES (21, '/upload/item/shop/15/20170605233022246642.jpg', NULL, NULL, '2017-06-05 23:30:22', 4);
INSERT INTO `tb_product_img` VALUES (22, '/upload/item/shop/15/20170605234852321010.jpg', NULL, NULL, '2017-06-05 23:48:52', 5);
INSERT INTO `tb_product_img` VALUES (23, '/upload/item/shop/15/20170606084902162950.jpg', NULL, NULL, '2017-06-06 08:49:02', 6);
INSERT INTO `tb_product_img` VALUES (24, '/upload/item/shop/15/20170606085020558290.jpg', NULL, NULL, '2017-06-06 08:50:20', 7);
INSERT INTO `tb_product_img` VALUES (25, '/upload/item/shop/16/20170606085740956160.jpg', NULL, NULL, '2017-06-06 08:57:40', 8);
INSERT INTO `tb_product_img` VALUES (26, '/upload/item/shop/16/20170606090259397060.png', NULL, NULL, '2017-06-06 09:02:59', 9);
INSERT INTO `tb_product_img` VALUES (27, '/upload/item/shop/20/20170606201141425050.jpg', NULL, NULL, '2017-06-06 20:11:42', 10);
INSERT INTO `tb_product_img` VALUES (28, '/upload/item/shop/20/20170606201141387851.jpg', NULL, NULL, '2017-06-06 20:11:42', 10);
INSERT INTO `tb_product_img` VALUES (29, '/upload/item/shop/20/20170606201141503752.png', NULL, NULL, '2017-06-06 20:11:42', 10);
INSERT INTO `tb_product_img` VALUES (30, '/upload/item/shop/20/20170606203630923430.jpg', NULL, NULL, '2017-06-06 20:36:31', 11);
INSERT INTO `tb_product_img` VALUES (31, '/upload/item/shop/20/20170606203631552081.png', NULL, NULL, '2017-06-06 20:36:31', 11);
INSERT INTO `tb_product_img` VALUES (32, '/upload/item/shop/20/20170606203631972862.jpg', NULL, NULL, '2017-06-06 20:36:31', 11);
INSERT INTO `tb_product_img` VALUES (33, '/upload/item/shop/20/20170606203846623120.jpg', NULL, NULL, '2017-06-06 20:38:47', 12);
INSERT INTO `tb_product_img` VALUES (34, '/upload/item/shop/20/20170606204721744860.jpg', NULL, NULL, '2017-06-06 20:47:21', 13);
INSERT INTO `tb_product_img` VALUES (35, '/upload/item/shop/20/20170606204922968580.jpg', NULL, NULL, '2017-06-06 20:49:23', 14);
INSERT INTO `tb_product_img` VALUES (36, '/upload/item/shop/20/20170606210528529220.jpg', NULL, NULL, '2017-06-06 21:05:28', 15);
INSERT INTO `tb_product_img` VALUES (37, '/upload/item/shop/20/20170606210528132921.jpg', NULL, NULL, '2017-06-06 21:05:28', 15);
INSERT INTO `tb_product_img` VALUES (38, '\\upload\\item\\shop\\20\\2021060817592512789.jpg', NULL, NULL, '2021-06-08 17:59:25', 28);
INSERT INTO `tb_product_img` VALUES (39, '\\upload\\item\\shop\\20\\2021060817592598230.jpg', NULL, NULL, '2021-06-08 17:59:25', 28);

-- ----------------------------
-- Table structure for tb_shop
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop`;
CREATE TABLE `tb_shop`  (
  `shop_id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int NOT NULL COMMENT '店铺创建人',
  `area_id` int NULL DEFAULT NULL,
  `shop_category_id` int NULL DEFAULT NULL,
  `shop_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shop_desc` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_addr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_img` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  `enable_status` int NOT NULL DEFAULT 0,
  `advice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`shop_id`) USING BTREE,
  INDEX `fk_shop_area`(`area_id`) USING BTREE,
  INDEX `fk_shop_profile`(`owner_id`) USING BTREE,
  INDEX `fk_shop_shopcate`(`shop_category_id`) USING BTREE,
  CONSTRAINT `fk_shop_area` FOREIGN KEY (`area_id`) REFERENCES `tb_area` (`area_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_shop_profile` FOREIGN KEY (`owner_id`) REFERENCES `tb_person_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_shop_shopcate` FOREIGN KEY (`shop_category_id`) REFERENCES `tb_shop_category` (`shop_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shop
-- ----------------------------
INSERT INTO `tb_shop` VALUES (15, 8, 3, 14, '二手车辆', '二手汽车、摩托车、电车等交通工具交易信息。', '面向全市', '0000000', '/upload/item/shop/15/2017060522042982266.png', 100, '2017-06-05 22:04:29', '2021-06-08 10:50:16', 1, NULL);
INSERT INTO `tb_shop` VALUES (16, 8, 3, 15, '旧书籍交易', '旧书籍交易信息', '旧书籍交易板块', '0000000', '/upload/item/shop/16/2017060608534289617.png', 99, '2017-06-06 08:53:42', '2021-06-08 08:54:40', 1, NULL);
INSERT INTO `tb_shop` VALUES (17, 8, 3, 17, '靓仔靓妹美容护理中心', '二十年手艺，专业护理秀发受损头发。美容美发首选。', '东苑北面二号门', '4445556', '/upload/item/shop/17/2017060609084595067.jpg', 0, '2017-06-06 09:08:45', '2021-06-08 09:45:32', 1, NULL);
INSERT INTO `tb_shop` VALUES (18, 8, 3, 18, '一剪没理发中心', '专业洗剪吹，又好又便宜。', '东苑北面3号门面', '9998887', '/upload/item/shop/18/2017060609110899956.jpg', 0, '2017-06-06 09:11:08', '2021-06-08 09:45:38', 1, NULL);
INSERT INTO `tb_shop` VALUES (19, 8, 4, 20, '吃得饱大排档', '吃得好又吃得饱，朋友聚会好地方。可预约。', '南苑东面10号门面', '1234567', '/upload/item/shop/19/2017060609140699548.jpg', 0, '2017-06-06 09:14:06', '2021-06-08 09:45:43', 1, NULL);
INSERT INTO `tb_shop` VALUES (20, 8, 4, 22, '香喷喷奶茶店', '鲜榨果汁、奶茶等饮品。', '南苑东面5号门面', '77788444', '/upload/item/shop/20/2017060609163395401.jpg', 30, '2017-06-06 09:16:33', '2021-06-08 16:24:07', 1, '\"\"');
INSERT INTO `tb_shop` VALUES (21, 8, 5, 25, '海陆空量贩KTV', '订包厢电话：8889997。节假日请预约。', '西苑1号门面', '8889997', '/upload/item/shop/21/2017060609194286080.jpg', 0, '2017-06-06 09:19:42', '2021-06-08 09:45:59', 1, NULL);
INSERT INTO `tb_shop` VALUES (22, 8, 5, 24, '幽城室逃生娱乐城', '考验你的智商，和小伙伴们一起来挑战吧。', '西苑3号楼第二层', '6666333', '/upload/item/shop/22/2017060609223853062.jpg', 0, '2017-06-06 09:22:38', '2021-06-08 09:46:04', 1, NULL);
INSERT INTO `tb_shop` VALUES (23, 8, 6, 29, '威水程序设计培训教育', '保教抱会，前途无量。', '北苑2栋5楼', '66633111', '/upload/item/shop/23/2017060609275777519.png', 0, '2017-06-06 09:27:57', '2021-06-08 09:46:09', 1, NULL);
INSERT INTO `tb_shop` VALUES (24, 8, 6, 30, '武林风舞蹈培训', '专业培训舞蹈，声乐。', '北苑9懂10楼', '5555555', '/upload/item/shop/24/2017060609354459045.png', 0, '2017-06-06 09:35:44', '2021-06-08 09:46:13', 1, NULL);
INSERT INTO `tb_shop` VALUES (25, 8, 6, 14, '易行交通工具租赁服务中心', '本店租赁各种汽车，摩托车等。详情请拨打电话咨询。电话：2222222', '1栋3号4号门面', '2222222', '/upload/item/shop/25/2017060609381150709.png', 40, '2017-06-06 09:38:11', '2021-06-08 19:58:32', 1, NULL);
INSERT INTO `tb_shop` VALUES (26, 8, 6, 31, '有声有色', '出租各种演出道具，乐器，服装等。', '北苑15号门面', '7777777', '/upload/item/shop/26/2017060609431259039.png', 41, '2017-06-06 09:43:12', '2021-06-08 19:58:45', 1, NULL);
INSERT INTO `tb_shop` VALUES (27, 8, 3, 22, '冰冻夏天奶茶店', '本店出售各种冷饮，奶茶，冰花，鲜榨果汁。', '东苑7懂2号门面', '8889999', '/upload/item/shop/27/2017060715512185473.jpg', 10, '2017-06-07 15:51:21', '2021-06-08 16:22:28', 1, '\"\"');
INSERT INTO `tb_shop` VALUES (28, 9, 3, 14, 'test', 'dfafaf', 'sdafafafa', '3424242', '/upload/item/shop/28/2017082500103690946.png', 0, '2017-08-25 00:10:36', '2021-06-08 00:10:36', 0, NULL);
INSERT INTO `tb_shop` VALUES (36, 8, 3, 15, '安阿姨', '各种资料齐全', '南苑东面5号门面', '100058', '\\upload\\item\\shop\\36\\2021060818044013635.jpg', NULL, '2021-06-08 18:04:40', '2021-06-08 18:04:40', 1, NULL);

-- ----------------------------
-- Table structure for tb_shop_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_category`;
CREATE TABLE `tb_shop_category`  (
  `shop_category_id` int NOT NULL AUTO_INCREMENT,
  `shop_category_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `shop_category_desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `shop_category_img` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int NOT NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  `parent_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`shop_category_id`) USING BTREE,
  INDEX `fk_shop_category_self`(`parent_id`) USING BTREE,
  CONSTRAINT `fk_shop_category_self` FOREIGN KEY (`parent_id`) REFERENCES `tb_shop_category` (`shop_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shop_category
-- ----------------------------
INSERT INTO `tb_shop_category` VALUES (10, '二手市场', '二手商品交易', '/upload/item/shopcategory/2017061223272255687.png', 100, '2017-06-04 20:10:58', '2017-06-12 23:27:22', NULL);
INSERT INTO `tb_shop_category` VALUES (11, '美容美发', '美容美发', '/upload/item/shopcategory/2017061223273314635.png', 99, '2017-06-04 20:12:57', '2017-06-12 23:27:33', NULL);
INSERT INTO `tb_shop_category` VALUES (12, '美食饮品', '美食饮品', '/upload/item/shopcategory/2017061223274213433.png', 98, '2017-06-04 20:15:21', '2017-06-12 23:27:42', NULL);
INSERT INTO `tb_shop_category` VALUES (13, '休闲娱乐', '休闲娱乐', '/upload/item/shopcategory/2017061223275121460.png', 97, '2017-06-04 20:19:29', '2017-06-12 23:27:51', NULL);
INSERT INTO `tb_shop_category` VALUES (14, '旧车', '旧车', '/upload/item/shopcategory/2017060420315183203.png', 80, '2017-06-04 20:31:51', '2017-06-04 20:31:51', 10);
INSERT INTO `tb_shop_category` VALUES (15, '二手书籍', '二手书籍', '/upload/item/shopcategory/2017060420322333745.png', 79, '2017-06-04 20:32:23', '2017-06-04 20:32:23', 10);
INSERT INTO `tb_shop_category` VALUES (17, '护理', '护理', '/upload/item/shopcategory/2017060420372391702.png', 76, '2017-06-04 20:37:23', '2017-06-04 20:37:23', 11);
INSERT INTO `tb_shop_category` VALUES (18, '理发', '理发', '/upload/item/shopcategory/2017060420374775350.png', 74, '2017-06-04 20:37:47', '2017-06-04 20:37:47', 11);
INSERT INTO `tb_shop_category` VALUES (20, '大排档', '大排档', '/upload/item/shopcategory/2017060420460491494.png', 59, '2017-06-04 20:46:04', '2017-06-04 20:46:04', 12);
INSERT INTO `tb_shop_category` VALUES (22, '奶茶店', '奶茶店', '/upload/item/shopcategory/2017060420464594520.png', 58, '2017-06-04 20:46:45', '2017-06-04 20:46:45', 12);
INSERT INTO `tb_shop_category` VALUES (24, '密室逃生', '密室逃生', '/upload/item/shopcategory/2017060420500783376.png', 56, '2017-06-04 20:50:07', '2017-06-04 21:45:53', 13);
INSERT INTO `tb_shop_category` VALUES (25, 'KTV', 'KTV', '/upload/item/shopcategory/2017060420505834244.png', 57, '2017-06-04 20:50:58', '2017-06-04 20:51:14', 13);
INSERT INTO `tb_shop_category` VALUES (27, '培训教育', '培训教育', '/upload/item/shopcategory/2017061223280082147.png', 96, '2017-06-04 21:51:36', '2017-06-12 23:28:00', NULL);
INSERT INTO `tb_shop_category` VALUES (28, '租赁市场', '租赁市场', '/upload/item/shopcategory/2017061223281361578.png', 95, '2017-06-04 21:53:52', '2017-06-12 23:28:13', NULL);
INSERT INTO `tb_shop_category` VALUES (29, '程序设计', '程序设计', '/upload/item/shopcategory/2017060421593496807.png', 50, '2017-06-04 21:59:34', '2017-06-04 21:59:34', 27);
INSERT INTO `tb_shop_category` VALUES (30, '声乐舞蹈', '声乐舞蹈', '/upload/item/shopcategory/2017060421595843693.png', 49, '2017-06-04 21:59:58', '2017-06-04 21:59:58', 27);
INSERT INTO `tb_shop_category` VALUES (31, '演出道具', '演出道具', '/upload/item/shopcategory/2017060422114076152.png', 45, '2017-06-04 22:11:40', '2017-06-04 22:11:40', 28);
INSERT INTO `tb_shop_category` VALUES (32, '交通工具', '交通工具', '/upload/item/shopcategory/2017060422121144586.png', 44, '2017-06-04 22:12:11', '2017-06-04 22:12:11', 28);

-- ----------------------------
-- Table structure for tb_wechat_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_wechat_auth`;
CREATE TABLE `tb_wechat_auth`  (
  `wechat_auth_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `open_id` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`wechat_auth_id`) USING BTREE,
  UNIQUE INDEX `open_id`(`open_id`) USING BTREE,
  INDEX `fk_wechatauth_profile`(`user_id`) USING BTREE,
  CONSTRAINT `fk_wechatauth_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_wechat_auth
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
