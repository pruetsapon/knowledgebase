/*In this post, we are gonna see how to concatenate multiple rows into one single text string in MS SQL Server.

In SQL Server 2005, you could use the FOR XML PATH command:*/
SELECT item_id,
       item_name,
       (STUFF((SELECT CAST(', ' + state_code AS VARCHAR(MAX)) 
         FROM stores
         WHERE (item_id = products.item_id) 
         FOR XML PATH ('')), 1, 2, '')) AS state_code
FROM products;

/*In SQL Server 2017+ and SQL Azure, you can concatenate using STRING_AGG:*/
SELECT
    [item_id],
    STRING_AGG([state_code], ', ') AS state_code
FROM
    stores
GROUP BY
    item_id;