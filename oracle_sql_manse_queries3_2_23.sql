select * from CUSTOMER
select * from product
select * from sales
select * from sales_history
select * from SALESPERSON
desc sales
--QUERIES
--1.display the name of employees along with their annual salary (sal*12) the name of the employee earning highest annual salary should appear  first
select emp_name,emp_salary,(emp_salary * 12) 
as annual_salary 
from emp 
order by annual_salary desc;


--Q:2)Display name,salary,Hra,pf,da,TotalSalary for each employee.
--The out put should be in the order of total salary ,hra 15% of salary , DA 10% of salary .
--pf 5% salary Total Salary will be (salary+hra+da)-pf?
select emp_name,emp_salary,emp_salary*0.15 hra,emp_salary*0.10 da,emp_salary*5/100 pf,
emp_salary+(emp_salary*0.15)+(emp_salary*0.10)-(emp_salary*.05)  total_salary
from emp
order by total_salary desc;

alter table emp add hra number;
alter table emp add pf number;

alter table emp add da number;

--GROUP BY WITH FUNCTION
-------------------------
--3)Display Department numbers and total number of employees working in each Department?
select dept_id,count(*) from emp_college
group by dept_id;

--Q:4) Display the various jobs and total number of employees working in each job group?
select * from emp_college
select job,count(*) from emp_college group by job;

--Q:5) Display department numbers and Total Salary for each Department?
select dept_id, sum(salary) from emp_college
group by dept_id

--Q:6) Display department numbers and Maximum Salary from each Department?
select dept_id,max(salary)
from emp_college 
group by dept_id;
SET SERVEROUTPUT ON


 
 drop table abc
create table abc (id varchar2(20), max_sal number); 
 
 --Q:8) Display each job along with min of salary being paid in each job group?
 select job,min(salary) from emp_college group by job;
 
 --GROUP BY  WITH FUNCTION AND HAVING CLAUSE
 -------------------------------------------
 
 --Q:9) Display the department Number with more than three employees in each department?
 select dept_id,count(*) from emp_college group by dept_id
 having count(*)>3;
 
 --Q:10) Display various jobs along with total salary for each of the job where total salary is greater than 40000?
 select job,sum(salary) from emp_college group by job having sum(salary) > 40000;
 
 --Q:11) Display the various jobs along with total number of employees in each job.The output should contain only those jobs with more than one employees?
 select job,count(*) from emp_college group by job having count(*)>1
 select * from emp_college
 
 --SUBQUERY
 -------------------------
 --find all feb month from 5 year ? where-clause-to-find-all-records-in-a-specific-month-of-five-year

select * from sales where to_char(sales_date,'mm') = 02;

 --second highest salary of the employee.
 SELECT MAX(emp_salary)
FROM emp
WHERE emp_salary < (
SELECT MAX(emp_salary)
FROM emp);

 --Q:12) Display the name of employee who earn Highest Salary?
 select emp_name,salary from emp_college where salary >=
 (select max(salary) from emp_college);
 
 --13)Display the employee Number and name for employee working as clerk and earning highest salary among the clerks
 select emp_id,emp_name,salary from emp_college  where salary=(
 select max(salary) from emp_college where job='clerk') and job='clerk';
 
 --Q:14) Display the names of salesman who earns a salary more than the Highest Salary of the Clerk?
select emp_name,salary from emp_college where salary >
(select max(salary) from emp_college where job='clerk')AND job='SALESMAN';
 select * from emp_college;
 
--Q:15) Display the names of manager who earn a salary more than the lowest Salary of any clerk?
select emp_name,salary from emp_college where salary >
(select min(salary) from emp_college where job='clerk' )and job='manager';

--Q:16) Display the names of employees who earn a salary more than that of ravi or that of salary greater than that of sharad?
select emp_name  from emp_college where salary > all

(select salary from emp_college where emp_name='bhujbal' or emp_name='sharad');


17--Display the names of employees who earn Highest salary in their respective departments?

select emp_name,salary,dept_id from emp_college where salary in (select max(salary) from emp_college group by dept_id);

--Q:4) Display the various jobs and total number of employees working in each job group?
select job,count(*) from emp_college group by job

--Q:5) Display department numbers and Total Salary for each Department?
select dept_id,sum(salary) from emp_college group by dept_id

--Q:6) Display department numbers and Maximum Salary from each Department?
select dept_id,max(salary) from emp_college group by dept_id

 --7)Display various jobs and Total Salary for each job?
 select job,sum(salary) from emp_college group by job
 
 --second highest sal of emp
 select max(salary) from emp_college where salary <(
 select max(salary) from emp_college)
 select * from emp_college
 
 --Q:8) Display each job along with min of salary being paid in each job group?
 select job,min(salary) from emp_college group by job

 --Q:9) Display the department Number with more than three employees in each department?
 select dept_id,count(*) from emp_college group by dept_id having count(*)>2

 --Q:10) Display various jobs along with total salary for each of the job where total salary is greater than 40000?
 select job,sum(salary) from emp_college group by job having sum(salary) >40000
 
  --Q:11) Display the various jobs along with total number of employees in each job.The output should contain only those jobs with more than one employees?
