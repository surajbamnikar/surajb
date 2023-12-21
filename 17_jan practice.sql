--https://www.youtube.com/watch?v=yGU4YfSSjdM&ab_channel=ITExpert
select max(emp_salary ) from emp where emp_salary < (select max(emp_salary) from emp ) 
--ORACLE DUAL TABLE-
--The DUAL table has one column named DUMMY whose data type is VARCHAR2() and contains one row with a value X.
--By using the DUAL table, you can execute queries that contain functions that do not involve any table like the UPPER() function as follows:

select upper('this is a string')
from dual;
--Besides calling built-in function, you can use expressions in the SELECT clause of a query that accesses the DUAL table:
select (10+5)/2
from dual;

--SELECT DISTINCT-(The DISTINCT clause is used in a SELECT statement to filter duplicate rows in the result set. It ensures that rows returned are unique for the column or columns specified in the SELECT clause.)
select distinct date_added from salesperson ORDER BY date_added ;
select distinct dept_id from emp_college;
select distinct * from emp;
select emp_id where emp_id=14 and  emp_name='manoj';

SELECT * FROM emp WHERE emp_id= 14;
select * from emp
--ORDER BY-
--The ORDER BY clause allows you to sort data by multiple columns where each column may have different sort orders.
--ORDER BY clause is always the last clause in a SELECT statement.
  select emp_id from emp order by emp_id ;
  --(BY DEFAULT ASC ORDER)

 select distinct joining_date,emp_salary from emp ORDER BY joining_date ;
 
 --WHERE CLAUSE-Restrict the rows returned by using the where clause
 --the where clause follows the from clause
 select emp_id,joining_date from emp
 where joining_date > '02-04-10';
 
 --TABLE AND COLUMN ALIASES
 --the use of table aliases is to rename a table in a specific SQL statement.
 --the renaming is a temprory change and the actual table name  does not  change in the database.
 select emp_name,emp_id,dept_name 
 from employee,department
 where employee.dept_id = department.dept_id order  by emp_id;
 
 select emp_name,emp_id,dept_name 
 from employee e,department d
 where e.dept_id = d.dept_id order  by emp_id;
  --COLUMN ALIASES with two diff table
  --aliases are often to used to make column names more readable
  select emp_name "name", emp_id "id",dept_name "dname"
  from employee,department
  
 select * from employee
  select * from department
  

 
update emp set emp_mobile=8888888888 where emp_name='aniket';
update emp set commission=0.8 where emp_mobile is null;
delete from emp where emp_id = 200;
commit 


create table department(
dept_id int not null primary key,
dept_name varchar2(50)
);

desc department;
create table employee(
emp_id int not null primary key,
emp_name varchar2(20),
emp_salary number(10,2),
dept_id int
)

desc employee;
 
 insert into department values(1,'IT');
 insert into department values(2,'HR');
 insert into department values(3,'MECH');
 insert into department values(4,'COMP');
 
 insert into department values(5,'QUALITY');
 select * from department
 
 insert into employee values (1,'suraj',40000,1);
  insert into employee values (2,'sagar',50000,2);
   insert into employee values (3,'swapnil',60000,3);
    insert into employee values (4,'ashish',70000,4);
    insert into employee values (5,'lalit',30000,2);
    insert into employee values (6,'patrick',20000,3);

    insert into employee values (7,'pom',15000,1);
    
    select * from employee
--AND ,OR,
select * from emp where emp_salary > 15000 and emp_id=14;
select * from emp where emp_salary > 15000 OR emp_id=14;
select * from emp where emp_salary > 15000 and (emp_id=14 or emp_id=15);

--IN
select * from emp where emp_id in (12,13,14);
select * from emp where emp_name in ('suraj','manoj') ;
select * from emp where emp_name in ('suraj','manoj') or emp_id in (12,13);

--BETWEEN
select commission 
from emp
where emp_salary between 1000 and 15000
group by commission
having commission > 0.5;

--LIKE
--display starting alphabet 's'
select * from emp where emp_name like 's%';
--display ending with alphabet 's'
select * from emp where emp_name like '%s';
--display name where k alphabet present
select * from emp where emp_name like '%a%';
--display second alphabet name 
select * from emp where emp_name like '_u%';

--SET OPERATORS
--UNION(the union operator is use for remove duplicate records)
select dept_id from emp_college
UNION 
select dept_id from dept_College order by dept_id; 
 
--UNION ALL(union all operator will not remove duplicate records)
select dept_id from emp_college
UNION All
select dept_id from emp_college order by dept_id; 

--INTERSECT(result is always show common records between both tables)
select dept_id from emp_college
INTERSECT
select dept_id from dept_college order by dept_id;

