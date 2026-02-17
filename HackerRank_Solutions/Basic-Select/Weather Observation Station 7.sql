/*
Problem: Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

Explanation:
In where query Like operator is being used to select city whose name ends with aeiou.
(%a) means only bring me name ending with a and before that it can be anything(%). 'OR' is used to tell SQL that if 1st condition don't match see another, so it can retrieved all the results.
*/

SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u';
