DRop DATABASE Hotel;
CREATE DATABASE Hotel;
use Hotel;

CREATE TABLE Hotel (
  Hotel_id INT NOT NULL PRIMARY KEY,
  Hotel_name VARCHAR(45) NULL,
  country VARCHAR(45) NULL,
  NO_Room INT NULL,
  Employee_id INT NOT NULL
  );
  select * from Hotel;
  
CREATE TABLE Employees (
  Employee_id INT NOT NULL PRIMARY KEY,
  Employee_name VARCHAR(45) NULL,
  phone INT NULL
  );  
  select * from Employees;
  
CREATE TABLE Reservations (
  Reservations_id INT NOT NULL PRIMARY KEY,
  start_book DATE NULL,
  end_book DATE NULL,
  Room_id INT NOT NULL,
  Hotel_id INT NOT NULL,
  gest_id INT NOT NULL
  );  
  select * from Reservations;
  
  CREATE TABLE Room (
  Room_id INT NOT NULL PRIMARY KEY,
  No_Beds INT NULL,
  Price INT NULL
  );
  select * from Room;
  
CREATE TABLE Bill (
  Bill_id INT NOT NULL PRIMARY KEY,
  Room_charge INT NULL,
  Room_id INT NOT NULL,
  gest_id INT NOT NULL
  );
  select * from Bill;

 CREATE TABLE Gests (
  gest_id INT NOT NULL PRIMARY KEY,
  gest_name varchar(45) NULL,
  phone INT NULL,
  country varchar(45) NULL
  ); 
  select * from Gests;
  
  alter table Hotel add foreign key (Employee_id) references Employees(Employee_id);
  alter table Reservations add foreign key (Room_id) references Room(Room_id);
  alter table Reservations add foreign key (Hotel_id) references Hotel(Hotel_id);
  alter table Reservations add foreign key (gest_id) references Gests(gest_id);
  alter table Bill add foreign key (Room_id) references Room(Room_id);
  alter table Bill add foreign key (gest_id) references Gests(gest_id);
  
  
  
   Insert into Employees Values (101, "Manar", 01065215120);
   Insert into Employees Values (102, "Menna", 01265219227);
   Insert into Employees Values (103, "Habiba", 01065218977);
   Insert into Employees Values (104, "Yomna", 01265218977);
   Insert into Employees Values (105, "Fatama", 01141879777);
   Insert into Hotel Values (1, "Alex", "Egypt" , 25 , 101);
   Insert into Hotel Values (2, "Sanhor", "Egypt" , 40 , 104);
   Insert into Hotel Values (3, "cairo", "Egypt" , 15 , 102);
   Insert into Hotel Values (4, "tanta", "Egypt" , 10 , 103);
   Insert into Hotel Values (5, "monofia", "Egypt" , 36 , 105);
   Insert into Gests Values (10001, "Manar Yasser", 01298745210 , "Egypt");
   Insert into Gests Values (10002, "Manal Mohammed", 01154237891 , "London");
   Insert into Gests Values (10003, "Yassmeen Fathy", 01198745621 , "Katar");
   Insert into Gests Values (10004, "Haidy Alaa", 01064789330 , "Amrica");
   Insert into Gests Values (10005, "Howida Saad",01269442320 , "Holanda");
   Insert into Room Values (1001, 2 , 500);
   Insert into Room Values (1002, 5 , 2000);
   Insert into Room Values (1003, 2 , 1000);
   Insert into Room Values (1004, 3 , 1500);
   Insert into Bill Values (2001, 7000 , 1002, 10003);
   Insert into Bill Values (2002, 5000 , 1001, 10001);
   Insert into Bill Values (2003, 2000 , 1003, 10005);
   Insert into Bill Values (2004, 6000 , 1004, 10003);
   Insert into Reservations Values (30001, "2020/05/9" , "2020/05/11", 1002, 4, 10004);
   Insert into Reservations Values (30002, "2020/03/17" , "2020/03/27", 1001, 2, 10005);
   Insert into Reservations Values (30003, "2020/04/19" , "2020/04/20", 1004, 1, 10003);
   Insert into Reservations Values (30004, "2019/11/19" , "2019/11/25", 1003, 3, 10001);
     /*select statements*/
  select Hotel_name, NO_Room from Hotel;
  select distinct Country from Hotel;
  select count(distinct Country) from Hotel;
  select * from Room where Price > 500 ;
  select * from Bill where Room_charge = 6000 AND gest_id = 10003;
  select * from Bill where Room_charge = 6000 OR gest_id = 10003;
  SELECT * FROM gests WHERE NOT Country='Egypt';
  SELECT MIN(Price) AS lowestPrice FROM Room;
  SELECT MAX(Price) AS Expen_Price FROM Room;
  select * from Reservations limit 3;
  SELECT * FROM Room where price BETWEEN 1000 AND 2000;
  select * FROM Room WHERE Price NOT BETWEEN 1000 AND 2000;
  SELECT * FROM Reservations
  WHERE start_book BETWEEN "2020/1/1" AND "2020/5/5"
  ORDER BY start_book;
  SELECT AVG(Price) FROM room;
  SELECT SUM(Room_charge) FROM Bill;
  select * from Employees;
  SELECT * FROM Hotel WHERE Hotel_name IN ("Alex", "tanta", "cairo");
  SELECT * FROM Hotel WHERE Hotel_name NOT IN ("Alex", "tanta", "cairo");
  SELECT * FROM Employees
  WHERE Employee_name LIKE "m%";
  SELECT * FROM Employees
  WHERE Employee_name LIKE "%m";
    /* Select Statements using Sub Query*/
  SELECT * FROM Reservations WHERE Hotel_id IN (SELECT MIN(Hotel_id) FROM  Hotel); 
  select * from room where room_id > any (select bill_id from bill where Room_charge >1000 );
  SELECT Reservations_id FROM Reservations WHERE gest_id IN (SELECT Max(gest_id) FROM gests); 
  /*Select Statements using Count and Group	*/
  SELECT COUNT(Hotel_id), Country
  FROM Hotel
  GROUP BY Country;
  
  SELECT COUNT(Bill_id), gest_id
  FROM Bill
  GROUP BY gest_id;
   /* Select Statements using Different Joins*/
  SELECT Hotel.hotel_id , employees.employee_id , employees.Employee_name
  FROM Hotel
  INNER JOIN employees ON Hotel.employee_id=employees.employee_id;
  SELECT Reservations.Reservations_id , Hotel.country , Hotel.NO_Room
  FROM Reservations
  cross JOIN Hotel ON Reservations.Hotel_id=Hotel.Hotel_id;
  SELECT Bill.Bill_id , Room.Room_id , Room.Price
  FROM Bill
  left JOIN Room ON Bill.Room_id=Room.Room_id;
  SELECT Hotel.hotel_id , employees.employee_id , employees.Employee_name
  FROM Hotel
  right JOIN employees ON Hotel.employee_id=employees.employee_id;
  
  SELECT Reservations.Reservations_id , Gests.gest_id , Gests.gest_name
  FROM Reservations
  LEFT JOIN Gests ON Reservations.gest_id = Gests.gest_id
  UNION 
  SELECT Reservations.Reservations_id , Gests.gest_id , Gests.gest_name
  FROM Reservations
  RIGHT JOIN Gests ON Reservations.gest_id = Gests.gest_id;
  
    /* Insert Statement */
  Insert into employees (Employee_id , phone)
  values (106 , 01062178942);
  
  insert into Hotel (Hotel_id , NO_Room ,Employee_id )
  values (6, 30 , 106);
  
  INSERT INTO Gests (gest_id, gest_name)
  VALUES (10006, "Shaza Mohsen");
  
  INSERT INTO Room (room_id, price )
  VALUES (1005, 2500);
  
  INSERT INTO Bill (Bill_id, Room_id , gest_id )
  VALUES (2005, 1005 , 10006);
  /* Update Statement*/
  UPDATE Reservations
  SET end_book = "2020/4/22"
  WHERE gest_id = 10003 ;
  
  UPDATE Room
  SET Price = 1000
  WHERE Room_id = 1001 ;
  
  UPDATE employees
  SET Employee_name = "Malak"
  WHERE Employee_id = 103 ;
  
  UPDATE Bill
  SET Room_charge = 12000
  WHERE gest_id = 10003 ;
  
  UPDATE Hotel
  SET NO_Room = 20
  WHERE Hotel_id = 3 ;
  /* Delete Statement*/
  delete from reservations where gest_id = 10003;
  delete from hotel where hotel_id = 1;
  delete from Employees where Employee_id= 101 ;
  delete from bill where Bill_id = 2004;
  delete from Room where room_id = 1004;
