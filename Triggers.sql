Create TRIGGER Prevent_Students
ON Members.Student
FOR INSERT , UPDATE, DELETE
AS
BEGIN

DECLARE @CurrentLoginName varchar(Max)
SET @CurrentLoginName = SUBSTRING(SUSER_SNAME(), CHARINDEX('\', SUSER_SNAME()) + 1, LEN(SUSER_SNAME()));

DECLARE @count int
Select @count=COUNT(Members.Instructor.Ins_id)
From Members.Instructor
where Members.Instructor.Ins_name = @CurrentLoginName

if @count  = 0
print 'You Are Not have Access To Make Changes '
rollback;
End

update Members.Student
set Members.Student.Std_firstname = 'KKKKKKK'
where Members.Student.Std_id = 1;

drop trigger trg_PreventInstructorEdit on database;

-----------------------------------------------------------------------------------------------------------
Create TRIGGER Prevent_Instructor
ON Members.Instructor
FOR INSERT , UPDATE, DELETE
AS
BEGIN

DECLARE @CurrentLoginName varchar(Max)
SET @CurrentLoginName = SUBSTRING(SUSER_SNAME(), CHARINDEX('\', SUSER_SNAME()) + 1, LEN(SUSER_SNAME()));

DECLARE @count int
Select @count=COUNT(Members.Instructor.Ins_id)
From Members.Instructor
where Members.Instructor.Ins_name = @CurrentLoginName

if @count  = 0
print 'You Are Not have Access To Make Changes '
rollback;
End