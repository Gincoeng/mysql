CREATE DATABASE mysql_shiyan;



use mysql_shiyan;

------

CREATE TABLE department

(

​	dpt_name char(20) NOT NULL,

​	people_num int(10) DEFAULT '10',      #people_num有默认约束，默认值为10

​	CONSTRAINT dpt_pk PRIMARY KEY (dpt_name)

);

------



CREATE TABLE employee

(

​	id int(10) PRIMARY KEY,

​	name char(20),

​	age int(10),

​	salary int(10) NOT NULL,    #NOT NULL 就是非空约束 在插入值时必须非空

​	phone int(12) NOT NULL,

​	in_dpt char(20) NOT NULL,

​	UNIQUE (phone),     #这里有UNIQUE约束，phone的值唯一，整个数据表中不能出现相同的

​	CONSTRAINT emp_fk FOREIGN KEY (in_dpt) REFERENCES department(dpt_name)

​      #以上的是 FOREIGN KEY 外键约束，表现出表与表之间的关系 一个表可以有多个外键，每个外键必须REFERENCE另一个表的主键，被外键约束的列，取值必须在它的参考的列中有对应值。

);

------

CREATE TABLE project

(

​	proj_num int(10) NOT NULL,

​	proj_name char(20) NOT NULL,

​	start_date date NOT NULL,

​	end_date date DEFAULT '2015-04-01',

​	of_dpt char(20) REFERENCES department(dpt_name),

​	CONSTRAINT proj_pk PRIMARY KEY (proj_num,proj_name)

);

