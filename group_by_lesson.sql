SELECT
	MIN(n),
	MAX(n),
	AVG(n),
	COUNT(n)
FROM numbers_with_groups;

SELECT
	category,
	COUNT(category),
	MIN(n)
FROM numbers_with_groups
GROUP BY category;

SELECT category FROM numbers_with_groups GROUP BY category;

SELECT * FROM numbers_with_groups;

SELECT
	supergroup,
	COUNT(supergroup),
	MAX(n),
	n
FROM numbers_with_more_groups
GROUP BY supergroup;

SELECT
	n,
	AVG(n),
	COUNT(n)
FROM numbers_with_more_groups
GROUP BY n;

SELECT
	category,
	supergroup,
	COUNT(*)
FROM numbers_with_more_groups
GROUP BY category, supergroup;

USE employees;

# How many people were born in each month
SELECT
	MONTH(birth_date),
	COUNT(*),
	MAX(hire_date),
	MIN(emp_no)
FROM employees
GROUP BY MONTH(birth_date);








