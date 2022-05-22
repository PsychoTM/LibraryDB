
alter PROCEDURE CheckAvailability
(@BookTitle nvarchar(50))
AS
BEGIN

	SET NOCOUNT ON;
	if @BookTitle is not null	
    -- Insert statements for procedure here
	begin
	 SELECT BookIDs,b.title , loan_is_active
	from loans as l
    inner join books b on b.bookid = l.BookIDs
	where b.title like '%' + @BookTitle + '%'

	end
	else 
	begin
		 SELECT BookIDs,b.title, loan_is_active
	from loans l
	inner join books b on b.bookid = l.BookIDs
	end
END
GO


execute CheckAvailability @BookTitle = null
execute CheckAvailability 'All'