use lab2;

select Student.Name, Student.SSN, COUNT(CourseNumber) AS NumberOfCoursesTaken # problem 1
from Student, Enrollment
where Student.SSN = Enrollment.SSN
group by Student.Name;

select Student.Name, Student.SSN, COUNT(distinct CourseNumber) AS NumberOfCoursesTaken # problem 2
from Student, Enrollment
where Student.SSN = Enrollment.SSN
group by Student.Name;

select Student.Name, Student.SSN, count(CourseNumber) as NumberOfCoursesTakenAndCompleted #problem 3
from Student, Enrollment
where Student.SSN = Enrollment.SSN AND Grade is not null
group by Student.Name;

select Student.Name, Student.SSN, count(CourseNumber) as NumberOfCoursesTakenAndCompleted #problem 4
from Student, Enrollment
where Student.SSN = Enrollment.SSN AND (Grade = 'C' or Grade = 'B' or Grade = 'A')
group by Student.Name;

select CourseTitle, CourseNumber #problem 5
from Course
where PrerequisiteCourseNumber is null;

SELECT #problem 6
    Name, Student.SSN
FROM
    Student,
    Enrollment
WHERE
    Student.SSN = Enrollment.SSN and Grade is not null
group by Grade, Name
HAVING Grade = 'A';
        
SELECT #problem 7
    S.Name, S.SSN, A.CourseNumber
FROM
    Student AS S,
    Enrollment AS A,
    Enrollment AS B,
    Enrollment AS C
WHERE
    S.SSN = A.SSN AND S.SSN = B.SSN
        AND S.SSN = C.SSN
        AND A.CourseNumber = B.CourseNumber
        AND B.CourseNumber = C.CourseNumber
        AND A.Quarter != B.Quarter
        AND C.Quarter != B.Quarter
        AND A.Quarter != C.Quarter
GROUP BY S.Name;

select Name, Student.SSN, Enrollment.Quarter, count(Enrollment.SSN) #problem 8
from Student, Enrollment
where Student.SSN = Enrollment.SSN
group by Enrollment.Quarter, Name;

select Name, Student.SSN #problem 9
from Student, Enrollment
where Student.SSN = Enrollment.SSN
group by Name
having Count(Enrollment.CourseNumber) <= 1;

select Name, Student.SSN, count(Enrollment.SSN) as NumberOfCoursesTaken, count(Enrollment.Grade) as NumberOfCoursesCompleted #problem 10
from Student, Enrollment
where Student.SSN = Enrollment.SSN
group by Name;

select distinct A.CourseNumber, A.CourseTitle # problem 11
from Course as A, Course as B
where A.PrerequisiteCourseNumber = B.PrerequisiteCourseNumber and A.CourseTitle != B.CourseTitle;

SELECT #problem 12
    Name, Student.SSN
FROM
    Student
WHERE
    Student.SSN NOT IN (SELECT DISTINCT
            Enrollment.SSN
        FROM
            Enrollment
        WHERE
            COALESCE(Grade, 'X') <> 'A');

SELECT #problem 13
    Name, Student.SSN
FROM
    Student,
    Enrollment
WHERE
     Student.SSN = Enrollment.SSN
group by Grade
having Grade != 'A';


SELECT DISTINCT #problem 14
    Name, Major
FROM
    Student,
    Section,
    Enrollment
WHERE
    Student.SSN = Enrollment.SSN
        AND NOT EXISTS( SELECT 
            S.DayTime
        FROM
            Section AS S,
            Enrollment AS E
        WHERE
            S.CourseNumber = E.CourseNumber
                AND S.DayTime NOT IN (SELECT 
                    SS.DayTime
                FROM
                    Section AS SS
                WHERE
                    SS.DayTime LIKE 'MW%PM%'));

SELECT DISTINCT #problem 15
    Name, Major
FROM
    Student,
    Section,
    Enrollment
WHERE
    Student.SSN = Enrollment.SSN
        AND NOT EXISTS( SELECT 
            S.DayTime
        FROM
            Section AS S
        WHERE
            S.DayTime LIKE 'MW%PM%'
                AND S.DayTime NOT IN (SELECT 
                    SS.DayTime
                FROM
                    Section AS SS,
                    Enrollment AS EE
                WHERE
                    SS.CourseNumber = EE.CourseNumber));

select distinct Name, Major #problem 16
from Student, Section, Enrollment
where Student.SSN = Enrollment.SSN and Section.CourseNumber = Enrollment.CourseNumber and DayTime not like "MW%PM%"; 

SELECT #problem 17
    CourseNumber, Quarter
FROM
    Enrollment
group by Quarter
having
    COUNT(Enrollment.SSN) >= ALL (SELECT 
            COUNT(Enrollment.SSN)
        FROM
            Student as S,
            Enrollment as E
        WHERE
            S.SSN = E.SSN);

SELECT #problem 18
    CourseNumber, Quarter
FROM
    Enrollment
having
    COUNT(Enrollment.SSN) >= ALL (SELECT 
            COUNT(Enrollment.SSN)
        FROM
            Student,
            Enrollment
        WHERE
            Student.SSN = Enrollment.SSN);
            
select A.Name, A.Major #problem 19
from Student as A, Enrollment, Course
where A.SSN = Enrollment.SSN and Enrollment.CourseNumber = Course.CourseNumber
group by Major
having sum(Course.NumberUnits) >= all(select sum(Course.NumberUnits)
from Student, Enrollment, Course
where Student.SSN = Enrollment.SSN and Enrollment.CourseNumber = Course.CourseNumber and A.Major = Student.Major);

select B.CourseTitle #problem 20
from Course as A, Course as B
having count(A.PrerequisiteCourseNumber = B.CourseNumber) >= all(select count(C.PrerequisiteCourseNumber = D.CourseNumber)
from Course as C, Course as D) 
