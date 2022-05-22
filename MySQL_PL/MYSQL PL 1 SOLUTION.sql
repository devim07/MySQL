/*EXERCISE 1*/

CREATE TABLE OUTPUT(
LABLE VARCHAR(15),
ANS FLOAT
);

/*1. Write a program that computes the perimeter and the area of a rectangle. 
Define your own values for the length and width. 
(Assuming that L and W are the length and width of the rectangle, Perimeter = 2*(L+W) and Area = L*W. */

DELIMITER //
CREATE PROCEDURE RECTANGEL (LENGTH FLOAT, WIDTH FLOAT)
BEGIN
	DECLARE AREA FLOAT;
    DECLARE PERIMETER FLOAT;
    SET PERIMETER=2*(LENGTH+WIDTH);
    SET AREA= LENGTH*WIDTH;
    INSERT INTO OUTPUT VALUES 
		('LENGTH', LENGTH),
        ('WIDTH', WIDTH),
		('AREA', AREA),
        ('PERIMETER', PERIMETER);    
END; //
DELIMITER ;
CALL RECTANGEL(2,3);
SELECT * FROM OUTPUT;
CALL RECTANGEL(2.5,3.1);
SELECT * FROM OUTPUT;
TRUNCATE OUTPUT;


/*2. Write a program that declares an integer variable called num, assigns a value to it, 
and computes and inserts into the tempp table the value of the variable itself, its square, and its cube.*/
DELIMITER //
CREATE PROCEDURE SQ_CU(NUM INT)
BEGIN
	DECLARE SQUARE INT;
    DECLARE `CUBE` INT;
    SET SQUARE=NUM*NUM;
    SET `CUBE`=SQUARE*NUM;
    INSERT INTO OUTPUT VALUES
		('NUM', NUM),
        ('SQUARE', SQUARE),
        ('CUBE', `CUBE`);
END;//
DELIMITER ;

CALL SQ_CU(2);
CALL SQ_CU(5);
SELECT * FROM OUTPUT;
TRUNCATE OUTPUT;


/*3. Convert a temperature in Fahrenheit (F) to its equivalent in Celsius (C) and vice versa. 
The required formulae are:- C= (F-32)*5/9   F= 9/5*C + 32*/
DELIMITER //
CREATE PROCEDURE TEMPERATURE(F FLOAT)
BEGIN
	DECLARE C FLOAT;
    SET C=(F-32)*5/9;
    SET F= 9/5*C + 32;
    INSERT INTO OUTPUT VALUES
		('CELSIUS',C),
        ('FAHRENHEIT', F);
END;//
DELIMITER ;

CALL TEMPERATURE (105);
CALL TEMPERATURE (27);
SELECT * FROM OUTPUT;
TRUNCATE OUTPUT;


/*4. Convert a number of inches into yards, feet, and inches. For example, 124 inches equals 3 yards, 1 foot, and 4 inches.*/
DELIMITER //
CREATE PROCEDURE LENGTH(X INT)
BEGIN
	DECLARE YARDS INT;
    DECLARE FEET INT;
    DECLARE INCH INT;
    SET YARDS= X/36;
    SET FEET=(X%36)/12;
    SET INCH= (X%36)%12;
    INSERT INTO OUTPUT VALUES
		('GIVEN', X),
        ('YARDS', YARDS),
        ('FEET', FEET),
        ('INCHES', INCH);
END;//
DELIMITER ;

CALL LENGTH(124);
CALL LENGTH(300);
SELECT * FROM OUTPUT;
TRUNCATE OUTPUT;


/*5. Write a program that enables a user to input an integer. 
The program should then state whether the integer is evenly divisible by 5.*/
DELIMITER //
CREATE PROCEDURE DIV5(N INT)
BEGIN
	DECLARE R INT;
    DECLARE RESULT VARCHAR(15);
    SET R=N%5;
    IF R=0 THEN SET RESULT='DIVISIBLE BY 5';
	ELSE SET RESULT='NOT DIVISIBLE-5';
    END IF;
    INSERT INTO OUTPUT VALUES 
		('INPUT', N),
        (RESULT, R);
END;//
DELIMITER ;

DROP PROCEDURE DIV5;
CALL DIV5(25);
CALL DIV5(126);
SELECT * FROM OUTPUT;
TRUNCATE OUTPUT;


/*6. Your block should read in two real numbers and 
tell whether the product of the two numbers is equal to or greater than 100.*/
DELIMITER //
CREATE PROCEDURE PRODUCT(A FLOAT, B FLOAT)
BEGIN
	DECLARE X FLOAT;
    SET X=A*B;
    IF(X>100) THEN
		INSERT INTO OUTPUT VALUES('> 100', X);
	ELSEIF (X=100) THEN
		INSERT INTO OUTPUT VALUES('= 100', X);
	END IF;
END;//
DELIMITER ;
CALL PRODUCT(23, 5);
CALL PRODUCT(0, 100);
DROP PROCEDURE PRODUCT;
SELECT * FROM OUTPUT;
TRUNCATE OUTPUT;