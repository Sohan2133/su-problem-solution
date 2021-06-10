+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| ad_id         | int     |
| user_id       | int     |
| action        | enum    |
+---------------+---------+


DROP TABLE IF EXISTS Ads;
DROP TYPE IF EXISTS actionEnum1;
CREATE TYPE actionEnum1 AS ENUM('Clicked', 'Viewed', 'Ignored');
CREATE TABLE IF NOT EXISTS Ads (
	ad_id int,
	user_id int,
	action actionEnum1
);


INSERT INTO Ads VALUES(1,1 ,'Clicked');
INSERT INTO Ads VALUES(2,2 ,'Clicked');
INSERT INTO Ads VALUES(3,3 ,'Viewed');
INSERT INTO Ads VALUES(5,5 ,'Ignored');
INSERT INTO Ads VALUES(1,7 ,'Ignored');
INSERT INTO Ads VALUES(2,7 ,'Viewed');
INSERT INTO Ads VALUES(3,5 ,'Clicked');
INSERT INTO Ads VALUES(1,4 ,'Viewed');
INSERT INTO Ads VALUES(2,11,'Viewed');
INSERT INTO Ads VALUES(1,2 ,'Clicked');

select 
	ad_id,
	case when click_count = 0 then 0.00 else round(click_count*100.0/(click_count+view_count),2)end as ctr
from 
	(select 
		ad_id,
		sum(case when action='Clicked' then 1 else 0 end) as click_count,
		sum(case when action='Viewed' then 1 else 0 end) as view_count
	from Ads
	group by 1
	)t
order by ctr desc
;