--MINUS(operator
--it returns the first select statement query
select emp_id from emp_college
minus 
select emp_id from employee ;

--  employee - emp_college

select emp_id from employee
minus 
select emp_id from emp_college ;

 
select * from employee
select * from department

--table alias
select emp_name,emp_salary,dept_name
from employee,department
where employee.dept_id=department.dept_id;

--inner join
select e.emp_id,e.emp_name,e.emp_salary,d.dept_name,d.dept_name
from employee e
inner join department d
on e.dept_id=d.dept_id;

--left join
select *
from employee e
left join department d
on e.dept_id=d.dept_id;
--right join
select * 
from employee e
right join department d
on e.dept_id=d.dept_id;
--full join
select * 
from employee e
full join department d
on e.dept_id=d.dept_id;


--cross join
select e.emp_name,e.salary,e.emp_id,d.dept_name
from emp_college e
cross join dept_college d;

--self Join
--find dept id whose enrolled in at least two job
select e2.emp_name,e2.dept_id,e2.job from emp_college  e1,emp_college  e2
where e1.dept_id=e2.dept_id and e1.job<>e2.job;

SELECT  a.emp_name, b.job, a.SALARY  
FROM emp_college a, emp_college b  
WHERE a.SALARY < b.SALARY; 
--Natural Join
select *
from emp_college e
natural join dept_college d;


select * from emp
/*
AGGRIGATE FUNCTION--Oracle aggregate functions calculate on a group of rows and return a single value for each group.
-We commonly use the aggregate functions together with the GROUP BY clause. The GROUP BY clause divides the rows into groups and an aggregate function calculates and returns a single result for each group.
-If you use aggregate functions without a GROUP BY clause, then the aggregate functions apply to all rows of the queried tables or views.
-We also use the aggregate functions in the HAVING clause to filter groups from the output based on the results of the aggregate functions.
*/
select * from emp
select sum(emp_salary) from emp;
select min(emp_salary) from emp;
select avg(emp_salary) from emp;
select max(emp_salary) from emp;

--GROUP BY
select commission
from emp
group by commission;
commit

--GROUP BY WITH AGGRIGATE FUNCTION

select commission,min(emp_salary)
from emp
where emp_salary > 8000
group by commission;

select emp_salary,count(*) 
from emp
group by emp_salary
 
select emp_salary,count(emp_salary) 
from emp
group by emp_salary

select emp_salary,sum(emp_salary) 
from emp
group by emp_salary

select * from employee

select dept_id 
from employee
group by dept_id;


select dept_id,count(emp_salary) 
from employee
group by dept_id;


select dept_id , count(*) 
from employee
group by dept_id
having count(*) > 1 ;

select dept_id,sum(emp_salary)
from employee
group by dept_id;


select dept_id,sum(emp_salary)
from employee
group by dept_id
having sum(emp_salary) > 10000;

select * from employee

--CHARACTER FUNCTIONS
--case conversion function

select lower(emp_name) from emp
select upper(emp_name) from emp
select initcap(emp_name) innn from emp

select upper(address) 
from emp
where emp_id > 14;

--character manupulation function(concat)
select concat(emp_name, emp_salary)
from emp
--concat with space between two column
select emp_name || ' ' || emp_salary from emp

select emp_name || ' is from '  || address from emp

select emp_name || ' is from ' || address 
from emp
where emp_salary > 10000 or emp_name='suraj'

--SUBSTR function returns a portion of a string from a given start point to an end point.
select * from emp
--output always be string 
--first arg is string, second is start position and third is length of output/string
select emp_name,substr(emp_name,1,3) from emp where emp_id=11;
select emp_name,substr(emp_name,-1,3) from emp where emp_id=11;

select substr(emp_name, -3,2) from emp where emp_id=11;
--ALTER TABLE EMP RENAME COLUMN  E_NAME  TO EMP_NAME;
select emp_name, substr(emp_name, -2,1) from emp where emp_id=11;
SELECT EMP_NAME FROM EMP;
DESC EMP;
--INSTR function returns numeric position of a character or a string in a given string.
select EMP_NAME,instr(emp_name,'raj',2,1 )
from emp 
where emp_id =11;
--output will always be number
--instr>>first arg is string,second in sub string/string to find out,third is start position,4th is no of occurance 
  
select * from emp;
select substr(emp_name,1,instr(emp_name,' ') -1) from emp where emp_id=21;
 select emp_name ,instr(emp_name,' ') -1 from emp where emp_name='sagar dixit';
--length
select LENGTH(-4) from dual;

select emp_name,length(emp_name) from emp
 select emp_name , (instr(emp_name,' ') -1) from emp;

select EMP_NAME,instr(emp_name,' ')-1 from emp 

select length(substr(emp_name,1,instr(emp_name,' ') -1)) from emp where emp_id=17;
select emp_name,emp_salary from emp where length(emp_salary)=4;

--lpad
--The LPAD() function left-pads a string with another string, to a certain length.
--Required. The original string. If the length of the original string is larger than the length parameter, 
--this function removes the overfloating characters from string
select emp_name,lpad(emp_name,1,'#')from emp;
--rpad
--The RPAD() function right-pads a string with another string, to a certain length.

select emp_name,rpad(emp_name,10,'#')from emp;

--trim
select Rtrim('    suraj    ') from emp

--replace
select * from emp
select replace(emp_name,'sagar dixit','sagar dikshit') from emp

--NUMERIC FUNCTIONS
--CEIL >RETURNS NEAREST WHOLE NUMBER GREATER THAN OR EQUAL TO N
select ceil (12.6) from dual;
select ceil (emp_salary) from emp where emp_id=11
select * from emp
update emp set emp_salary=10200.6 where emp_id=11;
update emp set emp_salary=19200.5461 where emp_id=12;


--FLOOR>>returns nearest whole number less than or equal to n
select floor (12.6) from dual;

select floor (emp_salary) from emp where emp_id=11

--ROUND>>rounds n to m places to the right of the decimal point.
select round(429.348899,-2) from dual; 

output-579.349

select round(579.348899) from dual;

output-579
select round(579.548899) from dual;
--output--580


select emp_salary,round(emp_salary,2) from emp where emp_id=12;
--POWER
select power(5,4) from dual

--MOD
(12,4)/(m,n)
if n > m then m is retured

select mod(66,0) from dual ;
--out put 66

--SORT 
select sqrt(100) from dual;
--output 10

--ABS
select emp_salary,abs(emp_salary ) from emp;
select * from emp;
update emp set emp_salary=-20001 where emp_id=15

--TRUNC
select trunc(29.6633,3) from dual
--output 26.663
select trunc(29.6633) from dual
--output 29
     
 --CONVERSION FUNCTIONS
 --to_char(date to char)
 
 
 select emp_name,to_CHAR(JOINING_DATE,'month year day') from emp;
 
 ALTER TABLE EMP ADD  NEW_JOINING_DATE  VARCHAR2(100);
--update one column record in another column in same table
  UPDATE emp SET NEW_JOINING_DATE = JOINING_DATE;
rollback
 desc emp;
 
 SELECT * FROM EMP;
 
  select emp_name,to_CHAR(JOINING_DATE,'mon yyyy day') from emp;
  where emp_salary > 15000;
  --to_char( char to number)
  select emp_name,emp_salary,to_number(emp_name,'fmday') from emp
  select * from emp
  
  --NVL-if arg 1 is null, then NVL returns arg2. If arg 1 is not null, then NVL returns arg 1.
  select replace(null,)
  select emp_id,emp_name,nvl(emp_salary,25000) from emp
  where emp_id  >19;
   
  select emp_name,emp_mobile,nvl(emp_mobile,7304777457) from emp
  --NVL2- If arg 1 is not null, then NVL2 returns arg 2. If arg1 is null, then NVL2 returns arg3.
  select emp_name,emp_salary,nvl2(emp_salary,25000,35000) from emp
  where emp_id  <15;
   select emp_name,emp_mobile,nvl2(emp_mobile,7304777457,9822939457) from emp
   where emp_id < 14;
select 
   select * from emp
--The COALESCE expression allows for user-specified NULL-handling. It is often used to fill in missing values in dirty data. You can use the COALESCE expression to evaluate records for multiple values and return the first non-NULL value encountered, in the order specified
  select emp_id,emp_name,emp_salary,coalesce(emp_salary,25000) from emp


     --NOT NULL CONSTRAINT-The NOT NULL constraint enforces a column to NOT accept NULL values. This enforces a field to always contain a value, which means that you cannot insert a new record, or update a record without adding a value to this field.
     create table students (
     std_id number,
     std_name varchar(20) not null
     );
     select * from students
     desc students
     insert into students values(1,'suraj');
          insert into students values(2,);
                    insert into students values('a');
     --UNIQUE CONSTRAINTS-Unique constraints ensure that the data in a column or combination of columns is unique for each row. A table's primary key, for example, functions as an implicit unique constraint. In EJB persistence, you represent other unique constraints with an array of UniqueConstraint annotations within the table annotation.
     create table students_unq (
     std_id number,
     std_name varchar(20) unique
     );
     insert into students_unq values(1,'suraj');
          insert into students_unq values(2,'sagar');
          select * from students_unq
          
          --PRIMARY AND FOREIGN KEY CONSTRAINTS-The PRIMARY KEY constraint uniquely identifies each record in a table. Primary keys must contain UNIQUE values, and cannot contain NULL values.
          create table purchase_orders(
          po_nbr number primary key,
          vendor_id number not null,
          po_status number(1,0) not null
          );
          ALTER TABLE students 
ADD std_div varchar(10) ;  
          select * from purchase_orders
          desc purchase_orders
          
 select * from employee
select * from department

--SUBQUERY/INNER QUERY/NESTED QUERY
select emp_name,emp_salary
from employee
where emp_salary=(
select max(emp_salary) 
from employee);
 
select emp_name,emp_salary 
from employee
where emp_salary in (
select emp_salary 
from employee
where emp_salary > 30000);



--find those employees who are getting more salary then salary of employee 'lalit'?

select emp_name from employee
where emp_salary > (
select emp_salary from employee
where emp_name='sagar');

--for multiple row result use in, > any
select emp_name from employee
where emp_salary > any (
select emp_salary from employee
where emp_name='suraj');

select emp_name from employee
where emp_salary > all (
select emp_salary from employee
where emp_name='suraj');

update employee set emp_name='suraj' where emp_salary=60000;

select * from employee
select * from department

select emp_name
from employee
where dept_id in (
select dept_id
from employee
where emp_id = 1);

select emp_salary from employee where emp_salary < (
select avg(emp_salary) from employee);

select dept_id  from employee 
where dept_id not in (
select dept_id from employee
where dept_id=2) ;


select dept_id from employee
where dept_id<>2
        
select emp_name,emp_salary from employee where dept_id in(
select dept_id from department where dept_name='IT');

--subquery (CREATE TABLE)
create table dupemployee as
select * from employee

select * from dupemployee

--for structure of the table
create table dupstremployee as (
select * from employee where 1>2) ;
select * from dupstremployee

--SUBQUERY (INSERT)
insert into dupstremployee
(select * from employee where dept_id=1);
select * from dupstremployee

insert into dupstremployee (emp_id,emp_name)
(select emp_id,emp_name from employee where dept_id > 3);

insert into dupstremployee (emp_salary,emp_id)
(select emp_salary,emp_id from employee where dept_id='2');

--SUBQUERY(DELETE)
delete from dupstremployee where dept_id=(
select dept_id from employee where emp_id='1');

delete from dupstremployee where emp_salary=(
select emp_salary from employee where emp_id='2');

--SUBQUERY(UPDATE)
update dupstremployee set emp_salary= emp_salary;
update dupstremployee set emp_salary= emp_salary +(select avg(emp_salary) from employee);

--subquery-second highest salary of the employee.
alter table emp rename column salary to emp_salary;


SELECT MAX(emp_salary) FROM emp
WHERE emp_salary < (
SELECT MAX(emp_salary)
FROM emp);
SELECT
    *
FROM
    emp
SELECT
    MAX(emp_salary)
FROM
    (
        SELECT
            *
        FROM
            department
        WHERE
            dept_name = 'HR'
    );

--CORRELATED SUBQUERY
select * from emp_college
--find sal of all employee EARN  MORE sal THAN manager
select salary from emp_college where >
 --CASE STATEMENT
 --syntax
 select emp,
 case
 when condition 1 then result 1
 when condition 2 then result 2
 else
 result
 end as view column_name
 from
 table_name;
 
 SELECT emp_id,emp_name,
CASE emp_name
  WHEN 'kishor' THEN 'The owner is SYS'
  WHEN 'suraj' THEN 'The owner is SYSTEM'
  ELSE 'The owner is another value'
END
FROM emp_college;
 
 
 select * from employee
  select * from department
--query1-simple case expression(column name as case expression)
 select upper(emp_name),trim(emp_id),
 case 
 when dept_id='1' then 'main hu'
 when dept_id='4' then 'mai nahi'
 
 else 'main nahi to kaun be'
 end as temp_name
 from emp_college;
 
 --query1-string as case expression
 
select
case 'suraj'
when 'suraj' then '1 true'
when 'm not' then '2 false'
when 'suraj' then '3 true'
when 'm not' then '2 false'
else 'sorry'
end
from dual;
SELECT
    CASE 'suraj'
        WHEN 'fff'   THEN
            '1 true'
        WHEN 'm not' THEN
            '2 false'
        WHEN 'd'     THEN
            '3 true'
        WHEN 'm d'   THEN
            '2 false'
        ELSE
            'sorry'
    END
FROM
    dual;
--if condition not true and els ein not avb then result in null
SELECT
    CASE 'suraj'
        WHEN 'fff'   THEN
            '1 true'
        WHEN 'm not' THEN
            '2 false'
        WHEN 'd'     THEN
            '3 true'
        WHEN 'm d'   THEN
            '2 false'
    END
FROM
    dual;

select * from emp
--searched case expression with logical operator
select emp_name,address,
case
when emp_name='suraj' and address='preet nagar, kharadi' then 'yes'
when emp_name ='shekhar' and address='viman nagar' then 'yes'
when emp_name='manoj' and address='hadapsar' then 'no'
when emp_name='aniket' and address='warje malwadi' then 'yes'

else 'sorry'
end
from emp;

--searched case expression with comparison oerator BETWEEN and IN
select emp_name,emp_salary,
case 
when emp_salary <= 19000 then 'case 1'
when emp_name = 'suraj' and emp_id is null then 'case 2'
when emp_salary between 10000 and 16000 then 'case 3'
else 'sorry'
end as result
from emp
where emp_salary >= 9000;

select * from emp
--GROUPING SETS
select commission ,joining_date, count(*) 
from emp
group by commission,joining_date
having count(*) > 1 ;

--WHAT IS ORACLE VIEWS
--In SQL, a view is a virtual table based on the result-set of an SQL statement. 
--A view contains rows and columns, just like a real table. 
--The fields in a view are fields from one or more real tables in the database.
--CREATE VIEW
CREATE VIEW emp_view_test
AS SELECT emp_id, emp_name, emp_salary
FROM emp
WHERE emp_salary = 15000;
 select * from emp_view_test
--REPLACE OR EDIT VIEW
CREATE OR replace VIEW emp_view_test
AS SELECT emp_id, emp_salary
FROM emp
where emp_salary > 15000;
--CREATE VIEW WITH TWO TABLES(joins)--Complex views
create view emp_dept
as 
select dept_id from dept_college
union
select dept_id from emp_college;

select * from emp_dept
--data manipulation operation not legal on this view(complex view)
update  emp_dept set dept_id=33 where dept_id=2;


create view view_complex
as
select emp_name,emp_id,dept_name
from emp_college e,dept_college d
where e.emp_name=d.dept_name;

select * from view_complex
--An attempt was made to insert or update columns of a join view which  map to a non-key-preserved table.
insert into view_complex values('a',21,'qa')

select * from emp_dept

select * from emp_view_test order by emp_id
desc emp_view_test

--if insert,update data in views that will also reflect in base table
update emp_view_test set emp_salary=23000
update emp_view_test set emp_salary=1001 where emp_id=13;

insert into emp_view_test values(18,31000);
where emp_id >16;
--CREATE VIEW WITH CHECK OPTION
--we 
CREATE or replace VIEW emp_view_test_check
AS SELECT emp_id,emp_name,emp_salary,commission
FROM emp
WHERE commission = 0.8 with check option;

select * from emp_view_test_check;

where emp_id=16;
--view WITH CHECK OPTION where-clause violation
insert into emp_view_test_check values(19,'jack', 21344,0.9);

select * from emp_view_test_check;

--DML ON VIEWS
--if insert,update data in views that will also reflect in main parent table
update emp_view_test set emp_salary=23000
update emp_view_test set emp_salary=1001 where emp_id=13;
insert into emp_view_test values(18,31000);

--view WITH CHECK OPTION where-clause violation
insert into emp_view_test_check values(19,'jack', 21344,0.9);

--TYPES OF VIEWS
-- 1) SIMPLE VIEWS

