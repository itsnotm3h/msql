-- you can have more than 1 database work at the same time --
-- See all the database on your server --
show databases;

-- create a new database --
-- name after the domain --
create database swimming_coach;

-- possible for a database that your cant see the interface -- 

-- Change active database -- 
-- use <nameOfDatabase> --
use swimming_coach;

-- We are learning MYSQL (SME and Startup) --
-- they are other SQL providers, Oracle (Oldest, use by big enterprises), postGres(Json), microsoft and mariaDB (From techies that left Oracle) --
-- if an item is open source, you wont be able to close it up --
-- MariaDB = MYSQL  --

-- Create new table --
-- Named `parents` with some columns 
-- snytax: create table <table_name> (
-- <col name> <col data type> <options>,
--) engine = innodb;
-- the engine is the enable forigen keys.
create table parents(
    parent_id int unsigned auto_increment primary key,
    first_name varchar(200) not null,
    last_name varchar(200) default ''
) engine = innodb;

-- show the table -- 
show tables;

-- 2 way to create tables with foriegn key. --
-- option 1. create table then add in foriegn key. --
-- option 2. create table and foriegn key at the same time. ---
-- MYSQL command is not case sensitive --

-- option 1 --
create table student (
    student_id mediumint unsigned auto_increment primary key,
    name varchar(200) not null,
    date_of_birth datetime not null
) engine = innodb;

-- ALTER TABLE --
-- to alter an exisiting table, change coliumn, add a new colum or delete the col -- 
-- ** if you are going to add a foriegn key to another table. the datatype must match -- 

-- To create a column.
-- MUST MAKE SURE THAT THE FOREIGN KEY MUST BE THE SAME AS WHAT YOU WANT TO ADD -- 
alter table student add column parent_id int unsigned;

-- To add a foriegn key, definie parent id in student table as foriegn key --
-- fk_students_parents (this is defined by us, is the name of the foreign key. --
-- Set the foreign key name, refer it to the parent id that is found in the parents table called parents_id --

-- it will show that its a foreign key as MUL.
ALTER TABLE student ADD CONSTRAINT fk_students_parents FOREIGN KEY (parent_id) REFERENCES parents(parent_id);

-- ALTER TABLE: Modify an existing column --
-- make the parent_id not null --
-- must provide new column defintiion, myst provide the datatype.
ALTER TABLE student MODIFY COLUMN parent_id INT UNSIGNED NOT NULL;

-- INSERT: Add new data --
-- Syntax: INSERT INTO <table name> (<col1>,<col2>) VALUES (<col1>,<col2>)
-- IT is by the order of what you have define in ();
INSERT INTO parents (first_name,last_name) VALUES ("John","Wick");

-- See all rows from table --
-- Syntax: SELECT <*, means all> FROM <table name>;
SELECT * FROM parents;

-- what happens if we did not enter full data to insert?
-- if there is a value that is not null and you did not include in the insert,it will not work. 
-- It will not work when your parent_id does not exist. 
-- will see an error: Cannot add or update a child row.
INSERT INTO student (name, date_of_birth, parent_id) VALUES ("John Wick","1982-06-13",1);

--DELETE: remove a row--
-- the following will not work:-- 
-- it will nnot work cause there is a table that is refering to it. 
-- MUST HAVE A WHERE!!!!!!!! if not it will delete all the database, with no backup. 
DELETE FROM parents WHERE parent_id = 1;

-- DROP: delete a table -- 
DROP TABLE parents; -- will not work as there is a reference key that is being in use. 


-- use DESCRIBE to show fields and definition of a table--
DESCRIBE student;


-- what is a BASH prompt? -- 
-- is where u run commands in linux -- 
-- To go into mysql prompt: mysql -u root or mysql -h 127.0.0.1 -u root


-- create a table + foreign key at the same time
-- think of scenario that will happen and decide on how the table should be created. 
CREATE TABLE payments (
payment_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
date_paid DATETIME NOT NULL,
parent_id INT UNSIGNED NOT NULL,
FOREIGN KEY (parent_id) REFERENCES parents(parent_id),
student_id MEDIUMINT UNSIGNED NOT NULL, 
FOREIGN KEY (student_id) REFERENCES student(student_id)
) engine = innodb;

-- ALTER payment table to add in amount
-- Did not set not null for demostration.
ALTER TABLE payments ADD COLUMN amount DECIMAL(10,2);


-- change the amount column so that it is not now. 
-- it like a put in restful API. 
-- Must retype the datatype.
ALTER TABLE payments MODIFY COLUMN amount DECIMAL(10,2) NOT NULL;


-- to add a column.
ALTER TABLE payments ADD COLUMN test VARCHAR(100);

-- DROP COLUMN
-- Delete very item in the column name test.
ALTER TABLE payments DROP COLUMN test;

-- if you need to drop a foreign key. 

