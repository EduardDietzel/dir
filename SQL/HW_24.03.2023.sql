use platform;

-- Вывести пользователей, у которых не укан email-адрес
select * from users
where email is null;

-- Вывести незаблокированных пользователей из Китая
select * from users
where country = 'China' and
is_blocked = false;

-- Вывести стримы, авторы которых заблокированы
select *
from streams
join users on streams.user_id=users.user_id
where is_blocked = true;

-- Вывести три последних реакции (включая имя_пользователя)
select *
from reactions
join users on reactions.user_id=users.user_id
join streams on reactions.stream_id=streams.stream_id
limit 3;

-- Вывести пожертвования заблокированных пользователей
select * from donations
join users on donations.donator_id=users.user_id
where is_blocked = true;