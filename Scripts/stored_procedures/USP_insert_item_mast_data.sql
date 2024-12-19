/*
 Script for creating stored procedure to insert data into item_mast table
 */

 CREATE OR ALTER PROCEDURE USP_insert_item_mast_data
 AS
 BEGIN
     IF EXISTS(SELECT name FROM w3resource_sql.sys.objects WHERE name = 'item_mast' AND type = 'U') AND
     NOT EXISTS(SELECT 1 FROM w3resource_sql.dbo.item_mast)
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