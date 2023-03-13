DROP PROCEDURE IF EXISTS spUserAdd;

DELIMITER //

CREATE PROCEDURE spUserAdd
(
    firstname varchar(60),
    infix varchar(30),
    lastname varchar(50),
    dateOfBirth date,
    username varchar(60),
    password varchar(256)
) 
BEGIN
    DECLARE personId 	INT UNSIGNED DEFAULT 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN 
        ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;
    START TRANSACTION;
        INSERT INTO Person (firstname, infix, lastname, dateOfBirth) VALUES (firstname, infix, lastname, dateOfBirth);
        SET personId = LAST_INSERT_ID();
        INSERT INTO User (personId, username, password) VALUES (personId, username, password);
    COMMIT;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS spUserDelete;

DELIMITER //

CREATE PROCEDURE spUserDelete
(
   id int
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN 
        ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;
    START TRANSACTION;
        DELETE FROM User WHERE id = id;
    COMMIT;
END //
DELIMITER ;