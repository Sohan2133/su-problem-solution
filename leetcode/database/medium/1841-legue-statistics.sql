Table: Teams 
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| team_id        | int     |
| team_name      | varchar |
+----------------+---------+
DROP TABLE IF EXISTS Teams;
CREATE TABLE IF NOT EXISTS Teams (
	team_id int,
	team_name varchar
);

INSERT INTO Teams values(1,'Ajax    ');
INSERT INTO Teams values(4,'Dortmund');
INSERT INTO Teams values(6,'Arsenal ');

Table: Matches
+-----------------+---------+
| Column Name     | Type    |
+-----------------+---------+
| home_team_id    | int     |
| away_team_id    | int     |
| home_team_goals | int     |
| away_team_goals | int     |
+-----------------+---------+
DROP TABLE IF EXISTS Matches;
CREATE TABLE IF NOT EXISTS Matches (
	home_team_id int,
	away_team_id int,
	home_team_goals int,
	away_team_goals int 
);

INSERT INTO Matches values(1,4,0,1);
INSERT INTO Matches values(1,6,3,3);
INSERT INTO Matches values(4,1,5,2);
INSERT INTO Matches values(6,1,0,0);

First Solution:
----------------------
select 
	team_name,
	sum(match_played) as match_played,
	sum(points) as points,
	sum(goal_for) as goal_for,
	sum(goal_agganist) as goal_agganist,
	(sum(goal_for) - sum(goal_agganist)) as goal_diff
from 
	((select 
		home_team_id as team_id,
		count(*) as match_played,
		sum(case when home_team_goals > away_team_goals then 3 
			when home_team_goals = away_team_goals then 1 
		else 0 end) as points,
		sum(home_team_goals) as goal_for,
		sum(away_team_goals) as goal_agganist
	from Matches
	group by 1) 
	union all 
	(select 
		away_team_id as team_id,
		count(*) as match_played,
		sum(case when away_team_goals > home_team_goals then 3 
			when home_team_goals = away_team_goals then 1 
		else 0 end) as points,
		sum(away_team_goals) as goal_for,
		sum(home_team_goals) as goal_agganist
	from Matches
	group by 1)) t1 join Teams t2 on t1.team_id = t2.team_id 
group by 1 
order by 6 desc, 1 asc 
;

Second Solution (I like it):
-------------------------------
select 
	team_name,
	count(*),
	sum(points) as points,
	sum(goal_for) as goal_for,
	sum(goal_agganist) as goal_agganist,
	sum(goal_for - goal_agganist) as goal_diff
from 
	(select 
		t1.team_id,
		t1.team_name,
		(case when t1.team_id = home_team_id and home_team_goals > away_team_goals then 3
			when t1.team_id = home_team_id and home_team_goals = away_team_goals then 1 
			when t1.team_id = away_team_id and away_team_goals > home_team_goals then 3
			when t1.team_id = away_team_id and away_team_goals = home_team_goals then 1 
		else 0 end) as points,
		case when t1.team_id = home_team_id then home_team_goals else away_team_goals end as goal_for,
		case when t1.team_id = home_team_id then away_team_goals else home_team_goals end as goal_agganist
	from Teams t1 join Matches t2 
	on t1.team_id = t2.home_team_id or t1.team_id = t2.away_team_id) t 
group by 1 
order by 6 desc, 1 asc 
;















