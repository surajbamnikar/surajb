INSERT INTO tabl (id,name,SAL) 
  WITH A AS ( 
    SELECT 4, 'F',     100    FROM dual UNION ALL 
    SELECT 5, 'G', 500   FROM dual  
    --SELECT 4, 'H',  200 FROM dual 
      ) 
  SELECT * FROM A
  COMMIT
  create table tabl(id number not null, name varchar(20),sal number);
  SELECT * FROM TABl
  ALTER TABLE tabl RENAME TO tabl;
  DESC TABl
  --how to find top 10 emp salary in sql
  SELECT *
FROM employee
ORDER BY sal DESC
FETCH FIRST 10 ROWS ONLY;



--FIND MAX SALARY OF THE EMPLOYE FROM TABLE
select sal from table_name where sal=( select  max(sal) from table_name )

SELECT SAL FROM tabl WHERE SAL =(SELECT MAX(SAL) FROM tabl);

SELECT * FROM tabl

-- FIND  LOWEST/MINIMUM SALARY OF THE EMPLOYEE FROM TABLE
select sal from table_name where sal=(select min(sal ) from table_name);

SELECT SAL from tabl WHERE SAL = (SELECT MIN(SAL)FROM tabl)

--FIND SECOND HIGHEST SAL OF THE EMPLOYEE FROM TABLE
select max (sal) from table_name where sal< ( select max (sal) from table_name);

SELECT MAX(SAL) from tabl WHERE SAL < (SELECT MAX(SAL)FROM tabl)

-- FIND NO. OF EMP WITH SIMILAR SALARY FROM TABLE(only one sal result per row)
SELECT SAL, COUNT(SAL) FROM tabl GROUP BY SAL having COUNT(SAL)<2;
select sal,Count(sal ) from table_name group by sal;

--FIND NTH HIGHEST SAL 
--0 AS  HIGHEST SAL,1 AS SECOND HIGHEST SAL,
select min(sal) from tabl t1 where 0=
(select count(sal) from tabl t2 where t2.sal > t1.sal)

--FIND 3rd HIGHEST SAL 

select min(sal) from tabl t1 where 2=
(select count(sal) from tabl t2 where t2.sal > t1.sal);


-- FIND Nth HIGHEST SALARY FROM TABLE USING ANALYTICAL FUNC dense rank
SELECT NAME, SAL FROM
(SELECT DENSE_RANK() OVER (ORDER BY SAL DESC) AS densrnk_X, tabl.* FROM tabl)
WHERE densrnk_X = 2;

select  name,sal from
(select dense_rank() over(order by sal desc)as x, table_name.* from table_name)
where x=1;
-- FIND COUNT OF DUPLICATE SAL FROM TABLE 
SELECT SAL,COUNT(SAL) FROM tabl GROUP BY SAL HAVING COUNT(SAL)> 1;

select sal,count(sal) from table group by sal having count(sal)>1;
 
 --CREATE DUPLICATE TABLE
 CREATE TABLE New_Table_name AS SELECT * FROM Existing_table_Name;
 
 --FIND DUPLICATE SAL
SELECT SAL FROM tabl T1 WHERE 
EXISTS (SELECT SAL FROM tabl T2
WHERE T1.SAL = T2.SAL AND T1.ID <> T2.ID);
   
 --FIND DEPT HIGHEST SAL  
   select * from emp_college
      select * from dept_college
      
      select d.DEPT_NAME, max(SALARY) from EMP_COLLEGE e ,DEPT_COLLEGE d
      where e.DEPT_ID=d.DEPT_ID
      group by DEPT_NAME;
      
--  HOW TO DELETE DUPLICATE VALUES/ROWS FROM TABLE BY NOT IN
DELETE FROM tabl
WHERE id NOT IN(SELECT MIN(id)FROM tabl GROUP BY SAL);
--SELECT * FROM tabl GROUP BY SAL
select * from tabl
ROLLBACK

--delete duplicate/values rows by rowid
DELETE FROM tabl A WHERE ROWID > (SELECT MIN(ROWID) FROM tabl B WHERE B.SAL=A.SAL);
ROLLBACK
--
SELECT * FROM tabl
SELECT ID, NAME, SAL FROM tabl ORDER BY SAL DESC;

---------------ALL,ANY,SOME
--select * from EMP_COLLEGE
--"x = ALL (...)": The value must match all the values in the list to evaluate to TRUE.
--"x != ALL (...)": The value must not match any values in the list to evaluate to TRUE.
--"x > ALL (...)": The value must be greater than the biggest value in the list to evaluate to TRUE.
--"x < ALL (...)": The value must be smaller than the smallest value in the list to evaluate to TRUE.
--"x >= ALL (...)": The value must be greater than or equal to the biggest value in the list to evaluate to TRUE.
--"x <= ALL (...)": The value must be smaller than or equal to the smallest value in the list to evaluate to TRUE.
--WITH ALL
SELECT emp_id,emp_name, salary
FROM   emp_college
WHERE  salary > ALL (2500, 3000, 6000);

