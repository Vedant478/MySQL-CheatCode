use hr;
#1 
Create table students (
	stud_id int primary key,
    stud_name varchar(100) not null ,
    stud_email varchar(100) unique not null,
    stud_course varchar(100) default "Unassigned"
);
desc students;

#2
Insert into students values 
("1", "John Doe" , "john@email.com" , "PG_dbda"),
("2","Emilly Clarke" , "clarke@email.com" , "PG_dbda"),
("3", "Vir Das","vir@email.com" , default);

Select * from students ;

#3
Select concat(first_name , " ", last_name ) as full_name from employees 
where first_name like '%A%' limit 10; 

#4
Select avg(salary) as average_salary , d.department_id  from employees as e 
join departments as d 
on e.department_id = d.department_id
group by d.department_id order by d.department_id;

#5
Select concat(first_name," ",last_name) as full_name, 
avg(salary) as average_salary ,d.department_id from employees as e 
join departments as d 
on e.department_id = d.department_id
group by full_name,d.department_id having avg(salary)>60000;

Select * from employees;

#6Write a stored procedure named GetTotalSalaryByDepartment that takes a department id as an 
#input parameter and returns total salary of all employees in that department 
delimiter $$
create procedure GetTotalSalaryByDepartment (in dept_id int , out total_sal int)
begin 
	Select sum(salary) into total_sal from employees where department_id =dept_id;
end ;;
$$
delimiter ; 

call GetTotalSalaryByDepartment (50 , @total_sal);
Select @total_sal as Total_salary;

#7Write a stored function that takes an employee_id as input and returns the employee’s job title 
Select job_title , employee_id from employees as e 
join jobs as j
on e.job_id = j.job_id
where employee_id = 105;

delimiter $$
create function GetJobTitle2(emp_id int)
returns varchar(200)
deterministic
begin
	declare jobtitle varchar(200);
    Select job_title into jobtitle from employees as e 
	join jobs as j
	on e.job_id = j.job_id
	where employee_id = emp_id;
    
    return jobtitle;
end ;; 
$$
delimiter ;

Select GetJobTitle2(200) as Job_title;