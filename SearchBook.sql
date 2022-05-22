USE [TSQL2012]
GO
/****** Object:  StoredProcedure [dbo].[SearchBookName]    Script Date: 07-Apr-22 12:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SearchBookName] @bookname nvarchar(50)
as
begin
	--declare @bookname nvarchar(50)
	--set @bookname = 'All is well That Ends Well'
	select title
	from books
	where title like '%' +  @bookname + '%'	

end


execute SearchBookName @bookname = 'All'