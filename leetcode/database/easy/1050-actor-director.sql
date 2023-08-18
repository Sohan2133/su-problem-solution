ActorDirector table:
+-------------+-------------+-------------+
| actor_id    | director_id | timestamp   |
+-------------+-------------+-------------+
| 1           | 1           | 0           |
| 1           | 1           | 1           |
| 1           | 1           | 2           |
| 1           | 2           | 3           |
| 1           | 2           | 4           |
| 2           | 1           | 5           |
| 2           | 1           | 6           |
+-------------+-------------+-------------+
Question: Find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.
select 
	actor_id,
	director_id
from ActorDirector
group by 1,2
having count(*) >= 3
;