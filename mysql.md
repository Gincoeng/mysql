# MySQL语句规范:

关键字与函数名称要大写;

数据库名称   表的名称   字段名称 全部小写;

SQL语句必须是使用分号结尾;

# 第一天

启动MySQL 服务: sudo service mysql start

登录MySQL服务器: mysql -uroot -p

登出服务器: exit;          quit;       \q;

查看有哪些数据库: show databases;

连接其中一个数据库: use 数据库名字; 

查看数据库中有哪些表: show tables;

查看该表中有什么内容: select * from 表的名字;

# 第二天

创建数据库:  CREATE DATABASE 数据库名字;

创建数据表:  CREATE TABLE  数据表名字 (列名a 数据类型(数据长度), 列名b 数据类型(数据长度), 列名c 数据类型(数据长度));            =====也可采用多行输入的方法 详情看印象笔记中的教程

插入数据: INSERT INTO 列表名(列名a, 列名b, 列名c)  VALUES(值1, 值2, 值3)

# 第三天

删除数据库：DROP DATABASE 数据库名字；

导入下载好的数据库：source   完整路径的文件名；

​                                   例如： source /home/ginchoeng/shiyanlou.sql；

默认约束：

唯一约束：

ID自增：



# 第四天

## SELECT基本语法： SELECT 要查询的列名 FROM   表的名字   WHERE  限制条件；

​								例如：SELECT name,age FROM employee;

​                                        WHERE限制条件 可以有数学符号（=，>,<,等）也可以查找特定名字的那一行。如：

​                                       SELECT name,age FROM employee WHERE name = 'Mary';

​                                   同时，WHERE后面可以不单单只有一条限制，根据条件之间的逻辑限制关系，可以有 条件一AND条件二  或者 条件一OR条件二

​                                   当求解出一个区间的时候，可以用数学表达式 x>a AND x<b;  

​                                   当需要包含边界的时候用  BETWEEN 25 AND 30；

​                                 关键词  IN 和 NOT IN 的作用就是 筛选 在 或 不在 某个范围内的结果（或者说是不是符合条件，值在不在预设里面）

​      如：SELECT name,age,phone,in_dpt FROM employee WHERE in_dpt IN('dpt3','dpt4');

​                               关键字  LIKE  可用于实现模糊查询，常见于搜索功能。搭配通配符使用。

​                                _代表一个未指定字符  %代表不定个未指定字符。

   如：只是忘记了最后两位数字  SELECT name,age,phone FROM employee WHERE phone LIKE '1101__';

​          只记得开头的首字母，忘记了长度 SELECT name,age,phone FROM employee WHERE name LIKE 'J%';





## 排序：对结果进行排序就是要用到关键词 OEDER BY 默认的情况下排序是升序排列 ，使用关键词ASC或者DESC可指定升序还是降序。

  如： SELECT name,age,phone,salary FROM employee ORDER BY salary DESC;



## SQL内置函数和计算： MySQL允许对表中的数据进行计算，其中就有5个内置函数。

​		count函数：可用于任何数据类型，只是计数，如计算出现次数

​		sum函数：数字型数据 求和

​		avg函数： 数字型数据 求平均

​		max，min函数：数值，字符串，日期时间类型  求最大，最小。

​       同时可以使用关键词 AS 可以给值重命名 。

​				如： SELECT MAX(salary) AS max_salary, MIN(salary) FROM employee;这里就是把MAX(salary)重命名为max_salary.



## 

## 子查询与连接查询：

  	想要知道名为Tom的员工所在部门做了几个工程，员工信息在employee中，但工程信息在project中，这个时候要用到

#### 子查询

如： SELECT of_dpt,COUNT(proj_name) AS count_project FROM project GROUP BY of_dpt HAVING of_dpt IN (SELECT in_dpt FROM employee WHERE name='Tom');

这里包含两个SELECT语句，第二个SELECT语句将返回一个集合的数据形式，然后被第一个SELECT语句用in进行判断。

HAVING关键字可以的作用和WHERE是一样的，都是说明加下来要进行条件筛选操作，区别在于HAVING用于对分组后的数据进行筛选。



#### 连接查询

 在处理多个表的时候，子查询只有在结果来自一个表时才有用，但如果需要显示两个表或者多个表中的数据，这时必须使用连接join操作。连接的基本思想是把两个或者多个表当作新的表来操作。

SELECT id,name,people_num FROM employee,department WHERE employee.in_dpt = department.dpt_name ORDER BY id;  这里就包含employee跟department这两个表

另外一种方法就是使用JOIN ON 的方法

SELECT id,name,people_num FROM employee JOIN department ON employee.in_dpt = department.dpt_name ORDER BY id;





