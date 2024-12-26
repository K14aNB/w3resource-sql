/*
 Script for creating item_mast table
 */

IF
    EXISTS (
        SELECT name FROM sys.databases
        WHERE name = 'w3resource_sql'
    )
    AND NOT EXISTS (
        SELECT TABLE_NAME FROM w3resource_sql.INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'item_mast'
    )
    BEGIN
        CREATE TABLE w3resource_sql.dbo.item_mast (
            pro_id TINYINT PRIMARY KEY,
            pro_name VARCHAR(50) NOT NULL,
            pro_price DECIMAL(7, 2) NOT NULL,
            pro_com TINYINT NOT NULL
        )

    END
