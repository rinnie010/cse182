-- Sample script file to populate the Global Freight & Logistics Schema

-- Client(clientID, clientName, email, accountCreationDate, premiumMember)
COPY Client FROM stdin USING DELIMITERS '|';
1|Acme Corp|contact@acme.com|2020-05-12|Y
2|Global Goods|info@globalgoods.com|2021-08-23|N
3|Tech Parts Inc|sales@techparts.com|2019-11-05|Y
4|Fast Retail|hello@fastretail.com|2022-01-15|N
5|Fresh Foods|logistics@freshfoods.com|2020-09-30|Y
6|Auto Spares|parts@autospares.com|2023-03-14|N
7|MediSupplies|shipping@medisupplies.com|2018-07-22|Y
8|Home Essentials|orders@homeessentials.com|2021-12-01|N
9|Rapid Freight|contact@rapid.com|2023-01-10|Y
\.

-- DistributionCenter(centerCode, city, country, numLoadingDocks, avgProcessingDelayMins)
COPY DistributionCenter FROM stdin USING DELIMITERS '|';
NYC|New York|USA|45|120
LAX|Los Angeles|USA|50|145
CHI|Chicago|USA|35|90
HOU|Houston|USA|40|110
ATL|Atlanta|USA|60|180
DFW|Dallas|USA|55|130
MIA|Miami|USA|30|100
SEA|Seattle|USA|25|85
DEN|Denver|USA|5|100
RDU|Raleigh|USA|5|90
\.

-- FreightRoute(routeID, originCenter, destCenter, scheduledDeparture, scheduledArrival, actualDeparture, actualArrival, vehicleType)
COPY FreightRoute FROM stdin USING DELIMITERS '|';
101|NYC|LAX|2024-10-01 08:00:00|2024-10-04 11:00:00|2024-10-01 08:30:00|2024-10-04 11:15:00|Heavy Truck
102|LAX|CHI|2024-10-02 09:00:00|2024-10-05 13:30:00|2024-10-02 09:15:00|2024-10-05 13:40:00|Freight Train
103|CHI|HOU|2024-10-03 07:30:00|2024-10-05 10:15:00|2024-10-03 07:30:00|2024-10-05 10:20:00|Heavy Truck
104|HOU|ATL|2024-10-04 14:00:00|2024-10-06 15:30:00|2024-10-04 14:10:00|2024-10-06 15:45:00|Cargo Plane
105|ATL|DFW|2024-10-05 12:00:00|2024-10-06 13:45:00|2024-10-05 12:05:00|2024-10-06 13:50:00|Heavy Truck
106|DFW|MIA|2024-10-06 16:00:00|2024-10-08 17:30:00|2024-10-06 16:20:00|2024-10-08 17:40:00|Freight Train
107|MIA|SEA|2024-10-07 10:00:00|2024-10-10 18:00:00|2024-10-07 10:05:00|2024-10-10 18:20:00|Cargo Plane
108|SEA|NYC|2024-10-08 07:00:00|2024-10-12 08:00:00|2024-10-08 07:10:00|2024-10-12 08:15:00|Freight Train
109|DEN|LAX|2024-10-01 07:00:00|2024-10-03 10:00:00|2024-10-01 07:15:00|2024-10-03 10:30:00|Heavy Truck
\.

-- LogisticsStaff(staffID, staffName, staffRole, yearsExperience)
COPY LogisticsStaff FROM stdin USING DELIMITERS '|';
1|Marcus Vance|Lead Driver|15
2|Sarah Jenkins|Co-Driver|10
3|Omar Tariq|Loadmaster|7
4|Diana Prince|Pilot|20
5|Lucas Wright|Warehouse Tech|5
6|Elena Rostova|Dispatcher|12
7|Kenji Moto|Freight Engineer|8
8|Alicia Keys|Pilot|18
9|John Tracker|Delivery Driver|4
10|Maria Gonzales|Delivery Driver|6
11|David Kim|Delivery Driver|3
12|Lisa Ray|Delivery Driver|8
13|Sophia Kim|Lead Driver|10
\.

-- ShippingOrder(orderID, clientID, routeID, orderDate, priorityClass, shippingCost, paymentMethod)
-- Note: priorityClass values represented as 'S' (Standard), 'E' (Express), 'X' (eXpedited)
-- \N is used by PostgreSQL to denote a NULL value during COPY
COPY ShippingOrder FROM stdin USING DELIMITERS '|';
201|1|101|2024-09-15|S|2500.00|WireTransfer
202|2|102|2024-09-18|E|7500.00|CorporateCard
203|3|103|2024-09-20|S|1800.00|ACH
204|4|104|2024-09-22|X|12000.00|WireTransfer
205|5|105|2024-09-25|S|2200.00|Visa
206|6|106|2024-09-26|E|6800.00|ACH
207|7|107|2024-09-28|X|15000.00|WireTransfer
208|8|108|2024-09-30|S|4500.00|CorporateCard
209|9|109|2024-10-01|S|500.00|WireTransfer
210|8|101|2024-10-02|S|3000.00|Visa
211|1|109|2026-01-15|X|8000.00|\N
\.

-- PackageDropoff(orderID, staffID, dropoffTime, packageCount, storageBinNumber)
COPY PackageDropoff FROM stdin USING DELIMITERS '|';
201|1|2024-09-29 06:30:00|6|B-12A
201|9|2024-09-29 07:00:00|6|B-12B
202|2|2024-10-01 07:45:00|45|C-03C
203|10|2024-10-02 05:50:00|8|A-18F
204|11|2024-10-03 12:30:00|2|H-01A
205|12|2024-10-04 10:20:00|15|B-14B
205|1|2024-10-04 10:45:00|10|B-14C
206|2|2024-10-05 14:50:00|60|D-06D
207|9|2024-10-06 08:15:00|5|C-20C
208|10|2024-10-07 05:30:00|75|F-07F
208|11|2024-10-07 05:50:00|75|F-07G
211|1|2026-01-15 09:00:00|5|X-99Z
\.

-- RouteStaffAssignment(routeID, staffID, compensation)
COPY RouteStaffAssignment FROM stdin USING DELIMITERS '|';
101|1|1500.00
101|2|1000.00
101|3|500.00
101|13|1200.00
102|7|1600.00
102|6|1100.00
102|5|550.00
103|1|1500.00
103|3|600.00
103|13|1200.00
104|4|2550.00
104|6|1000.00
105|1|1600.00
105|5|550.00
106|7|1500.00
106|6|1100.00
107|8|2550.00
107|3|500.00
108|7|1000.00
108|5|600.00
109|13|1500.00
109|1|1000.00
\.
