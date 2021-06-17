DROP TABLE IF EXISTS Survey_log;
CREATE TABLE IF NOT EXISTS Survey_log (
	id int,
	action varchar,
	question_id int,
	answer_id int, 
	q_num int,
	timestamp int
);


INSERT INTO Survey_log values(5, 'show  ',285, null  , 1, 123);
INSERT INTO Survey_log values(5, 'answer',285, 124124, 1, 124);
INSERT INTO Survey_log values(5, 'show  ',369, null  , 2, 125);
INSERT INTO Survey_log values(5, 'skip  ',369, null  , 2, 126);

select
	question_id
from Survey_log 
group by 1 
order by sum(case when answer_id is not null then 1 else 0 end) * 1.0 / count(*) desc 
limit 1
;