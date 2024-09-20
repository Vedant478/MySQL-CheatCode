-- create an user 
create user 'aug_user1@localhost' identified by "cdac";
create user 'aug_user2@localhost' identified by "cdac";
create user 'hr@localhost' identified by "hr";
create user 'aug_user3'@'localhost' identified by "user3";



 
-- check list of users 
select user,host from mysql.user ;

-- granting the permisson to user1 for databasehr
Grant all privileges on hr.* to 'aug_user3'@'localhost';
Grant all privileges on *.* to 'vedant';

-- granting selective permisson to the user 
Grant select on hr.* to 'aug_user2@localhost';

-- grant for particular table in database 
Grant select on hr.job_history to 'aug_user2@localhost';

-- show grant
show grants for 'aug_user2@localhost';

-- grant the permisson to select all the bale in all the database i.e present in mysql
grant select on *.* to 'aug_user2@localhost';

-- remove all the priveleges 
Flush privileges ;

-- revoke 
Revoke select on *.* from 'aug_user2@localhost';

-- drop a user 
drop user 'aug_user2@localhost';

use hr ;

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_name VARCHAR(255),
    balance DECIMAL(10, 2)
);

INSERT INTO accounts (account_id, account_name, balance) VALUES
(1, 'Aman', 1000.00),
(2, 'Ketan', 500.00);

