-- Exercise 1: Accessing Multiple Tables with Sub-Queries
SELECT *
FROM EMPLOYEES;

SELECT *
FROM JOBS;

-- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS 
-- table.
SELECT *
FROM EMPLOYEES AS E, JOBS AS J
WHERE E.JOB_ID = J.JOB_IDENT;

SELECT *
FROM EMPLOYEES
WHERE JOB_ID IN (SELECT JOB_IDENT FROM JOBS);

-- Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
SELECT *
FROM EMPLOYEES
WHERE JOB_ID IN (SELECT JOB_IDENT 
				FROM JOBS
				WHERE JOB_TITLE = 'Jr. Designer');

-- Retrieve JOB information and list of employees who earn more than $70,000.
SELECT *
FROM JOBS
WHERE JOB_IDENT IN (SELECT JOB_ID
				FROM EMPLOYEES
				WHERE SALARY > 70000);

-- Retrieve JOB information and list of employees whose birth year is after 
-- 1976.
SELECT *
FROM JOBS
WHERE JOB_IDENT IN (SELECT JOB_ID
				FROM EMPLOYEES
				WHERE YEAR(B_DATE) > 1976);

-- Retrieve JOB information and list of female employees whose birth year is 
-- after 1976.
SELECT *
FROM JOBS
WHERE JOB_IDENT IN (SELECT JOB_ID
				FROM EMPLOYEES
				WHERE YEAR(B_DATE) > 1976 AND SEX = 'F');
				


-- Exercise 2: Accessing Multiple Tables with Implicit Joins
SELECT *
FROM EMPLOYEES;

SELECT *
FROM JOBS;

-- Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.
SELECT *
FROM EMPLOYEES, JOBS;

-- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS 
-- table.
SELECT *
FROM EMPLOYEES, JOBS
WHERE EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;

-- Redo the previous query, using shorter aliases for table names.
SELECT *
FROM EMPLOYEES AS E, JOBS AS J
WHERE E.JOB_ID = J.JOB_IDENT;

-- Redo the previous query, but retrieve only the Employee ID, Employee 
-- Name and Job Title.
SELECT EMP_ID, F_NAME, L_NAME, JOB_TITLE
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT;

-- Redo the previous query, but specify the fully qualified column names 
-- with aliases in the SELECT clause.
SELECT E.EMP_ID, E.F_NAME, E.L_NAME, J.JOB_TITLE
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT;