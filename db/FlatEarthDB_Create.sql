USE [master]
GO

if exists (select * from sys.databases where name = N'FlatEarthDB')
begin
	EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'FlatEarthDB';
	ALTER DATABASE FlatEarthDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE FlatEarthDB;
end

CREATE DATABASE FlatEarthDB;
GO

USE FlatEarthDB;
GO

CREATE TABLE Comment (
Id int identity(1,1) primary key,
[Message] nvarchar(500) not null,
[TimeStamp] datetime not null default CURRENT_TIMESTAMP
)
