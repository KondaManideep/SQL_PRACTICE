# SQL Practice — Topic-wise Query Collection

A structured collection of SQL queries organized by topic, written while learning MySQL from scratch.
Each file focuses on one concept group, with every query commented as a question so it's easy to revisit.

---

## File Structure

| File | Topic |
|------|-------|
| `01_ddl_crud_basics.sql` | CREATE, INSERT, SELECT, UPDATE, DELETE, ALTER, DROP, LIKE |
| `02_where_and_or_not_like.sql` | WHERE clause — AND, OR, NOT, LIKE, nested conditions |
| `03_between_in_orderby_distinct.sql` | BETWEEN, IN, NOT IN, ORDER BY, DISTINCT |
| `04_limit_offset_aggregates.sql` | LIMIT, OFFSET, COUNT, SUM, AVG, MAX, MIN |
| `05_groupby_having.sql` | GROUP BY, HAVING with aggregate filters |
| `06_arithmetic_date_math_string_functions.sql` | Arithmetic, YEAR/MONTH/DAY, CAST, FLOOR, CEIL, ROUND, UPPER, LOWER |

---

## Tables Used

| Table | Columns | Used In |
|-------|---------|---------|
| `players` | name, age, score | 01 |
| `products` | name, category, price | 01 |
| `employee` | num, dept, age | 01 |
| `employee1` | id, name, dept, age, salary | 02 |
| `student` | id, name, course, age, marks | 03 |
| `student_page` | id, name, course, age, marks | 04, 05 |
| `movie` | id, name, budget, collection, rating, genre | 05, 06 |
| `movies` | id, name, genre, rating, release_date, budget_in_cr, collection_in_cr | 06 |

---

## Topics Covered

- **DDL** — `CREATE TABLE`, `ALTER TABLE`, `DROP TABLE`
- **DML** — `INSERT`, `UPDATE`, `DELETE`
- **DQL** — `SELECT` with filters, sorting, grouping
- **Clauses** — `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`, `LIMIT`, `OFFSET`
- **Operators** — `AND`, `OR`, `NOT`, `LIKE`, `BETWEEN`, `IN`, `DISTINCT`
- **Aggregate Functions** — `COUNT`, `SUM`, `AVG`, `MAX`, `MIN`
- **Math Functions** — `FLOOR`, `CEIL`, `ROUND`
- **Date Functions** — `YEAR`, `MONTH`, `DAY`
- **String Functions** — `UPPER`, `LOWER`
- **Type Conversion** — `CAST`

---

## How to Run

1. Open MySQL Workbench or any MySQL client
2. Create the database: `CREATE DATABASE practice;`
3. Run the files in order (01 → 06) — each file starts with `USE practice;`

---

## What's Next

- [ ] JOINs — INNER, LEFT, RIGHT, FULL OUTER
- [ ] Subqueries
- [ ] Window Functions — ROW_NUMBER, RANK, DENSE_RANK
- [ ] Indexes & Constraints
- [ ] Stored Procedures & Views
