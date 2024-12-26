/*
 Script for creating emp_department table
*/

IF
    EXISTS (
        SELECT name FROM sys.databases
        WHERE name = 'w3resource_sql'
    )
    AND NOT EXISTS (
        SELECT TABLE_NAME FROM w3resource_sql.INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'emp_department'
    )
    BEGIN
        CREATE TABLE w3resource_sql.dbo.emp_department (
            dept_code TINYINT PRIMARY KEY,
            dept_name VARCHAR(20) UNIQUE NOT NULL,
            dpt_allotment INT NOT NULL
        )
    END
