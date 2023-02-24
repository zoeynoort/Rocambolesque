-- Name: CreatePerson
-- Input: firstname, infix, lastname, dateOfBirth
-- Output: id
DELEMETER / / CREATE PROCEDURE CreatePerson(
    IN firstname varchar(60),
    IN infix varchar(30),
    IN lastname varchar(50),
    IN dateOfBirth date
) BEGIN -- Rollback if person already exists
DECLARE EXIT HANDLER FOR 1062 BEGIN ROLLBACK;
SELECT 0 AS id;
END;
START TRANSACTION;
INSERT INTO Person (firstname, infix, lastname, dateOfBirth)
VALUES (firstname, infix, lastname, dateOfBirth);
SELECT LAST_INSERT_ID() AS id;
COMMIT;
END;
DELEMETER;
-- Name: UpdatePerson
-- Input: id or firstname or infix or lastname or dateOfBirth
-- Output: id
DELEMETER / / CREATE PROCEDURE UpdatePerson(
    IN id int,
    IN firstname varchar(60),
    IN infix varchar(30),
    IN lastname varchar(50),
    IN dateOfBirth date
) BEGIN -- Rollback if person not exists
DECLARE EXIT HANDLER FOR 1062 BEGIN ROLLBACK;
SELECT 0 AS id;
END;
DELEMETER;
START TRANSACTION;
UPDATE Person
SET firstname = firstname,
    infix = infix,
    lastname = lastname,
    dateOfBirth = dateOfBirth
WHERE id = id;
SELECT id;
COMMIT;
END;
-- Name: DeletePerson
-- Input: id
-- Output: id
DELEMETER / / CREATE PROCEDURE DeletePerson(IN id int) BEGIN -- Rollback if person not exists
DECLARE EXIT HANDLER FOR 1062 BEGIN ROLLBACK;
SELECT 0 AS id;
END;
DELEMETER;
START TRANSACTION;
DELETE FROM Person
WHERE id = id;
SELECT id;
COMMIT;
END;