use lab2;

insert into Student(SSN, Name, Major) values (123, 'Jille Dean', 'Electrical Engineering');
insert into Student(SSN, Name, Major) values (124, 'Bille jean', 'Computer Science');
insert into Student(SSN, Name, Major) values (125, 'Billy Bob', 'Biology');
insert into Student(SSN, Name, Major) values (126, 'Barbie Beanie', 'Biology');

insert into Course(CourseNumber, PrerequisiteCourseNumber, CourseTitle, NumberUnits) values (5101, NULL , 'Intro to EE', 4);
insert into Course(CourseNumber, PrerequisiteCourseNumber, CourseTitle, NumberUnits) values (5111, NULL , 'Intro to EE Lab', 1);
insert into Course(CourseNumber, PrerequisiteCourseNumber, CourseTitle, NumberUnits) values (5102, 5101 , 'Intro to EE 2', 4);
insert into Course(CourseNumber, PrerequisiteCourseNumber, CourseTitle, NumberUnits) values (4101, NULL , 'Intro to CS', 4);
insert into Course(CourseNumber, PrerequisiteCourseNumber, CourseTitle, NumberUnits) values (3101, NULL , 'Intro to Bio', 4);
insert into Course(CourseNumber, PrerequisiteCourseNumber, CourseTitle, NumberUnits) values (2101, NULL , 'Intro to Math', 4);
insert into Course(CourseNumber, PrerequisiteCourseNumber, CourseTitle, NumberUnits) values (2102, 2101 , 'Intro to Statistics', 4);
insert into Course(CourseNumber, PrerequisiteCourseNumber, CourseTitle, NumberUnits) values (2103, 2101 , 'Intro to Calculus', 4);

insert into Section(CourseNumber, Quarter,  RoomNumber, DayTime) values (5101, 'Fall2018', 1, 'MW 2:00PM-4:00PM');
insert into Section(CourseNumber, Quarter,  RoomNumber, DayTime) values (5111, 'Fall2018', 5, 'MW 2:00PM-4:00PM');
insert into Section(CourseNumber, Quarter,  RoomNumber, DayTime) values (5102, 'Fall2018', 4, 'MW 2:00PM-4:00PM');
insert into Section(CourseNumber, Quarter,  RoomNumber, DayTime) values (4101, 'Fall2018', 2, 'MW 2:00PM-4:00PM');
insert into Section(CourseNumber, Quarter,  RoomNumber, DayTime) values (3101, 'Fall2018', 3, 'MW 2:00PM-4:00PM');
insert into Section(CourseNumber, Quarter,  RoomNumber, DayTime) values (2101, 'Fall2018', 6, 'MW 2:00PM-4:00PM');
insert into Section(CourseNumber, Quarter,  RoomNumber, DayTime) values (5101, 'Spring2019', 1, 'MW 2:00PM-4:00PM');
insert into Section(CourseNumber, Quarter,  RoomNumber, DayTime) values (5102, 'Spring2019', 4, 'MW 2:00PM-4:00PM');
insert into Section(CourseNumber, Quarter,  RoomNumber, DayTime) values (4101, 'Spring2019', 2, 'MW 2:00PM-4:00PM');
insert into Section(CourseNumber, Quarter,  RoomNumber, DayTime) values (3101, 'Spring2019', 3, 'MW 2:00PM-4:00PM');
insert into Section(CourseNumber, Quarter,  RoomNumber, DayTime) values (3101, 'Fall2019', 3, 'MW 2:00PM-4:00PM');

insert into Enrollment(SSN,CourseNumber, Quarter, Grade) values (123, 5101, 'Fall2018', NULL);
insert into Enrollment(SSN,CourseNumber, Quarter, Grade) values (123, 5111, 'Fall2018', 'A');
insert into Enrollment(SSN,CourseNumber, Quarter, Grade) values (123, 5102, 'Fall2018', NULL);
insert into Enrollment(SSN,CourseNumber, Quarter, Grade) values (124, 4101, 'Fall2018', NULL);
insert into Enrollment(SSN,CourseNumber, Quarter, Grade) values (126, 3101, 'Fall2018', 'A');
insert into Enrollment(SSN,CourseNumber, Quarter, Grade) values (125, 3101, 'Fall2018', NULL);
insert into Enrollment(SSN,CourseNumber, Quarter, Grade) values (123, 5101, 'Spring2019', 'A');
insert into Enrollment(SSN,CourseNumber, Quarter, Grade) values (123, 5102, 'Spring2019', 'A');
insert into Enrollment(SSN,CourseNumber, Quarter, Grade) values (124, 4101, 'Spring2019', 'B');
insert into Enrollment(SSN,CourseNumber, Quarter, Grade) values (125, 3101, 'Spring2019', 'C');
insert into Enrollment(SSN,CourseNumber, Quarter, Grade) values (125, 3101, 'Fall2019', NULL);
insert into Enrollment(SSN,CourseNumber, Quarter, Grade) values (123, 2101, 'Fall2018', NULL);
insert into Enrollment(SSN,CourseNumber, Quarter, Grade) values (124, 2101, 'Fall2018', NULL);
insert into Enrollment(SSN,CourseNumber, Quarter, Grade) values (125, 2101, 'Fall2018', NULL);