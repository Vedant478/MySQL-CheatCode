######################################### VIEWS ##########################################
use hr;
##################### simple view #############################
create view select_emp_name_and_dept as 
select concat(first_name," ", last_name) as emp_full_name , department_id 
from employees ;

select * from select_emp_name_and_dept;

#################### view using condition ######################
CREATE VIEW select_emp_sal_gt_500 AS
    SELECT 
        CONCAT(first_name, ' ', last_name) AS emp_full_name,
        salary,
        department_id
    FROM
        employees
    WHERE
        department_id IN (90 , 50, 100, 0, 10)
            AND salary > 500;
 
Select * from select_emp_sal_gt_500;

##################################################333
create view select_emp_sal_dept_name as 
SELECT 
        CONCAT(first_name, ' ', last_name) AS emp_full_name,
        salary,
        e.department_id,
        d.department_name
    FROM
        employees as e
	JOIN 
		departments as d
	ON 
		e.department_id = d.department_id;

Select * from select_emp_sal_dept_name order by department_id;

######################## Subquery view ###########################
create view emp_high_salary_using_subq as 
SELECT 
        CONCAT(first_name, ' ', last_name) AS emp_full_name,
        salary
    FROM
        employees where salary = (Select max(salary) from employees);
        
select * from emp_high_salary_using_subq;

-- update on employees table and change the salary of employee_id  100 to 9000000
update employees set salary = 900000.00 where employee_id = 100 ;
desc employees;

##############################################################33
select * from select_emp_name_and_dept;

update select_emp_name_and_dept set department_id = 300 where emp_full_name = "Steven King";

Select * from employees;

##################################333
create view view_using_group as 
Select department_id, count(*) as number_employee
from employees group by department_id;

Select * from view_using_group ;

update view_using_group set number_employee= 10 where department_id = 0;

-- alter a view 
alter view select_emp_name_and_dept as select CONCAT(first_name, ' ', last_name) AS emp_full_name,
salary,department_id,job_id from employees ;

Select * from select_emp_name_and_dept;

alter view select_emp_name_and_dept as select CONCAT(first_name, ' ', last_name) AS emp_full_name,
salary,department_id,job_id from employees where salary > 500 ;

Select * from select_emp_name_and_dept;
create view newviewfromanotherview as Select emp_full_name,department_id,job_id 
from select_emp_name_and_dept; 

Select * from newviewfromanotherview;

alter view newviewfromanotherview as Select emp_full_name,department_id,job_id 
from select_emp_name_and_dept where job_id="AD_Pres";

