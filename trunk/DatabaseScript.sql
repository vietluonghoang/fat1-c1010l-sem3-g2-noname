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

-- Proc insert order

create proc InsertOrder @cusId int as
begin
	insert into [Order] values(@cusId,0,getdate(),null)
	select SCOPE_IDENTITY() as id
end
go

-- Proc insert Customer

create proc InsertCus 
	@FullName nvarchar(100),
	@Email nvarchar(100),
	@Password nvarchar(200),
	@Address nvarchar(200),
	@City nvarchar(100),
	@Country nvarchar(200),
	@Phone nvarchar(50) as
begin
	insert into Customer values(@FullName, @Email, @Password, 0, 1)
	insert into Address values(SCOPE_IDENTITY(), @FullName, @Address, @City, @Country, @Phone)
end
go

-- Proc get order

create proc ViewOrder @orderId int as
begin
	select [Order].*, sum(Order_Product.Quantity) as total from [Order],Order_Product where [Order].ID = Order_Product.OrderID and Order_Product.orderID = @orderId group by Order_Product.orderID,[Order].ID,[Order].CustomerID,[Order].StatusID,[Order].CreatedOn,[Order].ShippedDate
end
go

-- Proc statistic

create proc Statistic as
begin
	select Category.Name, sum(Order_product.Quantity) as Total, sum(Order_product.Price*Order_Product.Quantity) as TotalPrice  from Product, Category, Order_product where Order_Product.ProductID = Product.ID and Product.SubcategoryID = Category.ID  group by Category.Name
end
go

-- Proc statistic by date

create proc StatisticByDate @sDate datetime, @eDate datetime as
begin
	select Product.Code, sum(Order_product.Quantity) as Total, sum(Order_product.Price*Order_Product.Quantity) as TotalPrice  from Product, Order_product, [Order] where Order_Product.ProductID = Product.ID and Order_Product.OrderId = [Order].ID and [Order].CreatedOn between @sDate and @eDate group by Product.Code
end
go

-- proc statistic by category

create proc StatisticByCat @catID int as
begin
	select Product.Code, sum(Order_product.Quantity) as Total, sum(Order_product.Price*Order_Product.Quantity) as TotalPrice  from Product, Order_product, [Order] where Order_Product.ProductID = Product.ID and Order_Product.OrderId = [Order].ID and Product.SubcategoryID = @catID group by Product.Code
end
go

select 
	[Order].ID, Customer.Email,
	[Order].StatusID, [Order].CreatedOn, Address.City,
	sum(Order_Product.Price * Order_Product.Quantity) as TotalPrice
from 
	[Order], Order_Product, Customer, Address 
where 
	Customer.ID = Address.CustomerID and
	[Order].ID = Order_Product.OrderID and
	[Order].CustomerID = Customer.ID
group by 
	[Order].ID, Customer.Email, [Order].StatusID, [Order].CreatedOn, Address.City
