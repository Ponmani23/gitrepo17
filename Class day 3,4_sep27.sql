use sep26;
show tables;
-- creating parent table with primry key
create table dept(dept_id int primary key, dept_name varchar(20));
insert into dept values(101, 'Hr'),(102,'Admin'),(103,'Sales'),(104,'Development');
select * from dept;
-- create child table with foreign key refererring to parent table --
create table emp (emp_id int primary key, emp_name varchar(20), emp_salary int, dept_id int, 
foreign key(dept_id) references dept(dept_id));
insert into emp values(0001, 'Ranjith',28000,103),(0002,'Karthik',32500,101),(0003,'Praneetha',31680, 102),
(0004,'Varsha',34589,104);
insert into emp values(0006, 'Varsha',33000,103);
select * from emp;
-- to check primary key constraint ---
insert into emp values(0005, 'Venu', 35680, 108);
-- fetch records from both parent and child table --
select emp.emp_name, emp.emp_salary,dept.dept_name from emp,dept
where emp.dept_id=dept.dept_id;
-- Assigning alias name --
select e.emp_name, e.emp_salary,d.dept_name from emp as e, dept as d
where e.dept_id =d.dept_id;
-- or 
select e.emp_name, e.emp_salary,d.dept_name from emp e, dept d
where e.dept_id =d.dept_id;
select emp_salary as September_Salary from emp;
-- where clause with operators <,<=,>,>=,<>,!=,= --
select emp_name,emp_salary from emp where emp_salary < 30000;
select emp_name,emp_salary from emp where emp_salary <= 30000;
select emp_name,emp_salary from emp where emp_salary > 30000;
select emp_name,emp_salary from emp where emp_salary >= 30000;
select emp_name,emp_salary from emp where emp_salary <> 30000;
select emp_name,emp_salary from emp where emp_salary = 31680;
-- and with where clause --
select emp_name,emp_salary from emp where emp_salary = 31680 and dept_id=102;
select emp_name,emp_salary from emp where emp_salary > 30000 and dept_id=102;
-- or 
select emp_name,emp_salary from emp where emp_salary > 30000 or dept_id=102;
-- not with where clause --
select * from emp;
select emp_name,emp_salary from emp where not dept_id=102;
-- to display the records in ascending or descending order -- use 'order by'
select * from emp order by emp_name;
select * from emp order by emp_salary desc;
-- to fetch the record between a certain range -- use 'between'
select * from emp where emp_salary between 32000 and 35000;
select * from emp where emp_name between 'k' and 'q';
-- to fetch records by specifying more than values
select * from emp where dept_id in(101,104,103);
-- using keywords in,between,order by along with where clause --
select * from emp where dept_id in(101,104,103) and emp_salary 
between 31000 and 35000 order by emp_salary desc;
-- like
select * from emp;
select * from emp where emp_name like 'k%';
select * from emp where emp_name like '%a';
select * from emp where emp_name like '%nj%';
select * from emp where emp_name like '_a_____';


-- examples
select * from emp;
select dept_id, emp_name from emp group by dept_id,emp_name;
SELECT SUM(emp_salary) AS total_salary FROM emp;
SELECT count(dept_id) AS employee_dept FROM emp;



SELECT dept_id,
       COUNT(*) AS employee_count,
       SUM(salary) AS total_salary,
       AVG(salary) AS average_salary,
       MIN(salary) AS minimum_salary,
       MAX(salary) AS maximum_salary
FROM emp
GROUP BY dept_id;








