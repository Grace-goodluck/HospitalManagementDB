--Add a new patient
exec AddPatient
@FirstName = 'John',
@LastName = 'Doe',
@DateOfBirth = '1985-07-15',
@PhoneNumber = '08012345678',
@Address = '19 Norman william way'
GO

--Book an appointment
DECLARE @NewAppointmentID int

exec @NewAppointmentID = BookAppointment
@PatientID = 1,
@DoctorID = 1,
@AppointmentDate = '2025-09-10 10:00',
@Notes = 'Routine Checkups'

Print 'new Appointment ID: ' +CAST(@NewAppointmentID AS nvarchar)
go

--Update appoint status
exec UpdateAppointmentStatus
@AppointmentID =1,
@NewStatus = 'Completed'
GO

--Cancel appointment
exec CancelAppointment
@AppointmentID = 1
go

--Get Patient History
exec GetPatientHistory
@patientID = 1
go

--Get Doctor schedule for a day
exec GetDoctorSchedule
@DoctorID = 1,
@ScheduleDate = '2025-09-01'
go

--Get upcoming Appointments (next 7 days)
exec GetUpcomingAppointments
go


