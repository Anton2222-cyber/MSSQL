use car_service

--CREATE TABLE countries(
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	name VARCHAR(100) UNIQUE
--)

--CREATE TABLE brands(
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	name VARCHAR(100) UNIQUE  NOT NULL,
--	id_country INT NOT NULL FOREIGN KEY REFERENCES countries(id)
--)

--CREATE TABLE cars(
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	id_brand INT NOT NULL FOREIGN KEY REFERENCES brands(id),
--	model VARCHAR(50) NOT NULL ,
--	license_number VARCHAR(20) UNIQUE NOT NULL
--)

--CREATE TABLE services(
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	name VARCHAR(100) UNIQUE NOT NULL,
--	price int NOT NULL
--)

--CREATE TABLE clients(
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	first_name VARCHAR(100) NOT NULL,
--	last_name VARCHAR(100) NOT NULL,
--	phone VARCHAR(30) NOT NULL UNIQUE,
--	isVip BIT NOT NULL
--)

--CREATE TABLE managers(
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	first_name VARCHAR(100) NOT NULL,
--	last_name VARCHAR(100) NOT NULL,
--	phone VARCHAR(30) NOT NULL UNIQUE
--)

--create table orders(
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	id_client INT NOT NULL FOREIGN KEY REFERENCES clients(id),
--	id_car INT NOT NULL FOREIGN KEY REFERENCES cars(id),
--	id_service INT NOT NULL FOREIGN KEY REFERENCES services(id),
--	id_manager INT NOT NULL FOREIGN KEY REFERENCES managers(id),
--	date_from smalldatetime,
--	date_to smalldatetime
--)

--INSERT INTO countries VALUES('Germany')
--INSERT INTO countries VALUES('France')
--INSERT INTO countries VALUES('Ukraine')
--INSERT INTO countries VALUES('Brazil'),('Japan')

--INSERT INTO brands VALUES('BMW',1)
--INSERT INTO brands VALUES('MERCEDES',1)
--INSERT INTO brands VALUES('RENAULT',2)
--INSERT INTO brands VALUES('OPEL',1)
--INSERT INTO brands VALUES('TOYOTA',5)
--INSERT INTO brands VALUES('MITSUBISHI',5)
--INSERT INTO brands VALUES('AUDI',1)

--INSERT INTO cars VALUES(1,'X5','AH5658')
--INSERT INTO cars VALUES(2,'Maybach','AE5658AA')
--INSERT INTO cars VALUES(2,'Maybach','AE5659AA')
--INSERT INTO cars VALUES(3,'MEGANE','AC9349AA')
--INSERT INTO cars VALUES(3,'KANGOO','AC9116AB')
--INSERT INTO cars VALUES(6,'LANCER','AC6481BA')
--INSERT INTO cars VALUES(4,'ASTRA','AC9696BB')
--INSERT INTO cars VALUES(5,'COROLLA','AC5122CC')
--INSERT INTO cars VALUES(5,'CAMRY','AC8151AH')
--INSERT INTO cars VALUES(7,'R8','AC2374HA')

--INSERT INTO services VALUES('Change oil', 500);
--INSERT INTO services VALUES('Engine diagnostics',500)
--INSERT INTO services VALUES('Fuel system diagnostics',400)
--INSERT INTO services VALUES('Replacement of technical fluids',350)
--INSERT INTO services VALUES('Clutch replacement',1500)
--INSERT INTO services VALUES('Replacement of brake discs',1200)
--INSERT INTO services VALUES('Replacement of brake pads',1000)
--INSERT INTO services VALUES('Replacement of filters',800)

--INSERT INTO clients VALUES('ivan','Ivanov','769-666-66-66',1)
--INSERT INTO clients VALUES('Giovani','Gray','099-806-09-27',1)
--INSERT INTO clients VALUES('Kyler','Ward','068-054-47-93',0)
--INSERT INTO clients VALUES('Tyson','Washington','099-289-56-71',0)
--INSERT INTO clients VALUES('Kye','Hall','068-882-44-96',1)
--INSERT INTO clients VALUES('Willis','Rogers','099-359-03-55',0)
--INSERT INTO clients VALUES('Jonah','Thompson','077-849-57-25',1)
--INSERT INTO clients VALUES('Onida','Rivera','099-777-00-02',1)
--INSERT INTO clients VALUES('Olga','Edwards','078-367-08-70',0)
--INSERT INTO clients VALUES('Rivka','Kelly','099-090-91-82',1)

--INSERT INTO managers VALUES('Finnegan','Patterson','099-141-11-95')
--INSERT INTO managers VALUES('Maximilian','Ross','099-264-73-33')
--INSERT INTO managers VALUES('Martin','Long','099-581-31-36')
--INSERT INTO managers VALUES('Raymond','Watson','099-430-16-14')

