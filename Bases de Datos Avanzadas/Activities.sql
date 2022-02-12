CREATE SCHEMA `invoicing` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;

CREATE TABLE `payment_methods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `clients` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(5) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `invoices` (
  `id` int NOT NULL,
  `number` varchar(20) NOT NULL,
  `client_id` int NOT NULL,
  `invoice_total` float NOT NULL,
  `payment_total` float NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `invoicing`.`payments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `invoice_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `amount` FLOAT NOT NULL,
  `payment_method` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `client_id_idx` (`client_id` ASC) VISIBLE,
  INDEX `invoice_id_idx` (`invoice_id` ASC) VISIBLE,
  INDEX `payment_method_idx` (`payment_method` ASC) VISIBLE,
  CONSTRAINT `client_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `invoicing`.`clients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `invoice_id`
    FOREIGN KEY (`invoice_id`)
    REFERENCES `invoicing`.`invoices` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `payment_method`
    FOREIGN KEY (`payment_method`)
    REFERENCES `invoicing`.`payment_methods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

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

CREATE TABLE `store`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `order_date` DATE NOT NULL,
  `status` INT NOT NULL,
  `comments` VARCHAR(100) NULL,
  `shipped_date` DATE NULL,
  `shipper_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  INDEX `status_idx` (`status` ASC) VISIBLE,
  INDEX `shipper_id_idx` (`shipper_id` ASC) VISIBLE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `store`.`customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `status`
    FOREIGN KEY (`status`)
    REFERENCES `store`.`order_statuses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `shipper_id`
    FOREIGN KEY (`shipper_id`)
    REFERENCES `store`.`shippers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `order_items` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` float NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id_idx` (`product_id`),
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order_item_notes` (
  `note_id` varchar(10) NOT NULL,
  `order_Id` varchar(5) NOT NULL,
  `product_id` varchar(5) NOT NULL,
  `note` varchar(45) NOT NULL,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE SCHEMA `hr` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;

CREATE TABLE `hr`.`offices` (
  `id` INT NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `states` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `hr`.`employees` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `job_title` VARCHAR(45) NOT NULL,
  `salary` INT NOT NULL,
  `reports_to` INT NULL,
  `office_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE `hr`.`employees` 
ADD INDEX `reports_to_idx` (`reports_to` ASC) VISIBLE,
ADD INDEX `office_id_idx` (`office_id` ASC) VISIBLE;
;
ALTER TABLE `hr`.`employees` 
ADD CONSTRAINT `reports_to`
  FOREIGN KEY (`reports_to`)
  REFERENCES `hr`.`employees` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `office_id`
  FOREIGN KEY (`office_id`)
  REFERENCES `hr`.`offices` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `hr`.`offices` 
CHANGE COLUMN `address` `address` VARCHAR(100) NOT NULL ;

CREATE SCHEMA `inventory` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;

CREATE TABLE `inventory`.`products` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `quantity_in_stocks` INT NOT NULL,
  `unit_price` FLOAT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;