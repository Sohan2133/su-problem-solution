Table: Users 
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| account      | int     |
| name         | varchar |
+--------------+---------

DROP TABLE IF EXISTS Users;
CREATE TABLE IF NOT EXISTS Users (
	account int,
	name varchar
);

INSERT INTO Users values(900001,'Alice  ');
INSERT INTO Users values(900002,'Bob    ');
INSERT INTO Users values(900003,'Charlie');

Table: Transactions
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| trans_id      | int     |
| account       | int     |
| amount        | int     |
| transacted_on | date    |
+---------------+---------+

DROP TABLE IF EXISTS Transactions;
CREATE TABLE IF NOT EXISTS Transactions (
	trans_id int,
	account int,
	amount int,
	transacted_on date
);


INSERT INTO Transactions values(1,900001,7000 ,'2020-08-01');
INSERT INTO Transactions values(2,900001,7000 ,'2020-09-01');
INSERT INTO Transactions values(3,900001,-3000,'2020-09-02');
INSERT INTO Transactions values(4,900002,1000 ,'2020-09-12');
INSERT INTO Transactions values(5,900003,6000 ,'2020-08-07');
INSERT INTO Transactions values(6,900003,6000 ,'2020-09-07');
INSERT INTO Transactions values(7,900003,-4000,'2020-09-11');

select 
	name,
	balance
from (select 
		account,
		sum(amount) as balance
	from Transactions
	group by 1
	having sum(amount) > 10000) t1 join Users t2
	on t1.account = t2.account
