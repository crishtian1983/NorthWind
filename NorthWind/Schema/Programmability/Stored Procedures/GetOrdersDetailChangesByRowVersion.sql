CREATE PROCEDURE [dbo].[GetOrdersDetailChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
SELECT [OrderID]
      ,[Quantity]
      ,[Discount]
      
  FROM [dbo].[OrderDetails]  OrdDet
  INNER JOIN Products        Prd on (OrdDet.ProductID=Prd.ProductID)

  WHERE (OrdDet.[rowversion] > CONVERT(ROWVERSION,@startRow) 
	    AND OrdDet.[rowversion] <= CONVERT(ROWVERSION,@endRow))
    OR(Prd.[rowversion] > CONVERT(ROWVERSION,@startRow) 
	    AND Prd.[rowversion] <= CONVERT(ROWVERSION,@endRow))