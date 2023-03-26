create database platform;
use platform;

create table if not exists users (
	user_id integer primary key auto_increment,
    fullname varchar(128) not null,
    country varchar(128) not null,
    created_at datetime default current_timestamp,
    is_blocked bool default false
);

INSERT INTO users(fullname, country)
VALUE
	('Ivan Ivanov', 'USA'),
    ('Petr Petrov', 'Germany'),
    ('Sergey Sergeev', 'France');
    
INSERT INTO users(fullname, country, email)
VALUE
	('John Smitt', 'GB', 'kjhgf@gmail.com'),
    ('Ed Dietzel', 'Germany', 'oiuuiytr@gmail.com'),
    ('Carlo Pasolini', 'Italy', 'zxcvbvnb@gmail.com');
    
select * from users;
    
create table if not exists streams(
	stream_id integer primary key auto_increment,
    user_id integer,
    title varchar(256) not null,
    created_at datetime default current_timestamp,
    is_completed bool default false,
    FOREIGN KEY (user_id) REFERENCES users(user_id) -- добавить привязку к users
);

insert into streams (user_id, title)
values
	(1, 'Sream from USA'),
	(2, 'Sream from Germany'),
	(3, 'Sream from France');

select * from streams;

create table if not exists reactions(
	reaction_id integer primary key auto_increment,
    user_id integer,  -- автор реакции
    stream_id integer,  -- на какой стрим реакция
    created_at datetime default current_timestamp,
    value integer check(value between 1 and 5),    -- значение реакции
    FOREIGN KEY (user_id) REFERENCES users(user_id), -- добавить привязку к users, проверка на сущ. ПОЛЬЗОВАТЕЛЯ
    FOREIGN KEY (stream_id) REFERENCES streams(stream_id)  -- проверка сущ. СТРИМА
);

insert into reactions (user_id, stream_id, value)
values
	(1, 1, 5),
    (2, 2, 4),
	(3, 3, 3);
-- можно менять юзеров и стримы для установки оценки

select * from reactions;

create table if not exists donations(
	donation_id integer primary key auto_increment,
    created_at datetime default current_timestamp,
	donator_id integer,    
    stream_id integer,    
    amount decimal(10, 2) check(amount > 0),
    FOREIGN KEY (donator_id) REFERENCES users(user_id),
    FOREIGN KEY (stream_id) REFERENCES streams(stream_id)
);

insert into donations (donator_id, stream_id, amount)
values
	(1, 1, 9.99),
    (1, 3, 12),
    (2, 2, 5.50),
    (2, 1, 7),
	(3, 3, 1);

select * from donations
order by amount desc
limit 3;

SELECT amount,
	amount AS amount_eur,
	amount * 1.05 AS amount_usd
FROM donations;

select *
from donations
join users on donations.donator_id=users.user_id;

-- добавить поле с имейлом в таблицу с пользователями
alter table users
add email varchar(64);

-- удалить поле имейл из таблицы
alter table users
drop column e_mail;

-- переименовать поле в таблице
alter table users
rename column e_mail to email;
