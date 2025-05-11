-- QUESTION ONE
-- Create the ProductDetail table
CREATE TABLE ProductDetail (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Products VARCHAR(255)
);

-- Insert the data into the ProductDetail table
INSERT INTO ProductDetail (OrderID, CustomerName, Products) VALUES
(101, 'John Doe', 'Laptop, Mouse'),
(102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
(103, 'Emily Clark', 'Phone');

-- Create Product table
CREATE TABLE Product(
productID INT PRIMARY KEY AUTO_INCREMENT,
product VARCHAR(100),
OrderId INT,
FOREIGN KEY (OrderId) REFERENCES ProductDetail(OrderId));

-- Insert data into Product table
INSERT INTO Product (product, OrderId)
VALUES
    ("Laptop", 101),
    ("Mouse", 101),
    ("Tablet", 102),
    ("Keyboard", 102),
    ("Mouse", 102),
    ("Phone", 103);
    
-- QUESTION TWO
-- Create the OrderDetails table
CREATE TABLE OrderDetails (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT
);

-- Insert data into the OrderDetails table
INSERT INTO OrderDetails (OrderID, CustomerName, Product, Quantity)
VALUES
    (101, 'John Doe', 'Laptop', 2),
    (101, 'John Doe', 'Mouse', 1),
    (102, 'Jane Smith', 'Tablet', 3),
    (102, 'Jane Smith', 'Keyboard', 1),
    (102, 'Jane Smith', 'Mouse', 2),
    (103, 'Emily Clark', 'Phone', 1);


-- Create Customers table
CREATE TABLE Customers (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert data into the Customers table
INSERT INTO Customers (OrderID, CustomerName)
VALUES (101, "John Doe"),
(102, "Jane Smith"),
(103, "Emily Clark");

-- Create OrderItems table
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Customers(OrderID)
);

-- Insert data into the OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
