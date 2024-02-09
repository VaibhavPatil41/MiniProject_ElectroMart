-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Electro_mart
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Electro_mart
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Electro_mart` DEFAULT CHARACTER SET utf8 ;
USE `Electro_mart` ;

-- -----------------------------------------------------
-- Table `Electro_mart`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Electro_mart`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `address` VARCHAR(50) NOT NULL,
  `email_id` VARCHAR(20) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `gender` CHAR(1) NOT NULL,
  `mobile_num` VARCHAR(12) NOT NULL,
  `role` ENUM('Admin', 'Customer', 'Vendor') NOT NULL,
  `status` TINYINT NOT NULL,
  PRIMARY KEY (`id`, `name`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `mobile_num_UNIQUE` (`mobile_num` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Electro_mart`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Electro_mart`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_custemer_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_custemer_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `Electro_mart`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Electro_mart`.`vendor_feedback`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Electro_mart`.`vendor_feedback` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` INT NOT NULL,
  `discription` VARCHAR(45) NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_vendor_feedback_customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_vendor_feedback_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Electro_mart`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Electro_mart`.`Vendor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Electro_mart`.`Vendor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `vendor_feedback_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Vendor_user_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_Vendor_vendor_feedback1_idx` (`vendor_feedback_id` ASC) VISIBLE,
  CONSTRAINT `fk_Vendor_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `Electro_mart`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vendor_vendor_feedback1`
    FOREIGN KEY (`vendor_feedback_id`)
    REFERENCES `Electro_mart`.`vendor_feedback` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Electro_mart`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Electro_mart`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `catagory_name_UNIQUE` (`category_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Electro_mart`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Electro_mart`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `catagory` VARCHAR(25) NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_products_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `Electro_mart`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Electro_mart`.`product_feedback`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Electro_mart`.`product_feedback` (
  `id` INT NOT NULL,
  `rating` VARCHAR(45) NOT NULL,
  `custemer_id` INT NOT NULL,
  `products_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_product_feedback_custemer1_idx` (`custemer_id` ASC) VISIBLE,
  INDEX `fk_product_feedback_products1_idx` (`products_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_feedback_custemer1`
    FOREIGN KEY (`custemer_id`)
    REFERENCES `Electro_mart`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_feedback_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `Electro_mart`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Electro_mart`.`wallet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Electro_mart`.`wallet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `balance_amount` FLOAT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_wallet_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_wallet_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `Electro_mart`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Electro_mart`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Electro_mart`.`cart` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quantity` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `products_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_cart_customer1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_cart_products1_idx` (`products_id` ASC) VISIBLE,
  CONSTRAINT `fk_cart_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Electro_mart`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `Electro_mart`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Electro_mart`.`shop`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Electro_mart`.`shop` (
  `id` INT NOT NULL,
  `shop_name` VARCHAR(30) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `licence_id` VARCHAR(45) NOT NULL,
  `product_qty` INT NOT NULL,
  `products_id` INT NOT NULL,
  `Vendor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `licence_id_UNIQUE` (`licence_id` ASC) VISIBLE,
  INDEX `fk_shop_products1_idx` (`products_id` ASC) VISIBLE,
  INDEX `fk_shop_Vendor1_idx` (`Vendor_id` ASC) VISIBLE,
  CONSTRAINT `fk_shop_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `Electro_mart`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shop_Vendor1`
    FOREIGN KEY (`Vendor_id`)
    REFERENCES `Electro_mart`.`Vendor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Electro_mart`.`customer_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Electro_mart`.`customer_order` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `products_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `Vendor_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC) VISIBLE,
  INDEX `fk_customer_order_products1_idx` (`products_id` ASC) VISIBLE,
  INDEX `fk_customer_order_customer1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_customer_order_Vendor1_idx` (`Vendor_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_order_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `Electro_mart`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_order_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Electro_mart`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_order_Vendor1`
    FOREIGN KEY (`Vendor_id`)
    REFERENCES `Electro_mart`.`Vendor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Electro_mart`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Electro_mart`.`Admin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Admin_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_Admin_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `Electro_mart`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
