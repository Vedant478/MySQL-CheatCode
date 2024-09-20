CREATE TABLE salary_history (
    emp_id INT,
    first_name VARCHAR(50),
    old_salary DECIMAL(10 , 2 ),
    new_salary DECIMAL(10 , 2 ),
    department_id INT
);
CREATE TABLE employee (
    employee_id INT,
    name VARCHAR(50),
    salary FLOAT,
    department_id INT
);


INSERT INTO employee (employee_id, name, salary, department_id)
VALUES
  (1, 'John Smith', 50000.0, 101),
  (2, 'Jane Doe', 60000.0, 102),
  (3, 'Bob Johnson', 55000.0, 101),
  (4, 'Mary Brown', 65000.0, 103),
  (5, 'Tom Davis', 70000.0, 102);

desc salary_history;
desc employee;

############################################################
delimiter $$
create trigger before_insert
before insert on employee 
for each row 
begin 
	-- new : takes new value in trigger
    -- old : takes old value in trigger
    if new.salary is null then 
    set  new.salary = 15000.00;
    end if;
end ;; 
$$
delimiter 
Select * from employee;
############################################
delimiter $$
create trigger before_insert_eg2
before insert on employee 
for each row 
begin 
	-- new : takes new value in trigger
    -- old : takes old value in trigger
    if new.department_id is null then 
    set  new.department_id = 101;
    end if;
end ;;
$$
delimiter ;
insert into employee (employee_id, name) values (7,'Will Smith');
Select * from employee ;

########################################################
use hr;
delimiter $$
create trigger before_insert_eg4
before insert on employees 
for each row 
begin 
	-- new : takes new value in trigger
    -- old : takes old value in trigger
    if new.email not like '%@%' then
    signal sqlstate '45000'
    set  message_text = "Invalid email type";
    end if;
end ;;
$$
delimiter ;

INSERT INTO `employees` (`EMPLOYEE_ID`, `LAST_NAME`, `EMAIL`, `PHONE_NUMBER`, `HIRE_DATE`, `JOB_ID`, `SALARY`, `COMMISSION_PCT`, `MANAGER_ID`, `DEPARTMENT_ID`) VALUES
('100' , 'King', 'SKING@gmail.com', '515.123.4567', '1987-06-17', 'AD_PRES', '24000.00', '0.00', '0', '90');

########################################################

delimiter $$
create trigger before_insert_eg5
before insert on employees 
for each row 
begin 
	-- new : takes new value in trigger
    -- old : takes old value in trigger
    if new.salary < 0 then
    signal sqlstate '45000'
    set  message_text = "cannot insert negative salary";
    end if;
end ;;
$$
delimiter ;

####################################





