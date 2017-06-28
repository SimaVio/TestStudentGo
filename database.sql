  DROP DATABASE IF EXISTS `StudentGo_database`;
CREATE DATABASE IF NOT EXISTS `StudentGo_database` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `StudentGo_database`;

CREATE TABLE IF NOT EXISTS `Accounts` (
  `User_Name` varchar(20) NOT NULL,
  `Active` bit NOT NULL,
  `Password` varchar(20) NOT NULL,
  `User_Role` varchar(20) NOT NULL,
  PRIMARY KEY (`User_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Order_Details` (
  `ID` varchar(50) NOT NULL,
  `Amount` double NOT NULL,
  `Price` double NOT NULL,
  `ORDER_ID` varchar(50) NOT NULL,
  `PRODUCT_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Orders` (
  `ID` varchar(50) NOT NULL,
  `Amount` double NOT NULL,
  `Customer_CNP` varchar(255) NOT NULL,
  `Customer_Name` varchar(255) NOT NULL,
  `Customer_ID_Legitimatie` varchar(128) NOT NULL,
  `Order_Date` datetime NOT NULL,
  `Order_Num` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `Products` (
  `Code` varchar(20) NOT NULL,
  `Create_Date` datetime NOT NULL,
  `Image` longblob,
  `Name` varchar(255) NOT NULL,
  `Price` double NOT NULL,
  `Description` varchar(20000) NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `Orders`
    ADD CONSTRAINT `UK_ORDER_NUM` UNIQUE (`Order_Num`);

ALTER TABLE  `Order_Details`
    ADD CONSTRAINT `FK_ORDER_DETAILS_ORDER_ID`
    FOREIGN KEY (`ORDER_ID`)
    REFERENCES `orders` (`ID`)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE  `Order_Details`
    ADD CONSTRAINT `FK_ORDER_DETAILS_PRODUCT_ID`
    FOREIGN KEY (`PRODUCT_ID`)
    REFERENCES `Products` (`Code`)
    ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO `Accounts` (`User_Name`, `Active`, `Password`, `User_Role`) 
VALUES ('angajat', 1, 'angajat', 'ANGAJAT'); 
INSERT INTO `Accounts` (`User_Name`, `Active`, `Password`, `User_Role`) 
VALUES ('admin', 1, 'admin', 'ADMINISTRATOR');
INSERT INTO `Accounts` (`User_Name`, `Active`, `Password`, `User_Role`) 
VALUES ('student', 1, 'student', 'STUDENT');


