USE ADVENTURE_WORKS

CREATE SCHEMA dw

--===== CREATE DIM PRODUCT

-- Create DimProduct Table
CREATE TABLE dw.DimProduct (
	[ProductID] int,
    [ProductName] nvarchar(50),
    [StandardCost] money,
    [ListPrice] money,
    [ProductLine] nvarchar(2),
    [SellStartDate] datetime,
    [SellEndDate] datetime,
    [ProductNumber] nvarchar(25),
    [SizeUnitMeasureCode] nvarchar(3),
    [WeightUnitMeasureCode] nvarchar(3),
    [FinishedGoodsFlag] bit,
    [Color] nvarchar(15),
    [SafetyStockLevel] smallint,
    [ReorderPoint] smallint,
    [Size] nvarchar(5),
    [Weight] numeric(8,2),
    [DaysToManufacture] int,
    [Class] nvarchar(2),
    [Style] nvarchar(2),
    [ProductSubcategroyName] nvarchar(50),
    [ProductCategoryName] nvarchar(50),
	[ActiveFrom] datetime,
	[ActiveTo] datetime
)  

SELECT * FROM dw.DimProduct


--===== CREATE DIM CUSTOMER

-- Create DimCustomer Table
CREATE TABLE dw.DimCustomer (
	[CustomerID] int,
    [PersonID] int,
    [TerritoryID] int,
    [AccountNumber] varchar(10),
    [PersonTitle] nvarchar(8),
    [FirstName] nvarchar(50),
    [MiddleName] nvarchar(50),
    [LastName] nvarchar(50),
    [GeographyKey] int,
	[AddressLine1] nvarchar(60),
    [AddressLine2] nvarchar(60),
	[BirthDate] nvarchar(10),
    [MaritalStatus] nvarchar(1),
    [Gender] nvarchar(1),
    [EmailAddress] nvarchar(50),
    [YearlyIncome] money,
    [TotalChildren] tinyint,
    [NumberChildrenAtHome] tinyint,
    [EnglishEducation] nvarchar(40),
    [EnglishOccupation] nvarchar(100),
    [HouseOwnerFlag] nvarchar(1),
    [Phone] nvarchar(20),
    [DateFirstPurchase] nvarchar(10),
    [CommuteDistance] nvarchar(15),
	[ActiveFrom] datetime,
	[ActiveTo] datetime
)

SELECT * FROM dw.DimCustomer


--===== CREATE DIM TERRITORY

-- Create DimTerritory Table
CREATE TABLE dw.DimTerritory (
    [TerritoryID] int,
    [RegionName] nvarchar(50),
    [CountryRegionCode] nvarchar(3),
    [TerritoryGroupName] nvarchar(50),
    [TerritoryCountry] nvarchar(14)
)

SELECT * FROM dw.DimTerritory


--====== CREATE DIM DATE

-- Create Date Table
CREATE TABLE dw.DimDate(
	[DateKey] INT IDENTITY(1, 1),
    [Date] datetime,
    [Year] int,
    [Month] int,
    [Day] int,
    [Quarters] int,
    [WeekOfYear] int,
    [DayOfYear] int,
    [DayOfMonth] int,
    [DayOfWeek] int,
	[MonthName] nvarchar(9)
)

SELECT * FROM dw.DimDate


--===== CREATE DIM PROMOTION

CREATE TABLE dw.DimPromotion (
    [PromotionID] int,
    [PromotionName] nvarchar(255),
    [DiscountPct] money,
    [PromotionType] nvarchar(50),
    [PromotionCategory] nvarchar(50),
    [StartDate] datetime,
    [EndDate] datetime,
    [MinQty] int,
    [MaxQty] int,
	[ActiveFrom] datetime,
	[ActiveTo] datetime
)

SELECT * FROM dw.DimPromotion


--===== CREATE DIM GEOGRAPHY

CREATE TABLE dw.DimGeography (
	[GeographyKey] INT IDENTITY(1, 1),
    [StateProvinceCode] nvarchar(3),
    [CountryRegionCode] nvarchar(3),
    [TerritoryID] int,
    [SateProvinceName] nvarchar(50),
    [City] nvarchar(30),
    [PostalCode] nvarchar(15),
    [StateProvinceID] int
)

SELECT * FROM  dw.DimGeography


--===== CREATE SALES REASON

CREATE TABLE dw.SalesReason (
    [SalesReasonID] int,
    [SalesReasonName] nvarchar(50),
    [SalesReasonType] nvarchar(50)
)

SELECT * FROM dw.SalesReason

--===== FACT SALES

CREATE TABLE dw.FactSales (
    [SalesOrderID] int,
    [UnitPrice] money,
    [UnitPriceDiscount] money,
    [PromotionID] int,
    [SalesAmount] numeric(38,6),
    [OrderQuantity] smallint,
    [ProductID] int,
    [OrderDate] datetime,
    [DueDate] datetime,
    [ShipDate] datetime,
    [Freight] money,
    [TaxAmt] money,
    [SalesOrderNumber] nvarchar(25),
    [RevisionNumber] tinyint,
    [CustomerID] int,
    [TerritoryID] int,
    [CurrencyRateID] int,
    [SalesOrderDetailID] int,
    [CarrierTrackingNumber] nvarchar(25),
    [CustomerPONumber] nvarchar(25),
    [SalesReasonID] int,
    [TotalProductCost] numeric(25,4)
)

-- Update FactSales Reason NULL to 'Other'
UPDATE dw.FactSales
SET SalesReasonID = 10
WHERE SalesReasonID IS NULL;

SELECT * FROM dw.FactSales