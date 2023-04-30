-- insert data into Branch table   
insert into ITI.Branch
values (1, 'Minia'),(2, 'Cairo');
-------------------------------------------------------------------------------------
-- insert data into Intake table   
insert into ITI.Intake
values (1, 'G1'),(2, 'G2');
-------------------------------------------------------------------------------------
-- insert data into Track table   
insert into ITI.Track
values (1, 'Front end'),(2, 'Back end');
-------------------------------------------------------------------------------------
-- insert data into Class table   
insert into ITI.Class
values (1 , 1 , 1 , 2 ) -- branch minia in G1 track back end
,(2 , 1 , 2 , 2 ) -- branch minia in G2 track back end
, (3 , 2 , 1 , 1 )  ; -- branch cairo in G1 track front end

-------------------------------------------------------------------------------------
-- insert data into Student table
insert into Members.Student
values (1, 'Zeyad', 'Mohsen', 'weza@gmail.com', '123', 1),
		(2, 'Kerolos', 'Fayez', 'kero@gmail.com', '123',1 ),
		(3, 'Yosef', 'Mustafa', 'jootkn@gmail.com', '123',1 ),
		(4, 'Mostafa', 'Salah', 'darsh@gmail.com', '123', 1);

---------------------------------------------------------------------------------------
-- insert data into instructor table  
insert into Members.Instructor
values (1, 'Mrihan Mohamed', 'mrihan@gmail.com', '123'),
		(2, 'Sara Salah', 'sara@gmail.com', '123'),
		(3, 'Nawal Zaki', 'nawal@gmail.com', '123');

---------------------------------------------------------------------------------------
-- insert data into course table  
insert into ITI.Course
values (1, 'HTML', 100 , 50 , ' intro to html'),
	   (2, 'CSS', 100 , 50 , ' intro to css'),
	   (3, 'JS', 100 , 50 , ' intro to js'),
	   (4, 'SQL', 100 , 50 , ' intro to sql server'),
	   (5, 'C#', 100 , 50 , ' intro to C#');

---------------------------------------------------------------------------------------
-- insert data into instructor Classes table
insert into Members.Instructor_Classes
values ( 2023 , 1 , 4 , 2  ) , -- Eng \ Sara teach course sql in branch minia in G1 track back end at 2023
       ( 2022 , 1 , 4 , 3  );  -- Eng \ Nawal teach course sql in branch minia in G1 track back end at 2022


---------------------------------------------------------------------------------------
-- insert data into instructor Courses table
insert into Members.Instructor_Courses
values (5,1), -- Course C# teach by Eng \ Mirhan
       (4,3);
---------------------------------------------------------------------------------------
-- insert data into Questions table
insert into ExamContent.Questions
values(1,'What is HTML?
a) HTML describes the structure of a webpage
b) HTML is the standard markup language mainly used to create web pages
c) HTML consists of a set of elements that helps the browser how to view the content
d) All of the mentioned','MCQ','d',1),
(2,'HTML stands for?
a) HyperText Markup Language
b) HyperText Machine Language
c) HyperText Marking Language
d) HighText Marking Language','MCQ','a',1),
(3,'Which of the following tag is used for inserting the largest heading in HTML?
a) head
b) <h1>
c) <h6>
d) heading','MCQ','b',1),
(4,'Which element is used to get highlighted text in HTML5?
a) <u>
b) <mark>
c) <highlight>
d) <b>','MCQ','b',1),
(5,'An HTML element indicates the structure of an HTML
document?','T|F','T',1),
(6,'What is HTML?
a) HTML describes the structure of a webpage
b) HTML is the standard markup language mainly used to create web pages
c) HTML consists of a set of elements that helps the browser how to view the content
d) All of the mentioned','MCQ','d',2),
(7,'HTML stands for?
a) HyperText Markup Language
b) HyperText Machine Language
c) HyperText Marking Language
d) HighText Marking Language','MCQ','a',2),
(8,'Which of the following tag is used for inserting the largest heading in HTML?
a) head
b) <h1>
c) <h6>
d) heading','MCQ','b',3),
(9,'What is HTML?
a) HTML describes the structure of a webpage
b) HTML is the standard markup language mainly used to create web pages
c) HTML consists of a set of elements that helps the browser how to view the content
d) All of the mentioned','MCQ','d',4),
(10,'HTML stands for?
a) HyperText Markup Language
b) HyperText Machine Language
c) HyperText Marking Language
d) HighText Marking Language','MCQ','a',5),
(11,'Which of the following tag is used for inserting the largest heading in HTML?
a) head
b) <h1>
c) <h6>
d) heading','MCQ','b',5);
---------------------------------------------------------------------------------------
-- insert data into Exam table
insert into ExamContent.Exams
values (1,2023,'2023-4-27 03:00:00', '2023-4-27 04:00:00' , 100 , 'Exam' , 4 , 2 ) ;
---------------------------------------------------------------------------------------
-- insert data into Student_Exams table
insert into ExamContent.Student_Exams
values (1,2,70);
---------------------------------------------------------------------------------------
select * from ITI.Branch;
select * from ITI.Intake;
select * from ITI.Track;
select * from ITI.Class;
select * from Members.Student;
select * from Members.Instructor;
select * from ITI.Course;
select * from Members.Instructor_Classes;
select * from Members.Instructor_Courses;
select * from ExamContent.Questions;
select * from ExamContent.Exams;
select * from ExamContent.Student_Exams;