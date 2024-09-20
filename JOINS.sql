
CREATE TABLE Department_jn (
    dept_id INT PRIMARY KEY,
    manager_id INT,
    department_name VARCHAR(50)
);

CREATE TABLE Employee_jn (
    emp_id INT PRIMARY KEY,
    e_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department_jn(dept_id)
);


INSERT INTO Department_jn (dept_id, manager_id, department_name) 
VALUES
    (1, 101, 'Engineering'),
    (2, 102, 'Sales'),
    (3, 103, 'Marketing'),
    (4, 104, 'Other');


INSERT INTO Employee_jn (emp_id, e_name, salary, department_id) 
VALUES
    (201, 'John Doe', 60000.00, 1),
    (202, 'Jane Smith', 55000.00, 1),
    (203, 'Michael Johnson', 62000.00, 2),
    (204, 'Emily Davis', 58000.00, 2),
    (205, 'Chris Brown', 63000.00, 3),
    (206, 'Amanda Wilson', 60000.00, 3);
Select * from employee_jn;
Select * from department_jn;

# Write a query to find name and salary of all employees belong with thier corresponding department_name 
-- name , -- salary ---employee
-- department_name --- department table 
-- comman department_id , dept_id

Select e_name,salary, department_name from employee_jn 
inner join department_jn
on department_id = dept_id;

##############################################
# Write a query to find name,department_id and manager_id of all employees belong with thier corresponding department_name 
Select e_name,manager_id,dept_id from employee_jn 
inner join department_jn
on department_id = dept_id;

# Write a query to find name,department_id and manager_id of all 
#employees belong with thier corresponding department_name where the department name is "sales"

Select e_name,department_id,manager_id,department_name from employee_jn 
inner join department_jn
on department_id =dept_id
where department_name = "Sales";

# Write a query to find name,department_id and manager_id of all 
#employees belong with thier corresponding department_name where the salary is the range of 2000 to 5000S
Select* from employee_jn;
Select e_name,department_id,manager_id,department_name,salary from employee_jn 
inner join department_jn
on department_id =dept_id
where salary between 50000 and 60000;

Select e.first_name,e.manager_id,d.department_id,d.department_name from employees as e 
inner join departments as d
on e.department_id = d.department_id;


####################################################################################################
-- (location table) -- country_id -- (countries table) --- country_id --region_id ---(regions table)

-- (employee table) -- department_id ----
-- (department table) -- department_id --- location_id ---
-- (location table) -- location_id --- country_id ---
-- (Country  table) -- country_id --- region_id ---
-- (Region table) --- region_id ---

-- (employee table ) -- job_id
-- ( job table ) -- job_titles --- job_id

-- (employee table) -- job_id
-- (job_history table) -- job_id ----department_id
-- (department table) ----department_id

####################################################################################33
Select e.first_name,e.last_name,j.job_title from employees as e 
inner join jobs as j
on e.job_id = j.job_id;

# write a query to find first_name,last_name, city 

Select e.first_name,e.last_name, l.city from employees as e 
inner join departments as d
on e.department_id = d.department_id
inner join locations as l
on d.location_id = l.location_id;

# write a query to display firsT_name,last_name and country_name
Select * from countries;
Select * from departments;
Select * from employees;
select * from locations;
Select * from regions;

Select e.first_name,e.last_name, c.country_name from employees as e 
inner join departments as d
on e.department_id = d.department_id
inner join locations as l
on d.location_id = l.location_id
inner join countries as c
on l.country_id = c.country_id;

# Write a query to find first_name,last_name and region
Select e.first_name,e.last_name,l.city, c.country_name , r.region_name from employees as e 
inner join departments as d
on e.department_id = d.department_id
inner join locations as l
on d.location_id = l.location_id
inner join countries as c
on l.country_id = c.country_id
inner join regions as r
on c.region_id = r.region_id;

# Write a query to display first_name , last_join,job_id,job_title,salary of employee who 
# have the same job and same salary as other employees in the company

Select distinct(e.employee_id), e.first_name , e.last_name, e.job_id, j.job_title , e.salary
from employees as e 
join employees as e1
on e.job_id = e1.job_id 
and (e.salary=e1.salary) 
and e.employee_id <> e1.employee_id
join jobs as j
on e1.job_id = j.job_id;

#Write a query to display the department_id and the number of disticnt locations where 
#department has employees

Select distinct l.location_id as location_count,d.department_id,count(employee_id) as no_emp
from departments as d
join locations as l 
on d.location_id = l.location_id
join employees as e 
on d.department_id = e.department_id
group by d.department_id
having count(l.location_id) and no_emp>0;

#Write a query to display first_name , no_of_distinct_departments where employee works 
Select d.department_id, count(*) no_emp
from employees e
join departments d
on e.department_id=d.department_id 
group by d.department_id;

#Write a query to display country_id , no_of employee working in each country that has more than 15
#working employees
Select * from employees;
Select * from countries;
Select *  from locations;
Select * from departments;

SELECT 
    l.country_id, COUNT(*) no_emp
FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id
        JOIN
    locations l ON d.location_id = l.location_id
GROUP BY l.country_id
HAVING no_emp > 15;

###################################### LEFT JOIN ##########################################3

Select * from student;
Select * from course;

Select s.student_name , s.age , c.course_name from student as s 
Left join course c on
s.course_id = c.course_id;


Select s.student_name , s.age , c.course_name from student as s 
right join course c on
s.course_id = c.course_id;