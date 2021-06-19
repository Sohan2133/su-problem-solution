Table: Users 
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| user_id        | int     |
| join_date      | date    |
| favorite_brand | varchar |
+----------------+---------+

DROP TABLE IF EXISTS Users;
CREATE TABLE IF NOT EXISTS Users (
	user_id int,
	join_date date,
	favorite_brand varchar
);


INSERT INTO Users values(1, '2018-01-01', 'Lenovo ');
INSERT INTO Users values(2, '2018-02-09', 'Samsung');
INSERT INTO Users values(3, '2018-01-19', 'LG     ');
INSERT INTO Users values(4, '2018-05-21', 'HP    ');

Table: Orders 
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| order_date    | date    |
| item_id       | int     |
| buyer_id      | int     |
| seller_id     | int     |
+---------------+---------+

DROP TABLE IF EXISTS Orders;
CREATE TABLE IF NOT EXISTS Orders (
	order_id int,
	order_date date,
	item_id int,
	buyer_id int,
	seller_id int 
);


INSERT INTO Orders values(1, '2019-08-01', 4, 1, 2);
INSERT INTO Orders values(2, '2018-08-02', 2, 1, 3);
INSERT INTO Orders values(3, '2019-08-03', 3, 2, 3);
INSERT INTO Orders values(4, '2018-08-04', 1, 4, 2);
INSERT INTO Orders values(5, '2018-08-04', 1, 3, 4);
INSERT INTO Orders values(6, '2019-08-05', 2, 2, 4);

Table: Item 
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| item_id       | int     |
| item_brand    | varchar |
+---------------+---------+
DROP TABLE IF EXISTS Item;
CREATE TABLE IF NOT EXISTS Item (
	item_id int,
	item_brand varchar
);


INSERT INTO Item values(1,'Samsung');
INSERT INTO Item values(2,'Lenovo ');
INSERT INTO Item values(3,'LG     ');
INSERT INTO Item values(4,'HP     ');

select 
	user_id,
	case when count is null then 0 else count end as c 
from Users t1 left join 
	(select 
		buyer_id,
		count(*) as count 
	from Orders
	where extract(year from order_date) = 2019
	group by 1) t2 
on t1.user_id = t2.buyer_id