--simple view based on single table.
--DML's are allowed
--the records are not grouped . no group functions allowed.

-- 2) COMPLEX VIEWS
--complex view are can have any no of tables joined
--records can be grouped, group functions like max,min,avg,count,sum can be used
--no DML's are allowed

--WHY WE CREATE VIEWS(BENIFIT)
--1) Views can hide complexity(joins)
--2) views can be used as security mechanism
--(NOTE)-there is no records in the views, it holds the definition of table and fetches.
--views are stored permannat query objects in databse


--Materialized Views
--this views are hold the data
create materialized view mat_view
as
 select dept_id, max(salary),min(salary)
 from emp_college
 group  by dept_id;
 
 select * from mat_view
 --materialized view with refresh types
  create materialized view mat_view_complete
  refresh complete
as
 select dept_id, max(emp_salary),min(emp_salary)
 from employee
 group  by dept_id;
 
 select * from mat_view_complete
 ----
 --1.complete-whenever database is modified then first craeted log and then truncated the materialized views
   create materialized view mat_view_force
  refresh force
as
 select dept_id, max(emp_salary),min(emp_salary)
 from employee
 group  by dept_id;
 
 select * from mat_view_force
 desc department
 --------------
--where-clause-to-find-all-records-in-a-specific-month-of-five-year

