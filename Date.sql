######### Date functions ##################333
use hr ;
select curdate();
select now();
Select * from employees where HIRE_DATE = curdate();

## this will give u system date 
select sysdate();

## current time 
select current_time();

select first_name , year(hire_date)  as  year_of_hiring , month(hire_date) as month_of_hire from employees ;

#date/day extraction
select first_name, day(hire_date) as day_of_hire from employees;
select first_name, dayname(hire_date) as day_of_hire from employees;

## date in the month 
select first_name, dayofmonth(hire_date)  as day_of_hire, monthname(hire_date) from employees;

## date in year 
select first_name,dayofyear(hire_date) as day_of_hire from employees;

# add 30 days 
select date_add(curdate(),interval 30 day) as new_added_date;

## subtract 
select date_sub(curdate(),interval 30 day) as new_added_date;

# date diff
select first_name , last_name, hire_date ,datediff(curdate(),hire_date) as difference_date from employees;

#extract
Select first_name , hire_date ,extract(day from hire_date) as year_of_hire from employees;

#in dmy format 
Select first_name, hire_date, date_format(hire_date, '%D %M %Y') as hire_date_in_dmy from employees;

# str
Select first_name, hire_date, str_to_date(hire_date, '%Y-%m-%D') as hire_date_in_dmy from employees;

## Question : Write a query to find the employees who have will been hired in last 90 days
Select max(hire_date) as dat from employees;
select date_sub(max(hire_date) , interval 90 day) from employees;
SELECT *
FROM employees
WHERE hire_date >= 1987-10-01 - INTERVAL '90' DAY;

Select first_name, hire_date, datediff(curdate(),hire_date) as date_diff from employees where datediff(curdate(),hire_date)<=90;

Select first_name, hire_date, 
timestampdiff(year,hire_date,curdate()) as date_diff 
from employees where timestampdiff(year,hire_date,curdate());

Select first_name, hire_date, timestampdiff(month,hire_date,curdate()) as date_diff from employees where timestampdiff(month,hire_date,curdate());
Select first_name, hire_date, timestampdiff(day,hire_date,curdate()) as date_diff from employees where timestampdiff(month,hire_date,curdate());Select first_name, hire_date, timestampdiff(month,hire_date,curdate()) as date_diff from employees where timestampdiff(day,hire_date,curdate());


SELECT *
FROM employees
WHERE hire_date BETWEEN date_sub(max(hire_date) , interval 90 day) AND max(hire_date);

# find the employees who have been hired in thi year of 2000
Select * from employees where year(hire_date)=2000;
Select * from employees where extract(year from hire_date)=2000;

# find the tenure of the employees in the orgnization
Select first_name, hire_date, timestampdiff(year,hire_date, curdate()) from employees ;
Select first_name, hire_date, year(curdate())-year(hire_date) as  tenure from employees ;


