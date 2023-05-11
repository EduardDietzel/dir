-- добавить пять пользователей в таблицу users

INSERT INTO users(fullname, email)
VALUE
	('John Smitt', 'hgjgj@gmail.com'),
    ('Max Mayers', 'rtyuyg@gmail.com'),
    ('Bill Gats', 'poi@gmail.com'),
    ('Mary Snow', 'lkji@gmail.com'),
    ('Anna Nouname', 'asrd@gmail.com'),
    ('Carlo Pasolini', 'zxcvbvnb@gmail.com');

select * from users;

insert into movies(title, rating, duration_minute, imdb_id)
value('Movie1', 5, 90, 546),
('Movie2', 3, 95, 126),
('Movie3', 4, 87, 342),
('Movie4', 5, 92, 154),
('Movie5', 4, 90, 251);

select * from movies;

insert into halls(name, number_seats, low_category, vip_category)
value('Red', 100, 70, 30),
('Green', 100, 70, 30),
('Blue', 100, 70, 30),
('Yello', 100, 70, 30);
select * from halls;

INSERT INTO timetable (hall_id, movie_id, start_time, duration_minute, low_seat_price, vip_seat_price)
VALUES
	(1, 1, CURRENT_TIMESTAMP, 100, 80, 120),
    (2, 2, CURRENT_TIMESTAMP, 100, 80, 120),
    (3, 3, CURRENT_TIMESTAMP, 100, 80, 120),
    (3, 4, CURRENT_TIMESTAMP, 100, 80, 120);
select * from timetable;

INSERT INTO tickets(timetable_id, user_id, `row`, seat, cost, is_vip)
VALUES
	(1, NULL, 1, 8, 120, true),
    (2, NULL, 1, 2, 120, true),
    (3, NULL, 1, 3, 120, true),
    (4, NULL, 1, 4, 120, true),
    (4, NULL, 1, 5, 120, true);
    
select * from tickets;

-- Задача. Вывести информацию о билетах
-- название_фильма
-- стоимость_билета
-- название_зала
select
movies.title,
tickets.cost,
halls.name
from tickets
join timetable on tickets.timetable_id=timetable.timetable_id
JOIN movies ON timetable.movie_id=movies.movie_id
JOIN halls ON timetable.hall_id=halls.hall_id;

-- Задача. Вывести ко-во, общую сумму и среднюю сумму по всем билетам
select 
	count(*) as 'Количество',
    sum(cost) as 'Общая сумма',
    avg(cost) as 'Средняя цена билета'
from tickets;

-- **Задача. Вывести информацию о самом популярном фильме**
-- название_фильма
-- ко-во_проданных_билетов
-- сумма_проданных_билетов
select
movies.title as Название_фильма,
count(*) as Количество_билетов,
sum(cost) as Сумма_проданных_билетов
from tickets
join timetable on tickets.timetable_id=timetable.timetable_id
JOIN movies ON timetable.movie_id=movies.movie_id
group by movies.movie_id
order by 'Количество_билетов' desc
limit 1
;