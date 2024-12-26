/*
 Script for creating stored procedure to insert data into emp_details table
 */

CREATE OR ALTER PROCEDURE USP_insert_emp_details_data
AS
BEGIN
    IF
        EXISTS (
            SELECT TABLE_NAME FROM w3resource_sql.INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'emp_details'
        )
        AND NOT EXISTS (SELECT 1 FROM w3resource_sql.dbo.emp_details)
        BEGIN
            BULK INSERT w3resource_sql.dbo.emp_details
            FROM '/tmp/csvdata/emp_details.csv'
            WITH (
                FORMAT = 'CSV',
                FIELDTERMINATOR = ',',
                ROWTERMINATOR = '\n',
                FIRSTROW = 2
            )
        END
END
