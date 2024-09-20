use hr;
#1.Select the first name, last name, and salary of employees whose salaries are greater than $50,000 and who work in the 'Sales' department.
Select first_name,last_name, salary , d.department_name from employees as e 
join departments as d
on e.department_id = d.department_id 
where d.department_name = "Sales" and salary > 10000;

#2.Write a SQL query to retrieve the first name, last name, and hire date of employees who were hired in the last three years.
SELECT first_name, last_name, hire_date
FROM employees
WHERE TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) <= 3;


#3.Write a SQL query to find the average salary of employees in each department. Include the department name in the results.
Select avg(salary) , d.department_name from employees as e 
join departments as d 
on e.department_id = d.department_id 
group by d.department_name;

#4.Write a SQL query to find the top three highest-paid employees and display their names and salaries.
Select concat(first_name," ",last_name) as full_name , salary from employees order by salary desc limit 3;

#5.Write a SQL query to find all departments where the department name starts with 'S' and contains more than 5 characters.
Select department_name from departments where department_name like 'S%' and length(department_name)> 5;

#6Write a SQL query to display the first 5 characters of each employee's first name, along with their last name, for all employees whose first names are longer than 5 characters.
Select left(first_name,5) as first_name5, left(last_name,5) as last_name5 from employees where length(first_name) > 5; 
SELECT SUBSTRING(first_name, 1, 5) AS short_first_name, last_name
FROM employees
WHERE LENGTH(first_name) < 5;


#7Write a SQL query to retrieve the last three characters of each employee's last name and display them alongside the employee's full name.
Select right(last_name,3) as last_names3 , concat(first_name , " " , last_name) as  full_name from employees ;

#8Write a SQL query to retrieve the last five employees hired, including their first names, last names, and hire dates.
SELECT first_name, last_name, hire_date
FROM employees
ORDER BY hire_date DESC
LIMIT 5;

#9.Write a SQL query to list all employees along with their department names, and order the results by department name and then by employee last name.
Select concat(first_name , " ", last_name) as Full_name, d.department_name from employees as e
join departments as d
on e.department_id = d.department_id
order by department_name, last_name ;

#10.Write a SQL query to retrieve the names of departments that have more than five employees and display the number of employees in each department.
Select count(*),d.department_name from employees as e 
join departments as d
on e.department_id = d.department_id
group by d.department_name having count(*) > 5;


#11.Write a SQL query to retrieve the first names of employees who work in the 'HR' department.
Select * from departments;
Select * from employees where department_id = 40;
Select first_name,d.department_name from employees as e 
join departments as d
on e.department_id = d.department_id
where d.department_name = "Human Resources";

#12.Select the names of employees whose first names start with the letter J
Select concat(first_name, " ", last_name) from employees where first_name like "J%";

#13.Write a query to display the employee's name and a column indicating whether their salary is 'High' (greater than $70,000), 'Medium' (between $40,000 and $70,000), or 'Low' (less than $40,000).
SELECT first_name, last_name, salary,
    CASE 
        WHEN salary > 70000 THEN 'High'
        WHEN salary BETWEEN 40000 AND 70000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;

#14.Write a query to count the number of employees in each department, including departments with no employees.
Select count(*) from employees where department_id ;
SELECT d.department_name, 
       (SELECT COUNT(e.employee_id) 
        FROM employees e 
        WHERE e.department_id = d.department_id) AS employee_count
FROM departments d;

#15.Select the names of employees who work in either the 'Marketing' or 'IT' departments.
Select concat(first_name, " ",last_name) , d.department_name from employees as e 
join departments as d
on e.department_id = d.department_id 
where d.department_name in  ("Marketing" , "IT");

SELECT e.first_name, e.last_name , d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Marketing'
   OR d.department_name = 'IT';

Select * from employees;
Select * from departments;
 
#16.Select all location details where the city name contains the word 'New'.
Select * from locations;
Select * from locations where state_province like "%New%";

