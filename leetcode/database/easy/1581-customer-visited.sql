table: visits
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| visit_id    | int     |
| customer_id | int     |
+-------------+---------+

DROP TABLE IF EXISTS visits;
CREATE TABLE IF NOT EXISTS visits (
	visit_id int,
	customer_id int
);


INSERT INTO visits values(1,23);
INSERT INTO visits values(2,9 );
INSERT INTO visits values(4,30);
INSERT INTO visits values(5,54);
INSERT INTO visits values(6,96);
INSERT INTO visits values(7,54);
INSERT INTO visits values(8,54);

Table: Transactions

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| transaction_id | int     |
| visit_id       | int     |
| amount         | int     |
+----------------+---------+

DROP TABLE IF EXISTS Transactions;
CREATE TABLE IF NOT EXISTS Transactions (
	transaction_id int,
	visit_id int,
	amount int 
);


INSERT INTO Transactions values(2 ,5,310);
INSERT INTO Transactions values(3 ,5,300);
INSERT INTO Transactions values(9 ,5,200);
INSERT INTO Transactions values(12,1,910);
INSERT INTO Transactions values(13,2,970);

select 
	customer_id,
	count(*)
from visits t1 left join Transactions t2 on t1.visit_id = t2.visit_id
where t2.visit_id is null 
group by 1 
order by 2 desc
;