--WITHOUT ALL
SELECT emp_id,emp_name, salary
FROM   emp_college
WHERE  salary > 2000 AND salary > 3000 AND salary > 4000;


--When the ALL condition is followed by a subquery, the optimizer performs a two-step transformation as shown below.
select emp_name,salary from EMP_COLLEGE where salary >all
(select salary from EMP_COLLEGE where  job='clerk' )

----WITH ANY
--"x = ANY (...)": The value must match one or more values in the list to evaluate to TRUE.
--"x != ANY (...)": The value must not match one or more values in the list to evaluate to TRUE.
--"x > ANY (...)": The value must be greater than the smallest value in the list to evaluate to TRUE.
--"x < ANY (...)": The value must be smaller than the biggest value in the list to evaluate to TRUE.
--"x >= ANY (...)": The value must be greater than or equal to the smallest value in the list to evaluate to TRUE.
--"x <= ANY (...)": The value must be smaller than or equal to the biggest value in the list to evaluate to TRUE.
select emp_name,salary from EMP_COLLEGE where salary >any
(select salary from EMP_COLLEGE where  job='clerk' )

---IN AND NOT IN
--display the NAMES OF employees who earn highest salary IN their respective departments?
select DEPT_ID,EMP_NAME,SALARY from EMP_COLLEGE where SALARY in (select max(SALARY) from EMP_COLLEGE group  by DEPT_ID );

--Find Employee Whose Sal Not In 100 

SELECT NAME,SAL FROM tabl WHERE SAL NOT IN (SELECT SAL FROM tabl WHERE SAL = 100);
SELECT NAME,sal FROM tabl WHERE sal NOT IN (100,200);
--FIND SAL WHOSE NAME NOT IN A,B,C
SELECT NAME,SAL FROM tabl WHERE NAME NOT IN ('A','B','C');

--Find Employee Whose Sal In 100 
SELECT NAME,SAL FROM tabl WHERE SAL IN (SELECT SAL FROM tabl WHERE sal != 100);
--MERGE
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
DELETE WHERE EMP_ID=15
 WHEN NOT MATCHED THEN 
INSERT   ( TAR.EMP_ID,TAR.SALARY, TAR.JOINING_DATE) 
VALUES (SRC.EMP_ID,SRC.SALARY, SRC.JOINING_DATE);
 
      
      UPDATE EMP_COLLEGE SET SALARY=76656 WHERE EMP_ID=7;
      -----------------------
      --JOINS INTERVIEW QUESTIONS
         SELECT * FROM TAB3
   SELECT * FROM TAB4
   INSERT INTO TAB4 VALUES(8,'H',400);
   
   CREATE TABLE A (ID NUMBER);
      INSERT INTO B VALUES(30);
      
       CREATE TABLE B (ID NUMBER);
      
      SELECT * FROM A
        SELECT * FROM B
        
        SELECT * FROM A
       INNER JOIN B
       ON
       A.ID=B.ID;
       
        SELECT * FROM A
       LEFT JOIN B
       ON
       A.ID=B.ID;
       
       
        SELECT * FROM A
       RIGHT JOIN B
       ON
       A.ID=B.ID;
       
        SELECT * FROM A
       FULL JOIN B
       ON
       A.ID=B.ID;
        
        
 SELECT * FROM A 
NATURAL JOIN B;
        
 
 SELECT * FROM A 
CROSS JOIN B;
        

   ------------------
  -- TEXT@SQL
--  show the name of the employee who has the biggest amount of salary last month
SELECT name
FROM Employee
WHERE id = (
    SELECT employee_id
    FROM Salary_Payments
    WHERE date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    ORDER BY amount DESC
    LIMIT 1
)

--list the most popular products
SELECT PRODUCT_ID, COUNT(*) AS num_orders
FROM sales
GROUP BY PRODUCT_ID
ORDER BY num_orders DESC

--increase income of all employees by 7% in a table
update emp set emp_salary=emp_salary+(emp_salary*7/100);

--analytical function rownumber,rank and denserank
select emp_id,emp_name,salary,dept_id
 ,row_number() over(order by salary desc)  as row_rm 
,rank() over(order by salary desc)  as rnk 
,dense_rank() over(order by salary desc)  as dense_rnk
FROM emp_college;

select * from sales_partitions

--PARTITION-partitioning addresses key issues in supporting very large tables and indexes  by letting you decomposes them into smaller and more m,anagable pieces called partition. 
--DDL statements can access and manupulate individuals partitions rather than entire tables or indexes.
--BENEFITS-(improve query performance,reduce the impact of schedule downtime for maintainnece operations,)
--TYPES(LIST,RANGE,HASH)

