-- Exercise 1
-- List the first 10 distinct last name sorted in descending order. 
-- Zykh
-- Zyda
-- Zwicker
-- Zweizig
-- Zumaque
-- Zultner
-- Zucker
-- Zuberek
-- Zschoche
-- Zongker

SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;

-- Grouping by the same column you're selecting is like SELECT DISTINCT column then ordering by that column 
SELECT last_name
FROM employees
GROUP BY last_name DESC
LIMIT 10;


-- Find your query for employees born on Christmas and hired in the 90s 
-- from order_by_exercises.sql. 
-- Update it to find just the first 5 employees. 
SELECT *
FROM employees
WHERE hire_date like '199%'
AND birth_date like '%-12-25'
ORDER BY birth_date ASC, hire_date DESC
LIMIT 5;

-- SELECT *
-- FROM employees
-- WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'


-- Think of your results as batches, sets, or pages. 
-- The first five results are your first page. 
-- The five after that would be your second page, etc. 
-- Update the query to find the tenth page of results. 
-- The employee names should be:
-- Piyawadee Bultermann
-- Heng Luft
-- Yuqun Kandlur
-- Basil Senzako
-- Mabo Zobel
SELECT *
FROM employees
WHERE hire_date like '199%'
AND birth_date like '%-12-25'
ORDER BY birth_date ASC, hire_date DESC
LIMIT 5 OFFSET (10 - 1)*5;

-- page |  limit  |  offset
-- 1         5         0
-- 2         5         5
-- 3         5         10
-- 4         5         15
-- 5         5         20
-- 6         5         25
-- 7         5         30
-- 8         5         35
-- 9         5         40
-- 10        5         45

-- offset = (page - 1) * limit