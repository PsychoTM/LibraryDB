

alter PROCEDURE ReturnBook
	-- Add the parameters for the stored procedure here
(@BookIDs int)
AS
BEGIN
	update loans
	set loan_is_active = 0
	where BookIDs = @BookIDs
END
GO

execute ReturnBook 7