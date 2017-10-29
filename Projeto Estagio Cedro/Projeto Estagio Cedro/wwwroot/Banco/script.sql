-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema loja
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema loja
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `loja` DEFAULT CHARACTER SET utf8 ;
USE `loja` ;

-- -----------------------------------------------------
-- Table `loja`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`categoria` (
  `idCategoria` SMALLINT(6) NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `loja`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`usuario` (
  `idUsuario` INT(11) NOT NULL AUTO_INCREMENT,
  `senha` VARCHAR(80) NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `email` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `loja`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`produto` (
  `idProduto` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(80) NOT NULL,
  `descricao` TEXT NOT NULL,
  `valor` DOUBLE NOT NULL,
  `imagem` VARCHAR(100) NOT NULL,
  `idUsuario` INT(11) NOT NULL,
  `idCategoria` SMALLINT(6) NOT NULL,
  PRIMARY KEY (`idProduto`),
  INDEX `fk_Produto_Usuario_idx` (`idUsuario` ASC),
  INDEX `fk_Produto_Categoria1_idx` (`idCategoria` ASC),
  CONSTRAINT `fk_Produto_Categoria1`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `loja`.`categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_Usuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `loja`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
