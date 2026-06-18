-- ============================================================
-- TOPIC: Arithmetic Expressions, Date Functions,
--        Math Functions (FLOOR, CEIL, ROUND),
--        String Functions (UPPER, LOWER),
--        CAST
-- ============================================================
-- Tables used:
--   movie   (id, name, budget, collection, rating, genre)
--   movies  (id, name, genre, rating, release_date,
--            budget_in_cr, collection_in_cr)
-- ============================================================

USE practice;

-- ──────────────────────────────────────────────────────────
-- TABLE: movie  (arithmetic expressions)
-- ──────────────────────────────────────────────────────────

-- Create the movie table
CREATE TABLE movie (
    id         INT,
    name       VARCHAR(50),
    budget     INT,
    collection INT,
    rating     FLOAT,
    genre      VARCHAR(30)
);

-- Insert movie records
INSERT INTO movie VALUES
(1, 'Inception', 160,  870,  4.8, 'Sci-Fi'),
(2, 'Avatar',    237,  2900, 4.7, 'Sci-Fi'),
(3, 'Titanic',   200,  2200, 4.6, 'Romance'),
(4, 'Joker',     55,   1070, 4.5, 'Drama'),
(5, 'Bahubali',  180,  650,  4.7, 'Action');

-- Calculate profit (collection - budget) for each movie
SELECT name, (collection - budget) AS profit FROM movie;

-- Show doubled budget for each movie
SELECT name, (budget * 2) AS doubled_budget FROM movie;

-- Increase every movie's rating by 1
SELECT name, (rating + 1) AS new_rating FROM movie;

-- Select movies where profit is greater than 500
SELECT * FROM movie WHERE (collection - budget) > 500;

-- Select movies where double the rating exceeds 9
SELECT * FROM movie WHERE (rating * 2) > 9;

-- Select movies where budget + 50 exceeds 250
SELECT * FROM movie WHERE (budget + 50) > 250;

-- ──────────────────────────────────────────────────────────
-- TABLE: movies  (date functions, math functions, CAST, strings)
-- ──────────────────────────────────────────────────────────

-- Create the movies table with a DATE column
CREATE TABLE movies(
    id               INTEGER,
    name             VARCHAR(100),
    genre            VARCHAR(50),
    rating           FLOAT,
    release_date     DATE,
    budget_in_cr     FLOAT,
    collection_in_cr FLOAT
);

-- Insert movie records
INSERT INTO movies VALUES
(1, 'The Matrix',        'Sci-Fi', 8.7, '1999-03-31', 63,  467),
(2, 'Inception',         'Action', 8.8, '2010-07-16', 160, 836),
(3, 'Avengers Endgame',  'Action', 8.4, '2019-04-26', 356, 2797),
(4, 'Toy Story 3',       'Animation', 8.3, '2010-06-18', 200, 1067),
(5, 'The Dark Knight',   'Action', 9.0, '2008-07-18', 185, 1006);

-- Select all movies
SELECT * FROM movies;

-- ── DATE FUNCTIONS ─────────────────────────────────────────

-- Extract the release year from each movie's release date
SELECT YEAR(release_date) FROM movies;

-- Show movie name alongside its release month number
SELECT name, MONTH(release_date) AS release_month FROM movies;

-- Show the day of the month each movie was released
SELECT DAY(release_date) AS release_day FROM movies;

-- Select all movies released in the year 2010
SELECT * FROM movies WHERE YEAR(release_date) = 2010;

-- Count how many movies were released each year
SELECT YEAR(release_date) AS release_year, COUNT(*) FROM movies
GROUP BY release_year;

-- Select all movies released in December (month = 12)
SELECT * FROM movies WHERE MONTH(release_date) = 12;

-- Find the year that had the highest number of releases (top 1)
SELECT YEAR(release_date) AS release_year, COUNT(*) AS High FROM movies
GROUP BY release_year
ORDER BY High DESC
LIMIT 1;

-- Count how many movies were released each month in the year 2020
SELECT MONTH(release_date) AS release_month, COUNT(*) FROM movies
WHERE YEAR(release_date) = 2020
GROUP BY release_month;

-- Show name and release year for movies released after 2015
SELECT YEAR(release_date) AS released_year, name FROM movies
WHERE YEAR(release_date) > 2015;

-- ── CAST ───────────────────────────────────────────────────

-- Cast rating (FLOAT) to integer (truncates decimal)
SELECT CAST(rating AS SIGNED) FROM movies;

-- Cast release year to integer
SELECT CAST(YEAR(release_date) AS SIGNED) FROM movies;

-- Cast collection to integer
SELECT CAST(collection_in_cr AS SIGNED) FROM movies;

-- Select movies released after 2010 using CAST on year
SELECT YEAR(release_date) AS release_year FROM movies
WHERE CAST(YEAR(release_date) AS SIGNED) > 2010;

-- Average rating after casting to integer
SELECT AVG(CAST(rating AS SIGNED)) FROM movies;

-- Count movies per year (using CAST on year)
SELECT CAST(YEAR(release_date) AS SIGNED) AS release_year, COUNT(*) FROM movies
GROUP BY CAST(YEAR(release_date) AS SIGNED);

