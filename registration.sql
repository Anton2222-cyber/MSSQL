use Registration

create table accounts(
	id int identity(1,1) primary key,
	login varchar(20) unique,
	password varchar(100),
	
)

create procedure addUser
@login varchar(20),
@password varchar(100),
@IsSuccessfully bit out
as 
begin
begin transaction
	begin try
	if(@password like '% %')
	begin
	print 'password contains spaces'
	SELECT @IsSuccessfully = 0
			rollback			
			return
	end	
	if(len(@password)<8)
	begin
	print 'too short password'
			SELECT @IsSuccessfully = 0
			rollback
			return
	end
	if(len(trim(@password))!=0 and @password=trim(@password) and @password not LIKE '%' + char(9)+ '%')
	begin
	declare @hash varchar(100)
	select @hash = HASHBYTES('SHA1',@login+@password)
	
	insert into accounts values(@login, @hash)
	SELECT @IsSuccessfully = 1
	end
	else
	begin
	print 'password contains spaces'
	SELECT @IsSuccessfully = 0
			rollback			
			return
	end	
	end try
	begin catch
		print 'unexpected error'
			SELECT @IsSuccessfully = 0
		rollback
		return
	end catch
	commit
	return
end
select * from accounts
declare @isneis bit
execute addUser 'king1234', '12345678', @isneis out
select @isneis 

create procedure getBoolByLoginAndPassword
@login varchar(20),
@password varchar(100),
@IsSuccessfully bit out
as
begin
	declare @hash varchar(100)
	select @hash = HASHBYTES('SHA1',@login+@password)--создаю хэш, на основе полученного пароля

	declare @passwordDB varchar(100)
	select @passwordDB = password --вытаскиваю пароль по логину из б.д.
	from accounts
	where login = @login

	if(@hash = @passwordDB)
	begin
		select @IsSuccessfully = 1--подготовка возвращаемых данных	
		return
	end
	else
	begin
	select @IsSuccessfully = 0--подготовка возвращаемых данных	
		return
	end
end

select * from accounts
declare @isneis bit
execute getBoolByLoginAndPassword 'king1234', '12345678', @isneis out
select @isneis 