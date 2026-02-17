/*
Problem: Query all attributes of every Japanese city in the CITY table.
Concept:
Filtering using WHERE clause.

Explanation:
Selected city attributes where the country code matches Japan.
*/

SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';