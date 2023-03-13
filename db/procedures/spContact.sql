-- Id personId phone email isActive comment createdAt updatedAt

DROP PROCEDURE IF EXISTS spAddContact;

DELIMITER //

CREATE PROCEDURE spAddContact
( -- Dit zijn alle argumenten die je meegeeft met het aanroepen van de conventions
  personId int(10), 
  phone varchar(20),
  email varchar(320)
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 
        ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;

    START TRANSACTION;
        INSERT INTO contact (personId, phone, email, createdAt, updatedAt) VALUES (personId, phone, email, SYSDATE(6), SYSDATE(6));
    COMMIT;
END //
DELIMITER ;

-- delete start
-- Id personId phone email isActive comment createdAt updatedAt

DROP PROCEDURE IF EXISTS spDeleteContact;

DELIMITER //

CREATE PROCEDURE spDeleteContact
( -- Dit zijn alle argumenten die je meegeeft met het aanroepen van de conventions
  Id int(10)
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 
        ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;

    START TRANSACTION;
       DELETE FROM contact WHERE id = Id;
    COMMIT;
END //
DELIMITER ;

-- edit start
-- Id personId phone email isActive comment createdAt updatedAt

DROP PROCEDURE IF EXISTS spEditContact;

DELIMITER //

CREATE PROCEDURE spEditContact
( -- Dit zijn alle argumenten die je meegeeft met het aanroepen van de conventions
  personId int(10), 
  phone varchar(20),
  email varchar(320),
  isActive bit(1),
  comment varchar(250),
  Id int(10)

) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 
        ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;

    START TRANSACTION;
        UPDATE contact SET 
            personId = personId,
            phone = phone,
            email = email,
            isActive = isActive,
            comment = comment,
            updatedAt = SYSDATE(6)
        WHERE id = Id;
    COMMIT;
END //
DELIMITER ;