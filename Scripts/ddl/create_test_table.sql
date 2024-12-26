/*
 Script for creating test table
*/

IF
    EXISTS (
        SELECT name FROM sys.databases
        WHERE name = 'w3resource_sql'
    )
    AND NOT EXISTS (
        SELECT TABLE_NAME FROM w3resource_sql.INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'test'
    )
    BEGIN
        CREATE TABLE w3resource_sql.dbo.test (col1 NVARCHAR(50) NOT NULL)
    END
