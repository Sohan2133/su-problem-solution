| id | name | sex | salary |
|----|------|-----|--------|
| 1  | A    | m   | 2500   |
| 2  | B    | f   | 1500   |
| 3  | C    | m   | 5500   |
| 4  | D    | f   | 500    |

Question: Write an SQL query to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) 
with a single update statement and no intermediate temporary tables

DROP TABLE IF EXISTS salary;
CREATE TABLE IF NOT EXISTS salary (
	id int, 
	name varchar(100), 
	sex varchar(100), 
	salary int
);


INSERT INTO salary(id, name, sex, salary) values(1,'A','m',2500);
INSERT INTO salary(id, name, sex, salary) values(2,'B','f',1500);
INSERT INTO salary(id, name, sex, salary) values(3,'C','m',5500);
INSERT INTO salary(id, name, sex, salary) values(4,'D','f',500 );

Bad solution:
-----------------------------
update salary set sex = 'mf' where sex = 'm';
update salary set sex = 'fm' where sex = 'f';

update salary set sex = 'f' where sex = 'mf';
update salary set sex = 'm' where sex = 'fm';

Better solution:
-----------------------
update salary set sex = (case when sex = 'm' then 'f' else 'm' end);



----SOHAN'S SOLUTION---
update
salary
set sex=(case when sex='f' then 'm' else 'f' end);