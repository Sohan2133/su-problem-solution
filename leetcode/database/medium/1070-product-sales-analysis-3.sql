Table: Sales

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+

DROP TABLE IF EXISTS Sales;
CREATE TABLE IF NOT EXISTS Sales (
	sale_id int,
	product_id int,
	year int,
	quantity int,
	price int 
);


INSERT INTO Sales values(1, 100, 2008, 10, 5000);
INSERT INTO Sales values(2, 100, 2009, 12, 5000);
INSERT INTO Sales values(2, 100, 2010, 12, 5002);
INSERT INTO Sales values(7, 200, 2011, 15, 9000);


Table: Product 
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+

select 
	product_id, year, quantity, price
from 
	(select 
		*,
		row_number() over(partition by product_id order by year asc) rn 
	from Sales 
	) t1
where rn = 1 

