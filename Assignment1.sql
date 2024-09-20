### Create a simple table of countries 
create database Assign1;
use Assign1;

################### Question 1 #####################
create table countries(
country_id int(10), 
country_name char(20), 
region_id int(10));

################## Question 2 ######################
create table if not exists countries(
country_id int(10), 
country_name char(20), 
region_id int(10));

################# Question 3 ###################
create table dup_countries as select * from countries ;
desc dup_countries;

################# Question 4 ###################
insert into countries values(1,'India',20);
insert into countries values(2,'Russia',30);
insert into countries values(3,'China',40);
insert into countries values(4,'Pakistan',50);

Select * from countries;

create table dup_countries1 as select * from countries;
Select * from dup_countries1;

#################### Question 5 ########################
create table countries2(
country_id int(10) , 
country_name char(20) , 
region_id int(10) default null);

insert into countries2 (country_id,country_name) values(1,'India');
Select * from countries2;

################################## Question 6 #######################################
create table job (
	job_id int,
    job_title varchar(20),
    min_salary int,
    max_salary int,
    check(max_salary<=25000)
);
insert into job values(1,'analyst',1000,2500000);
insert into job values(1,'analyst',1000,250);
Select * from job;

################################### Question 7 #########################################

create table countries3(country_id int , country_name varchar(50), region_id int, 
check(country_name in('India','Italy','China')));
 
################################# Question 8 ###########################################
use assign1;
show tables;

create table job_history1(
	employee_id int not null,
    start_date date not null,
    end_date varchar(10) not null,
    job_id int not null,
    department_id int not null,
    constraint chk_end_date_format1 check (end_date LIKE '__/__/____')
);

Insert into job_history1 values(1,'2024-09-09', '19/09/2024', 20, 200);
Select *  from job_history1;

######################### Question 9 #########################################

create table countries3 (
country_id int primary key ,
country_name varchar(50),
region_id int
);

insert into countries3 values(1,"USA",200);
insert into countries3 values(1,"UK",300);

###################### Question 10 #####################3
use assign1;
show tables;
create table job_1(job_id int, job_title varchar(50) default "blank" , min_salary float check(min_salary >= 8000), max_salary float);
insert into job_1 values(1,' ' ,800000,4000000);
insert into job_1 values(2,default ,800000,4000000);
insert into job_1 values(3,' ' ,800,4000000);
select * from job_1;

###################### Question 11 ############################
create table countries3 (
country_id int primary key ,
country_name varchar(50),
region_id int
);
insert into countries3 values(1,"India",201);
insert into countries3 values(1,"India",201);

###################### Question 12 #############################
create table countries4 (
country_id int primary key auto_increment ,
country_name varchar(50),
region_id int
);

insert into countries4(country_name,region_id) values('India',200);
insert into countries4(country_name,region_id) values('UK',201);

select * from countries4;

##################### Question 13 ###################################
create table countries5 (
country_id int unique ,
country_name varchar(50),
region_id int unique
);
insert into countries5 values(1,"India",201);
insert into countries5 values(1,"USA",201);

##################### Question 14 #################################
show tables;
desc job_history;
desc job;

create table job1(job_id varchar(10) not null primary key,job_title varchar(35) not null ,min_salary decimal(6,0),max_salary decimal(6,0));
create table job_history2(
	employee_id int unique not null,
    start_date date not null,
    end_date varchar(10) not null,
    job_id varchar(10) not null,
    department_id int not null,
    foreign key(job_id) references job1(job_id)
);

desc job1;
desc job_history2;



    
