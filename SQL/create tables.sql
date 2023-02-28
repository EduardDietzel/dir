use hr;

-- DATA DEFINITION LANGUAGE (DDL) - про сущности (таблицы)

create table table1 (
	first_name varchar(10),
    last_name varchar(10),
    some_number integer
)

-- varchar - текст
-- integer - целых знчений
-- char
-- numeric - чисел с плавающей запятой

-- DATA MANIPULATION LANGUAGE (DML) - про данные строки.
-- --------------

-- приведем несколько примеров

INSERT INTO table1(
	first_name,
    last_name,
    some_number
)
values(
	'Игорь',
    'Chulinda',
    31
)


-- ----------
CREATE VIEW view_for_table1 AS
SELECT some_number FROM table1
where some_number > 2;


-- UPDATE оператор (DML) изменение данных
UPDATE table1
	SET first_name = 'Vasya',
		last_name = 'Ivanov'        -- устанавливаем нужные днные для изменения
	WHERE last_name = 'Chulinda';   -- ищем по этим выбранным данным нужный объект
    
    
    


-- New table
-- goods: идентификатор, название, цена, количество

create table goods(
	id integer,
    goods_name varchar(128),  -- здесь надо обязательно задать длину строки в символах.
    price integer,
    qty integer
);

insert into goods (id, goods_name, price, qty) 
	values 
		(1, 'Велосипед', 5000, 100),
        (2, 'Коньки', 1500, 70),
		(3, 'Лыжи', 2500, 80),
		(4, 'Скейт', 3000, 50);

-- изменить цену велосипеда на 1000 евро (к примеру)
UPDATE goods
	SET	price = 10000
	WHERE id = 1; -- (можно выбрать по названию товара)
    
    
-- транзакция  - весь набор действий, который мы в конце закоммитим (COMMIT) и нажмем Ctrl+Enter

delete from goods
where id = 1;   -- (удаляется конкретная позиция)

truncate table goods; -- это очистка всей БД goods (останется пустая таблица)

-- ПРАКТИКА
-- Goods - это все наши товары

-- Clients
create table Clients(
	id integer,
    first_name varchar(64),
	last_name varchar(64),
    phone varchar(64),
    email varchar(64),
    address varchar(256)
);

-- Orders
create table Orders(
	id integer,
    clientId integer
);

create table Ordered_goods(
	orderId integer,
    goodsId integer,
    qty integer
);

select id from Orders
where clientId = 1;

select goodsid, qty from Ordered_goods
where orderId = {id}

select goods_name, price from goods
where id in {goodsId}


-- Good_locations
-- Delivey_parameters

-- Payments