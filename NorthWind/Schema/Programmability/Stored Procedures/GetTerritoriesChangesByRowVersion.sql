CREATE PROCEDURE [dbo].[GetTerritoriesChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
SELECT [TerritoryID]
      ,[TerritoryDescription]
FROM [dbo].[Territories]    trd
  INNER JOIN [dbo].[Region]   reg on (trd.RegionID= reg.RegionID)
  
  WHERE (trd.[rowversion] > CONVERT(ROWVERSION,@startRow) 
	    AND trd.[rowversion] <= CONVERT(ROWVERSION,@endRow))
    OR(reg.[rowversion] > CONVERT(ROWVERSION,@startRow) 
	    AND reg.[rowversion] <= CONVERT(ROWVERSION,@endRow))
   
