-- Вывести название самого посещаемого кинозала
select
halls.name
from halls
join timetable on timetable.hall_id=halls.hall_id
join tickets on tickets.timetable_id=timetable.timetable_id
group by halls.hall_id
order by count(tickets.ticket_id) desc
limit 1;

select * from timetable;
select * from tickets;

-- Вывести название и ко-во проданных билетов самого непопулярного фильма
select
movies.title as Название_фильма,
count(*) as Количество_билетов
from tickets
join timetable on tickets.timetable_id=timetable.timetable_id
JOIN movies ON timetable.movie_id=movies.movie_id
group by movies.movie_id
order by 'Количество_билетов'
limit 1;

-- Вывести процент времени, который отводится рекламе в каждом сеансе.    -?

-- Вывести самый продолжительный фильм (название и продолжительность)
select
title,
duration_minute
from movies
order by duration_minute desc
limit 1;

-- Вывести среднюю стоимость билета для каждого фильма (ср/стоимость и название фильма - проекция)
select
avg(tickets.cost) as ср_стоимость,
movies.title as название_фильма
from tickets
join timetable on timetable.timetable_id=tickets.timetable_id
join movies on movies.movie_id=timetable.movie_id
group by movies.title;