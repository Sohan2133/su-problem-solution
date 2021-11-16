Table: Trips

DROP TABLE IF EXISTS Trips;
CREATE TABLE IF NOT EXISTS Trips (
	id int,
	Client_Id int,
	Driver_Id int,
	City_Id int,
	Status varchar,
	Request_at date
);



INSERT INTO Trips values(1 ,1 ,10,1,'completed','2013-10-01');
INSERT INTO Trips values(2 ,2 ,11,1,'cancelled_by_driver','2013-10-01');
INSERT INTO Trips values(3 ,3 ,12,6,'completed','2013-10-01');
INSERT INTO Trips values(4 ,4 ,13,6,'cancelled_by_client','2013-10-01');
INSERT INTO Trips values(5 ,1 ,10,1,'completed','2013-10-02');
INSERT INTO Trips values(6 ,2 ,11,6,'completed','2013-10-02');
INSERT INTO Trips values(7 ,3 ,12,6,'completed','2013-10-02');
INSERT INTO Trips values(8 ,2 ,12,1,'completed','2013-10-03');
INSERT INTO Trips values(9 ,3 ,10,1,'completed','2013-10-03');
INSERT INTO Trips values(10,4 ,13,1,'cancelled_by_driver','2013-10-03');

Table: Users 
DROP TABLE IF EXISTS Users;
CREATE TABLE IF NOT EXISTS Users (
	Users_Id int,
	Banned varchar,
	Role varchar
);


INSERT INTO Users values(1 ,'No ','client');
INSERT INTO Users values(2 ,'Yes','client');
INSERT INTO Users values(3 ,'No ','client');
INSERT INTO Users values(4 ,'No ','client');
INSERT INTO Users values(10,'No ','driver');
INSERT INTO Users values(11,'No ','driver');
INSERT INTO Users values(12,'No ','driver');
INSERT INTO Users values(13,'No ','driver');

