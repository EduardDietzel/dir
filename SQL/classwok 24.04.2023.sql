-- Тема: Агрегация

use platform;

-- пара задач на повторение
SELECT
	AVG(value) AS rating,
	COUNT(*) AS total_reactions
FROM reactions
WHERE stream_id=1;

SELECT
	AVG(duration_secs) / 3600 AS avg_duration_hours
FROM streams
WHERE is_completed=true;

-- группировка. группируем юзеров по странам. выводим их количество.
select country,
	count(*) as count
from users
group by country;

-- расчет ретинга (сред.оценка) для каждого стрима
select
	stream_id,
	AVG(value) as rating
from reactions
group by stream_id;

-- таблица донатов. добавим еще некоторое количество донатов
select * from donations;
insert into donations (donator_id, stream_id, amount)
values
	(4, 1, 9.99),
    (5, 3, 12),
    (6, 2, 5.50),
    (7, 1, 20),
	(5, 3, 50);
    
-- вывести ТОР-1 донаторов по общей сумме донатов
select
	users.fullname as Name,
    users.country,
	sum(donations.amount) as total_amount
from donations
left join users on donations.donator_id=users.user_id
group by donator_id
-- группировка только по id
order by total_amount desc
limit 1;

-- или другой вариант без имени, только по id
select
	donator_id,
	sum(amount) as total_amount
from donations
group by donator_id
order by total_amount desc
limit 1;

insert into streams (user_id, title)
values
	(4, 'Sream from GB'),
	(5, 'Sream from Germany'),
	(6, 'Sream from Italy');
    
-- Вывести только три самых рейтинговых стрима (название стрима и его рейтинг)
select
streams.title,
AVG(value) as rating
from streams
join reactions on reactions.stream_id=streams.stream_id
group by reactions.stream_id
order by rating desc
limit 3;
-- разобраться с функцией group by - не совсем понятно, как она действует!!!

-- или по другому, через выборку из реакций
select
streams.title,
AVG(value) as rating
from reactions
join streams on reactions.stream_id=streams.stream_id
group by reactions.stream_id
order by rating desc
limit 3;

-- Фильтрация агрегированых данных ( HAVING )
-- Вывести стримы, у которых только две реакции
select
streams.title,
count(*) as total_reactions
from reactions
left join streams on reactions.stream_id=streams.stream_id
group by reactions.stream_id
having total_reactions = 2;

-- Вывести ТОР-1 юзеров по сумме собранных донатов (кто больше получил)
select
	users.fullname as stream_author,
	sum(donations.amount) as total_donations
from donations
left join streams on donations.stream_id=streams.stream_id -- подтягиваем таблицу стримов к донатам
left join users on streams.user_id = users.user_id -- подтягиваем данные по автору стрима
group by users.user_id
order by total_donations desc
limit 1;
-- группировка по тому полю, которое звучит в задаче

-- Вывести только стримы с рейтингом от 3 (поля: рейтинг и название_стрима)
select
	streams.title as streams_title, -- название стрима
	AVG(reactions.value) as rating -- рейтинг стрима
from reactions
left join streams on reactions.stream_id=streams.stream_id -- получем данные о стримах
group by reactions.stream_id -- группировка по стриму
having rating >= 3;
-- (having используем для выборки из уже агрегированных данных. В отличие от where);

-- Вывести страну, откуда юзеры чаще всего ставят оценку 5
-- неверный вариант - мой!
-- select distinct
-- users.country,
-- reactions.value
-- from users
-- left join reactions on reactions.user_id = users.user_id
-- having reactions.value = 5;

select
users.country
from reactions
left join users on reactions.user_id = users.user_id
where value = 5
group by users.country
order by count(*) desc
limit 1;