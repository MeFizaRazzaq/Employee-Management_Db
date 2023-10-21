create database AllMedSolutions;
/* Employees Table*/
create table Employees(
EmployeeID varchar(10) not null primary key,
FirstName varchar(255) not null,
LastName  varchar(255) not null,
DateOfJoining date not null,
CNICNumber varchar(20) not null unique,
DOB date not null,
PhoneNumber varchar(20) not null unique,
Gender varchar(10) not null,
BankID varchar(20) not null unique
);

/* Working Time Table*/

create table WorkingTime(
Login_Time time not null,
Logout_Time time not null,
OfficeTime_Start time not null,
OfficeTime_End time not null
);

/* Position Table*/

 create table Postion(
 PositionID varchar(10) not null primary key,
 PostionName varchar(255) not null,
 BaseSalary int not null,
 Bonus int,
 EmployeeID varchar(10),
 constraint FK_EmployeePosition foreign key (EmployeeID) references Employees(EmployeeID)
 );

 /*Application/Request Form*/

 create table ApplicationRequest_form(
 ApplicationID varchar(10) not null primary key,
 Application_Name varchar(255) not null,
 Reason varchar(1000) not null,
 Note text,
 Application_Date date not null,
 FromDate date,
 ToDate date,
 NumberOfApplications int not null,
 EmployeeID varchar(10),
 constraint FK_EmployeeApplicationForm foreign key (EmployeeID) references Employees(EmployeeID)
 );

 /* Application Status Table */

 create table ApplicationStatus(
 StatusID varchar(10) not null primary key,
 IsAccepted bit,
 IsDenied bit,
 IsUnderReview bit,
 ApplicationID varchar(10),
 constraint FK_EmployeeApplicationStatus foreign key (ApplicationID) references ApplicationRequest_form(ApplicationID)
 );


 /* Projects Table*/

 create table Projects(
 ProjectID varchar(10) not null primary key,
 ProjectName varchar(255) not null,
 ClientID varchar(10) not null,
 FromDate date not null,
 ToDate date not null,
 Payments float not null
 );

 /* Project Assignment Table */

 create table ProjectAssignment(
 Deadline date not null,
 EmployeeID varchar(10),
 ProjectID varchar(10),
 ClientID varchar(10)
 );