/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : peeplus

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 23/07/2019 15:38:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '日志标题',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作方式',
  `params` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '操作提交的数据',
  `exception` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '异常信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_log_create_by`(`create_by`) USING BTREE,
  INDEX `sys_log_request_uri`(`request_uri`) USING BTREE,
  INDEX `sys_log_type`(`type`) USING BTREE,
  INDEX `sys_log_create_date`(`create_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级编号',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '别名(meta里title字段)',
  `layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '布局框架',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限',
  `actions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作',
  `icon` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` int(10) NULL DEFAULT 0 COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `remarks` varchar(257) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', 'dashboard', '系统设置', 'RouteView', 'dashboard', '\"[{\\\"action\\\":\\\"get\\\",\\\"defaultCheck\\\":false,\\\"describe\\\":\\\"详情\\\"},{\\\"action\\\":\\\"update\\\",\\\"defaultCheck\\\":false,\\\"describe\\\":\\\"修改\\\"},{\\\"action\\\":\\\"delete\\\",\\\"defaultCheck\\\":false,\\\"describe\\\":\\\"删除\\\"}]\"', 'setting', 0, '1', '2019-07-23 10:31:57', '1', '2019-07-23 10:32:02', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('2', '0', 'user', '个人设置', '', NULL, '\"[{\\\"action\\\":\\\"add\\\",\\\"defaultCheck\\\":false,\\\"describe\\\":\\\"新增\\\"},{\\\"action\\\":\\\"get\\\",\\\"defaultCheck\\\":false,\\\"describe\\\":\\\"详情\\\"},{\\\"action\\\":\\\"update\\\",\\\"defaultCheck\\\":false,\\\"describe\\\":\\\"修改\\\"},{\\\"action\\\":\\\"delete\\\",\\\"defaultCheck\\\":false,\\\"describe\\\":\\\"删除\\\"}]\"', 'user', 1, '1', '2019-07-23 10:32:11', '1', '2019-07-23 10:32:19', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('3', '0', 'permission', '权限设置', NULL, NULL, '\"[{\\\"action\\\":\\\"add\\\",\\\"defaultCheck\\\":false,\\\"describe\\\":\\\"新增\\\"},{\\\"action\\\":\\\"get\\\",\\\"defaultCheck\\\":false,\\\"describe\\\":\\\"详情\\\"},{\\\"action\\\":\\\"update\\\",\\\"defaultCheck\\\":false,\\\"describe\\\":\\\"修改\\\"},{\\\"action\\\":\\\"delete\\\",\\\"defaultCheck\\\":false,\\\"describe\\\":\\\"删除\\\"}]\"', 'stock', 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('4', '1', 'workplace', '工作台', 'workplace', NULL, '\"[{\\\"action\\\":\\\"get\\\",\\\"defaultCheck\\\":false,\\\"describe\\\":\\\"详情\\\"},{\\\"action\\\":\\\"update\\\",\\\"defaultCheck\\\":false,\\\"describe\\\":\\\"修改\\\"},{\\\"action\\\":\\\"delete\\\",\\\"defaultCheck\\\":false,\\\"describe\\\":\\\"删除\\\"}]\"', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `office_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `enname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色类型',
  `is_sys` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_role_del_flag`(`del_flag`) USING BTREE,
  INDEX `sys_role_enname`(`enname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '', '管理员', 'system', 'assignment', '0', '1', '1', '2015-11-11 15:59:43', '1', '2018-06-19 13:58:41', '', '0');
