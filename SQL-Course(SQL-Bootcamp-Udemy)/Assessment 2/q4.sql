SELECT facid,name,membercost,monthlymaintenance FROM cd.facilities
WHERE membercost !=0 
AND membercost < 0.02 * monthlymaintenance;
