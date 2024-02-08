use car_service

--CREATE TABLE countries_(
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	name VARCHAR(100) UNIQUE
--)

--INSERT INTO countries_ VALUES('Germany')
--INSERT INTO countries_ VALUES('France')
--INSERT INTO countries_ VALUES('Ukraine')
--INSERT INTO countries_ VALUES('Brazil'),('Japan')

--CREATE TABLE brands_(
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	name VARCHAR(100) UNIQUE  NOT NULL,
--	id_country INT NOT NULL FOREIGN KEY REFERENCES countries_(id)
--)
--INSERT INTO brands_ VALUES('BMW',1)
--INSERT INTO brands_ VALUES('MERCEDES',1)
--INSERT INTO brands_ VALUES('TOYOTA',4)

--CREATE TABLE cars_(
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	id_brand INT NOT NULL FOREIGN KEY REFERENCES brands_(id),
--	model VARCHAR(50) NOT NULL ,
--	license_number VARCHAR(20) UNIQUE NOT NULL
--)
--INSERT INTO cars_ VALUES(1,'X5','AH5658')
--INSERT INTO cars_ VALUES(2,'Maybach','AE5658')
--INSERT INTO cars_ VALUES(2,'Maybach','AE5659')
--INSERT INTO cars_ VALUES(3,'Supra','AH6358')


--CREATE TABLE services_(
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	name VARCHAR(100) UNIQUE NOT NULL,
--	price int NOT NULL
--)
--INSERT INTO services_ VALUES('Change oil', 500);
--INSERT INTO services_ VALUES('Diagnostics', 450);
--INSERT INTO services_ VALUES('Tire replacement', 450);
--INSERT INTO services_ VALUES('Washing', 450);
--CREATE TABLE clients_(
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	first_name VARCHAR(100) NOT NULL,
--	last_name VARCHAR(100) NOT NULL,
--	phone VARCHAR(30) NOT NULL UNIQUE,
--	isVip BIT NOT NULL
--)
--INSERT INTO clients_ VALUES('Ivan','Ivanov','066-666-66-66',1)
--INSERT INTO clients_ VALUES('Anton','Lashch','0989324004',0)
--INSERT INTO clients_ VALUES('Ivan','Derkach','0989332904',1)
--INSERT INTO clients_ VALUES('Bogdan','Panasiuk','0662609970',0)

--CREATE TABLE managers_(
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	first_name VARCHAR(100) NOT NULL,
--	last_name VARCHAR(100) NOT NULL,
--	phone VARCHAR(30) NOT NULL UNIQUE
--)
--INSERT INTO managers_ VALUES('Karina','Marchuk','0988324004')
--INSERT INTO managers_ VALUES('Vasyl','Lashch','0989333004')
--INSERT INTO managers_ VALUES('Mykola','Shvaiko','0989321234')
--INSERT INTO managers_ VALUES('Olia','Zhylko','0123324004')

--create table orders_(
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	id_client INT NOT NULL FOREIGN KEY REFERENCES clients_(id),
--	id_car INT NOT NULL FOREIGN KEY REFERENCES cars_(id),
--	id_service INT NOT NULL FOREIGN KEY REFERENCES services_(id),
--	id_manager INT NOT NULL FOREIGN KEY REFERENCES managers_(id),
--	date_from smalldatetime,
--	date_to smalldatetime
--)
--INSERT INTO orders_ VALUES(1,1,1,1,'2023-01-12','2023-02-12')
--INSERT INTO orders_ VALUES(2,2,2,2,'2023-01-12','2023-02-12')
--INSERT INTO orders_ VALUES(1,2,3,1,'2023-01-12','2023-02-12')
--INSERT INTO orders_ VALUES(2,3,2,1,'2023-01-12','2023-02-12')
--SELECT * FROM countries_
--SELECT * FROM brands_
--SELECT * FROM cars_
--SELECT * FROM services_
--SELECT * FROM clients_
--SELECT * FROM orders_


create procedure getInfoByCountry2222
@country_name varchar(100)
as
begin
select brands.name, cars.model, cars.license_number
from brands
join cars on brands.id = cars.id_brand
join countries on countries.id = brands.id_country
where countries.name = @country_name
end
execute getInfoByCountry2222 'Germany'


--ctrl + K + C, ctrl + K + U
--DROP TABLE cars_
--DROP TABLE brands_
--DROP TABLE countries_
--DROP TABLE services_
--DROP TABLE clients_
--DROP TABLE managers_
--DROP TABLE orders_