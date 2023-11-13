create database Employee_Management;


create table Employees(
Employee_Id varchar(4) PRIMARY KEY,
firstName varchar(50) not null,
lastName varchar(50) not null,
Adress_Strt varchar(50) not null,
City varchar(20) not null,
Adress_State varchar(20) not null,
ZIP varchar(5) not null,
Cnic varchar(50) not null unique,
DOB date not null,
PhoneNumber varchar(11) not null unique,
Gender varchar(6) not null,
Email varchar(30) not null unique,
Bank_Id varchar(24) not null unique,
logIn_Time time not null,
logOut_Time time not null,
OfficeTime_Start time DEFAULT '17:00:00',
OfficeTime_End time DEFAULT '3:00:00', 
Bonus money
);

--Skills as multivalued variable
create table Skills(
Employee_Id varchar(4),
Skill varchar(20),
FOREIGN KEY (Employee_Id) REFERENCES Employees(Employee_Id)
);

create table Positions(
position_Id int,
position_Name varchar(20) not null,
SalaryAmount money not null,
Employee_Id varchar(4),
FOREIGN KEY (Employee_Id) REFERENCES Employees(Employee_Id),
PRIMARY KEY(position_Id,Employee_Id)
);

create table Application_Form(
Application_Id int,
Application_Type  varchar(15) not null,
Reason varchar(50) not null,
Note  varchar(50) not null,
Apply_Date datetime default getdate() ,
From_Date date,
To_Date date,
No_Application int not null,
Application_Status varchar(10) not null,
Employee_Id varchar(4),
FOREIGN KEY (Employee_Id) REFERENCES Employees(Employee_Id),
PRIMARY KEY(Application_Id,Employee_Id)
);

create table Clients(
Client_Id int PRIMARY KEY,
firstName varchar(15) ,
lastName varchar(15),
Adress_Strt varchar(50),
City varchar(20) not null,
Adress_State varchar(20) not null,
ZIP varchar(5) not null,
CNIC varchar(20) not null,
DOB date,
PhoneNumber varchar(15),
Email varchar(20) not null,
Organization varchar(30),
No_Individuals int,
);

create table Projects(
Project_Id int unique,
Project_Name varchar(30),
Client_Id int,
FOREIGN KEY (Client_Id) REFERENCES Clients(Client_Id),
PRIMARY KEY(Project_Id,Client_Id)
);

create table Project_Details(
Project_Id int, 
Client_Id int,
StartDate datetime default getdate(),
EndDate date,
Cost money,
FOREIGN KEY (Project_Id,Client_Id) REFERENCES Projects(Project_Id,Client_Id),
PRIMARY KEY(Project_Id,Client_Id)
);

create table Employee_Project(
Project_Id int,
Employee_Id varchar(4),
StartDate date default getdate(),
FOREIGN KEY (Project_Id) REFERENCES Projects(Project_Id),
FOREIGN KEY (Employee_Id) REFERENCES Employees(Employee_Id),
PRIMARY KEY (Project_Id,Employee_Id),
);

-- Insert data for Employee 1
INSERT INTO Employees (Employee_Id, firstName, lastName, Adress_Strt, City, Adress_State, ZIP, Cnic, DOB, PhoneNumber, Gender, Email, Bank_Id, logIn_Time, logOut_Time, OfficeTime_Start, OfficeTime_End, Bonus)
VALUES ('E001', 'John', 'Doe', '123 Main St', 'New York', 'NY', '10001', '123-456-789', '1980-01-15', '1234567890', 'Male', 'john.doe@example.com', '123-567-901-345-789-123', '08:00:00', '17:00:00', '17:00:00', '03:00:00', 1000.00);

-- Insert data for Employee 2
INSERT INTO Employees (Employee_Id, firstName, lastName, Adress_Strt, City, Adress_State, ZIP, Cnic, DOB, PhoneNumber, Gender, Email, Bank_Id, logIn_Time, logOut_Time, OfficeTime_Start, OfficeTime_End, Bonus)
VALUES ('E002', 'Jane', 'Smith', '456 Elm St', 'Los Angeles', 'CA', '90001', '0987654321', '1990-05-20', '987-654-321', 'Female', 'jane.smith@example.com', '567-901-345-789-123-567', '09:00:00', '18:00:00', '17:00:00', '03:00:00', 1200.00);

-- Insert data for Employee 3
INSERT INTO Employees (Employee_Id, firstName, lastName, Adress_Strt, City, Adress_State, ZIP, Cnic, DOB, PhoneNumber, Gender, Email, Bank_Id, logIn_Time, logOut_Time, OfficeTime_Start, OfficeTime_End, Bonus)
VALUES ('E003', 'Michael', 'Johnson', '789 Oak St', 'Chicago', 'IL', '60601', '1111222233', '1985-08-10', '555-123-456', 'Male', 'michael.johnson@example.com', '876-432-098-654-210-876', '08:30:00', '17:30:00', '17:00:00', '03:00:00', 1100.00);

-- Insert data for Employee 4
INSERT INTO Employees (Employee_Id, firstName, lastName, Adress_Strt, City, Adress_State, ZIP, Cnic, DOB, PhoneNumber, Gender, Email, Bank_Id, logIn_Time, logOut_Time, OfficeTime_Start, OfficeTime_End, Bonus)
VALUES ('E004', 'Samantha', 'Williams', '234 Birch St', 'Houston', 'TX', '77001', '4444333322', '1995-03-25', '333-555-777', 'Female', 'samantha.williams@example.com', '654-219-865-421-987-654', '08:15:00', '17:15:00', '17:00:00', '03:00:00', 1050.00);

--setting logIn_Time columns to the current time(10:48)
UPDATE Employees
SET logIn_Time = GETDATE()
WHERE Employee_Id = 'E004';

--calculate working hours
SELECT DATEDIFF(HOUR, logOut_Time,logIn_Time) AS HoursDifference,
DATEDIFF(MINUTE, logOut_Time,logIn_Time) - (DATEDIFF(HOUR, logOut_Time,logIn_Time) * 60) AS MinutesDifference
FROM Employees;

--


Select * from Employees;
Select * from Skills;
Select * from Positions;

--to make projectid unique
ALTER Table Projects
ADD CONSTRAINT UQ_Project_Id UNIQUE (Project_Id);