DROP DATABASE golf_db;
CREATE DATABASE golf_db;

USE golf_db;

/** Create tables **/
# ssn = personnummmer , Social Security Number
CREATE TABLE Players(
	SSN VARCHAR(255) NOT NULL,
	Name VARCHAR(255) NOT NULL,
	Age INT NOT NULL,
	PRIMARY KEY(SSN)
);

CREATE TABLE Jackets(
	SSN VARCHAR(255) NOT NULL,
	JacketSize INT NOT NULL,
	Material VARCHAR(255) NOT NULL,
	FOREIGN KEY(SSN) REFERENCES Players(SSN) ON DELETE CASCADE,
	PRIMARY KEY(SSN, Material)
);

CREATE TABLE Construction (
	SerialNumber INT NOT NULL AUTO_INCREMENT,
	Hardness INT NOT NULL,
	PRIMARY KEY(SerialNumber)
);

CREATE TABLE GlofClubs(
	SSN VARCHAR(255) NOT NULL,
	SerialNumber INT NOT NULL,
	Material VARCHAR(255) NOT NULL,
	FOREIGN KEY(SerialNumber) REFERENCES Construction(SerialNumber) ON DELETE CASCADE,
	FOREIGN KEY(SSN) REFERENCES Players(SSN) ON DELETE CASCADE,
	PRIMARY KEY(SSN,SerialNumber)
);


CREATE TABLE Competition(
	Name VARCHAR(255) NOT NULL,
	StartDate DATETIME NOT NULL,
	PRIMARY KEY(Name)
);


# bridge table - players registerd in competitions
CREATE TABLE Contestants(
	ID INT NOT NULL AUTO_INCREMENT,
	CompetionName VARCHAR(255) NOT NULL,
	PlayerSSN VARCHAR(255) NOT NULL,
	FOREIGN KEY(PlayerSSN) REFERENCES Players(SSN) ON DELETE CASCADE,
	FOREIGN KEY(CompetionName) REFERENCES Competition(Name) ON DELETE CASCADE,
	PRIMARY KEY(ID)
);

CREATE TABLE Rain(
	RainType VARCHAR(255) NOT NULL,
	WindForce DOUBLE NOT NULL,
	PRIMARY KEY(RainType)
);

# Bridge table rain and competition
CREATE TABLE CompetitionWeather(
	RainTime DATETIME NOT NULL,
	CompetionName VARCHAR(255) NOT NULL,
	RainType VARCHAR(255) NOT NULL,
	FOREIGN KEY(RainType) REFERENCES Rain(RainType) ON DELETE CASCADE,
	FOREIGN KEY(CompetionName) REFERENCES Competition(Name) ON DELETE CASCADE,
	PRIMARY KEY(RainTime)
);

/** Populate DB **/

# create Players 1.
INSERT INTO Players (SSN, Name , Age) VALUES ("9804232451","Johan Andersson",24);
INSERT INTO Players (SSN, Name , Age) VALUES ("9802232181","Nicklas Jansson",18);
INSERT INTO Players (SSN, Name , Age) VALUES ("9204732411","Annika Persson",35);
# create competition event 1.
INSERT INTO Competition (Name , StartDate ) VALUES ("Big Golf Cup Skövde","2021-10-06-08:00:00");
# assign players to competition 2.
INSERT INTO Contestants (CompetionName, PlayerSSN) VALUES ("Big Golf Cup Skövde","9804232451");
INSERT INTO Contestants (CompetionName, PlayerSSN) VALUES ("Big Golf Cup Skövde","9802232181");
INSERT INTO Contestants (CompetionName, PlayerSSN) VALUES ("Big Golf Cup Skövde","9204732411");
# Weather condition 3.
INSERT INTO Rain (RainType , WindForce) VALUES("Hail",10);
INSERT INTO CompetitionWeather (RainTime, CompetionName , RainType ) VALUES("2021-10-06-12:00:00" , "Big Golf Cup Skövde" , "Hail");
# jacket 4.
INSERT INTO Jackets (SSN,JacketSize,Material) VALUES ("9804232451",5,"fleece");
INSERT INTO Jackets (SSN,JacketSize,Material) VALUES ("9804232451",5,"goretex");
# clubs 5.
INSERT INTO Construction (Hardness) VALUES(10);
INSERT INTO Construction (Hardness) VALUES(5);

INSERT INTO GlofClubs (SSN , SerialNumber , Material) VALUES ("9802232181",1 , "Wood");
INSERT INTO GlofClubs (SSN , SerialNumber , Material) VALUES ("9204732411",2 , "Wood");
INSERT INTO GlofClubs (SSN , SerialNumber , Material) VALUES ("9804232451",2 , "Aluminium");



