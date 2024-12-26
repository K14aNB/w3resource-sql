/*
 Script for creating customer table
 */

IF
    EXISTS (
        SELECT name FROM sys.databases
        WHERE name = 'w3resource_sql'
    )
    AND NOT EXISTS (
        SELECT TABLE_NAME FROM w3resource_sql.INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'salesman'
    )
    BEGIN
        CREATE TABLE w3resource_sql.dbo.salesman (
            salesman_id SMALLINT PRIMARY KEY,
            name VARCHAR(40) NOT NULL,
            city VARCHAR(30) NOT NULL,
            commission DECIMAL(3, 2) NOT NULL
        )

    END
