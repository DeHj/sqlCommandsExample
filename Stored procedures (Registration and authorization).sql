use dbMusicService

-- Регистрация пользователя

/*
drop procedure AddUser
go
create procedure AddUser
	@Name nvarchar(max),
	@Password nvarchar(max),
	@Success bit output,
	@Message nvarchar(100) output,
	@ID int output
as
begin
	if (@Name = '')
	begin
		select @Success = 0
		select @Message = 'Некорректный логин'
		return
	end
	else if (@Password = '')
	begin
		select @Success = 0
		select @Message = 'Некорректный пароль'
		return
	end
	else if (select count(*) from Users where Users.Name = @Name) = 0
	begin
		Insert into Users (Name, Password) values
		(@Name, @Password);
		select @Success = 1
		select @ID = (select IdUser from Users where Users.Name = @Name)
	end
	else
	begin
		select @Success = 0
		select @Message = 'Пользователь с таким логином уже существует'
	end
end
*/



-- Регистрация автора

/*
drop procedure AddAuthor
go
create procedure AddAuthor
	@Name nvarchar(max),
	@Password nvarchar(max),
	@Success bit output,
	@Message nvarchar(100) output,
	@ID int output
as
begin
	if (@Name = '')
	begin
		select @Success = 0
		select @Message = 'Некорректный логин'
		return
	end
	else if (@Password = '')
	begin
		select @Success = 0
		select @Message = 'Некорректный пароль'
		return
	end
	else if (select count(*) from Authors where Authors.Name = @Name) = 0
	begin
		Insert into Authors (Name, Password) values
		(@Name, @Password);
		select @Success = 1
		select @ID = (select IDAuthor from Authors where Authors.Name = @Name)
	end
	else
	begin
		select @Success = 0
		select @Message = 'Пользователь с таким логином уже существует'
	end
end
*/



-- Авторизация пользователя

/*
drop procedure UserLogin
go
create procedure UserLogin
	@Name nvarchar(max),
	@Password nvarchar(max),
	@Success bit output,
	@Message nvarchar(100) output,
	@ID int output
as
begin
	if (@Name = '')
	begin
		select @Success = 0
		select @Message = 'Некорректный логин'
		return
	end
	else if ((select count(*) from Users where Users.Name = @Name) != 1)
	begin
		select @Success = 0
		select @Message = 'Пользователя с таким логином не существует'
		return
	end
	else if ((select Password from Users where Name = @Name) = @Password)
	begin
		select @Success = 1
		select @ID = (select IdUser from Users where Users.Name = @Name)
	end
	else
	begin
		select @Success = 0
		select @Message = 'Неверный пароль'
	end
end
*/



-- Авторизация автора

/*
drop procedure AuthorLogin
go
create procedure AuthorLogin
	@Name nvarchar(max),
	@Password nvarchar(max),
	@Success bit output,
	@Message nvarchar(100) output,
	@ID int output
as
begin
	if (@Name = '')
	begin
		select @Success = 0
		select @Message = 'Некорректный логин'
		return
	end
	else if ((select count(*) from Authors where Authors.Name = @Name) != 1)
	begin
		select @Success = 0
		select @Message = 'Пользователя с таким логином не существует'
		return
	end
	else if ((select Password from Authors where Name = @Name) = @Password)
	begin
		select @Success = 1
		select @ID = (select IDAuthor from Authors where Authors.Name = @Name)
	end
	else
	begin
		select @Success = 0
		select @Message = 'Неверный пароль'
	end
end
*/



/*
declare @var1 int
select @var1 = Users.IdUser from Users where Users.Name = 'Семён'

PRINT @var1
*/







