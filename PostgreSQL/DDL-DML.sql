CREATE TABLE recordingLabel (
	labelID VARCHAR(10) PRIMARY KEY, 
	labelName VARCHAR(255),
	location VARCHAR(255)
);
INSERT INTO recordingLabel (labelID, labelName, Location) VALUES
('L1','A&M Records','Los Angeles'),
('L2','Reprise Records','New York'),
('L3','Disney Records','Los Angeles'),
('L4','Country Club','Detroit'),
('L5','Gray Dot Records','Detroit'),
('L6','Disney Records','Detroit'),
('L7','BMG Records','Phoenix'),
('L8','Universal Records','Texas'),
('L9','Parkwood Entertainment','Los Angeles'),
('L10','Big Machine Records','Nashville');

CREATE TABLE artist(
	artistID VARCHAR(10) PRIMARY KEY,
	firstName VARCHAR (255),
	lastName VARCHAR (255),
	yearBorn INT
);
INSERT INTO artist(artistID, firstName, lastName, yearBorn) VALUES
('A1','Bjorn','Friedman',1945),
('A2','Heidi','Helmut',1945),
('A3','John','Stark',1971),
('A4','Michael','Agnelo',1975),
('A5','Michelle','Agnelo',1975),
('A6','Francis','McDermott',1960),
('A7','Steve','Nash',1965),
('A8','Lisa','Raymond',1973),
('A9','Janet','Brown',1972),
('A10','Henry','Brown',1966),
('A11','Keith','Urban',1970),
('A12','John','Hopkins',1960),
('A13','Jim','Kate',1970),
('A14','Jacky','Chen',1945),
('A15','Beyonce','Carter',1981),
('A16','Taylor','Swift',1989);

CREATE TABLE musicalGroup(
	groupCode VARCHAR(10) PRIMARY KEY,
	groupName VARCHAR (255)
);
INSERT INTO musicalGroup(groupCode, groupName) VALUES
('G1','Deutsch Moss'),
('G2','Sweet Symphony'),
('G3','Thundering Typhoons'),
('G4','Great Snakes'),
('G5','Keith Urban'),
('G6','Beyond'),
('G7','Backstreet Boys'),
('G8','Tomorrow'),
('G9','Destiny''s child');

CREATE TABLE member(
	groupCode VARCHAR(10), 
	artistID VARCHAR(10),
	fromDate INT, 
	toDate INT,
	PRIMARY KEY (groupCode, artistID, fromDate)
);

INSERT INTO member(groupCode, artistID, fromDate, toDate) VALUES 
('G1','A1',1970,1990),
('G2','A1',1991,0),
('G1','A2',1970,1990),
('G1','A3',1971,0),
('G2','A4',1995,0),
('G5','A4',1997,0),
('G2','A5',1995,2003),
('G3','A6',1985,0),
('G3','A7',2000,0),
('G1','A8',1991,2003),
('G4','A9',1990,2003),
('G1','A9',1980,2003),
('G2','A9',1998,0),
('G4','A10',1990,0),
('G6','A10',1998,0),
('G5','A11',1980,2003),
('G8','A10',1950,1978),
('G7','A1',1980,0),
('G7','A2',1967,1969),
('G7','A3',1980,1981),
('G2','A14',1960,0),
('G9','A15',1990,0);

CREATE TABLE cd (
	cdCode VARCHAR(10) PRIMARY KEY,
	cdTitle VARCHAR(255),
	numberSold INT, 
	year INT, 
	labelID VARCHAR(10),
	groupCode VARCHAR(10)
);
INSERT INTO cd (cdCode, cdTitle, numberSold, year, labelID, groupCode) VALUES
('C1','Goodnight',500000,2001,'L1','G1'),
('C2','Sweet Dreams',100000,1990,'L6','G2'),
('C3','Forgotten',800000,1998,'L4','G2'),
('C4','Friday Night',800000,2003,'L1','G3'),
('C5','Hot As Hell',750000,2003,'L3','G3'),
('C6','Golden Hits',400000,1998,'L3','G4'),
('C7','Broken',600000,2003,'L1','G4'),
('C8','Golden Road',800000,2003,'L3','G4'),
('C9','Function',100000,2002,'L2','G4'),
('C10','Be Here',790000,2003,'L1','G5'),
('C11','Ranch',450000,2003,'L5','G2'),
('C12','Horse of a Different Color',900000,2001,'L1','G5'),
('C13','Rain',450000,2000,'L1','G5'),
('C14','Color',40000,2000,'L4','G1'),
('C15','Wonderful',89000,1997,'L5','G5'),
('C16','Happy',99000,1994,'L6','G5'),
('C17','Moon Lake',25000,1998,'L4','G6'),
('C18','Summer Fiesta',75000,2003,'L5','G6'),
('C19','Kettie',800000,2001,'L6','G6'),
('C20','Celebrate',790000,2003,'L2','G6'),
('C21','Sunshine',34000,2001,'L8','G6'),
('C22','Lemonade',500000,2016,'L9','G9');

CREATE TABLE topCDs (
	cdCode VARCHAR(10),
	year INT,
	rating INT, 
	PRIMARY KEY (cdCode, year)
);

