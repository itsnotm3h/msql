-- SELECT ALL --
-- try it at: https://www.mysqltutorial.org/tryit/

SELECT * FROM employees;


-- To show specific column
-- You can define spefic column via their column name:
SELECT firstName,lastName, email FROM employees;


--- Derived Attribute, you can use 2 columns to calculate.
-- Q1.
SELECT orderNumber, quantityOrdered * priceEach from orderdetails;

-- possible to give it an alias. 
SELECT orderNumber AS "Order Number", quantityOrdered * priceEach AS "Total" from orderdetails;

-- can do without, but it doesnt make sense
SELECT orderNumber "Order Number", quantityOrdered * priceEach "Total" from orderdetails;


-- Q2.
SELECT customerNumber, amount*0.09 from payments;

-- Q4: Find all the employee from office 1;
SELECT * FROM employees WHERE officeCode = 1;

-- Q5: Find all the employees that report to:
SELECT * FROM employees WHERE reportsTo = 1143;

-- Can combine select column
-- Find all employee and show only theit first name and lastname;
SELECT firstName,lastName, officeCode FROM employees WHERE officeCode = 1;


-- Q6: Find all the customers from brazil and display their contact information;
SELECT customerName,contactLastName,contactFirstName,phone FROM customers WHERE country = "France";


-- Q7: Find all the customer with the credit limit is more than 50,000;
SELECT * FROM customers WHERE creditLimit > 50000;

-- Logical operators: AND, OR


-- Q8: Find all customers in the USA with creditLimit more than 50000;
SELECT * FROM customers WHERE country="USA" AND creditLimit > 50000;


-- Q9: Find all customers in the USA or France;
SELECT * FROM customers WHERE country="USA" OR country="France";

-- Q10: Find all customers in France or from USA WHERE credit limit >50000;
-- It will not work as and will happen first;
SELECT * FROM customers WHERE country="USA" OR country="France" AND creditLimit > 50000;

-- so use: Always () to the clause you want to happen first. 
SELECT * FROM customers WHERE (country="USA" OR country="France") AND creditLimit > 50000;

-- Q11: Finnd all the employee with the job tile sales;
-- use LIKE to match string patterns;
-- use % means a wildcard like Anything;
-- ends with :
SELECT * from employee WHERE jobTitle LIKE ("%sales");

-- Q12: Match all jobtitle with Sales in it.
SELECT * from employees WHERE jobTitle LIKE ("%sales%");

-- JOIN 2 tables
SELECT firstName,lastName,country, city FROM employees JOIN offices
ON employees.officeCode = offices.officeCode;

-- Join happens first
-- if we have a select <col1>,<col2>, so we can control what we want to display. 

-- Order of precedence (SELECT, JOJN, WHERE):
-- 1. JOIN
-- 2. WHERE
-- 3. SELECT

-- For each customer to show the firstname lastname of their sales wrap. 
SELECT customerName, firstName "Sales Rep First Name", lastName "Sales Rep Last Name" FROM customers JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber;


--- for each employee show their first name last name job title, and the first name, last name of the supervisor.
-- we are join a table to itself, we can give it an alias name to be able to differentiate the data and call it later on. 
-- take note that all data must be specific to which table is from as jobTitle is duplicated so u need to declare which alias its from.
SELECT superVisorEmp.firstName, superVisorEmp.lastName, superVisorEmp.jobTitle, supervisor.firstName "Supervisor First Name", supervisor.lastName "Supervisor Last Name" FROM
employees AS superVisorEmp JOIN employees AS supervisor
ON superVisorEmp.reportsTo = supervisor.employeeNumber;


--- Joining multiple tables. 
-- 1. Identify the foreign key and join them. 
-- 2. Join another table;
SELECT customerName, employees.firstName,employees.lastName, offices.country, offices.city from customers JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber
JOIN offices
ON employees.officeCode = offices.officeCode;

-- nuggets, join by alias-- 
SELECT customerName, e.firstName, e.lastName, o.country, o.city from customers as c  JOIN employees as e
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices as o
ON e.officeCode = o.officeCode;