DROP PROCEDURE IF EXISTS spAddUser;

DELIMITER //

CREATE PROCEDURE spAddUser
(
  p_id int(6),
  p_personId int(6),
  p_username varchar(60),
  p_password varchar(256)
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 
        ROLLBACK;
        SELECT 'ERROR';
    END;
    
    START TRANSACTION;
        INSERT INTO User (id, personId, username, password) VALUES (p_id, p_personId, p_username, p_password);
    COMMIT;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS spUpdateUser;

DELIMITER //

CREATE PROCEDURE spUpdateUser
(
  p_id int(6), 
  p_personId int(6), 
  p_username varchar(60), 
  p_password varchar(256) 
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 
        ROLLBACK;
        SELECT 'ERROR';
    END;
    
    START TRANSACTION;
        UPDATE User SET
            personId = p_personId,
            username = p_username,
            password = p_password
        WHERE id = p_id;
    COMMIT;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS spDeleteUser;

DELIMITER //

CREATE PROCEDURE spDeleteUser
(
  p_id int(6) 
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 
        ROLLBACK;
        SELECT 'ERROR';
    END;
    
    START TRANSACTION;
        DELETE FROM User WHERE id = p_id;
    COMMIT;
END //
DELIMITER ;