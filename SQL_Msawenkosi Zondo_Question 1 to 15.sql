
/*Write a query to create a database called InventoryDB and a query to use it.*/
create database InventoryDB;

/*Create a table called Items with the following fields:*/
create table items(
temID int Primary Key,
ItemName VARCHAR(30),
Category VARCHAR(30),
Price decimal,
StockQuantity int);

select * from items;

/*nsert the following data into the Items table:*/
insert into items(temID,ItemName,Category,Price,StockQuantity)
values
(001,'Desk','Furniture',300.00,20),
(002,'Chair','Furniture',150.00,50),
(003,'Notebook','Stationery',10.00,100),
(004,'Pen','Stationery',2.00,200),
(005,'Monitor','Electronics',250.00,30);

select * from items;


/*Create a table called Customers with the following fields:*/
create table Customers(
CustomerID int Primary Key,
FirstName VARCHAR(20),
LastName VARCHAR(20),
Email VARCHAR(50),
Phone VARCHAR(50));

select * from Customers;
/*Insert the following customer records into the Customers table:*/
insert into Customers(CustomerID,FirstName,LastName,Email,Phone)
values
(101,'John','Doe','john.doe@gmail.com','123-456-7890'),
(102,'Jane','Smith','jane.smith@gmail.com','234-567-8901'),
(103,'Emily','Davis','emily.davis@gmail.com','345-678-9012'); 


select * from Customers;

/*Create a table called Orders with the following fields*/
create table Orders(
OrderID int Primary Key,
CustomerID int Foreign Key(CustomerID) REFERENCES Customers(CustomerID),
OrderDate VARCHAR(50),
TotalAmount decimal);

select * from Orders;

/*Insert the following order records into the Orders table:*/
insert into Orders(OrderID,CustomerID,OrderDate,TotalAmount) 
values
(001,101,'2024-07-01',600.00),
(002,102,'2024-07-02',300.00),
(003,103,'2024-07-03',150.00);

drop table Orders;

select * from Orders;


/*Create a table called OrderItems with the following fields:*/
create table OrderItems(
OrderItemID int Primary Key,
OrderID int Foreign Key (OrderID) REFERENCES Orders(OrderID),
ItemID int Foreign Key (ItemID) REFERENCES items(temID),
Quantity int,
LineTotal decimal);


select * from OrderItems;

/*Insert the following order item records into the OrderItems table:*/
insert into OrderItems(OrderItemID,OrderID,ItemID,Quantity,LineTotal)
values
(001,001,001,2,600.00),
(002,001,003,5,50.00),
(003,002,002,2,300.00),
(004,003,004,10,20.00);

select * from OrderItems;


/*Write a query to find the best-selling item by total sales amount. Show the ItemName and TotalSalesAmount.*/
alter table items add TotalSalesAmount  decimal;

select * from items;

update items set TotalSalesAmount=(Price*StockQuantity);

select ItemName, TotalSalesAmount
   from items
     where TotalSalesAmount = (select max(TotalSalesAmount) from items);

/*Write a query to find the customer who has placed the highest total orders. Show the CustomerID, FirstName, LastName, and TotalAmount. */

select Customers.CustomerID, Customers.FirstName, Customers.LastName, Orders.TotalAmount 
     from Customers, Orders
	     where Customers.CustomerID = Orders.CustomerID;


/*Write a query to display the total quantity sold and total revenue for each item.Use GROUP BY to summarize the results. */


  SELECT temID, sum(StockQuantity) as TotalQuantity, sum(TotalSalesAmount) as TotalRevenue
      from items
		group by temID

/*Write a query to display the total amount spent by each customer. Use GROUP BY to summarize the results.*/

SELECT 
  CustomerID, 
  SUM(TotalAmount) AS TotalAmountSpent
FROM 
  Orders
GROUP BY 
  CustomerID;

  /*Write a query to display all items showing ItemID, ItemName, and StockQuantity*/

 select ItemID, ItemName, StockQuantity
    FROM OrderItems, items;


/*Write a query to display all orders showing OrderID, CustomerID, OrderDate, and 
TotalAmount. */

select OrderID, CustomerID, OrderDate, TotalAmount
    from OrderItems, Customers, items, Orders;

		
 















