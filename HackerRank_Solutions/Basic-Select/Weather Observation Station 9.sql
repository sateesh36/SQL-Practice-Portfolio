/*
Problem: Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

Explanation:
WHERE clause will see if the name starts with vowels using LIKE. And NOT operator is used to opposite the result.
*/

SELECT DISTINCT CITY FROM STATION
WHERE CITY NOT LIKE '[a,e,i,o,u]%''