CREATE TABLE DimShippers(
	[ShipperSK] [int] primary key IDENTITY(1,1) NOT NULL,
	[ShipperID] [int] NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[Phone] [nvarchar](24) NULL
);
