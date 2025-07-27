CREATE PROCEDURE [dbo].[DW_MergeDimCustomer]
AS
BEGIN
UPDATE dc
   SET --[CustomerID] = sc <CustomerID, nchar(5),>
      [CompanyName]     = sc.CompanyName
      ,[ContactName]    = sc.ContactName
      ,[ContactTitle]   = sc.ContactTitle
      ,[Address]        = sc.[Address]
      ,[City]           = sc.City
      ,[Region]         = sc.Region
      ,[PostalCode]     = sc.PostalCode
      ,[Country]        = sc.Country
      ,[Phone]          = sc.Phone
      ,[Fax]            = sc.Fax
      ,[CustomerDesc]   = sc.CustomerDesc
 FROM [dbo].[DimCustomer]        dc
 INNER JOIN [staging].[DimCustomer] sc on (dc.[CustomerSK]=sc.[CustomerSK])

END
