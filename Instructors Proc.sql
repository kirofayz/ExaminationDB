-- Instructor can edit (add, Update and delete) question pool in his course only

-- 1) add
alter PROCEDURE AddQuestion
    @Qid INT ,
    @CourseID INT,
    @QText NVARCHAR(MAX),
    @CorrectAns NVARCHAR(MAX),
    @QType NVARCHAR(50) ,
	@Insid int
AS
BEGIN

Declare @Check int

select @Check = Count(*)
from Members.Instructor_Courses 
where Crs_id = @CourseID and Ins_id = @Insid ;
if @Check = 1
begin
    INSERT INTO ExamContent.Questions
    VALUES (@Qid, @QText, @QType,@CorrectAns,@CourseID);
End
else
print 'No Permision';
END
-------------------------------------------------------------------------------------
-- 2) update
alter PROCEDURE UpdateQuestion
    @QuestionID INT,
	@CourseID INT ,
    @QText NVARCHAR(MAX),
    @CorrectAns NVARCHAR(MAX),
    @QType NVARCHAR(50) ,
	@Insid int
AS
BEGIN
Declare @Check int
select @Check = Count(*)
from Members.Instructor_Courses 
where Crs_id = @CourseID and Ins_id = @Insid ;
if @Check = 1
begin
    UPDATE ExamContent.Questions
    SET Q_text = @QText, Q_CorrectAns = @CorrectAns, Q_type = @QType 
    WHERE Q_id = @QuestionID ;
end
else
print 'No Permision';
END
--------------------------------------------------------------------------------------------
-- 3)delete
	alter PROCEDURE DeleteQuestion
    @QuestionID INT ,
	@CourseID INT ,
	@Insid int

AS
BEGIN
Declare @Check int
select @Check = Count(*)
from Members.Instructor_Courses 
where Crs_id = @CourseID and Ins_id = @Insid ;
if @Check = 1
begin
    DELETE FROM ExamContent.Questions
    WHERE Q_id = @QuestionID
end
else
print 'No Permision';

END

-- Exec
Exec AddQuestion  @Qid = 12 , @CourseID = 4 ,@QText ='kero', @CorrectAns = 'kero',@QType = 'MCQ' ,
	@Insid = 3 ;

--------------------------------------------------------------------------------------------------
-- Instructor can Make Exam
Create Proc AddExam
@Insid int ,
@exid int ,
@ex_year nvarchar(5),
@ex_start datetime ,
@ex_end datetime ,
@ex_degree int ,
@ex_type nvarchar(20),
@ex_cid int
as
begin
Declare @count int
Select @count=COUNT(I.Ins_id)
from Members.Instructor I
where I.Ins_id = @Insid  ;

if @count = 1
      begin
		  insert into ExamContent.Exams
		  values(@exid,@ex_year,@ex_start,@ex_end,@ex_degree,@ex_type,@ex_cid,@Insid);
      end

else
	begin
	print ' You Are Not an Instructor ';
	end
end
---- Exec
Exec AddExam @Insid = 1 ,
@exid = 10 ,
@ex_year = '2023' ,
@ex_start = '2023-04-27 03:00:00.000'  ,
@ex_end = '2023-04-27 06:00:00.000' ,
@ex_degree  = 10 ,
@ex_type = 'Exam' ,
@ex_cid  = 4;

--------------------------------------------    " Main Proc "   ---------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- 1) Select Questions Manaualy
-- a ) first view the questions and courses of the specific Instructor 
create proc showMyCQ @InsID int as
Begin
	select Q.Q_id,Q.Q_text,Q.Q_type,Q.Q_CorrectAns,Q.Crs_id
	from ExamContent.Questions Q
	JOIN Members.Instructor_Courses I
	on I.Ins_id = @InsID
	where Q.Crs_id = I.Crs_id
