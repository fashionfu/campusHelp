-- 导入产品、学校和用户数据
USE campushelp;

-- 设置字符集
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

-- 清空现有数据（保留表结构）
DELETE FROM product;
DELETE FROM school;
DELETE FROM user;
DELETE FROM task;

-- 导入产品数据
INSERT INTO `product` VALUES ('1', '鱼香肉丝', 'yu.png', '35');
INSERT INTO `product` VALUES ('2', '番茄鸡蛋', 'fan.png', '22');
INSERT INTO `product` VALUES ('3', '外婆菜', 'wai.png', '35');
INSERT INTO `product` VALUES ('4', '手撕包菜', 'shou.png', '15');
INSERT INTO `product` VALUES ('7', '刀拍黄瓜', 'dao.png', '16');
INSERT INTO `product` VALUES ('9', '粉蒸肉', 'fen.png', '88');

-- 导入学校数据
INSERT INTO `school` VALUES ('9', '武大', '2020-02-06 23:24:45', '0');
INSERT INTO `school` VALUES ('10', '华科', '2020-02-07 11:02:59', '0');
INSERT INTO `school` VALUES ('11', '北大', '2020-02-07 11:37:38', '0');

-- 导入用户数据 (根据simple_db.sql的user表结构: stuid, account, password, name, schoolid, money, addtime, state)
INSERT INTO `user` VALUES (7, '13037', '123456', '李飞', 9, 87.00, '2020-02-06 23:25:30', 0);
INSERT INTO `user` VALUES (8, '13038', '123456', '王刚', 10, 60.00, '2020-02-07 11:29:09', 0);
INSERT INTO `user` VALUES (9, '13039', '123456', '柳树', 11, 98.00, '2020-02-07 11:38:35', 0);

-- 导入任务数据 (根据simple_db.sql的task表结构: tid, title, content, price, publish_user_id, accept_user_id, schoolid, state, addtime, finishtime)
INSERT INTO `task` VALUES (37, '代取一个快递', '去学校快递出取一个快递', 10.00, 7, 8, 9, 3, '2020-02-07 11:25:43', '2020-02-07 11:25:43');
INSERT INTO `task` VALUES (38, '7栋宿舍买个早点', '帮买早餐', 2.00, 9, 7, 11, 3, '2020-02-07 11:40:10', '2020-02-07 11:40:10');
INSERT INTO `task` VALUES (39, '商品:鱼香肉丝', '单价:35', 5.00, 7, 0, 9, 0, '2022-04-26 19:52:50', '2022-04-26 19:52:50');
