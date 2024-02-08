--DROP TABLE IF EXISTS deliveries_orders
--DROP TABLE IF EXISTS deliveries
--DROP TABLE IF EXISTS orders_products
--DROP TABLE IF EXISTS orders
--DROP TABLE IF EXISTS contracts
--DROP TABLE IF EXISTS customers
--DROP TABLE IF EXISTS products

----������
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
----����������
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
----��������
--CREATE TABLE contracts
--(
--	id INT IDENTITY PRIMARY KEY,
--	number VARCHAR(20) NOT NULL UNIQUE CHECK(len(trim(number)) >= 1),
--	description NVARCHAR(max),
--	date DATE NOT NULL CHECK(date <= getdate())
--)
----������(���, ���, ��������, ����)  #101B  10������ 20���������
--CREATE TABLE orders
--(
--	id BIGINT IDENTITY PRIMARY KEY,
--	code VARCHAR(20) NOT NULL UNIQUE CHECK(len(trim(code)) >= 1),
--	id_customer INT REFERENCES customers(id) NOT NULL,
--	id_contract INT REFERENCES contracts(id) NOT NULL,
--	date DATE NOT NULL CHECK(date <= getdate())
--)
----������ ������� � ������
--CREATE TABLE orders_products
--(
--	id_order BIGINT REFERENCES orders(id) NOT NULL,
--	id_product BIGINT REFERENCES products(id) NOT NULL,
--	quantity INT NOT NULL CHECK(quantity > 0),
--	PRIMARY KEY(id_order, id_product)
--)
----��������  #10506BC    order#1(bounty 20�� snickers 20��)   order#2(product 7��)    order#3
--CREATE TABLE deliveries
--(
--	id BIGINT IDENTITY PRIMARY KEY,
--	code VARCHAR(20) NOT NULL UNIQUE CHECK(len(trim(code)) >= 1),
--	date DATE NOT NULL CHECK(date <= getdate())
--)
----������ ������� � ��������
--CREATE TABLE deliveries_orders
--(
--	id_deliveriy BIGINT REFERENCES deliveries(id) NOT NULL,
--	id_order BIGINT REFERENCES orders(id) NOT NULL,
--	id_product  BIGINT REFERENCES products(id) NOT NULL,
--	quantity INT NOT NULL CHECK(quantity > 0),
--	PRIMARY KEY(id_deliveriy, id_order, id_product)
--)
----������� 4 ������
--INSERT INTO products(code, name, price, gramm, quantity) VALUES
--('pr01', 'Snikers', 15, 50, 100),
--('pr02', 'Snikers', 30, 112, 100),
--('pr03', 'Bounty', 20, 57, 100),
--('pr04', 'Bounty', 25, 85, 100)
----������� 2 ���������
--INSERT INTO customers(phone, name, city, street, house ) VALUES
--('+38-066-666-66-66', N'�� �������', N'��������', N'��.��������', '100'),
--('+38-097-777-77-77', N'��� ���������', N'��������', N'���.���������', '500'),
--('+38-066-260-99-70', N'��� ���', N'���', N'���.���������', '120')
----������� 2 ��������
--INSERT INTO contracts(number, date) VALUES
--('contr01', '2022-01-01'),
--('contr02', '2022-02-02'),
--('contr03', '2022-05-06')
----�� ������� ������� 5 ������� � 5 ��������� ��������� ����� �������
----��� ��������� ������� 15 ������� � 15 ��������� ������ ����� ��������
--INSERT INTO orders(code, id_customer, id_contract, date) VALUES
--('ord01', 1, 1, '2022-08-15'),--�������
--('ord02', 2, 2, '2022-08-15'),--���������
--('ord03', 2, 2, '2022-08-15'),--���������
--('ord04', 3, 4, '2023-02-15'),
--('ord05', 3, 4, '2023-02-20')

--INSERT INTO orders_products(id_order, id_product, quantity) VALUES
----(1, 2, 5),--5 ������� ��������� ������� � ����� ������ �1
----(1, 1, 5),--5 ��������� ��������� ������� � ����� ������ �1
----(2, 4, 15),--15 ������� ������ ��������� ����� ��������  �2
----(3, 3, 15)--15 ��������� ������ ��������� ����� �������� �3
------16 ����� ���������� ����� ���������� ��� ������ ��� �� �������
------� ������ �������� ������� �������� 5��, �� ������ ��������� 5��
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
----(1, 1, 2, 5),--5 �������� ��������� ��� ������� �����1 ��������1
----(2, 1, 1, 5)--5 ��������� ��������� ��� ������� �����1 ��������2
------17 ����� ��������� ����� ��������� 7�� ��������� � 7�� ������� ��� ��� ���������
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

--�������� ���, ����� ������ ������, �����, ����� �������� � ����� ������

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

--�������� ����, ����� ������ ����������, �������, ���� �� �������,
--����� ���� �������, �����, ��������, ����� ������, ����� ��������

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
 
 --�������� ������� ���� ��� ������
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



--1.��������� ������� �� ������� ��� �� ��������� ��� ������ � ������������� �� ��������
	select deliveries.date, sum(deliveries_orders.quantity*products.price) as 'total'
	from deliveries_orders
	join products on products.id = deliveries_orders.id_product
	join deliveries on deliveries.id = deliveries_orders.id_deliveriy
	where deliveries.date BETWEEN DATEADD(MONTH, -3, GETDATE()) AND GETDATE()
	group by deliveries.date
	order by 'total' desc

----2.����� ���������� ��������� ��������(������� ��� ������, ��� ���� � ��������, ��������� �� ����������)
	select top 1 sum(deliveries_orders.quantity*products.price) as 'total'
	from deliveries_orders
	join products on products.id = deliveries_orders.id_product
	join deliveries on deliveries.id = deliveries_orders.id_deliveriy
    group by deliveries.code
	order by 'total' 
--3.����� ���������� ����������� ������� �� ��������� ��� ������
select sum(deliveries_orders.quantity) as 'total'
	from deliveries_orders
	join deliveries on deliveries.id = deliveries_orders.id_deliveriy
	where deliveries.date BETWEEN DATEADD(MONTH, -3, GETDATE()) AND GETDATE()

----4.��������� ������� ���������� ������(������� ��� ������, ������� ���� ������, ��������� �� ����������)

select orders_products.id_order, sum(orders_products.quantity*products.price) as 'total'
into #OrdersSummary
from orders_products
join products on products.id = orders_products.id_product
group by orders_products.id_order

select avg(total) as 'avg order price'
from #OrdersSummary

--5.������� ��������� �������� � ��������� �����(������� ��� ������, ��� ���� � ��������, ��������� �� ����������)
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