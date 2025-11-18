Feature: Clinic Management Microservice
  As a developer configuring the platform
  I want a microservice that centralizes clinic management
  So that administrative operations can be efficiently managed

  Scenario: Register dentist account
    Given the endpoint POST /api/v2/admin/odontologists is available
    When a valid request is sent (name, email, license, specialization, credentials)
    Then the system creates the dentist account and returns 201 Created

  Scenario: Assign dentist schedule
    Given the endpoint POST /api/v2/admin/odontologists/{id}/schedules is available
    When a valid request is sent respecting the 8-hour limit
    Then the system registers the schedule and returns 201 Created

  Scenario: Register inventory item (admin)
    Given the endpoint POST /api/v2/admin/inventory exists
    When a valid request is sent (name, presentation, cost, stock)
    Then the system saves the item and returns 201 Created

  Scenario: View admin dashboard
    Given the endpoint GET /api/v2/dashboard/admin/{id} exists
    When a valid admin ID is sent
    Then the system returns 200 OK with metrics of weekly expenses, income, stock, and alerts

Scenario: Administrator creates a new work shift for the clinic
    Given the endpoint POST /api/v1/shift is available
    When an administrator sends a request to create a "Afternoon" shift from "14:00" to "20:00" for clinic "1"
    Then the system registers the new shift
    And responds with 201 Created and the shift data

  Scenario: Administrator assigns a general schedule for the clinic
    Given the endpoint POST /api/v1/schedule-per-clinic is available
    When an administrator sends a request to register the schedule for "Monday" from "08:00" to "20:00" for clinic "1"
    Then the system registers the clinic schedule
    And responds with 201 Created

  Scenario: Administrator retrieves all shifts for their clinic
    Given the endpoint GET /api/v1/shift/1 is available
    When an administrator requests all shifts for clinic "1"
    Then the system returns 200 OK and the list of shifts