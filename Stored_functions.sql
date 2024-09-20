############## 
# drop function function_name;
Select to_get_emp(100);

#Find the employee department id using employee first_name
Select department_id from employees where first_name = 'LEX';

Select to_find_dept_using_f_name("LEX");

#Find the salary of the employee using the employee id 
Select salary from employees where employee_id = 100;
Select get_salary(100);

#Write a function to find the year of experience using employee_id
SELECT TIMESTAMPDIFF(YEAR, hire_date, CURDATE())
    FROM employees 
    WHERE employee_id = 102;
    
Select get_experience(101); 

#Write a query to find total number of employee who is manager give the input as manager
SELECT COUNT(*) AS total_employees
FROM employees
WHERE manager_id = 101;

Select get_total_employees_by_manager(103);

#Find the number of employee wokring in a dept with specific 
#job_id and earning more than the min_sal

Select get_using_job_sal("IT_PROG",5000);

#Write a fucntion to return total salary for employee working in specfic department
Select get_total_salary_by_depart(50);

#get department name if department is located in the given location;
Select get_emp_location_emp(10,1700);

delimiter $$
create function get_employeeId (emp_id int)
returns varchar(1000)
deterministic 
begin 
	declare emp_details varchar(1000);
    select group_concat(concat(first_name," ",last_name," who works in ",d.department_name) separator "," )
    into emp_details from employees e 
    join departments d
    on d.department_id = e.department_id
    where employee_id = emp_id;
    return emp_details;
end ;; 
$$
delimiter ;
select get_employeeID (102);

# show the employee_list or details working in particular city 
Select concat(first_name," ",last_name, " who works in ", l.city) from employees as e
Join departments as d on 
e.employee_id = d.department_id
Join locations as l on 
d.location_id = l.location_id
where l.city = "Seattle";

delimiter $$
create function get_employeeDet4 (city varchar(100))
returns varchar(1000)
deterministic 
begin 
	declare emp_details varchar(1000);
    Select group_concat(concat(first_name," ",last_name, " who works in ", l.city , char(10))) into emp_details from employees as e
	Join departments as d on 
	e.employee_id = d.department_id
	Join locations as l on 
	d.location_id = l.location_id
	where l.city = city;
    return emp_details;
end ;; 
$$
delimiter ;

Select get_employeeDet4("Seattle");
Select * from locations;
Select count(location_id) from locations;
Select count(State_province) from locations;

delimiter $$
create function by_deptid (dept_id int)
returns int
deterministic
begin 
	declare avg_sal int;
    select avg(salary) into avg_sal from employees where department_id = dept_id;
	return avg_sal;
end;;
$$
delimiter ;
Select by_deptid(50);