################################### Stored Functions Assignment ###################################
#1.Write a stored procedure to retrieve all employees 
#from the Employees table for a given department ID.
delimiter $$
create procedure get_all_emp(in dept_id int)
begin
	Select * from employees where department_id = dept_id;
end ;
$$
delimiter

call get_all_emp(40);




#2.Create a function that calculates the total salary expenditure for a given department ID. 
Select sum(salary) from employees where department_id = 50;
delimiter $$
CREATE FUNCTION `tot_salary`(dept_id int)
RETURNS INTEGER 
DETERMINISTIC 
BEGIN
	declare tot_saly int;
    Select sum(salary) into tot_saly
    from employees where department_id = dept_id;

RETURN tot_saly;
END ;; 
$$
delimiter ;; 
Select tot_salary(50);

#3. Develop a stored procedure that accepts an employee ID as an input parameter
# and increases the salary of that employee by a specified percentage.
delimiter $$
create procedure inc_salary1(in emp_id int , IN percentage DECIMAL(5, 2))
begin
	UPDATE employees 
    SET salary = salary + (salary * (percentage / 100))
    WHERE employee_id = emp_id;
end ;;
$$
delimiter ;
call inc_salary1(104,50.0); 

Select * from employees where employee_id = 104;

#4.Write a function to determine the average salary for 
#employees in a specific job title category.
Select avg(salary) from employees as e
Join jobs as j on
e.job_id = j.job_id
where job_title = "Accounting Manager";

delimiter $$
create function avg_salary1(job_title varchar(50))
returns Integer
Deterministic
begin 
	declare avg_sal int;
    Select avg(salary) into avg_sal from employees as e
	Join jobs as j on
	e.job_id = j.job_id
	where job_title = job_title; 
    
    return avg_sal;
END ;;
$$ 
delimiter ;;

Select avg_salary1("President");

#5.Create a stored procedure that takes an employee's first name 
#and last name as input parameters and returns the full name in uppercase letters.

DELIMITER $$
CREATE PROCEDURE get_employee_full_name_uppercase(IN emp_id INT, OUT full_name VARCHAR(101))
BEGIN
    SELECT UPPER(CONCAT(first_name, ' ', last_name))
    INTO full_name
    FROM employees
    WHERE employee_id = emp_id;
END $$
DELIMITER ;

SET @full_name = '';
CALL get_employee_full_name_uppercase(105, @full_name);
Select @full_name ;

#6.Write a stored procedure to insert a new employee 
#into the Employees table with the provided first name, last name, and department ID.

delimiter $$
create procedure insert_values2(in f_name varchar(20), in l_name varchar(30), in dept_id int )
begin
	insert into employees values(f_name,l_name,dept_id);
end ;;
$$
delimiter ;

call insert_values2("Vedant","Shirole",50);

#7.Create a function to calculate the total number of 
#employees in a specific department.
Select count(employee_id) from employees where department_id = 50;

delimiter $$
Create function tot_number(dept_id int)
returns integer
deterministic
begin
	declare count_emp int;
    Select count(employee_id) into count_emp 
	from employees where department_id = dept_id;
	
    return count_emp;


end;;
$$
delimiter ;;
Select tot_number(50);

#8.Develop a stored procedure that accepts an employee ID as input and 
#deletes that employee's record from the Employees table.

delimiter $$
create procedure delete_val(in emp_id int)
begin
	delete from employees where employee_id = emp_id;
end ;;
$$
delimiter ;
show triggers from hr;
drop trigger before_employee_delete;
call delete_val(106);

#9.Write a function to determine the highest salary in the Employees table.
Select max(salary) from employees;
delimiter $$
create function max_salary()
returns integer
deterministic
begin 
	declare max_sal int;
    Select max(salary) into max_sal from employees;
    
    return max_sal;

end ;; 
$$
delimiter ;;
Select max_salary();

#10. Create a stored procedure that takes a department ID as an input parameter and returns the list of 
#employees sorted by their salary in descending order within that department.

delimiter $$
create procedure list_emp(in dept_id int)
begin
	Select * from employees where department_id = dept_id order by salary desc;
end ;;
$$
delimiter ;

call list_emp(50);

