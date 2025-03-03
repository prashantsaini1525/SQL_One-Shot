/*************************************MySQL Views******************************************/
/*A view is a virtual table based on the result-set of an SQL statement.

/****************A view always shows up-to-date data. The
database engine recreates the view, every time a
user queries it.***************************************/

/*********** TABLE --> REAL --> REAL DATA --> OPERATIONS*******************/
/*********** VIEW --> VIRTUAL --> REAL DATA --> OPERATIONS*******************/

CREATE VIEW view1 AS
SELECT rollno, name, marks FROM student;

SELECT * FROM view1;
drop view view1;