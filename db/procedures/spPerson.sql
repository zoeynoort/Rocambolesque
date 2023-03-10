-- spAddPerson START

DROP PROCEDURE IF EXISTS spAddPerson;

DELIMITER //

-- firstname varchar(60)
-- infix varchar(30)
-- lastname varchar(50)
-- dateOfBirth date

CREATE PROCEDURE spAddPerson
( -- Dit zijn alle argumenten die je meegeeft met het aanroepen van de procedure
  p_firstName varchar(60), 
  p_infix varchar(30),
  p_lastName varchar(50),
  p_dateOfBirth date
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 
        ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;
    
    START TRANSACTION;
        INSERT INTO Person (firstname, infix, lastname, dateOfBirth, createdAt, updatedAt) VALUES (p_firstName, p_infix, p_lastName, p_dateOfBirth, SYSDATE(6), SYSDATE(6));
    COMMIT;
END //
DELIMITER ;

-- spAddPerson END

-- spDeletePerson START

DROP PROCEDURE IF EXISTS spDeletePerson;

DELIMITER //

-- id int(6)
-- (id van het persoon dat je wilt verwijderen) 

CREATE PROCEDURE spDeletePerson
(
  p_id int(6) 
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 
        ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;
    
    START TRANSACTION;
        DELETE FROM person WHERE id = p_id;
    COMMIT;
END //
DELIMITER ;

-- spDeletePerson END

-- spEditPerson START

-- id int(6) 
-- (id van persoon dat je wilt bewerken)

-- firstname varchar(60)
-- infix varchar(30)
-- lastname varchar(50)
-- dateOfBirth date
-- isActive boolean
-- comment varchar(250)
-- (waarden van persoon dat je bewerkt)

DROP PROCEDURE IF EXISTS spEditPerson;

DELIMITER //

CREATE PROCEDURE spEditPerson
(
  p_id int(6),
  p_firstname varchar(60),
  p_infix varchar(30),
  p_lastname varchar(50),
  p_dateOfBirth date,
  p_isActive boolean,
  p_comment varchar(250)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 
        ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;
    
    START TRANSACTION;
        UPDATE Person SET
            firstname = p_firstname,
            infix = p_infix,
            lastname = p_lastname,
            dateOfBirth = p_dateOfBirth,
            isActive = p_isActive,
            comment = p_comment,
            updatedAt = SYSDATE(6)
        WHERE id = p_id;
    COMMIT;
END //

DELIMITER ;

-- spEditPerson END