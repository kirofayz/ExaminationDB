-- create new database
create database ExamSystemDB;
----------------------------------------------------------------------------------------------------
-- Create Table Branch 
create table Branch (
Branch_id int primary key ,
Branch_name nvarchar(100) not null 
);
----------------------------------------------------------------------------------------------------
-- Create Table Intake
create table Intake(
Intake_id int primary key ,
Intake_name nvarchar(100) not null
);
----------------------------------------------------------------------------------------------------
-- Create Table Track
create table Track(
Track_id int primary key ,
Track_name nvarchar(100) not null
);
----------------------------------------------------------------------------------------------------
-- Create Table Class ==> " Branch , Intake , Track "
create table Class(
Class_id int primary key ,
Branch_id int not null ,
Intake_id int not null , 
Track_id int not null ,

CONSTRAINT FK_ClassBranch FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id) ,
CONSTRAINT FK_ClassIntake FOREIGN KEY (Intake_id) REFERENCES Intake(Intake_id) ,
CONSTRAINT FK_ClassTrack FOREIGN KEY (Track_id) REFERENCES Track(Track_id) 
);
----------------------------------------------------------------------------------------------------
-- Create Table Students
create table Student (
Std_id int primary key ,
Std_firstname nvarchar(100) not null ,
Std_lastname nvarchar(100) not null , 
Std_mail nvarchar(100) not null ,
Std_password nvarchar(100) not null ,

Class_id int not null ,

CONSTRAINT FK_StudentClass FOREIGN KEY (Class_id) REFERENCES Class(Class_id)
);
----------------------------------------------------------------------------------------------------
-- Create Table Instructor
create table Instructor(
Ins_id int primary key , 
Ins_name nvarchar(100) not null ,
Ins_mail nvarchar(100) not null ,
Ins_password nvarchar(100) not null ,
);
----------------------------------------------------------------------------------------------------
-- Create Table Course
create table Course(
Crs_id int primary key ,
Crs_name nvarchar(100) not null ,
Crs_MaxDegree int not null ,
Crs_MinDegree int not null ,
Crs_description nvarchar(100) , 

);
----------------------------------------------------------------------------------------------------
-- Create Table Instructor_Classes " M to M relationship " ==>"IC"
create table Instructor_Classes(
IC_year int ,
Class_id int ,
Crs_id int , 
Ins_id int ,

PRIMARY KEY (IC_year, Class_id , Crs_id , Ins_id ) ,

CONSTRAINT FK_IC_Class FOREIGN KEY (Class_id) REFERENCES Class(Class_id) ,

CONSTRAINT FK_IC_Course FOREIGN KEY (Crs_id) REFERENCES Course(Crs_id),

CONSTRAINT FK_IC_Instructor FOREIGN KEY (Ins_id) REFERENCES Instructor(Ins_id)
);
----------------------------------------------------------------------------------------------------
-- Create Table Instructor_Courses " M to M relationship " ==>"ICrs"
create table Instructor_Courses(
Crs_id int , 
Ins_id int ,

PRIMARY KEY (Crs_id , Ins_id ) ,

CONSTRAINT FK_ICrs_Course FOREIGN KEY (Crs_id) REFERENCES Course(Crs_id),

CONSTRAINT FK_ICrs_Instructor FOREIGN KEY (Ins_id) REFERENCES Instructor(Ins_id)

);
----------------------------------------------------------------------------------------------------
-- Create Table Questions 
create table Questions(
Q_id int primary key ,
Q_text nvarchar(Max) not null ,
Q_type nvarchar(100) not null check (Q_type in ('MCQ','T|F','Text')) , 
Q_CorrectAns nvarchar(100) not null ,

Crs_id int not null ,

CONSTRAINT FK_QCourse FOREIGN KEY (Crs_id) REFERENCES Course(Crs_id)

);
----------------------------------------------------------------------------------------------------
-- Create Table Exams
create table  Exams (
Ex_id int primary key ,
Ex_year nvarchar(5) not null ,
Ex_StartTime datetime not null ,
Ex_EndTime datetime not null ,
Ex_Total As DATEDIFF(hour, Ex_StartTime, Ex_EndTime) ,
Ex_degree int not null ,
Ex_type nvarchar(20) not null check (Ex_type in ('Exam','Corrective')) ,

Crs_id int not null , 
Ins_id int not null ,


CONSTRAINT FK_Ex_Course FOREIGN KEY (Crs_id) REFERENCES Course(Crs_id),

CONSTRAINT FK_Ex_Instructor FOREIGN KEY (Ins_id) REFERENCES Instructor(Ins_id)

);
----------------------------------------------------------------------------------------------------
-- Create Table Student_Exams " M to M relationship " ==>"SE"
create table Student_Exams(

Ex_id int ,
Std_id int ,
Degree int not null ,


PRIMARY KEY (Ex_id , Std_id ) ,

CONSTRAINT FK_SE_Exam FOREIGN KEY (Ex_id) REFERENCES Exams(Ex_id) ,

CONSTRAINT FK_SE_Student FOREIGN KEY (Std_id) REFERENCES Student(Std_id),
);
----------------------------------------------------------------------------------------------------
-- Create Table Exam_Questions " M to M relationship " ==>"EQ"
create table Exam_Questions(

Ex_id int ,
Q_id int ,
Degree int not null ,


PRIMARY KEY (Ex_id , Q_id ) ,

CONSTRAINT FK_EQ_Exam FOREIGN KEY (Ex_id) REFERENCES Exams(Ex_id) ,

CONSTRAINT FK_EQ_Question FOREIGN KEY (Q_id) REFERENCES Questions(Q_id)
);
----------------------------------------------------------------------------------------------------
-- Create Table Exam Question Student Answer " M to M relationship " ==>"ExamQSA"
create table ExamQSA(
Std_id int ,
Ex_id int ,
Q_id int ,
Answer nvarchar(Max) not null ,

PRIMARY KEY (Std_id , Ex_id , Q_id ) ,

CONSTRAINT FK_EQSA_Exam FOREIGN KEY (Ex_id) REFERENCES Exams(Ex_id) ,

CONSTRAINT FK_EQSA_Question FOREIGN KEY (Q_id) REFERENCES Questions(Q_id) ,

CONSTRAINT FK_EQSA_Student FOREIGN KEY (Std_id) REFERENCES Student(Std_id)

);


