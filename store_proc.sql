SELECT * FROM EMPLOYEE;
SELECT * FROM DEPT;
-- Enable DBMS_OUTPUT for displaying results
SET SERVEROUTPUT ON;

--1.CREATE STORE PROCEDURE FOR FIND MAX SALARY OF THE EMPLOYE FROM TABLE
CREATE OR REPLACE PROCEDURE FindMaxSalaryProc AS
  v_max_salary NUMBER;
BEGIN
  -- Use an aggregate function to find the maximum salary
  SELECT MAX(sal)
  INTO v_max_salary
  FROM employee;

  -- Display the result
  DBMS_OUTPUT.PUT_LINE('Maximum Salary: ' || v_max_salary);
END FindMaxSalaryProc;
/
-- Execute the stored procedure
EXEC FindMaxSalaryProc;

--2.CREATE STORE PROCEDURE FOR FIND MIN SALARY OF THE EMPLOYE FROM TABLE
CREATE OR REPLACE PROCEDURE FindMinSalaryProc
AS v_min_salary NUMBER;
BEGIN
  -- Use an aggregate function to find the maximum salary
SELECT min(sal)
into v_min_salary
from employee;

 -- Display the result
DBMS_OUTPUT.PUT_LINE('Minimum Salary: ' || v_min_salary);
END FindMinSalaryProc;
/
---- Execute the stored procedure
exec FindMinSalaryProc;

--3.CREATE STORE PROCEDURE FOR FIND SECOND HIGHEST SAL OF THE EMPLOYEE FROM TABLE
CREATE OR REPLACE PROCEDURE FinSecHighSalProc as
v_sec_high_sal number;
begin
select max(sal)
into v_sec_high_sal
 from employee
 where sal<(select max(sal) l from employee);
 
-- DBMS_OUTPUT.PUT_LINE('Second Highest Salary'||v_sec_high_sal );
  -- Display the result
  IF v_sec_high_sal IS NOT NULL THEN
    DBMS_OUTPUT.PUT_LINE('Second Highest Salary: ' || v_sec_high_sal);
  ELSE
    DBMS_OUTPUT.PUT_LINE('No Second Highest Salary found.');
  END IF;
 end FinSecHighSalProc;
 /
 
 exec FinSecHighSalProc;
 
 --4. CREATE STORE PROCEDURE FOR FIND Nth HIGHEST SALARY FROM TABLE USING ANALYTICAL FUNC

CREATE OR REPLACE PROCEDURE FindNthHighestSalaryProc2(N IN NUMBER) AS
  v_nth_highest_salary NUMBER;
BEGIN
  -- Use a cursor and a counter variable to find the Nth highest salary
  FOR rec IN (
    SELECT sal
    FROM (
      SELECT sal, DENSE_RANK() OVER (ORDER BY sal DESC) AS rnk
      FROM employee
    ) 
    WHERE rnk = N
  ) 
  LOOP
    v_nth_highest_salary := rec.sal;
  END LOOP;

  -- Display the result
  IF v_nth_highest_salary IS NOT NULL THEN
    DBMS_OUTPUT.PUT_LINE('The ' || N || 'th Highest Salary: ' || v_nth_highest_salary);
  ELSE
    DBMS_OUTPUT.PUT_LINE('No ' || N || 'th Highest Salary found.');
  END IF;
END FindNthHighestSalaryProc2;
/

EXEC FindNthHighestSalaryProc2(3);
