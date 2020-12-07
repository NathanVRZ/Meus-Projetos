-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`AdmLoja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AdmLoja` (
  `IdFuncionario` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Senha` INT(15) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`IdFuncionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estoque_Ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estoque_Ingredientes` (
  `IdIngrediente` INT NOT NULL,
  `Ingrediente` VARCHAR(45) NULL,
  `Unidade` INT(45) NULL,
  `AdmLoja_IdFuncionario` INT NOT NULL,
  PRIMARY KEY (`IdIngrediente`),
  INDEX `fk_Estoque_Ingredientes_AdmLoja_idx` (`AdmLoja_IdFuncionario` ASC) VISIBLE,
  CONSTRAINT `fk_Estoque_Ingredientes_AdmLoja`
    FOREIGN KEY (`AdmLoja_IdFuncionario`)
    REFERENCES `mydb`.`AdmLoja` (`IdFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Movimentacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Movimentacao` (
  `idMovimentacao` INT NOT NULL,
  `Unidade` INT NULL,
  `DATA` DATE NULL,
  `E/S` ENUM("E", "S") NULL,
  PRIMARY KEY (`idMovimentacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produtos` (
  `idProdutos` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Tipo` VARCHAR(45) NULL,
  `Sabor` VARCHAR(45) NULL,
  `unidade` INT NULL,
  `AdmLoja_IdFuncionario` INT NOT NULL,
  `Movimentacao_idMovimentacao` INT NOT NULL,
  PRIMARY KEY (`idProdutos`, `AdmLoja_IdFuncionario`, `Movimentacao_idMovimentacao`),
  INDEX `fk_Produtos_AdmLoja1_idx` (`AdmLoja_IdFuncionario` ASC) VISIBLE,
  INDEX `fk_Produtos_Movimentacao1_idx` (`Movimentacao_idMovimentacao` ASC) VISIBLE,
  CONSTRAINT `fk_Produtos_AdmLoja1`
    FOREIGN KEY (`AdmLoja_IdFuncionario`)
    REFERENCES `mydb`.`AdmLoja` (`IdFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produtos_Movimentacao1`
    FOREIGN KEY (`Movimentacao_idMovimentacao`)
    REFERENCES `mydb`.`Movimentacao` (`idMovimentacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clientes` (
  `idClientes` INT NOT NULL,
  `Email` VARCHAR(45) NULL,
  `senha` VARCHAR(45) NULL,
  `Loja` VARCHAR(45) NULL,
  `Rua` VARCHAR(45) NULL,
  `CNPJ` VARCHAR(45) NULL,
  `UnidadesAssinada` VARCHAR(45) NULL,
  `AdmLoja_IdFuncionario` INT NOT NULL,
  PRIMARY KEY (`idClientes`),
  INDEX `fk_Clientes_AdmLoja1_idx` (`AdmLoja_IdFuncionario` ASC) VISIBLE,
  CONSTRAINT `fk_Clientes_AdmLoja1`
    FOREIGN KEY (`AdmLoja_IdFuncionario`)
    REFERENCES `mydb`.`AdmLoja` (`IdFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
