DROP PROCEDURE IF EXISTS spReservationAdd;

DELIMITER //

CREATE PROCEDURE spReservationAdd
(
    personId int,
    timeslotId int,
    tableId int,
    day date,
    adults int,
    childs int
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN 
        ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;
    START TRANSACTION;
        INSERT INTO Reservation (personId, timeslot, tableId, day, adults, childs) VALUES (personId, timeslotId, tableId, day, adults, childs);
    COMMIT;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS spReservationDelete;

DELIMITER //

CREATE PROCEDURE spReservationDelete
(
    reservationId int
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN 
        ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;
    START TRANSACTION;
        DELETE FROM Reservation WHERE id = reservationId;
    COMMIT;
END //
DELIMITER ;