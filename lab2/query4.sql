/*
Recall that a tuple in PackageDropoff identifies a package being 
dropped off with an associated shipping order. 
Write a SQL query which finds all shipping orders for which 
packages have been dropped off and for which all of the following
 are true:
• The priority class is expedited (priorityClass = 'X').
• The date of dropoffTime is January 12, 2026 or later.
• The origin center location has ‘en’ appearing anywhere in its 
 city, with that capitalization.
• The packageCount is greater than or equal to 2.
• The payment method used for the associated shipping order is NULL.
The attributes in your result should be the route ID and the 
dropoffTime time, which should appear as theRouteID and 
theDropoffTime.
No duplicates should appear in your result.

*/

SELECT DISTINCT s.routeID AS theRouteID, p.dropoffTime AS theDropoffTime
FROM  PackageDropOff p
JOIN ShippingOrder s
ON  p.orderID = s.orderID
JOIN FreightRoute f
ON f.routeID = s.routeID
JOIN DistributionCenter d
ON d.centerCode = f.originCenter
WHERE s.priorityClass = 'X' 
      AND p.packageCount >=2
      AND s.paymentMethod IS NULL 
      AND d.city LIKE '%en%'
      AND DATE(p.dropoffTime) >=  DATE '2026-01-12';
