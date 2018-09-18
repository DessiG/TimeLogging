CREATE LOGIN admin WITH PASSWORD = 'SQLdb@1234'
GO

Use [TimeTracking];
GO

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'admin')
BEGIN
    CREATE USER [admin] FOR LOGIN [admin]
    EXEC sp_addrolemember N'db_owner', N'admin'
END;
GO