CREATE DATABASE COLLEGE;
USE COLLEGE;


/**
CREATE TABLE student(
rollno INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO student
(rollno, name)
VALUES
(101, "KARAN"),
(102, "ARJUN"),
(103, "RAM");

/*THIS IS THE SECOND METHOD TO STORING VALUES IN SHORT FORM FOR SMALL TABLES*/
/*INSERT INTO student VALUES (104, "PRASHANT SAINI");

SELECT * FROM student;*/

DROP TABLE student;

/*BASICALLY TTHIS COMMAND IS USED FOR ADD NEW COLUMN IN EXISTING TABLE. WHENEVER YOU NEED TO ADD NEW COLUMN YOU CAN USE ALTER COMMAND*/
ALTER TABLE student
ADD class INT NOT NULL;

------------------------------------------------------------------------------------------

CREATE TABLE student (
  rollno INT PRIMARY KEY,
  name VARCHAR(50),
  class INT NOT NULL,
  marks INT NOT NULL ,
  grade VARCHAR(1),
  city VARCHAR(50),
  pincode INT
);

INSERT INTO student 
(rollno, name, class, marks, grade,city, pincode)
VALUES
(101, "ANIL", 5, 78, "C", "PUNE", 202001),
(102, "BHUMIKA", 5, 93, "A", "MUMBAI", 202001),
(103, "CHETAN", 5, 85, "B", "MUMBAI", 202001),
(104, "DHRUV", 5, 96, "A", "DELHI", 202001),
(105, "EMAUNEL", 5, 12, "F", "DELHI", 202001),
(106, "FARAH", 5, 82, "B", "DELHI", 202001);

SELECT * FROM student;
SELECT name, marks FROM student;
SELECT city FROM student;
/*BASICALLY DISTINCT KEYWORD OR COMMAND ARE USE FOR UNIQUE AND DISTINCT VALUES. IT MEANS IF ANY VALUES IN THE TABLE REPEAT MORE THAN
TWO SO THE DISTINCT COMMAND WILL ONLY CHOOSE ONLY ONE FROM REPEATETIVE VALUES*/
SELECT DISTINCT city FROM student;


-------------------------------------------------------------------------------------------------------------------------------
/***********************************WHERE CLAUSE************************/
/*basically where clause used for to define some conditions*/
SELECT * FROM student WHERE marks > 80;
SELECT * FROM student WHERE marks >= 80;
SELECT * FROM student WHERE marks < 80;

/*we can USE also where command like this*/
SELECT * FROM student WHERE MARKS > 80 AND city = "MUMBAI";
SELECT * FROM student WHERE MARKS < 80 AND city = "MUMBAI";

/*IN BELOW WE CAN SEE THAT how +10 and -10 works, so bascally in these examples we checked the values to add 
and subtract 10 and check the values after this is greater than or not*/
SELECT * FROM student WHERE MARKS+10 > 100 AND city = "MUMBAI";
SELECT * FROM student WHERE MARKS+10 > 100;
SELECT * FROM student WHERE MARKS-10 < 50;

/*******************************OPERATORS**************************/
/*Operators WITH WHERE CLAUSE*/
SELECT * FROM student WHERE marks > 90 AND city = "MUMBAI";
SELECT * FROM student WHERE marks > 90 OR city = "MUMBAI";
SELECT * FROM student WHERE marks BETWEEN 80 AND 90;
SELECT * FROM student WHERE city IN ("DELHI", "MUMBAI", "PUNE", "AGRA");
SELECT * FROM student WHERE city NOT IN ("DELHI", "MUMBAI", "PUNE", "AGRA");


/*******************************LIMIT CLAUSE***************************************/
SELECT * FROM student LIMIT 3;
SELECT * FROM student WHERE marks > 50 LIMIT 7;
SELECT * FROM student WHERE marks < 50 LIMIT 7;


/*********************ORDER BY CLAUSE********************/
SELECT * FROM student ORDER BY rollno ASC;
SELECT * FROM student WHERE rollno ORDER BY rollno ASC;

SELECT * FROM student ORDER BY rollno DESC;
SELECT * FROM student WHERE rollno ORDER BY rollno DESC;

SELECT * FROM student ORDER BY city ASC;
SELECT * FROM student ORDER BY city DESC;

SELECT * FROM student ORDER BY marks ASC;
SELECT * FROM student ORDER BY marks DESC;

SELECT * FROM student ORDER BY marks DESC LIMIT 3;
SELECT * FROM student ORDER BY marks ASC LIMIT 3;


/******************AGGREGATE FUNTIONS********************/
SELECT MAX(marks) FROM student;
SELECT MIN(marks) FROM student;
SELECT AVG(marks) FROM student;
SELECT SUM(marks) FROM student;

SELECT MAX(city) FROM student;
SELECT MIN(city) FROM student;

