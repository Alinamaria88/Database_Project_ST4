# Database Project for Korean Beauty Store

<p>The scope of this project is to use all the SQL knowledge gained throught the Software Testing course and apply them in practice.</p>

<p>Application under test: Korean Beauty Store</p>

<p>Tools used: MySQL Workbench</p>

<p>Database description: This database is composed of five tables that store information related to Customers, Orders, Shippers, Products and Suppliers. The tables are linked through different kind of relationships.</p>

  <p>1. Database Schema </p>

  <p>You can find below the database schema that was generated through Reverse Engineer and which contains all the tables and the relationships between them:<br>
    <img src="EER DiagramFinal.JPG">
The tables are connected in the following way:</p>

<p>Customers is connected with Orders through a one-to-many relationship which was implemented through Customers.CustomerID as a primary key and Orders.CustID as a foreign key.</p>
<p>Products is connected with Customers through a many-to-one relationship which was implemented through Customers.CustomerID as a primary key and Products.CustomerID as a foreign key.</p>
<p>Shippers is connected with Orders through a one-to-many relationship which was implemented through Shippers.ShipperID as a primary key and Orders,ShippID as a foreign key.</p>
<p>Suppliers is connected with Products through  one-to-many replationship which was implemented through Suppliers.SupplierID as a primary key and Products.SupplierID as a foreign key.</p>

<p>2. Database Queries</p>

<p>i. DDL (Data Definition Language)<br>
The following instructions were written in the scope of CREATING the structure of the database (CREATE INSTRUCTIONS)</p>

<p>CREATE DATABASE koreanbeauty;</p>

<p>CREATE TABLE Customers(<br>
CustomerID INT NOT NULL AUTO_INCREMENT,<br>
FirstName VARCHAR(25) NOT NULL,<br>
LastName VARCHAR(25) NOT NULL,<br>
Address VARCHAR(100) NOT NULL,<br>
City VARCHAR(30) NOT NULL,<br>
Country VARCHAR(20) NOT NULL,<br>
PRIMARY KEY (CustomerID)<br>
); 
</p>

<p>CREATE TABLE Orders(<br>
OrderID INT NOT NULL AUTO_INCREMENT,<br>
OrderDate DATE,<br>
CustID INT,<br>
ShippID INT,<br>
PRIMARY KEY(OrderID)<br>
);</p>

<p>CREATE TABLE Shippers(<br>
ShipperID INT NOT NULL AUTO_INCREMENT,<br>
ShipperName VARCHAR(25) NOT NULL,<br>
ContactNumber VARCHAR(15) NOT NULL,<br>
PRIMARY KEY(ShipperID)<br>
);</p>

<p>CREATE TABLE Suppliers(<br>
SupplierID INT NOT NULL AUTO_INCREMENT,<br>
SupplierName VARCHAR(20) NOT NULL,<br>
Address VARCHAR(25) NOT NULL,<br>
City VARCHAR(20),<br>
Country VARCHAR(20),<br>
PRIMARY KEY(SupplierID)<br>
);</p>

<p>CREATE TABLE Products(<br>
ProductID INT NOT NULL AUTO_INCREMENT,<br>
ProductName VARCHAR(25) NOT NULL,<br>
SupplierID INT,<br>
CustomerID INT,<br>
PRIMARY KEY(ProductID)<br>
);</p>

<p>After the database and the tables have been created, a few ALTER instructions were written in order to update the structure of the database, as described below:</p>

<p>ALTER TABLE Customers<br>
ADD Email VARCHAR(25);</p>

<p>ALTER TABLE Customers<br>
DROP COLUMN Email;</p>

<p>ALTER TABLE Orders<br>
ADD FOREIGN KEY(CustID) REFERENCES Customers(CustomerID) ON DELETE CASCADE;</p>

<p>ALTER TABLE Orders<br>
ADD FOREIGN KEY(ShippID) REFERENCES Shippers(ShipperID) ON DELETE CASCADE;</p>