-- Create a table with partitioning
create table sales_partition(
sales_ID number primary key,
sales_date date,
amount number,
region varchar(50)
)
partition  by range(sales_date)
(partition sales_qut1 values less than(to_date('2023-04-01','yyyy-mm-dd')),
partition sales_qut2 values less than(to_date('2023-07-01','yyyy-mm-dd')),
partition sales_qut3 values less than(to_date('2023-10-01','yyyy-mm-dd')),
partition sales_qut4 values less than(maxvalue)
);

--insert sample data into partition tables
insert into sales_partition(sales_ID,sales_date,amount,region) values (1,to_date('2023-02-15', 'YYYY-MM-DD'),5000,'north');
insert into sales_partition(sales_ID,sales_date,amount,region) values (2,to_date('2023-05-15', 'YYYY-MM-DD'),7000,'east');
insert into sales_partition(sales_ID,sales_date,amount,region) values (3,to_date('2023-07-15', 'YYYY-MM-DD'),9000,'north');

--insert multiple sample data into partition tables
INSERT INTO sales_partition (sales_ID,sales_date,amount,region) 
  WITH names AS ( 
    SELECT 7,to_date('2023-07-10', 'YYYY-MM-DD'),9000,'north'    FROM dual UNION ALL 
    SELECT 5,to_date('2023-11-12', 'YYYY-MM-DD'),9000,'north'   FROM dual UNION ALL 
    SELECT 6,to_date('2023-08-5', 'YYYY-MM-DD'),9000,'north' FROM dual UNION ALL 
    SELECT 7, to_date('2023-01-1', 'YYYY-MM-DD'),9000,'north'    FROM dual 
  ) 
  SELECT * FROM names;
  
  -- Query the partitioned table
SELECT * FROM Sales_PARTITION PARTITION (sales_qut3);

--oracle sql develer version
  select * from v$version
  SET SERVEROUTPUT ON
  --how to rollback data truncate
  CREATE TABLE TruncateTest (ID INT);
INSERT INTO TruncateTest (ID)

SELECT 1 FROM DUAL
UNION ALL 
SELECT 2 FROM DUAL
UNION ALL
SELECT 3 FROM DUAL;
GO
-- Check the data before truncate
SELECT * FROM TruncateTest
GO
-- Begin Transaction
BEGIN TRAN
flashback   table TruncateTest before truncate; 
to timestamp to_timestamp('2016-08-11 07:30:00', 'YYYY-MM-DD HH:MI:SS'); 

insert into TruncateTest
select * from TruncateTest as of timestamp to_timestamp('2023-12-14 01:00:00', 'YYYY-MM-DD HH:MI:SS');
-- Truncate Table
TRUNCATE TABLE TruncateTest;
GO
-- Check the data after truncate
SELECT * FROM TruncateTest
GO
-- Rollback Transaction
ROLLBACK TRAN
GO
-- Check the data after Rollback
SELECT * FROM TruncateTest
GO
-- Clean up
DROP TABLE TruncateTest
GO

select * from sales1
--growth over period for each month
create table sales1 (id int, pid int, amt int, sdata date)
insert into sales1
select 1, 100, 1000, '01-jan-20' from dual union all
select 1, 800, 2000, '02-jan-20' from dual union all
select 2, 700, 3000, '03-jan-20' from dual union all
select 3, 600, 4000, '03-jan-22' from dual union all
select 3, 500, 5000, '04-jan-22' from dual union all
select 3, 400, 6000, '06-jan-21' from dual union all
select 2, 300, 7000, '08-jan-21' from dual union all
select 2, 200, 8000, '08-jan-21' from dual union all

select 1, 100, 1000, '01-feb-20' from dual union all
select 1, 800, 2000, '02-feb-20' from dual union all
select 2, 700, 3000, '03-feb-20' from dual union all
select 3, 600, 4000, '03-feb-22' from dual union all
select 3, 500, 5000, '04-feb-22' from dual union all
select 3, 400, 6000, '06-feb-21' from dual union all
select 2, 300, 7000, '08-feb-21' from dual union all
select 2, 200, 8000, '08-feb-21' from dual

select * from sales1

SELECT amt,sdata, SUM(amt) AS total_sales
FROM sales1 
where sdata betweento_char(jan) );
group by amt

having SUM(amt) between DATEDIFF(month,'2019-01-01' , '2019-01-28') and DATEDIFF(month,'2020-01-01' , '2020-01-28');
MINUS 
SELECT amt, sdata
FROM sales1
 order by sdata


select sdata as period ,
nvl(cast(round(((total - lag (total) over (order by to_char(to_date(sdata, 'mon-YY'), 'mon')))/lag (total) over (order by to_char(to_date(sdata, 'mon-YY'), 'mon'))) * 100
) as varchar2(20)), '0') || '%' as growth, total
from (select  to_char(sdata, 'mon-YY') sdata, sum(amt) total from sales group by to_char(sdata, 'mon-YY') order by to_char(sdata, 'mon-YY')
)

--
select * from course_detail

create table course_details(
course_id number(20)
,course_name varchar2(200),
course_fees number(20),
course_duration varchar(200));