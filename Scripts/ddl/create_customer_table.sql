/*
 Script for creating customer table
 */

IF
    EXISTS (
        SELECT name FROM sys.databases
        WHERE name = 'w3resource_sql'
    )
    AND NOT EXISTS (
        SELECT TABLE_NAME FROM w3resource_sql.INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'customer'
    )
    BEGIN
        CREATE TABLE w3resource_sql.dbo.customer (
            customer_id INT PRIMARY KEY,
            cust_name VARCHAR(40) NOT NULL,
            city VARCHAR(30) NOT NULL,
            grade SMALLINT,
            salesman_id SMALLINT NOT NULL
        )
    END
