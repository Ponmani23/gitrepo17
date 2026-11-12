use sep26;
show tables;
desc emp;
select * from dept;
select * from emp;
insert into emp values(7,"Prajith", 32000, 102), (8, "Abi", 28700, 101),
(9,"Cary",29500, 104), (10, "David", 22780, 101),
(11,"Nivetha",29600,103);
-- aggregate functions---------------------------------
-- sum,avg,min, max, count-----------------------------
select sum(emp_salary) from emp;
select sum(emp_salary) as Oct_Sum_Salary from emp;
select min(emp_salary) as Minimum_Salary from emp;
select sum(emp_salary) as dep1_101_Sal from emp where dept_id=101;
select avg(emp_salary) as dep1_102_Sal from emp where dept_id=102;
select count(emp_id) as emp_count_103 from emp where dept_id=103;
-- group by ------------------------------------------------------
select dept_id,sum(emp_salary) as dept_Salary from emp 
group by dept_id;
select dept_id,sum(emp_salary) as dept_Salary from emp 
group by dept_id order by sum(emp_salary) desc;
-- fetch the count of employees, avg salary, min & max salary from each department----
select dept_id, count(emp_id) as No_of_emp_dept from emp group by dept_id;
select dept_id, avg(emp_salary) as Avg_salary_dept from emp group by dept_id;
select dept_id, max(emp_salary) as Avg_salary_dept from emp group by dept_id;
select dept_id, min(emp_salary) as Avg_salary_dept from emp group by dept_id;
-- to filter the records after grouping use having clause-------------------
select dept_id, avg(emp_salary) as Avg_salary_dept from emp group by dept_id 
having avg(emp_salary)>30000;
-- fetch the department which is having more than 2 employees--------------
select dept_id, count(*) as No_of_emp_dept from emp group by dept_id 
having count(*)>2;
-- order by with limit and offset--------------------------------------
-- to fetch the top 3 salary employees---------------------------------
select * from emp order by emp_salary desc limit 3;
select * from emp order by emp_salary desc limit 4;
-- to fetch the records from 4th top salary to the next 3 top salary
select * from emp order by emp_salary desc limit 3 offset 3;
-- sub query-------------------------------------------------
-- to fetch who is getting the salary than the average salary----------
select * from emp where emp_salary>(select avg(emp_salary) from emp);
-- window functions----rank()------ to give ranking--------------------
select emp_name, emp_salary, rank() over(order by emp_salary desc) as Salary_Rank
 from emp;
 select * from emp;
 insert into emp values(12, "Raveena",34589,104);
 -- dense_rank()----------------------------------------------------------------
 select emp_name, emp_salary, dense_rank() over(order by emp_salary desc) as Salary_Rank
 from emp;
 -- to give ranking for each department--------------------------------------
 select dept_id,emp_name, emp_salary, rank() over(partition by dept_id order by emp_salary desc)
 as Salary_Rank_dept  from emp;
 -- to modify the data type of a column-------------------------------------------
 alter table emp modify column emp_salary decimal(20,2);
 desc emp;
 alter table emp rename column emp_name to employee_name;
 -- to add a ne column in an existing table-----------------
 alter table emp add column emp_desg varchar(20);
 select * from emp;
 select * from dept;
 -- to add values into the new added column---------------------------
 update emp set emp_desg = "Sales EX" where emp_id=1;
 -- to insert values using single update command-------------------------
 update emp set emp_desg = case emp_id
	when 2 then "HR Recruiter"
    when 3 then "Front Off EX"
    when 4 then "Front off EX"
    when 6 then "Customer Care"
    when 7 then "Help Desk EX"
    when 8 then "HR Reporting Off"
    when 9 then "Programmer"
    when 10 then "HR Manager"
    when 11 then "Sales Rep"
    when 12 then "Programmer"
 end where emp_id between 2 and 12;
 show tables;
 select * from product_dataset;
 select * from sales_dataset;
 -- joins-------------------------------------------
 -- to fetch the matching records from both the tables using inner join-------
 -- execution order-->from-->inner join-->on-->select
 select p.productid,p.productname,p.unitprice, s.customername,s.salesamount
 from product_dataset as p inner join sales_dataset as s on 
 p.productid=s.productid;
 -- left join 
 select p.productid,p.productname,p.unitprice, s.customername,s.salesamount
 from product_dataset as p left join sales_dataset as s on 
 p.productid=s.productid;
 -- right join 
 select p.productid,p.productname,p.unitprice, s.customername,s.salesamount
 from product_dataset as p right join sales_dataset as s on 
 p.productid=s.productid;
 -- full outer join
 select p.productid,p.productname,p.unitprice, s.customername,s.salesamount
 from product_dataset as p left join sales_dataset as s on 
 p.productid=s.productid union select p.productid,p.productname,p.unitprice, s.customername,s.salesamount
 from product_dataset as p right join sales_dataset as s on 
 p.productid=s.productid;
 -- ------------------------------------------------
 show tables;
 select * from clothes_dataset;
 select * from colors_dataset;
 select * from employee_dataset;
 -- self join ---> connects to its own table---------------
 select e.emp_name as employee, m.emp_name as manager from employee_dataset as e join
 employee_dataset as m on m.emp_id =e.manager_id;
 -- cross join
 select cl.product_name, clr.color_name from clothes_dataset as cl cross join 
 colors_dataset as clr;