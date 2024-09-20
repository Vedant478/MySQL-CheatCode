use hr_assign;

## Question 1 : Write a SQL statement to change the email column of the employees table with 'not available' for all employees.
select * from employees1;
update employees1 set email = 'not available';

## Question 2 : Write a SQL statement to change the email and commission_pct column of employees table with 'not available' and 0.10 for all employees.
update employees1 set email = 'not available' , commission_pct= '0.10';

# Question 3 : Write a SQL statement to change the email and commission_pct column of employees table with 'not available' and 0.10 for those employees whose department_id is 110.
update employees1 set email = 'not available' , commission_pct= '0.10' where department_id = 110;

# Question 4 : Write a SQL statement to change the email column of employees table with 'not available' for those employees whose department_id is 80 and gets a commission_pct is less than .20 
update employees1 set email = 'not available' where department_id =80 ;
Select * from employees1 where COMMISSION_PCT < 0.2;

# Question 5 : Write a SQL statement to change the email column of the employees table with 'not available' for those employees who belong to the 'Accounting' department.
update employees1 set email = 'not available' where job_id ='FI_ACCOUNT';

# Question 6 : Write a SQL statement to change the salary of an employee to 8000 whose ID is 105, if the existing salary is less than 5000.
update employees1 set salary = 8000 where employee_id = 105 and salary < 5000;
Select * from employees1 where employee_id = 105;

# Question 7 : Write a SQL statement to change the job ID of the employee whose ID is 118, to SH_CLERK if the employee belongs to the department, whose ID is 30 and the existing job ID does not start with SH.
UPDATE employees1 SET job_id = 'SH_CLERK' WHERE employee_id = 118 AND department_id = 30 AND job_id NOT LIKE 'SH%';
Select * from employees1 WHERE employee_id = 118 AND department_id = 30;

# Question 8 : Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company rules that salary will be increased by 25% for department 40, 15% for department 90 and 10% for department 110 and the rest of the departments will remain the same.

UPDATE employees
SET salary = CASE
    WHEN department_id = 40 THEN salary * 1.25
    WHEN department_id = 90 THEN salary * 1.15
    WHEN department_id = 110 THEN salary * 1.10
    ELSE salary
END;

#Question 9 : Write a SQL statement to increase the minimum and maximum salary of PU_CLERK by 2000 as well as the salary for those employees by 20% and commission percent by .10. 
UPDATE job_salaries
SET min_salary = min_salary + 2000,
    max_salary = max_salary + 2000
WHERE job_id = 'PU_CLERK';

UPDATE employees1
SET salary = salary * 1.20,
    commission_percent = commission_percent + 0.10
WHERE job_id = 'PU_CLERK';



