USE join_example_db;

SELECT * FROM users;

SELECT * FROM roles;

SELECT *
FROM users u
-- JOIN roles r ON u.role_id = r.id;
RIGHT JOIN roles r ON r.id = u.role_id;

SELECT * 
FROM roles r
LEFT JOIN users u ON u.role_id = r.id;

SELECT
	r.name AS role_name,
	COUNT(*) AS count_all,
	COUNT(u.id) AS count_users
FROM roles r
LEFT JOIN users u ON u.role_id = r.id
GROUP BY r.name;






USE employees;
 -- show each department along with the name of the current manager 
 -- for that department.

SELECT dept_name, concat(first_name, " ", last_name) as "Current Manager"
FROM departments d
JOIN dept_manager dm ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no
WHERE dm.to_date > NOW();



-- Find the name of all departments currently managed by women.
-- employees table to get names and gender
-- deptment_managers table to get manager
-- department name
SELECT dept_name as `Department Name`,
    concat(first_name, " ", last_name) as `Manager Name`
FROM employees
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date > CURDATE()
    AND gender = "F"
ORDER BY `Department Name`;







-- Find the current titles of employees 
-- currently working in the Customer Service department.
-- Titles table to get titles
-- departments table to get department names
SELECT title as "Title",
    count(*) as "Count"
FROM departments
JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
JOIN titles ON titles.emp_no = dept_emp.emp_no
WHERE titles.to_date > CURDATE()
    AND dept_emp.to_date > CURDATE()
    AND dept_name = "Customer Service"
GROUP BY title;




-- Find the current salary of all current managers.
-- Department Name    | Name              | Salary
-- -------------------+-------------------+-------
-- Customer Service   | Yuchang Weedman   |  58745
-- Development        | Leon DasSarma     |  74510

-- departments table to get departments
-- employees table to get employee names
-- salaries table to get salaries
-- dept_manager table to link manager emp_no to their dept_no

SELECT dept_name as `Department Name`, 
    CONCAT(first_name, " ", last_name) as `Manager Name`,
    salary as `Salary`
FROM salaries
JOIN dept_manager ON dept_manager.emp_no = salaries.emp_no
JOIN employees on employees.emp_no = dept_manager.emp_no
JOIN departments on departments.dept_no = dept_manager.dept_no
WHERE salaries.to_date > CURDATE()
AND dept_manager.to_date > CURDATE()
ORDER BY `Department Name`;


-- Find the number of employees in each department.
-- +---------+--------------------+---------------+
-- | dept_no | dept_name          | num_employees |
-- +---------+--------------------+---------------+
-- | d001    | Marketing          | 14842         |
-- | d002    | Finance            | 12437         |

-- departments table to get dept name
-- dept_emp to get employees that work in each dept
SELECT dept_no, dept_name, count(*) as `num_employees`
FROM departments
JOIN dept_emp USING(dept_no)
WHERE to_date > CURDATE()
GROUP BY dept_no;


-- Which department has the highest average salary?
-- +-----------+----------------+
-- | dept_name | average_salary |
-- +-----------+----------------+
-- | Sales     | 88852.9695     |
-- +-----------+----------------+
-- salaries table for salaries
-- departments table to get dept_name
-- dept_emp table to get all employees that work for each dept
SELECT dept_name, AVG(salary) as `Highest Average Salary`
FROM salaries
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE dept_emp.to_date > now()
AND salaries.to_date > now()
GROUP BY dept_name
ORDER BY `Highest Average Salary` DESC
LIMIT 1;




-- Who is the highest paid employee in the Marketing department?
SELECT first_name, last_name, salary
FROM employees
JOIN dept_emp on dept_emp.emp_no = employees.emp_no
JOIN salaries on salaries.emp_no = dept_emp.emp_no
JOIN departments on departments.dept_no = dept_emp.dept_no
WHERE salaries.to_date > CURDATE()
AND dept_emp.to_date > CURDATE()
AND dept_name = "Marketing"
ORDER BY salary DESC
LIMIT 1;







-- Which current department manager has the highest salary?
SELECT first_name, last_name, salary, dept_name
FROM dept_manager
JOIN employees USING(emp_no)
JOIN salaries USING(emp_no)
JOIN departments using(dept_no)
WHERE salaries.to_date > CURDATE()
AND dept_manager.to_date > CURDATE()
ORDER BY salary DESC
LIMIT 1;

