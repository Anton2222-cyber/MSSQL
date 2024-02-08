use Menu

--Создайте таблицу “pizzas” (“id”, “name”, “price”, “diameter”).
CREATE TABLE pizzas(
	id INT IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(100) UNIQUE  check(len(trim(name))!=0 and name=trim(name) and name not LIKE '%' + char(9)+ '%') not null,
	price float not null,
	diameter float not null
)

--Добавьте новую пиццу Маргарита, диаметр 18, цена 50,4грн.
insert into pizzas values('Маргарита',50.4,18)
--Добавьте новую пиццу Карбонара, диаметр 28, цена 81грн.
insert into pizzas values('Карбонара',81,28)
--Добавьте две новые пиццы одним запросом: Цезарь , диаметр 38, цена 149грн, Пепперони , диаметр 32, цена 116грн
insert into pizzas values('Цезарь',149,38),('Пепперони',116,32)

--Поставьте цену Маргарите 53грн.
update pizzas
set price = 53
where name = 'Карбонара'
--Пицце с id=4 поставьте диаметр 30.
update pizzas
set diameter = 30
where id = 4

--Всем, чья цена больше 100грн сделайте ее 130грн, верните результат.
update pizzas
set price = 130
where price > 100
select * from pizzas

--Пиццам с id больше 2 и меньше 5 включительно поставьте диаметр 22, верните результат.
update pizzas
set diameter = 22
where id >= 2 and id <= 5
select * from pizzas

--Измените Цезарь на 4 сыра и поставьте цену 180.
update pizzas
set name = '4 сыра', price = 180
where name = 'Цезарь'

--Выбрать пиццу с id = 3.
select *
from pizzas
where id = 3

--Выбрать пиццу с ценой менее 100грн.
select *
from pizzas
where id = 3

--Выбрать пиццу с ценой менее 100грн.
select top(1) *
from pizzas
where price < 100

--Выбрать пиццу с ценой НЕ равной 130грн.
select top(1) *
from pizzas
where price != 130

--Узнайте цену и диаметр Пепперони.
select  price, diameter
from pizzas
where name = 'Пепперони'

--Выбрать пиццу с названием Маргарита.
select *
from pizzas
where name = 'Маргарита'

--Выбрать все пиццы, кроме той, которая называется Карбонара .
select *
from pizzas
where name != 'Карбонара'

--Выбрать все пиццы диаметром 22 и ценой меньше 150грн.
select *
from pizzas
where diameter = 22 and price < 150
--Выбрать пиццы с диаметром от 25 до 33 включительно.
select *
from pizzas
where diameter >= 25 and diameter <= 33
--Выбрать пиццы с диаметром от 25 до 33  или с ценой от 100 до 200 грн..
select *
from pizzas
where (diameter > 25 and diameter < 33) or (price >100 and price <200)
--Выбрать все пиццы диаметром 22 или ценой 180грн.
select *
from pizzas
where diameter = 22 or price =180 

--Удалите пиццу с id=3, верните результат.
DELETE 
FROM pizzas 
where id = 3
select * from pizzas

--Удалите Пепперони.
DELETE 
FROM pizzas 
where name = 'Пепперони'
select * from pizzas
--Удалите все пиццы, у которых диаметр 18, верните результат.
DELETE 
FROM pizzas 
where diameter = 18
select * from pizzas