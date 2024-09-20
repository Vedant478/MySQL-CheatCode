# find employees whoes manager id is 110;
Select employee_id from employees where manager_id=101;

Select * from employees where employee_id in (Select employee_id from employees where manager_id=101);

# Write a query to display first name , last name and department_id of employees who is working in the same department as Steven
Select * from employees;
Select first_name , last_name , department_id from employees where first_name = "Steven";
Select first_name,last_name,department_id from employees where department_id in (Select DEPARTMENT_ID from employees where FIRST_NAME= 'Nandita');

# Find the employee(Full details) who earns highest salary 
Select max(salary) from employees ;

Select * from employees where SALARY in (Select max(salary) from employees);

#Find department_id and the no. of employees in the deparment who is having employees > 5 
####################### (GROUP BY AND SUBQUERY) IMPORTANT #######################################
Select department_id from employees group by DEPARTMENT_ID having count(employee_id)>5; 

Select department_id , count(*) as no_emp from employees 
where department_id in 
(Select department_id from employees group by DEPARTMENT_ID having count(employee_id)>5) 
group by department_id;

################# Find the employees whose salary is above than average salary of all employees 
Select * from employees where salary > (Select avg(salary) from employees);

### Write a query to display department_id of departments that dont have any employees 

Select DEPARTMENT_ID from employees where DEPARTMENT_ID is null;
Select department_id from employees where DEPARTMENT_ID in (Select DEPARTMENT_ID from employees where DEPARTMENT_ID is null);

#### Find the department with highest number of employees 
Select count(employee_id) from employees;
Select department_id from employees where DEPARTMENT_ID in (Select count(employee_id) from employees);

Select department_id from   
(SELECT department_id,count(*) no_emp 
FROM employees
GROUP BY department_id
ORDER BY COUNT(employee_id) DeSC
LIMIT 1) as max_dept;

############# LEAST employees ######################
Select department_name from departments where department_id in
(Select department_id from   
(SELECT department_id,count(*) no_emp 
FROM employees
GROUP BY department_id
ORDER BY COUNT(*) desc 
LIMIT 1) as max_dept);

#####################################################################################
# find employees with department_id from departments that are located in   
#seattle and employees who work in those department.

Select location_id from locations where city="Seattle";

Select department_id from departments where LOCATION_ID in 
(Select location_id from locations where city="Seattle");

select first_name , last_name , department_id from employees where department_id in 
(Select department_id from departments where LOCATION_ID in 
(Select location_id from locations where city="Seattle"));

# Write a query to display first_name , last_name department_id from employees who 
#works in department located in cities whos name starts with s
Select * from locations where city like "S%";
Select location_id from locations where city LIKE "S%";

Select department_id from departments where LOCATION_ID in 
(Select location_id from locations where city LIKE "S%");

select first_name , last_name , department_id from employees where department_id in 
(Select department_id from departments where LOCATION_ID in 
(Select location_id from locations where city LIKE "S%"
));

## Write a query to find department that have more than 5 employees in located in New York 
Select * from employees;
Select * from departments;
select * from locations;

select location_id from locations where city="Seattle";

Select department_id from departments 
where location_id in (select location_id from locations where city="Seattle");

Select count(employee_id),department_id from employees where department_id in (Select department_id from departments 
where location_id in 
(select location_id from locations where city="Seattle")) 
group by department_id having count(employee_id)>5;

  
