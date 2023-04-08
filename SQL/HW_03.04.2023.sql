-- (1) Описать связи между таблицами БД "песочница"
/*
Customers.CustomerID (1:M) Orders.OrderID

Shippers.ShipperID (1:M) Orders.OrderID

Employees.EmployeeID (1:M) Orders.OrderID

Categories.CategoryID(1:M) Products.ProductID

Suppliers.SupplierID (1:M) Products.ProductID

Orders.OrderID (1:M) Products.ProductID

Orders.OrderID (1:M) OrderDetails.OrderDetailID
*/

use platform;

-- (2) Вывести страны клиентов (БД platform)
select DISTINCT country from users;

-- (3) Вывести пользователей без пароля (БД platform)
select * from users
where password is null or password = ' ';

-- (4) Вывести страны донаторов с максимальным и минимальным пожертвованиями (БД platform)
(select
users.country as country,
donations.amount as amount
from users
join donations on  users.user_id = donations.donator_id
order by amount DESC
LIMIT 1)
union
(select
users.country as country,
donations.amount as amount 
from users
join donations on  users.user_id = donations.donator_id
order by amount ASC
LIMIT 1);

