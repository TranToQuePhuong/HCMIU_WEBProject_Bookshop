GO
USE BookshopOnline
---> Add foreign key
ALTER TABLE Orders ADD CONSTRAINT FK_CustomerOrders
FOREIGN KEY (CustomerId) REFERENCES Customers(id) 
ON UPDATE CASCADE ON DELETE NO ACTION;


ALTER TABLE OrderDetails ADD CONSTRAINT FK_OrderOrderDetails
FOREIGN KEY (OrderId) REFERENCES Orders(id) 
ON UPDATE CASCADE ON DELETE NO ACTION;


ALTER TABLE OrderDetails ADD CONSTRAINT FK_ProductOrderDetails
FOREIGN KEY (ProductId) REFERENCES Products(id) 
ON UPDATE CASCADE ON DELETE NO ACTION;

---> Insert Customer
INSERT INTO Customers VALUES(
'C1',
'123456789',
'Duyen Trang',
'trangduyen@gmail.com',
'\src\main\webapp\static\neko.jpg',
1,
0
);
INSERT INTO Customers VALUES(
'C2',
'1234',
'Potts',
'potts@gmail.com',
'\src\main\webapp\static\default_img.png',
1,
0
);
INSERT INTO Customers VALUES(
'Admin',
'A123',
'Admin',
'trangthanhmaiduyen@gmail.com',
'\src\main\webapp\static\default_img.png',
1,
1
)
---> Insert Order
INSERT INTO Orders(CustomerId, OrderDate, Address, Amount, Description) VALUES(
'C1',
'2020-03-03',
'Dormitory A, HCM city',
300000,
NULL
);

INSERT INTO Orders(CustomerId, OrderDate, Address, Amount, Description) VALUES(
'C2',
'2020-03-03',
'Dormitory B, Binh Duong',
830000,
NULL
);

---> Insert OrderDetail
INSERT INTO OrderDetails(OrderId,ProductId,UnitPrice,Quantity,Discount) VALUES(
20,
1002,
530000,
1,
NULL
);
INSERT INTO OrderDetails(OrderId,ProductId,UnitPrice,Quantity,Discount) VALUES(
20,
1003,
300000,
1,
NULL
);

INSERT INTO OrderDetails(OrderId,ProductId,UnitPrice,Quantity,Discount) VALUES(
10,
1002,
300000,
1,
NULL
);



 ---> Fix data :)) 
UPDATE Categories
SET Name='Fiction', NameVN='Vien tuong'
WHERE id = 2;
UPDATE Products
SET Image = '\src\main\webapp\static\ATLA_thepromise_part1.jpg'
WHERE id = 1001;
---> Delete duplicate data 
DELETE FROM Products
WHERE id = 1001;
DELETE FROM Products
WHERE id = 1000;



SELECT * FROM Categories;
SELECT * FROM Products;
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;