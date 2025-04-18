SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_OrderDetails] AS
SELECT 
    o.OrderID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    p.ProductName,
    o.Quantity,
    p.Price,
    o.Quantity * p.Price AS TotalPrice,
    o.OrderDate
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON o.ProductID = p.ProductID;
GO