SELECT COUNT(name) FROM student;
SELECT COUNT(rollno) FROM student;


/****************GROUP BY CLAUSE**************/

/*Groups rows that have the same values into summary rows.
It collects data from multiple records and groups the result by one or more column.
Generally we use group by with some aggregation function.*/

/*Count number of students in each city*/

SELECT city, count(rollno)
 FROM student 
 GROUP BY city;
 
SELECT city,name, count(rollno)
 FROM student 
 GROUP BY city,name;
 
SELECT city, avg(marks)
 FROM student 
 GROUP BY city;
 
 /*QUES: WRITE THE QUERY TO FIND AVG MARKS IN EACH CITY IN ASCENDING ORDER*/
 
 /*IN ASCENDING ORDER, WRITE ASC ORDER COMMAND IS NOT MANDATORY BECAUSE ORDER BY CLAUSE AUTOMATICALLY ARRANGES
 DATA IN ASCENDING ORDER*/

SELECT city, AVG(marks)
  FROM student 
  GROUP BY city 
  ORDER BY city;
  
SELECT city, AVG(marks)
  FROM student 
  GROUP BY city 
  ORDER BY AVG(marks);  
  
SELECT city, AVG(marks)
  FROM student 
  GROUP BY city 
  ORDER BY AVG(marks) DESC;  

-----------------------------------------------------------------------------------------------------------------------------------------

/*FOR THE GIVEN TABLE FIND THE TOTAL STUDENT ACCORDING TO EACH GRAD METHOD*/

SELECT grade
FROM student
GROUP BY grade;


SELECT grade, COUNT(name)
FROM student
GROUP BY grade
ORDER BY grade;

-------------------------------------------------------------------------------------------------------------------------------------------


/******************************Having Clause***********************/
/*****Similar to Where i.e. applies some condition on rows.
Used when we want to apply any condition after grouping.*/

/*Count number of students in each city where max marks cross 90*/
SELECT city
FROM student
GROUP BY city
HAVING MAX(marks) > 90;

SELECT city
FROM student
GROUP BY city
HAVING MAX(marks) > 90
ORDER BY city;

SELECT rollno
FROM student
GROUP BY rollno
HAVING MIN(marks) < 40;

SELECT rollno,marks,city
FROM student
GROUP BY rollno,marks,city
HAVING MIN(marks) < 40;

SELECT rollno,marks,city
FROM student
GROUP BY rollno,marks,city
HAVING MIN(marks) > 90
ORDER BY rollno;

SELECT rollno,marks,city
FROM student
GROUP BY rollno,marks,city
HAVING MIN(marks) > 90
ORDER BY city;

SELECT rollno,marks,city
FROM student
GROUP BY rollno,marks,city
HAVING MIN(marks) > 90
ORDER BY marks;

SELECT rollno,marks,city
FROM student
GROUP BY rollno,marks,city
HAVING MIN(marks) > 90
ORDER BY marks DESC;

-----------------------------------------------------------------------------------------------------------------------------------------------


/********General Order to write queries in SQL**************************/
/****SELECT column(s)
FROM table_name
WHERE condition
GROUP BY column(s)
HAVING condition
ORDER BY column(s) ASC;****/

SELECT city
FROM student
WHERE grade = "A"
GROUP BY city;

SELECT city
FROM student
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks) > 93;

SELECT city
FROM student
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks) >= 93;

SELECT city
FROM student
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks) > 90
ORDER BY city; /*Whenever we use order by clause, it is not necessary to write ascending BECAUSE IN ORDER BY CLAUSE THAT'S AUTOMATICALLY
ARRANGE IN ASCENDING ORDER*/

SELECT city
FROM student
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks) > 90
ORDER BY city DESC;

------------------------------------------------------------------------------------------------------------------------------------------
/*******************Table related Queries***********************************/
/****************Update (to update existing rows)***************************/

/***UPDATE table_name
SET col1 = val1, col2 = val2
WHERE condition;***/

/*INSERT INTO student 
(rollno, name, class, marks, grade,city, pincode)
VALUES
(101, "ANIL", 5, 78, "C", "PUNE", 202001),
(102, "BHUMIKA", 5, 93, "A", "MUMBAI", 202001),
(103, "CHETAN", 5, 85, "B", "MUMBAI", 202001),
(104, "DHRUV", 5, 96, "A", "DELHI", 202001),
(105, "EMAUNEL", 5, 12, "F", "DELHI", 202001),
(106, "FARAH", 5, 82, "B", "DELHI", 202001);*/

SET SQL_SAFE_UPDATES = 0;

UPDATE student
SET grade = "O"
WHERE grade = "A";

UPDATE student
SET marks = 82
WHERE rollno = 105;

UPDATE student 
SET grade = "B"
WHERE marks BETWEEN 80 AND 90;

UPDATE student
SET marks = marks + 1;

