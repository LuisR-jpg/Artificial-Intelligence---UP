CREATE SCHEMA `store` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;

CREATE TABLE `store`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(15) NOT NULL,
  `quantity in stock` INT NOT NULL,
  `unit price` FLOAT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
ALTER TABLE `store`.`products` 
CHANGE COLUMN `quantity in stock` `quantity_in_stock` INT NOT NULL ,
CHANGE COLUMN `unit price` `unit_price` FLOAT NOT NULL ;

CREATE TABLE `store`.`shippers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `store`.`customers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(15) NOT NULL,
  `last_name` VARCHAR(15) NOT NULL,
  `birth_date` VARCHAR(20) NOT NULL,
  `phone` VARCHAR(20) NULL,
  `adress` VARCHAR(45) NOT NULL,
  `city` VARCHAR(25) NOT NULL,
  `state` VARCHAR(5) NOT NULL,
  `points` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `store`.`order_statuses` (
  `id` INT NOT NULL,
  `name` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;