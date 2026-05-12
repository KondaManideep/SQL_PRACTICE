-- ============================================================
-- TOPIC: DDL & Basic CRUD Operations
-- ============================================================
-- Tables used:
--   players   (name, age, score)
--   products  (name, category, price)
--   employee  (id/num, dept, age, salary)
-- ============================================================

USE practice;

-- ──────────────────────────────────────────────────────────
-- TABLE: players
-- ──────────────────────────────────────────────────────────

-- Create a players table with name, age, score columns
CREATE TABLE players(
    name VARCHAR(100),
    age INT,
    score INT
);

-- Select all rows from players (empty table)
SELECT * FROM players;

-- Insert single rows into players
INSERT INTO players VALUES('mani', 20, 94);
INSERT INTO players VALUES('deep', 21, 95);
INSERT INTO players VALUES('thoo', 20, 98);

-- Select only name and age columns from players
SELECT name, age FROM players;

-- Select players whose age is greater than 20
SELECT * FROM players WHERE age > 20;

-- Update score to 100 for the player named 'mani'
UPDATE players SET score = 100 WHERE name = 'mani';

-- Select all rows to verify the update
SELECT * FROM players;

-- Delete all rows from players (no WHERE = truncate all)
DELETE FROM players;

-- Select all rows to confirm deletion
SELECT * FROM players;

-- Drop the entire players table
DROP TABLE players;

-- Try to select from players after drop (will error — table gone)
SELECT * FROM players;

-- Show all tables in the current database
SHOW TABLES;


-- ──────────────────────────────────────────────────────────
-- TABLE: products
-- ──────────────────────────────────────────────────────────

-- Create a products table with name, category, price columns
CREATE TABLE products(name VARCHAR(30), category VARCHAR(30), price INT);

-- Insert individual product rows
INSERT INTO products VALUES('laptop', 'electronic', 50000);
INSERT INTO products VALUES('table', 'furniture', 30000);
INSERT INTO products VALUES('mobile', 'electronic', 15000);

-- Select all products
SELECT * FROM products;

-- Select only name and price columns
SELECT name, price FROM products;

-- Select products whose price is greater than 20000
SELECT * FROM products WHERE price > 20000;

-- Select products belonging to the 'electronic' category
SELECT * FROM products WHERE category = 'electronic';

-- Update price to 25000 for all electronics
UPDATE products SET price = 25000 WHERE category = 'electronic';

-- Select all to verify the update
SELECT * FROM products;

-- Delete the product named 'laptop'
DELETE FROM products WHERE name = 'laptop';

-- Select all to verify deletion
SELECT * FROM products;

-- Select products whose category starts with 'e'
SELECT * FROM products WHERE category LIKE 'e%';

-- Select products whose name ends with 'le'
SELECT * FROM products WHERE name LIKE '%le';

-- Select products whose name ends with 'ile'
SELECT * FROM products WHERE name LIKE '%ile';

-- Select products whose category contains 'nit' anywhere
SELECT * FROM products WHERE category LIKE '%nit%';


-- ──────────────────────────────────────────────────────────
-- TABLE: employee  (id later renamed to num)
-- ──────────────────────────────────────────────────────────

-- Create an employee table with id, dept, age columns
CREATE TABLE employee(
    id INT,
    dept VARCHAR(20),
    age INT
);

-- Select all (empty)
SELECT * FROM employee;

-- Insert rows using named columns
INSERT INTO employee(id, dept, age) VALUES(1, 'admin', 39);

-- Insert rows using positional values
INSERT INTO employee VALUES(2, 'manager', 45);
INSERT INTO employee VALUES(3, 'service', 29);

-- Select all employees
SELECT * FROM employee;

-- Select id and dept for employees older than 30
SELECT id, dept FROM employee WHERE age > 30;

-- Select id and age for employees in the 'manager' dept
SELECT id, age FROM employee WHERE dept = 'manager';

-- Insert multiple rows in one statement
INSERT INTO employee(id, dept, age) VALUES
    (4, 'accountant', 36),
    (5, 'reception', 25),
    (6, 'client', 28);

