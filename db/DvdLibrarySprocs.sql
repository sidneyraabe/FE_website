USE DvdLibraryApp;
GO

IF EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.ROUTINES
	WHERE ROUTINE_NAME = 'GetAllDVD'
	)
BEGIN
	DROP PROCEDURE GetAllDVD
END
GO

CREATE PROCEDURE GetAllDVD
AS

SELECT Id, Title, ReleaseYear, Director, Rating, Notes
FROM DVD
ORDER BY Id

GO

IF EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.ROUTINES
	WHERE ROUTINE_NAME = 'GetDVDById'
	)
BEGIN
	DROP PROCEDURE GetDVDById
END
GO

CREATE PROCEDURE GetDVDById(
	@Id int
)

AS

SELECT Id, Title, ReleaseYear, Director, Rating, Notes
FROM DVD
WHERE Id = @Id

GO

IF EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.ROUTINES
	WHERE ROUTINE_NAME = 'GetDVDByTitle'
	)
BEGIN
	DROP PROCEDURE GetDVDByTitle
END
GO

CREATE PROCEDURE GetDVDByTitle(
	@Title nvarchar(50)
)

AS

SELECT Id, Title, ReleaseYear, Director, Rating, Notes
FROM DVD
WHERE Title LIKE '%' + @Title + '%'
ORDER BY Id

GO

IF EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.ROUTINES
	WHERE ROUTINE_NAME = 'GetDVDByReleaseYear'
	)
BEGIN
	DROP PROCEDURE GetDVDByReleaseYear
END
GO

CREATE PROCEDURE GetDVDByReleaseYear(
	@ReleaseYear int
)

AS

SELECT Id, Title, ReleaseYear, Director, Rating, Notes
FROM DVD
WHERE ReleaseYear = @ReleaseYear
ORDER BY Id

GO

IF EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.ROUTINES
	WHERE ROUTINE_NAME = 'GetDVDByDirectorName'
	)
BEGIN
	DROP PROCEDURE GetDVDByDirectorName
END
GO

CREATE PROCEDURE GetDVDByDirectorName(
	@Director nvarchar(50)
)

AS

SELECT Id, Title, ReleaseYear, Director, Rating, Notes
FROM DVD
WHERE Director LIKE '%' + @Director + '%'
ORDER BY Id

GO

IF EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.ROUTINES
	WHERE ROUTINE_NAME = 'GetDVDByRating'
	)
BEGIN
	DROP PROCEDURE GetDVDByRating
END
GO

CREATE PROCEDURE GetDVDByRating(
	@Rating varchar(5)
)

AS

SELECT Id, Title, ReleaseYear, Director, Rating, Notes
FROM DVD
WHERE Rating LIKE @Rating
ORDER BY Id

GO

IF EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.ROUTINES
	WHERE ROUTINE_NAME = 'DeleteDVD'
	)
BEGIN
	DROP PROCEDURE DeleteDVD
END
GO

CREATE PROCEDURE DeleteDVD(
	@Id int
)

AS

DELETE FROM DVD
WHERE Id = @Id;

GO

IF EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.ROUTINES
	WHERE ROUTINE_NAME = 'CreateDVD'
	)
BEGIN
	DROP PROCEDURE CreateDVD
END
GO

CREATE PROCEDURE CreateDVD(
	@Title nvarchar(50),
	@ReleaseYear int,
	@Director nvarchar(50),
	@Rating varchar(5),
	@Notes nvarchar(100) null
)

AS

INSERT INTO dbo.DVD
	(Title,
	ReleaseYear,
	Director,
	Rating,
	Notes)
VALUES (@Title,
	@ReleaseYear,
	@Director,
	@Rating,
	@Notes)
GO

IF EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.ROUTINES
	WHERE ROUTINE_NAME = 'UpdateDVD'
	)
BEGIN
	DROP PROCEDURE UpdateDVD
END
GO

CREATE PROCEDURE UpdateDVD(
	@Id int,
	@Title nvarchar(50),
	@ReleaseYear int,
	@Director nvarchar(50),
	@Rating varchar(5),
	@Notes nvarchar(100) null
)

AS

UPDATE dbo.DVD
SET Title = @Title,
	ReleaseYear = @ReleaseYear,
	Director = @Director,
	Rating = @Rating,
	Notes = @Notes
WHERE dbo.DVD.Id = @Id;

GO