
use Goods_Delivery

create table Goods(
id int identity(1,1) primary key,
name varchar(100) not null unique,
code varchar(100) not null unique,
price int not null
)
insert into Goods values('Milk','d8sdk', 80),('Iphone XR 256Gb','dj1k',25000),('bike','fjwi',15000)

create table customers(
id int identity(1,1) primary key,
name varchar(100) not null,
lastname varchar(100) not null,

)
insert into customers values('Anton','Lashch'),('Ivan','Ivanov'),('Kolia','Derkach')
create table Orders(
id int identity(1,1) primary key,
code varchar(100) not null unique,
id_customers int not null foreign key references customers(id),
addres varchar(100) not null,
phone varchar(30) not null,
cotract_number varchar(30) not null unique,
date_from smalldatetime not null,
id_goods int not null foreign key references Goods(id)

)
insert into Orders values('dksa','1','Fedorova 54, Lobna','0989324004','1', '2023-01-12',1),('jw2h',2,'Bondarenka 12 Zaliznytsa','0662609970','2F','2023-02-12',2),('ka92',2,'Bondarenka 12 Zaliznytsa','0662609970','3F','2023-02-18',3)
create table Shipment_Of_Goods(
id int identity(1,1) primary key,
code varchar(100) not null unique,
id_order int not null foreign key references Orders(id),
date_from smalldatetime not null, 
quantity int not null
)
insert into Shipment_Of_Goods values('ldk3',1,'2023-01-12',5),('sl2j',1,'2023-01-20',5),('slw1',2,'2023-01-20',10)


create table Goods_Shipment_Of_Goods(
id int identity(1,1) primary key,
id_goods int not null foreign key references Goods(id),
id_Shipment_Of_Goods int not null foreign key references Shipment_Of_Goods(id),
quantity int not null,
)
insert into Goods_Shipment_Of_Goods values(1,1,5),(2,1,5),(3,2,10)

select *
from Orders
join customers on customers.id = Orders.id_customers
join Goods on Goods.id = Orders.id_goods

select * 
from Goods_Shipment_Of_Goods
join Goods on Goods.id = Goods_Shipment_Of_Goods.id_goods
join Shipment_Of_Goods on Shipment_Of_Goods.id = Goods_Shipment_Of_Goods.id_Shipment_Of_Goods
