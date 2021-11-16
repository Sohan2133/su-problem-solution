-- Question 65
-- Table: Events

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | business_id   | int     |
-- | event_type    | varchar |
-- | occurences    | int     | 
-- +---------------+---------+
-- (business_id, event_type) is the primary key of this table.
-- Each row in the table logs the info that an event of some type occured at some business for a number of times.
 

-- Write an SQL query to find all active businesses.

-- An active business is a business that has more than one event type with occurences greater than the average occurences of that event type among all businesses.

-- The query result format is in the following example:

-- Events table:
-- +-------------+------------+------------+
-- | business_id | event_type | occurences |
-- +-------------+------------+------------+
-- | 1           | reviews    | 7          |
-- | 3           | reviews    | 3          |
-- | 1           | ads        | 11         |
-- | 2           | ads        | 7          |
-- | 3           | ads        | 6          |
-- | 1           | page views | 3          |
-- | 2           | page views | 12         |
-- +-------------+------------+------------+

-- Result table:
-- +-------------+
-- | business_id |
-- +-------------+
-- | 1           |
-- +-------------+ 
-- Average for 'reviews', 'ads' and 'page views' are (7+3)/2=5, (11+7+6)/3=8, (3+12)/2=7.5 respectively.
-- Business with id 1 has 7 'reviews' events (more than 5) and 11 'ads' events (more than 8) so it is an active business.

-- Solution


Table: Events
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| business_id   | int     |
| event_type    | varchar |
| occurences    | int     | 
+---------------+---------+

DROP TABLE IF EXISTS Events;
CREATE TABLE IF NOT EXISTS Events (
	business_id int,
	event_type varchar,
	occurences int
);


INSERT INTO Events values(1,'reviews   ', 7);
INSERT INTO Events values(3,'reviews   ', 3);
INSERT INTO Events values(1,'ads       ', 11);
INSERT INTO Events values(2,'ads       ', 7);
INSERT INTO Events values(3,'ads       ', 6);
INSERT INTO Events values(1,'page views', 3);
INSERT INTO Events values(2,'page views', 1);

First Solution:
----------------------------

select 
	distinct business_id
from 
	(select 
		event_type,
		avg(occurences) avg_occ
	from Events
	group by 1 
	having count(*) > 1) t1 join Events t2
on t1.event_type = t2.event_type and t1.avg_occ < t2.occurences
;         

Second Solution:
----------------------------
select 
	business_id
from 
	(select 
		*,
		avg(occurences) over(partition by event_type) as avg_occ
	from Events) t 
where occurences > avg_occ
group by business_id
having count(*) > 1
;
