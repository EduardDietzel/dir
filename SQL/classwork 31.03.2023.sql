use platform;

-- (1) Описать связи между таблицами БД platform:
-- users.user_id (1:M) streams.user_id
-- user.user_id (1:M) donations.donator_id
-- streams.stream_id (1:M) donations.stream_id
-- users.user_id (1:M) reactions.user_id
-- streams.stream_id (1:M) reactions.stream_id

-- (2) Описать связи между таблицами БД "чат поддержки"
-- users.user_id (1:M) chats.part1
-- users.user_id (1:M) chats.part2
-- users.user_id (1:M) messages.author_id
-- reactions.message_id (M:1) messages.id
-- reactions.author_id (M:1) users.user_id
-- messages.chat_id (M:1) chats.chat_id

-- (3) Вывести ТОП-1 пожертвований из Германии (размер и имя_автора)
select 
	donations.amount as amount_eur,
	users.fullname as author_fullname
from donations
join users on donations.donator_id = users.user_id
where users.country = 'Germany'
order by donations.amount desc
limit 1;