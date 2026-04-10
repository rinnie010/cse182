DROP SCHEMA Lab1 CASCADE;
CREATE SCHEMA Lab1;

CREATE TABLE Client (
    clientID    INT,
    clientName    VARCHAR(40),
    email    VARCHAR(40),
    accountCreationDate DATE,
    premiumMember  char(1),
    PRIMARY KEY (clientID)
    
);

CREATE TABLE DistributionCenter (
    centerCode   CHAR(3),
    city VARCHAR(40),
    country  VARCHAR(40),
    numLoadingDocks  INT,
    avgProcessingDelayMins   INT,
    PRIMARY KEY (centerCode)
);

CREATE TABLE FreightRoute (
    routeID     INT, 
    originCenter CHAR(3), 
    destCenter CHAR(3),
    scheduledDeparture TIMESTAMP, 
    scheduledArrival TIMESTAMP,
    actualDeparture TIMESTAMP, 
    actualArrival TIMESTAMP, 
    vehicleType  VARCHAR(40),
    PRIMARY KEY (routeID),
    FOREIGN KEY (originCenter) REFERENCES DistributionCenter(centerCode),
    FOREIGN KEY (destCenter)    REFERENCES  DistributionCenter(centerCode)
    
);

CREATE TABLE LogisticsStaff (
    staffID INT, 
    staffName VARCHAR(40), 
    staffRole VARCHAR(40), 
    yearsExperience INT,
    PRIMARY KEY (staffID)
);

CREATE TABLE ShippingOrder (
    orderID     INT, 
    clientID    INT, 
    routeID     INT, 
    orderDate DATE, 
    priorityClass CHAR(1), 
    shippingCost NUMERIC(9,2),
    paymentMethod VARCHAR(40),
    PRIMARY KEY (orderID),
    FOREIGN KEY (clientID) REFERENCES Client(ClientID),
    FOREIGN KEY(routeID) REFERENCES FreightRoute(routeID)
);

CREATE TABLE PackageDropOff (
    orderID     INT, 
    staffID INT, 
    dropoffTime TIMESTAMP, 
    packageCount    INT, 
    storageBinNumber VARCHAR(40),
    PRIMARY KEY (orderID,staffID),
    FOREIGN KEY(staffID) REFERENCES LogisticsStaff(staffID),
    FOREIGN KEY(orderID) REFERENCES ShippingOrder(orderID)
);

CREATE TABLE RouteStaffAssignment (
    routeID     INT, 
    staffID     INT, 
    compensation NUMERIC(9,2),
    PRIMARY KEY (routeID, staffID),
    FOREIGN KEY(routeID) REFERENCES FreightRoute(routeID),
    FOREIGN KEY(staffID) REFERENCES LogisticsStaff(staffID)
);

