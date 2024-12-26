/*
 Script for creating stored procedure to insert data into emp_department table
*/

CREATE OR ALTER PROCEDURE USP_insert_emp_department_data
AS
BEGIN
    IF
        EXISTS (
            SELECT TABLE_NAME
            FROM w3resource_sql.INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = 'dbo'
                AND TABLE_NAME = 'emp_department'
        )
        AND NOT EXISTS (SELECT 1 FROM w3resource_sql.dbo.emp_department)
        BEGIN
            BULK INSERT w3resource_sql.dbo.emp_department
            FROM '/tmp/csvdata/emp_department.csv'
            WITH (
                FORMAT = 'CSV',
                FIELDTERMINATOR = ',',
                ROWTERMINATOR = '\n',
                FIRSTROW = 2
            )
        END
END
