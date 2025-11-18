Feature: Dentist Schedule Visualization
  As a dentist
  I want to view my assigned schedule
  So that I can know my weekly working hours

  Scenario: Dentist reviews assigned schedule
    Given the endpoint GET /api/v2/schedules/dentist/{id} exists
    When the dentist requests their weekly schedule
    Then the system returns 200 OK with all assigned time blocks
