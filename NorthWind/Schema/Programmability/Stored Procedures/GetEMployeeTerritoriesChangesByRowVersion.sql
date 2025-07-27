CREATE PROCEDURE [dbo].[GetEMployeeTerritoriesChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS

SELECT [EmployeeID]
      
  
  FROM [dbo].[EmployeeTerritories] Emptrd
  INNER JOIN [dbo].[Territories]   Terr on (Emptrd.[TerritoryID]= Terr.TerritoryID)
  
  WHERE (Emptrd.[rowversion] > CONVERT(ROWVERSION,@startRow) 
	    AND Emptrd.[rowversion] <= CONVERT(ROWVERSION,@endRow))
    OR(Terr.[rowversion] > CONVERT(ROWVERSION,@startRow) 
	    AND Terr.[rowversion] <= CONVERT(ROWVERSION,@endRow))

