-- to show available databases --
show databases;
-- write comment statement--
-- to create a new database --
create database sep26;
-- to tell in which database the table has to be created --
use sep26;
-- to create a table --
create table employee(empid int, empname varchar(30),
empsalary decimal(6,2), empjoindate date);
-- to see the structure of the table --
desc employee;
-- to insert one single record into the table --
insert employee values (101, 'Ramya', 2500.12, '2026-06-10');
-- to insert more than record at a time --
insert into employee values (102, 'siva',2600.12, '2026-06-11'),
(103,'Kavya',1234.34,'2026-06-12'),(103,'Priya',4356.78,'2026-07-23');
-- to display all the records stored in the table --
select * from employee;
-- to display the distinct columns --
select empname, empsalary from employee;
-- to delete one record --
delete from employee where empid=101;
-- to modify the data type of a column --
alter table employee modify empsalary decimal(10,2);
insert into employee values (105, 'Abi',26000.12, '2026-06-13');
-- create a table with following columns --
-- table name sales
-- salesid not null
-- custmail unique
-- custage >=18
-- customer place , default 'coimbatore'
create table sales(salesid int not null, custmail varchar(100) unique, 
custage int check(custage>=18), custloc varchar(30) default 'Coimbatore');
insert into sales values(1001,'ranjith@gmail.com', 27, 'Chennai');
select * from sales;
-- to check null constraint
insert into sales values(null,'priya@gmail.com', 27, 'Chennai');
-- to check unique constraint
insert into sales values(1002,'ranjith@gmail.com', 26, 'Trichy');
-- to check the check constraint
insert into sales values(1003,'karthik@gmail.com', 17, 'Chennai');
-- to check the default constraint
insert into sales values(1004,'renu@gmail.com', 27, default);
-- to delete all the records in a table, but the structure remains --
select * from sales;
truncate table sales;
desc sales;
-- to delete the table completely including the structure --
drop table sales;
-- to display all the avilable tables in a particular --
show tables;
