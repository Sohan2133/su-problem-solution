Table: Session 

+---------------------+---------+
| Column Name         | Type    |
+---------------------+---------+
| session_id          | int     |
| duration            | int     |
+---------------------+---------+

DROP TABLE IF EXISTS Session;
CREATE TABLE IF NOT EXISTS Session (
	session_id int,
	duration int 
);

INSERT INTO Session values(1,30  );
INSERT INTO Session values(2,199 );
INSERT INTO Session values(3,299 );
INSERT INTO Session values(4,580 );
INSERT INTO Session values(5,1000);



-- select 
-- 	bin,
-- 	count(*) as total
-- from 
-- (select 
-- 	case when duration between 0 and 5*60-1 then '[0-5>'
-- 		when duration between 5*60 and 10*60-1 then '5-10>'
-- 		when duration between 10*60 and 15*60-1 then '10-15>'
-- 	else '15 or more'
-- 	end as bin
-- from Session
-- )t
-- group by 1

select '[0-5>' as bin ,count(*) from Session where duration between 0 and 5*60-1
union
select '[5-10>' as bin ,count(*) from Session where duration between 5*60 and 10*60-1
union
select '[10-15>' as bin ,count(*) from Session where duration between 10*60 and 15*60-1
union
select '15 or more' as bin ,count(*) from Session where duration >= 15*60
order by bin asc
;
