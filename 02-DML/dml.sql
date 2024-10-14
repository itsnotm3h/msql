-- INSERT INTO: add a new row
CREATE TABLE coaches (
coach_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(200) NOT NULL,
last_name VARCHAR(200),
salary DECIMAL(10,2) NOT NULL DEFAULT 0,
email VARCHAR(500) NOT NULL
) engine= innodb;

-- INSERT INTO(<col1>,<col2>) VALUES (<col1>,<col2>);

INSERT INTO coaches (first_name,email) VALUES ('David','David@gmail.com');

-- TO INSERT MANY
INSERT INTO coaches(first_name,last_name,salary,email)
VALUES ('Keith',"Tan", 3000, "keith@gmail.com"),('Lee San', NULL, 4000, "ys@gmail.com"),('Fern', NULL, 2000, "fern@gmail.com");


-- UPDATE FROM: update an existing row. 
-- Syntax: UPDATE <table> SET COL1=VAL1, COL2 =VAL2... WHERE...
-- IF WHERE does not exist it will update all the rows
UPDATE coaches SET salary=30000 WHERE coach_id = 2;

-- UPDATE MULTIPLE ROWS.
-- example all coaches are paid less than 5000 and give them 10% increment;
-- should do it in js rather than the copy of data.
UPDATE coaches SET salary=salary*1.1 WHERE salary < 5000;


-- UPDATE MULTIPLE COLS.
-- if you just want to change a single column, then always use the PRIMARY KEY in WHERE clause;
UPDATE coaches SET last_name="Park",email="park@gmail.com" WHERE coach_id = 1;


-- DELETE FROM: delete an exisiting row.
DELETE FROM coaches WHERE coach_id = 4;


-- EXTRA the index number will run after it deleted. If there is an error in inserting, the index number will be used. --
INSERT INTO coaches (first_name,email) VALUES ("John","John@gmail.com");

-- Can choose not to have increment numnber id. IF it not a client facing APi you do not need to mask your id number to prevent people to from crawling product. -- 

-- Some Notes --
-- Express is used to be the middle man to insert the data into the server --