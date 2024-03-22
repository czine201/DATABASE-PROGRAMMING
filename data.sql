CREATE TABLE Vendor
(VendorID VARCHAR(50) PRIMARY KEY,
VendorName VARCHAR(50) not null,
VendorPhone VARCHAR(50),
VendorCity VARCHAR(30) not null,
VendorState VARCHAR(50) not null,
VendorZip VARCHAR(50), 
VendorStreet VARCHAR(50) not null 
);
INSERT INTO Vendor(VendorID, VendorName, VendorPhone, VendorStreet, VendorCity, VendorState, VendorZip) VALUES 
('V1', 'Izumisano Fishermans Union Open Market', '2075551234', '123 Main Street', 'Wells', 'Maine', '04054' ),
('V2', 'Farm to Table Meat Supply', '512556789', '456 Maple Avenue', 'Dallas', 'Texas', '75201' ),
('V3', 'Veg-Fresh Farms', '4155559876', '1400 W. Rincon Street', 'Corona', 'California', '92880'),
('V4', 'Yamachan Ramen', '4084790558', '234 Oak Drive', 'Rogers Park', 'Illinois', '60626'); 

CREATE TABLE Product
(ProductNum VARCHAR(50) PRIMARY KEY,
ProductPrice DECIMAL(50) not null,
ProductName VARCHAR(50) not null,
vendorID VARCHAR(50) not null,
FOREIGN KEY (vendorID) 
REFERENCES Vendor (VendorID)
);
INSERT INTO Product(ProductNum, ProductName, ProductPrice, vendorID) VALUES
('P1', 'Salmon Tartare', 18, 'V1'), 
('P2', 'Tuna Flight', 19, 'V1'),
('P3', 'Sake Steamed Sea Bass', 24, 'V1'),
('P4', 'Calamari Fry', 19, 'V1'),
('P5', 'Bulgogi Bowl', 25, 'V2'),
('P6', 'Chicken Teriyaki Bowl', 19, 'V2'),
('P7', 'Butter Grilled Mushroom', 10, 'V3'),
('P8', 'House Salad', 8, 'V3'),
('P9', 'Yo yo ramen', 18, 'V4'),
('P10', 'Spicy miso Udon', 19, 'V4');

CREATE TABLE Customer
(CustomerID VARCHAR(50) PRIMARY KEY,
 CustEmail VARCHAR(50),
 CustFName VARCHAR(50),
 CustLName VARCHAR(50),
 CustCity VARCHAR(50),
 CustState VARCHAR(50),
 CustZip VARCHAR(50),
 CustStreet VARCHAR(50),
 CustPhone VARCHAR(50)
);
INSERT INTO Customer(CustomerID, CustEmail, CustFName, CustLName, CustCity, CustState, CustZip, CustStreet, CustPhone) VALUES
('C1', 'steveSmith@gmail.com', 'Steve', 'Smith', 'Chicago', 'IL', '60610', 'Wacker', '(773) 525-6218'),
('C2', 'JohnDoe@yahoo.com', 'John', 'Doe', 'Chicago', 'IL', '60603', 'Oakmound', '(773) 480-9964'),
('C3', 'punkis@outlook.com', 'Christine', 'Punkis', 'Chicago', 'IL', '60610', 'Wacker', '(773) 970-6218'),
('C4', 'jbuchana@me.com', 'James', 'Buchana', 'Chicago', 'IL', '60626', 'Sheridan', '(773) 550-1228'),
('C5', 'dpitts@icloud.com', 'Drake', 'Pitts', 'Chicago', 'IL', '60655', 'Mount Greenwood', '(773) 245-1778'),
('C6', 'jshirley@mac.com', 'Jake', 'Shirley', 'Naperville', 'IL', '60440', 'Wacker', '(773) 525-6218'),
('C7', 'mfburgo@yahoo.com', 'Mike', 'Burgo', 'Chicago', 'IL', '60610', 'Broadway', '(312) 203-1110'),
('C8', 'crandall@gmail.com', 'Chris', 'Crandall', 'Chicago', 'IL', '60610', 'Argyle', '(312) 500-1256');

