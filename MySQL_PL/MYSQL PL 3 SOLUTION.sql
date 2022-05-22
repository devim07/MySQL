/*EXERCISE 3*/
CREATE TABLE OUTPUT(
LABLE VARCHAR(15),
ANS FLOAT
);
DROP TABLE OUTPUT;

CREATE TABLE TEMP
(
	LAB1 VARCHAR(15),
    LAB2 VARCHAR(15)
);

/*1. Write a program containing a loop that iterates from 1 to 1000 using a variable I, which is incremented each time around the loop. 
The program should output the value of I every hundred iterations (i.e., the output should be 100, 200, etc.).*/
DELIMITER //
CREATE PROCEDURE CENT()
BEGIN
	DECLARE X INT DEFAULT 1;
    WHILE (X<=1000) DO
		IF(MOD(X,100)=0) THEN
			INSERT INTO OUTPUT VALUES (NULL, X);
        END IF;
        SET X=X+1;
    END WHILE;
END;//
DELIMITER ;
CALL CENT();
DROP PROCEDURE CENT;
SELECT * FROM OUTPUT;


/*2. Write a program that examines all the numbers from 1 to 999, displaying all those for which the sum of the cubes of the digits equal the number itself.*/
DELIMITER //
CREATE PROCEDURE ARM()
BEGIN
	DECLARE X INT DEFAULT 1;
    WHILE (X<1000) DO
		IF (POWER(MOD(X,10),3)+POWER(MOD(X DIV 10,10) ,3)+POWER(MOD(X DIV 100, 10) ,3)=X) THEN
			INSERT INTO OUTPUT VALUES (NULL, X);
        END IF;
        SET X=X+1;
    END WHILE;
END;//
DELIMITER ;
CALL ARM();
DROP PROCEDURE ARM;
SELECT * FROM OUTPUT;
TRUNCATE OUTPUT;


/*3. Write a program that Selects from any table a minimum and maximum value for a radius, along with an increment factor, 
and generates a series of radii by repeatedly adding the increment to the minimum until the maximum is reached. 
For each value of the radius, compute and display the circumference, area, and volume of the sphere. 
(Be sure to include both the maximum and the minimum values.).*/
CREATE TABLE RADII
(
	MIN FLOAT,
    MAX FLOAT,
    INC FLOAT
);
INSERT INTO RADII VALUES
(23,30, 1),
(5, 20, 3),
(1.5, 5.5, 0.5);
CREATE TABLE TEMP2
(
	RADII FLOAT,
    `VALUE` FLOAT,
    REMARK VARCHAR(15)
);
DELIMITER //
CREATE PROCEDURE SPHERE()
BEGIN
	DECLARE MI FLOAT;
    DECLARE MX FLOAT;
    DECLARE X FLOAT;
    DECLARE PI FLOAT DEFAULT 22/7;
    DECLARE H INT DEFAULT 0;
    DECLARE CU CURSOR FOR SELECT * FROM RADII;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET H=1;
    OPEN CU ;
		CU_LOOP:LOOP
			FETCH CU INTO MI, MX, X;
            IF H=1 THEN
				LEAVE CU_LOOP;
            END IF;
            WHILE(MI<=MX) DO
				INSERT INTO TEMP2 VALUES 
					(MI, 2*PI*MI, 'CIRCUMFERENCE'),
					(MI, 4*PI*MI*MI, 'SURFACE AREA'),
					(MI, (4/3)*PI*(POWER(MI,3)), 'VOLUME');
                SET MI=MI+X;
            END WHILE;
        END LOOP CU_LOOP;
    CLOSE CU ;
END;//
DELIMITER ;
CALL SPHERE();
SELECT * FROM TEMP2;
TRUNCATE TEMP2;


/*4. A palindrome is a word that is spelled the same forward and backward, such as level, radar, etc. 
Write a program to Selects from any table a five letter word and determine whether it is a palindrome.*/

INSERT INTO TEMP (LAB1) VALUES 
('HELLO'),('HOW'),('LEVEL'),('RADAR'),('MALAYALAM'),('ABCBA');
SELECT * FROM TEMP;
DELIMITER //
CREATE PROCEDURE PALI()
BEGIN
	DECLARE H INT DEFAULT 0;
    DECLARE WORD VARCHAR(15);
    DECLARE CU CURSOR FOR SELECT LAB1 FROM TEMP WHERE LENGTH(LAB1)=5;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET H=1;
    OPEN CU;
		CU_LOOP:LOOP
			FETCH CU INTO WORD;
			IF (H=1) THEN
				LEAVE CU_LOOP;
            END IF;
            IF(WORD=REVERSE(WORD)) THEN
				INSERT INTO OUTPUT VALUES ('PALI-', NULL);
			ELSE
				INSERT INTO OUTPUT VALUES ('NOT PALI-', NULL);
            END IF;
        END LOOP CU_LOOP;
    CLOSE CU;
END; //
DELIMITER ;
DROP PROCEDURE PALI;
CALL PALI();
TRUNCATE OUTPUT;
SELECT * FROM OUTPUT;


/*5. Modify the above program to Select from any table a variable length word. This requires determining how many characters are read in.*/
INSERT INTO TEMP (LAB1) VALUES 
('HELLO'),('HOW'),('LEVEL'),('RADAR'),('MALAYALAM'),('ABCBA');
SELECT * FROM TEMP;
DELIMITER //
CREATE PROCEDURE PALIN()
BEGIN
	DECLARE H INT DEFAULT 0;
    DECLARE WORD VARCHAR(15);
    DECLARE CU CURSOR FOR SELECT LAB1 FROM TEMP;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET H=1;
    OPEN CU;
		CU_LOOP:LOOP
			FETCH CU INTO WORD;
			IF (H=1) THEN
				LEAVE CU_LOOP;
            END IF;
            IF(WORD=REVERSE(WORD)) THEN
				INSERT INTO OUTPUT VALUES ('PALI-', NULL);
			ELSE
				INSERT INTO OUTPUT VALUES ('NOT PALI-', NULL);
            END IF;
        END LOOP CU_LOOP;
    CLOSE CU;
END; //
DELIMITER ;
DROP PROCEDURE PALIN;
CALL PALIN();
TRUNCATE OUTPUT;
SELECT * FROM OUTPUT;


