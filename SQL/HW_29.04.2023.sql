
-- Вывести количественное распределение оценок (реакций) по стриму №1.
select * 
from streams

-- where stream_id = 1
;

-- Вывести список стран, откуда идут пожертвования.
select
users.country 
from donations
left join users on users.user_id = donations.donator_id
group by country;

-- Вывести сумму и ко-во всех полученных пожертвований стримером №1.
select
sum(donations.amount) as total_donations,
count(donations.amount) as count_total_donations
from streams
left join donations on streams.stream_id = donations.stream_id
left join users on streams.user_id = users.user_id
where streams.user_id = 1;
