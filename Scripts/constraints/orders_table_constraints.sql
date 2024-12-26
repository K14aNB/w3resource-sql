/*
 Script for adding constraints to orders table
*/

--Add Foreign Key Constraint to salesman_id column in orders table
IF
    EXISTS (
        SELECT cc.COLUMN_NAME
        FROM w3resource_sql.INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS tc
        INNER JOIN w3resource_sql.INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS cc
            ON tc.CONSTRAINT_NAME = cc.CONSTRAINT_NAME
        WHERE tc.TABLE_SCHEMA = 'dbo'
            AND tc.TABLE_NAME = 'salesman'
            AND cc.COLUMN_NAME = 'salesman_id'
            AND tc.CONSTRAINT_TYPE = 'PRIMARY KEY'
    )
    AND EXISTS (
        SELECT TABLE_NAME
        FROM w3resource_sql.INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'dbo'
            AND TABLE_NAME = 'orders'
    )
    AND NOT EXISTS (
        SELECT cc.COLUMN_NAME
        FROM w3resource_sql.INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS tc
        INNER JOIN w3resource_sql.INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS cc
            ON tc.CONSTRAINT_NAME = cc.CONSTRAINT_NAME
        WHERE tc.TABLE_SCHEMA = 'dbo'
            AND tc.TABLE_NAME = 'orders'
            AND cc.COLUMN_NAME = 'salesman_id'
            AND tc.CONSTRAINT_TYPE = 'FOREIGN KEY'
    )
    BEGIN
        ALTER TABLE w3resource_sql.dbo.orders
        ADD FOREIGN KEY (salesman_id) REFERENCES w3resource_sql.dbo.salesman (
            salesman_id
        )
    END

--Add Foreign Key Constraint to customer_id column in orders table
IF
    EXISTS (
        SELECT cc.COLUMN_NAME
        FROM w3resource_sql.INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS tc
        INNER JOIN w3resource_sql.INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS cc
            ON tc.CONSTRAINT_NAME = cc.CONSTRAINT_NAME
        WHERE tc.TABLE_SCHEMA = 'dbo'
            AND tc.TABLE_NAME = 'customer'
            AND cc.COLUMN_NAME = 'customer_id'
            AND tc.CONSTRAINT_TYPE = 'PRIMARY KEY'
    )
    AND EXISTS (
        SELECT TABLE_NAME
        FROM w3resource_sql.INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'dbo'
            AND TABLE_NAME = 'orders'
    )
    AND NOT EXISTS (
        SELECT cc.COLUMN_NAME
        FROM w3resource_sql.INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS tc
        INNER JOIN w3resource_sql.INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS cc
            ON tc.CONSTRAINT_NAME = cc.CONSTRAINT_NAME
        WHERE tc.TABLE_SCHEMA = 'dbo'
            AND tc.TABLE_NAME = 'orders'
            AND cc.COLUMN_NAME = 'customer_id'
            AND tc.CONSTRAINT_NAME = 'FOREIGN KEY'
    )
    BEGIN
        ALTER TABLE w3resource_sql.dbo.orders
        ADD FOREIGN KEY (customer_id) REFERENCES w3resource_sql.dbo.customer (
            customer_id
        )
    END
