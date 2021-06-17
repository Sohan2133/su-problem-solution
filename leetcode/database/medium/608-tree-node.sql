Table: Tree

DROP TABLE IF EXISTS Tree;
CREATE TABLE IF NOT EXISTS Tree (
	id int,
	p_id int
);


INSERT INTO Tree values(1, null);
INSERT INTO Tree values(2, 1   );
INSERT INTO Tree values(3, 1   );
INSERT INTO Tree values(4, 2   );
INSERT INTO Tree values(5, 2   );


select 
	distinct t1.id,
	case when t1.p_id is null then 'ROOT'
		when t2.id is not null then 'INNER'
	else 'LEAF' end as type
from tree t1 left join tree t2 on t1.id = t2.p_id 
order by 1 asc
;
