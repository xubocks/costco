CREATE DATABASE CostcoDb;
GO

USE CostcoDb;
GO

-- Create tables -- 
CREATE TABLE Suppliers(
  Supplier_ID bigint NOT NULL PRIMARY KEY,
  Product_ID bigint NOT NULL,
  Supplier_Name varchar(100) NOT NULL,
  Supplier_Address varchar(100) NOT NULL,
  Supplier_City varchar(100) NOT NULL,
  Supplier_Region varchar(100) NOT NULL);

CREATE TABLE Product(
  Product_ID bigint NOT NULL PRIMARY KEY,
  Product_Name varchar(100) NOT NULL,
  Product_Description varchar(100) NOT NULL,
  Quantity varchar(100) NOT NULL,
  Unit_Price varchar(100) NOT NULL);

CREATE TABLE Membership(
  Member_ID bigint NOT NULL PRIMARY KEY,
  Member_Firstname varchar(100) NOT NULL,
  Member_Lastname varchar(100) NOT NULL,
  Member_Address varchar(100) NOT NULL,
  City varchar(100) NOT NULL,
  State varchar(100) NOT NULL,
  Zip varchar(100) NOT NULL,
  Membership_Type varchar(100) NOT NULL, 
  Membership_ExpirationDate varchar(100) NOT NULL);

CREATE TABLE Orders(
  Order_ID bigint NOT NULL PRIMARY KEY,
  Order_Date varchar(100) NOT NULL,
  Member_ID bigint NOT NULL,
  Product_ID bigint NOT NULL,
  Order_Type varchar(100) NOT NULL);

CREATE TABLE Payment(
  Payment_ID bigint NOT NULL PRIMARY KEY,
  Member_ID bigint NOT NULL,
  Card_Type varchar(100) NOT NULL,
  Amount_Paid varchar(100) NOT NULL,
  Payment_Type varchar(100) NOT NULL);

CREATE TABLE Stores(
  Store_ID bigint NOT NULL PRIMARY KEY,
  Store_Number varchar(100) NOT NULL,
  Store_Address varchar(100) NOT NULL,
  Store_Region varchar(100) NOT NULL,
  Store_Country varchar(100) NOT NULL);

CREATE TABLE Shipment(
  Shipment_ID bigint NOT NULL PRIMARY KEY,
  Store_ID bigint NOT NULL,
  Supplier_ID bigint NOT NULL,
  Shipment_Location varchar(100) NOT NULL,
  Ship_Rate varchar(100) NOT NULL,
  Shipment_Date varchar(100) NOT NULL);

CREATE TABLE Department(
  Department_ID bigint NOT NULL PRIMARY KEY,
  Department_Name varchar(100) NOT NULL,
  Product_ID bigint NOT NULL,
  Department_Manager varchar(100) NOT NULL);

CREATE TABLE Employees(
	Employee_ID bigint NOT NULL PRIMARY KEY,
	Store_ID bigint NOT NULL,
	Employee_First_Name varchar(100) NOT NULL,
	Employee_Last_Name varchar(100) NOT NULL, 
	Phone_Number varchar(100) NOT NULL,
	Employee_Address varchar(100) NOT NULL,
	Employee_Hire_Date varchar(100) NOT NULL,
	Employee_Type varchar (100) NOT NULL);

ALTER TABLE Shipment ADD CONSTRAINT FK_Shipment_Suppliers
FOREIGN KEY (Supplier_ID) REFERENCES Suppliers(Supplier_ID);
GO

ALTER TABLE Employees ADD CONSTRAINT FK_Employee_Stores
  FOREIGN KEY (Store_ID) REFERENCES Stores(Store_ID)
  GO

ALTER TABLE Shipment ADD CONSTRAINT FK_Shipment_Stores
  FOREIGN KEY (Store_ID) REFERENCES Stores(Store_ID)
  GO

ALTER TABLE Suppliers ADD CONSTRAINT FK_Suppliers_Product 
FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID);
GO

ALTER TABLE Department ADD CONSTRAINT FK_Department_Product
	FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
	GO

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Product
	FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
	GO

ALTER TABLE Payment ADD CONSTRAINT FK_Payment_Membership
	FOREIGN KEY (Member_ID) REFERENCES Membership(Member_ID)
	GO

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Membership
	FOREIGN KEY (Member_ID) REFERENCES Membership(Member_ID)
	GO

