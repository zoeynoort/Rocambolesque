-- Drop
DROP DATABASE IF EXISTS rocambolesque;
CREATE DATABASE rocambolesque;

USE rocambolesque;

-- Tables
CREATE TABLE `Person` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `firstname` varchar(60) NOT NULL,
  `infix` varchar(30),
  `lastname` varchar(50) NOT NULL,
  `dateOfBirth` date NOT NULL
);

CREATE TABLE `Contact` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `personId` int,
  `phone` varchar(20) NOT NULL,
  `email` varchar(320) NOT NULL
);

CREATE TABLE `User` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `personId` int NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(256) NOT NULL
);

CREATE TABLE `Timeslot` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `start` time,
  `end` time
);

CREATE TABLE `Order` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `ordernumber` int UNIQUE,
  `reservationId` int NOT NULL,
  `menuId` int NOT NULL
);

CREATE TABLE `Menu` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` bit
);

CREATE TABLE `ItemMenu` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `menuId` int NOT NULL,
  `itemId` int NOT NULL,
  `amount` int
);

CREATE TABLE `Item` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` ENUM ('MAIN', 'DESERT', 'SOUP', 'SALAD', 'DRINK') NOT NULL,
  `ingredients` varchar(250)
);

CREATE TABLE `Reservation` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `host` int NOT NULL,
  `timeslot` int NOT NULL,
  `table` int,
  `day` date NOT NULL,
  `adults` int,
  `childs` int
);

CREATE TABLE `Table` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `childseats` int
);

CREATE TABLE `Role` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL
);

CREATE TABLE `UserRole` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `userId` int NOT NULL,
  `roleId` int NOT NULL
);

-- Relations
ALTER TABLE `Contact` ADD FOREIGN KEY (`personId`) REFERENCES `Person` (`id`);

ALTER TABLE `User` ADD FOREIGN KEY (`personId`) REFERENCES `Person` (`id`);

ALTER TABLE `Order` ADD FOREIGN KEY (`reservationId`) REFERENCES `Reservation` (`id`);

ALTER TABLE `Order` ADD FOREIGN KEY (`menuId`) REFERENCES `Menu` (`id`);

ALTER TABLE `ItemMenu` ADD FOREIGN KEY (`menuId`) REFERENCES `Menu` (`id`);

ALTER TABLE `ItemMenu` ADD FOREIGN KEY (`itemId`) REFERENCES `Item` (`id`);

ALTER TABLE `Reservation` ADD FOREIGN KEY (`host`) REFERENCES `Person` (`id`);

ALTER TABLE `Reservation` ADD FOREIGN KEY (`timeslot`) REFERENCES `Timeslot` (`id`);

ALTER TABLE `Reservation` ADD FOREIGN KEY (`table`) REFERENCES `Table` (`id`);

ALTER TABLE `UserRole` ADD FOREIGN KEY (`userId`) REFERENCES `User` (`id`);

ALTER TABLE `UserRole` ADD FOREIGN KEY (`roleId`) REFERENCES `Role` (`id`);
