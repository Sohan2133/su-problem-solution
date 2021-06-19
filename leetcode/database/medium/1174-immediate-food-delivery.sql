
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


