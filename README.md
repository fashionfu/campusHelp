# Campus Help System (校园互助系统)

## 项目简介

这是一个基于Spring MVC + MyBatis + MySQL的校园互助系统，为学生提供任务发布、接受和管理功能

![Campus Help System](https://github.com/fashionfu/campusHelp/raw/master/product.png)

## 系统架构图

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                           Campus Help System 架构图                             │
└─────────────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────────────┐
│                                表示层 (Presentation Layer)                      │
├─────────────────────────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐   ┌─────────────────┐    ┌─────────────────┐               │
│  │   用户端页面    │   │   管理员端页面   │    │   静态资源      │               │
│  │                 │   │                 │    │                 │               │
│  │ • index.jsp     │   │ • adminIndex.jsp│    │ • LayUI框架     │               │
│  │ • login.jsp     │   │ • adminUser.jsp │    │ • CSS样式       │               │
│  │ • register.jsp  │   │ • adminTask.jsp │    │ • JavaScript    │               │
│  │ • userIndex.jsp │   │ • adminSchool.jsp│   │ • 图片资源      │               │
│  │ • userInfo.jsp  │   │ • adminProduct.jsp│  │ • 字体文件      │               │
│  │ • userNewtask.jsp│  │                 │    │                 │               │
│  │ • userPtask.jsp │   │                 │    │                 │               │
│  │ • userAtask.jsp │   │                 │    │                 │               │
│  │ • taskInfo.jsp  │   │                 │    │                 │               │
│  └─────────────────┘   └─────────────────┘    └─────────────────┘               │
└─────────────────────────────────────────────────────────────────────────────────┘
                                        │
                                        ▼
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              控制器层 (Controller Layer)                        │
├─────────────────────────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐              │
│  │ UserController  │    │ TaskController  │    │ AdminController │              │
│  │                │     │                 │    │                │               │
│  │ • login()      │     │ • findtask()    │    │ • login()      │               │
│  │ • register()   │     │ • newtask()     │    │ • update()     │               │
│  │ • update()     │     │ • mytask()      │    │ • addAdmin()   │               │
│  │ • updatePassword()│  │ • atask()       │    │ • getUserList()│               │
│  │ • getUserInfo()│     │ • finishtask()  │    │ • getTaskList()│               │
│  │ • addMoney()   │     │ • closetask()   │    │ • getSchoolList()│             │
│  └─────────────────┘    │ • taskinfo()    │    │ • addUserMoney()│              │
│                         │ • searchtask()  │    │ • updateUserState()│           │
│  ┌─────────────────┐    └─────────────────┘    └─────────────────┘              │
│  │ProductController│                                                            │
│  │                │    ┌─────────────────┐                                      │
│  │ • getProductList()│ │CommonController │                                      │
│  │ • addProduct() │    │                 │                                      │
│  │ • updateProduct()│  │ • index()       │                                      │
│  │ • deleteProduct()│  │ • login()       │                                      │
│  └─────────────────┘   │ • register()    │                                      │
│                        └─────────────────┘                                      │
└─────────────────────────────────────────────────────────────────────────────────┘
                                        │
                                        ▼
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              业务层 (Service Layer)                             │
├─────────────────────────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐    ┌─────────────────┐         ┌─────────────────┐         │
│  │ UserService     │    │ TaskService     │         │ AdminService    │         │
│  │                │     │                │          │                │          │
│  │ • login()      │     │ • getTaskByKeysNoState()  │ • login()      │          │
│  │ • register()   │     │ • getTaskByKeys()│        │ • updateAdmin() │         │
│  │ • updateUser() │     │ • getTaskByPublishUserId()│ • addAdmin() │            │
│  │ • getUserById()│     │ • getTaskByAcceptUserId() │ • getAdminById()│         │
│  │ • addUserMoney()│    │ • addTask()     │         │                │          │
│  │ • updateUserState()│ │ • updateTask() │          │                │          │
│  └─────────────────┘    │ • deleteTask() │          │                │          │
│                         │ • acceptTask() │          │                │          │
│  ┌─────────────────┐    │ • finishTask() │          └─────────────────┘         │
│  │ProductService   │    └─────────────────┘                                     │
│  │                 │                                                            │
│  │ • getProductList()│   ┌─────────────────┐                                    │
│  │ • addProduct()  │     │ SchoolService   │                                    │
│  │ • updateProduct()│    │                 │                                    │
│  │ • deleteProduct()│    │ • getSchoolList()│                                   │
│  └─────────────────┘     │ • getSchoolById()│                                   │
│                          │ • addSchool()   │                                    │
│                          │ • updateSchool()│                                    │
│                          └─────────────────┘                                    │
└─────────────────────────────────────────────────────────────────────────────────┘
                                        │
                                        ▼
┌─────────────────────────────────────────────────────────────────────────────────┐
│                            数据访问层 (DAO Layer)                               │
├─────────────────────────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐             │
│  │ UserMapper      │    │ TaskMapper      │    │ AdminMapper     │             │
│  │                 │    │                 │    │                │             │
│  │ • 用户CRUD操作  │    │ • 任务CRUD操作  │    │ • 管理员CRUD操作│             │
│  │ • 登录验证      │    │ • 任务列表查询  │    │ • 登录验证      │             │
│  │ • 信息查询      │    │ • 状态查询      │    │ • 权限管理      │             │
│  │ • 状态更新      │    │ • 关联查询      │    │ • 用户管理      │             │
│  └─────────────────┘    └─────────────────┘    └─────────────────┘             │
│                                                                                │
│  ┌─────────────────┐    ┌─────────────────┐                                    │
│  │ProductMapper    │    │ SchoolMapper    │                                    │
│  │                 │    │                 │                                    │
│  │ • 产品CRUD操作  │    │ • 学校CRUD操作  │                                    │
│  │ • 产品列表查询  │    │ • 学校列表查询  │                                    │
│  │ • 信息管理      │    │ • 信息查询      │                                    │
│  └─────────────────┘    └─────────────────┘                                    │
└─────────────────────────────────────────────────────────────────────────────────┘
                                        │
                                        ▼
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              实体层 (Entity Layer)                              │
├─────────────────────────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐             │
│  │      User       │    │      Task       │    │      Admin      │             │
│  │                │     │                 │    │                 │             │
│  │ • stuid        │     │ • taskid        │    │ • aid           │             │
│  │ • studentid    │     │ • publishUserId │    │ • account       │             │
│  │ • password     │     │ • publishUserName│   │ • password      │             │
│  │ • schoolid     │     │ • publishSchoolId│   │ • name          │             │
│  │ • sex          │     │ • acceptUserId  │    │ • addtime       │             │
│  │ • name         │     │ • reward        │    │ • state         │             │
│  │ • registertime │     │ • addtime       │    │                 │             │
│  │ • money        │     │ • endtime       │    │                 │             │
│  │ • state        │     │ • taskname      │    │                 │             │
│  └─────────────────┘    │ • taskcontext   │    └─────────────────┘             │
│                         │ • state         │                                    │
│  ┌─────────────────┐    └─────────────────┘    ┌─────────────────┐             │
│  │    Product      │                           │     School      │             │
│  │                │                            │                 │             │
│  │ • id           │                            │ • schoolid      │             │
│  │ • name         │                            │ • name          │             │
│  │ • icon         │                            │ • addtime       │             │
│  │ • price        │                            │ • state         │             │
│  └─────────────────┘                           └─────────────────┘             │
└─────────────────────────────────────────────────────────────────────────────────┘
                                        │
                                        ▼
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              工具层 (Utility Layer)                             │
├─────────────────────────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐                ┌─────────────────┐                         │
│  │      Const      │                │     JsonUtil    │                         │
│  │                 │                │                 │                         │
│  │ • ROOT          │                │ • object2json() │                         │
│  │ • ROOT_ADMIN    │                │ • bean2json()   │                         │
│  │ • PAGESIZE      │                │ • list2json()   │                         │
│  │ • getFullTime() │                │ • map2json()    │                         │
│  │ • getTime()     │                │ • string2json() │                         │
│  │ • getIds()      │                │                 │                         │
│  └─────────────────┘                └─────────────────┘                         │
└─────────────────────────────────────────────────────────────────────────────────┘
                                        │
                                        ▼
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              数据库层 (Database Layer)                          │
├─────────────────────────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐             │
│  │    user表       │    │    task表       │    │    admin表      │             │
│  │                 │    │                 │    │                 │             │
│  │ • 用户信息存储  │    │ • 任务信息存储  │     │ • 管理员信息存储│             │
│  │ • 登录验证      │    │ • 任务状态管理  │     │ • 权限控制      │             │
│  │ • 余额管理      │    │ • 发布接受关系  │     │ • 系统配置      │             │
│  └─────────────────┘    └─────────────────┘    └─────────────────┘             │
│                                                                                │
│  ┌─────────────────┐    ┌─────────────────┐                                    │
│  │   product表     │    │   school表      │                                    │
│  │                 │    │                 │                                    │
│  │ • 产品信息存储  │    │ • 学校信息存储   │                                    │
│  │ • 商品管理      │    │ • 学校分类       │                                    │
│  └─────────────────┘    └─────────────────┘                                    │
└─────────────────────────────────────────────────────────────────────────────────┘
                                        │
                                        ▼
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              MySQL 8.0 数据库                                   │
└─────────────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────────────┐
│                              技术栈说明                                         │
├─────────────────────────────────────────────────────────────────────────────────┤
│  • Spring MVC 4.1.4    - MVC框架，处理Web请求和响应                             │
│  • MyBatis 3.2.6       - ORM框架，数据持久化                                    │
│  • MySQL 8.0           - 关系型数据库                                           │
│  • Apache Tomcat 9.0   - Web服务器容器                                          │
│  • LayUI               - 前端UI框架                                             │
│  • PageHelper 4.1.6    - 分页插件                                               │
│  • FastJSON 1.2.6      - JSON处理库                                             │
│  • Apache Commons DBCP - 数据库连接池                                           │
└─────────────────────────────────────────────────────────────────────────────────┘
```

## 数据流图

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                            Campus Help System 数据流图                          │
└─────────────────────────────────────────────────────────────────────────────────┘

用户请求流程：
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   用户界面  │───▶│  控制器层   │──▶│  业务服务层 │──▶│  数据访问层  │
│  (JSP页面)  │    │(Controller) │    │  (Service)  │    │  (Mapper)   │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
       │                   │                   │                   │
       │                   │                   │                   │
       ▼                   ▼                   ▼                   ▼
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   用户操作   │    │  请求处理   │    │  业务逻辑    │   │  数据操作    │
│ • 登录      │    │ • 参数验证   │    │ • 数据处理  │    │ • SQL执行   │
│ • 注册      │    │ • 权限检查   │    │ • 事务管理  │    │ • 结果返回   │
│ • 发布任务   │   │ • 路由分发   │    │ • 业务规则  │    │ • 异常处理   │
│ • 接受任务   │   │ • 响应处理   │    │ • 状态管理  │    │ • 连接管理   │
│ • 管理任务   │   │ • 视图渲染   │    │ • 数据转换  │    │ • 缓存处理   │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
       │                   │                   │                   │
       │                   │                   │                   │
       ▼                   ▼                   ▼                   ▼
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   LayUI     │    │ Spring MVC  │    │ Spring IoC  │    │   MyBatis   │
│ 前端框架    │    │ Web框架     │    │ 依赖注入     │    │ ORM框架     │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
                                                                      │
                                                                      ▼
                                                            ┌─────────────┐
                                                            │  MySQL 8.0  │
                                                            │   数据库    │
                                                            └─────────────┘

核心数据流：
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              数据流向说明                                       │
├─────────────────────────────────────────────────────────────────────────────────┤
│ 1. 用户通过JSP页面发起请求                                                        │
│ 2. Spring MVC DispatcherServlet接收请求并路由到对应Controller                   │
│ 3. Controller调用Service层处理业务逻辑                                           │
│ 4. Service层调用Mapper层执行数据库操作                                           │
│ 5. MyBatis执行SQL语句并返回结果                                                  │
│ 6. 结果逐层返回，最终渲染到JSP页面展示给用户                                     │
│                                                                                │
│ 关键数据流：                                                                    │
│ • 用户登录：User → UserController → UserService → UserMapper → user表           │
│ • 任务发布：Task → TaskController → TaskService → TaskMapper → task表           │
│ • 任务接受：Task → TaskController → TaskService → TaskMapper → task表           │
│ • 管理员操作：Admin → AdminController → AdminService → AdminMapper → admin表    │
│ • 学校管理：School → AdminController → SchoolService → SchoolMapper → school表 │
└─────────────────────────────────────────────────────────────────────────────────┘
```

## 数据库关系图

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                            Campus Help System 数据库关系图                       │
└─────────────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────────────┐
│                                数据库表关系                                     │
├─────────────────────────────────────────────────────────────────────────────────┤
│                                                                                │
│  ┌─────────────────┐                                                           │
│  │    school表     │                                                           │
│  │                │                                                           │
│  │ • schoolid (PK)│                                                           │
│  │ • name         │                                                           │
│  │ • addtime      │                                                           │
│  │ • state        │                                                           │
│  └─────────────────┘                                                           │
│         │                                                                      │
│         │ 1:N                                                                  │
│         ▼                                                                      │
│  ┌─────────────────┐                                                           │
│  │     user表      │                                                           │
│  │                │                                                           │
│  │ • stuid (PK)   │                                                           │
│  │ • studentid    │                                                           │
│  │ • password     │                                                           │
│  │ • schoolid (FK)│                                                           │
│  │ • sex          │                                                           │
│  │ • name         │                                                           │
│  │ • registertime │                                                           │
│  │ • money        │                                                           │
│  │ • state        │                                                           │
│  └─────────────────┘                                                           │
│         │                                                                      │
│         │ 1:N                                                                  │
│         ▼                                                                      │
│  ┌─────────────────┐                                                           │
│  │     task表      │                                                           │
│  │                │                                                           │
│  │ • tid (PK)     │                                                           │
│  │ • taskname     │                                                           │
│  │ • title        │                                                           │
│  │ • content      │                                                           │
│  │ • price        │                                                           │
│  │ • publish_user_id (FK) │                                                   │
│  │ • accept_user_id (FK)  │                                                   │
│  │ • schoolid (FK)        │                                                   │
│  │ • state                │                                                   │
│  │ • addtime              │                                                   │
│  │ • finishtime           │                                                   │
│  └─────────────────────────┘                                                   │
│                                                                                │
│  ┌─────────────────┐    ┌─────────────────┐                                    │
│  │    admin表      │    │   product表     │                                    │
│  │                │    │                │                                    │
│  │ • aid (PK)     │    │ • id (PK)      │                                    │
│  │ • account      │    │ • name         │                                    │
│  │ • password     │    │ • icon         │                                    │
│  │ • name         │    │ • price        │                                    │
│  │ • addtime      │    │                │                                    │
│  │ • state        │    │                │                                    │
│  └─────────────────┘    └─────────────────┘                                    │
│                                                                                │
│  关系说明：                                                                     │
│  • school (1) ←→ (N) user: 一个学校可以有多个用户                              │
│  • user (1) ←→ (N) task: 一个用户可以发布多个任务                              │
│  • user (1) ←→ (N) task: 一个用户可以接受多个任务                              │
│  • school (1) ←→ (N) task: 一个学校可以有多个任务                              │
│  • admin表: 独立的管理员表，无外键关系                                          │
│  • product表: 独立的产品表，无外键关系                                          │
│                                                                                │
└─────────────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────────────┐
│                              表结构详情                                         │
├─────────────────────────────────────────────────────────────────────────────────┤
│                                                                                │
│  school表 (学校表)                                                              │
│  ┌─────────────┬─────────────┬─────────────┬─────────────────────────────────────┐
│  │ 字段名      │ 数据类型    │ 约束        │ 说明                                │
│  ├─────────────┼─────────────┼─────────────┼─────────────────────────────────────┤
│  │ schoolid    │ int(6)      │ PK, AI     │ 学校ID，主键，自增                  │
│  │ name        │ varchar(255)│ NOT NULL   │ 学校名称                             │
│  │ addtime     │ datetime    │ NOT NULL   │ 添加时间                             │
│  │ state       │ int(2)      │ DEFAULT 0  │ 状态，0-正常，1-禁用                 │
│  └─────────────┴─────────────┴─────────────┴─────────────────────────────────────┘
│                                                                                │
│  user表 (用户表)                                                                │
│  ┌─────────────┬─────────────┬─────────────┬─────────────────────────────────────┐
│  │ 字段名      │ 数据类型    │ 约束        │ 说明                                │
│  ├─────────────┼─────────────┼─────────────┼─────────────────────────────────────┤
│  │ stuid       │ int(11)     │ PK, AI     │ 用户ID，主键，自增                  │
│  │ studentid   │ varchar(20) │ NOT NULL   │ 学号，唯一标识                       │
│  │ password    │ varchar(255)│ NOT NULL   │ 密码，加密存储                       │
│  │ schoolid    │ int(6)      │ NOT NULL   │ 学校ID，外键→school.schoolid        │
│  │ sex         │ int(2)      │ DEFAULT 0  │ 性别，0-未知，1-男，2-女             │
│  │ name        │ varchar(255)│ NOT NULL   │ 姓名                                 │
│  │ registertime│ datetime(6) │ NOT NULL   │ 注册时间                             │
│  │ money       │ double(20,0)│ DEFAULT 0  │ 账户余额                             │
│  │ state       │ int(2)      │ DEFAULT 0  │ 状态，0-正常，1-禁用                 │
│  └─────────────┴─────────────┴─────────────┴─────────────────────────────────────┘
│                                                                                │
│  task表 (任务表)                                                                │
│  ┌─────────────┬─────────────┬─────────────┬─────────────────────────────────────┐
│  │ 字段名      │ 数据类型    │ 约束        │ 说明                                │
│  ├─────────────┼─────────────┼─────────────┼─────────────────────────────────────┤
│  │ tid         │ int(8)      │ PK, AI     │ 任务ID，主键，自增                  │
│  │ taskname    │ varchar(255)│ NOT NULL   │ 任务名称                             │
│  │ title       │ varchar(255)│ NOT NULL   │ 任务标题                             │
│  │ content     │ text        │ NOT NULL   │ 任务内容描述                         │
│  │ price       │ double(30,0)│ NOT NULL   │ 任务奖励金额                         │
│  │ publish_user_id│ varchar(255)│ NOT NULL│ 发布用户学号，外键→user.studentid    │
│  │ accept_user_id│ int(11)   │ DEFAULT 0  │ 接受用户ID，外键→user.stuid          │
│  │ schoolid    │ int(6)      │ NOT NULL   │ 学校ID，外键→school.schoolid        │
│  │ state       │ int(2)      │ DEFAULT 0  │ 任务状态，0-待接受，1-进行中，2-已完成，3-已关闭│
│  │ addtime     │ datetime(6) │ NOT NULL   │ 发布时间                             │
│  │ finishtime  │ datetime    │ NULL       │ 完成时间                             │
│  └─────────────┴─────────────┴─────────────┴─────────────────────────────────────┘
│                                                                                │
│  admin表 (管理员表)                                                             │
│  ┌─────────────┬─────────────┬─────────────┬─────────────────────────────────────┐
│  │ 字段名      │ 数据类型    │ 约束        │ 说明                                │
│  ├─────────────┼─────────────┼─────────────┼─────────────────────────────────────┤
│  │ aid         │ int(11)     │ PK, AI     │ 管理员ID，主键，自增                │
│  │ account     │ varchar(255)│ NOT NULL   │ 管理员账号                           │
│  │ password    │ varchar(255)│ NOT NULL   │ 密码，加密存储                       │
│  │ name        │ varchar(255)│ NOT NULL   │ 管理员姓名                           │
│  │ addtime     │ datetime    │ NOT NULL   │ 添加时间                             │
│  │ state       │ int(2)      │ DEFAULT 0  │ 状态，0-正常，1-禁用                 │
│  └─────────────┴─────────────┴─────────────┴─────────────────────────────────────┘
│                                                                                │
│  product表 (产品表)                                                             │
│  ┌─────────────┬─────────────┬─────────────┬─────────────────────────────────────┐
│  │ 字段名      │ 数据类型    │ 约束        │ 说明                                │
│  ├─────────────┼─────────────┼─────────────┼─────────────────────────────────────┤
│  │ id          │ int(11)     │ PK, AI     │ 产品ID，主键，自增                  │
│  │ name        │ varchar(255)│ NOT NULL   │ 产品名称                             │
│  │ icon        │ varchar(255)│ NULL       │ 产品图标                             │
│  │ price       │ varchar(255)│ NULL       │ 产品价格                             │
│  └─────────────┴─────────────┴─────────────┴─────────────────────────────────────┘
└─────────────────────────────────────────────────────────────────────────────────┘
```

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

## 详细项目结构

### 📁 项目目录结构
```
campusHelp/
├── src/                           # 源代码目录
│   ├── com/ssm/                   # 主包路径
│   │   ├── controller/            # 控制器层 (MVC控制层)
│   │   │   ├── AdminController.java      # 管理员控制器
│   │   │   ├── CommonController.java     # 通用控制器
│   │   │   ├── ProductController.java    # 产品控制器
│   │   │   ├── TaskController.java       # 任务控制器
│   │   │   └── UserController.java       # 用户控制器
│   │   ├── service/               # 服务层 (业务逻辑层)
│   │   │   ├── impl/              # 服务实现类
│   │   │   │   ├── AdminServiceImpl.java
│   │   │   │   ├── ProductServiceImpl.java
│   │   │   │   ├── SchoolServiceImpl.java
│   │   │   │   ├── TaskServiceImpl.java
│   │   │   │   └── UserServiceImpl.java
│   │   │   ├── AdminService.java         # 管理员服务接口
│   │   │   ├── ProductService.java       # 产品服务接口
│   │   │   ├── SchoolService.java        # 学校服务接口
│   │   │   ├── TaskService.java          # 任务服务接口
│   │   │   └── UserService.java          # 用户服务接口
│   │   ├── mapper/                # 数据访问层 (MyBatis映射)
│   │   │   ├── AdminMapper.java          # 管理员数据访问接口
│   │   │   ├── AdminMapper.xml           # 管理员SQL映射文件
│   │   │   ├── ProductMapper.java        # 产品数据访问接口
│   │   │   ├── ProductMapper.xml         # 产品SQL映射文件
│   │   │   ├── SchoolMapper.java         # 学校数据访问接口
│   │   │   ├── SchoolMapper.xml          # 学校SQL映射文件
│   │   │   ├── TaskMapper.java           # 任务数据访问接口
│   │   │   ├── TaskMapper.xml            # 任务SQL映射文件
│   │   │   ├── UserMapper.java           # 用户数据访问接口
│   │   │   └── UserMapper.xml            # 用户SQL映射文件
│   │   ├── po/                    # 实体类 (POJO对象)
│   │   │   ├── Admin.java                # 管理员实体类
│   │   │   ├── Product.java              # 产品实体类
│   │   │   ├── School.java               # 学校实体类
│   │   │   ├── Task.java                 # 任务实体类
│   │   │   ├── Task2.java                # 任务实体类(备用)
│   │   │   ├── User.java                 # 用户实体类
│   │   │   └── User2.java                # 用户实体类(备用)
│   │   └── util/                  # 工具类
│   │       ├── Const.java                # 常量定义类
│   │       └── JsonUtil.java             # JSON工具类
│   ├── applicationContext.xml     # Spring核心配置文件
│   └── log4j.properties          # 日志配置文件
├── WebContent/                   # Web资源目录
│   ├── WEB-INF/                  # Web应用配置目录
│   │   ├── lib/                  # 依赖库目录
│   │   │   ├── spring-*.jar      # Spring框架相关JAR包
│   │   │   ├── mybatis-*.jar     # MyBatis相关JAR包
│   │   │   ├── mysql-connector-*.jar # MySQL驱动
│   │   │   ├── commons-*.jar     # Apache Commons工具包
│   │   │   ├── fastjson-*.jar    # JSON处理库
│   │   │   ├── pagehelper-*.jar  # 分页插件
│   │   │   └── ...               # 其他依赖库
│   │   ├── web.xml               # Web应用部署描述符
│   │   └── springmvc-servlet.xml # Spring MVC配置文件
│   ├── layui/                    # LayUI前端框架
│   │   ├── css/                  # 样式文件
│   │   ├── lay/                  # 模块化JS文件
│   │   ├── font/                 # 字体文件
│   │   └── images/               # 图片资源
│   ├── js/                       # JavaScript文件
│   ├── images/                   # 项目图片资源
│   ├── *.jsp                     # JSP页面文件
│   └── META-INF/                 # 元数据目录
├── build/                        # 构建输出目录
├── classes/                      # 编译后的类文件
├── campushelpdb.sql             # 数据库初始化脚本
├── product.png                  # 项目展示图片
└── README.md                    # 项目说明文档
```

### 🏗️ 核心类详细说明

#### 📋 实体类 (PO层)
- **User.java**: 用户实体类
  - 属性: `stuid`(用户ID), `studentid`(学号), `password`(密码), `schoolid`(学校ID), `sex`(性别), `name`(姓名), `registertime`(注册时间), `money`(余额), `state`(状态)
  - 功能: 封装用户基本信息，提供getter/setter方法

- **Task.java**: 任务实体类
  - 属性: `taskid`(任务ID), `publishUserId`(发布用户ID), `publishUserName`(发布用户名), `publishSchoolId`(发布学校ID), `acceptUserId`(接受用户ID), `reward`(奖励金额), `addtime`(发布时间), `endtime`(结束时间), `taskname`(任务名称), `taskcontext`(任务内容), `state`(任务状态)
  - 功能: 封装任务相关信息，支持任务发布、接受、完成等状态管理

- **Admin.java**: 管理员实体类
  - 属性: `aid`(管理员ID), `account`(账号), `password`(密码), `name`(姓名), `addtime`(添加时间), `state`(状态)
  - 功能: 封装管理员信息，用于系统管理功能

- **Product.java**: 产品实体类
  - 属性: `id`(产品ID), `name`(产品名称), `icon`(图标), `price`(价格)
  - 功能: 封装产品信息，用于商品管理

- **School.java**: 学校实体类
  - 属性: `schoolid`(学校ID), `name`(学校名称), `addtime`(添加时间), `state`(状态)
  - 功能: 封装学校信息，用于学校管理

#### 🎮 控制器层 (Controller层)

- **UserController.java**: 用户控制器
  - `login()`: 用户登录验证
  - `register()`: 用户注册
  - `update()`: 更新用户信息
  - `updatePassword()`: 修改密码
  - `getUserInfo()`: 获取用户信息
  - `addMoney()`: 添加用户余额

- **TaskController.java**: 任务控制器
  - `findtask()`: 查找任务列表
  - `newtask()`: 发布新任务
  - `mytask()`: 我的任务列表
  - `atask()`: 接受任务
  - `finishtask()`: 完成任务
  - `closetask()`: 关闭任务
  - `taskinfo()`: 任务详情
  - `searchtask()`: 搜索任务

- **AdminController.java**: 管理员控制器
  - `login()`: 管理员登录
  - `update()`: 更新管理员信息
  - `updatePassword()`: 修改管理员密码
  - `addAdmin()`: 添加管理员
  - `getUserList()`: 获取用户列表
  - `getTaskList()`: 获取任务列表
  - `getSchoolList()`: 获取学校列表
  - `addUserMoney()`: 添加用户余额
  - `updateUserState()`: 更新用户状态

- **ProductController.java**: 产品控制器
  - `getProductList()`: 获取产品列表
  - `addProduct()`: 添加产品
  - `updateProduct()`: 更新产品
  - `deleteProduct()`: 删除产品

- **CommonController.java**: 通用控制器
  - `index()`: 首页跳转
  - `login()`: 登录页面
  - `register()`: 注册页面

#### 🔧 服务层 (Service层)

- **UserService.java & UserServiceImpl.java**: 用户服务
  - `login()`: 用户登录业务逻辑
  - `register()`: 用户注册业务逻辑
  - `updateUser()`: 更新用户信息
  - `getUserById()`: 根据ID获取用户
  - `addUserMoney()`: 添加用户余额
  - `updateUserState()`: 更新用户状态

- **TaskService.java & TaskServiceImpl.java**: 任务服务
  - `getTaskByKeysNoState()`: 获取未完成任务
  - `getTaskByKeys()`: 获取所有任务
  - `getTaskByPublishUserId()`: 获取用户发布的任务
  - `getTaskByAcceptUserId()`: 获取用户接受的任务
  - `addTask()`: 添加任务
  - `updateTask()`: 更新任务
  - `deleteTask()`: 删除任务
  - `acceptTask()`: 接受任务
  - `finishTask()`: 完成任务

- **AdminService.java & AdminServiceImpl.java**: 管理员服务
  - `login()`: 管理员登录
  - `updateAdmin()`: 更新管理员信息
  - `addAdmin()`: 添加管理员
  - `getAdminById()`: 根据ID获取管理员

- **SchoolService.java & SchoolServiceImpl.java**: 学校服务
  - `getSchoolList()`: 获取学校列表
  - `getSchoolById()`: 根据ID获取学校
  - `addSchool()`: 添加学校
  - `updateSchool()`: 更新学校信息

- **ProductService.java & ProductServiceImpl.java**: 产品服务
  - `getProductList()`: 获取产品列表
  - `addProduct()`: 添加产品
  - `updateProduct()`: 更新产品
  - `deleteProduct()`: 删除产品

#### 🗄️ 数据访问层 (Mapper层)

- **UserMapper.java & UserMapper.xml**: 用户数据访问
  - SQL映射: 用户CRUD操作
  - 查询方法: 登录验证、信息查询、状态更新

- **TaskMapper.java & TaskMapper.xml**: 任务数据访问
  - SQL映射: 任务CRUD操作
  - 查询方法: 任务列表、状态查询、关联查询

- **AdminMapper.java & AdminMapper.xml**: 管理员数据访问
  - SQL映射: 管理员CRUD操作
  - 查询方法: 登录验证、权限管理

- **SchoolMapper.java & SchoolMapper.xml**: 学校数据访问
  - SQL映射: 学校CRUD操作
  - 查询方法: 学校列表、信息查询

- **ProductMapper.java & ProductMapper.xml**: 产品数据访问
  - SQL映射: 产品CRUD操作
  - 查询方法: 产品列表、信息管理

#### 🛠️ 工具类 (Util层)

- **Const.java**: 常量定义类
  - `ROOT`: 项目根路径
  - `ROOT_ADMIN`: 管理员路径
  - `PAGESIZE`: 分页大小
  - `getFullTime()`: 获取完整时间格式
  - `getTime()`: 获取日期格式
  - `getIds()`: 生成时间戳ID

- **JsonUtil.java**: JSON工具类
  - `object2json()`: 对象转JSON
  - `bean2json()`: Bean转JSON
  - `list2json()`: 列表转JSON
  - `map2json()`: Map转JSON
  - `string2json()`: 字符串转JSON

### 🎨 前端页面结构

- **用户端页面**:
  - `index.jsp`: 首页
  - `login.jsp`: 登录页面
  - `register.jsp`: 注册页面
  - `userIndex.jsp`: 用户主页
  - `userInfo.jsp`: 用户信息页面
  - `userNewtask.jsp`: 发布任务页面
  - `userPtask.jsp`: 我的任务页面
  - `userAtask.jsp`: 接受的任务页面
  - `taskInfo.jsp`: 任务详情页面

- **管理员端页面**:
  - `adminIndex.jsp`: 管理员主页
  - `adminUser.jsp`: 用户管理页面
  - `adminTask.jsp`: 任务管理页面
  - `adminSchool.jsp`: 学校管理页面
  - `adminProduct.jsp`: 产品管理页面

### ⚙️ 配置文件说明

- **applicationContext.xml**: Spring核心配置
  - 数据源配置
  - MyBatis配置
  - 事务管理配置
  - Bean定义

- **springmvc-servlet.xml**: Spring MVC配置
  - 组件扫描配置
  - 视图解析器配置
  - 静态资源映射

- **web.xml**: Web应用配置
  - DispatcherServlet配置
  - 字符编码过滤器
  - 欢迎页面配置

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
