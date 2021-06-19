Table: Transactions 
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| country       | varchar |
| state         | enum    |
| amount        | int     |
| trans_date    | date    |
+---------------+---------+
DROP TABLE IF EXISTS Transactions;
CREATE TABLE IF NOT EXISTS Transactions (
	id int,
	country varchar,
	state varchar,
	amount int,
	trans_date date 
);


INSERT INTO Transactions values(121,'US','approved',1000,'2018-12-18');
INSERT INTO Transactions values(122,'US','declined',2000,'2018-12-19');
INSERT INTO Transactions values(123,'US','approved',2000,'2019-01-01');
INSERT INTO Transactions values(124,'DE','approved',2000,'2019-01-07');


select 
	country,
	substring(trans_date::varchar, 0, 8) as month,
	count(*) as total_tran,
	sum(case when state = 'approved' then 1 else 0 end) as total_approved,
	sum(case when state = 'approved' then 1 else 0 end) as total_approved_count,
	sum(case when state = 'approved' then amount else 0 end) as total_approved_amount
from Transactions
group by 1,2
;
