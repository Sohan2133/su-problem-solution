
Table : Department
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| revenue       | int     |
| month         | varchar |
+---------------+---------+
The month has values in ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"].


DROP TABLE IF EXISTS Department;
CREATE TABLE IF NOT EXISTS Department (
	id int,
	revenue int,
	month varchar
);


INSERT INTO Department VALUES(1,8000 ,'Jan');
INSERT INTO Department VALUES(2,9000 ,'Jan');
INSERT INTO Department VALUES(3,10000,'Feb');
INSERT INTO Department VALUES(1,7000 ,'Feb');
INSERT INTO Department VALUES(1,6000 ,'Mar');

select 
	id,
	case when month='Jan' then revenue else null end as Jan_Revenue,
	case when month='Feb' then revenue else null end as Feb_Revenue,
	case when month='Mar' then revenue else null end as Mar_Revenue,
	case when month='Apr' then revenue else null end as Apr_Revenue,
	case when month='May' then revenue else null end as May_Revenue,
	case when month='Jun' then revenue else null end as Jun_Revenue,
	case when month='Jul' then revenue else null end as Jul_Revenue,
	case when month='Aug' then revenue else null end as Aug_Revenue,
	case when month='Sep' then revenue else null end as Sep_Revenue,
	case when month='Oct' then revenue else null end as Oct_Revenue,
	case when month='Nov' then revenue else null end as Nov_Revenue,
	case when month='Dec' then revenue else null end as Dec_Revenue
from Department;