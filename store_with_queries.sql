--DROP TABLE IF EXISTS deliveries_orders
--DROP TABLE IF EXISTS deliveries
--DROP TABLE IF EXISTS orders_products
--DROP TABLE IF EXISTS orders
--DROP TABLE IF EXISTS contracts
--DROP TABLE IF EXISTS customers
--DROP TABLE IF EXISTS products

----товары
--CREATE TABLE products
--(
--	id BIGINT IDENTITY PRIMARY KEY,
--	code VARCHAR(12) NOT NULL UNIQUE CHECK(len(trim(code)) >= 1),
--	name VARCHAR(100) NOT NULL CHECK(len(trim(name)) >= 1),
--	price MONEY NOT NULL CHECK(price >= 1),
--	gramm INT NOT NULL  CHECK(gramm >= 1),
--	UNIQUE(name, gramm),
--	quantity INT NOT NULL CHECK(quantity >= 0)
--)
----заказчиков
--CREATE TABLE customers
--(
--	id INT IDENTITY PRIMARY KEY,
--	phone VARCHAR(20) NOT NULL CHECK(len(trim(phone)) >= 3),
--	name NVARCHAR(100) NOT NULL CHECK(len(trim(name)) >= 2),
--	city NVARCHAR(50) NOT NULL CHECK(len(trim(city)) >= 2),
--	street NVARCHAR(50) NOT NULL CHECK(len(trim(street)) >= 2),
--	house NVARCHAR(10) NOT NULL CHECK(len(trim(house)) >= 1),
--	room NVARCHAR(10) DEFAULT NULL
--)
----договоры
--CREATE TABLE contracts
--(
--	id INT IDENTITY PRIMARY KEY,
--	number VARCHAR(20) NOT NULL UNIQUE CHECK(len(trim(number)) >= 1),
--	description NVARCHAR(max),
--	date DATE NOT NULL CHECK(date <= getdate())
--)
----заказы(код, кто, контракт, коли)  #101B  10баунти 20сникерсов
--CREATE TABLE orders
--(
--	id BIGINT IDENTITY PRIMARY KEY,
--	code VARCHAR(20) NOT NULL UNIQUE CHECK(len(trim(code)) >= 1),
--	id_customer INT REFERENCES customers(id) NOT NULL,
--	id_contract INT REFERENCES contracts(id) NOT NULL,
--	date DATE NOT NULL CHECK(date <= getdate())
--)
----список товаров в заказе
--CREATE TABLE orders_products
--(
--	id_order BIGINT REFERENCES orders(id) NOT NULL,
--	id_product BIGINT REFERENCES products(id) NOT NULL,
--	quantity INT NOT NULL CHECK(quantity > 0),
--	PRIMARY KEY(id_order, id_product)
--)
----отгрузки  #10506BC    order#1(bounty 20шт snickers 20шт)   order#2(product 7шт)    order#3
--CREATE TABLE deliveries
--(
--	id BIGINT IDENTITY PRIMARY KEY,
--	code VARCHAR(20) NOT NULL UNIQUE CHECK(len(trim(code)) >= 1),
--	date DATE NOT NULL CHECK(date <= getdate())
--)
----список заказов в отгрузке
--CREATE TABLE deliveries_orders
--(
--	id_deliveriy BIGINT REFERENCES deliveries(id) NOT NULL,
--	id_order BIGINT REFERENCES orders(id) NOT NULL,
--	id_product  BIGINT REFERENCES products(id) NOT NULL,
--	quantity INT NOT NULL CHECK(quantity > 0),
--	PRIMARY KEY(id_deliveriy, id_order, id_product)
--)
----добавим 4 товара
--INSERT INTO products(code, name, price, gramm, quantity) VALUES
--('pr01', 'Snikers', 15, 50, 100),
--('pr02', 'Snikers', 30, 112, 100),
--('pr03', 'Bounty', 20, 57, 100),
--('pr04', 'Bounty', 25, 85, 100)
----добавим 2 заказчика
--INSERT INTO customers(phone, name, city, street, house ) VALUES
--('+38-066-666-66-66', N'ПП Бандера', N'Запоріжжя', N'пр.Перемоги', '100'),
--('+38-097-777-77-77', N'ТОВ Байрактар', N'Запоріжжя', N'вул.Українська', '500'),
--('+38-066-260-99-70', N'ТОВ БІТ', N'Київ', N'вул.Українська', '120')
----добавим 2 договора
--INSERT INTO contracts(number, date) VALUES
--('contr01', '2022-01-01'),
--('contr02', '2022-02-02'),
--('contr03', '2022-05-06')
----ПП Бандера заказал 5 больших и 5 маленьких сникерсов одним заказом
----ТОВ Байрактар заказал 15 больших и 15 маленьких баунти двумя заказами
--INSERT INTO orders(code, id_customer, id_contract, date) VALUES
--('ord01', 1, 1, '2022-08-15'),--Бандера
--('ord02', 2, 2, '2022-08-15'),--Байрактар
--('ord03', 2, 2, '2022-08-15'),--Байрактар
--('ord04', 3, 4, '2023-02-15'),
--('ord05', 3, 4, '2023-02-20')

