Table: Team 
+---------------+----------+
| Column Name   | Type     |
+---------------+----------+
| team_id       | int      |
| team_name     | varchar  |
+---------------+----------+

DROP TABLE IF EXISTS Team;
CREATE TABLE IF NOT EXISTS Team (
	team_id int,
	team_name varchar
);


INSERT INTO Team values(10,'Leetcode FC');
INSERT INTO Team values(20,'NewYork FC ');
INSERT INTO Team values(30,'Atlanta FC ');
INSERT INTO Team values(40,'Chicago FC ');
INSERT INTO Team values(50,'Toronto FC ');

Table: Matches
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| match_id      | int     |
| host_team     | int     |
| guest_team    | int     | 
| host_goals    | int     |
| guest_goals   | int     |
+---------------+---------+

DROP TABLE IF EXISTS Match;
CREATE TABLE IF NOT EXISTS Match (
	match_id int,
	host_team int,
	guest_team int,
	host_goals int,
	guest_goals int 
);


INSERT INTO Match values(1,10, 20, 3, 0);
INSERT INTO Match values(2,30, 10, 2, 2);
INSERT INTO Match values(3,10, 50, 5, 1);
INSERT INTO Match values(4,20, 30, 1, 0);
INSERT INTO Match values(5,50, 30, 1, 0);

select 
	t2.team_id as team_id,
	team_name,
	case when t1.team_id is null then 0 else points end as points
from 
	(select 
		team_id,
		sum(point) as points
	from 
		(select 
			host_team as team_id,
			case when host_goals > guest_goals then 3
				when host_goals = guest_goals then 1 
			else 0 end as point
		from Match
		union all 
		select 
			guest_team as team_id,
			case when guest_goals > host_team then 3 
				when guest_goals = host_goals then 1 
			else 0 end as point
		from Match) t 
	group by team_id) t1 right join Team t2 on t1.team_id = t2.team_id
order by points desc
;



