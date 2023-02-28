use hr;

SELECT
	salary,
CASE
	WHEN salary < 10000
		THEN 1
	WHEN salary between 10000 and 20000
		THEN 2
	WHEN salary > 20000
		THEN 3
	ELSE 4
    END as salary_group
FROM employees;


SELECT
	commission_pct,
	COALESCE (commission_pct, 0)
FROM employees;


SELECT * FROM employees
order by commission_pct, salary;
-- (сортировка по комиссии и по з/п)
-- (ASC or DESC) - сортировка по возрастанию и убыванию соответ.
-- order by commission_pct DESC, salary DESC; (как пример сортировки)

-- Пример
-- выберем все з/п, которые не повторяются (то есть только значения разных зарплат, отсутсвие дублей, только уникальные значения) оператор: distinct
SELECT
	distinct salary
FROM employees;

SELECT
	distinct commission_pct
FROM employees;

SELECT
	distinct commission_pct, salary
FROM employees;

SELECT
	distinct salary
FROM employees
order by salary ASC;
-- (уникальные значени по з/п с сортировкой по возрастанию)

-- (Правильный синтаксис записи запроса)
SELECT DISTINCT
	salary,
    first_name,
    last_name
FROM employees
WHERE
	commission_pct
ORDER BY
	salary;