select * from sales where to_char(sales_date,'mm') = 02;

  
--where-clause-to-find-all-records-in-a-specific-month-of-five-year
select joining_date 
from emp
where to_char(joining_date , 'MM') = 02;
where to_char(joining_date , 'DD') = 20;
where to_char(joining_date , 'YYYY') = 2017;

--listagg function
--LISTAGG orders data within each group specified in the ORDER BY clause and then concatenates the values of the measure column. As a single-set aggregate function, LISTAGG operates on all rows and returns a single output row.
--As a single-set aggregate function, LISTAGG operates on all rows and returns a single output row.


select * from sales
select * from emp
select commission,listagg(emp_id,',') within group (order by commission)from emp group by commission;
select product_id, listagg(order_id,',') within group (order by order_id desc) from sales group by product_id;


create materialized view employee2 
refresh force
as
select * from empLOYEE2
--------------------------------------------
--MERGE--Merge is one statement that allows you to do either an insert or an update as needed. 
--USE OF MERGE--To use it, you need to state how values in the target table relate to those in the source in the join clause. Then add rows in the when not matched clause. And update them using when matched.
SELECT * FROM EMP_COLLEGE
SELECT * FROM DEPT_COLLEGE
SELECT * FROM EMP_COL_DUMMY
CREATE TABLE EMP_COL_DUMMY As SELECT EMP_ID, SALARY, JOINING_DATE FROM EMP_COLLEGE