INSERT INTO `sys_role` VALUES ('caacf61017114120bcf7bf1049b6d4c3', '6a642e140e40496a8d467c646b8e935e', '部门管理员', 'depart', 'assignment', '0', '1', '1', '2015-11-13 10:54:36', '1', '2018-04-18 23:36:22', '', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色-菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '1');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '2');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '3');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '4');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属公司',
  `office_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属部门',
  `login_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '登录名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码',
  `no` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '工号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '姓名',
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机',
  `avatar` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `qrcode` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '二维码',
  `sign` varchar(450) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '个性签名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_user_office_id`(`office_id`) USING BTREE,
  INDEX `sys_user_login_name`(`login_name`) USING BTREE,
  INDEX `sys_user_company_id`(`company_id`) USING BTREE,
  INDEX `sys_user_update_date`(`update_date`) USING BTREE,
  INDEX `sys_user_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', '6a642e140e40496a8d467c646b8e935e', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1', '李云龙', '', '团级', '团长', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560247929760&di=c4aa94e449a159733f6de190fb7ffa80&imgtype=0&src=http%3A%2F%2Ftupian.qqjay.com%2Ftou2%2F2018%2F0912%2F4a1233054ecbf65e1406fd7bb988cac6.jpg', '0:0:0:0:0:0:0:1', '2018-06-28 17:54:12', '1', '1', '2013-05-27 08:00:00', '1', '2018-06-21 21:49:01', 'wwwwwwwwwwwwwwwww', '0', '/jeeplus/userfiles/1/程序附件/qrcode/test.png', 'eee');
INSERT INTO `sys_user` VALUES ('41f4909dfb5a4534b07c93c466b5b745', '1', '6a642e140e40496a8d467c646b8e935e', 'zw', '45606f699dd2e5e493cbf4937123371ba4f3957bd77cb743119d2f54', '111', 'zw', '', '', '', '/jeeplus/static/common/images/flat-avatar.png', '0:0:0:0:0:0:0:1', '2018-04-18 23:36:32', '1', '1', '2017-01-21 20:08:27', '1', '2018-04-16 16:22:46', '', '0', '/jeeplus/userfiles/41f4909dfb5a4534b07c93c466b5b745/qrcode/41f4909dfb5a4534b07c93c466b5b745.png', NULL);
INSERT INTO `sys_user` VALUES ('70593a4f4b894230805d3b71d1cb1695', '1', '6a642e140e40496a8d467c646b8e935e', 'lx', '046bf00f9e9a744524277cae6c1778fb2b6bc4e0f72150b08baaf47c', 'lx', 'lx', '', '', '', '/jeeplus/static/common/images/flat-avatar.png', '0:0:0:0:0:0:0:1', '2017-02-05 13:06:49', '0', '1', '2017-01-25 22:27:02', '1', '2018-04-16 16:22:44', '', '0', '/jeeplus/userfiles/70593a4f4b894230805d3b71d1cb1695/qrcode/70593a4f4b894230805d3b71d1cb1695.png', NULL);
INSERT INTO `sys_user` VALUES ('b73e93072a28473591b07d2aa1f70e08', '1', '6a642e140e40496a8d467c646b8e935e', '11', '01990e44f1c0d3bc66a719ac5bd861c7b17d0a7de3945ec6581b5f48', 'xxxx', '111', '', '', '', '/jeeplus/userfiles/1/files//photo/2018/4/Image 1.png', NULL, NULL, '1', '1', '2018-04-16 16:30:40', '1', '2018-06-16 14:56:56', '', '0', '/jeeplus/userfiles/1/程序附件/qrcode/b73e93072a28473591b07d2aa1f70e08.png', NULL);
INSERT INTO `sys_user` VALUES ('f2c88f49b66f45578bd2a98911871ada', '1', '5', 'fbb', 'f921314fb00f07b37a27c177f54553b6a4a186bbcd8f0bf7a1a69f60', 'zw', '范冰冰', '', '', '', '/jeeplus/static/common/images/flat-avatar.png', '0:0:0:0:0:0:0:1', '2018-01-26 16:20:35', '1', '1', '2017-01-25 22:32:20', '1', '2018-06-16 14:56:56', '', '0', '/jeeplus/userfiles/f2c88f49b66f45578bd2a98911871ada/qrcode/f2c88f49b66f45578bd2a98911871ada.png', NULL);

-- ----------------------------
-- Table structure for sys_user_friend
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_friend`;
CREATE TABLE `sys_user_friend`  (
  `id` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `userId` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `friendId` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_friend
-- ----------------------------
INSERT INTO `sys_user_friend` VALUES ('0725eea71b504a188e24a66e58f65cf9', '8b454376c0434e2792a1dc57edf80dbd', 'cb359e3089224f97adae46cf03c0ed94');
INSERT INTO `sys_user_friend` VALUES ('0c501f722e8d4d94afc13a64fcc3f1c9', '1', 'f94feab9296e4b55957e9eefa029fa60');
INSERT INTO `sys_user_friend` VALUES ('0ed41b44291c487c925e58fa5a504664', '8b454376c0434e2792a1dc57edf80dbd', '42f5435f943a4e8cbcd86ec07b1d922a');
INSERT INTO `sys_user_friend` VALUES ('1005559436d043c8a2209a746ac53bca', '8b454376c0434e2792a1dc57edf80dbd', '5ad0d1f9efdc44b481b02c26b67e832e');
INSERT INTO `sys_user_friend` VALUES ('1cdeea5042bb4a0cbba8902d9c0732c4', '8b454376c0434e2792a1dc57edf80dbd', 'd355e9e6b4ad48a59fa0a983e8b7b583');
INSERT INTO `sys_user_friend` VALUES ('1cf35e13c27a4750803f73098b886553', '8b454376c0434e2792a1dc57edf80dbd', '95b3b09fa0b34ac6b95907237c744c55');
INSERT INTO `sys_user_friend` VALUES ('1dfa2fcbaab342fe9c01031d8b0d0fe3', '1', '18c262ee56764d4fa1aac9bbaaa2b615');
INSERT INTO `sys_user_friend` VALUES ('20a218507dbb4883a9b5c28dfe9a2207', '1', '41f4909dfb5a4534b07c93c466b5b745');
INSERT INTO `sys_user_friend` VALUES ('2186c3bc23db4a009bdbd65b50bb8ef3', '8b454376c0434e2792a1dc57edf80dbd', '3f7ef2d4761f445e946413ab9bea23db');
INSERT INTO `sys_user_friend` VALUES ('218e5347cfdd4feeb4fda84de764a8fe', '1', 'e64299628c59421f9c0cacdb612bdb54');
INSERT INTO `sys_user_friend` VALUES ('227d4140be1e45d09030f1f238ee9cb5', '1', '0fb8ebbff20a46029596806aa077d3c2');
INSERT INTO `sys_user_friend` VALUES ('229045bca68a4f00b97c90c1033f4df6', '1', '70593a4f4b894230805d3b71d1cb1695');
INSERT INTO `sys_user_friend` VALUES ('2a1eb5760e4548ecaee92f378a43fdce', '8b454376c0434e2792a1dc57edf80dbd', '6');
INSERT INTO `sys_user_friend` VALUES ('2bdc93db70f94921a027de921225b264', '41f4909dfb5a4534b07c93c466b5b745', '70593a4f4b894230805d3b71d1cb1695');
INSERT INTO `sys_user_friend` VALUES ('2cbf8cc396044ca7a95282c6c9684516', '8b454376c0434e2792a1dc57edf80dbd', '4639f877ec7149258cadcf145b4182a7');
INSERT INTO `sys_user_friend` VALUES ('2ff791f2677a44399a58b9d7c31308af', '1', '69440d1c90374c23a7bbce6c850d9980');
INSERT INTO `sys_user_friend` VALUES ('410e5a8c33f4499faaf6c55674fb295b', '8b454376c0434e2792a1dc57edf80dbd', '8');
INSERT INTO `sys_user_friend` VALUES ('444433f933d14e41b642183ecbb1e352', '1', '5ddb46e2efe4470cae80eacab1d51104');
INSERT INTO `sys_user_friend` VALUES ('46f0ce5caf11403baafcdee51cea0aca', '1', 'f2c88f49b66f45578bd2a98911871ada');
INSERT INTO `sys_user_friend` VALUES ('557f6bb862514bc194bc2d819ae6562e', '1', '8cc6f5fe20d54a4aa09b357d34d2d190');
INSERT INTO `sys_user_friend` VALUES ('598950c23ae147b7b360fb5b4311120a', '8b454376c0434e2792a1dc57edf80dbd', '19e655ebcd844747aa0e46efe9870169');
INSERT INTO `sys_user_friend` VALUES ('6493d5c972934bb38fef91cc54e969d1', '8b454376c0434e2792a1dc57edf80dbd', 'f12330474f634e2897878e8f56a910ae');
INSERT INTO `sys_user_friend` VALUES ('6df3fc9c46724da4a56c72ffb85b67b3', '8b454376c0434e2792a1dc57edf80dbd', 'dc9663e71aaa42f0a2634770896ec74c');
INSERT INTO `sys_user_friend` VALUES ('734946756a6340aaad71cfa621d1a493', '8b454376c0434e2792a1dc57edf80dbd', '7');
INSERT INTO `sys_user_friend` VALUES ('83f29f5ff3aa4fc2be00bfd45212fb2a', '8b454376c0434e2792a1dc57edf80dbd', '13');
INSERT INTO `sys_user_friend` VALUES ('8a1b8abb1f134bd687b3368166546d6b', '8b454376c0434e2792a1dc57edf80dbd', '3');
INSERT INTO `sys_user_friend` VALUES ('8c0edfb9670a426d9bfa9a951bda919f', '8b454376c0434e2792a1dc57edf80dbd', '6474fda3f35c4d1580b646a42f190cf7');
INSERT INTO `sys_user_friend` VALUES ('8c2c5518bc1d4033a6090305d6fc3b16', '8b454376c0434e2792a1dc57edf80dbd', 'eca1a51b803449d59ce4e2a3b0f4f787');
INSERT INTO `sys_user_friend` VALUES ('9e55312dbfc04d099ed1eabd29b36682', '41f4909dfb5a4534b07c93c466b5b745', 'f2c88f49b66f45578bd2a98911871ada');
INSERT INTO `sys_user_friend` VALUES ('b2c8edc2b0ab49f48ef7ed79942f3ff2', '1', 'b2c24d5a8a4a4e74bbfe404d60c68038');
INSERT INTO `sys_user_friend` VALUES ('b40660a8b3ac49d9a46b424ad64ba264', '8b454376c0434e2792a1dc57edf80dbd', 'bb81a0c098a444e69028380e80852d91');
INSERT INTO `sys_user_friend` VALUES ('b73b147471c24ae8865b924d877b5512', '8b454376c0434e2792a1dc57edf80dbd', '5b61eb41f80f43c5b8e485866178f63d');
INSERT INTO `sys_user_friend` VALUES ('ba870cd0d5d443c9a9e239c06d13b0d5', '8b454376c0434e2792a1dc57edf80dbd', '1');
INSERT INTO `sys_user_friend` VALUES ('ba8f1dc4433d4c5b9259922f25b1234b', '8b454376c0434e2792a1dc57edf80dbd', '9');
INSERT INTO `sys_user_friend` VALUES ('bede9731ebe74021aaf76c7ed3804c95', '1', '1');
INSERT INTO `sys_user_friend` VALUES ('c84a1d30344f4833811356d9b2c3c50e', '8b454376c0434e2792a1dc57edf80dbd', 'da60c61cf2aa4cb2810c629c7045c538');
INSERT INTO `sys_user_friend` VALUES ('ce37fa05072e45fcb82590420965f918', '8b454376c0434e2792a1dc57edf80dbd', 'd8de25a1f872404e82f669c04091685e');
INSERT INTO `sys_user_friend` VALUES ('d45d0c14f1c8473d8ff9687784851519', '8b454376c0434e2792a1dc57edf80dbd', '5091ca619fbf49209bce020859103ba5');
INSERT INTO `sys_user_friend` VALUES ('d96b32e6663a4d25b2de7496c4d7b6b8', '8b454376c0434e2792a1dc57edf80dbd', '4');
INSERT INTO `sys_user_friend` VALUES ('daeb812809fd45d1a592b09b687ee15b', '1', 'ba4ac26d5db348aaab30901a7f00ae0c');
INSERT INTO `sys_user_friend` VALUES ('dbaf20aefb9b45a2bafd91c0eeb43d8f', '8b454376c0434e2792a1dc57edf80dbd', '8b454376c0434e2792a1dc57edf80dbd');
INSERT INTO `sys_user_friend` VALUES ('e8d118adbca24591bcee16a11b87c125', '8b454376c0434e2792a1dc57edf80dbd', 'd42378c9621b4551a0c4c63c82f0aa33');
INSERT INTO `sys_user_friend` VALUES ('ed45cb60c47040ae8ad4b703cd282f4c', '1', 'dc9663e71aaa42f0a2634770896ec74c');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户-角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1c54e003c1fc4dcd9b087ef8d48abac3');

SET FOREIGN_KEY_CHECKS = 1;
