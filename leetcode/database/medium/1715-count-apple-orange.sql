Table: Boxes
+--------------+------+
| Column Name  | Type |
+--------------+------+
| box_id       | int  |
| chest_id     | int  |
| apple_count  | int  |
| orange_count | int  |
+--------------+------+
DROP TABLE IF EXISTS Boxes;
CREATE TABLE IF NOT EXISTS Boxes (
	box_id int,
	chest_id int,
	apple_count int,
	orange_count int
);


INSERT INTO Boxes values(2 ,null, 6 , 15);
INSERT INTO Boxes values(18,14  , 4 , 15);
INSERT INTO Boxes values(19,3   , 8 , 4 );
INSERT INTO Boxes values(12,2   , 19, 20);
INSERT INTO Boxes values(20,6   , 12, 9 );
INSERT INTO Boxes values(8 ,6   , 9 , 9 );
INSERT INTO Boxes values(3 ,14  , 16, 7 );

Table: Chests 
+--------------+------+
| Column Name  | Type |
+--------------+------+
| chest_id     | int  |
| apple_count  | int  |
| orange_count | int  |
+--------------+------+
DROP TABLE IF EXISTS Chests;
CREATE TABLE IF NOT EXISTS Chests (
	chest_id int,
	apple_count int,
	orange_count int 
);

INSERT INTO Chests values(6  , 5 , 6 );
INSERT INTO Chests values(14 , 20, 10);
INSERT INTO Chests values(2  , 8 , 8 );
INSERT INTO Chests values(3  , 19, 4 );
INSERT INTO Chests values(16 , 19, 19);

select 
	sum(t1.apple_count + (case when t2.apple_count is null then 0 else t2.apple_count end)) as apple_count,
	sum(t1.orange_count + (case when t2.orange_count is null then 0 else t2.orange_count end)) as orange_count
from Boxes t1 left join Chests t2 using(chest_id)
;