DESC EMP_COL_DUMMY

MERGE INTO EMP_COL_DUMMY TAR
USING EMP_COLLEGE SRC
ON    (TAR.EMP_ID = SRC.EMP_ID) 
WHEN MATCHED THEN 
UPDATE SET SALARY = SRC.SALARY
--DELETE WHERE EMP_ID=15
 WHEN NOT MATCHED THEN 
INSERT   ( TAR.EMP_ID,TAR.SALARY, TAR.JOINING_DATE) 
VALUES (SRC.EMP_ID,SRC.SALARY, SRC.JOINING_DATE);
 
      
UPDATE EMP_COLLEGE SET SALARY=85000 WHERE EMP_ID=2;

-------------------------------------------------------
--PIVOT-The Pivot operator converts the row data into a column data. The Unpivot relational operator works the opposite of the Pivot operator. It converts the column-based data into row-based data and row-based data into a column based data.
SELECT * FROM
(SELECT EMP_ID,SALARY,DEPT_ID FROM EMP_COLLEGE)
PIVOT(AVG(SALARY)
FOR DEPT_ID IN(1 DEPT_1,3 DEPT_2)) ORDER BY  EMP_ID ;

SELECT * FROM EMP_COLLEGE

SELECT * FROM 
(SELECT SALES_DATE,PRODUCT_ID,SALES_AMOUNT FROM SALES)
PIVOT(SUM(SALES_AMOUNT)
FOR PRODUCT_ID IN(100 P_100,105 P_105)) ;
--CTE(Common Table Expression)
--------------------------------------------------------------------------------------------------
--INDEX
--indexes are used by queries to find data from table quickly. Indexes are used on both tables and views.
--it is used to speed up the data retrieval
--indexes on a table or view, are simillar to the index we find in a book.
--should be created when very less  number of rows to be retrieval in a large table

