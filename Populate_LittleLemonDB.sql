SET FOREIGN_KEY_CHECKS = 0;

LOAD DATA LOCAL INFILE '../Customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(CustomerID, CustomerName, Country, CountryCode, City, PostalCode);

LOAD DATA LOCAL INFILE '../Menus.csv'
INTO TABLE menus
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(CourseName, CuisineName, StarterName, DesertName, Drink, Sides);

LOAD DATA LOCAL INFILE '../Bookings.csv'
INTO TABLE bookings
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(CustomerID, @BookingDate, @TableNumber)
SET BookingDate = STR_TO_DATE(@BookingDate, '%d/%m/%Y'), TableNumber = CAST(@TableNumber AS UNSIGNED);

LOAD DATA LOCAL INFILE '../Staff.csv'
INTO TABLE Staff
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(StaffName, Role, @Salary)
SET Salary = CAST(@Salary AS DECIMAL(6,2));

LOAD DATA LOCAL INFILE '../DeliveryStatus.csv'
INTO TABLE DeliveryStatus
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@OrderDate, @DeliveryDate)
SET OrderDate = STR_TO_DATE(@OrderDate, '%d/%m/%Y'),
	DeliveryDate = STR_TO_DATE(@DeliveryDate, '%d/%m/%Y');

LOAD DATA LOCAL INFILE 'C:/Users/Sergio/Documents/Coursera/Professional_Certificate/Meta Database Engineer/8-Database_Engineer_Capstone/Orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(OrderRef, @MenuID, @BookingID, @StaffID, @DeliveryStatusID, @OrderDate, @TableNumber, @Quantity, @Cost, @Discount, @DeliveryCost, @Sales)
SET MenuID = CAST(@MenuID AS UNSIGNED), BookingID = CAST(@BookingID AS UNSIGNED), StaffID = CAST(@StaffID AS UNSIGNED), 
	DeliveryID = CAST(@DeliveryStatusID AS UNSIGNED), OrderDate = STR_TO_DATE(@OrderDate, '%d/%m/%Y'), TableNo = CAST(@TableNumber AS UNSIGNED),
    Quantity = CAST(@Quantity AS UNSIGNED), Cost = CAST(@Cost AS DECIMAL(6,2)), Discount = CAST(@Discount AS DECIMAL(6,2)),
    DeliveryCost = CAST(@DeliveryCost AS DECIMAL(6,2)), Sales = CAST(@Sales AS DECIMAL(6,2));
