SELECT TOP 12 * FROM Products ORDER BY ProductDate DESC;
SELECT * FROM Products;


UPDATE Products 
SET ViewCount = 0;

UPDATE Products
SET Discount = 0
WHERE Discount IS NULL;