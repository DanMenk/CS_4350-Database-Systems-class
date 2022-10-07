create database lab2;
use lab2;
create table Student (
SSN INT,
Name varchar(30) NOT NULL,
Major varchar(30),
primary key (SSN));

create table Course (
CourseNumber INT,
PrerequisiteCourseNumber INT,
CourseTitle varchar(30) NOT NULL,
NumberUnits int NOT NULL,
primary key(CourseNumber));

create table Section (
CourseNumber INT,
Quarter varchar(15),
RoomNumber int,
DayTime varchar(20) NOT NULL,
primary key (CourseNumber, Quarter),
foreign key (CourseNumber) references Course(CourseNumber));

create table Enrollment (
SSN int,
CourseNumber int,
Quarter varchar(15),
Grade char(1),
primary key (SSN, CourseNumber, Quarter),
foreign key (SSN) references Student(SSN),
foreign key (CourseNumber, Quarter) references Section(CourseNumber, Quarter)); 
