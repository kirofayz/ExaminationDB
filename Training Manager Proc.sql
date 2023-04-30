/*
- Training Manager (One of the instructors) can edit (add, Update and delete) instructors and 
courses and instructors for each course.
    @id int ,
    @Name nvarchar(50),
    @Email nvarchar(50),
    @Password nvarchar(50) ,
	@user nvarchar(50),
	@pass nvarchar(50)
AS
BEGIN
  	if @user = 'Ahmed@gmail.com' and @pass='123'
	begin
    INSERT INTO Members.Instructor
    VALUES (@id,@Name, @Email, @Password)
	end
	else
	print ' You Are Not a Training Manager '
END
---------- Exec
    @Name = 'Kero',
    @Email ='K@gmail.com',
    @Password = '123' ,
	@user = 'Ahmed@gmail.com',
	@pass ='123';
-- 2) Update Instructor
alter PROCEDURE UpdateInstructor
    @id int,
    @Name nvarchar(50),
    @Email nvarchar(50),
    @Password nvarchar(50),
	@user nvarchar(50),
	@pass nvarchar(50)
AS
BEGIN
    if @user = 'Ahmed@gmail.com' and @pass='123'
	begin
    UPDATE Members.Instructor
    SET Ins_name = @Name,
        Ins_mail = @Email,
        Ins_password = @Password
    WHERE Ins_id = @id
	End
	else
	print ' You Are Not a Training Manager '

END
---------- Exec
    @Name = 'Kero',
    @Email ='Fayez@gmail.com',
    @Password = '123' ,
	@user = 'Ahmed@gmail.com',
	@pass ='123';
------------------------------------------------------------------------------------------
-- 3) Delete Instructor
CREATE PROCEDURE DeleteInstructor
    
    @id int ,
	@user nvarchar(50),
	@pass nvarchar(50)
AS
BEGIN
    if @user = 'Ahmed@gmail.com' and @pass='123'
	begin
    DELETE FROM Members.Instructor
    WHERE Ins_id = @id
	End
	else
	print ' You Are Not a Training Manager '
END
---------- Exec
Exec DeleteInstructor @id=5 , @user = 'Ahmed@gmail.com',
	@pass ='123';

-------------------------------------------------------------------------------------------------------------
------------------------------------------- " Course  " ------------------------------------------
    @id int ,
    @Name nvarchar(50),
    @MaxDeg int,
    @MinDeg int,
    @Description nvarchar(max) ,
	@user nvarchar(50),
	@pass nvarchar(50)

AS
BEGIN
    if @user = 'Ahmed@gmail.com' and @pass='123'
	begin
    INSERT INTO ITI.Course
    VALUES (@id,@Name, @MaxDeg, @MinDeg, @Description)
	End
	else
	print ' You Are Not a Training Manager '
END
    @Name = 'ASP.net',
    @MaxDeg =100,
    @MinDeg =50,
    @Description = 'back end' ,
	@user = 'Ahmed@gmail.com',
-- 3) Update Course
    @CourseID int,
    @Name nvarchar(50),
    @MaxDeg int,
    @MinDeg int,
    @Description nvarchar(max) ,
	@user nvarchar(50),
	@pass nvarchar(50)

AS
BEGIN
    if @user = 'Ahmed@gmail.com' and @pass='123'
	begin
    UPDATE ITI.Course
    SET Crs_name = @Name,
        Crs_MaxDegree = @MaxDeg,
        Crs_MinDegree = @MinDeg,
        Crs_description = @Description
    WHERE Crs_id = @CourseID
	End
	else
	print ' You Are Not a Training Manager '
END
    @Name = 'ASP',
    @MaxDeg =100,
    @MinDeg =50,
    @Description = 'back end' ,
	@user = 'Ahmed@gmail.com',
-- 3) Delete Course
    @CourseID int ,
	@user nvarchar(50),
	@pass nvarchar(50)
AS
BEGIN
    if @user = 'Ahmed@gmail.com' and @pass='123'
	begin
    DELETE FROM ITI.Course
    WHERE Crs_id = @CourseID
	End
	else
	print ' You Are Not a Training Manager '
END
	@user = 'Ahmed@gmail.com',
------------------------------------------- " Assign Instructor To Course   " ------------------------------------------
    @InstructorID int,
    @CourseID int ,
	@user nvarchar(50),
	@pass nvarchar(50)

AS
BEGIN
    if @user = 'Ahmed@gmail.com' and @pass='123'
	begin
    INSERT INTO Members.Instructor_Courses
    VALUES (@CourseID,@InstructorID)
	End
	else
	print ' You Are Not a Training Manager '
END
    @InstructorID = 4 ,
    @CourseID = 2 ,
	@user = 'Ahmed@gmail.com',
------------------------------------------- " Branch " ------------------------------------------
    @id int ,
    @BName NVARCHAR(50) ,
	@user nvarchar(50),
	@pass nvarchar(50)
AS
BEGIN
    if @user = 'Ahmed@gmail.com' and @pass='123'
	begin
    INSERT INTO ITI.Branch
    VALUES (@id,@BName);
	End
	else
	print ' You Are Not a Training Manager '
END;
    @id = 3 ,
    @BName = 'Alex' ,
	@user = 'Ahmed@gmail.com',
-- 2) Update Branch
    @id int ,
    @BName NVARCHAR(50) ,
	@user nvarchar(50),
	@pass nvarchar(50)
AS
BEGIN
    if @user = 'Ahmed@gmail.com' and @pass='123'
	begin
    UPDATE ITI.Branch
    SET Branch_name = @BName
    WHERE Branch_id = @id;
	End
	else
	print ' You Are Not a Training Manager '
END;
    @id = 3 ,
    @BName = 'Alexandria' ,
	@user = 'Ahmed@gmail.com',
------------------------------------------- " Track " ------------------------------------------
    @id INT,
    @TName NVARCHAR(50),
	@user NVARCHAR(50),
	@pass NVARCHAR(50)
AS
BEGIN
    if @user = 'Ahmed@gmail.com' and @pass='123'
	begin
    INSERT INTO ITI.Track
    VALUES (@id,@TName);
	End
	else
	print ' You Are Not a Training Manager '
END;
--------- Exec
Exec AddTrack
    @id = 3 ,
    @TName = 'fullstack' ,
	@user = 'Ahmed@gmail.com',
	@pass='123';
    @id INT,
    @TName NVARCHAR(50),
	@user NVARCHAR(50),
	@pass NVARCHAR(50)
AS
BEGIN
	if @user = 'Ahmed@gmail.com' and @pass='123'
	begin
    UPDATE ITI.Track
    SET Track_name = @TName
    WHERE Track_id = @id;
	End
	else
	print ' You Are Not a Training Manager '
END;
--------- Exec
Exec EditTrack
    @id = 3 ,
    @TName = 'DevOps' ,
	@user = 'Ahmed@gmail.com',
	@pass='123';
    @id int ,
    @IName VARCHAR(50),
	@user NVARCHAR(50),
	@pass NVARCHAR(50)
AS
BEGIN
    if @user = 'Ahmed@gmail.com' and @pass='123'
	begin
	INSERT INTO ITI.Track
    VALUES (@id,@IName);
	End
	else
	print ' You Are Not a Training Manager '
    END
Exec EditTrack
    @id = 3 ,
    @TName = 'G3' ,
	@user = 'Ahmed@gmail.com',
	@pass='123';
-- Add Student
CREATE PROCEDURE AddStudent
    @id int ,
    @SFname VARCHAR(50),
	@SLname VARCHAR(50),
	@Smail VARCHAR(50),
	@Spassword VARCHAR(50),
	@classid int,
	@user NVARCHAR(50),
	@pass NVARCHAR(50)
AS
BEGIN
    if @user = 'Ahmed@gmail.com' and @pass='123'
	begin
	INSERT INTO Members.Student
    VALUES (@id,@SFname,@SLname,@Smail,@Spassword,@classid);
	End
	else
	print ' You Are Not a Training Manager '
    END
Exec AddStudent
    @id = 5 ,
    @SFname = 'Kero',
	@SLname = 'Fayez',
	@Smail = 'k@gmail.com',
	@Spassword = '456',
	@classid = 1 ,
	@user = 'Ahmed@gmail.com',
	@pass='123';