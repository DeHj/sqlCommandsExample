use dbMusicService



-- Заполняем таблицы значениями

/*
delete from Users
go
INSERT INTO Users (Name, Password) VALUES
('Денис', '111'),
('Семён', '222'),
('Эратосфен', '333');

delete from Genres
go
INSERT INTO Genres (Name) VALUES
('Stoner rock'),
('Pop'),
('Blues'),
('Doom metal'),
('Jazz');

delete from Tracks
go
INSERT INTO Tracks (IDGroup, Name) VALUES
(1, 'Name1'),
(1, 'Name2'),
(2, 'Name3'),
(2, 'Name4');

delete from Authors	
go
INSERT INTO Authors (Name) VALUES
('Authors1'),
('Authors2'),
('Authors3');
*/



--SELECT * from Groups
--SELECT * from Authors
--SELECT * from Tracks
--SELECT * from Genres
--SELECT * from Track_Genre
--Select * from User_Genre where User_Genre.IdUser = 2


-- Добавляем связи между пользователями и жанрами

/*
--delete from User_Genre
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



-- Добавляем связи между треками и жанрами


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
*/


/*
select * from
	(select Tracks.IDTrack, Tracks.Name, SUM(Track_Genre.coef * User_Genre.coef_preference) as resultCoef
		from Users
			join User_Genre on Users.IdUser = User_Genre.IdUser
			join Track_Genre on User_Genre.IdGenre = Track_Genre.IdGenre
			join Tracks on Track_Genre.IDTrack = Tracks.IdTrack
			where Users.IdUser = 1
			group by Users.Name, Users.IdUser, Tracks.Name, Tracks.IdTrack
	) as A
	where resultCoef > 0
	except
	select IdTrack from User_Track
	where User_Track.IdUser = 1
	order by resultCoef desc


--select * from User_Genre
--select * from Track_Genre
/*
select IDTrack from User_Track
where User_Track.IdUser = @IdUser
*/

*/

/*
select Tracks.IDTrack, Tracks.Name, SUM(Track_Genre.coef * User_Genre.coef_preference) as resultCoef
		from Users
			join User_Genre on Users.IdUser = User_Genre.IdUser
			join Track_Genre on User_Genre.IdGenre = Track_Genre.IdGenre
			join Tracks on Track_Genre.IDTrack = Tracks.IdTrack
			where Users.IdUser = 1
			--except
			--select User_Track.IdTrack from User_Track
			--where User_Track.IdUser = 1
		group by Users.Name, Users.IdUser, Tracks.Name, Tracks.IdTrack
*/

/*
select User_Track.IDTrack from User_Track
where User_Track.IdUser = 2
*/

/*
select Tracks.IDTrack, Tracks.Name, SUM(Track_Genre.coef * User_Genre.coef_preference) as resultCoef
		from Users
			join User_Genre on Users.IdUser = User_Genre.IdUser
			join Track_Genre on User_Genre.IdGenre = Track_Genre.IdGenre
			join Tracks on Track_Genre.IDTrack = Tracks.IdTrack
			where Users.IdUser = 1
			--except
			--select User_Track.IdTrack from User_Track
			--where User_Track.IdUser = 1
		group by Users.Name, Users.IdUser, Tracks.Name, Tracks.IdTrack
*/

