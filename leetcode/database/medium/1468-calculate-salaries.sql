Table: Salaries
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| company_id    | int     |
| employee_id   | int     |
| employee_name | varchar |
| salary        | int     |
+---------------+---------+

DROP TABLE IF EXISTS Salaries;
CREATE TABLE IF NOT EXISTS Salaries (
	company_id int,
	employee_id int,
	employee_name varchar,
	salary int
);


INSERT INTO Salaries values(1, 1, 'Tony    ', 2000 );
INSERT INTO Salaries values(1, 2, 'Pronub  ', 21300);
INSERT INTO Salaries values(1, 3, 'Tyrrox  ', 10800);
INSERT INTO Salaries values(2, 1, 'Pam     ', 300  );
INSERT INTO Salaries values(2, 7, 'Bassem  ', 450  );
INSERT INTO Salaries values(2, 9, 'Hermione', 700  );
INSERT INTO Salaries values(3, 7, 'Bocaben ', 100  );
INSERT INTO Salaries values(3, 2, 'Ognjen  ', 2200 );
INSERT INTO Salaries values(3, 1, 'Nyancat    ',3300 );
INSERT INTO Salaries values(3, 1, 'Morninngcat',1866 );




select 
	t1.company_id,
	employee_id,
	employee_name,
	salary - (salary*tax)::integer as salary
from Salaries t1 join 
	(select 
		company_id,
		case when max_salary < 1000 then 0
			when max_salary >= 1000 and max_salary <= 10000 then .24
		else .49 end as tax 
	from 
		(select 
			company_id,
			max(salary) as max_salary
		from Salaries
		group by 1
		) t 
	) t2 
using (company_id)
order by 1,2
;