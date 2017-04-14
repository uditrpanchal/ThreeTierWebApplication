USE Sample
GO

CREATE PROCEDURE SPInsertUpdateCustomer
	@CustomerID BIGINT = 0,
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@BirthDate DATETIME,
	@Email NVARCHAR(320),
	@Address NVARCHAR(100)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Customer WHERE CustomerID = @CustomerID)
	BEGIN
		UPDATE Customer
		SET	FirstName = @FirstName,
			LastName = @LastName,
			BirthDate = @BirthDate,
			Email = @Email,
			[Address] = @Address
		WHERE
			CustomerID = @CustomerID
		RETURN @CustomerID
	END
	ELSE
	BEGIN
		INSERT INTO Customer (FirstName,LastName,BirthDate,Email,[Address])
		VALUES (@FirstName,@LastName,@BirthDate,@Email,@Address)
		RETURN SCOPE_IDENTITY()
	END
END