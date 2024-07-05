CREATE DATABASE koreanbeauty;

USE koreanbeauty;

#creating the first table Customers - DDL
#Customers is connected with Orders through a one-to-many relatioship which was implemented through Cudtomers.CustomerID 
#as a primary key and Orders.CustID as a foreign key
CREATE TABLE Customers(
CustomerID INT NOT NULL AUTO_INCREMENT,
FirstName VARCHAR(25) NOT NULL,
LastName VARCHAR(25) NOT NULL,
Address VARCHAR(100) NOT NULL,
City VARCHAR(30) NOT NULL,
Country VARCHAR(20) NOT NULL,
PRIMARY KEY (CustomerID)
); 

SELECT * FROM Customers;

#adding a new column to the Curstomers table
ALTER TABLE Customers
ADD Email VARCHAR(25);

#droping the Email column
ALTER TABLE Customers
DROP COLUMN Email;

#creating the second table Orders
CREATE TABLE Orders(
OrderID INT NOT NULL AUTO_INCREMENT,
OrderDate DATE,
CustID INT,
ShippID INT,
PRIMARY KEY(OrderID)
);

#adding a foreign key to the Orders table referencing Customers
ALTER TABLE Orders
ADD FOREIGN KEY(CustID) REFERENCES Customers(CustomerID) ON DELETE CASCADE;

#adding the secong foreign key referencing Shippers
ALTER TABLE Orders
ADD FOREIGN KEY(ShippID) REFERENCES Shippers(ShipperID) ON DELETE CASCADE;


#creating the thrid table Shippers
#Shippers is connected with Orders through a one-to-many relationship which was imlemented through Shippers.ShipperID as a 
#primary key and Orders.ShippID as a foreign key
CREATE TABLE Shippers(
ShipperID INT NOT NULL AUTO_INCREMENT,
ShipperName VARCHAR(25) NOT NULL,
ContactNumber VARCHAR(15) NOT NULL,
PRIMARY KEY(ShipperID)
);

#changing the name of a column
ALTER TABLE Shippers
CHANGE ShipperName ShipperCompany VARCHAR(25);

#creating the fourth table Suppliers
#Suppliers is connected with Products through a one-to-many relationship which was implemented through Suppliers.SupplierID as a
#primary key and Products.SupplierID as a foreign key
CREATE TABLE Suppliers(
SupplierID INT NOT NULL AUTO_INCREMENT,
SupplierName VARCHAR(20) NOT NULL,
Address VARCHAR(25) NOT NULL,
City VARCHAR(20),
Country VARCHAR(20),
PRIMARY KEY(SupplierID)
);

#creating the fifth table Products
#Products is connected with Customers through a many-to-one relationship which was implemented through Customers.CustomerID as a
#primary key and Products.CustomerID as a foreign key
CREATE TABLE Products(
ProductID INT NOT NULL AUTO_INCREMENT,
ProductName VARCHAR(25) NOT NULL,
SupplierID INT,
CustomerID INT,
PRIMARY KEY(ProductID)
);

#adding the first foreign key referencing Suppliers
ALTER TABLE Products
ADD FOREIGN KEY(SupplierID) REFERENCES Suppliers(SupplierID) ON DELETE CASCADE;

#adding the second foreign key referencing Customers
ALTER TABLE Products
ADD FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE;

#adding a new column to the Products table
ALTER TABLE Products
ADD Price DECIMAL(5,2);

#inserting data into Customers
INSERT INTO Customers(FirstName,LastName,Address,City,Country) VALUES
('Maria','Santos','Gran Via 53','Madrid','Spain'),
('Elena','Ivan','Str.Teilor 31','Bucharest','Romania'),
('Clara','Popa','Str.9 Mai 11','Bucharest','Romania'),
('Sofia','Lima','Via Augusta 22','Barcelona','Spain'),
('Karla','Tichy','Rampenloch 10','Bremen','Germany'),
('Louise','Trappen','Augustaanlage 7','Munich','Germany'),
('Charlotte','Thompson','Dowing Str. 43','London','UK'),
('Ava','Murillo','Calle de Alcala 3','Sevilla','Spain'),
('Katia','Sturm','Prinzipalmarkt 31','Berlin','Germany'),
('Sharon','Smith','South Str. 16','London','UK');

SELECT * FROM Customers;

#inserting data into Orders
INSERT INTO Orders(OrderDate,CustID,ShippID) VALUES
('2024-06-06',1,3),
('2024-03-21',2,2),
('2024-01-05',3,2),
('2024-05-22',4,3),
('2024-03-11',5,1),
('2024-04-18',6,1),
('2024-02-22',7,4),
('2024-03-08',8,3),
('2024-01-23',9,1),
('2024-06-25',10,4);

SELECT * FROM Orders;

#insertind data into Shippers
INSERT INTO Shippers(ShipperCompany,ContactNumber) VALUES
('ExpressDelivery','+49-178-9882'),
('Sameday','+40-743-256-755'),
('Correos','+34-988-543-221'),
('Fedexpress','+44-020-795-223');

SELECT * FROM Shippers;

