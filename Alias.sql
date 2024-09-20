use hr;

## Question 1 : Write a query to display EMPLOYEE_ID as ID, FIRST_NAME as First, and LAST_NAME as Last from the employees table.
SELECT EMPLOYEE_ID AS ID, FIRST_NAME AS First, LAST_NAME AS Last
FROM employees;

## Question 2 : Write a query to display JOB_ID as JobCode, JOB_TITLE as Title, and MIN_SALARY as MinimumSalary from the jobs table.
desc jobs;
Select job_id as JobCode, Job_title as Title, min_salary as MinimunSalary from jobs;

## Question 3 : Write a query to display the FIRST_NAME and LAST_NAME of employees from the employees table by using an alias e for the table.
SELECT e.FIRST_NAME, e.LAST_NAME
FROM employees AS e;

## Question 4 : Write a query to display the EMPLOYEE_ID and the full name (FIRST_NAME + ' ' + LAST_NAME as FullName) of employees, and sort the result by FullName in descending order.
desc employees;
Select employee_id, concat(first_name, ' ',last_name ) as FullName from employees order by (FullName) desc;

## Question 5 : Write a query to display EMPLOYEE_ID as ID, FIRST_NAME as Name, and SALARY as Income from the employees table for employees with a salary greater than 5000, using aliases for the columns.
SELECT EMPLOYEE_ID AS ID, FIRST_NAME AS Name, SALARY AS Income
FROM employees
WHERE SALARY > 5000;
