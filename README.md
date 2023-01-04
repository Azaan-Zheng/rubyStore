# BaoTao电子商城设计文档

已部署的项目当中提供以下用户帐号供测试，您也可以自行注册账号：

- 管理员账号

  ```
  用户名：admin
  密码：rubyonrails
  ```

- 普通用户账号

  ```
  用户名：user1
  密码：12345678
  ```

  

## 功能简介

### 管理员

- 添加、删除、查看、编辑商品
- 查看所有订单列表
- 处理订单（发货/删除）

### 普通用户

- 浏览商品列表 ：查看商品详情
- 添加到购物车
- 购物车内容生成订单
- 查看自己的订单列表
- 订单操作（下单、撤销订单、确认收货）
- 添加商品到收藏夹
- 浏览收藏夹
- 将商品从收藏夹删除



## 使用说明

### 登录注册

本商城默认第一个注册用户为管理员，后续注册用户为普通用户，这样使得初始数据库可以不用保存预设值。

由于时间所限，没有提供邮件发送服务，因此暂时不能找回密码。

### 主界面

对于管理员，商城主界面标题栏右侧有三个操作按钮，分别为：商品大厅、订单中心、退出登录。

对于普通用户，商城主界面标题栏右侧有三个操作按钮，分别为：购物大厅、个人中心、退出登录。

主界面下方默认进入是商品大厅/购物大厅，随着不同页面的切换而改变。

### 商品大厅（购物大厅）

对于管理员而言，商品大厅可以查看、筛选所需的商品。可以通过上方的筛选框，在不同类别中选择想要查看的类别，点击筛选按钮之后，商品列表即发生变化。管理员可以新增商品，这需要点击新增商品按钮，然后进入新增商品页面。

对于普通用户而言，购物大厅同样可以查看、筛选所需的商品。

对于每一个商品项，都展示了商品的图片、简介和价格。右侧提供了操作按钮，对于管理员可以点击按钮进行编辑，对于普通用户可以点击收藏或者加入购物车。当用户鼠标悬浮于商品项时，将浮出按钮，用户点击即可查看商品详情。

### 新建商品

新建商品需要填写新建商品表单，其中需要注意填写互联网可以访问的图片链接，否则图片不能访问。

### 编辑商品

需要注意的事项和新建商品相同。

### 商品详情

在商品详情页中，可以查看商品的详细信息，同时对商品进行操作。

管理员可以选择编辑商品或下架商品，但是如果用户与商品有收藏等关系则不能下架。

普通用户可以将商品添加到购物车，一次添加过程相当于数量加1，如果多次添加到购物车数量会对应增加。普通用户也可以将商品添加到收藏夹。

### 个人中心

普通用户可以在个人中心中查看自己的购物车、收藏夹、订单记录。

### 我的购物车

普通用户进入购物车可以对购物车的商品进行结算，也可以清空购物车。

结算商品时将进入新建订单页面。

### 新建订单

新建订单需要填写收件人和支付方式等信息，新建订单成功后即可等待发货。

### 我的收藏夹

用户可以通过个人中心进入收藏夹查看自己收藏的商品，也可以将其加入购物车或者取消收藏。

### 订单中心（我的订单）

管理员可以在订单中心查看所有用户的订单记录，并点击进行详情察看。

用户可以在我的订单界面查看所有自己的订单记录，同样可以查看详情。

### 订单详情

可以查看订单的所有信息，包括下单方，接收方，以及订单中的商品列表。

普通用户和管理员可以更新订单的状态，具体来说，未发货前用户可以撤销订单，管理员可以确认发货，此时订单将进入待收货状态，在此之后普通用户可以选择确认收货，此时订单将进入已完成状态。在整个过程中，管理员都可以删除订单。



## 结构说明

### 实体类

#### 用户

- 属性：用户名，用户类型（管理员/普通用户），密码，邮箱，手机号
- 关系：包含一个购物车，包含一个收藏夹，包含多个订单；对应在订单项和收藏项

#### 商品

- 属性：商品名，商品类型（内置暂定8种），商品详细信息，图片链接
- 关系：对应多个收藏项，对应多个订单项

#### 购物车

- 关系：属于一个用户，包含多个订单项

#### 订单项（购物车和订单公用）

- 属性：数量

- 关系：关联一个用户和一个商品

#### 订单

- 属性：下单时间，订单状态（内置暂定3种），订单收件人，收件人地址，收件人联系方式，支付方式
- 关系：属于一个用户，对应多个订单项

#### 收藏夹

- 关系：属于一个用户，包含多个订单项

#### 收藏项

- 关系：关联一个用户和一个商品



### 不足与展望

本次电子商城开发，让我充分体会到rails作为敏捷开发和增量式开发的优势，在时间有限的情况下体现了极高的开发效率。但是短时间开发的大作业在功能上还有不完善之处，比如订单支付的处理，购物车的商品选择和管理员管理功能的不够细分等等。在开发大作业的过程中，教材《Web开发敏捷之道》给了我很多启发，在书中所实现的邮件管理、国际化语言环境等功能以及测试代码部分都是我目前还没有做到的，后续希望针对这些还可以有进一步的实现。









