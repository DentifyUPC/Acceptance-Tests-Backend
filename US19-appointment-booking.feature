Feature: Appointment Booking
  As a patient
  I want to book an appointment
  So that I can choose date, time and specialized dentist

  Scenario: Patient books an appointment
    Given the endpoint POST /api/v2/appointments exists
    When the patient sends valid appointment data (date, time, service, dentistId)
    Then the system creates the appointment and returns 201 Created
