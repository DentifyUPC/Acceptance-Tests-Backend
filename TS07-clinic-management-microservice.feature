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
