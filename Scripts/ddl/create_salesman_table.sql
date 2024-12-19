/*
 Script for creating customer table
 */

 IF EXISTS(SELECT name from sys.databases WHERE name = 'w3resource_sql') AND
    NOT EXISTS(SELECT name FROM w3resource_sql.sys.objects WHERE name = 'salesman' AND type = 'U')
 BEGIN
     CREATE TABLE w3resource_sql.dbo.salesman(salesman_id SMALLINT PRIMARY KEY,
                                              name VARCHAR(40) NOT NULL,
                                              city VARCHAR(30) NOT NULL,
                                              commission DECIMAL(3, 2) NOT NULL)

 END