#17.Write a query to select the first name, last name, and department name of employees, using a join between the employees and departments tables.
Select first_name , last_name , department_name from employees as e
join departments as d
on e.department_id = d.department_id;

#18.Write a query to find the names of employees whose salaries are above the average salary of all employees.
Select first_name,last_name, salary from employees where salary > (Select avg(salary) from employees);

#19.Write a query to count the number of employees in each department and display the department name along with the count.
Select count(*) , department_name from employees as e 
join departments as d on 
e.department_id = d.department_id
group by department_name ;

#20.Write a query to select the names of employees who work in departments located in 'New York', using a join between employees, departments, and locations.
Select concat(first_name, " ",last_name) , department_name , city from employees as e 
join departments as d 
on e.department_id = d.department_id 
join locations as l 
on d.location_id = l.location_id;

#21.Write a query to find the maximum salary of employees in each department.
Select max(salary),d.department_name from employees as e 
join departments as d on
e.department_id = d.department_id
group by department_name;

#22.Write a query to find employees with the job title 'Manager' who work in departments where the average salary is greater than $60,000.
Select * from jobs;
SELECT e.first_name, e.last_name,e.salary, j.job_title, d.department_name
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
WHERE j.job_id like "%MGR" or "%MAN"
  AND d.department_id IN (
    SELECT e.department_id
    FROM employees e
    JOIN jobs j ON e.job_id = j.job_id
    GROUP BY e.department_id
    HAVING AVG(e.salary) > 60000
  );


#23.Write a query to find all employees whose job titles start with 'S' and whose salaries are greater than the average salary of all employees. Use a wildcard for the job title and a subquery for the average salary.
Select concat(first_name, " ",last_name ) , job_title , salary from employees as e join jobs as j
on e.job_id = j.job_id where job_title like "S%" and e.salary > (Select avg(salary) from employees);

#24.Write a query that retrieves the department name along with the city and state for each department, using joins. Include only departments located in cities that start with the letter 'S'.
Select department_name , city , state_province from departments as d join locations as l on
d.location_id = l.location_id where city like "S%";

#25.Write a query to find all employees whose last names contain the substring 'son', displaying their first and last names along with the department name.
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.last_name LIKE '%son%';

#26.	Write a query to list employees and display their hire date with a message indicating whether they have been 
#with the company for 'Less than 1 Year', '1 to 5 Years', or 'More than 5 Years', using a CASE statement
Select first_name , last_name ,
CASE 
	When timestampdiff(year,hire_date,curdate()) < 1 then "less than 1 year"
    when timestampdiff(year,hire_date,curdate()) between 1 and 5 then "1 to 5 years"
    else "More than 5 years" 
End as tenure_category
from employees;

#27.Write a query that counts the number of employees for each job title in the 
#employees table and displays job titles with more than five employees.

Select count(*) , job_title from employees as e join jobs as j 
on e.job_id = j.job_id 
group by job_title having count(*) > 5;

#28.Question: Create a stored function called GetTotalEmployeesInDepartment that takes a department ID as input and 
#returns the total number of employees in that department.
Select count(*) from employees where department_id = 90;
delimiter &&
create function GetTotalEmployeesInDepartment(dept_id int)
returns integer
deterministic 
begin
	declare cemp_id int;
    Select count(*) into cemp_id from employees where department_id = dept_id;
	return cemp_id;
end ;;
&&
delimiter ;
Select GetTotalEmployeesInDepartment(50);

#29.Question: Write a stored function named GetHighestSalaryInDepartment that takes a department ID as input and returns the highest salary among employees in that department.
Select max(salary) from employees where department_id = 50 ;

delimiter &&
create function GetHighestSalaryInDepartment (dept_id int)
returns integer
deterministic
begin
	declare max_sal int;
    Select max(salary) into max_sal from employees where department_id = dept_id;
	return max_sal;
end ;;
&&
delimiter ;
Select GetHighestSalaryInDepartment(50);

