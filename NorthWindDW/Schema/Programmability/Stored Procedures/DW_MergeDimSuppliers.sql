CREATE PROCEDURE [dbo].[DW_MergeDimSuppliers]
AS
BEGIN
UPDATE [dbo].[DimSuppliers]
   SET --[SupplierID] = <SupplierID, int,>
      [CompanyName]     = dimsup.CompanyName
      ,[ContactName]    = dimsup.ContactName
      ,[ContactTitle]   = dimsup.ContactTitle
      ,[Address]        = dimsup.[Address]
      ,[City]           = dimsup.City
      ,[Region]         = dimsup.Region
      ,[PostalCode]     = dimsup.PostalCode
      ,[Country]        = dimsup.Country
      ,[Phone]          = dimsup.Phone
      ,[Fax]            = dimsup.Fax
      ,[HomePage]       = dimsup.HomePage
 
From [dbo].[DimSuppliers] sup
INNER JOIN [staging].[DimSuppliers] dimsup on (sup.[SupplierSK]=dimsup.[SupplierSK])

END
