
alter procedure SearchAuthorWork @author nvarchar(50)
as
--declare @author nvarchar(50)
--set @author = 'William Shakespeare'
select b.title
from booksauthors as AB
full outer join authors  as A on a.authorid = ab.AuthorID
full outer join books as B on b.bookid = ab.BookID
where a.name like '%' + @author + '%'

execute SearchAuthorWork 'Shakes'

	