#30.Question: Create a stored function called GetEmployeeCountByJobTitle that takes a job title as input and returns the number of employees with that job title.
Select count(*) , job_title from employees as e 
join jobs as j on
e.job_id = j.job_id
group by job_title having job_title = "Accountant";


#31.Question: Write a stored function named UpdateEmployeeJobTitle that takes an employee ID and a new job title as input parameters, 
#updates the employee's job title, and returns the updated job title.

delimiter &&
create function updateEmployeeJobtitle(emp_id int, new_job_title varchar(300))
returns varchar(300)
deterministic
begin
	DECLARE current_job_title VARCHAR(255);
    
    UPDATE jobs -- Update the job title in the jobs table
    SET job_title = new_job_title
    WHERE job_id = (SELECT job_id FROM employees WHERE employee_id = emp_id);
    
    SELECT job_title INTO current_job_title
    FROM jobs
    WHERE job_id = (SELECT job_id FROM employees WHERE employee_id = emp_id);
    
    RETURN current_job_title;
end;;
&&
delimiter ;

#32.Write a stored function named GetHighestSalaryInDepartment that takes a department ID as input and returns the highest salary of employees in that department. 
Select max(salary) from employees where department_id = 10;

#33.Question: Write a stored function named GetEmployeeDepartmentDetails that takes an employee ID as input and returns the department name and the employee's job title
Select department_name , job_title, employee_id from employees as e 
join departments as d on
e.department_id = d.department_id 
join jobs as j on 
e.job_id = j.job_id
where employee_id = 101;

#34.Question: Create a stored function called GetDepartmentEmployeeCountByJobTitle that takes a department ID and a job title as input parameters and returns the number of employees with that job title in the specified department. 


Select * from departments;
Select * from jobs;
Select * from employees;

SELECT COUNT(*)
    FROM employees e
    JOIN jobs j ON e.job_id = j.job_id
    WHERE e.department_id = 90
      AND j.job_title = "Administration Vice President";
      
#41.Question: Write a stored procedure named GetEmployeeDetails that takes an employee ID as input and returns the employee's name, department, and hire date. 
use hr;
delimiter $$
create procedure GetEmployeeDetails(in emp_id int, out fname varchar(100) , out lname varchar(100) , out hire varchar(100) ,out dept_name varchar(100))
begin
	Select first_name , last_name , hire_date , department_name into fname,lname,hire,dept_name from employees as e 
    join departments as d on e.department_id = d.department_id 
    where employee_id = emp_id ;
end ;;
$$
delimiter ;

call GetEmployeeDetails(103,@fname,@lname,@hire,@dept_name);
Select @fname,@lname,@hire,@dept_name;

#42.Question: Write a stored procedure named GetAverageSalaryByDepartment that takes a department ID as input and returns the average salary of employees in that department. 
Select avg(salary),department_id from employees where department_id =50; 

#43.Question: Create a stored procedure called AddNewStudent that takes a student's name, age, and email as input parameters and inserts a new record into the students table. 
show tables;
create table students_69 (stud_name varchar(200) , stud_age int(20), stud_mail varchar(200));
delimiter $$
create procedure AddNewStudent (in stud_name varchar(100), in stud_age int(20) , in stud_mail varchar(20))
begin
	Insert into students_69 values (stud_name,stud_age,stud_mail);
end ;;
$$
delimiter ;

call AddNewStudent("Vedant",20 ,"shirole@gmail.com");
Select * from students_69;

#44.Question: Write a stored procedure named GetEmployeeCountByDepartment that takes a department ID as input and returns the total number of employees in that department. 
Select count(*) from employees where department_id = 90 ;

DELIMITER $$

CREATE PROCEDURE GetEmployeesHiredAfterDate(IN hire_after DATE)
BEGIN
    SELECT first_name, last_name
    FROM employees
    WHERE hire_date > hire_after;
END $$

DELIMITER ;
CALL GetEmployeesHiredAfterDate('2022-01-01');


