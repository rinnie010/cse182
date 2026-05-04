/*
Write a SQL query which finds the orders for which the name of the
 client starts with ‘R’ (with that
capitalization), the origin center has exactly 5 loading docks, 
and the shipping cost is greater than 100
dollars. The attributes in your result should be the name of the 
client, the center it was shipping from, and
the shipping cost, which should appear in your results 
as theClientName, theOriginCenter, and theShippingCost.
No duplicates should appear in your result. 
*/

SELECT DISTINCT c.clientName AS theClientName,
d.centerCode AS theOriginCenter,
s.shippingCost AS theShippingCost
FROM Client c
JOIN ShippingOrder S
ON c.clientId = s.clientID
JOIN FreightRoute f
ON s.routeID = f.routeID
JOIN DistributionCenter d
ON d.centerCode = f.originCenter
WHERE s.shippingCost > 100 AND c.clientName LIKE 'R%' AND  d.numLoadingDocks = 5;

