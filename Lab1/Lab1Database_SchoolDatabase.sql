create database lab1;

use lab1;

CREATE TABLE Teacher (
    CourseN INT,
    Quarter VARCHAR(15),
    TeacherName VARCHAR(30) NOT NULL,
    PRIMARY KEY (CourseN , Quarter)
);

CREATE TABLE Course (
    CourseN INT,
    CourseName VARCHAR(30) NOT NULL,
    Nunit INT NOT NULL,
    PRIMARY KEY (CourseN),
    FOREIGN KEY (CourseN)
        REFERENCES Teacher (CourseN)
);

CREATE TABLE LocationNTime (
    CourseN INT,
    Quarter VARCHAR(15),
    DayTime VARCHAR(30),
    RoomN INT NOT NULL,
    PRIMARY KEY (CourseN , Quarter , DayTime),
    FOREIGN KEY (CourseN, Quarter)
        REFERENCES Teacher (CourseN, Quarter)
);

CREATE TABLE Student (

    studentName VARCHAR(30),
    CourseN INT,
    Quarter VARCHAR(15),
    PRIMARY KEY (studentName , CourseN , Quarter),
    FOREIGN KEY (CourseN, Quarter)
        REFERENCES Teacher (CourseN, Quarter)
);

select TeacherName
from Teacher, LocationNTime
where RoomN = 34 AND Quarter = 'Winter2011'
