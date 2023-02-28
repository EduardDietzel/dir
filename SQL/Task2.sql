-- Выбрать базу

use hr;

-- Выбрать все поля из таблицы countries
select * from countries;

-- Выбрать поля country_id и country_name из таблицы countries

select
	country_id,
    country_name
from countries;

-- Вывести имя и фамилию и зп тех, кто получает 10000 и болеею Отсортировать выборку по зп по возрастанию. 
-- В случае, если зп одинаковая, отсортировать в алфавитном порядке. desc - сортировка от большего к меньшему.

select
	first_name,
    last_name,
    salary
from employees
where salary >= 10000
order by salary desc, first_name;

-- Вывести имя и фамилию и зп тех, кто получает от 5000 до 10000 включительно. (between - включает граничные данные. not between - не включает границы поиска)

select
	first_name,
    last_name,
    salary
from employees
where salary not between 5000 and 10000;

-- Вывести имя и фамилию тех, чье имя есть в списке Steven, Diana, John, Den (или исключив их)

select
	first_name,
    last_name    
from employees
where first_name not in ('Steven', 'Diana', 'John', 'Den');

-- Вывести имя и фамилию тех, чье имя начинается на букву D. Отсортировать по имени в алфавитном порядке.
select
	first_name,
    last_name    
from employees
where first_name like 'd%'
order by first_name;

-- Вывести имя и фамилию тех, у кого вторая буква в фамилии O
-- (любой один символ в поиске обозначается _ , несколько любых символов %) 
select
	first_name,
    last_name    
from employees
where last_name like '_o%';


-- Вывести имя и фамилию и зп тех, кто работает в департаменте 60 и получает больше 5000. Отсортировать выборку по зп по возрастанию.

select
	first_name,
    last_name    
from employees
where department_id = 100 and salary >= 5000;

select *
from employees
where salary >= 5000
limit 10;
