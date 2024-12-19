/*
 Script for creating customer table and inserting data
 */

 IF EXISTS(SELECT name FROM sys.databases WHERE name = 'w3resource_sql') AND
    EXISTS(SELECT name FROM w3resource_sql.sys.objects WHERE name = 'salesman' AND type = 'U') AND
     NOT EXISTS(SELECT name FROM w3resource_sql.sys.objects WHERE name = 'customer' AND type = 'U')
    BEGIN
        CREATE TABLE w3resource_sql.dbo.customer(customer_id INT PRIMARY KEY,
                                              cust_name VARCHAR(40) NOT NULL,
                                               city VARCHAR(30) NOT NULL,
                                               grade SMALLINT,
                                                salesman_id SMALLINT FOREIGN KEY REFERENCES w3resource_sql.dbo.salesman(salesman_id))
    END
