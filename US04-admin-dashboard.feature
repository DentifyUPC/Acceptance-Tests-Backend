Feature: Admin Dashboard Metrics (US04)
  As an administrator
  I want to see a summary of important data
  So that I can make quick strategic decisions

  Background:
    Given the administrator "AdminUser" logs into the system

  Scenario: Visualizing monthly income chart
    Given the total income for the current month is "5000.00" USD
    When the administrator accesses the main dashboard
    Then the system displays a "Monthly Income" chart
    And the chart reflects the total amount of "5000.00"

  Scenario: Viewing appointment statistics
    Given there are "20" confirmed appointments and "5" pending appointments today
    When the dashboard loads
    Then the "Appointments" widget displays the count broken down by status
    And the widget highlights urgent pending appointments

  Scenario: Low stock alert on dashboard
    Given the inventory item "Anesthesia" has a quantity of "2"
    And the minimum required stock is "5"
    When the administrator refreshes the dashboard
    Then the "Alerts" section displays a warning: "Low stock: Anesthesia"