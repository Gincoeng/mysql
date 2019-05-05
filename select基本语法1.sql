CREATE DATABASE mysql_shiyan;

use mysql_shiyan;


CREATE TABLE department
(
	dpt_name char(20) NOT NULL,
	people_num int(10) DEFAULT '10',
	CONSTRAINT dpt_pk PRIMARY KEY(dpt_name)
);


CREATE TABLE employee
(
	id int(10) PRIMARY KEY,
	name char(20),
	age int(10),
	salary int(10) NOT NULL,
	phone int(12) NOT NULL,
	in_dpt char(20) NOT NULL,
	UNIQUE (phone),
	CONSTRAINT emp_fk FOREIGN KEY (in_dpt) REFERENCES department(dpt_name)
);



CREATE TABLE project
(
	proj_num int(10) NOT NULL,
	proj_name char(20) NOT NULL,
	start_date date NOT NULL,
	end_date date DEFAULT '2015-04-01',
	of_dpt char(20) REFERENCES department(dpt_name),
	CONSTRAINT proj_pk PRIMARY KEY (proj_num,proj_name)
);