INSERT INTO Suppliers (Supplier_ID, Product_ID, Supplier_Address, Supplier_Name, Supplier_City, Supplier_Region) VALUES
(6437749892, 2658112818, '775 Thompson Lane', 'Xuhe Boosting INC', 'Tonawanda', 'North'),
(6062770544, 3225335527, '9927 Glendale Lane', 'Roberts World', 'Frankfort', 'Central'),
(7517048657, 1263952424, '8896 Main Road', 'Print Design INC', 'Reno', 'West'),
(1067749446, 7884118667, '487 North Princess St.', '', 'Bowie','Central'),
(2223527889, 8162141099, '83 Fairfield St.', 'The Foggy Crab Web Design Company', 'Everett', 'North'),
(9202316137, 3580407305, '307 Bear Hill Drive', 'Small Whale Web Design', 'Erie', 'East'),
(1157762977, 7671594590, '107 Meadowbrook St.', 'The Obtuse Light-Switch Print Design Company', 'Christiansburg', 'East'),
(4762756564, 7932300419, '7052 School Ave.', 'The Black Cow Company', 'Amsterdam', 'North'),
(5091175149, 3062367008, '9654 Armstrong Lane', 'Rainy Gorilla Print Design', 'Independence', 'Central'),
(2089921202, 6729413692, '660 Newport Ave.', 'White Ostrich Builders', 'Depew', 'West');

INSERT INTO Product (Product_ID, Product_Name, Product_Description, Unit_Price, Quantity) VALUES
(2658112818, 'Funkix', 'Shampoo', 20, 130),
(3225335527, 'Faxex', 'Conditioner', 17, 180),
(1263952424, 'Vol Dom', 'Hair Gel', 22, 87),
(7884118667, 'Inchin', 'Perfume for men', 83, 14),
(8162141099, 'K-loteco', 'Gaming Mouse', 75, 39),
(3580407305, 'Spantough', 'Durable Plastic Spray', 18, 134),
(7671594590, 'Zimphase', 'Computer Software on CD ROM', 19, 4),
(7932300419, 'Light Com', 'Light Bulbs for Students', 18, 46),
(3062367008, 'Hayfresh', 'Hairspray for Cows', 94, 23),
(6729413692, 'Fase Fan', 'Portable Fan', 120, 201);

INSERT INTO Membership (Member_ID, Member_Firstname, Member_Lastname, Member_Address, City, State, Zip, Membership_Type, Membership_ExpirationDate) VALUES
(0672382802, 'Jeanette', 'Hughes', '9985 Warren Circle', 'Farmington', 'MI', '48331', 'Premium', '3/9/2017'),
(5836255233, 'Jordan', 'Coleman', '6 Hall Street', 'Chattanooga', 'TN', '37421', 'Standard', '3/10/2017'),
(2125399130, 'Cora', 'Bradley', '950 Birch Hill Ave.', 'Hoboken', 'NJ', '07030', 'Standard', '6/27/2017'),
(7060267575, 'Timmy', 'Townsend', '3 W. Talbot Street', 'Stafford', 'VA', '22554', 'Premium', '11/20/2017'),
(3318048049, 'Ann', 'Ballard', '7994 Manhattan Dr.', 'Villa Park', 'IL', '60181', 'Standard', '1/12/2018'),
(5243226228, 'Shelly', 'Reed', '75 South Pennsylvania Drive', 'West Hempstead', 'NY', '11552', 'Premium', '2/22/2018'),
(8586828896, 'Jane', 'Rogers', '5 State Court', 'Austin', 'MN', '55912', 'Premium', '7/16/2018'),
(5868308958, 'Joanna', 'Greene', '97 Somerset Dr.', 'New Rochelle', 'NY', '10801', 'Premium', '8/9/2018'),
(7775783776, 'Diego', 'Lopez', '7861 Falcon Ridge Rd.', 'Diamond Bar', 'CA', '91765', 'Standard', '9/21/2018'),
(1036462074, 'Justin', 'Gonzales', '9304 Fordham Drive', 'Highland Park', 'IL', '60035', 'Premium', '10/8/2020');

INSERT INTO Orders (Order_ID, Order_Date, Member_ID, Product_ID, Order_Type) VALUES
(3980377215, '10/30/2014', 0672382802, 2658112818, 'Online'),
(1313662253, '12/5/2014', 5836255233, 3225335527, 'In-store'),
(2690194019, '1/5/2015', 2125399130, 1263952424, 'In-Store'),
(6024312778, '3/11/2015', 7060267575, 7884118667, 'Online'),
(8770982053, '4/13/2015', 3318048049, 8162141099, 'Online'),
(9690581846, '4/24/2015', 5243226228, 3580407305, 'In-Store'),
(6843497877, '8/20/2015', 8586828896, 7671594590, 'In-Store'),
(4096841825, '9/10/2015', 5868308958, 7932300419, 'In-Store'),
(0863131276, '10/5/2015', 7775783776, 3062367008, 'In-Store'),
(7320100296, '10/16/2015', 1036462074, 6729413692, 'In-Store');

Insert Into Department (Department_ID, Department_Name, Product_ID, Department_Manager) VALUES
(6054115382, 'Beauty', 2658112818, 'Ebony Farmer'),
(8308097880, 'Beauty', 3225335527, 'Curtis Lowe'),
(3108600922, 'Beauty', 1263952424, 'Kristine Fisher'),
(2568522272, 'Beauty', 7884118667, 'Frances Wheeler'),
(2162688634, 'Gaming', 8162141099, 'Sherry Flowers'),
(1220477841, 'Household', 3580407305, 'Darlene Oliver'),
(3832748951, 'Technology', 7671594590, 'Devin Chambers'),
(2202327026, 'Household', 7932300419, 'Julian OBrien'),
(9139649405, 'Farm', 3062367008, 'Preston Weber'),
(5086520076, 'Appliances', 6729413692, 'Christian Parker');

