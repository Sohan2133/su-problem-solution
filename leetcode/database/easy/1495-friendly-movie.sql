Table: TVProgram

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| program_date  | date    |
| content_id    | int     |
| channel       | varchar |
+---------------+---------+

DROP TABLE IF EXISTS TVProgram;
CREATE TABLE IF NOT EXISTS TVProgram (
	program_date date,
	content_id int,
	name varchar
);

INSERT INTO TVProgram values('2020-06-10 08:00',1,'LC-Channel');
INSERT INTO TVProgram values('2020-05-11 12:00',2,'LC-Channel');
INSERT INTO TVProgram values('2020-05-12 12:00',3,'LC-Channel');
INSERT INTO TVProgram values('2020-05-13 14:00',4,'Disney Ch');
INSERT INTO TVProgram values('2020-06-18 14:00',4,'Disney Ch');
INSERT INTO TVProgram values('2020-07-15 16:00',5,'Disney Ch');

Table: content 
+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| content_id       | varchar |
| title            | varchar |
| Kids_content     | enum    |
| content_type     | varchar |
+------------------+---------+

CREATE TYPE YES_NO as enum('Y', 'N');
DROP TABLE IF EXISTS content;
CREATE TABLE IF NOT EXISTS content (
	content_id int,
	title varchar,
	Kids_content YES_NO,
	content_type varchar
);


INSERT INTO content values(1,'Leetcode Movie','N','Movies');
INSERT INTO content values(2,'Alg. for Kids ','Y','Series');
INSERT INTO content values(3,'Database Sols ','N','Series');
INSERT INTO content values(4,'Aladdin       ','Y','Movies');
INSERT INTO content values(5,'Cinderella    ','Y','Movies');

select 
	distinct title
from content t1 join TVProgram t2 on t1.content_id = t2.content_id
where program_date >= '2020-06-01' 
and program_date < '2020-07-01'
and Kids_content = 'Y'
;
