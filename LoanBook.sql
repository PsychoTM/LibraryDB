
alter PROCEDURE LoanBook
	-- Add the parameters for the stored procedure here
(@CustIDs int,@LibrarianIDs int,@BookIDs int)
AS
BEGIN
insert into loans (BookTitle,LoanDate,CustIDs,LibrarianIDs,BookIDs,loan_is_active)
values
(,GetDate(),@CustIDs,@LibrarianIDs,@BookIDs,1)
END
GO


alter PROCEDURE LoanBook
	-- Add the parameters for the stored procedure here
(@BookTitle nvarchar(50), @LibrarianIDs int, @CustIDs int)
AS
BEGIN
insert into loans
select title,GetDate(),1,bookid, @LibrarianIDs, @CustIDs
from books b
where title like '%' + @BookTitle + '%'

END
GO

execute LoanBook 'All',2,4

execute LoanBook 1,1,1
execute LoanBook 1,1,7
execute LoanBook 1,1,9
execute LoanBook 3,2,5

execute LoanBook 4,2,7
execute LoanBook 2,2,8
execute LoanBook 2,2,11


select * 
from loans