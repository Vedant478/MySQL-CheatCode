create database CDAC ; 
use cdac ;
###################### String ###########################
create table char_eg(id int , s_name char(10));
desc char_eg;
insert into char_eg values(10,"ab");
insert into char_eg values(20,"cd");
Select * from char_eg ;
###################### Size of char is 10 #########################

create table char_example_check_size(id int, s_name char(255));
create table varchar_eg(id int , s_name varchar(10));
insert into varchar_eg values(10,"ab");
insert into varchar_eg values(20,"cd");
select * from varchar_eg ;

create table blob_example(image_name char(10), image blob); 
insert into blob_example values("D",load_file("C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/gg.png"));
Select * from blob_example;

################################################
create table set_example(item_name varchar(10),
item_option set ("Spicy","Medium Spicy","Indian","no onion", "no garlic"));

## error 
insert into set_example values("Samosa", "Medium Spicy", "no garlic", "no onion");
insert into set_example(item_name,item_option) values ("Samosa",'Medium Spicy,no garlic,no onion');


Select * from set_example;

create table emp(emp_id int, emp_name varchar(20), skills set("Java", "Python","SQL","Big Data","ML"));

########################################### CONSTRAINTS ##################################
create table unique_const(username varchar(100) , pass_word varchar(20));

insert into unique_const values("abc@4332" , "avdvadssa@4543");

create table using_unique_const(username varchar(100) unique , pass_word varchar(20));
insert into using_unique_const values("abc@4332" , "avdvadssa@4543");
insert into using_unique_const values("abc@4332" , "avdvadssa@4543");

#############################################################################
create table student_table(student_id int unique , student_name varchar(100), course_id varchar(20));
insert into student_table values(1,"Aayush", "PG-DBDA-403");
insert into student_table values(1,"Abhay", "PG-DBDA-403");
insert into student_table values(2,"Abhay", "PG-DBDA-403");

############################################################################
create table student_table1(student_id int unique , student_name varchar(100), course_id varchar(20), mobile_no int(10) , unique(student_id,mobile_no));

insert into student_table1 values(1, "Aayush", "PG-DBDA-403", 216382102);
insert into student_table1 values(1, "Aayush", "PG-DBDA-403", 216382102);
insert into student_table1 values(2, "Aayush", "PG-DBDA-403", 216382102);
 
Select * from student_table1;

create table student_table2(student_id int unique , student_name varchar(100), course_id varchar(20), mobile_no int(11) , unique(student_id,mobile_no), unique(mobile_no) );
insert into student_table2 values(1, "Aayush", "PG-DBDA-403", 216382102);
insert into student_table2 values(2, "Aayush", "PG-DBDA-403", 216382102);
insert into student_table2 values(2, "Abhay", "PG-DBDA-403", 216382101);

Select * from student_table2;

########################################################################

create table not_null_ex1(student_name varchar(20) not null, student_id varchar(20) not null, hostel_room_no int);
 insert into not_null_ex1 values("Amritha" , 12, null);
Select * from not_null_ex1;

insert into not_null_ex1 values(null , 122, null);


create table not_null_ex2(user_name varchar(20) not null, order_name varchar(20), quantity int, table_preference int);

################################ Primary Key Constraint #############################
# PKC = UNC + NNC

create table unc_constraint_ex1(s_id int unique not null, s_name varchar(20) not null, age int not null);
insert into unc_constraint_ex1 values(121 , "Aayush" , 23);
insert into unc_constraint_ex1 values(121 , "Aayush" , 23); #error duplicate entry

insert into unc_constraint_ex1 values(null , "Aayush" , 23); #error null 
insert into unc_constraint_ex1 values(121 , null , 23); #error null

##########################################################################################
create table pkc_constraint_ex1(s_id int primary key, s_name varchar(20) not null);
insert into pkc_constraint_ex1 values(121, "Aayush");
insert into pkc_constraint_ex1 values(121, "Aayush");
insert into pkc_constraint_ex1 values(122, "Aayush");
insert into pkc_constraint_ex1 values(123, "");

Select * from pkc_constraint_ex1 ;

####################### Composite Key ##############################
create table comp_key_ex1(address varchar(50), street_name varchar(50), 
pin_code int(7), primary key(address,pin_code));

insert into comp_key_ex1 values("abccccasa","cdeeee", 726736);
insert into comp_key_ex1 values("abccccasa","cdeeee", 726736);

insert into comp_key_ex1 values("abccccasass","cdeseee", 7267546);

####################################################################
create table unique_pk_eg(s_id int primary key,s_name varchar(20) not null, mobile_no int unique, 
email varchar(50) primary key);

create table unique_pk_eg(s_id int primary key,s_name varchar(20) not null, mobile_no int unique, 
email varchar(50));

desc unique_pk_eg;

################################ Foreign key constriant ###################################
create table student1_table (s_id int primary key, s_name varchar(20), age int,course_id int);
########## Course Table ##############333
create table course_table(course_id int primary key, student_id int, course_name varchar(20), faculty_name varchar(20));

########### Student Table ###########
create table student1_table (s_id int primary key, s_name varchar(20), age int,course_id int,
foreign key(course_id) references course_table(course_id));

desc course_table;
desc student1_table;

################################# Default Constraint #######################################

create table default_ex(s_id int, s_name varchar(20), course_id int, subjects varchar(20) default 'Unassigned');

insert into default_ex(s_id,s_name,course_id) values (1,'vedant',403);
use cdac ;
insert into default_ex values (2,'vedant2',405, default);
Select * from default_ex;

select * from default_ex;
create table default_ex1(s_id int, s_name varchar(20), course_name varchar(20) default "403-PG-DBDA");

insert into default_ex1(s_id,s_name) values (2,'Abhay');
select * from default_ex1;


####################### Check Constraint ################################
create table chek1 (order_id int, order_name varchar(20), quantity int check(quantity>0));

insert into chek1 values(1, 'veg', 0);
insert into chek1 values(1, 'veg', 2);


create table chek3 (user_name varchar(20) check(char_length(user_name)<=8), pasword varchar(20));
insert into chek3 values('CDAC','cdac@cdac');


create table chek4 (stud_name varchar(20) , age int check(age>=18));
insert into chek4 values('shivraj', 20);
insert into chek4 values('shivraj', 17);

################ condition in and #############################################
create table chek5(user_name varchar(20), pasword varchar(20), check(char_length(user_name)<=8 and length(pasword) = 8 ));
insert into chek5 values('cdac','cdac@cdac');

create table chek6(user_name varchar(20), check (user_name REGEXP '[A-Za-z]+$'));
insert into chek6 values('cdac');

#################################################################
create table chek11 (user_name varchar(20), email varchar(20),
check(user_name REGEXP '^[A-Za-z]+$'),
check(email like '%@%'));

insert into chek11 values('cdac','asfgfasg');
insert into chek11 values('cdac','asfgfasg@gmail.com');

#####################################################################
create table chek10(user_name varchar(20),email varchar(50), gender varchar(10), 
check (gender in ('Female','Male','Other')));

insert into chek10 values ('cdac','asda@gmail.com','male');
insert into chek10 values ('cdac','asda@gmail.com','Male');

#################################### DDL ###############################














 













