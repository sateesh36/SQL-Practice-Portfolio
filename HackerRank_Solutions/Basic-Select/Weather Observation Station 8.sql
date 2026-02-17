/*
Problem: Query the list of CITY names from STATION which have vowels as both their first and last characters. Your result cannot contain duplicates.

Explanation:
In where clause, 1st subquery will see if name starts with vowels 'a%'. Second subquery will see if the name ends with vowels '%a' (% means everything). AND is used to tell SQL that not only its should satisfy the first subquery it also should satisfy second query. and distinct will only bring unique name
*/
SELECT DISTINCT CITY
FROM STATION
WHERE (CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%') AND  (CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u')
