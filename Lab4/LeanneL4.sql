CREATE DATABASE sys;
USE sys;
CREATE TABLE Trip ( 
TripNumber INT   NOT NULL,
StartLocationName VARCHAR(20), 
DestinationName VARCHAR(20),
PRIMARY KEY( TripNumber)
);
DROP TABLE IF EXISTS Bus;
CREATE TABLE Bus ( 
BusID INT  PRIMARY KEY  NOT NULL,
 Model VARCHAR(20),
 Year INT );
DROP TABLE IF EXISTS Driver;
CREATE TABLE Driver( 
DriverName VARCHAR(50)  NOT NULL, 
DriverTelephoneNumber VARCHAR(10),
PRIMARY KEY(DriverName)
);
 DROP TABLE IF EXISTS Stop;
CREATE TABLE Stop (
StopNumber INT PRIMARY KEY  NOT NULL, 
StopAddress VARCHAR(50)
);

DROP TABLE IF EXISTS ActualTripStopInfo;
 CREATE TABLE ActualTripStopInfo (
 TripNumber INT  NOT NULL, 
 Date DATE   NOT NULL, 
 ScheduledStartTime TIME  NOT NULL, 
 StopNumber INT  NOT NULL, 
ScheduledArrivalTime TIME, 
 ActualStartTime TIME, 
 ActualArrivalTime TIME,
 NumberOfPassengerIn INT, 
 NumberOfPassengerOut INT,
 PRIMARY KEY ( TripNumber, Date, ScheduledStartTime, StopNumber),
 FOREIGN KEY (TripNumber,Date,ScheduledStartTime) REFERENCES TripOffering (TripNumber,Date ,ScheduledStartTime) 
 );
 

 CREATE TABLE TripOffering(
TripNumber INT ,
 Date DATE,
 ScheduledStartTime TIME,
 SecheduledArrivalTime TIME,
DriverName VARCHAR(50),
 BusID INT,
 PRIMARY KEY (TripNumber, Date, ScheduledStartTime),
FOREIGN KEY(DriverName)  REFERENCES Driver(DriverName),
 FOREIGN KEY(TripNumber) REFERENCES Trip(TripNumber),
 FOREIGN KEY(BusID) REFERENCES Bus(BusID)
 );
 
 CREATE TABLE TripStopInfo ( 
 TripNumber INT  NOT NULL, 
 StopNumber INT  NOT NULL, 
 SequenceNumber INT, 
 DrivingTime TIME,
 PRIMARY KEY ( TripNumber,StopNumber),
 FOREIGN KEY (TripNumber) REFERENCES Trip (TripNumber),
 FOREIGN KEY (StopNumber) REFERENCES Stop (StopNumber )
 );
 
 select *
 from Driver;
 
 select *
 from Bus;
 
 insert into Trip(TripNumber, StartLocationName, DestinationName) values (1, "Pomona", "Los Angeles");