use platform;
SET SQL_SAFE_UPDATES = 0;
select * from users;

-- (1) Заблокировать пользователей из USA и разблокировать пользователей из Германии
update users
set is_blocked = true
where country = 'USA';

update users
set is_blocked = false
where country = 'Germany';

UPDATE users
SET is_blocked=CASE
		WHEN country='USA' THEN true
		WHEN country='Germany' THEN false
	END
WHERE country in ('USA', 'Germany');

-- (2) Вывести заблокированных пользователей из США и незаблокированных пользователей из Германии
select *
from users
where country='USA' and is_blocked = true
or country='Germany' and is_blocked = false;

-- (3) Вывести список текущих стримов (поля: название_стрима и имя_автора) - который не закончен
select 
streams.title as stream_title,
users.fullname as stream_autor
from streams
join users on streams.user_id=users.user_id
where streams.is_completed = false;

-- (4) Добавить поле duration_secs (продолжительность стрима) в таблицу streams
alter table streams
add duration_secs int;

-- (5) Завершить стрим `1` - продолжительность `3600`
-- Завершить стрим `2` - продолжительность `7200` (одним запросом)

-- update streams
-- set is_completed = case
-- 	when stream_id = 1 and duration_secs = 3600 then true
--     when stream_id = 2 and duration_secs = 7100 then true
--     end;

update streams
set
	is_completed = true,
	duration_secs = case
		when stream_id = 1 then 3600
		when stream_id = 2 then 7200
	end
where stream_id in (1, 2);

select * from donations;

-- Агрегация в SQL
-- это получение вычисленных данных (итоги, аналитика, статистика)
-- Основные операторы (акумуляторы)
select count(*) as total_donations
from donations;

-- SUM(поле) расчет суммы значений по полю
SELECT
	SUM(amount) AS total_amount
FROM donations;

-- AVG(поле) расчет среднего значения по полю
SELECT
	AVG(amount) AS avg_amount
FROM donations;

-- `MIN(поле)` расчет минимального значения по полю
-- `MAX(поле)` расчет максимального значения по полю

-- Задачи: (1) Вывести
	-- долю платформы (EUR)
	-- долю всех пользователей (EUR)
SELECT
	SUM(amount)*0.1 AS platform_profit_eur,
	SUM(amount)*0.9 AS users_profit_eur
FROM donations;

-- (2) Вывести количество зевершенных стримов
select count(*) as completed_streams
from streams
where is_completed = true;

-- (3) Вывести среднюю продолжительность завершенных стримов в часах
select
AVG(duration_secs)/3600 AS avg_duration_hours
from streams
where is_completed = true;

-- (4) Вывести среднюю оценку (рейтинг) стрима № 1
select
AVG(value),
stream_id
from reactions
where stream_id = 1;

select * from reactions;

-- (5) Вывести имя_автора_реакций, равных 5
select DISTINCT users.fullname,
value
from reactions
left join users on reactions.user_id=users.user_id
where reactions.value = 5;

