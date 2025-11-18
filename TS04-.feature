Feature: Appointment Microservice
  As a developer configuring the platform
  I want a microservice that manages patient appointments
  So that appointment scheduling and management are efficient

  Scenario: Schedule appointment
    Given the endpoint POST /api/v2/appointments exists
    And the patient is authenticated and selects dentist, service, date, and time
    And the Schedule API confirms availability
    When the patient submits the appointment request
    Then the system creates the appointment, returns 201 Created, and triggers a pending payment creation

  Scenario: Confirm appointment after payment
    Given a pending payment exists for an appointment
    When the payment is confirmed by the Payments service
    Then the appointment status changes to confirmed and notifications are sent

  Scenario: List all appointments
    Given the endpoint GET /api/v2/appointments is available for admin or clinic
    When it is queried
    Then the system returns 200 OK with all appointments, filterable by date, dentist, patient, or status

  Scenario: Retrieve appointments by dentist
    Given the endpoint GET /api/v2/appointments?odontologistId={id} exists
    When the dentist requests their assigned appointments
    Then the system returns 200 OK with their appointments

  Scenario: Cancel or reschedule appointment
    Given the endpoint PUT /api/v2/appointments/{id} exists
    When the user requests a change or cancellation within policy
    Then the system validates rules and updates the status, invoking Payments if needed

Scenario: Fail to schedule appointment due to overlapping
    Given the endpoint POST /api/v1/appointment is available
    And an appointment for odontologist "5" exists on "2025-11-20" from "10:00" to "11:00"
    When a patient tries to schedule an appointment with odontologist "5" on "2025-11-20" at "10:30"
    Then the system rejects the request
    And responds with 409 Conflict and a message "Schedule overlap detected"

  Scenario: Fail to schedule appointment in a past date
    Given the endpoint POST /api/v1/appointment is available
    When a patient tries to schedule an appointment for "2024-01-10"
    Then the system rejects the request
    And responds with 400 Bad Request and a message "Cannot schedule appointments in the past"