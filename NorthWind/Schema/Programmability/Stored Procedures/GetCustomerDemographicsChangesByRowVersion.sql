CREATE PROCEDURE [dbo].[GetCustomerDemographicsChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	
SELECT [CustomerTypeID]
      ,[CustomerDesc]
     
  FROM [dbo].[CustomerDemographics]

	  WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END