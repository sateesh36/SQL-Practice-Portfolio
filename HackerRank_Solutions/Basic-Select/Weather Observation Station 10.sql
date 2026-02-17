/*
Problem: Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

Explanation:
LIKE operator will search for name ending with aeiou [] means set, and % at first determines anything before aeiou and distinct will only bring unique city name.                          
*/

SELECT DISTINCT CITY FROM STATION
WHERE CITY NOT LIKE '%[aeiou]'