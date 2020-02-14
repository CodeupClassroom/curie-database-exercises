-- Case Statements
-- IF()

-- IF(source_column_name [=,>,<,...] conditional_statement, value_to_assign, other_value_to_assign)

-- if you want it to return a true or false (1, 0) boolean value, do this: 

SELECT dept_name, dept_name='research'
FROM departments;

SELECT dept_name, IF(dept_name = 'research', true, false) 
FROM departments;


-- if you want it to return one of 2 values based on single condition, use IF()
SELECT dept_name, IF(dept_name = 'research', 'true', 'false') 
FROM departments;

-- if you need multiple "if elif elif .... " please use CASE statements

-- Case Statements
-- OPTION 1: CASE col WHEN...
SELECT col1, 
		CASE source_column_name 
			WHEN conditional_statement
			THEN value_to_assign
			ELSE other_value_to_assign
		END AS new_column_name
FROM table1
; 

SELECT dept_name,
			CASE dept_name
				WHEN 'Research' THEN 'Development'
				WHEN 'Marketing' THEN 'Sales'
				ELSE dept_name
			END AS dept_group
FROM departments;

-- OPTION2: CASE WHEN col
-- allows for differnet columns to be compared and for different comparison operators. 

SELECT count(distinct(CASE 
				WHEN dept_name IN ('research', 'development') THEN 'R&D'
				WHEN dept_name IN ('sales', 'marketing') THEN 'sales&marketing'
				WHEN dept_name IN ('production', 'quality management') THEN 'prod&QM'
				ELSE dept_name
			END))
			 AS dept_group
FROM departments; 

-- >, <, >=, <=, !=, BETWEEN, LIKE

SELECT sum(CASE 
					WHEN gender = 'F' THEN 1 
					ELSE 0 
				END) AS is_female
FROM employees; 

SELECT SUM(CASE 
					WHEN birth_date < "1964" THEN 0
					WHEN gender = 'F' THEN 1
					ELSE 0
				END)
				AS GENX_females
FROM employees
; 