Table: DailySales

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| date_id     | date    |
| make_name   | varchar |
| lead_id     | int     |
| partner_id  | int     |
+-------------+---------+

DROP TABLE IF EXISTS DailySales;
CREATE TABLE IF NOT EXISTS DailySales (
	date_id date,
	make_name varchar,
	lead_id int,
	partner_id int 
);




INSERT INTO DailySales values('2020-12-8','toyota', 0, 1);
INSERT INTO DailySales values('2020-12-8','toyota', 1, 0);
INSERT INTO DailySales values('2020-12-8','toyota', 1, 2);
INSERT INTO DailySales values('2020-12-7','toyota', 0, 2);
INSERT INTO DailySales values('2020-12-7','toyota', 0, 1);
INSERT INTO DailySales values('2020-12-8','honda', 1, 2);
INSERT INTO DailySales values('2020-12-8','honda', 2, 1);
INSERT INTO DailySales values('2020-12-7','honda', 0, 1);
INSERT INTO DailySales values('2020-12-7','honda', 1, 2);
INSERT INTO DailySales values('2020-12-7','honda', 2, 1);

select 
	date_id,
	make_name,
	count(distinct lead_id) as lead_id,
	count(distinct partner_id) as partner_id
from DailySales
group by 1,2
order by 2 desc 