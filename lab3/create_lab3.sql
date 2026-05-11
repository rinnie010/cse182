-- CSE 182 Spring 2026 Lab3 creation file
-- Run this script BEFORE running load_lab3.sql.

-- Drop and recreate the Lab3 schema, then set it as the current search_path.
-- These commands make the script idempotent (safe to re-run).
DROP SCHEMA IF EXISTS Lab3 CASCADE;
CREATE SCHEMA Lab3;
SET search_path TO Lab3;

-- The first 7 tables are similar to the tables in our Lab1 create_lab1.sql
-- solution.  The NULL and UNIQUE constraints from Lab2 are NOT included.
-- Three Foreign Key constraints (on ShippingOrder and PackageDropoff) are
-- intentionally omitted; you will add them in foreign.sql (Section 2.4).

CREATE TABLE Client(
  clientID INTEGER PRIMARY KEY,
  clientName VARCHAR(40),
  email VARCHAR(40),
  accountCreationDate DATE,
  premiumMember CHAR(1)
);

CREATE TABLE DistributionCenter(
  centerCode CHAR(3) PRIMARY KEY,
  city VARCHAR(40),
  country VARCHAR(40),
  numLoadingDocks INTEGER,
  avgProcessingDelayMins INTEGER
);

CREATE TABLE FreightRoute(
  routeID INTEGER PRIMARY KEY,
  originCenter CHAR(3) REFERENCES DistributionCenter(centerCode),
  destCenter CHAR(3) REFERENCES DistributionCenter(centerCode),
  scheduledDeparture TIMESTAMP,
  scheduledArrival TIMESTAMP,
  actualDeparture TIMESTAMP,
  actualArrival TIMESTAMP,
  vehicleType VARCHAR(40)
);

CREATE TABLE LogisticsStaff(
  staffID INTEGER PRIMARY KEY,
  staffName VARCHAR(40),
  staffRole VARCHAR(40),
  yearsExperience INTEGER
);

-- Note: Foreign key constraints on ShippingOrder are intentionally omitted.
-- Students will add them in Section 2.4 (foreign.sql).
CREATE TABLE ShippingOrder(
  orderID INTEGER PRIMARY KEY,
  clientID INTEGER,
  routeID INTEGER,
  orderDate DATE,
  priorityClass CHAR(1),
  shippingCost NUMERIC(9, 2),
  paymentMethod VARCHAR(40)
);

-- Note: The Foreign Key on (orderID -> ShippingOrder) is intentionally omitted.
-- Students will add it in Section 2.4 (foreign.sql).
-- The Foreign Key on (staffID -> LogisticsStaff) is kept here.
CREATE TABLE PackageDropoff(
  orderID INTEGER,
  staffID INTEGER REFERENCES LogisticsStaff(staffID),
  dropoffTime TIMESTAMP,
  packageCount INTEGER,
  storageBinNumber VARCHAR(40),
  PRIMARY KEY (orderID, staffID)
);

CREATE TABLE RouteStaffAssignment(
  routeID INTEGER REFERENCES FreightRoute(routeID),
  staffID INTEGER REFERENCES LogisticsStaff(staffID),
  compensation NUMERIC(9, 2),
  PRIMARY KEY (routeID, staffID)
);

-- New table for Lab3: UpdateShippingOrder
-- This table contains updates to be merged into the ShippingOrder table
-- by your combine.sql (Section 2.3).
CREATE TABLE UpdateShippingOrder(
  orderID INTEGER PRIMARY KEY,
  priorityClass CHAR(1),
  shippingCost NUMERIC(9, 2)
);
