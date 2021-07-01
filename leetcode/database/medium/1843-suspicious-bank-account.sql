Table : Accounts
+----------------+------+
| Column Name    | Type |
+----------------+------+
| account_id     | int  |
| max_income     | int  |
+----------------+------+
DROP TABLE IF EXISTS Accounts;
CREATE TABLE IF NOT EXISTS Accounts (
	account_id int,
	max_income int 
);

INSERT INTO Accounts values(3,21000);
INSERT INTO Accounts values(4,10400);

Table: Transactions
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| transaction_id | int      |
| account_id     | int      |
| type           | ENUM     |
| amount         | int      |
| day            | datetime |
+----------------+----------+
DROP TABLE IF EXISTS Transactions;
CREATE TABLE IF NOT EXISTS Transactions (
	transaction_id int, 
	account_id int,
	type varchar,
	amount int,
	day timestamp
);


INSERT INTO Transactions values(2 ,3,'Creditor',107100,'2021-06-02 11:38:14');
INSERT INTO Transactions values(4 ,4,'Creditor',10400 ,'2021-06-20 12:39:18');
INSERT INTO Transactions values(11,4,'Debtor  ',58800 ,'2021-07-23 12:41:55');
INSERT INTO Transactions values(1 ,4,'Creditor',49300 ,'2021-05-03 16:11:04');
INSERT INTO Transactions values(15,3,'Debtor  ',75500 ,'2021-05-23 14:40:20');
INSERT INTO Transactions values(10,3,'Creditor',102100,'2021-06-15 10:37:16');
INSERT INTO Transactions values(14,4,'Creditor',56300 ,'2021-07-21 12:12:25');
INSERT INTO Transactions values(19,4,'Debtor  ',101100,'2021-05-09 15:21:49');
INSERT INTO Transactions values(8 ,3,'Creditor',64900 ,'2021-07-26 15:09:56');
INSERT INTO Transactions values(7 ,3,'Creditor',90900 ,'2021-06-14 11:23:07');

This is incomplete
-------------------------

select 
	account_id,
	extract(month from day),
	row_number() over(partition by account_id order by day asc) as rn 

from Transactions t1 join Accounts t2 on t1.account_id = t2.account_id
where type = 'Creditor'
and amount > max_income