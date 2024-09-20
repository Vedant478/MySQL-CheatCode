#1.Write a SQL query to find the number of employees hired in each year.
use hr;

Select year(hire_date), count(*) as no_emp_hired from employees group by year(hire_date);

#2.Write a SQL query to find the number of employees in each department.
Select department_id, count(employee_id) as no_of_employees from employees group by department_id;

#3.Write a SQL query to find the department with the highest total salary.
Select department_id, max(salary) as highest_salary from employees 
group by department_id 
order by highest_salary desc Limit 1;

#4.  Write a query to list the number of jobs available in the employees table.
Select job_id , count(job_id) as number_of_jobs from employees group by job_id order by number_of_jobs desc;

#5.Write a query to get the total salaries payable to employees.
Select * from departments;
SELECT department_id, SUM(salary) AS total_salaries
FROM employees
GROUP BY department_id;

#6.Write a query to get the minimum salary from the employees table.
SELECT department_id, MIN(salary) AS total_salaries
FROM employees
GROUP BY department_id;
 
#7.Write a query to get the maximum salary of an employee working as a Programmer. 
SELECT first_name, last_name,job_id, max(salary) AS total_salaries
FROM employees
where job_id="IT_PROG"
GROUP BY first_name,last_name,job_id order by total_salaries desc limit 1 ;

#8.Write a query to get the average salary and number of employees working the department 90. 
Select department_id,count(department_id) as no_employees , avg(salary) 
from employees 
group by department_id having department_id = 90;

#9.Write a query to get the highest, lowest, sum, and average salary of all employees. 
Select max(salary),min(salary),sum(salary),avg(salary)
from employees ;

#10.Write a query to get the number of employees with the same job
Select job_id, count(employee_id) as no_employees 
from employees 
group by job_id order by count(employee_id) desc;

#11.Write a query to get the difference between the highest and lowest salaries. 
SELECT department_id,
       (MAX(salary) - MIN(salary)) AS salary_difference
FROM employees
GROUP BY department_id ;

#12. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager. 
Select MIN(salary) as minimum_salary, manager_id 
from employees 
group by manager_id order by manager_id;
Select min(salary) from employees;

#13. Write a query to get the department ID and the total salary payable in each department.
Select department_id , sum(salary) 
from employees
group by department_id ;

#14.Write a query to get the average salary for each job ID excluding programmer. 
Select avg(salary) as average_salary , job_id
from employees
group by job_id having job_id <> "IT_PROG";

#15. Write a query to get the total salary, maximum, minimum, average salary of employees 
#(job ID wise), for department ID 90 only.
Select sum(salary),max(salary),min(salary),avg(salary), job_id,department_id from employees 
group by job_id,department_id having department_id = 90;

#16. Write a query to get the job ID and maximum salary of the employees where maximum 
#salary is greater than or equal to $4000.
Select max(salary) , job_id from employees 
group by job_id having max(salary) >= 4000;

#17. Write a query to get the average salary for all departments employing more than 10 employees. 
Select count(employee_id) , avg(salary) , department_id from employees
group by department_id having count(employee_id)>10;
