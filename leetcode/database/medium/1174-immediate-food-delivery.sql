-- Question 82
-- Table: Delivery

-- +-----------------------------+---------+
-- | Column Name                 | Type    |
-- +-----------------------------+---------+
-- | delivery_id                 | int     |
-- | customer_id                 | int     |
-- | order_date                  | date    |
-- | customer_pref_delivery_date | date    |
-- +-----------------------------+---------+
-- delivery_id is the primary key of this table.
-- The table holds information about food delivery to customers that make orders at some date and specify a preferred delivery date (on the same order date or after it).
 

-- If the preferred delivery date of the customer is the same as the order date then the order is called immediate otherwise it's called scheduled.

-- The first order of a customer is the order with the earliest order date that customer made. It is guaranteed that a customer has exactly one first order.

-- Write an SQL query to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.

-- The query result format is in the following example:

-- Delivery table:
-- +-------------+-------------+------------+-----------------------------+
-- | delivery_id | customer_id | order_date | customer_pref_delivery_date |
-- +-------------+-------------+------------+-----------------------------+
-- | 1           | 1           | 2019-08-01 | 2019-08-02                  |
-- | 2           | 2           | 2019-08-02 | 2019-08-02                  |
-- | 3           | 1           | 2019-08-11 | 2019-08-12                  |
-- | 4           | 3           | 2019-08-24 | 2019-08-24                  |
-- | 5           | 3           | 2019-08-21 | 2019-08-22                  |
-- | 6           | 2           | 2019-08-11 | 2019-08-13                  |
-- | 7           | 4           | 2019-08-09 | 2019-08-09                  |
-- +-------------+-------------+------------+-----------------------------+

-- Result table:
-- +----------------------+
-- | immediate_percentage |
-- +----------------------+
-- | 50.00                |
-- +----------------------+
-- The customer id 1 has a first order with delivery id 1 and it is scheduled.
-- The customer id 2 has a first order with delivery id 2 and it is immediate.
-- The customer id 3 has a first order with delivery id 5 and it is scheduled.
-- The customer id 4 has a first order with delivery id 7 and it is immediate.
-- Hence, half the customers have immediate first orders.

-- Solution
select 
round(avg(case when order_date = customer_pref_delivery_date then 1 else 0 end)*100,2) as
immediate_percentage
from 
(select *,
 rank() over(partition by customer_id order by order_date) as rk
from delivery) a
where a.rk=1
------------------------------------------------------------
Table: Delivery 
+-----------------------------+---------+
| Column Name                 | Type    |
+-----------------------------+---------+
| delivery_id                 | int     |
| customer_id                 | int     |
| order_date                  | date    |
| customer_pref_delivery_date | date    |
+-----------------------------+---------+

DROP TABLE IF EXISTS Delivery;
CREATE TABLE IF NOT EXISTS Delivery (
	delivery_id int,
	customer_id int,
	order_date date,
	customer_pref_delivery_date date 
);


INSERT INTO Delivery values(1, 1, '2019-08-01','2019-08-02');
INSERT INTO Delivery values(2, 2, '2019-08-02','2019-08-02');
INSERT INTO Delivery values(3, 1, '2019-08-11','2019-08-12');
INSERT INTO Delivery values(4, 3, '2019-08-24','2019-08-24');
INSERT INTO Delivery values(5, 3, '2019-08-21','2019-08-22');
INSERT INTO Delivery values(6, 2, '2019-08-11','2019-08-13');
INSERT INTO Delivery values(7, 4, '2019-08-09','2019-08-09');

First Solution:
-----------------------

select 
	round(sum(case when order_date = customer_pref_delivery_date then 1 else 0 end)*100.0 / count(*), 2)
from 
	(select 
		*,
		row_number() over(partition by customer_id order by order_date asc) rn
	from Delivery) t 
where rn = 1 
;

Second Solution:
------------------------
select 
	round(sum(case when order_date = customer_pref_delivery_date then 1 else 0 end )*100.0 / count(*),2)
from Delivery 
where (customer_id, order_date) in (
	select 
		customer_id,
		min(order_date) as min_order_date
	from Delivery
	group by 1 
	)
;


