use dbMusicService

/*
drop table Users
go
CREATE TABLE [dbo].[Users]
(
	IdUser int NOT NULL IDENTITY,
	Name nvarchar(max),
	Password nvarchar(max),
	PRIMARY KEY	(IdUser)
)
*/

/*
drop table User_Track
go
create table User_Track
(
	ID_U_T int not null IDENTITY,
	IdUser int not null,
	IdTrack int not null,
	MarkIsGood bit,
	PRIMARY KEY (ID_U_T)
)
*/

/*
--drop table Tracks
go
CREATE TABLE [dbo].[Tracks]
(
	IdTrack int NOT NULL IDENTITY,
	IDGroup int NOT NULL,
	Name nvarchar(max) NOT NULL,
	Path nvarchar(max),
	PRIMARY KEY	(IdTrack)
)


go
CREATE TABLE [dbo].[Genres]
(
	IdGenre int NOT NULL IDENTITY,
	Name nvarchar(max),
	PRIMARY KEY	(IdGenre)
)


--drop table Groups
go
CREATE TABLE [dbo].[Groups]
(
	IdGroup int NOT NULL IDENTITY,
	IdAuthor int NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max),
	PRIMARY KEY	(IdGroup)
)


go
CREATE TABLE [dbo].[User_Genre]
(
	ID_U_G int NOT NULL IDENTITY,
	IdUser int NOT NULL,
	IdGenre int NOT NULL,
	coef_preference real NOT NULL,
	coef_stability real NOT NULL,
	PRIMARY KEY	(ID_U_G)
)


go
CREATE TABLE [dbo].[Track_Genre]
(
	ID_T_G int NOT NULL IDENTITY,
	IDTrack int NOT NULL,
	IdGenre int NOT NULL,
	coef real NOT NULL,
	PRIMARY KEY	(ID_T_G)
)
*/

/*
drop table Authors
go
create table Authors
(
	IDAuthor int NOT NULL IDENTITY,
	Name nvarchar(max),
	Password nvarchar(max),
	PRIMARY KEY (IDAuthor)
)
*/


--drop table User_Genre
--drop table Groups