/*
 Script for creating stored procedure to insert data into orders table
 */

CREATE OR ALTER PROCEDURE USP_insert_orders_data
AS
BEGIN
    IF
        EXISTS (
            SELECT TABLE_NAME FROM w3resource_sql.INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'orders'
        )
        AND NOT EXISTS (SELECT 1 FROM w3resource_sql.dbo.orders)
        BEGIN
            BULK INSERT w3resource_sql.dbo.orders
            FROM '/tmp/csvdata/orders.csv'
            WITH (
                FORMAT = 'CSV',
                FIELDTERMINATOR = ',',
                ROWTERMINATOR = '\n',
                FIRSTROW = 2
            )
        END
END
