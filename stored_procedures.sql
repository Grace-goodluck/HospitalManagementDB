IF OBJECT_ID('BookAppointment', 'p') IS NOT NULL
Drop procedure BookAppointment
GO

Create Procedure BookAppointment
@PatientID int,
@DoctorID int,
@AppointmentDate DATETIME,
@Notes nvarchar(255) = null
as
BEGIN
set nocount on

insert into Appointments (PatientID, DoctorID, AppointmentDate, Status, Notes)
values (@PatientID, @DoctorID, @AppointmentDate, 'Scheduled', @Notes)

select SCOPE_IDENTITY() as NewAppointmentID
END
GO



create procedure UpdateAppointmentStatus
@AppointmentID int,
@NewStatus nvarchar(50)
as
BEGIN
set NOCOUNT on

update Appointments
set Status = @NewStatus
where @AppointmentID = @AppointmentID

select 'Appointment status updated successfully' AS Message
end
GO


create procedure GetPatientHistory
@PatientID int
as
BEGIN
set nocount on

select a.AppointmentID,
       a.AppointmentDate, 
	   a.Status, 
	   a.Notes,
      d.FirstName +''+ d.LastName AS DoctorName, 
	  d.Specialty as Specialization
from Appointments a
inner join Doctors d ON a.DoctorID = d.DoctorID
where a.PatientID = @PatientID
order by a.AppointmentDate DESC
end
GO


create procedure CancelAppointment
@AppointmentID int
AS
BEGIN
SET nocount on

Update Appointments 
set Status = 'Cancelled'
where @AppointmentID = @AppointmentID

select 'Appointment cancelled successfully' AS Message
end
go


create procedure GetDoctorSchedule
@DoctorID INT,
@ScheduleDate DATE
AS BEGIN
SET NOCOUNT ON

SELECT
a.AppointmentID,
a.AppointmentDate,
a.Status,
p.FirstName +''+ p.LastName as PatientName,
a.Notes
from Appointments a
inner join Patients p on a.PatientID = p.PatientID
where a.DoctorID = @DoctorID
and cast(a.AppointmentDate as DATE) = @ScheduleDate
Order by a.AppointmentDate
END
GO


create procedure AddPatient
@FirstName nvarchar(50),
@LastName nvarchar(50),
@DateOfBirth DATE,
@PhoneNumber nvarchar(20)  = null,
@Address Nvarchar(255)
AS
BEGIN
SET NOCOUNT ON

INSERT INTO Patients (FirstName, LastName, DateOfBirth, PhoneNumber, Address)
values (@FirstName, @LastName, @DateOfBirth, @PhoneNumber, @Address)

select SCOPE_IDENTITY() as NewPatientID
end
go



IF OBJECT_ID('GetUpcomingAppointments', 'P') IS NOT NULL
    DROP PROCEDURE GetUpcomingAppointments;
GO

CREATE PROCEDURE GetUpcomingAppointments
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        a.AppointmentID,
        a.AppointmentDate,
        a.Status,
        p.FirstName + ' ' + p.LastName AS PatientName,
        d.FirstName + ' ' + d.LastName AS DoctorName
    FROM Appointments a
    INNER JOIN Patients p ON a.PatientID = p.PatientID
    INNER JOIN Doctors d ON a.DoctorID = d.DoctorID
    WHERE a.AppointmentDate >= GETDATE()
      AND a.AppointmentDate < DATEADD(DAY, 7, GETDATE())
    ORDER BY a.AppointmentDate;
END;
GO
