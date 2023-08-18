customers:
+------+------+-----------+
| id   | name | referee_id|
+------+------+-----------+
|    1 | Will |      NULL |
|    2 | Jane |      NULL |
|    3 | Alex |         2 |
|    4 | Bill |      NULL |
|    5 | Zack |         1 |
|    6 | Mark |         2 |
+------+------+-----------+
Question: Write an SQL query to report the names of the customer that are not referred by the customer with id = 2.

select 
	name
from customers
where referee_id <> '2' 
or referee_id is null 