<p>ALTER TABLE Shippers<br>
CHANGE ShipperName ShipperCompany VARCHAR(25);</p>

<p>ALTER TABLE Products<br>
ADD FOREIGN KEY(SupplierID) REFERENCES Suppliers(SupplierID) ON DELETE CASCADE;</p>

<p>ALTER TABLE Products<br>
ADD FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE;</p>

<p>ALTER TABLE Products<br>
ADD Price DECIMAL(5,2);</p>

<p>ii. DML (Data Manipulation Language)<br>
In order to be able to use the database I populated the tables with various data necessary in order to perform queries and manipulate the data. In the testing process, this necessary data is identified in the Test Design phase and created in the Test Implementation phase.</p>

<p>Below you can find all the insert instructions that were created in the scope of this project:</p>

<p>INSERT INTO Customers(FirstName,LastName,Address,City,Country) VALUES<br>
('Maria','Santos','Gran Via 53','Madrid','Spain'),<br>
('Elena','Ivan','Str.Teilor 31','Bucharest','Romania'),<br>
('Clara','Popa','Str.9 Mai 11','Bucharest','Romania'),<br>
('Sofia','Lima','Via Augusta 22','Barcelona','Spain'),<br>
('Karla','Tichy','Rampenloch 10','Bremen','Germany'),<br>
('Louise','Trappen','Augustaanlage 7','Munich','Germany'),<br>
('Charlotte','Thompson','Dowing Str. 43','London','UK'),<br>
('Ava','Murillo','Calle de Alcala 3','Sevilla','Spain'),<br>
('Katia','Sturm','Prinzipalmarkt 31','Berlin','Germany'),<br>
('Sharon','Smith','South Str. 16','London','UK');</p>

<p>INSERT INTO Orders(OrderDate,CustID,ShippID) VALUES<br>
('2024-06-06',1,3),<br>
('2024-03-21',2,2),<br>
('2024-01-05',3,2),<br>
('2024-05-22',4,3),<br>
('2024-03-11',5,1),<br>
('2024-04-18',6,1),<br>
('2024-02-22',7,4),<br>
('2024-03-08',8,3),<br>
('2024-01-23',9,1),<br>
('2024-06-25',10,4);</p>

<p>INSERT INTO Shippers(ShipperCompany,ContactNumber) VALUES<br>
('ExpressDelivery','+49-178-9882'),<br>
('Sameday','+40-743-256-755'),<br>
('Correos','+34-988-543-221'),<br>
('Fedexpress','+44-020-795-223');</p>

<p>INSERT INTO Suppliers VALUES<br>
(1,'COSRX','Gangnam-gu 23','Seoul','South Korea'),<br>
(2,'Missha','Seocho-daero 41','Seoul','South Korea');<br>
INSERT INTO Suppliers(SupplierName,Address,City,Country) VALUES<br>
('Innisfree','Mapo-gu 11','Seoul','South Korea'),<br>
('Beauty of Joseon','Samcheong-ro 73','Seoul','South Korea');</p>

<p> INSERT INTO Products(ProductName,SupplierID,CustomerID,Price) VALUES<br>
 ('Aloe Sun Cream SPF50',1,2,12.99),<br>
 ('Sun Relief SPF50',4,4,20.99),<br>
 ('Perfect Cover BB',2,7,105.50),<br>
 ('Retinol Cica',3,5,32.99),<br>
 ('Cleansing Foam',3,9,10.99),<br>
 ('Glow Serum',4,1,18.50),<br>
 ('Magic Cushion Cover',2,3,99.99),<br>
 ('Snail Mucin Essence',1,10,11.99);</p>

 <p>After the insert, in order to prepare the data to be better suited for the testing process, I updated some data in the following way:</p>

 <p>UPDATE Customers<br>
 SET LastName = 'Popescu'<br>
 WHERE CustomerID = 2;</p>

 <p> UPDATE Products<br> 
 SET Price = 102.99<br>
 WHERE ProductID = 3;</p>

 <p> UPDATE Suppliers<br>
 SET SupplierName = 'Missha Beauty'<br>
 WHERE SupplierID = 2;</p>

 <p>iii. DQL (Data Query Language)<br>
