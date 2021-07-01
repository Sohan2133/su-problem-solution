Table: UserVisits
+-------------+------+
| Column Name | Type |
+-------------+------+
| user_id     | int  |
| visit_date  | date |
+-------------+------+
DROP TABLE IF EXISTS UserVisits;
CREATE TABLE IF NOT EXISTS UserVisits (
	user_id int,
	visit_date date
);


INSERT INTO UserVisits values(1,'2020-11-28');
INSERT INTO UserVisits values(1,'2020-10-20');
INSERT INTO UserVisits values(1,'2020-12-3');
INSERT INTO UserVisits values(2,'2020-10-5');
INSERT INTO UserVisits values(2,'2020-12-9');
INSERT INTO UserVisits values(3,'2020-11-11');

First Solution:
--------------------
select 
	user_id,
	max(days)
from 
(
	select
		t1.user_id,
		((case when t2.visit_date is null then '2021-1-1'::date else t2.visit_date end) - t1.visit_date) as days
	from 
		(select 
			*,
			row_number() over(partition by user_id order by visit_date asc) rn 
		from UserVisits) t1 
		left join
		(select 
			*,
			row_number() over(partition by user_id order by visit_date asc) rn 
		from UserVisits) t2 
		on t1.user_id = t2.user_id
		and (t1.rn + 1) = t2.rn
) t
group by 1 
; 

Second Solution(i like it):
-----------------------

select 
	user_id,
	max((case when next_visit is null then '2021-1-1'::date else next_visit end) - visit_date) as max_diff
from 
	(select 
		*,
		lead(visit_date) over(partition by user_id order by visit_date asc) as next_visit
	from UserVisits
	) t 
group by 1
;












