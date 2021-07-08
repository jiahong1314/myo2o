#                                  商场管理系统

## 一.实现效果

前端展示

<img src="E:\桌面\QQ图片20210613224403.png" style="zoom:67%;" />

<img src="E:\桌面\QQ图片20210613224319.png" style="zoom:67%;" />

后端商铺管理

<img src="E:\桌面\QQ图片20210613224339.png" style="zoom:67%;" />

<img src="E:\桌面\QQ图片20210613224346.png" style="zoom:67%;" />



## 二. 项目实现过程

### 1.创建maven项目，搭建ssm框架

###  2.数据库搭建

使用mysql数据库

### 3.创建实体类

![](E:\桌面\软件工程o2o项目\实体类.PNG)

每个实体类创建了相应得dto类，返回操作结果。

dto不算是独立一层，只是为了输出到前端时使用。

你可以当是 entity 是数据库的模型映射，它的属性跟数据库的字段是一一对应的，dto 却是由业务决定的，可能是用于整合信息，也可能是精简信息。

整合信息。有时候，一个entity实体并不足以满足前端的业务，比如你现在做统计业务，总和啊，平均值啊，最大值，最小值之类的，entity 一般是没有这些的。
你各种计算整合之后，建了一个新的实体(dto)存放这些整合之后的信息，返回给前端使用。
又或者你想在前端显示一些资料，这些资料是关联多个表查询出来的，如果你不新建别的实体来整合这些信息，用任何一个entity，你都满足不了，还是得用一个新的实体整合这些信息，再输出给前端。

精简信息。我本来是想在资料卡片看看这个用户的姓名啊，昵称啊，性别啊，个性签名啊，就够了。这时候你用entity却是连我的密码，银行卡资料都暴露了。
所以，用dto存储你需要展示的信息，别的一个都不给，给前端返回这个dto。

### 3.enum 枚举类

设置操作结果返回类型

### 4.dao层

Dao层主要是做数据持久层的工作，负责与数据库进行联络的一些任务都封装在此

- Dao层的设计首先是设计Dao的接口；
- 然后在Spring的配置文件中定义此接口的实现类；
- 然后就可在模块中调用此接口来进行数据业务的处理，而不用关心此接口的具体实现类是哪个类，显得结构非常清晰；
- Dao层的数据源配置，以及有关数据库连接的参数都在Spring的配置文件中进行配置。

#### 5.service层

Service层主要负责业务模块的逻辑应用设计

- 首先设计接口，再设计其实现的类；
- 接着在Spring的配置文件中配置其实现的关联，这样就可以在应用中调用Service接口来进行业务处理；
- Service层的业务实现，具体要调用到已定义的Dao层的接口；
- 封装Service层的业务逻辑有利于通用的业务逻辑的独立性和重复利用性，程序显得非常简洁。

### 6.controller层

Controller层负责具体的业务模块流程的控制

- 在此层里面要调用Service层的接口来控制业务流程；
- 控制的配置也同样是在Spring的配置文件里面进行，针对具体的业务流程，会有不同的控制器，在具体的设计过程中可以将 流程进行抽象归纳，设计出可以重复利用的子单元流程模块，这样不仅使程序结构变得清晰，也大大减少了代码量。

### 7.view层

View层主要负责前台JSP页面的表示

