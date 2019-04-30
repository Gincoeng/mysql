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