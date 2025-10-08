Feature: Payments Microservice
  As a developer configuring the platform
  I want a microservice that manages payments
  So that financial operations of the clinic are recorded and automated

  Scenario: Retrieve all payments
    Given the endpoint GET /api/v2/payments is available
    When the request is sent
    Then the system returns 200 OK with the list of payments

  Scenario: Retrieve payments by patient
    Given the endpoint GET /api/v2/payments?patientId={id} is available
    When a valid patient ID is sent
    Then the system returns 200 OK with that patient’s payments

  Scenario: Auto-create payment on appointment scheduling
    Given an appointment is confirmed
    When the appointment is registered successfully
    Then the system generates an associated payment with “pending” status

  Scenario: Update payment status
    Given the endpoint PUT /api/v2/payments/{id}/status is available
    When payment confirmation is received
    Then the system updates the status to “paid” and returns 200 OK
