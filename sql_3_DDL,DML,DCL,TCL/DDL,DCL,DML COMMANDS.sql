#create table

CREATE TABLE Subject
(
Sub_ID INT, 
Sub_Name varchar(20)
);

#Adding data in first row
Insert into Subject
Values (1,'English');

#Adding data in specific column
Insert into Subject(Sub_Name)
Values ('Hindi');

#Adding multiple data in the table in one go
Insert into Subject Values (1,'English'),(2,'French'),(2,'Science'),(2,'Maths');

select * from temp.subject;

# creating table student
CREATE TABLE Student
(
roll_no INT, 
Name char(20)
);

#alter table add columns in student
ALTER TABLE Student ADD (AGE int(3),COURSE varchar(40));

#alter table modify column in student table
ALTER TABLE Student MODIFY COURSE varchar(20);

#alter table drop column in student table
ALTER TABLE Student DROP COLUMN COURSE;

# inserting only values
INSERT INTO Student VALUES (5,"harsha",18);

# inserting only into specified cols

INSERT INTO Student (ROLL_NO, Age) VALUES (6,18);

# updating the student name for roll_no = 6, here change the safe mode setting EDIT -> Preferences -> uncheck safe mode -> Restart

UPDATE Student SET NAME = 'PRATIK' WHERE roll_no= 6;




