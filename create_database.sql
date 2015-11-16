# create database info605;
 
use info605;
/*
# MAMP Notes
# /Applications/MAMP/Library/bin/mysql -uroot -p
# password is root

# MYSQL on Work MAC
# sudo /Library/StartupItems/MySQLCOM/MySQLCOM start 
#  Temporary Password q2a)xog,Xw)d
 
# These commands will delete the tables if needed, because I am rebuilding
*/
/*
drop database info605

drop table WebsiteMembers;
drop table Vendor;
drop table Customer;
drop table DailyLockerRental;
drop table Instructor;
drop table Lesson;
drop table Rental;
drop table RentalHelper;
drop table Vendor;

show tables;

show table status;
select * from Vendor;

*/
# describe Vendor;

# Create a table for website members
# This wasn't part of our design, but maybe useful if I get time to implement it 
# for the website
create table WebsiteMembers
(
    id bigint not null auto_increment primary key,
    first_name varchar(40),
    last_name varchar(40),
    email_address varchar(40),
    phone_number varchar(20),
     
    username varchar(40),
    userpass varchar(40),
     
    notes text
);
 
# Vendor table
create table Vendors
(
    VendorID int not null primary key,
    VendorName varchar(40),
    Street varchar(40),
    City varchar(40),
    AddressState varchar(2),
    Zip int,
    Phone varchar(12),
    Email varchar(60)
);
insert into Vendors (VendorID, VendorName, Street, City, AddressState, Zip, Phone, Email) 
Values(1, 'Ski Supply House', '1 Market Place NE', 'Redmond', 'WA', 98052, '425-505-1212', 'sales@skisupply.com');
insert into Vendors (VendorID, VendorName, Street, City, AddressState, Zip, Phone, Email) 
Values(2, 'Ski Central Supplies', '1 Market Place NE', 'Redmond', 'WA', 98052, '425-505-1212', 'sales@skicentral.com');
insert into Vendors (VendorID, VendorName, Street, City, AddressState, Zip, Phone, Email) 
Values(3, 'Home Depot', '1 Market Place NE', 'Redmond', 'WA', 98052, '425-505-1212', 'sales@homedepot.com');
insert into Vendors (VendorID, VendorName, Street, City, AddressState, Zip, Phone, Email) 
Values(4, 'Lowes', '1 Market Place NE', 'Redmond', 'WA', 98052, '425-505-1212', 'sales@lowes.com');
insert into Vendors (VendorID, VendorName, Street, City, AddressState, Zip, Phone, Email) 
Values(5, 'Ace Hardware', '1 Ace Street', 'Asheville', 'NC', 54321, '425-505-1212', 'sales@acehardware.com');
# Item table
create table Item
(
    ItemID int not null primary key,
    ItemType varchar(20),
    Brand varchar(20),
    Sex varchar(1),
    ItemSize decimal(4,2),
    Quantity int,
    Cost float,
    DatePurchased date,
    PlacedInService date,
    ItemCondition varchar(40),
    ReplacementCost float,
    DisposalDate date
);

# Rental table
create table Rentals
(
    RentalID int not null primary key,
    PackageType varchar(5),
    Rate float
);
insert into Rentals (RentalID, PackageType, Rate) Values(1, 'daily', 10);
insert into Rentals (RentalID, PackageType, Rate) Values(2, 'weekly', 100);
insert into Rentals (RentalID, PackageType, Rate) Values(3, 'combo', 200);
insert into Rentals (RentalID, PackageType, Rate) Values(4, 'combo', 200);
insert into Rentals (RentalID, PackageType, Rate) Values(5, 'weekly', 100);
insert into Rentals (RentalID, PackageType, Rate) Values(6, 'daily', 10);

# Rental Helper table
create table RentalHelper
(
    RentalID int not null primary key,
    StartDate date,
    EndDate date
);
Insert into RentalHelper (RentalID, StartDate, EndDate) Values(1, CURDATE()-1, CURDATE());
Insert into RentalHelper (RentalID, StartDate, EndDate) Values(2, CURDATE()-100, CURDATE()-93);
Insert into RentalHelper (RentalID, StartDate, EndDate) Values(3, '2008-7-04', '2008-7-11');
Insert into RentalHelper (RentalID, StartDate, EndDate) Values(4, '2009-8-04', '2009-8-11');
Insert into RentalHelper (RentalID, StartDate, EndDate) Values(5, '2010-9-04', '2010-9-11');
Insert into RentalHelper (RentalID, StartDate, EndDate) Values(6, '2011-10-04', '2011-10-11');

