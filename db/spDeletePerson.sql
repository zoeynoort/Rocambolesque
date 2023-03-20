-- id firstname infix lastname dateOfBirth isActive comment createdAt updatedAt

DROP PROCEDURE IF EXISTS spDeletePerson;

DELIMITER //

CREATE PROCEDURE spDeletePerson
( -- Dit zijn alle argumenten die je meegeeft met het aanroepen van de procedure
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