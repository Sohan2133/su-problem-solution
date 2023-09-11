Table: Playback
+-------------+------+
| Column Name | Type |
+-------------+------+
| session_id  | int  |
| customer_id | int  |
| start_time  | int  |
| end_time    | int  |
+-------------+------+
---write an SQL query to report all the sessions that did not get shown any aids---
DROP TABLE IF EXISTS Playback;
CREATE TABLE IF NOT EXISTS Playback (
	session_id int,
	customer_id int,
	start_time int,
	end_time int 
);



INSERT INTO Playback values(1, 1, 1 , 5 );
INSERT INTO Playback values(2, 1, 15, 23);
INSERT INTO Playback values(3, 2, 10, 12);
INSERT INTO Playback values(4, 2, 17, 28);
INSERT INTO Playback values(5, 2, 2 , 8 );

Table : Ads
+-------------+------+
| Column Name | Type |
+-------------+------+
| ad_id       | int  |
| customer_id | int  |
| timestamp   | int  |
+-------------+------+

DROP TABLE IF EXISTS Ads;
CREATE TABLE IF NOT EXISTS Ads (
	ad_id int,
	customer_id int,
	timestamp int 
);



INSERT INTO Ads values(1, 1, 5 );
INSERT INTO Ads values(2, 2, 17);
INSERT INTO Ads values(3, 2, 20);

select 
	distinct session_id
from Playback t1 left join Ads t2 on t1.customer_id = t2.customer_id
where (t1.start_time > timestamp or t1.end_time < timestamp)
or t2.customer_id is null
;
----Sohan's Solution---
select	
	distinct session_id
from playback p left join Ads a on p.customer_id=a.customer_id
And a.timestamp BETWEEN p.start_time AND p.end.time
where a.customer_id is null;

