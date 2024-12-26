/*
 Script for creating stored procedures to insert data into test table
*/

CREATE OR ALTER PROCEDURE USP_insert_test_data
AS
BEGIN
    IF
        EXISTS (
            SELECT TABLE_NAME
            FROM w3resource_sql.INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = 'dbo'
                AND TABLE_NAME = 'test'
        )
        AND NOT EXISTS (SELECT 1 FROM w3resource_sql.dbo.test)
        BEGIN
            BULK INSERT w3resource_sql.dbo.test
            FROM '/tmp/csvdata/test.csv'
            WITH (
                FORMAT = 'CSV',
                FIELDTERMINATOR = ',',
                ROWTERMINATOR = '\n',
                FIRSTROW = 2
            )
        END
END
