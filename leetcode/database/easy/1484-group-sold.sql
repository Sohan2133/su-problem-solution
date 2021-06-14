Table: Activities
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| sell_date   | date    |
| product     | varchar |
+-------------+---------+

DROP TABLE IF EXISTS Activities;
CREATE TABLE IF NOT EXISTS Activities (
	sell_date date,
	product varchar
);


INSERT INTO Activities values('2020-05-30','Headphone');
INSERT INTO Activities values('2020-06-01','Pencil   ');
INSERT INTO Activities values('2020-06-02','Mask     ');
INSERT INTO Activities values('2020-05-30','Basketbal');
INSERT INTO Activities values('2020-06-01','Bible    ');
INSERT INTO Activities values('2020-06-02','Mask     ');
INSERT INTO Activities values('2020-05-30','T-Shirt  ');


select 
	sell_date,
	count(distinct product),
	string_agg(distinct product, ',') as products
from Activities
group by 1 