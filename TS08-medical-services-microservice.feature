Feature: Medical Services Microservice
  As a developer configuring the platform
  I want a microservice that manages the clinic’s offered services
  So that treatments and their associated supplies are properly controlled

  Scenario: Register medical service
    Given the endpoint POST /api/v2/services exists
    When a valid request is sent (service name, required supplies, price)
    Then the system saves the service and returns 201 Created

  Scenario: Retrieve available services
    Given the endpoint GET /api/v2/services exists
    When the endpoint is queried
    Then the system returns 200 OK with the list of services (name, price, supplies)

  Scenario: Validate service against regulated catalog
    Given the endpoint GET /api/v2/catalog/treatments exists
    When the admin tries to register a new service
    Then the system validates its existence in the catalog and returns 400 Bad Request if invalid
