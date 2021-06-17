Table Score:
+----+-------+
| Id | Score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |

DROP TABLE IF EXISTS Score;
CREATE TABLE IF NOT EXISTS Score (
	id int,
	score float
);


INSERT INTO Score values(1, 3.50);
INSERT INTO Score values(2, 3.65);
INSERT INTO Score values(3, 4.00);
INSERT INTO Score values(4, 3.85);
INSERT INTO Score values(5, 4.00);
INSERT INTO Score values(6, 3.65);

select 
	score,
	dense_rank() over(order by score desc) as rank 
from Score
order by score desc 
;