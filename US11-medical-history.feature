Feature: Patient Medical History Visualization
  As an administrator
  I want to view a patient’s medical history
  So that I can supervise clinical information

  Scenario: Administrator visualizes patient medical history
    Given the endpoint GET /api/v2/patients/{id}/history exists
    And the patient has registered clinical entries
    When the administrator requests the medical history
    Then the system returns 200 OK with all clinical entries sorted by date
