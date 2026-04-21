SELECT c.ClientName AS theClientName, OriginCenter, ShippingCost
FROM Client c , ShippingOrder so ,  FreightRoute fr, DistributionCenter di
WHERE c.clientId = so.clientID AND so.routeID = fr.routeID 
      AND fr.originCenter = di.centerCode AND
      di.numLoadingDocks = 5 AND so.shippingCost > 100 AND c.clientName LIKE 'R%';