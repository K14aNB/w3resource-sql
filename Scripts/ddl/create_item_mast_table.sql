/*
 Script to create item_mast table and insert data
 */

 IF EXISTS(SELECT name FROM sys.databases WHERE name = 'w3resource_sql') AND
    NOT EXISTS(SELECT name FROM w3resource_sql.sys.objects WHERE name = 'item_mast')
 BEGIN
     CREATE TABLE w3resource_sql.dbo.item_mast(pro_id TINYINT PRIMARY KEY,
                                               pro_name VARCHAR(50) NOT NULL,
                                               pro_price DECIMAL(7, 2) NOT NULL,
                                               pro_com TINYINT NOT NULL)

 END