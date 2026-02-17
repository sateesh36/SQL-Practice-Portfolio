/*
Problem: Japanese Cities' Names

Concept:
SELECT specific column with filtering.

Explanation:
Retrieved city names where the country code corresponds to Japan.
*/

SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';