Insert Into Payment (Payment_ID, Member_ID, Card_Type, Amount_Paid, Payment_Type) VALUES
(8923100890, 0672382802, 'Visa', 76, 'Debit'),
(6091944859, 5836255233, 'MasterCard', 32, 'Credit'),
(6350925185, 2125399130, '', 43, 'Cash'),
(1178448098, 7060267575, '', 87, 'Cash'),
(4568620582, 3318048049, 'American Express', 127, 'Credit'),
(1767609747, 5243226228, 'Visa', 34, 'Debit'),
(0464023445, 8586828896, 'Visa', 68, 'Debit'),
(2240149983, 5868308958, 'MasterCard', 93, 'Credit'),
(2855941446, 7775783776, '', 29, 'Cash'),
(7352170539, 1036462074, 'American Express', 67, 'Credit');

INSERT INTO Shipment (Shipment_ID, Store_ID, Supplier_ID, Shipment_Location, Ship_Rate, Shipment_Date) VALUES
(5665996608, 3583469165, 6437749892, 'North', 9.99, '12/29/2014'),
(6920249890, 0121972687, 6062770544, 'East', 5.99, '1/13/2015'),
(6176355044, 6718641475, 7517048657, 'West', 7.99, '3/5/2015'),
(6764931430, 4989375481, 1067749446, 'South', 4.99, '3/12/2015'),
(7864106437, 7866937793, 2223527889, 'North', 9.99, '3/24/2015'),
(6604266350, 6272938980, 9202316137, 'East', 5.99, '6/19/2015'),
(4231171122, 2641839947, 1157762977, 'West', 7.99, '7/2/2015'),
(9168040388, 9256104118, 4762756564, 'South', 4.99, '7/17/2015'),
(2500396504, 0671837375, 5091175149, 'North', 9.99, '7/31/2015'),
(3530049249, 5562569002, 2089921202, 'East', 5.99, '9/17/2015');

INSERT INTO Stores (Store_ID, Store_Number, Store_Address, Store_Region, Store_Country) VALUES
(3583469165, 1, '762 Manor Station Drive', 'Central', 'USA'),
(0121972687, 2, '87 Halifax Ave.', 'South', 'USA'),
(6718641475, 3, '8572 Sherwood Avenue', 'North', 'USA'),
(4989375481, 4, '15 Valley Lane', 'East', 'USA'),
(7866937793, 5, '40 Nut Swamp Street', 'West', 'USA'),
(6272938980, 6, '7266 Brookside Ave.', 'West', 'USA'),
(2641839947, 7, '61 Poor House Drive', 'West', 'USA'),
(9256104118, 8, '8903 University Dr.', 'Central', 'USA'),
(0671837375, 9, '357 Vine Lane', 'North', 'USA'),
(5562569002, 10, '91 Euclid St.', 'Central', 'USA');

INSERT INTO Employees (Employee_ID, Store_ID, Employee_First_Name, Employee_Last_Name, Phone_Number, Employee_Address, Employee_Hire_Date, Employee_Type) VALUES
(5987296579, 3583469165, 'Bob', 'Barker', '305-904-3614', '93 Vernon Lane', '11/21/2014', 'Stock'),
(3744497668, 0121972687, 'Johnny', 'Depp', '450-239-0967', '39 Cooper St.', '12/3/2014', 'Janitor'),
(1285264233, 6718641475, 'Ryan', 'Reynolds', '463-123-7896', '25 W. Park St.', '1/19/2015', 'Cashier'),
(7891098520, 4989375481, 'Novak', 'Djokovic', '879-237-9809', '587 Jackson St.', '2/23/2015', 'BagBoy'),
(8026180841, 7866937793, 'Billy', 'Madison', '345-876-9054', '21 Bishop St.', '5/15/2015', 'Stock'),
(4786599372, 6272938980, 'Joe', 'Flacco', '465-283-5739', '567 Selby St.', '6/17/2015', 'Janitor'),
(1229580450, 2641839947, 'Brock', 'Assweiler', '574-394-0967', '7182 Hillcrest Street', '7/6/2015', 'BagBoy'),
(1545525725, 9256104118, 'Jay', 'Ajayi', '573-234-8590', '9513 Pilgrim Drive', '8/14/2015', 'Janitor'),
(7179689207, 0671837375, 'Ryan', 'Tannechalk', '783-987-2359', '8759 Forest Avenue', '9/2/2015', 'Cashier'),
(9263346584, 5562569002, 'Kenneth', 'Myers', '786-225-8989', '445 Prince Avenue', '9/14/2015', 'Cashier');



/* The Dream Team: Xuhe Lu, Ben Roque, Dina Weick */