use dbMusicService	



-- Процедура добавления группы

/*
--drop procedure AddGroup
go
create procedure AddGroup
	@IdAuthor int,
	@Name nvarchar(max)
as
begin
	if (select count(*) from Authors where Authors.IdAuthor = @IdAuthor) <> 0  -- Проверка существования такого автора
		if (select count(*) from Groups where Groups.Name = @Name) = 0   -- Проверка того, что такой группы ещё нет
		begin
			Insert into Groups (Name, Description, IdAuthor) values
			(@Name, '', @IdAuthor);
		end
end
*/



-- Процедура добавления композиций

/*
go
create procedure AddTrack
	@IdGroup int,
	@Name nvarchar(max),
	@Path nvarchar(max)
as
begin
	if (select count(*) from Groups where Groups.IDGroup = @IdGroup) <> 0   -- Проверка существования такой группы 
	begin
		Insert into Tracks (IdGroup, Name, Path) values
		(@IdGroup, @Name, @Path);
	end
end
*/




