-- Select all employees
SELECT * FROM employee;

-- Select dept and age columns only
SELECT dept, age FROM employee;

-- Select employees younger than 30
SELECT * FROM employee WHERE age < 30;

-- Update manager's age to 40
UPDATE employee SET age = 40 WHERE dept = 'manager';

-- Select all to verify update
SELECT * FROM employee;

-- Delete all employees older than 35
DELETE FROM employee WHERE age > 35;

-- Select all to verify deletion
SELECT * FROM employee;

-- Insert two more rows
INSERT INTO employee VALUES(1, 'HR', 30), (2, 'Manager', 31);

-- Select all
SELECT * FROM employee;

-- Delete the employee in HR dept
DELETE FROM employee WHERE dept = 'HR';

-- Select all to confirm
SELECT * FROM employee;

-- Add a new salary column to the employee table
ALTER TABLE employee ADD salary INT;

-- Select all to see new column
SELECT * FROM employee;

-- Rename column id to num
ALTER TABLE employee RENAME COLUMN id TO num;

-- Select all with renamed column
SELECT * FROM employee;

-- Drop the salary column
ALTER TABLE employee DROP COLUMN salary;

-- Select all to confirm column removed
SELECT * FROM employee;

-- Select employees whose age is NOT equal to 31
SELECT * FROM employee WHERE age <> 31;

-- Select employees with age 30 or less
SELECT * FROM employee WHERE age <= 30;

-- Update service dept employee's age to 35
UPDATE employee SET age = 35 WHERE dept = 'service';

-- Select all to verify
SELECT * FROM employee;

-- Delete employees younger than 30
DELETE FROM employee WHERE age < 30;

-- Select all to verify
SELECT * FROM employee;

-- Select employees whose dept starts with 's'
SELECT * FROM employee WHERE dept LIKE 's%';

-- Select employees whose dept matches pattern _ervice (6 chars, starts with any letter)
SELECT * FROM employee WHERE dept LIKE '_ervice';

-- Select employees whose dept matches ___ager (6 chars)
SELECT * FROM employee WHERE dept LIKE '___ager';

-- Select all to check current state
SELECT * FROM employee;

-- Insert more employees (using renamed column 'num')
INSERT INTO employee(num, dept, age) VALUES
    (4, 'accountant', 36),
    (5, 'reception', 25),
    (6, 'client', 28);

-- Select employees whose dept is exactly 6 characters long
SELECT * FROM employee WHERE dept LIKE '______';

-- Select employees whose dept is exactly 7 characters long
SELECT * FROM employee WHERE dept LIKE '_______';

-- Show structure of employee table
DESC employee;

-- Select employees whose dept starts with 'a'
SELECT * FROM employee WHERE dept LIKE 'a%';

-- Select employees whose dept ends with 't'
SELECT * FROM employee WHERE dept LIKE '%t';

-- Select employees whose dept contains 'cc' anywhere
SELECT * FROM employee WHERE dept LIKE '%cc%';

-- Select employees whose dept has any letter, then 'e', then anything
SELECT * FROM employee WHERE dept LIKE '_e%';

-- Select employees whose dept starts with 'c' and ends with 't'
SELECT * FROM employee WHERE dept LIKE 'c%t';

-- Select employees whose dept has any 2 letters, then 'r', then anything
SELECT * FROM employee WHERE dept LIKE '__r%';

-- Select employees whose dept contains 'e' anywhere
SELECT * FROM employee WHERE dept LIKE '%e%';

-- Select employees whose dept starts with 'r'
SELECT * FROM employee WHERE dept LIKE 'r%';

-- Select employees whose dept ends with 'n'
SELECT * FROM employee WHERE dept LIKE '%n';

-- Select employees whose dept is exactly 5 characters long
SELECT * FROM employee WHERE dept LIKE '_____';

-- Select employees whose dept starts with 'c' AND age is greater than 25
SELECT * FROM employee
WHERE dept LIKE 'c%' AND age > 25;
