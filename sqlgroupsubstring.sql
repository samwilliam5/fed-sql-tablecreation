show databases;

create database employee;

use employee;

create table employee_list (
id int not null auto_increment,
name varchar(100),
age int(3),
location varchar(100),
primary key(id)
);

insert into employee_list(name,age,location)
value('sam william doss',28,'Madurai');

select * from employee_list;

select substring(name,1,3), substring(age,1),substring(location,1,4) from employee_list;

select concat(name,'',location) from employee_list;

select location,count(*) from employee_list;

select location ,count(*) from employee_list group  by location;

select location, min(age) from employee_list group by location;



