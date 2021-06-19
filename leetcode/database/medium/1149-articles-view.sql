Table: Views

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
	view_date date 
);


INSERT INTO Views values(1, 3, 5, '2019-08-01');
INSERT INTO Views values(3, 4, 5, '2019-08-01');
INSERT INTO Views values(1, 3, 6, '2019-08-02');
INSERT INTO Views values(2, 7, 7, '2019-08-01');
INSERT INTO Views values(2, 7, 6, '2019-08-02');
INSERT INTO Views values(4, 7, 1, '2019-07-22');
INSERT INTO Views values(3, 4, 4, '2019-07-21');
INSERT INTO Views values(3, 4, 4, '2019-07-21');

select 
	distinct id
from 
	(select 
		viewer_id as id,
		view_date
	from Views
	group by 1,2
	having count(distinct article_id) > 1) t 
order by 1 asc 
;


	