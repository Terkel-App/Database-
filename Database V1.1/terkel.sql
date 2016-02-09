
drop schema mydb2;
CREATE SCHEMA IF NOT EXISTS `mydb2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb2` ;


CREATE TABLE IF NOT EXISTS `mydb2`.`students` (	
	`studentid` INT NOT NULL,
	`firstname` VARCHAR(45),
	`lastname` VARCHAR(45),
PRIMARY KEY (`studentid`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb2`.`class` (
	`classid` INT NOT NULL,
	`student_studentid` INT NOT NULL,
	`classname` VARCHAR(45),
PRIMARY KEY (`classid`),
FOREIGN KEY (student_studentid) REFERENCES students(studentid))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb2`.`enrollment` (
	`enrollmentid` INT NOT NULL,
	`student_studentid` INT NOT NULL,
	`class_classid` INT NOT NULL,
	`grade` VARCHAR(45),
PRIMARY KEY (`enrollmentid`),
FOREIGN KEY (student_studentid) REFERENCES students(studentid),
FOREIGN KEY (class_classid) REFERENCES class(classid))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb2`.`teacher` (
	`teacherid` INT NOT NULL,
	`firstname` VARCHAR(45),
	`lastname` VARCHAR(45),
PRIMARY KEY (`teacherid`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb2`.`subj_teacher` (
	`subject_teacherid` INT NOT NULL,
	`class_classid` INT NOT NULL,
	`teacher_teacherid` INT NOT NULL,
	`student_studentid` INT NOT NULL,
PRIMARY KEY (`subject_teacherid`),
FOREIGN KEY (class_classid) REFERENCES class(classid),
FOREIGN KEY (teacher_teacherid) REFERENCES teacher(teacherid),
FOREIGN KEY (student_studentid) REFERENCES students(studentid))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb2`.`timetable` ( 
	`timetableid` INT NOT NULL,
	`week` INT,
	`day` VARCHAR(45),
	`course` VARCHAR(45),
	`room` VARCHAR(45), 
	`teacher_teacherid` INT NOT NULL,
PRIMARY KEY (`timetableid`),
FOREIGN KEY (teacher_teacherid) REFERENCES teacher(teacherid))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb2`.`lesson_plan` (
	`lesson_planid` INT NOT NULL,
	`course` VARCHAR(45),
	`week` INT,
	`teacher_teacherid` INT NOT NULL, 
PRIMARY KEY (`lesson_planid`),
FOREIGN KEY (teacher_teacherid) REFERENCES teacher(teacherid))
ENGINE = InnoDB;





INSERT INTO teacher (teacherid, firstname, lastname)
	VALUES ('1','Hallgeir','Olsen');
INSERT INTO teacher (teacherid, firstname, lastname)
	VALUES ('2','Janis','thomas');


INSERT INTO students (studentid, firstname, lastname)
	VALUES ('1','Asim','Khan');
INSERT INTO students (studentid, firstname, lastname)
	VALUES ('2','Thomas','Olsen');



INSERT INTO class (classid, student_studentid,classname)
	VALUES ('1','1','1A');
INSERT INTO class (classid, student_studentid,classname)
	VALUES ('2','2','2A');
INSERT INTO class (classid, student_studentid,classname)
	VALUES ('3','1','3A');
INSERT INTO class (classid, student_studentid,classname)
	VALUES ('4','2','4A');


INSERT INTO enrollment (enrollmentid, student_studentid, class_classid, grade )
	VALUES ('1','1','1','A');



INSERT INTO subj_teacher (subject_teacherid,class_classid,teacher_teacherid,student_studentid)
	VALUES ('1','1','1','1');

INSERT INTO subj_teacher (subject_teacherid,class_classid,teacher_teacherid,student_studentid)
	VALUES ('2','2','2','1');


INSERT INTO timetable (timetableid, week, day, course, room, teacher_teacherid)
		VALUE ('1', '2', 'monday', 'english', 'b001', '1');
INSERT INTO timetable (timetableid, week, day, course, room, teacher_teacherid)
		VALUE ('2', '3', 'tuesday', 'norwegian', 'b003', '2');

INSERT INTO lesson_plan (lesson_planid, course, week, teacher_teacherid)
		VALUE ('1', 'english', '2', '1');
INSERT INTO lesson_plan (lesson_planid, course, week, teacher_teacherid)
		VALUE ('2', 'norwegian', '3', '2');
