-- Create Schema Member for Students , Instructor 
CREATE SCHEMA Members;

-- Move 4 Tables to schema
ALTER SCHEMA Members TRANSFER dbo.Student;
ALTER SCHEMA Members TRANSFER dbo.Instructor;
ALTER SCHEMA Members TRANSFER dbo.Instructor_Courses;
ALTER SCHEMA Members TRANSFER dbo.Instructor_Classes;

----------------------------------------------------------------------------------------------
-- Create Schema ITI for Intake , Branch , Track , Class , Course 
CREATE SCHEMA ITI;

-- Move 5 Tables to schema
ALTER SCHEMA ITI TRANSFER dbo.Intake;
ALTER SCHEMA ITI TRANSFER dbo.Branch;
ALTER SCHEMA ITI TRANSFER dbo.Track;
ALTER SCHEMA ITI TRANSFER dbo.Class;
ALTER SCHEMA ITI TRANSFER dbo.Course;

----------------------------------------------------------------------------------------------
-- Create Schema ExamContent for Exams , Exam_Questions , ExamQSA , Questions , Student_Exams
CREATE SCHEMA ExamContent;

-- Move 5 Tables to schema
ALTER SCHEMA ExamContent TRANSFER dbo.Exams;
ALTER SCHEMA ExamContent TRANSFER dbo.Exam_Questions;
ALTER SCHEMA ExamContent TRANSFER dbo.ExamQSA;
ALTER SCHEMA ExamContent TRANSFER dbo.Questions;
ALTER SCHEMA ExamContent TRANSFER dbo.Student_Exams;