show databases;

create database smartphone;

use smartphone;

create table smartphone(
id int not null auto_increment,
name varchar(100),
color varchar(50),
price int,
offer int,
viewedon datetime default current_timestamp,
primary key(id)
);


select * from smartphone;

insert into smartphone (name,color,price,offer)
value('Asus 5Z','Red',20000,22);


-- column heading update
alter table smartphone rename column viewedon  to VIEWED_ON;

-- add colum 
alter table smartphone add column  RATINGS int after offer ;

-- column char change
alter table smartphone modify column RATINGS float;

-- update column
update smartphone set ratings=4.1 where id=10;

-- drop column
alter table smartphone add column  age int  after id;
alter table smartphone drop column age;

-- drop row
delete from smartphone where id=11;

-- opeators
select * from smartphone where price >=19000;
select * from smartphone where price >19000 and color='red';
select * from smartphone where price=19000 or price=2000;
select * from smartphone where price in(19000,20000);
select * from smartphone where price not in(19000,20000);

-- min max avg sum count
select max(price)  from smartphone;
select min(price)  from smartphone;
select avg(price)  from smartphone;
select sum(price)  from smartphone;
select count(name)  from smartphone;


-- 2nd max price
select max(price)  from smartphone where  price< (select  max(price) from smartphone);

-- 2nd low price
select min(price)  from smartphone where  price> (select  min(price) from smartphone);


-- distict is a unique
select distinct color from smartphone;

