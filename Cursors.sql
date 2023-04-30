-- Create a Cursor to Show data retrieved from select query into Instructor Table  .
DECLARE @Name VARCHAR(50)
DECLARE c1 CURSOR FOR
SELECT Ins_name FROM Members.Instructor
OPEN c1
FETCH NEXT FROM c1 INTO @Name
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT @Name
    FETCH NEXT FROM c1 INTO @Name
END
CLOSE c1
DEALLOCATE c1