INSERT INTO topCDs (cdCode, year, rating) VALUES 
('C1',2001,2),
('C2',1990,1),
('C3',1998,6),
('C4',2003,3),
('C5',2003,9),
('C6',1998,1),
('C7',2003,2),
('C8',2003,1),
('C9',2002,5),
('C10',2003,4),
('C11',2003,11),
('C12',2001,1),
('C13',2000,15),
('C22',2016,3);

CREATE TABLE song (
	songCode VARCHAR(10) PRIMARY KEY, 
	songTitle VARCHAR (255)
);

INSERT INTO song (songCode, songTitle) VALUES 
('S1','Sweet Dreams'),
('S2','Goodnight'),
('S3','My Lullaby'),
('S4','I Have A Dream'),
('S5','Forgotten'),
('S6','How Could You'),
('S7','Breathless'),
('S8','My Oh My'),
('S9','Ooh La La'),
('S10','Fire'),
('S11','Hot As Hell'),
('S12','Goldilocks'),
('S13','One Of Us'),
('S14','Mamma Mia'),
('S15','Broken'),
('S16','Life Or Death'),
('S17','Days Go By'),
('S18','Another Day in Paradise'),
('S19','Smile'),
('S20','Formation'),
('S21','Freedom'),
('S22','Love Drought'),
('S23','Lover'),
('S24','Anti-Hero'),
('S25','All too well');

CREATE TABLE composeOf(
	cdCode VARCHAR (10),
	songCode VARCHAR (10), 
	trackNumber INT,
	PRIMARY KEY (cdCode, songCode)
);

INSERT INTO composeOf(cdCode, songCode, trackNumber) VALUES 
('C1','S1',1),
('C1','S2',2),
('C1','S3',3),
('C1','S12',4),
('C1','S11',5),
('C1','S13',6),
('C1','S10',7),
('C1','S8',8),
('C2','S4',1),
('C3','S5',1),
('C3','S6',2),
('C4','S7',1),
('C4','S8',2),
('C4','S9',3),
('C5','S10',1),
('C5','S11',2),
('C5','S8',3),
('C6','S12',1),
('C6','S13',2),
('C6','S14',3),
('C7','S15',1),
('C7','S16',2),
('C7','S10',3),
('C8','S17',1),
('C8','S18',2),
('C8','S1',3),
('C8','S2',4),
('C8','S7',5),
('C8','S19',6),
('C8','S8',7),
('C8','S9',8),
('C8','S11',9),
('C8','S12',10),
('C9','S18',1),
('C9','S1',2),
('C9','S2',3),
('C9','S3',4),
('C9','S4',5),
('C9','S5',6),
('C9','S6',7),
('C9','S7',8),
('C9','S8',9),
('C10','S1',1),
('C10','S2',2),
('C11','S2',1),
('C11','S3',2),
('C12','S3',1),
('C13','S1',1),
('C13','S7',2),
('C13','S6',3),
('C13','S2',4),
('C13','S3',5),
('C13','S4',6),
('C13','S5',7),
('C14','S5',1),
('C14','S6',2),
('C14','S7',3),
('C14','S8',4),
('C14','S9',5),
('C15','S6',1),
('C16','S8',1),
('C16','S9',2),
('C17','S9',1),
('C18','S1',1),
('C18','S10',2),
('C18','S13',3),
('C19','S1',1),
('C19','S2',2),
('C19','S3',3),
('C20','S4',1),
('C20','S14',2),
('C20','S10',3),
('C21','S14',1),
('C21','S7',2),
('C21','S18',3),
('C21','S13',4),
('C21','S1',5),
('C21','S19',6),
('C21','S17',7),
('C21','S5',8),
('C22','S20',1),
('C22','S21',2),
('C22','S22',3);

CREATE TABLE writtenBy (
	songCode VARCHAR(10),
	artistID VARCHAR(10),
	PRIMARY KEY(songCode, artistID)
);

INSERT INTO writtenBy (songCode, artistID) VALUES
('S1','A1'),
('S2','A1'),
('S3','A12'),
('S4','A3'),
('S5','A1'),
('S5','A2'),
('S6','A2'),
('S7','A6'),
('S8','A7'),
('S9','A7'),
('S10','A8'),
('S11','A3'),
('S12','A8'),
('S13','A8'),
('S14','A8'),
('S15','A8'),
('S16','A9'),
('S17','A4'),
('S18','A10'),
('S19','A13'),
('S20','A15'),
('S21','A15'),
('S22','A15'),
('S23','A16'),
('S24','A16'),
('S25','A16');

CREATE TABLE topSongs (
	songCode VARCHAR(10), 
	year INT, 
	rating INT,
	PRIMARY KEY(songCode, year)
);

INSERT INTO topSongs (songCode, year, rating) VALUES
('S1',1987,5),
('S2',1987,1),
('S4',1990,1),
('S5',1998,3),
('S6',1998,5),
('S8',2000,4),
('S10',1993,2),
('S11',1993,13),
('S12',1998,1),
('S14',1998,4),
('S15',1999,1),
('S16',1999,3),
('S17',2003,1),
('S18',2003,12),
('S19',2000,1),
('S20',2016,1),
('S23',2019,2),
('S24',2022,1),
('S25',2012,4);

