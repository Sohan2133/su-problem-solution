Table: Customers
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| name          | varchar |
+---------------+---------+

DROP TABLE IF EXISTS Customers;
CREATE TABLE IF NOT EXISTS Customers (
	customer_id int,
	name varchar
);

INSERT INTO Customers values(1,'Alice');
INSERT INTO Customers values(2,'Bob  ');
INSERT INTO Customers values(3,'Tom  ');
INSERT INTO Customers values(4,'Jerry');
INSERT INTO Customers values(5,'John ');

Table: Orders
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| order_date    | date    |
| customer_id   | int     |
| cost          | int     |
+---------------+---------+

DROP TABLE IF EXISTS Orders;
CREATE TABLE IF NOT EXISTS Orders (
	order_id int,
	order_date date,
	customer_id int,
	product_id int
);


INSERT INTO Orders values(1 ,'2020-07-31',1,1);
INSERT INTO Orders values(2 ,'2020-07-30',2,2);
INSERT INTO Orders values(3 ,'2020-08-29',3,3);
INSERT INTO Orders values(4 ,'2020-07-29',4,1);
INSERT INTO Orders values(5 ,'2020-06-10',1,2);
INSERT INTO Orders values(6 ,'2020-08-01',2,1);
INSERT INTO Orders values(7 ,'2020-08-01',3,3);
INSERT INTO Orders values(8 ,'2020-08-03',1,2);
INSERT INTO Orders values(9 ,'2020-08-07',2,3);
INSERT INTO Orders values(10,'2020-07-15',1,2);

Table: Product
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| product_name  | varchar |
| price         | int     |
+---------------+---------+

DROP TABLE IF EXISTS Product;
CREATE TABLE IF NOT EXISTS Product (
	product_id int,
	product_name varchar,
	price int 
);

INSERT INTO Product values(1,'keyboard ',120);
INSERT INTO Product values(2,'mouse    ',80 );
INSERT INTO Product values(3,'screen   ',600);
INSERT INTO Product values(4,'hard disk',450);


select
	customer_id,
	product_id,
	product_name
from 
(select 
	customer_id,
	product_id,
	rank() over(partition by customer_id order by order_count desc) rank 
from 
	(select 
		customer_id,
		product_id,
		count(*) as order_count
	from Orders
	group by 1,2) t ) t1 join Product t2 using(product_id)
where rank = 1 
;







