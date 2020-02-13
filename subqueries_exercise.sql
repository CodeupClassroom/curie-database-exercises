SELECT 'curie';

SELECT *
FROM employees
WHERE hire_date = (
	SELECT hire_date
	FROM employees
	WHERE emp_no = 101010
);

SELECT emp_no
FROM employees
WHERE first_name = 'Aamod';

SELECT DISTINCT title
FROM titles
WHERE emp_no IN (
	SELECT emp_no
	FROM employees
	WHERE first_name = 'Aamod'
);

-- how many people currently work at the company
SELECT COUNT(*)
FROM salaries
WHERE to_date > NOW();

-- how many records are in the employees table
SELECT count(*)
FROM employees;

SELECT (
	SELECT COUNT(*)
	FROM employees
) - (
	SELECT COUNT(*)
	FROM salaries
	WHERE to_date > NOW()
);

SELECT DISTINCT emp_no
FROM salaries
WHERE to_date < NOW();

SELECT *
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM salaries
	GROUP BY emp_no
	HAVING MAX(to_date) < NOW()
);

SELECT *
FROM employees
WHERE emp_no NOT IN (
	SELECT emp_no
	FROM salaries
	WHERE to_date > NOW()
);

SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_manager
	WHERE to_date > NOW()
) AND gender = 'F';

SELECT
	COALESCE(d.dept_name, 'Overall Average') AS department,
	AVG(s.salary) AS salary
FROM departments d
JOIN dept_emp de USING (dept_no)
JOIN salaries s USING (emp_no)
GROUP BY d.dept_name WITH ROLLUP;







-- Find all the employees that currently have a higher than average salary.
-- 154543 rows in total. Here is what the first 5 rows will look like:
-- +------------+-----------+--------+
-- | first_name | last_name | salary |
-- +------------+-----------+--------+
-- | Georgi     | Facello   | 88958  |
-- | Bezalel    | Simmel    | 72527  |
-- | Chirstian  | Koblick   | 74057  |
-- | Kyoichi    | Maliniak  | 94692  |
-- | Tzvetan    | Zielinski | 88070  |
-- +------------+-----------+--------+

-- employees table to get names
-- salary table to get the salary info
SELECT first_name, last_name, salary
FROM employees
JOIN salaries using(emp_no)
WHERE salary > (
	SELECT AVG(salary)
	FROM salaries
)
AND
to_date > CURDATE();


	


-- How many current salaries are within 1 standard deviation of the highest salary? 
-- (Hint: you can use a built in function to calculate the standard deviation.) 
-- What percentage of all salaries is this?
-- 78 salaries

SELECT 
(SELECT count(*)
FROM salaries
WHERE salary >= (
	(SELECT max(salary)
	FROM salaries) - (SELECT STDDEV(salary) FROM salaries))
AND to_date > curdate())
/ (SELECT count(*) from salaries where to_date > curdate());




