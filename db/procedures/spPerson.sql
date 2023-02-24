DROP PROCEDURE IF EXISTS spAddPerson;

DELIMITER //

CREATE PROCEDURE spAddPerson
(
  firstname varchar(60), 
  infix varchar(30),
  lastname varchar(50)
  dateOfBirth date
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN 
        ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;
    START TRANSACTION;
        INSERT INTO Person (firstname, infix, lastname, dateOfBirth) VALUES (firstname, infix, lastname, dateOfBirth);
    COMMIT;
END //
DELIMITER ;