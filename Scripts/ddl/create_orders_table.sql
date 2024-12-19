/*
 Script to create orders table and insert data
 */

 IF EXISTS(SELECT name FROM sys.databases WHERE name = 'w3resource_sql') AND
    NOT EXISTS(SELECT name FROM w3resource_sql.sys.objects WHERE name = 'orders' AND type = 'U')
 BEGIN
     CREATE TABLE w3resource_sql.dbo.orders(ord_no INT PRIMARY KEY,
                                            purch_amt DECIMAL(7, 2) NOT NULL,
                                            ord_date DATE NOT NULL,
                                            customer_id INT FOREIGN KEY REFERENCES w3resource_sql.dbo.customer(customer_id),
                                            salesman_id SMALLINT FOREIGN KEY REFERENCES w3resource_sql.dbo.salesman(salesman_id))

 END