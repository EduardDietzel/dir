use hr;

-- CONSTRAINT (ограничения)

-- задаем ограничения
-- NOT NULL
-- UNIQUE
-- PRIMARY KEY (NOT NULL and UNIQUE)
-- 

create table goods(
	id integer PRIMARY KEY,
    good_name varchar(128) unique NOT NULL,
    qty integer NOT NULL check (qty >= 0),
    price integer NOT NULL check (price > 0)
);

create table users(
	id integer PRIMARY KEY,
    user_name varchar(128) unique NOT NULL,
    first_name varchar(128) NOT NULL,
    last_name varchar(128) NOT NULL,
    email varchar(128) unique NOT NULL,
    user_age integer check (user_age >= 18),
    adress varchar(128) NOT NULL,
    telefon_numer varchar(128) unique,
    CONSTRAINT unique_fullname
		UNIQUE (first_name, last_name),
    CONSTRAINT isAdultAndAlive
		CHECK (user_age >= 18 AND user_age < 200)
);

create table orders(
	id integer PRIMARY KEY,
    clientId integer NOT NULL,
    delivery_status boolean,
    total_price integer not null,
    CONSTRAINT client_id_fk
		FOREIGN KEY (clientId)
			REFERENCES users(id)
);

-- для связи данных таблицы с заказами (table orders) с данными других таблиц

create table orderedGoods(
	order_id integer NOT NULL,
    good_id integer NOT NULL,
    qty integer NOT NULL CHECK (qty > 0),
    PRIMARY KEY (order_id, good_id),
    FOREIGN KEY (order_id)
		REFERENCES orders(id),
	FOREIGN KEY (good_id)
		REFERENCES goods(id)
);

-- TODO (почитать про PRIMARY KEY, FOREIGN KEY и REFERENCES)

-- Таблица со скидками для конкретных пользователей на конкретный товар

create table discounts_personal(
	discount integer NOT NULL,
    discount_status boolean,
    good_id integer NOT NULL,
    user_id integer NOT NULL,
    PRIMARY KEY (user_id, good_id),
    FOREIGN KEY (user_id)
		REFERENCES users(id),
	FOREIGN KEY (good_id)
		REFERENCES goods(id)
);

-- Таблица со скидками на конкретные товары до конкретной даты

create table discounts_dated(
	discount integer NOT NULL,
    last_date integer NOT NULL,
    good_id integer NOT NULL,    
	FOREIGN KEY (good_id)
		REFERENCES goods(id),
	PRIMARY KEY (good_id, last_date)
);

-- таблица со скидками для конкретных клиентов на всё и навсегда

create table discounts_permanent_personal (
	discountId integer NOT NULL,
	discount integer NOT NULL,
    discount_status boolean,
    user_id integer NOT NULL,
    FOREIGN KEY (user_id)
		REFERENCES users(id)
);

-- * вывести (создать запрос) названия товаров в определенном заказе клиента (не хватает данных для выполнения задания, требуется поиск информации дополнительно)
-- ** AUTO_INCREMENT - почитать, изучить, узнать, где стоит его применить в этой базе данныхalter
-- Заполнить таблицу пользователей
-- Заполнить таблицу товаров 
-- Заполнить таблицу заказов
-- (опц) Заполнить таблицу скидок
-- вывести идентификаторы (айди) товаров в конкретном заказе
-- вывести все скидки ( discounts_dated) на конкретный товар
-- вывести все скидки ( discounts_personal) на конкретный товар
-- вывести все скидки ( discounts_personal) для конкретного пользователя