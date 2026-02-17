/*
Problem: Query the NAME field for all American cities in the CITY table with populations larger than 120000.

Concepts Used:
- SELECT, WHERE condition

Explanation:
Selected specific columns from the CITY table and applied
filtering conditions based on population and country code.
*/
SELECT NAME
FROM CITY
WHERE POPULATION > 120000 AND COUNTRYCODE = 'USA';