UPDATE student
SET marks = marks - 1;

UPDATE student
SET marks = marks / 2;

UPDATE student
SET marks = marks * 2;

UPDATE student 
SET marks = marks - 3;

UPDATE student 
SET marks = marks + 1
where rollno = 101;

UPDATE student 
SET marks = marks + 3
where rollno = 104;

UPDATE student 
SET marks = 12
WHERE rollno = 105;

UPDATE student 
SET grade = "F"
WHERE rollno = 105;

UPDATE student 
SET marks = marks + 1
WHERE rollno = 106;

SELECT * FROM student;

---------------------------------------------------------------------------------------------------------------------------------
/******************************Delete (to delete existing rows)*************************/
/***DELETE FROM table_name
 WHERE condition;***/
 
DELETE FROM student
 WHERE marks < 33;
 
 ----------------------------------------------------------------------------------------------------------------------------------
 
 /**************************Cascading for FK*********************/
 /*On Delete Cascade
When we create a foreign key using this option, it deletes the referencing rows in the child table
when the referenced row is deleted in the parent table which has a primary key.*/

/*On Update Cascade
When we create a foreign key using UPDATE CASCADE the referencing rows are updated in the child
table when the referenced row is updated in the parent table which has a primary key.*/

/***SYNTAX***/

/*CREATE TABLE student (
id INT PRIMARY KEY,
courseID INT,
FOREIGN KEY (courseID) REFERENCES course(id)
ON DELETE CASCADE
ON UPDATE CASCADE
); */ 

CREATE TABLE dept (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);

INSERT INTO  dept
VALUES
(101, "ENGLISH"),
(102, "IT");

SELECT * FROM dept;


CREATE TABLE teacher (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  dept_id INT,
  FOREIGN KEY (dept_id) REFERENCES dept (id)
  ON UPDATE CASCADE
  ON DELETE CASCADE
);

INSERT INTO teacher
VALUES
(101, "ADMA", 101),
(102, "EVE", 102);

SELECT * FROM teacher;

UPDATE dept
SET id = 103
WHERE id = 102;

UPDATE dept
SET id = 111
WHERE id = 101;

--------------------------------------------------------------------------------------------------------------------------------------------------

/************************Table related Queries************************/

/************************Alter (to change the schema)****************/


/*************************************************
ADD Column 
ALTER TABLE table_name
ADD COLUMN column_name datatype constraint;

DROP Column
ALTER TABLE table_name
DROP COLUMN column_name;

RENAME Table
ALTER TABLE table_name
RENAME TO new_table_name;

CHANGE Column (rename)
ALTER TABLE table_name
CHANGE COLUMN old_name new_name new_datatype new_constraint;

MODIFY Column (modify datatype/ constraint)
ALTER TABLE table_name
MODIFY col_name new_datatype new_constraint;
*************************************************/

CREATE TABLE student (
  rollno INT PRIMARY KEY,
  name VARCHAR(50),
  class INT NOT NULL,
  marks INT NOT NULL ,
  grade VARCHAR(1),
  city VARCHAR(50),
  pincode INT
);

INSERT INTO student 
(rollno, name, class, marks, grade,city, pincode)
VALUES
(101, "ANIL", 5, 78, "C", "PUNE", 202001),
(102, "BHUMIKA", 5, 93, "A", "MUMBAI", 202001),
(103, "CHETAN", 5, 85, "B", "MUMBAI", 202001),
(104, "DHRUV", 5, 96, "A", "DELHI", 202001),
(105, "EMAUNEL", 5, 12, "F", "DELHI", 202001),
(106, "FARAH", 5, 82, "B", "DELHI", 202001);

ALTER TABLE student
ADD COLUMN age INT;

ALTER TABLE student
DROP COLUMN age;

ALTER TABLE student
RENAME TO stu;

ALTER TABLE stu
RENAME TO student;

ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT 19;

ALTER TABLE student
MODIFY COLUMN age VARCHAR(2);

ALTER TABLE student
MODIFY age VARCHAR(2);

INSERT INTO student
(rollno, name, marks, age)
VALUES
(107, "BOB", 68, 100);

ALTER TABLE student
CHANGE age stu_age INT;

INSERT INTO student
(rollno, name, class, marks, age)
VALUES
(107, "GARGI", 5, 68, 100);

ALTER TABLE student
DROP COLUMN stu_age;

SELECT * FROM student;
---------------------------------------------------------------------------------------------------------------------------------------------------
/**********************Table related Queries
Truncate (to delete table's data)
TRUNCATE TABLE table_name ;*********************/

TRUNCATE TABLE student;

ALTER TABLE student
CHANGE NAME full_name VARCHAR(50);

DELETE FROM student
WHERE marks < 80;

ALTER TABLE student
DROP COLUMN grade;

--------------------------------------------------------------------------------------------------------------------------------------------------------
                                                         