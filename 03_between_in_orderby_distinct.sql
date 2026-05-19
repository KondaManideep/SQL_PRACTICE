-- ============================================================
-- TOPIC: BETWEEN, IN, ORDER BY, DISTINCT
-- ============================================================
-- Tables used:
--   student  (id, name, course, age, marks)
-- ============================================================

USE practice;

-- ──────────────────────────────────────────────────────────
-- TABLE: student
-- ──────────────────────────────────────────────────────────

-- Create the student table
CREATE TABLE student (
    id     INT PRIMARY KEY,
    name   VARCHAR(50),
    course VARCHAR(50),
    age    INT,
    marks  INT
);

-- Insert student records
INSERT INTO student (id, name, course, age, marks) VALUES
(1, 'Amit',   'CSE',  20, 75),
(2, 'Neha',   'ECE',  22, 82),
(3, 'Rahul',  'CSE',  21, 68),
(4, 'Anjali', 'EEE',  23, 90),
(5, 'Kiran',  'MECH', 24, 55),
(6, 'Arjun',  'CSE',  22, 88),
(7, 'Sneha',  'ECE',  21, 72),
(8, 'Asha',   'EEE',  23, 95);

-- Select all students
SELECT * FROM student;

-- ──────────────────────────────────────────────────────────
-- BETWEEN
-- ──────────────────────────────────────────────────────────

-- Select students whose marks are between 70 and 90 (inclusive)
SELECT * FROM student WHERE marks BETWEEN 70 AND 90;

-- Select students whose marks are between 60 and 80 (inclusive)
SELECT * FROM student WHERE marks BETWEEN 60 AND 80;

-- Select students whose marks are NOT between 70 and 90
SELECT * FROM student WHERE marks NOT BETWEEN 70 AND 90;

-- Select CSE students whose marks are between 70 and 90
SELECT * FROM student
WHERE marks BETWEEN 70 AND 90 AND course = 'CSE';

-- Select students with marks between 60 and 95, excluding EEE course
SELECT * FROM student
WHERE marks BETWEEN 60 AND 95 AND course <> 'EEE';

-- Select students with marks between 70 and 90, OR whose name starts with 'A'
SELECT * FROM student
WHERE marks BETWEEN 70 AND 90 OR name LIKE 'A%';

-- Select students whose marks are NOT between 70 and 90, from a course starting with 'C'
SELECT * FROM student
WHERE marks NOT BETWEEN 70 AND 90 AND course LIKE 'C%';

-- ──────────────────────────────────────────────────────────
-- IN / NOT IN
-- ──────────────────────────────────────────────────────────

-- Select students from CSE or ECE course
SELECT * FROM student WHERE course IN ('CSE', 'ECE');

-- Select students named Amit, Rahul, or Asha
SELECT * FROM student WHERE name IN ('Amit', 'Rahul', 'Asha');

-- Select students who scored exactly 75, 82, or 90
SELECT * FROM student WHERE marks IN (75, 82, 90);

-- Select students from CSE or EEE course AND marks greater than 70
SELECT * FROM student
WHERE course IN ('CSE', 'EEE') AND marks > 70;

-- Select students whose name is NOT Amit or Neha
SELECT * FROM student WHERE name NOT IN ('Amit', 'Neha');

-- Select students from CSE or ECE course, OR marks less than 60
SELECT * FROM student
WHERE course IN ('CSE', 'ECE') OR marks < 60;

-- Select students NOT from MECH or EEE, AND marks between 70 and 95
SELECT * FROM student
WHERE course NOT IN ('MECH', 'EEE') AND marks BETWEEN 70 AND 95;

-- ──────────────────────────────────────────────────────────
-- ORDER BY
-- ──────────────────────────────────────────────────────────

-- Sort all students by marks in ascending order (lowest first)
SELECT * FROM student ORDER BY marks ASC;

-- Sort all students by marks in descending order (highest first)
SELECT * FROM student ORDER BY marks DESC;

-- Sort students by age (default is ASC)
SELECT * FROM student ORDER BY age;

-- Sort students by course A–Z, then by marks highest first within each course
SELECT * FROM student ORDER BY course ASC, marks DESC;

-- Select students with marks above 70, sorted by marks descending
SELECT * FROM student
WHERE marks > 70
ORDER BY marks DESC;

-- Sort students by name A–Z, then by age highest first
SELECT * FROM student ORDER BY name ASC, age DESC;

-- ──────────────────────────────────────────────────────────
-- DISTINCT
-- ──────────────────────────────────────────────────────────

-- Get the unique list of courses offered
SELECT DISTINCT course FROM student;

-- Get the unique ages of students
SELECT DISTINCT age FROM student;

-- Get the unique marks values
SELECT DISTINCT marks FROM student;

-- Get unique courses where at least one student scored above 70
SELECT DISTINCT course FROM student WHERE marks > 70;

-- Get unique names of CSE students
SELECT DISTINCT name FROM student WHERE course = 'CSE';

-- Get unique combinations of course and age
SELECT DISTINCT course, age FROM student;

-- Get unique courses sorted alphabetically
SELECT DISTINCT course FROM student ORDER BY course;

-- Get unique ages of students who scored between 60 and 90, sorted descending
SELECT DISTINCT age FROM student
WHERE marks BETWEEN 60 AND 90
ORDER BY age DESC;
