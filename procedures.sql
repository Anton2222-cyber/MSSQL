use car_service


--1.—оздать нового клиента
create procedure NewClient
@firstname varchar(100),
@lastname varchar(100),
@phonenumber varchar(30),
@vip bit
as
begin
INSERT INTO clients VALUES(@firstname,@lastname,@phonenumber,@vip)
end

select * from clients

execute NewClient 'Anton','Lashch','0662609970',true

--2.—оздать новый бренд в конкретной стране (проверка на существование страны)

create procedure NewBrand
@name varchar(100),
@IdCountry int
as
begin
If exists (select id from countries where countries.id=@IdCountry)
begin
INSERT INTO brands VALUES(@name,@IdCountry)
end
end

select * from brands

execute NewBrand 'Porsche',1
--3.—оздать нового менеджера(номер телефона должен соответствовать формату: 0XX-XXX-XX-XX)
create procedure NewManager
@firstname varchar(100),
@lastname varchar(100),
@phonenumber varchar(30)
as
begin
if(@phonenumber LIKE '0[0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]')
BEGIN
INSERT INTO managers VALUES(@firstname,@lastname,@phonenumber)
END
end

select * from managers
execute NewManager 'Vadym','Lashch','078-260-99-70'
--4.—оздать процедуру, котора€ принимает id клиента, и делает из него vip, если он обслуживалс€ более 3 раз, в противном случае забрать у него стату vip
create procedure UpdateStatusByNumber
@IdClient int
as
begin
declare @number int
select @number = number
from OrdersServicesAndClients
where @IdClient = clients_id

if(@number > 3)
begin
update clients
set isVip = 1
where @IdClient = clients.id
end
if(@number <= 3)
begin
update clients
set isVip = 0
where @IdClient = clients.id
end
end

select * from clients
execute UpdateStatusByNumber 1
--5.—оздать процедуру, котора€ принимает id клиента, и делает из него vip, если он потратил более 3000, в противном случае забрать у него стату vip
create procedure UpdateStatusByPrice
@IdClient int
as
begin
declare @price int
select @price = total
from OrdersServicesAndClients
where @IdClient = clients_id

if(@price > 3000)
begin
update clients
set isVip = 1
where @IdClient = clients.id
end
if(@price <= 3000)
begin
update clients
set isVip = 0
where @IdClient = clients.id
end
end

select * from clients
execute UpdateStatusByPrice 10
--6.ѕодготовить view дл€ 4 и 5 процедуры

create view OrdersServicesAndClients
as
select clients.first_name, clients.last_name, clients.id as 'clients_id', clients.isVip, count(clients.id) as 'number', sum(services.price) as 'total'
from orders
join services on services.id = orders.id_service
join clients on clients.id = orders.id_client
group by clients.first_name, clients.last_name, clients.id,clients.isVip

select * from OrdersServicesAndClients

--7.ќтобразить информацию про всех клиентов.
--ѕроцедура принимает
--информацию по какому параметру сортировать:
--'first' или 'last'. ¬ случае 'first' сортировка по имени
--и отображаютс€ в первую очередь имена.
--¬ случае 'last' сортировка по фамилии
--и отображаютс€ в первую очередь фамилии

create procedure SortByLastOrFirst
@parameter varchar(5)
as
begin
if(@parameter = 'first')
begin
select clients.first_name, clients.last_name, clients.phone, clients.isVip, clients.id
from clients
order by clients.first_name
end
if(@parameter = 'last')
begin
select  clients.last_name, clients.first_name, clients.phone, clients.isVip, clients.id
from clients
order by clients.last_name
end
end

select * from clients
execute SortByLastOrFirst 'last'















select 
	clients.last_name as 'clients last name',
	countries.name,
	brands.name,
	cars.model,
	cars.license_number,
	services.name,
	services.price,
	managers.last_name  as 'managers last name',
	orders.date_from
from orders 
	join clients on orders.id_client = clients.id
	join cars on orders.id_car = cars.id 
	join services on  orders.id_service = services.id
	join managers on orders.id_manager = managers.id
	join brands on brands.id = cars.id_brand
	join countries on countries.id = brands.id_country