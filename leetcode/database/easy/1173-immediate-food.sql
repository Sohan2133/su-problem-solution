+-----------------------------+---------+
| Column Name                 | Type    |
+-----------------------------+---------+
| delivery_id                 | int     |
| customer_id                 | int     |
| order_date                  | date    |
| customer_pref_delivery_date | date    |
+-----------------------------+---------
Question: If the customers preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.
Find the percentage of immediate orders in the table, rounded to 2 decimal places.


DROP TABLE IF EXISTS Delivery;
CREATE TABLE IF NOT EXISTS Delivery (
	delivery_id int,
	customer_id int,
	order_date date,
	customer_pref_delivery_date date
);


INSERT INTO Delivery VALUES(1,1,'2019-08-01','2019-08-02');
INSERT INTO Delivery VALUES(2,5,'2019-08-02','2019-08-02');
INSERT INTO Delivery VALUES(3,1,'2019-08-11','2019-08-11');
INSERT INTO Delivery VALUES(4,3,'2019-08-24','2019-08-26');
INSERT INTO Delivery VALUES(5,4,'2019-08-21','2019-08-22');
INSERT INTO Delivery VALUES(6,2,'2019-08-11','2019-08-13');

select 
	round(sum(case when order_date = customer_pref_delivery_date then 1 else 0 end)*100.0/count(*),2)
from Delivery
;