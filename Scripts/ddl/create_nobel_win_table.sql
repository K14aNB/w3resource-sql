/*
 Script for creating nobel_win table
 */

IF
    EXISTS (
        SELECT name FROM sys.databases
        WHERE name = 'w3resource_sql'
    )
    AND NOT EXISTS (
        SELECT TABLE_NAME FROM w3resource_sql.INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'nobel_win'
    )
    BEGIN
        CREATE TABLE w3resource_sql.dbo.nobel_win (
            year SMALLINT NOT NULL,
            subject VARCHAR(20) NOT NULL,
            winner VARCHAR(50) NOT NULL,
            country VARCHAR(30) NOT NULL,
            category VARCHAR(40) NOT NULL
        )

    END
