show databases;

create database mobile;

use mobile;

show tables;

-- create table varchar 255, text 60000, int 2billion, tinyint boolean 0 1 ,bigint,default current_timestamp datetime
create table mobile_list (
id int not null auto_increment,
name varchar(100),
price int,
offer int,
color varchar(50),
primary key (id)
);

select * from mobile_list;

-- insert table 
insert into mobile_list(name,price,offer,color)
value('Poco X3 Pro',20000,20,'Red'),
('Poco X3 ',19000,21,'White'),
('RealMe 9 Pro',21000,22,'Black'),
('RealMe 9',17000,15,'Green'),
('Asus Zenfone 5Z',25000,30,'Grey');


-- alter and modify column
alter table mobile_list add column ratings float(5) after color;
alter table mobile_list modify column ratings float(10);

-- change table heading name;
alter table mobile_list rename column color to COLOR;
alter table mobile_list rename column rating to RATING;

-- drop column AND alter column
alter table mobile_list add column age int after ratings;
alter table mobile_list drop column age ;

-- update
update mobile_list set ratings=4.5 where id=1;
update mobile_list set ratings=4.4 where id=2;
update mobile_list set ratings=4.3 where id=3;
update mobile_list set ratings=4.2 where id=4;
update mobile_list set ratings=4.6 where id=5;

UPDATE mobile_list 
SET name = upper(name) ;

-- rename table  heading 
alter table mobile_list rename column ratings to RATING;
alter table mobile_list rename column id to ID;
alter table mobile_list rename column name to NAME;
alter table mobile_list rename column price to PRICE;
alter table mobile_list rename column offer to OFFER;

-- where and operators types
select * from mobile_list where price>23000 and offer=30;
select * from mobile_list where price>=21000 or offer=30;

-- replace or operators as  in for easy
select * from mobile_list where offer in (20,30);

-- aggregate function count how many price we have
select count(price) from mobile_list;

-- aggregate function max min sum avg
select max( price) from mobile_list ;
select min( price) from mobile_list ;
select sum( price) from mobile_list;
select avg( price) from mobile_list ;

-- find 2nd max price
select  max( price) from mobile_list  where price< (select max(price) from mobile_list);
-- find 2nd min price
select min( price) from mobile_list where price>(select min(price) from mobile_list);

-- order by ascending descending
select name,price,offer,color from mobile_list
order by name asc,price desc,color asc, offer asc;

-- distinct gives unique price block repeated price
select count(distinct price)  from mobile_list;

-- ranges between
select * from mobile_list where price between 15000 and 20000;

-- like not like
select * from mobile_list where COLOR like '%ed';
select * from mobile_list where COLOR not like '%ed';

-- create index
create index lindex on mobile_list(name);

-- drop index
drop index lindex on mobile_List;



-- concat
select concat(name,'', color) as ncolor from mobile_List;
select concat(color,'',name) as colorn from mobile_List;



-- create table with forign key link to primary 
create table posts(
id int not null auto_increment,
user_id int,-- foreign key
primary key(id),
foreign key (user_id) references mobile_list(id),
title varchar(100),
body text,
publish_date datetime default current_timestamp
);


-- insert
insert into posts(user_id,title,body)
value(1,'Post One','This is Post One'),
(2,'Post Two','This is Post Two'),
(3,'Post Three','This is Post Three');

select * from posts;



-- join get data from 2 differnt table
-- inner join return row when they matches in both table 
-- left join returns all row from left table even there is no match in right table
-- right join returns all row from right table even there is no match in left table

-- inner join

select 
mobile_list.name,
mobile_list.color,
posts.title,
posts.body,
posts.publish_date
from mobile_list
inner join posts
on mobile_list.id=posts.user_id
order by posts.title;

-- comments 2 forign key

create table comments(
id int not null auto_increment,
primary key(id),
post_id int,-- foreign key
user_id int,-- foreign key
body text,
publish_date datetime default current_timestamp,
foreign key(post_id) references posts(id),
foreign key(user_id) references mobile_list(id)
);

insert into comments(post_id,user_id,body)
value(1,3,'This is comment One'),
(2,1,'This is comment Two'),
(3,2,'This is comment Three');

select * from comments;

-- left join
select
mobile_list.name,
posts.title,
comments.body
from comments
left join posts on posts.id=comments.post_id
inner join  mobile_list on mobile_list.id=comments.user_id
order by posts.title;









