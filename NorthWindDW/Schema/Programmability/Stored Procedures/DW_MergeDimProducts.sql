CREATE PROCEDURE [dbo].[DW_MergeDimProducts]
AS
BEGIN
UPDATE pro
   SET--[ProductID]      = stpro.ProductID
     [ProductName]    = stpro.ProductName
      ,[SupplierID]     = stpro.SupplierID
      ,[CategoryID]     = stpro.CategoryID
      ,[QuantityPerUnit]= stpro.QuantityPerUnit
      ,[UnitPrice]      = stpro.UnitPrice
      ,[UnitsInStock]   = stpro.UnitsInStock
      ,[UnitsOnOrder]   =stpro.UnitsOnOrder
      ,[ReorderLevel]   = stpro.ReorderLevel
      ,[Discontinued]   = stpro.Discontinued
      ,[CategoryName]   = stpro.CategoryName
      ,[Description]    = stpro.[Description]
      ,[Picture]        = stpro.Picture
      ,[SuppliersSK]    = stpro.SuppliersSK

from [dbo].[DimProducts] pro
INNER JOIN  [staging].[DimProducts]   stpro on(pro.[ProductSK]=stpro.[ProductSK])
END
