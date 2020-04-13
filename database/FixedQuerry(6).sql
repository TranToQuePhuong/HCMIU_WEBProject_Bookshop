USE BookshopOnline
Go

UPDATE Products
SET Image = 'ATLA_thepromise_part1.jpg' 
WHERE Name LIKE 'Avatar%'

SELECT * FROM Products;
