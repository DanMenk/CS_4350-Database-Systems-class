create database lab4;
use lab4;

CREATE TABLE Trip (
    TripNumber INT,
    StartLocationName VARCHAR(50) NOT NULL,
    DestinationName VARCHAR(50) NOT NULL,
    PRIMARY KEY (TripNumber)
);

CREATE TABLE TripOffering (
    TripNumber INT,
    Date DATE,
    ScheduledStartTime TIME,
    ScheduledArrivalTime TIME NOT NULL,
    DriverName VARCHAR(30) NOT NULL,
    BusID INT NOT NULL,
    PRIMARY KEY (TripNumber , Date , ScheduledStartTime),
    FOREIGN KEY (TripNumber)
        REFERENCES Trip (TripNumber)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (BusID)
        REFERENCES Bus (BusID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (DriverName)
        REFERENCES Driver (DriverName)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Bus (
    BusID INT,
    Model VARCHAR(30) NOT NULL,
    Year YEAR,
    PRIMARY KEY (BusID)
);

CREATE TABLE Driver (
    DriverName VARCHAR(30),
    DriverTelephoneNumber INT(10) NOT NULL,
    PRIMARY KEY (DriverName)
);

CREATE TABLE Stop (
    StopNumber INT,
    StopAddress VARCHAR(50),
    PRIMARY KEY (StopNumber)
);

CREATE TABLE ActualTripStopInfo (
    TripNumber INT,
    Date DATE,
    ScheduledStartTime TIME,
    StopNumber INT,
    ScheduledArrivalTime TIME NOT NULL,
    ActualStartTime TIME NOT NULL,
    ActualArrivalTime TIME NOT NULL,
    NumberOfPassengerIn INT NOT NULL,
    NumberOfPassengerOut INT NOT NULL,
    PRIMARY KEY (TripNumber , Date , ScheduledStartTime , StopNumber),
    FOREIGN KEY (TripNumber, Date, ScheduledStartTime)
        REFERENCES TripOffering (TripNumber, Date, ScheduledStartTime)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (StopNumber)
        REFERENCES Stop (StopNumber)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TripStopInfo (
    TripNumber INT,
    StopNumber INT,
    SequenceNumber INT,
    DrivingTime DOUBLE,
    PRIMARY KEY (TripNumber , StopNumber),
    FOREIGN KEY (TripNumber)
        REFERENCES Trip (TripNumber)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (StopNumber)
        REFERENCES Stop (StopNumber)
        ON DELETE CASCADE ON UPDATE CASCADE
);

select *
from Bus;

select *
from Driver;

select *
from Trip;

select *
from TripOffering;

select *
from ActualTripStopInfo;