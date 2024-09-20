#1. Write a query to find the name (first_name, last_name) and the salary of the employees who have a higher salary 
#than the employee whose last_name='Bull'.

Select concat(first_name," ",last_name) as  Full_name from employees 
where salary > (Select salary from employees where last_name = "Bull");

#2. Write a query to find the name (first_name, last_name) of all employees who works in the IT department.

Select concat(first_name," ",last_name) as full_name from employees 
where employee_id in (Select employee_id from employees where job_id= "IT_PROG");

#3.Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a USA based department.

#4.Write a query to find the name (first_name, last_name) of the employees who are managers.
 
Select concat(first_name," ",last_name) as full_name from employees 
where EMPLOYEE_ID in (Select employee_id from employees where Job_id like ("%MGR") or Job_id like("%MAN"));

#5.Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.

Select concat(first_name," ",last_name) as full_name from employees 
	where salary > (Select avg(salary) from employees);

	#6.Write a query to find the name (first_name, last_name), and salary of the employees whose salary is equal to the minimum salary for their job grade.

	SELECT concat(first_name," ",last_name) as full_name, salary, job_id
	FROM employees e
	WHERE salary = (
		SELECT MIN(salary)
		FROM employees
		WHERE job_id = e.job_id
	);

	#7.Write a query to find the name (first_name, last_name), and salary of the employees 
	#who earns more than the average salary and works in any of the IT departments.

	Select concat(first_name," ",last_name) as full_name from employees
	where salary > (Select avg(salary) from employees where job_id="IT_PROG");

	#8.Write a query to find the name (first_name, last_name), and salary of the employees 
	#who earns more than the earning of Mr. Bell.

	Select concat(first_name," ",last_name) as full_name, salary from employees
	where salary > (Select salary from employees where last_name = "Bell"); 

	#9.Write a query to find the name (first_name, last_name), and salary of the employees 
	#who earn the same salary as the minimum salary for all departments.
	SELECT concat(first_name," ",last_name) as full_name, salary, DEPARTMENT_ID
	FROM employees e
	WHERE salary = (
		SELECT MIN(salary)
		FROM employees
		WHERE department_id = e.department_id
	);

	#10.Write a query to find the name (first_name, last_name), and salary of the employees 
	#whose salary is greater than the average salary of all departments.
SELECT concat(first_name," ",last_name) as full_name, salary, DEPARTMENT_ID
FROM employees e
WHERE salary > (
    SELECT avg(salary)
    FROM employees
    WHERE department_id = e.department_id
);

#11.Write a query to find the name (first_name, last_name) and salary of the employees 
#who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). 
#Sort the results of the salary of the lowest to highest.
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (
    SELECT MAX(salary)
    FROM employees
    WHERE job_id = 'SH_CLERK'
)
ORDER BY salary ASC;

#12.Write a query to find the name (first_name, last_name) of the employees who are not supervisors.
Select concat(first_name," ",last_name) as full_name , job_id from employees 
where EMPLOYEE_ID in (Select employee_id from employees where Job_id not like ("%CLERK"));

#13.Write a query to display the employee ID, first name, last name, 
#and department names of all employees.
SELECT employee_id, first_name, last_name, 
       (SELECT department_name 
        FROM departments d 
        WHERE d.department_id = e.department_id) AS department_name
FROM employees e;

#14.Write a query to display the employee ID, first name, last name, salary of all employees whose salary is above average for their departments.
SELECT employee_id, first_name, last_name, salary,department_id
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
)
ORDER BY salary DESC;

#15. Write a query to fetch even numbered records from employees table.
Select * from employees where EMPLOYEE_ID in (Select EMPLOYEE_ID from employees where mod(employee_id,2)=0);

#16 Find 5th maximum salary
SELECT MAX(salary) AS fifth_max_salary
FROM employees
WHERE salary < (
    SELECT DISTINCT salary
    FROM employees
    ORDER BY salary DESC
    LIMIT 4, 1
);

#17.Write a query to find the 4th minimum salary in the employees table
SELECT MIN(salary) AS fourth_min_salary
FROM employees
WHERE salary < (
    SELECT DISTINCT salary
    FROM employees
    ORDER BY salary DESC
    LIMIT 3, 1
);

#18.Write a query to select last 10 records from a table.
Select * from employees 
where EMPLOYEE_ID in (Select EMPLOYEE_ID from employees order by salary) 
order by EMPLOYEE_ID desc LIMIT 10;

#19.Write a query to list the department ID and name of all the departments where no employee is working.

SELECT d.department_id, d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);

