use master
go

if  exists(select * from sys.databases where name = 'BookStor')
    drop database BookStor
go
 
create database BookStor
go

use BookStor
go

-- Category table
create table Category
(
	ID int identity(1,1) primary key,
	Code nvarchar(100),
	[Name] nvarchar(100) not null,
	[Description] nvarchar(500),
	ParentCategoryID int foreign key references Category(ID),
	Available bit not null
)
go

-- Product Table
create table Product
(
	ID int identity(1,1) primary key,
	Code nvarchar(7) not null,
	SubcategoryID int foreign key references Category(ID),
	[Name] nvarchar(200) not null,
	[Image] nvarchar(200),
	thumbnail nvarchar(200),
	Price float not null,
	Author nvarchar(100),
	Manufacturer nvarchar(200),
	Quantity int not null,
	Available bit not null,
	CreatedOn datetime not null,
	[Description] nvarchar(200)	
)
Go

-- Customer Table
create table Customer
(
	ID int identity(1,1) primary key,
	FullName nvarchar(100) not null,
	Email nvarchar(100) not null unique,
	[Password] nvarchar(200) not null,
	IsAdmin Bit not null,
	Available bit not null
)
Go

-- address
create table [Address]
(
	ID int identity(1,1) primary key,
	CustomerID int foreign key references Customer(ID),
	FullName nvarchar(100) not null,
	[Address] nvarchar(200) not null,
	City nvarchar(100) not null,
	Country nvarchar(200) not null,
	Phone nvarchar(50)
)
Go

-- Order Table
 create table [Order]
(
	ID int identity(1,1) primary key,
	CustomerID int foreign key references Customer(ID),
	StatusID int not null,
	CreatedOn smalldatetime not null,
	ShippedDate smalldatetime
)
Go

-- Order_Product Table
create table Order_Product
(
	OrderID int foreign key references [Order](ID),
	ProductID int foreign key references Product(ID),
	Price float not null,
	Quantity int not null,
	primary key (OrderId, ProductId)
)
Go

-- Stor insert order

alter proc InsertOrder @cusId int as
begin
	insert into [Order] values(@cusId,0,getdate(),null)
	select SCOPE_IDENTITY() as id
end