--INSERT INTO orders VALUES(1,1,3,1,'2023-01-31 14:43:57','2023-01-31 16:20:45')
--INSERT INTO orders VALUES(2,2,5,2,'2023-01-17 15:11:15','2023-01-18 10:15:42')
--INSERT INTO orders VALUES(3,3,8,3,'2023-01-04 13:37:50','2023-01-04 15:05:34')
--INSERT INTO orders VALUES(4,4,4,4,'2023-01-30 08:35:16','2023-01-30 15:00:51')
--INSERT INTO orders VALUES(5,5,1,1,'2023-02-14 10:50:07','2023-02-14 12:00:15')
--INSERT INTO orders VALUES(6,6,6,2,'2023-02-24 12:27:56','2023-02-25 13:00:24')
--INSERT INTO orders VALUES(7,7,2,3,'2023-01-11 13:22:56','2023-01-11 14:30:13')
--INSERT INTO orders VALUES(8,8,3,4,'2023-01-19 19:21:50','2023-01-20 11:29:53')
--INSERT INTO orders VALUES(9,9,7,2,'2023-02-11 08:06:37','2023-02-11 18:21:11')
--INSERT INTO orders VALUES(10,10,1,4,'2023-02-03 08:39:56','2023-03-03 09:50:05')
--INSERT INTO orders VALUES(10,10,1,4,'2023-02-03 08:39:56','2023-03-08 09:50:05')
--INSERT INTO orders VALUES(10,10,1,4,'2023-02-03 08:39:56','2023-03-09 09:50:05')
--INSERT INTO orders VALUES(1,2,3,4,'2015-03-31 17:00:00.000','2023-03-09 09:50:05')
--INSERT INTO orders VALUES(2,1,1,1,'2022-06-01 08:39:56','2022-06-04 09:50:05')

--только имя и фамилия
--SELECT first_name, last_name FROM clients;

--только имя, фамилия и телефон VIP-ов
--SELECT first_name, last_name, phone
--FROM clients
--WHERE isVip = 1

--инфо о всех Maybach, которые мы обслуживали
--SELECT * 
--FROM cars
--WHERE model = 'Maybach'

--все кроме Maybach
--SELECT * 
--FROM cars
--WHERE model != 'Maybach'

--все кроме Maybach
--SELECT * 
--FROM cars
--WHERE model <> 'Maybach'

--Все сервисы дороже 1000
--SELECT * 
--FROM services
--WHERE price >= 1000

--Все клиенты, имя начинается на букву A
--SELECT *
--FROM clients
--WHERE first_name LIKE  'O%'

--SELECT *
--FROM clients
--WHERE first_name LIKE  '%l%'

--SELECT *
--FROM clients
--WHERE first_name LIKE  '%a'


--|| &&  AND OR
--Бренды на букву A или O
--SELECT *
--FROM brands
--WHERE name LIKE 'A%' OR name LIKE 'M%'

--номер телефонов, котороые начинаются на 0 и заканчиваются на 5
--SELECT *
--FROM clients
--WHERE phone LIKE '0%5' AND phone LIKE '%5'


--все модели без повторов
--SELECT DISTINCT model
--FROM cars

--имена, в которых меньше 5 букв
--SELECT first_name
--FROM CLIENTS
--WHERE LEN(first_name) < 5

--все заказы до февраля 2023
--SELECT *
--FROM orders
--WHERE date_to < '2023-02-01'

--все заказы с 1 февраля 2023 по сегодня
--SELECT * 
--FROM orders
--WHERE date_to > '2023-02-14 12:00:15' AND date_to <= getDate()

--SELECT * 
--FROM orders
--WHERE date_to BETWEEN '2023-02-14 12:00:15' AND getDate()

--за последние 30 дней
--SELECT *
--FROM orders
--WHERE date_to BETWEEN DATEADD(DAY, -30, GETDATE()) AND GETDATE();


--за последние 3 месяца
--SELECT *
--FROM orders
--WHERE date_to BETWEEN DATEADD(MONTH, -3, GETDATE()) AND GETDATE();

--Показать инфо про клиентов: Ivan, Tyson, Olga
--SELECT *
--FROM clients
--WHERE first_name = 'Ivan' OR first_name = 'Tyson'  OR first_name = 'Olga'

--SELECT *
--FROM clients
--WHERE first_name IN ('Ivan', 'Tyson', 'Olga')











----для пошуку з враховуванням регістру
--SELECT * 
--FROM clients
--WHERE first_name = 'ivan'
--collate Cyrillic_General_CS_AS


----Отобразить номера телефонов клиентов в котором есть семерка
--SELECT clients.phone
--FROM clients
--WHERE clients.phone LIKE '%7%'


----Отобразить имена клиентов, в котором есть три семерки и он явеляется Vip
--SELECT clients.first_name
--FROM clients
--WHERE clients.phone LIKE '%7%7%7%' AND clients.isVip=1



