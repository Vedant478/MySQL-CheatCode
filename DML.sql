Select * from departments ;
Select * from employees ;
Select * from countries ;
Select * from job_history ;
Select * from jobs ;
Select * from locations ;
Select * from regions ;

show index from employees;
desc employees ;

Select * from information_schema.columns 
where table_schema="hr" and table_name='employees';

explain employees;
explain select * from employees;

check table employees;

show table status;
show tables;
show databases;

show columns from employees;
update employees set email = 'cdac@gmail.com' where employee_id = 100;

update employees set salary = salary+(salary*.10);

#### delete #########
delete from employees where employee_id = 112;

######### rename ##########
rename table regions_check_delete to check_delete;
show tables;

########## insert ##########
# 1 one value 
insert into check_delete values('1','Europe');
Select * from check_delete;

# value for specific attribute 
insert into check_delete(region_id) values('2');

# multiple values 
insert into check_delete values('3','USA'),('4','UK'),('5','Canada');

# insert using select 
insert into check_delete(region_id,region_name) Select * from regions;

#### ALIAS 
SELECT first_name, salary+salary*.15 as incremented_salary from employees;
select * from employees; 

select email email_address from employees;

########### temporary table 
create temporary table emp_table as select * from employees;
select * from emp_table;

####### to see the table on the database 
select * from information_schema.tables where table_schema="hr" and table_type="TEMPORARY";

######### WHERE 
Select * from employees where employee_id =100;

########### order by 
Select * from employees order by first_name;
Select * from employees order by first_name desc;

############# Relational Operators in mysql

# 1 . 
Select employee_id, first_name,salary, department_id from employees where salary >=1000;
Select employee_id, first_name,salary, department_id from employees where department_id >20;
Select employee_id, first_name,salary, department_id from employees where salary <10000;
Select employee_id, first_name,salary, department_id from employees where department_id <=10;

select * from countries where region_id<>4;
select * from countries where region_id!=4;

############# Locgical oeprator (And , or , not)
Select first_name , salary, department_id from employees 
where first_name='Steven' and department_id = 90;

Select * from countries;
select * from countries where country_name='Egypt' and country_id = "EG";

# first_name is john and salary is 1000
Select* from employees;
select * from employees where first_name='John' and salary=1000;

select * from employees where first_name='David' and salary>400;

############### or operator ###############

Select * from employees where job_id='AD_Pres' or department_id=90;

Select * from employees where job_id='AD_Pres' or (department_id=90 and department_id=100);

####### not; 

Select * from employees where not (department_id=90 or department_id=100) order by department_id;
Select * from employees where not Manager_id=205 order by manager_id;
Select * from departments where not (department_name='IT' or location_id=1400) or (department_id=10 or manager_id=100);

Select * from departments where not (department_name='IT' or location_id=1400) or (department_id=10 and manager_id=100);

############## in ###########################
Select * from employees where department_id in (10,20,30,40,100,90);
Select * from employees where job_id in ('AD_ASST','MK_MAN','AD_VP');

################# not in #######################
Select * from employees where first_name not in ('Jennifer','Neena','Lex','Steven');
Select * from employees where first_name not in (102,103,101,108) order by manager_id;

################ between #########################
Select * from employees where salary between 10000 and 18000;

Select * from employees ;
Select * from employees where first_name between 'A' and 'J' order by first_name;

########## Like #################33
Select * from employees where first_name like 'a%';
Select * from employees where first_name like 'd%';

######## ends with #####################
Select * from employees where first_name like '%ah';
Select * from employees where last_name like '%at';

############ check for at any posiition 

Select * from employees where last_name like '%aa%';

############ at second position 
Select * from employees where last_name like '_i%';
Select * from employees where last_name like '___k%';

############# not like ####################
Select * from employees where last_name not like '%aa%';

############ not null #####################
select * from employees where manager_id is not null ;
select * from employees where job_id is not null;

############ is null #########################
select * from employees where department_id is null ;


######################## String Function #####################33
select first_name,last_name, concat(first_name," ",last_name) as full_name from employees;

###### concat ############
select first_name, last_name, instr(first_name,'A') as first_occurance_of_A from employees;
select first_name, last_name, instr(first_name,'en') as first_occurance_of_A from employees;

## Find the employee whos lastname contains a and also display fullname #empid and position of letter a in their lastname
select employee_id, instr(last_name,'A'), concat( first_name, ' ' , last_name) as Full_name from employees where last_name like '%a%';

###length 
select first_name,length(first_name) as length_of_first_name from employees;

select first_name,last_name,salary from employees where length(first_name)<3;

# charlength 
select first_name,char_length(first_name) as length_of_first_name from employees;

#right side
select first_name,right(first_name,3) last_3_character from employees;
select first_name,left(first_name,3) first_3_character from employees;
desc employees;

### Extract last 4 digit of phone no. of employee and display employee_id fullname 
select employee_id,concat(first_name, ' ',last_name), phone_number,right(phone_number,4) from employees;

### substring
select employee_id,concat(first_name," " , last_name) as Full_name, substr(first_name,2,4) from employees;

## substring index 
select employee_id,concat(first_name," " , last_name) as Full_name, substring_index(first_name,2,4) from employees;

### rtrim , ltrim , trim
select trim('         hello      ');
select rtrim('        hello      ');
select ltrim('        hello      ');

# uppercase and lowercase
select employee_id,lower(concat(first_name," " , last_name)) as Full_name from employees;
select employee_id,upper(concat(first_name," " , last_name)) as Full_name from employees;

### strcmp 
select strcmp('cdac','CDAC MUMBAI');
select strcmp('cdac','CDAC');
select strcmp('cdac','CDAC m');

## locate
select first_name,locate('Steven',first_name) from employees;

## find in set
Select * from employees where find_in_set('AD_VP',job_id);

## reverse
select reverse(first_name)from employees;

### replace 
select replace(first_name,'ah','XYZ') from employees;

########## aggregate function ########################
select avg(salary) from employees;
select max(salary) from employees;
select min(salary) from employees;
select sum(salary) from employees;
select count(*) from employees;
select count(employee_id) from employees;

select count(distinct(employee_id)) from employees;
select count(distinct(department_id)) from employees;

select count(*) from employees where salary>10000;

#### group_concat()

select abs(-10);
select ceiling(4.3);
select floor(4.3);

select round(4.54873687,2);

select sqrt(4);
select power(2,3);

select mod(10,2);
select mod(15,2);

Select coalesce(first_name,'NA') from employees;




