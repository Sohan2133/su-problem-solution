Table: Customers
+---------------------+---------+
| Column Name         | Type    |
+---------------------+---------+
| customer_id         | int     |
| customer_name       | varchar |
+---------------------+---------+
DROP TABLE IF EXISTS Customer;
CREATE TABLE IF NOT EXISTS Customer (
	customer_id int,
	customer_name varchar
);


INSERT INTO Customer values(1,'Daniel   ');
INSERT INTO Customer values(2,'Diana    ');
INSERT INTO Customer values(3,'Elizabeth');
INSERT INTO Customer values(4,'Jhon     ');


Table: Orders
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| customer_id   | int     |
| product_name  | varchar |
+---------------+---------+

DROP TABLE IF EXISTS Orders;
CREATE TABLE IF NOT EXISTS Orders (
	order_id int,
	customer_id int,
	product_name varchar
);



INSERT INTO Orders values(10,1,'A');
INSERT INTO Orders values(20,1,'B');
INSERT INTO Orders values(30,1,'D');
INSERT INTO Orders values(40,1,'C');
INSERT INTO Orders values(50,2,'A');
INSERT INTO Orders values(60,3,'A');
INSERT INTO Orders values(70,3,'B');
INSERT INTO Orders values(80,3,'D');
INSERT INTO Orders values(90,4,'C');

First Solution:
----------------------
select 
	customer_id,
	(select customer_name from Customer where customer_id = t.customer_id) as customer_name
from 
	(select 
		customer_id,
		sum(case when product_name = 'A' then 1 else 0 end) as a,
		sum(case when product_name = 'B' then 1 else 0 end) as b,
		sum(case when product_name = 'C' then 1 else 0 end) as c
	from Orders
	group by 1
) t 
where a > 0
and b > 0 
and c = 0
;

Second Solution:
------------------------

select 
	customer_id,
	customer_name
from Customer
where customer_id in (select customer_id from Orders where product_name = 'A')
and customer_id in (select customer_id from Orders where product_name = 'B')
and customer_id not in  (select customer_id from Orders where product_name = 'C')
;







