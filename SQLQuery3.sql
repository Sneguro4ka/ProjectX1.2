drop table AlcoholProduct;
drop table Login;
drop table sales;
drop table BuyingHistory;
drop table Customer;
drop table CigaresWrapper;
drop table CigaresProducts;
drop table bundles;
drop table bundleInfo;

CREATE TABLE AlcoholProduct(
    [productID]   INT           IDENTITY (1, 1) NOT NULL,
    [CategoryID]  INT           NOT NULL,
    [productName] VARCHAR (50)  NOT NULL,
    [price]       INT           NOT NULL,
    [volume]      INT           NOT NULL,
    [info]        VARCHAR (200) NOT NULL,
    [origin]      VARCHAR (50)  references Country(Name),
    [pic]         IMAGE         NULL,
    PRIMARY KEY CLUSTERED ([productID] ASC),
    FOREIGN KEY ([CategoryID]) REFERENCES AlcoholCategory ([Id])
);

create Table Login
(
	username varchar(20) primary key,
	userPass varchar(20) not null,
	privilege varchar(20) not null
);

create table sales
(
	productID int primary key references Product(productID) on delete cascade on update no action,
	price int not null
);

create table BuyingHistory
(
	productID int,  
	buyingDate varchar(20),
	username varchar(20) references Login(username) on delete cascade on update no action,
	primary key(productID, buyingDate, username)
);

create table Customer
(
	username varchar(20) primary key references Login(username) on delete cascade on update no action,
	custName varchar(20) not null,
	custLastName varchar(20) not null,
	custEmail varchar(20) not null,
	phoneNumber	varchar(20) not null
);
create table CigaresWrapper
(
	wrapperName varchar(50) primary Key,
	color varchar(50) not null
);

create table CigaresProducts
(
	productID INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,
	productName varchar(50) not null,
	price int not null,
	bundle int not null,
	strengh varchar(50) not null,
	origin varchar(50) references Country(Name),
	info varchar(300) not null,
	wrapperType varchar(50) references CigaresWrapper(wrapperName) on delete cascade,
	pic image 
);

create table Accessories
(
	productID INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,
	productName varchar(50) not null,
	price int not null,
	info varchar(300) not null,
	pic image,
	type varchar(50) not null
);

create table Bundles
(
	bundleId INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,
	bundleName varchar(50) not null,
	price int not null
);

create Table BundleInfo
(
	bundleId int references bundles(bundleId),
	productId int
);