USE Sample
GO

CREATE PROCEDURE SPGetCustomer
	@CustomerID BIGINT = 0
AS
BEGIN
	SET NOCOUNT ON;

	IF @CustomerID > 0
	BEGIN
		SELECT CustomerID,FirstName,LastName,BirthDate,Email,[Address]
		FROM Customer
		WHERE CustomerID = @CustomerID
		ORDER BY FirstName,LastName
	END
	ELSE
	BEGIN
		SELECT CustomerID,FirstName,LastName,BirthDate,Email,[Address]
		FROM Customer
		ORDER BY FirstName,LastName
	END
END