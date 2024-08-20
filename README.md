# Database Project for Korean Beauty Store

<p>The scope of this project is to use all the SQL knowledge gained throught the Software Testing course and apply them in practice.</p>

<p>Application under test: Korean Beauty Store</p>

<p>Tools used: MySQL Workbench</p>

<p>Database description: This database is composed of five tables that store information related to Customers, Orders, Shippers, Products and Suppliers. The tables are linked through different kind of relationships.</p>

  <p><strong>1. Database Schema</strong> </p>

  <p>You can find below the database schema that was generated through Reverse Engineer and which contains all the tables and the relationships between them:<br>
    <img src="EER DiagramFinal.JPG">
The tables are connected in the following way:</p>

<p><em>Customers</em> is connected with <em>Orders</em> through a one-to-many relationship which was implemented through <em>Customers.CustomerID</em> as a primary key and <em>Orders.CustID</em> as a foreign key.</p>
<p><em>Products</em> is connected with <em>Customers</em> through a many-to-one relationship which was implemented through <em>Customers.CustomerID</em> as a primary key and <em>Products.CustomerID</em> as a foreign key.</p>
<p><em>Shippers</em> is connected with <em>Orders</em> through a one-to-many relationship which was implemented through <em>Shippers.ShipperID</em> as a primary key and <em>Orders.ShippID</em> as a foreign key.</p>
<p><em>Suppliers</em> is connected with <em>Products</em> through  one-to-many replationship which was implemented through <em>Suppliers.SupplierID</em> as a primary key and <em>Products.SupplierID</em> as a foreign key.</p>

<p><strong>2. Database Queries</strong></p>

<p><em>i. DDL (Data Definition Language)</em><br>
  
The following instructions were written in the scope of CREATING the structure of the database (CREATE INSTRUCTIONS)</p>

> - **creating the database**
<p>CREATE DATABASE koreanbeauty;</p>

> - **creating the table Customers**
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

> - **creating the table Orders**
<p>CREATE TABLE Orders(<br>
OrderID INT NOT NULL AUTO_INCREMENT,<br>
OrderDate DATE,<br>
CustID INT,<br>
ShippID INT,<br>
PRIMARY KEY(OrderID)<br>
);</p>

> - **creating the table Shippers**
<p>CREATE TABLE Shippers(<br>
ShipperID INT NOT NULL AUTO_INCREMENT,<br>
ShipperName VARCHAR(25) NOT NULL,<br>
ContactNumber VARCHAR(15) NOT NULL,<br>
PRIMARY KEY(ShipperID)<br>
);</p>

> - **creating the table Suppliers**
<p>CREATE TABLE Suppliers(<br>
SupplierID INT NOT NULL AUTO_INCREMENT,<br>
SupplierName VARCHAR(20) NOT NULL,<br>
Address VARCHAR(25) NOT NULL,<br>
City VARCHAR(20),<br>
Country VARCHAR(20),<br>
PRIMARY KEY(SupplierID)<br>
);</p>

> - **creating the table Products**
<p>CREATE TABLE Products(<br>
ProductID INT NOT NULL AUTO_INCREMENT,<br>
ProductName VARCHAR(25) NOT NULL,<br>
SupplierID INT,<br>
CustomerID INT,<br>
PRIMARY KEY(ProductID)<br>
);</p>

<p>After the database and the tables have been created, a few ALTER instructions were written in order to update the structure of the database, as described below:</p>

> - **adding a new column to the Curstomers table**
<p>ALTER TABLE Customers<br>
ADD Email VARCHAR(25);</p>

> - **dropping the Email column**
<p>ALTER TABLE Customers<br>
DROP COLUMN Email;</p>

> - **adding a foreign key to the Orders table referencing Customers**
<p>ALTER TABLE Orders<br>
ADD FOREIGN KEY(CustID) REFERENCES Customers(CustomerID) ON DELETE CASCADE;</p>

> - **adding the secong foreign key to the table Orders referencing Shippers**
<p>ALTER TABLE Orders<br>
ADD FOREIGN KEY(ShippID) REFERENCES Shippers(ShipperID) ON DELETE CASCADE;</p>

> - **changing the name of a column**
<p>ALTER TABLE Shippers<br>
CHANGE ShipperName ShipperCompany VARCHAR(25);</p>

> - **adding the first foreign key to the table Products referencing Suppliers**
<p>ALTER TABLE Products<br>
ADD FOREIGN KEY(SupplierID) REFERENCES Suppliers(SupplierID) ON DELETE CASCADE;</p>

> - **adding the second foreign key to the table Products referencing Customers**
<p>ALTER TABLE Products<br>
ADD FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE;</p>

> - **adding a new column to the Products table**
<p>ALTER TABLE Products<br>
ADD Price DECIMAL(5,2);</p>

<p><em>ii. DML (Data Manipulation Language)</em><br>
  
In order to be able to use the database I populated the tables with various data necessary in order to perform queries and manipulate the data. In the testing process, this necessary data is identified in the Test Design phase and created in the Test Implementation phase.</p>

<p>Below you can find all the insert instructions that were created in the scope of this project:</p>

> - **inserting data into Customers**
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

> - **inserting data into Orders**
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

> - **inserting data into Shippers**
<p>INSERT INTO Shippers(ShipperCompany,ContactNumber) VALUES<br>
('ExpressDelivery','+49-178-9882'),<br>
('Sameday','+40-743-256-755'),<br>
('Correos','+34-988-543-221'),<br>
('Fedexpress','+44-020-795-223');</p>


