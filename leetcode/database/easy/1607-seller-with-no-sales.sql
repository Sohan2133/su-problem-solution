Table: Customers
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| customer_name | varchar |
+---------------+---------+

DROP TABLE IF EXISTS Customers;
CREATE TABLE IF NOT EXISTS Customers (
	customer_id int,
	customer_name varchar
);

INSERT INTO Customers values(101,'Alice  ');
INSERT INTO Customers values(102,'Bob    ');
INSERT INTO Customers values(103,'Charlie');

Table: Orders
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| sale_date     | date    |
| order_cost    | int     |
| customer_id   | int     |
| seller_id     | int     |
+---------------+---------+

DROP TABLE IF EXISTS Orders;
CREATE TABLE IF NOT EXISTS Orders (
	order_id int,
	sale_date date,
	order_cost int,
	customer_id int,
	seller_id int 
);


INSERT INTO Orders values(1,'2020-03-01',1500,101,1);
INSERT INTO Orders values(2,'2020-05-25',2400,102,2);
INSERT INTO Orders values(3,'2019-05-25',800 ,101,3);
INSERT INTO Orders values(4,'2020-09-13',1000,103,2);
INSERT INTO Orders values(5,'2019-02-11',700 ,101,2);

Table: Seller 
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| seller_id     | int     |
| seller_name   | varchar |
+---------------+---------+

DROP TABLE IF EXISTS Seller;
CREATE TABLE IF NOT EXISTS Seller (
	seller_id int,
	seller_name varchar
);


INSERT INTO Seller values(1,'Daniel   ');
INSERT INTO Seller values(2,'Elizabeth');
INSERT INTO Seller values(3,'Frank    ');

select 
	seller_name 
from Seller 
where seller_id not in (
	select 
		seller_id
	from Orders 
	where extract(year from sale_date) = 2020
);