After the testing process, I deleted the data that was no longer relevant in order to preserve the database clean:</p>

<p> DELETE FROM Customers<br>
 WHERE CustomerID = 8;</p>

 <p>In order to simulate various scenarios that might happen in real life I created the following queries that would cover multiple potential real-life situations:</p>

 <p> SELECT * FROM Customers<br>
 WHERE Country = 'Romania';</p>

 <p>SELECT * FROM Customers<br>
 WHERE City = 'London';</p>

 <p>SELECT * FROM Customers<br>
 WHERE Country = 'Germany' AND City = 'Bremen';</p>

 <p>SELECT * FROM Customers<br>
 WHERE Country = 'UK' AND City = 'London';</p>

 <p> SELECT * FROM Customers<br>
 WHERE Country = 'Spain' OR Country = 'Romania';</p>

 <p> SELECT * FROM Customers<br>
 WHERE City = 'Sevilla' OR City = 'Madrid';</p>

 <p> SELECT * FROM Customers<br>
 WHERE NOT Country = 'UK';</p>

 <p>SELECT * FROM Customers<br>
 WHERE NOT City = 'Bucharest';</p>

 <p> SELECT * FROM Products<br>
 WHERE ProductName LIKE 'a%';</p>

 <p>SELECT * FROM Products<br>
 WHERE ProductName LIKE '%m';</p>

 <p> SELECT * FROM Products<br>
 WHERE ProductName LIKE '%ea%';</p>

 <p> SELECT * FROM Suppliers<br>
 WHERE SupplierName LIKE '%is%';</p>

 <p> SELECT COUNT(CustomerID)<br>
 FROM Customers;</p>

<p> SELECT COUNT(OrderID)<br>
 FROM Orders;</p>

 <p> SELECT COUNT(*)<br>
 FROM Suppliers;</p>

 <p> SELECT AVG(Price)<br>
 FROM Products;</p>

 <p>SELECT MIN(Price)<br>
 FROM Products;</p>

 <p> SELECT COUNT(CustomerID), Country<br>
 FROM Customers<br>
 GROUP BY Country;</p>

 <p> SELECT COUNT(ProductID), ProductName<br>
 FROM Products<br>
 GROUP BY ProductName;</p>

 <p> SELECT COUNT(*) FROM Products<br>
 WHERE PRICE >= 20.00;</p>

 <p> SELECT Customers.CustomerID, Customers.LastName, Orders.OrderID<br>
 FROM Customers<br>
 INNER JOIN Orders<br>
 ON Customers.CustomerID = Orders.CustID;</p>

 <p> SELECT Orders.OrderID, Orders.OrderDate, Shippers.ShipperCompany<br>
 FROM Orders<br>
 LEFT JOIN Shippers<br>
 ON Orders.ShippID = Shippers.ShipperID;</p>

 <p> SELECT Products.ProductID, Products.ProductName, Suppliers.SupplierName<br>
 FROM Products<br>
 RIGHT JOIN Suppliers<br>
 ON Products.SupplierID = Suppliers.SupplierID;</p>

 <p>SELECT ProductName, Price,<br> 
    (SELECT AVG(Price) FROM Products) AS average_price<br>
FROM Products;</p>

<p>SELECT ProductName, Price<br>
FROM Products<br>
WHERE Price > (SELECT AVG(Price) FROM Products);</p>


<p>3. Conclusions<br>
  After going through the process of creating this database, performing actions like inserting, updating, deleting data, retrieving information from the database among others, I can say that this whole process set the foundation required for the understanding and usage of the SQL language.</p>







