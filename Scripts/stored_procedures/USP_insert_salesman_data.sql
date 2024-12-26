/*
 Script for creating stored procedure to insert data into salesman table
 */

CREATE OR ALTER PROCEDURE USP_insert_salesman_data
AS
BEGIN
    IF
        EXISTS (
            SELECT TABLE_NAME FROM w3resource_sql.INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'salesman'
        )
        AND NOT EXISTS (SELECT 1 FROM w3resource_sql.dbo.salesman)
        BEGIN
            BULK INSERT w3resource_sql.dbo.salesman
            FROM '/tmp/csvdata/salesman.csv'
            WITH (
                FORMAT = 'CSV',
                FIELDTERMINATOR = ',',
                ROWTERMINATOR = '\n',
                FIRSTROW = 2
            )
        END
END
