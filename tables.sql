
--Table for books

create table books(
bookid int IDENTITY(1,1) PRIMARY KEY,
title char(50),
genre char(50)
)

alter table books
alter column --title nvarchar(50)
 genre nvarchar(50)

insert into books (title, genre)
values
--('All is well That Ends Well','Comedy'),('As You Like It','Comedy'),('The Comedy of Horrors','Comedy'),('Measure for Measure','Comedy'),('Merchant of Venice','ComedyAntony and Cleopatra','TragedyCoriolanus','Tragedy'),('Cymbeline','Tragedy'),('Hamlet','Tragedy') -- William Shakespear
--('The Mysterious Affair at Styles','Crime'),('The Secret Adversary','Crime'),('The Murder on the Links','Crime'),('The Man in the Brown Suit','Crime'),('The Secret of Chimneys','Crime'),('The Murder of Roger Ackroyd','Crime') --Agatha Christie
--('Jig-Saw','Contemporary Romance'),('Sawdust','Contemporary Romance'),('If the Tree is Saved','Contemporary Romance') --Barbara Cartland
--('Going Home','Novel'),('Passions Promise','Novel'),('Now and Forever','Novel') --Danielle Steel

alter table books
drop column Stock

update books
set Stock = 15
where Stock is null



select *
from books
-- Table for authors

create table authors (
authorid int IDENTITY(1,1) PRIMARY KEY,
name char(50)
)

alter table authors
alter column name nvarchar(50)


insert into authors(name)
values
('William Shakespeare')
('Agatha Christie'),
('Barbara Cartland'),
('Danielle Steel'),
('Harold Robbins'),
('Georges Simenon'),
('Enid Blyton')

select *
from authors


--Connective table
create table booksauthors (
AuthorID int not null, 
BookID	 int not null, 
foreign key (AuthorID) references authors(authorid),
foreign key (BookID) references books(bookid)
)

select * 
from booksauthors

insert into booksauthors (BookID,AuthorID)
values
--(1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1) --William Shakespeare
--(10,2),(11,2),(12,2),(13,2),(14,2),(15,2) --Agatha Christie
--(16,3),(17,3),(18,3) --Barbara Cartland
(19,4),(20,4),(21,4)--Danielle Steel

select *
from booksauthors


--Loans table
create table loans (BookTitle nvarchar(50),
LoanDate date,
loan_is_active bit,
BookIDs int  not null,
LibrarianIDs int  not null,
CustIDs int  not null,
foreign key (BookIDs) references books(bookid),
foreign key (LibrarianIDs) references librarians(librarianid),
foreign key (CustIDs) references customers(custid)
)


select * 
from loans

update loans
set LoanDate = getdate()


update a
set BookTitle = b.title
from loans as a
inner join books as b on a.BookIDs = b.bookid

delete from loans

--Customers Table
create table customers(
custid int identity(1,1) primary key,
customer_name char(50),
customer_address char(50)
)

alter table customers
alter column --customer_name nvarchar(50)
customer_address nvarchar(50)

insert into customers (customer_name,customer_address)
values
('John Lennon','Sweep Street'),('Aubrey Plaza','Glory Street'),('Tom Holland','Penford Drive'),('Kirsten Stewart','Twilight Street')

select *
from customers

--Librarian Table
create table librarians(
librarianid int identity (1,1) primary key,
librarian_name char(50)
)

alter table librarians
alter column librarian_name nvarchar(50)



insert into librarians (librarian_name)
values
('Gertrude Bookington'),('Andrew Lovemelot')

select * 
from librarians