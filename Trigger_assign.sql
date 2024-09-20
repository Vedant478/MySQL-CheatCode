use hr_assign;
Select * from employees;
Select * from departments;

#1.How can MySQL triggers be used to automatically update employee records when a department is changed?

delimiter $$
create trigger after_update1
after update on departments
for each row
begin
	
	IF OLD.department_id != NEW.department_id THEN
	UPDATE employees
    SET department_id = NEW.department_id
    WHERE department_id = OLD.department_id;
	END IF;
end;;
$$
delimiter ; 

Select *from employees;
Select * from departments;

UPDATE departments
SET department_id = 35
WHERE department_id = 30;

#2.What MySQL trigger can be used to prevent an employee from being deleted if they are currently assigned to a department?
delimiter $$
create trigger del_employee_dept
before delete on employees
for each row 
begin
	if old.department_id is not null then
    signal sqlstate '45000'
    set message_text = "Cannot delete because employee already exists";
    end if ;
end ;;
$$
delimiter ;

delete from employees where employee_id = 104;
 
#3.How can a MySQL trigger be used to send an email notification to HR when an employee is hired or terminated?
#4.What MySQL trigger can be used to automatically assign a new employee to a department based on their job title?
#5.How can a MySQL trigger be used to calculate and update the total salary budget for a department whenever a new employee is hired or their salary is changed?
#6.What MySQL trigger can be used to enforce a maximum number of employees that can be assigned to a department?
#7.How can a MySQL trigger be used to update the department manager whenever an employee under their supervision is promoted or leaves the company?
#8.What MySQL trigger can be used to automatically archive the records of an employee who has been terminated or has left the company?
