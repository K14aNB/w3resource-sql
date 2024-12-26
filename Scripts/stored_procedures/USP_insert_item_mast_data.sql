/*
 Script for creating stored procedure to insert data into item_mast table
 */

CREATE OR ALTER PROCEDURE USP_insert_item_mast_data
AS
BEGIN
    IF
        EXISTS (
            SELECT TABLE_NAME FROM w3resource_sql.INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'item_mast'
        )
        AND NOT EXISTS (SELECT 1 FROM w3resource_sql.dbo.item_mast)
        BEGIN
            BULK INSERT w3resource_sql.dbo.item_mast
            FROM '/tmp/csvdata/item_mast.csv'
            WITH (
                FORMAT = 'CSV',
                FIELDTERMINATOR = ',',
                ROWTERMINATOR = '\n',
                FIRSTROW = 2
            )
        END
END
