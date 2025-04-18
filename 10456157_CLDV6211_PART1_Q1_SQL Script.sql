-- MySQL Script generated by MySQL Workbench
-- Fri Mar 28 12:30:53 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema eventeasedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `eventeasedb` ;

-- -----------------------------------------------------
-- Schema eventeasedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `eventeasedb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `eventeasedb` ;

-- -----------------------------------------------------
-- Table `eventeasedb`.`venue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eventeasedb`.`venue` ;

CREATE TABLE IF NOT EXISTS `eventeasedb`.`venue` (
  `VenueId` INT NOT NULL AUTO_INCREMENT,
  `VenueName` VARCHAR(255) NOT NULL,
  `Location` VARCHAR(255) NOT NULL,
  `Capacity` INT NOT NULL,
  `ImageUrl` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`VenueId`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `eventeasedb`.`event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eventeasedb`.`event` ;

CREATE TABLE IF NOT EXISTS `eventeasedb`.`event` (
  `EventId` INT NOT NULL AUTO_INCREMENT,
  `EventName` VARCHAR(255) NOT NULL,
  `EventDate` DATETIME NOT NULL,
  `Description` TEXT NULL DEFAULT NULL,
  `VenueId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`EventId`),
  INDEX `FK_Event_Venue` (`VenueId` ASC) VISIBLE,
  CONSTRAINT `FK_Event_Venue`
    FOREIGN KEY (`VenueId`)
    REFERENCES `eventeasedb`.`venue` (`VenueId`)
    ON DELETE SET NULL)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `eventeasedb`.`booking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eventeasedb`.`booking` ;

CREATE TABLE IF NOT EXISTS `eventeasedb`.`booking` (
  `BookingId` INT NOT NULL AUTO_INCREMENT,
  `EventId` INT NOT NULL,
  `VenueId` INT NOT NULL,
  `BookingDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BookingId`),
  UNIQUE INDEX `Fkey` (`EventId` ASC, `VenueId` ASC) VISIBLE,
  INDEX `FK_Booking_Venue` (`VenueId` ASC) VISIBLE,
  CONSTRAINT `FK_Booking_Event`
    FOREIGN KEY (`EventId`)
    REFERENCES `eventeasedb`.`event` (`EventId`)
    ON DELETE CASCADE,
  CONSTRAINT `FK_Booking_Venue`
    FOREIGN KEY (`VenueId`)
    REFERENCES `eventeasedb`.`venue` (`VenueId`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
