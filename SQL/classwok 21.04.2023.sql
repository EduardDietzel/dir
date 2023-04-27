use platform;
select * from donations;
select * from reactions;
select * from users;

-- вывести сумму пожертвований из США
select sum(amount) as total_donations_from_USA
from donations
join users on donations.donator_id=users.user_id
where users.country = 'USA';

-- вывести среднюю оценку пользователей из Германии
select AVG(value) as average_reaction_German
from reactions
join users on reactions.user_id=users.user_id
where users.country = 'Germany';

-- вывести количество оценок, равных 5
select count(value) as count_reaction_5
from reactions
where value = 5;

-- вывести имя_донатора и размер для последних пяти донатов
 select 
	users.fullname as name_donators,
	donations.amount
from donations
join users on donations.donator_id = users.user_id
order by donations.created_at desc
limit 5;

DESCRIBE users;