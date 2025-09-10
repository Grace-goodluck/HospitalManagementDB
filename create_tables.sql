create database HospitalDB

Create table Patients (
PatientID int primary key identity(1,1),
FirstName nvarchar(50) not null,
LastName nvarchar (50) not null,
DateOfBirth DATE,
Gender char(1) CHECK (GENDER in ('M','F')),
PhoneNumber nvarchar(20),
Address Nvarchar(255),
CreatedAt DATETIME DEFAULT GETDATE()
)


create table Doctors (
DoctorID int primary key identity(1,1),
FirstName nvarchar(50) not null,
LastName nvarchar(50) not null,
Specialty nvarchar(100),
PhoneNumber nvarchar(20),
CreatedAt DATETIME DEFAULT GETDATE()
)

create table Appointments (
AppointmentID int primary key identity(1,1),
PatientID int FOREIGN KEY REFERENCES Patients(PatientID),
DoctorID int FOREIGN KEY REFERENCES Doctors(DoctorID),
AppointmentDate DATETIME not null,
Status nvarchar(20) DEFAULT 'Scheduled' CHECK (Status IN ('Scheduled','Completed','Cancelled')),
Notes nvarchar(255),
CreatedAt DATETIME DEFAULT GETDATE()
)

create table Treatments (
TreatmentID int primary key identity(1,1),
AppointmentID int FOREIGN KEY REFERENCES Appointments(AppointmentID),
Description nvarchar(255) not null,
Cost DECIMAL(10,2) not null,
)


