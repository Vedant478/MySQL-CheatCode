##################################### Operators ##################################################

#1.Write a query to display the job titles whose MAX_SALARY is less than or equal to 20000.
select * from jobs;
Select max_salary , job_title from jobs where max_salary <= 20000 order by max_salary ;

#21.Write a query to find employees with a salary greater than 5000.
Select salary , concat(first_name , " ", last_name ) as full_name from employees where salary > 5000;

#2.Write a query to display employees who do not belong to department 90.
Select concat(first_name, " " , last_name ) as full_name,department_id from employees where DEPARTMENT_ID != 90;
  

#3.Write a query to find employees with a salary less than 4000.
Select concat(first_name, " " , last_name ) as full_name , salary from employees where salary < 4000;

#4.Write a query to display employees whose COMMISSION_PCT is not null.Write a query to display employees whose MANAGER_ID is null.
Select * from employees;
Select concat(first_name, " ", last_name) as full_name , commission_pct from employees where commission_pct is not null;  

#5.Write a query to find employees in departments with IDs greater than 50.
Select concat(first_name, " ", last_name) as full_name , department_id from employees where department_id > 50; 

#6.Write a query to display the employees with DEPARTMENT_ID equal to 90.
Select concat(first_name, " ", last_name) as full_name , department_id from employees where department_id = 90; 

#7.Write a query to display employees in department ID 100, 200, or 300.
Select concat(first_name, " ", last_name) as full_name , department_id from employees where department_id in (100,200,300); 
select * from employees;

#8.Write a query to display jobs where MAX_SALARY is greater than or equal to 10000.
use hr;
Select job_id , max_salary as salary from jobs where max_salary = 10000 ;

#9.Write a query to find departments where the location is 1700
Select *  from departments;
Select department_name , department_id , location_id from departments where location_id =1700 ;

#10.Write a query to find countries where REGION_ID is greater than or equal to 2.
Select region_id , country_name from countries where region_id = 2;