CREATE TABLE Employee
(EmpID VARCHAR(10) PRIMARY KEY,
 EmpFName VARCHAR(30),
 EmpLName VARCHAR(30),
 EmpRole VARCHAR(30),
 EmpSalary INTEGER,
 EmpCity VARCHAR (30),
 EmpStreet VARCHAR (20),
 EmpState VARCHAR (10),
 EmpZip VARCHAR (10),
 EmpPhone VARCHAR(20)
);
INSERT INTO Employee(EmpID, EmpFName, EmpLName,  EmpRole, EmpSalary, EmpCity, EmpStreet, EmpState, EmpZip, EmpPhone)
VALUES 
('E1', 'Christine', 'Parkwood',  'Dishwasher', 30000, 'Chicago', 'LakeShore', 'IL', '60636', '(708) 974-3070'),
('E2', 'Chris', 'Johnson', 'waiter', 40000, 'Chicago', 'Logan', 'IL', '60665', '(708) 123-3470'),
('E3', 'Lois', 'Lane', 'waitress', 41000, 'Chicago', 'Michigan', 'IL', '60611', '(708) 908-3566'),
('E4', 'Lola', 'James', 'Chief', 60000, 'Chicago', 'LakeShore', 'IL', '60637', '(708) 524-3388'),
('E5', 'John', 'Doe', 'Packer', 25000, 'Chicago', 'State', 'IL', '60665', '(630) 690-3644'), 
('E6', 'Jeremy', 'Lee', 'Cooker', 57000, 'Chicago', 'Logan', 'IL', '60647', '(773) 288-8614 '),
('E7', 'Kim', 'Blackwell', 'Dishwasher', 52000, 'Chicago', 'Milwaukee', 'IL', '60622', '(312) 922-8910'),
('E8', 'Kylan', 'Gentry', 'Server', 45000, 'Chicago', 'Clark', 'IL', '60657', '(312) 793-1010'),
('E9', 'Franklin', 'Sierra', 'Chief', 58000, 'Chicago', 'Randolph', 'IL', '60607', '(773) 585-6100'),
('E10', 'Bowen', 'Higgins', 'Chief', 56000, 'Chicago', 'Wells', 'IL', '60614', '(312) 447-0201'),
('E11', 'Amelie', 'Griffith', 'Delivery driver', 54000, 'Chicago', 'Midway', 'IL', '60637', '(708) 754-5880'),
('E12', 'Saige', 'Fuentes',  'Delivery driver', 53000, 'Chicago', 'Wacker', 'IL', '60659', '(815) 777-2577');


CREATE TABLE EmployeeShift
(ShiftNum VARCHAR(100),
 EmpID VARCHAR(100), 
 ShiftDate DATE,
 ScheduledLength VARCHAR(100) not null,
 ClockIn TIME,
 ClockOut TIME,
 
 PRIMARY KEY(ShiftNum, EmpID),
 FOREIGN KEY (EmpID) 
 REFERENCES Employee(EmpID)
);
INSERT INTO EmployeeShift (ShiftNum, EmpID, ScheduledLength, ShiftDate, ClockIn,  ClockOut) VALUES 
('#1259640', 'E1', '8hrs', '2024-01-23', '16:00:00', '23:00:00'),
('#2479700', 'E2', '8hrs', '2024-01-23', '16:00:00', '23:00:00'),
('#1890456', 'E3', '8hrs', '2024-01-23', '16:00:00', '23:00:00'),
('#2456790', 'E4', '8hrs', '2024-01-23', '16:00:00', '23:00:00'),
('#1457890', 'E5', '7hrs', '2024-05-23', '16:00:00', '19:00:00'),
('#5670407', 'E6', '8hrs', '2024-01-23', '16:00:00', '23:00:00'),
('#2468700', 'E7', '8hrs', '2024-01-23', '16:00:00', '23:00:00'),
('#3549067', 'E8', '8hrs', '2024-01-23', '16:00:00', '23:00:00'),
('#3927540', 'E9', '8hrs', '2024-01-23', '16:00:00', '23:00:00'),
('#1475790', 'E10', '7hrs', '2024-05-23', '16:00:00', '19:00:00'),
('#3982739', 'E11', '8hrs', '2024-05-30', '16:00:00', '23:00:00'),
('#2097500', 'E12', '5hrs', '2024-05-30', '16:00:00', '20:00:00');


