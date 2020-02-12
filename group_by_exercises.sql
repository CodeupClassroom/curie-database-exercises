USE employees;

-- use DISTINCT to find the unique titles in the titles table.
SELECT DISTINCT title 
FROM titles;

SELECT title
FROM titles
GROUP BY title;


-- query for employees whose last names start and end with 'E'. 
-- Update the query find just the unique last names 
SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;





















-- Update that query to find unique combinations 
-- of first and last name 
-- where the last name starts and ends with 'E'. 
-- You should get 846 rows.

SELECT CONCAT(first_name, " ", last_name) as "full_name"
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY full_name;



















-- Find the unique last names with a 'q' but not 'qu'
SELECT last_name
FROM employees
WHERE last_name like '%q%' AND NOT LIKE '%qu%'
GROUP BY last_name;

















-- Add a COUNT() to your results and 
-- use ORDER BY to make it easier to find employees 
-- whose unusual name is shared with others.


SELECT last_name, count(*)
FROM employees
WHERE last_name like '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;


















-- Update your query for 'Irena', 'Vidya', or 'Maya'. 
-- Use COUNT(*) and GROUP BY to find the number of employees 
-- for each gender with those names. Your results should be:
-- 441 M
-- 268 F

SELECT gender, count(*)
FROM employees
WHERE first_name IN ("Irena", "Vidya", "Maya")
GROUP BY gender;














-- Recall the query from the last lesson 
-- for generated usernames. 
-- Are there any duplicate usernames?

SELECT
    CONCAT(
        LOWER(LEFT(first_name, 1)),
        LOWER(LEFT(last_name, 4)),
        '_',
        LPAD(MONTH(birth_date), 2, '0'), # month
        RIGHT(YEAR(birth_date), 2) # two digit year
    ) as username
FROM employees
GROUP BY username;


-- Bonus: how many duplicate usernames are there?