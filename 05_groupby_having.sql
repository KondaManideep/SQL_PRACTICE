-- ============================================================
-- TOPIC: GROUP BY & HAVING
-- ============================================================
-- Tables used:
--   student_page  (id, name, course, age, marks)
--   (created in 04_limit_offset_aggregates.sql)
-- ============================================================

USE practice;

-- ──────────────────────────────────────────────────────────
-- GROUP BY with HAVING — student_page
-- ──────────────────────────────────────────────────────────

-- Find courses that have more than 2 students enrolled
SELECT course FROM student_page
GROUP BY course
HAVING COUNT(*) > 2;

-- Find courses where at least one student scored above 90
SELECT course FROM student_page
GROUP BY course
HAVING MAX(marks) > 90;

-- Find courses where the highest mark is above 90, and show that mark
SELECT course, MAX(marks) AS Highest_Marks FROM student_page
GROUP BY course
HAVING Highest_Marks > 90;

-- Find courses where the average marks fall between 70 and 85
SELECT course, AVG(marks) AS Avg_marks FROM student_page
GROUP BY course
HAVING Avg_marks BETWEEN 70 AND 85;

-- Find courses where total marks > 150 AND highest mark > 80
SELECT course,
       SUM(marks) AS Total_marks,
       MAX(marks) AS Highest_marks
FROM student_page
GROUP BY course
HAVING Total_marks > 150 AND Highest_marks > 80;

-- Find courses where average marks > 70 AND the lowest mark is below 60
-- (course has both high average and at least one weak student)
SELECT course,
       AVG(marks) AS avg_marks,
       MIN(marks) AS min_marks
FROM student_page
GROUP BY course
HAVING avg_marks > 70 AND min_marks < 60;

-- ──────────────────────────────────────────────────────────
-- GROUP BY with HAVING — movie / arithmetic context
-- ──────────────────────────────────────────────────────────

-- Find genres whose total profit (collection - budget) exceeds 1000
SELECT genre, SUM(collection - budget) AS Total_profit FROM movie
GROUP BY genre
HAVING Total_profit > 1000;

-- Find genres where the average rating + 1 is greater than 5.5
SELECT genre, AVG(rating) + 1 AS Avg_rating FROM movie
GROUP BY genre
HAVING Avg_rating > 5.5;

-- Find genres where (max collection - min budget) is greater than 2000
SELECT genre,
       MAX(collection) AS max_col,
       MIN(budget)     AS min_bud
FROM movie
GROUP BY genre
HAVING (max_col - min_bud) > 2000;
