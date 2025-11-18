Feature: Reserved Appointments Visualization
  As a dentist
  I want to view my reserved appointments
  So that I can prepare for each consultation

  Scenario: Dentist visualizes reserved appointments
    Given the endpoint GET /api/v2/appointments/dentist/{id} exists
    And the dentist is logged into the dashboard
    When the dentist queries their reserved appointments
    Then the system returns 200 OK with a list including date, hour, patient info and service
