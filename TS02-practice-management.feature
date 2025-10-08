Feature: Practice Management Microservice
  As a developer configuring the architecture
  I want a microservice to manage schedules and personal data
  So that practice management is efficient and reliable

  Scenario: Retrieve personal calendar
    Given the endpoint GET /api/v2/odontologists/{id}/calendar is available and the dentist is authenticated
    When the dentist requests their weekly calendar
    Then the system returns 200 OK with slots, appointments, and personal blocks

  Scenario: Retrieve today's appointments
    Given the endpoint GET /api/v2/odontologists/{id}/appointments/today exists
    When the dentist checks their daily appointments
    Then the system returns 200 OK with appointment details (time, patientId, service, payment status, appointment status)

  Scenario: Update own profile
    Given the endpoint PUT /api/v2/odontologists/{id}/profile is available and the dentist is authenticated
    When the dentist sends valid data (phone, photo, bio, specialty)
    Then the system updates the profile and returns 200 OK

  Scenario: Set personal availability
    Given the endpoint POST /api/v2/odontologists/{id}/availability is available
    When the dentist registers an exception (vacation, blocked hours)
    Then the system saves the exception and returns 201 Created

  Scenario: Register schedule
    Given the endpoint POST /api/v2/schedules is available
    When a valid request is sent
    Then the system saves the schedule and returns 201 Created

  Scenario: Retrieve schedules by dentist
    Given the endpoint GET /api/v2/schedules?odontologistId={id} exists
    When a valid ID is sent
    Then the system returns 200 OK with the registered schedules

  Scenario: Validate maximum working hours
    Given the endpoint POST /api/v2/schedules is available
    When a schedule longer than 6 hours is submitted
    Then the system rejects the request with 400 Bad Request and an error message

  Scenario: Prevent overlapping schedules
    Given the endpoint POST /api/v2/schedules is available
    When a schedule overlaps with an existing one
    Then the system rejects the request with 409 Conflict and a conflict message

  Scenario: Delete schedule
    Given the endpoint DELETE /api/v2/schedules/{id} is available
    When a valid ID is sent
    Then the system deletes the schedule and returns 204 No Content
