CREATE TABLE `Person` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `firstname` varchar(60) NOT NULL,
  `infix` varchar(30),
  `lastname` varchar(50) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `isActive` bit,
  `comment` varchar(250),
  `createdAt` datetime,
  `updatedAt` datetime
);

CREATE TABLE `Contact` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `personId` int,
  `phone` varchar(20) NOT NULL,
  `email` varchar(320) NOT NULL,
  `isActive` bit,
  `comment` varchar(250),
  `createdAt` datetime,
  `updatedAt` datetime
);

CREATE TABLE `User` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `personId` int NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(256) NOT NULL,
  `loggedInAt` datetime,
  `loggedOutAt` datetime,
  `isActive` bit,
  `comment` varchar(250),
  `createdAt` datetime,
  `updatedAt` datetime
);

CREATE TABLE `Timeslot` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `start` time,
  `end` time
);

CREATE TABLE `Order` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `orderNumber` int UNIQUE,
  `reservationId` int NOT NULL,
  `menuId` int NOT NULL,
  `isActive` bit,
  `comment` varchar(250),
  `createdAt` datetime,
  `updatedAt` datetime
);

CREATE TABLE `Menu` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` bit,
  `isActive` bit,
  `comment` varchar(250),
  `createdAt` datetime,
  `updatedAt` datetime
);

CREATE TABLE `Category` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `isActive` bit,
  `comment` varchar(250),
  `createdAt` datetime,
  `updatedAt` datetime
);

CREATE TABLE `ItemMenu` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `menuId` int NOT NULL,
  `itemId` int NOT NULL,
  `amount` int,
  `isActive` bit,
  `comment` varchar(250),
  `createdAt` datetime,
  `updatedAt` datetime
);

CREATE TABLE `Item` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `categoryId` int,
  `ingredients` varchar(250),
  `isActive` bit,
  `comment` varchar(250),
  `createdAt` datetime,
  `updatedAt` datetime
);

CREATE TABLE `Reservation` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `personId` int NOT NULL,
  `timeslot` int NOT NULL,
  `table` int,
  `day` date NOT NULL,
  `adults` int,
  `childs` int,
  `isActive` bit,
  `comment` varchar(250),
  `createdAt` datetime,
  `updatedAt` datetime
);

CREATE TABLE `Table` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `number` int NOT NULL,
  `hasChildSeats` bit,
  `isActive` bit,
  `comment` varchar(250),
  `createdAt` datetime,
  `updatedAt` datetime
);

CREATE TABLE `Role` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `isActive` bit,
  `comment` varchar(250),
  `createdAt` datetime,
  `updatedAt` datetime
);

CREATE TABLE `UserRole` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `userId` int NOT NULL,
  `roleId` int NOT NULL,
  `isActive` bit,
  `comment` varchar(250),
  `createdAt` datetime,
  `updatedAt` datetime
);

ALTER TABLE `Contact` ADD FOREIGN KEY (`personId`) REFERENCES `Person` (`id`);

ALTER TABLE `User` ADD FOREIGN KEY (`personId`) REFERENCES `Person` (`id`);

ALTER TABLE `Order` ADD FOREIGN KEY (`reservationId`) REFERENCES `Reservation` (`id`);

ALTER TABLE `Order` ADD FOREIGN KEY (`menuId`) REFERENCES `Menu` (`id`);

ALTER TABLE `ItemMenu` ADD FOREIGN KEY (`menuId`) REFERENCES `Menu` (`id`);

ALTER TABLE `ItemMenu` ADD FOREIGN KEY (`itemId`) REFERENCES `Item` (`id`);

ALTER TABLE `Item` ADD FOREIGN KEY (`categoryId`) REFERENCES `Category` (`id`);

ALTER TABLE `Reservation` ADD FOREIGN KEY (`personId`) REFERENCES `Person` (`id`);

ALTER TABLE `Reservation` ADD FOREIGN KEY (`timeslot`) REFERENCES `Timeslot` (`id`);

ALTER TABLE `Reservation` ADD FOREIGN KEY (`table`) REFERENCES `Table` (`id`);

ALTER TABLE `UserRole` ADD FOREIGN KEY (`userId`) REFERENCES `User` (`id`);

ALTER TABLE `UserRole` ADD FOREIGN KEY (`roleId`) REFERENCES `Role` (`id`);