CREATE TABLE Orders
(OrderNum VARCHAR(100) PRIMARY KEY,
 EmpID VARCHAR(100) not null, 
 CustomerID VARCHAR(100) not null, 
 OrderType VARCHAR(100) not null,
 finalPrice DECIMAL(100) not null, 
 Date DATE,
 
 FOREIGN KEY (EmpID) 
 REFERENCES Employee(EmpID), 
 FOREIGN KEY (CustomerID) 
 REFERENCES Customer(CustomerID)
);
INSERT INTO Orders(OrderNum, EmpID, CustomerID, OrderType, finalPrice, Date) VALUES
('#1', 'E5', 'C1', 'carryout', 50, '2024-01-04'),
('#2', 'E11', 'C2', 'delivery', 47 , '2023-03-09'),
('#3', 'E2', 'C3', 'dine-in', 38, '2024-01-04'),
('#4', 'E12', 'C4', 'delivery', 19 , '2023-10-19'),
('#5', 'E5', 'C5', 'carryout', 75, '2024-02-02'),
('#6', 'E2', 'C6', 'dine-in', 2, '2024-03-15'),
('#7', 'E12', 'C4', 'delivery', 18, '2024-02-20'),
('#8', 'E12', 'C1', 'delivery', 8, '2024-01-28'),
('#9', 'E11', 'C7', 'delivery', 100, '2024-02-02'),
('#10', 'E11', 'C3', 'delivery', 74, '2024-01-17'),
('#11', 'E3', 'C8', 'dine-in', 84 , '2023-09-20');


CREATE TABLE Reservation
(ReservationNum varchar(50),
 CustomerID VARCHAR(100) not null, 
 GroupSize INTEGER,
 ResDay DATE,
 ResTime TIME,
 PRIMARY KEY(ReservationNum, CustomerID),
 FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
 );
 
INSERT INTO Reservation (ReservationNum, CustomerID, GroupSize, ResDay, ResTime) VALUES 
('R1', 'C3', 2, '2023-02-14', '16:00:00'),
('R2', 'C8', 4, '2023-09-20', '20:00:00');



CREATE TABLE OrderLine
(OrderLineNum VARCHAR(100),
 OrderNum VARCHAR(50) not null,
 Quantity INTEGER,
 Discount DECIMAL(50),
 Price DECIMAL(100) not null, 
 ProductNum VARCHAR(50) not null, 
 PRIMARY KEY(OrderLineNum, ProductNum, OrderNum),
FOREIGN KEY (ProductNum) 
REFERENCES Product (ProductNum), 
FOREIGN KEY (OrderNum) 
REFERENCES Orders (OrderNum)
);
INSERT INTO OrderLine (OrderLineNum, OrderNum, ProductNum, Quantity, Price, Discount) VALUES
('L01', '#1', 'P1', 1, 18, 0),
('L02', '#1', 'P9', 1, 18, 0),
('L03', '#1', 'P4', 1, 19, 0),
('L04', '#2', 'P7', 2,  10, 0),
('L05', '#2', 'P8', 1, 8, 0),
('L06', '#2', 'P10', 1, 19, 0),
('L07', '#3', 'P10', 2, 19, 0),
('L08', '#4', 'P6', 1, 19, 0),
('L09', '#5', 'P5', 3, 25, 0),
('L010', '#6', 'P7', 2, 10, 0), 
('L011', '#7', 'P1', 1, 18, 0),
('L012', '#8', 'P8', 1, 8, 0), 
('L013', '#9', 'P5', 4, 25, 0), 
('L014', '#10', 'P9', 2, 18, 0), 
('L015', '#10', 'P2', 2, 19, 0), 
('L016', '#11', 'P2', 2, 19, 0),
('L017', '#11', 'P9', 2, 18, 0), 
('L018', '#11', 'P7', 1, 10, 0);

CREATE TABLE MenuItems
(MenuItemID VARCHAR(50) PRIMARY KEY,
 ProductIngredient VARCHAR(100) not null,
 ProductCategory VARCHAR(50) not null,
 ProductNum VARCHAR(50), 
FOREIGN KEY (ProductNum) 
REFERENCES Product (ProductNum)
);

INSERT INTO MenuItems (MenuItemID, ProductNum, ProductIngredient, ProductCategory) VALUES
('M01', 'P1',  'Fresh salmon with lemon, sea salt, dashi soy reduction, rice crips', 'Vegan'),
('M02', 'P2', 'Yellowfin, super white, taro', 'Vegan'),
('M03', 'P3',  'Fresh Sea Bass with black bean, engine, ginger', 'Vegetarian'),
('M04', 'P4',  'Fresh calamari fried in batter with added sea salt', 'Vegetarian'),
('M05', 'P5',  'Marinated steak over rice', 'Carnivore'),
('M06', 'P6', 'Marinated chicken with clover honey', 'Carnivore'),
('M07', 'P7', 'Seasoned grilled mushrooms', 'Vegetarian'),
('M08', 'P8',  'Fresh salad with ginger dressing', 'Vegetarian'),
('M09', 'P9', 'Shoyu collagen bone broth, chashu pork, soft boiled egg, mountain vegetables, shichimi pepper', 'Carnivore'),
('M10', 'P10', 'Chili miso both, spinach, eggs, shrimp tempura', 'Carnivore');
