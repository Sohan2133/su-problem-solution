Table: Activity
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| session_id    | int     |
| activity_date | date    |
| activity_type | enum    |
+---------------+---------+


DROP TABLE IF EXISTS Activity;
DROP TYPE IF EXISTS activityEnum;
CREATE TYPE activityEnum AS ENUM('open_session', 'end_session', 'scroll_down', 'send_message');
CREATE TABLE IF NOT EXISTS Activity (
	user_id int,
	session_id int,
	activity_date date,
	activity_type activityEnum
);


INSERT INTO Activity VALUES(1,1,'2019-07-20','open_session');  
INSERT INTO Activity VALUES(1,1,'2019-07-20','scroll_down');     
INSERT INTO Activity VALUES(1,1,'2019-07-20','end_session');     
INSERT INTO Activity VALUES(2,4,'2019-07-20','open_session');    
INSERT INTO Activity VALUES(2,4,'2019-07-21','send_message');    
INSERT INTO Activity VALUES(2,4,'2019-07-21','end_session');    
INSERT INTO Activity VALUES(3,2,'2019-07-21','open_session');    
INSERT INTO Activity VALUES(3,2,'2019-07-21','send_message');    
INSERT INTO Activity VALUES(3,2,'2019-07-21','end_session');     
INSERT INTO Activity VALUES(4,3,'2019-06-25','open_session');    
INSERT INTO Activity VALUES(4,3,'2019-06-25','end_session');

select 
	activity_date,
	count(distinct user_id)
from Activity
where activity_date <= '2019-07-27' 
and activity_date >= (date '2019-07-27' - 29)
and activity_type is not null 
group by 1
;