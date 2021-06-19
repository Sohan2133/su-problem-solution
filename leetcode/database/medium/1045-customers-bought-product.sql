Table: Customer
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| customer_id | int     |
| product_key | int     |
+-------------+---------+

DROP TABLE IF EXISTS Customer;
CREATE TABLE IF NOT EXISTS Customer (
	customer_id int,
	product_key int
);


INSERT INTO Customer values(1, 5);
INSERT INTO Customer values(2, 6);
INSERT INTO Customer values(2, 6);
INSERT INTO Customer values(3, 5);
INSERT INTO Customer values(3, 6);
INSERT INTO Customer values(1, 6);

Table: Product 
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_key | int     |
+-------------+---------+

DROP TABLE IF EXISTS Product;
CREATE TABLE IF NOT EXISTS Product (
	product_key int
);

INSERT INTO Product values(5);
INSERT INTO Product values(6);


select 
	customer_id
from Customer
group by 1 
having count(distinct product_key) = (select count(*) from Product)
;