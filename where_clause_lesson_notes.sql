USE numbers;

SELECT * FROM numbers_with_more_groups;

SELECT n, category FROM numbers_with_more_groups
WHERE n < 5;

SELECT n, category, n < 5
FROM numbers_with_more_groups;

SELECT
	n,
	category,
	category = 'a' AS category_is_a,
	n % 2 = 0 AS evenly_divisible_by_two,
	category = 'a' AND n % 2 = 0,
	category = 'a' OR n % 2 = 0	
FROM numbers_with_more_groups;

SELECT n, category
FROM numbers_with_more_groups
WHERE n % 2 = 0;

SELECT n, supergroup, supergroup LIKE '%e%'
FROM numbers_with_more_groups
WHERE supergroup LIKE '%e%';

# an e anywhere in the string, but not at the start of the string
SELECT n, supergroup, supergroup LIKE '%e%' AND supergroup NOT LIKE 'e%'
FROM numbers_with_more_groups;

SELECT NOT 1 = 1;

SELECT
	*,
	category = 'a' OR category = 'b',
	category IN ('a', 'b')
FROM numbers_with_more_groups;

SELECT
	*
FROM numbers_with_more_groups
WHERE n IN (1, 3, 6, 8, 16000);

SELECT
	n,
	# 3 < n < 9, Error!
	3 < n AND n < 9,
	n BETWEEN 3 AND 9,
	3 <= n AND n <= 9
FROM numbers_with_more_groups
WHERE n BETWEEN 3 AND 9;




