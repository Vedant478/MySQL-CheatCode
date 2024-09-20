use cdac;
delimiter $$
create trigger after_insert
after insert on employee 
for each row
begin 
	-- new : takes new value in trigger
    -- old : takes old value in trigger
    Insert into salary_history(employee_id,first_name,old_salary,new_salary,department_id)
    values(old.employee_id,old.first_name,old.old_salary,new.new_salary,old.department_id);
end ;

delimiter ;

CREATE TABLE employee_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    log_message VARCHAR(255),
    log_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
Select * from employee_log;
delimiter $$
CREATE TRIGGER after_employee_insert
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
    -- Insert the message into the logging table
    INSERT INTO employee_log (log_message)
    VALUES (CONCAT('A new employee has been inserted with ID: ', NEW.employee_id));
END;
$$
DELIMITER ;
INSERT INTO employee (employee_id, name, salary)
VALUES (10, 'John Doe', 50000.00);

Select * from employee_log;

#########################################################################################
delimiter $$
create trigger try_employee_delete
Before delete on employee
for each row
Begin
	if (Select count(*) from employee where department_id = old.department_id) < 2
    then
    signal sqlstate "45000" set message_text="cannot delete";
    end if;
End;
$$
delimiter ;

Delete from employee where employee_id = 4;
select * from employee;

use hr;
delimiter $$
create trigger before_employee_delete
Before delete on employees
for each row
Begin
	if timestampdiff(year, old.hire_date,curdate()) > 10 
    then
    signal sqlstate "45000" set message_text="cannot delete";
    end if;
End;
$$
delimiter ;

delete from employees where employee_id=110;

use hr;
delimiter $$
create trigger after_salary_update5
after update on employee
for each row
Begin 
	if old.salary <> new.salary then 
    insert into salary_history(emp_id, first_name, old_salary, new_salary, department_id)
    values (old.employee_id, old.name,old.salary, new.salary, old.department_id);
    end if;
end ;;
$$
delimiter ;
drop trigger after_salary_update5;
Select * from salary_history;
update employee set salary=500000 where employee_id=4;
Select * from employee;