#11.Write a stored procedure to update the job title of an employee based on their employee ID.
update employees set job_id = "IT_PROG" where employee_id = 102;
delimiter $$
create procedure update_job(in emp_id int , in new_job varchar(50))
begin 
	update employees set job_id = new_job where employee_id = emp_id;
end ;; 
$$
delimiter ;
call update_job(107,"IT_PROG");
Select * from employees;

#12.Create a function that returns the number of employees hired in a specific year.
Select count(employee_id) from employees where year(hire_date) = 1987; 

delimiter $$
create function count_emp(hire int)
returns int
deterministic
begin 
	declare c_emp int;
    Select count(employee_id) into c_emp from employees where year(hire_date) = hire;
    return c_emp;
end ;; 
$$ 
delimiter ;;
Select count_emp(1987);

#13.Develop a stored procedure that accepts an employee ID as input and 
#retrieves the employee's details, including their name, department, and salary.
delimiter $$
create procedure emp_details65(in emp_id int , out full_name varchar(20),out dept_id int,out sal int)
begin
	Select concat(first_name," ", last_name) , department_id , salary into full_name,dept_id,sal
    from employees where employee_id = emp_id;
end;;
$$
delimiter ;
Select * from employees;
call emp_details65(102,@full_name,@dept_id,@sal);
Select @full_name,@dept_id,@sal;

#14.Write a function to calculate the average tenure (in years) of employees in the company.

delimiter $$
create function average_ten()
returns int
deterministic
begin 
	declare exp int ;
    Select avg(timestampdiff(year,hire_date,curdate())) into exp from employees;
    return exp;
end ;; 
$$ 
delimiter ;
Select average_ten();

#15.Create a stored procedure that takes a department ID as an input parameter and returns the department name along 
#with the count of employees in that department.
use hr ;
DELIMITER $$
CREATE PROCEDURE get_department_info(IN dept_id INT, OUT dept_name VARCHAR(100), OUT employee_count INT)
BEGIN
    -- Get the department name and the count of employees in that department
    SELECT d.department_name, COUNT(e.employee_id)
    INTO dept_name, employee_count
    FROM departments d
    LEFT JOIN employees e ON d.department_id = e.department_id
    WHERE d.department_id = dept_id
    GROUP BY d.department_name;
END $$
DELIMITER ;

set @dept_id = 50;
call get_department_info (50,@employee_count,@dept_name);
Select  @employee_count, @dept_name;
 
#16.Write a stored procedure to retrieve the top N highest-paid employees in the company, where N is an input parameter.
DELIMITER $$
CREATE PROCEDURE get_top_n_highest_paid(IN top_n INT)
BEGIN
    SELECT employee_id, first_name, last_name, salary
    FROM employees
    ORDER BY salary DESC
    LIMIT top_n;
END $$
DELIMITER ;

call get_top_n_highest_paid(10);

#18 Develop a stored procedure that accepts a salary threshold as an input parameter 
#and retrieves all employees with salaries above that threshold.

DELIMITER $$
CREATE PROCEDURE get_employees_above_salary(IN salary_threshold DECIMAL(10, 2))
BEGIN
    -- Select employees whose salary is greater than the threshold
    SELECT employee_id, first_name, last_name, salary
    FROM employees
    WHERE salary > salary_threshold
    ORDER BY salary DESC;
END $$
DELIMITER ;

call get_employees_above_salary(20000.0);

#20.Create a stored procedure that takes an employee's last name as an input 
#parameter and returns all employees with a similar last name.
Select * from employees where last_name = last_name;
delimiter $$
create procedure get_last_name(in l_name varchar(20))
begin 
	Select * from employees where last_name = l_name;
end ;; 
$$
delimiter ;
call get_last_name("de haan");

#21.Write a stored procedure to update the email address of an employee based on their employee ID.
delimiter $$
create procedure get_new_email(in emp_id int ,in n_email varchar(100))
begin
	Update employees set email = n_email where employee_id = emp_id;
end ;; 
$$
delimiter ;
call get_new_email(101,"shirole@gmail.com");
Select * from employees;

#22.Create a function that calculates the total experience (in years) of all employees combined in the company.
delimiter $$
create function tot_ten()
returns int
deterministic
begin 
	declare exp int ;
    Select sum(timestampdiff(year,hire_date,curdate())) into exp from employees;
    return exp;
