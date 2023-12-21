create table employee(
emp_no number(20) primary key,
ename varchar(200),
job varchar(200),
manager varchar(200),
hiredate date,
sal number(20),
comm number(20)
);

create table dept(
dept_no number(20) primary key,
dname varchar(200),
loc varchar(200)
);
--drop column
ALTER TABLE dept
DROP COLUMN emp_no;
--add new column in table
ALTER TABLE employee
ADD deptno number(20);

--alter datatype of column
ALTER TABLE employee MODIFY  manager number(20);

--alter column name
ALTER TABLE employee
RENAME COLUMN manager to mgr;

ALTER TABLE deptno RENAME TO dept; 
--drop table from db
drop table dept
select * from employee;
select * from dept;
--update column record to new 
UPDATE employee
SET deptno = 20
WHERE ename = 'jones';

ALTER TABLE deptno RENAME TO dept; 

INSERT INTO employee (emp_no,ename,job,mgr,hiredate,sal,comm,deptno) 
  WITH names AS ( 
    SELECT 7369,'smith','clerk','7902',to_date('1980-dec-17', 'YYYY-Mon-DD'),800,'',20    FROM dual UNION ALL 
    SELECT 7499,'allen','salesman','7698',to_date('1981-feb-20', 'YYYY-Mon-DD'),1600,'300',30   FROM dual UNION ALL 
    SELECT 7521,'warrd','salesman','7698',to_date('1981-feb-20', 'YYYY-Mon-DD'),1250,'500',30 FROM dual UNION ALL 
    SELECT 7566,'jones','manager','7839',to_date('1981-apr-02', 'YYYY-Mon-DD'),2975,'',20   FROM dual 
  ) 
  SELECT * FROM names;
  
  
INSERT INTO employee (emp_no,ename,job,mgr,hiredate,sal,comm,deptno) 
  WITH names AS ( 
    SELECT 7839,'king','president','7698',to_date('1981-nov-17', 'YYYY-Mon-DD'),5000,'',10 FROM dual UNION ALL 
    SELECT 7844,'turner','salesman','7698',to_date('1981-sep-08', 'YYYY-Mon-DD'),1500,'0',30   FROM dual UNION ALL 
    SELECT 7876,'adams','clerk','7788',to_date('1983-jan-12', 'YYYY-Mon-DD'),1100,'',20 FROM dual UNION ALL 
    SELECT 7900,'james','clerk','7698',to_date('1981-dec-03', 'YYYY-Mon-DD'),950,'',30    FROM dual union all
        SELECT 7902,'ford','analyst','7566',to_date('1981-dec-03', 'YYYY-Mon-DD'),3000,'',20 FROM dual UNION ALL 
                SELECT 7934,'miller','clerk','7782',to_date('1982-jan-23', 'YYYY-Mon-DD'),1300,'',10 FROM dual 
) 
  SELECT * FROM names;
  
  
INSERT INTO dept (dept_no,dname,loc) 
  WITH names AS ( 
    SELECT 10,'accounting','newyork' FROM dual UNION ALL 
    SELECT 20,'research','dallas'    FROM dual UNION ALL 
    SELECT 30,'sales','chicago'  FROM dual UNION ALL 
    SELECT 40,'operations','boston'  FROM dual 
  ) 
  SELECT * FROM names;
  
  
  select * from employee;
select * from dept;

--Display unique Jobs from EMP table?
select distinct job from employee;
select unique job from employee;
--2. List the emps in the asc order of their Salaries?
select * from employee order by sal asc;
--3.List the details of the emps in asc order of the Dptnos and desc of Jobs?
select * from employee  order by deptno asc,job desc;
--4.Display all the unique job groups in the descending order?
select distinct(job) from employee order by job desc
--5.Display all the details of all ‘Mgrs’
Select * from employee where emp_no in 
(select mgr from employee);
