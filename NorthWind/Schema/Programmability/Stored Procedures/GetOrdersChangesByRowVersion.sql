CREATE PROCEDURE [dbo].[GetOrdersChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
SELECT [OrderID]
      --,[OrderDate]
      --,[RequiredDate]
      --,[ShippedDate]
      ,OrderDate = CONVERT(INT,
							(CONVERT(CHAR(4),DATEPART(YEAR,ord.OrderDate))
						  + CASE 
								WHEN DATEPART(MONTH,ord.OrderDate) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(MONTH,ord.OrderDate))
								ELSE + CONVERT(CHAR(2),DATEPART(MONTH,ord.OrderDate))
							END
						  + CASE 
								WHEN DATEPART(DAY,ord.OrderDate) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(DAY,ord.OrderDate))
								ELSE + CONVERT(CHAR(2),DATEPART(DAY,ord.OrderDate))
							END))
		  ,RequiredDate = CONVERT(INT,
							(CONVERT(CHAR(4),DATEPART(YEAR,ord.RequiredDate))
						  + CASE 
								WHEN DATEPART(MONTH,ord.RequiredDate) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(MONTH,ord.RequiredDate))
								ELSE + CONVERT(CHAR(2),DATEPART(MONTH,ord.RequiredDate))
							END
						  + CASE 
								WHEN DATEPART(DAY,ord.RequiredDate) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(DAY,ord.RequiredDate))
								ELSE + CONVERT(CHAR(2),DATEPART(DAY,ord.RequiredDate))
							END))
		  ,ShippedDate = CASE
							WHEN ord.ShippedDate IS NULL THEN 0
							ELSE (CONVERT(INT,
										(CONVERT(CHAR(4),DATEPART(YEAR,ord.ShippedDate))
										+ CASE 
											WHEN DATEPART(MONTH,ord.ShippedDate) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(MONTH,ord.ShippedDate))
											ELSE + CONVERT(CHAR(2),DATEPART(MONTH,ord.ShippedDate))
										END
										+ CASE 
											WHEN DATEPART(DAY,ord.ShippedDate) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(DAY,ord.ShippedDate))
											ELSE + CONVERT(CHAR(2),DATEPART(DAY,ord.ShippedDate))
										END)))
							END
               
      
      ,[ShipVia]
      ,[Freight]
      ,[ShipName]
      ,[ShipAddress]
      ,[ShipCity]
      ,[ShipRegion]
      ,[ShipPostalCode]
      ,[ShipCountry]
  FROM [dbo].[Orders]            ord
  INNER JOIN [dbo].[Customers]   cus on (ord.CustomerID= cus.CustomerID)
  INNER JOIN [dbo].[Employees]   emp on (ord.EmployeeID= emp.EmployeeID)

  WHERE (ord.[rowversion] > CONVERT(ROWVERSION,@startRow) 
	    AND ord.[rowversion] <= CONVERT(ROWVERSION,@endRow))
    OR(cus.[rowversion] > CONVERT(ROWVERSION,@startRow) 
	    AND cus.[rowversion] <= CONVERT(ROWVERSION,@endRow))
    OR(emp.[rowversion] > CONVERT(ROWVERSION,@startRow) 
	    AND emp.[rowversion] <= CONVERT(ROWVERSION,@endRow))
