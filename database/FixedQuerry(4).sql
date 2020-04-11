GO
USE BookshopOnline

SELECT * FROM Products;
SELECT * FROM Customers;


---> Delete constraint 
ALTER TABLE OrderDetails
DROP CONSTRAINT FK_ProductOrderDetails;

ALTER TABLE Orders
DROP CONSTRAINT FK_CustomerOrders;


---> Delete table Products and Customers
DROP TABLE Products;
DROP TABLE Customers;


---> Create new table for Product and Customers
CREATE TABLE Products(
id INT Identity(1000,1),
Name nvarchar(60),
UnitPrice float,
Image nvarchar(50),
ProductDate date,
Available bit,
CategoryId int,
Quantity int,
Description nvarchar(MAX),
Discount float,
ViewCount int,
Special bit
PRIMARY KEY(id)
);


CREATE TABLE Customers(
id nvarchar(20),
Password nvarchar(50),
Fullname nvarchar(50),
Email nvarchar(50),
Photo nvarchar(50),
Activated bit,
Admin bit
PRIMARY KEY(id)
);


----> Add products
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'The Rise of Kyoshi',
530000,
'/src/main/webapp/static/the_legend_of_kyoshi.jpg',
'2019-07-16',
1,
4,
10,
NULL,
321.654,
30000,
1
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Avatar The Last Airbender - The Promise part 1',
300000,
'/src/main/webapp/static/ATLA_thepromise_part1',
'2018-01-25',
1,
1,
50,
NULL,
123.456,
10000,
1
);
---> Insert fiction books
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Harry Potter the Philosophers Stone',
200000,
'/src/main/webapp/static/HP_1.jpg',
'2020-03-03',
1,
2,
50,
NULL,
NULL,
30000,
1
);

INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Harry Potter the Chamber of Secrets',
200000,
'/src/main/webapp/static/HP_2.jpg',
'2020-03-03',
1,
2,
50,
NULL,
NULL,
30000,
1
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Harry Potter the Prisoner of Azkaban',
200000,
'/src/main/webapp/static/HP_3.jpg',
'2020-03-03',
1,
2,
50,
NULL,
NULL,
30000,
1
);

INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Harry Potter the Globet of fire',
200000,
'/src/main/webapp/static/HP_4.jpg',
'2020-03-03',
1,
2,
50,
NULL,
NULL,
30000,
1
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Harry Potter the Order of the Phoenix',
200000,
'/src/main/webapp/static/HP_5.jpg',
'2020-03-03',
1,
2,
50,
NULL,
NULL,
30000,
1
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Harry Potter the Half-Blood Prince ',
200000,
'/src/main/webapp/static/HP_6.jpg',
'2020-03-03',
1,
2,
50,
NULL,
NULL,
30000,
1
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Harry Potter the Deathy Hallows ',
200000,
'/src/main/webapp/static/HP_7.jpg',
'2020-03-03',
1,
2,
50,
NULL,
NULL,
30000,
1
);

---> Insert magazine 
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Hoa hoc tro so 1382 ',
22000,
'/src/main/webapp/static/HHT_1382.jpg',
'2020-04-01',
1,
3,
100,
NULL,
NULL,
30000,
1
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Hoa hoc tro so 1329 ',
22000,
'/src/main/webapp/static/HHT_1329.jpg',
'2020-02-14',
1,
3,
100,
NULL,
NULL,
30000,
1
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Hoa hoc tro so 1311 ',
22000,
'/src/main/webapp/static/HHT_1311.jpg',
'2020-02-01',
1,
3,
100,
NULL,
NULL,
30000,
1
);

---> Insert novel books
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Su im lang cua bay cuu',
81000,
'/src/main/webapp/static/SYLCBC.jpg',
'2020-01-15',
1,
4,
60,
NULL,
NULL,
30000,
1
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Rung Na-uy',
90000,
'/src/main/webapp/static/rung_nauy.jpg',
'2020-01-15',
1,
4,
45,
NULL,
NULL,
30000,
1
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Khong gia dinh',
65000,
'/src/main/webapp/static/khong_gia_dinh.jpg',
'2020-01-15',
1,
4,
45,
NULL,
NULL,
30000,
1
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Bo gia',
65000,
'/src/main/webapp/static/Bo_gia.jpg',
'2019-11-23',
1,
4,
45,
NULL,
NULL,
30000,
1
);
 ---> Insert manga
 INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Sword Art Online 001 Aincrad',
60000,
'/src/main/webapp/static/SAO_1.jpg',
'2017-11-01',
1,
6,
50,
NULL,
NULL,
30000,
1
);
 INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Sword Art Online 002 Aincrad',
60000,
'/src/main/webapp/static/SAO_2.jpg',
'2017-12-01',
1,
6,
50,
NULL,
NULL,
30000,
1
);
 INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Sword Art Online 001 Progressive',
75000,
'/src/main/webapp/static/SAO_p1.jpg',
'2018-2-01',
1,
6,
50,
NULL,
NULL,
30000,
1
);
 INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Sword Art Online 002 Progressive',
75000,
'/src/main/webapp/static/SAO_p2.jpg',
'2018-3-01',
1,
6,
50,
NULL,
NULL,
30000,
1
);
 INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Sword Art Online 003 Progressive',
75000,
'/src/main/webapp/static/SAO_p3.jpg',
'2018-4-01',
1,
6,
50,
NULL,
NULL,
30000,
1
);

--->Insert Science books
 INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Knowledge Encyclopedia Science',
375000,
'/src/main/webapp/static/encyclopedia.jpg',
'2020-10-01',
1,
5,
20,
NULL,
NULL,
30000,
1
);
 INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Human Body',
150000,
'/src/main/webapp/static/human_body.jpg',
'2020-10-01',
1,
5,
30,
NULL,
NULL,
30000,
1
);

UPDATE Products
SET Description = 'From the tip of your nose to the top of your toes, 
Human Body by Eyewitness lets your child learn all about how their body works.
Find out how we digest food, how many bones are in the body, how we breathe and what makes us human. 
The Eyewitness reference series is perfect for homework help or school projects.' 
WHERE id = 1024;


---> Insert Customers 
INSERT INTO Customers VALUES(
'C1',
'123456789',
'Duyen Trang',
'trangduyen@gmail.com',
'/src/main/webapp/static/neko.jpg',
1,
0
);
INSERT INTO Customers VALUES(
'C2',
'1234',
'Potts',
'potts@gmail.com',
'/src/main/webapp/static/default_img.png',
1,
0
);
INSERT INTO Customers VALUES(
'Admin',
'A123',
'Admin',
'trangthanhmaiduyen@gmail.com',
'/src/main/webapp/static/default_img.png',
1,
1
)
------> Add constraint foreign key for Products and Customers 
ALTER TABLE OrderDetails ADD CONSTRAINT FK_ProductOrderDetails
FOREIGN KEY (ProductId) REFERENCES Products(id) 
ON UPDATE CASCADE ON DELETE NO ACTION;

ALTER TABLE Orders ADD CONSTRAINT FK_CustomerOrders
FOREIGN KEY (CustomerId) REFERENCES Customers(id) 
ON UPDATE CASCADE ON DELETE NO ACTION;


----> print out Products and Customers
SELECT * FROM Products;
SELECT * FROM Customers;