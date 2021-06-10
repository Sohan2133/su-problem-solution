+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| start_date    | date    |
| end_date      | date    |
| price         | int     |
+---------------+---------+

DROP TABLE IF EXISTS prices;
CREATE TABLE IF NOT EXISTS prices (
	product_id int,
	start_date date,
	end_date date,
	price int 
);

INSERT INTO prices VALUES(1,'2019-02-17','2019-02-28',5 );
INSERT INTO prices VALUES(1,'2019-03-01','2019-03-22',20);
INSERT INTO prices VALUES(2,'2019-02-01','2019-02-20',15);
INSERT INTO prices VALUES(2,'2019-02-21','2019-03-31',30);

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| purchase_date | date    |
| units         | int     |
+---------------+---------+

DROP TABLE IF EXISTS unitsSold;
CREATE TABLE IF NOT EXISTS unitsSold (
	product_id int,
	purchase_date date,
	units int 
);

INSERT INTO unitsSold VALUES(1,'2019-02-25',100);
INSERT INTO unitsSold VALUES(1,'2019-03-01',15 );
INSERT INTO unitsSold VALUES(2,'2019-02-10',200);
INSERT INTO unitsSold VALUES(2,'2019-03-22',30 );

select 
	t2.product_id,
	round(sum(units*price)*1.0/sum(units), 2)
from prices t1, unitsSold t2 
where t2.purchase_date >= start_date and t2.purchase_date <= end_date
and t2.product_id = t1.product_id
group by 1 
;
