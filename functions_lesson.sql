SELECT
	first_name,
	SUBSTR(first_name, 3, 3),
	SUBSTR(first_name, 3, 1)
FROM employees
LIMIT 10;

SELECT
	first_name,
	LEFT(first_name, 3),
	RIGHT(first_name, 3),
	LEFT(RIGHT(first_name, 3), 2),
    LEFT(RIGHT(CONCAT(first_name, ' ', last_name), 3), 4)
FROM employees
LIMIT 10;


SELECT
	first_name,
	LEFT(first_name, 100)
FROM employees
LIMIT 10;

SELECT
	*,
	REPLACE(dept_no, 'd00', 'Dept No.')
FROM departments;

# We're in UTC on the server
SELECT
	NOW(),
	CURDATE(),
	CURTIME();
	
# how many days old is each employee?
SELECT
	birth_date,
	DATEDIFF(NOW(), birth_date) / 365.25 AS years_old
FROM employees
LIMIT 50;

SELECT
	MIN(emp_no),
	MAX(emp_no),
	AVG(emp_no)
FROM employees
LIMIT 20;

SELECT
	NOW() - birth_date
FROM employees;

# average employee age
SELECT
	AVG(DATEDIFF(NOW(), birth_date) / 365.25) AS average_age
FROM employees;
