-- get the names and birthdates
-- for employees with Feb 12th as their birthdate
SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_emp
)
AND
birth_date like '%-02-12'




-- Get the titles and counts for folks
-- w/ same title and salary between 67 and 70k
SELECT title, count(*)
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM salaries
    WHERE salary BETWEEN 67000 AND 70000
    AND to_date > now()
)
AND to_date > now()
GROUP BY title




-- BONUS:
-- What's the average salary of those roles?
-- For Folks who make 67-70k