/**************************************************SQL Sub Queries**********************************************************/
/*********************A Subquery or Inner query or a Nested query is a query within another SQL query.**********************/
/****Query ---->>>>>Sub Query***************************/
/*********It involves 2 select statements.**************/
/******** THERE ARE THREE TYPES TO WRITE SUB QUERIES FIRST ONE IS "SELECT" AND THE SECOND ONE IS "FROM" AND THE THIRD ONE IS "WHERE"(MOST USE WHERE)*************/
/****Syntax
SELECT column(s)
FROM table_name
WHERE col_name operator
( subquery );****/

CREATE DATABASE STUDENTS;
USE STUDENTS;

CREATE TABLE STUDENT(
	rollno INT,
    name VARCHAR(50),
    class INT NOT NULL,
    marks INT NOT NULL,
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
drop table student;

/*QUES: GET NAME OF ALL STUDENTS WHO SCORED MORE THAN CLAS AVERAGE*/
/*STEP1: FIND THE AVERAGE OF CLASS
  STEP2: FIND THE NAMES OF STUDENTS WITH MARKS > AVG*/
  
SELECT AVG(marks)
FROM student; /**74.333*/

SELECT name 
FROM student
WHERE marks > 74.33;

SELECT name, marks 
FROM student
WHERE marks > 74.33;

/*IN BELOW QUERIES AGAR KOI BHI NEW STUDENT YA KUCH CHANGE HOTA HAI MARKS MEIN TOH YE QUERY AUTOMATICALLY KHUD USS NEW STUDENT KO ADD KRKE AVERAGE NIKAAL KR DEDEGI*/
/*HUMKO ISS QUERY MEIN KUCH BHI CHANGE KRNE KI ZARURAT NHI HOGI YE APNE AAP SABH KAREGI*/

SELECT name, marks
FROM student
WHERE marks >(SELECT avg(marks) FROM student);

INSERT INTO student 
(rollno, name, class, marks, grade, city, pincode)
VALUES
(107, "PRASHANT SAINI", 12, 98, "A", "ALIGARH", 202001);


/*FIND THE NAMES OF ALL STUDENTS WITH EVEN ROLL NUMBER*/
/*STEP1: FIND THE EVEN ROLL NUMBERS
  STEP2: FIND THE NAMES OF STUDENTS WITH EVEN ROLL NUMBER*/ 

SELECT rollno 
FROM STUDENT 
WHERE rollno % 2 = 0;

SELECT name 
FROM student
WHERE rollno IN (102, 104, 106);

SELECT name, rollno 
FROM student
WHERE rollno IN (102, 104, 106);

SELECT name, rollno 
FROM student
WHERE rollno IN (
		SELECT rollno 
		FROM STUDENT 
		WHERE rollno % 2 = 0);
        

/*******************************EXAMPLES WITH FROM******************************/
/********************FIND THE MAX MARKS FROM THE STUDENTS OF DELHL**************/
/*STEP1: FIND THE STUDENTS OF DELHI
  STEP2: FIND THEIR MAX MARKS USING THE SUBLIST IN STEP 1************************/
  
UPDATE student
SET marks = 92
WHERE rollno = 105;

SET SQL_SAFE_UPDATES = 0;
SELECT * FROM STUDENT;

SELECT name, rollno
FROM student
WHERE city = "DELHI"; 

SELECT *
FROM student
WHERE city = "DELHI"; 

SELECT MAX(marks)
FROM (
	SELECT *
	FROM student
	WHERE city = "DELHI") AS temp;

SELECT MAX(marks)
FROM (
	SELECT *
	FROM student
	WHERE city = "MUMBAI") AS temp;    



SELECT MIN(marks)
FROM (
	SELECT *
	FROM student
	WHERE city = "DELHI") AS temp;
    
SELECT MAX(marks)
FROM student
WHERE city = "Delhi";    


/*******************************EXAMPLES WITH select******************************/

SELECT (SELECT MAX(marks) FROM student), name 
FROM student; 