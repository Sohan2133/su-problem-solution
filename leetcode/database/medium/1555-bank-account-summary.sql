Table:Users 
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| user_id      | int     |
| user_name    | varchar |
| credit       | int     |
+--------------+---------+
DROP TABLE IF EXISTS Users;
CREATE TABLE IF NOT EXISTS Users (
	user_id int,
	name varchar,
	credit int 
);

INSERT INTO Users values(1,'Moustafa', 100  );
INSERT INTO Users values(2,'Jonathan', 200  );
INSERT INTO Users values(3,'Winston ', 10000);
INSERT INTO Users values(4,'Luis    ', 800  );


Table: Transactions
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| trans_id      | int     |
| paid_by       | int     |
| paid_to       | int     |
| amount        | int     |
| transacted_on | date    |
+---------------+---------+

DROP TABLE IF EXISTS Transactions;
CREATE TABLE IF NOT EXISTS Transactions (
	trans_id int,
	paid_by int,
	paid_to int,
	amount int,
	transacted_on date
);


INSERT INTO Transactions values(1, 1, 3, 400, '2020-08-01');
INSERT INTO Transactions values(2, 3, 2, 500, '2020-08-02');
INSERT INTO Transactions values(3, 2, 1, 200, '2020-08-03');

select 
	t2.user_id,
	name,
	(credit + (case when balance is null then 0 else balance end)) as credit,
	case when (credit+ (case when balance is null then 0 else balance end)) >= 0 
				then 'No' else 'Yes' end as credit_balance_breach
from 
	(select 
		user_id,
		sum(amount) as balance
	from 
		(select 
			paid_by as user_id,
			sum(-amount) as amount
		from Transactions
		group by 1
		union 
		select 
			paid_to as user_id,
			sum(amount) as amount
		from Transactions
		group by 1) t 
	group by 1) t1 right join Users t2 on t1.user_id = t2.user_id
;










