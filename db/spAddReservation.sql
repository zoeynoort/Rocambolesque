-- childs is possessive and children is multiple - grammar police
-- id firstname infix lastname dateOfBirth isActive comment createdAt updatedAt

DROP PROCEDURE IF EXISTS spAddReservation;

DELIMITER //

CREATE PROCEDURE spAddReservation
( -- Het id van het menu dat je wilt lezen

  p_person_id int(6),
  p_timeslot_id int(6),
  p_table_id int(6),
  p_day date,
  p_adults int(6),
  p_childs int(6)
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 
        ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;
    
    START TRANSACTION;
        INSERT INTO reservation
        VALUES (null, p_person_id, p_timeslot_id, p_table_id, p_day, p_adults, p_childs, null, null, SYSDATE(6), SYSDATE(6));
    COMMIT;
END //
DELIMITER ;