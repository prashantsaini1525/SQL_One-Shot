/**********************************************************Union***************************************************************/
/******It is used to combine the result-set of two or more SELECT statements. Gives UNIQUE records.
To Use it: 
		every SELECT should have same no. of columns
		columns must have similar data types
		columns in every SELECT should be in same order************************************************************************/

/*************************Syntax*********************************************
		SELECT column(s) FROM tableA
		UNION
		SELECT column(s) FROM tableB***/
        
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

SELECT name FROM EMPLOYEE
UNION
SELECT name FROM EMPLOYEE;

SELECT name FROM EMPLOYEE
UNION ALL
SELECT name FROM EMPLOYEE;