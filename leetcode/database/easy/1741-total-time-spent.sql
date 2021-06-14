| Column Name | Type |
+-------------+------+
| emp_id      | int  |
| event_day   | date |
| in_time     | int  |
| out_time    | int  |
+-------------+------+


select 
	emp_id,
	event_day,
	sum(out_time - in_time) as time_spent
from employee
group by 1,2