select job,count(*) from emp_college group by job having count(*)>1

--12)Display the name of employee who earn Highest Salary?
select max(emp_salary) from emp where emp_salary >=(select max(emp_salary) from emp)

--13)Display the employee Number and name for employee working as clerk and earning highest salary among the clerks?
select * from emp_college
select emp_id,emp_name,salary from emp_college where salary=(select max(salary) from emp_college where job='clerk')and job='clerk';

--Q:14) Display the names of sql dev who earns a salary more than the Highest Salary of the Clerk?
select emp_name,salary from emp_college where salary >(
select max(salary) from emp_college where job='clerk') and job='sql dev';

--15)Display the names of clerks who earn a salary more than the lowest Salary of any sql dev?
select emp_name,salary from emp_college where salary> (
select min(salary) from emp_college where job='sql dev')and job='clerk';

select emp_name from emp_college where job='clerk' and salary> (select min (salary) from emp_college where job='sql dev');

select * from emp_college
update emp_college set salary=50000 where emp_id=7
commit
--16) Display the names of employees who earn a salary more than that of jones or that of salary greater than that of scott?
select emp_name,salary from emp_college where salary > all
(select  salary from emp_college where emp_name ='kishor' or emp_name='sharad')

--17) Display the names of employees who earn Highest salary in their respective departments?
select dept_id,emp_name,salary from emp_college where salary in
(select max(salary) from emp_college group  by dept_id );

--18) Display the names of employees who earn Highest salaries in their respective job Groups?
select emp_name,job,salary from emp_college where salary in(
select max(salary) from emp_college group by job);
--19)Display employee names who are working in salesman department?
select e.emp_name,d.dept_name from emp_college e,dept_college d where e.dept_id=d.dept_id and d.dept_name='It';

--20)Display the employee names who are Working in Hinjewadi?
select e.emp_name,d.dept_name from emp_college e,dept_college d where e.dept_id=d.dept_id and location='Hinjewadi';

--21)Display the job groups having Total Salary greater than the maximum salary for Managers?
select job ,sum(salary) from emp_college group by job having sum(salary) > (
select max(salary) from emp_college where job='manager');

--22)Display the names of employees from department number 5 with salary greater than that of ANY employee working in other departments?
select emp_name,dept_id,salary from emp_college where salary > any
( select min (salary) from emp_college where dept_id !=1 group by dept_id ) and dept_id=1;

select emp_name,dept_id from emp_college where dept_id=5 and salary > any
( select min (salary) from emp_college where dept_id !=5 group by dept_id );

--23) Display the names of employees from department number 10 with salary greater than that of ALL employee working in other departments?
select emp_name,dept_id from emp_college where salary > all
(select max(salary) from emp_college where dept_id !=1 group by dept_id)and dept_id=1;

--31) Find the first occurance of character a from the following string Computer Maintenance Corporation?
select Instr('Computer Maintenance Corporation','a' ) from dual;

--32) Replace every occurance of alphabet A with B in the string .Alliens (Use Translate function)?
select TRANSLATE('222tech', '2ec', '3it') from dual;
select translate(dept_name,'al','@|') from dept_college

--Q:33) Display the information from the employee table . where ever job Manager is found it should be displayed as Boss?
select emp_name ,replace(job,'sql dev','BOSS') from emp_college;

--34) Display empno,ename,deptno from emp table. Instead of display department numbers display the related department name(Use decode function)?
select emp_id,emp_name,dept_id,Decode(dept_id,3,'ACCOUNTING'
,2,'RESEARCH',1,'SALES','OPERATIONS')DName from emp_college;

--35) Display your Age in Days?
select sysdate-to_date('22-nov-1994') from dual;

select sysdate-to_date('21-aug-1991') from dual;
select numtodsinterval (
         to_date ( '16-july-2023 12:34:56', 'DD-MON-YYYY HH24:MI:SS' ) 
           - date '1994-11-22',
         'day'
       ) interval_diff
from   dual;
--36) Display your Age in Months?
select months_between(sysdate,to_date('2-aug-1991')) from dual;

--37) Display current date as 15th August Friday Nineteen Nienty Seven?
select To_char(sysdate,'ddth Month Day year') from dual;

select * from dept_college
select * from emp_college
alter table emp drop column EMP_MOBILE;
desc emp
