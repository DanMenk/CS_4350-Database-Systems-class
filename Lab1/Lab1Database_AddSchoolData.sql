use lab1;

insert into Teacher (CourseN, Quarter, TeacherName) values(18, 'Spring2019', 'Joseph Joe');
insert into Course (CourseN, CourseName, Nunit) values(25, 'CS 368', 5);
insert into LocationNTime (CourseN, Quarter, DayTime, RoomN) values(18, 'Spring2019', 'M2:00PM, W2:00PM', '713');
insert into Student (studentName, CourseN, Quarter) values('David Weidman', '18', 'Spring2019');
delete from LocationNTime where CourseN = 47;

select *
from Course;

select *
from Teacher;

select *
from LocationNTime;