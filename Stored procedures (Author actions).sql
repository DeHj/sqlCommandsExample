-- Adding of a musical band procedure

go
create procedure AddGroup
	@IdAuthor int,
	@Name nvarchar(max)
as
begin
	if (select count(*) from Authors where Authors.IdAuthor = @IdAuthor) <> 0  -- Checking that an author with such id is exist
		if (select count(*) from Groups where Groups.Name = @Name) = 0   -- Checking that a band with such name does not exist
		begin
			Insert into Groups (Name, Description, IdAuthor) values
			(@Name, '', @IdAuthor);
		end
end



-- Adding of a track procedure

go
create procedure AddTrack
	@IdGroup int,
	@Name nvarchar(max),
	@Path nvarchar(max)
as
begin
	if (select count(*) from Groups where Groups.IDGroup = @IdGroup) <> 0   -- Checking that a band with such name is exist
	begin
		Insert into Tracks (IdGroup, Name, Path) values
		(@IdGroup, @Name, @Path);
	end
end




















