-- ============================================================
-- TOPIC: WHERE Clause — AND, OR, NOT, LIKE Operators
-- ============================================================
-- Tables used:
--   employee1  (id, name, dept, age, salary)
-- ============================================================

USE practice;

-- ──────────────────────────────────────────────────────────
-- TABLE: employee1
-- ──────────────────────────────────────────────────────────

-- Create employee1 table with id, name, dept, age, salary
CREATE TABLE employee1 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept VARCHAR(50),
    age INT,
    salary INT
);

-- Insert employee records
INSERT INTO employee1 (id, name, dept, age, salary) VALUES
(1, 'Ravi',  'service',    30, 25000),
(2, 'Anita', 'manager',    40, 50000),
(3, 'Kiran', 'accountant', 35, 30000),
(4, 'Sita',  'reception',  25, 20000),
(5, 'Arjun', 'client',     28, 27000),
(6, 'Meena', 'service',    32, 26000);

-- Select all employees
SELECT * FROM employee1;

-- Select employees older than 30 AND in the 'service' dept
SELECT * FROM employee1 WHERE age > 30 AND dept = 'service';

-- Select employees in 'client' OR 'reception' dept
SELECT * FROM employee1 WHERE dept = 'client' OR dept = 'reception';

-- Select employees aged 30 or older (using >=)
SELECT * FROM employee1 WHERE age >= 30;

-- Select employees aged 30 or older (using NOT with <)
SELECT * FROM employee1 WHERE NOT age < 30;

-- Select employees who are NOT in the 'manager' dept (using NOT)
SELECT * FROM employee1 WHERE NOT dept = 'manager';

-- Select employees who are NOT in the 'manager' dept (using !=)
SELECT * FROM employee1 WHERE dept != 'manager';

-- Select employees aged between 25 and 35 (exclusive, using AND)
SELECT * FROM employee1 WHERE age > 25 AND age < 35;

-- Select employees whose dept starts with 's' AND age is greater than 28
SELECT * FROM employee1 WHERE dept LIKE 's%' AND age > 28;

-- Select employees in 'service' dept OR younger than 28
SELECT * FROM employee1 WHERE dept = 'service' OR age < 28;

-- Select employees whose dept does NOT contain the letter 'e'
SELECT * FROM employee1 WHERE dept NOT LIKE '%e%';

-- Select employees older than 25 AND in 'client' OR 'accountant' dept
-- (parentheses control evaluation order)
SELECT * FROM employee1
WHERE age > 25 AND (dept = 'client' OR dept = 'accountant');

-- Select employees whose dept starts with 'c' but does NOT end with 't'
SELECT * FROM employee1
WHERE dept LIKE 'c%' AND dept NOT LIKE '%t';

-- Select employees aged 25–40 (inclusive) AND NOT in 'reception' dept
SELECT * FROM employee1
WHERE (age >= 25 AND age <= 40) AND dept <> 'reception';

-- Select employees whose name starts with 'A' OR dept contains 'e'
SELECT * FROM employee1
WHERE name LIKE 'A%' OR dept LIKE '%e%';

-- ──────────────────────────────────────────────────────────
-- Complex WHERE with nested AND / OR
-- ──────────────────────────────────────────────────────────

-- Select employees older than 25 AND in 'service' or 'client' dept
SELECT * FROM employee1
WHERE age > 25 AND (dept = 'service' OR dept = 'client');

-- Select employees whose dept contains 'e' OR (age < 28 AND name starts with 'A')
SELECT * FROM employee1
WHERE dept LIKE '%e%' OR (age < 28 AND name LIKE 'A%');

-- Select employees aged 25–35 AND not in 'manager' dept, OR name starts with 'R'
SELECT * FROM employee1
WHERE ((age >= 25 AND age <= 35) AND dept != 'manager') OR name LIKE 'R%';

-- Select employees whose dept starts with 'c' or 's', age > 30, and dept is NOT 'client'
SELECT * FROM employee1
WHERE (dept LIKE 'c%' OR dept LIKE 's%') AND age > 30 AND dept <> 'client';