--why indexes- if there is no index to help the query, query engine checks every row of table from start to end     .this is called as table scan.          
--table scan is bad for performance
create index index_emp_sal3 on emp (emp_salary asc)
drop index index_emp_sal3
select * from employee where emp_id=12
--Indexes Data Dictionary Views
--These views describe the columns of indexes on tables. Some columns in these views contain statistics that are generated by the DBMS_STATS package or ANALYZE statement.
select index_name from USER_IND_COLUMNS
--DBA view describes indexes on all tables in the database. ALL view describes indexes on all tables accessible to the user. USER view is restricted to indexes owned by the user. Some columns in these views contain statistics that are generated by the DBMS_STATS package or ANALYZE statement.
select index_name from USER_INDEXES
--These views describe the expressions of function-based indexes on tables.
select index_name from USER_IND_EXPRESSIONS
select index_name,index_type,table_name from ALL_INDEXES
select index_name,index_type,uniqueness from user_indexes where table_name='OBJ$'
-----------
select rowid from emp

select rowid,emp.* from emp order by emp_id asc
--Data Dictionary Views
select * from User_indexes/dba_indexes
select * from user_ind_columns/dba_ind_columns
select * from v$object_usage

--Part 1 : Oracle System Table Commands  :
--How to Find table information about specific table.
Select table_name,Owner from All_tables order by table_name,owner;

-- How do you fetch different users on database.
SELECT Username FROM All_Users ORDER BY Username;

--How to find constraint information on specified database.
SELECT Table_Name, Constraint_Name FROM User_Constraints;

--How to check the procedure code from specific procedure.
 SELECT * FROM emp

delete from emp where emp_id=88;  

exec sp_helpindex 'emp'

select index_name from dba_indexes where table_name='ACL$_OBJ';
---------------------------------------
--PSEUDO COLUMN(https://www.youtube.com/watch?v=ILjFTl5DyQQ&ab_channel=ITORIAN)
--1)SYSDATE
SELECT SYSDATE FROM DUAL,SALES

--2)SYSTIMESTAMP
SELECT SYSTIMESTAMP FROM DUAL,SALES

--3)UID/USER
SELECT UID,USER FROM SALES

--4)CURRVAL/NEXTVAL WITH SEQUENCE
--A sequence is a database object that generate sequence integer numbers automatically for primary key column or Unique key column of a table.
--You can use sequences to insert unique values in primary key and Unique columns of a table.
--CREATE SEQUENCE -these are oracle reserved keywords. used to create sequence DDL statement.

--sequence_name — its a sequence name, that can be defined based on user’s choice.

--START WITH– tells about the starting sequence number from which number to start.