#insterting data into Suppliers
INSERT INTO Suppliers VALUES
(1,'COSRX','Gangnam-gu 23','Seoul','South Korea'),
(2,'Missha','Seocho-daero 41','Seoul','South Korea');
INSERT INTO Suppliers(SupplierName,Address,City,Country) VALUES
('Innisfree','Mapo-gu 11','Seoul','South Korea'),
('Beauty of Joseon','Samcheong-ro 73','Seoul','South Korea');

SELECT * FROM Suppliers;

 #inserting data into Products
 INSERT INTO Products(ProductName,SupplierID,CustomerID,Price) VALUES
 ('Aloe Sun Cream SPF50',1,2,12.99),
 ('Sun Relief SPF50',4,4,20.99),
 ('Perfect Cover BB',2,7,105.50),
 ('Retinol Cica',3,5,32.99),
 ('Cleansing Foam',3,9,10.99),
 ('Glow Serum',4,1,18.50),
 ('Magic Cushion Cover',2,3,99.99),
 ('Snail Mucin Essence',1,10,11.99);
 
 SELECT * FROM Products;
 
 #deleting a customer
 DELETE FROM Customers
 WHERE CustomerID = 8;
 
 
 SELECT * FROM Customers;
 
 #updating the last name of the second customer
 UPDATE Customers
 SET LastName = 'Popescu'
 WHERE CustomerID = 2;
 
  #updating the price of a product
 UPDATE Products 
 SET Price = 102.99
 WHERE ProductID = 3;
 
  #updating the name of a supplier company
 UPDATE Suppliers
 SET SupplierName = 'Missha Beauty'
 WHERE SupplierID = 2;
 
 #selecting all customers from Romania
 SELECT * FROM Customers
 WHERE Country = 'Romania';
 
 #selecting all customers from London
 SELECT * FROM Customers
 WHERE City = 'London';
 
  #selecting all customer with country Germany and city Bremen
 SELECT * FROM Customers
 WHERE Country = 'Germany' AND City = 'Bremen';
 
  #selecting all customers with country UK and city London
 SELECT * FROM Customers
 WHERE Country = 'UK' AND City = 'London';
 
  #selecting all customers who are either from Spain or from Romania
 SELECT * FROM Customers
 WHERE Country = 'Spain' OR Country = 'Romania';
 
  #selecting all customers who are either from Sevilla or from Madrid
 SELECT * FROM Customers
 WHERE City = 'Sevilla' OR City = 'Madrid';
 
  #selecting all customers except the ones from the UK
 SELECT * FROM Customers
 WHERE NOT Country = 'UK';
 
 #selecting all customers except the ones that live in Bucharest
 SELECT * FROM Customers
 WHERE NOT City = 'Bucharest';
 
  #selecting all products that start with 'A'
 SELECT * FROM Products
 WHERE ProductName LIKE 'a%';
 
 #selecting all products that end with 'M'
 SELECT * FROM Products
 WHERE ProductName LIKE '%m';
 
 #selecting all products that have 'ea' in their name
 SELECT * FROM Products
 WHERE ProductName LIKE '%ea%';
 
  #selecting all suppliers that have 'is' in their names
 SELECT * FROM Suppliers
 WHERE SupplierName LIKE '%is%';
 
  #returning the number of customers
 SELECT COUNT(CustomerID)
 FROM Customers;
 
  #returning the number of orders
 SELECT COUNT(OrderID)
 FROM Orders;
 
  #returning the number of rows in the Suppliers table
 SELECT COUNT(*)
 FROM Suppliers;
 
  #returning the avarege price of products
 SELECT AVG(Price)
 FROM Products;
 
  #returning the smallest price
 SELECT MIN(Price)
 FROM Products;
 
  #returning the number of customers from each country 
 SELECT COUNT(CustomerID), Country
 FROM Customers
 GROUP BY Country;
 
 #returning the number of the products and their names
 SELECT COUNT(ProductID), ProductName
 FROM Products
 GROUP BY ProductName;
 
  #returning the number of products that have a price equal to or grater than 20.00
 SELECT COUNT(*) FROM Products
 WHERE PRICE >= 20.00;
 
  #returning the last name of the customers and their orders
 SELECT Customers.CustomerID, Customers.LastName, Orders.OrderID
 FROM Customers
 INNER JOIN Orders
 ON Customers.CustomerID = Orders.CustID;
 
  #returning the orders and the shipper company
 SELECT Orders.OrderID, Orders.OrderDate, Shippers.ShipperCompany
 FROM Orders
 LEFT JOIN Shippers
 ON Orders.ShippID = Shippers.ShipperID;
 
  #returning the name of beauty products and their suppliers
 SELECT Products.ProductID, Products.ProductName, Suppliers.SupplierName
 FROM Products
 RIGHT JOIN Suppliers
 ON Products.SupplierID = Suppliers.SupplierID;
 
  #returning the average price for each product
SELECT ProductName, Price, 
    (SELECT AVG(Price) FROM Products) AS average_price
FROM Products;

#returning the products with a price grater than the average price
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);





 
 
 
 
 
 
 
 