### 8.spring整合dao

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:context="http://www.springframework.org/schema/context"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
    http://www.springframework.org/schema/beans/spring-beans.xsd
    http://www.springframework.org/schema/context
    http://www.springframework.org/schema/context/spring-context.xsd">
	<!-- 配置整合mybatis过程 -->
	<!-- 1.配置数据库相关参数properties的属性：${url} -->
	<context:property-placeholder location="classpath:jdbc.properties"/>
	<!-- 2.数据库连接池 -->
	<bean id="dataSource" class="com.mchange.v2.c3p0.ComboPooledDataSource">
		<!-- 配置连接池属性 -->
		<property name="driverClass" value="${jdbc.driver}" />
		<property name="jdbcUrl" value="${jdbc.url}" />
		<property name="user" value="${jdbc.username}" />
		<property name="password" value="${jdbc.password}" />

		<!-- c3p0连接池的私有属性 -->
		<property name="maxPoolSize" value="30" />
		<property name="minPoolSize" value="10" />
		<!-- 关闭连接后不自动commit -->
		<property name="autoCommitOnClose" value="false" />
		<!-- 获取连接超时时间 -->
		<property name="checkoutTimeout" value="10000" />
		<!-- 当获取连接失败重试次数 -->
		<property name="acquireRetryAttempts" value="2" />
	</bean>

	<!-- 3.配置SqlSessionFactory对象 -->
	<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
		<!-- 注入数据库连接池 -->
		<property name="dataSource" ref="dataSource" />
		<!-- 配置MyBaties全局配置文件:mybatis-config.xml -->
		<property name="configLocation" value="classpath:mybatis-config.xml" />
		<!-- 扫描entity包 使用别名 -->
		<property name="typeAliasesPackage" value="com.hong.entity" />
		<!-- 扫描sql配置文件:mapper需要的xml文件 -->
		<property name="mapperLocations" value="classpath:mapper/*.xml" />
	</bean>

	<!-- 4.配置扫描Dao接口包，动态实现Dao接口，注入到spring容器中 -->
	<bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
		<!-- 注入sqlSessionFactory -->
		<property name="sqlSessionFactoryBeanName" value="sqlSessionFactory" />
		<!-- 给出需要扫描Dao接口包 -->
		<property name="basePackage" value="com.hong.dao" />
	</bean>
</beans>
```



### 9.整合service

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xmlns:context="http://www.springframework.org/schema/context"
    xmlns:tx="http://www.springframework.org/schema/tx"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
    http://www.springframework.org/schema/beans/spring-beans.xsd
    http://www.springframework.org/schema/context
    http://www.springframework.org/schema/context/spring-context.xsd
    http://www.springframework.org/schema/tx
    http://www.springframework.org/schema/tx/spring-tx.xsd">
    <!-- 扫描service包下所有使用注解的类型 -->
    <context:component-scan base-package="com.hong.service" />

    <!-- 配置事务管理器 -->
    <bean id="transactionManager"
        class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
        <!-- 注入数据库连接池 -->
        <property name="dataSource" ref="dataSource" />
    </bean>

    <!-- 配置基于注解的声明式事务 -->
    <tx:annotation-driven transaction-manager="transactionManager"/>
</beans>
```



### 10.整合controller

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:context="http://www.springframework.org/schema/context"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
    http://www.springframework.org/schema/beans/spring-beans.xsd
    http://www.springframework.org/schema/context
    http://www.springframework.org/schema/context/spring-context.xsd
    http://www.springframework.org/schema/mvc
    http://www.springframework.org/schema/mvc/spring-mvc-3.2.xsd">
	<!-- 配置SpringMVC -->
	<!-- 1.开启SpringMVC注解模式 -->
	<!-- 简化配置： (1)自动注册DefaultAnootationHandlerMapping,AnotationMethodHandlerAdapter 
		(2)提供一些列：数据绑定，数字和日期的format @NumberFormat, @DateTimeFormat, xml,json默认读写支持 -->
	<mvc:annotation-driven />

	<!-- 2.静态资源默认servlet配置 (1)加入对静态资源的处理：js,gif,png (2)允许使用"/"做整体映射 -->
	<mvc:resources mapping="/resources/**" location="/resources/" />
	<mvc:default-servlet-handler />

	<!-- 3.定义视图解析器 -->
	<bean id="viewResolver"
		class="org.springframework.web.servlet.view.InternalResourceViewResolver">
		<property name="prefix" value="/WEB-INF/html/"></property>
		<property name="suffix" value=".html"></property>
	</bean>
	<!-- 文件上传解析器 -->
	<bean id="multipartResolver"
		  class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
		<property name="defaultEncoding" value="utf-8"></property>
		<property name="maxUploadSize" value="20971520"></property><!-- 最大上传文件大小 -->
		<property name="maxInMemorySize" value="20971520"></property>
	</bean>

	<!-- 4.扫描web相关的bean -->
	<context:component-scan base-package="com.hong.web" />

</beans>
```



## 三.开发难点解决

### 1.图片上传处理

### 2.前端页面编写

### 3.部署服务器

```
  <Context path="/myo2o_war" docBase="myo2o_war" debug="0" privileged="true"/>
	<Context path="/upload" docBase="/home/xiangze/image/upload" reloadable="true"/>

```

