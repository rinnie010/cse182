/*
Several route staff assignments in the RouteStaffAssignment table 
might be linked to routes that share the same actual departure date.
 We want to find all the assignments which are associated with the 
 earliest actual departure date. 
 An assignment has the earliest date if there are no assignments 
 whose associated route has an earlier actual departure date.
Write a SQL query which finds the routeID and staffID for all assignments 
whose associated route has the earliest actual departure date. 
The attributes in your result should appear as theRouteID and 
theStaffID. No duplicates should appear in your result.
Note: As in Query 4, compare only the date portion of `actualDeparture`, not the full timestamp. 
Use `DATE(actualDeparture)
*/

SELECT DISTINCT r.routeID AS theRouteID, r.staffID AS theStaffID
FROM RouteStaffAssignment r
JOIN FreightRoute f
ON f.routeID = r.routeID
WHERE DATE(f.actualDeparture) =
(SELECT MIN(DATE(f2.actualDeparture))
 FROM FreightRoute f2
 JOIN RouteStaffAssignment r2
 ON r2.routeID = f2.routeID);
