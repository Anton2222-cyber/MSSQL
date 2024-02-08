use Employers;

CREATE TABLE departments(
id INT IDENTITY(1,1) PRIMARY KEY,
name VARCHAR(50) NOT NULL UNIQUE
)
INSERT INTO departments VALUES('Developer'),('Tester'),('HR'),('Designer')

CREATE TABLE employers(
id INT IDENTITY(1,1) PRIMARY KEY,
name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
number_phone VARCHAR(100) NOT NULL UNIQUE,
salary INT NOT NULL,
id_department INT NOT NULL FOREIGN KEY REFERENCES departments(id) 
)

INSERT INTO employers VALUES('Anton','Lashch','0989324004',25000,1)
INSERT INTO employers VALUES('Ivan','Derkach','0989332904',25000,1)
INSERT INTO employers VALUES('Bogdan','Panasiuk','0662609970',15000,3)
INSERT INTO employers VALUES('Karina','Marchuk','0988324004',25000,2)
INSERT INTO employers VALUES('Vasyl','Lashch','0989333004',27000,4)
INSERT INTO employers VALUES('Mykola','Shvaiko','0989321234',15000,2)
INSERT INTO employers VALUES('Olia','Zhylko','0123324004',16000,2)
INSERT INTO employers VALUES('Andriy','Balik','0989111004',25000,1)
INSERT INTO employers VALUES('Vladislav','Shvaiko','0912345004',17000,3)
INSERT INTO employers VALUES('Sophia','Lashch','0981114004',19000,3)

SELECT * FROM departments
SELECT * FROM employers

--DROP TABLE employers
--DROP TABLE departments