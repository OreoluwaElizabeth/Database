-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema classwork
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema classwork
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `classwork` DEFAULT CHARACTER SET utf8 ;
USE `classwork` ;

-- -----------------------------------------------------
-- Table `classwork`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `classwork`.`student` (
  `student_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `classwork`.`teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `classwork`.`teacher` (
  `teacher_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`teacher_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `classwork`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `classwork`.`courses` (
  `course_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`course_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `classwork`.`grade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `classwork`.`grade` (
  `grade_id` INT NOT NULL,
  `assignment_id` VARCHAR(45) NOT NULL,
  `grade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`grade_id`, `assignment_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `classwork`.`assignment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `classwork`.`assignment` (
  `assignment_id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `grade` VARCHAR(45) NOT NULL,
  `Student_student_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `grade_id` INT NOT NULL,
  PRIMARY KEY (`assignment_id`, `Student_student_id`, `course_id`, `grade_id`),
  INDEX `fk_Assignment_Student1_idx` (`Student_student_id` ASC) VISIBLE,
  INDEX `fk_Assignment_Courses1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_Assignment_Grade1_idx` (`grade_id` ASC) VISIBLE,
  CONSTRAINT `fk_Assignment_Student1`
    FOREIGN KEY (`Student_student_id`)
    REFERENCES `classwork`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assignment_Courses1`
    FOREIGN KEY (`course_id`)
    REFERENCES `classwork`.`courses` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assignment_Grade1`
    FOREIGN KEY (`grade_id`)
    REFERENCES `classwork`.`grade` (`grade_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `classwork`.`student_course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `classwork`.`student_course` (
  `student_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`student_id`, `course_id`),
  INDEX `fk_Student_has_Courses_Courses1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_Student_has_Courses_Student_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_Student_has_Courses_Student`
    FOREIGN KEY (`student_id`)
    REFERENCES `classwork`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_has_Courses_Courses1`
    FOREIGN KEY (`course_id`)
    REFERENCES `classwork`.`courses` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `classwork`.`teacher_courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `classwork`.`teacher_courses` (
  `Teacher_teacher_id` INT NOT NULL,
  `Courses_course_id` INT NOT NULL,
  PRIMARY KEY (`Teacher_teacher_id`, `Courses_course_id`),
  INDEX `fk_Teacher_has_Courses_Courses1_idx` (`Courses_course_id` ASC) VISIBLE,
  INDEX `fk_Teacher_has_Courses_Teacher1_idx` (`Teacher_teacher_id` ASC) VISIBLE,
  CONSTRAINT `fk_Teacher_has_Courses_Teacher1`
    FOREIGN KEY (`Teacher_teacher_id`)
    REFERENCES `classwork`.`teacher` (`teacher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Teacher_has_Courses_Courses1`
    FOREIGN KEY (`Courses_course_id`)
    REFERENCES `classwork`.`courses` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `classwork`.`student_teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `classwork`.`student_teacher` (
  `student_id` INT NOT NULL,
  `teacher_id` INT NOT NULL,
  PRIMARY KEY (`student_id`, `teacher_id`),
  INDEX `fk_Student_has_Teacher_Teacher1_idx` (`teacher_id` ASC) VISIBLE,
  INDEX `fk_Student_has_Teacher_Student1_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_Student_has_Teacher_Student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `classwork`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_has_Teacher_Teacher1`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `classwork`.`teacher` (`teacher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
