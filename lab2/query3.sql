/*
Recall that an assignment of logistics staff to deliver a
package is recorded in RouteStaffAssignment. 
Write a SQL query which finds all logistics staff, 
excluding 'Sophia Kim', who were assigned to the exact
same vehicle type on at least 2 different freight routes. 
The attribute in your result should be the logistics
staff ID, which should appear as theStaffID.
No duplicates should appear in your result.
(Mapping note: exclude rows where LogisticsStaff.staffName = 
'Sophia Kim'.) 
*/

SELECT DISTINCT l.staffID AS theStaffID
FROM LogisticsStaff l
JOIN routeStaffAssignment r
ON r.staffID = l.staffID
JOIN FreightRoute f
ON r.routeID = f.routeID
WHERE  l.staffName <> 'Sophia Kim'
GROUP BY l.staffID, f.vehicleType
HAVING COUNT(DISTINCT r.routeID) >= 2;