/*
Problem: Students scored Higher Than 75 Marks

Explanation:
Selected student names where marks exceed a threshold
and sorted results as required.
*/

SELECT Name FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name,3),ID ASC