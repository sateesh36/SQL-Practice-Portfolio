/*
Problem: Query all columns for all American cities in the CITY table with populations larger than 100000.
Concepts Used:
- SELECT, WHERE condition

Explanation:
Retrieved all columns from the CITY table and filtered
records where population is greater than a specified value.
*/

SELECT *
FROM CITY
WHERE POPULATION > 100000 AND COUNTRYCODE = 'USA';