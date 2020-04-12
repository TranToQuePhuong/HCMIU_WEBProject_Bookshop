CREATE DATABASE BookshopOnline
GO 
USE BookshopOnline;

CREATE TABLE Categories( 
id INT Identity(1,1) ,
Name NVARCHAR(50),
NameVN NVARCHAR(MAX),
PRIMARY KEY(id)
);

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

CREATE TABLE Orders(
id int Identity(10,10),
CustomerId nvarchar(20),
OrderDate datetime,
Address nvarchar(60),
Amount float,
Description nvarchar(1000)
PRIMARY KEY(id)
);

CREATE TABLE OrderDetails(
id int Identity(00001,1),
OrderId int,
ProductId int,
UnitPrice int,
Quantity int,
Discount float
PRIMARY KEY(id)
);


