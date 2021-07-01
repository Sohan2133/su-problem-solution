Table: LogInfo
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| account_id  | int      |
| ip_address  | int      |
| login       | datetime |
| logout      | datetime |
+-------------+----------+

DROP TABLE IF EXISTS LogInfo;
CREATE TABLE IF NOT EXISTS LogInfo (
	account_id int,
	ip_address int,
	login timestamp,
	logout timestamp
);


INSERT INTO LogInfo values(1, 1 ,'2021-02-01 09:00:00','2021-02-01 09:30:00');
INSERT INTO LogInfo values(1, 2 ,'2021-02-01 08:00:00','2021-02-01 11:30:00');
INSERT INTO LogInfo values(2, 6 ,'2021-02-01 20:30:00','2021-02-01 22:00:00');
INSERT INTO LogInfo values(2, 7 ,'2021-02-02 20:30:00','2021-02-02 22:00:00');
INSERT INTO LogInfo values(3, 9 ,'2021-02-01 16:00:00','2021-02-01 16:59:59');
INSERT INTO LogInfo values(3, 13,'2021-02-01 17:00:00','2021-02-01 17:59:59');
INSERT INTO LogInfo values(4, 10,'2021-02-01 16:00:00','2021-02-01 17:00:00');
INSERT INTO LogInfo values(4, 11,'2021-02-01 17:00:00','2021-02-01 17:59:59');


select 
	t1.account_id
from LogInfo t1 join LogInfo t2 on t1.account_id = t2.account_id
where t1.ip_address != t2.ip_address
and t2.login >= t1.login and t2.login <= t1.logout
;