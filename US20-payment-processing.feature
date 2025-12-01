Feature: Payment Processing (US20)
  As a patient
  I want to pay for my appointment online
  So that I can secure my reservation immediately

  Background:
    Given the patient "Juan Perez" is logged into the system
    And has a scheduled appointment with ID "APPT-101"
    And the appointment status is "PENDING_PAYMENT"

  Scenario: Successful payment via PayPal
    Given the cost of the service is "150.00" USD
    When the patient selects "Pay with PayPal"
    And completes the transaction successfully on the payment gateway
    Then the Payment Service records the transaction as "COMPLETED"
    And the Appointment Service updates the appointment status to "CONFIRMED"
    And the system displays a "Payment Successful" message

  Scenario: Payment rejected by gateway due to insufficient funds
    Given the cost of the service is "150.00" USD
    When the patient initiates the payment process
    And the payment gateway returns a "INSUFFICIENT_FUNDS" error code
    Then the system displays an error message "Payment declined, please check your balance"
    And the appointment status remains "PENDING_PAYMENT"