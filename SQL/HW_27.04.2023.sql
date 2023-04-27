
-- (1) ТОП-2 страны по сумме донатов
select
	users.country as country,
	sum(donations.amount) as total_donations
from donations
left join streams on donations.stream_id=streams.stream_id -- подтягиваем таблицу стримов к донатам
left join users on streams.user_id = users.user_id -- подтягиваем данные по автору стрима
group by users.country
order by total_donations desc
limit 2;

-- (2) Вывести рейтинг для каждого незавершенного стрима
select
	streams.title as streams_title,
	AVG(reactions.value) as rating,
    is_completed
from streams
left join reactions on reactions.stream_id=streams.stream_id
where is_completed = false
group by title;

-- (3) Вывести ТОП-1 донаторов (имя, сумма в долларах)
select
	users.fullname as Name,    
	sum(donations.amount) as total_amount
from donations
left join users on donations.donator_id=users.user_id
group by donator_id
order by total_amount desc
limit 1;

-- (4) Вывести страны стримеров, у которых рейтинг ниже 2
select
	users.country as country,
	AVG(reactions.value) as rating
from reactions
left join streams on reactions.stream_id=streams.stream_id
left join users on  reactions.user_id=users.user_id
group by country
having rating < 2;

-- (5) Вывести имена пользователей и сколько оценок за все время они поставили
select
fullname as User_name,
count(value) as count_value
from users
left join reactions on  reactions.user_id=users.user_id
group by fullname;
