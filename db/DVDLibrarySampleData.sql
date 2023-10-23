USE DvdLibraryApp;
GO

SET IDENTITY_INSERT dbo.DVD ON;
GO

INSERT INTO DVD(Id, Title, ReleaseYear, Director, Rating, Notes) VALUES
(1, 'Minions', 2017, 'Kyle Balda & Pierre Coffin', 'PG', 'Small. Yellow. Ridiculous.'),
(2, 'Nulled Notes Test', 2021, 'Sidney Raabe', 'PG', null),
(43, 'Muppets Take Manhattan', 1984, 'Frank Oz', 'G', 'Muppets .... ON BROADWAY!'),
(45, 'The Great Muppet Caper', 1981, 'Jim Henson', 'G', 'Diamonds. Muppets. Intrigue. A+++'),
(46, 'This is an entry done using ADO', 2021, 'Sidney Raabe', 'R', 'Oh shit does it actually work?');

SET IDENTITY_INSERT dbo.DVD OFF;
GO