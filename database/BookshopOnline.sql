CREATE DATABASE BookshopOnline
GO 
USE BookshopOnline;

CREATE TABLE Categories( 
id INT,
Name NVARCHAR(50),
NameVN NVARCHAR(MAX),
);

CREATE TABLE Products(
id INT,
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
);

CREATE TABLE Customers(
id nvarchar(20),
Password nvarchar(50),
Fullname nvarchar(50),
Email nvarchar(50),
Photo nvarchar(50),
Activated bit,
Admin bit
);

CREATE TABLE Orders(
Id int,
CustomerId nvarchar(20),
OrderDate datetime,
Address nvarchar(60),
Amount float,
Description nvarchar(1000)
);

CREATE TABLE OrderDetails(
id int,
OrderId int,
ProductId int,
UnitPrice int,
Quantity int,
Discount float
);