--INCREMENT BY — by how many numbers it has to increase to previous number. The value for INCREMENTED BY cannot be 0 but it can be any positive or negative value.

--If this value is negative, then the sequence descends. If the value is positive, then the sequence ascends. If you omit this clause, then the interval defaults to 1.

--MAXVALUE / NOMAXVALUE 
--MAXVALUE –sets the maximum value to stop the sequnce number generation.
--MAXVALUE must be equal to or greater than START WITH and must be greater than MINVALUE attribute.
--If you don’t want to set the MAXVALUE for your sequence then you can use NOMAXVALUE attribute.

--MINVALUE / NOMINVALUE
--sets the minimum or lowest value to stop the sequnce number generation.
--should be less than or equal to START WITH as well as less than MAXVALUE.
--If you don’t want to set the lower bound for your sequence then you can use NOMINVALUE attribute instead.

--CACHE/ NOCACHE
--Cache attribute specify the number of integers to keep in memory.
--The default number of integers to cache is 20.
--The minimum number of integers that may be cached is 2.

--NOCACHE to indicate that values of the sequence are not pre-allocated.
--If you omit both CACHE and NOCACHE, the database caches 20 sequence numbers by default.

--CYCLE/NOCYCLE

--CYCLE and NOCYCLE are two flags to set.
--Set the flag on CYCLE, then sequence continues to generate values after reaching either its maximum or minimum value.

--NOCYCLE flag when you do not want your sequence to generate more values after reaching its maximum or minimum value.
--If omit both these flags, then by default oracle engine will set the flag on NOCYCLE.

--ORDER/ NOORDER
--ORDER Flag generates sequence numbers in order of request.
--This clause is useful if you are using the sequence numbers as timestamps.

--Set the flag on NOORDER ,if you do not want to generate  the sequence numbers in order of request.
--NOORDER is the default flag in case you omit either of them.


CREATE SEQUENCE EMP_SEQ
MINVALUE 1
MAXVALUE 1000
START WITH 25   
INCREMENT BY 1
CACHE 50;

ALTER SEQUENCE EMP_SEQ

MAXVALUE 1000

INCREMENT BY 2

--

INSERT INTO EMP VALUES (EMP_SEQ.NEXTVAL ,'ASSK', 7777714111,7777751112,7777611113,'LONDON',34000,7777771114,7777781115,7797711116,0.15,0.05,0.10);
INSERT INTO EMP VALUES (EMP_SEQ.NEXTVAL ,EMP_SEQ.CURRVAL, 7777714111,7777751112,7777611113,'LONDON',34000,7777771114,7777781115,7797711116,0.15,0.05,0.10);
INSERT INTO EMP VALUES (EMP_SEQ.NEXTVAL ,EMP_SEQ.CURRVAL, EMP_SEQ.CURRVAL,7777751112,7777611113,'LONDON',34000,7777771114,7777781115,7797711116,0.15,0.05,0.10);

SELECT * FROM EMP


/*5)ROWID/ROWNUM
ROWID is a pseudo column in a table which store and return row address in HEXADECIMAL format with database tables.
ROWID is the permanent unique identifiers for each row in the database.
ROWID consists of 18 character string with the format. BBBBBBBBB.RRRR.FFFF Where B is Block, R is Row, F is FIle.

NOTES

ROWID is representative of the allocation of physical memory.
Oracle automatically generates a unique ROWID at the time of insertion of a row.
ROWID is the permanent identity or address of a row which one can easily access(retrieve data from a row) the rows from the table.
A user can access a row quickly and easily using its row ID.
ROWID can also be used to delete normal records and the duplicate records from a table.


ROWNUM:

Oracle engine maintains the number of each record inserted by users in table.
Rownum generates sequence number for each record each record inserted by users in table.
By the help of ROWNUM clause we can access the data according to the record inserted.
Rownum is used to limit the number of records to fetch from the table.
*/
SELECT ROWID, ROWNUM,emp_ID
  FROM EMP WHERE ROWNUM <=4;
  
  
  --DATA DICTIONARY
  desc user_constraints
  select constraint_name,constraint_type,table_name from user_constraints
  select table_name from user_tables where rownum < 9
  select table_name from all_tables ;
    select table_name,constraint_name from user_constraints where rownum < 9;
    
    
    --DECODE
    SELECT emp_id,
DECODE(emp_id, 11, 'IBM',
                    12, 'Microsoft',
                    13, 'Hewlett Packard',
                    'Gateway') result
FROM emp;
--IF ELSE
select * from emp
DELETE FROM emp WHERE emp_id >21; 
commit
rollback

