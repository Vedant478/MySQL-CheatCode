delimiter $$
create procedure get_all_emp_details1(in emp_id int)
begin 
		Select * from employees where employee_id = emp_id;
end;
$$
delimiter ;

call get_all_emp_details1(100);
call get_all_dept_details();

#Make a procedure to fetch a value from department table
delimiter $$
create procedure get_all_dept_details()
begin 
		Select * from departments ;
end;
$$
delimiter ;

################################################################
#get all employee and department details 
delimiter $$
create procedure get_all_details2()
begin 
		Select first_name, last_name , d.department_id ,d.department_name from employees as e
        join departments d on
        e.department_id = d.department_id;
end;
$$
delimiter ;

call get_all_details2();

#Two parameter
delimiter $$
create procedure update_emp_using_details(in emp_id int , in n_salary float(10,2))
begin
	update employees set salary = n_salary where employee_id=emp_id;
end ;;
$$
delimiter ;

call update_emp_using_details(101,70000);
Select * from employees ; 

#crea\te a table students with three attributes and write a proecodeure insert value inside student table
Create table students(stud_id int,stud_name varchar(300),subj int);

delimiter $$
create procedure insert_values(in stud_id int, in stud_name varchar(300), in subj int )
begin
	insert into students values(stud_id,stud_name,subj);
end ;;
$$
delimiter ;
call insert_values(10,'Jacob',2);
Select * from students;

#Find out emp_name , salary,department_name --- out
-- emp_id --- in
delimiter $$
create procedure emp_details2(in emp_id int, out full_name varchar(300), out sal float (10,2), out dept_name varchar(50) )
begin
	Select concat(first_name," ",last_name),salary , department_name into full_name,sal,dept_name
    from employees e 
    join departments as d on 
    d.department_id = e.department_id
    where EMPLOYEE_ID = emp_id;
    Select @full_name as emp_name , @sal as salary , @dept_name as department_name;
end ;;
$$
delimiter ;

call emp_details2(101 , @full_name , @sal , @dept_name);
Select @full_name as emp_name , @sal as salary , @dept_name as department_name;

# Write a query to find cities department_name on the basis on dept_id
delimiter $$
create procedure dept_details1(in dept_id int, out city_name varchar(100),out dept_name varchar(50))
begin 
	Select city, department_name into city_name,dept_name from departments as d 
    join locations as l on
    d.location_id = l.location_id
    where department_id = dept_id;
end ;;
$$
delimiter ;
Select city, department_name from departments as d 
    join locations as l on
    d.location_id = l.location_id
    where department_id = 50;
call dept_details1(50, @city_name, @dept_name);
Select @city_name , @dept_name;

############################################################33
delimiter $$
create procedure emp_dep_inout(inout emp_id int, out dept_id int, out full_name varchar(50))
begin
	Select concat(first_name,'',last_name),department_id into full_name,dept_id
    from employees where employee_id=emp_id;
end
$$
delimiter ;

set @emp_id=101;
call emp_dep_inout(@emp_id,@dept_id,@full_name);
Select @emp_id,@dept_id,@full_name;

#################################################################
# Write a procedure to perform join on employee , department where input will be 
#given to dept_id and the procedure will return the total salary of an employee in a department and number 
#of in department
delimiter $$
create procedure big_data3(in dept_id int,out sal_tot int, out count_emp int, out dept_name varchar(50))
begin 
	Select sum(e.salary) , count(e.employee_id) , d.department_name into sal_tot,count_emp,dept_name
    from employees as e
    join departments as d
    on e.department_id = d.department_id
	where d.department_id = dept_id
    group by d.department_id;
end ;; 
$$
delimiter ;

call big_data3(10, @sal_tot,@tot_count,@dept_name);
Select @sal_tot,@tot_count,@dept_name;

###############################################################


  