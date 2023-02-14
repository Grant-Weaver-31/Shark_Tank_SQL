-- Clean the data

-- Returns the columns from the table that we need
select  SUM(LineTotal) -- This returns the total revenue
from Sales.SalesOrderDetail
where ProductID = 777 -- Selects the productId=777
and ModifiedDate Between '2011-01-01' and '2011-12-31' -- Selects the date of products in the year 2011

-- Here we do a full join
select ProductID, Name, ProductSubcategoryID
from Production.Product

-- This returns the columns we want from the second table
select ProductSubcategoryID, Name
from Production.ProductSubcategory

-- Full Join
select A.ProductID, A.Name, A.ProductSubcategoryID, B.Name
from Production.Product AS A
FULL JOIN Production.ProductSubcategory AS B
ON A.ProductSubcategoryID = B.ProductSubcategoryID

-- Task: Find all Purchase orders for productid=512 that cost less than 35 per unit price
select * from Purchasing.PurchaseOrderDetail
where ProductID = 512 -- this returns rows where productid=512

select * from Purchasing.PurchaseOrderDetail
where ProductID = 512 AND UnitPrice < 35 -- returns rows where productid=512 and unit price is less than 35

-- Creating a calculated field
-- Task: Find the Amount Lost due to the rejected quantity
select ProductID, UnitPrice, OrderQty, LineTotal, RejectedQty, (UnitPrice * RejectedQty) AS LostAmount
from Purchasing.PurchaseOrderDetail