----------------------------------------
/*
1. DELETE : 
Basically, it is a Data Manipulation Language Command (DML). It is used to delete one or more tuples of a table. With the help of the “DELETE” command, we can either delete all the rows in one go or can delete rows one by one. i.e., we can use it as per the requirement or the condition using the Where clause. It is comparatively slower than the TRUNCATE command. The TRUNCATE command does not remove the structure of the table.

SYNTAX – 
If we want to delete all the rows of the table:
DELETE from;
SYNTAX – 
If we want to delete the row of the table as per the condition then we use the WHERE clause,
DELETE FROM table_name WHERE condition; 
Note – Here we can use the “ROLLBACK” command to restore the tuple because it does not auto-commit.

2. DROP : 
It is a Data Definition Language Command (DDL). It is used to drop the whole table. With the help of the “DROP” command we can drop (delete) the whole structure in one go i.e. it removes the named elements of the schema. By using this command the existence of the whole table is finished or say lost. 

SYNTAX – 
If we want to drop the table:
DROP table <table_name>;
Note – Here we can’t restore the table by using the “ROLLBACK” command because it auto commits.


3. TRUNCATE : 
It is also a Data Definition Language Command (DDL). It is used to delete all the rows of a relation (table) in one go. With the help of the “TRUNCATE” command, we can’t delete the single row as here WHERE clause is not used. By using this command the existence of all the rows of the table is lost. It is comparatively faster than the delete command as it deletes all the rows fastly. 

SYNTAX – 
If we want to use truncate :
TRUNCATE table <table_name>;
Note – Here we can’t restore the tuples of the table by using the “ROLLBACK” command.
*/
-- FIND 2nd LOWEST SALARY FROM TABLE
SELECT * from tab2 WHERE SAL = (SELECT MIN(SAL)FROM TAB2)

-- FIND NO. OF EMP WITH SIMILAR SALARY FROM TABLE
SELECT SAL, COUNT(SAL) FROM TAB2 GROUP BY SAL

-- FIND Nth HIGHEST SALARY FROM TABLE USING ANALYTICAL FUNC
SELECT NAME, SAL FROM
(SELECT DENSE_RANK() OVER (ORDER BY SAL DESC) AS X, TAB2.* FROM TAB2)
WHERE X = 3

--find the avg salary of employee department wise along with details.
select * from dept_college
select dept_id,avg(salary) 
from emp_college 
group by dept_id
--with analytical function
select avg(salary) over(partition by dept_id) as avg_dept_sal, a.* from emp_college a order by emp_id;
-- FIND DUPLICATE VALUES
SELECT SAL,COUNT(SAL) FROM TAB2 GROUP BY SAL HAVING COUNT(SAL)> 1

--  HOW TO DELETE DUPLICATE VLAUES FROM TABLE
DELETE FROM TAB2 WHERE EMP_ID = 20

SELECT ID, NAME, SAL FROM TAB2 ORDER BY SAL

DELETE  T FROM
(SELECT SAL,COUNT(SAL) FROM TAB2 GROUP BY SAL HAVING COUNT(SAL)> 1)T
 WHERE ROW_NUMBER >1


select * from TEAM
DESC TEAM
ALTER TABLE TEAM MODIFY TEAMid NUMBER(2);
CREATE TABLE Team (
    TeamID NUMBER PRIMARY KEY,
    TeamName VARCHAR2(50) UNIQUE
);

INSERT INTO Team (TeamID, TeamName) VALUES (1, 'Team A');
INSERT INTO Team (TeamID, TeamName) VALUES (2, 'Team B');
INSERT INTO Team (TeamID, TeamName) VALUES (3, 'Team C');
INSERT INTO Team (TeamID, TeamName) VALUES (4, 'Team D');

-- suppose that in a Table named Team contains 4 records, we need to schedule a match between each team vs opposite team:
--    ----
--    India
--    Pakistan
--    Srilanka
--    Australia
--
--
--    Output :
--    ----
--    India VS Pakistan
--    India VS Srilanka
--    India VS Australia
--    Pakistan VS Srilanka
--    Pakistan VS Australia
--    Srilanka VS Australia

select t1.TEAMNAME as "emp1",t2.TEAMNAME as "emp2" from TEAM T1
inner join TEAM T2 on t1.TEAMID!=t2.TEAMID 


SELECT
    t1.TeamName AS Team1,
    t2.TeamName AS Team2
FROM
    Team t1
JOIN
    Team t2 ON t1.TeamID < t2.TeamID and  t1.TeamID != t2.TeamID;
 select * from team
 
 WITH C
 SELECT * FROM  TEAM A CROSS JOIN TEAM B 
 
SELECT * FROM  TEAM A WHERE A.TEAMID not IN (SELECT B.TEAMID FROM TEAM B WHERE A.TEAMID <> B.TEAMID )
 
 CREATE TABLE TABLE_DATATYPE_MOD (
    TeamID NUMBER(2) PRIMARY KEY,
    TeamName VARCHAR2(50) UNIQUE,
    TEAM_DATE DATE
);

INSERT INTO TABLE_DATATYPE_MOD(TEAMID)
SELECT 100 FROM DUAL

DROP TABLE TABLE_DATATYPE_MOD

SELECT * FROM EMP_COLLEGE