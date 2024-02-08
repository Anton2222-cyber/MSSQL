use Menu

--�������� ������� �pizzas� (�id�, �name�, �price�, �diameter�).
CREATE TABLE pizzas(
	id INT IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(100) UNIQUE  check(len(trim(name))!=0 and name=trim(name) and name not LIKE '%' + char(9)+ '%') not null,
	price float not null,
	diameter float not null
)

--�������� ����� ����� ���������, ������� 18, ���� 50,4���.
insert into pizzas values('���������',50.4,18)
--�������� ����� ����� ���������, ������� 28, ���� 81���.
insert into pizzas values('���������',81,28)
--�������� ��� ����� ����� ����� ��������: ������ , ������� 38, ���� 149���, ��������� , ������� 32, ���� 116���
insert into pizzas values('������',149,38),('���������',116,32)

--��������� ���� ��������� 53���.
update pizzas
set price = 53
where name = '���������'
--����� � id=4 ��������� ������� 30.
update pizzas
set diameter = 30
where id = 4

--����, ��� ���� ������ 100��� �������� �� 130���, ������� ���������.
update pizzas
set price = 130
where price > 100
select * from pizzas

--������ � id ������ 2 � ������ 5 ������������ ��������� ������� 22, ������� ���������.
update pizzas
set diameter = 22
where id >= 2 and id <= 5
select * from pizzas

--�������� ������ �� 4 ���� � ��������� ���� 180.
update pizzas
set name = '4 ����', price = 180
where name = '������'

--������� ����� � id = 3.
select *
from pizzas
where id = 3

--������� ����� � ����� ����� 100���.
select *
from pizzas
where id = 3

--������� ����� � ����� ����� 100���.
select top(1) *
from pizzas
where price < 100

--������� ����� � ����� �� ������ 130���.
select top(1) *
from pizzas
where price != 130

--������� ���� � ������� ���������.
select  price, diameter
from pizzas
where name = '���������'

--������� ����� � ��������� ���������.
select *
from pizzas
where name = '���������'

--������� ��� �����, ����� ���, ������� ���������� ��������� .
select *
from pizzas
where name != '���������'

--������� ��� ����� ��������� 22 � ����� ������ 150���.
select *
from pizzas
where diameter = 22 and price < 150
--������� ����� � ��������� �� 25 �� 33 ������������.
select *
from pizzas
where diameter >= 25 and diameter <= 33
--������� ����� � ��������� �� 25 �� 33  ��� � ����� �� 100 �� 200 ���..
select *
from pizzas
where (diameter > 25 and diameter < 33) or (price >100 and price <200)
--������� ��� ����� ��������� 22 ��� ����� 180���.
select *
from pizzas
where diameter = 22 or price =180 

--������� ����� � id=3, ������� ���������.
DELETE 
FROM pizzas 
where id = 3
select * from pizzas

--������� ���������.
DELETE 
FROM pizzas 
where name = '���������'
select * from pizzas
--������� ��� �����, � ������� ������� 18, ������� ���������.
DELETE 
FROM pizzas 
where diameter = 18
select * from pizzas