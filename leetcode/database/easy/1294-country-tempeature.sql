+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| country_id    | int     |
| country_name  | varchar |
+---------------+---------+

DROP TABLE IF EXISTS country;
CREATE TABLE IF NOT EXISTS country (
	country_id int,
	country_name varchar
);

INSERT INTO country VALUES(2,'USA');
INSERT INTO country VALUES(3,'Australia');
INSERT INTO country VALUES(7,'Peru');
INSERT INTO country VALUES(5,'China');
INSERT INTO country VALUES(8,'Morocco');
INSERT INTO country VALUES(9,'Spain');

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| country_id    | int     |
| weather_state | varchar |
| day           | date    |
+---------------+---------+

DROP TABLE IF EXISTS weather;
CREATE TABLE IF NOT EXISTS weather(
	country_id int,
	weather_state varchar,
	day date
);


INSERT INTO weather VALUES(2,15,'2019-11-01');
INSERT INTO weather VALUES(2,12,'2019-10-28');
INSERT INTO weather VALUES(2,12,'2019-10-27');
INSERT INTO weather VALUES(3,-2,'2019-11-10');
INSERT INTO weather VALUES(3,0 ,'2019-11-11');
INSERT INTO weather VALUES(3,3 ,'2019-11-12');
INSERT INTO weather VALUES(5,16,'2019-11-07');
INSERT INTO weather VALUES(5,18,'2019-11-09');
INSERT INTO weather VALUES(5,21,'2019-11-23');
INSERT INTO weather VALUES(7,25,'2019-11-28');
INSERT INTO weather VALUES(7,22,'2019-12-01');
INSERT INTO weather VALUES(7,20,'2019-12-02');
INSERT INTO weather VALUES(8,25,'2019-11-05');
INSERT INTO weather VALUES(8,27,'2019-11-15');
INSERT INTO weather VALUES(8,31,'2019-11-25');
INSERT INTO weather VALUES(9,7 ,'2019-10-23');
INSERT INTO weather VALUES(9,3 ,'2019-12-23');

-- The type of weather is Cold if the average weather_state is 
-- less than or equal 15, Hot if the average weather_state is greater than or equal 25
--  and Warm otherwis

select 
	t2.country_name,
	t1.state
from 
	(select 
		country_id,
		case when round(avg(weather_state::integer),2) <= 15 then  'Cold'
			when round(avg(weather_state::integer),2) >= 25 then 'Hot'
			else 'Warm'
		end as state
	from weather
	where day between '2019-11-01' and '2019-11-30'
	group by 1
	) t1 join country t2 on t1.country_id = t2.country_id
;









