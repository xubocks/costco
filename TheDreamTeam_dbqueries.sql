/* Multiple SELECT * queries to display all the records from each table. */

SELECT *
FROM Suppliers

SELECT *
FROM Product

SELECT *
FROM Orders

SELECT *
FROM Membership

SELECT *
FROM Stores

SELECT *
FROM Employees

SELECT * 
FROM Shipment

SELECT *
FROM Department

SELECT *
FROM Payment

/* A query that uses aggregate function. */

SELECT COUNT(Member_ID) as Number_of_Premium_Members
FROM Membership
WHERE Membership_Type = 'Premium' and Zip = '22554';

/* A query that selects records from two (or multiple) tables using INNER JOIN. */

SELECT Employees.Employee_First_Name, Employees.Employee_Last_Name,Stores.Store_Number
FROM Employees INNER JOIN Stores
ON Stores.Store_ID = Employees.Store_ID;

/* A query that selects records from two (or multiple) tables using LEFT OUTER JOIN (or RIGHT OUTER JOIN or FULL OUTER JOIN). */ 

SELECT Product.Product_Name, Suppliers.Supplier_Name
FROM Product LEFT OUTER JOIN  Suppliers 
ON Product.Product_ID = Suppliers.Product_ID;

/* Our objective was to find Products that didn't have a defined supplier name. We made sure that all of our products had names
so by using our product table as the left hand side, using left outer join would mean that the left hand would be completely 
filled with values. One of our supplier names was purposefully left blank and the blank came up as null in the left outer join
because the suppliers table was specified as the right hand table. */

/* A query that uses subquery. */

Select Count(Product_ID) as Count_Of_Products_Supplied_By_Suppliers_In_Northern_Region
From Product
Where Product_ID IN
(Select Product_ID from Suppliers
Where Supplier_Region = 'North');


/* The Dream Team : Xuhe Lu, Robert Roque, Dina Weick */