CREATE SECURITY POLICY [Sales].[CustomerSecurityPolicy]
ADD FILTER PREDICATE [Sales].[fn_SecurityPredicate]([CustomerID])
ON [Sales].[Customers]
WITH (STATE = ON)

GO
