/*A shipping order is paid with a Visa card if the payment method 
(paymentMethod) is 'Visa'.
Write a SQL query which finds all the clients who have made an 
order paid with a Visa, and who have never (in any order and 
using any payment method) made an order that exceeds 10,000 dollars
in an order cost. The attributes in your result 
should be clientID and account creation date, appearing as
theClientID and theAccountCreationDate.
Tuples in your result should be in reverse order by
theAccountCreationDate;
if two tuples have the same creation date, they should appear in 
increasing order of theClientID.
No duplicates should appear in your result.
*/

SELECT DISTINCT c.clientID AS theClientID,
 c.accountCreationDate AS theAccountCreationDate 
FROM Client c
WHERE EXISTS 
(SELECT s.clientID
 FROM ShippingOrder s
 WHERE s.paymentMethod = 'Visa' AND s.clientID = c.clientID )
 AND NOT EXISTS
 (SELECT s.clientID FROM ShippingOrder s WHERE s.shippingCost > 10000 AND s.clientID = c.clientID )
ORDER BY c.accountCreationDate DESC, c.clientID ASC;

