use hr;

SELECT 
	country_name as name, 
    region_id 
FROM countries
where country_name = 'Egypt';

SELECT 
	*
FROM countries
where region_id = 4;

select
	*
from employees
where department_id in (80, 110);

select
	*
from employees
where first_name like '_h%';

select
	*
from employees
where not (
salary >= 20000
and salary <= 10000);

select
*
from employees
where
(salary = 6000) and
(salary > 500) and
(salary < 12000) and
((salary = 6000) or (salary = 6500));

select
*
from employees
where
(salary = 6000) and
(TRUE) and
(TRUE) and
(TRUE or FALSE);
-- (TRUE)

-- TRUE and TRUE  = TRUE
-- TRUE and FALSE = FALSE
-- FALSE and FALSE = FALSE
-- FALSE and TRUE = FALSE

-- TRUE or TRUE = TRUE
-- TRUE or FALSE = TRUE
-- FALSE or TRUE = FALSE
-- FALSE or FALSE = FALSE

-- X and TRUE = X
-- X and FALSE = FALSE
-- TRUE and X = X
-- FALSE and X = FALSE

-- X or TRUE = TRUE
-- X or FALSE = X
-- TRUE or X = TRUE
-- FALSE or X = X

select
*
from employees
where
X3 = TRUE
and X4 = TRUE
and NOT X1 = TRUE
and NOT X2 = TRUE
-- под X может быть что угодно: salary, job...
-- например:
-- X3 - salary > 6000
-- X4 in ('s1', 's2')

select
*
from employees
where email like '%@gmail.com';

select
*
from employees
where email like '_@%' and
email like '__@%' and
email like '___@%' and
email like '____@%';

select
*
from employees
where 
(email like '_____%@%' and email not like '%@gmail.com')
or
(email like '_%@gmail.com' or
email like '__@gmail.com' or
email like '___@gmail.com' or
email like '____@gmail.com')

