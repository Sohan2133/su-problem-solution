+---------+------------+
| student | class      |
+---------+------------+
| A       | Math       |
| B       | English    |
| C       | Math       |
| D       | Biology    |
| E       | Math       |
| F       | Computer   |
| G       | Math       |
| H       | Math       |
| I       | Math       |
+---------+------------+
Question: Find the classes with at least 5 students.

select 
	class
from course 
group by 1 
having count(distinct student) >= 5



---Sohan's solution----

---first solution--
select 
	class
from courses
group by class
having count(distinct student) >=5;


---second solution--

select
     class
from     
(select 
    class,
    count(distinct student) as student_count
from courses
group by class)as t
where student_count>= 5;