# Customer table 
create table Customers
(
    CustomerID int not null primary key,
    FirstName varchar(40),
    LastName varchar(40),
    MiddleInitial varchar(1),
    Id int,
    Phone varchar(12),
    Email varchar(60),
    ApartmentNumber varchar(10),
    Street varchar(40),
    City varchar(40),
    AddressState varchar(2),
    Zip int
);
insert into Customers (CustomerID, FirstName, LastName, MiddleInitial, Id, Phone, Email, ApartmentNumber, Street, City, AddressState, Zip) 
Values(1, 'David', 'Whipple', 'A', 5, '425-505-7875', 'dwhipple99@hotmail.com', NULL, '1007 23rd Place NE', 'Sammamish', 'WA', 98074);
insert into Customers (CustomerID, FirstName, LastName, MiddleInitial, Id, Phone, Email, ApartmentNumber, Street, City, AddressState, Zip) 
Values(2, 'Xinyi', 'Wang', 'A', 10, '425-505-7875', 'p.xywang@gmail.com', NULL, '72 2nd Street', 'Philadelphia', 'PA', 16371);
insert into Customers (CustomerID, FirstName, LastName, MiddleInitial, Id, Phone, Email, ApartmentNumber, Street, City, AddressState, Zip) 
Values(3, 'Stuart', 'Klein', 'A', 15, '425-505-7875', 'sklein@amerihealthcaritas.com', NULL, '19324 7th Ave', 'Philadelphia', 'PA', 16365);
# Daily Locker Rental table
create table DailyLockerRental
(
    RentalID int not null primary key,
    Rate float,
    PurchasedDate date
);
Insert into DailyLockerRental (RentalID, Rate, PurchasedDate) Values(1, 12.50, CURDATE());
Insert into DailyLockerRental (RentalID, Rate, PurchasedDate) Values(2, 15.00, CURDATE()-1);
Insert into DailyLockerRental (RentalID, Rate, PurchasedDate) Values(3, 10.50, CURDATE()-2);
Insert into DailyLockerRental (RentalID, Rate, PurchasedDate) Values(4, 12.50, CURDATE()-3);

# Lesson table 
create table Lessons
(
    LessonID int not null primary key,
    LessonType varchar(40),
    Duration int,
    StartDate date,
    Rate float,
    PurchasedDate date
);
Insert into Lessons (LessonID, LessonType, Duration, StartDate, Rate, PurchasedDate) Values(1, 'Ski', 30, CURDATE(), 10.00, CURDATE()-1);
Insert into Lessons (LessonID, LessonType, Duration, StartDate, Rate, PurchasedDate) Values(2, 'Swim', 60, CURDATE(), 15.00, CURDATE()-1);
Insert into Lessons (LessonID, LessonType, Duration, StartDate, Rate, PurchasedDate) Values(3, 'Expert Ski', 30, CURDATE(), 10.00, CURDATE()-1);
Insert into Lessons (LessonID, LessonType, Duration, StartDate, Rate, PurchasedDate) Values(4, 'Beginner', 90, CURDATE(), 15.00, CURDATE()-1);
Insert into Lessons (LessonID, LessonType, Duration, StartDate, Rate, PurchasedDate) Values(5, 'Double Black Diamond Killer Hills', 60, CURDATE(), 20.00, CURDATE()-1);

#Instructor table
create table Instructors
(
    InstructorID int not null primary key,
    FirstName varchar(40),
    LastName varchar(40),
    Phone varchar(12),
    Email varchar(60)
);
insert into Instructors (InstructorID, FirstName, LastName, Phone, Email) Values(1, 'David', 'Whipple', '425-505-7875', 'dwhipple99@hotmail.com');
insert into Instructors (InstructorID, FirstName, LastName, Phone, Email) Values(2, 'Stuart', 'Klein', '425-505-7875', 'sklein@amerihealthcaritas.com');
insert into Instructors (InstructorID, FirstName, LastName, Phone, Email) Values(3, 'Xinyi', 'Wang', '425-505-7875', 'p.xywang@gmail.com');


#insert into website_members
#(
#    first_name, last_name, email_address, phone_number,
#    username, userpass, notes
#)
#values
#(
#    'Zach', 'No Last Name', 'zach@antispammer.com', '518-555-5555',
#    'mindgrader', 'thisismylongpass', 'N/A'
#);
 
#select * from website_members;
