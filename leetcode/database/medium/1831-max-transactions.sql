Table: Transactions
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| transaction_id | int      |
| day            | datetime |
| amount         | int      |
+----------------+----------+
DROP TABLE IF EXISTS Transactions;
CREATE TABLE IF NOT EXISTS Transactions (
	transaction_id int,
	day timestamp,
	amount int 
);


INSERT INTO Transactions values(8,'2021-4-3 15:57:28',57);
INSERT INTO Transactions values(9,'2021-4-28 08:47:25',21);
INSERT INTO Transactions values(1,'2021-4-29 13:28:30',58);
INSERT INTO Transactions values(5,'2021-4-28 16:39:59',40);
INSERT INTO Transactions values(6,'2021-4-29 23:39:28',58);

First Solution:
---------------------------
select 
	transaction_id 
from 
	(select 
		*,
		rank() over(partition by date(day) order by amount desc) rank
	from Transactions) t 
where rank = 1
order by 1 asc 
;

Second Solution:
-----------------------

select 
	transaction_id 
from Transactions
where (date(day),amount) in 
	(select 
		date(day),
		max(amount)
	from Transactions
	group by 1)
order by 1 asc
;