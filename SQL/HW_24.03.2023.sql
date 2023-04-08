use platform;

/*(1) Вывести пользователей, у которых не указан email-адрес,
причем поле имейла может быть пустым, либо не заданным */
select * from users
where email is null or email = '';

-- (2) Вывести незаблокированных пользователей из Китая
select * from users
where country = 'China' and
is_blocked = false;

-- (3) Вывести стримы, авторы которых заблокированы
select *
from streams
join users on streams.user_id=users.user_id
where is_blocked = true;

-- (4) Вывести три последних реакции (включая имя_пользователя)
select
reactions.value, users.fullname, reactions.created_at
from reactions
join users on reactions.user_id=users.user_id
join streams on reactions.stream_id=streams.stream_id
order by reactions.created_at desc
limit 3;

-- (5) Вывести пожертвования заблокированных пользователей
select * from donations
join users on donations.donator_id=users.user_id
where is_blocked = true;