
alter PROCEDURE toploaners 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CustIDs, c.customer_name, count(CustIDs) as numberofloans
	from loans as l
inner join customers as c	on c.custid = l.CustIDs
		group by CustIDs,c.customer_name
		order by numberofloans desc
		
END
GO


execute toploaners