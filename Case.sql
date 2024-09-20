### Case Conditions ########

Select employee_id,first_name,last_name, hire_date,MANAGER_ID,
case
	when manager_id =100 then 'ADMIN'
	when manager_id =201 then 'MARKETING'
    when manager_id =108 then 'FINANCE'
end as  manager_details
from employees order by manager_details desc;

#######################################################################
Select employee_id , first_name, last_name , salary, 
case
	when salary <=5000 then "Salary is low"
    when salary between 5000 and 10000 then "Salary is of average range"
    when salary >=10000 then "Salary is high"
end as salary_deatails 
from employees order by salary_deatails desc;

desc locations;
desc departments;
Select department_id, department_name, location_id,
case 
	when location_id = 1700 then "USA"
    when location_id = 1800 then "UK" 
    when location_id = 2500 then "CANADA"
	else "other"
end as location_details
from departments order by location_id;

#Write a query to give bonus to employees who is having job id as 'AD_VP','IT_PROG',give the employees the bonus of 50% of their salary
Select first_name , last_name , job_id , salary,
case
	when job_id = "AD_VP" then salary*0.5
    when job_id = "IT_PROG" then salary*0.5
    else "NO BONUS"
end as Bonus_deatils
from employees order by Bonus_deatils ;

#Write a query to select employee who get bonus if they are in department = 90 and salary > 1000 
Select first_name , last_name , salary , department_id from employees
where
case 
	when department_id = 90 then 1
    when salary>10000 then 1 
    else 0
    end =1;
    
############### If Condtion #######################
select first_name,salary,
if(salary>10000,"GOOD SALARY","POOR SALARY") from employees;

Select location_id,city, 
if (location_id=1000 or location_id=1700,"EGYPT",NULL ) as location_details from locations; 

Select first_name,salary, avg(if(salary>500,salary,null)) as sal_details from employees;
SELECT AVG(IF(salary > 500, salary, NULL)) AS sal_details
FROM employees;

SELECT first_name, salary, AVG(IF(salary > 5000, salary, NULL)) AS sal_details
FROM employees
GROUP BY first_name, salary;

############ GROUP BY CLAUSE #####################

select count(*) from employees group by department_id;
select department_id ,count(*) from employees group by department_id;

Select department_id ,sum(salary) from employees group by department_id;


# fiND NO. OF EMPLOYEE HIRED IN EACH MONTH FOR ANY SPECIFIC YEAR 
select month(hire_date) , count(*) no_emp from employees where year(hire_date)=1987 group by month(hire_date);

## Find the department with more than 5 employees 
Select *  from employees;
Select * from departments;

select department_id, count(*) no_emp from employees group by department_id having no_emp>5 ;

use hr;
select * from employees;
#Find the job title with an average salaray greter than 5000 
Select job_id, avg(salary) from employees group by job_id having avg(salary)>5000;

#Find the department with total expenses between 2000 to 5000
Select *  from employees;
Select department_id,sum(salary), count(*) from employees group by department_id having sum(salary) between 20000 and 50000 ;

# find the department where the number of employee is greater than 5 and avg sal>5000;
Select department_id, count(employee_id) , avg(salary) 
from employees 
group by department_id having count(employee_id)>5 and avg(salary)>5000; 

# Find the department where the number of employees is greater than 3  who joined on 1jan 1987 and total expense of sal is 5000
Select * from employees;
SELECT department_id ,count(employee_id)
FROM employees
WHERE hire_date = '1987-10-01'
GROUP BY department_id
HAVING COUNT(employee_id) = 1
   AND SUM(salary) > 5000;

# Find the department along wth the total bumber of employees and max salary for each department 
#including only those department whoes maximum slaary is more than 1000

Select department_id, count(employee_id), max(salary) 
from employees 
group by department_id having max(salary) > 1000;
