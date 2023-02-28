-- 1. Задать БД hr в качестве текущей

use hr;

-- 2. Вывести сотрудников (имя, фамилия, з/п) из департаментов 100, 120 и 30, зарабатывающих больше 10000

SELECT last_name, first_name, salary
FROM employees 
WHERE 
	department_id in (30, 100, 120)
and
	salary > 10000;
    
-- 3.  Вывести сотрудников (имя фамилия), чье имя начинается на букву К

SELECT last_name, first_name
FROM employees 
WHERE
first_name like 'K%';

-- 4. Вывести сотрудников (имя фамилия), чье имя не содержит букву О

SELECT last_name, first_name
FROM employees 
WHERE
first_name not like '%O%';

-- 5. Вывести сотрудников (имя, фамилия, з/п), чья фамилия содержит букву о на втором месте и з/п меньше 20000

SELECT first_name, last_name, salary
FROM employees 
WHERE
last_name like '_O%'
and
salary < 20000;

-- 6. Вывести сотрудников (имя, фамилия, № департамента, айди работы), чье имя начинается на букву К или заканчивается на букву а, в которые job_id FI_ACCOUNT, PU_CLERK, ST_CLERK

SELECT first_name, last_name, department_id, job_id
FROM employees 
WHERE
(first_name like 'k%' or first_name like '%a')
and
job_id in ('FI_ACCOUNT', 'PU_CLERK', 'ST_CLERK');

-- 7. Вывести сотрудников (имя, фамилия, з/п),  и отсортировать их по з/п от большего к меньшему

SELECT 
    first_name, last_name, salary
FROM
    employees
ORDER BY salary DESC;

-- 8. Вывести сотрудников (имя, фамилия, зарплата) и отсортировать их по зарплате от меньшего к большему.
-- В случае, если зп одинаковая, отсортировать в алфавитном порядке по фамилии

SELECT 
    first_name, last_name, salary
FROM
    employees
ORDER BY salary, last_name;

-- 9. ывести сотрудников (имя, фамилия, зарплата), зарабатывающитх от 10000 до 20000 включительно, работаюзщих в департаментах 60 70, 90, 100
-- чье имя содержит букву а и отсортировать всех по з/п от большего к меньшему, если з/п одинакова то по фамилии.

select
	first_name,
    last_name,
    salary
from employees
where
salary between 10000 and 20000
and
department_id in (60, 70, 90, 100)
and
first_name like '%a%'
order by salary desc, last_name;
