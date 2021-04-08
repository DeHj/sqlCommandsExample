-- Filling tables by values

go
INSERT INTO Users (Name, Password) VALUES
('Den', '111'),
('Sam', '222'),
('Eratosthenes', '333');

go
INSERT INTO Genres (Name) VALUES
('Stoner rock'),
('Pop'),
('Blues'),
('Doom metal'),
('Jazz');

go
INSERT INTO Tracks (IDGroup, Name) VALUES
(1, 'Name1'),
(1, 'Name2'),
(2, 'Name3'),
(2, 'Name4');
	
go
INSERT INTO Authors (Name) VALUES
('Authors1'),
('Authors2'),
('Authors3');



-- Adding of links users-genres

go
INSERT INTO User_Genre (IdUser, IDGenre, coef_preference, coef_stability) VALUES

(1, 1, 0.6, 1),
(1, 2, 0.2, 1),
(1, 4, 0.7, 1),
(1, 5, 0.8, 1),

(2, 1, 0.8, 1),
(2, 2, -0.3, 1),
(2, 3, 1.0, 1),
(2, 5, 0.4, 1),

(3, 2, 1.0, 1),
(3, 5, 0.4, 1);



-- Adding of links tracks-genres

go
INSERT INTO Track_Genre (IdTrack, IDGenre, coef) VALUES
(1, 2, 1.0),
(1, 5, 0.2),
(2, 1, 0.7),
(2, 4, 1.0),
(3, 1, 0.9),
(3, 4, 0.5),
(4, 3, 1.0),
(5, 3, 0.4),
(5, 5, 0.8);