----Показать заказы за последнюю неделю
--SELECT orders.date_from, orders.date_to, clients.first_name, clients.last_name, clients.phone, cars.model, services.name, services.price, managers.first_name, managers.last_name, managers.phone
--FROM orders
--INNER JOIN clients ON orders.id_client = clients.id 
--INNER JOIN cars ON orders.id_car = cars.id
--INNER JOIN services ON orders.id_service = services.id
--INNER JOIN managers ON orders.id_manager = managers.id
--WHERE date_to BETWEEN DATEADD(DAY, -7, GETDATE()) AND GETDATE();


----Показать заказы, которые предстоит ещё закончить(date_to ещё не наступила)/В этом случае мы сразру устанавливаем дату окончания при создании order-a.
--SELECT orders.date_from, orders.date_to, clients.first_name, clients.last_name, clients.phone, cars.model, services.name, services.price, managers.first_name, managers.last_name, managers.phone
--FROM orders
--INNER JOIN clients ON orders.id_client = clients.id 
--INNER JOIN cars ON orders.id_car = cars.id
--INNER JOIN services ON orders.id_service = services.id
--INNER JOIN managers ON orders.id_manager = managers.id
--WHERE date_to > getDate()

----Показать сервисы, которые стоят в пределах от 500 до 1000. Включительно.
--SELECT *
--FROM services
--WHERE services.price>=500 AND services.price<=1000


----Показать заказы которые были предоставлены летом 2022г.
--SELECT orders.date_from, orders.date_to, clients.first_name, clients.last_name, clients.phone, cars.model, services.name, services.price, managers.first_name, managers.last_name, managers.phone
--FROM orders
--INNER JOIN clients ON orders.id_client = clients.id 
--INNER JOIN cars ON orders.id_car = cars.id
--INNER JOIN services ON orders.id_service = services.id
--INNER JOIN managers ON orders.id_manager = managers.id
--WHERE date_to >= '2022-06-01' AND date_to <= '2022-08-31'


----Показать название всех существующих брендов с названиями стран.
--SELECT brands.name, countries.name
--FROM brands
--INNER JOIN countries ON countries.id = brands.id  


----Показать модель машины и название бренда
--SELECT cars.model, brands.name
--FROM cars
--INNER JOIN brands ON brands.id=cars.id_brand

----Показать дату окончания заказов и гос.номер машины, которые были выполнены в этом году
--SELECT orders.date_to, cars.license_number
--FROM orders
--INNER JOIN cars ON cars.id = orders.id_car
--WHERE YEAR(date_to)= YEAR(GETdate())


----Показать имена вип клиентов, которые воспользовались нашим сервисным центромс 1 янаваря по 28 февраля 2023
--SELECT clients.first_name
--FROM orders
--INNER JOIN clients ON clients.id = orders.id_client
--WHERE clients.isVip = 1 AND date_to>'2023-01-01' AND date_to<'2023-02-28'



--select 
--	clients.last_name as 'clients last name',
--	countries.name,
--	brands.name,
--	cars.model,
--	cars.license_number,
--	services.name,
--	services.price,
--	managers.last_name  as 'managers last name',
--	orders.date_from
--from orders 
--	join clients on orders.id_client = clients.id
--	join cars on orders.id_car = cars.id 
--	join services on  orders.id_service = services.id
--	join managers on orders.id_manager = managers.id
--	join brands on brands.id = cars.id_brand
--	join countries on countries.id = brands.id_country


--Сколько сервисов предоставил каждый мененджер
select managers.id, managers.first_name, managers.last_name, count(services.name) as 'number'
from orders
join services on services.id = orders.id_service
join managers on managers.id = orders.id_manager
group by managers.first_name, managers.last_name, managers.id

--Сколько денег в общем потратил каждый клиент
select clients.first_name, clients.last_name, sum(services.price) as 'total'
from orders
join clients on clients.id = orders.id_client
join services on services.id = orders.id_service
group by clients.first_name, clients.last_name

--Сколько денег ушло на обсуживание автомобилей по странам
select countries.name, sum(services.price) as 'total'
from orders
join cars on cars.id = orders.id_car
join brands on brands.id = cars.id_brand
join countries on countries.id = brands.id_country
join services on services.id = orders.id_service
group by countries.name

--Какая страна обходится в ремонте дороже всех
select top(1) countries.name, sum(services.price) as 'total'
from orders
join cars on cars.id = orders.id_car
join brands on brands.id = cars.id_brand
join countries on countries.id = brands.id_country
join services on services.id = orders.id_service
group by countries.name
order by 'total' desc 

--Средняя трата каждого клиента
select clients.first_name, clients.last_name, avg(services.price) as 'Средняя трата'
from orders
join services on services.id = orders.id_service
join clients on clients.id = orders.id_client
group by clients.first_name, clients.last_name




--SELECT * FROM countries
--SELECT * FROM brands
--SELECT * FROM cars
--SELECT * FROM services
--SELECT * FROM clients
--SELECT * FROM managers
--SELECT * FROM orders

--ctrl + K + C, ctrl + K + U
--DROP TABLE cars
--DROP TABLE brands
--DROP TABLE countries
--DROP TABLE services
--DROP TABLE clients
--DROP TABLE managers
--DROP TABLE orders