--INSERT INTO orders_products(id_order, id_product, quantity) VALUES
----(1, 2, 5),--5 больших сникерсов Бандера в одном заказе №1
----(1, 1, 5),--5 маленьких сникеросв Бандера в одном заказе №1
----(2, 4, 15),--15 больших баунти Байрактар двумя заказами  №2
----(3, 3, 15)--15 маленьких баунти Байрактар двумя заказами №3
------16 числа отпаравили двумя отгрузками два заказа для ПП Бандера
------в первой отгрузке большие сникерсы 5шт, во второй маленькие 5шт
----(7, 3, 15),
----(7, 1, 20),
--(7, 2, 20)
--INSERT INTO deliveries(code, date) VALUES
----('deliv01', '2022-08-16'),
----('deliv02', '2022-08-16'),
----('deliv04', '2023-03-20')
----('deliv05', '2023-03-25')
--('deliv06', '2023-03-25')
--select * from deliveries
--INSERT INTO deliveries_orders(id_deliveriy, id_order, id_product, quantity) VALUES
----(1, 1, 2, 5),--5 больиших сникерсов для Бандера заказ№1 отгрузка№1
----(2, 1, 1, 5)--5 маленьких сникерсов для Бандера заказ№1 отгрузка№2
------17 числа отправили одной отгрузкой 7шт маленьких и 7шт больших для ТОВ Байрактар
----(5, 7, 3, 15),
----(5, 7, 1, 20)
----(6, 8, 2, 20)
----(6, 1, 2, 20)
--(7, 1, 2, 20)
--INSERT INTO deliveries(code, date) VALUES
--('deliv03', '2022-08-17')
--INSERT INTO deliveries_orders(id_deliveriy, id_order, id_product, quantity) VALUES
----(3, 2, 3, 7),
----(3, 3, 4, 7)

--показать кто, какие заказы сделал, когда, номер договора и номер заказа

--SELECT 
--	customers.name,
--	products.name,
--	products.gramm,
--	products.price,
--	orders_products.quantity,
--	orders.date,
--	contracts.number,
--	orders.code
--FROM  orders_products
--	JOIN orders ON orders.id = orders_products.id_order
--	JOIN products ON products.id = orders_products.id_product
--	JOIN customers ON customers.id = orders.id_customer
--	JOIN contracts ON contracts.id = orders.id_contract

--Показать кому, какие товары отправлены, сколько, цена за единицу,
--общая цена позиции, когда, контракт, номер заказа, номер отгрузки

--SELECT 
--	customers.name,
--	products.name,
--	products.gramm,
--	deliveries_orders.quantity,
--	products.price,
--	deliveries_orders.quantity * products.price as 'total',
--	deliveries.date,
--	contracts.number,
--	orders.code,
--	deliveries.code
--FROM  orders 
--	JOIN deliveries_orders ON deliveries_orders.id_order = orders.id
--	JOIN deliveries ON deliveries.id = deliveries_orders.id_deliveriy
--	JOIN customers ON customers.id = orders.id_customer
--	JOIN products ON products.id = deliveries_orders.id_product
--	JOIN contracts ON contracts.id = orders.id_contract
 
 --показать сколько кому ещё должны
--SELECT 
--	customers.name,
--	products.name,
--	products.gramm,
--	orders_products.quantity - deliveries_orders.quantity as 'quantity',
--	orders.code
--FROM  orders 
--	JOIN deliveries_orders ON deliveries_orders.id_order = orders.id
--	JOIN deliveries ON deliveries.id = deliveries_orders.id_deliveriy
--	JOIN customers ON customers.id = orders.id_customer
--	JOIN products ON products.id = deliveries_orders.id_product
--	JOIN orders_products ON products.id = orders_products.id_product



--1.Посчитать выручку по каждому дню за последние три месяца и отсортировать по убыванию
	select deliveries.date, sum(deliveries_orders.quantity*products.price) as 'total'
	from deliveries_orders
	join products on products.id = deliveries_orders.id_product
	join deliveries on deliveries.id = deliveries_orders.id_deliveriy
	where deliveries.date BETWEEN DATEADD(MONTH, -3, GETDATE()) AND GETDATE()
	group by deliveries.date
	order by 'total' desc

----2.Найти наименьшую стоимость отгрузки(считать все товары, что есть в отгурзки, учитывать их количество)
	select top 1 sum(deliveries_orders.quantity*products.price) as 'total'
	from deliveries_orders
	join products on products.id = deliveries_orders.id_product
	join deliveries on deliveries.id = deliveries_orders.id_deliveriy
    group by deliveries.code
	order by 'total' 
--3.Общее количество отгруженных товаров за последние три месяца
select sum(deliveries_orders.quantity) as 'total'
	from deliveries_orders
	join deliveries on deliveries.id = deliveries_orders.id_deliveriy
	where deliveries.date BETWEEN DATEADD(MONTH, -3, GETDATE()) AND GETDATE()

----4.Вычеслить среднюю стоимиость заказа(считать все товары, которые есть заказе, учитывать их количество)

select orders_products.id_order, sum(orders_products.quantity*products.price) as 'total'
into #OrdersSummary
from orders_products
join products on products.id = orders_products.id_product
group by orders_products.id_order

select avg(total) as 'avg order price'
from #OrdersSummary

--5.Средняя стоимость отгрузки в указанное число(считать все товары, что есть в отгурзки, учитывать их количество)
create procedure AVG_Deliveries_By_Date
@date DATE
as
begin
if(@date > GETDATE())
begin
print 'error date'
return
end
declare @summary table(suma int)
insert into @summary
select sum(deliveries_orders.quantity*products.price)
	from deliveries_orders
	join products on products.id = deliveries_orders.id_product
	join deliveries on deliveries.id = deliveries_orders.id_deliveriy
	where deliveries.date = @date
    group by deliveries.code
	select avg(suma) as 'avg delivery price'
	from @summary
end

execute AVG_Deliveries_By_Date '2023-03-25'