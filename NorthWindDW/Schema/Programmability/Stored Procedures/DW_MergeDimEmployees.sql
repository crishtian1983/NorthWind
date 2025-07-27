CREATE PROCEDURE [dbo].[DW_MergeDimEmployees]
AS
BEGIN
UPDATE emp
   SET --[EmployeeID] = stempEmployeeID, int,>
      [LastName]            = stemp.LastName
      ,[FirstName]          = stemp.FirstName
      ,[Title]              = stemp.Title
      ,[TitleOfCourtesy]    = stemp.TitleOfCourtesy
      ,[BirthDate]          = stemp.BirthDate
      ,[HireDate]           = stemp.HireDate
      ,[Address]            = stemp.[Address]
      ,[City]               = stemp.City
      ,[Region]             = stemp.Region
      ,[PostalCode]         = stemp.PostalCode
      ,[Country]            = stemp.Country
      ,[HomePhone]          = stemp.HomePhone
      ,[Extension]          = stemp.Extension
      ,[Photo]              = stemp.Photo
      ,[Notes]              = stemp.Notes
      ,[ReportsTo]          = stemp.ReportsTo
      ,[PhotoPath]          = stemp.PhotoPath
      ,[TerritoryDescription] = stemp.TerritoryDescription
      ,[RegionDescription]  = stemp.RegionDescription

      from DimEmployees emp 
      INNER JOIN [staging].[DimEmployees] stemp on (emp.[EmployeeSK]= stemp.[EmployeeSK])

end
