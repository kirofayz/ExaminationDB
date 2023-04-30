-- Create File Groups With files
USE master
GO
ALTER DATABASE ExamSystemDB
ADD FILEGROUP ExamFG1;
GO
ALTER DATABASE ExamSystemDB 
ADD FILE 
(
    NAME = ExamFile1,
    FILENAME = 'D:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ExamFile1.ndf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
),
(
    NAME = ExamFile2,
    FILENAME = 'D:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ExamFile2.ndf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)
TO FILEGROUP? ExamFG1;

-- Drop Primary Key on table 
ALTER TABLE ExamContent.Exams
DROP CONSTRAINT PK__Exams__41F3F50FBFDC5A0E;

-- Create Cluster index on Id After Moving
CREATE CLUSTERED INDEX PK__Exams
ON ExamContent.Exams(Ex_id)
WITH (DROP_EXISTING = ON)
ON ExamFG1;