-- Find the highest-grossing movie released after 2015
SELECT CAST(collection_in_cr AS SIGNED) AS High, name FROM movies
WHERE CAST(YEAR(release_date) AS SIGNED) > 2015
ORDER BY collection_in_cr DESC
LIMIT 1;

-- Select movies where the integer part of rating is greater than 8
SELECT * FROM movies WHERE CAST(rating AS SIGNED) > 8;

-- Sum of collections for movies released between 2010 and 2020
SELECT SUM(CAST(collection_in_cr AS SIGNED)) AS total_collection FROM movies
WHERE CAST(YEAR(release_date) AS SIGNED) BETWEEN 2010 AND 2020;

-- ── FLOOR ──────────────────────────────────────────────────

-- Floor of a literal decimal number
SELECT FLOOR(5.9) FROM movies;

-- Floor of 9.99 (returns 9)
SELECT FLOOR(9.99);

-- Floor of each movie's rating
SELECT FLOOR(rating) FROM movies;

-- Show movie name alongside floored rating
SELECT name, FLOOR(rating) FROM movies;

-- Floor of the average rating across all movies
SELECT FLOOR(AVG(rating)) AS avg FROM movies;

-- Floor of each movie's profit (collection - budget)
SELECT FLOOR(collection_in_cr - budget_in_cr) AS profit FROM movies;

-- Average profit per genre (floored)
SELECT genre, FLOOR(AVG(collection_in_cr - budget_in_cr)) AS avg FROM movies
GROUP BY genre;

-- Select movies where the floored rating is greater than 8
SELECT * FROM movies WHERE FLOOR(rating) > 8;

-- Top 3 most profitable movies (by floored profit)
SELECT * FROM movies
ORDER BY FLOOR(collection_in_cr - budget_in_cr) DESC
LIMIT 3;

-- ── CEIL ───────────────────────────────────────────────────

-- Ceil of 2.1 (returns 3)
SELECT CEIL(2.1);

-- Ceil of 8.01 (returns 9)
SELECT CEIL(8.01);

-- Ceil of each movie's rating
SELECT CEIL(rating) FROM movies;

-- Show movie name alongside ceiled rating
SELECT name, CEIL(rating) FROM movies;

-- Ceil of the average collection across all movies
SELECT CEIL(AVG(collection_in_cr)) AS collection FROM movies;

-- Ceil of each movie's profit
SELECT CEIL(collection_in_cr - budget_in_cr) AS profits FROM movies;

-- Genres where ceiled average profit is greater than 100
SELECT genre, CEIL(AVG(collection_in_cr - budget_in_cr)) AS avg_profit FROM movies
GROUP BY genre
HAVING CEIL(AVG(collection_in_cr - budget_in_cr)) > 100;

-- Find the top-rated movie (by ceiled rating descending)
SELECT * FROM movies ORDER BY CEIL(rating) DESC LIMIT 1;

-- Select movies whose ceiled rating equals 10
SELECT * FROM movies WHERE CEIL(rating) = 10;

-- ── ROUND ──────────────────────────────────────────────────

-- Round 2.456 to 2 decimal places
SELECT ROUND(2.456, 2);

-- Round 8.987 to 1 decimal place
SELECT ROUND(8.987, 1);

-- Round each movie's rating to nearest integer
SELECT ROUND(rating) FROM movies;

-- Round each movie's profit to 2 decimal places
SELECT ROUND(collection_in_cr - budget_in_cr, 2) AS profit FROM movies;

-- Round the average rating to 1 decimal place
SELECT ROUND(AVG(rating), 1) FROM movies;

-- Round collection to nearest integer for each movie
SELECT ROUND(collection_in_cr) FROM movies;

-- Average profit per genre (rounded to nearest integer)
SELECT genre, ROUND(AVG(collection_in_cr - budget_in_cr)) FROM movies
GROUP BY genre;

-- Select movies where the rounded rating (0 decimal places) equals 9
SELECT * FROM movies WHERE ROUND(rating, 0) = 9;

-- Top 5 movies by rounded profit descending
SELECT * FROM movies
ORDER BY ROUND(collection_in_cr - budget_in_cr) DESC
LIMIT 5;

-- ── STRING FUNCTIONS: UPPER / LOWER ────────────────────────

-- Convert all movie names to UPPERCASE
SELECT UPPER(name) FROM movies;

-- Convert all genres to lowercase
SELECT LOWER(genre) FROM movies;

-- Convert all genres to UPPERCASE
SELECT UPPER(genre) FROM movies;

-- Search for 'avengers' in name (case-insensitive via LIKE)
SELECT * FROM movies WHERE name LIKE '%avengers%';

-- Convert all movie names to lowercase
SELECT LOWER(name) FROM movies;

-- Select all Action movies (using LIKE on genre)
SELECT * FROM movies WHERE genre LIKE '%action%';

-- Count how many movies have 'the' in their name (case-insensitive)
SELECT COUNT(*) FROM movies WHERE LOWER(name) LIKE '%the%';

-- Select movies whose lowercased name starts with 'a'
SELECT * FROM movies WHERE LOWER(name) LIKE 'a%';

-- Show unique genre values in UPPERCASE
SELECT DISTINCT(UPPER(genre)) AS genrees FROM movies;
