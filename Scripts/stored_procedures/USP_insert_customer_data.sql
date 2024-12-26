/*
 Script for creating stored procedure to insert data into customer table
 */

CREATE OR ALTER PROCEDURE USP_insert_customer_data
AS
BEGIN
    IF
        EXISTS (
            SELECT TABLE_NAME
            FROM w3resource_sql.INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = 'dbo'
                AND TABLE_NAME = 'customer'
        )
        AND NOT EXISTS (SELECT 1 FROM w3resource_sql.dbo.customer)
        BEGIN
            BULK INSERT w3resource_sql.dbo.customer
            FROM '/tmp/csvdata/customer.csv'
            WITH (
                FORMAT = 'CSV',
                FIELDTERMINATOR = ',',
                ROWTERMINATOR = '\n',
                FIRSTROW = 2
            )
        END
END
