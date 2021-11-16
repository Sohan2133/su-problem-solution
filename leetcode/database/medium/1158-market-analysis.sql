-- Question 69
-- Table: Users

-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | user_id        | int     |
-- | join_date      | date    |
-- | favorite_brand | varchar |
-- +----------------+---------+
-- user_id is the primary key of this table.
-- This table has the info of the users of an online shopping website where users can sell and buy items.
-- Table: Orders

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | order_id      | int     |
-- | order_date    | date    |
-- | item_id       | int     |
-- | buyer_id      | int     |
-- | seller_id     | int     |
-- +---------------+---------+
-- order_id is the primary key of this table.
-- item_id is a foreign key to the Items table.
-- buyer_id and seller_id are foreign keys to the Users table.
-- Table: Items

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | item_id       | int     |
-- | item_brand    | varchar |
-- +---------------+---------+
-- item_id is the primary key of this table.
 

-- Write an SQL query to find for each user, the join date and the number of orders they made as a buyer in 2019.

-- The query result format is in the following example:

-- Users table:
-- +---------+------------+----------------+
-- | user_id | join_date  | favorite_brand |
-- +---------+------------+----------------+
-- | 1       | 2018-01-01 | Lenovo         |
-- | 2       | 2018-02-09 | Samsung        |
-- | 3       | 2018-01-19 | LG             |
-- | 4       | 2018-05-21 | HP             |
-- +---------+------------+----------------+

-- Orders table:
-- +----------+------------+---------+----------+-----------+
-- | order_id | order_date | item_id | buyer_id | seller_id |
-- +----------+------------+---------+----------+-----------+
-- | 1        | 2019-08-01 | 4       | 1        | 2         |
-- | 2        | 2018-08-02 | 2       | 1        | 3         |
-- | 3        | 2019-08-03 | 3       | 2        | 3         |
-- | 4        | 2018-08-04 | 1       | 4        | 2         |
-- | 5        | 2018-08-04 | 1       | 3        | 4         |
-- | 6        | 2019-08-05 | 2       | 2        | 4         |
-- +----------+------------+---------+----------+-----------+

-- Items table:
-- +---------+------------+
-- | item_id | item_brand |
-- +---------+------------+
-- | 1       | Samsung    |
-- | 2       | Lenovo     |
-- | 3       | LG         |
-- | 4       | HP         |
-- +---------+------------+

-- Result table:
-- +-----------+------------+----------------+
-- | buyer_id  | join_date  | orders_in_2019 |
-- +-----------+------------+----------------+
-- | 1         | 2018-01-01 | 1              |
-- | 2         | 2018-02-09 | 2              |
-- | 3         | 2018-01-19 | 0              |
-- | 4         | 2018-05-21 | 0              |
-- +-----------+------------+----------------+

-- Solution
select user_id as buyer_id, join_date, coalesce(a.orders_in_2019,0)
from users
left join
(
select buyer_id, coalesce(count(*), 0) as orders_in_2019
from orders o
join users u
on u.user_id = o.buyer_id
where extract('year'from order_date) = 2019
group by buyer_id) a
on users.user_id = a.buyer_id
--------------------------------------------

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








