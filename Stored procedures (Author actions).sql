use dbMusicService	



-- ��������� ���������� ������

/*
--drop procedure AddGroup
go
create procedure AddGroup
	@IdAuthor int,
	@Name nvarchar(max)
as
begin
	if (select count(*) from Authors where Authors.IdAuthor = @IdAuthor) <> 0  -- �������� ������������� ������ ������
		if (select count(*) from Groups where Groups.Name = @Name) = 0   -- �������� ����, ��� ����� ������ ��� ���
		begin
			Insert into Groups (Name, Description, IdAuthor) values
			(@Name, '', @IdAuthor);
		end
end
*/



-- ��������� ���������� ����������

/*
go
create procedure AddTrack
	@IdGroup int,
	@Name nvarchar(max),
	@Path nvarchar(max)
as
begin
	if (select count(*) from Groups where Groups.IDGroup = @IdGroup) <> 0   -- �������� ������������� ����� ������ 
	begin
		Insert into Tracks (IdGroup, Name, Path) values
		(@IdGroup, @Name, @Path);
	end
end
*/




















