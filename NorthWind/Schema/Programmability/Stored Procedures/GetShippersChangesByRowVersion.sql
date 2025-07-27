CREATE PROCEDURE [dbo].[GetShippersChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
SELECT [ShipperID]
      ,[CompanyName]
      ,[Phone]
      ,[rowversion]
  FROM [dbo].[Shippers]

  
	  WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)