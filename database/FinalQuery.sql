CREATE DATABASE BookshopOnline
GO 
USE BookshopOnline;

CREATE TABLE Categories( 
id INT Identity(1,1) ,
Name NVARCHAR(50),
PRIMARY KEY(id)
);

CREATE TABLE Products(
id INT Identity(1000,1000),
Name nvarchar(60),
UnitPrice float,
Image nvarchar(50),
ProductDate date,
Available bit,
CategoryId int,
Quantity int,
Description nvarchar(MAX) DEFAULT '',
Discount float DEFAULT 0,
ViewCount int DEFAULT 0,
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
id int Identity(100,100),
CustomerId nvarchar(20),
OrderDate datetime,
Address nvarchar(60),
Amount float,
Description nvarchar(1000) DEFAULT ''
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


ALTER TABLE OrderDetails ADD CONSTRAINT FK_OrderOrderDetails
FOREIGN KEY (OrderId) REFERENCES Orders(id) 
ON UPDATE CASCADE ON DELETE NO ACTION;

ALTER TABLE OrderDetails ADD CONSTRAINT FK_ProductOrderDetails
FOREIGN KEY (ProductId) REFERENCES Products(id) 
ON UPDATE CASCADE ON DELETE NO ACTION;

ALTER TABLE Orders ADD CONSTRAINT FK_CustomerOrders
FOREIGN KEY (CustomerId) REFERENCES Customers(id) 
ON UPDATE CASCADE ON DELETE NO ACTION;

ALTER TABLE Products ADD CONSTRAINT FK_CategoriesProducts
FOREIGN KEY (CategoryId) REFERENCES Categories(id) 
ON UPDATE CASCADE ON DELETE NO ACTION;
---> Insert Categories
INSERT INTO Categories VALUES(
'Comic'
);
INSERT INTO Categories VALUES(
'Fiction'
);
INSERT INTO Categories VALUES(
'Magazine'
);
INSERT INTO Categories VALUES(
'Novel'
);
INSERT INTO Categories VALUES(
'Science'
);
INSERT INTO Categories VALUES(
'Manga'
);

---> Insert Products 
 INSERT INTO Products (Name, UnitPrice, Image, ProductDate, Available, CategoryId, Quantity, Description, Discount, ViewCount, Special) VALUES 
  ('The Hobbit', '100000','The_Hobbit.jpg','2020-01-01',1,2,102,'A great modern classic and the prelude to
  The Lord of the Rings. Bilbo Baggins is a hobbit who enjoys a comfortable, unambitious life, rarely traveling any
  farther than his pantry or cellar. But his contentment is disturbed when the wizard Gandalf and a company of dwarves arrive on his doorstep one day to whisk 
  him away on an adventure. They have launched a plot to raid the treasure hoard guarded by Smaug the Magnificent, a large and very dangerous dragon.
  Bilbo reluctantly joins their quest, unaware that on his journey to the Lonely Mountain he will encounter both a magic ring and a frightening creature known as 
  Gollum. “A glorious account of a magnificent adventure, filled with suspense and seasoned with a quiet humor that is irresistible . . . All those, young or old, 
  who love a fine adventurous tale, beautifully told, will take The Hobbit to their hearts.” – New York Times Book Review', 0.1, 340, 0), 
  ('The Lord of the Rings : Fellowship of the ring','170000','TLR_FOTR.jpg', '2019-09-09',1,2,10,'This item is in Excellent
  condition or better (unless it says otherwise in the above description). We buy items as close to Mint condition as possible and
  many will be unplayed and as close to new as you could hope to find.
  Irrespective of the source, all of our collectables meet our strict grading and are 100% guaranteed', 0.2,200,1),
  ('Conan Ep.1','20000','CN_1.jpg','2019-12-12',1,1,97,'',0,1000,0),
('Conan Ep.2','20000','CN_2.jpg','2019-12-12',1,1,90,'',0,980,0),
('Conan Ep.3','20000','CN_3.jpg','2019-12-12',1,1,91,'',0,901,0),
('Conan Ep.4','20000','CN_4.jpg','2019-12-12',1,1,92,'',0,910,0),
('Conan Ep.5','20000','CN_5.jpg','2019-12-12',1,1,19,'',0,984,0),
('Conan Ep.6','20000','CN_6.jpg','2019-12-12',1,1,39,'',0,983,0),
('Conan Ep.7','20000','CN_7.jpg','2019-12-12',1,1,49,'',0,928,0),
('Conan Ep.8','20000','CN_8.jpg','2019-12-12',1,1,69,'',0,971,0),
('Conan Ep.9','20000','CN_9.jpg','2019-12-12',1,1,29,'',0,920,0),
('Conan Ep.10','20000','CN_10.jpg','2019-12-12',1,1,99,'',0,190,0);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Alice Adventures in Wonderland & Through the Looking-Glass',
700000,
'alice_in_wonderland.jpg',
'2090-12-19',
1,
2,
30,
'In 1862 Charles Lutwidge Dodgson, a shy Oxford mathematician with a stammer, created a story about a little girl 
tumbling down a rabbit hole. Thus began the immortal adventures of Alice, perhaps the most popular heroine in English literature. 
Countless scholars have tried to define the charm of the Alice books–with those wonderfully eccentric characters the Queen of Hearts, 
Tweedledum, and Tweedledee, the Cheshire Cat, Mock Turtle, the Mad Hatter et al.–by proclaiming that they really comprise a satire on language, 
a political allegory, a parody of Victorian children’s literature, even a reflection of contemporary ecclesiastical history. Perhaps, as Dodgson might 
have said, Alice is no more than a dream, a fairy tale about the trials 
and tribulations of growing up–or down, or all turned round–as seen through the expert eyes of a child.',
0.3,
30,
0
);

INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'The Ballad of Songbirds and Snakes (A Hunger Games Novel)',
700000,
'the_ballad_of_songbirds_and_snakes.jpg',
'2020-05-19',
1,
4,
50,
'It is the morning of the reaping that will kick off the tenth annual Hunger Games. In the Capitol, eighteen-year-old Coriolanus Snow 
is preparing for his one shot at glory as a mentor in the Games. The once-mighty house of Snow has fallen on hard times, its fate hanging on the 
slender chance that Coriolanus will be able to outcharm, outwit, and outmaneuver his fellow students to mentor the winning tribute.
 
The odds are against him. He’s been given the humiliating assignment of mentoring the female tribute from District 12, 
the lowest of the low. Their fates are now completely intertwined — every choice Coriolanus makes could lead to favor or failure, 
triumph or ruin. Inside the arena, it will be a fight to the death. Outside the arena, Coriolanus starts to feel for his doomed tribute . . . and must 
weigh his need to follow the rules against his desire to survive no matter what it takes.',
0,
100,
1
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'The Shadow of Kyoshi',
800000,
'the_shadow_of_kyoshi.jpg',
'2020-06-01',
1,
4,
100,
'Kyoshi’s place as the true Avatar has finally been cemented—but at a heavy cost.
With her mentors gone, Kyoshi voyages across the Four Nations, struggling to keep the peace.
But while her reputation grows, a mysterious threat emerges from the Spirit World. To stop it, Kyoshi, Rangi, and 
their reluctant allies must join forces before the Four Nations are destroyed irreparably. This thrilling follow-up continues Kyoshi’s journey 
from a girl of humble origins to the merciless pursuer 
of justice still feared and admired centuries after becoming the Avatar.',
0.1,
1100,
1
);

INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'The Rise of Kyoshi',
530000,
'the_rise_of_kyoshi.jpg',
'2020-05-16',
1,
4,
10,
'F. C. Yee’s The Rise of Kyoshi delves into the story of Kyoshi, the Earth Kingdom–born Avatar.
The longest-living Avatar in this beloved world’s history, Kyoshi established the brave and respected Kyoshi Warriors,
but also founded the secretive Dai Li, which led to the corruption, decline, and fall of her own nation. The first of two novels
based on Kyoshi, The Rise of Kyoshi maps her journey from a girl of humble origins to the merciless pursuer of 
justice who is still feared and admired centuries after she became the Avatar.',
0.2,
1000,
1
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Avatar The Last Airbender - The Promise part 1',
300000,
'ATLA_thepromise_part1.jpg', 
'2012-01-25',
1,
1,
50,
'This series of digests rejoins Aang and friends for exciting new adventures, beginning with a faceoff against the Fire Nation that 
threatens to throw the world into another war,
testing all of Aang powers and ingenuity!',
0.3,
8,
0
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,ViewCount,Special)
VALUES(
'Harry Potter the Philosophers Stone',
200000,
'HP_1.jpg',
'2020-03-03',
1,
2,
50,
'',
50,
0
);

INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,ViewCount,Special)
VALUES(
'Harry Potter the Chamber of Secrets',
200000,
'HP_2.jpg',
'2020-03-03',
1,
2,
50,
'A global phenomenon and cornerstone of contemporary children’s literature, J.K. Rowling’s
Harry Potter series is both universally adored and critically acclaimed. Now, experience the magic 
as you’ve never heard it before. The inimitable Jim Dale brings to life an entire cast of characters—from the pinched, 
nasal whine of Petunia Dursley to the shrill huff of the Sorting Hat to the earnest, wondrous voice of the boy wizard himself.

Orphaned as an infant, young Harry Potter has been living a less-than-fortunate life. 
Belittled by his pompous uncle and sniveling aunt (not to mention his absolute terror of a cousin, Dudley), Harry has resigned himself to a mediocre existence in the cupboard under the stairs. But then the letters start dropping on the doormat at Number Four, Privet Drive. Addressed to “Mr. H. Potter” and stamped shut with a purple wax seal, the peculiar envelopes are swiftly confiscated by his relentlessly cruel family. But nothing stops Rubeus Hagrid, a great beetle-eyed giant of a man, from kicking down the door and bursting in with astonishing news: Harry Potter is a wizard—and not only a wizard, he’s an incredibly famous wizard. Hagrid spirits him away to Hogwarts School of Witchcraft and Wizardry, setting into motion an incredible adventure 
(Banks run by goblins! Enchanted train platforms! Invisibility Cloaks!) that listeners won’t ever forget. ',
39,
0
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,ViewCount,Special)
VALUES(
'Harry Potter the Prisoner of Azkaban',
200000,
'HP_3.jpg',
'2020-03-03',
1,
2,
50,
'When the Knight Bus crashes through the darkness and screeches to a halt in front of him, its the start of another 
far from ordinary year at Hogwarts for Harry Potter. Sirius Black, escaped mass-murderer and follower of Lord Voldemort,
is on the run - and they say he is coming after Harry. In his first ever Divination class, Professor Trelawney sees an omen of 
death in Harrys tea leaves.... But perhaps most terrifying of all are the Dementors patrolling the school grounds, with their soul-sucking kiss.... ',
70,
1
);

INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,ViewCount,Special)
VALUES(
'Harry Potter the Globet of fire',
200000,
'HP_4.jpg',
'2020-03-03',
1,
2,
50,
'The Triwizard Tournament is to be held at Hogwarts. Only wizards who are over seventeen are allowed to enter - but that doesnt stop 
Harry dreaming that he will win the competition. Then at Halloween, when the Goblet of Fire makes its selection, Harry is amazed to find h
is name is one of those that the magical cup picks out. He will face death-defying tasks, dragons,
and dark wizards, but with the help of his best friends, Ron and Hermione, he might just make it through - alive! ',
80,
0
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,ViewCount,Special)
VALUES(
'Harry Potter the Order of the Phoenix',
200000,
'HP_5.jpg',
'2020-03-03',
1,
2,
50,
'',
55,
1
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,ViewCount,Special)
VALUES(
'Harry Potter the Half-Blood Prince ',
200000,
'HP_6.jpg',
'2020-03-03',
1,
2,
50,
'',
35,
1
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,ViewCount,Special)
VALUES(
'Harry Potter the Deathy Hallows ',
200000,
'HP_7.jpg',
'2020-03-03',
1,
2,
50,
'',
20,
0
);

INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Hoa hoc tro so 1382 ',
22000,
'HHT_1382.jpg',
'2020-04-01',
1,
3,
100,
'',
0.1,
24,
1
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Hoa hoc tro so 1329 ',
22000,
'HHT_1329.jpg',
'2020-02-14',
1,
3,
100,
'',
0.1,
45,
1
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Hoa hoc tro so 1311 ',
22000,
'HHT_1311.jpg',
'2020-02-01',
1,
3,
100,
'',
0.1,
45,
1
);

INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Su im lang cua bay cuu',
81000,
'SYLCBC.jpg',
'2020-01-15',
1,
4,
60,
'',
0.1,
90,
1
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Rung Na-uy',
90000,
'rung_nauy.jpg',
'2020-01-15',
1,
4,
45,
'',
0.45,
10,
0
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Khong gia dinh',
65000,
'khong_gia_dinh.jpg',
'2020-01-15',
1,
4,
45,
'',
0.5,
100,
1
);
INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Bo gia',
65000,
'bo_gia.jpg',
'2019-11-23',
1,
4,
45,
'',
0.45,
3,
0
);

 INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Sword Art Online 001 Aincrad',
60000,
'SAO_1.jpg',
'2017-11-01',
1,
6,
50,
'',
0.4,
60,
0
);
 INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Sword Art Online 002 Aincrad',
60000,
'SAO_2.jpg',
'2017-12-01',
1,
6,
50,
'',
0.4,
60,
0
);
 INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Sword Art Online 001 Progressive',
75000,
'SAO_p1.jpg',
'2018-2-01',
1,
6,
50,
'',
0.5,
34,
0
);
 INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Sword Art Online 002 Progressive',
75000,
'SAO_p2.jpg',
'2018-3-01',
1,
6,
50,
'',
0.5,
74,
0
);
 INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Sword Art Online 003 Progressive',
75000,
'SAO_p3.jpg',
'2018-4-01',
1,
6,
50,
'',
0.5,
100,
0
);

 INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Knowledge Encyclopedia Science',
375000,
'encyclopedia.jpg',
'2020-10-01',
1,
5,
20,
'',
0.49,
20,
0
);
 INSERT INTO Products(Name,UnitPrice,Image,ProductDate,Available,CategoryId,Quantity,Description,Discount,ViewCount,Special)
VALUES(
'Human Body',
150000,
'human_body.jpg',
'2020-10-01',
1,
5,
30,
'From the tip of your nose to the top of your toes, 
Human Body by Eyewitness lets your child learn all about how their body works.
Find out how we digest food, how many bones are in the body, how we breathe and what makes us human. 
The Eyewitness reference series is perfect for homework help or school projects.',
0.49,
20,
0
);
---> Insert Customer
INSERT INTO Customers VALUES(
'C1',
'123456789',
'Duyen Trang',
'trangduyen@gmail.com',
'neko.jpg',
1,
0
);
INSERT INTO Customers VALUES(
'C2',
'1234',
'Potts',
'potts@gmail.com',
'default_img.png',
1,
0
);
INSERT INTO Customers VALUES(
'Admin',
'A123',
'Admin',
'trangthanhmaiduyen@gmail.com',
'default_img.png',
1,
1
)
---> Insert Order
INSERT INTO Orders(CustomerId, OrderDate, Address, Amount, Description) VALUES(
'C1',
'2020-03-03',
'Dormitory A, HCM city',
300000,
''
);

INSERT INTO Orders(CustomerId, OrderDate, Address, Amount, Description) VALUES(
'C2',
'2020-03-03',
'Dormitory B, Binh Duong',
830000,
''
);

---> Insert OrderDetail
INSERT INTO OrderDetails(OrderId,ProductId,UnitPrice,Quantity,Discount) VALUES(
200,
1000,
100000,
1,
0.1
);
INSERT INTO OrderDetails(OrderId,ProductId,UnitPrice,Quantity,Discount) VALUES(
200,
6000,
20000,
1,
0
);

INSERT INTO OrderDetails(OrderId,ProductId,UnitPrice,Quantity,Discount) VALUES(
100,
15000,
800000,
1,
0.1
);


SELECT * FROM Categories;
SELECT * FROM Customers;
SELECT * FROM OrderDetails;
SELECT * FROM Orders;
SELECT * FROM Products;