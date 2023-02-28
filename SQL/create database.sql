-- 1. Создать базу данных Group_40_41
-- 2. В базе создать таблицу products с полями: 
-- 3. id - целое число
-- 4. title строка 64
-- 5. price число в формате ХХХХ.ХХ
-- country строка 64

create database Group_40_41;
use Group_40_41;

create table products(
	id integer primary key auto_increment,
    title varchar(64),
    price numeric(6, 2),
    country varchar(64)
);
insert into products (id, title, price, country) 
	values 
					 (1, 'Анталия', 999.99, 'Турция'),
                     (2, 'Хургада', 1499.99, 'Египет'),
                     (3, "Ибица", 1999.99, "Испания"),
                     (4, 'Kiwi', 40.50, 'France'),
					 (5, 'Banana', 130.40, 'Argentina');

drop table products;

-- внесем данные снова с ограничениями (констрейнты) 
-- 1. значение в поле не должно быть нулл (not null)

create table products(
	id integer primary key auto_increment,
    title varchar(64),
    price numeric(6, 2),
    country varchar(64)
);
insert into products (id, title, price) 
	values (4, 'Kiwi', 40.50);

drop table products;

create table products(
	id integer primary key auto_increment,
    title varchar(64),
    price numeric(6, 2) check (price between 100 and 9999),
    country varchar(64) not null
);

-- Ограничения (Констрейнты) 

-- 1. NOT NULL - значение в поле не может быть null
-- 2. UNIQUE - значение в поле должно быть уникальным 
-- 3. PRIMARY KEY - первичный ключ NOT NULL + UNIQUE
-- 4. CHECK - значение в поле должно соответствовать какому-то условию
-- auto_increment нумерация начнется с единицы автоматически

-- вносим ограничения на одно из полей по цене к примеру - check (price between 100 and 9999),

insert into products (title, price, country) 
	values 
					 ('Анталия', 999.99, 'Турция'),
                     ('Хургада', 1499.99, 'Египет'),
                     ("Ибица", 1999.99, "Испания"),
                     ('Kiwi', 140.50, 'France'),
					 ('Banana', 130.40, 'Argentina');


-- титл можно к примеру также ораничить каким-либо списком: check (title in ('Анталия', 'Хургада', 'Ибица'))

-- можно удалить строки с id
delete from products
where id in (4, 5);
-- после удаления строк с определенным айди следующие строки будут иметь айди тот, который они имели при первом присвоении
-- полное удаление всех строк из таблицы: delete from products;
-- при этом удаляются и айди. новые данные не будут иметь эти айди, будут присвоены новые.
-- set sql_safe_updates = 0; -- отключить безопасный режим
-- set sql_safe_updates = 1; -- включить безопасный режим

-- Сбросить таблицу до начального состояния (автоинкремент начнет нумеровать сначала)
truncate products;

select * from products;

-- HW ДЗ - 
-- 1. В БД Group_40_41 создайте таблицу goods (id integer  первичный ключ авто-инкремент, title строка 64, quantity целое число между 0 и 10)
-- 2. Добавьте несколько строк
-- 3. Проверьте содержимое таблицы
-- 4. Очистите таблицу так, чтобы при добавление новых строк нумерация id с помощью автоинкремента началась с нуля
-- 5. Снова добавьте несколько строк. Проверьте правильно ли пронумеровались id
