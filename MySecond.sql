CREATE DATABASE RADHEYSWEETS;
USE RADHEYSWEETS;

CREATE TABLE employeeinfo(
id INT PRIMARY KEY,
name varchar(50),
salary INT 
);

INSERT INTO employeeinfo
(id, name, salary)
VALUES
(1, "PRASHANTSAINI", 10000),
(2, "MOHITSHRIVASATVA", 2000),
(3, "ARYANTHAKUR", 3000),
(4, "RITIKKUMAR", 4000),
(5, "RITIKSINGH", 5000);

INSERT INTO employeeinfo
(id, name, salary)
VALUES
(6, "ADAM", 25000),
(7, "BOB", 30000),
(8, "CASEY", 35000);

SELECT * FROM employeeinfo;

------------------------------------------------------------------------------------------
/*in this UNIQUE command defines we cannot store same values in unique command*/

CREATE TABLE temp1(
id INT UNIQUE
);

INSERT INTO temp1 VALUES (101);
INSERT INTO temp1 VALUES (101);

SELECT * FROM temp1;

-------------------------------------------------------------------------------------------
/*This is the first syntax to make primary key of any column*/
CREATE TABLE temp2 (
id INT PRIMARY KEY
);

INSERT INTO temp2 VALUES (103);
INSERT INTO temp2 VALUES (104);

SELECT * FROM temp2;

--------------------------------------------------------------------------------------------
/*This is the second syntax to make primary key of any column*/
CREATE TABLE temp3 (
id INT,
name VARCHAR(50),
age INT,
city VARCHAR(50),
PRIMARY KEY (id)
);

---------------------------------------------------------------------------------------------
/*in default constraint the default value/salary which is set by us for the employees can be automatically transfer to the emppoyee if the proper salary wasnot store in our database 
so the default salary will be tranfered automatically to the emmployees*/
CREATE TABLE emp (
id INT,
salary INT DEFAULT 25000
);

INSERT INTO emp (id) VALUES (101);

SELECT * FROM emp;