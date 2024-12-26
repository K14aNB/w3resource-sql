/*
 Script for creating orders table
 */

IF
    EXISTS (
        SELECT name FROM sys.databases
        WHERE name = 'w3resource_sql'
    )
    AND NOT EXISTS (
        SELECT TABLE_NAME FROM w3resource_sql.INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'orders'
    )
    BEGIN
        CREATE TABLE w3resource_sql.dbo.orders (
            ord_no INT PRIMARY KEY,
            purch_amt DECIMAL(7, 2) NOT NULL,
            ord_date DATE NOT NULL,
            customer_id INT NOT NULL,
            salesman_id SMALLINT NOT NULL
        )

    END
