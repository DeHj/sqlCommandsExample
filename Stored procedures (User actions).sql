use dbMusicService

/*
Select Users.Name, Track_Genre.IDTrack,  SUM(Track_Genre.coef * User_Genre.coef) as resultCoef
--Select *
from Users
	join User_Genre on Users.IdUser = User_Genre.IdUser
	join Track_Genre on User_Genre.IdGenre = Track_Genre.IdGenre
	group by IDTrack, Users.Name
*/

/*
Select * from Users, User_Genre
	where User_Genre.IdGenre = 1
*/

/*
Select Users.Name, Track_Genre.IDTrack, Tracks.Name as TrackName, SUM(Track_Genre.coef * User_Genre.coef) as resultCoef
	from Users
		join User_Genre on Users.IdUser = User_Genre.IdUser
		join Track_Genre on User_Genre.IdGenre = Track_Genre.IdGenre
		join Tracks on Track_Genre.IDTrack = Tracks.IdTrack
		where Users.IdUser = 2-- AND resultCoef > 0
		group by Track_Genre.IDTrack, Users.Name, Users.IdUser, Tracks.Name
*/
--order by resultCoef Desc



-- Процедура подбора рекомендованных композиций


drop procedure GetRecomendations;
go
create procedure GetRecomendations
	@idUser int
as
begin
	select * from
	(select Tracks.IDTrack, Tracks.Name, SUM(Track_Genre.coef * User_Genre.coef_preference) as resultCoef
		from Users
			join User_Genre on Users.IdUser = User_Genre.IdUser
			join Track_Genre on User_Genre.IdGenre = Track_Genre.IdGenre
			join Tracks on Track_Genre.IDTrack = Tracks.IdTrack
			where Users.IdUser = @idUser
			group by Users.Name, Users.IdUser, Tracks.Name, Tracks.IdTrack
	) as A
	where resultCoef > 0
	--except
	order by resultCoef desc
end




-- Процедура поиска композиции по названию

/*
drop procedure GetTrackByName
go
create procedure GetTrackByName
	@name nvarchar(max)
as
begin
	Select IDTrack, Name from Tracks
	where Name = @name
end
*/



-- Процедура проставления положительной оценки

/*
drop procedure PutLike
go
create procedure PutLike
	@IdUser int,
	@IdTrack int
as	
begin
	Insert into User_Genre (IdUser, IdGenre, coef_preference, coef_stability)
	select @IdUser, Track_Genre.IdGenre, 0, 1 from Track_Genre
	where (Track_Genre.IdTrack = @IdTrack)
	except
	select @IdUser, IdGenre, 0, 1 from User_Genre
	where (User_Genre.IdUser = @IdUser);
	
	update User_Genre
		set
			User_Genre.coef_preference += (Track_Genre.coef - User_Genre.coef_preference) / (1 + SQRT(User_Genre.coef_stability))
		from User_Genre
		join Users on Users.IdUser = User_Genre.IdUser
		join Track_Genre on User_Genre.IdGenre = Track_Genre.IdGenre
		where (Users.IDUser = @IdUser) and (Track_Genre.IDTrack = @IdTrack) and (User_Genre.coef_preference < Track_Genre.coef);
	update User_Genre
		set
			User_Genre.coef_stability += User_Genre.coef_preference * Track_Genre.coef
		from User_Genre
		join Users on Users.IdUser = User_Genre.IdUser
		join Track_Genre on User_Genre.IdGenre = Track_Genre.IdGenre
		where (Users.IDUser = @IdUser) and (Track_Genre.IDTrack = @IdTrack);

	Delete from User_Track
	where (User_Track.IdUser = @IdUser) and (User_Track.IdTrack = @IdTrack);

	Insert into User_Track (IdUser, IdTrack, MarkIsGood) VALUES
	(@IdUser, @IdTrack, 1);
end
*/



-- Процедура проставления отрицательной оценки

/*
drop procedure PutDislike
go
create procedure PutDislike
	@IdUser int,
	@IdTrack int
as	
begin
	Insert into User_Genre (IdUser, IdGenre, coef_preference, coef_stability)
	select @IdUser, Track_Genre.IdGenre, 0, 1 from Track_Genre
	where (Track_Genre.IdTrack = @IdTrack)
	except
	select @IdUser, IdGenre, 0, 1 from User_Genre
	where (User_Genre.IdUser = @IdUser);

	update User_Genre
		set
			User_Genre.coef_preference -= Track_Genre.coef / (1 + SQRT(User_Genre.coef_stability)),
			User_Genre.coef_stability -= User_Genre.coef_preference * Track_Genre.coef
		from User_Genre
		join Users on Users.IdUser = User_Genre.IdUser
		join Track_Genre on User_Genre.IdGenre = Track_Genre.IdGenre
		where (Users.IDUser = @IdUser) and (Track_Genre.IDTrack = @IdTrack);

	Delete from User_Track
	where (User_Track.IdUser = @IdUser) and (User_Track.IdTrack = @IdTrack);

	Insert into User_Track (IdUser, IdTrack, MarkIsGood) VALUES
	(@IdUser, @IdTrack, 0);
end
*/




--exec GetTrackByName 'Name1'
--exec GetRecomendations 1
--exec PutLike 1, 4
--exec PutDislike 1, 4

--select * from User_Genre
--where IdUser = 1

--exec GetRecomendations 1