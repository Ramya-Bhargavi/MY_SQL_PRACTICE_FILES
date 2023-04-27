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
INSERT INTO Student (ROLL_NO, Name, Age) VALUES (9,"sai",20);
INSERT INTO Student (ROLL_NO,Name, Age) VALUES (16,"sonali",12);
INSERT INTO Student (ROLL_NO,Name, Age) VALUES (6,"komal",18);

# updating the student name for roll_no = 6, here change the safe mode setting EDIT -> Preferences -> uncheck safe mode -> Restart

UPDATE Student SET NAME = 'PRATIK' WHERE roll_no= 6;

select * from temp.student;

# delete command

delete from student where roll_no=6;

select * from temp.student;

INSERT INTO Student (ROLL_NO, Age) VALUES (6,18);
UPDATE Student SET NAME = 'PRATIK' WHERE roll_no= 6;

# commit

delete from student where roll_no=6;
COMMIT;

# roll back after commit wont work
ROLLBACK;

select * from temp.student;

INSERT INTO Student (ROLL_NO, Age) VALUES (11,18);
UPDATE Student SET NAME = 'ramya' WHERE roll_no= 11;


# roll back without commit ---- it works only when the 
# auto commit it first set to 0 then the delete records will not be deleted and after roll back the records deleted will reappaear again

SET autocommit=0;
START TRANSACTION; 
delete from student where roll_no=11;
ROLLBACK;

SET autocommit=1;

select * from temp.student;

# Save point

SET autocommit=0;
SAVEPOINT SP1;
delete from student where roll_no=11;
SAVEPOINT SP2;
ROLLBACK TO SP1;

# Truncate table

TRUNCATE TABLE student;

select * from temp.student;

# drop table
DROP TABLE student;

select * from temp.student;
