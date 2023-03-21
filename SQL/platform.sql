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

select * from users;

