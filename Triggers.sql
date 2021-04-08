go
create trigger Limits
on User_Genre
after update
as
begin
	update User_Genre
		set
			User_Genre.coef_preference = 1
		from User_Genre
		where User_Genre.coef_preference > 1;
	update User_Genre
		set
			User_Genre.coef_preference = -1
		from User_Genre
		where User_Genre.coef_preference < -1;
	update User_Genre
		set
			User_Genre.coef_stability = 0
		from User_Genre
		where User_Genre.coef_stability < 0
end