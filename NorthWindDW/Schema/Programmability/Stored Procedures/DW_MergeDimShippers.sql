CREATE PROCEDURE [dbo].[DW_MergeDimShippers]
AS
BEGIN
UPDATE shi
   SET --[ShipperID] = <ShipperID, int,>
      [CompanyName] = dimshi.CompanyName
      ,[Phone] = dimshi.Phone
 
from [dbo].[DimShippers] shi
INNER JOIN [staging].[DimShippers] dimshi on (shi.[ShipperSK]=dimshi.[ShipperSK])

END
