-- id firstname infix lastname dateOfBirth isActive comment createdAt updatedAt

DROP PROCEDURE IF EXISTS spReadMenu;

DELIMITER //

CREATE PROCEDURE spReadMenu
( -- Het id van het menu dat je wilt lezen

  p_id int(6) 
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 
        ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;
    
    START TRANSACTION;
        SELECT item.name AS itemName, item.id, menu.name AS menuName, item.ingredients FROM item
        INNER JOIN itemmenu ON item.id = itemmenu.itemId
        INNER JOIN menu ON itemmenu.menuId = menu.id
        WHERE itemmenu.menuId = p_id;
    COMMIT;
END //
DELIMITER ;