-------------------------------------------------- Non-Clustered Index ----------------------------------------
-- Non-Clustered Index On Student First name 
create nonclustered index Idx_Std_fname on  Members.Student(Std_firstname);

---------------------------------------------------------------------------------------------------------------
-- Non-Clustered Index On Instructor Name
create nonclustered index Idx_Ins_name on  Members.Instructor(Ins_name);
