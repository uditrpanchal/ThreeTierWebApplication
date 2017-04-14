USE Sample
GO

CREATE PROCEDURE SPDeleteCustomer
	@CustomerID BIGINT = 0
AS
BEGIN
	DELETE FROM Customer WHERE CustomerID = @CustomerID
END