> - **inserting data into Suppliers**
<p>INSERT INTO Suppliers VALUES<br>
(1,'COSRX','Gangnam-gu 23','Seoul','South Korea'),<br>
(2,'Missha','Seocho-daero 41','Seoul','South Korea');<br>
INSERT INTO Suppliers(SupplierName,Address,City,Country) VALUES<br>
('Innisfree','Mapo-gu 11','Seoul','South Korea'),<br>
('Beauty of Joseon','Samcheong-ro 73','Seoul','South Korea');</p>

> - **inserting data into Products**
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

> - **updating the last name of the second customer**
 <p>UPDATE Customers<br>
 SET LastName = 'Popescu'<br>
 WHERE CustomerID = 2;</p>

> - **updating the price of a product**
 <p> UPDATE Products<br> 
 SET Price = 102.99<br>
 WHERE ProductID = 3;</p>

> - **updating the name of a supplier company**
 <p> UPDATE Suppliers<br>
 SET SupplierName = 'Missha Beauty'<br>
 WHERE SupplierID = 2;</p>

 <p><em>iii. DQL (Data Query Language)</em><br>
   
After the testing process, I deleted the data that was no longer relevant in order to preserve the database clean:</p>

> - **deleting a customer**
<p> DELETE FROM Customers<br>
 WHERE CustomerID = 8;</p>

 <p>In order to simulate various scenarios that might happen in real life I created the following queries that would cover multiple potential real-life situations:</p>

> - **selecting all customers from Romania**
 <p> SELECT * FROM Customers<br>
 WHERE Country = 'Romania';</p>

> - **selecting all customers from London**
 <p>SELECT * FROM Customers<br>
 WHERE City = 'London';</p>

> - **selecting all customer with country Germany and city Bremen**
 <p>SELECT * FROM Customers<br>
 WHERE Country = 'Germany' AND City = 'Bremen';</p>

> - **selecting all customer with country UK and city London**
 <p>SELECT * FROM Customers<br>
 WHERE Country = 'UK' AND City = 'London';</p>

> - **selecting all customers who are either from Spain or from Romania**
 <p> SELECT * FROM Customers<br>
 WHERE Country = 'Spain' OR Country = 'Romania';</p>

> - **selecting all customers who are either from Sevilla or from Madrid**
 <p> SELECT * FROM Customers<br>
 WHERE City = 'Sevilla' OR City = 'Madrid';</p>

> - **selecting all customers except the ones from the UK**
 <p> SELECT * FROM Customers<br>
 WHERE NOT Country = 'UK';</p>

> - **selecting all customers except the ones from Bucharest**
 <p>SELECT * FROM Customers<br>
 WHERE NOT City = 'Bucharest';</p>

> - **selecting all products that start with 'A'**
 <p> SELECT * FROM Products<br>
 WHERE ProductName LIKE 'a%';</p>

> - **selecting all products that end with 'M'**
 <p>SELECT * FROM Products<br>
 WHERE ProductName LIKE '%m';</p>

> - **selecting all products that have 'ea' in their name**
 <p> SELECT * FROM Products<br>
 WHERE ProductName LIKE '%ea%';</p>

> - **selecting all suppliers that have 'is' in their names**
 <p> SELECT * FROM Suppliers<br>
 WHERE SupplierName LIKE '%is%';</p>

> - **returning the number of customers**
 <p> SELECT COUNT(CustomerID)<br>
 FROM Customers;</p>

> - **returning the number of orders**
<p> SELECT COUNT(OrderID)<br>
 FROM Orders;</p>

> - **returning the number of rows in the Suppliers table**
 <p> SELECT COUNT(*)<br>
 FROM Suppliers;</p>

> - **returning the avarege price of products**
 <p> SELECT AVG(Price)<br>
 FROM Products;</p>

> - **returning the lowest price**
 <p>SELECT MIN(Price)<br>
 FROM Products;</p>

> - **returning the number of customers from each country**
 <p> SELECT COUNT(CustomerID), Country<br>
 FROM Customers<br>
 GROUP BY Country;</p>

> - **returning the number of products and their names**
 <p> SELECT COUNT(ProductID), ProductName<br>
 FROM Products<br>
 GROUP BY ProductName;</p>

> - **returning the number of products that have a price equal to or grater than 20.00**
 <p> SELECT COUNT(*) FROM Products<br>
 WHERE PRICE >= 20.00;</p>

> - **returning the last name of the customers and their orders**
 <p> SELECT Customers.CustomerID, Customers.LastName, Orders.OrderID<br>
 FROM Customers<br>
 INNER JOIN Orders<br>
 ON Customers.CustomerID = Orders.CustID;</p>

> - **returning the orders and the shipper company**
 <p> SELECT Orders.OrderID, Orders.OrderDate, Shippers.ShipperCompany<br>
 FROM Orders<br>
 LEFT JOIN Shippers<br>
 ON Orders.ShippID = Shippers.ShipperID;</p>

> - **returning the name of the beauty products and their suppliers**
 <p> SELECT Products.ProductID, Products.ProductName, Suppliers.SupplierName<br>
 FROM Products<br>
 RIGHT JOIN Suppliers<br>
 ON Products.SupplierID = Suppliers.SupplierID;</p>

> - **returning the average price for each product**
 <p>SELECT ProductName, Price,<br> 
    (SELECT AVG(Price) FROM Products) AS average_price<br>
FROM Products;</p>

> - **returning the products with a price higher than the average price**
<p>SELECT ProductName, Price<br>
FROM Products<br>
WHERE Price > (SELECT AVG(Price) FROM Products);</p>


<p><strong>3. Conclusions</strong><br>
  After going through the process of creating this database, performing actions like inserting, updating, deleting data, retrieving information from the database among others, I can say that this whole process set the foundation required for the understanding and usage of the SQL language.</p>







