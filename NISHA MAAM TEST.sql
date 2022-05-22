CREATE TABLE DEPTT
(
	DEPTNO INT,
    DNAME VARCHAR(15),
	LOC VARCHAR(10)
);

INSERT INTO DEPTT VALUES 
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

CREATE TABLE EMPT
(
	EMPNO int,
	ENAME varchar(10),
	JOB varchar(9),
	HIREDATE date,
	SAL float,
	COMM float,
	DEPTNO int
);

INSERT INTO EMPT VALUES 
(7839, 'KING', 'MANAGER', '1991-11-17', 5000, NULL, 10),
(7698, 'BLAKE', 'CLERK', '1981-05-01', 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', '1981-06-09', 2450, NULL, 10),
(7566, 'JONES', 'CLERK', '1981-04-02', 2975, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', '1981-09-28', 1250, 1400, 30),
(7499, 'ALLEN', 'SALESMAN', '1981-02-20', 1600, 300, 30);

/*1. Find the names of all employees hired in the month of February (of any year).*/
SELECT ENAME FROM EMPT
WHERE month(HIREDATE)=2;

/*2. Find the names of all employees whose name ends with the letter ‘M’.*/
SELECT ENAME FROM EMPT
WHERE ENAME LIKE '%M';

/*3. Display the ENAME and JOB for all employees who belong to the same DEPTNO as employee ‘KING’.*/
SELECT ENAME , JOB FROM EMPT
WHERE DEPTNO=
(SELECT DEPTNO FROM EMPT
WHERE ENAME='KING');

/*4. Display the HRA for each employee given that HRA is 20% of SAL.*/
SELECT EMPNO, ENAME, SAL*0.2 AS 'HRA' FROM EMPT;

/*5. Display the JOB column with duplicate values suppressed.*/
SELECT DISTINCT JOB FROM EMPT;

/*6. Display the Enames and the corresponding Dnames.*/
SELECT ENAME, DEPTT.DNAME FROM EMPT, DEPTT
WHERE EMPT.DEPTNO=DEPTT.DEPTNO;

/*7. Display the employees in descending order of DEPTNO.*/
SELECT DEPTNO, EMPNO, ENAME FROM EMPT
ORDER BY DEPTNO DESC;

/*8. Find the names of all employees who do not receive any commission.*/
SELECT ENAME FROM EMPT
WHERE COMM IS NULL;

/*9. Display the employee name and employee number of the employees with the headings as NUMBER and NAME.*/
SELECT EMPNO NUMBER, ENAME NAME FROM EMPT;

/*10.Find the name of the employee who is receiving the maximum salary.*/
SELECT EMPNO, ENAME FROM EMPT
WHERE SAL=
(SELECT MAX(SAL) FROM EMPT);

/*11.Display the sum of SAL for all the employees belonging to DEPTNO 10.*/
SELECT SUM(SAL) FROM EMPT 
WHERE DEPTNO=10;

/*12.Display the rows where JOB column ends with the letter ‘T’.*/
SELECT * FROM EMPT
WHERE JOB LIKE '%T';



/*Procedures , Function*/
/*1.Write a stored procedure to convert a temperature in Fahrenheit (F) to its
equivalent in Celsius (C). The required formula is:- C= (F-32)*5/9 Insert the
temperature in Centigrade into TEMPP table.*/
CREATE TABLE TEMPP
(
	FAHRENHEIT FLOAT,
    CELSIUS FLOAT
);
DELIMITER //
CREATE PROCEDURE FTOC(F FLOAT)
BEGIN
	DECLARE C FLOAT;
    SET C= (F-32)*5/9;
    INSERT INTO TEMPP VALUES (F, C);
END; //
DELIMITER ;

CALL FTOC(105);
CALL FTOC(110.5);
SELECT * FROM TEMPP;


/*Write a stored function by the name of Num_cube. The stored function
should return the cube of a number ‘N’. The number ‘N’ should be passed to the
stored function as a parameter.*/

CREATE TABLE OUTPUT1
(
	X FLOAT,
    X_CUBE FLOAT
);

DELIMITER //
CREATE PROCEDURE NUM_CUBE(N FLOAT)
BEGIN
	DECLARE C FLOAT;
    SET C=N*N*N;
    INSERT INTO OUTPUT1 VALUES (N,C);
END;//
DELIMITER ;

CALL NUM_CUBE(5);
CALL NUM_CUBE(5.5);
SELECT * FROM OUTPUT1;