#20.Write a query to get 3 maximum salaries.
Select salary from employees where salary in (SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC)
LIMIT 3;

#21 Minimun salaries
Select salary from employees where salary in (SELECT DISTINCT salary
FROM employees
ORDER BY salary)
Order by salary asc
LIMIT 3 ;

#22 Write a query to get nth maximum salaries of employees.
SELECT salary
FROM employees e1
WHERE 1 = (
    SELECT COUNT(DISTINCT salary)
    FROM employees e2
    WHERE e2.salary > e1.salary
);

################################################### JOINS ####################################################
Select *  from employees;
Select * from departments;
Select * from locations;
Select * from countries;
Select * from jobs;
Select * from job_history;

#1.Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.

Select d.location_id ,  l.street_address,l.city , l.state_province, c.country_name ,d.department_id
from departments as d
Join locations as l on 
d.location_id = l.location_id
Join countries as c on
l.country_id = c.country_id;

#2.Write a query to find the name (first_name, last name), department ID and name of all the employees.
Select e1.first_name , e1.last_name , e1.department_id 
from employees as e1
Join employees as e2 on
e1.employee_id = e2.employee_id;

#3 Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.
Select e.first_name,e.last_name,e.job_id,e.department_id from employees as  e
Join departments as d on
e.department_id = d.department_id
Join locations as l on 
l.location_id = d.location_id
where l.city = "London";

# 3) Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.
select concat(first_name, ' ', last_name) as full_name, d.department_id, e.job_id from employees e
join departments d on
e.DEPARTMENT_ID=d.DEPARTMENT_ID
join locations l on
d.LOCATION_ID=l.LOCATION_ID
where city = 'London';

# 4)  Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).
select e.EMPLOYEE_ID, e.LAST_NAME as name, e1.MANAGER_ID, e1.LAST_NAME as mana_name
from employees e
join employees e1 on
e.EMPLOYEE_ID=e1.MANAGER_ID;

# 5) Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones.
select e.first_name, e.last_name , e.hire_date
from employees e
join employees e1 on
e.HIRE_DATE>e1.HIRE_DATE
where e1.LAST_NAME = 'jones';

# 6) Write a query to get the department name and number of employees in the department.
select d.department_name, count(e.employee_id) from employees e
join departments d on
e.DEPARTMENT_ID=d.DEPARTMENT_ID
group by d.DEPARTMENT_ID;

# 7)  Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.
select e.EMPLOYEE_ID, j1.JOB_TITLE, datediff(j.end_date,j.start_date)  from employees e
join job_history j on
e.JOB_ID=j.JOB_ID
join jobs j1 on
j.JOB_ID=j1.JOB_ID
where j.DEPARTMENT_ID = 90;

# 8)  Write a query to display the department ID and name and first name of manager.
select d.DEPARTMENT_ID, d.DEPARTMENT_NAME, e.first_name as manager
from departments d
join employees e on
d.MANAGER_ID=e.EMPLOYEE_ID;

# 9)  Write a query to display the department name, manager name, and city.
select d.DEPARTMENT_NAME, e.first_name as manager , l.city
from departments d
join employees e on
d.MANAGER_ID=e.EMPLOYEE_ID
join locations l on
d.LOCATION_ID=l.LOCATION_ID;




#10.Write a query to display the job title and average salary of employees.
Select avg(e.salary), j.job_title
from employees as e 
Join jobs as j on 
e.job_id = j.job_id
group by job_title;

#11.Write a query to display job title, employee name, and the difference between salary 
#of the employee and minimum salary for the job.
Select j.job_title , concat(e.first_name ,' ',e.last_name) , (e.salary - j.min_salary) as diff from employees as e
Join jobs as j on 
e.job_id = j.job_id;

#12.Write a query to display the job history that were done by any employee who is 
#currently drawing more than 10000 of salary.

Select e.employee_id ,e.salary, jh.start_date ,jh.job_id, jh.end_date from job_history as jh 
Join employees as e on
jh.employee_id = e.employee_id
where e.salary > 10000 ;

#13.Write a query to display department name, name (first_name, last_name), hire date, 
#salary of the manager for all managers whose experience is more than 15 years.

SELECT d.department_name, 
       e.first_name, 
       e.last_name, 
       e.hire_date, 
       e.salary
FROM employees e
JOIN departments d 
  ON e.department_id = d.department_id
WHERE e.job_id LIKE '%MGR' or e.job_id LIKE '%MAN'
  AND DATEDIFF(CURDATE(), e.hire_date) / 365 > 15; 

