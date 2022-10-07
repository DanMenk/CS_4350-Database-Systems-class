use lab1;

(SELECT # problem 1
    DISTINCT TeacherName
FROM
    Teacher,
    LocationNTime
WHERE
    LocationNTime.RoomN = 34
        AND LocationNTime.Quarter = 'Winter2011'
        AND LocationNTime.Quarter = Teacher.Quarter
        AND LocationNTime.CourseN = Teacher.CourseN);
        
SELECT *
from Teacher;

(SELECT # problem 2
    DISTINCT Course.CourseN, CourseName, TeacherName
FROM
    Course, Teacher, LocationNTime
WHERE
    DayTime LIKE 'M%PM'
    and LocationNTime.Quarter = Teacher.Quarter
            and LocationNTime.CourseN = Course.CourseN);

SELECT Course.*, DayTime
from Course, LocationNTime;

(SELECT # problem 3
    DISTINCT TeacherName
FROM
    Teacher,
    LocationNTime
WHERE
    LocationNTime.RoomN = 723
        AND LocationNTime.CourseN = Teacher.CourseN);
        
SELECT *
from Teacher;

(SELECT # problem 4
    Distinct Teacher.CourseN, Teacher.Quarter, RoomN, DayTime
FROM
    Teacher,
    Course,
    LocationNTime
WHERE
    TeacherName = 'Karen Reed'
    AND Teacher.Quarter = 'Spring2005'
    AND LocationNTime.Quarter = Teacher.Quarter
        AND LocationNTime.CourseN = Teacher.CourseN);
        
SELECT *
from Teacher;

(SELECT # problem 5
    Student.CourseN, TeacherName
FROM
    Teacher,
    Student
WHERE
    (studentName = 'Ron Smith'
    AND
    Student.CourseN = Teacher.CourseN
    and
    Student.Quarter = Teacher.Quarter
    )
    or
    (
    studentName = 'David Weidman'
    AND
    Student.CourseN = Teacher.CourseN
    and
    Student.Quarter = Teacher.Quarter
    ));
        
SELECT *
from Student;

(SELECT # problem 6
   Teacher.CourseN, Teacher.Quarter
FROM
    Teacher,
    LocationNTime
WHERE
    (TeacherName = 'Karen Reed'
    AND
    RoomN = 713
    and
    LocationNTime.Quarter = Teacher.Quarter
        AND LocationNTime.CourseN = Teacher.CourseN
    )
    );
        
SELECT *
from LocationNTime;

(SELECT #problem 7
    distinct TeacherName
FROM
    Teacher AS A
WHERE
    (SELECT 
            count(*)
        FROM
            Teacher
        WHERE
            A.CourseN = CourseN) >= 2);
        
SELECT *
from Teacher;

(SELECT #problem 8
    distinct TeacherName
FROM
    Teacher AS A
WHERE
    (SELECT 
            count(*)
        FROM
            Teacher
        WHERE
            A.TeacherName = TeacherName
            and A.CourseN != CourseN) >= 1);
        
SELECT *
from Teacher;

(SELECT #problem 9
   distinct LocationNTime.CourseN, CourseName, LocationNTime.Quarter
FROM
    LocationNTime, Course, Teacher
WHERE
    (SELECT 
            count(*)
        FROM
            LocationNTime
        WHERE
            DayTime LIKE '%,%'
            ) >= 1
            and LocationNTime.Quarter = Teacher.Quarter
            and LocationNTime.CourseN = Course.CourseN);
        
SELECT *
from Course;

(SELECT #problem 10
   distinct CourseN, CourseName
FROM
    Course
WHERE
    Nunit > 4);
        
SELECT *
from Course;

(SELECT #problem 11
   distinct CourseN, studentName
FROM
    Student as A
WHERE
    (SELECT 
            count(*)
        FROM
            Student
        WHERE
            A.studentName = studentName
            and A.CourseN = CourseN
            and A.Quarter != Quarter) >= 1);
        
SELECT *
from Student;

(SELECT #problem 12
   Course.*, LocationNTime.Quarter, TeacherName
FROM
    Course, Teacher, LocationNTime
where
	Course.CourseN = Teacher.CourseN
    and
    Course.CourseN = LocationNTime.CourseN
    and
    Teacher.CourseN = LocationNTime.CourseN
    and Teacher.Quarter = LocationNTime.Quarter
ORDER BY CourseN asc, CourseName desc);

(SELECT #problem 13
   distinct LocationNTime.CourseN, LocationNTime.Quarter
FROM
    Teacher as A, LocationNTime
where
	(select count(*)
    from teacher
    where A.CourseN = CourseN
    and A.TeacherName != TeacherName
    and A.Quarter = Quarter) >= 1
ORDER BY CourseN desc);