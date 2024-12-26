/*
Average Price per Company
-------------------------

Table: item_mast

PRO_ID PRO_NAME                       PRO_PRICE    PRO_COM
------- ------------------------- -------------- ----------
    101 Mother Board                    3200.00         15
    102 Key Board                        450.00         16
    103 ZIP drive                        250.00         14
    104 Speaker                          550.00         16
    105 Monitor                         5000.00         11
    106 DVD drive                        900.00         12
    107 CD drive                         800.00         12
    108 Printer                         2600.00         13
    109 Refill cartridge                 350.00         13
    110 Mouse                            250.00         12
*/

EXEC w3resource_sql.dbo.usp_insert_item_mast_data

--Write SQL query to calculate the average price of the items for each company.
--Return average price and company code.
SELECT
    pro_com AS company_code,
    AVG(pro_price) AS average_price
FROM w3resource_sql.dbo.item_mast
GROUP BY pro_com
ORDER BY pro_com ASC
