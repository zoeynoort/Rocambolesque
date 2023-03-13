-- Name: CreateUser
-- Input: id, personId, username, password
-- Output: id
DELIMETER / / CREATE PROCEDURE CreateUser(
    IN id INT,
    IN personId INT,
    IN username VARCHAR(60),
    IN password VARCHAR(256)
) BEGIN -- Rollback if person already exists
DECLARE EXIT HANDLER FOR 1062 BEGIN ROLLBACK;
SELECT 0 AS id;
END;
START TRANSACTION;
INSERT INTO User (id, personId, username, password)
VALUES (id, personId, username, password);
SELECT LAST_INSERT_ID() AS id;
COMMIT;
END;
DELIMITER;
-- Name: UpdateUser
-- Input: id or personId or username or password
-- Output: id
DELIMETER / / CREATE PROCEDURE UpdateUser(
    IN id INT,
    IN personId INT,
    IN username VARCHAR(60),
    IN password VARCHAR(256)
) BEGIN -- Rollback if person not exists
DECLARE EXIT HANDLER FOR 1062 BEGIN ROLLBACK;
SELECT 0 AS id;
END;
DELIMETER;
START TRANSACTION;
UPDATE User
SET personId = personId,
    username = username,
    password = password
WHERE id = id;
SELECT id;
COMMIT;
END;
-- Name: DeleteUser
-- Input: id
-- Output: id
DELIMETER / / CREATE PROCEDURE DeleteUser(IN id int) BEGIN -- Rollback if person not exists
DECLARE EXIT HANDLER FOR 1062 BEGIN ROLLBACK;
SELECT 0 AS id;
END;
DELIMETER;
START TRANSACTION;
DELETE FROM User
WHERE id = id;
SELECT id;
COMMIT;
END;