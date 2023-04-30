-- View To Show All Questions
Create View Show_All_Questions As
Select * from ExamContent.Questions;

select * from Show_All_Questions;
----------------------------------------------------------------------------------------------
-- View To Show All Instructor Who is Teached Courses
Create View Show_Instructor_Courses As
select I.Ins_name , C.Crs_name
from Members.Instructor I , ITI.Course C , Members.Instructor_Courses IC
where IC.Crs_id = C.Crs_id and IC.Ins_id = I.Ins_id ;

select * from Show_Instructor_Courses;
----------------------------------------------------------------------------------------------
-- View To Show All Branches with Intake and Tracks 
Create View Show_Class As
select B.Branch_name , T.Track_name , I.Intake_name
from ITI.Class C , ITI.Branch B , ITI.Track T , ITI.Intake I
where C.Branch_id = B.Branch_id and C.Track_id = T.Track_id and C.Intake_id = I.Intake_id;

select * from Show_Class;





----------------------------------------------------------------------------------------------
alter View Show_Result As
select CONCAT(' Student : ' , St.Std_firstname + St.Std_lastname + ' has Success In Exam With degree =  ' + CAST(S.Degree as NVARCHAR(10))  ) as 'Report'
from ExamContent.Student_Exams S , Members.Student St , ExamContent.Exams E
where S.Std_id = St.Std_id and S.Ex_id = E.Ex_id  and S.Degree > E.Ex_degree/2
Union
select CONCAT(' Student : ' , St.Std_firstname + St.Std_lastname + ' has Faild In Exam With degree =  ' + CAST(S.Degree as NVARCHAR(10))  ) as 'Report'
from ExamContent.Student_Exams S , Members.Student St , ExamContent.Exams E
where S.Std_id = St.Std_id and S.Ex_id = E.Ex_id  and S.Degree < E.Ex_degree/2 ;

select * from Show_Result;





