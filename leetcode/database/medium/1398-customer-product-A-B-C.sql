-- Question 72
-- Table: Customers

-- +---------------------+---------+
-- | Column Name         | Type    |
-- +---------------------+---------+
-- | customer_id         | int     |
-- | customer_name       | varchar |
-- +---------------------+---------+
-- customer_id is the primary key for this table.
-- customer_name is the name of the customer.
 

-- Table: Orders

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | order_id      | int     |
-- | customer_id   | int     |
-- | product_name  | varchar |
-- +---------------+---------+
-- order_id is the primary key for this table.
-- customer_id is the id of the customer who bought the product "product_name".
 

-- Write an SQL query to report the customer_id and customer_name of customers who bought products "A", "B" but did not buy the product "C" since we want to recommend them buy this product.

-- Return the result table ordered by customer_id.

-- The query result format is in the following example.

 

-- Customers table:
-- +-------------+---------------+
-- | customer_id | customer_name |
-- +-------------+---------------+
-- | 1           | Daniel        |
-- | 2           | Diana         |
-- | 3           | Elizabeth     |
-- | 4           | Jhon          |
-- +-------------+---------------+

-- Orders table:
-- +------------+--------------+---------------+
-- | order_id   | customer_id  | product_name  |
-- +------------+--------------+---------------+
-- | 10         |     1        |     A         |
-- | 20         |     1        |     B         |
-- | 30         |     1        |     D         |
-- | 40         |     1        |     C         |
-- | 50         |     2        |     A         |
-- | 60         |     3        |     A         |
-- | 70         |     3        |     B         |
-- | 80         |     3        |     D         |
-- | 90         |     4        |     C         |
-- +------------+--------------+---------------+

-- Result table:
-- +-------------+---------------+
-- | customer_id | customer_name |
-- +-------------+---------------+
-- | 3           | Elizabeth     |
-- +-------------+---------------+
-- Only the customer_id with id 3 bought the product A and B but not the product C.

-- Solution
with t1 as
(
select customer_id
from orders
where product_name = 'B' and
customer_id in (select customer_id
from orders
where product_name = 'A'))

Select t1.customer_id, c.customer_name
from t1 join customers c
on t1.customer_id = c.customer_id
where t1.customer_id != all(select customer_id
from orders
where product_name = 'C')
-------------------------------------------

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







