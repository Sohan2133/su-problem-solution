Products
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| store       | enum    |
| price       | int     |
+-------------+---------+

DROP TABLE IF EXISTS Products;
CREATE TABLE IF NOT EXISTS Products (
	product_id int,
	store varchar,
	price int 
);



INSERT INTO Products values(0, 'store1', 95 );
INSERT INTO Products values(0, 'store3', 105);
INSERT INTO Products values(0, 'store2', 100);
INSERT INTO Products values(1, 'store1', 70 );
INSERT INTO Products values(1, 'store3', 80 );

select 
	product_id,
	sum(case when store = 'store1' then price else 0 end) as store1,
	sum(case when store = 'store2' then price else 0 end) as store2,
	sum(case when store = 'store3' then price else 0 end) as store3
from Products
group by product_id