# Employee storage service for companies

Simple CRUD application using Spring MVC and Hibernate. I used MySQL as database and Maven as a build tool for the project. Our Application is Employee 
Storage Service where you can view or search employee, create new empoloyee, edit or delete existing employee.

## Tools and Technologies used  

Spring 4.1.5 RELEASE, Hibernate 4.3.8 Final, MySQL 5.7, Java 8, Intellij IDEA, Tomcat 8, Maven 3

### Follow the steps mentioned below to develop this application.
Step 1: Create Database Table
Create database EMP_DB in MySQL. SQL statement to create the table is given below.
```
CREATE TABLE `EMP_TBL` (   
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `fname` varchar(45) NOT NULL,
   `lname` varchar(45) NOT NULL,
   `email` varchar(45) NOT NULL,
   `address` varchar(45) NOT NULL,
   `salary` varchar(45) NOT NULL,
   `comid` varchar(45) NOT NULL,
   PRIMARY KEY (`id`) 
)  ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8
```

Step 2: Create Dynamic Web Project in Maven
To create dynamic web project with maven, navigate to the folder where you want to create the project and execute following command in 
Command Prompt.

```
mvn archetype:generate -DgroupId=com.jwt.spring -DartifactId=SpringMVCHibernateCRUD -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false
```
Step 3: Now Import the project into IDEA and add the project dependency in pom.xml

Step 4: Declaring database and hibernate properties
Create application.properties file under resources folder and define databse and hibernate configuration information in this

```
#Database related properties
database.driver=com.mysql.jdbc.Driver
database.url=jdbc:mysql://localhost:3306/spring
database.user=root
database.password=12345

#Hibernate related properties
hibernate.dialect=org.hibernate.dialect.MySQLDialect
hibernate.show_sql=true
hibernate.format_sql=true
hibernate.hbm2ddl.auto=update
```
Step 4: Create Deployment Descriptor (web.xml)
```
<!DOCTYPE web-app PUBLIC
 "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
 "http://java.sun.com/dtd/web-app_2_3.dtd" >

<web-app>
  <display-name>EBF CRUD Test Task Spring MVC</display-name>

  <context-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>/WEB-INF/spring-servlet.xml</param-value>
  </context-param>
  <listener>
    <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
  </listener>
  <servlet>
    <servlet-name>spring</servlet-name>
    <servlet-class>
      org.springframework.web.servlet.DispatcherServlet
    </servlet-class>
    <load-on-startup>1</load-on-startup>
  </servlet>

  <servlet-mapping>
    <servlet-name>spring</servlet-name>
    <url-pattern>/</url-pattern>
  </servlet-mapping>
</web-app>
```
Step 5: Create Spring Configuration File (spring-servlet.xml)
```
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tx="http://www.springframework.org/schema/tx"
	xmlns:mvc="http://www.springframework.org/schema/mvc" xmlns:context="http://www.springframework.org/schema/context"
	xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
       http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx.xsd
       http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc.xsd
       http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd">

	<!-- Specifying base package of the Components like Controller, Service, 
		DAO -->
	<context:component-scan base-package="com.jwt" />

	<!-- Getting Database properties -->
	<context:property-placeholder location="classpath:application.properties" />

	<mvc:annotation-driven />

	<!-- Specifying the Resource location to load JS, CSS, Images etc -->
	<mvc:resources mapping="/resources/**" location="WEB-INF" />

	<!-- View Resolver -->
	<bean
		class="org.springframework.web.servlet.view.InternalResourceViewResolver">
		<property name="prefix" value="/WEB-INF/pages/" />
		<property name="suffix" value=".jsp" />
	</bean>

	<!-- DataSource -->
	<bean class="org.springframework.jdbc.datasource.DriverManagerDataSource"
		id="dataSource">
		<property name="driverClassName" value="${database.driver}"></property>
		<property name="url" value="${database.url}"></property>
		<property name="username" value="${database.user}"></property>
		<property name="password" value="${database.password}"></property>
	</bean>

	<!-- Hibernate SessionFactory -->
	<bean id="sessionFactory"
		class="org.springframework.orm.hibernate4.LocalSessionFactoryBean">
		<property name="dataSource" ref="dataSource"></property>
		<property name="hibernateProperties">
			<props>
				<prop key="hibernate.dialect">${hibernate.dialect}</prop>
				<prop key="hibernate.hbm2ddl.auto">${hibernate.hbm2ddl.auto}</prop>
				<prop key="hibernate.format_sql">${hibernate.format_sql}</prop>
				<prop key="hibernate.show_sql">${hibernate.show_sql}</prop>
			</props>
		</property>
		<property name="packagesToScan" value="com.jwt.model"></property>
	</bean>

	<!-- Transaction -->
	<bean id="transactionManager"
		class="org.springframework.orm.hibernate4.HibernateTransactionManager">
		<property name="sessionFactory" ref="sessionFactory" />
	</bean>

	<tx:annotation-driven transaction-manager="transactionManager" />
</beans>
```

Step 6 : Create java directory :
Create a folder named 'java' under main."/src/main" and add this folder to the class path of the project in eclipse / add module dependencies in Idea.

Step 7: Create Persistence Layer - Employee.java

Step 8: Create DAO Layer - EmployeeDao.java, EmployeeDaoImpl.java
Data access layer of our application consist of EmployeeDao Interface and its implementation EmployeeDaoImpl class. 

Step 9: Create Service Layer - EmployeeService.java, EmployeeServiceImpl.java
Service layer also consist of one Service interface EmployeeService and its implementation class EmployeeServiceImpl.java.

Step 10: Create Controller Layer
Now create a spring mvc controller class which will have all the method we need for our CRUD operations.

Step 11: Create Employee Listing Page (Home Page)
Create jsp file named home.jsp inside "src\main\webapp\WEB-INF\pages" directory of the project. home.jsp page displays the employee list
as well as action links for creating new, editing and deleting an employee data. 

Step 12: Creating Employee Forms Page
Create jsp file named EmployeeForm.jsp inside "src\main\webapp\WEB-INF\pages" directory of the project. 
EmployeeForm.jsp displays details of a employee for creating new or updating old one.

Output:
Now lets hit http://localhost:8080/ URL to get initial screen.
