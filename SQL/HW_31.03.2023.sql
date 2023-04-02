use platform;
-- (1) Вывести все пожертвования от 10 EUR, с указанием имени автора пожертвования и суммы
select 
	users.fullname as author_fullname,
    donations.amount as amount_eur	
from donations
join users on donations.donator_id = users.user_id
where amount >= 10;

-- (2) Вывести стримера, которому было сделано самое минимальное пожертвование (имя_стримера, сумма)
select
	users.fullname as stream_author,
	donations.amount as amount_eur
from donations
join users on donations.donator_id = users.user_id
join streams on donations.stream_id=streams.stream_id
order by donations.amount
limit 1;

-- (3) Вывести последнее пожертвование (название_стрима, сумма)
select 
	streams.title as streams_title,
    donations.amount as amount_eur	
from donations
join streams on donations.stream_id=streams.stream_id
limit 1;