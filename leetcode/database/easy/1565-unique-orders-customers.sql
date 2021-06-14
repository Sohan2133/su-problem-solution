Table: Orders


+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| order_date    | date    |
| customer_id   | int     |
| invoice       | int     |
+---------------+---------+

DROP TABLE IF EXISTS Orders;
CREATE TABLE IF NOT EXISTS Orders (
	order_id int,
	order_date date,
	customer_id int,
	invoice int
);


INSERT INTO Orders values(1 ,'2020-09-15',1,30);
INSERT INTO Orders values(2 ,'2020-09-17',2,90);
INSERT INTO Orders values(3 ,'2020-10-06',3,20);
INSERT INTO Orders values(4 ,'2020-10-20',3,21);
INSERT INTO Orders values(5 ,'2020-11-10',1,10);
INSERT INTO Orders values(6 ,'2020-11-21',2,15);
INSERT INTO Orders values(7 ,'2020-12-01',4,55);
INSERT INTO Orders values(8 ,'2020-12-03',4,77);
INSERT INTO Orders values(9 ,'2021-01-07',3,31);
INSERT INTO Orders values(10,'2021-01-15',2,20);


select 
	substring(order_date::varchar, 1,7) as order_date,
	count(*) as order_count,
	count(distinct customer_id) as customer_count
from Orders
where invoice > 20
group by 1