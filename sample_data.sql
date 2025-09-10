insert into Patients (FirstName, LastName, DateOfBirth, Gender, PhoneNumber, Address)
values
('John', 'Doe', '1985-03-15', 'M', '08012345678', '123 Main Street'),
('Jane', 'Smith', '1990-07-22', 'F', '08087654321', '45 Kingsway Road'),
('Michael', 'Brown', '1978-11-05', 'M', '08123456789', '56 Queens Avenue')


insert into Doctors (FirstName, LastName, Specialty, PhoneNumber)
values
('Sarah', 'Johnson', 'Cardiology', '08011112222'),
('David', 'Williams', 'Pediatrics', '08033334444'),
('Emily', 'Taylor', 'Dermatology', '08055556666')

insert into Appointments (PatientID, DoctorID, AppointmentDate, Status, Notes)
values
(1, 1, '2025-09-10 10:00', 'Scheduled', 'Routine checkup'),
(2, 2, '2025-09-11 14:30', 'Scheduled', 'Fever consultation'),
(3, 3, '2025-09-12 09:00', 'Scheduled', 'Skinrash consultation')

insert into Treatments (AppointmentID, Description, Cost)
values
(1, 'General Check-ups', 5000.00),
(2, 'Fever Medication', 3500.00)



