🏥 Hospital Management Database (SQL Server)

This project is a hospital management system prototype built in SQL Server to simulate real-world healthcare operations.
It demonstrates solid database design, SQL stored procedures, and data manipulation techniques that recruiters can easily review and run.

📋 Features
	•	Patients, Doctors & Appointments Tables with relationships
	•	Stored Procedures to handle:
	•	Add new patient
	•	Book an appointment
	•	Update appointment status
	•	Cancel appointment
	•	Retrieve patient history
	•	View doctor schedule
	•	Get upcoming appointments (next 7 days)
	•	Sample Data included for quick testing
	•	Test Scripts to run and see results immediately

🛠 Database Objects
Object Type
Name
Purpose
Tables
Patients, Doctors, Appointments
Core entities of the system
Stored Procedures
AddPatient, BookAppointment, UpdateAppointmentStatus, CancelAppointment, GetPatientHistory, GetDoctorSchedule, GetUpcomingAppointments
Automate core business logic

🧪 Test Scripts

The repository includes a TestScripts.sql file to help recruiters quickly execute all stored procedures and view results.

Script demonstrates:
	•	Adding a new patient
	•	Booking a new appointment
	•	Updating appointment status
	•	Cancelling an appointment
	•	Viewing patient history
	•	Viewing a doctor’s schedule
	•	Getting upcoming appointments for the next 7 days

⚠ Important:
Please adjust PatientID, DoctorID, and AppointmentID values in the test script to match data in your database.
Example:
	•	If there is no PatientID = 1, run AddPatient first and use the returned ID.
	•	Same applies for DoctorID and AppointmentID.


🧾 Notes / Known Issues
	•	During development, a typo was found in an earlier draft: ProductsID was mistakenly used instead of ProductID.
This has been corrected in the final version of this repository.
	•	If you run into “Invalid column name” errors, double-check that your table columns match those referenced in the stored procedures (for example, FirstName + LastName in Doctors).

 🎯 Purpose

This project was designed as a portfolio piece to:
	•	Showcase SQL Server expertise
	•	Demonstrate real-world problem solving
	•	Provide a recruiter-friendly way to test functionality
