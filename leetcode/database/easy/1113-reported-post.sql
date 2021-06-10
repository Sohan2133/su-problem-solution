Table : Actions 
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| post_id       | int     |
| action_date   | date    | 
| action        | enum    |
| extra         | varchar |
+---------------+---------+

DROP TABLE IF EXISTS Actions;
DROP TYPE IF EXISTS actionEnum;
CREATE TYPE actionEnum AS ENUM('view', 'like', 'reaction', 'comment', 'report', 'share');
CREATE TABLE IF NOT EXISTS Actions (
	user_id int,
	post_id int,
	action_date date,
	action actionEnum,
	extra varchar(100)
);

INSERT INTO Actions VALUES(1,1,'2019-07-01','view', null);
INSERT INTO Actions VALUES(1,1,'2019-07-01','like', null);
INSERT INTO Actions VALUES(1,1,'2019-07-01','share', null);
INSERT INTO Actions VALUES(2,4,'2019-07-04','view', null);
INSERT INTO Actions VALUES(2,4,'2019-07-04','report', 'spam');
INSERT INTO Actions VALUES(3,4,'2019-07-04','view', null);
INSERT INTO Actions VALUES(3,4,'2019-07-04','report', 'spam'); 
INSERT INTO Actions VALUES(4,3,'2019-07-02','view', null);
INSERT INTO Actions VALUES(4,3,'2019-07-02','report', 'spam'); 
INSERT INTO Actions VALUES(5,2,'2019-07-04','view', null);
INSERT INTO Actions VALUES(5,2,'2019-07-04','report', 'racism');
INSERT INTO Actions VALUES(5,5,'2019-07-04','view', null);
INSERT INTO Actions VALUES(5,5,'2019-07-04','report', 'racism');



select 
	extra,
	count(distinct post_id)
from Actions
where action = 'report'
and extra is not null 
and action_date = '2019-07-04'
group by extra
;