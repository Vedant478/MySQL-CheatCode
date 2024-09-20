################################## DDL  #################################
create database Sept24;
use Sept24;

# Create a table 
create table employee(emp_id int, emp_name varchar(20), department varchar(20),
salary float);
insert into employee values (1,"adasda", 'CS', '1000.0');
insert into employee values (2,"ada", 'CS', '100.0');
insert into employee values (3,"adda", 'CS', '10.0');

Select * from employee;
## if not clause
create table if not exists employee(emp_id int, emp_name varchar(20), department varchar(20) ,salary float);

### 3 ways to create a table;
create table emp_new1 as select * from employee;

select * from emp_new1;

create table emp_new2 as select * from employee where emp_id = 3;

Select * from emp_new2;

###1. Add new column

alter table employee add column age int;
alter table employee add column project varchar(50);
alter table employee modify column salary decimal;
alter table employee modify column emp_name varchar(70);
desc employee;

### add constraint 
alter table employee add constraint unique(department);

alter table employee drop age;

#set 
alter table employee alter column project set default "New Project";
desc employee;

#check
alter table employee add constraint check (salary>0);
desc employee;

insert into employee values(12, 'abhay','DBDA',19789,project);
Select * from employee;

## Primary key 
alter table employee add primary key(emp_id);
desc employee;

## not null 
alter table employee modify employee_name varchar(80) not null;

#foreign key constraint
create table department(dept_id int primary key, dept_name varchar(20),
location varchar(20));

desc employee;

alter table employee add constraint foreign key(dept_id) references department(dept_id);

## rename a table 
alter table employee rename to new_emp;
show tables ;

alter table new_emp drop primary key ;
desc new_emp