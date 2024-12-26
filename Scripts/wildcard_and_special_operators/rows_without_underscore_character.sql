/*
 Rows Without Underscore Character
 ---------------------------------

 Table: test

 col1
--------------------------
A001/DJ-402\44_/100/2015
A001_\DJ-402\44_/100/2015
A001_DJ-402-2014-2015
A002_DJ-401-2014-2015
A001/DJ_401
A001/DJ_402\44
A001/DJ_402\44\2015
A001/DJ-402%45\2015/200
A001/DJ_402\45\2015%100
A001/DJ_402%45\2015/300
A001/DJ-402\44
*/

EXEC w3resource_sql.dbo.USP_insert_test_data

--Write SQL query to identify the rows where col1 does not contain
--the escape character underscore (_). Return col1.
SELECT *
FROM w3resource_sql.dbo.test
WHERE col1 NOT LIKE '\_%' ESCAPE '\'
    AND col1 NOT LIKE '%\_' ESCAPE '\'
    AND col1 NOT LIKE '%\_%' ESCAPE '\'
