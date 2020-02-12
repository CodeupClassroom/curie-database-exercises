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

SELECT *
FROM departments d
JOIN dept_manager dm ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no
WHERE dm.to_date > NOW();





