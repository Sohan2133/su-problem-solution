+----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+

CREATE TABLE IF NOT EXISTS Employee(
    Id int PRIMARY KEY, 
    Name VARCHAR(100),
    Salary int,
    ManagerId int
);

INSERT INTO Employee(Id, Name, Salary, ManagerId) VALUES(1,'Joe'  ,70000 ,3  );
INSERT INTO Employee(Id, Name, Salary, ManagerId) VALUES(2,'Henry',80000 ,4 );
INSERT INTO Employee(Id, Name, Salary, ManagerId) VALUES(3,'Sam'  ,60000 ,NULL  );
INSERT INTO Employee(Id, Name, Salary, ManagerId) VALUES(4,'Max'  ,90000 ,NULL);


select 
	t1.Name as Name
from Employee t1 left join Employee t2 
on t1.ManagerId = t2.Id 
where t1.Salary > t2.Salary;
