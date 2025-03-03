/************************************Joins in SQL********************/
/*Join is used to combine rows from two or more tables, based on a related column between them.*/

/*IN SQL THERE ARE TWO TYPES OF JOINS 
1. INNER JOIN
2. OUTER JOINS :- THERE ARE THREE TYPES OF OUTER JOIN  1. LEFT JOIN 
													   2. RIGHT JOIN
                                                       3. FULL JOIN */
 
CREATE DATABASE SCHOOL;
USE SCHOOL;

CREATE TABLE STUDENT (
student_id INT,
name VARCHAR(50)
);

INSERT INTO STUDENT
(student_id, name)
VALUES
(101, "ADAM"),
(102, "BOB"),
(103, "CASEY");

SELECT * FROM SCHOOL;

CREATE TABLE COURSE (
student_id INT,
course VARCHAR(50)
);

INSERT INTO COURSE
(student_id, course)
VALUES
(102, "ENGLISH"),
(105, "MATH"),
(103, "SCIENCE"),
(107, "COMPUTER SCIENCE");

SELECT * FROM COURSE;

/*****************************Inner Join*********************************************/
/******Returns records that have matching values in both tables**********************/
/*Syntax
SELECT column(s)
FROM tableA
INNER JOIN tableB
ON tableA.col_name = tableB.col_name;*/

SELECT * 
FROM STUDENT
INNER JOIN COURSE
ON STUDENT.student_id = COURSE.student_id;

/*ANOTHER MEHTOD*/

SELECT * 
FROM STUDENT as s
INNER JOIN COURSE as c
ON s.student_id = c.student_id;


/****************************Left Join*******************************************************/
/*Returns all records from the left table, and the matched records from the right table*/
/**Syntax
SELECT column(s)
FROM tableA
LEFT JOIN tableB
ON tableA.col_name = tableB.col_name;****/

SELECT * 
FROM STUDENT
LEFT JOIN COURSE
ON STUDENT.student_id = COURSE.student_id;

SELECT * 
FROM STUDENT as s
LEFT JOIN COURSE as c
ON s.student_id = c.student_id;

/*******************************Right Join********************************************************************/
/*********Returns all records from the right table, and the matched records from the left table***************/
/*Syntax
SELECT column(s)
FROM tableA
RIGHT JOIN tableB
ON tableA.col_name = tableB.col_name;*/

SELECT * 
FROM STUDENT
RIGHT JOIN COURSE
ON STUDENT.student_id = COURSE.student_id;

SELECT * 
FROM STUDENT as s
RIGHT JOIN COURSE as c
ON s.student_id = c.student_id;


/***********************************Full Join***********************************************************/
/********Returns all records when there is a match in either left or right table*******************/
/*Syntax in MySQL
SELECT * FROM STUDENT as a
LEFT JOIN COURSE as b
ON a.student_id = b.student_id
UNION
SELECT * FROM STUDENT as a 
RIGHT JOIM COURSE as b
ON s.student_id = c.student_id;*/

SELECT * 
FROM STUDENT as s
LEFT JOIN COURSE as c
ON s.student_id = c.student_id
UNION
SELECT * 
FROM STUDENT as s
RIGHT JOIN COURSE as c
ON s.student_id = c.student_id;


/************************************Qs: Write SQL commands to display the right exclusive join :***************************/
/************************************1. Left Exclusive Join 2. Right Exclusive Join 3.Full Exclusive join************************/
/************************************1. Left Exclusive Join *****************************************************************/

SELECT *
FROM STUDENT 
LEFT JOIN COURSE 
ON STUDENT.student_id = COURSE.student_id
WHERE COURSE.student_id IS NULL;

SELECT *
FROM STUDENT as s 
LEFT JOIN COURSE as c 
ON s.student_id = c.student_id
WHERE C.student_id IS NULL;

/************************************2. Right Exclusive Join*****************************************************************/

SELECT *
FROM STUDENT 
RIGHT JOIN COURSE 
ON STUDENT.student_id = COURSE.student_id
WHERE STUDENT.student_id IS NULL;

SELECT *
FROM STUDENT as s 
RIGHT JOIN COURSE as c
ON s.student_id = c.student_id
WHERE s.student_id IS NULL;

/************************************3. Full Exclusive Join*****************************************************************/

SELECT *
FROM STUDENT 
LEFT JOIN COURSE 
ON STUDENT.student_id = COURSE.student_id
WHERE COURSE.student_id IS NULL
UNION
SELECT *
FROM STUDENT 
RIGHT JOIN COURSE 
ON STUDENT.student_id = COURSE.student_id
WHERE STUDENT.student_id IS NULL;


/******************************************Self Join************************************************/
/**************It is a regular join but the table is joined with itself.************************/
/*Syntax
SELECT column(s)
FROM table as a
JOIN table as b
ON a.col_name = b.col_name;*/

CREATE DATABASE COMPANY;
USE COMPANY;

CREATE TABLE EMPLOYEE (
employee_id INT,
name VARCHAR(50), 
manager_id INT NULL);

INSERT INTO EMPLOYEE
(employee_id, name, manager_id)
VALUES
(101, "adam", 103),
(102, "bob", 104),
(103, "casey", NULL),
(104,"donald", 103); 

SELECT * FROM EMPLOYEE;

 

SELECT a.name, b.name
FROM EMPLOYEE as a
JOIN EMPLOYEE as b
ON a.employee_id = b.manager_id; 

SELECT a.name as manager_name, b.name
FROM EMPLOYEE as a
JOIN EMPLOYEE as b
ON a.employee_id = b.manager_id; 


