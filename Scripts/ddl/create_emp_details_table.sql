/*
 Script for creating emp_details table
 */

IF
    EXISTS (
        SELECT name FROM sys.databases
        WHERE name = 'w3resource_sql'
    )
    AND NOT EXISTS (
        SELECT TABLE_NAME FROM w3resource_sql.INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'emp_details'
    )
    BEGIN
        CREATE TABLE w3resource_sql.dbo.emp_details (
            emp_idno INT PRIMARY KEY,
            emp_fname VARCHAR(30) NOT NULL,
            emp_lname VARCHAR(40) NOT NULL,
            emp_dept TINYINT NOT NULL
        )

    END
