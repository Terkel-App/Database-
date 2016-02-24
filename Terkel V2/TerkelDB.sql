drop schema mydbTerkel;
CREATE SCHEMA IF NOT EXISTS `mydbTerkel` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydbTerkel` ;



CREATE TABLE IF NOT EXISTS `mydbTerkel`.`Room` ( 
	`RoomID` INTEGER, 
	`Name` VARCHAR (45), 
	`Location` VARCHAR (45), 
PRIMARY KEY (`RoomID`))
	ENGINE = InnoDB; 

CREATE TABLE IF NOT EXISTS `mydbTerkel`.`TimeTable` (
	`TimeTableID` INTEGER, 
	`Week` VARCHAR (45), 
	`Day` VARCHAR (45), 
	`Course`VARCHAR(45), 
	`Room` VARCHAR (45), 
PRIMARY KEY (`TimeTableID`)) 
	Engine = Innodb; 

CREATE TABLE IF NOT EXISTS `mydbTerkel`.`School` (
	`SchoolID` INTEGER, 
	`SchoolName` VARCHAR(45),
PRIMARY KEY (`SchoolID`)) 
	ENGINE = Innodb; 

CREATE TABLE IF NOT EXISTS `mydbTerkel`.`ClassSubject` ( 
	`ClassSubjectID` INTEGER NOT NULL, 
	`Class`VARCHAR (45),
	`Subject` VARCHAR (45), 
	`SchoolID` INTEGER, 
	`RoomTimeID`INTEGER,
PRIMARY KEY (`ClassSubjectID`),
FOREIGN KEY (SchoolID) REFERENCES School(SchoolID),
FOREIGN KEY (RoomTimeID) REFERENCES RoomTime(RoomTimeID))
ENGINE = InnoDB; 



CREATE TABLE IF NOT EXISTS `mydbTerkel`.`RoomTime` ( 
	`RoomTimeID` INTEGER NOT NULL, 
	`Name` VARCHAR(45),
	`Location` VARCHAR (45), 
	`RoomID` INTEGER, 
	`TimeTableID` INTEGER, 
PRIMARY KEY (`RoomTimeID`), 
FOREIGN KEY (RoomID) REFERENCES Room(RoomID), 
FOREIGN KEY (TimeTableID) REFERENCES TimeTable(TimeTableID))
	ENGINE = InnoDB; 




