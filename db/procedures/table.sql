DROP PROCEDURE IF EXISTS spTableAdd;

DELIMITER //

CREATE PROCEDURE spTableAdd
(
    number int,
    hasChildSeats bit
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN 
        ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;
    START TRANSACTION;
        INSERT INTO Table (number, hasChildSeats) VALUES (number, hasChildSeats);
    COMMIT;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS spTableDelete;

DELIMITER //

CREATE PROCEDURE spTableDelete
(
    tableId int
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN 
        ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;
    START TRANSACTION;
        DELETE FROM Table WHERE id = tableId;
    COMMIT;
END //
DELIMITER ;