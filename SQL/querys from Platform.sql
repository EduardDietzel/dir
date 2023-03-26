use platform;

select * from donations
order by amount desc
limit 3;

SELECT amount,
	amount AS amount_eur,
	amount * 1.05 AS amount_usd
FROM donations;

-- объединяем две и более таблиц с целью получения более полных данных
-- в данном случае объединили донаты с пользователями.
select *
from donations
join users on donations.donator_id=users.user_id;

-- вывести размеры пожертвований в дол и евро, а также имена пользователей
select
	users.fullname as donator_fullname,
    donations.amount as amount_eur,
    donations.amount * 1.05 AS amount_usd,
    streams.title as stream_title
from donations
join users on donations.donator_id=users.user_id
join streams on donations.stream_id=streams.stream_id;

-- вывести информацию о стримах (проекция: название_стрима, автор_стрима)
select
	streams.title as название_стрима,
    users.fullname as автор_стрима
from streams
join users on streams.user_id=users.user_id;

-- вывести донаты (проекция: имя_донатора, размер_доната, название_стрима)
select
	users.fullname as имя_донатора,
    donations.amount as размер_доната,
    streams.title as название_стрима
from donations
join users on donations.donator_id=users.user_id
join streams on donations.stream_id=streams.stream_id;

-- вывести реакции со значением 4 и 5 (проекция: кто_поставил_оценку, оценка, название_стрима)
select
	users.fullname as кто_поставил_оценку,
    value as оценка,
    streams.title as название_стрима
from reactions
join users on reactions.user_id=users.user_id
join streams on reactions.stream_id=streams.stream_id
where value in (4, 5)
order by value;