End
exec showMyCQ @InsID=1;
----------------------------------------------------------------------------------------------------
-- b ) let him/her pick a specific questions
alter proc SelectManualQuestions
    @courseId int,
    @questionIds int,
	@examID int,
	@Degree int
	AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @Q_ID int;

    SELECT Q_id, Q_text, Q_CorrectAns, Q_type 
    FROM ExamContent.Questions 
    WHERE Crs_id = @courseId AND Q_id = @questionIds ;

	select @Q_ID=Q_id
	from ExamContent.Questions
	WHERE Crs_id = @courseId AND Q_id = @questionIds;


	--dbo.textEQ is just for testing
	insert into  ExamContent.Exam_Questions
	values(@examID,@Q_ID,@Degree)
END

-- View all Questions To select Q_id
--select * from Show_All_Questions;
-- Select a spicific Questions
EXEC SelectManualQuestions @courseId = 5 , @questionIds	 = 10,@examID = 10, @Degree = 10 ;

-------------------------------------- " OR " -------------------------------------- 
-- or  b ) let him/her pick a random questions
CREATE PROCEDURE SelectRandomQuestions
    @courseId int,
    @questionType nvarchar(50),
    @numQuestions int
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT TOP(@numQuestions) Q_id, Q_text, Q_CorrectAns, Q_type 
    FROM ExamContent.Questions
    WHERE Crs_id = @courseId AND Q_type = @questionType
    ORDER BY NEWID()
END


-- Execution
EXEC SelectRandomQuestions @courseId = 5 , @questionType = 'MCQ' , @numQuestions = 1 ;


----------------------------------------------------------------------------------------------------------------------------------------------
-- c) Creating student Exam 
alter proc showStudentExam  @ExamID int
	as
	begin
		select Q.Q_id, Q.Q_text as 'Question'  ,T.Ex_id
		from ExamContent.Questions Q
		join ExamContent.Exam_Questions T
		on Q.Q_id = T.Q_id
		where T.Ex_id=@ExamID
	end


exec showStudentExam @ExamID=10;
----------------------------------------------------------------------------------------------------
-- d ) Student answer the Questions 
create proc StudentAnswer
	@studentID int,
	@ExamID int,
	@QID int,
	@answer varchar(1)
as
begin
	insert into ExamContent.ExamQSA
	values (@studentID,@ExamID,@QID,@answer)
end
Exec StudentAnswer @studentID=5,@ExamID=10,@QID=10,@answer='a';
----------------------------------------------------------------------------------------------------
-- 2 ) Check Answer and Calculate Total Degree foreach Student
-- Check Answer
alter proc CheckAnswer @ExamID int , @studentID int
as
begin

	declare @S_Ans nvarchar(10)
	declare @qid int

	select @S_Ans = Q.Answer , @qid = Q.Q_id
	from ExamContent.ExamQSA Q
	where Q.Ex_id = @ExamID and Q.Std_id = @studentID;

	declare @E_Ans nvarchar(10)
	select @E_Ans = EQ.Q_CorrectAns
	from ExamContent.Questions EQ
	where EQ.Q_id = @qid;

	declare @Q_degree int
	select @Q_degree = E.Degree
	from ExamContent.Exam_Questions E
	where E.Ex_id = @ExamID and E.Q_id = @qid ;

	declare @Q_Olddegree int
	declare @count int 
	select @Q_Olddegree = E.Degree 
	from ExamContent.Student_Exams E
	where E.Ex_id = @ExamID and E.Std_id = @studentID ; 

	select @count = COUNT(E.Degree)
	from ExamContent.Student_Exams E
	where E.Ex_id = @ExamID and E.Std_id = @studentID ;

	if @S_Ans = @E_Ans and @count=0
		begin
			insert into ExamContent.Student_Exams
			values(@ExamID,@studentID,@Q_degree);
			print 'true1'
		end

	else if @count=0 and @S_Ans != @E_Ans
		begin
			insert into ExamContent.Student_Exams
			values(@ExamID,@studentID,0);
			print 'false'
		end
   
	else if @count = 1 and @S_Ans = @E_Ans
		begin
			update ExamContent.Student_Exams
			SET Degree = @Q_degree+@Q_Olddegree
			Where Ex_id = @ExamID and Std_id = @studentID ;
			print 'true2'
		end
	else print 'k'
end

---- Exec
Exec CheckAnswer @ExamID = 10 , @studentID = 5 ;


