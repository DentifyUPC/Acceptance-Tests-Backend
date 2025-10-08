Feature: Inventory Microservice
  As a developer configuring the platform
  I want a microservice that manages the clinic's inventory
  So that medical supplies are efficiently tracked and controlled

  Scenario: Register inventory item
    Given the endpoint POST /api/v2/inventory exists
    When the admin sends valid data (name, presentation, unit cost, initial stock, minimum stock)
    Then the system creates the item and returns 201 Created

  Scenario: Retrieve inventory list
    Given the endpoint GET /api/v2/inventory is available
    When the admin queries it
    Then the system returns 200 OK with items and stock

  Scenario: Update inventory item
    Given the endpoint PUT /api/v2/inventory/{id} exists
    When valid changes are sent
    Then the system updates the item and returns 200 OK

  Scenario: Automatic consumption after service
    Given an appointment is marked as completed and linked to a service requiring materials
    When the appointment is closed
    Then the system deducts stock and generates an alert if below minimum

  Scenario: Low stock alerts
    Given an item’s stock falls below the minimum
    When detected
    Then the system emits an alert event and reports it in the dashboard
