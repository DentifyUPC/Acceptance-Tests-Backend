Feature: Invoice Management (US06)
  As an administrator
  I want to view generated invoices
  So that I can keep track of the clinic's income

  Background:
    Given the administrator is logged into the administrative panel

  Scenario: Admin views payment history
    Given there are 3 completed transactions in the system
    When the administrator navigates to the "Finance" section
    Then the system displays a list of all transactions
    And the list includes details like "Patient Name", "Amount", "Date", and "Status"

  Scenario: Automatic invoice generation after payment
    Given a patient has just completed a payment for appointment "APPT-102"
    When the system confirms the transaction is successful
    Then a new invoice is generated with a unique invoice ID
    And the invoice status is set to "PAID"
    And the invoice is available for download in the patient's profile