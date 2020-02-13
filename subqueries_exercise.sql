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





