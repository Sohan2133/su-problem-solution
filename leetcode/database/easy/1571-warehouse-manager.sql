Table: Warehouse

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| name         | varchar |
| product_id   | int     |
| units        | int     |
+--------------+---------+

DROP TABLE IF EXISTS Warehouse;
CREATE TABLE IF NOT EXISTS Warehouse (
	name varchar,
	product_id int,
	units int
);


INSERT INTO Warehouse values('LCHouse1',1,1 );
INSERT INTO Warehouse values('LCHouse1',2,10);
INSERT INTO Warehouse values('LCHouse1',3,5 );
INSERT INTO Warehouse values('LCHouse2',1,2 );
INSERT INTO Warehouse values('LCHouse2',2,2 );
INSERT INTO Warehouse values('LCHouse3',4,1 );

Table: product 

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| product_name  | varchar |
| Width         | int     |
| Length        | int     |
| Height        | int     |
+---------------+---------+

DROP TABLE IF EXISTS product;
CREATE TABLE IF NOT EXISTS product (
	product_id int,
	product_name varchar,
	Width int,
	Length int,
	Height int 
);


INSERT INTO product values(1,'LC-TV      ',5,          50,       40 );
INSERT INTO product values(2,'LC-KeyChain',5,          5 ,       5  );
INSERT INTO product values(3,'LC-Phone   ',2,          10,       10 );
INSERT INTO product values(4,'LC-T-Shirt ',4,          10,       20 );

select 
	t1.name,
	sum(Width*Length*Height*units) as volumes
from Warehouse t1 left join product t2 on t1.product_id = t2.product_id
group by 1
order by 1 asc 
;



