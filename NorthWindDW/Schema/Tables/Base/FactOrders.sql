CREATE TABLE FactOrders(
	[OrderID] [int] NOT NULL,
	[CustomerSK] [int] NULL references DimCustomer (CustomerSK),
	[EmployeeSK] [int] NULL references DimEmployees (EmployeeSK),
	[OrderDate] [int] NULL references DimDate (DateKey),
	[RequiredDate] [int] NULL references DimDate (DateKey),
	[ShippedDate] [int] NULL references DimDate (DateKey),
	[ShipVia] [int] NULL REFERENCES DimShippers ([ShipperSK]),
	[Freight] [money] NULL,
	[ShipName] [nvarchar](40) NULL,
	[ShipAddress] [nvarchar](60) NULL,
	[ShipCity] [nvarchar](15) NULL,
	[ShipRegion] [nvarchar](15) NULL,
	[ShipPostalCode] [nvarchar](10) NULL,
	[ShipCountry] [nvarchar](15) NULL
);
