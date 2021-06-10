+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| article_id    | int     |
| author_id     | int     |
| viewer_id     | int     |
| view_date     | date    |
+---------------+---------+

DROP TABLE IF EXISTS Views;
CREATE TABLE IF NOT EXISTS Views (
	article_id int,
	author_id int,
	viewer_id int,
	activity_date date
);


INSERT INTO Views VALUES(1,3,5,'2019-08-01');
INSERT INTO Views VALUES(1,3,6,'2019-08-02');
INSERT INTO Views VALUES(2,7,7,'2019-08-01');
INSERT INTO Views VALUES(2,7,6,'2019-08-02');
INSERT INTO Views VALUES(4,7,1,'2019-07-22');
INSERT INTO Views VALUES(3,4,4,'2019-07-21');
INSERT INTO Views VALUES(3,4,4,'2019-07-21');

select 
	distinct author_id
from Views 
where author_id = viewer_id
order by author_id asc 