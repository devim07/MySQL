create table author 
(
	author_id integer primary key, 
    authorName varchar(30), 
    email varchar (25), 
    gender varchar (6)
);

create table book 
(
	BookId integer not null unique, 
    ISBN integer primary key, 
    book_name varchar (30) not null, 
    author integer, 
    ed_num integer, 
    price integer, 
    pages integer, 
    foreign key (author) references author (author_id) 
);
drop table book;
insert into author values (1, "Kraig Muller", "Wordnewton@gmail.com", "Male");
insert into author values (2, "Karrie Nicolette", "karrie23@gmail.com", "Female"); 

insert into book values (1, 001, "Glimpses of the past", 1, 1, 650, 396); 
insert into book values (2, 002, "Beyond The Horizons of Venus", 1, 1, 650, 396); 
insert into book values (3, 003, "Ultrasonic Aquaculture", 2, 1, 799, 500); 
insert into book values (4, 004, "Cyrogenic Engines", 2, 1, 499, 330);


/*1. Write a Procedure (with no parameters) to display all the books*/
DELIMITER //
CREATE PROCEDURE DISPLAY()
BEGIN
	SELECT * FROM BOOK;
END; //
DELIMITER ;
CALL DISPLAY();


/*2. Write a Procedure to update price of a book taking ISBN of the book and its new price as input:*/
DELIMITER //
CREATE PROCEDURE UPDATE_PRICE(X INT, PR INT)
BEGIN
	UPDATE BOOK SET PRICE=PR WHERE ISBN=X;
END; //
DELIMITER ;
CALL UPDATE_PRICE(3, 1000);


/*3. Write a Procedure to display the highest price among all the books with an output parameter:*/
DELIMITER //
CREATE PROCEDURE HIGHEST()
BEGIN
	SELECT * FROM BOOK WHERE PRICE=
    (SELECT MAX(PRICE) FROM BOOK);
END; //
DELIMITER ;
CALL HIGHEST();


/*4. Write a Procedure to take gender type input (‘Male’/’Female’ here) with an in-out
parameter which reflects the number of authors falling in that gender category/type:*/
SET @M=0;
SET @F=0;
DELIMITER //
CREATE PROCEDURE GENDER_COUNT(INOUT NUM INT, GEN VARCHAR(6))
BEGIN
	SELECT COUNT(GENDER) INTO NUM FROM AUTHOR WHERE GENDER=GEN;
END; //
DELIMITER ;
CALL GENDER_COUNT(@M, 'Male');
SELECT @M FROM DUAL;
CALL GENDER_COUNT(@F, 'Female');
SELECT @F FROM DUAL;select substring('dinesh', -7);