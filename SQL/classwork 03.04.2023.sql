use platform;

-- Добавим в таблицу users данные о паролях
alter table users
add password char(40);

-- добавляем пароли для пользоватлей
update users
set password = SHA1('123')
where user_id = 7;

select * from users
where user_id=3 and password = SHA1('123');
-- если в пароле будет ошибка, данные не выведутся

/* SQL JOIN / Горизонтальное объединение таблиц
1. `(INNER) JOIN`
    1. объединяет две таблицы на основе общего столбца (поля) и выбирает записи, совпадающие значениями в этих столбцах
2. `LEFT JOIN`
    1. объединяет две таблицы на основе общего столбца (поля) и выбирает записи с совпадающими значениями в этих столбцах,
    а **также оставшиеся значения из ЛЕВОЙ таблицы**
3. `RIGHT JOIN`
    1. объединяет две таблицы на основе общего столбца (поля) и выбирает записи с совпадающими значениями в этих столбцах,
    а **также оставшиеся значения из ПРАВОЙ таблицы**
4. `FULL JOIN`
    1. объединяет две таблицы на основе общего столбца (поля) и выбирает записи с совпадающими значениями в этих столбцах,
    а **также оставшиеся значения из ОБЕИХ таблицы** */

/* Вертикальное объединение таблиц / SQL UNION
SELECT Country FROM Suppliers
UNION
SELECT Country FROM Customers
-- пример выборки в песочнице (вывод всех стран Клиентов и Поставщиков без дублирования)
 */
 
 -- вывести самый большой и самый маленький донат
 (select amount from donations
 order by amount desc
 limit 1)
 union
 (select amount from donations
 order by amount asc
 limit 1);
 
 -- вывести пользователей, у которых имейл содержит знак @
 select * from users
 where email like '%@%';
 