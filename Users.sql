---1.create user instructor for Eng_Sarah
create login Eng_Sarah with password = '123';

-- Create a database user associated with the login for Eng_Sarah
USE ExamSystemDB;
create user Eng_Sarah for login Eng_Sarah;

-- Grant the user permissions to Eng_Sarah as an instructor 
--that has the permisions to edit the exam questions and the exam
GRANT update, insert,delete ON Examcontent.exam_questions to Eng_Sarah;
GRANT update, insert,delete ON Examcontent.Exams to Eng_Sarah;
GRANT update, insert,delete ON Examcontent.Questions to Eng_Sarah;
revoke delete,insert,update on schema::ITI to Eng_sarah;
revoke delete,insert,update on schema::Members to Eng_sarah;

go
--2.creating user traing_Manger for Dr_ahmed
create login Dr_Ahmed with password = '123';

-- Create a database user associated with the login for Dr_ahmed
USE ExamSystemDB;
create user Dr_Ahmed for login Dr_Ahmed;

-- Grant the user permissions to Dr_Ahmed as an training manger 
--that has the permisions to edit instuctors,branches,track,
--intake and students
GRANT update, insert,delete ON ITI.Branch to Dr_Ahmed;
GRANT update, insert,delete ON ITI.Intake to Dr_Ahmed;
GRANT update, insert,delete ON ITI.Track to Dr_Ahmed;
GRANT update, insert,delete ON ITI.Course to Dr_Ahmed;
GRANT update, insert,delete ON members.Instructor to Dr_Ahmed;
GRANT update, insert,delete ON members.student to Dr_Ahmed;
GRANT update, insert,delete ON members.Instructor_Classes to Dr_Ahmed;
GRANT update, insert,delete ON members.Instructor_Courses to Dr_Ahmed;
--revoke a user training manager dr-ahmed for making insert ,
--delete update on schema of the exams content
revoke insert,delete,update on Schema::ExamContent to Dr_Ahmed


--3. creating user for Student Zeyad
create login Zeyad with password = '123';
-- Create a database user associated with the login for Student Zeyad
create user Zeyad for login Zeyad;

--we can create the login using Security procudere called SP_ADDLOGIN
--EXEC sp_addlogin 'Zeyad', 'Zeyad123#';  
  