/*
 Script to create nobel_win table and insert data
 */

 IF EXISTS(SELECT name FROM sys.databases WHERE name = 'w3resource_sql') AND
    NOT EXISTS(SELECT name FROM w3resource_sql.sys.objects WHERE name = 'nobel_win' AND type = 'U')
 BEGIN
     CREATE TABLE w3resource_sql.dbo.nobel_win(year SMALLINT NOT NULL,
                                              subject VARCHAR(20) NOT NULL,
                                              winner VARCHAR(50) NOT NULL,
                                              country VARCHAR(30) NOT NULL,
                                              category VARCHAR(40) NOT NULL)

 END
