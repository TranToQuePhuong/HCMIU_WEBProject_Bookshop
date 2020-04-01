
ALTER TABLE Products ADD CONSTRAINT FK_CategoriesProducts
FOREIGN KEY (CategoryId) REFERENCES Categories(id) 
ON UPDATE CASCADE ON DELETE NO ACTION;


INSERT INTO Categories(Name,NameVN)VALUES(
'Comic',
'Truyen tranh'
);
INSERT INTO Categories(Name,NameVN)VALUES(
'Friction',
'Truyen tranh'
);
INSERT INTO Categories(Name,NameVN)VALUES(
'Magazine',
'Tap chi'
);
INSERT INTO Categories(Name,NameVN)VALUES(
'Novel',
'Tieu thuyet'
);
INSERT INTO Categories(Name,NameVN)VALUES(
'Science',
'Khoa hoc'
);
INSERT INTO Categories(Name,NameVN)VALUES(
'Manga',
'Truyen tranh Nhat Ban'
);


INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'The Rise of Kyoshi',
530000,
'\src\main\webapp\static\the_legend_of_kyoshi.jpg',
'2019-07-16',
1,
1,
10,
NULL,
123.456,
30000,
1
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'The Rise of Kyoshi',
530000,
'\src\main\webapp\static\the_legend_of_kyoshi.jpg',
'2019-07-16',
1,
1,
10,
NULL,
123.456,
30000,
1
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'The Rise of Kyoshi',
530000,
'\src\main\webapp\static\the_legend_of_kyoshi.jpg',
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
'\src\main\webapp\static\ATLA_thepromise_part1',
'2012-01-25',
1,
1,
50,
NULL,
123.456,
10000,
1
);



SELECT* FROM Categories;
SELECT * FROM Products;