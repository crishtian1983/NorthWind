CREATE PROCEDURE [dbo].[GetRegionChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	SELECT [RegionID]
      ,[RegionDescription]
      ,[rowversion]
  FROM [dbo].[Region]

	  WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END