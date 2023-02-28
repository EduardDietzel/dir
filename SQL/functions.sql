use hr;

select
	salary as money,
	salary + 1 as money1,
    salary - 1 as money2,
    salary * 2 as money3,
    salary / 2 as money4,
    salary % 13 as money5,
    round(sqrt(salary)) as new_salary
from employees;

-- select 'jhgjfhg' as value1;
-- select functionName() as value1;
select abs(1) as value1;
-- (это абсолютное значение числа без знака)

select pow(2, 3) as value1;
-- (это функция возведения в степень)

select round(2.5) as value1;
-- (это функция округления)

select sqrt(4) as value;
-- (квадратный корень)

-- (В функцию можно передавать не только константу но и столбик)

-- 2-й ----набор основных функций----

select 'привет друг' as string1;

select concat('привет друг', ' ', 'как дела') as string1;
-- (функция для объединения строк)

select concat_ws(' ', 'привет', 'друг', 'как', 'дела') as string1;
-- (объединяем строки - различые слова - с заданным заранее разделителем "пробел" with separate)

select insert('привет мой друг', 8, 3, 'дорогой') as string1;
-- (замена элементов. Дополнительно - разобраться с этой функций)

select length('друг') as string1;
select length('friend') as string1;
-- (показывает длину строки (в символах), кирилицу умножает на 2 в количестве знаков)

select trim('      привет мой друг     ') as string1;

select locate('мой', 'привет мой друг') as string1;
-- (только для функции поиска (локейт) мы указываетм сначала что?, а потом где?)

select left('hi my friend', 3) as result;

select substring('hi my friend', 4, 2) as result;
-- (откуда, номер позиции, длина (количество символов) нового элемента - подстроки)

select replace('hi my friend', 'my', 'diar') as result;
-- (поменять в данной строку, что заменяем, на что заменяем)

select upper('Hi my dear FRIEND') as result;
-- (запись  всейстроки в верхнем регистре)



-- ------------------------------------------------

-- (имя, фамилия работников в нижнем регистре)

select
	lower(concat_ws(' ', first_name, last_name)) as full_name
from employees;

-- (вывести строку, где сначала название страны в верхнем регистре и код страны в нижнем: ITALY (it))

select
concat(upper(country_name), ' ', '(', lower(country_id), ')') as result
from countries;

-- Вывести: Страна (id), Город, Улица as full_address

select
concat(country_id, ', ', city, ', ', street_address) as full_address
from locations;

--  вывести длину полного адреса

select
length(concat(country_id, ', ', city, ', ', street_address)) as string1
from locations;


select * from jobs;

-- среднее арифметическое минимальной и максимальной з/п

select
	round((min_salary + max_salary)/2) as result
from jobs;

-- среднее квадратическое мин и макс з/п ( корень квадратный из a*b )

select
	sqrt(min_salary * max_salary) as result
from jobs;

-- вычислить коэффициент между мин и макс з/п (различие в процентном соотношении)

select
	(max_salary / min_salary) as result
from jobs;

select
	round((min_salary / max_salary) * 100) as result
from jobs;

-- на скольк % макс з/п больше относительно мин (мин = 100%)?

-- select
-- 	round(((max_salary / min_salary) / min_salary ) * 100) as result
-- from jobs;

select
	round(((max_salary - min_salary) - 1) * 100) as result
from jobs