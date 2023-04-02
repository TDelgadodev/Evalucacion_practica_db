-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema diagrama_practica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema diagrama_practica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `diagrama_practica` DEFAULT CHARACTER SET utf8mb3 ;
USE `diagrama_practica` ;

-- -----------------------------------------------------
-- Table `diagrama_practica`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diagrama_practica`.`categorias` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `diagrama_practica`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diagrama_practica`.`usuarios` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `diagrama_practica`.`notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diagrama_practica`.`notas` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(255) NOT NULL,
  `descripcion` TEXT NULL DEFAULT NULL,
  `fecha_creacion` DATE NOT NULL,
  `fecha_modificacion` DATE NULL DEFAULT NULL,
  `eliminable` TINYINT NULL DEFAULT '0',
  `usuarios_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notas_usuarios1_idx` (`usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_notas_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `diagrama_practica`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `diagrama_practica`.`notas_has_categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diagrama_practica`.`notas_has_categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `notas_id` INT NOT NULL,
  `categorias_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notas_has_categorias_categorias1_idx` (`categorias_id` ASC) VISIBLE,
  INDEX `fk_notas_has_categorias_notas_idx` (`notas_id` ASC) VISIBLE,
  CONSTRAINT `fk_notas_has_categorias_categorias1`
    FOREIGN KEY (`categorias_id`)
    REFERENCES `diagrama_practica`.`categorias` (`id`),
  CONSTRAINT `fk_notas_has_categorias_notas`
    FOREIGN KEY (`notas_id`)
    REFERENCES `diagrama_practica`.`notas` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- INSERT 10 registros para la tabla categorias
INSERT INTO categorias (nombre) VALUES 
('Tareas'),
('Recordatorios'),
('Ideas'),
('Notas importantes');

-- INSERT 10 registros para la tabla usuarios
INSERT INTO usuarios (nombre, email) VALUES 
('Juan Pérez', 'juanperez@gmail.com'),
('María González', 'mariagonzalez@hotmail.com'),
('Carlos García', 'carlosgarcia@yahoo.com'),
('Luisa Torres', 'luisatorres@gmail.com'),
('Pedro Jiménez', 'pedrojimenez@hotmail.com'),
('Laura Hernández', 'laurahernandez@yahoo.com'),
('José Ramírez', 'joseramirez@gmail.com'),
('Ana Sánchez', 'anasanchez@hotmail.com'),
('Ricardo Flores', 'ricardoflores@yahoo.com'),
('Isabel Martínez', 'isabelmartinez@gmail.com');

-- INSERT 10 registros para la tabla notas
INSERT INTO notas (titulo, descripcion, fecha_creacion, usuarios_id) VALUES 
('Comprar leche', 'Recordar comprar leche en el supermercado', '2022-02-01', 1),
('Cumpleaños de mamá', 'No olvidar el cumpleaños de mamá el próximo 10 de abril', '2022-03-30', 2),
('Nuevas ideas de negocios', 'Escribir las nuevas ideas de negocios en el cuaderno', '2022-03-15', 3),
('Contraseña del correo', 'Recordar la contraseña del correo electrónico', '2022-02-14', 4),
('Recetas de cocina', 'Escribir las nuevas recetas de cocina', '2022-01-31', 5),
('Lista de tareas', 'Hacer una lista de tareas para la semana', '2022-03-28', 6),
('Recordar cita médica', 'Recordar la cita médica para el próximo viernes', '2022-03-31', 7),
('Teléfonos importantes', 'Guardar los teléfonos importantes en el celular', '2022-03-01', 8),
('Cumpleaños de amigo', 'No olvidar el cumpleaños del amigo el próximo 10 de abril', '2022-03-30', 9),
('Comprar regalos', 'Recordar comprar los regalos para el próximo mes', '2022-03-20', 10);

-- INSERT 10 registros para la tabla notas_has_categorias
INSERT INTO notas_has_categorias (notas_id, categorias_id) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 1),
(6, 2),
(7, 3),
(8, 4),
(9, 1),
(10, 2);