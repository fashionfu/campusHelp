# Campus Help System (校园互助系统)

## 项目简介

这是一个基于Spring MVC + MyBatis + MySQL的校园互助系统，为学生提供任务发布、接受和管理功能。

![Campus Help System](https://github.com/fashionfu/campusHelp/raw/master/product.png)

## 技术栈

- **后端框架**: Spring MVC 4.1.4
- **持久层框架**: MyBatis 3.2.6
- **数据库**: MySQL 8.0
- **前端框架**: LayUI
- **服务器**: Apache Tomcat 9.0.80
- **JDK版本**: Java 21

## 主要功能

### 用户功能
- 用户注册/登录
- 发布任务
- 接受任务
- 查看任务列表
- 个人信息管理
- 账户余额管理

### 管理员功能
- 管理员登录
- 用户管理
- 任务管理
- 学校管理
- 产品管理
- 系统配置

## 项目结构

```
campusHelp/
├── src/                    # 源代码
│   ├── com/ssm/
│   │   ├── controller/     # 控制器层
│   │   ├── service/        # 服务层
│   │   ├── mapper/         # 数据访问层
│   │   ├── po/            # 实体类
│   │   └── util/          # 工具类
│   └── applicationContext.xml  # Spring配置
├── WebContent/            # Web资源
│   ├── WEB-INF/
│   │   ├── web.xml        # Web配置
│   │   └── springmvc-servlet.xml  # Spring MVC配置
│   └── *.jsp             # JSP页面
├── classes/              # 编译后的类文件
├── campushelpdb.sql      # 数据库脚本
└── simple_db.sql         # 简化数据库脚本
```

## 数据库设计

### 主要表结构
- **user**: 用户表
- **task**: 任务表
- **admin**: 管理员表
- **school**: 学校表
- **product**: 产品表

## 部署说明

### 环境要求
- JDK 21+
- MySQL 8.0+
- Apache Tomcat 9.0+

### 部署步骤

1. **数据库配置**
   ```sql
   -- 创建数据库
   CREATE DATABASE campushelp DEFAULT CHARSET utf8;
   
   -- 导入数据
   mysql -u root -p campushelp < simple_db.sql
   ```

2. **配置数据库连接**
   - 修改 `src/applicationContext.xml` 中的数据库连接信息
   - 确保MySQL用户密码正确

3. **启动Tomcat**
   ```bash
   # 设置环境变量
   export CATALINA_HOME=/path/to/tomcat
   export JAVA_HOME=/path/to/jdk21
   
   # 启动服务器
   ./startup.sh
   ```

4. **访问应用**
   - 用户端: http://localhost:8080/campusHelp/
   - 管理员端: http://localhost:8080/campusHelp/admin/

## 默认账号

### 管理员账号
- 用户名: admin
- 密码: 123456

### 测试用户
- 学号: 13037, 密码: 123456 (李飞)
- 学号: 13038, 密码: 123456 (王刚)
- 学号: 13039, 密码: 123456 (柳树)

## 开发说明

### 项目特点
- 采用MVC架构模式
- 使用MyBatis进行数据持久化
- 集成LayUI前端框架
- 支持分页查询
- 完整的用户权限管理

### 主要修复
- 修复了MySQL 8.0兼容性问题
- 更新了JDBC驱动版本
- 解决了Java 21兼容性问题
- 完善了数据库表结构

## 许可证

本项目仅供学习和研究使用。

## 联系方式

如有问题，请通过GitHub Issues联系。
