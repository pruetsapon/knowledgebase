--How to split a long SQL Server string into lines?
--For instance, this Transact-SQL query splits the string containing the list of cities delimited by semicolons.

-- Variables declaration
DECLARE @String nvarchar(max),
@Delimiter char(1),
@XMLString xml;
-- Initialisation of the string and the delimiter, here it's the semicolon character 
SELECT @String = 'New York;Los Angeles;Chicago;Houston;Phoenix;Philadelphia;San Antonio;San Diego;Dallas;San Jose',
@Delimiter = ';'
-- XML String construction using T-SQL CONVERT() function
SET @XMLString = 
CONVERT(xml,'<root><city>' +
REPLACE(@String,@Delimiter,'</city><city>') +
'</city></root>')
SELECT @XMLString
-- Select of the result by parsing the @XMLString variable with the .value() .nodes() XML functions
SELECT row_number() OVER (ORDER BY (SELECT 100)) AS NUM, Result.value('.','varchar(20)') AS CITY
FROM @XMLString.nodes('/root/city') AS T(Result)

SELECT @XMLString.value('count(/root/*)', 'int')