end ;; 
$$ 
delimiter ;
Select tot_ten();

#23.Develop a stored procedure that accepts a department ID as input and 
#returns the department name along with the average salary of employees in that department.
 
delimiter $$
create procedure get_avg_sal (in dept_id int , out d_name varchar(100) , out avg_sal int)
begin
		Select d.department_name , avg(e.salary) into d_name,avg_sal from employees as e join departments as d on 
		e.department_id = d.department_id  where d.department_id = dept_id group by d.department_id ; 
end ;;
$$
delimiter ; 

call get_avg_sal(50,@d_name,@avg_sal);
Select @d_name,@avg_sal;

#24.Write a function to determine the number of employees who have been 
#with the company for more than a specified number of years.

delimiter $$
create function get_no_employees(years int)
returns int 
deterministic
begin
	declare emp_count int ;
    Select count(*) 
    into emp_count
    from employees 
    where timestampdiff(year,hire_date,curdate()) > years ;
    return emp_count;
end ;;
$$
delimiter ;

select get_no_employees(36);

#25.Create a stored procedure that takes a job title as an input parameter and returns 
#the count of employees holding that job title.
Select * from jobs;
Select * from employees;
select count(employee_id),j.job_title from employees as e
join jobs as j 
on e.job_id = j.job_id
group by job_title;

delimiter $$
create procedure get_job_title4(inout jobtitle varchar(100) , out c_emp int)
begin 
	select count(e.employee_id),j.job_title into c_emp,jobtitle from employees as e
	join jobs as j 
	on e.job_id = j.job_id
	group by job_title having job_title = jobtitle ;
end ;;
$$
delimiter ; 

set @jobtitle = 'Marketing Manager' ;
call get_job_title4 (@jobtitle , @c_emp);
Select @jobtitle , @c_emp;

#26. Write a stored procedure to retrieve the details of employees who have a salary within a specified range.
Select * from employees where salary between 5000 and 10000;
delimiter $$
create procedure get_empdetails(in f_salary int , in l_salary int)
begin
	select * from employees where salary between f_salary and l_salary ;
end ;; 
$$
delimiter ; 

call get_empdetails(5000,10000);

#27.Create a function that calculates the total number of working hours for an employee in a given month.
DELIMITER $$
CREATE FUNCTION get_total_hours_since_hire(emp_id INT, hire_month INT, hire_year INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total_hours DECIMAL(10, 2);

    SELECT IFNULL(SUM(TIMESTAMPDIFF(HOUR, hire_date, NOW())), 0)
    INTO total_hours
    FROM employees
    WHERE employee_id = emp_id
      AND MONTH(hire_date) = hire_month
      AND YEAR(hire_date) = hire_year;

    RETURN total_hours;
END $$
DELIMITER ;

SELECT get_total_hours_since_hire(104, 6, 1987) AS TotalHoursSinceHire;

#28.Develop a stored procedure that accepts an employee ID as input and retrieves the employee's 
#department name and manager's name.
Select *from employees;
SELECT d.department_name, CONCAT(m.first_name, ' ', m.last_name) AS manager_full_name
    
    FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    LEFT JOIN employees m ON e.manager_id = m.employee_id
    WHERE e.employee_id = 103;

DELIMITER $$
CREATE PROCEDURE get_employee_department_and_manager(IN emp_id INT, OUT dept_name VARCHAR(100), OUT manager_name VARCHAR(100))
BEGIN
    -- Retrieve the department name and manager's full name for the given employee ID
    SELECT d.department_name, CONCAT(m.first_name, ' ', m.last_name) AS manager_full_name
    INTO dept_name, manager_name
    FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    LEFT JOIN employees m ON e.manager_id = m.employee_id
    WHERE e.employee_id = emp_id;
END $$
DELIMITER ;

CALL get_employee_department_and_manager(104, @dept_name, @manager_name);
SELECT @dept_name AS DepartmentName, @manager_name AS ManagerName;

#29. Write a function to determine the total number of employees hired in each year, grouped by the year of hire.
DELIMITER $$
CREATE PROCEDURE get_employee_count_by_year()
BEGIN
    SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS employee_count
    FROM employees
    GROUP BY YEAR(hire_date)
    ORDER BY hire_year;
END $$
DELIMITER ;

call get_employee_count_by_year();

#30.

