CREATE TABLE emps AS
SELECT
	e.*,
	s.salary,
	d.dept_name AS department,
	d.dept_no
FROM employees.employees e
JOIN employees.salaries s USING (emp_no)
JOIN employees.dept_emp de USING (emp_no)
JOIN employees.departments d USING (dept_no);

SELECT * FROM emps LIMIT 50;

ALTER TABLE emps ADD mean_salary FLOAT;
ALTER TABLE emps ADD sd_salary FLOAT;
ALTER TABLE emps ADD z_salary FLOAT;

/* ALTER TABLE emps
ADD mean_salary FLOAT,
	sd_salary FLOAT,
	z_salary FLOAT; */

CREATE TEMPORARY TABLE salary_aggregates AS
SELECT
	AVG(salary) AS mean,
	STDDEV(salary) AS sd
FROM emps;

SELECT * FROM salary_aggregates;

UPDATE emps SET mean_salary = (SELECT mean FROM salary_aggregates);
UPDATE emps SET sd_salary = (SELECT sd FROM salary_aggregates);
UPDATE emps SET z_salary = (salary - mean_salary) / sd_salary;

SELECT
	department,
	AVG(z_salary) AS z_salary
FROM emps
GROUP BY department
ORDER BY z_salary;

# why would we want to calculate a z-score for every individual and then aggregate, as opposed to just calculating the z-score from department averages? I.e.

SELECT AVG(salary), STDDEV(salary)
FROM employees.salaries;

SELECT
	d.dept_name,
	AVG(s.salary) AS avg_salary,
	(AVG(s.salary) - 63810.7448) / 16904.82828800014 AS z_salary
FROM employees.departments d
JOIN employees.dept_emp de USING (dept_no)
JOIN employees.salaries s USING (emp_no)
GROUP BY d.dept_name;


# See also past cohort solutions:
# https://github.com/CodeupClassroom/ada-database-exercises/blob/master/temp_tables_exercise.sql
# https://github.com/CodeupClassroom/bayes-database-exercises/blob/master/salary_zscore_by_department.sql

# One big query
SELECT a.dept_name, AVG(a.z_salary) AS avg_z_salary
FROM (
	SELECT
        d.dept_name,
        s.emp_no,
        s.salary,
        (
            (
                s.salary - (SELECT AVG(salary) FROM employees.salaries WHERE to_date > NOW())
            ) / (
                SELECT STDDEV(salary)  FROM employees.salaries WHERE to_date > NOW()
            )
        ) AS z_salary
	FROM employees.salaries s
	JOIN employees.dept_emp de ON s.emp_no = de.emp_no
	JOIN employees.departments d ON de.dept_no = d.dept_no
	WHERE s.to_date > NOW()
) a
GROUP BY a.dept_name;

SELECT 1
FROM (SELECT 1);



