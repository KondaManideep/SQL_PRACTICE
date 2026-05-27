-- ============================================================
-- TOPIC: LIMIT & OFFSET + Aggregate Functions
--        (COUNT, SUM, AVG, MAX, MIN)
-- ============================================================
-- Tables used:
--   student_page  (id, name, course, age, marks)
-- ============================================================

USE practice;

-- ──────────────────────────────────────────────────────────
-- TABLE: student_page
-- ──────────────────────────────────────────────────────────

-- Create the student_page table
CREATE TABLE student_page(
    id     INT,
    name   VARCHAR(50),
    course VARCHAR(10),
    age    INT,
    marks  INT
);

-- Insert student records
INSERT INTO student_page(id, name, course, age, marks) VALUES
(1,  'Amit',   'CSE',  20, 75),
(2,  'Neha',   'ECE',  22, 82),
(3,  'Rahul',  'MECH', 21, 68),
(4,  'Anjali', 'EEE',  23, 91),
(5,  'Kiran',  'CSE',  24, 55),
(6,  'Arjun',  'ECE',  22, 88),
(7,  'Sneha',  'CSE',  21, 72),
(8,  'Asha',   'EEE',  23, 95),
(9,  'Ravi',   'MECH', 25, 66),
(10, 'Meena',  'CSE',  24, 79);

-- Select all students
SELECT * FROM student_page;

-- ──────────────────────────────────────────────────────────
-- LIMIT & OFFSET
-- ──────────────────────────────────────────────────────────

-- Select only the first 3 rows
SELECT * FROM student_page LIMIT 3;

-- Select the top 5 students by highest marks
SELECT * FROM student_page
ORDER BY marks DESC
LIMIT 5;

-- Skip the first 2 rows and return the next 3 (pagination)
SELECT * FROM student_page LIMIT 3 OFFSET 2;

-- Select the top 4 students sorted by highest marks
SELECT * FROM student_page
ORDER BY marks DESC
LIMIT 4;

-- Sort by age ascending, skip first 3, return next 2
SELECT * FROM student_page
ORDER BY age ASC
LIMIT 2 OFFSET 3;

-- Select the top 2 students with marks above 70, sorted by highest marks
SELECT * FROM student_page
WHERE marks > 70
ORDER BY marks DESC
LIMIT 2;

-- From CSE students, skip the oldest and get the next 2 by age descending
SELECT * FROM student_page
WHERE course = 'CSE'
ORDER BY age DESC
LIMIT 2 OFFSET 1;

-- ──────────────────────────────────────────────────────────
-- AGGREGATE FUNCTIONS
-- ──────────────────────────────────────────────────────────

-- Count the total number of students (using id column)
SELECT COUNT(id) FROM student_page;

-- Calculate the total marks of all students
SELECT SUM(marks) FROM student_page;

-- Calculate the average marks of all students
SELECT AVG(marks) FROM student_page;

-- Find the highest marks scored
SELECT MAX(marks) FROM student_page;

-- Find the lowest marks scored
SELECT MIN(marks) FROM student_page;

-- Count how many students scored more than 70
SELECT COUNT(*) FROM student_page WHERE marks > 70;

-- Find the average age of CSE students
SELECT AVG(age) FROM student_page WHERE course = 'CSE';

-- Find the highest marks scored in ECE course
SELECT MAX(marks) FROM student_page WHERE course = 'ECE';

-- Find the total marks for students aged between 20 and 23
SELECT SUM(marks) FROM student_page WHERE age BETWEEN 20 AND 23;

-- Find the lowest marks among students who are NOT in MECH
SELECT MIN(marks) FROM student_page WHERE course <> 'MECH';

-- Find the average marks for students who scored above 70 and are in CSE or ECE
SELECT AVG(marks) FROM student_page
WHERE marks > 70 AND course IN ('CSE', 'ECE');
